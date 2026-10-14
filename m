Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83247669E
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969259; cv=none; b=uSvy6km5NX17RoN/m6OOLKiXc2IwfHrqViFo6Wsgbvt6WvEHJICMQU28rm0OHIO6nN2lq1toio6IOfy+FMlLeBdlZDK3jpnugRHzXfy+ONdRtWbaH7v48xi3GK1nDpJz4wE2G1QJSRkjuTfZHsEvg2W8SiDggjkcR2HG0v+JX+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969259; c=relaxed/simple;
	bh=O5QLSQH0/j5Jlk06PjOViRl2eszywnRmGhTHxPYRkAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQLEsteAPMTzEpdvkCroBcOjqe7H9cJrmokIMgP6pbaRy+uadrWY13KVIGpb8LiRiXLqib4YTn9n82qKQLNz3WtaoPLOjitp8kPchbBjaWZdFCV5JjTHcAWUOxnuEWAdul61SMDIgr1pZNLMCY1QXeF/lhWdVu46eONBi8wevYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXXid72j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwuFRLAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXXid72j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwuFRLAf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4ebON806699
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7NdeLGWxAKUgp/NAdy8eoT7Kl0GP5y117YGNFxLnpO4=; b=fXXid72jjwrE76CB
	ulWzImagmw6KREIIp0jZAh3M2GrnU6n6cwDeevdUy/Uz6UvY+sbDoT9q5rxmc9/t
	ipy9FmpVfSy6K9PEg45aFtdZUM9td1AB8BYce4JlUZYIwrVbPtTP9+wJdYkrPfJ2
	2c1f6C0o4D80+a5S7+yDW55jZA7uVz3cLdhtlavKfVd0GfNV7lxkrGF0B2whFTQQ
	n5GBO9+Qwe86yvQEFeOZ181tS2F9MfKnzZZiY//2U0mk4xVNl9Tr9TF8HfIVEfQc
	DpY/ma02GTjSTv4FOJA3f9/Dqlrx0cdDalf0/6PaKPVZkwVMYmdWNT66nzvvoml8
	ZUYeuQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6ap7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so8591565ad.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969252; x=1792574052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NdeLGWxAKUgp/NAdy8eoT7Kl0GP5y117YGNFxLnpO4=;
        b=JwuFRLAfvxSku+IKipS+Qgd9tWDuYTlKdeuz4DuI0vOxfbECYgL0ehUIuO70aajXtM
         wriMtuVyofcWuXF+nAAgDK/vDCJPxhUUtCD4mLHBeRnKwrjYzXy4i2DFzKOQuXCxwywi
         UE41Km3MKfpqZ7fnENkCC5/9LrQShe/Yigc30dDHoYz3agsz9+JU4a8Iv1GwIYc5SdRn
         8Fibhu/xPg8C5uHG3fxZzvQ6CmODwZ/W5GGUVQPoz50Ym+T886UCTB3iv+kPQUDS+FQK
         VcAhu3ISZ5Ft0hVjAMCIP9EgT00qTgUS7dYv0cV+wqvJJHBrKEmb1obnquIVu/93SZzJ
         oIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969252; x=1792574052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NdeLGWxAKUgp/NAdy8eoT7Kl0GP5y117YGNFxLnpO4=;
        b=ZT/6holAqzDXHrCcsWah3W6PfB22YBlQerHzEXXYP3FHMPY0FtTO2+UNXQRcV+qDiJ
         SkGNf/YQFQRzrfSB/UZrwW5AuTfs9T4onT7HLMijoWe75NVmA13ut7t5aG8W6KsyvhAf
         K74Ixz7og0dMg+omC9Y82SIBgICEpVxqlOGjD68LapiYadg3hSUyzR0l0YvONEgJv/V3
         2H4AQiTPeidrT2qpzMYcw5+PbMxR3OFGIs5BDYuNPBXjUhcDFghSyeFxtcS4cuP0Vshd
         M+lvqo7MhThwCAKshAWpg+Az/uxNFfhHYCJcyhprg50uUBsYa6sLTZglc6qQKt0gT5nF
         9LgA==
