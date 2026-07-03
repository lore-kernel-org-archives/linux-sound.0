Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9921356757
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058213; cv=none; b=cUf8czMo3ciPlhrxbdkEVSTSFrgdgKJThVtYeb81GN63aAaYNQGLP/6uyps6m5fqQ5gaTvhOKHqqgGoABw/o+l3kH+OqI1cO6CMEii8vb/XEW2MQjpYloFjSb9cI9Iv717dLeedoQJt23e3IvtSstQVwUcIJOFbGxvYfnbns/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058213; c=relaxed/simple;
	bh=HbOHFEkVn9KxWh1SGhBz476YCbiYB7ab9omeOvLq0YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGS6G5OVuDikvqYSpgyrZY4ew8JgdyRMHTZsPkFv6U4htJtayDIzY9P77UJqCRuVWOQnyEscCa9GwPY4PteDiwNla1gkXeKfVfItYSYjvGe6XebJgVVQCdsFwX7zl9rMBs/dlwf9Ef8mBmXP0ceCUaKSX9oWtGgiZdBnDfeZc50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxQAGB02; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxQAGB02"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-847d1e9db22so215160b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058211; x=1783663011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXPhXcgFqmptPuS82JbIjuwkPdAg3FkVMAuXoE8l6vs=;
        b=SxQAGB02K8tyTTLtxSUu/bIMYQF37CqSKoJpgnENEzHs9lHzEIcaxGBUWeEBJRiiCN
         WL5M4NQaxVGffC4pf4AI3/jcSKZCi9sJnazMdO/bIGLU3SRo4drI6rJ387+ouZSB87hF
         SgoeVY4cuTaYD9fuzTu8TnfPBg5O3d2fp+7r63Mc7euo2428VPF1Knoh1xdPFxfxV+zK
         evC1dNDRDFcauuFTl0+QHDuS+aohavzD2bYcaStCe9uCbnw36BpanaygQdOqD0HYeOY1
         W87PxEtUKC49fX6Ie6W8oiAtyHo0j7dbz5mvJpDKVHMegFR63TUVEqKzC15/RXeTQlhf
         SyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058211; x=1783663011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WXPhXcgFqmptPuS82JbIjuwkPdAg3FkVMAuXoE8l6vs=;
        b=jBYaaXNz4XPqQcy7BjBfCy8EN6Jf7aLCm5XQSnUktYbJw5WNQ+zBDBMUUkNSMHV3AQ
         5L8kK8Y9YcMmREB2faRKPpY4l7/zwhmAQ5b8tFVwspxWr0e9YUEhU0/BxZimec1Co0ws
         TvayJyGL/CcGiJsi/tk82L8a+N/QZwzCdDxHw1M1KdfMKHxCM0p+OXeD7U8c33Gf0K8P
         TVKGCcnr+I9UaTrVUm4dPs/SxKTphFlFk2+8POqzmVoniDAsh6uAinEoKvtUYRc5jKVZ
         kLqCGF3850fIB49mqV/p8YyluoyPAwtYhnuGhnIe76MiA4gErYqcFBqVfHlY7pxo2Acb
         6KQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zhwpl8TOQKs07IRpBfiYT7kICV9TNhqUpzFRtJ7xMnmexff9+pdogn8So4dLTJEZojRi0abT61l+t+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2WISdgIXZnqnIWL/I9/CmVkdZNT4TgtZ/XyKa3QLIxJJh7GsD
	pIll08stVAt7zsqEFhk/EzrDy/HalXQ//Q9tw7InHUUGeB0suDOnf0qY
X-Gm-Gg: AfdE7cksuOaHoFIXVuoRuhWeTjZSRE5hPewQD0cEjJCA9xS1/CctmuNv3/BtKJLPAQg
	50X7NX5sbAp20TOHv1l06aGQKLs3IBr5kDMBI0o4X/wG1+rvW1nwmHX/faXiXMh4s+xsKQZWFgM
	msFJk83I3hcFwfqztPFSLBRGq7ycdpdKF/dg9mLffwpJSYmxi1BL1seBcAf1MV4MJW4PuF77T+A
	vgkblcU0brjU21pQEsyUw78TFeEfSUoOIiu+pQFVfcO46qRtCMwz53HybREaIz195QVfqI66L75
	/50014/5UmUaIWswi5m+UipeYKv2SBU6LjnX+agtbHo2QDxZJBVpD7BmDgopdtZ5Do14sY8llrY
	FT6EhQEPcBoJxCtWk7Tevi3tvLO7h8nGLHulNBDJR6hdm5myszuUVyaSZ4+WyNIvDzwqjSL6sJS
	asuTKPsjJmSG7VXTSzIuhJHpNHX6J/eL5sDhXUljDeNhjq98o=
X-Received: by 2002:a05:6a00:c93:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-847c0aab1b8mr8629441b3a.54.1783058210821;
        Thu, 02 Jul 2026 22:56:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:50 -0700 (PDT)
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
Subject: [PATCH v2 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:47 +0700
Message-ID: <20260703055355.244898-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..36533a13319d 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -281,10 +282,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +831,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +902,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +917,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

