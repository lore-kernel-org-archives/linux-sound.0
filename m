Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577906;
	b=cMYuLIPUyGtltMnOph+ywoam5LK6pNSOCC6qz3iixVV0m//0s8pUSmPnfZx5ojKcQ1nA
	 K4Jqvbc5B9GAmc5FYMg5AtM5FUiwb8iQ4qNKNexUR9vdlHICrp4j7NkQX3PqAcTvTzMeJ
	 zPIbp81aTlq2Hj+p7LTL1xU7Xw+jcypSTNkxh7qRGH0AGFCdubDBOxdCx1eNqOJCx4tRf
	 o9AQtn3uC5I52iDDdY3FItAjHWrnsBkXlVhYZrdzO61wc5/FxckjZlNJd06Y1ML+s+jfS
	 pYWb/iN1gIylxWlJM4T/OZjg26F6To1wrNuwiD7DEY5hTRJiamdFQUxKadYYy+Vus9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577906;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=QRlH0wV0noraHoLegFXUs1NI1N9z/quV0BWtsab6RHs=;
	b=2/LsnPdOUd39BwU1OV51UaTYS7sN+BsR5AazrWzfWO/v6QB/X5z8QEm9BAn1enZGGUFO
	 vxAEzCDmTFxfYyXU1UQa0JiED+c0CPljxQVtq+IeQDx24y9qYVsQ2v6pUo3QbrxqUWUkT
	 NW32QkvoZBYzIactEx416U9qpdZQqg02UZepfM/WpEFHCQDpHh80z36ztnGj5gTTGqEti
	 3x5GvuQ0LNFErehcVLc4qjA4J9tPHJOkGT9vmoCDfnYJ77BNEJvF8ZO8Wh3obdbFFGCtQ
	 vsk3GsD232lbWttKxMaON0GnzEG+OHkQUsaTBSgPR4OvQp6qrLInU6NgbhLx0Ja+IAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="Y81Zf/wu";
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE8606A31A
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Y81Zf/wu
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021101817euoutp010b8cee0d06647bddfd904e791697dcbc~ghBmXam2j1013310133euoutp01g
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021101817euoutp010b8cee0d06647bddfd904e791697dcbc~ghBmXam2j1013310133euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792577897;
	bh=QRlH0wV0noraHoLegFXUs1NI1N9z/quV0BWtsab6RHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y81Zf/wuWDA2hRrUSxmITlTZgCUDbM3vXYvYjoueYNI4uUOOHw4GIJyG2T00w/Rds
	 3HbLPTGSM07VPDbVBCEba1GQkHaEn7ojq5W9KDWhdpOXOQQVSBzFZjeu3FaKxNyZJ9
	 MsY586EwGO9yx4iPYRf2Sx9M6Rdp//56G6aaEUyE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931~ghBmFwaLZ3268432684eucas1p1J;
	Wed, 21 Oct 2026 10:18:16 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261021101816eusmtip20581000b5ac8bf76d95a80d643a96b77~ghBlmBAgD0104301043eusmtip2k;
	Wed, 21 Oct 2026 10:18:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>,
	Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ASoC: wm8994: don't lose the AIF clock ratio when
 staying at 32kHz SYSCLK
Date: Wed, 21 Oct 2026 12:17:43 +0200
Message-ID: <20261021101750.3297770-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021101750.3297770-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931
X-EPHeader: CA
X-CMS-RootMailID: 20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931@eucas1p1.samsung.com>

When SYSCLK drops below 50kHz, the AIFnCLK rate ratio is saved and
temporarily lowered to 128fs for accessory detection, then restored
once SYSCLK gets fast enough again. The ratio is however saved again
on each clock reconfiguration done while SYSCLK is still slow, which
overwrites the original ratio with the 128fs one.

This happens on the Exynos4412 Trats2 board, which set MCLK2 as SYSCLK
twice during the card probe and then configure FLL1 while still running
from MCLK2. Once SYSCLK is switched to FLL1, the 128fs ratio is
"restored", so AIF1 is left configured for 48kHz at 128fs while being
clocked at 256fs. If any digital path is powered up before a stream
reconfigures the AIF, the codec raises FIFO error interrupts every
10ms, flooding the kernel log:

 wm8994-codec wm8994-codec: FIFO error

Save the original ratio only when entering the low SYSCLK mode. While
at it, move the code duplicated in _wm8994_set_fll() and
wm8994_set_dai_sysclk() to a common helper.

Fixes: 6730049a4763 ("ASoC: wm8994: Lower AIFnCLK divisor when dropping to 32kHz")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/wm8994.c | 94 +++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index e21adcaf3477..e4ea9d41107b 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2207,6 +2207,44 @@ static int wm8994_get_fll_config(struct wm8994 *control, struct fll_div *fll,
 	return 0;
 }
 
