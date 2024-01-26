Received: from out3.rolmail.net (out3.rolmail.net [195.254.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF361DDCF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jan 2024 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.254.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285113; cv=none; b=sFFKhrHti7SKpW6juA9jYtJbKQNyoYGPbDBRjCRwUQR8se6o3Q0Jw94BHhVrhIB/3+k3Z7ZOSxOj3iP14jHMnEhZ52pidLhjuJLhxMpbM7mFD7XRtIwPIiPHjIYetN2qR3AMcTXnVrR3wzYBX8YwxS+sExPgaWuoTgd1sBNnnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285113; c=relaxed/simple;
	bh=3q8CthiwRAlZq9cDw729ibepmQIk3HtDfrEVFGn5bt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMVbtfCXoDSO5PCDyp70UtD7tVRJ6/W3vavliZO/qrQQvzx7R/fFxdtZxi50WjE9rZlBH+Jqaud5fJDSCalasdSIwIjcgUcR6t4W3Vdejg9UV5bugaR9VZBmMmU5YL/JwjRPrqjVS4j8FRyqIbw0vH8xo5MCdKQAqf73HaHeocA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rolmail.net; spf=pass smtp.mailfrom=rolmail.net; dkim=pass (1024-bit key) header.d=rolmail.net header.i=@rolmail.net header.b=ZePEw3Lg; arc=none smtp.client-ip=195.254.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rolmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rolmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rolmail.net header.i=@rolmail.net header.b="ZePEw3Lg"
Received: from mf3.rolmail.net (mf3.rolmail.net [IPv6:2a02:2e8:0:2:0:25:1025:1])
	by out3.rolmail.net (ROL Relay Out) with ESMTP id 231CA19F22F;
	Fri, 26 Jan 2024 16:56:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rolmail.net; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=rol; t=1706284607; bh=3q8C
	thiwRAlZq9cDw729ibepmQIk3HtDfrEVFGn5bt0=; b=ZePEw3LgjLPArThN3++b
	lv7XqwMcEerjQn+xUBAxiFo3h5lPPhdnvGBoQ6+3oYfRcv5PCBV5UAxqjmNY9tu5
	M2x/ofhP1bS8uX5ZtaMSp9D7KC/vYF5zCMrfP7XMVFGK88cBaaEGS+lNj82zbOq4
	hDk4hwL1sjcGgDQAB6C/3VA=
Received: from relay-out1.konmail.net ([195.254.252.217])
	by mf3.rolmail.net (mf3.rolmail.net [195.254.252.162]) (ROL Spam Gateway, port 10022)
	with ESMTP id h92PvNiwBND7; Fri, 26 Jan 2024 16:56:47 +0100 (CET)
Received: from fedora.. (srv-116.vc-graz.ac.at [193.171.126.116])
	by relay-out1.konmail.net (Konverto AG Relay In) with ESMTPSA id 1F30719F138;
	Fri, 26 Jan 2024 16:56:45 +0100 (CET)
From: David Senoner <seda18@rolmail.net>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	seda18@rolmail.net
Subject: [PATCH] ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
Date: Fri, 26 Jan 2024 16:56:26 +0100
Message-ID: <20240126155626.2304465-1-seda18@rolmail.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If you connect an external headset/microphone to the 3.5mm jack on the
  Acer Swift 1 SF114-32 it does not recognize the microphone. This fixes
  that and gives the user the ability to choose between internal and
  headset mic.

Signed-off-by: David Senoner <seda18@rolmail.net>

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
index 42ee37af24bc..f58a8a433370 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9489,6 +9489,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D {
 	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VC=
OPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACE=
R_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54", ALC256_FIXUP_ACER_=
HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x126a, "Acer Swift SF114-32", ALC256_FIXUP_ACER_=
MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIXUP_ACER_=
AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP_ACER_=
AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP_ACER_=
AIO_HEADSET_MIC),
--=20
2.43.0

