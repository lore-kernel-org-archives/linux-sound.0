Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219FA364925
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058283; cv=none; b=m+nAbWzodZnIJuaxKwa8XTJONsbjKz662GW7AvoMLMAy6/VKofWRe1Fj/+D7rcsCuqM7UWA0rkdsAhtxzjYO0ZgIFAl/yzTmlLsc5K7lMc4V3/kTAxHOWuVZvrj9imCrEwFhsZ1ovyk0koMJS2WMWsc4Pynwo83CgnmAccI6s08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058283; c=relaxed/simple;
	bh=maiamEYW/VmulEyBtMYwj0uqdV8jgFn/WOixNWVxsn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ydq8LIQPhVDZtLu9ulvT5WNTxcgHdy992qKtbMZEeePfIHTGZ35aSdYnxgZgHvVjKKynkmKpjr/tex5JZuKD9FnqqPKpU+SqefqBUVB+aZliR1/3EFicCIeLXCpBitpcIQoSB3WWZCHLf1RZcqWJona6DDjgkAad2z9408d+EdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6HetlcP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6HetlcP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845ea8924a2so172903b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058281; x=1783663081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=f6HetlcPpMM6ZztViPERwUjKs2QIEZfHmUUAj+eeuHda9FRT4eF+VZXWhoDgEupYle
         sOYBmI9jAi4BVAVHhic+IXUL2L7xk0cobJeYRao7iMB3arS4VAiw3z7L4qpkPktcgjcl
         f7prBgju+/T1NoDiX2a3y6RdDY1zsCrSfCvZQ3WYUbUxlCOnnfAB6EO51lY+VlLkgz5l
         G/vXPdqbzAqZ7tuzQZ1UwgOlugUXbICbgYyjp0E38UXBYw2yHzD80I2sDV6r7/kiw2/q
         +onC2Nm30wVHhJdzAClsWcE5MVyEeMbsby+pdjcguu2bA8fIvuZg3AQUslTXKPjkFoFI
         8vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058281; x=1783663081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=WqHsKNjALqqdBUX1zpzG9+dZWL47p04XZH1t7cN+CcMUBaZD2fLoWfDHP2bfa22s4n
         wnE5o0N/k3p9eyiE19XRY/ykuCKdJt71s0dAAkThrwGpylsrF7rniI6BXppdVTquNPlm
         vQPZc8Lef/OVYh42jrQJfciuMEZBgtf1Myzc9NML12chNnFI0kciTrKWIZfpq3qXsJz0
         aqSZZZnNGYan/6t4Qgiyh1cP6oJ8Q0+Tc7askkUMahL/l8jMOMZl/RWyMa2tQ8tJJSvg
         fwgJU7a3s7nC+nVZJkcPPsSq0OxOM8visk0PKXYxfTB25Bwe9tLGa6FyQYDARt7hABOq
         YlEA==
X-Forwarded-Encrypted: i=1; AHgh+RrEAgiaMoBplIKJaSkY36IpuR9SSaVM7AwQ2EzCYtaDA3/7OMQJC4jVrTMs/M7aB+JaJLZNeg5zjd9jOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuXtKhI6olRtp5qz9YbTWl/f/6geDWsdOH3VaKyLoC1xIiZ5q
	K7xgot4M8S6TXOjvTpJ/gh3L9y+XrpRFpE+V5qITn6Hma4rDXhe4UtzT
X-Gm-Gg: AfdE7ckuw1RptXn9wPmwClRK/iy7cqtL8iYy8GCnu+v9lkRm7CCrcfxg+Hzmv1quLJv
	2xBAv9Fz7ysk583sBvrVAtnmU+mKiDejtC1Nt6aB0Pk6ZCa7iUBZjI8dZk2/FlJXmIn5rgsdcPj
	nfAMJc2kt67xsvZBC/OEoe5CnrLOBm2W29zwRH/LqtRMqSxx8tQz2SWLKsxyCR4gnb6OO2L+7nM
	A13JKQ5aOb3sRnbYie9TVQr6roLYIPbLR0+U1ghk4sZ2OUz9HggFVBRk9KXCUceTsvozWUG8mGO
	HCDgl2TueGSi7kyVpv/MkyWe1MyD52mNQkygAvDuCiDp5/IwHEskdFHmhwaNF585QRQuVoiqBwD
	Boqy7x/RtUA/GXL3dI2vc1ICHv1zd0Kp0L2TiPxh2rV6TtzYOh6A7yHXqDdQs3nRxOxiqsTKWbm
	d0Rr57nRKqLKgrae3lMG2EHpp8wM99M4h+kIj5+/h6nSeITZM=
X-Received: by 2002:a05:6a00:2d18:b0:847:9015:e68c with SMTP id d2e1a72fcca58-847c0703a92mr9190336b3a.17.1783058281340;
        Thu, 02 Jul 2026 22:58:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:58:01 -0700 (PDT)
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
Subject: [PATCH v2 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:55 +0700
Message-ID: <20260703055355.244898-25-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cx2072x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..908344ee5892 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -1408,7 +1409,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1435,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

