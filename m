Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402543CEE9;
	Fri, 24 Jul 2026 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784920207; cv=none; b=co40F98PHP1492kfxtzwIXcUwR/s1S3DliHCTLjb3LDmQVRe2sdKfMMlZBjb/m0zMlie9p8xeYC089id8RrgDK40LPQyZKPFjhjBjZ2vC+AFFGiuds4fYIISuqltLNGy5dcXlzpSWY8e2XYGZ+MNvopwmKrH4tisKrQ1+jLuWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784920207; c=relaxed/simple;
	bh=3EgqLwKGjUrIzv38EtdEeu7AHN5MTseBXhOau8p4Exc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7PSHq9gLrcW/JZgI7Erx4vx8OkzG/IpcMvdmdeba+D3dtQScJo7nZ2AnHs+hH6xt1fTHYPV6srVA0q7y9KBGeTEfiq/TgsL9GXk1RkYs7VGNdtwhjqLP1rLeItsy2QRaii/sm7+HjI1XxZyl0KyKZAhh6Q5wHO4wk/dfHoS1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=FMrSWn/t; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="FMrSWn/t"
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id D74D32FC005B;
	Fri, 24 Jul 2026 21:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784919673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c97bcePPCTq/RviwoxqBYHmuafvVg7yccmQgIOLINMQ=;
	b=FMrSWn/t6kBF9uk0UkA84T0RF20QmhD9Tkw+vwz1aSC2LhVsz8ZxlgL6bxp/ruQ53aGK1w
	q6bEiu4uvP2KrpU2F/KSmN7AyzHeP1h5lpycwCh/SKXp2Owjv5BjDnFQiC5XfiXBvvecIj
	Uh+5N4FxPR7qbuDNhBvz0h7nAaDt4vA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eckhart Mohr <e.mohr@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for TongFang X6SP45xU
Date: Fri, 24 Jul 2026 21:00:13 +0200
Message-ID: <20260724190109.169889-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eckhart Mohr <e.mohr@tuxedocomputers.com>

TongFang X6KK45xU and X6SP45xU have actually different PCI IDs. This patch
Adds the missing PCI ID to fix headphone detection and clarifies the
naming.

Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
Cc: stable@vger.kernel.org
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 sound/hda/codecs/realtek/alc269.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 443bc92c5e4b0..f95588c9c1bfa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7927,7 +7927,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d05, 0x300f, "TongFang X6AR5xxY", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d05, 0x3019, "TongFang X6FR5xxY", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d05, 0x3031, "TongFang X6AR55xU", ALC2XX_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1d05, 0x3034, "TongFang X6xx45xU", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1d05, 0x3033, "TongFang X6SP45xU", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1d05, 0x3034, "TongFang X6KK45xU", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d17, 0x3288, "Haier Boyue G42", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
-- 
2.43.0