+/*
+ * If SYSCLK is less than 50kHz adjust AIFnCLK dividers for detection,
+ * restoring the original ones once SYSCLK is fast enough again.
+ */
+static void wm8994_update_aif_clk_rate(struct snd_soc_component *component)
+{
+	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+
+	if (max(wm8994->aifclk[0], wm8994->aifclk[1]) < 50000) {
+		/* Don't overwrite the saved dividers with the 128fs ones */
+		if (!wm8994->aifdiv[0]) {
+			dev_dbg(component->dev, "Configuring AIFs for 128fs\n");
+
+			wm8994->aifdiv[0] = snd_soc_component_read(component,
+								   WM8994_AIF1_RATE)
+				& WM8994_AIF1CLK_RATE_MASK;
+			wm8994->aifdiv[1] = snd_soc_component_read(component,
+								   WM8994_AIF2_RATE)
+				& WM8994_AIF1CLK_RATE_MASK;
+		}
+
+		snd_soc_component_update_bits(component, WM8994_AIF1_RATE,
+				    WM8994_AIF1CLK_RATE_MASK, 0x1);
+		snd_soc_component_update_bits(component, WM8994_AIF2_RATE,
+				    WM8994_AIF2CLK_RATE_MASK, 0x1);
+	} else if (wm8994->aifdiv[0]) {
+		snd_soc_component_update_bits(component, WM8994_AIF1_RATE,
+				    WM8994_AIF1CLK_RATE_MASK,
+				    wm8994->aifdiv[0]);
+		snd_soc_component_update_bits(component, WM8994_AIF2_RATE,
+				    WM8994_AIF2CLK_RATE_MASK,
+				    wm8994->aifdiv[1]);
+
+		wm8994->aifdiv[0] = 0;
+		wm8994->aifdiv[1] = 0;
+	}
+}
+
 static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 			  unsigned int freq_in, unsigned int freq_out)
 {
@@ -2441,33 +2479,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 
 	configure_clock(component);
 
-	/*
-	 * If SYSCLK will be less than 50kHz adjust AIFnCLK dividers
-	 * for detection.
-	 */
-	if (max(wm8994->aifclk[0], wm8994->aifclk[1]) < 50000) {
-		dev_dbg(component->dev, "Configuring AIFs for 128fs\n");
-
-		wm8994->aifdiv[0] = snd_soc_component_read(component, WM8994_AIF1_RATE)
-			& WM8994_AIF1CLK_RATE_MASK;
-		wm8994->aifdiv[1] = snd_soc_component_read(component, WM8994_AIF2_RATE)
-			& WM8994_AIF1CLK_RATE_MASK;
-
-		snd_soc_component_update_bits(component, WM8994_AIF1_RATE,
-				    WM8994_AIF1CLK_RATE_MASK, 0x1);
-		snd_soc_component_update_bits(component, WM8994_AIF2_RATE,
-				    WM8994_AIF2CLK_RATE_MASK, 0x1);
-	} else if (wm8994->aifdiv[0]) {
-		snd_soc_component_update_bits(component, WM8994_AIF1_RATE,
-				    WM8994_AIF1CLK_RATE_MASK,
-				    wm8994->aifdiv[0]);
-		snd_soc_component_update_bits(component, WM8994_AIF2_RATE,
-				    WM8994_AIF2CLK_RATE_MASK,
-				    wm8994->aifdiv[1]);
-
-		wm8994->aifdiv[0] = 0;
-		wm8994->aifdiv[1] = 0;
-	}
+	wm8994_update_aif_clk_rate(component);
 
 	return 0;
 }
@@ -2585,33 +2597,7 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 
 	configure_clock(component);
 
-	/*
-	 * If SYSCLK will be less than 50kHz adjust AIFnCLK dividers
-	 * for detection.
-	 */
-	if (max(wm8994->aifclk[0], wm8994->aifclk[1]) < 50000) {
-		dev_dbg(component->dev, "Configuring AIFs for 128fs\n");
-
-		wm8994->aifdiv[0] = snd_soc_component_read(component, WM8994_AIF1_RATE)
-			& WM8994_AIF1CLK_RATE_MASK;
-		wm8994->aifdiv[1] = snd_soc_component_read(component, WM8994_AIF2_RATE)
-			& WM8994_AIF1CLK_RATE_MASK;
-
-		snd_soc_component_update_bits(component, WM8994_AIF1_RATE,
-				    WM8994_AIF1CLK_RATE_MASK, 0x1);
-		snd_soc_component_update_bits(component, WM8994_AIF2_RATE,
-				    WM8994_AIF2CLK_RATE_MASK, 0x1);
-	} else if (wm8994->aifdiv[0]) {
-		snd_soc_component_update_bits(component, WM8994_AIF1_RATE,
-				    WM8994_AIF1CLK_RATE_MASK,
-				    wm8994->aifdiv[0]);
-		snd_soc_component_update_bits(component, WM8994_AIF2_RATE,
-				    WM8994_AIF2CLK_RATE_MASK,
-				    wm8994->aifdiv[1]);
-
-		wm8994->aifdiv[0] = 0;
-		wm8994->aifdiv[1] = 0;
-	}
+	wm8994_update_aif_clk_rate(component);
 
 	return 0;
 }
-- 
2.43.0

