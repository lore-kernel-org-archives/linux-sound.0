Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F554189CC
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344052; cv=none; b=WRDesrhN9esHb+cP9Lsk+SoEXPP6PVSVb9BrLKCSz+Shi1UWCefSliHBixlRZnVhEwbLQAt9dzbOhGXiEdSjJY3Oejypqdxa3y1PX2P6NkMHDYGy2Ko7V1BwpiHmfbg6uvE5sEyV6qz7NAC/5brLg54RuO7YZ6j5vH2y5bF+wUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344052; c=relaxed/simple;
	bh=6hfv342IUtEPa2MU3Q4/ovah21927enc2/Hs20llxvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NPn7k5kxz0PZ62kOZ1RJMtSsoI/J7hsY2o5fM8It5WighjDk0UYiAb7F/jCQ8MQfUIgklSpASqmLp+w+fPPMi5VTsbCKjs3tPSjRw+spxdKruCxDX1N48XjMVWFr600QJTCncKGh+tlo90TnnmbJJGabIyo3C+TpoR+kr35spUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0hxsFsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyNh4u3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0hxsFsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyNh4u3o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxViJ219069
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 13:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hLZPZMqCkve
	G8lA2J9FgLK3lzGJf9THVZM6g5V6qvg8=; b=X0hxsFsblrCFgFusq+8t8jHIc4w
	rPRIKGefySlWwc8hQdlKnalIWcHQG0Fp/f9U/nYM3U/W1lUNFDG0L8zUWHRBrRhj
	yROOgUtbCRsiasNjHQN5fdz0l/7kkFMb2LTJ7jeVI125KL1v/DRssK2gkeeuHu/g
	4qnhkc/2NDxe9A3zGhAA+MdkvTYBlu0Im+9Y+Mod7pHJIN/kinEUrvUKvA4JgY70
	6sLqTcAKCKpmpuTv0w3t5Xm6mBtno+R6Byt8NW8+a8eFhaO2fYDufuZPSnf7vl8e
	CqWzYfjB7rBi94teXjpYiZJsibSyok07b4qd65SajUAeGpB6A4OVfXFEHBw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs9852-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 13:20:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so39937255ad.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344042; x=1783948842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLZPZMqCkveG8lA2J9FgLK3lzGJf9THVZM6g5V6qvg8=;
        b=dyNh4u3oMyq2Rrdl1aYPWefLtKje7sVIWQEcUk9uDVcC0usaf2/yktOrTUYCxGaeba
         PVgTHlh5SD9uKvZUp5ZRh+fOrm4X+ISMCOrwYCKGQS1N5pUJ8y2etUSssCpCg+O0QDV+
         BEpnZTgQ7b/sv8mMAWa0+f/Mv4Rhu6MmbMCwYZG4YAv0noteAN+cdAW74tZO83w3kZm3
         PiEdRoTnElEBigZ16l5K45yv1gL4uCqJ15EZUR/0FPx9ssBceaiqKIQOjXDVNKo0tRse
         A+WCLU2ykw0/V5icYR07Y5xtbw14ZJk6TDjLeP4/tkCff0VyuTwlIYYnbpXjFpenTJz3
         0j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344042; x=1783948842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLZPZMqCkveG8lA2J9FgLK3lzGJf9THVZM6g5V6qvg8=;
        b=pDsIBuzISAST0mIluK7IapekBBCK+AXuRg2+3odwdvAgNYC3+Dkwi6Bx9iY5gEWN3S
         /slqaM57U0fk3kzaFqfL77+gaXPE9iX8ie3znnURdkiTISlXqCp+Ve1c71lPN9hyunQf
         wM+3IUMEcrzCyfJdcrvyEl0zGe1S5LBeYB4jDubIAs3NqE6Su/Txl0OXPradGAgLYCwb
         ITaaJYlD/Rm9SQLwAVuzCkDi6qiz4jnyZr3HT3NqnV45X799vYD2U74ePWMrzUHAikLJ
         H3gW8pD74NzIHuexhY5NwF6c8hgOH42y0hZYXXbHW/XZIn6ySXDtwb7tzwlSnATOEFEg
         ljyw==
X-Forwarded-Encrypted: i=1; AHgh+Rp42pbe2NDNXlm5PMmz4XrsLzNwVmoJC+bPAaYe3i7FIko9W+93WxfzIXipeDvyhEpQiixbRhmXmiHHBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SXXZ8kXML6Y70zR/I2X/xw6uzTT5kMHOxZs6VyCamS31EqX4
	ZNMmPe8XUPyBSxxGNhPgeHc0VYRqXNrV3x3wEibaWXqo+rv//wTO6h5hMhq8uoaYzG/2Dpyt8XV
	y8GKb//q/kFI6EWInYrPHxsUSreLVR8OF4yEgpCpreGOxdd2Z3Y7jw2XIU1VrB65dTtZRWH7WTg
	==
