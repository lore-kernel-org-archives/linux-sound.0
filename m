Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3063C1D54
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893569; cv=none; b=Gsf0Boss1QIeQxP2OmOLV8SmJREEKGRYtNSmMXD6BVLOAipJmQeKjM19Wkxb6b2al4/nBRvuGDX//SD5aPIB6FEOxHyYopjGnVzr/GGUtFzG6v4DiSVD1sgGjJjegbeXnd+mSlYOoviz3BD7bMhvGbFrh/9GgSLxq3nDO7BTYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893569; c=relaxed/simple;
	bh=cLd+n7EV3Kp2AMYVFp+K6eTGdRe62zWUaZ55f+Rfna4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfRyWkL2fzQz/m8Jitg5hC7ParlBWJ8LgDtDmorh5Cy6JcTcDDcwSfswJkYQQjgJxg3rP4GRS3pm8A9ccAqOZKZEGPlgWQU9iRfpvcQnM2F6AoAfDaNEKjGG63D38TX+fenNnu8TYZOtj8eLfZiV5majFADlOTNfHVBLrnzzhiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctMcMJsY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctMcMJsY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6f624c323so4929005ad.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893567; x=1788498367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=ctMcMJsYBYkJ1KhZnzc7bQjPaDpJ0Akde/UrMJl/QE7O8osayY9TTQlnNt4iHOSgwT
         iGJa5vLdBVZu9TgHc3IL6DSy9Sl+nGEyQf3QS4IMswkYF6xEQd2FPtw9apL9/CrsdGbf
         fXRC2fE3anb4oa7iTAhNO3Xb7NQbz/n3mLkMqNRJUdrqwrAfUYI89j6j7t0XR6VbdEqm
         3Yu5k7pOB8tkjTMddVvNYChX+G+rXswrE9BtwZyHtluFsnccuJ/B+UvP6OZt/5I5HcDY
         6BVSpE3Zjuw5UMSU5UsINGz+8Jzj/Fm9DkCOtzKiFP7zQbE2ZKVtbY6tQ5LIwlZUEfCf
         pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893567; x=1788498367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=i805a786ZmmPJ49VR3qBIYyVWsdLKYmoILQmlwJYq74DALDZsDZEWy2EzqzZeJOsQu
         KytLr3yLmoOoD/OfFFTXgazdenBuTShA8tDSjMIucKATLvjVziZaSYcvhEbAYuSQ1hDK
         +KjsnGogqDHgR6AzQSW2Lv1BkK+APdrP5tQu+owAXsK6knyV3ah/sTeICXhLm0TxvI3D
         PpLlrrZpmtlQdMs0R1ZFzfW/7Hd4MlxE1GWg4JcnnWHQ+4TSl9wF69zqS62pwMRUeKMR
         JinxQ6j4/WF4Nq9PGFsryrWdyAfSY/sVHflTivimvaBr5ys/oYH2czYeH34q6sm2BEBK
         f/YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMj823TCz48kpirOInXMPwnw/hXQ/umij36BSjrgx40YmKlYcP8rTD5hQyxT3IigNR2JvJxGWr9DM/Cw==@vger.kernel.org
X-Gm-Message-State: AFuF++lK9SykdcIIa+DZFmikmqisUwBoinmlxkgpt3PJlUA04ARy2WaX
	VCjvKS+a41UqGKhBKPjFMgnh/vKE85svDD1u+OEP/jtJUIILsymvO+ef
X-Gm-Gg: AR+sD11CKT5tBhpm4PHt4zfIjde7bUcFZpjFg3fVC+ZfICSOKNj6YOS+eLtjYqCpZdm
	2mNtf1iJ/jLUzXSHq9zlrYgammHu1kfpV+RTmmjmlU1NkiZmaq7KxzHvPJjRt/7E1X4vEeoZ4iq
	RF+8d+dPGAkZ6gOmyKHmx0mu8n8xRnSfmJObHWUdiX8tsypgqarWL07K/h81UfeDTJELghUdGb8
	rYmeuqxRNwaa9IMz8lMXyz8gL4GXSFQ4CAHvaZx7Sa0bmzQuAVOx0rmG9zNCa71ga7LVq7B83+x
	FJaWLYoZnnjqlvpR6Ba7VV9RTieU5ivk5cI8+sMHKDCABsQKMgST9qJr6FbuWszeXUNx83qotnb
	1wF69Y0nRYQ8DNPso5rsOczvea1uE+L1wsaQhJ2hPcUWcN1AgTJT/Ac0GujhYS+Xhhr9c+u2XKY
	bX2up/Ar3uWzG1lk++ellLna4cnsewpPgE1cfC8UfJ+OwXSXvM/7hfAtXz9UcUuqNpaskXSZ61n
	0FLmFWQegSTi0+Xn7kxza8fAMCIrIarJbolWJw+uuhKNGpBPSd98HyIY1gJX3jVnOdod7s4v39R
	3qtmzQ==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr8743391a91.14.1787893567319;
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 28 Aug 2026 12:05:25 +0700
Message-ID: <20260828050526.590761-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
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

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 43d5898357dd..c67424bed329 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

