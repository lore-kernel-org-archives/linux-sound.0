Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62642387378
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782584; cv=none; b=GpsglcG7aIXKLI/z2f8QJSHmDjCQ0RwixEKBKqJDKA1pXQb7qyCuPdjnwMARR7S+UE/Dw2TT3LVwjwEu8MP17WCX5+wpFByNqc6yC6EJCRcg6Eib0umRCEt//Etv9DGYyZMwm5uURuC/2JJ/MwsMne4xJbDyDcO2nvrl4cAn7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782584; c=relaxed/simple;
	bh=2Xk1hXvsA2IpLifbN7YBERIeU06kepyhohGyxFLXL8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwVVUJF3WDJKS05Oa4kvlhLIh4wRtyv9HcO6PTAGzYFF9tQddwbIeTMzN5IhUJsqUgp0Yt6LltkqV9BT0rGgL6Okgg7DTc7i5SsPkxqNQa6siKskTK2iOSfUPHxQpjmAWc/kgYOoeqJvzKMCYxSwFovQ01k9bvwPN1L74kB8WHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cewA6Vnf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cewA6Vnf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so2482255ad.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782571; x=1785387371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsESuYKzKzZpwopQsJDBDE/AgD8FvSh3g/JSOgCHZBM=;
        b=cewA6VnfJuT7f34D9OWC2XsBMGycusJp/hYnxVBE2X9PRHLbmJ5MlPl7amCByBpSQU
         zwCD4FJsqrM8mNqaK6va1zB5UxuQ20ZbsGgekAisZWKBqKWyrPtke1O+B5iVtCOA1ufH
         Ph47NYFrH6SWueuj+uGSDXGLUvaOyOXD5k1fari35wIgb7OIu/DfEMxDLpfgsO2cuMoh
         ZccHuIRyhe16vaAYR0yYmB0UmyhGsARlCrY8GxiqZa0m5bpbC8CEYuyiZUmy2pHr2/+z
         k0coJ2Q0tc5PxEsNb1RPtoCtgU0+1XjQKq5gQ/aZcRFMZJM10KrF6Tn33Wtm0koWjk8H
         9w8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782571; x=1785387371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsESuYKzKzZpwopQsJDBDE/AgD8FvSh3g/JSOgCHZBM=;
        b=Oue77PA3NZW+k74mbpS/K1UCh6ZKwD+dxLb3Z+ypEoM4hQPq12MYIZXC4ri643ZGhY
         FXanbqxleSP1eQINPGeWrTHoygPu9hsgcfRdt6UCsQAii+XsTiUaIjOC5yJPlrgA16jE
         YFw+qE0BzZyGkjOFYlMf1yNRC7okrlwMQajCcYFZHDbp7tsn7xqovrD0txe4Ry5wWbNh
         lNwXePGnFwoKc9uHWsSojfmWhmIbne2YPeQ4nV70nUHzJLGrWU/tNlqcTow1mNuIfggH
         ga0yO+6CpVhvId7WTN+cKm0SC7JdNmpQkyUEqpHH5rxvO7BpxwDM/vSthCYzj1qbO9Rs
         UAqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJytow/p98fIdj5Y4sYufQlS1G/kDybtWnYOo+kEWD5ioGEKu8z5G+ce+QAcu/kE5ksaIdBjE8ghUZ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf8eX0TxpPfqe0yd6rsk2VX8zGwglQ52TId5JgumRclNbEWj2J
	1nBudndbUBQ+w3Xna6P22sUCeJDksdqcu3sPGlwinfSDTpnEHhl6nteK
X-Gm-Gg: AR+sD1095+pIUSv7bDaAZBftW1ecPlQYaVRb1hTYzB7/mTtHda00hBxHNnDKvcyI7vp
	AbcXToQ+xIFmSOdd+/gtbz8SPdC+0Njihr6zWhIOEbCbuLokZYLkw4loAScBQKRDGf095sEjDqq
	KRhsuCIgKqBXSWm0N7GSfgKZ5sQSotm95zyIdBwCgt9jOZQ1Kctn+3yEdg8KGmwddxobGNXTC5g
	GLl1j2ku3p0WdTXESl4aASH55E/IccOhYp23O9P2Y3/4iNRBUaqd/MmPaCZ/XW6wg3y3Mf1ASRH
	Gg1t3/Q3JcvT5PLggmXz1OtIRMMlvIY4TQPgdoESFHfvHvbiSpwlPum00RpICz2JwPqK3io3h1T
	MF7fB/ukmkd4js2UfaI8c9Z8BeTqg0fAUffcczasL5ECnjL8pXc0QygvtaTfwKepLeILNdAeWRm
	wNBkCS55WqlOo8Mr99Uz05GD784fKipKyQK+ha
X-Received: by 2002:a17:903:2ec7:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cfa71ce943mr18539775ad.43.1784782571078;
        Wed, 22 Jul 2026 21:56:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 19/26] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:20 +0700
Message-ID: <20260723045327.28260-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8731.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ce87280d590d 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -10,6 +10,7 @@
  * Based on wm8753.c by Liam Girdwood
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -110,22 +111,20 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
 		wm8731_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
-	return ret;
+	return 0;
 }
 
 static const DECLARE_TLV_DB_SCALE(in_tlv, -3450, 150, 0);
-- 
2.43.0

