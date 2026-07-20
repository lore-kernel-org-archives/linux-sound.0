Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404D407CE8
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563395; cv=none; b=R1v2OnQ4pqEDtKK4jpmzNsYnZpPDaWrO7xTBPoQgdMfoenQETWFIos9c92JAQP8Dv2qU1rP94QvT4Dde8Vi6CFMyt1qWND4FDe/lRO7tmbnrXrxB0wucyE2FzRZSpevIwbBw3nb+ZkCGOAcbJut0GgJNjbvmIA9UD/M5m5MjO5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563395; c=relaxed/simple;
	bh=dLv0LMl1q7ayG4jidd12KQ1THdtc4S/3pzbF7jEew1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kcr0qNxA0BRzGn/PO/k4msUiccIg6lx6J1zxTdJ1a0GiS5LpZE5ggP47bGS35M4JSJVMMd4lEvAyNbbPgck8voZeH1oKZkIjPrQ7apBV0FJ3PPBBpSf4IoG3/FbtXlMK/0zudvfdRNIXXyX200rtTR4KwL8vPvbcsdVk9u4O0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AF/yX3SY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6P8kTEs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AF/yX3SY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6P8kTEs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFwT4p4155364
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r98YAHB47Xh
	MfiI/5huX0dXgXP5vKN1jLFZtbn+H/NM=; b=AF/yX3SYRdjrA79vu8GgeMAor9S
	/2LueRRJY9AAOnspXWiDsJPdtUZ+igkzyee9SDw0RXv6LQ2+M/VHfFdTZeO2+XDU
	Y8IGQF9jdjm12NEXXHwM15dSD9TYs6rfmSkcvThFBXEGWUscUn3loPcEF8/6ODoB
	9rnLJUxHzItw9QLyTFN4gJGHMbwtdf5d/DhYngUMtIYeMqVHzSfp+3uULyoIfAIZ
	M/QAjRkSqyfBeljc0mL5DYa8ydEZ05JwMB9DjogBRee/7OT6rGlFVayOfUDbzBpE
	x3N3G6lK2KVZpxyoZPzqYWuCCQKfuypu6zGgHJG6voBkbAWzj5XIGOGgY9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg26p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so6115389a12.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784563390; x=1785168190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r98YAHB47XhMfiI/5huX0dXgXP5vKN1jLFZtbn+H/NM=;
        b=K6P8kTEsT+iFINFRYjSgodYF1Gq4UVRxk55HFAiOD/6LNiB41idHkFvM9MbiAjEYGs
         cc5HqEE+CM14RwPgFXHzW/wepBRU5LvbyoEg2BpwAVll7zcC7lWWeYsZ0usrs+ssIBPY
         XFKB2W7cvtPJMslUagBpQuz/GjRmyNCo4fRphM7WnL7TFyjyiXLkZ/5vQUS0/m9b5qMB
         olETpC0EEMyOyZBMflGEfSL27U/Ov4lIEXKpDZgBg9WaVnglwRKAmGupH6NqoRuA9BO8
         MlJVOoek/5hVNVNMoS4w0dv+41DHO9KkJJXx+StoYu1z0qI+c/IOQgiFvnJz054fICD1
         cKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563390; x=1785168190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r98YAHB47XhMfiI/5huX0dXgXP5vKN1jLFZtbn+H/NM=;
        b=fYBlcDxhC09TdBEcuio66SskIZwmwwSWBCfZVByISTIxVgiYqjJZupgAqN4loXHFux
         LhjUxeHU8JytXwV0ySAS6mRyAVjvXiZb7mE2SaIuR/hHK54bAI8eJ3fef3lTEmhRpQQF
         Yhg7pYM04AKdD3lGcryTx8uOQ+RfDe2Oe3y8P8TsbqbV/tB0bN/JtjJJd+RqDAOWLaOh
         hOH27ci13z/i/TUgWNQSfb64yskyhCVwDIFstexlJzbPFjclscr0Tb6hO7+fwzuuvpIz
         XSS2MYtU6a7XDtatJxMeXPTZK8CCPPaPq5+A3MA+pF9JlcIb2znJwm2Z+69ZAyFa5jhZ
         duqw==
X-Forwarded-Encrypted: i=1; AHgh+Rpe1ZLRCuvyyKsTwqNSy5PuC62h+tidev9JK4QkTm9vM6dSHN/TStjKuyT3lIYgy74OOOwSbcTeKhareA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJcXrDvK3Td/n1L6A+Qvgr2oi+kczoku1pvSl4Syor1YpDSzN
	DB/eil4cVHzStYkYD2VvfZ3a8HEIFEgeeuUdsZJCMQ6ac4ZLsFoMv372bDfBMSKlGcpzTrmk3mQ
	DtWXbPmEs8DMBWJH0afkXSMMX79RqWYDNfr+7SRRLGflhv/h9xtq06aQtCr8hK8EP5g==
