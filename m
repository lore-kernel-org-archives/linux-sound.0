Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE83F165C
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781056; cv=none; b=j4CtjRQlbAtn2PMwMZcU3qnYaOYk0uxWkSdd9eQnUcBQNnznqpFytGqvs+seHsQk8Tekz3Oi0wBNOm2L6iUTv803UPLh00qOx7X2UtRv4bQ1RHw4IxH8s/SntTz3BQ/t5Q50vEfJU2jEJeOItuc+H8Yivp/ITXXFM+suFI94gBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781056; c=relaxed/simple;
	bh=Ua4hB6ZB7yjJO3B4WNFzsP6vzs4xxjJPlgY4HlGomMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+hd/wDUUhTkUzKtL73SUBPOzyjXvyTJTTs6NrXbeIAsrmuHpxKhPIJmgiH6JPF9LTegQH8P+pjWXz3VXrz7TZhCcHADnPKy+W1gkxy/3Fxy15fdF6PhevAWZTLRaLlTDeuhS0M1nZQbLvSve7VGARHEwEctdb4VCT3eqH3XTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUBwEjBs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUBwEjBs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso5432435ad.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781055; x=1782385855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=aUBwEjBsEnOnOWx0R5JlmNmEbZEwpiBinKf7c44ozPUBTcx7X538+Y2GQYY4tAKg7Q
         X5gmc7rHIpegNhgpDauDp0RYebVOtZ55+r3F3HoU1bIcdw1vY+J+xCYdAOR8OEE2L12n
         HM2BYwngkGPCKxLG0CZ9JSC1uTTu7KT4JyvbdmTZR5n+WH3RdY6O7CAyzuBAlWbPUtJF
         5Dxzj36Lpz6FB3edChVVVh5lskC3ECcqVenA6JmekRwkQEdE6snzk0y43loVWoGPxXBL
         slBe05WnL3ka3TgqZeNWRu+t5Hk0JM+kyRcaPwCQCShme12xjDVf6uEwr8uUCDxwz7sP
         veBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781055; x=1782385855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=ROWl8CscAFMmbnyFCY2OkreEO5AxbkPusAcc+8a+rpLKVPgQdHk3tuU8okVPs4JOHE
         OhHvgRch0Z6pLznkJHPwZWPVweytI/ZFxL/jsoDsBWjG9Bv+sY/OIeYwzt8Vn+NxgKIk
         gOHvHznL5EV0IjsUpiZxxhAVF5FgOUcFJAPwR9jHuPPotuQ/9Qb5pfsIEQAae7h6577y
         hzy1P5ffBAJPRKFbrnyeAyr5nxID763NAp7/4ypR12acR7MFhkXHtAo0oNyaCBxf2lHQ
         VWCUTHWI96NTvdU4fT2Sxz7Mqwx3GtkgxduIDxEiq1O3l4n2/+LN4eYs2AFWjplP9uMg
         gbPg==
X-Forwarded-Encrypted: i=1; AFNElJ+k8Y0zVEBjx27vLqQFFpzTw5Lkjm+OTCvpE8qg0J+Gokc2+0LLwMGewJYTfWCDO2SwXjoelDChi0+Srg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2++uCdhrliyG3fuILUqXh9u9m820lgyKA1ZwirmL67C0o1zKK
	jLYU441EbgI2JLrp7+rE54AUAzcEDaS/6T6FD2Im91ZDiP5wr65i0OA1
X-Gm-Gg: AfdE7cn5easdJ2NUWyQoVQDlRc97Gc0H42kijHdfC6WQUJimbX9FnAg4pdBT/BcbheB
	Y09PX4JxEJXh9rsbD7qz+ROlybyvBqtpfweYH+cIpz6T9C8s8RLOKAKUWAFwUvN9eQFyhN01/rS
	euKoW6BupLLxHfSPUl6dnA/kcaqeMIxkw8Fy3SmXQzyB5eVR91Q7/HQRhhwNL9zniqsWh7LlIGx
	vm1eKwlrp+adOmlDxubQ7ZyYDpdPaSENJ+rt18acYrRWZYq6caFSgNU/wWT6FQT7dVLqfDgp/NG
	RcpBVWfqWCPDNt3fvCs+wLQFf+bFvJy3wSv/KsxQETj7Q96V8A9ABp+GPIWG/HouxY8sP+25H5X
	DOiBwktJF5L80Iw2NdlUQ5hxbqPX8qIi8u5lLPsRUAln540OcDriufdxAm1M5uGmeB9TJ77VZCF
	KPN4G3GGiCikJYLAvK1VfCGbkKv5Zscjik6dRECKxxL4MNSaU=
X-Received: by 2002:a17:903:178b:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c6e5276170mr34746725ad.23.1781781054643;
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 71/78] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:20 +0700
Message-ID: <20260618110827.232983-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8731.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ff004c9e01fb 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -115,7 +115,7 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
@@ -123,7 +123,6 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
 	return ret;
 }
-- 
2.43.0

