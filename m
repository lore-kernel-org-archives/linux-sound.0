From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
Date: Thu, 12 Aug 1999 01:59:19 +0000
Subject: Re: hdd & sound
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------9AE9CA3CA812B68FB974C4B0"
Message-Id: <marc-linux-sound-93442291416140@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------9AE9CA3CA812B68FB974C4B0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by periscope.localdomain id CAA27563

Roger Larsson wrote:

> Hi all,
>
> All of you that are having this problem. Could you reply to me with:
> a) type of ISA cards (as specific as possible, especially SCSI and
> sound)
>

My machine has a single ISA card which is a SB 64 AWE GOLD. The HDDs are =
running of
the motherboard controller. I have two hdds on one controller, two cd-rom=
s (1
reader, 1 rewriter) on the other. This test was performed when ripping th=
e Britney
Spears Sometimes single to create a wav file. cdrecord produces some inte=
ruption, I
used cdparanoia becausethat seems to be much worse so that you can seethe=
 effects.
This also occurs when I write cd-roms, but I don't want to waste a couple=
 of cds
unless you think it's useful in which case I will.



> b) verify that you do not run SCSI/EIDE in non bus master mode.
>

As far as I am aware they are in Bus master mode. The machine was built b=
y myself
and is less than 1 year old (PII 400 Mhz 128Mb RAM, 256 MbSWAP (128Mb on =
each of
the two hdds). I did not adjust this setting so I assume that it is using=
 Bus
mastering mode which is normal on all modern machines.


> c) attach a output from vmstat 2 > vmstat.out
>    (play sound, start this command, wait 5 secs, start disk activity,
>     wait 5 secs, stop vmstat with ^C
>

I already had sound playing, started the command, waited 5 secs, started =
ripping,
continued until ripping finished, waited a couple of secs (I think 5) and=
 then
stopped vmstat. During the ripping there was a horrible "slow motiony slo=
w down" of
the music, like when you hold a tape and physically slow it down as it mo=
ves inside
a tape player. Also, it often "cut's out" for several seconds at a time a=
s it did
once or twice here.


>
>     This was checked on Wakkos machine, and it indicated that no bus
>     mastering / DMA was used.
>     Note: my SB16SCSI II does not have DMA enabled by default... and
>           ISA cards can not do bus mastering on their own.)
>

I assume you are refering to the sbs which have a hdd controller onboard?=
 Mine are
on the motherboard separate from the sb64.

If you want any further info, just tell me what you need and you've got i=
t
yesturday.


>
> [I will make a summary]
>
> PS.
>
> I do think that this is related (until proven otherwise)
>
> Check out
>   http://www.gardena.net/benno/linux/audio/
>
> But make sure that you are using Bus Master EIDE / dma transfers since
> it does not handle that yet !
>
> /RogerL
>
> Mike wrote:
> >
> > On Sat, 7 Aug 1999, Wakko Warner wrote:
> >
> > > I'm noticing this one one of my machines.  When writing to a hard d=
rive, the
> > > sound drags.  The machine I'm on has piix4 ide and an isa scsi card=
.  I'm
> > > playing sounds from the drive on the scsi card (aha1510 I think is =
the scsi
> > > card).  I tried writing to both an ide and scsi drive, both drag th=
e sound.
> > > Sound card is an SB16 pnp /w ide port (not disablable unfortunately=
).  I had
> > > a similar problem on an isa ide card playing sounds off of the hard=
 drive
> > > (like 44k 16bit 2ch sound off the drive, sound card was an ess card=
).  My
> > > home box that this is happneing on is 2.2.7.  The one with the isa =
ide is no
> > > longer active, but it was running 2.0.36.
> > >
> > I see much the same thing under (extremely) heavy disk load, both on
> > onboard piix4 ide, and on an onboard aic7??? scsi.
> >
> > Things it isn't:
> >   hardware - too many people are seeing the same thing for that
> >   driver specific - it happens on both ide and scsi, and with both sb=
 and
> >                     ess cards
> >   anything blindingly obvious
> >
> > Currently I suspect something evil either in sound_core.c or sound_ti=
mer.c
> > or (more likely) something scheduler related, but this is wild guessi=
ng.  Any
> > ideas?
> >
> > --
> > Mike <rickettm@ox.compsoc.net>
> >
> > Q:      What's yellow, and equivalent to the Axiom of Choice?
> > A:      Zorn's Lemon.
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> > the body of a message to majordomo@vger.rutgers.edu
> > Please read the FAQ at http://www.tux.org/lkml/
>
> --
>
> The Internet interprets Windows as damage,
>              and routes around it.
>
> Roger Larsson
> Skellefte=E5
> Sweden
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> the body of a message to majordomo@vger.rutgers.edu
> Please read the FAQ at http://www.tux.org/lkml/

--
Jonathan C. Masters                     (jonathan@oxlug.org)
                                        PGP: www.brookes.ac.uk/~95227860/=
KEY

           "Upon this rock I will build my church,
            and the gates of hell shall not prevail against it".

                 -- Matthew 16, 17-18



--------------9AE9CA3CA812B68FB974C4B0
Content-Type: text/plain; charset=us-ascii;
 name="vmstat.out"
Content-Disposition: inline;
 filename="vmstat.out"