X-Gm-Gg: AfdE7ckyvWjPpqVf68ct1FK6rjMKVg6Mm6gOPazovHjDppfp2fAefkb1DTQzsLGlgrH
	u2MXsVe1AYkb25hnoZO8pdybuB8oFWJFNr6D89nziFirVQJPCSRdiEbHVt7DNWnrX1YcbDHlgwG
	+u1JaW1BzVGLSdfmoSIORVY6L1axaxTgkX3FmJU3yCfZ055kX303Qcjn+3BVS4U/kkZMCufkjK1
	JJ2aEHeqzyqXnlq5voFHOFBo60xEPniUh/TyIUsD6/8Px7SoGjgwJmhUoNw2RVSZvOmnyOqgRtq
	C4hawnIrZBNgMZncucTE+PvBvwetVUIhTb4UqCLwj7a7HIea6cGo3t90yqGJAvRjzyQ40tm2/Kk
	I4snNfoV2rXCpPd9e6w6Mvi5kfyPqbV+EkmRg
X-Received: by 2002:a05:6a21:3983:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3c3ad6777damr14481901637.14.1784563389516;
        Mon, 20 Jul 2026 09:03:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:3983:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3c3ad6777damr14481835637.14.1784563388854;
        Mon, 20 Jul 2026 09:03:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm37616115eec.7.2026.07.20.09.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:03:08 -0700 (PDT)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Mon, 20 Jul 2026 21:32:25 +0530
Message-Id: <20260720160226.1026440-3-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3OCBTYWx0ZWRfX9ySJPMhY5m1J
 tIzsyzlQ+eptMrd/I8nGBsVA/r5dNBcM520WZEhNXptmevRzJ12+CY4WvJJG1hObKdcPU36olVZ
 FaIZrVMmvOAdiVp0Y6saszLcRkdD9oQ=
X-Proofpoint-GUID: quVc3wKP5nLEuvvOS-qvzS7cB9r5Pjix
X-Proofpoint-ORIG-GUID: quVc3wKP5nLEuvvOS-qvzS7cB9r5Pjix
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5e46be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=lGR961BgJX-Zf7vNLHcA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3OCBTYWx0ZWRfX262NPnFjU+gJ
 SJn804I5xryHzgfVccB9YhXHZYpRKDwpDdUhtp42WxF70SbrVk0GxqR9sQUERgdApVxG37hjbxa
 f2bYzeYjKWnIv6B2/Fdsde8rPbp9ud8n9fG6s+WKLS+cjfchmf0c0qViUvZNA/0f3g+GE4srje/
 J0fjvd5Rd2cwiycroJpGGOBYJPDkmK6aazKzjpeBeENcB43Vh3J+BLJ6AJXaRgsTSnHW3+/qahF
 IuWyMzSW2Hi4Oti/3IIB7Zn963EzzFhQxc0/q+ufq1QmJLKYlMEU7C4IH0ehj8MnhFbap0UU9a6
 2r9su1zaxQTvQZQzw5BJ7POR538SBCpALZgoHIZQLnlBXv6qblVJsagHLmG4N3V5KO+phZGJvtC
 pdtZRTKrCNBWIHcQE7px+t6lE8TI2ZkzPLAhhTfnn4eK+dMJ0uflPF1j7XoWIPjocT52dC5byS4
 +O8sKi+mGxgRVz59ELg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200178

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 194 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   4 +
 2 files changed, 196 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b283484d9..040b97f03897 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -2,10 +2,12 @@
 // Copyright (c) 2021, Linaro Limited
 
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -15,15 +17,64 @@
 #include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
+#include "q6prm.h"
 
 #define AUDIOREACH_BE_PCM_BASE	16
 
+struct q6apm_dai_priv_data {
+	struct clk *mclk;
+	struct clk *bclk;
+	struct clk *eclk;
+	bool mclk_enabled, bclk_enabled, eclk_enabled;
+};
+
 struct q6apm_lpass_dai_data {
 	struct q6apm_graph *graph[APM_PORT_MAX];
 	bool is_port_started[APM_PORT_MAX];
 	struct audioreach_module_config module_config[APM_PORT_MAX];
+	struct q6apm_dai_priv_data priv[APM_PORT_MAX];
 };
 
