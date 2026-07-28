Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C240D58B
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228417; cv=none; b=mu4I8CyH8jP+MnfwXlcVX48c2pKz2PIAWlwxi83ClNrei83yNtnD8ISYtbjC7SUe3RckgUNCwaC2lRlAQ5VVcA4sPA7yJtp/kS3dnPja9c62v8AUUubz0+jdTM4EQPCQPSeuHWeo5oaD3lDpGP7ex3Ff5JQdoOyeX/clrm62YwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228417; c=relaxed/simple;
	bh=soYYWqDYqT49Xp3RLBFTQz45tIBaRGTj/MFddw1Sg5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YEomG4m8XtOY2uy8Z+XfnPFK8RPlD7MvIYwfDXAhujD69y1e202iRpP3jlWkMpo9U6NFlW3dIQm8lWyDaXShROfGAwQH9+Mgz96LAQbp5XhvFnn8t9vp9VlAkG4i0DtAj9ecp55Mhi47f0WtgkddNAqg46S80foOgtO4Ezj27Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2cQNfxP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2cQNfxP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so25386365e9.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228414; x=1785833214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cCiFheAJ0TXi4kp+VJwGxvpI11UpFbQT8vPjr4x4RI=;
        b=X2cQNfxPLQK+I54vbDIbLFjcCSf+jcZRzjmI/OqCV9b8CkXV/0leXziwszVnnmy4uF
         Lbu/O2wEPuscze/ZOjbTYK/tENeubV4aPGvVDMTt/lUw/IOhRyYULZi8EjyK7oI7YYqU
         5oeaBof++lsPfrOZ2wJ66RZODpHBtexjZO+qF11/rAvcexMGBOe79mI7yuVXeiugBk0P
         OYQ67iFLd9BUnTrVfmDn40jr7tgYz91U/td1hPd/ixzqeHFeVqZZtKWQt6aVcVueFfZk
         9MzTdn1sxUg+mB9cqOBk6AssCYVNA+5jOCijjp7qbXRe8xN6f8VZwvrv4s7XfaAslpH1
         TsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228414; x=1785833214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8cCiFheAJ0TXi4kp+VJwGxvpI11UpFbQT8vPjr4x4RI=;
        b=PagseJEq4XMtWtWSOiXrxBCNqzMbiMYNqSpfAoJDHf/k+UNqNHzjoJB1P2LtD5nnC5
         vLSFEOXP2+1ssLFLjY/67ZLMlFUdvCmY+SN1/2+dHSjKoibKU+CxFGahVWOzDMDL6AMl
         p9hw7qNTGCg0Hx3xWFvUT/DY3mMTWFh3YaaSIoGXoz6H/GX6ql7+JDxRK60xJvbxVWkj
         Hpf7l/rMkC5uaR6YrKsB/FqG/1Piegt4wbPn2wUPYEZXJQZxe5f6O5FTorhYBeNYtPvf
         xQd0IaB8+BGBUfMN2ttleVzEQuZisS6gh4sjkiQ06BU4FJ47dqD86FStQPur5UzArc8i
         SQVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxCv+OY1ObqBmXHABXTMfahTzJgEITezn4Hj6UBj8vc5qgM7VMqbPuWrETfRXmurtraEtC5Q06SxpMEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYub81JDu0z8/IcgPNVhzrRcW/tlUzBDZeR7G/oXYQju2je+Z
	prMFlEn8l7wr+YXnqzI/ITfuXCjVeJWz8sp5+GNlgcFn5y3OnMgZoW+O2VA4OaFgSP8=
