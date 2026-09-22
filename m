Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121954C6811
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070216; cv=none; b=Ym2aO1wEh//GwJoX0WZo11cY6yht119Kw2OyzsGRR3KST1XQDZUVufKvhBZobPNRBneYvXpHalaExXiQNUeNFxNLog67qJAu4kGBtEE/SfIyhkGobb0eLnCi4MdWc+hfQcBZzqHewMJip1BYOIRLYkSjTv0RG0u3uqoN5xDDxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070216; c=relaxed/simple;
	bh=qsXF0dZevHujgAyvXlegqZLisSzLQyqTMPlbdzLNVYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGj3wXazf5OOePtIG+kVMIpFTzhFNxYKYYJzCRZD3BJ9zXjwYsDljxSX+fLCNpDaWTHKgdm8uI5fEIbopTxwrQqDn22EC2tHhhbjUhSYTiGhR2OC2iZXHWwOmelBYta0h40gJ7lWkuBY0QkNiecbMuOGtbJU4wutNQjtGvpL+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zrc85VFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtHMWSYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zrc85VFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtHMWSYC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M703Z83840510
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=; b=Zrc85VFsLtFIoXpp
	eTY5zKDj83+zaZ8qxoMxvG8mEPKPF4k39TSrzC9rJxhM9CX2His/9YK19G5g1cK8
	ctXkkpfjC4YM7rdvfcewNx5bFOxLrrypqurWxtgsFHOjCZ43Bz2ZoVDp8BjKN4/C
	TdFeGoItl6X1aKjb15h6e6pHJSu6+JjleScGG338fmZ1Kv9+JOWpUKiVaiP3kjof
	GMhBBKU3X20Ev7xfruaf5YMeQMSMT856XqLXTZyIpOnovyEe/Z5BVCV2GHLnniMp
	Q3YQDEvhqAIRg9gsKw4aaNxtErvc5M+T9alk1MTacVP2voce8FtQK3CjpsumUTdx
	T2m5kQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v53btg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso3724196a91.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070213; x=1790675013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=;
        b=QtHMWSYCgD7NSitqz6/U/QsTVSK9difYt4MWFeGBJs0TL5fp5hxNsLauBc29sK/mgj
         RW0EZF8RNaUOj1mW9KMwwEKtUTv/Z6bblz6T8PYN1MkwXFPjprdGW/aBbch8EnLjbYpy
         UzdEH/VN3O6pmkr5f1X75nENEDl2r8mSoWBk+0V51Cn/tbheOT8zVLArF6bH/7Y1X344
         Y1E9uST/q5csb+wyQ+ihCeEu7jeQODj1TRdRDB0P1F6v6j3hTM6YQqU3AAE+ab3g2v17
         J2pvQeUvyK6mthtHL2HA9GQ4D2O+7SfMLkHuGMtfedOalPmSsMqVQbqa9XQDAtKWu8k4
         ot8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070213; x=1790675013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=;
        b=IZ7IUyIjkJoGbM8KoxWD0DVwP13wa0VR57+mzLmiRSFXzDvmGC+CqWKWfPrrUmorEH
         WlGbVwverQ8E5puK1+c5N3x+ni9F084L/N12KiS1ATA7Pb7s+eRHM/8WPOuB8jaXB50U
         PBoxWiQ10IMtroXMP9VhElvJyLM6ImLWvmSO83VVwBZ4pY1u5yViA4CHKTL7vGf7bz/Q
         aWvGsqd8K9SNq0UPARjtH9Xhl3ltW5jbC4PLfActphsk3SsH2l6SpSw0A9rX1VIjeIEE
         OhK8ipADhwzhML/6UnARzmAZGtogdzERKwLUtJA0XFbldkJU8ZgdMwoPx29Qh54z1fiY
         6zDg==
