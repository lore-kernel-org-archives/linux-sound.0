Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E39935BDDB
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708163; cv=none; b=n062ELMycfFkLPW7kO37hfQ1JcY64kgC+46ozNLBTY6TLoXTb2A+1FIkNDIoq5zvfcRtea8Hcgs/xQwyRffc71wyZ47qV35uTyX9jKywVNFdjVTe3akqLTjdKfQjrgQSdG75pFoUqVn+jh5srbwbfgsCuHVG2k8k7JlxvkHIeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708163; c=relaxed/simple;
	bh=A+aPeIRe0lqmFacrQvtrEiA6ZTPnvGUnK7nLxima2so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HinhzCjZi1o/Nrt4ZgvPsUvtLddGdI2JPMtESdPTERCgtKdu2Iui3szdgNntb+TBt/pRq6bSRBA9jiDnGfqhwD+GfSUBFqxxd4mSa4iLGHQurClhJWWpn0w3Ff2RGQuZYK6h8tsaYQbgCETGf3IIoq2WOIFRq0aG0A+ELEu60c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+n1IduE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLcE+BH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+n1IduE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLcE+BH9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFuxUj084514
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 18:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NgFEHxXc/nf48ZtQeN2Z1XAjufMKoc5zQYi
	TnlazxfY=; b=G+n1IduENK5+xSbVvxhdMmcMC3D6fwe5CZUGIqwJvrjM7l8QOHu
	M5E5iUXdH+NjstJk3HKcsSRmg6RTeBbyCx0UE/PD8MCcguYmg5zkwh1htdURP7N/
	VHmCoM8MpuHX5tYv7OeMH3eUUAItBrek2fmrAKjdyr5nzAY9tekUtpMv6zTvNywj
	zAuvHMFxWILA39nuAQoPt3pLPbqMx3/OkqFOlNlKMAVS7SE8q+7ZMJC3O5fcO97Q
	BiJa2P1PizX4vXr5zHZgQujYo5917K1jRXWrK99E6T0CqM2zrG8JGFMOMWept1Di
	3qNbxHI7gKZRIX+FTWZXMQjKNA2hu+k0IHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81hyq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 18:02:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so4054877a91.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776708159; x=1777312959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgFEHxXc/nf48ZtQeN2Z1XAjufMKoc5zQYiTnlazxfY=;
        b=VLcE+BH9DAC4i2MePJLtbZnmzr/AL8nnFAENnn384EvyDKdURzPxVmpGmKF3zdOHsm
         7QLqy2BJpyrPxpCvyiQChiE/vcqLLoOm1jU4rgb7YZdZZuzIgdOZ8618kpeBjxn6sOx+
         Cabk9n+GGKyixG7MVrYvVElEV4Alwnz1vvCp1vWKZ226/66C/VOU02JA2d+47jJSb0NJ
         fWF5eVXzfbFsRw3w9pAmbgp/uYsPrQGHD3W7kJcoD21HRNByqaYkLMuKLf3/Gots4z6e
         lcOm8Cy51dofNbLlR9aAKTan8gQCiMWIpcyUIpBK4wuRpnlUbJ5xY/c4Fmg0+KNCJf21
         7ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776708159; x=1777312959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgFEHxXc/nf48ZtQeN2Z1XAjufMKoc5zQYiTnlazxfY=;
        b=cyk/Y1pu8CjTpjqI3QFhh+ExS6W4HwiQWdCphV9duSKZKJ4gIEJrbxhdpchWGF3O/M
         wOvsI5OYupy4+Sa+oaDfjq02MJZ8NsXzfJjJMiWV6pEpwh+1Z66dHYCwt98SmOVpvq84
         6VIwWGDPGDQRNVVBy2EYvhK/pIgZsmTwNpuziiL9FAqFPr7+WlXZ7k227SlX55Fqd2Nw
         RX+aS2qLeccnKVJ6lyGWoKTkRGPxgCjEhDPEQpHsCXMXQmJtpjXG6WcMd9N4UYpt2HZ2
         Jzsne1vWKer33RJOIAGiFeTiwAlO6Kas+XYI9NAz4F0SwauapyXIUr2eYErG4eHF0jqZ
         aEGg==
X-Gm-Message-State: AOJu0YwDsHg1cQ+zkE8Te52OkJzm9Y/7pWPrIa9jIAFTgDGDnrQ9FR2Y
	GcnDe7XFf9xdncQ/Bx8bZQxAyTDHkHlhAdRzqUocxu5+hvdlEFcgT6rZe2o8JFEbJlTYYejcR4a
	7XBPwdr/c+20du5VarXl/1Gq6D7usuZRS+15QO8gJSywUwypSovSMA4qFi6M4VTJYN+gLjD8VHQ
	==
