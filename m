From: David Manifold <dem@pacificrim.net>
Date: Tue, 22 Sep 1998 00:32:12 +0000
Subject: Re: How to create .mod files?
Message-Id: <marc-linux-sound-90642886929392@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90642111226910@msgid-missing>
In-Reply-To: <marc-linux-sound-90642111226910@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 22 Sep 1998, Ow W K Danny wrote:

> Hi,
> 
> I've a couple of .mod files and the sound produced with this format is
> very good. Is there anyway to create or convert sound from CD into this
> format under Linux? 

MOD files consist of individual instrument samples (small WAV files),
along with when to play which instruments, at what frequency, and with
what special effects.  This allows an extensive musical score to be made
of a small number of samples, reducing size.  CD audio is a continuous
stream of digital frequencies, basically one huge sample.  To convert from
CD to MOD, then, requires advanced AI to separate the sound into
individual notes, individual instruments, and their pitch.  This kind of
conversion cannot be done automatically with the current level of
technology (as far as I know), so making MOD compositions remains an art
for human techno-musicians.  It would be possible to create a file in
valid MOD format from a CD, but it would be very large (basically putting
the whole song into one instrument and saying to play a single note) and
defeat the purpose of the MOD format.

If you are interested in CD quality digital audio, look at MP3 at
http://www.mp3.com or the new upcoming VQF at http://www.vqf.com.
Unfortunately these are both lossy compression formats, so you lose some
sound quality, and they have software patents, so it is hard to find free
encoders.  K-jofol is a free MP3 and VQF player for Win32 that is being
ported to Linux soon.

David Manifold <dem@tunes.org>
