From: Hamish Moffatt <moffatt@cs.rmit.edu.au>
Date: Sat, 19 Sep 1998 13:06:10 +0000
Subject: Re: CW-7502 -> cdda2wav -> zeroes
Message-Id: <marc-linux-sound-90621010026505@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90607851214906@msgid-missing>
In-Reply-To: <marc-linux-sound-90607851214906@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, Sep 17, 1998 at 01:14:21PM -0700, Mike "Ford" Ditto wrote:
> I am trying to use Cdda2wav version 0.8 to read audio tracks from a
> Panasonic CW-7502 (which is widely reported to have good CDDA reading
> capability).  The program can read and display the TOC correctly and it
> writes the correct number of bytes into the output file, but all of the
> audio samples are zero (total silence).

That happens here too; I was trying to do it earlier with xcdroast.
First it told me it couldn't tell the drive type; then I picked
SCSI-3/mmc and got huge sound files containing null data,  which isn't
surprising since it didn't actually use the drive to do the extraction.

I don't know what the fix is. I extracted the stuff on my CR-585 reader
instead. For some reason xcdroast thinks it can't extract audio from IDE,
even though cdda2wav can do it just fine.


Hamish
-- 
Hamish Moffatt, StudIEAust              hamish@debian.org, hamish@moffatt.nu
Student, computer science & computer systems engineering.    4th year, RMIT.
http://hamish.home.ml.org/ (PGP key here)             CPOM: [*******   ] 73%
Nondeterminism means never having to say you are wrong.
