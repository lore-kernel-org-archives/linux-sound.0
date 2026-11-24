Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541558;
	b=L7C7B8yh+TsOCHW62xVKiUSl40XYbFF/Rj2Bmg5Ga1Bd3bGXsLUU7zLOiYkNtwmxRfTo
	 YfEj2kDYHf0gf6oqN3FCQSo5VFoGPQF7RicOmmq3amQPzs0QdxRM6EK4uuMtGuFDlIArS
	 mOyDhOklLrLCO62AiRzdqhCzDXMAMpP8tH/FOb4dxgnJ2udSsUUdfLCqMWSTaEnHYp6hp
	 djciaxheDrQ++3ScC3hQdRQP3ClxmGRKLCQ494YQgC2xQkRhU6K5Mde/xroDTdMngh9IV
	 BHBWU1KcekstBZO/QGEPPQC1AIEFSdh7AnHcZnoV2F0IuOF11xPL8Vo9pUNw932I3dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=nufcT6I5wtqJzgqQd6mwSeskFmkpcz5yu7UaxhvOpBc=;
	b=VKP2fKhSw74qUG9gQxwC3+nI96lZv7dq21tcVw11S48Tg2htVOkLjoPeeDBneAl1SHel
	 Jq2xU2t7DnVrN6P4SLHKAjfG4Rm/sIL5RF1wlGZ3Ku9i0zu60SWdBGf2Phgtex3I4LvC6
	 OxjCAeGV1tHzlLxSho2uo00G9EiOF81WU3q+nvU+edynh+O6MxnDKk1Be7qnHX9k6FcPt
	 WszTjAylrOBMmHbvqbtm33lO1sXJ1Z+q/4H5q5STf+9KV8Iuzs1ocLs550I3aahiM3D4E
	 3dv1X6/XDWw+UJj637BWemsjr7dT02bXnZ+u6paudupWjBwYt8mxhzj74KOqcc758Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pU2zelue;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B5606E1AD
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1B5606E1AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pU2zelue
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso47656385e9.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541556; x=1796146356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nufcT6I5wtqJzgqQd6mwSeskFmkpcz5yu7UaxhvOpBc=;
        b=pU2zelueugtiJV4x+NfDMs+21apnmPRZnouT5PiCVJszVI+tmNnfn8xhBnPbyQl1Kl
         VYBrVsF616QQFz6LyoYKecXfMAKvP04/qQ9r7m8k5fwXqZ/FJzj63DwKo4xmxTG5084r
         O/QyfD2sWI/rYUEHCVaAR9tkYYGb0O8sPtbmFx4ozv5Juld0vf6ylLo/As3in4SSDxZ1
         a6dfb08ECjmFmMXSG8Uz29PHRPP+XTXJYwVAIL3EdUkLXs+O3vr4DbEx6uDG8aNLNYFD
         lkbug9eLhuPyhoFtO/YMCRpfFZz+HfVI6SymN1URkgjthZrguRGlG9Kuq5aD7b8iwEDm
         ziiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541556; x=1796146356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nufcT6I5wtqJzgqQd6mwSeskFmkpcz5yu7UaxhvOpBc=;
        b=b2eH1DSUEuwz3klh2Ub295MTFFKtKvYiNbjqvMZaAj2cC9+UGLYVlZYkCJCAkx5aQi
         augj/PAlOth6ZHg8+Vzx0HHVqrgIEHNxkzFGoV7yu/2kXc4H66FqD7wQ/v3HH0VxT2PJ
         /8hzb52bqkpTCIJiJVtQmrAnsmf+SPSOWlG+ypHj36OwV7ClZ3c79ggaVcU12A8RPIAs
         QWeDlcv2zdd1FsoL81m5m7IwtVkPMTv+jzbYB0J/wnqHgjrWlTdyidTbvTPpFwKf3GBD
         5dsOLequRRFKlcf9yfE4CCgO57oDu+oIVpKDJ5xs9WULaFuan/VryKDrzK75IIsSID6X
         RZIA==
X-Gm-Message-State: APuU4Z+UORsZi0yQMgb4Kgt7uqq3tfPPWHLnVkU6kt6J0WlfCGKQ/GsU
	OBA3W4hhrNLBmim6aJsPRU852qHPajP4hznXToR5i/3QYQu4KA0oeyopirrslcS5pGA=
X-Gm-Gg: AZFdTZdjGVbQ973XZM2pw7lkD9aQaVtZyLuLGXb4cry7rLZjgdAm2JbXonF9DPFJtmN
	dDkxWMmCeZSB4jpFDnwf+4EWztu8M6ef/cFdKofZb+ueXZpWgR5QA6sshQALQwYzX7WRj0m/0fx
	yqghVou1enVINdHV/CmflHTAOvuwy0NI1xKn8ULzEy1jGbb5rbpOjcF1zAh3ld47duW/jwFwkOf
	BXBpICrdSRdCgNuBrT1XNmbd3ITldK7+mODl0NWEn+PsbyQ8Sf5lNXK7IcCoZzUiBN71ELSKl8/
	CFDCHTgNkOvGVEJ2IQkUaP1uwUWqvE1VupU4CkCDch1wxY2/EIjtiXCCGksQAKK/JwhGZDyJICl
	z11QdzJsWQz/iqJxqng34vCmbAYS1sUu+heliNeTHlDkCEKi0L+CjWneuMBe9qmb/WcLMAlLt1B
	yWjZmPZqecfwuJNM1GjcdvkaiAhdKp3C+xCF1Q2xSAdlrJY28Y8/SFoxutRA6s0q6/E0qgQXe0Z
	h2wYx931YJgK6v0OiVtkPL+srdO/t/pNSCEFaacT+cZqXPJ1FbbWdta5KW4jd3ENSONGo0o1hVX
	1PKX8jxfZ68EkP40tkYMfaDF69v4dr5Sss6HouJp/rdUZoAXDQ==
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr294089525e9.24.1795541556121;
        Tue, 24 Nov 2026 09:32:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:25 +0100
