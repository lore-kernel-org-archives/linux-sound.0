From: "Richard King" <kingr@icon.co.za>
Date: Wed, 17 Nov 1999 21:20:35 +0000
Subject: Re: de-mixing songs
Message-Id: <marc-linux-sound-94287403416715@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94287188013535@msgid-missing>
In-Reply-To: <marc-linux-sound-94287188013535@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Cool Edit 96 (for Windoze) can do it - and the help files tell you how....

The vocal or instrument must be in the centre of the stereo field - ie
present in both channels - and they can then often be cancelled out quite
well -  but only if there is not too much echo...

Richard King
http://www.channelafrica.org


-----Original Message-----
From: Paco <paco@OhKeePa.Net>
To: Linux Sound List <linux-sound@vger.rutgers.edu>
Date: Wednesday, November 17, 1999 11:07 PM
Subject: Re: de-mixing songs


>
>On Wed, 17 Nov 1999, Chris HOOVER wrote:
>
>> Sorry if this is off topic, but I was wondering if
>> there are any tools in linux that I can use to remove
>> items from songs.  I have some songs that I'd like to
>> romove the vocals and/or guitar(s) from.  Is there
>> anything that will let me do this?
>
>
>Perhaps a more appropriate question is this:
>
>"Are there any tools at all (for *any* operating system) that will allow
>you to do this?"
>
>Answer: I don't think so.
>
>Removing only specific parts of a song is nearly impossible unless that
>"thing" you want to remove is set apart from the rest of the song in some
>way or another.
>
>For example, if all the music was on the left channel, and the voice was
>on the right channel, your could whip up a perl script to strip one
>channel out of the raw data file.  If you have a multi-track recording of
>the song you're working on, you could do something like this.  However,
>once you have mixed several tracks together, ripping them back apart is
>next to impossible.
>
>The only other option is filters, but filters will filter out everything
>that falls into a specific frequency range, not just the thing you want
>gone.  Basically, you'll lose other information with filters.
>
>Email me personally if you have any more questions.  I can think of one
>way to remove (for example) the guitar ONLY from a song, but it would
>require you to have
>
> a) the full mixed-together song
> b) a clean/identical copy of JUST the guitar of that song
>
>peace,
>-Paco
>
