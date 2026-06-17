Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E494534A7
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692780; cv=none; b=axDYWxwtdFc5BclVujx4qs0SzVKG3g4GVijVXPUjjU6l2qIf19i/skzUWhQ2qPjtzlRlwYxiNy4CFzWUxvZ34LB7sNpUA0CgY6kfWy2zXe5UNtudlwCPJjC6InYasRXse5kokXsmLCF/UY/z3C4KilXr8F1inVcmITsra6/5jY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692780; c=relaxed/simple;
	bh=aKhcyI2WDSo96TltHAbwkDoRWNtxc6VdjCx9GbZVAX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LToWMNWgzKejNarbe6CNHas8thlO35i1eBIGorR/y5+DHYft9xttR7F0EWEzkd5KeXbCkx71ZgUHzKJ8iaLBHmeCkS50LEykxnGVuDI8dNl8/aBZiir8QxrnJRYfeINKjP6o2plN/dCjWaqnV7c3Os651s+ToX4DXAZPUAoeh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejUq0qht; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejUq0qht"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30759632453so8917414eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692779; x=1782297579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=;
        b=ejUq0qht8iceIfsIJO/zswJlm6CoWfX/2qYy5FZmnVMdfO5dJiAdQpzrfTaE3XsNgG
         jeWxI1XTF8tgyKfTsSX5SEwkCpvUAvk8qtkKxbQ/8biLxNq67PhwLwQ4W8Z/bOQgELR2
         HrVr2YLlrXDZ3VasZBlyDy0dCSpqC/eGICCKZ8gv5okJcozbWCTuQ/YTD2yUmW+c4A/Q
         lQuIpyb/jbtKqNvC2DDMlOVmImOEnIegooPb+w+9rFp33kEw/+sKekJrV53N+9EMeQN8
         Hse9zJlvQkvlZ4Pr1s4omxcRtDDD8Hz/RiJsQ79RVjLuSagaDeuYW0/XhD7iN6Aoy95u
         70Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692779; x=1782297579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SpJk+YV05owTMk/l4yBZn7d6rPDuNymeMNQ+5MR+ME=;
        b=S0JQWTTpdE6axnKRa+hv1csjB9BcJUbcO8h7thSoXV3Q7y5oVhLRgzdtXLLgNCnjZ0
         dBQOZBgBtxQHfTBXX0xcbRw26rhemfTZHR1s6g23waYlgIrJbCdbtZnkNk9YXQxO4Y7b
         OgtD189v9JP+nsp2WCs+JdjcxNdq0wG4OyLd0OEf2jzuPELiSaTrL7n4qzoeIgqhj3Gs
         1dNH1DGbLAzyiplRmYosS7hnryAg3DnBPSmzxl4fdNLEPbZe0HsO19L10ZKyKN7nJLex
         mzgpNjK2iVvuKYFBzVxAh7E7SttxV+qqRInu8zvs/zXGkIacuOE9KXmmhVpiU3zSd8oj
         gHpg==
X-Forwarded-Encrypted: i=1; AFNElJ90LsaxM7FFuL++csLxt5AZxHJqhssSTb3A9ZjRHKyV9uNU9QCa0S7GAJ30dArJ3Ke0EviLGmV1G+9tlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Qeztk67dZ0Rc4pTORPRrKw6bJGFR42NDLSRW4BrjSaRfvIsD
	vawX+MtZDB5xbohus9VuOk2HBbx4ycesrK14eL3LMOfNTezcEZSdhGM1
X-Gm-Gg: AfdE7cnODP2l3tMzcLJYsJy1Qve1AE/YfuhX13ZrCSv3hjf/2QKaTJVCHhkPZQlcmY0
	wcKRPDUfDYeHYBDWDDwBlwIapb/XlzOZWBe9DNwa7uwv17RO+OZQNczKZQe23qAIOwsctfOssiB
	dQAxKqlARMEseAdvKnEA8ACW64+5Eg9dVHxJjNVYrabKA7UX/Yf/SK0U98r3jJsMYlaPINIjzau
	7fJuvbHJwDEJeVtP+TwU63+6jvr7AwsUS6wqWvy+AkHlJnIUaErRr/wbPwrh99qpDNngXFHRkFB
	y+hHHL/b5QPlrbSejHVkPoGdjgeleoAi4664k9ymuHBp4/3fJpA69362nw9wSHt2xw/97h/RxpO
	koAVJTS9p+FkSW1WcaTPW08z8TBsFveg1aH0baxIlEgXvB0f/9EwAH/hTMp0hX21y0ltStLVbZQ
	E00Jj8UfhC//w0Wx+dtCZfxihB++EyeHJ2NqXC2nk4ttaXKo8=
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1720604eec.29.1781692778532;
        Wed, 17 Jun 2026 03:39:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:38 -0700 (PDT)
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
Subject: [PATCH 42/78] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:59 +0700
Message-ID: <20260617103235.449609-43-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5645.c | 161 +++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 8a9af260e5f7..4a74b90bd3f6 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3325,93 +3325,92 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 	if (!rt5645->component)
 		return;
 
