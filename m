From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Fri, 20 Sep 2019 13:40:53 +0000
Subject: [PATCH] ALSA: hda - Add laptop imic fixup for ASUS M9V laptop
Message-Id: <20190920134052.GA8035@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The same fixup to enable laptop imic is needed for ASUS M9V with AD1986A
codec like another HP machine.

Signed-off-by: Shih-Yuan Lee (FourDollars) <fourdollars@debian.org>
---
 sound/pci/hda/patch_analog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
index e283966bdbb1..bc9dd8e6fd86 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/pci/hda/patch_analog.c
@@ -357,6 +357,7 @@ static const struct hda_fixup ad1986a_fixups[] =3D {
=20
 static const struct snd_pci_quirk ad1986a_fixup_tbl[] =3D {
 	SND_PCI_QUIRK(0x103c, 0x30af, "HP B2800", AD1986A_FIXUP_LAPTOP_IMIC),
+	SND_PCI_QUIRK(0x1043, 0x1153, "ASUS M9V", AD1986A_FIXUP_LAPTOP_IMIC),
 	SND_PCI_QUIRK(0x1043, 0x1443, "ASUS Z99He", AD1986A_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x1043, 0x1447, "ASUS A8JN", AD1986A_FIXUP_EAPD),
 	SND_PCI_QUIRK_MASK(0x1043, 0xff00, 0x8100, "ASUS P5", AD1986A_FIXUP_3STAC=
K),
--=20
2.17.1


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEqLZfH4yXKLbSNdjT6exG9aVH8x4FAl2E1t4ACgkQ6exG9aVH
8x4qXw//e/TEOjnSyNYumpgouLVckK27XWthxc5EBuOtb99imQ6OPXGSdxx1fXlb
HqF4XFv/aNb3IRfKxV8sus8+XtIm4ChInmiRpal92tc/oJTdboe0dYkvVZxWs+93
9fEyMWF/PsyvCYhWjyFB2Yj8WxWJYyQ12x69iDXRNd2rkFa8fh2qfOJsCapnlHa4
zxrF7Y3FL2d8XrEf08V1W7EkgJ2Vz+ZRa5E7O+fLwJYxMz5fvm85a9Jv2KuP/5Ko
m4pBKKaP6hEgQKE0GWRv5WTyZ/cn09NDYa484zSMqe1ljp4D0fZFotwhxNn4uTUI
miGIeuvkdVxFomDRjJ/gBvogFsUz1r/Cllj0KhQtXFiZJUF0VOwSOxWTOVr2+h+s
i75rfnMsojmQ2Ls5lJ6+YhkUnT7bA23o4fgP1GOsG7cHG6F8Y20wf3534bg+EbFQ
BfgpOsbTHdSDsyovyRPvAG6k9CAZPamzJZNreP0a9yKXxOTITSL3HTL2VcdgaGS4
OmQBgGxnbZ+lFtObn0NKNfwDE/6Vw6IM/L+rBmIMTkfc6THs9Di94lurKQCdv9Iu
hMY/M5zEvr0nMPBloEz9IPmIFFW2OCD04AzjxDkK3E09LWF1XCLNpQKFJuQhPosC
mXX/3UaQX3a6iEliDDgUEwgn67IvioTXL1JLmL7NkpXtYt+/EJU=
=fVax
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
