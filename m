Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7167330DD1E
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642440; cv=none; b=NLL2OVzNm0lLqrKiXs2T5jtYmLhLa9+GtVHqRtbclZZK5ZNMWJzV8/YH3JCHmYvo0MRH4jhxKyOk3EcExSCZajINYJI1G+QoMId1IShuqctxg8zD3EUyqJm6iPoeofM/XjCJU7ISqq/I0Lcnz+Qx0n5k5vltwJxfteK+UOVyC7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642440; c=relaxed/simple;
	bh=7j8Moa59DkosVsxWFDavZ6weYRK8cTYFube+TQ8IPC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQ3Oz9Fni9G/8W14ScMdE5rSLg7J8NEv3OdIOFicgKOTJHeK+ka6PuKMtjcTbSJIf2P+9byQdJvue0dkw2mkn4pbQW6X+3uHDgcp1U9WTZfN4ZPUheJtlIrrZpWBKQqw+dWKgsxXVVGunoqg+dwlbUtFsD6BoCS7NnclTYR5ByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfINtM3e; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfINtM3e"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c124d2613so1758510a91.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774642439; x=1775247239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nuT9mfHoO1n2zOd/gsACVfEg2tIvD3nQVS0gGGSabM=;
        b=CfINtM3ex+Wpt3jR8wLNWHcm6lye8D+410cdkwhPjBv4FiR5R9PGuNeWKf5qWUSxeJ
         NzD+nLZw8t4/OWiL9M1C5R065HdfQxfsJqOqVMnGU6kj+dLmQ3pNSKjeUBAAGjQSN1wD
         FzNUHTr23wpY9hd8ytjXYDTpqqOnkPTnQG72hao5Uakak6kNbsdtVAiV1xetouJ7X30p
         4gEucvHz+xoB7GgX4s/JF16qX1+m5eliJT2x/OHC9nEgc7BVeZxV1ZICerogyH/Q8QZy
         Cz2TGDWVwtunyb5zcHl3NU24xBMrEEP59Kbi2oWjbrmjd43S6Shd+7SJF9FYguVEzZjF
         4oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642439; x=1775247239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nuT9mfHoO1n2zOd/gsACVfEg2tIvD3nQVS0gGGSabM=;
        b=SinJqqjVPrxfHeec8FvVyjZAM38wgtoClAyrw7pWGaR/gHZKKDlWGJhoEX2GEFYLJ/
         AsOfRLZF4i6K/rrYgQWW5KpbZP89j5I1KKW2HiRDkJGY7yiFWlqrafhSQtAtarwso2o6
         YVTNrwPVthcywLFh+EbL/hQDyZXqX+vigB1y5jvZY7a86mRy7jQN1VC8WOEK33DZERHO
         AgOskWE6FonJAsbq6o4nWHLrTsZW/LF7UZnxgWgfLaFVdfWott8nVvtlGF1x+vOHKcG1
         ZtlCRD1LTToGvis+z+SlXGciZ89y18iHCk3ET/av8mIe6REZr5Tp2cdF4xDqyCLNMFnS
         s8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0W+QeaccI5xopLKKuu3KAGzl6ftfR0MQazr66FPYL30srrCcj5vb7FaXGXo86sZUmNSquw4C53YHqYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxohHWf+pPpZLxtHQ9a9yBBkx6nhUy56PcEbSk9EapjaOIDIVuM
	IvOm4oHRwMw8kFTBuxZIqXeGehOxaFSZTnaeWbPHGb9nZmfCReW6Ufnz
X-Gm-Gg: ATEYQzxSwDUVRhC/LINXNQCfF9A3SUCtiAK/oomvrlrKRoLhxQgEVqzPebkc6ntkUjr
	+vESixhASFS1ojAgxIbVe1mrG0dcrC3M0AeYRQk/ETLrvkWBmIP/QuEB4d7zCt5tckZ0gTfBw19
	c5DM1TWXw/1LdhZskcjddkTRQWoYE9Igqf4SBli6SFMqxuirkgTQFmOVHUdxB1ahe4EaMmvEA4M
	ZdHp9lhIE2Tcu8u/Kic+D1th7ssKmxWtw1HZM2jHrdzY/IyJu6fPzSsrpd7ZOvqygh3+/qvBmdt
	oUcjE58xt/cAk+rgxex5btM9+Mqj8ECLB7IAegHDCNRVd3Slw8QmaqMzrYloMaiHEMqDWUl+QZb
	nsQqSR3dkf/74bbhI5Neht+76rj2zWbk09Ae53rG7t5zooGMDs5Oi1WaQjzXCdm6ZJ68Q1t6JSs
	jGLp3f9KQ7Ap1Tu3Rzf5AuOhSugRmPNc7BeRvrREHjUxYL+iLnKhRG
X-Received: by 2002:a17:90b:2d81:b0:35b:94db:fd97 with SMTP id 98e67ed59e1d1-35c300bd43bmr3243233a91.21.1774642438910;
        Fri, 27 Mar 2026 13:13:58 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d8f96e9sm1534085a91.1.2026.03.27.13.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:13:58 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
Date: Fri, 27 Mar 2026 16:13:15 -0400
Message-ID: <20260327201316.427607-3-aravindanilraj0702@gmail.com>
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

If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 68cf463f1d50..9f19eb483c69 100644
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
-- 
2.47.3

