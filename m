Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4134508F7
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515176; cv=none; b=TYxDuwVUipKu/CN7XeX6K/ErvTVxzylhKYIPnfANROEKdgsSy0cbdE4XR+/Hvna7qi+MzREOMbaGoS9Gp9hwY9zISoG7XuToIRn6QZxRegPFTi9OORxW5Bmgja+OjZ2p/6xDMLKXqYmytMMAB4GdvTbDQtAO3Xy+cQyIy0wdveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515176; c=relaxed/simple;
	bh=vOc7TQ5vfBLJU8SHQzzz8AAZi3kNOaHPDwAxiAGdE/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFmpmuwnbnrV96HFuT+WXlgev2DeoopGhLWI5cEEOlg0iUJUqJF4yapVt5BP++6wAoOIBUwYOrVIIiMFe06SpT9pxUO5mZXdqv+zbLowseJ/tUv+BryNO9TgITVDgJOYPmyD1A5AUcZmxeGKit6PUtJQPkMpMUfcNLcW/YDo9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR048SKE; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR048SKE"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso641996a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515175; x=1784119975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=IR048SKED77vXaaFtzMMNFvZXJvmOml12fWkhKLNFf9IAD5153GSdQ5B/bJliG6Qnm
         so82pBsKj0VdPHTbF27oO7A9ZrDg+zFYU5k5y+sOOTnOh+NGbBvKzY9aU27SaSGO7lLn
         HmtLJRt2KwVBDoHAfpXCp5EqploO/xZ7ysVX01Kw7+XVyMzHwkuE6VVHxIBgcz8mJRKw
         mwMmvQZ1oeYle7Rpgf9YqVQ1HgqcX4OS//8ynMM/5IHjKOj7wWAacmCMCjVC3vjQeSuU
         w3bOE4/QOh5aG9yDuI/UXjGSi3p/G8jj9FFSrY+myOTgCkNpqWWSDaFned3GMl8A9Qqn
         wwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515175; x=1784119975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=E3ifp8JIeNRrOln/eSvHlCG9cGzJAneYqRqWA+lGzUS5B+RQfGprsD5n5jY3sbm14+
         FyQBi97eNAKgntDVlhbB2yY8RZwH3CeipxbirA/VrFLeV9Xf11a1LoaYbONlQRA6Zp2E
         L3OO7SDqBxignLsNisk623tC5fxpGy+62MzvpZ7tEG0DME5pFhB1T0TJgfjRcZAIFbhW
         Ji0+bOWK88JldCnyYsEk3gONYDyGOhC23IIVjXkSEfdnSVWlApgE77QBUcoqfvqRR+zf
         fkyX5j3JCrlJhaCVj/iMB8yP9d6sL2qvrKPmvKlXLlseR1OBRSeE/imVXIUy7LAm/sk3
         jWYg==
X-Forwarded-Encrypted: i=1; AHgh+Rosuntdla62E9OskVWFG5ckFbHZqKdrT5Raf97POcsfo37ZrPOPLoPIsRClx7McHGi+kJwBvX5YCVgfxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUQuvPnt3wBil2XReuUbXnqjkHpfb7CR+zFrdvnQLK64AnFgS
	WPx4AmSnNXkA1Bd+EKvzb707CIABOdPHAVMaAZQB4CrGYyQj7zzIdLAZ
X-Gm-Gg: AfdE7cnritFp2BQRqjIN+NTCl91UID2/pLVMMWNapliizzi3ae8nJEuv+QwwbvvyyR+
	B2LEYHmmLoP20RvpeveBKdH9inGLuShSGWbuH4z1V0naBkFfSv7CTru7w4KvEUwiRPwKFT3E2EJ
	+JVw0a9Y2kGBuZy0t1+lXyfQXOmIRSjN5WtF7xVARMyfq02XfpK9hU6MTiHh4eSFVlEdagWHRj8
	BQfIvpeNhtTIIBV47siG5JLUPHmPf8clt7OnbyU8WkuK18NqK5AhwkfGPBR7qGmgtWRjTxy+4fk
	R+P+1Nv8spTb6Nt+I0fGqwFJ/dzOClwmhw6pcDowNaHoKdiy5p4ANfzvkEOFgDgWygJO4vRNHDU
	Iu3fKI0KUfb5rCaMfUvljhK5dYGGzc1F/ZtwszsSKov2vPrG1nLgouthCxr/M1ZWJY6I6HmAbgI
	Yir6zT6FoojCAY5Hd0A48pngc1REAB0o6U48JbYLRbSEcKvvs=
X-Received: by 2002:a17:90b:5384:b0:387:e0db:3fa9 with SMTP id 98e67ed59e1d1-3894239bfc6mr2461097a91.34.1783515174810;
        Wed, 08 Jul 2026 05:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:54 -0700 (PDT)
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
Subject: [PATCH v4 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:56 +0700
Message-ID: <20260708125002.202515-20-phucduc.bui@gmail.com>
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

