Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081B336EDA;
	Tue, 10 Feb 2026 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716587; cv=none; b=RT0a6ZeqwW8h7L62UhVtcQiCl8hsvNtvpPXe2HNXrgpdVStiW+QhkQ+2RWu1UHAWnjOkroUGfVTr5i7jl464SfTY8nuq+0NkcrEuE06ZEfmOyaAP3ZvJwKek16BqYooxgTD1b8kvmiOFbNV35NNhsv08aRcJ6N+2+hWUj8zjHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716587; c=relaxed/simple;
	bh=yG0fXaZ1el3S4yJpuEwyaSIOQHTy+CBbe7wm7+fJHoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5MScTWyugsHSB25C6GI4KHDoOnXF9/7Kgsi5MVlMV5xsGs3YFjBXJ0eGVflo8V+DCBuQgvNlcBZJYKl2RX/P+57qthsPEYkp9pZyzuoUhl1+mM2mFcAac6ehqYe3lYJggrnTk165L9ybNOOIjLH2ihrcfoQHcFirmABcTlu+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=hgkHSqsY; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="hgkHSqsY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92AB3285954;
	Tue, 10 Feb 2026 10:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1770716080; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tnTGXc4ZxWme/f7c8PufrFxcdC19weWJ9hBEXMjV+ZY=;
	b=hgkHSqsYto20bN1LTK1E+45Qok4KIWjB/aEOidk0mF4IlP4PO9mKALJlcW74y/DjBdk4em
	2WdWbQzkdnJmX7U8TtYaSMV7j2kBmLtG+9JtiB6PN4twEc1dS3hwIV9OT94KSoHBigc2Bg
	Ja2lsJBTXB2OqVdKkPWVF17PDqh7TEXjU8O0Qy/h8ShA5P0BZ9+LEabE7PrYmMDgk84cfX
	plh8jwo8UVDbBprhHPKS3k/txEBNsUmNu6mlHWIjS9RxZpkCTXbWnIHqkrJSMrKYzSqc1w
	erfFF8JC30IuuLgr8I+RNiOJdtHz5iGeJryaEkGOXreJmqlERr/p2dudq5Swsw==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)
Date: Tue, 10 Feb 2026 17:34:02 +0800
Message-ID: <20260210093403.21514-1-dnaim@cachyos.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Fixes microphone detection when a headset is connected to the audio jack
using the ALC256.

Cc: stable@vger.kernel.org
Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..9afa52ff5e0c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7057,6 +7057,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
-- 
2.53.0