X-Gm-Gg: AfdE7clsF1xAXsiEfCLr7dUxpgJa8+/cCgoLwRU6oLtgG3YVh43pZBFYbYuTgeOs2hL
	jLciiGGUsoL6O0KwpRm+L720fRfiED8heZ48T4lw9lXsfJ5RH3FfiX6/2blqLcogp3Bj2GGOIkW
	4PuueipQVeZAc83FpDcghJ1aEsuodUslEHQZJCS9TFW37dUqMLVvlss9Y06oB0cX3Gmq6rMVxXA
	5+DsxD5a3qDJCn7ncJOUSGMtLfZfkufzzd8x+WlOP5Pke5YpyBkfjWOh49PoJbI2pw24JehZrxs
	kgyXYU7m7qUoq5giXZc+zHt7yf3Kw1qrrbbYgo7F0hSWsH6+hQFOi+tIg3qrVuViFdoxGJVh4c8
	pdNgjNhLS7QlC5Kx6+FgBKPDJonYzhJKatKvWQgti25k6jqk=
X-Received: by 2002:a17:902:dac4:b0:2c8:1c3e:9636 with SMTP id d9443c01a7336-2ccbf07a9b2mr4506325ad.25.1783344041777;
        Mon, 06 Jul 2026 06:20:41 -0700 (PDT)
X-Received: by 2002:a17:902:dac4:b0:2c8:1c3e:9636 with SMTP id d9443c01a7336-2ccbf07a9b2mr4505735ad.25.1783344041239;
        Mon, 06 Jul 2026 06:20:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
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
Subject: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Mon,  6 Jul 2026 18:50:08 +0530
Message-Id: <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FdKzcV1xTJsr4FUBAd4S5u83IQVzQrFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX2QrRC/pbWL26
 yY33Fcgh+H9OamivCtYJVh4zGroyp6PzMCOakZkn+LqLsoYYCx5tjzkZBmiV/Yl/R/4IQyYkUEd
 LYnldcXkUg7LY/IyYlvfxB3rBGNFGbahvrfcxsRmvldCH5xNNq3U9seKPR4+aHgRJL/Yi4g58Wf
 cPlYyU3YZwELu1HrrPf9PVt/T0lr01tht8Jh9BmTvrfo6Nyjz4Y82+HonSQOcI4imXjFn8vlWeV
 DkCtLsixbSRXfpvVETZre5Uu8Vh629Rs7JXaG/WUFomVLellwnbXxA4Z8anps/HxSqXTh1R3YRj
 r2yJq5QhXQ8G2hySmHmN71EPGefu9AxNVjzhFgwq1jaRKuG64/ebxkBUegIfgDRav41YeiYCL85
 xTzGCZ5Y+N9PlH5CRPLuP2nVM8BnABYtWPgC0vzCSQcQh9n857XAsqjurzDRqeSwlpdWRtFXljO
 3kLXO51Gn8Tmo4oaCpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX0FOXDRYCPfj4
 IQY8YkZDkkG+C3fa3AWvq+FHKh+ncUNiezxF00XKCNc0yI13u5lc3lLWhyMvq7IAyxoUsQu0l6C
 fGWXUP6Ko1rjtKyKLiAJYMKN3EGbr1I=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4babaa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DOUKto0bFsDsfaAjmJ4A:9 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FdKzcV1xTJsr4FUBAd4S5u83IQVzQrFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

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
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 154 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   4 +
 2 files changed, 156 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b283484d9..461e65526506 100644
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
@@ -15,13 +17,22 @@
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
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
@@ -251,6 +262,73 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
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
+	if (dai_data->priv[dai->id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].mclk);
+		dai_data->priv[dai->id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[dai->id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].bclk);
+		dai_data->priv[dai->id].bclk_enabled = false;
+	}
+
+	if (dai_data->priv[dai->id].eclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].eclk);
+		dai_data->priv[dai->id].eclk_enabled = false;
+	}
+	q6apm_lpass_dai_shutdown(substream, dai);
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
+		if (*enabled)
+			return 0;
+
+		clk_set_rate(sysclk, freq);
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
@@ -272,11 +350,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
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
 
@@ -297,6 +376,73 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
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
+				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->mclk),
+							     "unable to get mi2s mclk\n");
+				priv->mclk = NULL;
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				if (PTR_ERR(priv->bclk) == -EPROBE_DEFER) {
+					if (priv->mclk) {
+						clk_put(priv->mclk);
+						priv->mclk = NULL;
+					}
+					return dev_err_probe(dev, PTR_ERR(priv->bclk),
+							     "unable to get mi2s bclk\n");
+				}
+				priv->bclk = NULL;
+			}
+
+			priv->eclk = of_clk_get_by_name(node, "eclk");
+			if (IS_ERR(priv->eclk)) {
+				if (PTR_ERR(priv->eclk) == -EPROBE_DEFER) {
+					if (priv->mclk) {
+						clk_put(priv->mclk);
+						priv->mclk = NULL;
+					}
+					if (priv->bclk) {
+						clk_put(priv->bclk);
+						priv->bclk = NULL;
+					}
+					return dev_err_probe(dev, PTR_ERR(priv->eclk),
+							     "unable to get mi2s eclk\n");
+				}
+				priv->eclk = NULL;
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
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -304,12 +450,16 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
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

