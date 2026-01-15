Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994282C11FA
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493675; cv=none; b=AuiiscdYLQw1k/pt0vt8S7YqoaSSnQSpGp8BPtxz4lhlaZvi9c1JEc7xg7hQn5Yrmo5UJWKH5nHQ5UdB1bBFlByYh+RZr7a3EROk6+SEUG7dQX2McohbgEPCoBC/8vjbn5swcvgEVzzFRVGf3I8T5boFQj7v3/iowK3BS24cCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493675; c=relaxed/simple;
	bh=SG3gAxX5uI+mYJaZB/DrI4rghX4E5GArwv5tjfHImdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B1mzxaZpC5vEeSIZYqkNkjP3XtmUn6pTemg1SiTI5rt4VUipfVLHrJo2XSOnIUSEDGjIL4lfllxchSgFE53rhRAeZhSHFSzLEBQSIyMehL7O34l+vrDkpjG43UM85RztZgbctHIKwH5RRuw0keV9mRu8YaTVXp0lZ+E6C1RWpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLWtmKU5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLWtmKU5"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso423831a12.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 08:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768493674; x=1769098474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdzhQdQCCI8sk1ft08ExROcFhbamaZZ8QCwzd3zvMZU=;
        b=eLWtmKU5ZFQplXXEeZ1OOHCPzgk10s7GNurSHAnk0GoQAyyIm+0sCr5z2l78367/wL
         cVoWGjU1BoWN9p0H6uCHFGqscqpOmspAoa1zkk42PuHLguBIVzkWj8dNGKtLSn8X+vOK
         6V0EJQSMZC/nlK+1IKpBC3ert6lc4T7od5Tk6hfAUDcgXubb3k7p/nrsH4aq+P5XZwfT
         HBGRfnkbnjnlEkpOIPLoC8XZvMOlsMlW0PIiH+3W2+C48tTr2RWeiljd9RfpaF8x26r6
         CmJt4tmPMeWQP0xHaaCSjsMJ1qSdQLfZw/vzVJaLwuk1ugLkJfEMwC2Py1htsGGZ/JwD
         A6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493674; x=1769098474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdzhQdQCCI8sk1ft08ExROcFhbamaZZ8QCwzd3zvMZU=;
        b=JVRTIsog7bejrQlX28bBK+Xy4YX2nR54I6CevQReWeNjoxY+p8VFMlqENX4lx6j4zK
         3jL/TfehxvZVQguaHwnKsKijJFQ4BfcUaGFOxFMBnvdMVby0XcOomyOVr+WVtN+2m8+q
         AhZEd0kmUd5NYRhUwyDhrV77XdHzEeFNS8AXODUr/f2WvfYer3rCzOtihFgGhfkubfG6
         u9rc8kqjFOvoAbW2YwFGZZ08u6MpSvd8SwtVxARtm5KPsfnDNGrrhYxrFHuX9xKWJk44
         twd3BVlt5dREAl3hhuR5GWeEdnOj3llpyoZvFt5TLHkSd820mbzvwGhNOUCStda13XUP
         toPA==
X-Forwarded-Encrypted: i=1; AJvYcCWsepotALGEe9YPl4vHLKuevGlCLPMgpaekCfT9RQj60Ln3f7Gi6oJuU0Nts0v/NYGb8UGdkrZEG7YYow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQM6K9ioDtN9jAdEiw3ManZFLPw0VC2WFQkLm5tZhgI9joNxR9
	rvDS6b2AhcOB7CGJN/9sr29e+sgtCZM12yAG+E1s/UHIwkT6Z+9ImZeZ
