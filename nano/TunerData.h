/*
 * Window 1:
 * 0, 0: "PWR=###W"				supported
 * 0, 3: "TEST MODE"			not
 * 0, 3: "FAST TEST"			not
 * 0, 4: "ATU-100"				not
 * 0, 4: "by N7DDC"				not
 * 0, 6: "Fider Loss input"		not
 *
 * Window 2:
 * 0, 8: "l"	(long press)			not
 * 0, 8: "c"    (release?)				not
 * 0, 8: "."    (Auto & not Bypass)		supported
 * 0, 8: "_"    (not Auto & Bypass)		supported
 *
 * Window 3:
 * 0, 9: "C=####p"				supported
 * 0, 9: "AN=###W"				supported
 *
 * Window 4:
 * 1, 0: "OVERLOAD"				supported
 * 1, 0: "RESET"				supported
 * 1, 0: "SWR=#.##"				supported
 * 1, 3: "EXT board"			not
 * 1, 3: "FW ver 3.2"			not
 * 1, 4: "TUNE"					supported
 * 
 * Window 5:
 *
 * Window 6:
 * 1, 9: "L=####u"
 * 1, 9: "EFF=##%"
 */

class TunerData {
	public:

	void parse_window1(const char* buffer) {
		//if (strncmp(buffer, "PWR=", 4) == 0) {
		if (buffer[0] == 'P')	// assume power
			strncpy(swr_, &buffer[4], 3);
		}
	}

	void parse_window2(const char* buffer) {
		switch (buffer[0]) {
			case '_':
			set_bypass();
			unset_auto();
			break;

			case '.':
			set_auto();
			unset_bypass();
			break;

			//case 'l':
			//break;

			//case 'c':
			//break;

			default:
			unset_auto();
			unset_bypass();
		}
	}

	void parse_window3(const char* buffer) {
		switch (buffer[0]) {
			case 'C':
			//if (strncmp(buffer, "C=", 2) == 0) {
				strncpy(cap_, &buffer[2], 4);	// assume capacitance
			//}
			break;

			case 'A':
			//if (strncmp(buffer, "AN=", 3) == 0) {
				strncpy(ant_, &buffer[3], 3);	// assume power at antenna
			//}
			break;
		}
	}

	void parse_window4(const char* buffer) {
		switch (buffer[0]) {
			case 'S':
			//if (strncmp(buffer, "SWR=", 4) == 0) {
				strncpy(swr_, &buffer[4], 4);	// assume SWR
			//}
			unset_overload();
			unset_reset();
			break;

			case 'R':
			//if (strncmp(buffer, "RESET", 5) == 0) {
				set_reset();		// assume reset
				unset_overload();
			//}
			break;

			case 'O':
			//if (strncmp(buffer, "OVERLOAD", 8) == 0) {
				set_overload();		// assume overload
				unset_reset();
			//}
			break;
		}
	}

	void parse_window6(const char* buffer) {}
		if (strncmp(&buffer[4], "TUNE", 4) == 0) {
			set_tune();
			return;
		} else {
			unset_tune();
		}

		switch (buffer[0]) {
			case 'L':
			//if (strncmp(buffer, "L=", 2) == 0) {
				strncpy(ind_, &buffer[2], 4);	// assume inductance
			//}
			break;

			case 'E':
			//if (strncmp(buffer, "EFF=", 4) == 0) {
				strncpy(eff_, &buffer[4], 2);	// assume inductance
			//}
			break;
		}
	}

	inline void set_tune()       { flags_ |= '\x01'; }
	inline void unset_tune()     { flags_ &= '\xfe'; }
	inline void set_reset()      { flags_ |= '\x02'; }
	inline void unset_reset()    { flags_ &= '\xfd'; }
	inline void set_auto()       { flags_ |= '\x04'; }
	inline void unset_auto()     { flags_ &= '\xfb'; }
	inline void set_bypass()     { flags_ |= '\x08'; }
	inline void unset_auto()     { flags_ &= '\xf7'; }
	inline void set_overload()   { flags_ |= '\x10'; }
	inline void unset_overload() { flags_ &= '\xef'; }

	private:

	char swr_[] = "0.00";
	char ind_[] = " 0.0";
	char cap_[] = "   0";
	char pwr_[] = "  0";
	char ant_[] = "  0";
	char eff_[] = " 0";
	unsigned char flags_ = 0x00;
}



class SerialData {
	public:
	void process(const char* cmdstr) {
		int len = strlen(cmdstr);
		for (i = 0; i < len; i++) {
			const char* cs = &cmdstr[i];
			if (strncmp(cs, "S;", 2) == 0) { // SWR
				Serial.print("S" + swr_ + ";\n");				
				i++;
			} else if (strncmp(cs, "P;", 2) == 0) { // power
				Serial.print("P" + pwr_ + ";\n");
				i++;
			} else if (strncmp(cs, "A;", 2) == 0) { // power (at antenna)
				Serial.print("A" + ant_ + ";\n");
				i++;
			} else if (strncmp(cs, "L;", 2) == 0) { // inductance
				Serial.print("L" + ind_ + ";\n");
				i++;
			} else if (strncmp(cs, "C;", 2) == 0) { // capacitance
				Serial.print("C" + ind_ + ";\n");
				i++;
			} else if (strncmp(cs, "F;", 2) == 0) { // flags
				Serial.print("F" + flags_ + ";\n");
				i++;
			} else {
				// do nothing... we'll just advance to the next char
			}
		}
	}
}