Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606D43DCDBB
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939263; cv=none; b=MquFglAbziH3MNpX1cCRQxY76A8HXrmkfltyopCzhFI0iQ4gheZti18OgDw7ZxD5li8b3OYiDVvD8t+ES+pzdlHfD8DfGt0RipYxx4m92HSc9msuBtJbM3iny3IfvOa93s54AmFeOfaSnfFJ2Ey6SpCGceAVfFu9pb7uDT76Bww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939263; c=relaxed/simple;
	bh=LsbtL8WxOuTyNIvCVL4eiU1HaJF6qCdGwZtZffvzC7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N0xS+isIzI8YZjKA+s54BwKdw7wgVOUo20dDOwPw1bqOkZd1Q9suUqbxR2eC+YeWoz5ETheWfA8zCv0VQ7OfmkKQo9cQUbKEHIIq0VSCHfqNsiFOVtWYkBPIal9X9IVwP1cuqkZraYZ4mMF1+CTV0b65rgntVMufSCSdizyPkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQWVd2kj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4FWeCO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQWVd2kj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4FWeCO1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFSQ63596150
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 17:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8JXEaP0we+p
	3cefk1Csn6U/OyR2c7qgAlxITwtCdLPc=; b=VQWVd2kji7QNLyiyL+t5EqVNS8j
	YJYEnLXjNd1WDPzpzKdTa1m9QdCynNzknpB/RUsSIWT/WHAJ+1EMPOGZtfOX/C1x
	j0VPrSEC/okSD1SuKzhd+4VzyR5/vIXODkZobNONt7lMEanJfXHglImcUv2axpoX
	Gk4dl6tQSs7LbTfzxwFXoYNuvIQZbX3CtHef6FRbyvIKpJmwGOGz0Gxm3rKIeM9I
	ibp4j9mzD097YhzmJQYKA2DyJJwU3LP7oPvzppue5BhMKP0vqNwUEOe1rnanrfKy
	hpJ+cjdUDH1lOj3xB89kt3Jskp6Y19TXoFEq/Ny3ZOnTCJKtq4aEkukHnjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj9tn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 17:21:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842211d6e48so5349337b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939261; x=1781544061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JXEaP0we+p3cefk1Csn6U/OyR2c7qgAlxITwtCdLPc=;
        b=f4FWeCO1WHlTCZ7RcyQkCOPKNpNbcizKA5FUWDvDr1WO3OrlXhMDeAggKq3e6f56RB
         CArBpsLpbh+vF6tpopleCa782frMWyF8JOAt0oD/AxR3/BhQZbQ8VAtOmz9wxMg2HDwJ
         RAlojw1QtDtUdW5os7nqZawcMAxTx4kiPmfT91e939jYf8G4e1vcrVH+z+m+ZIgMF3Hb
         s+Db7biDBzkYZCfea5oLVh/4LiPA+7IyyFZzYDEtBela7k5r+SoFXyLdpgyO1hTP/frA
         gQHGTxwXjohfp/DBcQZagCRanwhujZS1AiHFEUvWSrUn7/f5dOHVql+xo58hKDGvM84j
         +G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939261; x=1781544061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JXEaP0we+p3cefk1Csn6U/OyR2c7qgAlxITwtCdLPc=;
        b=k1ln8VQeOovFHtFXqeOWNHpnqbDsWv9eZupjAaBN8VF9MqtxQod0HqFucAilIiewI2
         GhhEmW1Pxsn4Fn7k36XB8ATfi+zvxLsPAOzNTHaDwVFuQZz8Kwh9VCSgdzdK68DPuZ3m
         mf47U5BneFhLkVte1PolBhPX2slW2drzpas8tcr0DrDSWEYdxOOvUFjfwZtXer6bJXKM
         SAdov3lmCAE6cnXEAGHtndrJgvhTqXJrJxrD3pRnEX5qvACWERlsbAWcH29JC+07+hSw
         QMAy4xIjTDsKEm+kkd3gWQ0kZLTlpHxSWr0owviakr45AcYHpe0tCsl2aIqZnwnjrP5W
         7o+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9i6BkTiwDSLk6AuIEGV22zeldyNzNdPLeJSat3MJNYKT1WSOwv8zquNIQUG9FeBsFoXqtNrp7SjBiNzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmheIL/H3y551Nhxg3LQxI3Ghd3YSGxh4HhPM8PYvNEgkg3cn
	wA8KGs6nWdRyV62xsGkLTLuJO+KLSXldGLNKcH6sylH5DUO6HP7JbFm99mxWSWMuNxfjvQ/cegd
	scNiFRUB2VEZtEnx+yQRZLslr2hTx9n3muzjxM/9aESUPW2/ao+hwVykDq1n+BRhst0IlVRuCVw
	==
