From: <paco@hydrofunk.org>
Date: Fri, 16 Jun 2000 21:55:35 +0000
Subject: Re: Multimedia compression
Message-Id: <marc-linux-sound-96119262931697@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96119149930040@msgid-missing>
In-Reply-To: <marc-linux-sound-96119149930040@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

There's something called SHORTEN that does lossless compression of .WAV
files. It produces .SHN files that are roughly 1/2 the size of the .WAV,
but... you can't play a SHN file (yet).  You have to decompress it to a
WAV and listen to it that way.  So, it's good for up/down-loading music
and for archiving music.

You can whip up a little script to play CDs full of SHN files.  I did.  It
just decompresses the SHN off of a CD and pipes the output directly to
"play" so that I can keep twice the music on a single CD.

I don't remember the Shorten website name exactly, but there is a link to
it off of my website.

	http://www.hydrofunk.org/music

peace,
--Paco

On Sat, 17 Jun 2000, Sergey wrote:

> Hi!
>  Have someone heard of "Multimedia compression"?
>  I mean, a special Zip (WINZIP :( ) which compresses PCM WAVes without
>  losses. (Special optimized algorythms are used)
>  Is there something like that for Linux?
>  
>  As I know, it will save 30-40% of disk space if you store plain PCMs -
> whiel a ususal bzip or zip saves just about 5%.
>  
>  Please do not write of mpeg or any other "destructive" compression.
>          Sergey.
> 
