Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDD396B9A
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782576; cv=none; b=sMq1Ww7RE//+melFxxJKNZuvhBMXibL99YG72HvC+JSlevFynnDlAexH2MXu3NqDdIvRPXjfpJ7B0ANpTBgNm/d6SCd9oE9FaUT1O6my/NccaBN2UFdMsz6aHOgi8GJv1zXpFVnAn0MbSXEjDI/ENZT56lCIuM0LXiAUTjDGnXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782576; c=relaxed/simple;
	bh=1Dpqc5x+KM5kx8uAtY04gCGPsEBNAbWrcA9xYsfntHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5me8Iu3CxTUkMu6uHFYXMPQtDaTVvZw7dhcv7hi0i/ggxLHfzfYZ757c+hur8wtVtJ/zxmct2XfV1OFFMuJsgPIe7QH96Y7EhiGVyvhgej3/Qd6LGawtJ1lUqeQfNxmp6vx3mMKbVLgYS3wG6niO/UASvI7D4MNUSgLGz/No5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaIN08hG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaIN08hG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so2507355ad.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782558; x=1785387358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkLOpw0PU4ryhG2UScp9q/DeFzgBu9EIAOz0VuJ3SlM=;
        b=BaIN08hGn/I+lChSgY3QQ5Oy2H4Uuf+u7t4zujLFnsTenPr8RVFSnMxZNfKxz1il4u
         RcGglGEZl7gF0ZSPG+/dXylXj2QDE2i5v9EHeWfPfaCRDEzBQmXX0M28YyQ5kFnT2n4e
         8GHcBOwOUK2nIWdryKL6pQFRlMKBg3fnIlhOX/gUdRRHTlGBiRnhpXmy8epPe68Szkmg
         aAq6Li0gVYu+K4o0qWlFnAgdybpWHkyqI9dGiLsVuFf0sUDLqykYd+3ybWHP1rME827f
         albhtM7nUdx0rarsE8zi9ALeN4DDop+tJE2Q6kb86fLrrahOaRpTOE83QGItqnxzJLsZ
         yqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782558; x=1785387358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UkLOpw0PU4ryhG2UScp9q/DeFzgBu9EIAOz0VuJ3SlM=;
        b=XhDam4IswYTDMsAKctXlf7+FcwkS1hbLnzqnLbnIk/c07Up/CrQC4bMmX9ms3mMw7C
         dQ2ByK3eULChMsssQH9Ie2HpbiYIuB40qLxP9ZTa7+KcrKhbXGFCA3kwuKXTtavec+Z0
         E8EWK2MqpiOZTzSaivnfQgb5YWWLlbJxgFSA5VFofCj1/yP+ti6Amk7JoMeCPvKc2n1o
         y0pFmT4xM5Tgp3c9zOfubvMg5KfNAoHuv6c/Stnw+8lBWLi6eP+aGcR1iwvZPnnrBOvz
         FfwU38wYf+Rfgd3FPC7vcWS5xz3PQK6kS+fxeRwxdYkli37NpXXr4wjC1CK3SvzSXNol
         r+wA==
X-Forwarded-Encrypted: i=1; AHgh+Rqunnn4EtmmsFANTCY5gQP+3Yf70Z7WOdyzF/AVXxjJaalGTKAOY1I87/eXdN5mBJtj2W66QM3duyGxpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFLfS6mpZV0JhJPfGdIDtdc2SDYfR5C8+ZorJzofJjI3bzTyr
	3+CDiDDas1lCyFjWLKtZxd+o/qmGc+tSS0FjB7snDe2uJ3bjPFHimiIU
X-Gm-Gg: AR+sD13qpcKTRQUTz9QJETFAEKfYmWw98wKYHEvHAiJBEhHcf9HqpF2VvGvRfpJQE8W
	FuJzjP96cvFZBWYldB38sO8kUNRCMmFj+PxaJy2Gfpdqh7/dQsaDmvIn3eEYIMDfP3K1UARW1Qe
	7A/HhWhGuSIkCitem2KFkxsuQgzenYbX5qA4HNdTEtnUfYzSEpPrqYC/R+WYjB2TzNb0P89Kj4l
	ztNrF/yaM+DEvsVDcpdHNPLq9RNokuucfUak9AAYulre+PaV4yA9OXvU1tdqbaV6cwWy6j/dKa0
	LkymLc46IwGVXRHHpecIBP189k3qGDyG116KNcKC6ckITRedht6+EuGkOYc/ib7odkMEr2khrn2
	DoWRd1RbqbVKgHAeey7im09edtndg5/FYr9saABMi7WMoTfNBA9nZ2k5YWcD6ZLam45kg0DKQJW
	Nqcft38EhW6+XvoJj/GOF6qmhkPCZYxtJfUBbP
X-Received: by 2002:a17:902:d50b:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2cfa6b7e369mr21647945ad.17.1784782558134;
        Wed, 22 Jul 2026 21:55:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:57 -0700 (PDT)
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
Subject: [PATCH 17/26] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:18 +0700
Message-ID: <20260723045327.28260-18-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm2000.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..897b0acac5f3 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/firmware.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -612,20 +613,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
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
@@ -645,20 +641,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
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
@@ -676,9 +667,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +676,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
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

