From: "paco@hydrofunk.org" <paco@hydrofunk.org>
Date: Tue, 20 Jun 2000 23:02:24 +0000
Subject: Re: [linux-audio-dev] Re: Multimedia compression
Message-Id: <marc-linux-sound-96200429928838@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96126686903146@msgid-missing>
In-Reply-To: <marc-linux-sound-96126686903146@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Tue, 20 Jun 2000 paco@OhKeePa.Net wrote:
> 
> Hey... this is fairly new.  Somebody hacked XMMS so that it plays SHN
> files directly.  The relevant info is in the text below.
> 
> Note that you can also do this:
> 
>      paco@hydrofunk.org%> shorten -x <file>.shn - | play -t wav -
> 
> from the command line to play a SHN without making the intermediate .WAV
> file.  It works fine, but you don't get a nice GUI or the ability to
> pause, ffwd, or rewind the audio.


Just in case anybody out there isn't familiar with perl, I though I'd send
this email out to help them.  Attached is my script for playing SHNs  out
of directories or off of a CD.

To use it, put it in your path somewhere (make sure it's executable!), and
type:

        shnplay /my/shn/file/directory/or/CDROM/path

That's is.  It will play each file with a ".shn" extention in that
directory without making big WAV files as an intermediate step.

SInce the shorten algorithm is so fast, playing SHN files like this only
uses up about 10% of my CPU. (550MHz Athlon.)

BTW:  it's nice to have a topic on this mailing list aside from "how do I
get this card working" or "is there planned support for this card" and the
like.  Those are all good posts to this list, but we never really have too
many actual discussions about stuff.  We just help each other make the
boxes make noise.
