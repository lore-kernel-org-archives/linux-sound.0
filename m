Received: from mx1.trustlab.cz (mx1.trustlab.cz [171.25.222.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792851DF274
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=171.25.222.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672826; cv=none; b=Uz72dNHDUSQs33pVcPbFljB+hITAnC7fJr2+bcotTlH1y2Xkpl+UCBabd7Pw5ypB1YatELK1s1bQiWZDsJe+9c4v1ROe3VfdXvN/1N71t2beP5HmACrvZ+vn8QpKInV+ZL3VJY9q21+WHRk9p93tNBDZdhHJ9elX4XYC0khgiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672826; c=relaxed/simple;
	bh=FMuiFWJGBGtRkuzdecx1cqO2j+3/r2InmxGbkjfMuMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VmYNyd55HRqknHdFlAH9Yk1RYtBfMy9d8BX2kyuagyyLvZeWohKial15GDijvEoek6mrpsSOz+uyNFZGXbLQ4P15NP6UG6rAsSGkcRaYgEMSYweLfMZwfYsZP1lbFy+r5dgt28rhYUge7pDbvbptzxa6DyGQkAl/OP3rbmvpbw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustlab.cz; spf=pass smtp.mailfrom=trustlab.cz; dkim=pass (1024-bit key) header.d=trustlab.cz header.i=@trustlab.cz header.b=WwKfCwRR; arc=none smtp.client-ip=171.25.222.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustlab.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustlab.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=trustlab.cz header.i=@trustlab.cz header.b="WwKfCwRR"
Received: from localhost (localhost [127.0.0.1])
	by mx1.trustlab.cz (Postfix) with ESMTP id BFE0D52C63;
	Thu, 27 Feb 2025 17:13:32 +0100 (CET)
X-Virus-Scanned: amavis at trustlab.cz
Received: from mx1.trustlab.cz ([127.0.0.1])
 by localhost (mx1.trustlab.cz [127.0.0.1]) (amavis, port 10024) with LMTP
 id 3hVVeW4Hw0-i; Thu, 27 Feb 2025 17:13:31 +0100 (CET)
Received: from IO.chodovska.trustlab.local (unknown [82.117.137.78])
	by mx1.trustlab.cz (Postfix) with ESMTPSA id A584D52C51;
	Thu, 27 Feb 2025 17:13:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.trustlab.cz A584D52C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trustlab.cz;
	s=default; t=1740672811;
	bh=FMuiFWJGBGtRkuzdecx1cqO2j+3/r2InmxGbkjfMuMY=;
	h=From:To:Cc:Subject:Date:From;
	b=WwKfCwRRjEV9berU4jF4XYChrInCWv2gq/dsgh/QjDH1X62As885KhiD7IKXUtqc3
	 xF2dS9WmpyXSIPdef/yhTzMzrVlJpZHA8jUZhM8qHwK1qJFQyaGGfbeazQxj1V7GGY
	 TzTPRaE53O3WvEvyw9KfUF+g8Dplmc0nII9W1W3Q=
From: =?UTF-8?q?Daniel=20B=C3=A1rta?= <daniel.barta@trustlab.cz>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	=?UTF-8?q?Daniel=20B=C3=A1rta?= <daniel.barta@trustlab.cz>
Subject: [PATCH] ALSA: hda: Fix speakers on ASUS EXPERTBOOK P5405CSA 1.0  
Date: Thu, 27 Feb 2025 17:12:55 +0100
Message-ID: <20250227161256.18061-2-daniel.barta@trustlab.cz>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Good day,
speakers on ASUS EXPERTBOOK P5405CSA 1.0 are not working out of the box.

After some digging around I have found that this laptop has Cirrus's smart
aplifiers connected to SPI bus (spi1-CSC3551:00-cs35l41-hda).

To get them correctly detected and working I had to modify patch_realtek.c
with ASUS EXPERTBOOK P5405CSA 1.0 SystemID (0x1043, 0x1f63) and add
corresponding hda_quirk (ALC245_FIXUP_CS35L41_SPI_2).

Signed-off-by: Daniel Bárta <daniel.barta@trustlab.cz>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 224616fbec4f..360131dd2d06 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10699,6 +10699,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1f1f, "ASUS H7604JI/JV/J3D", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1f63, "ASUS P5405CSA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x31d0, "ASUS Zen AIO 27 Z272SD_A272SD", ALC274_FIXUP_ASUS_ZEN_AIO_27),
-- 
2.47.2