X-Forwarded-Encrypted: i=1; AKwUvBylETvXHwOxyb5eXlbFmXH8HcfcZO55nb0c64tVQ90CzKkj5UQt5r98OmMxfFVwjztAMclS9UboU7wwAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLkhp2BvfAGZrhnZN+4EpvUMH23zN5qD6fWG5pbunjtgforCrr
	kNjyIwFn3tSVAheuUPbKMWypdeEO1tDN9Iqer9i7wMBg+csUD3VxM2STAh6lscNdjBW/7WY2iOW
	eH6HdqFcUK9XgpCkH+RwNSpoB3/j+TxAWokGA/1rC+KtJMkNewN+/vZaYXtWDUcuoMiABiUS0yQ
	==
X-Gm-Gg: AYBFou32V8gQICHnaLZpBN1oJLFHuDEjubLXLWYpdFQs9OmT0kmRASmInbbwJzUvsPE
	FOLa6gwmHZ7CMZEHwn+2NWdvS9N2IRU1V2j4s5fTCZWF824P25tot5xQgwzaD5WAq/nosWrknaH
	vVVPwEnwFPxlOX7c0miel/PCAhX2Np/P3G/k1ySNgUkhB8jmdIMLBSoK8SSl77v63OJGcerSaGy
	ypv6xdwDNcMU7t8Jk6/zFjjwKMP8EmuCM7RY0iA8BvyMs1SJz9e+vvLk3WTtBKSVeasCkLR6Wte
	wgWC+sRAxAt0bEieLjBr9XafIsQYMLDrWQYsP9GP3XLu9gQUUeoYwHbQQAysGPh8eexFkYeBcNt
	j5LJV0MR1zoJ2ik+buLaHv/O3mjLz3JoK3A4=
X-Received: by 2002:a17:903:3ba5:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2e893b5dd03mr89427825ad.61.1791969251428;
        Wed, 14 Oct 2026 02:14:11 -0700 (PDT)
X-Received: by 2002:a17:903:3ba5:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2e893b5dd03mr89426625ad.61.1791969248923;
        Wed, 14 Oct 2026 02:14:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:50 +0530
Subject: [PATCH v5 4/9] ASoC: qcom: lpass-va-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-4-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=16895;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=O5QLSQH0/j5Jlk06PjOViRl2eszywnRmGhTHxPYRkAI=;
 b=P/GettZxAFz5ZDF/t+Cyh2XOxNFCdrxUPmo4UDhZFzJAqeKVGmwABEiQ+TDVyyRPGPOmBiRL8
 UCrjdMNBNwoB17YPGyfPP+iMxDm5cFjYYK70N0oT7IAItqVCqc6VwAa
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: rg_lBPpLjOKFHHa9lO5rNsTaYZG9d6Ph
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX76gbuJop9M37
 pNmC3PKC7PAX+u0rhXf2PnVW2tN8UrboEAWmJyuz8dtUnozW1zv88lIQA9J4o/InCwTdWITI47C
 hbeRORf2ld/YdeFZS+FjbnJio/EAuuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX+zs5tL7SYuK5
 dNDUf8whmx43zKTtlLRl4mR12QyHoipd77qIOGMr6+Jk7BggZDFGoUSkvd0td1SGPPuYi5y/Bui
 Dnh9nmqN9ColjDAEs+vDe2KUC38YQGnYxjQJ6EBzBkzhBfDZOMQzUdZ1WKKpKTsfH6UT+6GQ7kl
 1XTTDVT6vz4UBa1Cer4Zz7tY80IqvvyHl7bNgP0Yv2513Ldc5EWaDafhEAV0ZvqQ0T+UA7L0E9X
 1GpLRINFXkzgdUnRGwoe6Jl9apzWqeIzj1WsXsg+A+HZCifQppzc4WUMioZ75MEmp1mTD7Udmu4
 njt+euBgnegblyqB55NEnT9S5E9py6qIrfxfmjBAhoA1rQKCMxClYUW66AjeXxTRMhEMSHhKRfT
 h89efMTecDR9knLi+Dbv3hOivtjkdFmUA6ptJhDX5LDhT1si2Xll5DsnVVhdizicrxRGr4azfTh
 qdWE9eT/QAhAFz6bmng==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf47e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DfWgr_zdYjWxq2KhsJ0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rg_lBPpLjOKFHHa9lO5rNsTaYZG9d6Ph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.1 implementation.

LPASS codec v4.1 extends the VA macro with four adaptive filter (ADPT)
blocks at 0x0800..0x09a4 and requires the FS counter to be bypassed
before it is enabled.

Add the new registers as a separate reg_default array, used by a v4.1
specific regmap config.

