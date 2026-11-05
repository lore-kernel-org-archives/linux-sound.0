Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877088;
	b=cxxICZJYzoG6OV58d3mj2IdhFLDhzZv5y9VhEWWhcbrWT5miR5xCZ5rlAmhJkQNlSAGc
	 EDZIkAOZNAJNxxXVkuilwy/341HC7iBLO2H8rw3DWYojkpcGKeUYtFAgvcYDG+GAQeYV/
	 0ju9T1zYe9F4EPMAGPPQNmM/VFiS+A9pzVvDZPxGfRbTkA2GyB1dp07Vxu8KmuXDgfAD6
	 9hDWJ2aXH+VuEuDF+2uvgw+bk2Z+BsP5ub2vmPhd5owXK79HGF59CuKzZGDckVE+LED+M
	 iQ5b65y5JyakBm5TgRoTVjWV1tCUNt13M3KzabpDpLB3JoZ84kU2BX+F8O7ArkJkiNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=;
	b=jbnkN5TfiAnscQZyPfFQw6z8qwhN95e1qC1ijtNW8oWuYcJoJ5ZeWlJVB0hG5cd446MO
	 Hk0AUiCEnkD3ErkIRl0DwjkpiJ3bDlSlUsY70dABudGN9UhZM5s8V31HH3gy2NKqjX2I1
	 mkvdT+hrf2o80DovtAY3rn/YquP2CUSAUAGEa3ArkzZK+EFQ3SRX+zfYbJ9le74eb1Dtd
	 3T7YUdP7EcOqlYzk2CVg/FIfszlztzfqzlbvqwAgGHX8iQvZp/UhZY6U9DGQnWzSKaHlt
	 LUSx0KwMZUHGQbEPLfhQdib4TbTUaAb5hECptDPGyYlmz10bDBKOn6+SYG+BtwpUzMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es47JMSM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+VUQ7+c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93354606A33A
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 11:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93354606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es47JMSM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+VUQ7+c
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1ZPe1416610
	for <linux-sound@vger.kernel.org>; Thu, 5 Nov 2026 11:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=; b=Es47JMSMkm9WQNEF
	GE1tqZUecSswgAAb3bTuUiKpKVqLKqGPF6v0AwuRWH8JvNVLS1XQ8z2g9MWYfQSH
	dSIOWTIAkxDUNGKTTbIG9FYhZoLzLHSvRxdDCAXXWq7A0E0PSP41R8E+l/jSBNdr
	F5W+DGHHNPQTIHiqgWetIvPrS480zfrPQ5r4Ch0W/pEnfDe5vur3HdB+/R/99ljU
	WIagSnk9qsZv9aUs5dspIx7ycveWHJjYumj6iN3m8XpmLI7KIpGNHG7A0iUjDUNQ
	iTdf5eywcOxNNpEH1Sle/6KKRIN0n52t8YZlTxRciWo2j1XSah5SpuJENE+TJhl/
	AxRxow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd08p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 11:11:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so701007a91.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877086; x=1794481886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=;
        b=U+VUQ7+cEmFAY5EApVBQWkcAT1+1zj4uu67vGZqsR2gkCvl5+CjPHuueFgGnJyf64Y
         b/rLrwmcGl20cE7mROn4O50wB8Xy2b9/gHycp/NVWfFTdv+axA2A1A8Eif1F+2jFX5by
         tK6qUiB6iAINbA41OojpOizcU6uIqtbFw+d+m+XNfcVvZ1NzQd2Q/moPUtdDmgXJU6m4
         aaQIBpNa7QE4mUVqzTAKozk0iUCcnhFcAdKCQWWd1IlbMbDcTloR67+zTZpCv3lkTY4i
         NPnW13xuzOUWrZLFemq6l/uikGTKDLbk3sHgPKsnmdJy6hU8uG1cmb8kfzmAiM1yweZ6
         eoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877086; x=1794481886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DR3Xb9Kw1won80ulFmI5h+BGIxFd8nVl4r4vuWFwYwc=;
        b=iNjV664Q0IMlH3tvCQbz0uwDIkBT/JgCQUwThI2n9iwrhvWpm8uKeih6uqHFAS6r7f
         OoUxxDpBNL0hNwV68e/t49MbJrQHxGJZ8fbWMxW1uhNhgqsPV64iFB7l+/IY2TBUuZcV
         oIjt8QyNIRFaRAMxLr1nlpyKTIvwuF2IrhoT+wEEy8V2ZAqeLQFSEDaypxVepZMG5UAa
         1ciJphh5+/slEPWEbfRok4zvlXqGlmolZ7DgJxrx6YvRkTbP31PVg6mDEPuJYgSoAOlp
         ivR3Ui/DCZmxIsh3k7dG5N0GhM4HU5qVOMWQqWHGgcKVpYHVcwMoe1i/2363a4Odp5JJ
         v7MQ==