X-Gm-Gg: Acq92OEacBoa7+ne3nK0YZK1tNpnwuqEMyVZkD9Z7HaVfcPn7q40BRVRuD8Lxk5P3a6
	gunZGtTvdKVF2pvpvXlYEmw1uzS9eKsTedED2RwtNEQ2ukpPReRRVY6AjNzDf3qnzFTpFNEKkgb
	e7VEPjtZEw8MztX9xs2W7yiqy/xOEG/QjJ49KP7i1GKgEDEQn34n9OGjmV617FwzpUfBawC2fCy
	L3k3rjYWt4GdEKcLA0xuuRbx2F1WkMVlL2fb1OOe60yrtbYlk1KyF4GJugZlnSN9wJHadhB2eBE
	jA/7PbvYQEWIpYcthiL3h4dMzpesQ+ZZfJqgCjs0P7y5jxv18pZvJcc5s+N9bKtxhj1vxWJ/UYS
	zC4H1MJt/1QvHoFlSjrwlWidoo0zBv+sq+JbiFRBGheH2k2IDl4L5HzhpOnk4PJMQk8jd
X-Received: by 2002:a05:6a00:bc81:b0:842:4907:d089 with SMTP id d2e1a72fcca58-842b0ef2b79mr16782234b3a.34.1780939260896;
        Mon, 08 Jun 2026 10:21:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc81:b0:842:4907:d089 with SMTP id d2e1a72fcca58-842b0ef2b79mr16782198b3a.34.1780939260430;
        Mon, 08 Jun 2026 10:21:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:21:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] ASoC: qcom: lpass-va-macro: Add shikra compatible
Date: Mon,  8 Jun 2026 22:50:23 +0530
Message-Id: <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hLg6ni2FCEotDZJp1RKbC-4YfK95JFzJ
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26f9fd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PVzo0dxaLDckdvgPDkQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: hLg6ni2FCEotDZJp1RKbC-4YfK95JFzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX4J45tJB493aj
 XPeKc4cFXM8hg8Q0UH1RSJH+TfKmEfJdy7JvcaBiP3jPSdSOhiG3LSIhnm/4xcl38ohzQDToUi4
 SSQqnIs7CKSgr1rdWMIGkk5GYKHnWWH6qgHsAGREhAhDH0vIgc41RlUaWHuUvM8CGx8tYj4CmuI
 ee5vLRbaV3zIA2vCnieddLBpGDy53m8SayLFVxVvuph4OO6re5D/kN70sdkh/v78vubYKZFLgpn
 ElwHnu0+lUov8AYH7KAGbQ6kVqfG0qGiWFfvtGx0xDBxmIP0iKFA1UwABrx/ehbL6Nr3HQmzrzQ
 eiCFaN5gV7rcafKCe2GnP0ExME2vO1NqQPANNBXHbYHLkG76Y7NyPTQ3APVLv1EOtWirk1H9sAD
 o2OJf4qXxrFmOHt+2TqX1RA+eQaHtqwPSsfzwUg9JfH8tbvc+JdgBR1wqmEk3agm3ILTE8ooueP
 /HnQsGn3t38t6odqOKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.0 implementation.

This adds a shikra regmap/default table covering the ADPT register
range, wires new match data flags (bypass FS control and ADPT block
presence), and enables the ADPT control programming path during TX
decimator bring-up.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 276 +++++++++++++++++++++++++++---
 1 file changed, 255 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..4a8daa07ec1c 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -155,7 +155,57 @@
 #define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
 #define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
 
