Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB0E171669
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719331581; cv=none; b=qy+i0/PpRYNwbADGnEkmLRBR58RIrSKR4zH9evNahkkgGQEToNeDHIu/mbvPwjDpL0oR1yQUB6yVfZaMg9OaCz4E7IOvrZjta0jakLtJ7Gntooy8WxI0DHLoaiR6D8oPwb2EyZeLLnBmaMQyc/xm/gY8mysc/kilB/0lUPbgwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719331581; c=relaxed/simple;
	bh=LVjZ47687PxS3iFKdhrNIBTElhvjuA83Mgge5wOGN3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZO4Ej2kld1OZa1ZczQOsWBJ26V/cBaBcj7hFp2JXxDsZf7U5fGB9etVncBLtXoktJv2pk8W7VxhHBYtbPRjDci60DVIpRrZwZTeJERemONHClSVSjv6SBZsjYaql8yhUH2EPVRqZVqXBmsKrklU4rQ0yPU3ErWR45IUbkuuJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgpudbNA; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgpudbNA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6fdd947967so361065466b.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719331578; x=1719936378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbBz/UlSDHmmQE9XJzoYyy6K5428MNeACZ+/dAMQ9N8=;
        b=kgpudbNAW+GxftY75GUMRhkTXF2HsogfroBZm+zhHvc3ZgvGFgqivTAUfzSYCErDRL
         YMPMzs9tmxQbXrf9qYVK8ap4AtWGvV83bDXRrChldnSol5dGiCy8dFtipg9Olx6BpgRc
         8egD5gMHF89tD2queGI/FE/SuzXmifgW6Xf3q4IY6HuHwhtjE46Yd2z1mET+Vh8TP44H
         BlT1LECP1LxEH8vSQKZz2uA4K8hYlUqUaQOm48/Hrtncsahky5YaAn0V5eawMW4yUyYx
         pB0uNbNpMYdSRss+2/TG2IA3hTmnVu7JGO8G8CmIGHoZHsfRs9D6selsdB3kFBBCQvnw
         0PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719331578; x=1719936378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbBz/UlSDHmmQE9XJzoYyy6K5428MNeACZ+/dAMQ9N8=;
        b=hHaE8mUc4gm5OmQ/bzMEvpTPW90pY7GSClh5iW01vLatGKhTyg6fAB90FohGCdfagC
         Vw1SFLwo5zj8KsGCUtKBexIWl5lHyFvS6zXwyjL5FZKnuQ39kujXnpy59+MqYPkdjlAF
         Aa13wQt3Lk1+ZNmM7FsIMiITqTMj0xmZxWclGrYrVZe5A/EzarZpiCbSLMv4ODsNt9IM
         Xzp6EzGGGp3fnBfvCUCVXIVy1+0pXg29EUjn5PYRmFFI/dQTCS0ER6sbTFEUI4Y66N9v
         bmxnq5vQ37zEv7sLtBLNkyvTW7cSTF1TBYyUtKFhha1h04X5J7ipjq5w/7gF3jFkc9Cq
         3VdA==
X-Forwarded-Encrypted: i=1; AJvYcCWU1whbz3aweZu+IMpSI2a517/s3u+xtV4GVHWyTvKgGkcovckk9YXwSemmHUuhPderayIj/hQs452AGFfBkaWnBSrJ3RB7xzTAPJQ=
X-Gm-Message-State: AOJu0Yyi86PgPLYK3nZWXvfQUfvAWlPcn1xsNF+dEGDNiuzgA9/1ZCFx
	VN0l4JNkKOPpDRPojkyGIhXT0vbq9RfMAwjuNVb/AitVujpUDGqQMbHaS8kS56w=
X-Google-Smtp-Source: AGHT+IG5pxrjRiSGtKXXcaujES4bHVw1Q9Xh73VMtvmgJPjR5I4xLxhhFfkpqfCUKfVMEnurVpstpw==
X-Received: by 2002:a17:907:c787:b0:a6f:b6c3:fb30 with SMTP id a640c23a62f3a-a7245b84f56mr796716166b.7.1719331578008;
        Tue, 25 Jun 2024 09:06:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30535010sm6066987a12.59.2024.06.25.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:06:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of v2.1 codec
Date: Tue, 25 Jun 2024 18:06:14 +0200
Message-ID: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
so handle it as well in all switch cases.

Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 00ecc470ba8b..1c3429f004ed 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1601,6 +1601,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_1_1:
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		return rx_pre_2_5_is_rw_register(dev, reg);
 	case LPASS_CODEC_VERSION_2_5:
 	case LPASS_CODEC_VERSION_2_6:
@@ -3639,6 +3640,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_1_1:
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		controls = rx_macro_def_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
 		widgets = rx_macro_def_dapm_widgets;
@@ -3812,6 +3814,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_1_1:
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
-- 
2.43.0

