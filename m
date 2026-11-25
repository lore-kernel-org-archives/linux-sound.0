Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603125;
	b=lz9zCIfMfg4XqCx4iUTbTF39+HFb7X8i2eJyIYVYF5chqHsq1gM7fJjJ9C5opRlLZbDs
	 qRj/uTtSy/pKyTlpV+s77IL6FhHPbY0lbm6yAamSJkGb5V4bu/sGF+LtRwm6EHBJIfJ6U
	 ZNXi5JqHa6NLaVYe6R4CYGQEq0hkR8eCgvUn2c0zC8asckYIf+5uAdMdKz5R64idez37j
	 +vGWWJ7jXeJ/StYmfixrofUkqqB95ify+jX2Ysvisv56fKYBNRA1HfOL8ncx+D+at0FA3
	 nAeicIsHMoMq6JpGJ2r1fLjuqBe7vh5mr6Ii6nky86SikItKOws/IOBv8Rmd0TwZMSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fzicQ3QTuDErVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=;
	b=eTHtcYNfeU+xxFAVvzJqYbGqDlenaqXuRGC1GBZFnOgvxUn47GmmNFEsZT1EXA1uin8m
	 pbyrX4l21D2zCPKNQKlMSJRPToRQHI604F1+vQffEgGyO28BBeQt1swdyAdv78EKuFpG7
	 bRw7cEZTYhH4w0bPyh50wziZ9EJjdxZ++jH633w2BoqUEVZ5Mf5CGN8RhO8zeqlG7K3g4
	 1sVYzDPTbQpib28eZxqJ1EASqpfaHQ7ymOBORAm/GBw5kdPIQB7eIZabE5FYQ1bUZS6gj
	 oGk95bQEEC7DruuQ7B+Fzb8B1sIzfwCkLhBNtLpMWnHpcWvRz0dSW0pQJZf4q2YdcYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKFrx1JK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SuJARTBu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C18606A323
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C18606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKFrx1JK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SuJARTBu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mdfJ3127767
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fzicQ3QTuDE
	rVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=; b=oKFrx1JKXh7wg7Hbh/H93858FAt
	UH5xZQnK6nqwNikrqK4nKFQaASqArhPXNgc+vBf/J7X7rDngR0H6KprAfYJ4G7CE
	aAcDe/jGB5S7qbHJFrnpmDE1A5MKn6ZGOdYq4yArhMWBJ9FfaU3gNeTHLNVnVcTW
	8i453HHDP3wMBlEDWTR+p/f3PN628tQJSLMETKx85x435wWhtAJIJ+rK/2RWm24O
	USWegBM9/fmrNmtHF9UpYFTLV7aE6R7h3CYiskyX7a6gnVA6ayyiLrQXvNq1gJNk
	zNwTjwA0XDYLF+7sh7sAhCDdZYkLqnrSgOKGSywkn61LBrMhWgdOwkjl2+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbqvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso167764485a.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603122; x=1796207922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzicQ3QTuDErVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=;
        b=SuJARTBuxiA0Ip/HoyPxxjf3W/NksjChDV6aojqPdaAnNefEY20zhDM4Xggt/vOlD2
         4xskKV95IqVeW7R0G6j0Q9zRhwynBbNyMuVlE0dhqrYiFBow8dxGIkC+dcYWmg6I63Ua
         wFAeRSmfDWHGbA4zJPe0Ha+RsPDeUH5RSasmoPN7+rvAEsg86xokEBNhZYzQIobgcdls
         RzKpuDJPxWrlDPn0zQUy12AYxd6WXEVJvnXkNcdq+ur0CgQ8it2Wlfe/0PvZvXLkoPmy
         me/soRIFSqb20PTkq4Ik/JD2ftEjFlpiKnvcdm16jGf+Ym6U6OiWiULUyb4BHC2rQIGv
         ZXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603122; x=1796207922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzicQ3QTuDErVEBVTep9aXtdHMEI3HyITXZ2yUgy0/Q=;
        b=bGwtm//gOJNKkKlk6046m0wsZzwJkuvnVVff8GPJ1M1ZDkL4lEqvMv4KAMYS1Pd5jt
         /E1enIjHvk+oJEeK2FuK/DjOJRrYD/4BAUcxVkcntJ3a9tfnuokNhNBPt/ML2x46MUew
         GLcwI6IdrkFU1c16dgrAULGRr1XjQZeYT1wNEvkpjfT14E5leZKhwZKud0B2ZJin+pre
         1mK+idhxN7WuenfW19hj+JhX1uyFRFIblk6SW8SuFAi5W1Q/qXcQoLAyGtvxX/CwsEh0
         veEilHQC44Mvx7J9z2IIoMG+qgR6pHgyDVhKaJQv4v8GyeyzQqPEKOxsLAvqQYfDxvt3
         mhJg==
X-Forwarded-Encrypted: i=1; AL+hErE0lY9yEUedtqFM/saVgJL89JKD0k0puPr4iKhExnT8JzpsNkh/HW+1g2Yn9j5HoYNolgfaWWtDTMHu0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+E2Vi1zSuC6m0TcoVD6psn6yyb49+RHJZk8f6PyZVAQtj0/Dyp
	kM6Pn8AwzicE/W9bqtviW4m1k7TQKFysihIHdkSm2WzPiHSQ+4RHMH0ivobBpkcgkfNyCP4u53S
	KS+tlxmEJdU7oN9pcuVpf1VIAWTKcHaV3o3HaajUhS+2UPux7dJb+SxL4TDRikVrjgA==
