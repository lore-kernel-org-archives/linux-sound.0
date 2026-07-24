Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232E446857
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917520; cv=none; b=HE20JXElaCp+0xiqB30qp+3JtEOgLvsrMKIOq0Su64TiCS0gQhlgbeZ9hIzMGjbAXqifiPldjg2bizVPiAOnpP8KrklflWRe9Vd5HMSFj5NkekIyAWBh2jt2NRVFWsTi2I/l5fGHuEKEEDeS7Owh+aS03qWFkSyuUasiNs7/Mdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917520; c=relaxed/simple;
	bh=Msn43J0TrnGLj1kHOGx0r+3kSga//Mgw+RDvad5R80k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rFLUeZYGk73gBOXnYZhahYoSGsKhNKwcYjExAIuZbFFN+SVfQsJZTcmqm+LYg0jWATJt5SiMC7nIqWkydUXTaAl/lltJw+XVH5lnLKGCJSzW8UzDmu4QD3neNwaa1cBdvaJROgTiNxKlFWI+3ZluKXojm23YRc8J/Z+f0nYPeR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+BCGYbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUmG7o/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+BCGYbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUmG7o/5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqSaw3755215
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FAMn0DIoJ0k
	GBfXrUsli8TdU0bnIzXlv7A+FI69h2X0=; b=G+BCGYbnYjBxvR3GPqjZso865YG
	hfy4EQSIZCpg2CeMT7Po6LiOl9YYR+9VfAw/96tqix0qA+L7muq4XUZ6IND0xAgZ
	lAPkyA90MG6//CogGFEPN3Grx1soEAbRPXjKwtmathXC5w95VlosBAr6WvNlPPMn
	L0w10/rbNYd3TAozBxfHyAw+r36RHDllApFY/B5/Ma9cPuSjplogeZPP8oaDzf8V
	i/lF3muy0Bi23sDlf8dhmCQL9ezZlObUoRsWeVHxUJaWZxLzl4SeEEjq4mUUwWou
	sPf2oOkKiwV1BozXLZCys1juXGulrwY4ElMPhOaEIAzYjw4fw31OF5tpAmg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmb9nrfrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso756053b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917517; x=1785522317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAMn0DIoJ0kGBfXrUsli8TdU0bnIzXlv7A+FI69h2X0=;
        b=YUmG7o/5op4f2tHkkiCljafgOR2ayjJx4JEs8zctabBbytK6ZRYGW5LjF/18BW0WuM
         5tUYAmpgLADqlyLE9swaqbH6n6N1gQG64lBFtexQf2FLpJnPHC/u26RMDlIAw7CN1BaW
         1woxoDqbpgfu2xk6viMtyV5B6n9bh9//7Es/i9DMYesB9fkkiUtlyxpyKmeLCRjdk+jX
         FNPCmsRXzFkF46lCY1/mu3jqBbP/O8QGZDMLgbaACv3ns6dKuZT8Dc3WYL/bhbFvp2la
         7/DFQkLdUCL1X2fzwC8qWASpRV7CN1bYxeSHtFRRRFmAU7JZspymENk9hc/TIk+SxnTn
         IbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917517; x=1785522317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAMn0DIoJ0kGBfXrUsli8TdU0bnIzXlv7A+FI69h2X0=;
        b=Ml7Jr6D2Q1y0oPifNBy1cZ0JlopR87V9dDJIVrklj19e2F5JQomipDchVDUlcesir6
         uNbDcRp09ZSGyZK14cmDKboLiPl9yjFPbYC5vqff6vRpuoFBmSKnXBQBnL9Kjp/tN8yK
         eaG1lYZHIEITLLb/QiRSGOy2wH+dYftv9HrcIYIzbVG0bOPxCJLRT3rM8Fjj+cfvIdyr
         U/OU44gtM2kx+IkyvzqqFizLulg+wOftYLLRs8Ql1PCK9GOGkwWsdgmeBf7cSf5srioV
         BG2/ibxH5Q7ScKEH6/OMy1d6Ju1vLoaFGzvKyqs00kbj4Yo5HkWZWMJ6RXOVCgvA5S6n
         StbA==
X-Forwarded-Encrypted: i=1; AHgh+Rrhmky1BJOwGZT/wbQ6unY/1+y0IE3pTBPxG/wcvzLkn4+SzIRikzGtNNeuS7xOg2cRqIq9aYawhSDaYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cc3dkhm8iFHk0U/SrKu4yldcsyKAJgbM1K/fircuy2HLp9AU
	SpGymFFcUjx46RmIQ53e58VUTOcjTs13N59nfz6aZRRT2HJufvwx60OlNv7FHMBlpOh5OykbA8N
	nXh4vsLUNI8WaUDvZ4YgswzgFJ8er1ewsfuldzxhQdhchpxeDJZFwtyFWbGHpN/Gi1w==