The register layout has to be chosen before the regmap exists, i.e.
before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
probe then cross checks it against the version reported by the hardware.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 284 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 277 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 03d6434a4..53828dd80 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -26,6 +26,7 @@
 #define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
 #define CDC_VA_FS_CONTROL_EN			BIT(0)
 #define CDC_VA_FS_COUNTER_CLR			BIT(1)
+#define CDC_VA_FS_CNT_BYPASS			BIT(7)
 #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
 #define CDC_VA_SWR_RESET_MASK		BIT(1)
 #define CDC_VA_SWR_RESET_ENABLE		BIT(1)
@@ -156,7 +157,54 @@
 #define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
 #define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
 
+/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
+#define CDC_VA_CDC_ADPT0_ADPT_CTRL		0x0800
+#define CDC_VA_ADPT_CTRL_EN_MASK		GENMASK(7, 0)
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		0x0804
+#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		0x0808
+#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		0x080c
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	0x0810
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	0x0814
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	0x0818
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	0x081c
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	0x0820
+#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	0x0824
+
+#define CDC_VA_CDC_ADPT1_ADPT_CTRL		0x0880
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_0		0x0884
+#define CDC_VA_CDC_ADPT1_ADPT_GAIN_1		0x0888
+#define CDC_VA_CDC_ADPT1_DH_FSM_CTRL		0x088c
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0	0x0890
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1	0x0894
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2	0x0898
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3	0x089c
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4	0x08a0
+#define CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5	0x08a4
+
+#define CDC_VA_CDC_ADPT2_ADPT_CTRL		0x0900
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_0		0x0904
+#define CDC_VA_CDC_ADPT2_ADPT_GAIN_1		0x0908
+#define CDC_VA_CDC_ADPT2_DH_FSM_CTRL		0x090c
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0	0x0910
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1	0x0914
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2	0x0918
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3	0x091c
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4	0x0920
+#define CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5	0x0924
+
+#define CDC_VA_CDC_ADPT3_ADPT_CTRL		0x0980
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_0		0x0984
+#define CDC_VA_CDC_ADPT3_ADPT_GAIN_1		0x0988
+#define CDC_VA_CDC_ADPT3_DH_FSM_CTRL		0x098c
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0	0x0990
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1	0x0994
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2	0x0998
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3	0x099c
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4	0x09a0
+#define CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5	0x09a4
+
 #define VA_MAX_OFFSET				(0x07A8)
+#define VA_4_1_MAX_OFFSET			0x09a4
 
 #define VA_MACRO_NUM_DECIMATORS 4
 #define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
@@ -210,7 +258,8 @@ struct va_macro {
 	u16 dmic_clk_div;
 	bool has_swr_master;
 	bool has_npl_clk;
-
+	bool fs_cnt_bypass;
+	bool has_adpt;
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
 	struct clk *mclk;
@@ -237,6 +286,7 @@ struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
 	int version;
+	const struct regmap_config *regmap_config;
 };
 
 static const struct va_macro_data sm8250_va_data = {
@@ -357,6 +407,127 @@ static const struct reg_default va_defaults[] = {
 	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
 };
 
+static const struct reg_default va_4_1_defaults[] = {
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
+	/* ADPT blocks */
+	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT0_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT0_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT1_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT1_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT1_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT2_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT2_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT2_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5, 0x01},
+	{ CDC_VA_CDC_ADPT3_ADPT_CTRL, 0x51},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_0, 0x11},
+	{ CDC_VA_CDC_ADPT3_ADPT_GAIN_1, 0x01},
+	{ CDC_VA_CDC_ADPT3_DH_FSM_CTRL, 0x02},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0, 0x77},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1, 0x64},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2, 0x00},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3, 0x41},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4, 0x04},
+	{ CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5, 0x01},
+};
+
 static bool va_is_rw_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -430,6 +601,46 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_VA_TX3_TX_PATH_SEC4:
 	case CDC_VA_TX3_TX_PATH_SEC5:
 	case CDC_VA_TX3_TX_PATH_SEC6:
+	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT0_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT0_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT0_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT1_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT1_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT1_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT1_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT2_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT2_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT2_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT2_CUTOFF_FSM_CTRL_5:
+	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT3_ADPT_GAIN_0:
+	case CDC_VA_CDC_ADPT3_ADPT_GAIN_1:
+	case CDC_VA_CDC_ADPT3_DH_FSM_CTRL:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_0:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_1:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_2:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_3:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_4:
+	case CDC_VA_CDC_ADPT3_CUTOFF_FSM_CTRL_5:
 		return true;
 	}
 
