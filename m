Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0B3BBFB0
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781090; cv=none; b=U/zNzulEvugKt6CwNVBBfv5Ro1sPkPuvzKvlpF2UId6s6JcXtM1EvD461XxSPGgBK8lLWKczFxXrukaRQTXYmjRffDu3fMLYJ+gNucF9Sst/FgmmxMSjDDcYs9bECbHr8WVDwLvh++hHO+dIkV1NwLOCXSjf5D4DWG9g2isTmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781090; c=relaxed/simple;
	bh=86Mglw3sAgj0wl4SUUHXpfzbY0JBBRM8KnaSg4QllDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzrmOE4ub31UsHrhnyYVt0TKqucIOoaN8sXtjTTXtWVtA1eLKH3Uhn5nYeRX8zItu3Y5QxtXvE6vfguzfsypNEDV7bYc52llJal6kqWjM6mmdfJ/LqnVcY7qiMS6/R4gpBJ3Al9JWjbUI8LGB4rDbu3xOKXBHwy122WYpm7Tlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EH596rOh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EH596rOh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5622965ad.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781088; x=1782385888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=EH596rOhl7P6CX33r4ZAwfaVvoiTb/XrdQRkm2fZmf0CIFDZ45rPPUZcD4yaiPDqBY
         vvWyT6Dkakm9n2AMb3yZ6v048v7pZMxJTht1rAHX9sHnqLkfuKQvHAxbOs5EoHJig+QK
         qhu1kPYV2kARymRu55fAKzO63TCDLzb+ky5beD3sjLKR/Rw++TtOiGrnAN8IqFskxuIz
         rk5+uV2EqlljZwSlhisjUKp06uAnd2DibgPKlS2RsnXRVEw0QcznP7c10FZhg+4gEj8a
         jF8CCoUXzOMSMMXketj76Qc5EypRP+6EODI5umJrO8u2WTXS4jpYu7GBilXXuz7PA99k
         zmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781088; x=1782385888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=OoH0hGNU+8WfK34sxRyyBgfK8U4aym1jub0uKVZNWgvTyoSTC6VS2rqIWDUWIioEJD
         frqU8oSTIX1oPxJ+6+09aqOAFnwGqTxKRDr0vt5am49fazog8MiUnmn3NVX9JlJX8Etv
         NzgLxSOeEjI2SrBlUB281476sNN9KZfgf6F6PmZB5iUBCArYxtB4yE3zRlJrhPXlLxqT
         20ewpTOCO2Ld/XnOkK5tMMykC6gih7PFWVFbZHWRVxeXpMmjJ9WH/mchh+R4hS9Fj7te
         qY23tWa2d0XyOA4mG0tuz1H5TkPFyMGzjb+r3u7Gvo+fBb/gwVzHymvsKyOEx7EYIKa6
         w+yw==
X-Forwarded-Encrypted: i=1; AFNElJ9U3eyll2pMETx7JWITgUo9a+XGfA9WP6i/UxxFbyNGBfFJ8ZJ8yjrGyd228GHbiQ50ln87xhZBXN5Ncg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy54fsqLcCUHqdt/WKTn1QEZn9V8/tCaiaQgEF1LCdg1GzTBfVq
	B7DCR/h5OhtB2fZWhs6ScINoupV0cbE/hOpstNQItcxhJiLHyjhKKRwe
X-Gm-Gg: AfdE7clQm6NaHVyXgXypl8SEcH7fnNy3u0GTg30PhHp1wT05IYsZfC60BfzdCfFaCEK
	otoSDHjF3kBhPktt6aRQeuEZuz9h/QsIxOg2eNpnrt769TLdsWNda0obyxrnooyvEOogZ57mMaE
	9N1Cy4+O2/99GOJFBY2EO1EViwEhysk/CzVDyKnZBSmBYbw6R8zPt4hvk+BZkSWUm2/SQ/5db2Y
	0A7CfW1zLjCP1FURDd0Dy3SjWmiV0CEkZBVqs8ID71yKoP1WPuDyZ5xHSFy++DbitxzEeCKSBpL
	VlhzWKYBSWcQBdXXWws+f8GmuVgaDrdu7457C0p0+hoO8qvDtOEZl5XLAplghgvQuzcxJZZpliL
	4GlnZDATzWnNKWwx4C0CsgpgvHTMnbuCelCr/vwYjHlIeaKLY3M/26i7rRdC4tDeh/U58jXEih8
	nt97urThe7zRQMd4NlRZAl+ue6H3G5CX3fhwqDaUIXHg2SViBd5TNuK7Am9w==
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24421195ad.1.1781781088169;
        Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:27 -0700 (PDT)
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
Subject: [PATCH 75/78] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:24 +0700
Message-ID: <20260618110827.232983-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8994.c | 51 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..58f18bb0057e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -766,7 +766,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +775,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +782,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +798,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3700,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3714,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3785,27 +3779,25 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	dev_dbg(component->dev, "Starting mic detection\n");
+	scoped_guard(mutex, &wm8994->accdet_lock) {
+		dev_dbg(component->dev, "Starting mic detection\n");
 
-	/* Use a user-supplied callback if we have one */
-	if (wm8994->micd_cb) {
-		wm8994->micd_cb(wm8994->micd_cb_data);
-	} else {
-		/*
-		 * Start off measument of microphone impedence to find out
-		 * what's actually there.
-		 */
-		wm8994->mic_detecting = true;
-		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
+		/* Use a user-supplied callback if we have one */
+		if (wm8994->micd_cb) {
+			wm8994->micd_cb(wm8994->micd_cb_data);
+		} else {
+			/*
+			 * Start off measument of microphone impedence to find out
+			 * what's actually there.
+			 */
+			wm8994->mic_detecting = true;
+			wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
 
-		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
-				    WM8958_MICD_ENA, WM8958_MICD_ENA);
+			snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
+						      WM8958_MICD_ENA, WM8958_MICD_ENA);
+		}
 	}
 
-	mutex_unlock(&wm8994->accdet_lock);
-
 	pm_runtime_put(component->dev);
 }
 
@@ -4028,11 +4020,8 @@ static void wm8958_mic_work(struct work_struct *work)
 
 	pm_runtime_get_sync(component->dev);
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
+	scoped_guard(mutex, &wm8994->accdet_lock)
+		wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
 
 	pm_runtime_put(component->dev);
 }
-- 
2.43.0

