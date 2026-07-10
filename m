Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AB37881D
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660119; cv=none; b=UJC/lsKpSFo7imCy4oAT+/QJuNYcaZxNblIYOTmqe43l/ZGW44FIt+gOFNuDo/YafcRCPwPhP12oX9KH9fZp2UNG6nqOEDzR1h7sOYhddWH1pLOqtahoTUZJazpzEgq+4z+6NcnNbncWNgjHrWpNZTxtvUQhanpvMVJw8HiHhfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660119; c=relaxed/simple;
	bh=X9zUg2+7AlrLTr6B0lyeWCtO/A5AHknh/Ms0WY/qeuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjHzBrOcmm6vCOmaufGXn5Im0uniejEJCjoFR/Z0c6YYIwALF98zFk8GUetWCRxN0EHIJYY7oCtVaLLXWG/DxiEDpy+xq3yPYJ9vX9xPPvcDfVABoUIdBpzdsLfj2d5ddVzpAuzMTAmhFAgahKVIfxNXgWYxql6FCoc9MBXo8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY4QTe5E; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY4QTe5E"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8454160043aso451966b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660117; x=1784264917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cJKrkL4EmZUZBGGiHvcgGxTvYQoI2A5b+wNCppHC50=;
        b=EY4QTe5ER0ioY9vGvsGFHRnQiMiPiWdHkK9k5sHcK4YR0TkuSsdlle9/INBeUz2XGk
         ZKGJg7Dlf4rlDnFrpIj4qjcowUTcFUGY0Ed/8xkoP7NSs3loVF3ifmnLZA0r4b9mdzva
         L/F57dUg8yK2VcWm2nnMOEDgGqwJ+uPeY3gT5jeIdzj1JugniOir8LVbCzeExnQG8kWe
         Ig427rqnlCzSfPxm8q3wJCaVLRIJkbBPbq2KF2a1sG2UFwBe07bURIRSgni4JWyBeb/c
         YM8PM5c8xnMgwu7idvYelZHWcE2FyCMduyMKoO/sCWcuO6n3YTK22hPk8cyW9NWOK2Bk
         NJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660117; x=1784264917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cJKrkL4EmZUZBGGiHvcgGxTvYQoI2A5b+wNCppHC50=;
        b=YOSd/VdXCqVBdrMnmBWGafSHwVAmTbYcRMLyAYx4u3QPX9GCBmGz0R7EhLLdX6o2mw
         ukZ1BX+Mv+N7A93G3pbNDYPrM0e7HvRysAW+rRSo2UlOiHjghH2/zRahB77poot5Z2uA
         MAJnoCqntRSlIDERqwzC8toNMIbI/zhWzOQnIEaVr03HxU9HvmZ0fL90ASFYmkzB0Gdu
         48QWj92C46jsgSY0rg8v670ztgUjhDOa1WXsskwkg7ZbkyUx47Y52wGn27xw5aUKTpDA
         VySBcytVyTi2IY92bFXrK0wpzT8ompN7C0u41tx/ZqUjWUaJY9ARPtFns9Qgz1NNNAws
         huyA==
X-Forwarded-Encrypted: i=1; AHgh+RrFMLH9RP4P3aJ3f/u4nwMPGOr7FyrHOB/K6542rtc9+UW7Ncvr29eKsDn+CTGgjlMIYK0qaMi10C6kJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyesiHv19+bP0sSdiPiw2Ng0j6AOvjsQsps7B0kjxWsRyFeOGfL
	Awahgq+cBTiXyPzPqXuEQDDeQZHXc2u2xZYJkl2JGJx7hcH3wiKXeId9
X-Gm-Gg: AfdE7cn6YzSJmt67gWKH9Qy94+Wkjs/a4F9tcELqoUY6wEj0jamufAIG1MS3V7ruvOF
	xHSmuSMp5igzMqZ6h9ibTV8UjMuusgaRIY7ACc8h4+FXdzwYFj3JXdGVHr+jFdrryNm1wcfKY4D
	dM78rVd8mQfjEcDKfunJaEZgiIACJrQcXP7JOcSDnNO176yumfrqdliL8Ikdyo4CEdwICTMS57j
	6ITgjXo29p3LOQ7jbl68Dl1jdYF7Bu0dqyUTChOgLUnp9/tKVZpIGIsm13ME3SRw6gAz4KgF4W0
	IM4c7PK4lmZoMLCM+DfT58k5Kkn9MBpbY8o/188vzrMx0A3HI4Wpbq7qOorxgp2oWAHAewHrLxE
	+IfYDYg4N7LCfnRQWp0ZbLtXABTBvGaSjVcAbF+d1mFbyKngek/Tzi1/xyOmRgKMdEPzFARvsHn
	iAmIu57pz0rgPnkR08TaMwIrTNSduerp1+3qfy/LyIEhOHjYY=
X-Received: by 2002:a05:6a00:802:b0:848:5d9b:6885 with SMTP id d2e1a72fcca58-8485d9b6c13mr5853139b3a.77.1783660116798;
        Thu, 09 Jul 2026 22:08:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:09 +0700
Message-ID: <20260710050511.14439-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 70d661ce2ef2..180ab8f363f2 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -427,13 +428,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index d6353af07380..2218f9918ae3 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -403,7 +404,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +451,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

