From: Billy Biggs <vektor@DIV8.NET>
Date: Tue, 26 Oct 1999 15:35:56 +0000
Subject: External MIDI Sync using OSS/Free
Message-Id: <marc-linux-sound-94095430923870@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

  My sequencer (http://www.div8.net/ttrk) mainly runs off of external MIDI
sync, and drives a mess of synths and stuff.  I use /dev/sequencer for
MIDI input and output.

  Since I'm both reading incomming MIDI, and sending outgoing MIDI, and
since I like to change the tempo on the fly, I have to do annoying
predictions in order to stay in sync.  Blech.

  Anyways, one thing I've found is that the /dev/sequencer clock is
different for incomming and outgoing.  So, in order to do a prediction a
few ticks ahead, I can't just add to the incomming time and blast out
messages.  As well, the outgoing clock seems difficult to predict.

  This is really annoying for song starts.  Every time I get a song start,
I call SNDCTL_SEQ_GETTIME, and take the difference between it and the
timecode on the start message.  I then apply that difference to every
outgoing packet.

  Is there a way that I could do this more efficiently?  Since my app
might not get swapped in until late after the start arrived, and then I
have to call the ioctl.  This error then remains for the entire duration
of the song.

  Any advice?
--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
