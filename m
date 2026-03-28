Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB2155A5D
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 05:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675607; cv=none; b=m7Xb/HJ7qxdUZSYkoXM7jXr5bYUcT54PuplLOf5gpTqH1uE8QToJtH51REPILcliilYzkdgliHaUsef4xGj1mX04q3jTf2p1btSPk9g9ffsrXGcmRCvEm4SSznp6UfLfW3YhX7Ux/AX6IC2TOZ/qgDiXwNU4YebIRamL0zKlOIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675607; c=relaxed/simple;
	bh=92+MxE9SEiqswIswB1QejRLUIDn30JoIRpdlHoppd08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sktB3nIrvQ0HaNE6/0FQjcVdf5+BOPnz/CuNhIXLXgL93ivit/vJUSiMwHxei8lw7VXss0R+Twdx2TH9Vhan+fpgGpqT1hHg7qB9Blf6x9IhtPupekgeFp70+bNx9PpVQabvIOuqwuZDKZ7XfzZ6UT58rYoYOzY5MP8oKINgPWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuFwt+FM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuFwt+FM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-829afe24fb5so1992548b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774675606; x=1775280406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=TuFwt+FM0plpQUNu/wiGRYGunwD4DsLqW+XUjk9m7UUBFk4ailwqLd3AU4ILKQDhDP
         dG3HCUKOkOGrVs4Uhh9XcSJxhPldN526qaff7yX7Q6GtdSG8dmqB96BQGLvsNBZixsHZ
         TaMCEc2/WzMGyaJ+OH09dIqb4+xGfC/qnnmiqIQ2nzsJMI/qHqOvBiJfBA/wZdXx62c6
         0ZcSJs7C/JbXRjkERL3clpJtr1E7MUeZLYHKE1+f1GyyQTe7+iz8DvEXXsX5mg5KwjZx
         0cbkrnLvTzKWxeRTT/a3n4pAJkY02UBGc2rvz+TddU/r7+MQdo6jffsWB1G/gzjoBbQy
         Xzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675606; x=1775280406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=lTx1eZ4J30leuP0VUauqbJ7yR6kzfYVZt+I8hi4lXknIh/T8EewsK/Wf2FMKBotsyG
         ow4lM9z0uFvzWuGUKkt9wIuLMaug6CE1xft/jXUbTVa5ESzE4iLKb1IT83CihCG7/kZ/
         3Z/soKLTKZXYVE4opiUdPw2sJyw7D5jHWSGXvOtMTSdSNdpNmEdGyk+HRxRRIuoK+KAx
         DvK1pwXNmGdMOHcXdGFJ0UVuIp+Cq3vV+awbh6FggXwuoeXy0S9bX1dKIyPZ759Vqm4K
         RxQDordvl+Ma9pMNcIo2KLjvSXPjbDus/bUQZKfmimN+i7wbQdAiFCwVr3+JhSI5oTwK
         mK8g==
X-Forwarded-Encrypted: i=1; AJvYcCWo9kBsGUAWGcc8VkZ4j1pTr9zlzyHpJwMds42SuTqCDotpNIZ/4TwYsbEtbvf/EyMpxRiCaPHzU9siWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4PVllUTWA9N28OjueNAB5IeEcttxv3sZ7o2FNmUla+ohFCZz9
	tQtHrzam+fbAbZbHno+majHQs1VmX22OeZYCitUZxg/WkSK3TTJB83iF
X-Gm-Gg: ATEYQzyN6mmNLNokOemfzSEBWShBrcL+bOrTEBepomVE585VMp4TwNQva48yhXy8cDi
	F7TDMwRqcBFdevE36QaaUHQq36D+vISY5n0Ky9xT9S+dkA6WLjcIobxqAY4NRMzFdLC1N9a/H/w
	SAAHTExl+d/eIOAxCKIiOZzU09eH2Pp5Q1iq4g5JYkMvBd7hlbkCxMfgJ8DbLOh8csVdKsMheFd
	QW6PyiPhNtJodcvWFgaY3tQOOYWWi15NPsKtZfOCvJFFg/CTthBk+DnZukxZqHknm16Vhq2GjBu
	dX+rMItspSYQV9d1mQpw4wznvQhVFx44r2g2vIpmymfVW6f/X+mI5L/My19zaN1mFlxyEexUWDU
	SRMGgv2FvVM/gs8NLbytGJ6sWPh5+UwkdpEj2d3wZstEBVVQPKTtF9o5p8KMYIzt2/lX16la55R
	Yy5+rwDpft98rDsxWqooHIeQhyogRaAkmKDUMKJmA/47OPZ5oW
X-Received: by 2002:a05:6a00:1705:b0:829:8c23:f70d with SMTP id d2e1a72fcca58-82c96082491mr5258970b3a.56.1774675605713;
        Fri, 27 Mar 2026 22:26:45 -0700 (PDT)
Received: from debian.killsync.com ([152.58.216.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm923739b3a.60.2026.03.27.22.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:26:45 -0700 (PDT)
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
Subject: [PATCH v4 3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
Date: Sat, 28 Mar 2026 01:25:54 -0400
Message-ID: <20260328052556.434191-4-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
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