X-Gm-Gg: AY/fxX6z9fm7Gf5IqqsSylrT0zFhHeROvrgaH2Lh93sOeLWWshPcfgwTbYw81DFjGA1
	t5HxRWB4TLEPo5o490zvEF0YJF6nuhbcF/80chDBYSNzjUuREBxe9YJDtWWFymgsPvTmS7mxrxe
	nxtGessX+g+1/5C9q1rs/DxpsSIqX1SOOpJqS0C1TM14zlz7rFyn3RX4mUo0Ig+uehTewEnDHXR
	1N9le8vBBa8+YolrSfNfjcHhEzcHnpqCim8D5wsjQJBJNTsAHCsz2WjpluMDRHk56bYWJqF6MoQ
	64XqgJaGOxtEKBgGFhWJI6Gm9lmOUKQasmD97WY3B/8l0EAvlFCDyiAgTHkawwB0+1BOy4wEoFt
	4F4UFboknFze5dJ3QEgYWPFg6Nxxf3yxL0vwGcUEaQF76UT7R6AoBarQ3V+G61Jkb43K2e/itDl
	E5Q0XxT2SXKqvLfnaHn3gEb86ufKbcty1t6eWyRRyTUToUHzDaR6TFUY4QlH55iF/C0YchJS33M
	eiu
X-Received: by 2002:a05:6a20:4322:b0:38d:e6f8:fd8c with SMTP id adf61e73a8af0-38dfe79c2b3mr238022637.67.1768493673828;
        Thu, 15 Jan 2026 08:14:33 -0800 (PST)
Received: from localhost.localdomain (118-170-250-134.dynamic-ip.hinet.net. [118.170.250.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e6a972dsm2873476b3a.61.2026.01.15.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:14:33 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH] ASoC: es8328: Propagate error codes from regmap updates
Date: Fri, 16 Jan 2026 00:13:59 +0800
Message-Id: <20260115161359.41979-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In es8328_hw_params(), the return value of
snd_soc_component_update_bits() was ignored. This could lead to silent
failures where the hardware is left in an inconsistent state if a
regmap write fails.

Check the return value of regmap updates and propagate any errors back
to the ALSA core. Return 0 on success to match the DAI ops convention.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index bd74e896d602..38340f292282 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -461,6 +461,7 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
+	int ret;
 	int i;
 	int reg;
 	int wl;
@@ -494,9 +495,12 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 		es8328->mclkdiv2 = 0;
 	}
 
-	snd_soc_component_update_bits(component, ES8328_MASTERMODE,
-			ES8328_MASTERMODE_MCLKDIV2,
-			es8328->mclkdiv2 ? ES8328_MASTERMODE_MCLKDIV2 : 0);
+	ret = snd_soc_component_update_bits(component, ES8328_MASTERMODE,
+					    ES8328_MASTERMODE_MCLKDIV2,
+					    es8328->mclkdiv2 ?
+					    ES8328_MASTERMODE_MCLKDIV2 : 0);
+	if (ret < 0)
+		return ret;
 
 	switch (params_width(params)) {
 	case 16:
@@ -519,18 +523,26 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
-				ES8328_DACCONTROL1_DACWL_MASK,
-				wl << ES8328_DACCONTROL1_DACWL_SHIFT);
+		ret = snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
+						    ES8328_DACCONTROL1_DACWL_MASK,
+						    wl << ES8328_DACCONTROL1_DACWL_SHIFT);
+		if (ret < 0)
+			return ret;
 
 		es8328->playback_fs = params_rate(params);
 		es8328_set_deemph(component);
-	} else
-		snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
-				ES8328_ADCCONTROL4_ADCWL_MASK,
-				wl << ES8328_ADCCONTROL4_ADCWL_SHIFT);
+	} else {
+		ret = snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
+						    ES8328_ADCCONTROL4_ADCWL_MASK,
+						    wl << ES8328_ADCCONTROL4_ADCWL_SHIFT);
+		if (ret < 0)
+			return ret;
+	}
 
-	return snd_soc_component_update_bits(component, reg, ES8328_RATEMASK, ratio);
+	ret = snd_soc_component_update_bits(component, reg, ES8328_RATEMASK, ratio);
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int es8328_set_sysclk(struct snd_soc_dai *codec_dai,
-- 
2.34.1

