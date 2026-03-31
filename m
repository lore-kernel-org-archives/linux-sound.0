Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676BE410D27
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975022; cv=none; b=FjEK/TN1Uf6MlA7asfZOEJj4hm+u/UZFUnYx23A5xT23F/9yykaJcTBVLy6gnr6dv1YpDYj1bSkNj5s80PthvRd70ezHxds9J3m5TGwwGKkhwhVwaeCb+qpL/MZ0FyYuy8yV5VS2g5vXrXVsf+EiKhO/DPC8NR1LvD3NhW8ieSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975022; c=relaxed/simple;
	bh=kvDk84lLFYP8LAteXHHmJ4uqJy7hd+l5iP9Lmix/xm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYStEkOFARQQKCYu4/ciCCSyp9b8wfz3+gb3qGtOJEYNgzJOUVY78vnYuXGvFaVw4ptku00KcJQJ05l22rWIiLVMOVfWpE9c8ZM+s9F1uaw59NkACANiEiPMst09Hq15p4CnjLSoILLM5vJeQnzNpLHbX7TumNk2bjHr151H/7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE/5pMRl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE/5pMRl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2589c26e3so17971175ad.1
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975021; x=1775579821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVf9jSL3Fmxnja4LNdILqrHoUghzjihR7HFJHimyh3c=;
        b=UE/5pMRlLfbos+qgHW+xTNWkWrLG3e2O/7rDGYfUIxtD4j+pTULvs/BFZo6DizZKd3
         AaMxTMHDVWlxieN9pNhItdjc+ezKoRga725L/zQk1YeciR+DdO6IqIoivOnUAWLCWLoa
         jkrjIPyZBPDb7/YvrPH28xFearFpLBNcbXuYGUzuYPgXWpHwVuKqor6TBeL3qH1Yoc04
         g0n6bT/BjZDEocbrxP5LZ8HsMdaHv7D5zjnj/VzD5smWPKGvkGZhXFKs2Ujy6RlBJoVr
         SZGgAFZ/Wc2g8M/C+n6hP1bzNibuGb39aYCb3a1KDOhJXTXlXyFhlJDiaW4c7QO34S7/
         VR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975021; x=1775579821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVf9jSL3Fmxnja4LNdILqrHoUghzjihR7HFJHimyh3c=;
        b=jCBJ+cfQl00A9s2/w4TLr6IUHbmci1t8SxwBgJwjSRiDsWs6hXYN3zxku4DBjIpaNO
         dNmdhnPjbpTiUJiNf6WHnDpU8MUb2Ex3siMPY3iXJvwD6n0VDAge+IYw37Ug6OQJSTQ/
         UYXWrgHcrCw1WLv6PfbW2XdIQVa/DiHFSraekKVJs0ziIzD+KUBLRSemVSOpf6qGEaMF
         RApPFzOUVBSj+GX4j+834IJyzPwo+hTWZrLEsJ0mHATj9IETq/FqGvf0/3TnTrBzo0Rv
         /CmDrdCD9F8V/TmSOyEFGIcgwhw4Ha3+qeu6b8JuIg/x6fbkJQel1tN5ExfCD645xgJN
         rGng==
X-Forwarded-Encrypted: i=1; AJvYcCXqlBBGtnPKAa9kJDSE2X7LlTqoygtZxXU58Yn+2j+QS+8h/PCJGTYXamoA0J8sHpby/34aZdiWqNwdAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvaxdMdkEqlpH6H8ZGGzjfukGZtO5hnh2fHkdkJYWOzaHQVlgE
	SdVBf2eYiARj8/ZJArwBR2j2Xh+4jUo+MRJnYZle9vGzv43+OOWj6Vjp
X-Gm-Gg: ATEYQzxjVXO0F7bMp8OwCqHuOiVLPcPhvPIXt0C0CxiQ6/UblHATomnkYr55nyQGHPs
	WxFJHi6FQvp/dpnUxbTYPaFYBX9/OBH6f0VITYBL/hXxZ/O586fHxEpY1KxmDzoMhNU9EeApVji
	zydBDowZPeI6xUjK3VMjUXFJ8v5wy5fR5LFZGgwGWwzqrZDzO9aT9NwEDTEsDEqgv92nVNhYxKL
	q70I5nzuXu8yiptwgHoCF8uqn6HqogGBFqsuxAZYCV7k+jyQlGgt2E9gSD8tHFZeuPVvXeSLTBl
	e+Wv6N4K9KYj2ffJ3O4zdpfxcvKcvkVBGvdyF3JjuIWaauoBMBRhH420DE/FIaTeB0DZmKSbwHx
	L5c5cQ22z7HGzSqQRq4/zszpOS3b8N4Oc4hIGjXvzjVQc4Pm/AeAM2CBj+D5GYviTA6bYsYynvN
	WFb9nLbWZXMNUUIsXF/dEn9xILZxqf4h4bzKHFKZNrwhrxGjaO
X-Received: by 2002:a17:902:ebc5:b0:2b2:549f:7d2b with SMTP id d9443c01a7336-2b2549f7f50mr82756595ad.11.1774975020649;
        Tue, 31 Mar 2026 09:37:00 -0700 (PDT)
Received: from debian.killsync.com ([152.59.222.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm116069255ad.65.2026.03.31.09.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:37:00 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v5 3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
Date: Tue, 31 Mar 2026 12:36:34 -0400
Message-ID: <20260331163636.15238-4-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
References: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 359723f2700e..0c2435edbd08 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
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

