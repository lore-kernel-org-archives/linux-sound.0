Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F073F413E
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033669; cv=none; b=mazWkK+Otu24n1/O6YqKN0AR1h5lOC4J/V/0kInBqp27pu5nuKFzOy700C2w1+y7QLXGAl/LjN7ae2MJfNqnzJ0i8UfjLvHuLn00f5M4AaaWXdK3sWjDnkwS1cMCMAPmCrUFBi2IuSkEELWKKfMeeeeIvxQOpDDpCN6phNC0OcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033669; c=relaxed/simple;
	bh=M6c5/i0CM590syILHdDolQBFUa+MwwGEnP4OLNSWlDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMe1o3THqpo09IMMtpcrz8vvaibCsttPWwceAfb2WFfXzrIM2TfI3ko3AckVgenCv1esD6fHlog7TbJgJLVcnw1GTIiRjN/KuJ1hm5QoOKi7c/Yt8eAQ+BUT2DIPwKBVmz78W54df268dTYPrWP3wP/OD+xbgBUPC/9uy/NG72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpWzBGfo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXL+x7NX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpWzBGfo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXL+x7NX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8ph9Y1589420
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Gh/QRQjqx0e68AfExhkl/GMBQXfWx0JB0UtoXAYTpY=; b=PpWzBGfo8AbhltiL
	pFPmi8WNKiknncMBOc8lm1tKXPhf95gTO5DVIV2jtpk5dCVT2RzBTB5IRYJ8gUBU
	gXItKYJOcu3FS2wiozkfezz3kN46ZU5NhAzMGuoeisJZf9AyFkyhXGu6nNAsXuW3
	GYhlGVDCUVEiureeMX8G2s1NYiOnrp+qisXkC9Hn9JVAA3SNAo6NpzKEE1Sy1JY0
	05f9Pwza5Wko0EhC9Iydd0brXCeRUihj0AKNn+Bgt2CTrhNFIrAiFrgJqeb7uvyC
	YWBY2PXWz6/d8yf303Sg7HnZ/X2oYMKl02GkCu5MGRWciCyldPRAWxKW6sP8lprt
	lQ3ehg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhb5ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so2740858a91.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033664; x=1789638464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Gh/QRQjqx0e68AfExhkl/GMBQXfWx0JB0UtoXAYTpY=;
        b=SXL+x7NXq3n4keeM1/GhAWwMChvi5DTjBwWh/akhz0EIcPIKM87CEMN5WteEAlgu8t
         zL5Pv9hKr391+yXnTxUVDBy26ESZK103YBxNWSOkva8Np3pH6NlF+0DLJjgvhFqLJQOC
         /b5jNQW05cdUDUdrR/dgxKtfIDitQ+yXH44WCIpLeAhBkSKLCKvk66SY2i9oX2348Hxv
         UAFEHkGdLBb9hrP/dekmQlQPCPHoLAb9Vp4eqmed8F949MsyGVFHMZWPhyjfTM4k6gtk
         0i2DefWFNLWLiRFoVuHnq+yD93RWvazRZyP3GV9WDhhc4bYHFyuKEXRN5UL8xPYwpPZj
         ZYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033664; x=1789638464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Gh/QRQjqx0e68AfExhkl/GMBQXfWx0JB0UtoXAYTpY=;
        b=WQfwT9/s/hzxI+X92cv+myNDMi9f2WaLE4bAIeH8KZ9ZHn6h75uWW27kOtHbQUCx8q
         yUNE0YNgNjc5j76tIf8ze+FO47Ma4RWLmCPsu+xnSalAdAtx/hr4IFXPrFmGkVUuICoQ
         7qCxGe+g8E5gAYUmE6LvLhE1n0fMrBMYXZbOWQ1/KLXcjOqcErzwiCWQXJ+RA9Ekmghg
         VINKx5CJCVOrefaEvmty12ah9acnrvq/Iqs0Mammw/ngvnQgQt+f1z3WA6YHEuDxI7FV
         E7GXWDeKREc7bdjWY3AZ00rvCf1QqbpOnNJiR+YgtaLpvKF6H5CZv+yxXxP17sZrdDWD
         JyKw==
