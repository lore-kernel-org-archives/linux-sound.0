From: Gerard Roudier <groudier@club-internet.fr>
Date: Tue, 24 Aug 1999 07:56:05 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93548056018106@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org



On Tue, 24 Aug 1999, Gerard Roudier wrote:

> If you are in a hurry but are a courageous guy ;-), you can, for now, add
> some file control (fcntl) option that tells the kernel to discard the
> pages of data of this file once read by user=20

> (or just to set the pages at the end of the LRU in recent kernels),

This suggestion anticipates too much about page map LRU inclusion in the
kernel main stream and just makes the suggestion just broken). Without
Andrea's page LRU, it may happen that useful page of data will still be
thrown away after a shrink_mmap revolution.
By the way, if 2.4 does not include Andrea's page LRU, I know of people=20
who will be very disappointed.

> then make appropriate changes in
> the kernel and in the application. The kernel will still prefetch file
> data on read, allowing read streaming, without having to multithread IOs
> at application level.
>=20
> Sorry if this has been already suggested.
>=20
> G=E9rard.
>=20
> On Mon, 23 Aug 1999, Benno Senoner wrote:
>=20
> > On Mon, 23 Aug 1999, Alan Cox wrote:
> > > > I'm afraid, if we want that Linux will be a good multimedia OS, thi=
s is a
> > > > _STRONGLY_NEEDED_  feature.
> > > >=20
> > > > The user wants to playback his video/audio from disk, and still be =
able
> > > > to launch his apps, without waiting 10 secs for loading a simple xt=
erm.
> > > >=20
> > > > The SCT's  raw-io patches are nice, but not very suitable in a gene=
ral purpose
> > > > multimedia enviroment, since you can't tell to the user to store hi=
s videos on a
> > > > raw partition.
> > >=20
> > > Stephens patches are basis of raw I/O on files in a filesystem too.
> >=20
> > That sounds nice to me !
> > Any idea when some patches ( for raw file I/O in a filesystem) will be =
available
> > ?=20
> > >=20
> > > However what you are saying and raw-io don't neccessarily tally. You =
are
> > > actually saying "there is a bug in the current page cache handling for
> > > this kind of operation". Far better therefore to fix the heuristic us=
ed.
> >=20
> > No , I'm not saying that there is a bug, I'm saying that the
> > filebuffering works very well in almost all cases , except of reading l=
arge
> > files from disk continuously.
> > This is of course quite logical since the kernel makes assumptions that=
 you
> > will read this large file again, and therefore the kernel has to put it=
 into
> > the buffer cache.
> >=20
> > In this case I don't need raw I/O to get fast response or higher throug=
hput,
> > but only  to avoid that the streaming apps do not monopolizes the buffe=
r, which
> > is very bad.
> >=20
> > will the SCT's patches add an O_DIRECT -like flag ala SGI ?
> >=20
> > regards,
> > Benno.
> >=20
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> > the body of a message to majordomo@vger.rutgers.edu
> > Please read the FAQ at http://www.tux.org/lkml/
>=20
>=20
