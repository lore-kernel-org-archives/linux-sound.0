Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D943D4EE
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692570; cv=none; b=GUnNbbiGOlt7jLhQL7MAczr/0nmpiEiprT+lQakSqIHQMyQ7J4TjtdPFBzOoZOQwheEzxv9NJX5PZFcsMz7wTmyAAlj71fsFU5smYLVEiwta2FEh4izFguMs+ib/bX7cdv+SZ/l/y9fdxd4Vkqwa8G6MHkCPaVWkoJqxec3ohLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692570; c=relaxed/simple;
	bh=1Ss+Jdqrla/9eoL2y7H5bMd8/rEKPHfX+5UCiREXhpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRTtNeAgbPNZInSGEB3LOSWbm8cpm7Vd2R2vCz+9VY5qdxVw5QuJeHrrgoQ8jpEZnaH4dHsfi5mIngi0Tpz2nZ8YFKhe4Cs/9wMfs99kNvHygBwo2yReksTtU6G2AqBW9KQfTGRqx0Qqh81f22BEiK30m+9tSr0AWa03FzUNlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srmhtQTI; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srmhtQTI"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bbb1bc064so3544086eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692565; x=1782297365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=srmhtQTIYBRVo1nNy6w6rWCBi6Hy07AHG2aq8xA7TqnxQZtFyDZAejiqR2wX1GRl8A
         tt2QCBnYeTXBpn8f4M3y0QdBUop0oBbXrYYRC6ZQCi3cqVWNnlhu50oEZ92n6DmHPNcy
         TiXI0hOWR6QpA4CO0LpMMFoNLBlta3HVQu1V0rsDtU2LXvoCDJzSdj+rZnqKvaW1Izkd
         rZ0Z0XOs2eVmSPfTMZQC4UPW/Xx6ryhrJWgRTQvvZ5NjNmBbTY/LvLeGKhjyF5n46zDC
         mcV/xVPATPsKuJAMxwgepWhp8wbZEXOa2MB6YBKvrXK2t/0YMxJwEur7vXyakPQFZ7Bw
         FP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692565; x=1782297365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=C4ZuZzWiN7ZJ8HC6z8IvbNluhUm5YOuNyHPYdMO5WOVA5Kb8+0JfOyqhO1QWdY/w90
         WQYul4jn46vziteUg5rvVDZ4jrALZ5AiBIyAPwWqmdH8ANigVbO/2xzlSc5nhQlKJSQS
         /rOLftdklrQG1LBAzkFrrVamzCs9JZNRDRYru1JhP0qoVGv6HSaOD96rX39lvtm3Xoar
         2v/qhr/xTN7nuufIGtQiVAVdzM0FBQbLN5OCeglwtAVuDknB35YAbfgBEuN2ixRQDjk+
         525Cn/Aqu5tkGkGABBDsM46twYrWp3rQIvWjQsaKzgk7Oqh6sIDu1xp3dYJ9Kj3KJMkU
         WMvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ifjHPnefzbNYWSSH+vwhSyAYTpC0uGOLe/OoPPG95v7KJJQnCAOjznnoqz8qOovw4ZI2APjIdMrtxJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0N/aucUpmLCYyj4QW8uDt4xjZNiw8HcNu56y2LfX/FwySaRXp
	cm4zH2KtQ3/HwcgbrG/E0HkindeiUUr+d4njXS6iT48Z6iHgaC16RjiO
X-Gm-Gg: AfdE7cmqOPgNWwGXKvD8pJRfFQBW2mOaUuh2uPrnnmjPP5sbKxXpfYJNTnbUKsowKoT
	1BtLne/xo3hiYOKbO9nEzDivj4UYO4vogdH8KgX63GwSGwNk2+4JQor8Gw1yPj5hXwnLm3POBU/
	pl4zeMUudWhuRxjRtN649CPrENUQZ41CaOgUrIHTIKCpJwMvl4b9AHyrpPTIeMXU6m9hrXQMAkp
	b+uV21sJc0q86B9HwV+R0Juow2RO+A/QcmRZFvQIVIMGXYk5u077bLQB0HYSlXyoFOm6XnPuZq3
	S8h+F5wuuG3PTX2+LMA87Tbr5zHYR8Yg71ZiR5YORRGbN2gJacVHj+9/SxPDqYG9ThqO6Ism9SW
	DSpkUcejuuiSOhHZosBgKv1+7/1ogCMlIcfNrpzvvOt3zDevOG9Ka9CXGmyLrHxViUhSbjPgNnQ
	zDD0/EdBGpYv4irg+QeyFQfg7Z6xOH21jHk4nw4wz2lBF+u+gN5z18Ghy5HQ==
X-Received: by 2002:a05:7300:2211:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30bc9ab88femr1691948eec.11.1781692565454;
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
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
Subject: [PATCH 20/78] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:37 +0700
Message-ID: <20260617103235.449609-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9c0eaf24bd54 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2504,9 +2504,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2536,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
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

