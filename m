Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2153F0AB7
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781040; cv=none; b=n8u9hViylNqlBSThOywXnZBAwr1RxsTwvmAgxy5fTVjnQX010k5VhPlMG2Sllo/XkurqCi1LESFTe5etn0lhAy2vBiy0zpRVcv1ZqqGaBH+g0kvrzry0GSqGwUzdQ5o08FjogOEZa/x/voMDDWuYWKq5/9kEemfleoWEnGE1FaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781040; c=relaxed/simple;
	bh=VUGM1dmrYZr3ZCpRVFURnksOb2sWDjNx8Q29gealQ+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j292CK2BGDZVLNRKX9nZIBqSiqt7JllOVjznrVO6bstx6awigfb4ZzIMzqKbNPvddio1yfPbKklNAbk484rzBeWRuz2OZYo3ge01Ic4MmaOD1Lg9ZbU+iwN/f9mbwQ1FaqTS/tLztB3Tv9jbNrkI4TkrVhMDvOj4EN9+Anj3dwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwtsm8ZZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwtsm8ZZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf22d29dabso5166905ad.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781037; x=1782385837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=gwtsm8ZZ19cjTiSu4/LLiLShNfPHtUEvMgjCFA+Tg4XFsUU2v/WkcaW0xGYB+7kHJ0
         39U87n9831P3ruQ5fdTSZxT+YlqJ4qPhbT7D0dmGO9QDvhv6DZFutcc8dGL9RhClFpby
         pTuJAqQ3vvoLnNs/SQWtJgnZP4j7HsUSCPTN34eeZtSks+Y8ryLDZpYuDB2PzuQ9kuke
         hUCBu2b5lSSL7uwsi+7/pS1F7/0wBkq6MSqzWk0FGdvSJs3JUTSvKcHjit82ht52GTvQ
         xtzG9S+ZsBCOp+Dr8Yun6ApnNOvKvIvaxtMcgCwvnHR2JpigEzQmdW3Zd8xqjYgONIJ3
         8tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781037; x=1782385837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=GMR5p1o+iDNZr+777i7EIqhsE7k5Lbpnn97iSBK7svxaDEpe8rrsiLbbAAg1R8Nn2O
         DhQUuBiy86RJPCH+EW1RHK7G1SXNigxhUiGL5sec4KL2H1vIuszrdE98WcNlb0soj526
         V+v8mPgZ0sJCwhZoTsct5MwLKOyatisVDRe1vYFyoBTCCyXNxkUVTHPe+uRt/uaExATB
         9YihnBvvzEXpfILB8hXMsdRfFyoNstH4u9KDa52vi5rt8dx+z2C2oKV6uiBI37hUA9rX
         BkJqus55pEG4FfGtFJqNIFbeTDgRQ+GYUYNnzJko/Dj0FJUC3CghTCaV5lsK2ENWQC54
         7BrQ==
X-Forwarded-Encrypted: i=1; AFNElJ95B5JR+Wsit8LHQ1wuy3Md+gLT9IEm2Sp3+t8ukR+NbhzX1x8z/dP5MkY9YFUNFDcLtm5V5C5nshU0Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2d2r0b6cpRmNZBU2r7C1cpwmblbBE0GPYPEcHBcWIHg+ngwq
	do5w9BhucmCEbo+tVdg8Ai/nUQ+vy8An4Kus9G2aIt0Bigf2estQHXBx
X-Gm-Gg: AfdE7cmdAiyDGmySOSm+Vhiuw0Z4mgJhbjpDjba4qQ5sntCb40FymbmMFVndH32fpIT
	4zopP2llDdnicg0gSBEj6/Ub+gYd9wkeCCWeU9oEzhxF2kcKZxm4cqKDpZohvbV7uyNfzsON7c3
	ddWT1mdYp6vNmm6X+yI4bShZgJED9ojBbBnf9lOmxxnuSaSBnKTA215NB5VtxvPvbZf9zNhWXv+
	rrhMq5azhzv3KBgcH4b1g0qe/D1Titj8kAE5lL8riN5pRy7qiF+3LXOPT0CVvWzRTLkM6cwoPC2
	70pIa2Ft2TlExbIC6Tz0CPoHodo78MaXwyh+SvfeE+UbVSLi9eHZyuaO6KBhEpbE+XRH5TyXfl8
	/MH/xoyiXecFugqAaIPFwvgF07efalm4Ut1bvNfenNbuaXGAzDmNZ+njNdIhwyw+RjJ5Di4nGhN
	8a91gT9rdMCQ8/Uy0KfAS3jwsf8NVBy8kZS+NQhDQ9T+Z8MOw=
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24378815ad.1.1781781037629;
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
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
Subject: [PATCH 69/78] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:18 +0700
Message-ID: <20260618110827.232983-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm2000.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..775f138fdf3f 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -612,20 +612,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +640,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +666,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +675,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0

