Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB4381E81
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401198; cv=none; b=HmrIN58dG3zw7pu93zHDMOCa0hkVx9eQWF3+OfnkFyTwIqOuiuXtROgJSuDGdfFyUD2oR1TPy5O8XMz5OOF5nGfCSjQPWDAbPI+ar+IzLUjY0fWHt3gOb2o8MbaEb1BHP0VcQt9+juUYwakWRtqg7g/5cj5OciS8X1S4ZR1C+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401198; c=relaxed/simple;
	bh=t0c54/72hct8lbrFEg8NJtCjqHP1Kp8F2lBkIgrtZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4gaXmSNj8ZAnaatT2paoaVwlXcoKID+m6CoCEIVQDbQYOj+Iv6jRinDbFVFEtgmWt3pFiRRh007VNwcII3BVDqqEdb3wE/WmyAhr9YGDz/oDB8oExU36imdMdFPpIAVfNhdsfQ/z6qpurmHJ65SfA33iCsiA379CZtv+oNfUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l00sfJUg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l00sfJUg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8454160043aso3698117b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401196; x=1784005996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=l00sfJUgVGG4YmO8vHgO5y+5aoHWdCXmBPIsGQT2RrDgEKiT4ts2QtJsZH9gnKogJ0
         mTWuVnFENmhENPpH3f6ngzl8kCRL+9J3GZ/SCdcUVKnMcNHiPaLIHGVR+tk9xo5Fyp20
         aJLg9t+XR/XH4adK+eqF8wcnROe08NCC44sfQESHYyrxtPZjrNcQVQyXHS8j6JxQ8GOS
         TE6kfgN7Oz9jhGN3AaAQd43tYNa1ygjmk8raAVwONHYg/j99EQDtmA3e2OHF5Z1mBWcP
         CyhwaJVeXWVdgUqYbtWhKACFlmQH/FhmA0033xS8bfIUbAiV5Om8v2RoQtou7ch7D9le
         g3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401196; x=1784005996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=Yv2m8jjOVB5tRnPaWhWPcmvXGxz593XgUNpm5uyXOulXBlUUCiTL2uWgFXQxnHnPAC
         2asrQmpU2frYQ21oqjDbG488szVh/HWUsjSsIBrqXMYWzQDXdM2ZqyH/m5Yhcy/hao2W
         M98+OibjCihTjz+R5qF+8gke9Sm2pGe4u2svTE3sh/CBuoHXqKYhWt0J/e7IiD4IhVk9
         M7gJWharRgxm2WW4BZjMlnvqc/nVzOgLX608sI8n9SPPDUvMR2HfgaaCGbjK+G6Y4oWb
         b5pXK/iiGuFlidOJc4qPtUAoW25cYRzH+Sdx6koSBDCoQXKm9zIC/55uGn3zP6klYy62
         89GA==
X-Forwarded-Encrypted: i=1; AHgh+RrBSVIZJ8j/QcU+u1wLhpkYIr0/R3sLTNTFy8GFHOVrvlSLazfZiw6q8Ff5riBWNDo72YI9kFmDwKHsaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvkD8LIA/gCDEM3pRtSAR/JdaiqnJVFZTwYU+bIYI+GO718yGs
	usk6GvtvEpOVUaQcIyOqchpgGtvp87nES22f1dMBxGyNbU3QqEcUBbue
X-Gm-Gg: AfdE7ck7T2NhugdUlc2c9dhe4yg6MAA30+nMPRs6IPvbxDGxGCdjpk9RtFFCiUSGMpJ
	dmFHagWAI5epnfxaViVIZRPOUEODW1W3ENkYJmSSxDB6J7PSB786G8O6qool5jfYGmj4G691H4X
	SQsD5Cw+kFHJv8XlLkqi3ur8IynkmfHuEU6xLjm8UQ9548JVKgZJIc07ca8YnVEgTKeDX1nboQO
	iCTGRApQlbQrNmtcPJg1im5GauyYcCBflliyFibd1lLFKgPLwQi2c3HnMmX2xOV9eRhe1VVROYN
	I8Pbli+ye+gDP2fP6v1lpuXB55b1DS/chii4W/Kk/1258VJ6hHO10ip2BTMOejXIS7RxLLnuZtW
	zVUs3RV9Lg03KeZAdxCHSbbB3rEzOA+r3G3gWhnQaZZ08mtJL2XdE/ReWk81KPiU3/+993IcFC+
	q1NdDnjkuRLsnneM6c4SGGkrZni+LeIH5gpWiij0vY9+6tMDk=
X-Received: by 2002:a05:6a00:6c82:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-84826ecc0acmr3396135b3a.41.1783401195584;
        Mon, 06 Jul 2026 22:13:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:15 -0700 (PDT)
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
Subject: [PATCH v3 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:58 +0700
Message-ID: <20260707051006.20058-17-phucduc.bui@gmail.com>
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

