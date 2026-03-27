Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0BD38F920
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642435; cv=none; b=evuRKho5sVwgN4p6UnttgrGFAW1aO2u6MtqA/N3PH1MyE6zZ1Ha8XIh+x+V8RIIWuTYWEDFyJvIc0hfbEE27uthGrhnvIyLwsMZAE5Flbdxn3XYqTT8GM6v68Utz4Q+BqC8IqbpqH4x+6/KWL+/QnEEKGMPTF9QFKBUZy2EEYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642435; c=relaxed/simple;
	bh=hV0PSRnR/bl4CdLuH0CGuwoqFy9Ab3KJAJrnQZux0Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjFDsOqW5N1PPLF+b2+dRwaPnBfv6YnQEN6dXUV0QT3Ek5/r3Hhgr3S4gQXneSWgbbLgEXjdKE4E/6xVQ1pGQJMj9mLgTUGJ+M75kvmyArnmcfsrF3sesqpgw6m2dkmpB0pOK1QFIx/exoICoa1n8XHXnctPMV9NCqtTgRZ3/rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lc3u8Oh5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lc3u8Oh5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so1586319a91.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774642433; x=1775247233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N06TUEQJrWZFxO33UjJmD1NIhQS6pZplfv0sDwxN4UU=;
        b=Lc3u8Oh5LBw5DVc9oqg4neJ1FgBMvM91Za9PgYkmP5ggrhObj0hWMdJ2kfcnigcx1W
         vClJTbK+fmFz+52M+bLDvPveCERBWceo0vuOJcuU8gwstZSka5QVdo3w4lP4b22k7g2O
         96a6Wmc/5hfR4l4BPm/GNgitj84p5rDuH/KCviLcconGp2fnwj9RbhIQsyz0ursOLjIl
         8vjQO3qQsFEKgeduXSB+E2od5f6g2ShAjOocyZgEH3zMpwceadcYq2kHn+iHke/KMbT5
         IKDUNulxBsfrKgnvtrRC1extSYYBnuo4Ij6UYMecwDBTLMOZ37dfTI0WAH0o1QrjcZUE
         weVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642433; x=1775247233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N06TUEQJrWZFxO33UjJmD1NIhQS6pZplfv0sDwxN4UU=;
        b=RWoQDglo9geOVR4Q/xtJFYlBK6mx7Svm/YFYR9Y7nUBWvPVlNXFvFCT2ffSPzyWXU7
         5JUYRe2NCDq/jr3PO8YE9wZJkwuI09OYRQv0GDyuB/FLK2uHyrPK9Tn2malpSqYrY7oH
         nWh+cFX8Gfjak4FzoZOPNBrjidiw+bAYCsXIFJK8zEpnztLTnShhrI9rdPlKMZgDFShK
         KtWjsPDSn+BC1Kt3PBHHS4kdWsudUcVEVkwbmYrb5ouhAOds8+P/r8GiadJ6d6KpprCT
         a1G9PExLXr4cmmGOsE8qr+mvFKhcpDzwllNgF6hnvXExI8LOEEqxmZ2EZ4o023/u7NVC
         HzeA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDNNTUDpMaqa0B8WEklLhkpOyeBAhB8giRJ9jSIxTBfNrBJOdlgsNi/3eIC9wgTVTwzIFxH+RatOIEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0eFpo3FlVDje/2YV+WmwnUGcgIN/1b7IsYVNJ3uvZgQCerD2l
	DWYcT71bMjxW1+aK2plgAMYopZ2d9NssM3Ibf0Pq7+8pe4c00tKOOUdN
X-Gm-Gg: ATEYQzze8D4zHD2EYAjS4rIV9zzZkqFOdZezIE36zPDDAqTBmY1o6k1BLvHNJtahQFs
	qcsYnj53t9lBVlfqK/9V3Qo0gkD6pUtAViJWf4fR2y2vyKIzfrVyR03uXORY8JUfWB069/9KmuR
	zYGfJA+FCd6m0E5tJnkp4VwDdjwFMShEEBWh7qzvFiuHYH4OhE1cxihYpeI1ZCBbByZRBICe5kN
	3ofiCN3h2vZefu51o1GxbH5qTPwGpMXYDiL5XQl7ZwRLJwmNuiSHKFnfxgpIY8UYl412i9PiVpa
	EGnYVjiuEnsRMyKswkkCQbPeNibVZhE+9hRSLcXomvQjuZWhO8bkvIpX0+8yAedLHZx++9US4Yt
	9RaDW2jltTgPXql9iq7N9iD0wuyHVKXPP0ONwK2k7iwqGk1S85SiFwVbMwsUe4/XY5fRHN4LZ0j
	lkSQorseCp8awd8FTtsXObhjnnGykFfxP2/ELSNcTMQQ==
X-Received: by 2002:a17:90a:d44d:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-35c30bc9833mr2769103a91.5.1774642433076;
        Fri, 27 Mar 2026 13:13:53 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d8f96e9sm1534085a91.1.2026.03.27.13.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:13:52 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
Date: Fri, 27 Mar 2026 16:13:14 -0400
Message-ID: <20260327201316.427607-2-aravindanilraj0702@gmail.com>
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

If byt_rt5640_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 103e0b445603..fce726a9c8c0 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -304,6 +304,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		if (SND_SOC_DAPM_EVENT_ON(event))
+			clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

