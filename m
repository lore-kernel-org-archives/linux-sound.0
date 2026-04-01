Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C631A56D
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081154; cv=none; b=DuThq7n0jlgjXMlsAAtIa3UjVErFrATGCJAshr9ftMeIcPCdNQB1Iw0xRvisN7yPbyBlVafCuzAxmbUqk23sUIwjuVYAzWdHz8O6stWT5hwx1MxnvGdp638U/AUaA4aw2pAazf7toBLIhWhZyywwPtS9OjIALMaG4zibVRTQREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081154; c=relaxed/simple;
	bh=iIrVilUWy3IXBnDjBVEDTRUew2qBPGHsp0NzPLbLtG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTryE1eEc0vtT155Uo2H28sTobOhpuinpqqNnTxrxxl3VFHbe0lb9U0tJhkh7YjaIjZn1sVen4IIthsmI2zgWdi9/UoDEB3gDI/fW6sN+McwhbfHHeTvT7eXZPo1iwvEe+FVgwk5ee97gy8CLls39y1iaSIDx+oZeI6NSCPpr3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLOm7Owj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLOm7Owj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b23fcf90b2so1703955ad.3
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 15:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775081152; x=1775685952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7UpYypELbP7D7tEyGcylQSQOLvrWO0IaOkYBSuYTm4=;
        b=fLOm7OwjuUbesVIr72jOljqM68QmA1znE9M8AtBnphC1HiR0KbT43GA9i7Y9l1Pfmx
         EhuXaK6raCbrkiMXWFzCfuLxKQJ03vvkTz9FpKPk6ylb18YWRRtbxLDBq2Lsi+dU4UFP
         2xlkl06QjI/q5eIk309LoEGqCQv8LpX3Yc0+fhHr21aou4vuWFUeYgiBHKYx4p4pinnf
         sj5ZONzeo5bcb+pgKnsL2mDJBpO7+sm/Fy4QyqIbanFWSp6gTFhdOAf09ZwU2RQ+3PlM
         +wNRKIu6YBzwXGnGbrusOCo/1JQyahz6csCLzPo9kmY3m2hhW7yndY0GB7Tdd166V7UF
         w2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081152; x=1775685952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7UpYypELbP7D7tEyGcylQSQOLvrWO0IaOkYBSuYTm4=;
        b=TDE9Pm5odbjsY1jg38S16D20k67R+Xm3KNncXLNkroTPRVeFldGxMhXHVG7cVywndR
         0f3J1jjzTdlMNGQVsHBxxdv4/G+w8Al2MPkTbKmPH7Wnnvt+6F2WEy50HdQOWDs3lvlP
         ZO/v0vjztT4uoblt5eUw9JopfecQhKdH2BypOxJW0XVJlqWlbkZinhjQe34+iAJHtLN9
         0TncYGGlzkl6XIbAulNM9/PX9j5X7/kbnrY666vLDYUa6TCw4egMMLIkv6FsATwpGU8l
         k0eH3H0w9Z34NtfREwgTqO6FwLKWoUnEZeknMooYXf2DTNxVKw+AHA3t97OznozCuBNx
         Is1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUfjIaUlQktQSdNrIDoidLp6HsMi6EHVIB1cNWN4clQKUUrEc8mbPX4i/M3R6BZWHtN/YN7yyBL8Q/Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiD/ljPCtQtuFbU59J+tGpt0Y8sMAwvOoi/qzSbov31qJBhEDt
	a2zx8quq68G8WT3slzEkU7gJ/n1v8z4r78AAKh20XnTqkEJhnJ1bgD/E
X-Gm-Gg: ATEYQzwBF5c/2vG8mXfkZNQC7bf5wuIspkwG0QFsqKLFJFZY/M8eDxMBm7j/4+HOC77
	XILUmmNJ5lhyowG+DYwvtNCtZ0A0k5IAqxzfni1amlYgTU8i0kVCLJcUhQeWrcCntmjGYBL+6us
	zfmIKYwUnWETaZNa60bUa5G8PhPNrT2PFmvLUFesBXqWHrNWo03XBZBwsKiHMzwAwxl+yNaN47B
	HuLULPbiRkwz7PAu0amPzLL2hPtS0X5SZeQM/PlsnrqSK79yhedeFuy322ecbL2Jf8HEowz2U4z
	V/pYPX1OF2bkbU6Rco7VhttvAj2+K4ACimwKNgSZ5/z47Kzl4A8bYUeQVyriWevMITX6F9xahJv
	o/XlcRUcZiEJkxbC22RGXp+bOMsRobXiW6D8zycQFBVbWx078vwC4aEhq31JJbHPqp2nU73KrKJ
	HkoONZTKw/dxM9xxFO0p0BYLrDOsg5K8pM4oDOA2sSsq5/
X-Received: by 2002:a17:902:8647:b0:2b0:ccc9:dc2f with SMTP id d9443c01a7336-2b269ce0852mr44751675ad.47.1775081152438;
        Wed, 01 Apr 2026 15:05:52 -0700 (PDT)
Received: from debian.killsync.com ([45.116.230.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm9050815ad.42.2026.04.01.15.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:05:52 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: cezary.rojewski@intel.com,
	broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v6 4/4] ASoC: Intel: Standardize MCLK error logs across RT boards
Date: Wed,  1 Apr 2026 18:05:07 -0400
Message-ID: <20260401220507.23557-5-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

Standardize the error logging in platform_clock_control() by adding
missing newline characters to dev_err() strings. Additionally, include
the return code in the error messages to assist with debugging.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c   | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index e4c21c9c5b38..40da3eea5fa7 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -285,7 +285,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state\n");
+			dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
 			return ret;
 		}
 		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 8932fc5d6f4f..62cb4856c797 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -205,7 +205,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state");
+			dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 57d6997eb12f..fd4cefd298d2 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			ret = clk_prepare_enable(ctx->mclk);
 			if (ret < 0) {
 				dev_err(card->dev,
-					"could not configure MCLK state");
+					"could not configure MCLK state: %d\n", ret);
 				return ret;
 			}
 		}
-- 
2.47.3

