Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655278;
	b=bwOL0mtlPvz/a7JQcMFMUOI0amlmC4lLtCiA4/sOfFF5cma3lpUrhYToUgeLLineFORD
	 NfXAFV2NtzWRMk3tNU+qpt2iuXKVtr5pF05or4YzAcf3cWYHQ9W1ruGvKXtqUSIUgOqnr
	 KXTI1kPJNo1yV0S5DSsZ/7kz05gDTNmUBRZ3X6CwGqa6CT/nixWU0xVZDyEE/Ve4kIZtN
	 0Njl4XLXn49ErjGFAjTkgh2g7hb1SxlYYib0WVL7ndJ0HYxFEloOS3X0yYRD879Q7d4bD
	 7UTQ/aRdY8AzcxBZTebgL3TEk0iq5q7QNWuolz+xVZAasDzVXpsy67TjcZybueT+8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655278;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=7PW7ECPD4bc5C3ClpuZsk/EQ7o1965F0t1dd+DbC1BU=;
	b=A/UDN8TWqGYrdVUcbNaNdgqJWcWzbYtWiSF3dx3Xo56qRvc/VsUx6THqeCaaPgZfiKKo
	 9kGxWXem3dMe9J2475goMU/ld9pjvYKfJPa/aT5pGWrSXtA6ZsJbPQ8Oeqid0KzvpDdtV
	 XxDTK2tad/y6/h4qzVfVRt+W/Z/kYp6umeQFacQDMuPMnKs9mRYIFBn7z46+Y7GuOiMpS
	 9HQ14IIyBYDGRxHmspzIh/vDh38KsaO2o62ftBSS4N4/EdcORnCwWzmi964PvmiK/clNw
	 rAICiFMCaQR/U9gZGfTch5uXYYbZz3EmDzgNxa2W7aBHGquPQsikJjngQKLzjwPWTVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hGkEeI2H;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AE606A31E
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hGkEeI2H
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261022074754euoutp01d94a1e7f414b10867fbded581a3124b0~gynlbpK5I0129601296euoutp01I
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261022074754euoutp01d94a1e7f414b10867fbded581a3124b0~gynlbpK5I0129601296euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792655274;
	bh=7PW7ECPD4bc5C3ClpuZsk/EQ7o1965F0t1dd+DbC1BU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hGkEeI2HYQcapdlPcjCKJHXE3AFeHNNcKIfB7P2GkUaFT7Cd44LsAcN64cGLSAtu9
	 DHhhbvePh9mTwAOUv/u9xaz0PST94CQc40jPkW9at9fR4h3PsdC8BUuNPU+Yqf9i+J
	 XGbL2Tn2TwaW9Bwo5yVB/rD+f0fQgGh0/fcjShp4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074753eucas1p29c737768bb24a5e208b6973840a1d6ac~gynlFfly82511925119eucas1p2j;
	Thu, 22 Oct 2026 07:47:53 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074753eusmtip2fcea09d9502b8bc9efb9470ef7be5275~gynko_52P0697506975eusmtip2p;
	Thu, 22 Oct 2026 07:47:53 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber
	<aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/4] ASoC: wm8994: don't lose the AIF clock ratio when
 staying at 32kHz SYSCLK
Date: Thu, 22 Oct 2026 09:47:40 +0200
Message-ID: <20261022074743.625223-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022074743.625223-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261022074753eucas1p29c737768bb24a5e208b6973840a1d6ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022074753eucas1p29c737768bb24a5e208b6973840a1d6ac
X-EPHeader: CA
X-CMS-RootMailID: 20261022074753eucas1p29c737768bb24a5e208b6973840a1d6ac
References: <20261022074743.625223-1-m.szyprowski@samsung.com>
	<CGME20261022074753eucas1p29c737768bb24a5e208b6973840a1d6ac@eucas1p2.samsung.com>

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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 94 +++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index b5675eab2214..2cfc2f8a36b0 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2234,6 +2234,44 @@ static int wm8994_get_fll_config(struct wm8994 *control, struct fll_div *fll,
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
@@ -2468,33 +2506,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 
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
@@ -2612,33 +2624,7 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 
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

