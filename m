Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9763A5429
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782558; cv=none; b=PqC8wMc/yYLQmhsY3HfbarfTzAOp8xzi4Zy+g/ouF+c/aj+dixSNDwkDf98sEYfekJhA/QFFRM+OMoCK5yk1fKLkK3NAJY7rTpO4eFk2N56eSApfzIw6RZBEa2ZRc8OQHRT2ifFJOdAJjsvQbqRCdj8bTEcfVNlHDDeXNiZLUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782558; c=relaxed/simple;
	bh=0NQREOEMSYxL+uqmZetrbuR2obu3D+rDbZ0Tzl7F/ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ix84SgFB7Z3ZQZoPAjPlO2vOTdvlU9zwyCrXWLvWZ0Q0CroMeRzlxYAImKtkcnPtX2d9UJ6va+YAluWU+Y2jJf3HyKVa/ImO9y7R79pLNbJi8GS7cSa86jFP5tunG79/01qZcW1mjxZhCkUeGgZBuWxewajF61new51NfmpJ++c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeqWN546; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeqWN546"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so2815925ad.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782551; x=1785387351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usuTvoafYBlbhhxqvq4Yu+6sk7iPhWUYa3m7RcyQB+A=;
        b=MeqWN5461Hovsh0kK2FQo2ywpJcsdeuv7jo/AxVb4NmRpel7uWwaBRfdLGGgY8kHHd
         QVwBeT91y8oK9hB1HdswaXO1kOskbStYh+KfYFcaedBbVGc3H9a13JeYS4bP7bv+pFwT
         hbC6JG3K1HVlnBd3uwx68snhAETqqfpDUzg5HujTxK2d5jaUfp6WTGGEo/GErFA0gsFq
         ASJ1FPealodJnQ2Ck0poznGIt0FYxfv9xPVKyFL2lT0R8qkaNDQDM+UNTPc+2pOdvEqs
         fhcLYQ45giC/u94Y1uWT6JAvk8mW8sGFReg1s/ODrZmQVs/Qs3Vc+tgGPihIJLdnoiey
         vDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782551; x=1785387351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=usuTvoafYBlbhhxqvq4Yu+6sk7iPhWUYa3m7RcyQB+A=;
        b=VTXPKuGS2i9KsQatVzcB016//MdP1W9ZtogBTvXuxJLVXw4C0lI4IA4jiBP6BWbdOA
         a/EUMY7CpNi06D2xHHNEKCOEsiMce3ldGDqzJxoWvNIeYQ5g1GASwsCE4/9IQvzs2nXI
         WXEsoZiTtzcpGYGRMTdzZfXYT5vyVjr6lNwqSy0Q+AVUubs+phoVLZ/mpr678zZ5BYia
         e+sLhErbrgU+XUImTZV4utnl/UKNgdv01ELoqqPjQoSWq/Q1tOVgqsaW/AG1e0xP1IrS
         IG5Y76FkyQwduaQjsEXl61/R4aO0UOg/kdI/WaQDn6jjNnbvhCGenfEUAbWl2eMg7E8M
         V3dA==
X-Forwarded-Encrypted: i=1; AHgh+RqHzUr3iqytqi0NrFF2o5ouTtl84C1BmLWPSiop13ToJz2NO6whs1iN3H4+mjkBbXnwBmoDKkhF79+VNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1NOUGkjxGNOb9gM4lJV/7VhUYoZcDgin+DXHPFxVm7ZOKlQlF
	Cj03NKUvW1Sfxpiq1t5HQz2DkXU2OBxHV2dL6isY7Vmo5iDkrTdXvbH4
X-Gm-Gg: AR+sD10KgMU4BtjtHWp4fieTMsITKc7Olo9qZUfchwTy6HNJSATrJEhBPxEoSrBB3yV
	EyaCeSEvp78Nt3RnJE3A7o4I75piljYciXWpPCMOEbS6AQn1ihUJCorpe/UIwox1CRBtsPnnvg0
	PVawuXXkp8PlNcibuSmGc5WajenAjPycSMN6Y2dnv54So8oKamEIx6PJKPmOanzw4AZypD9cQ/n
	ROKwf2OemDl8Q+BiurH79X/lPSARhnKgQefCxYBq6pTO5jwlszicav5lT1IIpTsCxPBk+B6E3iP
	b68KfBntkSsJ0QVhltX9sT36hXp9za7r1hBNu4Wgnwmv5Nygv5+xsyA054AeoddYBAaLmelLzdt
	85U7zubrUWx5K6xc3uoxxOT7SoNaya/RXuhOZPm26JDlX/sTsutTPjESbXuBu4iUXrMJH+ZnlRn
	L3vqEfHfHheBvtH7tGDQQnlKlZd7OteczUSohPIvvJwy2+0jI=
X-Received: by 2002:a17:903:2441:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2cfa6f97144mr20581805ad.43.1784782550964;
        Wed, 22 Jul 2026 21:55:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:50 -0700 (PDT)
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
Subject: [PATCH 16/26] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Thu, 23 Jul 2026 11:53:17 +0700
Message-ID: <20260723045327.28260-17-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm0010.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 2a8c61a72c17..58c0c601ee6c 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -9,6 +9,7 @@
  *          Scott Ling <sl@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>
@@ -148,13 +149,11 @@ static const char *wm0010_state_to_str(enum wm0010_state state)
 static void wm0010_halt(struct snd_soc_component *component)
 {
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	enum wm0010_state state;
 
 	/* Fetch the wm0010 state */
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	switch (state) {
 	case WM0010_POWER_OFF:
@@ -173,9 +172,8 @@ static void wm0010_halt(struct snd_soc_component *component)
 		break;
 	}
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_POWER_OFF;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_POWER_OFF;
 }
 
 struct wm0010_boot_xfer {
@@ -190,11 +188,9 @@ struct wm0010_boot_xfer {
 static void wm0010_mark_boot_failure(struct wm0010_priv *wm0010)
 {
 	enum wm0010_state state;
-	unsigned long flags;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	dev_err(wm0010->dev, "Failed to transition from `%s' state to `%s' state\n",
 		wm0010_state_to_str(state), wm0010_state_to_str(state + 1));
@@ -734,9 +730,8 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
-			mutex_lock(&wm0010->lock);
-			wm0010_halt(component);
-			mutex_unlock(&wm0010->lock);
+			scoped_guard(mutex, &wm0010->lock)
+				wm0010_halt(component);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -832,9 +827,8 @@ static irqreturn_t wm0010_irq(int irq, void *data)
 	case WM0010_OUT_OF_RESET:
 	case WM0010_BOOTROM:
 	case WM0010_STAGE2:
-		spin_lock(&wm0010->irq_lock);
-		complete(&wm0010->boot_completion);
-		spin_unlock(&wm0010->irq_lock);
+		scoped_guard(spinlock, &wm0010->irq_lock)
+			complete(&wm0010->boot_completion);
 		return IRQ_HANDLED;
 	default:
 		return IRQ_NONE;
-- 
2.43.0

