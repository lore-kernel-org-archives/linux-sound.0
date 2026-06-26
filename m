Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7F3D3326
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454447; cv=none; b=GW5w/XxN0MTdDyQeJiK1OUHLl14pjLrYDp/2CqYBFEDdWm+uPctZUiakp5QESqsEGHJAbVYRDsVZ25vvFO04JEamM8mJf+kuKDBAlLvEMSIeXGOs69rI20X0+fSsYrUhlSRgE4kWssTS3T8ucP+80JN7npm/iswqWLBoOFUiwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454447; c=relaxed/simple;
	bh=R5s11lRtMkt0ChjmDAyftHMZY8EG7E4owWfhRXPCyQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXyxRKBNn2+cwUkvELANfeNm15ckEx+uNgDPQDoSG/2A9cgk5BvrSuU35OKtpdJR/Iuf6eoFoRelUT1fwiat5nviK8YAYFxOEB/X8T4/UIfmC6b/IOb32+7tt7q+6OD6XWlH1EbgGX2e0SVXejwj2d8WwUSw9BZ2BY2IauK8iKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n63uKgMz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n63uKgMz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37da8b5540bso381535a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454445; x=1783059245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAhghodzghWLNkWnKkUJE2/QxTnbZ4g560t7Ra+4Ai0=;
        b=n63uKgMzv9AGeUFTvv9WlAJz9ulnMV0bbPe7vHC8phTsbGKVamepZeAi4pornFgtfK
         +v7OUB7j/0I2OrjiyLjRF5eZkw3vQZxejZnDq6eevQrDvKbcIQxMacXebF4kBYchqmjV
         71IY7GTrBrBFdocaV24hfiQ724sCmi4bffyhznN3eBw6ThAg3xFEzVqi91JSB4H6TSyf
         QCeYD59FqE5gG5nhLTTqdiNxmW5vk6ktxYM5acjN60SAt0BWIbCaDfimgA0PryOjjXfx
         yRpiwxRY8svmEG+Nb/eRpeu/pXYNj27q6b9lM28xJ3wTJsq1wIZofbJUI0vgkzOqvHRl
         nHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454445; x=1783059245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAhghodzghWLNkWnKkUJE2/QxTnbZ4g560t7Ra+4Ai0=;
        b=QRpkQrNlqVO0nGDNosvss/OxG76uxZGgeRGmvt/6N9JdBTU8qXLAnENRlW4Sku9qTc
         c4LfnQVzpsTU1/FMbQhV4PhyymXA2+qAWogjJnThFbNZkoHgpSS8WENm2mRAdQIyQUhu
         SvtVExTTj5UYw4rpHSjeDddX38vbgt5HYKixIWczZ0cVttlvVS7xnoRoxIw6YaGT8HI+
         LEQ3Mlqy2In9Y8X5vGYkb+lCYpxAHyn8w7mX3IffVh6gsm6g1t65X3LC8niYRNrPxUIJ
         8X9CC35NrNuysaAnb4e1yRYL+I+VMiYBxvPJXxNSv+BZecTpgJZJE1kWQ2KWMk9IGL1J
         GW0g==
X-Forwarded-Encrypted: i=1; AHgh+Rpie+FP+vK8e/9YWhl4PA8ZXX7J//t9UlkMRfQfLe+vVuMjIxdbrlqNAMlHbPNk+6BoY5gelLbz/1gRbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3zSvPxLMmXR4hyuteKdul7y0YJu569ciaGfBBb/bK/dFjcI5/
	j2M8Xd/+EPTRybfMxJw0CTyh5676cs96KBXmosnsXrqkeFAUVCJ40Xv7
