From: "dlock@acs.itd.uts.edu.au" <dlock@acs.itd.uts.edu.au>
Date: Tue, 08 Sep 1998 03:35:48 +0000
Subject: Linux cecilia/csound
Message-Id: <marc-linux-sound-90523275804472@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



g'day there- ive been running cecilia  on my linux box
with great success, and now im moving towards a real time application of
cecilia (live dsp).

ive got a couple of questions relating to the Audio-in function.
I can write to the DACs no problem, but when i attempt to read audio from
the soundcard and write to the DACS, problems arise.
ie : i run this simple orc/sco (in csound alone)

/usr/Csound-3.47/ csound  -o /dev/audio1 -L stdin  -i /dev/audio0
rtinu.orc rtinu.sco 

I get a short looping buffer of ambient sound. The orc/sco compiles no
problem (and does work properlly on a mac). It may have somthing to do
with the command line. Here is the output:

Csound Version  v3.485.0b (Aug 27 1998)
orchname:  rtinu.orc
scorename: rtinu.sco
sorting score ...
        ... done
orch compiler:
 26 lines read
        instr   31
MIT Csound:  v3.485.0b (Aug 27 1998)
orch now loaded
stdmode = 00000002 Linefd = 0
audio buffered in 1024 sample-frame blocks
WARNING: /dev/audio0 has no soundfile header, assuming shorts
reading 4096-byte blks of shorts from /dev/audio0 
writing 4096-byte blks of shorts to /dev/audio1 (IRCAM)
SECTION 1:
new alloc for instr 31:


The other question relates to cecilia.
When i select preview command and/or opoen cecilia window, csound does not
compile (doesnt initiate compilation) and cecilia just hangs (until i
reinit module).
This in itself isnt such a big problem, but how does one change the
command line options (ie audio devices) without this previewer- (where is
the default file kept?)

I also (on occasion) get the following error message when atempting to
preview the command....

grab failed window not viewable

Any ideas would be appreciated....
