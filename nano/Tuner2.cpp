#ifndef __TUNER_H__
#define __TUNER_H__

const unsigned char CMD_RESET  = 0;
const unsigned char CMD_TUNE   = 1;
const unsigned char CMD_AUTO   = 2;
const unsigned char CMD_BYPASS = 3;
const unsigned char NUM_CMDS   = 4;

const int CMD_RESET_PIN;
const int CMD_TUNE_PIN;
const int CMD_AUTO_PIN;
const int CMD_BYPASS_PIN;

const int CMD_RESET_MS  = 100;
const int CMD_TUNE_MS   = 350;
const int CMD_AUTO_MS   = 100;
const int CMD_BYPASS_MS = 100;

char CMD_RESET_RESPONSE[]      = "R;";
char CMD_TUNE_RESPONSE[]       = "T;";
char CMD_AUTO_ON_RESPONSE[]    = "A1;";
char CMD_AUTO_OFF_RESPONSE[]   = "A0;";
char CMD_BYPASS_ON_RESPONSE[]  = "B1;";
char CMD_BYPASS_OFF_RESPONSE[] = "B0;";

#define CMD_FLAG(x) (1<<(x))

class TunerControl {
  public:
  
  int process_cmd(const char* cmd) {
    int rv = 0;
    int len = strlen(cmd);
  
    if (len < 1) {
      rv = -1;
      return rv;
    }
  
    switch(cmd[0]) {
      case 'S': // SWR request
      if (len > 1) rv = -1;
      else response_ = swr_;
      break;
      
      case 'P': // power request
      if (len != 2) rv = -1;
      else {
        if (cmd[1] == 'T') response_ = pwr_;
        else if (cmd[1] == 'A') response_ = ant_;
        else rv = -1;
      }
      break;
      
      case 'L': // inductance request
      if (len > 1) rv = -1;
      else response_ = ind_;
      break;
      
      case 'C': // capacitance request
      if (len > 1) rv = -1;
      else response_ = cap_;
      break;
    
      case 'E': // efficiency request
      if (len > 1) rv = -1;
      else response_ = eff_;
      break;
      
      case 'T': // tune command
      if (len != 2) rv = -1;
      else cmd_tune();
      break;
      
      case 'R': // reset command
      if (len > 1) rv = -1;
      else cmd_reset();
      break;
      
      case 'A': // auto on/off
      if (len != 2) rv = -1;
      else {
        if (cmd[1] == '0') cmd_auto_off();
        else if (cmd[1] == '1') cmd_auto_on();
        else rv = -1;
      }
      break;
      
      case 'B': // bypass on/off
      if (len != 2) rv = -1;
      else {
        if (cmd[1] == '0') cmd_bypass_off();
        else if (cmd[1] == '1') cmd_bypass_on();
        else rv = -1;
      }
    }
    
    if (rv != -1) {
      rv = strlen(response_);
    }
    
    return rv;
  }

  const char* cmd_response() {
    return (const char*)response_;
  }
  
  void cmd_tune() {
    digitalWrite(CMD_TUNE_PIN, LOW);
    cmd_flags_ |= CMD_FLAG(CMD_TUNE);
    cmd_timers_[CMD_TUNE] = CMD_TUNE_MS;
    response_ = (char*)CMD_TUNE_RESPONSE;
  }

  void cmd_reset() {
    digitalWrite(CMD_RESET_PIN, LOW);
    cmd_flags_ |= CMD_FLAG(CMD_RESET);
    cmd_timers_[CMD_RESET] = CMD_RESET_MS;
    response_ = (char*)CMD_RESET_RESPONSE;
  }

  void cmd_auto_off() {
    if (state_flags_ & CMD_FLAG(CMD_AUTO)) {
      digitalWrite(CMD_AUTO_PIN, LOW);
      cmd_flags_ |= CMD_FLAG(CMD_AUTO);
      cmd_timers_[CMD_AUTO] = CMD_AUTO_MS;
    }
    response_ = (char*)CMD_AUTO_OFF_RESPONSE;
  }