X-Gm-Gg: AeBDievssXvUxQDTpOevs6iNkhRTNPLYBmBwbTMzMpMklOdcfa1vFw+x+vYJpFlJhHS
	2ugD3A+zkvIg+MZSUjeVcdI+hBlpOq9XnSQA9sIlzo5ltUxbiTaCwimdnw7ZxncKyixuSChZ0op
	we2Y0z3zZpMX6j4CsjtHL7NU7vKmV5+p/sZU8frlXhheMSv7OchrOKdaJmolwghJJ0JzE1a9H5E
	zel0SQCOI43i+rlX/9AHEt+MDO2OWK93in2mEloxarIsUOb0TlRxOeP/akXE6i5MRUQgYyGhKNe
	3mZf+4LYz2rhmLJULIX3XcgQhkOgNP7LACoqCfByJkze6GsuN/y1VfdThhFf0iqnPe+h9NC0Gpk
	8DCU20rB9s8Kui0U0Z7fvtX5B05j2AhUEfNBQ4smw/RLaesi+G+tonjuZh3OT
X-Received: by 2002:a17:90a:f94f:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-361404990eamr13498758a91.25.1776708158756;
        Mon, 20 Apr 2026 11:02:38 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-361404990eamr13498695a91.25.1776708158089;
        Mon, 20 Apr 2026 11:02:38 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36146ae9cd8sm9170775a91.11.2026.04.20.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:02:37 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH] ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls
Date: Mon, 20 Apr 2026 23:32:21 +0530
Message-Id: <20260420180221.785113-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NSBTYWx0ZWRfXzPOmSgCrPsev
 TGAZDyv908dehLNxm9hle1dxOoVaanyM9Uv0KphKcLSo2F0tEOaRJyH1nwOfeJU0DGcGT80sm3k
 osalNJrQFe5mJRLFRVszyPOTrxmlgJi83e//pB82bwocJ9qRfzgeK2Zp7Pu/wsFcUreQreQ3C0C
 6U4WuKm2PXKeime2UazJX3zIX+HzlI0xWcreUwHfkp6c9jPm2nGu5kRsQb8WpkTGgDiJsgDKcLf
 u759qv4dKwtnFnDNIm5tN0JSHrIuNiRqtJEamPT24+jvRtLsqLAoHr4quNfLWIUKC278xpkTqO9
 uAjneooXF+pmCfy3anLq2AWw5qgJawE6XesozyuzGzpPxqDMWGMkq68pQ1sAQ1lHCjoULM+oHpz
 OdPfA8q9pljf+UG+eU+MImH1x9Pr1214tpqjf5BljcrTmoxU8VPSv1LOrQqciCI/O6Z1IOsvjWg
 6f6EvtQxxLiALB5+Wbg==
X-Proofpoint-GUID: 0kQ7-gAdqlyXxZglY8EZVfK9ENtYhEel
X-Proofpoint-ORIG-GUID: 0kQ7-gAdqlyXxZglY8EZVfK9ENtYhEel
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e66a40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MDa5g-1UvR_uta72_iUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200175

Enable AUX PA sequencing during AUX DAC DAPM events and keep the
AUX-specific RX supplies enabled while the path is active.

Add the missing AUX-related mixer controls, including CLSH PA and
DSD left/right switches, so AUX playback can be routed from userspace.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 10a2d598caa7..72a53f95d688 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -546,6 +546,9 @@ static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
 					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_AUX_AUXPA,
+					      BIT(4), BIT(4));
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
 					      BIT(2), BIT(2));
@@ -562,6 +565,9 @@ static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
 					      BIT(2), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_AUX_AUXPA,
+					      BIT(4), 0x00);
 		break;
 	}
 
@@ -730,10 +736,23 @@ static int wcd937x_codec_enable_aux_pa(struct snd_soc_dapm_widget *w,
 			snd_soc_component_update_bits(component,
 						      WCD937X_ANA_RX_SUPPLIES,
 						      BIT(1), BIT(1));
+		/* Enable AUX PA related RX supplies */
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(6), BIT(6));
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(7), BIT(7));
 		enable_irq(wcd937x->aux_pdm_wd_int);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		disable_irq_nosync(wcd937x->aux_pdm_wd_int);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(6), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(7), 0x00);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		usleep_range(2000, 2010);
@@ -2051,7 +2070,12 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("LO Switch", WCD937X_LO, 0, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
-
+	SOC_SINGLE_EXT("CLSH PA Switch", WCD937X_CLSH, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_L Switch", WCD937X_DSD_L, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_R Switch", WCD937X_DSD_R, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("ADC1 Switch", WCD937X_ADC1, 1, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("ADC2 Switch", WCD937X_ADC2, 1, 1, 0,
-- 
2.34.1

