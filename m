Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037AF4A33F2
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052597; cv=none; b=tKG+wvsth51OIrWxP4PkhPcLNl+WETdG++jtLamCB6uC+F6FtqGoB+OWkADiBKT3iogeZNFsC7T8A7vRkDFBu9wlvHt/TeFhgqBp32R4Ic7KAVniSztGC1mM6JIaa8VdUjFjgcOKxXkWJUt2WXjeiSPZOZ+qiNaLhkVWmCxv4M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052597; c=relaxed/simple;
	bh=fa/y86gJb3ZXbdqQ9LLgPTjgpebbvibPtDfTyIpyeRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+Mw+bhdf4l9Eir9BEh6jnSDDuDa5GtsGCJBS450MrozRyp0Z8xNSUqXL9fBmJPOR6xfab6Ay3OIlvDz+VlWYcAq+KvRCnAuC9YYhNCDyMZbpeVl7zilorjAdOO5Ag8jKBe9cuOFcBI1EjroVea/K5iRRi56EETgC8d2RgxjfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnIdsC2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKdH4Avp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnIdsC2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKdH4Avp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AEW5hj2057684
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=; b=UnIdsC2IuGeC9kAJ
	JIuaj8rteAfoZ0MIO5uEVBDVJn4mD/EDQBnegLS+ewJJNwYFYek7DMS1M9ZSbTgp
	zWiO1iPt3UiQB4hR9BpMRbOSV/D4B/mR51MGzCHWPjrLoZk08hlGh+I6rSHEnwvB
	A0MaqpB9eK+5vpNhppFU1eOBEj6OOQ5sQl3YKXK1wBd3Ct9S6ZQkY7RWGMg41zxp
	hhvELklPWaqxs/Ye09ja7m6BVNnOW24VCSnu6cljObMYeP9c8T3m5XYLOfpkSnFI
	QtUYKTG0syF6pPQcXVQBzpmwoZb5XeFv0oNTrm6zze54C6oDO23nkwnvD60yKS/m
	IlRwhQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8r6r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:03:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86261e66700so2362360b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052594; x=1789657394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=;
        b=KKdH4AvplEmAMsyzf0MCjSXDgmuRXmNpudP1bcvuePWS0aAGEU7e3ZFUTyFb0YB6+5
         erM45CVuwEqQf/ShsSASTH+SMMs/9knCKioucWX04320l03Ej89ZomPGccnn/pvoPO6c
         ugvUqt61FJn+uguzPipCx6JBH4zyWzB82F4S8jHF47+AjSqkZgQohdlFQtzIfW7/taEK
         Jvj5tD2RL5wHsR8+nhAQBp+2ZHDwfXMVn9CRejNw6w1iZpbVakJqAMHiRSXrkGIxWeI9
         2Nk5zf/Si8f42aA363ohQJtG+4z0+T6Q92QMfajLNtiak858OBIRZ7g7vBgqwV5SXRs1
         kHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052594; x=1789657394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=;
        b=Z/EF62PMD3gPq+2wmnxsVPcVoBLRjJslKX9ZxqPO7RH5eiAxqzuA32cjSM+2Kj9ukX
         7uV7VOIZZrWyN+Bwdq/Rb0qQ5HKaTIYXtAFl3K8OZWHOhPSXuG+U9MgKdwsABwkjz36q
         D8h2eIKBaIBovRgYWHry+Z6gfjO3ctL467HTexF26GnqX7z7eGXnqKWlomf6NlcivGvQ
         aDyrUek8h6GCjeJjRBNyJ58YKcxsBcUEhmCBFoCnKlETjBq+A2OL1tRrr5cxyu9morzF
         e94EvO9GY5N0AveLu+U1S1ua7czQBbMkA4q8971vZ6ivAV/XZQU0vjbyTV6OqQQCKamS
         pTzw==
X-Forwarded-Encrypted: i=1; AKwUvBw6qqprD87bpL04MHL2f9VQmazcmojStudyB+SQL9jKdlKPobOwaQ2iJypCAtKEIBFI0iM3vM5vJi9cgA==@vger.kernel.org
X-Gm-Message-State: AFuF++mATQBNPspvUm9zhR1fXXGp6fbZdVQSGPSsGGaYeOhiKC0IFdLX
	e24DyZJUWAGCR+/tXVm1ScUi7a4JFlm+y1jb+DOuryDIDPnzCz8DqTTaENFnp7H38k12rTL7biS
	kLbLu+FDDMMxXteWvAFIR9EdaCjtd7zjUHOMgf1mw88I/OPkOR3uHChqDWyP+FnasYA==
