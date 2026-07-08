Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C243E4A1
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515169; cv=none; b=BuAuLjeq2vCLu9zybY9fbHHR8F9vq8tM1/CaB20XD0yYdrxpKEC/tYw3xnwkn7TftV4xCfRmoeursbea+ut+rg0JGHLB5yKWfMeLh2qq9OaFEQ69Mp1bJjBtTC2SfK3oR5/070YEVYxcTTIcDe4OFP8uHxwig17jUqjpdxA1yx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515169; c=relaxed/simple;
	bh=U8XvbxSxSkTA8/Iu4yHaWeEwL/aIo8CQltei/BWFXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kc+iRk1SJvsokHWqfSIcfPZ0maBjhrym/PisIt5ALr69MSwobs83NyVNzEHeB19xDmB0TEvh0rc0liijfM3QQZkV2Ff5DXBdnT/gm16DK1lDK6V9eI5faFXX+yZ/59gUZGz2MTrmlGg7wSbqrfncAUO1Bq2yzSVMyvRgiggUd3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Osa/hpUb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Osa/hpUb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso765226a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515168; x=1784119968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=Osa/hpUbcRf2nY0dlQ5+NGWqJJBaszgAc2KHnqT8RWaszqWUOOszMJNvnTmcrqDW6P
         d1HaOX1tcf70EL+88zKJ9TOow6XfyU7WkAu7Vi5f8LiR9w8Yxz3h4EzVB//U2e4AOcPY
         6mceguWGEZAIdEc2Ybo26bfwulFr4lo63rACCzLmT4V53UeeED47T0Vp16iEiqFNClpd
         luBm70nRCcEwGGdilZjWMo7Af/OJ1xlchI78VWKdTii9vmwd1AfHFmyu2NRcKmymeCtx
         uC7rPKJ3e5ApwFNCsWd3306tDI9wIJnnk85Bf2KIAV7vMAG1NgjjBC2mxJlucp1Wa3zP
         mb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515168; x=1784119968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=posBFXW138r0WM1AtDWVcmu0S2l/mQjn1v4lyY9ZsUnqhq7e5qDq8DS9mOv5drgVE5
         aMzlaPn/AcMhyX0zCDvY6cIF6k3TxZ9qZ6+3dzNG9EqndN6k/mJB+eWIS+ErZ9Yxg7Hv
         EF5T0fe/MTLmM4Oc7N1aFHdW7xwLWoEvuHKDXZ0eSitwVW7GogPwyAzvnk2/Y7Ux7OU3
         IdeL9b4yz0yxrd8lvXmzKlBTv01Rcsjl1MLn+bieUJk9JO38J2053cmG61JxUp1yWle7
         g/ir9wT7lD43MCYOG/gfgokMA5YdLcZuiJiJuk9NIlAbJOxqvKNgFAyYgBNUPV51buu3
         +/Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4L5EKRzMjFhqEdA6d3KdCcQ9ShNjf20psuuUsSUkK89FSeld/v+0DNMS2Qh5MeR5IcPKy15dmgyW2vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWLZesQZNokLzoINm3Wm5XEC+F68wkwlrZnJD0bqLZaromzNQ
	PO1n4F7fN07EOPKdFZn+xfmslA9VccODNOBCcqFvXbX2Lbi+sl+hnjkH
X-Gm-Gg: AfdE7ckjRkVpIdMdngPz9hsYrFzGM3JOuoHsr0ii1sAccvCkOBp1H2POhKFR8TaR3r9
	VoG4GBUcE6N3nW6agF+Ob6Hj/aR88EIYIiatLPXn0eKxyRNvrFUG8ktgX+lnEusuXkFkXXzd483
	lSwPYiH1+hKljnTyOlZKDxp5fhhZDbVjTjtVDWa52wNEFGOkXRPQvYWKwDo2wm1P1Nycx0XtwO2
	iYOZfBEZlcwf6Np2EQASR74SBBtzIq56zv9+avXocvhC3+9V5Z94cvOrREQNikRSnKtp9WSEVQ+
	5Hen0YiBHC0L8ddHDXP6Dy4LxIGBmBfMhoDLFSftk/Nam1owZ0lV0c2SXTuPRs5bu3QeXizc6To
	LJrNNyNyVelV3QfwsTGPMQcm1wlFk6Xv0irjot7KaunCSUcKU4rMq4c63gfiaRnsE/WlNI5tYo5
	bef+LhAynl5Xi0Ml5jCbt79lAJswOU/hXOmuYXQqLnC72C2Xk=
X-Received: by 2002:a17:90b:3891:b0:387:e0db:3fac with SMTP id 98e67ed59e1d1-38942798114mr2804180a91.37.1783515167633;
        Wed, 08 Jul 2026 05:52:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:47 -0700 (PDT)
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
Subject: [PATCH v4 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:55 +0700
Message-ID: <20260708125002.202515-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

