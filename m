Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8747D95C
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984720; cv=none; b=LSH+rOJinvkZ4+zxGHWZTNsuNVFdSgnmoDHDxir9I091w6B0CP6ZjyfW8XxsrOjwacm/TBswVow0B/3OD8PEmR9foWDvzJlGnqJIMPljq55owvo+1+BLo6iz47hWZNzElYeyaMHe8zU61QuWEUbU0U9aSsu0GkLrpNRQH4BJYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984720; c=relaxed/simple;
	bh=dSRGE2gG5y+XHfmGJNi1YtW71vSb/d7oJ5hM5okZmCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7Ge3lr2w8QhYXYEeiV36X4JUE3a8X3wSIvulo1+vva6QOnEl9mAmOZJsvI379Vdl8luXexr6vGjxQdemut2lvxUcVIOPmQcmfC8/o1kcx/pb/cgBZ7ZYgHlZQcOcKdGtjwdKPckGzEo6p8OjTs3mNe/UqC8gK+b697PMWNqnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6gKeW2J; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6gKeW2J"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47122683cf3so1176681f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984713; x=1783589513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnJMy0IHuM7TC3zCK26WMiUEt5og2YU7Uc9moZwoWL4=;
        b=X6gKeW2Jkw+13FAsP3TAhA7scAoYEMPKTKosoVTAQzHnoCC4xw7eV88Hg8zMO89ASg
         oyb6nyvsjJXxU59ieI4WUh8Uhr1I8WDPDLBl6FxpCdW1GXjbWgtjg8UnucHEa9datVM2
         6zWtRqY7Bjqe9GGWePEMu+wwUmoF5qEFfvYnhjYXcsKl8zBqWRZBd6EJ7TutQbCCboih
         jCszxGioY4IspSExmaai/4XohUZQAT4oIMosUXn9nhA2D18Ei6UyHJP2jL4IhaxRLKkM
         vwkbgXapy5IDeM7JBY/kNyrBJ+P6J0iTBmZRPbUzrPglEXkUYINnfMNChvjWeHGPbY0x
         +9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984713; x=1783589513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qnJMy0IHuM7TC3zCK26WMiUEt5og2YU7Uc9moZwoWL4=;
        b=SylLXw6kncmPK8YMV+H7IaSPjhMsyr5mgGiEZA+6lDxEFO2tazI4BCMD9iuVkADp6X
         xx2xoV8qk23hkcsAG+TXs/KeWDvT2JZIScaeDF5f/ofdQMRpyiHk1fXmqZAQT4PhK9rS
         l+d3TvrhPuKGwGYYokXffAcjoIIANSsapjdWZqGMGQdybErayvHRVxkdVzy9/DpN36iO
         h1CIm25/wfjnexJidwZMice8ZgB8kmy9enxJpiBApT5fK+3OpjTvfqf0TwtnXh4ph9hB
         VjU9tFaWOWqE6YdYd31Q448S5S1XFVFtTIktmmRJX8mUel6sFR31GjTvnUA5d7YjTh9x
         dGrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqyg043a+7Ay5uRz+e0tVLNl9udNguERlwlLXj02jZRYNELiwI3zHItiMrWSpxkVRFgK4QyeRSs+g7BEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJejMAEtQJfgjaisFp7/ic+ZigEaST6maKK0wNaLMJLKekxCKE
	9wbounAh8e7b93kcQkMUHpo8YxW6HhHCGsoPeZiRn+lKTej+9+SlToTEWKVhzXkEnoJL1pw2weM
	MGf9W
X-Gm-Gg: AfdE7cmFHQZSyiUUFUYAlkXwHasghzx2XABQJpjitxoXk+1tAhCEEX119kcIb4DfUgV
	itwVruTomNpz9iEVg3ZBhzBw6T5jVzlEGX6+m+YRX+5QYRX/eP0hn7QdGB4YU+Ena3WO1ovjhaD
	wAKuCaATDaNXyefkvns2nD7SHFmNxqov7+gS37TWAyQ1gr2i1lElMxSr7WGCfMT+oI+B0p9y84F
	b4WXQehhqXxlmtdd7hJqRzKZg4cJzPSENoeItHvJMPptJRCiIMZoLDSLGY0H9flbuAOh0yfO/RU
	clcOXLhfEErVtQ96Bhe0DI2ebwA0HQGFO//NBCcHPi3SDE4tv/lOvYXjlKyi0Kdu9FETaGjBXd4
	O8wfkJXaCbBxb208hkoxAudysof5nPmA6Hb+V9rPf3ke6XJRF+fZOcd/G9VF5LWia2NEME/gUcX
	8U9Mr7Ue1NvRqa2sQnbIm9+/FZpGTGMiJnFg==
X-Received: by 2002:a05:6000:29c6:b0:476:504f:7a1 with SMTP id ffacd0b85a97d-47757e57eeamr5261411f8f.7.1782984713014;
        Thu, 02 Jul 2026 02:31:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:31:47 +0200
