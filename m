Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6F2D47F1
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387487; cv=none; b=mJeuRMa2aMumn+ojzhzYq9XZSpr/SNKoKYcjNhq0wgrf6T8IUh9uI9nzQQkQoNcfHkQxfQL6z4QVoaavj9jYMwHF2/RuJCafvGJ3aS6GxTsaRozH+uGQtXJP8I+Sf+mM75U2j3cayGT0dfpHmgRsRWAcs5oJalcmDMv161XOeAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387487; c=relaxed/simple;
	bh=fsJdleZzoRbMiMfu5oGVOOwBQHRXhD3q5sK9a176n1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmL4H2v9FcxU/gYLl9yZkT1v+ah3pZ0wHiRkes0b5qSY3238DslA7WM3MAJldbsx3O8iHwlKYlgD1Ym/xR4me6UcmR+NlmxVwEzMPks2qP70QLvVfl5271ADA7pdtt3SgMR8a0Y24tYmM2+Vl1Lh16mmlWXUoLl3XpGndELBpKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsO+XdlJ; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsO+XdlJ"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8114a4542b2so55227397b3.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 18:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783387485; x=1783992285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=;
        b=LsO+XdlJhoY/Ujq2STpa6mYzCUd/qU49YdwRC1+CUgcAjeZ64Je5MSVQiROZPoQC9W
         awSSkeof9uHIC54NELZ2VqksL41VlspblYBejld/V/C3Snd1r/7GoOaxcUMT7RD9RyZM
         MlpV+XI8ad+2ubC8gjJsXUidTBR9vFy8loKqiwR8gB/wHcvtqiU/8fuzWX3g0++cYYiD
         +MJhwZiohG01d+dh1QAGR7hGG+8hYXLNtnBpWC0G/VPJLnLNugWsk4HuwjW3dFvQG6eQ
         Cy0sBz7T21n+I3jHIeY2DfFSCPFwqPctwjKTjHRmKZPAVh8D6eLYnZmw/RQ8Df7dBVHB
         +SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783387485; x=1783992285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=;
        b=nwQOtniOjTX/7y+R8evWqoKvdXLMAPitKpnKYaeySj0B3SUv0PoLLSiNpzFSQBAKft
         38oQGsBwcr4u+22F0fxVFyI45B7qUp63Ok5SfPpg4JYUzveA7c/K03h64kaUZ/vvWsH5
         5cmJRYkvNxRhYc0iH4vso0Roj6xJ3b1AAcx8tGdNDo4nd/iIy+EFybK3u8CtS3pdRF37
         NJBSa/sv1+OY7Pk/Nb3G5SgJ0bDmX87d8BBXG7XgwZbkdXeDaxZl2xcoJim8LQ4LgW/m
         CGVCFXLQoYiirP9Kuveu2Hw1y1agyatNKNyiYoYO5Sc4ZbTu3ybq91OC3XQxtsDWDvE2
         EbdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0mtrXNchfZ7rVtL8sf02I2pqsgfUAjSX29KdC4+GxFDHxYjkNJqnecVIQokt1+7PGDsc53/koPmMbrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqDLdRxLEZHF2oFn+8kIRCNLA2WOxbs6p+3PMEOH0O7xELWAT
	q/8DLWtgJy3CA5Pf6jPE9qQ2yJbt2bmBVUyjKms14K2+ka90wraPGjSv
X-Gm-Gg: AfdE7cndncX8DfdkXkWb3PmXeEjFikSuNbYcbN85/mSlDn2bXBjviwAw8exmrMiOUuo
	FPxwn5YyKhnAZQDfBJU38YeygPnfshOce6pWw+NxMtmaFahpSZvY3dAIriLWsr5WsjzMh+DbqRr
	RcE8HwPd3/iLd+Tu5bdvCLMiiQjrTa07vdKmJjpfMq2uc6ehcfuZ9P0+rDhSlTkSK6Go20QfJL0
	VF6CXcDdyob0vogcOmM5kgpjt1IUSrErUbmGkdHP9pSmGrDs8LUo/2QLe7fmNP08c5Ty8A0Qj1m
	yKrJXbFogO13EwAh3Zd8RviAGqX0C80MrJDpy3WVGn696MaSoMuwkfAn9VzUtPH+1DGHKJ3I7Xp
	lgu5MHwAiZ6NFGgm71J2ya26aXUi4gnj/ldEukMfKT0YekciK0BSq0GlMznbIs94cSwJGCG6P3v
	04utEMdTQThBmzACALvQulDWohDBBrPA+loARchnhRMtD6E3I6NMlEm5Dvu8TZVzeLX5OHOWSUz
	S2ZxhND2jxURbQR0MzjUvlhiAzgsCah
X-Received: by 2002:a05:690c:720a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81be06433d5mr25020817b3.12.1783387485530;
        Mon, 06 Jul 2026 18:24:45 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81447f2755csm64120787b3.11.2026.07.06.18.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:24:45 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Valerio Setti <vsetti@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] ASoC: meson: aiu: Fix resource leak
Date: Mon,  6 Jul 2026 20:24:24 -0500
Message-ID: <20260707012424.1661733-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In snd_soc_register_component() error path, the aiu-formatter is not
being freed. Instead of returning now goto the err tag so the
aiu-formatter can properly be freed.

Fixes: 83b83024cdbfd ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 64ace4d25d92..d6b644a53f7e 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(aiu_cpu_dai_drv));
 	if (ret) {
 		dev_err(dev, "Failed to register cpu component\n");
-		return ret;
+		goto err;
 	}
 
 	/* Register the hdmi codec control component */
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore

