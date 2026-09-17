Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0EB30C146
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611389; cv=none; b=TUNTmBckFU0gkJlkcSN1tFE14pdeJdX1AUTgwZ2j8+gUSzZmM1Ar+BKlUmFU4rnJ60mGV+GWgu4uhCgfMVmDAbtBmEp9khfqXICUpPmDpEnGtGb8F3gjt3492WyvU8sgwz3he9GIBuFZASUO+xFX3zmNSDqOQ9F/ZbMKCOv8Sh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611389; c=relaxed/simple;
	bh=8C+D+unSEaRGl8AxrVeK0iFZsXPZ9fBEhD2PWma7i9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xk7e78a2lVAUqq/rt5iJ6nGm64y8q3ygXXlaorUUexIQeAQaOlWa8M5lwC4K8C99qUcEkZC3DF6jJlemZCe/a7KEFKkFVYxLANbg+DODWOhj8kGefBV+OfALsQeGTQBckWs7MWykDcvdmRSDqXLXpIi6AfQjmLp9UTHz+KQQRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJx2GgIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2V5zdUD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJx2GgIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2V5zdUD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMAH9L2430492
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=; b=jJx2GgICayNbhav0
	mCa9kn5knQ/A8+Xoj9HhC9EzgPAF4wxx6boWCgC2FhJWi2JSXyk/r0bq6nW1yM2F
	JsUgLkKM87MwUZGkHXulkXYzTrpaO8AyDAIfL+OJgytJFeCBGs/p5Ew6TQ66y4kI
	pEnLwKVnH7e/MzDpS0thCGLhKAtAKyfNKpDPE1DbIBbUBnt9MeVmIwlNZ9N4J9nN
	VkT7eTHhys9LWFOVJxHQozof050uWjz+eXp8jzwjT5CJ+zjswK7udXNSyrITPJEM
	lRBPuy1TlHLIMHWj39AEYri4nykAxt+NGYXp1Pba3/4thnGneKJWlji/mGIzLhgJ
	MDMBAQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnueqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:16:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1030781a91.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 19:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611386; x=1790216186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=;
        b=M2V5zdUDT61NtI/GBgKkl3ATIHqvCuasaIu5p7e7Jx0jQ4c6f9LNXItxM1NPNjyrsJ
         9TR839Bs87nSlv0R9MgYVNECFitEVoz2BL5uWhlygEDx/Um7V8BvFoLMJtw1uJ9tPNf/
         QYhNDC2ovldxmxEZwRna7OoIoz9uKlOIe3AugwiDsr/lTvkd3tDx0xEmbrf3dTYHrrdA
         SFc2g2EZHER9rSA3FfhDzcVCoaj7E7D+1LmBdqkQwstrlXQhGOVfLJzRLG/BCFH8ix/0
         u+IEFNjidQ1hd2HxpKvv3/JQV/vn3KBC1ETVHOSX3IglJX+x5X5DaAesFQAN91qQf27L
         Dlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611386; x=1790216186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=;
        b=MRbvLakm5VdZFBerVZ9fHNueqVdoUOiZdwLhss7+2fLCozgn0rV1FOrznwXWGpx1/g
         rcMM31m2NEcBQsxqs87AaOW11/U5EQk77gg2lNJ634BETMm9hwSMLflb8K8ZgdY7zRTV
         /kkab1dQ58rF8uEeG4VXCK3kpD/8S5V0upspiB0Qrn6HRVaUg5ynAyRtUYylFPiF81LY
         8yfufhora9fskYl1t8tBbPYSDky5/l3ZozXZRezrZ4liJX3xCWaHGxxnZlSy4nhL5bEU
         JBaxoy4X2ZVP9Cg1Hxm1RDoXVYIRPP8QtR2xT0VmaQJvKu8QYVqoggTY9u9ILQj1/j8h
         O4NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxSfFRHJNzxUocXIYUSbL3me3S5aizN78RDWW3yiDIZN9Bepe+9MeAJFRs3pil5MISXvkbWk8S0kLJCg==@vger.kernel.org
X-Gm-Message-State: AFuF++nIo9NlCNLKIBTb3k2/H5t8UNIo+mOWIA9a9p1sxIxf0z3dyLQn
	YTfdEYUtpY0nAiP9TnmEWcOO8dAwbNNV3NcGYvkcSx1Tj4SVNCLdrJajxaxbD0XC8Y6YMzdKWxz
	TbMZobNAxhYKW9MxXN/vPoMPENPGOoyFPZNlkJPrESasOejH44+/30CaZX/5OfqQqww==
