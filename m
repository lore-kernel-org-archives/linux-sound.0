Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692E33F44DC
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040802; cv=none; b=ZLve67cRxu0QQ0bMIpXFEqWtqyhcJO+i+74vf6WH2S6pq5AnC+xWrMoLIjVQvkFIq5bykSvfldKs6wlLiINg1kZZ2r7G766WnPX/zHwg3Dug5GGt3KRQ+/K5VXrYtrGrWTlBobWZyE8Kt4Ofxu4ArfecnM+4rRjKRYbXEe5niMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040802; c=relaxed/simple;
	bh=xrwaAHbnVExHsqHGYhJkGbQsEOoKu1dBqwSOTP4njNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lMSaumAkGFYBcUCOUwxkdJHkfDhExQVqHjw6MltCa17l6oIR9h+x2egoavnBuQPlA2vG33hgte/vufqdNHzNJ8yfpNAvNsPSm1Q5ZhHko/0+dH7bFzR7cNdRetXaZmuSSRbWgUPJeI0RIxx6s5GULJp2ocRgwRnDOJ6s9JpkdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjM5G7uD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsyjFDr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjM5G7uD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsyjFDr/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcVRI772131
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 14:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=njyQPlyf1rk
	av6QBwZPOvqqqPVwldTUvErL1mc4lwao=; b=kjM5G7uDZkpPQwBMUncGqjL8bh0
	K5n4xmxrGHXbfcp1mbnZEQ9qbhQhdY7k0lFns+ZEkUeVeuCDLgoGmsuiBnSh+jQS
	a2hA6qWJje4shxnr4QYpsMh6CIA8TB8IpkObcJpWxKIaAM/IXciCndZh6/Dqmy2r
	bZKzM6mmBLUVd9dNF09KekuCUvLT0Keh2VBWQ0d6dQ3PCpsUZ4emJLL7p6NdO+YG
	BokMLC81TBR14HbJ2F1cu5I74jwpg+Gzbzsu2UmBYr5h1YI7dWv3zxAfYF8lFcrF
	7Iu7m7L6RH1d2xiohlb1f0eko/WnCi/7Qq37i4WBG0x/s1Tc0045PNoBRmA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq1rnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 14:53:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so6572602a12.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040794; x=1784645594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njyQPlyf1rkav6QBwZPOvqqqPVwldTUvErL1mc4lwao=;
        b=RsyjFDr/2ATtRobXEgNUtPwrrP/IO1KrVJ1WxmQcnOkGu0iJUTNQUKfTZf0Cf2xX/B
         cAwbkIcEE8UfkosDpM/nu7lSKeAVc44S1QEDwqcNcexWHj8ygYRsAoxVUqOfEFXyz+U9
         49LMyXdhxla4kP3kJnkTMJkLabfQB3BMj0zGU4ZpWQjl+4LZflPoXD9Y023RfVZxO/Ic
         Q3rC3UJdR6C0ccTHHZ3ZYSg9JPZpQELEb8RDQfylQM6FpFuwd8D2/gWs14JfhfQt09F7
         DAdpompsdwj3tjsowQHHLkhf3wONjJXchpq4c+FIUnf6DdKgGpiLlP1lCdCmAraQuhsk
         9wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040794; x=1784645594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=njyQPlyf1rkav6QBwZPOvqqqPVwldTUvErL1mc4lwao=;
        b=jjv8yUHFpRYfhyOob7TDQV999EOcXQOO1UdzfZTRIya2i+rPm3LqXIKyW9S6BzKksb
         PIPS8+juOpzlq17gwQOzM1HjG2vYcXEiOwnCNCQ1lF8vwjns+n+W5VZS9vuJEJxUKsA5
         iBOvGjvIdFRt/u6pP8IkUDv3hry4SqFHPAW3RWcc0mSDaQeiLiPdI0Frvd5utIfJZm5b
         34ydy4rHzZIvabl6Vo+0u8kdXGfpBhIPYheiHPfMYaWqYfaFEazSuLjRJNgMNsG+dpwb
         euCX1DSZR/U+mYKg8FbX//Woaax99tstHt5cqMuvbHltzWtYZtwQbapd1WpT1F8RFzMo
         kJnA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8QEoHv+3TaStJt9VxzyviozqXA9TwZGn1KjVlXeFVgSfi0KN2qqQ0GXr1V3cPdZ69t7JY5DDvBkFi1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCy6TDIAL9BmPicrtzoifeap880P+sJLEcgCXf6m3iJG7HcnbN
	YiTgm2yhtK62d+DAxDSTPE5zUKzGKOrRhhjB6tDI8tBkmRu69SbNgGZ7IN54y+MBARdi7e41nlp
	7Q2SZWa27KhbLnHsRT3PN0Vg+IE28fTtZjQGB3OUByh8Dsw2SDII+2wYCWk99+Vy2Ow==
