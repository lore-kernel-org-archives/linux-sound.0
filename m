Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664155;
	b=G0wCy3f6wVT6Ix6su6fsmruYafm7+ItMeG0IjwgV5Gk/RpjcLnknK/t8o5IsJ1qxY+H0
	 fjFESZfQjDj2OHcJ2wrAYuc6clwYi293D/7UfgCn0OoCvyGzHTn8x+Cs0IGQZLxen0sDN
	 nbEmIeZP6FOZnEycJy5yig/Ec8QGASEg5tVNwO0mR3i1gvK9zWRApTuxEDTC6FRpOpXGr
	 b4uolUPMW+1Xw1vM4rqsAZK+SGSsDRYhVdrcPpXx6WQIm9ozPMaCfBHJasRdAX89h3B+c
	 fmGmZnm1wepNStZHXAmphbCdZpMvwPiPJjIaHJR0vIWQhCGefpOFWL7+QUTgL2rcnZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664155;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=4V9Imh9KopkVM7vMPTgZK5VsMVU1kfb+6wQzwyIBzIw=;
	b=1oCeF5otuLu88pVvfD6jIFM3ZgtWngXCJyNzj4nxcTLQl+SIjECnMTUrKSi7SAj3HLrz
	 zCbtNSvKaQPC0I8jpcMTk8/KHjvtl5rC2nLTjxE6GG1+Sd0tHKDVAmc8jOAzSvN5fioJ/
	 NmSymaDFuLKnm4ACgJ7FVd2peV+O/ZGrzYfyg1dOJkWxNNmuMhis3+B7nyNnjKydNnWFn
	 RrSO4Ly1RBwLueqzlXkgBwjQybTlmScPeT5bnS6bXOfp49rJlo0famx7ZoIOfLM0uCZYA
	 rLZon5ydjJc8rNSa0rOzGL0XiV/lwI0Wykqe3rw2ZGOTuI5NYl6AcSosdb0sDsftDWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IH6dz4Q6;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB13606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB13606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IH6dz4Q6
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261022101551euoutp0178e60b813fa61cb39553796da2296ed3~g0oxMXVKA0124301243euoutp01S
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:15:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261022101551euoutp0178e60b813fa61cb39553796da2296ed3~g0oxMXVKA0124301243euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792664151;
	bh=4V9Imh9KopkVM7vMPTgZK5VsMVU1kfb+6wQzwyIBzIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IH6dz4Q6/qnLtNwgqjmfoK0ianJ3E+okdU212K6axDK6VfPdPi3epGs5LzgNNHstB
	 IJGoDbwboFh7pPux3ZIgNbSvXKSegjI4fOLetC8GsMCNRCMW92A4jB8atxpSNDZGLt
	 GYiYeZRyCZZsOJecQ95eGbNP4ayQtMHTdRrr57S8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022101551eucas1p2c70c5e2a5e70d8c157a11f9a6df3c7d8~g0owvRhJb0396603966eucas1p2G;
	Thu, 22 Oct 2026 10:15:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261022101550eusmtip1dc28f099ba716e65589f893649a6c6a9~g0owTMGFd1859218592eusmtip17;
	Thu, 22 Oct 2026 10:15:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH] ASoC: wm8994: follow AIF clock source changes in MCLK
 gating
Date: Thu, 22 Oct 2026 12:15:28 +0200
Message-ID: <20261022101531.775891-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atnfVHWwQlaiPeb_@sirena.co.uk>
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
X-CMS-MailID: 20261022101551eucas1p2c70c5e2a5e70d8c157a11f9a6df3c7d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022101551eucas1p2c70c5e2a5e70d8c157a11f9a6df3c7d8
X-EPHeader: CA
X-CMS-RootMailID: 20261022101551eucas1p2c70c5e2a5e70d8c157a11f9a6df3c7d8
References: <CGME20261022101551eucas1p2c70c5e2a5e70d8c157a11f9a6df3c7d8@eucas1p2.samsung.com>

