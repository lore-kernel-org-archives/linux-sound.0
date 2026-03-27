Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5093A39281D
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642446; cv=none; b=NJCs0wp9MY/4AOcbsR73C8w7iaZ2Io8j0NLbCr11E40AzATBFADed5Q9N8zPF3HbuTAdmINpx2YOu/7z7zUsNsegk68xjAXT6Q8mszHhljJ2FdqQyp1Nb5VPe6G865nEXdqQBEMf9PbiABAioRuD5YWOJ7vCmR5umq9jmWpPssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642446; c=relaxed/simple;
	bh=92+MxE9SEiqswIswB1QejRLUIDn30JoIRpdlHoppd08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flm59KFnAaZrea4c5IX4RgHlHB/1iBSBE770+MsZbuF8mAt+TSP9jZBbFxrAMPuPNar89aGJDPGg/GkzLKqUy74nLDPh/7+ptj9p5FaLQKmyGWjTyFz2M0MU8PqKlH4tN5IUHOSJgt+mMVX1A9NHEX/T4rFCrGHJgMrbAgRblvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDywv1qA; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDywv1qA"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c1a131946so1684234a91.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774642444; x=1775247244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=NDywv1qAouOwyj2Ps5srk4Uf6rRppNSCFrdWelDm89jJq1cerwZT4Ir41MPlOo5HzW
         Oon7YT4GvFjP3PI89kMR7h4rhwSZmWTTE41z4j2LFJmKJJlzgtxTdHR6UjOpdylaoy5P
         v+WawE4LgQ+VI86o6bTEJF5L5H5cfncEy8AR/yqIJyoOoUoDlmlh1rD5n9ZW0zvh9kFt
         Goxl2UgBCbt1fwypKCyBm+SmIaCspXYTduNmoW6lkjCiTwq/2PK1+BjA27zvuHB2zgvA
         m0xzog1WeUx1mMheRdsrv/n80YurfQnpf69HTYD1w2Bp8ZsJB0w3UR3Im8sbc0/hzSYM
         MeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642444; x=1775247244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=F63JUs7zvIx9gk9UQDP8HyIn/2uD2XyKqF9FUt4JKdiP83J4XsPwCB9JawG9Okh7G2
         rsTYM/d1xbmcH2uB0yiprFBjuj6KpGnnvd3COOciQ3PLPjmNIAQOvrbxjvP1E727YwM/
         SEMKDIbUHKIN1cHwGnppfcpnyEFYh/IgHMq9fePlQ6tDWpWuJbQ5g8BwCJKVGcyh2Cf7
         OLI8RSFcX3AO5TF+3eqd+DJ2vCmlASizHPl7YZAl1yZ4PM9HOoINYc1REuq2kFyN0z5K
         r8eOkJ2kPWb5z6+xcaGunUElrQbBaQJhJJ26IW48LSC5127AhEGs3AeizISdym0gmtnr
         bPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCfqdA6M4gzH/QgcNgrcEu3kUoVxwHO8XCp0saewGIEFgspCI47BFHPg1KGNyqrzLDn4W5xGpBa7pOPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjzzVvV5xF+1Oon+eZvT0sPWloNU3YRVsBQAZcmD3Lnl6iYT4P
	XSa5bnYwk9mb5tJ1WYAP/GdpscRP4Abdh80aS5nXsktWfzdkBTaXG3Ev
X-Gm-Gg: ATEYQzzxBXOL1WlkxC8HsRI4NVsJ9EtxU9HSZVNesIe36EhO1LYBg75pWNTxN6r9F5q
	aRmfEeZhxi3TXyS7OH+IUj5KUx3grnPYDe5Udb7WZ4f5cQEcGz5L5ZlEG06DSqtsxYsHzh/MgZ8
	k23shTRMIUEeO17UkqDn3xrIxPoE7kv0pFvmJAQc+tRxBFQSTZX70UIX4yfEBaRPPHbz45m359V
	VBq56/v78nKcPqbSR3ndv7/bACUz3HfCON1rM92GD1/4mngVrEQ+5AQuIdMFhwE7oaS/+XUtU/D
	uQiFvJZfmuSloRYtmHLQH/9e9aa1beD6JTcCw1yIyv07PwWQm/cHynmtdVdIwbdk50KkhYBY5IU
	8wJuwFIgjpz9hN8Da7snz8dhhQ+PUR6z1HCLlW7dNDCdwqNHgjbygf0X7f47ozLRpLzsycpNfpD
	qEDasHajiGjLuLX/RKKKDqr3zxvPNY9YojuoGeYbOO9Q==
X-Received: by 2002:a17:90b:2887:b0:359:8ca0:308d with SMTP id 98e67ed59e1d1-35c30dc50b6mr2812724a91.14.1774642444563;
        Fri, 27 Mar 2026 13:14:04 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d8f96e9sm1534085a91.1.2026.03.27.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:14:04 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v2 3/3] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
Date: Fri, 27 Mar 2026 16:13:16 -0400
Message-ID: <20260327201316.427607-4-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327201316.427607-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327201316.427607-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If snd_soc_dai_set_pll() or snd_soc_dai_set_sysclk() fail inside the
EVENT_ON path, the function returns without calling
clk_disable_unprepare() on ctx->mclk, which was already enabled earlier
in the same code path. Add the missing clk_disable_unprepare() calls
before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 359723f2700e..e5806dc16ff9 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			ret = clk_prepare_enable(ctx->mclk);
 			if (ret < 0) {
 				dev_err(card->dev,
-					"could not configure MCLK state");
+					"could not configure MCLK state\n");
 				return ret;
 			}
 		}
@@ -77,6 +77,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				CHT_PLAT_CLK_3_HZ, 48000 * 512);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec pll: %d\n", ret);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 
@@ -85,6 +86,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 	} else {
-- 
2.47.3

