Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963237FF5E
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401077; cv=none; b=TEk1RnDE+UAD0Fbx3tGNoyA7EBdEV6RJWdo9Y5HgEw/9z2kLt3bJ/jZQhW8H8T9UK+RHYolC5YeEzFEeZbmo6vNipTj9pKd6u6WoZQEqedKja4qpQkJk5xXtHcrEBQwMdF8YCyEXQ6cvWph3I89hCU276l4KtnF9J51fQMTHpkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401077; c=relaxed/simple;
	bh=yfnMNacLdodpfRhW2bQZbE7pm8s0ri1caS058dgJKWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8mW0JoyNBhRmkPJ1YmFl5Szw2K0aubdiNnk7ugxxCEaJu3w0bSstqgus+MHCY0LFNEXLrEs4SymZf0FisqE+dOpZFJdAAhcLZ+k4n65+pb0n1xk/ODv5HK/jS6ptK9luILGsAr/8LSwT7TPPxu6evVrNei9nKCkMvkVkGnZRUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCEIndvv; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCEIndvv"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847a52edeb2so2869225b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401076; x=1784005876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=bCEIndvvNUUhV+75BH3ZrZbV+qzU4Ku4xa7WU60eDIhvp5dcGeT9BWFzuftNJbHA/T
         q7tPxh6F16wfLG9tYYmDSb6s39Qwq7THjyO+9z4gBlkswBBQ7c2+3F9f5MYISYDn22ut
         f61yTUoeFJ7q4+0Oh/PWpzWr1RvhoC8tQspqPU4BhROak1ocjjb8LoRLd07uroKJE02h
         XHidVv+nvMTj5oTlFXhwzE62hY2FLzRh0WlC0U3TSo7ZCfeEz+Zvzfd7B+w1yM5xtvwu
         W1pxD9GcpIfI3a6eyA71prYG7l/suJLa3h49pHhD/yD09j5qDhaXXJ4CYXMWg3iq7ESF
         4VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401076; x=1784005876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=kHl5Teqc1mDYtBvgpoI82XwW9aeXfF5xpBa0axndzeo+/yYsPbfquKbltnce53I77U
         jyyB1g71tggdDXhGeCDEY/8RJL0g6XzpR25rCQX7s65/+rDJrtFKIFpmDXt4BlVjOpUP
         KQVg+IPNFWcY25J1UHLi+QmUdYEdOTsKbiakmWoxruCh/DcrfcYJwtsbegFysn58OOHM
         aVDLp0ZIGhNruAiXu/Q87/AKbKafdh1yseYyHB11pYvC1N9VLPzaPAXTxuuvgaXN3GFD
         jGBX0wPjglIaTEpXjCmN3D453ez2nLH217kQq+JZ67q19oH6rSBMuH5CNNIYteaefMFL
         xOJA==
X-Forwarded-Encrypted: i=1; AHgh+Ros5DeELNu0zK9CX/NZ6hk5v8sf15ewXNG3Hl938I5F7/2XBla7VuIWAogdlrhKZF+i/5xny+oNr3RF7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQT8ule1YiR8d1eC93il0h6qFO3X57PbzbglXRLRzMmM0wPw+
	+MyzBKQPsVbVeR7GidJXz3BOj2GDE61T2/4a0Qfv/Ii8jtWrL/09/yPx
X-Gm-Gg: AfdE7clcvcd4RwnZSgLMD/QPNBrFwNFqpZcXCPK0H0riXSAsfVF6g3Dx9yVV1GMHW4D
	RmikYT1++IcLWRYWayRmWYKRP1KVuRM714Jv3iFwd2TLjN+JlG0vpnv7m/4y17fHtuScAgZNY8T
	8Ua3WcQ36fpKR7QT91gS4QTwgE4Q1hVObh/+TWSe1uXnQ69J+OIG/63+o9FQSTCbcSpdqBm0iHA
	PNtR1yzeVH9NRBUZLdbKJ3qCrq+SFY/3y3WJQi5sOdJegWT8U+yfd7C84v3PxElu8TRqse7cJGJ
	HPOVIw8ZOkMbqVq8fm62DJ5Pt4N6Ql1WxJcegVNnPNreqeUFYRtUzzbd70sMeRP/d28BKCV5bNA
	uH6Z0c0Fz1TT7TeMKObVyFTK4SRhJoAUH9C8hAHt01p2ZiG65wsfbgVj13BZtubLFCExK3ulv5v
	+TSHQ3SIHfwW05W1mRf+HKc4jsDf6c6RT0GDFQvbIwqItFIuM=
X-Received: by 2002:a05:6a00:3a07:b0:847:9268:d73f with SMTP id d2e1a72fcca58-84826c1e243mr3462917b3a.9.1783401075794;
        Mon, 06 Jul 2026 22:11:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:15 -0700 (PDT)
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
Subject: [PATCH v3 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:47 +0700
Message-ID: <20260707051006.20058-6-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

