From: Bryan Scaringe <bscaring@slpmbo.ed.ray.com>
Date: Thu, 24 Jun 1999 14:45:22 +0000
Subject: Re: burning CDs with an IDE CDR drive
Message-Id: <marc-linux-sound-93024469714596@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93017612704123@msgid-missing>
In-Reply-To: <marc-linux-sound-93017612704123@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Here's what I did, from memory:

I have IDE CD Drives:  a CD-ROM and a CD-RW
/dev/hdc is the CD-ROM
/dev/hdd is the CD-RW

Compile the kernel with:
	SCSI Support: built in
	SCSI CD-ROM support: built in
	SCSI Generic Support (sg): built in
 	SCSI Emulation (ide-scsi): as module
	IDE-CDROM support (ide-cd): as module
	LOOPBACK device: as module

I chose to build ide-scsi as a module so that I could still
use my CD-ROM as an IDE device.  Here's what I added to 
conf.modules:
	options ide-scsi ignore=hdc
	options ide-cd ignore=hdd

and to lilo.conf:
	append="hdc=ide-cd hdd=ide-scsi"

I need these since whichever of the modules (ide-scsi or ide-cd)
loads first, will attempt to control both drives.  The second
module gets squat.  If you don't mind having both drives under
SCSI emulation, then don't build ide-scsi support at all, and
build SCSI emulation directly into the kernel.

Again, this is from memory.  The thing that screwed me up
was that I was building some of the items like SCSI-generic
as modules, when support needed to be there during booting
process.  Loading sg as a module won't work.  The CD-Writing
HOWTO is (I believe) wrong in this case.                      


Bryan


> hi,
> 
> has anyone managed to burn CDs using an ATAPI/IDE drive? i've just
> installed RH6.0, and i've found several docs that mention that it's
> possible if you use IDE-SCSI emulation. but i can't seem to figure out how
> to get it to work.
> 
> thanks,
> 
> douglas
> 
