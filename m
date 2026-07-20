Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDE40801D
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563400; cv=none; b=gCa3K7MQA8g0AY6KemgxoNokF2VsxZPnf7sZrXpXIeyTwYHmJ/uJeJBe0KTexty7zirO33jEQSEmDHlu/rsaumDx7bwnGMr8zeg1nS9Aq4Qqn+ugmPpYHbuBW8nupaVhje4RdxgHn4hngLk7WFN27CL/w4jwH4zngTN09QD4//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563400; c=relaxed/simple;
	bh=fwqh744+o9BmmXXIlxXJC/QGo3yaAGLuLIjWpEqYF9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqbKLoQJlJ0dDXAUZtpz8AWCTQ5Jz5IXBvHCvu2kJjo6Q1PEkM6wkBQhhSG80v3yoI61YEqM4d/OyMbcgo8GpJ2NbBnRMCVpC8YVscb5TzOaWyzdfD06tQz0CEuT3S0kVRRSl7sP/zBnynqi6jRWdsB8Usqye3amVnk3RlfX8+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JESUJSP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZADtMQ6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JESUJSP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZADtMQ6Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFwAo73103143
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eBiFPMFaSn7
	cpoLyzE2tFMJkTzxfqZsiBo28QSZf7vU=; b=JESUJSP/cXaNsl8aux8oPVWCGqV
	RosOHH1C/rqfrRJDSOriuTXQmUM3lGr3G5XTB3RvDfX2gYqD5JXVGWjx5iwCEuJo
	nUg3X2qMe0mxOl+e8QIHa7V6aQ589XccJiqa/o801m8fNHbTnEHT0ur1Dkjti6u0
	CVhyZwpHF9l98tHGRqbgMHPEU1t4whHuOBmmPPyQq5VlezHZvOTIoJfYK7rJH7Sf
	VM0/GSo42ss+IL/9V+AqT6iG2qUVFE9kCQOsRRWI19ur2JQjGKmQccnUAIgF0W7P
	hafu7NAhyuM+pxkjKmKLdardXxaNmEGG1jJMwVWiIwUzP64gSzsStzfY4IQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9uaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so6252663a91.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784563395; x=1785168195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBiFPMFaSn7cpoLyzE2tFMJkTzxfqZsiBo28QSZf7vU=;
        b=ZADtMQ6Ztt0pAdlek/qAJBJK5o1EQz6rZUmG4mdHAdrVKiOnncyIcXEMBMqjehyc7t
         mFRhDn7q6f21JjSIjgLqB8a4qQgIHpjrkmYm3mJnuUg2FdbfunZFI46b4mhdMk+x4TNm
         5B9hEAASp4z2p273JtbXP2AKIyDEw9kRAYXIE5b/5iZyEUh68SBMB+4r/USjd5Nhlx0D
         FQthwCIORXygC25frtyy0jeRFwHJBZlINI7YyG14UUiVz6xbBpa8S1vIe+6H0Ey8zuIM
         RkXzGOI4TpY+KT9eS7vxFV4lOAYcygUUFJki3/NNtWlYEdQX1lWTiRGpsf5seeRmswei
         jTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563395; x=1785168195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBiFPMFaSn7cpoLyzE2tFMJkTzxfqZsiBo28QSZf7vU=;
        b=DxrcZAJgqk0SpR6io6AYEM0r8JdQecMNTei5Gut2/+kYyLjINtCw7NtemmIC2geSUv
         VXkDIqG69bZuOA+HXQsrKWdX4IYG67qtE3WwLlJvuNyb29qs0f7NbfIk0vk1yFgFZEcP
         1VQezVgRyD34YzB46og7VYcJdIznAnVPGVDrzhZz5+aAUnhCUFyzhhj4SGRZBeC5iJwI
         NFafYR2w+KvYUNI3rRAkCmFvXBJunwUHkD0ZBQ0s5zApT2kFdqdKs7axLVfS3QyyfPGI
         kFlYrvgW5kVxzOj5ybaxf73p45cEuGgDaq9zG6eiZGIpSwmfz0YZdcFyPZnDPxecxV3D
         DxaA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3m35PNNRu4PNqIj9IAgWLpnC3JgWeIVp0mVAj2VXbYbYLlNrujQmiY9+w9s+Gfi5/PiZ+QZ7HA4qRGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYDk2rV3PR0cJyi5frJfsOvhr8iBGpazzkBnmgTbk1+538LPz
	VRSX6BD9Ts0HvCD3cce43jzgGuxC/b3M0jVxwfl+xNlckTUMBt4eOiSbImV7yT5QzCTEZgW68Bb
	rbrzAaMgsPq6jyswBBXcHiXEa8XiQMZ1kCsZn1vBMmoxDBQMGSKj1/gCp4/kQkbgjQrsYBG94+A
	==
