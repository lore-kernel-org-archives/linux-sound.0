Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B2437F8DC
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401172; cv=none; b=n/z6K3apHygz4T3OBJm+WvO2IpkaZ4WAdJJgphG+d0Uyl449jYoU6JYErLfXN8IwXHAyVmn+dKuuIDFuQPPhQz1n3Kh3VTGk748XM5yxahzT2hmQGN4yOHQ0873ajWmLKMvA1x//yiLieJSJ1AZcrFzROEiVGmmqWazZiUHhggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401172; c=relaxed/simple;
	bh=YYnwuzA32vCrBS5jxPe5g87ui5erA9BMb2LXDj2ivxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TM+fvY28HermrXtRXmLm14fsHTeEi1U4Rt6t0IYOZYGo8q+LWyyBsIymkYpRPRwSCKe5ArKgsWwvs86quncRI9U2UOx9AUOvQNUo7YJDvpXpUESq7eZzGuakICOteZBHuMsWac3SXzjqBWU3ZY0iaVDaQpr45SkSAo4NPzxUE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BymLDJwm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BymLDJwm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-847a5528b33so2018603b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401171; x=1784005971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeTn14ndUmp4M0jbxxRhmn5UH5bvV8+qVb+FxPZ1/7c=;
        b=BymLDJwm8EXHr9dxLR3r+KG4WSqtsJ7ULMimFRSUHNT+Nceo1X7UF4tiyB/y7FLpwx
         W4ii46fSpTqhPLdz+5alnQ0StMkDbpczW2wsQqqsuvqLTFFerKf2nycWa22HmJLagCMN
         MWc6OLSVu3VlEonhlo6o/IEbuqVfrVzciFH6aaDJorCHkv7vCBLu0uVsI8SSEyraLzGj
         ZOlTp5CkDqWNFa7FqYPKrJ8Hhb6kMWlAriB2hoxnk1ytxGSRpXEkc78ltaWQcDGdh1BO
         dDHNbpApwEmK3+bui6r9SErIc9PLpIS0VLY3qD6JOYShHTQDzzqs3kT4zYDuuq7185Rw
         hezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401171; x=1784005971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OeTn14ndUmp4M0jbxxRhmn5UH5bvV8+qVb+FxPZ1/7c=;
        b=QE2rk6NQ6kfCJPcxlWV2Si89MgTmIuviBLVFmItPiqMt0JqcVkJXZAzlzWIVtbtYKz
         dopZ9p1oJkU0qx3zLx0y2vQyQZTpwVk/m3IRza/Kinj2HXHFGOT04I/Io2HoB3NTu/tC
         VB13u7TzQf0uSp4g81tCozUUkmLpC7dNjdCa6xBRZLlx4cdhH+kcdcKuS7s+fu3nDUVH
         W6gyqQRoTOcir5pRoA/GBGHurWvMp/9cAqw4jLR1ClE2uj2hpvfitrL+xvX+R2lCu/jo
         krAaSJ+c0kaZuv3dkUMOOM+8ve8nbw+1jBE4Wq8OAg1OWcOyYQwc/TUL4nr7EzcZB0pD
         m7PQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVs9K7MdC6bIme2ZexZp/wlqGtax4ve5TzpabJIdQvyIDstJH8apVb2SN1nzc/NnUOxI1XUA5L8zP+Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NJEKYYj+e9+y3/VFq5ORqWaT07OjVhH0ucmXVp1ZAOvqXELm
	0XaO0Nci4tnpa2OGrb202931+pcEvvmTyBIlhlArNM4TNJHulhFzVraI
X-Gm-Gg: AfdE7clpTlDZe+M6qRZB4rG9zIOm8Grxo4IhHcJ8wx9650faHHvQ2wXALvoV/4g280u
	atL5aTmMarjhoHBNqVL9WZav7eGy2In7uGLrCy9bYTYWEoKETL5Yymetx8WVnX2Ab0R9eRP/Mzm
	iNp6VhzD9tBJK0XBGfr8VRQJNawjTMCupf4FYTLzy+9akmS+1mets0lGuMxcnE9Ju9I4uzi0eaJ
	9Xq0bCU1cJ8wfAXt1KmujQ9YI1xVUmL2hST5wGN265CejhumoI1VJAZ963BnstmV6enU3iBTGDd
	p4UPfc7szuHhyoKejmdYBcbasJabrmNZtFqIrLPjMD1WJW/5yrsSILCEcQhbyArMlR1sNk13ewG
	7NLgBXlNVEsP0aUmg/G+3wHNrugKgJ7vBjCKfikmD/TV9M7UVytMfRv0KHHiuFW4Gfd6lj3AJCG
	wHjwR2OZ2Q1fJ6SakVaLYEwBxHS0T8UX7a1UQuJPcD++RiWbvKcVt83idzag==
X-Received: by 2002:a05:6a00:338e:b0:848:2f74:1d62 with SMTP id d2e1a72fcca58-8482f742067mr1273678b3a.72.1783401169864;
        Mon, 06 Jul 2026 22:12:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Tue,  7 Jul 2026 12:09:55 +0700
Message-ID: <20260707051006.20058-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the interrupt handler to use guard(mutex) for automatic mutex
unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
reference through scope-based cleanup.
This removes the explicit cleanup paths while preserving the existing
behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3: 
 Remove unnecessary blank lines.
 Remove temporary variables and return directly.
 

 sound/soc/codecs/cs35l56-shared.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..d5817e420847 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -640,23 +640,22 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	unsigned int val;
 	int rv;
 
-	irqreturn_t ret = IRQ_NONE;
-
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
-	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
+	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return IRQ_NONE;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return IRQ_NONE;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +679,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return IRQ_NONE;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +687,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
-
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
+	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

