Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721363;
	b=4xTPlYZuqajCWG/JJt9LdeDKAq19RpoidEePJlAVvgPGDOp6I9T7eDLM4pGmOPlVL9NA
	 L7PmE7TTMPARedReNp/ExqxsNVKo8QCwmNKbLuTWygQTQ4OlGNX8lO2a8hahPA04vhk2/
	 zcaMT8YPqqSmEiyOqE5PLaNtLIRFsotJya7pteWtM1nop6YzsmJ5QEULroA621jWEbX1n
	 ViD5HimZ/fK8AAvNpIGEffn729bcnfjHEwX0zdXIfoIIXfXhvtlvA+3xOBGMKNYQN5HbB
	 1Laxu5+hYzVytXc5eBy88lmhSYgKJcvncDGUa2FCmMNn3g/SZIAN0LcGux/NMyXDdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721363;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=+VlTP35QG9UHjmiD5Bsotzw631DN7W1gt9c9ZoEmEu0=;
	b=NfmKDVE0v/eee7WNVuqcULp1ml1dwsl27QHY7PrPJER5iy2Zq7MK2jaEZcIEAmyHcOkE
	 Su5dQzns6AKTVgXbdmv9dQg7ss3Vvs1NgmWbvcvQuc8P429MMRp6exRclez4zl4DoMTCL
	 0rzfEe+DCg2lOAS8CAH+B09yBIZNarF4TGbYkD1eOCbtRQkUw3VJQBFt85zhXHPGtjzbG
	 AMqaILbAWt+hUOo2GxCtje8qWQzk53a47oA/MGwLmykTbCs7zXz/lHHHcX0NR18hp3L2j
	 vP3ZKy6QLTyV70psSYhNAG8RqC0cq4gNwsNNepyEd9RILEcgMo4mvc4t0RX6vr2+a2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.183
Received: from smtp153-183.sina.com.cn (smtp153-183.sina.com.cn [61.135.153.183])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3EF606A320
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6ADAC1C4000078B5; Fri, 23 Oct 2026 10:09:09 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 25F71D6759E241889A9D6325DD135579
X-SMAIL-UIID: 25F71D6759E241889A9D6325DD135579-20261023-100909
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 1/2] ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
Date: Fri, 23 Oct 2026 10:09:05 +0800
Message-Id: <20261023020906.28958-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023020906.28958-1-zhangyi@everest-semi.com>
References: <20261023020906.28958-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The register related to "ALC Capture Recovery Level" is ES8326_ALC_RECOVERY,
not ES8326_ALC_LEVEL.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 74f276abb..e1e1bfaee 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -353,7 +353,7 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("DRE Gate Volume", ES8326_ADC_DRE_GATE,
 			4, 0x07, 0, dre_gate_tlv),
 	SOC_SINGLE("ALC Capture Switch", ES8326_ALC_RECOVERY, 3, 1, 0),
-	SOC_SINGLE_TLV("ALC Capture Recovery Level", ES8326_ALC_LEVEL,
+	SOC_SINGLE_TLV("ALC Capture Recovery Level", ES8326_ALC_RECOVERY,
 			0, 4, 0, drc_recovery_tlv),
 	SOC_ENUM("ALC Capture Winsize", alc_winsize),
 	SOC_SINGLE_TLV("ALC Capture Target Level", ES8326_ALC_LEVEL,
-- 
2.17.1

