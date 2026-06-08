Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D2931618C
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885850; cv=none; b=MJKtsH4+vCQZ4XlRavvJ9wQ0s005Itj02RjLCMe+75X2th2Z5BSyrTrHWF42U/orsOqYZwI1eZpSTSeSIA9TrFhLaHX00riONI6rAyBGdvMsTdMIbW1/KGSNORrajKbEdUQ93g/RJkZnS6DDViYeMMN854hZB+jvIPY6uLANOL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885850; c=relaxed/simple;
	bh=3vjtgWyk+0FY/MA781oKU7RzNicZneABHruSOKal6t8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qAsZgY6knvxDHRgyKO5RHi/Wq7Kf24TrJGbhbdfdRy0jM0yeSmZTksMDur1MCRIUcKKsGKVy3UKBQosaT5fMlGcvyvevKfwp/qUbCYkQdTEM9qyzwJIX8DSjfJYOzOGvt0aSkvD8/BxSPLNjiH7EwWl6DFcNqSu25FiMjF4iKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbAHymGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYzacINL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbAHymGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYzacINL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Fpa32023775
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 02:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=htKsrgkLF1e
	nw+JTU9KstIh2F7UBTHII9P/kE0A+9Rw=; b=lbAHymGRtQDUmXdxcicg7I1+dcs
	FXRD/Psgtb4/1h4u+QzWZcP8aRrdj1JBSHzdlplQQaOHW37lxCvHmqkHpnWaDZqT
	MpfbXXkUgZ6rP2U/nQm0RQScZZ7uzp9s1vPnMVa1upinl+ToIzwK1jE4SdcWwJ3p
	Katxam2K3d/8YTYhh7GXfupgDFKd0pnc/JPduOCDYlRU3bLCehZJWUlfc3HCgccw
	mDOqBsLXbiGEL14MHwVTARRF5uXNE6dUl5LdXDkCsztx1PmYXI8Xpj7bJbTA5EB7
	1t+f0ZWsKYeGibasO8XzBH3TH9ByXccoXeAvQqiyleBNowW83bVWf4t05Rg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdfne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 02:30:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf0b7425bbso76972175ad.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 19:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885846; x=1781490646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htKsrgkLF1enw+JTU9KstIh2F7UBTHII9P/kE0A+9Rw=;
        b=PYzacINLJ/waDA9bZuvEdp2aBnzhbFlocAFpbmSAB9OpgmBk04IWDY+o4DMF5L7Wf1
         rAlfcFGBhiMArFqNy2/S4QaItg6FSTWSkgkXYYmdnBIUwnrV82FwT7nsWdiW+jg7/hV7
         JdUEIPOsHYsByig4d9TqujBqIb55OIpNd8Bm8Xtsvg+v5G1aPV1qoQ7J4wNlFLoKfD5t
         jIHbF/sY7dBxRyhnm74eV3Erpsc4YcbbtZlO3thvDcXzc53hGWvqVm3iGyAuChzSYBqw
         1PTQ7HzZTzeoVcWCFAZNXl5IiMe+BS9O3vZcqw0bClx9xoEfImsV+zlLa3QHMSKBdAhT
         EwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885846; x=1781490646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htKsrgkLF1enw+JTU9KstIh2F7UBTHII9P/kE0A+9Rw=;
        b=dBfNYIx51fPRjgusYGyyNiCXiwuJPg0zZAEfATyYcLnGmKAbet/pwFRo1bkvj6G0yu
         cVM0qTAUBbURF/rARCOUbcURaF8MsLNtpj610nKmy9yJz+w72doMQ2BYS7zhY6D6MD9+
         gz0KsYG3D2ZN6Ov3g6uwfsMa1KADs0r4MvaE3Ag7LFSryjiVryMK/mKzCFpL2zbJ4YHW
         LsPdP/0hiYEVrUYMPbKH+Pc9C1NWhF3AVfsB4V2VJVW8DQvdvKlYPUC/Ap8X4L3h16dN
         qiJSpNXGyOr9dKW1YN8n0G0PKICAc44j1yh8Dk6piPc9E4Gt9iB5MalfGr0ZKHldt/JF
         w3WA==
X-Forwarded-Encrypted: i=1; AFNElJ/uk0lt8CQdw7puis2gnGbi2bcyg7xjlPOsX+EYNHiUPYb1uSMdlUrn5VRcndEkAton3wrlEybBl3IhAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4TJqfyNpUKhRGzxElFj8ZCL8/q+YQXfLiDKAaimTEBpZJmez
	hAD//VuhPZHg2krgp+szq024q+A/F+SncqCGnJ3EGEVwqYh5RCd5icc0u4JJTQfytEGO+JBOXLe
	g26qcP6oe5TlKV2z23/XMuz5k6OtakV8xypD+Fuo3pFgTlX1/hwUmazJxhfXxTtUrbQ==
