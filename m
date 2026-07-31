Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBA9343D8A
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467531; cv=none; b=gxhQjURh/dLpEgyivt89JPrdiwbQF5TyCgRQ1DznrhGo1ZGaneJb1dDzL1SL0JJS1gokCsCMC3ZRJA96IwypET+AsSheqG6ZKhAh/7u4CameNbB1XcMr6wABXg/frFgMrKLZjv3cMT5UqtwRcWV3TrNBZcTYGYgHTl2oyW59oRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467531; c=relaxed/simple;
	bh=qK5oLqa99LwEbJPzMKlzORfyTf5bRebbJlbRHy6TwSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YL6blW7zrykx9UMSSVKf9P8qap6X9XVhZaa8cNkD1AIYz6Yple2ENEctLiLIyX1XZ7mWEF0XaZoUH6pbwdvP5sUNtNJ5cmk5tVaJTKaQbb04j64i4gHIB9PB/JUrnwIOJ9mhvYkaEtKnCUTvG3LeCmaKj3Bwh/MFgzjxpcT8hIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVsGEb6v; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVsGEb6v"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad8076b01so5005385ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467529; x=1786072329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeHMMHG26wLFUe8JtsiyvcDWtHIXZd7QcS7ThdQpwx8=;
        b=HVsGEb6vqy+Yz8212CAWJO6hyY1oQB9OW4JSPmHkfvSi9I/P6BiuwrFlMtQC9vTFP9
         kVsfS9499m5YFW428EBIqlk2bQMOXelhAxwW8Zpj+HQnUSfP/kVeByEnZ7dEgEEoeoOg
         oqdzqqeAOOdeTgnLlc2G5jq+APmIULDI/SXxF4wBzyN9txcMj2VOFi2YGSiXV6N/T1AN
         byFWy8fNOyQKDlI5dVjnjgMNA1sTmBkMfc8pZ7KiQDwxF/1PxD6TVBcm5BRzlDnqfYGw
         Ci67guF5SzJel0ChGKNH0HhbAmCWesvzCRx7gTQ7fGA5wWfI+Y4pnUl72tpkSMnSxj01
         ll1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467529; x=1786072329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TeHMMHG26wLFUe8JtsiyvcDWtHIXZd7QcS7ThdQpwx8=;
        b=sZKx6+Ri491nEd1WBFddS57YAdJhc3PsZbNP4lKECVsICudMu7xtICGtgSsJecGUHR
         lyxRQmuD+v2iuVyiPJP/pAiaVm37vPO2DBJ/MXWofrr0IGe+tKaJhHBo+XSw3TOD/GDz
         vvamB1yExdst1/DzGb3yXbcPEQ26UuS8DsBJP6sKUhs/sXKZRWNx6bbR2MPwWVG4t5fS
         KcnEXp5JHAS33YiGJD2epbBolpEFG0fqvHBvAp1Ek4e0eTMWUKL0Fi+CdcAVXeKJMakP
         QUv0vLrr+cxVgBCWMh3mJfOgpLsZ8iPx+rEw1QRQAd5l1nyik3u7eex1Vlik0P0AJn5C
         3AEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdYPpHCnCZsCyIZVtdK4Ofn/oNupew5LpnO80Co8WTSkzVFngozByziEmAZZobfnijTFK7AUu3w/fPAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvSm5sdnW9r6ekNZvHwD5iwOpwNhG7qjSesDPxzk726ZU5eBn
	kzIZ4CMAKCW/gppn2Ubs4O9fiptFYjloDP/c3+t/sDUMmSrWZjd/CyVU
X-Gm-Gg: AR+sD12dD3I9j1LM6ndsp6APLYm1ZWJnS1POLshbP2yi4tVJ+5o2i1cRinaVjeBho74
	kYuC3OVXupcW3RCYrmR92vQbNwZmFR8FvlIIzItn/zrcAfO3bhdmw5pwRi2jqe3vzqs7dU0t1eA
	2F+uprIqX/iHzHbqhL4xrfTDweSHBCxAdbx/Kf3mVO8P03l4VXEYvfJwpJ+EsET6WUsNhIrWFaT
	ci/byXPcfEv2wDPJFpnq1TM2brhof2WZu5GUWE5IYoV3ZvlUEY0XCSwFRa9nrAm54dO59UgTArP
	gXhkuuqOmMQpCx3q+onI+ixuVjqZnvFOb9Cm0oSjffn/Ji0vR8vWCFVJkkCpSfMI/sbTR+554rI
	Icybj0UL2dQWEHuQ3InTio856QCoBW5kNNgx/tWHTsiPW26IAIIWI4knETnWTBRIDktSRH0Af7y
	qcBw80QSVZK9Ruwjcvp/6kQpFj9yJJW3A6cSyOE3OYKh49Uz/aBGL6ZScJvLpQb+q6i3TMWIS+y
	KGsUtiKwtOzA/E/lNe4GhB0S/HQC6jMHSQZqeZRiKOHFJLHBDdycwcvfxU8g+qFkrjbcQl1jiVb
	EIum
X-Received: by 2002:a17:903:3886:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d046d6d244mr4956035ad.8.1785467529096;
        Thu, 30 Jul 2026 20:12:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 16/26] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Fri, 31 Jul 2026 10:06:38 +0700
Message-ID: <20260731030648.8706-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
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

