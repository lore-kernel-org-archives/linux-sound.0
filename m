Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825D3B5F63
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315403; cv=none; b=H6lbUOmGxcFAUI8LBDjgTZRqEguK0TOjXs0XxlpHuZ+9o8TG4CN1dNdPzQFMBzldKU+hcH+P4EVW5rJs/ZNzbxbWs7t2rJRViQbkaVKaWp+eqmSdSFPv+m9YDk1NvM4WpKlCzvyLoKP8S0v5r+tmQ+Urodm0KzcTDRwNsNIfVXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315403; c=relaxed/simple;
	bh=zEAIp01i3h10m+RYZSGGuoMikAPiELBP+Eozmgpa9VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnTzcroBDqgioMqB/FZHj4WW+o7Y8jQoRO0WxiLFuzsM5RZ2VSpK4PgtrXjlm5poLLxcnjW+4hAaLDHaXih9+Gsrh8IDvhTTHGPjkU+VHRkRIE5b1GkNFF9U4qVP9818/scdcIcHAdPhdmX+s/UU5UsJ1ncV3EdTOqxZDgXza3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNaNAFpJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNaNAFpJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso856766b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315401; x=1787920201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=GNaNAFpJmuJPIDk2LVYgqYe5OE9XMsh2VVANeBzsjTWYbrUJvXdSQ0/0FOc5CKdj3+
         kviJCaPn2UdoG8dVyxitWI8IsR+yuFax5opbTx8oImT1YDqAoSAotQEW43sPPuO2KgI2
         rX0NWec/VFKJMRtZQLv8xcNe2Kb+Lz1ttnDRrz1AzsUMdJnpeMhv8PySq+aX/bRUf+1n
         dXhLcVHNpG3LDoZdSfghN/ga/788TxyFaIs4goejCUtuX8Fxhqzy6JMxatl2MktFhtqD
         e75jvx+YZD89rxW1VQAGGCTFMs7fSEcYi87h+rjYLsUh8AbaOrIu8InhbKEB6k/kgluL
         F6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315401; x=1787920201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=fPZShJsixS9NHVQ4hqb3tLAcX3N/C8KHFn5XZMFHfXFRJGjfCalIExXU+guDMHosnd
         Iob45zwq4EaH4VLa58aZY/5MI6TW07obJDwvj9pOr6LyXm8Du36lZ7cRfB48jda2ZJkD
         vM13IPZGys0exIDPGNgjocnhkvSi7BW6WSDHYc9Dt/wPj/zfS/Mg6S7mypE+1M0rRcGl
         HgQbRyu1VnVMlZGV7lh1u0Uoki0Z2cz3UQSTItvn6QTjL1+GDHDu3Ad3f3Bqw4SEGvvg
         IhhW1OgCD9Ob+b6w4jZdx0ugbkYEnNgmbVM8wYY1iXTTAIWiZJvMLjtOYwoUx6t3hdfb
         q8ag==
X-Forwarded-Encrypted: i=1; AHgh+Rol2JAvny0iLKf5P4Yoag0MTeDRZJmEqq9m1w/5z+FemPGLnqy08gUNl/YCEpB3ygP6PCh7ETVGy9yyXQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mg60Cr5somFK3QRbOgSzGvIOS/8PAAb7b4VxCtuumH+gUkL2Kp
	mvRnZe/btxImH+9Xe0TDIyeNkc2TpxiB/ZZqBVZAqxybRyuaECW0+2Mn
X-Gm-Gg: AR+sD13Nf08MbUE6HbO7f9+7Xwwu+G8XMN2DxYmXPyttaVLjoZOMZcsY8/dgy09QFZ8
	O7iKHxDbsLDHQpDOWAasTtPynpH+owlBzOFcxPJ83rh3jsEQOutzlDYFbf3qqm/BEWkA+ufN/MW
	QZt28vfUy1AjUnv+5kJOLycbQytw9K6QiPI8OwtRXGDDkxpgq32fLoFL2ZXtvkbGfyTXdcoDry3
	B6mEaVfmW5oujPisKagGTHyGt6MCFnHfXsTo0jwucWIaTyDW2w5+RajL2rOOiCOdHWrKi53Y16i
	OZ4pTpWWElVMX3djwBecC2GzjysMObNiRvIqaszwcqcHqb5uf01LaB7FnirOWRcfb38J62j7PJF
	98k3skAa8NubhfI7f2v7aDZjO+8u3sN4Tf4olvJIRtbNGx5AAZl8ylSaYsN2ak6Df/E4y577Y1H
	d/xk5YfcghG/LCriShWEYkPaFu9IWWTtRzSI7EoJrcecxbUIaMz6ZFh62Wo21qDDMx83APQhnlj
	8F/0dMymxGQWjRyypZtX1wTk7SsqoEh+9PN/Ns0/9RLiaISa+JHmvFlfUSVMsTty90QQmcT0qwL
	+5a+
X-Received: by 2002:a05:6a00:32cb:b0:84a:646f:193 with SMTP id d2e1a72fcca58-851f969b3b6mr10656377b3a.0.1787315401447;
        Fri, 21 Aug 2026 05:30:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:00 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Fri, 21 Aug 2026 19:29:28 +0700
Message-ID: <20260821122928.41343-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

