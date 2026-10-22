Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655276;
	b=n04mWzPMJulXXmI8GC06qaa34Ky1bmkbRzJxe7NuprYYGDlUja+TFMrGQtSYiGEY+39K
	 mWfs8JrTTgKLcYCq2u3wjjSmLdu/evP9FkBy3PeAQ+f02X7DW3EmRr7XIwooQX5xXcCEN
	 oSrt6bIyxIJ4w34ipw1I9jO1HFgDz6gJa3PL/pwX86HRsu+uMb58D4tdhXG8XjH+oahsg
	 HGYJnoGNfFfHjhdNEgYRJlrWalCC/JVmsdKqQFTSf8T8f45mg8kmPSWfKeEJNajYwp47j
	 azKXU7NXAQzK2EAIW5F9OZ0BLUAIzoB7bfhOmxsj2wLmOOniWxhEqID3XogyGSz8MUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655276;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=nQSbSypt5xknqyzhuTgDiODUnVCXr57mHIvu/Q2ATx4=;
	b=BrdQ1CpYViMr4fJn+HeRzXr7g5Httw33jZQQn3sTFoNX1DfIy1QZyJ9LJQZkV6PVYpFa
	 MOwhpNoH51g6G/Xgh96dgraUyPltWOTgKGRkWn2LbMDNYaeatjIesufFhXtnGzFIx7ppf
	 hsN+b0ygJ1Gb3i8HN00TId5sro98Euh0nrdQg9ukDqwCXs6eEvYXcxazInX85wrCyCgn1
	 TDI8cCqUuVOHJ27oPv7ownKMBhjjIUev3FsGe2E7m4bxwYqTq20PxV7QkUUEDVv0c8GDm
	 vfz9wmuv/brq9vRyswRoJ3q4ufYON+mMaaHh6ZmO98gGWzFPfXdHZ+FdGGPV9/RbkXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=V4eZzJrG;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46356606A31D
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46356606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=V4eZzJrG
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261022074753euoutp0209362aafba0b3f5a4199e71225af9f98~gynk3Z1K41298612986euoutp02y
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261022074753euoutp0209362aafba0b3f5a4199e71225af9f98~gynk3Z1K41298612986euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792655273;
	bh=nQSbSypt5xknqyzhuTgDiODUnVCXr57mHIvu/Q2ATx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V4eZzJrGEiZ3JFzPl7JaORopQvXxB895VX3l8Nwsmv7RLi5dvjyRhXm/YvVTwkHZp
	 xkG/VVo6TZIW1t6CknPmGd5giNkraKE9hnPCTNWR5+ySida4UzaHdc/o2ibVmeeGta
	 bFRz6zC8OWpwOQsUz6Ies0DfCUo6CjNx+nl7ci+w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074753eucas1p26ebe5f299d94a00260716a4f137f21b5~gynkju7-l0762707627eucas1p20;
	Thu, 22 Oct 2026 07:47:53 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074752eusmtip2a6ed4cb1b696843a287c3c092b8193a4~gynkHptts1017810178eusmtip2P;
	Thu, 22 Oct 2026 07:47:52 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber
	<aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 1/4] ASoC: wm8994: fix MCLK gating for AIF clocks sourced
 from MCLK2
Date: Thu, 22 Oct 2026 09:47:39 +0200
Message-ID: <20261022074743.625223-2-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261022074753eucas1p26ebe5f299d94a00260716a4f137f21b5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022074753eucas1p26ebe5f299d94a00260716a4f137f21b5
X-EPHeader: CA
X-CMS-RootMailID: 20261022074753eucas1p26ebe5f299d94a00260716a4f137f21b5
References: <20261022074743.625223-1-m.szyprowski@samsung.com>
	<CGME20261022074753eucas1p26ebe5f299d94a00260716a4f137f21b5@eucas1p2.samsung.com>

aif_mclk_set() masks the AIFnCLK_SRC field of the AIFn clocking
register, but compares the result with unshifted field values. The
MCLK2 source (0x08) therefore never matches, so MCLK2 is never enabled
for an AIF clocked from it, and the AIF relies on other users of that
clock to keep it running.

