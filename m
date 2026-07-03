Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4123BD02
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058247; cv=none; b=HWaOfnT6ZjB38x/5NQbSqBejIKHIOqAsX05dZJ756xuiNL15D2VUNxZoIjgFQZMRkAzw9Wel0DW/4TTj6NGn+E9M4WUTwRIA6C4WUQWe66oqCiL1r2hRIXnLgi2qWg1xv58r/Z8ZQvvfAniwV0AWqjjWXPDyNTw/0JtmNLnO2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058247; c=relaxed/simple;
	bh=l6qs5I0JUI9K1DiRIyWqpra8GOK6b66PJxrAnmuwY7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk1IenUXKx4MBo5bv5gV7rcpjdELPH4GX7QxcLj4lFwHrAOnkCh3wEJJc5KwB7LpJGguFVzO06wQZkPFNwNuAix0mOxWJpIl1Jb9jPN8KDS6Kz62uz2mxqtHeoW7F8ExicbiG9icbXvsYp+AM0l66TkUDCPWG3X9yxYKzzB5Mmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWybLose; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWybLose"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842338c18e0so174245b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058245; x=1783663045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUf2B3EuRxEbD2AxXAzHzC6DSRPTYh22ar9PET4jqsg=;
        b=fWybLoseD6pONFQfLUmHRCa8z3Bn/rWHopvvt9527odjBagqOigACwOpWc3weIdOWh
         XV5TIXKZeazWsVV9g6UnQN+TNvsJuHywI51nVpIj3ER0rm5zfcJaS2QSVoJuAJD5mbNj
         xLHL2ZmCirI+rUDBnicSzFZHNmnsvebXjE96nOzx920hHM4mJzrdFJEILeoMgYWIVpH0
         jsv8WbOliOBs05tgRxmlvL8J1y38a552KcJg9gZy7zslhJKAdiTE1i9U/JBAuZmRNj/w
         OA4GBA9p/gI0WO90nSa36YbqXcqFd+Br8Fa5BTvvaSr/XhCcOBz2lusNYvuKNSdHEU/x
         Fm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058245; x=1783663045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUf2B3EuRxEbD2AxXAzHzC6DSRPTYh22ar9PET4jqsg=;
        b=ZN3mQQSALhre2RvRg3bFXlcR1oGHb0zcvXsGp13r7RibT6gj4lpdQV+jh1ZOY3RkQw
         V4X1nPjpkp/48pXqTMxdiDKELfptLnjSK8c7KF3auO/MNkSwUGdFvlRenL8OAU8BzoYi
         oSABCMJkjdqbDrE8FuylAIp7/ja4s5Lx/Txx4pC/H0juzMAO7JjFpToGkIzDWspmPLLP
         Dwd1LEJTH2ZLiof3r4iyLIugHeInRh6NH28g0+eD0PN3+p9+jdNxzqsgntVlr7y2+yAv
         mgmlNmHxsvb+ahCAaUWRwptiEgw/TNJ7GXsfgcox6Q1qJfzvNugeIGI6CcaHyE//3EjZ
         zpMg==
X-Forwarded-Encrypted: i=1; AHgh+Rryqg0IMLdCQkq6J4L9IziJLpXvWYtzdPk5AuG40mpkFbTbcpCGsBX7dtkP6tPt0pG8euJ5FZhQqXQKdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEXMb9InkI7G1Ke4bJrrfwDzPi1jD2STNPiDGB/8cRLLA+2zW
	tVh0QddW9H2GaT4gqX6nAvO8T2nmdjCyEGCl9nIqKfmNE+vYleSahgIc
X-Gm-Gg: AfdE7cmI171rERz3J2BYO2B2WzUjG2ufc6fKVMVlwNV9OK/k5k0znlxPWj+0x5KKEVl
	HrhHqESpCwvCwNj3OcNdp0c1d2+SGFcJqxKV+7Z8v4j9jKCHtGDGxGGngPhJi4YNCpeE73vfZkk
	7Dl1sz6Uav9Wv9cgk5HKeq+He6EtgTvfzEVe7Bb/9VKcpEhDsP3lNWTie64NVxVzT7Zth0dC6qf
	jkfA+nsdq/yWvxga6YG3PnBETJnUyaf9c4GTnXIr7Zd8liPXzdhQZoYCOhreXYqvRCEOC8f27JW
	Oi3ZYCK7in/nSTeDz1+FC3rAAO/erEHyHPvD/8t64NZtBFAFLHH4dotIowFsyjCJi04jeg72TSz
	6LO1BMUK79u5sf1TTcjWf6d9h1Hl/LNJkg+BnQ0wAh8+qtz+kmTP/4Ds6ftrH8yJcGq/QmJbfbP
	OhxeY3kAa0fAfyGrIwIrHe9urXf7MMbyA1xPTPKjxntpJGYpvbBh8Qf4IlQg==
X-Received: by 2002:a05:6a00:a383:b0:847:8203:f530 with SMTP id d2e1a72fcca58-847c0795447mr9921830b3a.14.1783058245396;
        Thu, 02 Jul 2026 22:57:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:25 -0700 (PDT)
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
Subject: [PATCH v2 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:51 +0700
Message-ID: <20260703055355.244898-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

