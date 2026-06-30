Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D16E3EB7F8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801472; cv=none; b=t7uLaNEt3JfieHSozNsBRjsyeSv2iBgKOeG7HCkkB1U4+Fx9dgQwlNp+snSuVmH3d/mQV7UW0NNslotOjHjpu6GJo6NgClvfjNCrctI7GwHBv+uKKdIz0Nj3GgFy2IXbcpiYa2f3ya3xPUxsjHwq+6Pq5uVAef1exxJ17yPf+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801472; c=relaxed/simple;
	bh=vGrtY8X/CBlchJHrZ0QsZ166oJ5xk86uURcTkF4hGPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLghF4O4YJ5XcY6npwMYJDCOfJTZzZ0ORWJNbmkRIh/RgomCIcwBLT5+UIi17UmTFMpT3WxJnyrnkuQS7L1z2ap0JE2rEwWRcV1Hv7AwbsGmAoQY01MhUw9Pe8JgtCV08Qa0m8Ff94FQOmbb0yJIHOtaHxxKsS+8DnZ3HH2tkDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCbRI+Lh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCbRI+Lh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845c92bc464so2461787b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801464; x=1783406264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=;
        b=PCbRI+Lhjv1kqStnAh7VLWKf5kidlv+erM8vQuMnCtEm9Lm4iznQp0eG8GdxDkcsmr
         kEF8Q5VQNtuQamTvixvAFWZu9yR9BHmk7/hLOLWhBjiiGwkmuwHwnuj7Wi/m/CNlUcoF
         BD/ge3AqciTn90KHfBzRpzucvKSvtKF5GnHuxUMcebeEPQ3OXA+BP+AEh4M15iQ6YA44
         bKnOde1HeZqtwTw+Wnv9bp2GBVBUCriCQJuip9N9diwW5hKL1tFUWPvONQ/XgZAhlP5A
         s5EOISb+NXhNTJ3mu3o6zqLfqD2iu3KpUiWqnPoLjikR00e2+MxrwfOs/CjTZwAh67og
         KpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801464; x=1783406264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=;
        b=XI9a/TEqWNO6OT8MjNm6ldSkiCI2DpXxVkSycbb1u80z75QVrTWIovutq41Xkx0xT3
         Bg2LDHSuY7LxiyaacyZJ20e+hJoMiUm2IXmk1Ud9n/dX5Bh5Z2ok6YAuQt4ep8Cfje3N
         In06eRsx8YrhRy2lE6v5uDjOT2xl+FemM05NPSM/S3gOwXMxnUu9w48aMgzFJF39MXck
         VOztY5urTai0mcPaXkpNjp8MbhPiGSClvY8dEYSwHYxo5DCo6RvW1JfOMLPpXqqBXj5e
         9jOrg8cq7enA+vwz1X9aKCN2902ryeBYAEM27CptejyKROQA54VRZ07xV10Dva3y+7+q
         lSPg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4N4w449elsTTHp9F4PRJnDBL8A58e1Wyjt2Zi83TKgKv8kcvZEUaCxKbaQcTCmwUeweM16lnLJ1kztg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGclGoPWz5Q+r7q9ttqM2qsf1JW5diVyua5KNSnx/vH/qmaLO
	ck/PsmVtBuKwdOw1KNcxch4Zr0t0eHgKW6kZ/3ZuW2ci8Xm3UEJ/0p6c
X-Gm-Gg: AfdE7cmCYRugmJLZfp1+XhPZvoe2Bdu60AS/ke5aDeNYga+d0c5MolLmQh8uisLS07e
	qf5DrkE9mE6snwLb5+3jijgMUbK8dhnTQuVNppGlR9pgov8w1jKyC+DZKTZlw8wUHeW/l4euzHS
	7ZIZ35KYthpokVMzQUCY50Eu8but4BekS+hT9WA1ISiAo8gZ/Qy/Ogq95Z1h/Y7+1mVkNVEcyOk
	uMiavY1twj5s8cbe6OvXhapV1/DeMI/O6ZDXi16ECT4qJvunElG8P3AVIMo+y5e4nBHl0EK8VCj
	a4Ig088568TT5T4fPhUvBRHVPG4oqfEaasLXQJdFI48q6ZsNwUTvzBzgE1P8kVtRdCByEU6mK/m
	LAL7wMRbjdLjhRxuBYGxAUcEzKddA2ps95bTk9R6lC2bwFXfjyJ33++ZrN0g5iLAX1DZhd0osLY
	5GRfdnWltlJKwBrfZWfHPBeouOON0b6tF3ISqllBGPmxLTROI=
X-Received: by 2002:a05:6a00:130f:b0:842:5a8d:302c with SMTP id d2e1a72fcca58-8479f232c38mr1853902b3a.38.1782801464159;
        Mon, 29 Jun 2026 23:37:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:43 -0700 (PDT)
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
Subject: [PATCH 18/27] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:40 +0700
Message-ID: <20260630063449.503996-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5645.c | 160 +++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index e9819653b30d..7cdca9774545 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -3323,93 +3324,90 @@ static void rt5645_jack_detect_work(struct work_struct *work)
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
 		}
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
-
-	}
 
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
+		if (!val && rt5645->jack_type == 0) { /* jack in */
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
+			else
+				mod_timer(&rt5645->btn_check_timer,
+					  msecs_to_jiffies(100));
+		} else {
+			/* jack out */
+			report = 0;
+			snd_soc_component_update_bits(rt5645->component,
+						      RT5645_INT_IRQ_ST, 0x1, 0x0);
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