X-Gm-Gg: AZFdTZcuYP3sostz3EUsL5JHP2V1atk6+IzZUas4JR/zxhoLDWf2EMxqy0+kxdj4QYE
	nLJN3t9aKCFa04PWu03ANzzcEsxBZQJzrrmifADucVrgRvQFt/NL59N9o09QQm9t+i0sbpM19qj
	pXCttiV6hBYCzB/I3ZY1kJj6qc1s+qptAc3oPltniLViLbL02+iDvZDEGpBOzDFAy3M34Lggj0U
	aUqqPul1zZF+S+GAYNUiIRRFXaANyH6cN4xSFsAt2nEqtZBK7fSmI/gNGNRWvh4XeYMrRVSLWOz
	eKU7zKfJVoog/PJ+7EdTiHy3YO7gaIXc/aA/5Hd9+X0UyDzWM4h4OY9zrXVaW/ozKzZ/IoQS4Nh
	wswCM6cEO1JS79AOHzSwQw4z1vltp7wxZFmhUhXak7jYO4ulECnKKGKE/6G3pPx3G
X-Received: by 2002:a05:620a:7001:b0:949:74d8:4715 with SMTP id af79cd13be357-949bab40c18mr2679226585a.52.1795603122541;
        Wed, 25 Nov 2026 02:38:42 -0800 (PST)
X-Received: by 2002:a05:620a:7001:b0:949:74d8:4715 with SMTP id af79cd13be357-949bab40c18mr2679224685a.52.1795603122064;
        Wed, 25 Nov 2026 02:38:42 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] soundwire: qcom: program SSP period on multi-master primary
Date: Wed, 25 Nov 2026 10:38:25 +0000
Message-ID: <20261125103825.936939-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXy5kPxwgc66Cp
 KVQVz/XomvUa4gJGO31WPtMzSaS0axN6MdElXLVyXmtmUjg7C4uu3/dFWsD5EIb9dZsnmhonG+i
 fSPJT5LV1UI4en/dWyDkpub5JUed8sI=
X-Proofpoint-ORIG-GUID: 3xRgl5k-3hvCrS3aqC5Xct56QzqYpNYz
X-Proofpoint-GUID: 3xRgl5k-3hvCrS3aqC5Xct56QzqYpNYz
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06bab3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_oLpC3fVWoo8R2-12qgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXzyfCOtenhnHO
 w+iNSpzFM5IvBNhAwElqL9Sih7udyp49vpGPiHZqj2vp0ahx59L1Rqxt7cJ/Maa30ALhQFUgO3C
 fWw2XT5lO6fclzIVpPUAMghShY15FyfzMHi3oG7BSd5+vog8sj1JA7+7t+LYbpP5kHEE6Su6U2Z
 DMIFmesWqJRSiV25wPBf5dob3Yx1CfPvj6GwNUJHGFhyDZ/AmkPQEX8txUNPjchGnwkSbY8CMpZ
 M+DJoH7Y0ovPUt/tohR/9INHAyt/83R5k3m2zqrROcXIUnfybpCTo9w6/+B423c15hTkP978XBd
 MKql8gC/ff+VQ0n8AjZ0NjqyquR+dTKP/wRHd+J6ytbw9DDkFUEAIcVW1iBUaShp4eW6xpbVre/
 Rkqv3JZQjs5ElZjrGq+1nBL9VKmyoLLhQlHUORSRxiYGM46xoeZ0hXiKb6QHQeaRfyg/V9N3zPB
 k0rcgffmYWMc8k0TcsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

v3.1.0+ frame generators derive the superframe boundary from the
current row/col geometry via SSP_PERIOD in FRAME_CTRL_BANK. Program
it at init and each bank switch, and zero CLK_DIV in the same write
so a stale divider does not survive.

The primary owns the clock; the dependent mirrors its frame.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e0392f3cda34..3476edd7c423 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -108,6 +108,12 @@
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
+#define SWRM_MCP_FRAME_CTRL_BANK_CLK_DIV_BMSK			GENMASK(10, 8)
+#define SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK		GENMASK(23, 16)
+#define SWRM_INPUT_CLK_HZ					19200000
+#define SWRM_SSP_RATE_HZ					4000
+#define SWRM_SSP_PERIOD(rows, cols) \
+	(SWRM_INPUT_CLK_HZ / ((rows) * (cols) * SWRM_SSP_RATE_HZ) - 1)
 #define SWRM_MCP_BUS_CTRL					0x1044
 #define SWRM_MCP_BUS_CLK_START					BIT(1)
 #define SWRM_MCP_CFG_ADDR					0x1048
@@ -1005,10 +1011,16 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Clear Rows and Cols */
 	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
 	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY)
+		val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK,
+				  SWRM_SSP_PERIOD(ctrl->bus.params.row,
+						  ctrl->bus.params.col));
 
 	reset_control_reset(ctrl->audio_cgcr);
 
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY)
+		ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(1), val);
 
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
@@ -1191,6 +1203,14 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 	if (ctrl->peer_ctrl)
 		ctrl->peer_ctrl->reg_write(ctrl->peer_ctrl, reg, val);
 
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY) {
+		u32p_replace_bits(&val, 0,
+				  SWRM_MCP_FRAME_CTRL_BANK_CLK_DIV_BMSK);
+		u32p_replace_bits(&val,
+				  SWRM_SSP_PERIOD(bus->params.row, bus->params.col),
+				  SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_BMSK);
+	}
+
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
-- 
2.53.0

