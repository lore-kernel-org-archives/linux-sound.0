From: Dominik Stadler <Dominik.Stadler@apertum.de>
Date: Tue, 01 Sep 1998 16:48:52 +0000
Subject: General question about sound-tools and how to do things
Message-Id: <marc-linux-sound-90468993125457@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all linux-soundies, 

If this is the wrong place to ask, I apologize for loading this list and
ask you to direct me to another place, apropriate for such questions..

I'm interested to hear the experience with various sound-tools from
people using them.
I'm doing some sound-processing with my linux-2.0.35/36pre6-box and my
SB-64AWE-PNP and would like to get an overview of the tools other people
use. I'm aware that I could dig through all available tools at "Linux
Sound & Mid Applications" at
http://www.bright.net/~dlphilp/linux_soundapps.html, and I did already
for some of them, also I read the sound-howtos, but I would like to do
the following tasks and think some of you will be so kind and give me
some hints on them

1. Which tool (command line or X) is well suited to record sound from
line-in like a radio broadcasting or from tape or from microphone to wav
files

2. I'm also interested if it is possible to record directly from line-in
or microphone to cd with my teac-cdr55s-burner, especially is it
possible to have tracks on the cd either with fixed length, e.g. 5
minutes or to switch to the next track by keypress?

3. sometimes I have one large audio-file (sometimes over 1,5 Gig) and I
don't like that I'm forced to have much addittional free space to split
it in parts (currently I need the size of the file of free space again,
that is 2 Gig for storing and splitting a 1 Gig-File). Is it possible to
split it in-place, that means without need for much more space? Is this
theorethically possible under Linux (to split or shrink a file)?
I think of the following way:
I have a 1GB-File and want to split it in two parts, each 500MB, If it
is possible, the function/programm/tool should step through the file and
extract smaller parts (e.g. 1MB) from the Source-File, write it to the
Destination and shrink the first file and make it 1023MB, then the next
1MB-chunk, and so on...
It could be very slow or very disk-intensive to do so? or is there a
better way, like splitting the whole file and writing a new header to
the two files?

4. Which tool use people in linux-land to manipulate their sound-files
(cut out wrong parts, apply some effects or filters, ..)?

5. Another point I would like to address is mixing of two or more
audio-files, especially can I fade from one to another in a comfortable
way?

6. aditionally I would like to retrieve the BPM (Beats Per Minute)-Count
of some of the audio-files, is there an application, plug-in,
source-code-library, example-file or other tool to get this piece of
information?

7. Although not closely related to linux-sound, but which options and
parameters do I have to give to cdda2wav and cdrecord to persuade them
to copy an audio-cd on-the-fly (apart from possible
performance-problems)


At the moment, I'm using the standard sound driver with 2.0.35,
AFsp-v4.0, sox, xwave, kmix under kde, cdda2wav, cdrecord, mkisofs  to
do some of the jobs, but I think, there could be some tools better
suited for my requirements because I got to some borders and I like to
ask for other solutions before digging into the source-code?

Also I thought about changing to ALSA or the latest OSSFree 3.8b9 (I
tried to install it, but I couldn't get it work properly), but this
would only make my currently working sound-setup unstable?


I'm planning to gather the responses and submit interesting parts to one
of the sound-playing/writing/..-HOWTOs!


Thank you in advance (I wonder if anybody will read this far??)

Dschau.. Dominik