X-Gm-Gg: Acq92OGuYxxmv5YGBF+ZoDblm4DYEN2UkNlrg9UaO+P/wfD/vW5Bkixyl4jfwsQ4eNA
	4KPyFs2R5KRsxQpc3KJq0XF2adQaTQg3a+NJsfp7WjZ9akWd75MWW6ChB+BfQV8yKC6QDupXuLj
	QX473zbs5Qn50Op1Fht/ZRBmXxJMXUgZNPkp1L0VihSQw+qkgxbU9uviq/dJlH79HA3IwQa5bb9
	fgYvgrxghSWQPjDhWqfWn/6Zlh4S9gKnKIxlG4xG1KZyDWm6EAYRrurAzYJTJzn5KQPBKJ/0flB
	6GbGJm1TEnhL/mXPTo89l02uRmMKm/Q/KMOlMvKvhyauWrt5cCOAmHLNoh5GtygXUp5FQn4pweI
	gWFcSUi+cGpk7SdyR82z0kPBswAS/etjCFOBhX1SllotlCdM/Z5b3TeO1qyVsn6x6w9hC
X-Received: by 2002:a17:903:1a06:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c1e7e866dcmr156806275ad.15.1780885846370;
        Sun, 07 Jun 2026 19:30:46 -0700 (PDT)
X-Received: by 2002:a17:903:1a06:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c1e7e866dcmr156805855ad.15.1780885845922;
        Sun, 07 Jun 2026 19:30:45 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
Date: Mon,  8 Jun 2026 08:00:11 +0530
Message-Id: <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfX9KBck8SS7B+w
 IGKy5xZwk/GtTQPXn6RbdXYa9h+yFD9SpMsds3jiceS2ri1OroLElFb4XMtgaY/NWrglC+WpZ0T
 DK6dwN2TLHi8eGkoHImFWsY9PHI5bAiLa0OZlmOeayiouEYcOS0TKb1iQilXxYlwxu993u2HWUU
 hwTKlH0seWDOnjWO1autfIQJQ/jH7ToTUY+BAsDWPbVLC+YZ/dvmD7fGtXk3knXduGhM1ulawz1
 tXmizWs7CPQPoX42oCrhlC/RtqQ8ZvvoyH40MjvmYolbVSuIQPtY0zOTULSBA4CtSjaJAnPyUAk
 k28v9Y+lToK6LUU/xuBhCaso97shpbCU/qFmHPa0JRdHIMg05WJmQGO2B0xwFrjP6P3zgJL/Vr7
 mB3u53ZRoiz24hI6xxBw1eZ6xZg8W8aVc3ycUPdh4k46caiJ36ornkE+BngcobgtrRhIGUrpj2N
 MOTYTdPshiA0czXO4pA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a262957 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9H_U430U70S0im2cdw4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: h_Srek-kuoGskAGZgWgrM_TVAUU8J2yl
X-Proofpoint-ORIG-GUID: h_Srek-kuoGskAGZgWgrM_TVAUU8J2yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080020

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

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 213 ++++++++++++++++++++++++++++++++++----
 1 file changed, 195 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f6..1f3afc6d0 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,17 +12,77 @@
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
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	struct snd_soc_common *snd_soc_common_priv;
 	bool jack_setup;
 };
 
+static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
+{
+	int rate = params_rate(params);
+
+	switch (rate) {
+	case SNDRV_PCM_RATE_11025:
+	case SNDRV_PCM_RATE_44100:
+	case SNDRV_PCM_RATE_88200:
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
@@ -32,10 +92,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
-	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
-	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
@@ -96,6 +152,47 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
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
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+
+		if (data->snd_soc_common_priv->codec_dai_fmt)
+			snd_soc_dai_set_fmt(codec_dai,
+					    data->snd_soc_common_priv->codec_dai_fmt);
+
+		if (data->snd_soc_common_priv->mi2s_mclk_enable)
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPAIF_MI2S_MCLK, mclk_freq,
+					       SND_SOC_CLOCK_IN);
+
+		if (data->snd_soc_common_priv->mi2s_bclk_enable)
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPAIF_MI2S_BCLK, bclk_freq,
+					       SND_SOC_CLOCK_IN);
+
+		if (data->snd_soc_common_priv->codec_sysclk_set)
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       0, mclk_freq,
+					       SND_SOC_CLOCK_IN);
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
@@ -117,6 +214,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
@@ -145,37 +243,116 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
-	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->snd_soc_common_priv = (struct snd_soc_common *)of_device_get_match_data(dev);
+	if (!data->snd_soc_common_priv)
+		return -ENOMEM;
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
 
+static struct snd_soc_common kaanapali_priv_data = {
+	.driver_name = "kaanapali",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs9100_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs615_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.mi2s_mclk_enable = true,
+};
+
+static struct snd_soc_common qcm6490_priv_data = {
+	.driver_name = "qcm6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs6490_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs8275_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sc8280xp_priv_data = {
+	.driver_name = "sc8280xp",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8450_priv_data = {
+	.driver_name = "sm8450",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8550_priv_data = {
+	.driver_name = "sm8550",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8650_priv_data = {
+	.driver_name = "sm8650",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sm8750_priv_data = {
+	.driver_name = "sm8750",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
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
+	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
+	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
+	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
+	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data},
+	{.compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data},
+	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
+	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
+	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
+	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
+	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
+	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
+	{.compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data},
 	{}
 };
 
-- 
2.34.1