X-Forwarded-Encrypted: i=1; AKwUvByeS0cAfpia0OWHuG4gJ1LGsoBF10GR6AXUIB0PbEBNXIAKGinqdiZmJiNlCtJraUx4Iay/BToEnZQKTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SG13XLgLL0POELTirzTfgtfBPAp5Qvkq6ZbUEFIFim/xSXJqA
	z6w7KEIYi0ueWq7ONHwwnTf01Nlb9wnRpMWye9G4Rzgwvt+3FOa6rcAtDy1DU1qiF8OdS7hJJnu
	6BW2R+EwYtBob8+kWNKbvGFh74RELC84zKCCCzaLyR//FknAQ3fpBpGOZyGG1L6JR3w==
X-Gm-Gg: AYBFou0zkGJpHN8AyBGLkQ971dcXulZAY5hbXgY2mOxUGSY19WHY5XENXGgfzqa0Y4t
	Ihg1nflMH576S+3ohV2SUVpnKLyvdr71gRzXTs858gB661thUdQfbqEIk4pMfdY5PkSZbtIjCR2
	W9ZQoAqWHJj5ux9K1eTAra5JB1cUGhIQ3A6Rbxvf+qCj1IvNyHx8PJx5oVmgB33lGZnnvC/szBE
	AD1EUXuyL6VnL+IO9gb9zsD/3VbqmazwBBMXcPywMdmhAmoEM+ToFhDIYP879Knz+Xwawoki3oj
	Z3+ZqjZRP1r0YxwpLKdK3FCimAkwR2wyIhrU7y7/lVpQtxHaijoMh5WRzJojLRovc+4PNKJPq82
	5E0InsShFEsIm0XS7qUZphV1Ts5bqUgj9y8TGNFdOxFPER8BJMwYMZjBfrQq/RI04yEh69y3axs
	xX0yljE9h6
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1287722a91.43.1793877085962;
        Thu, 05 Nov 2026 03:11:25 -0800 (PST)
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1287696a91.43.1793877085433;
        Thu, 05 Nov 2026 03:11:25 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm3384737a91.9.2026.11.05.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:24 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:40:43 +0530
Subject: [PATCH v2 v2 2/2] soundwire: qcom: Add set_channel_map support to
 SWR master DAI
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-soundwire_channel_map-v2-2-5efe2021552a@oss.qualcomm.com>
References: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
In-Reply-To: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877069; l=4177;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=tew798NPD3BPCPOd+vJoOsosugK60akzmp3jBtzKFiE=;
 b=finD1DqF7yDMGzDAmEeqDbk9Wque4jtTqe0pjAqtoDjc/8oi7vzICpPknTaMUlJMCUekkwcBF
 S+FznDf9pSkAvp9N4s7HgJn9OktYajzuJBzKNm0lrHS6/XSJYGrSvSr
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX6o1C+Upwwl3Y
 Xq+TApP9yOBbwnD18jsdaIJky4apE9Xp5yzR0hXDMy+/eYPUyPFqCIZYfiISukkyBUfu0b/QsTo
 8NcWGlUY7WxUlF//dvnQRJvP0FTK7Cw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX4363XTdrwvNH
 Mdc0mIgEittKm/9K1XxliDOcbfrW5SvCfpOUCUSA0e+W3ul29rS3OCGnC+Ul5oNBtuTypVvldTd
 Puyvc0iEHbobLH/rmb2/x/FBZ0L4hVCk8HoJoJvgf2/dAASJhVyTYp7RWKfjC6jmTkjSHy1dnp6
 0qg0GOrmXkS/lcUkh7svbzNrVSNDOmkymttGHlC/7dle7WeAzrp4XhcY2rF8JsaoNP3XDFyiW/o
 V4H6yO7jv7gFA+kcabNA7YpKNXPsgX7klXE9d4CA7kAUIh9Ukuk/U5fs9wXAxrVg8xRBTKJ7NH/
 LjxzcTUUgqmkfrGxBgvDq0YdwdkLCw7uifHsRgZyyasyKuwsyh/wP+CCrbmgl/v6u9o4OP1tYDx
 yhig+sqn1oKZfJ33TZlscwmt1s4ztGYUxMnowE8nsac6XALGzN1T7jWM8LSPU39h3prSM6tNIqE
 pf0baAO7ByWrmKPgqpg==
