From: Kai Vehmanen <kaiv@wakkanet.fi>
Date: Thu, 01 Jul 1999 00:49:39 +0000
Subject: Re: best mp3 players?
Message-Id: <marc-linux-sound-93079086212704@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92844466709981@msgid-missing>
In-Reply-To: <marc-linux-sound-92844466709981@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 4 Jun 1999, I wrote on this list:

> if you're interested. There's still a lot of work to be done, but I might
> consider releasing some mp3-mangling-alpha versions if there's interest.

Well, here it is! :) 

--cut from release_info.txt--
The first beta version of ecasound is now released.

Although usable, this version should be considered beta.  
For instance qtecasound is still just a qt/x11 wrapper for 
the textmode version. Also a lot of important documentation is still 
unfinished. Feedback, bugs, problems, succesful install reports, 
wishes, etc are all welcome. Send emails to 'kaiv@wakkanet.fi'. 

---
Ecasound home page
     
http://www.wakkanet.fi/~kaiv/ecasound/ 

---
Files

http://www.wakkanet.fi/~kaiv/ecasound/ecasound-1.1.5r2-1.i386.rpm
	- RPM, glibc 2.1.x, Qt 2.x (optional)
http://www.wakkanet.fi/~kaiv/ecasound/ecasound-1.1.5r2-1.src.rpm
http://www.wakkanet.fi/~kaiv/ecasound/ecasound-1.1.5r2-1.tar.gz

---
An example of what ecasound can do:

Process a input file (wav, mp3, cdr) with a resonant lowpass
filter. The cutoff frequency is controlled by a sine oscillator.
The effect processing is done in realtime and the output is sent
to /dev/dsp (OSS drivers are used):

"ecasound somefile.mp3 -ef3:800,1.5,0.9 -kos:1,400,4200,0.2,0"

---
LSM-entry:

Begin3
Title:          ecasound
Version:        1.1.5r2
Entered-date:   01JUL1999
Description:    Ecasound is a text-mode sound processing program that
		can do various tasks from basic editing and effect 
		processing to multitrack recording. Although the user
		interface may seem a bit cryptic, one of the main
		design goals of this project has been to create an
		easy-to-use, creative utility for recording and mixing
		purposes. Because of the simple interface, batch files
		can be used to automate complex editing tasks. qtecasound 
		- a Qt and X11 based GUI - is also included.
Keywords:       audio multimedia multitrack effect dsp mixing processing
		recording wav mp3 cdda console x11 qt
Author:         kaiv@wakkanet.fi (Kai Vehmanen)
Maintained-by:	kaiv@wakkanet.fi (Kai Vehmanen) 
Primary-site:	http://www.wakkanet.fi/~kaiv/ecasound/
Platforms:      POSIX threads, OSS drivers
Copying-policy: GPL
End
--cut--

-- 
Kai Vehmanen ----------------------------- CS, University of Turku, Finland
 : email                       mailto:kaiv@wakkanet.fi
 : projects, home page, etc    http://www.wakkanet.fi/~kaiv/
 : ambient-idm-rock-... mp3/ra http://www.wakkanet.fi/~kaiv/sculpscape.html
