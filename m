Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C037FF6F
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639849; cv=none; b=nn6KPI72Qy5JrOrGwfMXfSjd/GcN+U2kZEucBE0ncZShUMIT+1fknHKc5i46y/YLjkj9nQsOweb5tlmOGC2eOBP1i5X1nyN8T4Fj7sufhB1rEm+dmy5LwmuXKc1rUXSn8AQMi0/CMFJA0bzcY4lUmms0Jcjdieb1u30P+gRougg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639849; c=relaxed/simple;
	bh=gWTNa1Ru6FTWiYGuetqt8sQnphE1BsUU0ukTCJvdibE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0ycLLDGOfF7uo7VI+VlsQ00xf8LqKGf7nco8SVofB54GRTVCXBjR///NwN4EZMVxVxFqkB6HRDCq04FD0OsufwUhDMvxeTCHF1Sec40yeeGWiTkiqUNrSHFyUjF7Ru/E4L5F7LXWpPsv7CWOvRb72Xr5ODil1aOd97kC3fOfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5FVRoeB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5FVRoeB"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8296dabef74so2378794b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774639846; x=1775244646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3FUlPSvuL6UwdVrhI2pf4kR3xrV47JWPOjNqQAkdaY=;
        b=Q5FVRoeBaq472siBGOxgDL3Znr8CJ4IoJnikp6hLAygXM4QO14pliq74ErwuLbszwH
         IQlNL0i01phwIV45CYXxddjjU4cHK3Hy+5EHXYyCANGt3GjFlvava8tcqcmj/ChLDClQ
         Ti3GZuAGSkbxoIRcVWVAfG8OFxNR0di3glJPZzm4SaFM2CB3uOhTcSVy81LfIOBWogTQ
         uLmIqfoKOHrNbKqM3fMdRBIbZUvb+hBo904YRA/8/cZGTBu9/xn29Quy2B9H0K5mZFqc
         xs3j6gn2e0UKRzPdU5Kws7YXFTX6adYYtDWzz96Fky9X5fpRVyrsm2kIOwXIzGG+FEIK
         AS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639846; x=1775244646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3FUlPSvuL6UwdVrhI2pf4kR3xrV47JWPOjNqQAkdaY=;
        b=pxXblIusAQuBIggrfKaYRvKYGazZjemaFoo/uLpFeTVqn4XYEYlYvDAXq7fXwXjd++
         /vzGozdQ/PzDC89ryV38jlk3a0j3TH5dafguSakJQovPDw9BNU/6OAe31BqDIl+oZjTQ
         gNntNWuGfNYE+5j5yzgUM1EA0ExEt3VfajMKVKzbLt0xvc6p0cqaxvLO3YixEG+J5uB4
         oVMDA4IE71PkxXwjSX8QV1PljFZtL7JFju/eLAftbvIyJE40ZGo0kc8s9QeB5Vj/Dn2U
         68eRq9NZW2BHugtEyGY9SomRXqGMufbUD1DnbkK64e7w0aWlX1aqwOFPZDg+KhZTh2nw
         scFg==
X-Forwarded-Encrypted: i=1; AJvYcCWDWNdlrCzS6xiv3J09ITgjFDk+IJHGmKhG1SPm9u/NA3u1N4sExJ5UHDDScHsWP6q3Df2izjOXWe456Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0s003taBK5xcAFZFSYfzIsv2XR+4AQgn3WmIhmU16+SWh/Cv
	4LwR/a8clmEjoXjlP+crTvguZEjPAL8vTGxpJiVd3aQoscKcirdKY3PI0/ljcOgAJzg=
X-Gm-Gg: ATEYQzxF3tt5+Wb35i+TJsljLNIqigBHeg5eTRKQCqMo2jhT3xtfiRuie1Q9rNmSvBJ
	tQWdvWxRFxvgfacvO9OHVvnytFM5cITrt2ADYPK9rJupQcZ+YtMZ6lU8CZPOd7tSKoXw69BrqrI
	GGCemBBDjFIELCv/TPW7bLAe2B17S8XCsLAc/Vf7CckxmgaTc2kiKITl7IvLqD5waZaN1acB8bg
	t31lBvxHdgjLC20YrN62iBL/G+b36VitzA1VKhzZhoPJobd5txUkFVlScPMDaD+2oQUjsSkcItM
	gH/a/VvGqIUzG5a3ovW4IINNhiw7JOyOsW1ju+2wA1onKspXjIv5E5rLQzsswkeXu1iv4RW5C5j
	pHhtKatBIZER053LLwIWZjbn0VSyYc9uiVDNtJSMxa5JXkWAbo3ANRyhc1GgUfAN6Ogr0qZ1LMe
	u/b52oOXu0EY9lzmYtyn+rcGmULCVkagQxp2mgD7c9Tw==
X-Received: by 2002:a05:6a00:a804:b0:81f:4769:6fec with SMTP id d2e1a72fcca58-82c95c27804mr3835422b3a.21.1774639846324;
        Fri, 27 Mar 2026 12:30:46 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8466e01sm25136b3a.20.2026.03.27.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:30:46 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
Date: Fri, 27 Mar 2026 15:30:01 -0400
Message-ID: <20260327193002.423897-3-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 68cf463f1d50..2eef9a6dc8f3 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -205,7 +205,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state");
+			dev_err(card->dev, "could not configure MCLK state\n");
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
@@ -224,6 +224,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