The AIF clock source can be changed by configure_aif_clock() while the
AIF clock is running, for example the Midas machine driver switches
AIF1 between MCLK2 and FLL1 while AIF1CLK is kept enabled for jack
detection. aif_mclk_set() only enables the MCLK selected at the time
the AIF clock is turned on, so an MCLK selected later this way is never
enabled, and the codec may run from a stopped clock.

Track whether the AIF clock is running and, if so, enable the newly
selected MCLK in configure_aif_clock() before switching to it, then
release the previously enabled one.

Fixes: 001b83d395ab ("ASoC: wm8994: Add support for MCLKn clock gating")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/wm8994.c | 27 +++++++++++++++++++++++++++
 sound/soc/codecs/wm8994.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8adb3de546dd..6b91e02f130b 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -163,9 +163,12 @@ static void wm8958_micd_set_rate(struct snd_soc_component *component)
 static int configure_aif_clock(struct snd_soc_component *component, int aif)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
+	struct clk *mclk = NULL;
+	bool switch_mclk;
 	int rate;
 	int reg1 = 0;
 	int offset;
+	int ret;
 
 	if (aif)
 		offset = 4;
@@ -174,11 +177,13 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 	switch (wm8994->sysclk[aif]) {
 	case WM8994_SYSCLK_MCLK1:
+		mclk = wm8994->mclk[WM8994_MCLK1].clk;
 		rate = wm8994->mclk_rate[0];
 		break;
 
 	case WM8994_SYSCLK_MCLK2:
 		reg1 |= 0x8;
+		mclk = wm8994->mclk[WM8994_MCLK2].clk;
 		rate = wm8994->mclk_rate[1];
 		break;
 
@@ -196,6 +201,20 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 		return -EINVAL;
 	}
 
+	/*
+	 * If the AIF clock is running, enable the new MCLK before switching
+	 * to it and release the previous one afterwards.
+	 */
+	switch_mclk = wm8994->aif_clk_on[aif] && mclk != wm8994->aif_mclk[aif];
+	if (switch_mclk) {
+		ret = clk_prepare_enable(mclk);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"Failed to enable MCLK for AIF%d\n", aif + 1);
+			return ret;
+		}
+	}
+
 	if (rate >= 13500000) {
 		rate /= 2;
 		reg1 |= WM8994_AIF1CLK_DIV;
@@ -210,6 +229,11 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 			    WM8994_AIF1CLK_SRC_MASK | WM8994_AIF1CLK_DIV,
 			    reg1);
 
+	if (switch_mclk) {
+		clk_disable_unprepare(wm8994->aif_mclk[aif]);
+		wm8994->aif_mclk[aif] = mclk;
+	}
+
 	return 0;
 }
 
@@ -1067,6 +1091,7 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
 	if (!enable) {
 		clk_disable_unprepare(wm8994->aif_mclk[aif]);
 		wm8994->aif_mclk[aif] = NULL;
+		wm8994->aif_clk_on[aif] = false;
 		return 0;
 	}
 
@@ -1086,6 +1111,7 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
 		clk_idx = WM8994_MCLK2;
 		break;
 	default:
+		wm8994->aif_clk_on[aif] = true;
 		return 0;
 	}
 
@@ -1096,6 +1122,7 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
 		return ret;
 	}
 	wm8994->aif_mclk[aif] = wm8994->mclk[clk_idx].clk;
+	wm8994->aif_clk_on[aif] = true;
 
 	return 0;
 }
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index 5b22cfab317e..e7df0a1a2314 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -82,6 +82,7 @@ struct wm8994_priv {
 	struct wm8994 *wm8994;
 	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
 	struct clk *aif_mclk[2];
+	bool aif_clk_on[2];
 	int sysclk[2];
 	int sysclk_rate[2];
 	int mclk_rate[2];
-- 
2.43.0