On the Exynos4412 Trats2 board, AIF1 and SYSCLK run from MCLK2, the
32768Hz PMIC clock, while the codec is idle. That clock is shared with
the WLAN and Bluetooth chips, which enable it only once their drivers
are loaded. Until then the codec runs from a stopped clock: FLL1 fails
to lock when configured from that state, and the codec floods the
kernel log with FIFO error interrupts once a digital path is powered
up:

 wm8994-codec wm8994-codec: Timed out waiting for FLL lock
 wm8994-codec wm8994-codec: FIFO error

Booting with clk_ignore_unused, which keeps that clock running from
the bootloader, makes both issues disappear.

Fixing just the comparison is not enough. The AIF clock source can
be changed by configure_aif_clock() while the AIF clock is running,
for example the Midas machine driver switches AIF1 between MCLK2 and
FLL1 while AIF1CLK is kept enabled for jack detection. The MCLK
selected this way is never enabled, and looking up the clock again on
disable can release a different MCLK than the one enabled, leaking the
enable count of one clock and underflowing the other.

Shift the field value before decoding it, and remember which MCLK has
been enabled for each AIF, so that the same clock is released on
disable. When the AIF clock source is changed while the AIF clock is
running, enable the new MCLK before switching to it and release the
previous one afterwards. While at it, report the MCLK number 1-based
in the error message.

Fixes: 001b83d395ab ("ASoC: wm8994: Add support for MCLKn clock gating")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/wm8994.c | 55 ++++++++++++++++++++++++++++++++-------
 sound/soc/codecs/wm8994.h |  2 ++
 2 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c65a7769a9d2..b5675eab2214 100644
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
 
@@ -1059,13 +1083,25 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
 	unsigned int offset, val, clk_idx;
 	int ret;
 
+	/*
+	 * The AIF clock source may be changed while the AIF clock is
+	 * running, so release the MCLK which has been enabled for it
+	 * instead of the one currently selected.
+	 */
+	if (!enable) {
+		clk_disable_unprepare(wm8994->aif_mclk[aif]);
+		wm8994->aif_mclk[aif] = NULL;
+		wm8994->aif_clk_on[aif] = false;
+		return 0;
+	}
+
 	if (aif)
 		offset = 4;
 	else
 		offset = 0;
 
 	val = snd_soc_component_read(component, WM8994_AIF1_CLOCKING_1 + offset);
-	val &= WM8994_AIF1CLK_SRC_MASK;
+	val = (val & WM8994_AIF1CLK_SRC_MASK) >> WM8994_AIF1CLK_SRC_SHIFT;
 
 	switch (val) {
 	case 0:
@@ -1075,19 +1111,18 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
 		clk_idx = WM8994_MCLK2;
 		break;
 	default:
+		wm8994->aif_clk_on[aif] = true;
 		return 0;
 	}
 
-	if (enable) {
-		ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
-		if (ret < 0) {
-			dev_err(component->dev,	"Failed to enable MCLK%d\n",
-				clk_idx);
-			return ret;
-		}
-	} else {
-		clk_disable_unprepare(wm8994->mclk[clk_idx].clk);
+	ret = clk_prepare_enable(wm8994->mclk[clk_idx].clk);
+	if (ret < 0) {
+		dev_err(component->dev,	"Failed to enable MCLK%d\n",
+			clk_idx + 1);
+		return ret;
 	}
+	wm8994->aif_mclk[aif] = wm8994->mclk[clk_idx].clk;
+	wm8994->aif_clk_on[aif] = true;
 
 	return 0;
 }
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index b28398aa9e48..e7df0a1a2314 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -81,6 +81,8 @@ struct wm8994_priv {
 	struct wm_hubs_data hubs;
 	struct wm8994 *wm8994;
 	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
+	struct clk *aif_mclk[2];
+	bool aif_clk_on[2];
 	int sysclk[2];
 	int sysclk_rate[2];
 	int mclk_rate[2];
-- 
2.43.0

