From: David Jander <djander@alumnos.utfsm.cl>
Date: Mon, 06 Dec 1999 14:55:55 +0000
Subject: Re: Linux Equavalent - Fast Tracker 2
Message-Id: <marc-linux-sound-94449214919367@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94335078501128@msgid-missing>
In-Reply-To: <marc-linux-sound-94335078501128@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 03 Dec 1999, Kai Vehmanen wrote:
>On Thu, 2 Dec 1999, David Jander wrote:
>
>> Also, I checked out the FT2 web page, and it says that Magnus (one of the guys
>> who did that thing) is considering an open-source release of FT2... interesting
>> too, don't you think.
>
>This would be great. Of course, it might be more useful to just port
>some parts of FT2 and use them with existing Linux trackers. Porting 
>the whole FT2 would be a big project. And it's important to think 
>about the future of tracking. Modern computers are suitable for 
>direct-from-disk streaming, complex realtime effects, *big* samples,
>etc... Modern trackers should take advantage of this.

Of course, the goal would be to put a lot more things into it. The XM module
format has to be extended, to include more effects. Sound-Tracker for example
includes a global real-time reverb effect, which is neat so far, but the idea
of including real-time effects into FT2 (making it FT3 maybe), would be
something like effect-modules which could be connected to individual tracks,
and effect controlers inside that track control the fx parameters. Effect
modules could include reverb, chorus, delay and realtime filters for example.
Imagine a techno-style bass made of a square wave signal, put through a
controlled resonant low-pass filter ... great stuff !
Maybe some (or all) of those effects should better be bound to individual
instruments rather than a track. Filters would do better with an envelope
generator.....
Anyway, just a few thoughts for an ambitious project :-)

Sincerely

---------------------------------------------------------------------
David Jander J.                   | "M$-Windows sux, Linux Rulez !  
Electronics Student, UTFSM, Chile |  That's it !"
E-Mail : djander@alumnos.utfsm.cl |               -Me