  void cmd_auto_on() {
    if (!(state_flags_ & CMD_FLAG(CMD_AUTO))) {
      digitalWrite(CMD_AUTO_PIN, LOW);
      cmd_flags_ |= CMD_FLAG(CMD_AUTO);
      cmd_timers_[CMD_AUTO] = CMD_AUTO_MS;
    }
    response_ = (char*)CMD_AUTO_ON_RESPONSE;
  }
  
  void cmd_bypass_off() {
    if (state_flags_ & CMD_FLAG(CMD_BYPASS)) {
      digitalWrite(CMD_BYPASS_PIN, LOW);
      cmd_flags_ |= CMD_FLAG(CMD_BYPASS);
      cmd_timers_[CMD_BYPASS] = CMD_BYPASS_MS;
    }
    response_ = (char*)CMD_BYPASS_OFF_RESPONSE;
  }

  void cmd_bypass_on() {
    if (!(state_flags_ & CMD_FLAG(CMD_BYPASS))) {
      digitalWrite(CMD_BYPASS_PIN, LOW);
      cmd_flags_ |= CMD_FLAG(CMD_BYPASS);
      cmd_timers_[CMD_BYPASS] = CMD_BYPASS_MS;
    }
    response_ = (char*)CMD_BYPASS_ON_RESPONSE;
  }
  
  void update() {
    // check for tune or reset command completed
    if (cmd_flags_) {
      unsigned long ms = millis();
      
      if ((cmd_flags_ & CMD_FLAG(CMD_AUTO)) && (ms > cmd_timers_[CMD_AUTO])) {
        digitalWrite(CMD_AUTO_PIN, HIGH);
        cmd_flags_ ^= CMD_FLAG(CMD_AUTO);
      }
      
      if ((cmd_flags_ & CMD_FLAG(CMD_BYPASS)) && (ms > cmd_timers_[CMD_BYPASS])) {
        digitalWrite(CMD_BYPASS_PIN, HIGH);
        cmd_flags_ ^= CMD_FLAG(CMD_BYPASS);
      }
      
      if ((cmd_flags_ & CMD_FLAG(CMD_RESET)) && (ms > cmd_timers_[CMD_RESET])) {
        digitalWrite(CMD_RESET_PIN, HIGH);
        cmd_flags_ ^= CMD_FLAG(CMD_RESET);
      }

      if ((cmd_flags_ & CMD_FLAG(CMD_TUNE)) && (ms > cmd_timers_[CMD_TUNE])) {
        digitalWrite(CMD_TUNE_PIN, HIGH);
        cmd_flags_ ^= CMD_FLAG(CMD_TUNE);
      }
    }
  }
  
  private:
  char* response_;
  
  // Note:  These are used for tracking the state of a synthetic button press to the ATU-100.
  // These are NOT used for tracking the actual state of teh ATU-100 based on reading the display
  // buffer.
  unsigned char cmd_flags_ = 0;
  unsigned long cmd_timers_[NUM_CMDS];
  
  // Notes:  These are for the current 'actual' state of the ATU-100.
  unsigned char state_flags_ = 0;
  
  char swr_[];
  char pwr_[];
  char ant_[];
  char eff_[];
  char ind_[];
  char cap_[];
};

TunerControl tuner;

void loop() {
  char buffer[MAX_BUFFER_LEN+1];
  int  buffer_len = 0;
  
  // handle incoming serial data  
  while (Serial.available() > 0) {
    int incomingByte;
    incomingByte = Serial.read();
    if (incomingByte >= 32 && incomingByte <= 126) {
      // skip characters outside of the 'normal keyboard character range'.
      switch (incomingByte) {
        case ' ':
        // skip whitespace (for now; might become part of future messages).
        break;
        
        case ';':
        buffer[buffer_len] = '\0';
        if (buffer_len > 0) {
          if (tuner.process_cmd(buffer) > 0) {
            Serial.write(tuner.cmd_response());
          }
          buffer_len = 0;
        }
        break;
        
        default:
        if (buffer_len < MAX_BUFFER_LEN) {
          buffer[buffer_len++] = char(incomingByte);
        } else {
          buffer_len = 0;
        }
        break;
      }
    }
  }
  
  tuner.update();
}

#endif