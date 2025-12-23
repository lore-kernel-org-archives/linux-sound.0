Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.76.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBD52FF67A;
	Tue, 23 Dec 2025 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495546; cv=none; b=DQbjC/z2fetH0F/gNJ12W5HUPwYYIu3eaNdqxzJFglRgB/kbs+abuvJTXYQVKvPagGGms6jrRODkXdCrRSeIx+MXNuWYz78kIAr+7q7ocfhWBt45JX/wfaHCszEcZknF4hKlJE/MLXqVIy68N798ypn/lOYXmPT4u4TV5i8+NME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495546; c=relaxed/simple;
	bh=t6e4iy61d4b4qYIrN4T7aJTIJl4eq59BGlKNhp024WQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type; b=lrqPr0/Xz8oVRt8FMWsHx6GuhRLi6HmyY/oq5IvNz06JX6qcZlmsDipjwINdiHG5bOiM8KWO+ihMNrLDINElKyi0LJ++7ABrNY75dVDEJSZALPVaAIcCuBA7nWWBp9vq8Kf3rLjVwYODMaxsfQ6f/ydh16UEAwL51silVChbxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=b0Q5dXjf; arc=none smtp.client-ip=77.75.76.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="b0Q5dXjf"
Received: from email.seznam.cz
	by smtpc-mxe-5d8b775f4-75s6n
	(smtpc-mxe-5d8b775f4-75s6n [2a02:598:128:8a00::1000:a8b])
	id 79916aabbec3d2507f04fd2a;
	Tue, 23 Dec 2025 14:12:18 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz;
	s=szn20221014; t=1766495538;
	bh=OiMK41e3cnyQAjbpH3Z4GAZM92VrVcpwEK0PjbgCt90=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=b0Q5dXjfsRHRdWF3SFzRetGHYfhjktKGItxmoUmaEGdE1PRHiGsUFPRXsX2hq0Swx
	 oJp150WBS7DlnxdVAn0tiSPtfJlOSOdyic6KRmrqibzV0loXXIfFPBjVgoqQK/dLtf
	 2PBsVIMLfHPIY+du5cspQIbVowPwOilBy9VVLjaZSBWLqlUE+LHKrdTjw00cgfoY6z
	 lHD0UG42Mm5u1a40IUhzgmunhhIhuYJZkp0c49fcN2ymMDKMHYG8qGnm6YYOj0SP3q
	 6mdx1tJCXIcEeBRjgkBJmDJZlTkCGF9PFyhLlHU1iwpzob3eoZJVdJUzfA6FugOhdF
	 giaHHVx3VwYeQ==
Received: from unknown ([89.176.227.181])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Tue, 23 Dec 2025 14:05:55 +0100 (CET)
From: <matouslansky@post.cz>
To: <perex@perex.cz>,
	<tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
Date: Tue, 23 Dec 2025 14:05:55 +0100 (CET)
Message-Id: <ew.6bOzj.272VHi0zCEN.1fIfEp@seznam.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (szn-mime-2.1.91)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add headset mic quirk for Acer Nitro AN517-55. This laptop uses
the same audio configuration as the AN515-58 model.

Signed-off-by: Matou=C5=A1 L=C3=A1nsk=C3=BD <matouslansky@post.cz>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/=
alc269.c
index 171a71457ec3..90b9a20b7d97 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6304,6 +6304,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =3D=
 {
        SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_=
ACER_HEADPHONE_AND_MIC),
        SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIX=
UP_ACER_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXU=
P_HEADSET_MIC),
+       SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro AN517-55", ALC2XX_FIXUP_=
HEADSET_MIC),
        SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACE=
R_SFG16_MICMUTE_LED),
        SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PRED=
ATOR_SPK_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x1025, 0x182c, "Acer Helios ZPD", ALC287_FIXUP_PRED=
ATOR_SPK_CS35L41_I2C_2),