X-Gm-Gg: AfdE7ckbGks9lhqPGkcK9xWnqonQxUoYdY74Oj4V2iomwqdiBYJczQpixvR3FcF6AwC
	h6sPYfVU9GmFsVU6Hzn99EV8KJztFPrFFDZRXcrNvvQydsrzQcqLPgkl//kaRn+aeeStFG698pn
	PFTb+FEx6+xFWL5k5k+x+SVvotoUmQPx+ZEd7C+6flflP2jQUK2athAutwt4/nUiVwMP44aKOMu
	WIipJW4sX5pEKUg//qMrel8Mupver8dvymUjmjqemALHfOy4iWfNDcukUGRgl/0jRGVBiJZsEvb
	5rtgb1zAMK0/sPhJ0Ypkca7L/VfQxlOyzF8Aw3FWAKPL2AKRRS3+cpx1m4nNvygsYyTbyAYkZoE
	idyvbDDy7R9726/fJdBQPwJQPjuwyckVZDX1meDaqPJhXPS0=
X-Received: by 2002:a05:6a21:339a:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3c11029a002mr18498857637.24.1784040793606;
        Tue, 14 Jul 2026 07:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3c11029a002mr18498800637.24.1784040793022;
        Tue, 14 Jul 2026 07:53:13 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:12 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Tue, 14 Jul 2026 20:22:49 +0530
Message-Id: <20260714145250.2473461-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfXz0O8jKSxU6Ua
 YaG6Ek1i1x3q+bkLM+K8bqNzb+tfgpLTbdwjI91O0+vOKpS4jq3oQEIg2ARnto/9sooLpUvH0Hb
 Pd93qa6Hl/UJJtLU8qUemjOMjlrEi69ocKgYbu9LoXUXvRZN48VPmQqpg6LKYhUKny/7hrzrCh2
 TH1gKGpIsGiG3HTDG6CDjBO72vSyuGs4T3aRQB+DKQomVdeDJS3+ukzbnI99FoXSFRnPyL3Mgp4
 NpxRuX1W6TcDMowHnHow4jUh+fzpqPhoLoRtLBEsXcmup16rMX4zXOo3h7kh7uk1ja06zRc9EqS
 CQs1YXCHSJJdLT/3l89+b9pO6n5Cg7T/4hce265OdwVuf7cbQrt9YhW7OoOcAf4y0qAgGLKbfzv
 IIA0nBRCMnW+HUsfJk0r2OgIGS9MrsYMBBuSCkQfERAK/sVCV6mvoJaRCB/aX1DwTbX/4/+tQjp
 9QIIUpF2gxHXgfrb7nA==
X-Proofpoint-GUID: XwSfPGUrdTy7LJOMoZyUJ6S4WQ4mhGCV
X-Proofpoint-ORIG-GUID: XwSfPGUrdTy7LJOMoZyUJ6S4WQ4mhGCV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX7LDf4imGaH7X
 3Nv1VSeReFpBbatsjACNo5xF5hAsWelWsHK27PmVVKPgv1KrS7EJnVoRpvkvIDpnaSzQd++hHef
 +qnzi1jPgz+DpZgupCe/ZtAZybl/qKM=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a564d5a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=lGR961BgJX-Zf7vNLHcA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140155

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
index 006b28348..040b97f03 100644
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
index a988a3208..bbbe6d368 100644
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

