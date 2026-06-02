Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5851B3DDDCC
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400714; cv=none; b=tecEEHHVCBqS+mKcKPrzggyTSkyXlRoH5G0ktI9PiJthzbI+qIsrndZlBnxE5Ka17UA00MFhEfabm29+QhPJcpL1diTuiDyq4zbjAnrhdR2bSJXNX+ZmiVBZlJjXKMgoY9/LazIHrzF5mAi7BFcBJ2JnlrwolAKnGnsf3C6gif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400714; c=relaxed/simple;
	bh=g8eArW1TvBopeg2TBOy3CcQKAvBFhzMIU2WVF3Mqh/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtZOrHnAaXNT2d4d6KFUS2F9ZduaYtj/NGzfo8TLSfJPvhUgcFWTKA/1maSpTal4h5O44iZQvme45hDD2fzff4JQZAKwSakXDAgxReC5p2usoOM5PX4WS5Oa7F2FgDqmc9Ys5gDsorJ858OSEl7D4wEiyw1JG4TBsmeX+G+jnOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8w3BluQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8w3BluQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8419ab3a297so3572794b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400710; x=1781005510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=;
        b=E8w3BluQWbK6ucGTjnyPUiWhPA/NrqwAOQN08PpRWqKsUh3ZLnYn5o9IzxJJKcx5HY
         p6IGhu43imCskegQtR3mq8VeDgTjFkYH4cT1i+scfjO6Rj1CUwcFG8LslUFVmiAxhk5L
         LLfopGAsAVEbDFPb9kaRaIDaqKtIX/j6xlZ+V0vH6aWlJQZBa8r8Q5mtWsDMyApP6Xq6
         civq4aszV/gtZtBQRJIhtymifwhWrK0MWury3/RllA6drtOLYDdnlaEO7jqLClJz/iPU
         AAEoIdxD5ipTKqJj+acB+zzyLeluPoDLgf4gZPNljqQDbB22mFHJHnlplMlWPH5ehs2O
         6QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400710; x=1781005510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFWD1rv/Hg1YLyvj0G8HeVU1rR/ze4TuYTUo6+4aG1k=;
        b=mvEVs1mVWQjm2UI4kkDa8oeVffqAZikvlv4z3QhNI/uKk2Ypo0XgEL6MhY3OgmDmhI
         EUNnuGBHW337IZzN7DTgumPkLnoGRngBKEZDVgfcAOz4/B0BggEuNbkvZPIXSueV+wrr
         4lNwW5ig79K07ZPrtD+Bgh6AEuDf6jO5vnv8wE2ZGTUFTUhgB0KUMdBj3/yv+/npzoEj
         n/Aie8rpV6wlhClQe5SsWAtg2/ZVoCy5RJTui5ChvRrE7an6mSC17F+B37MrdxbWDM0N
         OGLnJ0dpt128ccC3J7M22n/uHDCplIQIss4OovSdqZ0kWqBeKKvAnlwNK81Ycod6oU+H
         nbGA==
X-Forwarded-Encrypted: i=1; AFNElJ9fZUOn+93Cv3ngPCvPCTRI3awKviN8uK98VeAgkWBBdR0mKWMKG7brKh/St7/osEbjyXL0rihozko1zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6V2nvJlvW8lksY22CgzPV699UDWhq1G1FGVAs2gMXb9SIPBdN
	4oyDKTBDXKnGNAhHUeLwPQyNtQiJHEZBy8P72fFt4mNKFblDJLrmG/NG
X-Gm-Gg: Acq92OHMAuzsVFLa0olqwcwpq+dxHBPvy0IW3+kuZjb1xyUYu6occ9Goizob1fm6KUW
	djFXpMFwXjAxZFiGFiabhxc4PdOgSACZG2PJb36H1bTtpr7rgYWIyLPr07YhWfYww1VgoQ8gzjf
	4FAbwoRZhVLpTCeMVyfu1kSXZCYNEaBJOGB2I6cKfKSh+t8abohr6KqDxkgrlqTtWJ6sSqCuqlf
	cpvdxwbFd7b4n3x21JUXwuFnDV0AhKx0igNgKdR2FViOi8mkRd23nYnrcsr/pJjXiz6n5raa7QT
	PL/YqKm8Ep/aTaCgXHMDs6dq0m4e6vNi5im/pHszVBU3Jdlrvl0xjQwyAMxmI+wpg4ns/nV+TtB
	a0ZBL7wlOFwQrvk4zRmxDwijdXZ7sr9fFOVpdyT9bULfGZWLr8AVtPXm28knAp+VJupzv4yVoUJ
	89srcmHylHTp3OdwEHDZknmBVCjpTZY6NDQnm2XCRtW1CHT3wbi55wEiS4Wcou+H72eiWJ
X-Received: by 2002:a05:6a00:2d09:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-842600445ccmr6078561b3a.29.1780400709999;
        Tue, 02 Jun 2026 04:45:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:45:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 18:44:37 +0700
Message-ID: <20260602114437.50324-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder the runtime resume clock enable sequence to match the hardware
dependency and ensure symmetry with the suspend path.
The APB bus clock drives the register interface and must be enabled before
the functional module clock. This aligns the resume sequence to be the
exact reverse of the suspend sequence.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v3:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f54eb14c9ed8..102db1a2afbb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct device *dev)
 
 static int sun4i_spdif_runtime_resume(struct device *dev)
 {
-	struct sun4i_spdif_dev *host  = dev_get_drvdata(dev);
+	struct sun4i_spdif_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->spdif_clk);
+	ret = clk_prepare_enable(host->apb_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(host->apb_clk);
+	ret = clk_prepare_enable(host->spdif_clk);
 	if (ret)
-		clk_disable_unprepare(host->spdif_clk);
+		clk_disable_unprepare(host->apb_clk);
 
 	return ret;
 }
-- 
2.43.0