-	mutex_lock(&rt5645->jd_mutex);
-
-	switch (rt5645->pdata.jd_mode) {
-	case 0: /* Not using rt5645 JD */
-		if (rt5645->gpiod_hp_det) {
-			gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
-			if (rt5645->pdata.inv_hp_pol)
-				gpio_state ^= 1;
-			dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
-				gpio_state);
-			report = rt5645_jack_detect(rt5645->component, gpio_state);
-		}
-		snd_soc_jack_report(rt5645->hp_jack,
-				    report, SND_JACK_HEADPHONE);
-		snd_soc_jack_report(rt5645->mic_jack,
-				    report, SND_JACK_MICROPHONE);
-		mutex_unlock(&rt5645->jd_mutex);
-		return;
-	case 4:
-		val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
-		break;
-	default: /* read rt5645 jd1_1 status */
-		val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-		break;
+	scoped_guard(mutex, &rt5645->jd_mutex) {
+		switch (rt5645->pdata.jd_mode) {
+		case 0: /* Not using rt5645 JD */
+			if (rt5645->gpiod_hp_det) {
+				gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
+				if (rt5645->pdata.inv_hp_pol)
+					gpio_state ^= 1;
+				dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
+					gpio_state);
+				report = rt5645_jack_detect(rt5645->component, gpio_state);
+			}
+			snd_soc_jack_report(rt5645->hp_jack,
+					    report, SND_JACK_HEADPHONE);
+			snd_soc_jack_report(rt5645->mic_jack,
+					    report, SND_JACK_MICROPHONE);
+			return;
+		case 4:
+			val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
+			break;
+		default: /* read rt5645 jd1_1 status */
+			val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
+			break;
 
-	}
+		}
 
-	if (!val && (rt5645->jack_type == 0)) { /* jack in */
-		report = rt5645_jack_detect(rt5645->component, 1);
-	} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
-		/* for push button and jack out */
-		btn_type = 0;
-		if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
-			/* button pressed */
-			report = SND_JACK_HEADSET;
-			btn_type = rt5645_button_detect(rt5645->component);
-			/* rt5650 can report three kinds of button behavior,
-			   one click, double click and hold. However,
-			   currently we will report button pressed/released
-			   event. So all the three button behaviors are
-			   treated as button pressed. */
-			switch (btn_type) {
-			case 0x8000:
-			case 0x4000:
-			case 0x2000:
-				report |= SND_JACK_BTN_0;
-				break;
-			case 0x1000:
-			case 0x0800:
-			case 0x0400:
-				report |= SND_JACK_BTN_1;
-				break;
-			case 0x0200:
-			case 0x0100:
-			case 0x0080:
-				report |= SND_JACK_BTN_2;
-				break;
-			case 0x0040:
-			case 0x0020:
-			case 0x0010:
-				report |= SND_JACK_BTN_3;
-				break;
-			case 0x0000: /* unpressed */
-				break;
-			default:
-				dev_err(rt5645->component->dev,
-					"Unexpected button code 0x%04x\n",
-					btn_type);
-				break;
+		if (!val && (rt5645->jack_type == 0)) { /* jack in */
+			report = rt5645_jack_detect(rt5645->component, 1);
+		} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
+			/* for push button and jack out */
+			btn_type = 0;
+			if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
+				/* button pressed */
+				report = SND_JACK_HEADSET;
+				btn_type = rt5645_button_detect(rt5645->component);
+				/*
+				 * rt5650 can report three kinds of button behavior,
+				 * one click, double click and hold. However,
+				 * currently we will report button pressed/released
+				 * event. So all the three button behaviors are
+				 * treated as button pressed.
+				 */
+				switch (btn_type) {
+				case 0x8000:
+				case 0x4000:
+				case 0x2000:
+					report |= SND_JACK_BTN_0;
+					break;
+				case 0x1000:
+				case 0x0800:
+				case 0x0400:
+					report |= SND_JACK_BTN_1;
+					break;
+				case 0x0200:
+				case 0x0100:
+				case 0x0080:
+					report |= SND_JACK_BTN_2;
+					break;
+				case 0x0040:
+				case 0x0020:
+				case 0x0010:
+					report |= SND_JACK_BTN_3;
+					break;
+				case 0x0000: /* unpressed */
+					break;
+				default:
+					dev_err(rt5645->component->dev,
+						"Unexpected button code 0x%04x\n",
+						btn_type);
+					break;
+				}
 			}
+			if (btn_type == 0)/* button release */
+				report =  rt5645->jack_type;
+			else {
+				mod_timer(&rt5645->btn_check_timer,
+					msecs_to_jiffies(100));
+			}
+		} else {
+			/* jack out */
+			report = 0;
+			snd_soc_component_update_bits(rt5645->component,
+					    RT5645_INT_IRQ_ST, 0x1, 0x0);
+			rt5645_jack_detect(rt5645->component, 0);
 		}
-		if (btn_type == 0)/* button release */
-			report =  rt5645->jack_type;
-		else {
-			mod_timer(&rt5645->btn_check_timer,
-				msecs_to_jiffies(100));
-		}
-	} else {
-		/* jack out */
-		report = 0;
-		snd_soc_component_update_bits(rt5645->component,
-				    RT5645_INT_IRQ_ST, 0x1, 0x0);
-		rt5645_jack_detect(rt5645->component, 0);
 	}
 
-	mutex_unlock(&rt5645->jd_mutex);
-
 	snd_soc_jack_report(rt5645->hp_jack, report, SND_JACK_HEADPHONE);
 	snd_soc_jack_report(rt5645->mic_jack, report, SND_JACK_MICROPHONE);
 	if (rt5645->en_button_func)
-- 
2.43.0