X-Forwarded-Encrypted: i=1; AKwUvBwvYUxDyNqS5SaEcoVCC3cHkU3cgwIT72pxevRPSkE7hbGYd1G7aBkcue9g4hjLBol1ycqlBrGKWyQikA==@vger.kernel.org
X-Gm-Message-State: AFuF++nG4mP5u4/a4ZPvKxPyfgmc9kX6b0YviUcRhFI9Ies/xNKFePv2
	S+MUbE1h0Iux9C3pYtP+L8Vcr0KVcs7nA+su2JeZ5fb5sBI6ApDj1Zr+JO/X80XPdbDmEFXHqMQ
	Uvo5GC2vlg/ez6kdY7WB3xVykAcigi6bjHBlVFUHMYbFd1/lUTSMRE22exKXvNJkatQ==
X-Gm-Gg: AYBFou2W3ylv/uCOhDYQiqjLcYjOu2tfkKbA8xJKRELeXxwCFjX3he4EGUTPZXfTkSV
	4tovR4g/DNeaNcZ9HNTD7zD83v/ct4cS1YtSeFhbYk/l+pXUh0b02jMKMXIBcUzCfTe4GhcFA+P
	W/dK8srw6bl/DjM3p7ZG3xihSG4zmAC3vmcBbFrGzyWx+SlsUcKtBFPOkExNKhAS0X8SKOHYeDq
	3X6ZOr3uuSG9mkWWBUbMpwMDxBYhYSYLI+kfBKgKDlvQrrGwSgsgAyGWNE8Cn5ykMOca9EYStwZ
	+jY5xXtygKHcClldiLdb1UqZXdXBibcZIVkL0MdoauEBVeej9xgOTM0QUSabl6HfiW+npnn3OCH
	SrDFy1cuAj1wsMGaOesVNq0bU4/rROSVk2Q9K
X-Received: by 2002:a17:90b:52c8:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39d70b4a12dmr10523130a91.14.1789033664422;
        Thu, 10 Sep 2026 02:47:44 -0700 (PDT)
X-Received: by 2002:a17:90b:52c8:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39d70b4a12dmr10523068a91.14.1789033663897;
        Thu, 10 Sep 2026 02:47:43 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:43 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:56 +0530
Subject: [PATCH v2 5/6] ASoC: qcom: lpass-va-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=14191;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=M6c5/i0CM590syILHdDolQBFUa+MwwGEnP4OLNSWlDA=;
 b=Xh2Km7eiLa4Lid5ysCOLFtDngzfRl9Tj+C7Cau5lAfG35tPhVM7hlWunrzL9oYElMId4NS+gh
 qOkzSdzu3iTDxGci3SvK3bzYPWxzb3Kv46KgdQlV+ogq7vA0cu53Chr
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX2iV4s3zGSOlh
 nAPp7E5mQ1wqinY30b2OsYfP64C32HR+SRDqpAXAmijwHjOziq2YH78qq/mhi+rjN2Y/Sd4AVtP
 +AytLIWRGOikn6BFoef8YwbSvinghKkCnHDknwm1g599CS02R+7QPC1AblPqkuyPFQeI0utBwyC
 ds/QZPHuCnguZ0PUYM+perdIoLvJc6Ay4DqiVOAR539qV9iyUX+RVljT7XcEx8iDBYcz1Mwg3Zi
 SE75f7s+/YoMm/VeFA0avh6TJwiLJI8u1GTPS9t5/IGnDE7yGlCs4HMJTIlklhsxbLItKfoFkqE
 +s5PS/dHFoMUMKvyFO6A1T2zfLcCPMfbhq85P6LaXMOz0Krgx9CGlakmo4k0NtnRyABRR5/m+9J
 +5U5jY5lQ4NhK3/ZJjO9YBuxS1B7GFLXSXi9nX2IpouXh2oWAJmuoGWNW839+P2QAQ+s5BOkMSl
 0h883r89VqmTVIsb1bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX2t0WMZtETKuc
 aX810idt0wt5ZgLbuZLTLnsNsgUrgKlefIDoEu11wI7crh1RHVzbKrqF4/NdvrKvMA4xukj+7Sb
 kbYktP7AqOcnjjLF90TlKX9HLHcGc54=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa27cc1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RZsqW3wcYVDWd2ZqgEAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: bilTQePkc7-EotEG66ViRUwdc50vg2Jn
