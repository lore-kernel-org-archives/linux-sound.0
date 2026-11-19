Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087625;
	b=pS9TxoQouZDE+75/uElp9LmqgCO5993FDYsWkBSD6OMSPbVfL6UiYxSym8bgA2MqHFYf
	 gwJsNjespjRdQRZyMUSKuJtwW7By0c7e1RQlum3zxPpc4fEMeZYtbbakcRl1cYY9gGfD5
	 vQ+idXgebA3m/860s+1lMlDSxPF6FjZijUcSd51M2ts+sxh7vPAWBmPllHhW1thI6t9fW
	 o0//TR6DP76SJb91ZwQZ6C6ZsuRXl72I0xTMqZyQ49Rrb2bsBn+giGvI9JO+CnnF5Jq3M
	 qMuQjXty88da0q8t/Hv7vKiKUc4RPdXZi8PI/UWdofXUzFLmHMILGe7QreT+T4l8fAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087625;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=maz8sM94VwUk8NT7Y1JGoxnrq7u6rtihB08K96h4Vwk=;
	b=EySkgSHHxUDD/aarHkvu8efKl9sGlxGUQhmd6CT/vsfXwz17anu+qKcgqlnyg1dRc1N0
	 EwfTJfxADZmj3syikgY83RA95wk4Rd1HuENd/NqSBqfGywFn0kZM8xVjiwx1bFQD0mzgf
	 oBz6/J1KfahMydAnVQbFlA8NlIJD734Nr9c1wCxX39jn8tzglCq5iSwsCA/H32lCYr02p
	 gCtf2v6kqhEqO8RX3M3mhxfVxY8k6WXkSAaxcYFy3mokLf5lffLqmhyqGxnOkPFRuSF0A
	 g9DTjGikevEctCO60ostIpnBTjS4pLL858iB5dmhLURWdS8F++brdBp2O10tlJmACew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.182
Received: from smtp153-182.sina.com.cn (smtp153-182.sina.com.cn [61.135.153.182])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDCD606A326
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDCD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([112.64.39.13])
	by sina.net (10.54.253.38) with ESMTP
	id 6AFEDCF800002D23; Thu, 19 Nov 2026 19:26:50 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D167776BFC7648599E691F13530D98F6
X-SMAIL-UIID: D167776BFC7648599E691F13530D98F6-20261119-192650
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 1/4] ASoC: codecs: ES8326: Modify Clock Configuration
Date: Thu, 19 Nov 2026 19:26:44 +0800
Message-Id: <20261119112647.6728-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261119112647.6728-1-zhangyi@everest-semi.com>
References: <20261119112647.6728-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Update the clock configuration for MCLK = 12,288,000 and LRCK = 48,000

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 6c2a536dabc9..86d73281070d 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -542,7 +542,7 @@ static const struct _coeff_div coeff_div_v3[] = {
 	{256, 8000, 2048000, 0x60, 0x00, 0x31, 0x35, 0x08, 0x19, 0x1F, 0x7F},
 	{256, 16000, 4096000, 0x20, 0x00, 0x01, 0x35, 0x08, 0x19, 0x1F, 0x3F},
 	{256, 44100, 11289600, 0xE0, 0x01, 0x01, 0x2D, 0x48, 0x08, 0x1F, 0x1F},
-	{256, 48000, 12288000, 0xE0, 0x01, 0x01, 0x2D, 0x48, 0x08, 0x1F, 0x1F},
+	{256, 48000, 12288000, 0x01, 0x00, 0x10, 0x2D, 0x2A, 0x2A, 0x1F, 0x1F},
 	{288, 8000, 2304000, 0x20, 0x00, 0x01, 0x35, 0x8A, 0x1B, 0x23, 0x47},
 	{384, 8000, 3072000, 0x60, 0x02, 0x05, 0x75, 0x8A, 0x1B, 0x1F, 0x7F},
 	{384, 16000, 6144000, 0x20, 0x02, 0x03, 0x35, 0x8A, 0x1B, 0x1F, 0x3F},
-- 
2.17.1

