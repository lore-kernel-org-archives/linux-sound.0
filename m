Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A4396B67
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645474; cv=none; b=MyhBzoKRSPBaUBkXePHMSMTSbm/Ma6pjDkc8/XKypQ345O8hlhwvocnmdqTBsEHWBZWJx3PvwiNIXU+ZDJws8mt3uPRcT5YBD5G5s+JZ/i0WTqSCYd2d9i9LOnf+/+nb9HoNl9f5AgIussjzqgsTQgWgRO5RgigxdytXtL0VRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645474; c=relaxed/simple;
	bh=f+rrkJ/eFGfAceLcutWeIAOjkU73nC2yxLnBeMJdOaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPaXFva3HXOi7p3ulUtExz/Dq4h5kzSGWYOa/FHZm2slMAP9seALOGq2S8mhQGyeabcZf5LFtNNCLrjNv1a5yf/hCbl+czPO4u0aXCYyODrYI9Ul+5l0lvKsyruYltBSCKU2OiyGBEdpJEo7f9bJQvyd2kiy7WxPujeX37AMOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrSFr/eW; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrSFr/eW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so611752a91.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774645472; x=1775250272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H1z6H4hjpkn9YitKWLYuZELXb+HUGMdhzSORhOSFC0=;
        b=RrSFr/eWNcU+j+i00x/ExWB5zOFYrGlf3sIhuCmRa9V/GtJajuMQVN4/MCH8kK7m9L
         MA9mTmRD8X0miQyeoDaI/lAnBiEe3ujV1LOPle4+PJLwWXjUAyGTpXw0DF6Ow/NLArt8
         z7Cj1yuWmG6Mx/3V8JaS9Hxmeiy9roso8VNhLHpPP0B4lKFG3T/WpUFXdFf8M7MI0f6e
         PKJnvvqF9AAREuT1P4CYmcHejelT3eUm0U5IwKI5i9l8WkLdHfcDP16Ufo6yvdPN1Op3
         chA/ZVqVE8LKJjRnprIU1pG1jJHZZYluW6df1UazRePpt+mfr5zbfHus7ZZxB9rC//eT
         UOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645472; x=1775250272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6H1z6H4hjpkn9YitKWLYuZELXb+HUGMdhzSORhOSFC0=;
        b=MAwRI/ZoBhHNA52mvx8vrg2Ocu+tjJFY8oINSFlqGvdDnbmKTvDqw7njBFkSUcjZ3A
         inYOnqmJDb61bEsfuGvi25Kh9XWh8KIorf6wezXEQYbizxQ+AEG38lTIDvxd+f6qDDRe
         hpi/mOGb+V3IOw+eE+y89GCGbZkzid8xLKN59+gsfeFZ931o1/d7/kaTHuaihbNcf/iU
         orF5ruKy/U48esicB6dmUvW6I9OiEdlfWShA39on6nBgmb/xsw+YBXItkzDn4e7chO25
         +lsOJD2DKrefyR+35pyYW4WFaiEkLtnR3HRdXueLUmI9wAEE5h4SFKrYE7QStFZTG9fz
         UyUw==
X-Forwarded-Encrypted: i=1; AJvYcCWxA2/6RgN1riem+L2bGBXlRPva0q6rr3I+4zlpR5HkOaq7lGkCBFNmVqzZ6+Az4OqHsGdvj85Y4pCNTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+q6SFNce+sEkgf4v00051kZXpF4Zx42MH4vc8gLnSq/fP9E/E
	M5QjEpW68N+85d1/ZeZxgO4Arq3qwrmDYyYHybGVa4jC6jJj7FlfoRg6
X-Gm-Gg: ATEYQzw+Oetf7sklTs0B9yKemPo1WdtRlpXMNZOo1oHB3VZi6vSLw/nPLPpq53U84ej
	AhSFfqjxrQ+Z0lEMtUhvkN1TiCvmpQHAesAsxWCdChqQLf5klLCYw6gfkfEYTajIOc5VsJrK5jo
	kTcKENtXP22ZED16u4iVUJmtEfkldolo5qiIxbIW5F9wH4V+/9xfMilUsOgyuSNmlZsrpKx6LKG
	vsY/wxP8MNfpdHMWhPvpnFXksazeZy9B20hliexPXzaiMZpo0/rA579DJ5QO1NlpEAwvRzOLtGv
	RRg0LmNs++/pCE/C2ErjINlihQb1UVh2eDpz9308UNrik5OSjMy5nI6phnWipQ0i+xyzGae8K6O
	dNbyjfjKuaem0it4tR8dfpJdyPjZqK2wAuVUMtZ0gGFBmJvxv+2lSXc7ZcH2f3yS/cDK3JM8wRr
	JJ9BLA65ebIMoU6WdxbeTPYgiDOvTI40ijhvLjz7aiQA==
X-Received: by 2002:a17:902:dac7:b0:2ae:5464:7a4b with SMTP id d9443c01a7336-2b0cdc117a3mr44407995ad.14.1774645472261;
        Fri, 27 Mar 2026 14:04:32 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24250b15bsm2358125ad.0.2026.03.27.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:04:31 -0700 (PDT)
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
Subject: [PATCH v3 2/3] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
Date: Fri, 27 Mar 2026 17:04:07 -0400
Message-ID: <20260327210408.430908-3-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327210408.430908-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327210408.430908-1-aravindanilraj0702@gmail.com>
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
 sound/soc/intel/boards/bytcr_rt5651.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 68cf463f1d50..65944eb4be16 100644
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
@@ -224,6 +224,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		if (SND_SOC_DAPM_EVENT_ON(event))
+			clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