X-Proofpoint-GUID: bilTQePkc7-EotEG66ViRUwdc50vg2Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

Add shikra specific VA macro data and register programming needed by
the LPASS codec v4.0 implementation.

LPASS codec v4.1 extends the VA macro with four adaptive filter (ADPT)
blocks at 0x0800..0x09a4 and requires the FS counter to be bypassed
before it is enabled.

Add the new registers as a separate reg_default array that is
concatenated with the common defaults at probe time.

The register layout has to be chosen before the regmap exists, i.e.
before CDC_VA_TOP_CSR_CORE_ID_* can be read, so it comes from match data;
probe then cross checks it against the version reported by the hardware.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 228 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 221 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a3b3af0d7..8353921f7 100644
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
@@ -210,7 +258,6 @@ struct va_macro {
 	u16 dmic_clk_div;
 	bool has_swr_master;
 	bool has_npl_clk;
-
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
 	struct clk *mclk;
@@ -237,6 +284,7 @@ struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
 	int version;
+	const struct regmap_config *regmap_config;
 };
 
 static const struct va_macro_data sm8250_va_data = {
@@ -357,6 +405,127 @@ static const struct reg_default va_defaults[] = {
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
@@ -430,6 +599,10 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_VA_TX3_TX_PATH_SEC4:
 	case CDC_VA_TX3_TX_PATH_SEC5:
 	case CDC_VA_TX3_TX_PATH_SEC6:
+	case CDC_VA_CDC_ADPT0_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT1_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT2_ADPT_CTRL:
+	case CDC_VA_CDC_ADPT3_ADPT_CTRL:
 		return true;
 	}
 
@@ -463,6 +636,27 @@ static const struct regmap_config va_regmap_config = {
 	.writeable_reg = va_is_rw_register,
 };
 
+static const struct regmap_config va_4_1_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
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
+	.version = LPASS_CODEC_VERSION_4_1,
+	.regmap_config = &va_4_1_regmap_config,
+};
+
 static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 {
 	struct regmap *regmap = va->regmap;
@@ -471,10 +665,14 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
 				   CDC_VA_MCLK_CONTROL_EN,
 				   CDC_VA_MCLK_CONTROL_EN);
-		/* clear the fs counter */
+
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
+
+		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
+			regmap_set_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+					CDC_VA_FS_CNT_BYPASS);
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
 				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
@@ -503,7 +701,7 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	if (mclk_enable) {
 		va_clk_rsc_fs_gen_request(va, true);
 		regcache_mark_dirty(regmap);
-		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
 	} else {
 		va_clk_rsc_fs_gen_request(va, false);
 	}
@@ -749,6 +947,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	unsigned int decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
+	u16 adpt_ctrl_reg;
 	u8 hpf_cut_off_freq;
 
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
@@ -763,6 +962,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 				VA_MACRO_TX_PATH_OFFSET * decimator;
 	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
 				VA_MACRO_TX_PATH_OFFSET * decimator;
+	adpt_ctrl_reg = CDC_VA_CDC_ADPT0_ADPT_CTRL + decimator * VA_MACRO_TX_PATH_OFFSET;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -772,6 +972,10 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 		/* Enable TX PGA Mute */
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
+			snd_soc_component_update_bits(comp, adpt_ctrl_reg,
+						      CDC_VA_ADPT_CTRL_EN_MASK, 0x00);
+
 		/* Enable TX CLK */
 		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
 					      CDC_VA_TX_PATH_CLK_EN_MASK,
@@ -1526,6 +1730,14 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
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
@@ -1556,6 +1768,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
+	data = of_device_get_match_data(dev);
 
 	va->macro = devm_clk_get_optional(dev, "macro");
 	if (IS_ERR(va->macro))
@@ -1592,15 +1805,15 @@ static int va_macro_probe(struct platform_device *pdev)
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
 
@@ -1775,6 +1988,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
+	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, va_macro_dt_match);

-- 
2.34.1