X-Gm-Gg: AR+sD12Cfg5VerMHRNWf20NwNUNqONPPFlLM0K5D41lH0645PWaZ714xR9A5aRnmQtv
	3dv0x8B7Ue3srSdPAj/Zp6cY3GChrFXLgcr+/tCiPTXYYXGW/mO3+dNBos755uBMaw7Tec42LBh
	H2yElr5kJFZ1XcTyrMxP534vdZYS5AQ5JZb8Wr/OCKYOZDuG/sEZd3Sj/tAad0iOW5C5oBkEJxN
	tWSSeXKRKTVy+QtIfU5c9O28D5VTWXjJ9kG6pZDlowGDWp3QUUGnzrlzGXP98dXuNncVuVBlVSd
	exF40rIAvrzArsTwEqmQEzRqQWrzob8LZ6wdmgqu6Nntltrq+8nn6Y+308ZG1JnEZUAUjuij60v
	vtALjU56hcXzsggd+lv2tX+3PUZBbD6LXpWlh
X-Received: by 2002:a17:90b:3bcb:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38e4b4312cfmr16270610a91.13.1784563394521;
        Mon, 20 Jul 2026 09:03:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcb:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38e4b4312cfmr16270527a91.13.1784563393824;
        Mon, 20 Jul 2026 09:03:13 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm37616115eec.7.2026.07.20.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:03:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 3/3] ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
Date: Mon, 20 Jul 2026 21:32:26 +0530
Message-Id: <20260720160226.1026440-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3OCBTYWx0ZWRfX7ZfVOXMeqBjg
 Bf32ny2A35sYNv1FmhPgyLjJewzlSY1BW+HaB8E7SrV5b6lUXhBV5BKy052SH6J0q+7AvwxLpD4
 ydPMb5rHWsEkycdVcksu2ASbkHLKZrI=
X-Proofpoint-GUID: rCLrjI5gbjCPoJfDAiIbgtyAdX84KLqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3OCBTYWx0ZWRfXzA3EI5ejzt6D
 vRXcyVB4U/DCxwSEjdPwTJZnCCQ42QOOiosOIp4GKOuSl72ZpQ3hgO3fb4wbikILT1ZH6Tx7uOz
 31kXdmzMsoid8fhPDEsslyD3GLP7jE4IJjfVpA+DvOZ/+Wh2TtioV9DCsJSoPL3V39XiOfrHPDM
 StahYrWcrJuHeJiGS0ndXn4GjkrelekWJpak9OuB9UQkIJ1vxpZUwSNiWNSBG6QCtPNXR4hxmSR
 hDYwsioOj2WilR4cK11dZsjFKy4eVHLiSqRCfYJslCawHELzb1XmJP+hfjsBjBTbEOpQRE/zlBr
 0/JDhnC8FXz61eLwoXvUOMnea26AHFitsRV5rM3yOG428GImLRRAPNXKCIszughNgAVq+YTyT/t
 DjjED249kVy5Q5SIGL+VV/FVAbBPUVkilzo66/11H9iUYeHJZ6Ly1mkDgbpzlajpIWsVS9oWZAx
 VDau0+JORdfSADTABtw==
X-Proofpoint-ORIG-GUID: rCLrjI5gbjCPoJfDAiIbgtyAdX84KLqE
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e46c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=T-rPskIIbrx-efRHNJwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200178

