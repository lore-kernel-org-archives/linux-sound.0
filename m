Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746163;
	b=Fn07g9UhBWNjpGCa18bbvekjtF9SNkifXIHqwZLfWDkidTdZIltUFuEI2DTLWsu0htVX
	 /gzb9qxTafO2zSo5/fDYnx48T0Ch1pa0Uw8lsIHhp1eM1brw81q/2dU8Vd/OLK03zuB8e
	 E3OBCcKxDjmEptV20ZhvDBVVScKwL2CzLulDmYHVX9Xzai30AO0EPTISxLKYdeNYQHBX7
	 iAKMG4pNHHRI3hKQMqp5ABWQBkEbc5iNI1qjCSgKXaZcJ4dQ0mCp+9HL6oIWzcXv0Jgqj
	 VdV0lg2bg+wxK9BjoJSnvlfiBEKBY/HQzVk3bDcTtI/0AIIrC8p71V9kkKoQZ091zXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=agdWtGTqVZs9lIBi8wfg6ELa628UVzetqPDjgzfZ6W4=;
	b=AM2zwiZC9ejr+aZbUPiagKr61XwCes2LRkFK9wfXBkOJT8PVRgftYR58Cmf5lmrPPuoq
	 Ethl7zTbEqasKL0bfEEWJ2FGdGXsd8CSupA+/ALKEbBYfkoNi9laXQmrm84u4BvV/+MpM
	 Qkt2pYHvkZOGx7R86i6NDRdDhfq02m6EU8nbk5dacSnj6OIDFrwFfVPwgIM8temrH7NhL
	 3mQPai+0Veu1IuUcv/lXt7P/wns6at6qcPHdZ5OBttY0Ca0Pgygo/DuY3HZTEJi+MdGbv
	 sdEQjxKg9v3hdCcJFvoOEltP9YbChNdbg3q1OMT6yoiMjc+93rQqntj6YgBAfd3CN9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=icdbp99v;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B0606A32E
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51B0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=icdbp99v
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso536739a91.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746162; x=1793350962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agdWtGTqVZs9lIBi8wfg6ELa628UVzetqPDjgzfZ6W4=;
        b=icdbp99vIsQHM64+7mMTppA3hbsjxsBuAS4azEv1EHVQcJxhV6DfvWGmLlSM1l0K2Q
         xJm0UyYfX78DVz6WyqQLFlVYSWKzBIufyjr51R+Y5E2boSOvP8pOiNtHgU41FCdVMnPr
         dhR4Lp9Y9P4of8g0Cq/IUengDAHJllg45vg+EQwQLkyUy3+eTbJGsOBzN91Ikvsyt/Z3
         pquHLVJHVBxurEjjHlqncvsBaFjXpXMk2i6FzGuUFT/Y8e/SOYIz/PXl/QjrAWR82IWU
         yWFHspv7rhfU9QSH6mnhxOj/zzqIY8Q6oxFA3ul2aOQChTxpoVCpz7+h/vbToeaFbGhU
         f/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746162; x=1793350962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agdWtGTqVZs9lIBi8wfg6ELa628UVzetqPDjgzfZ6W4=;
        b=y4TEiDpYdJGItGx9cR02ckkmV+5y8uqAg5Kjx9qqVlS16IZdwUZHs1vhrgIe2wemdC
         Xl+M818AQ5BSKmFqtFdiBHa21umYvYfzU5OxUA2F6W6Na0FLHgm287dwLCvlEm3AFr7u
         cLJdpYYvthbH9Bs+GIG1r0NNBQ8cudSJ5gQo+Tb5rNBh7+JzjsTZJ60mY5+3Ki+oikGI
         eXTGDciMzzwIFmAvAlt0QHhRl0BVLOJUb+L2c7xzjX88ty9TQQiLB+NzzhHcOGIuosl5
         AmyDHOfs9/MyZEyjg0Q92x2AzwFCJwzftRz7IMKFSRYLn8IcsyIh+rXLG0D6jAlCaQ7O
         8B+Q==
X-Forwarded-Encrypted: i=1; AKwUvByahWn7DtpSARF1kSIsdYX+5HV6WnPonWsqMjoAgkK6DDYDxTgZw1LVzWv5qhvOCarAAJuP4plujh8/gw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoByrxvcByccrdHBz58gBItolH5mbyXqPKBgI19Pm+ft86kY/2
	7W9KWXK0rhxWMJmGTgf0qMhk31LY2NOnsjQvo5wapveBd047tcmBL4Ug
X-Gm-Gg: AYBFou3hoDEXzwb/Sa1m/upOu9zz48j/5iunNmiWPooKuqq+sex/YQj/aLNLvKAng6N
	i2vAM0PVouOyZbUzbtVCAWO5rIkidG2oClh3AsGYy4p0wup68vsHS3w7aG9Avgcx/08tyIDceVo
	rsUd96Kdu+8m/bmLRIZj71VSiGAYvYn4Ey3h6/q+ON/z8mYZvtV6s7+O8fugKwjMSjWlVDmnoih
	sE5ryvuB8W9JPtX6/DTF/y+YbVfDOh38qNnU/g4qcME4/vCuPcuFIbYqcM6OItkQMhc3Pv3CAD1
	HP+zJNrYNbOyF3LaMpO3xHwjDo1vlfGGolAQEy/2MDNEnBJcOPyDCA8g09Rskrf76msT2S/I1s0
	bdZC3xWV0Tm50WoOAE/uTLJwxPZxnhjyguznei7X4XCLh5UtcMBo2DlLl3l7mwAABdPJIyGrRqR
	dW3u9dFlYoiBoF1dBKz8Jd4jX63G7MSZlQMT5muk8NepbV/ltUlAy/6yxntoDbRV817fu3aspNo
	xzwYqc/dku2L7/bhzjBpo4WUIaM9EsIP5ratUCnE8+bYoI3kIj/ZclatPa+rjaK2WYuxrEHl9AO
	il/JWk+qHuKLLxF18KLRqCtSFn+RX2CoLBexz5LogXACNJu5mdn8W4QJx1z8LTrig0R7WqcG
X-Received: by 2002:a17:90b:3888:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3adce7a7df6mr1346546a91.10.1792746162054;
        Fri, 23 Oct 2026 02:02:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: codecs: wm8994: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:57 +0700
Message-ID: <20261023090157.518032-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8994.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c65a7769a9d2..6cda0aa4c3be 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3093,6 +3093,7 @@ static int wm8994_aif3_hw_params(struct snd_pcm_substream *substream,
 	struct wm8994 *control = wm8994->wm8994;
 	int aif1_reg;
 	int aif1 = 0;
+	int ret;
 
 	switch (dai->id) {
 	case 3:
@@ -3125,7 +3126,16 @@ static int wm8994_aif3_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	return snd_soc_component_update_bits(component, aif1_reg, WM8994_AIF1_WL_MASK, aif1);
+	ret = snd_soc_component_update_bits(component, aif1_reg, WM8994_AIF1_WL_MASK, aif1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static int wm8994_aif_mute(struct snd_soc_dai *codec_dai, int mute,
-- 
2.43.0

