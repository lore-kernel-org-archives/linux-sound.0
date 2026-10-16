Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32200420897
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135529; cv=none; b=F/Du0a4nCd9iubiXtJVQwFBfwqVibqjCre45N6Pos1YUESQtNV17jXlpIbbdgk/d3mRakJxXtGI6zvxYOfHXqSvLm0OFDAxDbAT0XBv/BAdS4lKJy4Dc0spSzVbz8Razl5OCf5NGMPMY3iw/NQRjTi+HsbONNArvunlyYUkiB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135529; c=relaxed/simple;
	bh=VRN6U0o05FVaEHHnxR0FbEEzS4Hg8shLiLzhFfwosHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEpTM2titQiIbFntBjYb8RpVdD1A1t5E5pEafuFXiZSU6atnlITJUiqrR2MEjAFgAPfo+jU671gLdvMSnU9kHXPAvfqdPBx2kTfRcW6Azj2UiLdnZ1KWCi8JmJ/Rfvn7/lCsPkXhuygaoh6C5irOxTghKMgiW6e2+ImlUhB/5Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMYiVr6m; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMYiVr6m"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc758830601so2052752a12.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135527; x=1792740327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoZOeVDCSoL/Tl7R3XTFiNn56cJcmVvK1bWCP9m34sQ=;
        b=LMYiVr6mnVcqfOCl4v3S4v9I6s418cENMK+JUDI2UOsRoAr9O6Wd3iQEVEPx88Y4v/
         wQPaygrmEDQmS0wqv4C3Y8qJlH+UcABBr7yy+tzmG2LaqPJSy5H6vmqwN7IABfyFGpPi
         1bqaiEtH1T3uGqrIwyc7dQ7Dq5bXh9lrIfw8GbjfOlFexnwxHznvnAw5YXwcpqX5kPW1
         tEvytXty5ra+xdpyFRChcf1FW+wMVHCmuOX5efcfwJ1x/Lk4INJCpK4qD/Fosna5qV+f
         g6/Zhm2yqVKko+SeybzpDvJaMuA/zudjPd9Pmuuvs+47hzxm02NQWlhkyqxjPgnULAom
         piGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135527; x=1792740327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoZOeVDCSoL/Tl7R3XTFiNn56cJcmVvK1bWCP9m34sQ=;
        b=ObyT6bN3ZUHh0Cplg2Q6cXjcOhk4ohkC2sU7sfYbb0B2+Vq088Kxh41PtZvP5dmitI
         Vi6AOko4ACdhRxReYIsVGmRTOXsegEEJuIlxACEoyv1ng9bgqIu0+DP0+aFjwqC3fIar
         Xi+VE2BnnXXmhALOLFOSniU2EkjHn2mmbSiHHNVD0X9MOOTUGrC1WVHPhQnvCG5ysg4O
         tiACqSTQ5RxY+v3hQwoaL6xLEdIa9CCkh2+txfsvx8862/qHZ2xsz+xkVOa8ITi4ydvc
         xMMxni85jZzn5CMtloI/NF4Ibm3EpXWz4y7e5j0izZDn1vFa5O68do4GoX+y15hXCKdB
         CwAA==
X-Forwarded-Encrypted: i=1; AKwUvByhZeiiw0T86bLo/C6f3XLTfKnCGkkLGGtXoxh2xPU4dIKlDDEXUsvZ+6yLDOn1R2+ZuYHYJqxeSy/qsA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXm8tfJEYGGUVrFd55STKlYIPXnbA4GbsilnSiJ248rPBg5mtW
	uozZqM2Lr9xJfXC7KxDvAqFANaiNkRKJZTjqN21bSzdl6kpwiPRoNv1s
X-Gm-Gg: AYBFou3qEPbNoBAmTc5ZU+KLFd7UyyRIfSqQEmHg82pT3K8dk77drUTTJUutfLriiEx
	ZsayKR5Xg4XokU9SkHDg/FZYhJuecW5meqYHr2Ldeu8IMBK62zJD5UFqWRuTKsyRjmlkS8yxbX1
	kODKniN0bp60fZ8QU+UVaJs5ngN6oDxiSj7Pq5NDPsPkhySImmVWbGlN8ao0Oo47vz/k/rFaS8m
	/mirV6jAHLoy0w5bPzRKqXhyC5PUC+QSm1fKEpMeokRgnKHwxyv9vMK6YMcWLfVuiBzcOgRwZge
	IpTM7sTp+1hZS7bXoYHu15JQa0qclM/YkZow5r8uoS3dSK7WX4/RFxZ5SH+JwqrxRkChIqf5dcc
	m1mSAAIhMtnlSjdFmONi/gNQOU3nz5REmGeysDtRrrxduCa8rlX50XqIXG3O1NjdTOHZX1SqMdy
	lgv6lhFfhRmO7KZv8K+qSbGiy3xWonhWL9cEVAmofvEVrWdr0LSTXyncsl5K0UPzG9yBlO1AjEE
	SgUppf4naSS/GHOdR3hysd/eLN/ukr1Iv06rRlr+DzSKXhhg+W4jeiScjn6hZhxML75kanTc/iP
	bxFbHDcoPg==
X-Received: by 2002:a05:6a20:3d8b:b0:3da:bea4:622c with SMTP id adf61e73a8af0-3e16bdd2cf1mr21410103637.19.1792135527265;
        Fri, 16 Oct 2026 00:25:27 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:26 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: da732x: Fix definition of ADC2 EQ Overall Volume control
Date: Fri, 16 Oct 2026 16:25:16 +0900
Message-ID: <35bae3f84cdc3ceb6ca412153f44dee3647fdbd6.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC2 EQ overall volume is in DA732X_REG_ADC2_EQ5 (0x9F), not in
DA732X_REG_ADC1_EQ5 (0x97), which holds the ADC1 one.

Fixes: 48e278746070 ("ASoC: codecs: Add DA732x codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/da732x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index c9b6172ac0a1..e417c7ada237 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -511,7 +511,7 @@ static const struct snd_kcontrol_new da732x_snd_controls[] = {
 	SOC_SINGLE_TLV("ACD2 EQ Band 5 Volume", DA732X_REG_ADC2_EQ5,
 		       DA732X_EQ_BAND5_SHIFT, DA732X_EQ_VOL_VAL_MAX,
 		       DA732X_INVERT, eq_band_pga_tlv),
-	SOC_SINGLE_TLV("ADC2 EQ Overall Volume", DA732X_REG_ADC1_EQ5,
+	SOC_SINGLE_TLV("ADC2 EQ Overall Volume", DA732X_REG_ADC2_EQ5,
 		       DA732X_EQ_OVERALL_SHIFT, DA732X_EQ_OVERALL_VOL_VAL_MAX,
 		       DA732X_INVERT, eq_overall_tlv),
 
-- 
2.43.0