X-Forwarded-Encrypted: i=1; AKwUvBzuSA2YdFB9PjGXogX2a49/pYqMoVKIw0gv52VfxWqfOSa8pBUuV1hyVWn3dCN3lHjEXkYimDntGMOJ9w==@vger.kernel.org
X-Gm-Message-State: AFuF++mC7AKpEhhjdPcFluj59VVqBaUKmmLiFXKUMpR7lVfwGuZ6Zgpe
	4TWQaI7OhOO93el5hBq5xToCZD97CltUn193Do30kKkh1Kzj7rl4bM0jDr1m32eUuZZpyZ67KgW
	11gM8UF44KvCawillBowBF811wt3VxMkdXN/VzxS9LcPxNjyq9lSK5f3YuaSi4h5jqQ==
X-Gm-Gg: AYBFou3SEhi8KoBY700mX14VVuSnzpp+CVbkfn9Vr3QmiZBT7j/6gN79C9dL40IDIcK
	CWWAsdK00BpNftqRcU8qyeauYS+DB6dtgQ+EBtC+9+NoJpfDbCpnUgCJ7VJ94A43qE0KS16+zo2
	hdZtL9LSH+20GTuWIFg7/nm83yRMaB80tt/GRI+jitk3IaVAZn10dQYWhdlcf+jiG+hzJmc9dws
	99biYfR4kJH3XmzHUjhf4PmyiYYEen3t/MhR96HIwpv4A95xMreF8WJDg8kRO6Je9l9Sh77D94j
	7jRVY/ez+MdwgKylO5NYY8k5eHdzIBPNmezXVRq9B7OlKxgSDNRk110ZUX/i8wIG1Mya/KBtIVS
	tvnQciXxH36sX8JTAc9JnCxdF2rjI8KSaU+I=
X-Received: by 2002:a05:6a20:6a08:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3ddec857475mr693837637.80.1790070212615;
        Tue, 22 Sep 2026 02:43:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3ddec857475mr693801637.80.1790070212131;
        Tue, 22 Sep 2026 02:43:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:32 +0530
Subject: [PATCH v4 3/8] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=4188;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=qsXF0dZevHujgAyvXlegqZLisSzLQyqTMPlbdzLNVYA=;
 b=CR2OZjP/DnyqjCZK9W4iOwqxNRHhzEYUe6J8f8YmsLpULfFI1vvL1z3TRy2KqgHGayJk7F5Dr
 rpUQv3YHC9eDVB8zKRZEIwLYNdFNHI+DVPlvfsc2nvv/cbg11IRBEr0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: kwtG0Cq1OQNirIr_SrnqhcAb4IJpwb6-
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab24dc5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX55ZCEV8qY1lY
 /QM+3bXzEptiQaOe023U0o8n+S38+GSWSwdih4LLQUHVedLSwmG32IL3NGgbaR0QvzR3NbNgKkX
 OcwrbqGWZEUlKwuzcu7+keP4PtrotiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX/W53nIOz+OHG
 swYnz1JByV8xg2Ojqni6visyP8iVRfbHWpWsXSj1XVZx7ec0dpRx6oh28y9bKGAEYvOla58rQ+I
 M5/feXSlLMI24q81Ly0erL8uiRahQjjhEktj4SPdBdhVjTaWfElyQ1zlRxmd/b+8MW1Ji651utf
 U4cAhcg6BzgxCtdyl/1HJBM4AYtdVa38twZZolM5FwjE62+YJaudjlSWCv1Vv/8WF+bNP1RsfzT
 b8vE+AVL8Cn9oTkYvF2GnlwZPRgqoENKbVaJ4NFW6fRYDwan5ymP+w+LvKz+7NDpi+E8Fnbgtsj
 8Tp72XLyrpC4UmO18J+lLnzi5NzPwu2OxeapvlO8qY30BzPqvKUxVrNxePe3RQkvTVZY9l70f0A
 WQmyAV5aFOVxGNSsTCIHbg+ErPh7CyJjbV8D3sJkjjltUPfd9SREruCCoUEmDXwWX6KlbkxnpgG
 8pw0aSKlKQBr97hyhqQ==
X-Proofpoint-ORIG-GUID: kwtG0Cq1OQNirIr_SrnqhcAb4IJpwb6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220139

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
index 573b2145e1c4..b52665b11e35 100644
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
index c41eb8de6160..93ceee878b78 100644
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

