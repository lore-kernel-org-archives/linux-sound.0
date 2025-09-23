Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD7A48
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653458; cv=none; b=OLpYwRUId3Es1jYaAjEN3WvxDhT6edVzw3/3KWwiByHfx9/xqySiUjQIehFOWxsN3Q7Uikr01AiYYsOQoRakrrAIxWV1tGMmlTrAhklJVTg3p46DurvX/VCG+0nbmM1hZ4XJQndcZa2GNasy4VMcxlk57dphxodFDDHze9Mq7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653458; c=relaxed/simple;
	bh=qa2NQh9RJDy9WQ+d31yHCVmbVNa2k7cV21sEiSC75R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eCZnwDkuQaOknBfkbKAf4viKynaVaW/YrNTuY0xeo86hu0oF6wQR8Thn7V50P9ed4t94F+Dk+H2zh639slzdbRtIEOPbQG4siqa4p3nM6n02XEi94vI9nuoQrxHUyvqKBYcwmthXujw3Uvg292fCpB50FG8uEHiqn5H+PPWDa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1k67Flz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1k67Flz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3303531f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653456; x=1759258256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EizzNWoZUikDV1FxG67Kon1XSkcUmIn52o7zV6bqtSg=;
        b=h1k67Flz3qUI2TV5NVFwLPnp7skd6mANpk3RMlWkk4kqfMyuEi3MqqKr78hB9ctPap
         V6E6cJ64lvO+fZJXXcoXN1+xCG6ncst0XCNG4sVkbrC19TNlhUo3knLAu8wV9OhF48gJ
         aHgIOMtRMeoiMoEoSy7e5mkYgLvUbQAWy4OkDbT7bs3/L1Xn1tf893J0J68OIUudCL9S
         wLW6yQxB+RWisbHc/Inv75sApkoPPXiFyLnZ/WghICR62UmWIkhbFhhkuANt10KX2WkI
         9VFWFUGPFLvttj76MOotHFb5wn3giXVBbYC83herd+RppgVTOKJlJuWtbaulUkRO2kz7
         Kt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653456; x=1759258256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EizzNWoZUikDV1FxG67Kon1XSkcUmIn52o7zV6bqtSg=;
        b=U6StcJ2XWO3xfRkZox1LKnh4neAqRFSBew7hpFQmbjLeqC7NjbVuux3Q6YIixhCUGa
         c4IWltTmANEd0kk6jYm8c/ArQqGZn5HyaDVs5QghZBoX5uyUTdBU+1sS/RiQq67MK5YP
         +APIjL1L73BGm8TjnVZapz9hTdVaBWchNagp2ZTM6q6Ja8eV/wGjJs+nNo02PCwIgJlh
         0/cIBZskqVc0O4HEzpAig603nzzLmElu0F/KFFGRCF3DYUJWXQFFaEx73r8pj41LpM3J
         rlwsdXCR0JJng59G8+i9+jceK6pLMtYzgjbCkfrufnzfTGPwvOl8a4NDtGxbeRiB2cW3
         GFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCcXAPs8LyTxvJggEAC/u7LKB4tU2wsPjWsE5AliDzemXGaJbfQ9QhCCHIO4PXm+3eq89JhESUt43aRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6MzyXx9V6KzL+p8Ne9bSbnzo2turOMai7KzQJ4TjDI8v57ND
	Dnih/SVxtDTf74VxeMayXpH0CiM7c01UWfWersmkldyIa7npwwrw1PmO
X-Gm-Gg: ASbGncs91eYLZ9R7q72wwwK5Lxiy2hA2wwgMU6/IqffT2WHlcPmryQ3CzY1qnzDLVEL
	UdpPm0LJSMe4p8S5uXr368J0sdl9vBwg2HolLxWYb2+6c9Gl1p9YEduVCbRnnfS7APfsc6ayNi5
	m2bJD0bE1FwCU/ZqxK6Kx/ELbBl6bWb1j9KLXXpuA6MRJf2Rv4g3etLzlersZibTyU/Tzj/N87V
	mxSPKLmAAXxgjchsy6xqF1DiIMXwv3zCszMP0NEI1scNk4R0ZIF2VuD7pSlJ86Ns4Hqi9Fc7KVq
	bG5OzXA9SuRGlUvOWtMnigD+PCoLIH7VrsBl4kUekDyLBdIzPpycXua+es/0qI80JdRvL1X1HAW
	XlZken3LZAYZ9sE61ZIkdRw==
X-Google-Smtp-Source: AGHT+IE2Au0RbnAAqqWNX3SWN53Mr2OlHht3ylbNddwR+2vdZFFql/xTJVTdhHclfhtpTGY9FAw7Jg==
X-Received: by 2002:a05:6000:615:b0:3d8:3eca:a978 with SMTP id ffacd0b85a97d-405c59e17c0mr2834428f8f.21.1758653455458;
        Tue, 23 Sep 2025 11:50:55 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e24835b32sm22658075e9.13.2025.09.23.11.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:50:54 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoc: tas2783A: Fix spelling mistake "Perifpheral" -> "Peripheral"
Date: Tue, 23 Sep 2025 19:50:06 +0100
Message-ID: <20250923185006.213861-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_dbg debug message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 3e03e68932f6..3a869a101844 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1229,7 +1229,7 @@ static s32 tas_update_status(struct sdw_slave *slave,
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
 	struct device *dev = &slave->dev;
 
-	dev_dbg(dev, "Perifpheral status = %s",
+	dev_dbg(dev, "Peripheral status = %s",
 		status == SDW_SLAVE_UNATTACHED ? "unattached" :
 		 status == SDW_SLAVE_ATTACHED ? "attached" : "alert");
 
-- 
2.51.0

