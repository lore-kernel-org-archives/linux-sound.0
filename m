Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C61442F7
	for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716460966; cv=none; b=YqRQMxy+iVcSUkyKy1IlQHUhFwfQ69fy0MnPCZxY26AlR6e9WSpKeyr62Lf/jSfdaGmshcVHQgt6yFCaI6hZ9pwPwtFLWqcQQShrwRkbYHyRQTUql9bR3pFnTWxUtU5/rpgxYKmxyDqgVOze5D7aI3wigdW1KV7yxMDh/F8SEr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716460966; c=relaxed/simple;
	bh=2oeHyYR9v90+iBQz9Ebiv8CZ8HLPnPTYjSQzvb+HCP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pa9PnpSXEdIjDNHK28PaKDRiwkyug197eA5jfXRcAl19lE4cMHTRxoibSkDeSlr9jWrUx5WGkiLUBc4FzaggVg4HnaAN6dCJSV/XLKI1FuTOc9PmJ6BP15TP2wPgBaH+jdVlLzPvFsW46Qqv7s2CGl+sI7G0MU/57+6Z7yLTDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xn1RwFbE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xn1RwFbE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-354f69934feso447206f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716460963; x=1717065763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpVQFN+BauqpwsNKgiz172MdYBJ81HnYTR7ZZctyeBQ=;
        b=Xn1RwFbEuM4/Vd+7xVJgJTFx2aDSF2qyMJXRLMq8fCdDpfZEZ95EEbRK189+bpv+a7
         ++CMpVXvfY3B8ORsdHjah7VsiTCI7TCDdlbSE0NpjeRxueeWMKaxAd6m90aNaFn+NZ1t
         fGY1GdPpaEuc46ymbrGcFU6EjHca7rBXYnjtHNpK9E7gwfgC1n5gfvn8S3xVwtRzuLt8
         RgKnOYCTpLaXewIGUDQmUKG+Z0RsR7meNJSrgdBmCXrFbDFS5EzbksfSFRR8UUNo/BFq
         IpK+F3eWJGoEh6mQw/amQyW0j+LfmVq0tz8hvfS8lF8fvTOKX5LxSFiiQGXaeCiSviIE
         bpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716460963; x=1717065763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpVQFN+BauqpwsNKgiz172MdYBJ81HnYTR7ZZctyeBQ=;
        b=nkqHDH1yUrclhtuoObjSjYv1BGO/yfjNgS6rlA6geHESGx4BYf0IBp5tg+JXqYEihX
         NzkGTFngT7/UcaO2ZAjlT4iyNbZlv8gVJQA83g6QhUY+dTBS/jKS1IAbLZazu6eIHU9p
         dsIaP8NqeA1/j9mlIKhwGtcFKO935CV4eyTJaDFhgMio5DPXAAq9Ew61/Djrij94rT2M
         mOICTf1wfWq4muYUrn9sUEA5nrtkIG1flG8UbVSJGchNJhHFE1aTMyb/JTHPdsar+A7j
         EcK8mbYYwr4KiZoHoQ2UskCiMf9JiQFJvjfbdvrk01ocP/RS+0sHk18aKRN2j1piJJ/a
         f9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCViwVsWZWtbNyvPZO56Bj7+rQ7SkEMqBQaIGLdWUjUfq8Gu0EirqOw4IillItGI6vDsCeuuft22EVV7mpv7joKqkSVOGn0HLTbD3RA=
X-Gm-Message-State: AOJu0Yxn+I5dT6jUdz2Szsa0thcWLtGi6teKe1mCIDOOOA7FmP+JoBHm
	NEt9gTrEL5rFlEbfTkRYY4NtFFt7fL4al3RVS/ybaf0MC0hHLTv6nep1Pb7ohNQ=
X-Google-Smtp-Source: AGHT+IEGhqXTCuuEl1IZ/J0KTGPFO2rbCFqJ3Xn3JEQ5sDgnAR1bTRIqT9eBTZx/wace1+D+5qRNDw==
X-Received: by 2002:adf:9bc2:0:b0:34c:e0d6:bea6 with SMTP id ffacd0b85a97d-354f7549609mr1518352f8f.29.1716460961989;
        Thu, 23 May 2024 03:42:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35501491c40sm516038f8f.28.2024.05.23.03.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:42:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: codecs: wcd938x: Unify define used for MIC2 bias register
Date: Thu, 23 May 2024 12:42:26 +0200
Message-ID: <20240523104228.36263-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240523104228.36263-1-krzysztof.kozlowski@linaro.org>
References: <20240523104228.36263-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a define for MIC bias registers enable mask called
WCD938X_MICB_EN_MASK, which is already used to handle all four MIC1-4
biases in wcd938x_mbhc_micb_adjust_voltage().

Use the same define also in wcd938x_mbhc_micb_en_status() for MIC2 to
have unified, simpler approach.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 sound/soc/codecs/wcd938x.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 6021aa5a5689..9e2070356b84 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1982,7 +1982,7 @@ static bool wcd938x_mbhc_micb_en_status(struct snd_soc_component *component, int
 	if (micb_num == MIC_BIAS_2) {
 		val = snd_soc_component_read_field(component,
 						   WCD938X_ANA_MICB2,
-						   WCD938X_ANA_MICB2_ENABLE_MASK);
+						   WCD938X_MICB_EN_MASK);
 		if (val == WCD938X_MICB_ENABLE)
 			return true;
 	}
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index df07e92d9d97..0d332cb555ac 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -75,7 +75,6 @@
 #define WCD938X_MICB_PULL_UP			2
 #define WCD938X_MICB_PULL_DOWN			3
 #define WCD938X_ANA_MICB2                       (0x3023)
-#define WCD938X_ANA_MICB2_ENABLE_MASK		GENMASK(7, 6)
 #define WCD938X_ANA_MICB2_RAMP                  (0x3024)
 #define WCD938X_RAMP_EN_MASK			BIT(7)
 #define WCD938X_RAMP_SHIFT_CTRL_MASK		GENMASK(4, 2)
-- 
2.43.0

