Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB640242B
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524744; cv=none; b=MNoTF96I0VhXbVV5NBr0dCDp5ykR9yvT/5LXUNalZlDS0fUvQP95PUE3s+BSai+As5zw48KPVhyu7XhyGSlImUQ0ojaocvyDurzk3weTBlcTLSUQbQgNg0NCKh6WURYRdu8lRV9TkrP2845cBpdY+ASxqi4IXJLMqqM37WTQ4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524744; c=relaxed/simple;
	bh=nCiy2DUCpShDd+3DXepehYcep5suGKpuWAHwrwbI9CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DS+eGs1wx+ZzxzkPS4Nyac73R4mQTtjLF9yFyZTTsEVuGAsIv6cKQ0SLezBMcPl13TGVPOFPrw6SzD84tkIYAAUNpDZgju/sJ4+GDdLM6SVunc60wI4S+gClWSlmCb+lM5WsWePYBcr7+ZAjBT9Y/j0XCg4GqCyoPS/AhrzueFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppt/sEKs; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppt/sEKs"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3900e39d935so951493a91.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524743; x=1787129543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5aGmw597IIRWNnOHjKAFhAAnhhQFEcLMwp7IcdSALMM=;
        b=ppt/sEKsUAwFqeGqsKOyvg8mbSe0xWnsn0l9rfUg1HXjvm/TvCEgupi+0Y3xwVnCvw
         3EqIsSwzkc5hFBHEpAT4hdsEShyeS7hdD1kooZE0eAcG8qxp690PSr2Bo+MYn4dwwV1c
         5dGGMpR7dg0N+CGpRw/6hs+n8voEHqiOmYGsj/F4m9BldjBFl7gdSAMjrsjKxCBT3cHb
         RvXaGBLg/EykVp8TTnZ+q4e00Jn1nz1C7CPRSM0uSvsRfpwB20vjO2VA/IwBJAKc+ki9
         13b/T4QSpkO2K5V6BxKlBOHn6CAzMpIpIHFCBLy4JzUWTf6UGi0tPmu+2p4Dj4d13kIy
         MWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524743; x=1787129543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5aGmw597IIRWNnOHjKAFhAAnhhQFEcLMwp7IcdSALMM=;
        b=APRbdwcOVDPl+DXog8OqFam6z/OVwi3rLjJ5QatOgfbSyCMe3BqFUWvGG+0KMNIIDQ
         HqbU5d2tSFv/xwhV2WfGJIovsKjJs6pOlvf0UwoauvUkIOdEKt687TMe+uUhRuJdRXd3
         FJnq+0eco+fjWj0tyXspv/4Gr9x6CIy103ROlPHUIXSpPKKKqemPR1RSy2aAo9E12AEz
         2HbKfQb94wVM8a0UxUp5YZEaFQiONgB++odl2MdS+Og2Sr1aZh3uwleMcBdB6QAqKLnP
         x2+d4BG3RemD6hg4Gx2VoHQhLFDr+sGOtf2OspcsXQh9mPNgFo2s7TSlLazAG7O2Jb67
         WG5Q==
X-Gm-Message-State: AOJu0Ywg0rIoQSJe8iO532qasAsp4qy9bgGzN3lyoVFGnKnIDbkbr1d8
	oui2jN393nDuTkYar/PuncaLLqBZg2fuhk78PpZvlDcD1nx3gK48bsYgupC2aA==
X-Gm-Gg: AR+sD13WRaj3FgyCXc29kx3Q79FYIQPAThez/H+8bK0fpdbfu8nFBr9Fto/OKJx3T8Y
	m9rTMSHSKOoy2/9lzJTwZZ7bXjR81IB83UkhwY7B2ZO56eKG/7CIasTnwhFoSPVd9p/M+X+vnVP
	gTK2BLBF9FSp1GND+eZw2kl4B8+U2nWov6exJFBR+gYDY4mT3xb7ObOjY+v+IDzVSs7EeAJtP5X
	FHuCYHdilxGf0VntMloeIa/98l1NMtlj8ZgQMKnJSGUJBPITiij8L9yAWLAW6XjT/OQGfVBYgfb
	l1I/ZjWVSnH+X9RONQn0Pf4bWUZGJOPFoo1aaXZqYJ6DF6RvlM5TtztHih/3Yje7IW2SlRaHd/I
	QNwwyFBHJZHIiE9uHZ/3M4ynFIXky4p9k011e2CAmVEfu8gPXA+vaD4hLF7YezAU8NmliuMkDoo
	WHuF5Z9vWNNgtgnDlvldp6WKPZhTrDDShn3oOzzugVIrV+IGK1kKICdpGrIb9UYhn03OiEyCZX7
	MVOul3E9loOJ9udlQA94/zIMvoaLUAQq6qP2nz86h26L8Ptcs7jtX1+2pc74+WRYsJ3yujJQwYE
	Cx9g
X-Received: by 2002:a17:90b:540c:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3930124d1b0mr3818301a91.1.1786524742709;
        Wed, 12 Aug 2026 01:52:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ASoC: samsung: pcm: Use dev_err_probe() for error handling
Date: Wed, 12 Aug 2026 15:51:30 +0700
Message-ID: <20260812085133.29658-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Cezary Rojewski's Reviewed-by tag.

 sound/soc/samsung/pcm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 309f024bf2a4..7e7284125c3e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -499,10 +499,9 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(pcm->regs);
 
 	pcm->cclk = devm_clk_get(&pdev->dev, "audio-bus");
-	if (IS_ERR(pcm->cclk)) {
-		dev_err(&pdev->dev, "failed to get audio-bus clock\n");
-		return PTR_ERR(pcm->cclk);
-	}
+	if (IS_ERR(pcm->cclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pcm->cclk),
+				     "failed to get audio-bus clock\n");
 	ret = clk_prepare_enable(pcm->cclk);
 	if (ret)
 		return ret;
@@ -512,8 +511,8 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 
 	pcm->pclk = devm_clk_get(&pdev->dev, "pcm");
 	if (IS_ERR(pcm->pclk)) {
-		dev_err(&pdev->dev, "failed to get pcm clock\n");
-		ret = PTR_ERR(pcm->pclk);
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(pcm->pclk),
+				    "failed to get pcm clock\n");
 		goto err_dis_cclk;
 	}
 	ret = clk_prepare_enable(pcm->pclk);
-- 
2.43.0