Subject: [PATCH v2 3/4] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card
 with special WSA channel mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-3-1ef8ceb8c9ec@linaro.org>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4129;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dSRGE2gG5y+XHfmGJNi1YtW71vSb/d7oJ5hM5okZmCw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjAD4cWKkbUcXh28fayUai0Z/JDQ1oMabHtaOnuv
 H1Cd7W+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAwAKCRB33NvayMhJ0ZWUD/
 9xyaaBzmMFdgQ3nBsFIZq8sznnXdWHXjG6RZCFFoparJxyFCDDO4oFMLVuUTdbIyO1efYuDGfEeH4r
 I/v44+1Ju2Rj7w/JkbsGeyK8fOs/yEp9jZV7+yVOmFA6rrzzKDMOSOn82nEqapchmiIjF3WzaobPhu
 Jb4kWbDHSqx70iSuHAgZ/RiAzaRqvY6WuG4Y3a3Or4VXrskfaVaS87TazMqbvRDp5oRaG4Tlz50asa
 MuI2NViLfNaWxJdxQTFj+rjn3ITztaHClHMW0l/pW31Rmhjne5FpzAjtNnS54bDNly9WVL2puCXykv
 gKYhlKLD/D14CDcH0gmPIoCeQor3/iRBnO6h3O7aiDrodWn9JDYKZyjkl/eKnyd3XvTF3oZXXcPoT0
 PUym5zqzYrnrU8bqdjtNLKOF4u5HkoeFSO84IIPlwgkDfVPtlsAbXw5cu4JFxJFQYCgg087TuL57R0
 4rYU/rqrKTGIBVbrd90Fg/l7c2lQDXppSITs9qy7BI7mG5FXsC9ByGhs6JMZmYAfHshBNaSBuqAT4s
 op+uZ3wh/UgTUzVZApMSbmEUowmSOM9/58YfyeqQ2hZ8aPje7aaWTxrAUW45MFLOra301cvDMuskRq
 i5fCrFFiiAH4X84m15bPw9NUNpbEBa60ZAspflU7RKZmV95RXgqgTYJC5NnQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The WSA Speakers are connected on the WSA2 interface, but the
WSA and WSA2 links are handled as a single dai and DSP interface, so
we need to specify the channel mapping of the Ayaneo Pocket S2 for the
WSA dai in order to have functional playback and avoid DSP errors.

Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
callback in order to set the proper channel mapping.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 1f3afc6d015c..2f1688c9f317 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -14,6 +14,7 @@
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6apm.h"
 #include "qdsp6/q6prm.h"
+#include "qdsp6/q6dsp-common.h"
 #include "common.h"
 #include "sdw.h"
 
@@ -49,6 +50,7 @@ struct snd_soc_common {
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
+	int (*snd_prepare)(struct snd_pcm_substream *substream);
 };
 
 struct sc8280xp_snd_data {
@@ -193,12 +195,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/*
+ * WSA and WSA2 are handled as a single interface with the
+ * following channels mask:
+ *  __________________________________________________
+ *  | Bits  |     3    |     2    |   1     |     0   |
+ *  ---------------------------------------------------
+ *  | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
+ *  ---------------------------------------------------
+ *
+ * The Ayaneo Pocket S2 speakers are connected only to
+ * the WSA2 interface and the WSA interface is not enabled.
+ *
+ * Set the channel mapping on the WSA2 channels only.
+ */
+static const unsigned int ayaneo_ps2_channels_mapping[] = {
+	0,			/* WSA Ch1 */
+	0,			/* WSA Ch2 */
+	PCM_CHANNEL_FL,		/* WSA2 Ch1 */
+	PCM_CHANNEL_FR		/* WSA2 Ch2 */
+};
+
+static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	unsigned int channels = substream->runtime->channels;
+
+	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
+		return 0;
+
+	if (channels != 2)
+		return -EINVAL;
+
+	return snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
+					   ARRAY_SIZE(ayaneo_ps2_channels_mapping),
+					   ayaneo_ps2_channels_mapping);
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 
+	if (data->snd_soc_common_priv->snd_prepare) {
+		int ret;
+
+		ret = data->snd_soc_common_priv->snd_prepare(substream);
+		if (ret)
+			return ret;
+	}
+
 	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
@@ -273,6 +321,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static struct snd_soc_common ayaneo_ps2_priv_data = {
+	.driver_name = "ayaneo-ps2",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.snd_prepare = ayaneo_ps2_snd_prepare,
+};
+
 static struct snd_soc_common kaanapali_priv_data = {
 	.driver_name = "kaanapali",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -341,6 +396,7 @@ static struct snd_soc_common sm8750_priv_data = {
 };
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data},
 	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
 	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
 	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},

-- 
2.34.1

