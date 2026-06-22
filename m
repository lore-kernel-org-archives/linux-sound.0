Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA921ABBB
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 00:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782089796; cv=none; b=q24bMUUg+6TanNqeaJY0lG4OyumKyTUTGdYZHKgW3jd9cT11A+s6sePTqcVBHAubAnDFJ/8e0HAoduBln9oIHPZ08KdUG9jIZ8QxOQs/HmqxJqIJZlqee9vKHC7f0E1wXlpvoxrDinPEUZeBKah8xhzUZj1vAjBfJy2gosX2CxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782089796; c=relaxed/simple;
	bh=bAi2AvIZREz0t5VsZb35augqs3k60KNjOtN9MzG1W0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WV4j0I7MSAYH9P697Jc8i4iUphNfgzvBkT2dgcdWizJnHrwJzdPJB/WZgeVAKvWs/tVKo7TGA/ONC4bb4Id5BN8Vhf0POiz7dXNXIYmMQBJRI0jtlxJdCjZrPK+ONarY2FuNwzAIHakfoyQopQuZ3n8E0xNbs0sgClGxcCh/+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gemKaDHr; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gemKaDHr"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso3298317a91.3
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 17:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782089793; x=1782694593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vca/CKDASMzwEknu94jkYwLr91umSwU/eeXq3GdHWUE=;
        b=gemKaDHrjjxAsVDxQ7/adMBkyCUDhuEivYcYheczvWmE1WJS4+TY3Abr23PkWqUC0O
         wi6RoTgjRksqroMCsiW8cggc3UipVz6r/EZa01gMrLocO8lj7N55/+zoe0IJqaMF0UAL
         sROQWww4YPFndSSVFGQQg1R3qHj/ATeQmDzwLmdFBSNhQ9VzquCYHWfr41dRtq8O5XEA
         AE9LYZvptQOqfAayYPBt2b1+KYgpPHy044EPcYnuUf8z+qUUGlECzgQ5aHhfelSBL9XX
         T2HFS2I5R/ArA6bVpzEmfKDve6aanaCvVQ/vz2h1k22Wxme8NozM0dwTVybhYqxvZemV
         x2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782089793; x=1782694593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vca/CKDASMzwEknu94jkYwLr91umSwU/eeXq3GdHWUE=;
        b=nu8mgCJ5rrncCZCq87iKCwqj5j8lt5I2b5RIehom1Mu4P8D/9TMJg/QZz9BBoMOl0q
         iq4WIhdXrpG9cyNWhC14fDQmTEWmxQRldRhJ+iQN4o6Jo3zC54v08hFmNXYuLjfYmAEQ
         E+S2eaHxyjh5/e7TirBZfeelpORYWX2spxOvnD4DqD4EJHQQ6lhRyaS/SZeKsGdtz8HS
         LiQieSgEp0d5sQn96aZ/EsCGZzXT5R6902mibFoOU11AxlsFLOEvK2htCpebCpUE5kqg
         6arXU01O3deXrxS3hOK4gWSAFGmfORzUjtfzO62mgEtbM1opIgcOCNVmIr/ht1GX7/2i
         ipPw==
X-Forwarded-Encrypted: i=1; AHgh+RpusVGIRYzFlglEAa76r/w3lEz/HMVP68Z5hREWwKUJw4PeVKVbPtYh254mSLKGuPKmWftVwFA9AgezRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye4d6EV2WiCsybjygPd4XphYnOIuHrH4mbrJ/FhNl0z+DuJxDw
	O4VI6gb5gRcGrev792cxwfy7H8phZarTVe2Av8OS1vwzw1MUGKCXSbSd
X-Gm-Gg: AfdE7clt35x0k64bPoq4z6NJhTWO3/z6rMPUVGWI5X17prIm4ZPN9l9OCf6GdgMfPKK
	yxygWLo6cRHtJzXFEQXlzUihdG+xc/VrTQu1B5HQ506qMmM7FyhxHRpfRj9CYCnCj6YsYGudq1W
	oc/h8Mw3FHlg4I3Y17MLzGjspl2Uzgv3t4fJgLD10zRWx4qG63BuZ+VfKRLNgED3lKEE1LLrYfI
	xyAYNQGwAsVBcFPqlwhSE8xm9JWyQEV60qevoZvPB7q+qAuNwHijwI3HMagd0QqULpieWFXuFPR
	vFCNzEi6DEKYjUhiuoueencpZoQWCAFHL9E0TzrGsH9BsyeLF8EzZhNTUPd94FtSS9mJvwk2lop
	E0HycLra9TryKnX6fMQtc3dt2E+qOcNPx95cIJZszx9SYUD3GfTCgLjePolO9qDFkzBG/RzQHW7
	OyZBS13uqz/Jd1RUOqVcwqQA3DewQNmT0ZWCAJMlmkEdjv4PQ=
X-Received: by 2002:a17:90b:1d4c:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-37d1e8c9b8fmr11813445a91.15.1782089793457;
        Sun, 21 Jun 2026 17:56:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8d829sm5441326a12.1.2026.06.21.17.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 17:56:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control exclusively to Runtime PM
Date: Mon, 22 Jun 2026 07:56:13 +0700
Message-ID: <20260622005613.21870-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Although switching to devm_clk_get_enabled() in a previous patch was
tested successfully, it introduces overlapping ownership of the clock
lifecycle. Since the driver requires early register access to read the
device version during probe(), enabling hclk at that point is mandatory.
However, relying on devres for automatic disabling at unbind, while calling
clk_disable_unprepare() manually at the end of probe() alongside Runtime
PM's autosuspend, creates redundant and overlapping clock management.

While this mixed approach might not trigger errors under normal test
conditions, it is architecturally sub-optimal. As stated in the code
comments, Runtime PM should exclusively own the clock for register
accesses after the initial configuration phase.

Clean up the design by:

   1 Reverting back to devm_clk_get() to remove the implicit devres
     enable/disable behavior.
   2 Manually enabling and disabling hclk explicitly only around the
     early register access before Runtime PM takes over.
   3 Dropping the stray clk_disable_unprepare() at the end of probe()
     so Runtime PM solely owns hclk afterward.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Links: 
1 This change is based on the discussion around manual hclk handing during probe(),
  as raised by Krysztof:
  https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel.org/#t
2 Background for the earlier devm_clk_get_enbabled() conversion:
  https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/

An alternative approach would be use devm_regmap_init_mmio_clk() and let regmap
manage clock enablement around register accesses. If preferred, I can rework the 
driver accordingly.

 sound/soc/rockchip/rockchip_sai.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index a195e96fed0a..ebb491fac77d 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1438,20 +1438,30 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->mclk),
 				     "Failed to get mclk\n");
 
-	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
+	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
 	if (IS_ERR(sai->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
 
+	ret = clk_prepare_enable(sai->hclk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
+
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to initialize DAI\n");
+		goto err_disable_hclk;
+	}
 
 	ret = rockchip_sai_parse_paths(sai, node);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "Failed to parse paths\n");
+		goto err_disable_hclk;
+	}
+
+	clk_disable_unprepare(sai->hclk);
 
 	/*
 	 * From here on, all register accesses need to be wrapped in
@@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
 
-	clk_disable_unprepare(sai->hclk);
-
 	return 0;
 
 err_runtime_suspend:
@@ -1493,6 +1501,11 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		rockchip_sai_runtime_suspend(&pdev->dev);
 
 	return ret;
+
+err_disable_hclk:
+	clk_disable_unprepare(sai->hclk);
+
+	return ret;
 }
 
 static void rockchip_sai_remove(struct platform_device *pdev)
-- 
2.43.0