The sc8280xp machine driver is currently written with a largely
SoC-centric view and assumes a uniform audio topology across all boards.
In practice, multiple products based on the same SoC use different board
designs and external audio components, which require board-specific
configuration to function correctly.

Several Qualcomm platforms like talos integrate third-party audio codecs
or use different external audio paths. These designs often require
additional configuration such as explicit MI2S MCLK settings for audio
to work.

This change enhances the sc8280xp machine driver to support board-specific
configuration such as allowing each board variant to provide its own DAPM
widgets and routes, reflecting the actual audio components and connectors
present and enabling MI2S MCLK programming for boards that use external
codecs requiring a stable master clock.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 251 +++++++++++++++++++++++++++++++++++---
 1 file changed, 231 insertions(+), 20 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 98b15a527e37..2ecba74d736e 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,17 +12,78 @@
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6apm.h"
+#include "qdsp6/q6prm.h"
 #include "common.h"
 #include "sdw.h"
 
+#define I2S_MCLKFS 256
+
+#define I2S_MCLK_RATE(rate) \
+	((rate) * (I2S_MCLKFS))
+#define I2S_BIT_RATE(rate, channels, format) \
+	((rate) * (channels) * (format))
+
+static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
+};
+
+struct snd_soc_common {
+	const char *driver_name;
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	int num_dapm_routes;
+	const struct snd_kcontrol_new *controls;
+	int num_controls;
+	unsigned int codec_dai_fmt;
+	bool codec_sysclk_set;
+	bool mi2s_mclk_enable;
+	bool mi2s_bclk_enable;
+	bool wcd_jack;
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	const struct snd_soc_common *snd_soc_common_priv;
 	bool jack_setup;
 };
 
+static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
+{
+	int rate = params_rate(params);
+
+	switch (rate) {
+	case 11025:
+	case 44100:
+	case 88200:
+		return I2S_MCLK_RATE(44100);
+	default:
+		break;
+	}
+
+	return I2S_MCLK_RATE(rate);
+}
+
+static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
+{
+	return I2S_BIT_RATE(params_rate(params),
+			    params_channels(params),
+			    snd_pcm_format_width(params_format(params)));
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -32,10 +93,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
-	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
-	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
@@ -64,7 +121,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (data->snd_soc_common_priv->wcd_jack)
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	return 0;
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -96,6 +156,63 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	int bclk_freq = sc8280xp_get_bclk_freq(params);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+
+		if (data->snd_soc_common_priv->codec_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(codec_dai,
+						  data->snd_soc_common_priv->codec_dai_fmt);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_MCLK, mclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_BCLK, bclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->codec_sysclk_set) {
+			ret = snd_soc_dai_set_sysclk(codec_dai,
+						     0, mclk_freq,
+						     SND_SOC_CLOCK_IN);
+			if (ret)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -117,6 +234,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
@@ -145,38 +263,131 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
-	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->snd_soc_common_priv = of_device_get_match_data(dev);
+	if (!data->snd_soc_common_priv)
+		return -ENODEV;
+
+	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
+	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
+	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
+	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
+	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
+	card->controls = data->snd_soc_common_priv->controls;
+	card->num_controls = data->snd_soc_common_priv->num_controls;
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
+	card->driver_name = data->snd_soc_common_priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct snd_soc_common eliza_priv_data = {
+	.driver_name = "eliza",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common kaanapali_priv_data = {
+	.driver_name = "kaanapali",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs9100_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common qcs615_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common qcm6490_priv_data = {
+	.driver_name = "qcm6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs6490_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs8275_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common sc8280xp_priv_data = {
+	.driver_name = "sc8280xp",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8450_priv_data = {
+	.driver_name = "sm8450",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8550_priv_data = {
+	.driver_name = "sm8550",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8650_priv_data = {
+	.driver_name = "sm8650",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8750_priv_data = {
+	.driver_name = "sm8750",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,eliza-sndcard", "eliza"},
-	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
-	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
-	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
-	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
-	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
-	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
+	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
+	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
+	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
+	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
+	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
+	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
+	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
+	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
+	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
 	{}
 };
 
-- 
2.34.1