X-Proofpoint-ORIG-GUID: hafh7JRVR3tV8VF9nv3f6KOXSt3B8Wdq
X-Proofpoint-GUID: hafh7JRVR3tV8VF9nv3f6KOXSt3B8Wdq
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec645e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=CYKTsl9jDGlcAgKpjQMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

Add .set_channel_map support to the SWR master DAI so the ASoC
layer can program per-port channel masks used by port_enable().

Fix several issues in channel map handling: clip programming to
available ports to avoid out-of-bounds access, use 1-based port
indexing, and store TX/RX masks separately. Also track per-direction
validity and select the effective mask based on port role to avoid
incorrect precedence and ensure full-width masks are preserved.
Fall back to the SDW stream-provided channel mask when no mapping is
configured, preserving existing behaviour.

Fixes: 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Closes: https://lore.kernel.org/all/4ddd6855-3817-4dc4-81c4-d8ddaa039865@oss.qualcomm.com/
Reported-by: Jie Gan <jie.gan@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/CAMSo37U1kJq_gK8jiW9iMbhHXtn=Chr7NawiK4fPUPj4kyqH2w@mail.gmail.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/33fe8fe7-719a-405a-9ed2-d9f816ce1d57@sabinyo.mountain/
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 147e55b7a600..c411c3628dee 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -162,6 +162,10 @@ struct qcom_swrm_port_config {
 	u8 word_length;
 	u8 blk_group_count;
 	u8 lane_control;
+	u8 tx_ch_mask;
+	u8 rx_ch_mask;
+	bool tx_ch_map_valid;
+	bool rx_ch_map_valid;
 };
 
 /*
@@ -1188,12 +1192,28 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 {
 	u32 reg;
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct qcom_swrm_port_config *pcfg;
 	u32 val;
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_PORT_CTRL_BANK];
 
 	reg = SWRM_DPn_PORT_CTRL_BANK(offset, enable_ch->port_num, bank);
 
 	ctrl->reg_read(ctrl, reg, &val);
+	pcfg = &ctrl->pconfig[enable_ch->port_num];
+
+	mutex_lock(&ctrl->port_lock);
+	if (enable_ch->port_num <= ctrl->num_dout_ports) {
+		if (pcfg->rx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->rx_ch_mask;
+		else if (pcfg->tx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->tx_ch_mask;
+	} else {
+		if (pcfg->tx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->tx_ch_mask;
+		else if (pcfg->rx_ch_map_valid)
+			enable_ch->ch_mask = pcfg->rx_ch_mask;
+	}
+	mutex_unlock(&ctrl->port_lock);
 
 	if (enable_ch->enable)
 		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
@@ -1413,6 +1433,39 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 	return ctrl->sruntime[dai->id];
 }
 
+static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
+				     unsigned int tx_num, const unsigned int *tx_slot,
+				     unsigned int rx_num, const unsigned int *rx_slot)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	unsigned int max_ports = ctrl->nports;
+	unsigned int i;
+
+	if ((tx_num && !tx_slot) || (rx_num && !rx_slot))
+		return -EINVAL;
+
+	mutex_lock(&ctrl->port_lock);
+	for (i = 1; i <= max_ports; i++) {
+		ctrl->pconfig[i].tx_ch_map_valid = false;
+		ctrl->pconfig[i].rx_ch_map_valid = false;
+
+		/* TX setup */
+		if (tx_slot && i < tx_num) {
+			ctrl->pconfig[i].tx_ch_mask = tx_slot[i];
+			ctrl->pconfig[i].tx_ch_map_valid = true;
+		}
+
+		/* RX setup */
+		if (rx_slot && i < rx_num) {
+			ctrl->pconfig[i].rx_ch_mask = rx_slot[i];
+			ctrl->pconfig[i].rx_ch_map_valid = true;
+		}
+	}
+	mutex_unlock(&ctrl->port_lock);
+
+	return 0;
+}
+
 static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
@@ -1449,6 +1502,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.shutdown = qcom_swrm_shutdown,
 	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
+	.set_channel_map = qcom_swrm_set_channel_map,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {

-- 
2.34.1

