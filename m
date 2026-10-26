Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993736;
	b=uAp1HS4EVhI/sNeLrDTQKxbiGUQf6IbSr09hYLoP7UMZmW+cXy/XiwORl0bFE/k6PQCx
	 ZZ9ltVxm6vo9VFNYhdhNYDP8cC3guCN6E93+tghRU9J4EIyCWMHH1xWqR+U3PkV9V52lK
	 A6TESbV1WzptKDNL1a1hn9tGQAJQdGKd2hGgqRiN8WVQ4ZPXiBe2imS9MnTP2Y5nYW9pJ
	 6y0QfmxsOo2wcsLUFWozXmaR1xKUcDSwlWnqv4DOBa9ciQyq8MBZYfbo4zRsMBiyAqfMX
	 yfq2wZJLGfhJmZxncKUi3x/aV0gE5qSQwTR03wFSp7baseewBtgyyigNLO6N7SAHdYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993736;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=BfT5iLUdHsNyFkmRKHwtD0KKorp4PUnu6GC1g0A/RhY=;
	b=5AjUgpFFMJZ7ii9fwyQtdyNF567dnEajFT5ciymY9QvmTHVViHrmGVNYlGYqE87ILoRg
	 PUDBx1iPox3nai2mT3RUCaEzViH6SsjAe2hwDC0zolctdE72czQOUIxs1Qk0cYQRY6krB
	 NS8uHVkPePIweUt0rOqcKf4/xx2PA6BFYgL/1LfA6tqrcMpqTuohD85wTKmHj7f3lFqfd
	 lLJupBoGGI+3i+W6G3GkQAoPdEkGl73fAKEmtfMjD/tsyzFfSEtW0KD7uyimrcFh9zjaJ
	 6c2nZFTZN7CUghnditQ0FIYUOVzkM6CnXmgvsgTOdZ9y4jUyg+XiDwpvJbby8hZScLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.140
Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEEC606A320
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 05:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DEEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6ADEE9B80000797E; Mon, 26 Oct 2026 13:48:42 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4C67C4FD30E84E3B85CB1128ACB88536
X-SMAIL-UIID: 4C67C4FD30E84E3B85CB1128ACB88536-20261026-134842
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	sammiee5311@gmail.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 1/2] ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
Date: Mon, 26 Oct 2026 13:48:36 +0800
Message-Id: <20261026054837.13618-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026054837.13618-1-zhangyi@everest-semi.com>
References: <20261026054837.13618-1-zhangyi@everest-semi.com>
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

Fixes: 5c439937775d ("ASoC: codecs: add support for ES8326")
Reviewed-by: HyeongJun An <sammiee5311@gmail.com>
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

