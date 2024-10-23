Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD511ABEA6
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687321; cv=none; b=mwMz+XIvD5p4bREd2sVFCIosiiM8KzJHxavkUbyFA9By+P+Hg4QLMWFQ355o1hgMD1ArmdT0k5NypWl0N7nhMv2+FGPqoG202WWOSqgKwb2X99DzB2Pkn1YiBgffB9km9DYn2KClCX63Ke1NZRVDFUN37MRkW9AkBTpmmnyewSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687321; c=relaxed/simple;
	bh=r4xQBSHSzqBbjSO15B6LqQBSJLlq/rBG7/qkg8UtW2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/VmrO71SvaTbq+o97yKHwI4Ie7yfMXz6kinpUl2e6tS7mNHu12GHebCj1jf+miMij6kyAPXfL+vl7gNn/KHWeScIf5edCpBo3hvzlQBpUyUIC2+hrDTCNO0KUD05EphYkfw1K5ApnFIwoGKy1yir7ZbqyKx+/acIPDBdq0Yyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DETkIdaO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DETkIdaO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43158124a54so9286435e9.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729687316; x=1730292116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OC1GUo6u6ogIaP+998OmJFrdwx6E7b3ebTutyLvUJYE=;
        b=DETkIdaOHdOPQEuktXy6mDkM4t6rPm96scJ0FnLLCYiqmZeuDG3qeGPhm8TPL5FVvk
         XjzMvN+DlHX0VxbvxAYojxbgPmurKPdI8G7xz2M7QtujsqsAWFz9DHsNzBlBB89Urt3r
         ueZMuVp3ouN9X9zPaxsfeMeNxpj1oWWuMzJQgiLbkW1ym841/1ncgwm+8Yy1xMAiE9wT
         hLF1EPgXbvdImxdjOzU7m6eKMUlVuLmphMFKlBr27Z9T3O6hFGgB37BmDF2tchFCtzJq
         qfsqtJYrtgRp5ti4r2K8LQyKyycfYoJG/T57FK02ONWL7jaKpNL/Bvh/NAdNZ6/b6Uw8
         RRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687316; x=1730292116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC1GUo6u6ogIaP+998OmJFrdwx6E7b3ebTutyLvUJYE=;
        b=QNDyUXZolFazEqZElXGSAKlOu0G2YxSyX1Iy8XOzS91shIzI0tEEKInYsMyYblAu9T
         st1reGwbeQWTO52bLeXVoO/gkSCH0BgAdvO2zBCXP4/afuImkOkLWC1oTW3lXKtqWgHu
         PDyWL5e/fZV8fDtfAzsy0r6/yHXqx06TxbR1pB0TCNs/Dj9PvsS9mGoq7IkEDX0RPOjj
         gLtlCmAqliZbOjr7538wDyS6POv6UkCDJQB/LnG8ideztUUgE1qRo7QsW6aNfalz6nrd
         cNYeN+0ihdZdIsTAHTljZ4RKj8QEswT0ITfNs1NvVTGEkk7wN1Wy19bT1aM4gbH5wmU/
         tn+g==
X-Forwarded-Encrypted: i=1; AJvYcCXUkxQ0gE/ftzgohQrq8eYwPuyMmvOtbN5+K9//rSxMT65c/PEg8FPvldAT7Z/7aavvL2mNl3V5C7jadw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytISVqn/roAOguVYpBAZDcrATbzf596jJqcHIfzrL6D4M8zrJS
	CKwGpk50wnDvJQ0ejQ8iiPSwYtJZzY+KX7053jrkxmZKV7/tfafVnKzRn/g6Ys8=
X-Google-Smtp-Source: AGHT+IGOOLD010FpGoIXn//GRg/EMY8PWXk1Rdw1ltM3+wHFz9aINxy6HV8Thsw/0R78Sp9Fi09moA==
X-Received: by 2002:a05:600c:1d06:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-43184133ef0mr9814505e9.1.1729687316420;
        Wed, 23 Oct 2024 05:41:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186befc90sm15101675e9.26.2024.10.23.05.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:41:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: x1e80100: Support boards with two speakers
Date: Wed, 23 Oct 2024 14:41:52 +0200
Message-ID: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Qualcomm X1E laptops have only two speakers.  Regardless whether
this sound card driver is suitable for them (we could re-use one for
some older SoC), we should set reasonable channel map depending on the
number of channels, not always 4-speaker setup.

This change is necessary for bringing audio support on Lenovo Thinkpad
T14s with Qualcomm X1E78100 and only two speakers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 898b5c26bf1e..8eb57fc12f0d 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -95,23 +95,53 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
 }
 
+static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+{
+	switch (num) {
+	case 1:
+		ch_map[0] = PCM_CHANNEL_FC;
+		break;
+	case 2:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		break;
+	case 3:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		break;
+	case 4:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_LB;
+		ch_map[2] = PCM_CHANNEL_FR;
+		ch_map[3] = PCM_CHANNEL_RB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	const unsigned int rx_slot[4] = { PCM_CHANNEL_FL,
-					  PCM_CHANNEL_LB,
-					  PCM_CHANNEL_FR,
-					  PCM_CHANNEL_RB };
+	unsigned int channels = substream->runtime->channels;
+	unsigned int rx_slot[4];
 	int ret;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		if (ret)
+			return ret;
+
 		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
-						  ARRAY_SIZE(rx_slot), rx_slot);
+						  channels, rx_slot);
 		if (ret)
 			return ret;
 		break;
-- 
2.43.0

