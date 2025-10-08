Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F952F60A7
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920303; cv=none; b=B9WOSvxleH3F6tcF42CcqTR8v+KxVck5xAnbGnvXhp7qAEDVzXelPvAzSAUjGoxAJiLdGTche6CeP7NVo0e2UpTu4UcS8ZTzRZVGcjqucTNfviQ5BJc69K9eReVFzC2ndROveAN9NRl7atC4erMiW2ZBnOpK4sVvqbKUcNgGQRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920303; c=relaxed/simple;
	bh=F/3SDSnCTPJ5R0aJCqe0TNl9koObzQspog17xqvd3fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPqyxO48zS/JUF1K0rNfW1mi0c/xSI0aLAIgTvXu4B0Fx2EhN6gDtBPnd8wjaOCYxdGl6JvmS9l0t8s3bWL8Q6EM0TbrEBvwsYN2RL0AtvK4c5f1NEOk+j/FZs6qrVnNWwj/hvWPiOsW/mJf+LUtdUEB/jztUgxA/VliSqhUeAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ho6XeKt1; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ho6XeKt1"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7811d363caaso804133b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759920301; x=1760525101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uqzprGMb0c1F9PzyQSr/KsKGC8sUWJiY/UfksYRhZU=;
        b=Ho6XeKt12YeixC/jEN02LnSrdOB1ZKXaLVqTPALWAGGuBhxK1wpQUgaRghrjyE0X9T
         GEumDn2x6S8t1Ce1dTe7RKA+V/aJanhFnfBMSUDVtdqjbFbWpx4H6ZAcv07T8/nex2mh
         HgXzup8KUxSmP013Q58dVNZeWrLKkXSzClYaBIIY4ODIGOAH4d+4bsZvixnF/T1UKXSG
         m430UUxYCtGTZ670Xy2tzxqz1hdMjVIxI/bajhddqlteKR4fI5A9mnpua3e+3SFTVqaF
         /auYN1RswKH/CfklZWwq84eKWvrVZcTLHBQw3a82likA0QCcXDf/ORkUJ0eGau5vicun
         2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920301; x=1760525101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uqzprGMb0c1F9PzyQSr/KsKGC8sUWJiY/UfksYRhZU=;
        b=KSqtvYL8v9rCdlUa/JN1y4AOjvQgiSvWybzETQMnw5tr0nOSGpXqnmmlqd2L3neRZV
         INzJKsL2fY5PuO/4n3mVdZI2of3cjTJxMO6WOs5IN4LTSYS2/sE9lt9vVyNILorCRXE9
         cke2gMbyUwkMH/l8SA2arvDfeYw5Qhw4ssXSm5V6TmJ82rELZix4mIVuVXm942yOFGjL
         zK2Fzv/R2Rr5BRya7qYuzCxXFmDtUJZ4XZLPqfM8CYpTEnsIt01sxc+pYj7XwThNIg0C
         26HxwN9OIZoZPKEMwWjmQcQQoyA2jJJJiWrkxh2FjDk6hLXCMpAdfoDPd05Fl5DRa9sr
         iZgg==
X-Forwarded-Encrypted: i=1; AJvYcCV6WG33E/78gEZZAXtHsEDUmD5IlOqThdXN+9yiSzyITN8U23UooHiCECwMIUjMQClF/BR9cwJW9Rmm7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvd7B2DYVU+y6JtzrLHG1M7SRZVsC4JHO9zfVc+cor4FKEZL00
	0ESzHUDhYEWHqEDs/mjgAkPiiB4b2dZacLDpRIMCx64F9Q2v5dN9CdDKMn96rJOLHrI=
X-Gm-Gg: ASbGncvmlnc0i0yPhmliBw3RcftRyI27kVtMupKTkKgqHnWe+2hVI6jQYV4WNn/zaV8
	xISc2BNCh99IsnI3S3MriY26SDq2WXe2rm7b6Y1kl7cFsGyPGAYlf0MB85+rLl7zjAcGagKplrB
	ppsz+2Jt4uMRnp8s8AzsGda3jPH9m0hWSzzt2DnLqpvBk7iVHY8Uu9M1fXig0TVcbhrS6daEh8O
	FBu/9+unReK1woTZnZRC/U9pvGKUi83eGzBTb6lexe2je7JjgL6CpFZcOnbh14tO3hmj90d+uM9
	uJAWHYX2n7cWls2lPIYEcpziZ/V1di0ltNzdNLXkZxiNPQ20GunIz+vbWYuLeA2iik0OdibyTkz
	pDlquT2Sp06iUpu08pMnAlaMvEAz3IBEFZs97i+muf2TzFTf1kTIWHMOxrY88
X-Google-Smtp-Source: AGHT+IHrLX9RbBOpvVqA3cJqDf8szpNGBJuW1i7M6GF7kGam2olRVH1kbgH2P5szP+gjyhnM7ZCWUw==
X-Received: by 2002:a17:902:d4c1:b0:25c:b66e:9c2a with SMTP id d9443c01a7336-290272e3d33mr24052145ad.6.1759920301321;
        Wed, 08 Oct 2025 03:45:01 -0700 (PDT)
Received: from kuoka.. ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1127c7sm196117135ad.28.2025.10.08.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 03:45:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
Date: Wed,  8 Oct 2025 19:44:49 +0900
Message-ID: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Speaker Protection is capability of ADSP to adjust the gain during
playback to different speakers and their temperature.  This allows good
playback without blowing the speakers up.

Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
and sending it as command to the ADSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Add Rb tag.

Changes in v2:
1. Add and use PARAM_ID_SP_OP_MODE_NORMAL
---
 sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f4c53e84b4dc..3b7dffd696e7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1250,6 +1250,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 	return rc;
 }
 
+static int audioreach_speaker_protection(struct q6apm_graph *graph,
+					 struct audioreach_module *module,
+					 uint32_t operation_mode)
+{
+	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
+					 operation_mode);
+}
+
+
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
 				struct audioreach_module_config *cfg)
 {
@@ -1299,6 +1308,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_GAPLESS:
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SPEAKER_PROTECTION:
+		rc = audioreach_speaker_protection(graph, module,
+						   PARAM_ID_SP_OP_MODE_NORMAL);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 790fba96e34d..9f6ddcf081ee 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -542,6 +543,17 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+/* Speaker Protection */
+#define PARAM_ID_SP_OP_MODE			0x080011e9
+#define PARAM_ID_SP_OP_MODE_NORMAL		0
+#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
+#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
+#define PARAM_ID_SP_OP_MODE_VALIDATION		3
+
+struct param_id_sp_op_mode {
+	uint32_t operation_mode;
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
-- 
2.48.1