X-Gm-Gg: AYBFou1s8qZl5hFv2/5qWWDjrfq3FinHg9guXXztxgxY8Xo4GL8XwIRg9NbPUxztUua
	2iG3FZKVBUz+XUf0ubjC3Ino0H2Itns6QkxkgJ+E43oytIBIMz58U+xZYaFWKTvOU/skH4+TOsD
	LkrQzrxuDl3IcQUXdts7Yb/YL7U5VzOCIKC+fGc83Sz6vazjOk66N7N8JhH9EMxaFwiUBT626cw
	XqxOuakoDU0xd6lAzuIduncphuBnFI8ZH4OdNUE8vKaC1KshbKcKPIreOO8yafZkZuP+gS+JSLa
	ZMC4CMRzDm9NCduoAxuudEgu8gC1jSEHC+MQW6bMOtY0n5yKG8/kjNx/f3lNoeWafKh6Em6keHk
	N9F0fzO956fvwr7McShm6qhT3cHKHhk8ECia9
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr10771385a91.0.1789611386053;
        Wed, 16 Sep 2026 19:16:26 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr10771187a91.0.1789611384299;
        Wed, 16 Sep 2026 19:16:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:34 +0530
Subject: [PATCH v3 v3 3/5] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-3-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611366; l=4176;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8C+D+unSEaRGl8AxrVeK0iFZsXPZ9fBEhD2PWma7i9w=;
 b=X9qkND0FMohlTB4T/7cCV3ZWxVLAuWzfnqtMWywSDzViKEmkD8nXRiOMuj+kJSpQ6zDmTlG1+
 lCawrUbHHmwBcmrxP6/yWZVu2MKwyIUXOEVoo3NIi0Cbysps4hORgli
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: D61mLyxX1pMZJ1fiK3m2LfUEoy9D_dUq
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aab4d7a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX1uDUNsagV3PA
 j3TdOJmAy/J+d+02UAtGVk40noVDM/A8T7dkDFxKxjqc++QZXHVyL5GTZmfFrwUB7RSu9AtmUbR
 vSxEPj/8lsFBCQOnDgamTY77GeJn/X0uVHjmowAwn7TQVrU6+WrHyTtnzEX7UXUPWhaK7/eLEKW
 zpw2nEXZlwZ/lEyG2gdHrMxCJiTSpTFSbRuxF6Ftp1sBD0S6QV5wNFsHCbof6dTf2SnNA2eYILh
 DYm5RZUto6j25EsEHTbn9aYadbZWjXG1N8djvfHaVkiYwgouoVtivBgtpz+fRkKr5o57GKsjx5U
 Ik+lnSZ1rZc762Y/L4bX8wTXzDAO15kNT4IvkTdCWnzO/UpKctgIsW13I8oxivvOuBrf7L34a9s
 xX5BUXd9gp9F9gBSbfbzxLg6xmdpmQKz1qyG+CN2zR9TEw1J7wbwVAN7+ouSkpW97mN0H107Y/Y
 53ZbB2Z90NIHHZ2T0bQ==
X-Proofpoint-GUID: D61mLyxX1pMZJ1fiK3m2LfUEoy9D_dUq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXwbinAPjoReLN
 RL7j9Q4KAidn1x37Um8qPrI5iPj+Qq7pzx1dtGHEH4nThCnUShLgtC6ogSYPbU3SqWfoGcTvIvs
 FhFqwaowl7TPGC/90Al8iJIKdG6490w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

Add shikra RX macro compatible data and hook it into the LPASS codec
v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e..b52665b11 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -30,6 +30,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_1,
 };
 
 struct lpass_macro {
@@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_1:
+		return "v4.1";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c41eb8de6..93ceee878 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -60,6 +60,7 @@
 #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
 #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
 #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
+#define CDC_RX_FS_CNT_BYPASS		BIT(7)
 #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
 #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
 #define CDC_RX_SWR_RESET_MASK		BIT(1)
@@ -652,6 +653,7 @@ struct rx_macro {
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
+	bool fs_cnt_bypass;
 	struct snd_soc_component *component;
 	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
@@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			if (rx->fs_cnt_bypass)
+				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						CDC_RX_FS_CNT_BYPASS);
+
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
+		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_objs(struct reg_default, def_count);
 		if (!reg_defaults)
@@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	},
 	{ }
 };

-- 
2.34.1