X-Gm-Gg: AfdE7cnPmYXPcD0WZ/j6xsredo8PeuzR4OippfU/X/0jh2PY/CY8+b8qm/dGnsl5ba8
	6azYN9AjxP/OytCgB2eWmkEyQyrmggbhk+vO4fggjJGwOQvaPNIyR/ViFWCHBWAXdwJ0MZcdqg6
	8OTow2Tp+cOBPxVlmLXk6lCJFoXwhSvQi+2nDPq6u9+KPT173Itu/R8vAcoopNgwwaF9qhQGdlR
	stZ94CVP6PUHPIxek+vNF9Ble0x56teVLrDBU1RwtTJ99+NrVdDHWHE/1lBd6X/wv9rja8XlBNG
	DIf5iq+jZj2wiZurk/y1GygX+hQRIA6Ok84ZAQrhvTxjE3y0bmOzjKgbSrkqbrmIxcP74x8W5I2
	h2r1JkA746QFy5tPoJgh5rRK8079Fm7MV6zmbKhd9Zuw5Q+gYhp0vnCGDd26zFbgeJG6kI/IW5D
	MvADx0V6cLyvPlDQ2QlJG4cCw01jb8k7PQABPK6Tr/N9ZefNA=
X-Received: by 2002:a17:90b:5826:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37dfa251534mr5702221a91.15.1782454444842;
        Thu, 25 Jun 2026 23:14:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:04 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
Date: Fri, 26 Jun 2026 13:13:08 +0700
Message-ID: <20260626061329.23264-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 39 +++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..b0af32e0ddc8 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2012-2014 Wolfson Microelectronics plc
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -707,15 +708,13 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 						struct arizona_priv,
 						micd_timeout_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
 
 	info->detecting = false;
 
 	arizona_identify_headphone(info);
-
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_micd_adc_read(struct arizona_priv *info)
@@ -921,12 +920,11 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If the cable was removed while measuring ignore the result */
 	if (!(info->jack->status & SND_JACK_MECHANICAL)) {
 		dev_dbg(arizona->dev, "Ignoring MICDET for removed cable\n");
-		mutex_unlock(&info->lock);
 		return;
 	}
 
@@ -936,7 +934,6 @@ static void arizona_micd_detect(struct work_struct *work)
 		arizona_button_reading(info);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	mutex_unlock(&info->lock);
 }
 
 static irqreturn_t arizona_micdet(int irq, void *data)
@@ -948,10 +945,10 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
-	if (!info->detecting)
-		debounce = 0;
-	mutex_unlock(&info->lock);
+	scoped_guard(mutex, &info->lock) {
+		if (!info->detecting)
+			debounce = 0;
+	}
 
 	if (debounce)
 		queue_delayed_work(system_power_efficient_wq,
@@ -969,9 +966,8 @@ static void arizona_hpdet_work(struct work_struct *work)
 						struct arizona_priv,
 						hpdet_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 	arizona_start_hpdet_acc_id(info);
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_hpdet_wait(struct arizona_priv *info)
@@ -1018,9 +1014,9 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
 	cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	pm_runtime_get_sync(arizona->dev);
+	guard(pm_runtime_active_auto)(arizona->dev);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	if (info->micd_clamp) {
 		mask = ARIZONA_MICD_CLAMP_STS;
@@ -1036,8 +1032,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
 	if (ret) {
 		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
-		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
 		return IRQ_NONE;
 	}
 
@@ -1057,7 +1051,14 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 					   msecs_to_jiffies(micd_timeout));
 		}
 
-		goto out;
+		/* Clear trig_sts to make sure DCVDD is not forced up */
+		regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
+			     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
+			     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
+			     ARIZONA_JD1_FALL_TRIG_STS |
+			     ARIZONA_JD1_RISE_TRIG_STS);
+
+		return IRQ_HANDLED;
 	}
 	info->last_jackdet = val;
 
@@ -1111,7 +1112,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
 	}
 
-out:
 	/* Clear trig_sts to make sure DCVDD is not forced up */
 	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
 		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
@@ -1119,9 +1119,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 		     ARIZONA_JD1_FALL_TRIG_STS |
 		     ARIZONA_JD1_RISE_TRIG_STS);
 
-	mutex_unlock(&info->lock);
-
-	pm_runtime_put_autosuspend(arizona->dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