+/* ADPT control registers - Shikra adaptive filter blocks */
+#define CDC_VA_CDC_ADPT0_ADPT_CTRL		(0x0800)
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		(0x0804)
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		(0x0808)
+#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		(0x080C)
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	(0x0810)
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	(0x0814)
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	(0x0818)
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	(0x081C)
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	(0x0820)
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	(0x0824)
+
+#define CDC_VA_CDC_ADPT1_ADPT_CTRL		(0x0880)
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_0		(0x0884)
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_1		(0x0888)
+#define CDC_VA_CDC_ADPT1_DH_FSM_CTRL		(0x088C)
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0	(0x0890)
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1	(0x0894)
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2	(0x0898)
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3	(0x089C)
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4	(0x08A0)
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5	(0x08A4)
+#define CDC_VA_CDC_ADPT1_DBG_CTRL		(0x08B0)
+#define CDC_VA_CDC_ADPT1_DBG_PDM_RATE_CTRL_0	(0x08B2)
+#define CDC_VA_CDC_ADPT1_DBG_PDM_RATE_CTRL_1	(0x08B4)
+#define CDC_VA_CDC_ADPT1_SPARE0			(0x08B8)
+
+#define CDC_VA_CDC_ADPT2_ADPT_CTRL		(0x0900)
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_0		(0x0904)
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_1		(0x0908)
+#define CDC_VA_CDC_ADPT2_DH_FSM_CTRL		(0x090C)
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0	(0x0910)
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1	(0x0914)
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2	(0x0918)
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3	(0x091C)
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4	(0x0920)
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5	(0x0924)
+
+#define CDC_VA_CDC_ADPT3_ADPT_CTRL		(0x0980)
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_0		(0x0984)
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_1		(0x0988)
+#define CDC_VA_CDC_ADPT3_DH_FSM_CTRL		(0x098C)
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0	(0x0990)
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1	(0x0994)
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2	(0x0998)
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3	(0x099C)
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4	(0x09A0)
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5	(0x09A4)
+
 #define VA_MAX_OFFSET				(0x07A8)
+#define VA_SHIKRA_MAX_OFFSET			(0x0980)
 
 #define VA_MACRO_NUM_DECIMATORS 4
 #define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
@@ -209,6 +259,8 @@ struct va_macro {
 	u16 dmic_clk_div;
 	bool has_swr_master;
 	bool has_npl_clk;
+	bool bypass_fs_control;
+	bool has_adpt_block;
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
@@ -235,24 +287,12 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	bool bypass_fs_control;
+	bool has_adpt_block;
 	int version;
+	const struct regmap_config *regmap_config;
 };
 
-static const struct va_macro_data sm8250_va_data = {
-	.has_swr_master = false,
-	.has_npl_clk = false,
-	.version = LPASS_CODEC_VERSION_1_0,
-};
-
-static const struct va_macro_data sm8450_va_data = {
-	.has_swr_master = true,
-	.has_npl_clk = true,
-};
-
-static const struct va_macro_data sm8550_va_data = {
-	.has_swr_master = true,
-	.has_npl_clk = false,
-};
 
 static bool va_is_volatile_register(struct device *dev, unsigned int reg)
 {
@@ -424,6 +464,10 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_VA_TX3_TX_PATH_SEC4:
 	case CDC_VA_TX3_TX_PATH_SEC5:
 	case CDC_VA_TX3_TX_PATH_SEC6:
+	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
 		return true;
 	}
 
@@ -457,6 +501,174 @@ static const struct regmap_config va_regmap_config = {
 	.writeable_reg = va_is_rw_register,
 };
 
