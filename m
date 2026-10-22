Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655277;
	b=JbdSbr9HTTpljqmYUkMKFz6csMsLcGnXx8QQlyfUHHy6EqE+QqeEM9gXgxK4t0ajl8xM
	 ZdkhrSYWYr3mk4iGv4dGpb0QHPWe6WazxZvaZ6bAN4S9zdfB0XadSJyGsjNxNwhkyMolU
	 ET1KLxfmRLjf4lTG0Veye3h+Gb7LjYPOBtB1IBbkoIy0xSgu7faMeak3KRBu3ihQf/yCW
	 lkHOSTLt8MCLMjtA9JfTmO+YpDQ7LuF1WELeGQBFECSK5pke1xUXbA3e0caGk2YUtPKmp
	 rtSf2DAv9mlD0m1JedMxRZY/8wVcYMDz7i+LGzplZzczfBjq6RJegHK6SMkPivvFoCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655277;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=VqywLVpdHjTrvx2+XNnWfsYamv0qjE56AE6iewW/pUc=;
	b=PdTNByexJK7Miqu0+zpnGbmK/YqUIXO+pUXTlLoek8CEWmaXkoSwaHyoiMJBdqX49Dw2
	 2eIaynObY2pDyDOhnUfzAbN8/kiwNYvMNcUX3Gp8ciqbSmUbO06N8oCpZDcobO+9IbLf/
	 e6C78ilf7/FRg/dQ0vkzFQJ6N1XtDEIp3fEVXfnd5ziHT+wnUDFepWKwR3dcYf9f/b2hg
	 uYzUdy9cYzDShUJXhXul1x6Cq2vfzGWBsKbpQQaVGF8/qgnvIXyGt666mvu9yWKnsDQ3b
	 x2nTxDm+ZPI/t0VZmWCuDvLcXoWc7MvHU8KNn7nUmYy+IBXX+JAMUZFNSJvpHjyJFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YVEQ1r4b;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C7606A31F
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8C7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YVEQ1r4b
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261022074754euoutp014a963aa090b6c8f57236f0498614e545~gynl6HWgn0064100641euoutp01W
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261022074754euoutp014a963aa090b6c8f57236f0498614e545~gynl6HWgn0064100641euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792655274;
	bh=VqywLVpdHjTrvx2+XNnWfsYamv0qjE56AE6iewW/pUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVEQ1r4bOqRT+I8/86b3anWpvBR4nDdW2LIAB2WdUIqBwLoPoo41d+Qwy+FFwaceT
	 OCFSvx1zTbn7kmxMYFtl4Ep0+qMfb4l6z6Z5dZizmkOT7zHdDPvhib1p6OP3+GpIDC
	 /h/6BiTjhmErqyCoCYWV7nl0SJgLjlsw8Cz7cc2I=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074754eucas1p2cface621d60c7e963c01e992f1421181~gynll8k9a2648026480eucas1p2S;
	Thu, 22 Oct 2026 07:47:54 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074753eusmtip26f5e5635600181a0a1e3fda5885494a0~gynlKWbUG0844008440eusmtip20;
	Thu, 22 Oct 2026 07:47:53 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber
	<aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 3/4] ASoC: wm8994: fix MCLK index used for setting MCLK
 rate
Date: Thu, 22 Oct 2026 09:47:41 +0200
Message-ID: <20261022074743.625223-4-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261022074754eucas1p2cface621d60c7e963c01e992f1421181
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022074754eucas1p2cface621d60c7e963c01e992f1421181
X-EPHeader: CA
X-CMS-RootMailID: 20261022074754eucas1p2cface621d60c7e963c01e992f1421181
References: <20261022074743.625223-1-m.szyprowski@samsung.com>
	<CGME20261022074754eucas1p2cface621d60c7e963c01e992f1421181@eucas1p2.samsung.com>

wm8994_set_dai_sysclk() passes the AIF index (dai->id - 1) to
wm8994_set_mclk_rate(), which uses it to index the MCLK clocks and
their cached rates. As a result, selecting MCLK2 as the AIF1 clock
source sets and reads back the rate of MCLK1 instead, and the rate
of MCLK1 is then stored as the MCLK2 rate.

On the Exynos4412 Trats2 board, where MCLK1 is a fixed 24MHz clock and
MCLK2 a 32768Hz clock used when the codec is idle, this gives:

 wm8994-codec wm8994-codec: AIF1 using MCLK2 at 24000000Hz

so the driver assumes a 12MHz SYSCLK while it actually runs at 32kHz.
This skips the 128fs AIF clock ratio setup for low SYSCLK rates and
makes the mic detection rate configuration use the wrong clock rate.

Pass the MCLK index matching the selected clock source instead.

Fixes: 419e2f508336 ("ASoC: wm8994: Add support for setting MCLK clock rate")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 2cfc2f8a36b0..6b91e02f130b 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2566,7 +2566,7 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
 
-		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		ret = wm8994_set_mclk_rate(wm8994, WM8994_MCLK1, &freq);
 		if (ret < 0)
 			return ret;
 
@@ -2579,7 +2579,7 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
 
-		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		ret = wm8994_set_mclk_rate(wm8994, WM8994_MCLK2, &freq);
 		if (ret < 0)
 			return ret;
 
-- 
2.43.0

