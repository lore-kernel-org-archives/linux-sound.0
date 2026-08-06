Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D33B6340
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996671; cv=none; b=sOQMzVWL7nfdhwhbC0CmHLX2bOY5zBE/9+KpnGIfW3elvI1U022tpD7pLotmyVkI4Yz9impnQYJvsgTz1stK9nLc+GSyvj24tvl2vLg+TbpbUOCS6MO/bUZRIwxjbmid4INMKFq2gxju3uKoy/iLXYpb/A/j/aLmuCB0lSgf52U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996671; c=relaxed/simple;
	bh=DrBGGgIQ/GAEzdUNIITbBTRsJkVx2bZaaJEyT3B6Glc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIV1OAIFso2HErrdLlg3XxiLSrtwjt1Ok7PpvHbBHMnZUdc6NYdHYzjswUqxX4gH7Mao8ogjGM9/Tbz8ho/T2JaCOYnZfy+fOHctf4juxl259mvBPZRf6lrt/Ru2XsA/Jc37u0NA/Y+NYOm08eBsh1/jovg+UKtGUUPEgqUz0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXXHa0lT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXXHa0lT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1433113b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 23:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785996666; x=1786601466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqDHkvI2SXRN91TiJABa6QlYBZALOEnGXrfQeOKClZE=;
        b=FXXHa0lTTf23yK5v2wArxmCSPSmybV+dBibO7wBKRItVQ7XfAeIqcyRTM58xiyQlIq
         BE0FBl6duJkiJCNGPULMbkqt97a2lKyo+/yza51s2Z7vfeAntfORu470Kwf0CnFFa1VD
         ItfuD9OsuzjI7z/3rPqi2aCK+Hi2sqF9A6OHQB42PH13H9h5vXH4Gz8Eh83M4/kWbqay
         exL+EGbsyQAylca8aQm9hrz2hlG3Px2z7rNaLfGqHqwOEX/6sfUWKhBxIPyJTZ43QIQn
         Xw91HZIQF/SHEcZ6HHqPcE2trkoMPgNtTffparvB0TCKkTwpVeeN5j8kZ6N5IFtVygfu
         PVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996666; x=1786601466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqDHkvI2SXRN91TiJABa6QlYBZALOEnGXrfQeOKClZE=;
        b=YzAL65iIOuDb0KVGWJVcJveN9kRz8qD5DjSlBgHrWQCRonRp9ZrkcZ2NNDUScgHc0p
         Rnzlz4sk0GhEMXlQUWfv4YpWmxOlh3v9CP3fJ8TaJ+XSs3Bjr+h4yvqGm9x/WvwkQkff
         WkWLMAYiV23Pk/RBlY/zcNLvc4QXu7FtoE4Cq2EvFmum3HglLy4XZp7EYJLMKRLmTg3+
         vpgO/NS3uUOh9gnCZ+H3aMfwTQiu/QCUHvm8jLpPirqasgnK38CsF5FcRwuAhG7CWOoL
         dFIiuTr27huuyXkF87ngggaZGrxXTq21WVH4yX5QSqWNDZPvA14Mezw/mrKtGGWptsWw
         8Jiw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1UwapHsdGlDBZ8NfNCPY8tDel5LUAHOhpoPMeno29CH4aPsVtWzzGdM6JlFFC3E2TgJF30CmEgawOSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKk9OutnhWtLZBHuyIogqc+O4ONheeR+g7eB3udAVNlqt/LV5
	Ohy0C4A5kNBXXu0w0SQO0MdXPdv/EFXbm7qUS3E2+nfyrIonPDRF5ysf
X-Gm-Gg: AR+sD13bSNbeETB+lCnt3P8zVVrxeIG9oIQVuDapDp5SD/p4975OC6Pht+4WmpjZRqG
	zZos7qszg3vfp6OpPOTLnTKaGvx0BTVQCcd0h0L43aPrwfesCGOzJXUgvSfwk6Cjzx6VcB+ZGmI
	HD3LLxGq0ne7bW0G4SEBTkgqzoqLtJ6akolua/ADecM8l1NyQbC+xnl2lKBfKoIsjCQh+nv6AvR
	mcg95x8NTU/q64UivI9bu81DLa8c4JE1QXbQnNFUdtQmvNmkpA3y5QMXzYEPOyHjIvhEPx6oWTP
	2gQnvWZrML8Udn9EbnJr8lmTTj3e2irnQNU8B5aJ6c80kREAOh38XhWS038X+EwvQ64UOgAF49A
	pN1siEmiDlOY8YS7BFiPjxFZUFx/PdrcqdslOxinHwYGZS48mttfv2wZAzxlOOz3dFxsMm6hZ2/
	wvBfpQpkP9u0lGN0SP04q8AqpeVWakdNbdjWtrKJMab+mNxn4TBIJBNyhV8e/2VywvPx85v2YSo
	PqTG+F8ovfW4JbTk0MOjsHFg7SM5BAs8Hd23fHQdgCF86iUiHnkD4pyMFQwHoGyPcvKhwegVpDG
	LALE
X-Received: by 2002:a05:6a00:4288:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-84f2dfc8c42mr14725652b3a.2.1785996665854;
        Wed, 05 Aug 2026 23:11:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba322sm649086b3a.50.2026.08.05.23.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:11:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Tim Bird <tim.bird@sony.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:10:45 +0700
Message-ID: <20260806061046.25323-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() never returns 0. It returns a positive IRQ
number on success or a negative error code on failure.

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 74dfd39fd604..2e9fb79b1cd8 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -955,7 +955,9 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq == -EPROBE_DEFER)
+		return irq;
+	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
 		if (ret < 0) {
-- 
2.43.0