+static const struct reg_default va_shikra_defaults[] = {
+	/* VA macro */
+	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
+	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
+	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
+	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
+	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
+	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
+	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
+	/* VA core */
+	{ CDC_VA_INP_MUX_ADC_MUX0_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX0_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX1_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX1_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX2_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX2_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX3_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX3_CFG1, 0x00},
+	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX0_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX0_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX0_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX0_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX0_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX0_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC7, 0x25},
+	{ CDC_VA_TX1_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX1_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX1_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX1_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX1_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX1_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX1_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX2_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX2_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX2_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX2_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX2_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX2_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX2_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX3_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX3_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX3_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX3_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX3_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX3_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX3_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
+	/* ADPT blocks - Shikra adaptive filter control */
+
+	/* CDC ADPT0 - adaptive filter */
+	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_0,	0x11},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_1,	0x01},
+	{ CDC_VA_CDC_ADPT0_DH_FSM_CTRL,	0x02},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5, 0x01},
+
+	/* CDC ADPT1 */
+	{ CDC_VA_CDC_ADPT1_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_0,	0x11},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_1,	0x01},
+	{ CDC_VA_CDC_ADPT1_DH_FSM_CTRL,	0x02},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5, 0x01},
+
+	/* CDC ADPT2 */
+	{ CDC_VA_CDC_ADPT2_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_0,	0x11},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_1,	0x01},
+	{ CDC_VA_CDC_ADPT2_DH_FSM_CTRL,	0x02},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5, 0x01},
+
+	/* CDC ADPT3 */
+	{ CDC_VA_CDC_ADPT3_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_0,	0x11},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT3_DH_FSM_CTRL,	0x02},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5, 0x01},
+};
+
+static const struct regmap_config shikra_va_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = va_shikra_defaults,
+	.num_reg_defaults = ARRAY_SIZE(va_shikra_defaults),
+	.max_register = VA_SHIKRA_MAX_OFFSET,
+	.volatile_reg = va_is_volatile_register,
+	.readable_reg = va_is_readable_register,
+	.writeable_reg = va_is_rw_register,
+};
+
+static const struct va_macro_data sm8250_va_data = {
+	.has_swr_master = false,
+	.has_npl_clk = false,
+	.version = LPASS_CODEC_VERSION_1_0,
+};
+
+static const struct va_macro_data sm8450_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = true,
+};
+
+static const struct va_macro_data shikra_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = true,
+	.bypass_fs_control = true,
+	.has_adpt_block = true,
+	.version = LPASS_CODEC_VERSION_4_0,
+	.regmap_config = &shikra_va_regmap_config,
+};
+
+static const struct va_macro_data sm8550_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = false,
+};
+
 static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 {
 	struct regmap *regmap = va->regmap;
@@ -469,6 +681,10 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
+
+		if (va->bypass_fs_control)
+			regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   0x80, 0x80);
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
@@ -497,7 +713,7 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	if (mclk_enable) {
 		va_clk_rsc_fs_gen_request(va, true);
 		regcache_mark_dirty(regmap);
-		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
 	} else {
 		va_clk_rsc_fs_gen_request(va, false);
 	}
@@ -743,6 +959,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	unsigned int decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
+	u16 adapt_ctrl;
 	u8 hpf_cut_off_freq;
 
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
@@ -757,6 +974,8 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				VA_MACRO_TX_PATH_OFFSET * decimator;
 	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
 				VA_MACRO_TX_PATH_OFFSET * decimator;
+	adapt_ctrl = CDC_VA_CDC_ADPT0_ADPT_CTRL +
+		     (decimator * VA_MACRO_TX_PATH_OFFSET);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -766,6 +985,8 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		/* Enable TX PGA Mute */
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (va->has_adpt_block)
+			snd_soc_component_update_bits(comp, adapt_ctrl, 0xFF, 0x00);
 		/* Enable TX CLK */
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
@@ -1511,6 +1732,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		default:
 			break;
 		}
+	} else if (maj == 4) {
+		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_4_0;
+			break;
+		default:
+			break;
+		}
 	}
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
@@ -1576,7 +1805,15 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
+	data = of_device_get_match_data(dev);
+	va->has_swr_master = data->has_swr_master;
+	va->has_npl_clk = data->has_npl_clk;
+	va->bypass_fs_control = data->bypass_fs_control;
+	va->has_adpt_block = data->has_adpt_block;
+
+	va->regmap = devm_regmap_init_mmio(dev, base,
+					   data->regmap_config ? data->regmap_config
+						: &va_regmap_config);
 	if (IS_ERR(va->regmap)) {
 		ret = -EINVAL;
 		goto err;
@@ -1584,10 +1821,6 @@ static int va_macro_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, va);
 
-	data = of_device_get_match_data(dev);
-	va->has_swr_master = data->has_swr_master;
-	va->has_npl_clk = data->has_npl_clk;
-
 	/* mclk rate */
 	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
 
@@ -1761,6 +1994,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);
-- 
2.34.1

