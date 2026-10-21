Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577905;
	b=kJG2GL6vMkokxwsm29LJXcVwixode0QgPSZveFlNSx2X/zGHgDSUGmq/EZjlQPZEu5vn
	 zT6oLC4VxWh2A65+LaQtbrWQs4yHfRX5FxdHpWN/54Y5gOH8LDtItgahULGpFBKSp7/Ri
	 JnKr5udPn9p21bnNW6D9YCyWhH9x5pT1HzLsYZTs7i6C4l8FpYBLZ63AndFtmBLHh+dPv
	 ALBNqhf4ITCi/MxJHmvC5UXxa/KWdrbou7IgIrTMQdDXq7kPR5r8WEPCGwv/8nkPld7Jh
	 pLX60Z6hMiF1YSRoll3sO+71andpcBb9aVbeXYj0mU8qZoVMCpD22Ku3/VgMfJUEQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577905;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=/htmzptqMRFVDKc3XYETYmFFUnlKuLOt5VQFPWMBz38=;
	b=dZg9jKOMtKE9UXBkKbeSuIhluhxj8DXIor1wEG2oCKvjJAy8ndNS8NqTE2BNDIz0Q/xM
	 k9rMrbj8nX0SxGE1iex5bb0vlepBVFnccMc3PCbgLC4WFG3b7wwekxJClu+Z+x55ivMBE
	 p50h7LdAu4NASGAKLWs6Cf9591+5bV7L6XsRkAMOV7vWD/kw4rQ+hf2VGKMlGpFwxnezn
	 ppf4xjdhTU7gve3YfuB3dSNw7XusWxMM7HVmg3I8YowOdE0VugVn/0aONIvtwQLnKhtCB
	 /rUNTXQHrjo3VbNC2WB4uqoWg7EzoawFDQytCtycVOZVMwA6QIqBbMvJmyT4fzG9tYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="gtJ9Z/vA";
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8D606A31B
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D8D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=gtJ9Z/vA
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021101816euoutp0109741c61ad968320dd76861cb892486a~ghBmOp-Y81013310133euoutp01f
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021101816euoutp0109741c61ad968320dd76861cb892486a~ghBmOp-Y81013310133euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792577897;
	bh=/htmzptqMRFVDKc3XYETYmFFUnlKuLOt5VQFPWMBz38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtJ9Z/vAl/k3btlCw/G4fPetofmJa3Clhv8FghZFbr6PDO4Ed38rUu3Wq+DeKEuFb
	 4HWRzOC5p4inZjF+W5kUdLSh31Uoo+najtJM/4+3YSbiMgDC3Lg0gSZ4U7ObehNL2Q
	 QC8shRaseWWKQ4duQdr94Rv9btvPaVpJ4vNDWuBM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225~ghBlgiU6q3268432684eucas1p1I;
	Wed, 21 Oct 2026 10:18:16 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261021101815eusmtip2f160d57c2bfd7b2d35d03d1e93a6b60a~ghBlBKEx40104301043eusmtip2j;
	Wed, 21 Oct 2026 10:18:15 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>,
	Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ASoC: wm8994: fix MCLK gating for AIF clocks sourced
 from MCLK2
Date: Wed, 21 Oct 2026 12:17:42 +0200
Message-ID: <20261021101750.3297770-2-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225
X-EPHeader: CA
X-CMS-RootMailID: 20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225@eucas1p1.samsung.com>

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
be changed while the AIF clock is running, for example the Midas
machine driver switches AIF1 between MCLK2 and FLL1 while AIF1CLK is
kept enabled for jack detection. Looking up the clock again on disable
can then release a different MCLK than the one enabled, leaking the
enable count of one clock and underflowing the other.

Shift the field value before decoding it, and remember which MCLK has
been enabled for each AIF, so that the same clock is released on
disable. While at it, report the MCLK number 1-based in the error
message.

Fixes: 001b83d395ab ("ASoC: wm8994: Add support for MCLKn clock gating")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/codecs/wm8994.c | 28 ++++++++++++++++++----------
 sound/soc/codecs/wm8994.h |  1 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c65a7769a9d2..e21adcaf3477 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -1059,13 +1059,24 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
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
@@ -1078,16 +1089,13 @@ static int aif_mclk_set(struct snd_soc_component *component, int aif, bool enabl
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
 
 	return 0;
 }
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index b28398aa9e48..5b22cfab317e 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -81,6 +81,7 @@ struct wm8994_priv {
 	struct wm_hubs_data hubs;
 	struct wm8994 *wm8994;
 	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
+	struct clk *aif_mclk[2];
 	int sysclk[2];
 	int sysclk_rate[2];
 	int mclk_rate[2];
-- 
2.43.0

