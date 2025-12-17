Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F035770F
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765968449; cv=none; b=r0eX7OYxa09M5rQYvIHFcQ+f0oEQESFf+yTaWY5tCnLEF4MbRgGgbOLLuGcm6hzptYFA3uLm5is3xtXIaMOZefv7mws4ZGO0mno1MPYR1qsU3vMxFPlJpjA1qa+mnAvRyhsy+4BaVera/sd+AMMdeFJUdnVgUAykiYWs4N0hLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765968449; c=relaxed/simple;
	bh=x2crzMrwC1YF1Uj6aI9F/aTg0iMkHiRCUhVdgtWjS8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWIq/wRBnR9VFuBmW3ZlspnrD51ShekJQGcEGY0kkjKMjPdUJJigIe7U39p8cLfdGJFA3WX3261lQtMmsPjoM/udiN5wjJJdP/gtvxfE4O9/dovk/wagl9737AdB/QgKepqkdH9/bzP7g06VW1tPRnyqvBRvjYFsW2ON3AxeRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFEO71BH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFEO71BH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477aa218f20so37626345e9.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 02:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765968446; x=1766573246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4JrBoh6ZHRDCasNvYBX4L6Fc3JvSnZBFF85CYLlaotQ=;
        b=IFEO71BHsjScCS7lpKlFO3qsWwPCA4BRAPFdFa0xMfaPEhQSioRw1jaLI1Wf1PVb+K
         InukhCurZx58mqQpK5/unv/NuNf04XNEpI6tb2VNHbDzBoSqdk0ilnOR6DesiRfWIHFE
         DMndV2l5qThspc2imJeP7g7KUmF+7csqmUnJxAzxKQNIBJDdiF76HmiLiGxdm0ljFgel
         o+4UFSqOgNdnWgAZ57weqcrdpYHbIcDDMCAL1gFNfJmKtegHEuV4H4QTdiBm+UED/avZ
         /XR8ENUXyJkQxiq7vrjPP8dWjUEf1Qj8F9zpK3lY0PHIv9YDX+Vua15Ktn5eL8ks5tYx
         75Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765968446; x=1766573246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JrBoh6ZHRDCasNvYBX4L6Fc3JvSnZBFF85CYLlaotQ=;
        b=GquZMTzJdcuwrE4f15WUmCPE7JVKIYEEedq6/W5G25bwCb1V4UjlPe79VjV1UPVz6F
         zfnvUH1DmZ0OuZNRsMwPdWAQQ1ff34nXyjySzXQKG11qGGSJC5bHmBtE/SId6kcuETMj
         kX1R6LwFYxDvVjpDbMKrzVGoYYguzCnHQzk0D9OZdBrswMrEhWZnhjLBcyblEwc7YNXd
         jdJYaO7nRaxZ16rvSIgjZ68fEIXrdp61+X6CRLFfrRc6e6ZLgFP1uGNs2iIcSTXK9Lfk
         f/XcZamZED9GOhGIOQjmlS5fCV92pY3j+pFcYBRt8k+qFQaqFCQEkCbdtUmazoU1Y9rD
         UPYA==
X-Forwarded-Encrypted: i=1; AJvYcCW6f6OKwhaG2RiQwyDanFcAKFZlO/5eKI5giG0rsYW9Pq01owz/mkAnuJiMS4DtigW6/0e+CMiOy9c1Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz20Eyv8yW0u8VVo0gVWJbcVsUrpy1zU9QgAgbb1m1Yhu+9HlOv
	+4IC/Of7ONNF2DO8tSF6hsnCH9cCX3T9WnnerLndUwIOG5QegQbPVzGx
X-Gm-Gg: AY/fxX4XpqThjLNHU6pIA9aEpCntE6oxrr8ythUHMsIId4js2iCzGIiyPAK2U9N2/+v
	FaYs6+am7kQV4DQetuaqzLNrpdObF+kJwFI/I7QMCW2T8oUFqYue0aRRWjBia0YpbJw7WRnO1gJ
	olXBiyR2vTiM66ZOBoGu4joC2Wh29qsG0aeSQkgXCOpPQT4BdyqCm1nTF4xelQbns2XpeybdwiO
	Vd4Yz0KvNWWlcgni01PZZzpZ1yygWy5G9CRCGojJPoc5Tqr9Dqw+9e3W62geloAiOoAXXSRYmXP
	QhybIGIVXGo7WsybcichCrVubselRw6PQ8xC9yjfcunD2FXw2S9jPpla41aCSIga+zhOUeplQ19
	YBTgWPFiqaWeeyL4WnTXWunlmPS0BDpERCspPVJpMlUTJ19DOztsb7z0S2MY6QPqcmTKGulIbew
	ApAmGPa0dIPQ+J/g==
X-Google-Smtp-Source: AGHT+IE9ogSuZjkOdNM7usVL/c+ivA2aguGNrJCKqrLzx3ayA8e6EmMBTISExPe4ocx/2ybifO0/Zg==
X-Received: by 2002:a05:600c:470b:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47a8f8c00d1mr160023635e9.9.1765968445675;
        Wed, 17 Dec 2025 02:47:25 -0800 (PST)
Received: from gmail.com ([136.226.167.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd95c8fe2sm32873305e9.1.2025.12.17.02.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:47:25 -0800 (PST)
From: hariconscious@gmail.com
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: codec: rt298: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
Date: Wed, 17 Dec 2025 16:13:58 +0530
Message-ID: <20251217104356.60839-3-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace manual "request_threaded_irq()" with the device managed
"devm_request_threaded_irq" to manage the IRQ lifetime and also
it removes the smatch reported warning.
Remove the manual "free_irq()" in the "remove" function as free_irq
is tied to device teardown.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch replaces the manual management of IRQ with the device
managed IRQ API. Also, it removes the smatch reported warning.

sound/soc/codecs/rt298.c:1298 rt298_i2c_probe() warn: 'rt298->i2c->irq'
from request_threaded_irq() not released on lines: 1298.

Removed the "remove" function as IRQ is managed automatically.

Thank you.

 sound/soc/codecs/rt298.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 02247593513a..7d532a5a5f73 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1282,7 +1282,7 @@ static int rt298_i2c_probe(struct i2c_client *i2c)
 	rt298->is_hp_in = -1;
 
 	if (rt298->i2c->irq) {
-		ret = request_threaded_irq(rt298->i2c->irq, NULL, rt298_irq,
+		ret = devm_request_threaded_irq(&rt298->i2c->dev, rt298->i2c->irq, NULL, rt298_irq,
 			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt298", rt298);
 		if (ret != 0) {
 			dev_err(&i2c->dev,
@@ -1298,22 +1298,12 @@ static int rt298_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void rt298_i2c_remove(struct i2c_client *i2c)
-{
-	struct rt298_priv *rt298 = i2c_get_clientdata(i2c);
-
-	if (i2c->irq)
-		free_irq(i2c->irq, rt298);
-}
-
-
 static struct i2c_driver rt298_i2c_driver = {
 	.driver = {
 		   .name = "rt298",
 		   .acpi_match_table = ACPI_PTR(rt298_acpi_match),
 		   },
 	.probe = rt298_i2c_probe,
-	.remove = rt298_i2c_remove,
 	.id_table = rt298_i2c_id,
 };
 

base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.43.0

