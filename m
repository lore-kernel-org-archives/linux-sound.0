Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09D1360ED2
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058238; cv=none; b=CfWuru63W6qwlQts+YZjZw8J0rj1xzUX8NYHSb89gegVyMtwwdADtZp8SHgfTfTasO9B2sMd17qawMy/77clg+5hJD/HsQYuIPOIJPM6I5q+NekfymF5k2pMUqo7Y7XoqYCZw6a4JbCf/0UcGlArnMSRgOtDU1Cc63D2egphgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058238; c=relaxed/simple;
	bh=eNcuc/oP52FaBehdpKbBur8a/vrnSG6dcxnBXNqCMeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wd1KQxT0AOe5nXzjzK4qo1RV059L+m5cZ+uNvmjuUFl0bD8KEOI7mCR2Hc7HZ+COLOfvx4ktf+I2+/Zl+2ehesOQDkFzbY6KsippqE0vNkdt5RsVPRPoh8yFFlkoUtXNmNh1UwBS6Rs0wNGubOL/guYYJUr23M/ahsX2tjob6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5ZQXGte; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5ZQXGte"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8454160043aso194372b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058237; x=1783663037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+03ew57CH31VLupzCTVcOnSAUZ32zDQS046SVJqDWA=;
        b=n5ZQXGteQez9K3DfoA+N50FsmDZ2POu8+haLCTQFkLXQwykvbhLbNqdADXzTTw5A1Y
         o8kysLxOiQHGC9puxn/fijsBzZwdlZP7H3NS/sa5rxqzN4oqnS3/ZwkRTPl1KEuw5ltx
         9ozlsamhHJUFZ+Uz+GcrVnwXlWRXCD/XWeJc/vQJnohpgqYibWiTEl+lheho1I3Q1GZS
         +1w6xGN4z9Ic2tkd5aLhWSNSgp3Oq8FPzQb6G/v8XZEt2c92iyQ5vUIq74/hIMzQPbTW
         z6+JSpZ6ZTmSafu/xC3bidul2rPI1lAuTCLme0A24zYvlIGfpkbdrL+DQWcHxBwP/3js
         Wkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058237; x=1783663037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+03ew57CH31VLupzCTVcOnSAUZ32zDQS046SVJqDWA=;
        b=bmF+tJYogn2Y3D+sIVsFxl6JGfKf5BMwRTd6jmH3qHar7Ks281rlQFm84w95NKtF/0
         LV+pxPjGPSe34N7iPn5hQF3Tb2WjBOkRLrriS5rUdZ+3z+m9dY8PgTHmdpXZ/mTkhCMh
         /pvojv7XZl3rXw0/yPQkR6KoX1n+/zxDiR/i734jV7er5wo3r3hQPJdLq7AkM/5EbRhC
         3Ogh4F8tk5z/1l4a55iazjtyOK9L8GITIK8h/Y40lcZNbOz/8xrRRh8HbaCDjsqHlSLj
         5t3HnsXSN08KVtUnMmawGx4AQTem/Njo+vHZ1d7pqfiFmZ6WVgalG3p2wFBH7nN/Ufu0
         WtrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqejlf3J2JJaY+UzdaWsUYMOwoBh9rhAuGGy7w+elwR9rh68n2/AwXF0D+KgPQmZaT5kg8EwUrDWC8+ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrLLD4EqhqE9KWeDS5NaYUSv5IXe8ONGO4f8SO+J7pONzJnbXn
	uYvKdORux6hWrz6XyC9uSONbk+7k/w6dd62hhFPn4mEh87BbJqOQGUx8
X-Gm-Gg: AfdE7cmYso2KfGmCzPGqmJrAedQXXM803sERR6fK0lO3cNZ2jrL1uTaQgQQCLrBgfVc
	OD/nDPKQ8TrSZ78CxMTXyR1savF0m63Sv1z6xPQlVlG3Nxm/ZEQ+l59LLo17osB/KD1BAZcLz3M
	F/wpODlpk3mfpnWMkPBwSfl9Mb7fea+3ZIOmqpOKr6RvawhI8DBoaq0lLq9ZXD9WyM7ZdD1VL5H
	hY45yDjGT4BxZC9tDUyp4zAQA8bpzNcxqXkhiKTW+jZrGL11/FzVrZJ//RtXFfzq+1Tw+vgC/OY
	U3uUjzSW3DR3CzCYMEyxouSN25TZ8Pw2wjMzOkImQ8CtVW6+BY7AwBoCfYEvQ2yF+pZAt3E2mHg
	499moJxLHBHwhPWROuLsTlKrSgV2U60ERJhsqggUsgEVAF9HS3vSYNBmQbFZGHCrzZ2JmADcW6t
	54na17x7VhVcst5gUHGu2MbuU957DvZD02DJ1Ub/BfgMHhTfk=
X-Received: by 2002:a05:6a00:bd0e:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-847c096d1e1mr9587884b3a.30.1783058236898;
        Thu, 02 Jul 2026 22:57:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:16 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:50 +0700
Message-ID: <20260703055355.244898-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