Content-Transfer-Encoding: 7bit

   procs                      memory    swap          io     system         cpu
 r  b  w   swpd   free   buff  cache  si  so    bi    bo   in    cs  us  sy  id
 1  0  0  29248   2996  34524  23732   1   0    72    45  170   148  15   4  82
 1  0  0  29248   3044  34520  23684   0   0    38     1  880  1931   2   4  94
 1  0  0  29248   3180  34480  23596   0   0     0     7  816  1901   2   4  94
 2  0  0  29248   1832  34236  23584   0   0     0     4  821  1775   4   7  89
 2  0  0  29248   3136  32876  23484   0   0    39   281  784  1704   7  12  81
 0  0  0  29248   3168  32624  23480   0   0     0     0  842  1861  10   8  82
 1  0  0  29248   3140  32392  23532   0   0    38     0  799  1894   7  12  81
 2  0  1  29248   3708  32304  23492   0   0     0     0  746  1695  10  10  80
 3  0  1  29248   3580  32304  23492   0   0     0   642  767  1748  11   9  80
 2  0  1  29248   3368  32304  23568   0   0    38     0  756  1725  11  10  79
 2  0  1  29248   3112  32304  23568   0   0     0     0  768  1826   6  12  82
 1  0  1  29248   3772  32304  23260   0   0    38  1130  794  1841   8  11  81
 2  0  1  29248   3696  32304  23260   0   0     0     0  774  1860   9   9  82
 1  0  1  29248   3948  32304  23260   0   0     1   729  792  1765  10  10  80
 2  0  0  29248   3596  32304  23336   0   0    39     7  752  1679   7  10  83
 1  0  0  29248   3404  32304  23336   0   0     0     0  768  1819   7   6  87
 2  0  0  29248   3792  32304  23336   0   0     1  1023  791  1737   8   9  83
 2  0  0  29248   3600  32304  23412   0   0    38     0  769  1704  10   9  80
 3  0  1  29248   3244  32304  23412   0   0     0  1015  828  1771   9  12  79
 5  0  1  29248   3644  30276  23512 176   0   341   500  935  2358  35  18  47
 2  0  1  29248   3024  30020  23944   0   0   190   250  831  2017  34  18  47
   procs                      memory    swap          io     system         cpu
 r  b  w   swpd   free   buff  cache  si  so    bi    bo   in    cs  us  sy  id
 3  0  0  29248   3476  29900  23936   0   0     9   266  791  1754  13   6  81
 3  0  0  29248   3140  29900  24012   0   0    39     0  756  1700  11  11  78
 2  0  1  29248   3456  29780  24004   0   0     0  1347  821  1727  10  13  77
 3  0  0  29248   3264  29780  24004   0   0     0     0  762  1696  11   7  82
 2  0  0  29248   3596  29780  24080   0   0    38     0  758  1716  31  18  51
 1  0  1  29248   5564  29536  24152   0   0    45  1016  771  1734  15  10  75
 3  0  1  29248   5208  29536  24228   0   0    38     0  798  1958   6  11  82
 2  0  0  29248   5368  29536  24228   0   0     0   769  766  1788  10  12  78
 3  0  1  29248   5212  29536  24228   0   0     0     0  789  1885   9   8  83
 3  0  0  29248   5460  29536  24304   0   0    39     0  766  1869  10   8  82
 3  0  0  29248   5204  29536  24304   0   0     0  1016  773  1822  11   9  80
 3  0  1  29248   5464  29536  24304   0   0     0     0  772  1860   8  12  80
 2  0  1  29248   5056  29536  24380   0   0    38  1012  784  1808  10   9  80
 1  0  0  29248   5320  29536  24380   0   0     0     0  759  1863  10   7  83
 1  0  1  29248   4984  29536  24456   0   0    38  1014  833  1977  10  12  78
 2  0  0  29248   5308  29536  24456   0   0     0     0  769  1797  10  11  79
 3  0  1  29248   5120  29536  24456   0   0     0     0  760  1763   7  10  82
 3  0  1  29248   5300  29536  24532   0   0    38  1014  775  1722  11  13  77
 2  0  1  29248   4900  29740  24532   0   0     0     0  756  1717  10   9  80
 4  0  0  29248   4164  30672  24532   0   0     0  1015  768  1749  14  10  76
 2  0  1  29248   3076  31424  24608   0   0    39     0  758  1791   6  11  83
   procs                      memory    swap          io     system         cpu
 r  b  w   swpd   free   buff  cache  si  so    bi    bo   in    cs  us  sy  id
 3  0  1  29492   3356  32252  24052   0 122     0   781  894  2059  12  14  74
 5  0  0  29492   2860  33004  23512   0   0    52   515  784  2033  23  13  64
 4  0  0  29492   3196  33840  22512   0   0    26   500  762  1877   8  10  82
 3  0  1  29492   2852  33912  22500   0   0    38   653  765  1843  11  11  79
 2  0  1  29492   2936  34048  22476   0   0    39   500  834  1981  14  10  76
 3  0  1  29492   2728  34356  22024   0   0     0     0  750  1987   9  12  79
 4  0  1  29492   3052  34660  21632   0   0     0   517  774  1876  11  12  78
 3  0  1  29492   2528  35056  21420   0   0    38   500  766  1879  11   9  80
 2  0  0  29492   2800  35232  21232   0   0     0   266  768  1919  11  13  76
 2  0  1  29492   2872  35700  20928   0   0     0     0  750  1853   9  11  79
 2  0  1  29492   2896  35420  20884   0   0    38     0  753  1812  11  11  78
 2  0  0  29492   5076  35620  20740   0   0     0  1052  771  1804  13  11  76
 3  0  1  29492   4988  35624  20816   0   0    39     0  889  2107   2   3  94
 2  0  0  29492   4988  35624  20816   0   0     0  1012  822  1889   3   4  93
 1  0  0  29492   4988  35624  20816   0   0     0     0  836  1925   2   3  95

--------------9AE9CA3CA812B68FB974C4B0--