+static void q6apm_lpass_dai_disable_clocks(struct q6apm_lpass_dai_data *dai_data, int id)
+{
+	if (dai_data->priv[id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].mclk);
+		dai_data->priv[id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].bclk);
+		dai_data->priv[id].bclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].eclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].eclk);
+		dai_data->priv[id].eclk_enabled = false;
+	}
+}
+
+static void q6apm_lpass_dai_put_clocks(struct q6apm_lpass_dai_data *dai_data)
+{
+	int i;
+
+	for (i = 0; i < APM_PORT_MAX; i++) {
+		q6apm_lpass_dai_disable_clocks(dai_data, i);
+
+		if (dai_data->priv[i].mclk) {
+			clk_put(dai_data->priv[i].mclk);
+			dai_data->priv[i].mclk = NULL;
+		}
+		if (dai_data->priv[i].bclk) {
+			clk_put(dai_data->priv[i].bclk);
+			dai_data->priv[i].bclk = NULL;
+		}
+		if (dai_data->priv[i].eclk) {
+			clk_put(dai_data->priv[i].eclk);
+			dai_data->priv[i].eclk = NULL;
+		}
+	}
+}
+
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				 unsigned int tx_num,
 				 const unsigned int *tx_ch_mask,
@@ -251,6 +302,66 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	return 0;
 }
 
+static int q6i2s_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return q6apm_lpass_dai_startup(substream, dai);
+}
+
+static void q6i2s_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+
+	q6apm_lpass_dai_shutdown(substream, dai);
+	q6apm_lpass_dai_disable_clocks(dai_data, dai->id);
+}
+
+static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct clk *sysclk = NULL;
+	bool *enabled = NULL;
+	int ret = 0;
+
+	switch (clk_id) {
+	case LPAIF_MI2S_MCLK:
+		sysclk = dai_data->priv[dai->id].mclk;
+		enabled = &dai_data->priv[dai->id].mclk_enabled;
+		break;
+	case LPAIF_MI2S_BCLK:
+		sysclk = dai_data->priv[dai->id].bclk;
+		enabled = &dai_data->priv[dai->id].bclk_enabled;
+		break;
+	case LPAIF_MI2S_ECLK:
+		sysclk = dai_data->priv[dai->id].eclk;
+		enabled = &dai_data->priv[dai->id].eclk_enabled;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sysclk) {
+		ret = clk_set_rate(sysclk, freq);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to set rate (%d) for sysclk %d\n",
+				freq, clk_id);
+			return ret;
+		}
+
+		if (*enabled)
+			return 0;
+
+		ret = clk_prepare_enable(sysclk);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
+			return ret;
+		}
+
+		*enabled = true;
+	}
+
+	return ret;
+}
+
 static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -272,11 +383,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
-	.startup	= q6apm_lpass_dai_startup,
-	.shutdown	= q6apm_lpass_dai_shutdown,
+	.startup	= q6i2s_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
@@ -297,6 +409,76 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
 };
 
+static int of_q6apm_parse_dai_data(struct device *dev,
+				   struct q6apm_lpass_dai_data *data)
+{
+	int ret;
+
+	for_each_child_of_node_scoped(dev->of_node, node) {
+		struct q6apm_dai_priv_data *priv;
+		int id;
+
+		ret = of_property_read_u32(node, "reg", &id);
+		if (ret || id < 0 || id >= APM_PORT_MAX) {
+			dev_err(dev, "valid dai id not found:%d\n", ret);
+			continue;
+		}
+
+		switch (id) {
+		/* MI2S specific properties */
+		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+			priv = &data->priv[id];
+			priv->mclk = of_clk_get_by_name(node, "mclk");
+			if (IS_ERR(priv->mclk)) {
+				int err = PTR_ERR(priv->mclk);
+
+				priv->mclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s mclk\n");
+				}
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				int err = PTR_ERR(priv->bclk);
+
+				priv->bclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s bclk\n");
+				}
+			}
+
+			priv->eclk = of_clk_get_by_name(node, "eclk");
+			if (IS_ERR(priv->eclk)) {
+				int err = PTR_ERR(priv->eclk);
+
+				priv->eclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s eclk\n");
+				}
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void q6apm_lpass_dai_clocks_action(void *data)
+{
+	q6apm_lpass_dai_put_clocks(data);
+}
+
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -304,12 +486,20 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_driver *dais;
 	struct device *dev = &pdev->dev;
 	int num_dais;
+	int ret;
 
 	dai_data = devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
 	if (!dai_data)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, dai_data);
+	ret = of_q6apm_parse_dai_data(dev, dai_data);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, q6apm_lpass_dai_clocks_action, dai_data);
+	if (ret)
+		return ret;
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a32086fe..bbbe6d368a41 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -3,6 +3,10 @@
 #ifndef __Q6PRM_H__
 #define __Q6PRM_H__
 
+#define LPAIF_MI2S_MCLK 1
+#define LPAIF_MI2S_BCLK 2
+#define LPAIF_MI2S_ECLK 3
+
 /* Clock ID for Primary I2S IBIT */
 #define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
 /* Clock ID for Primary I2S EBIT */
-- 
2.34.1