Subject: [PATCH v2 18/19] ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4251;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O/F6X827vmeWFUDFxdC8UAbpZvNVpTpLrLIF5/O087g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcojgMzsCA387B8/ryOOczJYFfBSuSxtDFUlRNIs
 YsLBkLKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIwAKCRB33NvayMhJ0Z88D/
 9vYLjUuqfzBx8dj63qy+v+m947tJ1gy2kkA7u3l9/YwA+F1BWU8jqXz9AfzeQ8uV1ngHodUxCxWIQZ
 HcBSsELEOnjCiu52F+XY2T9iACI/Z5xfxA2E9kvXLywkCYp52UbZ8vhR8y9l6S6yJGmW19zdeK+BPR
 klMNviSrCf8RjA1hr6t/yXm8V3ngePpVa1miVBjxIpZBDOJ8rmueld12NvfjnE6RS5sZY8rMaoTlFH
 F2CIINBEEH4QBT1XJ0pOD4Yav34QiWhsubbhd8UkDFUMjlyUjCV7GSMfLzcli9IZRaP5lS7PyJpB/D
 H0VrH4bicUiRFt6UbkdYaR3JdsFIdKv1s8+2IuqmZQqPfS5lWYAb6o7l4vvfGw8VbKvlW3Keu55/fl
 ilkkooR3INhZfVDOm3Z/gJ7H/F8Cff76+xmbmUTod9FcXk6TElBm9LhxZNBCaJwjEMEr3NXBfHAN/O
 IbK5vdZ+2WZEWgLEHTt3YGApWDJTQfWxqeQlFxfYr2HureJdED8YZRMRpM0Qw5FUiCcS5nQBaqZH0n
 CzMCF6TWw5S2sZaAFq/trgA3Z2sWvMKiL+2lDlpDjRlZlIPDefK9+p7J3RqNw7P7w6TQNpN8/AS6Ih
 C4vCIFQ1eKJWKwX2evU0eaT7bTdiRFZMDBJzSN81Rrz5+5pCcqQGRqX6Depg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Like for the WCD ports, allow the WSA_RX0 port to be initialized
as a soundwire DAI.

The LPASS CPU dai ids from qcom,lpass.h overlap with the DSP dai ids
from qcom,q6dsp-lpass-ports.h, so only match the LPASS CPU dai ids on
the DSP Bypass links, which are neither DPCM frontends nor backends,
instead of matching them on all the links, adding an helper to
identify those links.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/common.h |  9 +++++++++
 sound/soc/qcom/sdw.c    | 42 +++++++++++++++++++++---------------------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 37b185a4968f..1af9c32505e6 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -32,5 +32,14 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
 
+/*
+ * DSP Bypass links (lpass-cpu) are neither DPCM frontends nor backends,
+ * their cpu dai ids overlap with the DSP dai ids.
+ */
+static inline bool qcom_snd_is_dsp_bypass_link(struct snd_soc_pcm_runtime *rtd)
+{
+	return !rtd->dai_link->no_pcm && !rtd->dai_link->dynamic;
+}
+
 
 #endif
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..669fb63207c9 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -6,10 +6,25 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
+#include "common.h"
 #include "sdw.h"
 
-static bool qcom_snd_is_sdw_dai(int id)
+static bool qcom_snd_is_sdw_dai(struct snd_soc_pcm_runtime *rtd)
 {
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
+
+	/* DSP Bypass usecase, cpu dai ids overlap with DSP dai ids */
+	if (qcom_snd_is_dsp_bypass_link(rtd)) {
+		switch (id) {
+		case LPASS_CDC_DMA_TX3:
+		case LPASS_CDC_DMA_RX0:
+		case LPASS_CDC_DMA_WSA_RX0:
+			return true;
+		default:
+			return false;
+		}
+	}
+
 	switch (id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_TX_0:
@@ -33,20 +48,8 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		return true;
 	default:
-		break;
-	}
-
-	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
-	 * DO NOT MERGE into top switch case */
-	switch (id) {
-	case LPASS_CDC_DMA_TX3:
-	case LPASS_CDC_DMA_RX0:
-		return true;
-	default:
-		break;
+		return false;
 	}
-
-	return false;
 }
 
 /**
@@ -71,7 +74,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return 0;
 
 	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
@@ -127,12 +130,11 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	int ret;
 
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return 0;
 
 	sruntime = qcom_snd_sdw_get_stream(substream);
@@ -169,11 +171,10 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	int i;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return NULL;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -196,10 +197,9 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	if (!qcom_snd_is_sdw_dai(rtd))
 		return 0;
 
 	sruntime = qcom_snd_sdw_get_stream(substream);

-- 
2.34.1

