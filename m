From: "Oberpriller, Matthew" <OberprM@sti.imshealth.com>
Date: Wed, 07 Jul 1999 17:21:24 +0000
Subject: RE: problems compiling players
Message-Id: <marc-linux-sound-93136802508910@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93135896631964@msgid-missing>
In-Reply-To: <marc-linux-sound-93135896631964@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Most tar archives are also compressed.  Try using

tar -xzvf {filename}.tar

You can also find out more information about what type of file you are
attempting to unarchive by typing

file {filename}

This should tell you what kind of file it is, whether it is compressed, or
if it is incomplete or damaged.

> -----Original Message-----
> From:	Kirchner, Eric C. [SMTP:ECKirchner@Bemis.com]
> Sent:	Wednesday, July 07, 1999 10:31 AM
> To:	'linux-sound@vger.rutgers.edu'
> Subject:	problems compiling players
> 
> This question isn't directly related to sound, but hope someone can give
> me
> a pointer -- I have tried to compile a great deal of players -- trying to
> find one that will work with the libraries I have right now, but Many of
> them TAR says are bad -- Its so many that I think I am missing something
> --
> I try to untar using 
> 
> tar -xvf {filename}.tar 
> 
> is there a different command line -- or are my tar's really corrupt...?
> 
> Eric
