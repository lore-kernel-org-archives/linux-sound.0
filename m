Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD5367F25
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210934; cv=none; b=dYo1jsqT/AMaIPF3YSDXQk8R4cyK0kK/5sFcvCTl5CcMkVfjzRgW9hBr6EXzPf//1TjdF5krMeYhdwbFgXIVtPn90VILYiUB5Z0EsYY8pL5AzZbqbaCkG62W9yVQw0+JUpn7dUI0X6Qt9qAIBeQ3d2y0jZBCn+wpuB6pOxcG5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210934; c=relaxed/simple;
	bh=Qk12T13XJOkyhfGlkZjx630hSF0ZL1E+8JpPyfZNezY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TpWvTEJxPOfAaGAVskKaiIoC95xMC2T54+7pzrZhN4g+8RJ3cK2jEK6ae5+Rv91Jhwt2X2OZgcwN9b8PcsOACg/rt37/OewKZLlXrOUGIpZUubh5aQjGNdVKKJloZy7MNeQ4GU5ssW21pgvD6Zsa69tGWjUWO3yXseQwLhUPVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=U3OEEzCD; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="U3OEEzCD"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65NAPFbU43343082, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782210315; bh=p7bKSEwW7Y6IFwRYsldP9hN6SGVtAJIxh5OsN1VFcKQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=U3OEEzCDopbwbHD6MqSslQNUcwMDGcqisQXc5lPRgthCUQrmgt3PEw7EB+mVFKkr1
	 rBZ86CMzUTYYBsxf5xeM7WxepAlj/OZhtIPuHKFoMg/ewftq8TCbnS5F5ywEFZo+Gc
	 sQn+DzBQEOtfkdeHfqISFInH1GIKa+GyQM20gBNbPzCfVjG/e+U0RVpuWuFSBsGsRV
	 X2UrYn+qvUjKFgawwD68/ghZ8/Ck6zObJ3tTD2eRmzSjSYETuKECxip7O3wSnYM62J
	 /7wO7U+J7Dz2bD0ouZz6/YY7sBm0HXI8p7UqgR/gxCVDdtAUVTTpqxR6wiSBrMkEpG
	 0M1nCoVZSp1HA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65NAPFbU43343082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Jun 2026 18:25:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Jun 2026 18:25:16 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Tue, 23 Jun 2026 18:25:16 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <flove@realtek.com>,
	<shumingf@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>, Oder
 Chiou <oder_chiou@realtek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: rt5575: Use __le32 for SPI burst write address
Date: Tue, 23 Jun 2026 18:25:14 +0800
Message-ID: <20260623102514.2422990-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The addr field in the SPI burst write buffer represents on-wire
little-endian data. Define it as __le32 so that the assignment of
cpu_to_le32() is type correct and avoids sparse endian warnings.

Fixes: 420739112e95 ("ASoC: rt5575: Add the codec driver for the ALC5575")
Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202606230139.rFZUVpCa-lkp@intel.com/
Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt5575-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5575-spi.c b/sound/soc/codecs/rt5575-spi.c
index 9a349965435b..d5b3a57c8866 100644
--- a/sound/soc/codecs/rt5575-spi.c
+++ b/sound/soc/codecs/rt5575-spi.c
@@ -17,7 +17,7 @@
 
 struct rt5575_spi_burst_write {
 	u8 cmd;
-	u32 addr;
+	__le32 addr;
 	u8 data[RT5575_SPI_BUF_LEN];
 	u8 dummy;
 } __packed;
-- 
2.54.0

