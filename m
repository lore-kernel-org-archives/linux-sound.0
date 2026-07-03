Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0963C363C45
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058266; cv=none; b=s/WD9VQgx608wTcMLCzlCHyV7WbGTmoRketJUqPh0q55wMtj6mrf79g0Pqye8+JTmsXqFu2hjXxJgIw8teS7ynaQ98iCsoxMb6B60r3t8Anr21sbGjFbwWs9TgWX3OMXEIXAwvQ32L5pm40nFhlhAq8quN57s9uihZnqvrVJCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058266; c=relaxed/simple;
	bh=Ni3jeRHp4DlPy1RmzG7RK/kEkCNuXoOAzxu39VyTUzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jdty6wBrEqUj107VfXHZnxy+b1sC4MeCcc/4ic8b5qvYoJR5V4SrjC1fHgQGcxC5JTn4VB/3TynX9+lygY2IpOpZGgRR1KBzIvjZ/5aepYXAJpO8twVAeApwwdEWVJDeq6IwsgFVbw/2vAs/OC1gk8+68Co20dcSt9F20a1FN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSoxye19; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSoxye19"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842338c18e0so174359b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058263; x=1783663063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdRFOubd4wsuDFKn4A4oZMqcKCsz7f8Lmrh1PllTRso=;
        b=LSoxye19M9Ixqz0Ajp3rTOai+rNpKLXwDX0mNtsyG20xjjfUFDj9xd+9QawHhe8CQH
         WfVQehwgwPlDevTvALFPXfCgtTElPA+jKiMGMaScXfpBfiG5tpVIo2Oxy1yB+/+XX8S7
         TDz7So+rPqGsxqovPaUZbkkZM1dc7j+pnKQLMsM8wKQzdgcwLsK3RT1TRoBkbRUQzQjt
         0eVnFIQrfyBfoTgyhto9GyvlAxGyDxpg9oRzfOa1LLlHXdDMAm/DaY/d9XmKkfXCL9Oc
         Rf3mUNmF9JRomdBGBrdy+0U0jc6vBlnrpEz6/e8b5SdAsBZ8x9g13Olmv8UYQ0L+tEvm
         vdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058263; x=1783663063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdRFOubd4wsuDFKn4A4oZMqcKCsz7f8Lmrh1PllTRso=;
        b=IKwX8VX2Os8tpzxD2ZOtaT6/Z+gpijgXni+YVWrXaDnKeS9Q3qBv4rWFW8ufUbrZ0i
         ki+z7oygtgS+lUbjh81aUgpeyM85lqyJhU6sUC1CAT18nlDF+JM4hwdi4sPlp3cnSECA
         0/sV/h2+WcJprY8hoFmVIc1RgwGFweqTVJAMq9O9jcaeJfdQjuKQ/f+66TOez+7qMpsd
         QW6seEURKSnnH9BDcct9yur+/aV/k8cT5u4ZjuytZLkU2YdZEOS2CAijbzp5T3re7Bjk
         K+NzT1sMUhPZtJ/wCh9OGK8EeI3OywBWYuaJOqanSKemipXW+81D/q0srnQQvOUT1KtY
         uCrg==
X-Forwarded-Encrypted: i=1; AHgh+RoWvMjxL2ucuGr3h5ueNOxIY1kJONII6dQ8D3/ZK4ujRZuV/WvsIGrmg3jeriMqYvJlUG6wMg8KLOsOzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNb55qiq6T8hJzmTngdeLBzgRaQHAhAsPH0vMPGYuz+aHdV/m
	R7emjuWNBBs/+RGuMn0zkXmjAmx/F8ILMxVN71e342olVABGJDQOGnxJ
X-Gm-Gg: AfdE7cnzsP/oH9sfN+n4EZlUz5r17QO1hfbYmPDpbsEKI0m/KPLvdZDBez1RaSidYnZ
	ki6uC9fNcIcC0UcxBx6nL6r6WaEL7e6AsDkFfZHJ5+3jIuhn5ZT1loTSSdeWWXG/xD46Mdbme6e
	xx/zUjgxq1ldOL/qs0bXqLwiWmcjBj4o6mvh7BhgcO0ED/7fBo2FisviOR6CQ7yAm4SyLCIDoqf
	KJU0w8H+iWDzNaZl19nOXIMvEQjSRJMwcOQTVZ6fjAgH0Q4+XXg1M9t81xn3FFDvplEawMi1J3T
	HLtwT9qkkOl/7YJUspEN3WURs2UC07MqScMzvek+TjS+p52sOOLH2UJokMPXO5XowW0o9DT5uCd
	Q49C45Z/N5pyKsjbAtMDNJp9NA1ch8Q+42pC2Rw8MQvjcdvKygoLLgUqz94FL5UUCg/IcJlSUGH
	ohu3/YVpOdHA4JDEqmRUoIVVPMHUgxB2qgenViJyLjsveV8C8=
X-Received: by 2002:a05:6a00:420d:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-847c0a399b8mr9016889b3a.49.1783058263154;
        Thu, 02 Jul 2026 22:57:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:42 -0700 (PDT)
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
Subject: [PATCH v2 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:53 +0700
Message-ID: <20260703055355.244898-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