X-Gm-Gg: AR+sD12I2doSttyyaoEnecKyRGj6z9soBGPsRxj54OXiJoby6GThhWY5WmaLNa/PhBI
	gFO+T06nqZuFGEgdu8TUyySmTxW4+ANHKIwAPij7oy7FIpZNz2N5GUetjahfemoDcVBllfGVhZD
	KGAjSU9xzaTqedE5ceZhJHkOXb3nQ9R07szlfWv7jvskTO8x9RA6rUBfb4n/QJ10Gniva1S+W8v
	/3X4UyNhFlYixUnoUiPdATGia8+xbeM4NJerJTMBf2alZzguh4DUz4ymtUiDV9Z7jNV2Upw7Gnd
	/q92oIzaXDF4n5NKQNGryvhdFQNYJSq58VTF6D4VAmnNR8xx5iJ5ow3La0K+TqevQ3eknzbFpkN
	hTY1gOtHy9V2/CfWaXZLBP03xS1K3Gky5/gUMSaWUhMg5A1asAIBhk8BYL/3UaFwYEKJCsnnOd4
	J2C2sGFpd+2NHl+PCiZEyqpzo=
X-Received: by 2002:a05:600c:e558:20b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-496c6571f2amr9496935e9.22.1785228413451;
        Tue, 28 Jul 2026 01:46:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm64658175e9.15.2026.07.28.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:46:45 +0200
Subject: [PATCH v3 3/3] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card
 with special WSA channel mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-3-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4142;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=soYYWqDYqT49Xp3RLBFTQz45tIBaRGTj/MFddw1Sg5A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaGx5KjQ3C/t+OG+lx/Lnoe+jkP99a6Pk+jEFiAPo
 o3Im3BqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhseQAKCRB33NvayMhJ0fCUD/
 wIyIDVT2a9kwQvqKyE2jNv55qi6OXhVh0vFBz9GbmyJRCe9Y2F4l33tLyuK+zRJ5E7LlCwY6gPYTwL
 fnttBuuvY/DaqUzkIYQJyzTgv5Hjk1t/9FFkvbRDaJ5/tzyxOxkLNB8EJGiFWb5bGvrPBjXOX/qFES
 BNZjqcQEk7RjX1saU3UDs/aW1YMgpPRRyLro+ddDw1IG0cBiY7c0NhOvO50ID6DzVjbT+49bHZYchp
 1t5vrhDXOr4xOS8CsavHdaGMM4WcqiThIKQ7rFAAJqRGEUDUgYVWXaE7TEaJ/gSR7wOSqeRxf2/clm
 uGKY9xojrwboQB2PSfVHTYFlR24qcU7o9c47xc5QI4eh93BcZ8BPCrgQvizgaGLYWle8YSKOI1tWae
 zPWlQNYYvcE+C6H1YvMZ6P4e4sJMZv/ctSKv5gmQyzPznbn168NE/3JYK4BRWI/6K/dMxe7Z6uZ2vo
 jOmmFOt5L3f+gOp48ADtwuPn1RO/n2U90kCOHskzg8ZHBlA0lTw3CcyVp9HCo2nih6YB3CD3uRNK3t
 ETyg0boJgNWtfNgFSRhxvOhfqYj5/fI1LFdlaPFQ6TD4DyJGR35rMXxiLEeIEyHSxSnwK2FHfrSdUZ
 tlxDY1V05DW2whxgfMJalgpmAk31Zstsd/hqhcjb2QqHNDo8kXgX6eD0iFQg==
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
 sound/soc/qcom/sc8280xp.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index a9304784d41e..4ccff32a413b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -14,6 +14,7 @@
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6apm.h"
 #include "qdsp6/q6prm.h"
+#include "qdsp6/q6dsp-common.h"
 #include "common.h"
 #include "sdw.h"
 
@@ -50,6 +51,7 @@ struct snd_soc_common {
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
 	bool wcd_jack;
+	int (*snd_prepare)(struct snd_pcm_substream *substream);
 };
 
 struct sc8280xp_snd_data {
@@ -213,12 +215,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
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
 
@@ -293,6 +341,14 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static struct snd_soc_common ayaneo_ps2_priv_data = {
+	.driver_name = "ayaneo-ps2",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.snd_prepare = ayaneo_ps2_snd_prepare,
+	.wcd_jack = true,
+};
+
 static const struct snd_soc_common eliza_priv_data = {
 	.driver_name = "eliza",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -384,6 +440,7 @@ static const struct snd_soc_common sm8750_priv_data = {
 };
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{ .compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data },
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },

-- 
2.34.1

