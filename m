From: Adam Wiggins <adam@angel.com>
Date: Tue, 22 Sep 1998 00:05:13 +0000
Subject: Re: How to create .mod files?
Message-Id: <marc-linux-sound-90642842229258@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90642111226910@msgid-missing>
In-Reply-To: <marc-linux-sound-90642111226910@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 22 Sep 1998, Ow W K Danny wrote:
> I've a couple of .mod files and the sound produced with this format is
> very good. Is there anyway to create or convert sound from CD into this
> format under Linux? 

If you mean recording them from an existing song that's on CD, forget it.
MOD files originated on the Amiga long before being able to just take long
samples of music was feasible; instead it's a sort of bare-bones MIDI
format which relies completely on fixed samples.  You'd have about as much
luck trying to convert a CD track to a .mid file.

There are a ton of mod players and probably some composers (known as
'trackers') availible for Linux.  Do a search on freshmeat or linuxapps
for "s3m", "mod", "tracker", or "xm".
