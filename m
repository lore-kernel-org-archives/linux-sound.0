Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AC2382377
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401242; cv=none; b=u2pFv93OZ6jnzNm7i6yjcMi8h8pMRcLAONmG2Le3r4gFNbyFDZz6XU6Cuf7jdZgbj1YIkOoIPZ1R1OijhQ0jP27qO9+Y3ojuDHawKOyUX/nMIWR+mqdwpOD1ORnJVSL191KAEYGvrLK4MHlODOrsts5JSPmAIFlh/j56IWjeW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401242; c=relaxed/simple;
	bh=Le/mCnMQIax2AIs03vo6Mt8p3Vs/8n/EDxeqb34NEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFwRau546H8Cm/28z2k+eChNfNpSNubcU86UBwil96ufrmP/SKIaPUlQTS+wtFTmfQqPa2zG7jGlKI6xelViIlvv7x0LuN1QN+p+QYpSFZS59dR33f1QIyE7+7do2pMQASWz0Tc2FIVENO9eHygjTzvBtrdyGClApgU/s6ox/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFHC/MhR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFHC/MhR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8478cc93299so4129379b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401240; x=1784006040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=lFHC/MhRqb5pkj3b5EySqtsq0raJcwn92Z1+AKyx2JRG0SaWBl14NZkdWEH9KX4u7k
         S2/H6aQJP0hSg8lqwY80p9MhJOI/tTAOKape8ijf5gvqk3iE8yP+9YcR7CJSgnavSDpA
         urQT0L0LPqqfkIz8ljJ2qn3VTcLa3bgXpbRhu7khNR/RIwgyq1UUXau2R7f0b4hk9wEO
         uQdeAP3npK5oShPIZSrYd9jW0BaDxU4jjyHhdlEQl1lTmXPblSgbk/zaLP+e7JAzNU+M
         YfOzh5B+9WnujHlp7rSO9MUptvIURSo2KmxWuK0cPnn9RvncPhTnEYsmeOyyK16dWSFw
         1o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401240; x=1784006040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=NaMCV49QIzMmGq6nt1Gberr9Hk80rHVw3VSKtLpQXgN+ntFrtGqMPreJ5QUFiLt/nK
         2ajJqPekg2rC0QdxqE9+Mz6XOeySXOM4YrxnC2LTclpNF1g+HPBrS0dzPnWTub4gd8ip
         LKY9N89YeMErE56GV98TS1y8BNNrcjn8uQIoxSgwzbDlivkzgDiO4qz4JYvsrenEsSGw
         Kc5YOJoLmHEixPV/2nrrLyPSd2ZQL55ZL/NISlRn938kGijv3XVs9HswIL7Q22uuqLfj
         sXmBRaDVsMopQgxqA07up/cAd7I17tNp4/hUO9nqleWzIBBkcVRIvVDB2kNWM0NljGQg
         ogQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcMM1yMRZ6O6O6UQcdzXN5q3qeDUeytNCshZwS8HljASAMXZc9TWwnaPfc/Raug/0JGtaEnCOlcKlWuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQDxRFH03dRTLUfddVS7jhd8hrd86z+EEJ/Woa83g2cnYW14Nr
	Pq1R/UnkztirT6Y2kCmuVQF4C59ywLsrBZK9R46/mc9TXnE+5IWf3tOg
X-Gm-Gg: AfdE7cmDdOFqGzPPCKfUQ5E3RqQQwBNV6HQ5F+LLbVdryaJ2hzx9434MqIYQYHdMTb3
	Bfzb+2hWiAqR+Y7DJtjhIfXAw9N/njOO3HUEX0z1ABGnJTFFjguwk3xj8SZHHHOuh7SfizfDRV9
	QUKcTOQPrWVdQXMdg7BGAK8Eaz5HYc45I+PoMKoyuS9tl/QU/H+IqAcekmcu9bfdDW96/01eiuv
	nv7F1nb0QqzzGhak2Gf75VqIjUDagfaIblBR4AglCqxk1zgcj1eORApctN3oa1qwgJuo0b5pGIQ
	GKDirell7jAXCLw3JItco5Vbd3JnXbq/uXoQVE19LQn4MBI09JUa4c1aHOO4Mm+8mlFff6nPrbj
	mO1u3j3CextAMmdhuzlE2d+fL36jmwS7gO3zA44BFet4gtXIJs+JKN7c1nwU1DojV948DY2in7v
	pIFXl1x48bw7cK6eqABGnIMryElS10nq/Slh4gVzjqTNE28do=
X-Received: by 2002:a05:6a00:14c1:b0:848:2f73:8fff with SMTP id d2e1a72fcca58-8482f73a0famr1242874b3a.72.1783401239673;
        Mon, 06 Jul 2026 22:13:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:59 -0700 (PDT)
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
Subject: [PATCH v3 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:03 +0700
Message-ID: <20260707051006.20058-22-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

