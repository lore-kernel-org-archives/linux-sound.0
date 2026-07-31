Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D03403F1
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467438; cv=none; b=PNRzI16PeD2hcu0H3Wh9edUytlE4zDlkem9wkccML5MyYHFw2wQaLT4mQldKXcjPreF07HYyzbAO4iNY9sEnelbTdjJpfh1jJtHCC5BlBpQwoiPrSkmVxya6JfPVAvyRTvC88svOTHyRW9f6zX/Z+9LTAfHKffGS9x33U/I1R+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467438; c=relaxed/simple;
	bh=jJta1wP6Gxka/gvOOEwLo5cIEFpwWGZWGRX7SMxpNTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRH6uIEcXu4qsAGHYGv7v0yW1Xb/tZj6VyxDXu0DjExYcDiHX658tNMZXxtv/nlSXCAsyRs1PlPNLN6kcmBnwiukCZIHmEm/hACxP1QsJZi7iJq0gZL7bicqqIHCNc4gU9hZi9YihIs2uI8o8OkqMv0r4RfpLONFh762NjkqQEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct4IBZNu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct4IBZNu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cfff5f88dbso5035505ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467437; x=1786072237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=ct4IBZNueNkKk5K1g5s150TxSvoR5qT3WoT/PK6u1maF36nu4sM3vydJaGPdDhMfu4
         Q+1Q7dafZFDY3iNxllQ5e+dIvKH+wDIgRb84G6mxdac78qvJj0WxEdgqkE9QAT5PCLku
         eknBZx25xR9Dm0VFdHhymfOotDFGVTEf5KHvMxsTWJ6suCYnQZqn26aZ8RVbouVGhCNf
         C+Kr2iVilI3pWDW/ASzTmh8tsO1Ku+4kwgYG3B89P8evDzEfwu7ma6PdeFwGg8Hfdtc/
         g8RvMnaCUYFtRFJEVqq2b7TmBZBKAg1lpHplmi3Fa2E03r+She2gJhbqrPuFdcZiyXU4
         XoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467437; x=1786072237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=AU9om1ptW1D3hxT+UbFTW50PPMrQgfGv7HOAj/1zxCWKNAjTJFcHCCAo1J+siBq8CO
         xUl5aU8HkQmzLjkxr5EJGtHzc/mw6RWyfCOYZQH94NLB+mskNLXPPvg0Pa6K1unPXIy1
         IVmbT9WZQ3/gXa+/qDFZygIG9fx4m88PtX9G5aAhVPUDFO0Oq9xqsgEb1nBuITH8Jo47
         3WnOjwytK/GC9kCONoexaW3X2fih5eCgLvNjOuN3KCUbO9nlsWyqV+QVcLriXFyfIlkK
         maga2454fN090AB9pLgy1zLWu1PKxdCibc/snYEMyknpfsaVr2zQwt3/C1JwU/yC/QeE
         EWig==
X-Forwarded-Encrypted: i=1; AHgh+RpA2Bv59dxbii+5sYjWtxaXF0+w0EsTL2HkEotMcY57iNZkdYylp6duTy5GEFGMZ1+NptwDPojlSkKXww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwyv1bcw6dlYLIThIDtxyqDK0C3NxP8Ys5fzbUniEIpNFVgGQC
	6Hfuja6QVCRFUQ38uHD2EpLjeR6LaxsASrtcaozTeM2UWbD0d36vt6lv
X-Gm-Gg: AR+sD11qrYhj/KU3/PUF/+CYVsEWlDNjsoW7IQMylM12iMmj8JGES3AFOB65xvWnstk
	MAfkiP921ZGOwkWyr8cxpNkOakrx6fwN/MYOShBJIjlkGkNVCOqD1w8KmlonIeRHnpTTMrDTAO8
	kFBOWd+p57mhyGrnHSMahm92P0fAVXq27Idf75R1/y1c6li7zRqG1LbcAzmlAFkRuBn1cyK82g7
	dadyUo9Tu4HiDnThy10Gm10PsSYBdf2U10euWA1j/WbqudQbbvS1BWPnxlgru6sR/0s0WkSwn2Q
	S2jUuouM++LRSagVW2dqkXzNLD0MYlm/y9NsFUuMJumXXy/SxjRKcbZQWwEFhLEd/9IHjut/4jk
	Wmo4/Ghst+IQpVV3wBwgNxM9t1bYPkBnmsqFLpQpSt8gxNJK0QghU+ElpnNbckXoRIzQZkYz9A/
	rGbB1PkTB5AcOnNJxlxhqdAK8wj4kmGSkq0h1Pb5jY3dYgPoYH93xOmymb8cQCnpUlDNzyOvjgT
	Nt7sEo+IV6CeVIhUzN6w13wWXd/uCfv8rnKEv1f29fqgrImddm5FVqcdVqDVEKWUYTW9D6MFwq5
	uhFxhqTZ/3yVSE8=
X-Received: by 2002:a17:903:2b07:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2d046ecdafemr5179845ad.47.1785467436860;
        Thu, 30 Jul 2026 20:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:36 -0700 (PDT)
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
Subject: [PATCH v3 06/26] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:28 +0700
Message-ID: <20260731030648.8706-7-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tas5805m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f76e04b403b5 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -12,6 +12,7 @@
 //
 // It has been simplified a little and reworked for the 5.x ALSA SoC API.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -230,10 +231,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -249,13 +249,12 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
-	int ret = 0;
 
 	if (!(volume_is_valid(ucontrol->value.integer.value[0]) &&
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -265,11 +264,10 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m->is_powered);
 		if (tas5805m->is_powered)
 			tas5805m_refresh(tas5805m);
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_kcontrol_new tas5805m_snd_controls[] = {
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0