@@ -463,6 +674,26 @@ static const struct regmap_config va_regmap_config = {
 	.writeable_reg = va_is_rw_register,
 };
 
+static const struct regmap_config va_4_1_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = va_4_1_defaults,
+	.num_reg_defaults = ARRAY_SIZE(va_4_1_defaults),
+	.max_register = VA_4_1_MAX_OFFSET,
+	.volatile_reg = va_is_volatile_register,
+	.readable_reg = va_is_readable_register,
+	.writeable_reg = va_is_rw_register,
+};
+
+static const struct va_macro_data shikra_va_data = {
+	.has_swr_master = true,
+	.has_npl_clk = true,
+	.regmap_config = &va_4_1_regmap_config,
+};
+
 static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 {
 	struct regmap *regmap = va->regmap;
@@ -471,10 +702,14 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
 				   CDC_VA_MCLK_CONTROL_EN,
 				   CDC_VA_MCLK_CONTROL_EN);
-		/* clear the fs counter */
+
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
+
+		if (va->fs_cnt_bypass)
+			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+					CDC_VA_FS_CNT_BYPASS);
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
@@ -503,7 +738,7 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	if (mclk_enable) {
 		va_clk_rsc_fs_gen_request(va, true);
 		regcache_mark_dirty(regmap);
-		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
 	} else {
 		va_clk_rsc_fs_gen_request(va, false);
 	}
@@ -749,6 +984,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	unsigned int decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
+	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
 
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
@@ -763,6 +999,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				VA_MACRO_TX_PATH_OFFSET * decimator;
 	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
 				VA_MACRO_TX_PATH_OFFSET * decimator;
+	adpt_ctrl_reg = CDC_VA_CDC_ADPT0_ADPT_CTRL + decimator * VA_MACRO_TX_PATH_OFFSET;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -772,6 +1009,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		/* Enable TX PGA Mute */
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (va->has_adpt)
+			snd_soc_component_update_bits(comp, adpt_ctrl_reg,
+						      CDC_VA_ADPT_CTRL_EN_MASK, 0x00);
+
 		/* Enable TX CLK */
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
@@ -1526,6 +1767,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		default:
 			break;
 		}
+	} else if (maj == 4) {
+		switch (min) {
+		case 1:
+			version = LPASS_CODEC_VERSION_4_1;
+			break;
+		default:
+			break;
+		}
 	}
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
@@ -1547,6 +1796,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	const struct va_macro_data *data;
 	struct va_macro *va;
 	void __iomem *base;
+	bool has_adpt_layout;
 	u32 sample_rate = 0;
 	int ret;
 	int rpm_ret;
@@ -1556,6 +1806,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
+	data = of_device_get_match_data(dev);
 
 	va->macro = devm_clk_get_optional(dev, "macro");
 	if (IS_ERR(va->macro))
@@ -1592,15 +1843,15 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
+	dev_set_drvdata(dev, va);
+
+	va->regmap = devm_regmap_init_mmio(dev, base,
+					   data->regmap_config ?: &va_regmap_config);
 	if (IS_ERR(va->regmap)) {
 		ret = -EINVAL;
 		goto err;
 	}
 
-	dev_set_drvdata(dev, va);
-
-	data = of_device_get_match_data(dev);
 	va->has_swr_master = data->has_swr_master;
 	va->has_npl_clk = data->has_npl_clk;
 
@@ -1654,6 +1905,24 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_rpm_put;
 	}
 
+	va->fs_cnt_bypass = (lpass_macro_get_codec_version() == LPASS_CODEC_VERSION_4_1);
+	va->has_adpt = (lpass_macro_get_codec_version() == LPASS_CODEC_VERSION_4_1);
+
+	/*
+	 * The register layout comes from match data, as it has to be picked
+	 * before CDC_VA_TOP_CSR_CORE_ID_* can be read. Now that the codec
+	 * version is known, make sure the two agree, so that the ADPT blocks
+	 * are neither programmed outside the register window nor programmed
+	 * on a codec that does not implement them.
+	 */
+	has_adpt_layout = data->regmap_config == &va_4_1_regmap_config;
+	if (va->has_adpt != has_adpt_layout) {
+		dev_err(dev, "LPASS codec %s does not match the compatible\n",
+			lpass_macro_get_codec_version_string(lpass_macro_get_codec_version()));
+		ret = -EINVAL;
+		goto err_rpm_put;
+	}
+
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
@@ -1775,6 +2044,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);

-- 
2.34.1

