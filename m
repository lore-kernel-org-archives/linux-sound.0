Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603613F4854
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145454; cv=none; b=fPb/RESfwRGN/WHs5sLyq6isUtxNz3czncbYUF26iUsmdvaDXNoUOq9TKq6rWP4ZPbOkk7Q4cAQrRi6jNQxmEIK7JGXfx5tLtiJxr+YJHN4i19hh9eK67AO5dQV3AgraAI4dD3KNCWsTknzbnoNvnY/BsBV0k6/M7d48oCa8w9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145454; c=relaxed/simple;
	bh=qK5oLqa99LwEbJPzMKlzORfyTf5bRebbJlbRHy6TwSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKnzzto8jehxYlA7BEghjKwGgcb7NQRHI+8a6pkRJe+RkYP7mu//rfMTdXmK/aYYUyszb3ghAga0RVAymZzMh9JFr3+ifSP2xGQflDLwOfWepCN0qwnGO/y1/EP5ygKs3lX1S7NLjqur3AdO8gEyc3TRgj+eFMBOtMLisLbUzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN6uz7K1; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN6uz7K1"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487088510aso2016814b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145453; x=1785750253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeHMMHG26wLFUe8JtsiyvcDWtHIXZd7QcS7ThdQpwx8=;
        b=JN6uz7K14LXCZxkOxnKio2OFQELMyxPQIoKaClYk7V7+4nmnfhJXXKHvxEzSIgVL1w
         Gf0NbzM6Xmd73eTzLjKq4cAm6IvySKEz8IJd19KN9z9A/mWU2rIVzvy4z0/cBUW9+YcK
         D+gH9fdbWBlbbx2Bq6zwYUyFey9ZVsABM4xFjUFSexmQk29o4zGmMZGxtbCyR6CNaUZZ
         UfN7AjtwX+VF4Mk3pGpEgsv/TL8U+sidWObMMBAzIXe8Y2pgwd4I21d3+aP3yDwo/6rH
         wvZQuF+dbgpJ39PkmA+Uyh4RHU8d7QSEPR6TyHP2rMPNsrhClzeADQ1Z6uCPdkuJZ5lz
         Z4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145453; x=1785750253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TeHMMHG26wLFUe8JtsiyvcDWtHIXZd7QcS7ThdQpwx8=;
        b=OTAnwtUhG32dvDLvlDeuMlnUsYsiqT3S5QAzpW5BBpGhsrZDWQtxu+pzRjOAKHz6ce
         vixxoWrF/ABN5IBdnc0t/fqzod7XueeoyM19ucjNRvBgTjOKvz50e0408bbhTBkqyKXM
         /xo5G4ZMxPYhOtEJjvO1t52i8UMQFTUrIn58/klQ5nZkIJnHkTBDDNFPn14boLwhdz4A
         CRsXToBHaCY9hSVYbjNvyA/wkSsXW6M3IT8cFWvT0UBGB2PNDs6gu1df1x6jHPWyg5WP
         KkFCrmGOu6aG3f+r8DHQK2QERzuqYo+Bo2tDiIpQcsfAHgTHrbXjSItbwvHdsEhGBFvw
         ut2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9gOJlbo15+vF9rjns141/q+1ZEF3sY4nMNh+x0rpOoVWSsuwORu8gwFYSy0o58hD8PW8T3f7GWC2fcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJFal5uz8m/lMrNtDAcYW/DJe6iroSVL2gB6vs9Iig3Pftldw
	+/znnQzGlEcdRYAf6fbHmwMarLS5zJ8RKdBK5f5+8vDgCR8RgJf7xqv0
X-Gm-Gg: AR+sD11TJQDltzZ16SMX6Xpb3WshitVUiC44Aa+tl5KEriBXwSrYWgOvQsPeqwECPbL
	e9BeriNVRqXalCkYVErA0bnQNa2DBw4jlFQsnyu9vVZJf6m45Rxu8CCrw1IYA1+3uPnK8dMlccL
	3c8R/4ka52oSn34XGClAcGNoBSCjSCQONL0Gd0PRRfwNQEBmuS0jW5mNlNtFiZZrPzH7XBJ1Ybw
	U1WOi121kq88+lIAFIw+zBjPMODb1iNYsuBGOMjrNSqW+7capwH7YN8ReO3sDYp/fQ4kNxCes8P
	Tf93fKNamJzefkTUQhwe64C7IbpVRzewsRND0w2AZPXGe7j1T1hMxDQTNUfFrIVai9tTnbMDTRA
	vD/DkSkd7IOQGxoaIzvQx6bOdyLYFlEsZw5r+TCUGLofyAvlYeq9HphvgUB7LRSm9eE25MJYEU+
	rN1C7NK9lF/9kBoGdtobpZnN55dB8pmzKLCysEPH0i7UvJZ+mthPLlxUupR2MpZQPrbFh95VQS7
	6VXjzoECgXqayD2mLqKUQ==
X-Received: by 2002:a05:6a20:6a27:b0:3c0:9c1a:893c with SMTP id adf61e73a8af0-3c67e16412fmr7411564637.68.1785145452602;
        Mon, 27 Jul 2026 02:44:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:12 -0700 (PDT)
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
Subject: [PATCH v2 16/26] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Mon, 27 Jul 2026 16:40:36 +0700
Message-ID: <20260727094046.23001-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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

