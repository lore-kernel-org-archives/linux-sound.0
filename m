Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59DD4611CE
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515155; cv=none; b=WapO7TY7AMPTx0DnSt+mVb7R3Bth+V2bq+4CBPx5d49DJThIKpIzjpGiun5AODKhEB8fZLFJi7EXoFLv2Ep1l6YfL5y2lL7iBESZeqZWRdd6P9uu4YDT6t54+HId6teoigfYy5wpscfieMA6YrUKFEMju4gIL4AdKKrBldB9tis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515155; c=relaxed/simple;
	bh=t0c54/72hct8lbrFEg8NJtCjqHP1Kp8F2lBkIgrtZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PS9Dy5nbBUI1JQ22obyPmizjhMITruSy//oca5bOkYOColYlLA3b49q74/ZAjoLLxZPPbjCSM7CVILMfGJol3Gf7sG/BZShlvWZWquXj81l++z+xIlX9Eh5VZjAxABZDISqgOHZ85fG5MXODANPQaFwzfM33uCp4EiQYpFWFx40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLl++b6t; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLl++b6t"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383adaa461fso441338a91.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515153; x=1784119953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=JLl++b6tp7hasZDENjbyJwaq8yb35LqYLxeCNS/LwqTamaQ/bpBzYVIUdouM2WV8j+
         lWVxXD3TfeiTuhcdTVul3PP0Vm8KVHmcdsfYESTfr+pAMC/8kDQZsJnDsbzxMILTXQzX
         JxDlaOqX6d2igoykbaBfLIIQ+wEWPSpgF1eB9/WWlFbHH10UI4SVFuFR+3F4SPz852TA
         WwOGC7y2lSZFJoOqNgW3rFR/V8pObg31OmJM/tLEu1v0l1MBzjXnHn90n2kDERwLzvVO
         GZPf1feqztiihT+HYbT6MeRBnzEJZCaAiPHPKkKFxc2yx6gmoZuf9hvg+AwL66PvpZHs
         G1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515153; x=1784119953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=Pi9r9I0n3tR+tMvshDm+dKzuPZuijoM1bpEK3Wp2hS4gI0t92T1LuR4zEIZDZv5aPs
         oGd/RtTZCvEGydc9aGeezRANRmuy5XmOgTauOQ6NpNwRKB0NM1KIaD41RDi2tIQ7G8Jm
         0k523YXLi3JmvGAAs2wyOFjVi5a4+wgP+FgNX5fLzd2nkKQMjSqch7gGoC26Bk0nx8jG
         9X9ybrFgRnNZAmibEW6tz13xwOJYgDek7gGK68UDseAc040h/gLqGo6XRJ3050OtBUfN
         P09q+OzAT1GFUmDnZw6pMB8IHF3NOySGIeDIrooafl5fkWMBG+mgT2980D96KW12ghQo
         paZw==
X-Forwarded-Encrypted: i=1; AHgh+RoYdB6erBHFawDpJ3MpcToT/BiklRiD6vmRWASu0rdm56dzrCyqd0YyJxTzZDYtYARdiFvlFbDGZTKLEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylt6nXmd9otCemisJQyRbTRhzl/WSLaN0gFolSQ8DTgr6Byt40
	GFEnx6PT+e9WxxF2nrRzuY5kj/3tb3MpVJ4QGgAXI/4uljVnJ60dRMxe
X-Gm-Gg: AfdE7cmyexFlQNAhQLK5E7ZV/Fc0MwW9Q2EaX+dTDkR9sPD6gHAteww/50scyvkTvJ+
	GIhszGnbvb2wvy5m6WfrfdSLMWspOWfiBtnVb4OMxnEiV8yXfdb8dAEFPLcmiX+wHN5YTsWfNA0
	7Wx/qEFiKHmZx4sUYTfMmVz9FGQvnZD6BPN9yZl+UUJ/IQIEIh7WPzvYLuibGO+9GHrkp5+bu5/
	nds2XVmibnbHiJwbPtEOtEkox/+8fL5uYXkbPPNfG+Ikme426URlU/1HmJ5TqTNLXyDf3D3foWQ
	/YwKqLyh8cIPnxmJfOB19Y7/08WudYaOPWxmjwW93mYOIOabD38Nm9xanMdq5hLog3QKQdRDmHX
	1GruXe5NCoCo9Z8lXEIaFuAoPxGBmfZlumY7lAxCtxAqkVhiDOfD8GAOiaz7Xe0Xe2urQA+xh2i
	f2N0nJjB3U7JcYcbKRL2AgLEFieMG+5FXrnWV7xdsvOqtqXrY=
X-Received: by 2002:a17:90a:c2cb:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-389420ac578mr2725220a91.34.1783515153137;
        Wed, 08 Jul 2026 05:52:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:32 -0700 (PDT)
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
Subject: [PATCH v4 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:53 +0700
Message-ID: <20260708125002.202515-17-phucduc.bui@gmail.com>
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

