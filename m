Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577907;
	b=UEBrANi2YwAW6rGFPYpfkqdrI6uT6EAzPabljchhfHlbyilw42V3NZs4pPxNMnBvhGxo
	 4fwu0SpSG6Vd0thONA4ixnJTyW1jCgR79LXIW3lINRqTxNXinhLGztrmgVLbMJ4BYl3WS
	 kzXvriV/kN/e80uoCm+VO/itN6oYEWtxGsfFJksdy8+euCCSsrhFnLv7ZMPN4iPIcy55J
	 x/HYgJgFaDoBOTW8j1BMbyDmbEIja14tQ7cA3hCGy13oarVkAbo+Av7ah8c1wlc6MCeR6
	 1PigLtmN2TMnGCx1cuIu5oBS9A9cmoZJzcpYRNW686AqmVR+y8Ux0zS0FuoSw7qYdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577907;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=sI8CUXGjJ72tb6lj78AH5xMS8ghHXxeoxFAqCpwZpxk=;
	b=5CDApDXwA9b/D5wBzAEbrpNlMFn1in4RkZnqjGnpGP/Iu3+WpT2BD61/gafEnYiLXNRW
	 SHGMS+Ckjwr1bGF1t3HG99+drFVU30j6+5iUnNv55dOvK2mrrx7F3vAreee6J59ZbXejK
	 Vkx8oNALol8lKLhLrp8vhNUYcq1B4npYpHb2JOTQ6mtQqhV210TPgWsH/q/g2nybk6ibG
	 j1CfVWKAqkeNspZMdP/ngSPSIBLsqUGbr8ChO6RrVY/2vQnbJXC/7B8YyO7o70RCyy7AM
	 W6TKhD7lb7w7RLq5g01QdIsIFPtFXSdFhIFtOrj4hxzrEO+JWLC2lElGAzKpiI00QNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=tyl8RCgT;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0D606A31B
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C0D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=tyl8RCgT
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021101817euoutp01a7b38da33591479200386f7ccb4b36b6~ghBm-1Xef1011810118euoutp01g
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021101817euoutp01a7b38da33591479200386f7ccb4b36b6~ghBm-1Xef1011810118euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792577897;
	bh=sI8CUXGjJ72tb6lj78AH5xMS8ghHXxeoxFAqCpwZpxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyl8RCgTQcfvMULNXKP5K5053MV794IN8Ino9Q8BRRhSyELJVhG3eGW4IRX3iuAM5
	 yf7aUaYI7yrCLuiNq4giEVEoGC3FWK8hKPel/TzedRPZyc4NIXYCatHRTkQz2QmYyj
	 8sFH+iHl79DHmjOucnD1QeTjJndyEp7z3A8do8yY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48~ghBmsI5R10616506165eucas1p1-;
	Wed, 21 Oct 2026 10:18:17 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261021101816eusmtip2f4ac081501eb14fceafb57e34771d628~ghBmNTCf60275202752eusmtip2x;
	Wed, 21 Oct 2026 10:18:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>,
	Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ASoC: wm8994: fix MCLK index used for setting MCLK rate
Date: Wed, 21 Oct 2026 12:17:44 +0200
Message-ID: <20261021101750.3297770-4-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48
X-EPHeader: CA
X-CMS-RootMailID: 20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48@eucas1p1.samsung.com>

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
---
 sound/soc/codecs/wm8994.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index e4ea9d41107b..8adb3de546dd 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2539,7 +2539,7 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
 
-		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		ret = wm8994_set_mclk_rate(wm8994, WM8994_MCLK1, &freq);
 		if (ret < 0)
 			return ret;
 
@@ -2552,7 +2552,7 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
 
-		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		ret = wm8994_set_mclk_rate(wm8994, WM8994_MCLK2, &freq);
 		if (ret < 0)
 			return ret;
 
-- 
2.43.0