X-Gm-Gg: AR+sD12yU1+h4mvPnyIWzJctMA5vRs4d1e83L4hzbFlC79brIpwr2lLJQgESRlXglP1
	kBEVja5uuE88IluYljCupaeW0sM3QCTKuc5MFliJvl178VBDJ8iEP6iWYqfcjx3qbdYYuWRDm4b
	6B7HcALscWjzTi5HxCxbPIgtaiQjju4zOTbDRs3O0keYLImQ6WfgoI7YcAFZcsWq73PrgNDsIlK
	OgFExdMFe6wxiDnCk7yF8unedQdp8atizqyK5rYRGSvz9oucr8V04jk1ND1hhJtrVzvVT0h7Cnc
	pq0+cbQld5DDsjRGWhCUxvcr94ewXAZ/fOYyOswE27htWt0Dsc6pumEuv8bc/zHEjGMcyoDyGX5
	3SSJuz5cW/ft+pYcdgU3dqe9ekM3e5bv5q6F0
X-Received: by 2002:a05:6a21:a8d:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c44b078667mr8854228637.34.1784917516991;
        Fri, 24 Jul 2026 11:25:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8d:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c44b078667mr8854195637.34.1784917516555;
        Fri, 24 Jul 2026 11:25:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a67f3sm1669324eec.29.2026.07.24.11.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:25:16 -0700 (PDT)
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
Subject: [PATCH v7 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Fri, 24 Jul 2026 23:54:45 +0530
Message-Id: <20260724182446.1484894-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XeS5Co55 c=1 sm=1 tr=0 ts=6a63ae0e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=7K0g8EdguqLjfqVUVIwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: x9G8z8O_TmP7BlEGXydzc1WEgHGlfirM
X-Proofpoint-ORIG-GUID: x9G8z8O_TmP7BlEGXydzc1WEgHGlfirM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX9iinbqon2a2m
 y/ww8IgPj85gekOfpzVI2seSK84eb8MfWCY5n+IWCMj6JXP9Kn2qXkJ2n/VQoH7IM4K5p7v5Ul5
 C/zmeJaLyRg1gOkJ7KnJaNufqk7lZtg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX0kxMef/Y7Gau
 5ZmtXktcBRiOg9dR7Jnm/kRxGBxWZ0Az7iFYa1SeNIkaDLuGWgIGrY/fvQ2rGqG6Uc4plVGE47C
 HbSOdYajrC+atSqkM32pK4TItoUyigDVUrYBnijQwLTVGtKjbr52RJyjURVKBTExPNABQ4gbU5S
 fdtFzyi1Iim/9yOmqhVrkFm3FShrwnma/7K/clzHu+h3uIGsWJYKFHrMr0w0iLZpA31zqQcCEql
 EQuadqcUuPyWxF1ewctehq0E3UlboDSfeKcxmJucbBpvcOHchVEQDqrXJi75IEafpFRmjBWpPpF
 HDDrA25693AURFdBsI1aIIhODifysfLJ6BisrR4VNFAsKRSxd17SXCvRADAkaUVhuUEx6kuuaya
 H3hmf3UCnnqZoQCY9o8ZsdC9G1Cbv1pIQrYc1T1vNHUg7A7pDiQoJ9Iur/Y0e0d1HFORCs7b4xw
 /ouVgnqP5nFTPH9Oqpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240165

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
now retrieves its clock handles from the device tree, allowing per-port
clock configuration and proper enable/disable during startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 168 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   3 +
 2 files changed, 169 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b283484d9..e68e8b000e07 100644
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
@@ -15,15 +17,54 @@
 #include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
+#include "q6prm.h"
 
 #define AUDIOREACH_BE_PCM_BASE	16
 
+struct q6apm_dai_priv_data {
+	struct clk *mclk;
+	struct clk *bclk;
+	bool mclk_enabled, bclk_enabled;
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
+	}
+}
+
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				 unsigned int tx_num,
 				 const unsigned int *tx_ch_mask,
@@ -251,6 +292,62 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
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
@@ -272,11 +369,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
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
 
@@ -297,6 +395,64 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
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
@@ -304,12 +460,20 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
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
index a988a32086fe..bc5b9fa13283 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -3,6 +3,9 @@
 #ifndef __Q6PRM_H__
 #define __Q6PRM_H__
 
+#define LPAIF_MI2S_MCLK 1
+#define LPAIF_MI2S_BCLK 2
+
 /* Clock ID for Primary I2S IBIT */
 #define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
 /* Clock ID for Primary I2S EBIT */
-- 
2.34.1

