From: Jonathan Oppenheim <jono@Phys.UAlberta.CA>
Date: Wed, 03 May 2000 04:33:16 +0000
Subject: Re: Sound devices in /dev/
Message-Id: <marc-linux-sound-95732874214157@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95731069101401@msgid-missing>
In-Reply-To: <marc-linux-sound-95731069101401@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

i would have thought that sndconfig would have made those
devices, but maybe it just instals  the driver.

did you run it?

j

On Tue, 2 May 2000, Craig Wright wrote:

>
>
>Hi,=20
>
>I just got a soundblaster 16 pci and after some trouble got it working a=20
>little bit.  I can play CD's with workman and the sound comes out of the
>card.  That's good :), but I'm missing /dev/audio and /dev/sndstat and any
>other sound device that I may need.  (I don't know what the others may
>be, /dev/dsp?)  Anyway I've run /dev/MAKEDEV and nothing new is created.
>I'm at a hurdle I can't jump by myself.  Can anyone help me?  I've tried
>using mknod myself, but don't know why they mean by minor and major device
>numbers mean. =20
>
>Here is the output from the kernel on bootup:
>
>es1371: version v0.19 time 00:44:39 May  1 2000
>es1371: found adapter at io 0xe000 irq 5
>es1371: features: joystick 0x200
>es1371: codec vendor CRY revision 19
>es1371: codec features Headphone out 20bit DAC 18bit ADC
>es1371: stereo enhancement: Crystal Semiconductor 3D Stereo Enhancement
>
>and here is the output from lspci. =20
>
>
>00:00.0 Host bridge: Acer Laboratories Inc. [ALi] M1541 (rev 04)
>00:01.0 PCI bridge: Acer Laboratories Inc. [ALi] M5243 (rev 04)
>00:02.0 USB Controller: Acer Laboratories Inc. [ALi] M5237 USB (rev 03)
>00:07.0 ISA bridge: Acer Laboratories Inc. [ALi] M1533 PCI to ISA Bridge [=
Aladdin IV] (rev c3)
>00:08.0 Multimedia audio controller: Ensoniq ES1371 [AudioPCI-97] (rev 08)
>00:0a.0 VGA compatible controller: S3 Inc. 86c325 [ViRGE] (rev 06)
>00:0f.0 IDE interface: Acer Laboratories Inc. [ALi] M5229 IDE (rev c1)
>
>
>I think this is all relevant, but I don't know for sure.  Can anyone help?
>
>Thanks in advance,=20
>
>--=20
>Craig            =20
><spiral@cs.unm.edu>
>

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: 2.6.2

mQCNAzc5/rwAAAEEALGi/cKupURWMeRs3xKx7+3PHi1hqfswOuM5suJhTEJZiR+p
xYsVYB/B/uNwrr+m+Rzd8sEJlB2D/JkkCHMUplDR2OC0hfUYmQGIXEg9kShudRsO
E+1oVFFevj6MTgIY6c5nSWvz3n+zLHrcHk/k8pLDpI6qcIGqrAEcX2GVzVwNAAUR
tARqb25vtBU8am9ub0BwaHlzaWNzLnViYy5jYT4=FDxR
-----END PGP PUBLIC KEY BLOCK-----
