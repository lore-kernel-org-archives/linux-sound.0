From: Artur Skawina <skawina@geocities.com>
Date: Sat, 12 Feb 2000 04:13:10 +0000
Subject: Re: best sound format and app.  for recording  voice.
Message-Id: <marc-linux-sound-95034276911305@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95023921806519@msgid-missing>
In-Reply-To: <marc-linux-sound-95023921806519@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Bryan Bolden wrote:
> 
> I am in school and I tape my classes.  what I would like to do is to begin
> to keep digital copies of the taped classes on my computer without taking
> up so much disk space.  what I will do is have the output jack of the tape
> recorder connected to the input jack of my sound card.  I need to know the
> best sound format and a good (maybe free but I am open to buying a good
> app) application that will allow me to make digital samples  with mono
> recording and at least radio quality that will not take up a lot of space
> for a taped class of about an hour.

if you only need to store voice -- GSM is a decent format; you get ~ 12kbit/s
for 8kHz sample rates (that's 5 megabytes/h).

[the tool i wrote to do this is available at
 http://www.geocities.com/SiliconValley/Heights/6494/sw/
 it doesn't have a lot of docs, but does include source and  executable
 (so it doesn't need the gsm lib, which iirc, needed some tweaks) and even
 does silence compression.
"gsmplay -h" gives basic usage, the rest should be obvious]
