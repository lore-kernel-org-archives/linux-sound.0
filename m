From: Rick Marshall <rjm@herzfeld.com.au>
Date: Wed, 07 Jul 1999 23:26:20 +0000
Subject: Re: problems compiling players
Message-Id: <marc-linux-sound-93139096931868@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93135896631964@msgid-missing>
In-Reply-To: <marc-linux-sound-93135896631964@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

"Kirchner, Eric C." wrote:

> This question isn't directly related to sound, but hope someone can give me
> a pointer -- I have tried to compile a great deal of players -- trying to
> find one that will work with the libraries I have right now, but Many of
> them TAR says are bad -- Its so many that I think I am missing something --
> I try to untar using
>
> tar -xvf {filename}.tar

The sources are usually {filename}.tar.gz and can be untarred with

tar xvzf {filename}.tar.gz

(if you have gnu tar)

but also make sure you issue the "binary" command to ftp before getting the
sources. You may have corrupt files

Rick

>
>
> is there a different command line -- or are my tar's really corrupt...?
>
> Eric

--
mailto:rjm@herzfeld.com.au <=> RICK MARSHALL <=> http://www.herzfeld.com.au/isl
   International Software Laboratories Pty Limited - Australia, New Zealand
     Footwear: Retail Management, Point of Sale, Wholesale, Manufacturing
    (-: All in Linux :-)   (-: On the Web :-)   (-: All in UNIBASE 5GL :-)
