From: Jeff Tranter <tranter@pobox.com>
Date: Thu, 24 Jun 1999 01:32:09 +0000
Subject: Re: burning CDs with an IDE CDR drive
Message-Id: <marc-linux-sound-93018776213023@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93017612704123@msgid-missing>
In-Reply-To: <marc-linux-sound-93017612704123@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Check the CD-Writing HOWTO, which you can get from any LDP mirror
such as http://www.linuxdoc.org

Basically if you compile IDE SCSI emulation into your kernel and load the
ide-scsi module you should be in business.

(and this is probably not the best forum for this because it has little
to do with sound)

On Wed, 23 Jun 1999, douglas irving repetto wrote:
> hi,
> 
> has anyone managed to burn CDs using an ATAPI/IDE drive? i've just
> installed RH6.0, and i've found several docs that mention that it's
> possible if you use IDE-SCSI emulation. but i can't seem to figure out how
> to get it to work.

--
Jeff Tranter (mailto:tranter@pobox.com http://www.pobox.com/~tranter)
I will not be pushed, filed, stamped, indexed, briefed, debriefed, or numbered.
Visit the Linux Documentation Project at http://www.linuxdoc.org