X-Gm-Gg: AYBFou08PHer8WHxbaeGe0ttqclaWD3L7k/lXS0ilR61E9Y+yW55t4hZX5lUk2tCbfb
	rifxCXKUKJiWS0QjCHfw44Q67Q+38g/N4w3zEVKrSVxEGVf9FqzyYQEVwlA9BTjNHkm7w7woVzI
	kQ9KsWzdaZmXf8bBN6rgbmoobpYQqf24AaieDBUpDywDrQ5Cq/tM+bford1WEMB9HwSqtvrBBsA
	Qb8a1AgpJjtPr0fy6JI2Nd1deT95zJhMthsfgaCBMEObxVwdGVz9TKcwECWxOUik1LITMTNQxZm
	Uw0/l8e7Wg9D44AXShgckEHCpbjnONRfYLToI6Cezf8JSXOXHXdCPa9JGtbHOmLKUCKjkH7DddI
	JleF2IEDf4y0ggKJafOVaJB8XpYF4
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr60320334b3a.4.1789052594062;
        Thu, 10 Sep 2026 08:03:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr60320019b3a.4.1789052592419;
        Thu, 10 Sep 2026 08:03:12 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:12 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:39 +0530
Subject: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: fy6dx_d73QEzGgGi--YP7mEiMZSWSpsJ
X-Proofpoint-GUID: fy6dx_d73QEzGgGi--YP7mEiMZSWSpsJ
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa2c6b3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Y6OeQYGgH-sQqnr-fK4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX8dT9Gg9etgFC
 fdsXZsmcunZk2m9KcWdHy85avJWadHSA+A7gASB3I7jf47ufbIeSTgY8OhpTwjUzsq5sOKvNghX
 o7YzrCNuqDUrtbRbC/9ACNXp/ILC/H6kE5KH7UhD8eJFWa1HA/7NRch7/WYLnWpWwn0YROyOgxs
 G3ezx67Vihgkh1efP0f18KROvNJRWeahTic9d060td9vCYNZ1PUVfJZe2uEXn+geJMKsuiu9bpc
 BLUOxjToaOZAYG7UFhAYrdjcoL0JzGaLp9JBFVXtxCawYXxFANIEUIpTtwgL+xC5WJA+UvwW+aQ
 Q0/1HLESd4ibsRAYzV1FTKrFbWK6Tj2D962+UXs5iTXjZVzhir5XUSMiYY66Jo+0nyZfzu3K97J
 syFjikHc8WDy72jInPVQj4A0azeS57mV8fpNWvptlTX1ubzE9msU5zAyvm3Axz6EkKzNMyEbJko
 QXWXgg6J1szMOL2HSIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX6ZkSVKqv8Nbc
 R16w2FAC8XTE/AW3bzsKLINsu1fZyxjVWUVY+mKz+SDH9u4iIuMBfJDGKKisqfcJchp+9uWfDm4
 azBWKKUwAfzTPnAbRMLRsdgspdHNb3A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Prepare the sc8280xp machine driver for Shikra EVK variants that use
Audio-IF (QAIF) based backends:

- Add a `cpu_dai_fmt` field in qcom_snd_soc_common so that boards can
  override the default SND_SOC_DAIFMT_BP_FP for MI2S and TDM paths.

- Handle the QAIF MI2S (AIF_MI2S_RX_0 ... AIF_MI2S_TX_12) and QAIF TDM
  (AIF_TDM_RX_0 ... AIF_TDM_TX_12) DAI ID ranges in
  sc8280xp_snd_hw_params() so that format and clock setup applies to
  QAIF backends.

- Add VA_CODEC_DMA_TX_1 to qcom_snd_is_sdw_dai() and
  sc8280xp_be_hw_params_fixup() so that the VA codec DMA path is
  recognised as a SoundWire DAI.

- Widen the sc8280xp_add_be_ops() link filter to also cover links
  with codecs (num_codecs > 0), since QAIF FE+BE links are not
  marked with no_pcm = 1.

No functional change for existing platforms.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 30 +++++++++++++++++++++++-------
 sound/soc/qcom/sdw.c      |  1 +
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..452296a9e67d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -67,6 +67,7 @@ struct qcom_snd_soc_common {
 	const struct snd_kcontrol_new *controls;
 	int num_controls;
 	unsigned int codec_dai_fmt;
+	unsigned int cpu_dai_fmt;
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
@@ -126,9 +127,15 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (!cpu_cfg.slots)
 		return 0;
 
-	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-	if (ret && ret != -ENOTSUPP)
-		return ret;
+	if (data->priv->cpu_dai_fmt) {
+		ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	} else {
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	}
 
 	if (data->priv->codec_dai_fmt) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -234,6 +241,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
 	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_1:
 		channels->min = 1;
 		break;
 	default:
@@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		if (ret && ret != -ENOTSUPP)
-			return ret;
+	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
+		if (data->priv->cpu_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		} else {
+			ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
 
 		if (data->priv->codec_dai_fmt) {
 			ret = snd_soc_dai_set_fmt(codec_dai,
@@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;
@@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e19adb7c750b 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -30,6 +30,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case TX_CODEC_DMA_TX_5:
 	case RX_CODEC_DMA_RX_6:
 	case RX_CODEC_DMA_RX_7:
+	case VA_CODEC_DMA_TX_1:
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		return true;
 	default:

-- 
2.34.1

