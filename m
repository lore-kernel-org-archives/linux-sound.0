From: Deirdre Saoirse <deirdre@deirdre.net>
Date: Thu, 24 Jun 1999 02:26:54 +0000
Subject: Re: burning CDs with an IDE CDR drive
Message-Id: <marc-linux-sound-93018997814462@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93017612704123@msgid-missing>
In-Reply-To: <marc-linux-sound-93017612704123@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 23 Jun 1999, Bill Schoolcraft wrote:

> douglas irving repetto wrote:
> > has anyone managed to burn CDs using an ATAPI/IDE drive? i've just
> > installed RH6.0, and i've found several docs that mention that it's
> > possible if you use IDE-SCSI emulation. but i can't seem to figure out how
> > to get it to work.
> 
> Douglas,
> 	I've recompiled the emulation in and Xcdroast tells me I haven't.
> So I'm just burning in "you know what!" till the waters settle a
> little in MY kernel :(

Yes, I've done it. However, note that the emulation doesn't work if you
already HAVE a SCSI card in there. Also, this isn't really related to
sound as it's mostly for burning data CDs -- you probably want the
cdrecord mailing list.

Xcdroast will do a sanity check on your settings and tell you what you
did wrong. :)

-- 
_Deirdre   *   http://www.linuxcabal.org   *   http://www.deirdre.net
"I have a simple rule in life: If I don't understand something, it must be
bad." & "If you want more than 4 gig of memory, get a *real* CPU."
-- Linus Torvalds, speaking at BALUG (www.balug.org)
