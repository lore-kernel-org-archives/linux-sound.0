Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE63472786
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692599; cv=none; b=cSOD3AZ19jqRD9wNNOXhw/rx909HKppKt4Xhr4ILqkFHAjxRctOAWmPSfFnpOaIfLkLD8j6mZRA7jV+a5lPVHw95iJbdtTOJWQznfdRMeB0LWLTsXlPry62UfjPSJO5fh6bP6hfiJ6dkzWvfUYKitISuNKRUT07p6MUMGGJVwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692599; c=relaxed/simple;
	bh=f1BYheWpgYmqvxFP+LuNBK9MoGzL9oHfU4zeAFfLjtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=db0yPPn/jjfCGr8oD95WHh+++7GuBpl2gyprGJt7J6Unz5Akgck7NmoNYPRWu2OLg31FgL0+a1ZoWjowtvnMjhQ7jJszzKu9CJl3yNr7ln+4dNa087Q0ymgiDMLF4auPqGaJnG29MlpUvmDXOe/6FTejrqlVlQlDkKCXpz1G/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laLWu17p; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laLWu17p"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1370417c01cso7256412c88.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692592; x=1782297392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=laLWu17pMNJ4KFQwpRoVOBveCwWA9JMYxJks3pS3HCMgOQYQpjP9TiP15q28fMAObx
         7oPJ4g82HaeQmYxW7URtKXwA0suk6XyCXjjChqXk8Vep5KtPCMK5bo6sqQZnZ0fYaXHv
         VoB00/NronQUQkqoJ0SVABkcsmvVLiZkui0p2/23Dn2j1URlBQ5qq+XFbz5DByYfktas
         27Wr4H+2tfseiXEZNC6aMC6d+S2wg3NXxvLYm8hHlrVeycTO7x0Oz9N3Dy/Wyjr5fd3j
         naTX1olOwYmbG1saO4aGpo0kw0by7qD3DgXmuJjEG/J5Lj2iL7qdcxEtagocot9EX5IX
         BJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692592; x=1782297392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=ntqy0+bqj0qMmwwP9/gSlJbSxOl6w2UlQJNwuiNmhCfsH9JJ6N4sQs8UdcojV01CDr
         nna1MEkrTSnHd5+guW+PjnhdRHN9pg3F9RMS5VQA+irwQ9/rBWiw0bC5WjJEl+BPgr6G
         70gjEJXhW+3gtBsdvx7frj6vmwu9Pd0l1Vv5AwdaUFAh43zH0lcBbxBq7pS07WI4D9R4
         8ipgFLmsTH1CtMI3LIQO+ZFLDP6xMkaOwTQI86caGK6HcJZIQQqpHPL5vGXJPOWV60uv
         i+8A/bj0UCrEDp2zb0O7bAD8xEATr023PtQhA9UKvHOeHZH5p8cfHnQB33bVQCstyaJ9
         ZHOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fmGYRXaeFPc+aQuVFaAOh6crsyENB3ST2kGQyL34pVgbbGTG9YK4dUVAbKhyovGqCRhdPfh7jMM9f+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvCJs3uyjn3d5W+OMrX61OFhlSf3guYSkZtA0gqhpIwUx/qlY
	nhwdCiqv95HfJEflm8+ZaJHXnQw8hdtR3CboxgpcCXKnEQpxWnwLAaTb
X-Gm-Gg: Acq92OHVI6ulb4ELuuWm/Tvbxpwe4mgFXQhh1PkGYCkkgaUlkDVYtE5pVAbpBgZAzyY
	WxjeqXvhHdtAmQ+WwhtUX8x9spI21V+0DFIox4+0ObyZMdxSe0rraDQ37mAIbTqHzsexY1tOxuU
	SYQj+27AsYGpKPRoQEKvacK/K/8fQbEPfyl41rM550ID1z8WmIYtXtEcovmVQrLE4JZ89SKJPGE
	cn9SWGKgyuX07JvBkQL8BeS03tQysjzQM4wVCpy9dw/a0x+Alof6J8yAwDPdzf/0HXcL8LfnYIH
	UWWhGPG0TXcmKAcKR2RQWScoi0QTN8O1EU0KhwQWjwN5uRU0E7QXV3OCK2mgmPnDhc22Kn5Xeu5
	kxkaoLmRHUIeErwVs48xuhif/KWUSNjFPjgwrXwN/pGUf9zA+tqBOIJ8C1W26GIXwT1gouI+KK0
	ZpieYFnGbnIVu31i1uYesBRtyEal4gciEajR914g5fZP18fbU=
X-Received: by 2002:a05:7022:fd08:b0:137:f532:e360 with SMTP id a92af1059eb24-1398f62354dmr1205523c88.3.1781692592243;
        Wed, 17 Jun 2026 03:36:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:31 -0700 (PDT)
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
Subject: [PATCH 23/78] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:40 +0700
Message-ID: <20260617103235.449609-24-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs48l32.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..d45e339f76a7 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -236,15 +236,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2240,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2281,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0

