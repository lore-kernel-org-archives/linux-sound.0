Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377C3BE643
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742624; cv=none; b=oifdIQwTsyIpqG0Hkmel7wVTMek8T2Gjyf98k9YA0MLl7zO/4rszeLIHYswpq3UcLAEq9kCBuvOxf2yLZvfjhVlMMGwVBgPNxlBpPw/teH//UtgNGRJmfltw3iCUMatHwIm3bARzmBwOV94A7acoR7IXiTiJyJtzLVTe5A8kd3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742624; c=relaxed/simple;
	bh=F1jvjPJcbPO+gpBvRiWEotz8dSae8UoOS7rBadKSpKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g4nh1J7mfLIcnwH/jzatWyGvDXUbS5a4zIyCTtlEbpopZzw1koZzUKKxcQK1L0+/rbk/rudxsTjdiDHt5ZoIU19BuJ/66nHdn9MdFiCW3hftCUhdC5K8zFJAA+oh+sJcUc9oB5sO2zX7tOY9vdTMwJgWtMsWnDbYdkov+IWZ6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK6l5eaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Emyc4c0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK6l5eaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Emyc4c0y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT6t42627926
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Ja1dfApRhU
	OIrNxjCCe6bw+CKEcGVCmLCwjdPZ3/HY=; b=KK6l5eaKL08CYof3qckmEho+S/H
	GlVCj1xGjSWPh62TMsMCMHUahbiIsZQJtQGmuEmVcyihnNFp2oBN74facuKa9vgc
	rmpnH77QcPg6Dw5bYQDc3VWp/owGtACz2EWIaupMlpZes05/cSbxvxctEW5/lfjH
	BlXQk8+36PYPMbyq6IemiCesiNve9RA775vxv8U1hxPQDLIcFQlaavm0qxFCxy2C
	iya1Nnlu7JlqxvLFnkeMJFFaPrqCo9v/0xzm0bBo7AJJvCQCafoq9ZRRSFmYk3V6
	EBeFU4hr1VpL3PrPKjUz2g2FOB5VTUX8VUOUQFidneQmdpDwQOFIIrx8acQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs94h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:17:01 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b59d85dcso7305342a34.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742621; x=1783347421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ja1dfApRhUOIrNxjCCe6bw+CKEcGVCmLCwjdPZ3/HY=;
        b=Emyc4c0yF543xc/77v/6/tIO5zswYMt7lH0mDxVVf8GXaVZF0b1Xf2P2SdFiHL4MPn
         UkXCr9T+U7VF9CbMznvj5aS+FUmW8uJeXSEV0JZQ+WC8ZfI8JA7oS/TMah4Kf7jgIfMw
         fkkNI2DHlW8FDO+ffg80N5q11JlgnI6MaYtosXAo8eWygWSUf/H9Q2qw457T5RnyEC29
         jsLqZOGDEvdG1A6ql5pnCfxzwmvmCX0GU+evBw4p1giirXOADn+D9QNZpix5EluZwETZ
         4P0ntOxpf6ARqgPeA7wcV6zJN1yW1H6l5NxyWgi/LRR27Pss5iXJBz5+xhPCiycr/fyy
         ji/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742621; x=1783347421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ja1dfApRhUOIrNxjCCe6bw+CKEcGVCmLCwjdPZ3/HY=;
        b=JTxvbXd5iHIfd4jgWhNCAhQI2MnO5uK8vOMZkdYGgnJPLdM55DGKV2dHGMtmGo82Lg
         4AoIy1ySPSohjJ0ONkE7Re6lnGvWiJUoKrSxKFwcndc55G23ChWzpF44PAIYbDUaWVbN
         sgaAikJMaG2znmtDjjuhotZbKbute5Bw/qv2CtwXFFsQBRdQbDHsl5eGPfWjD+fNQOKM
         EsIJ0QFOTXY3Uy+DJYY7lBvq9knMNoOzLd1owNO3s1SjZJ3gNNkvnDOrTl7MI7e+dWJD
         QWGSEyVGLTAxVB1pbt7B3CjK7abX0I/LAaKax9tzQLzzlHUsOxKn9aeGQHJNkUK+rl3S
         Wp3g==
X-Forwarded-Encrypted: i=1; AFNElJ/2u4menPYbMNAjOlXk9ExJ03yJPaVRTzLz+nbs3DoxtQaYQoYAnyquXdtodly6tIkiRAimGu/kF6WYCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gifjgCy/Cghv6EpUD0P3EMNv5utNtMLn7laH3OTl/L7+IkCQ
	d7vW6lIyDdHQc1C96SkcKpBmw7L64qSGkiChsthZ7ZsRkjA3w0Vgu/b5Db5PEjs3iyAE20w5tTL
	tksPdAUVXqgunzWdy0Nwxs8cE7OID9IAHuk/E9m2DECCYo7TpAiHiIDvPpMksOSrZPQ==
X-Gm-Gg: AfdE7cml3THQO+g5K0m3QljXmqXynar6DZ1W+q8zZNIdgIZyqtUWWyzA9nlOTDpgkCV
	WHtpUabujUbDUoC+cC0Pw6oXvMdGaBndlYKoIaKqjopoHCrSvjC4rBeXB2XaF3CcUvYwrbP19ja
	pedbS7ULIoEH+ZyKlDbFrZFnzbwQsiwnPmoNCO86crkVTa8sJZ+P7xwIyyDcdOCjCKkzr/Ed/ta
	FjeiVrFgOt+iX19yGBwMdnERwDqEx0uoToI5S1IRs7a5DSt594pvLy/e2VqakH43kJ7KTJ7QJtk
	YePhJQtSXPN7if4rZm81dSrfsrBN428ik5g8MmEpEYrnSPwd7nRuHAdwywcuvlqQW16aygAk3be
	VrC6O2tEPkII+UrmG6+qg3rBmJY2U4H6YgePvPABMY+adf8M=
X-Received: by 2002:a05:6830:3c84:b0:7e6:ed97:ce52 with SMTP id 46e09a7af769-7e9e929b0bamr517485a34.20.1782742620868;
        Mon, 29 Jun 2026 07:17:00 -0700 (PDT)
X-Received: by 2002:a05:6830:3c84:b0:7e6:ed97:ce52 with SMTP id 46e09a7af769-7e9e929b0bamr517454a34.20.1782742620262;
        Mon, 29 Jun 2026 07:17:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3500sm8584812a34.8.2026.06.29.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1 2/2] soundwire: qcom: Add set_channel_map support to SWR master DAI
Date: Mon, 29 Jun 2026 19:46:33 +0530
Message-Id: <20260629141633.86657-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5lmzzRTuzvNPMrGm7SniboXs2Woy8WQ9
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e5d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=CYKTsl9jDGlcAgKpjQMA:9
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX0iQkngxJQYX1
 WR8tYmkhCwEbZlCGFoeRaDPtKKdmqTxDnD3XoECpmdtNFScW70XzTEugY1AK3/TV/IBDTujyLmU
 jg2gwLDcK7L+Rld838VQq4r8gJLUJ4s=
X-Proofpoint-GUID: 5lmzzRTuzvNPMrGm7SniboXs2Woy8WQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX6awAWDmLDUmh
 BY0J7wSk0l10T61rx0tm2MZqU/t08wfY1FHsP9+VpKRemZl+UwbHD2el1pk2VLctKb+z2HNJObH
 RsanhOXbvVBmQ+Td9qQjajDSor4VcjTsVe3gjLvN7ZsYPh6eXncv6COuNCx94pEkXt7i0LhXazk
 xuCpIVhvSBXwB0AnH76KdnB00ppCcBR/TcpUipYWN7cG+L4R1uIP5irxXwl5seLN6UZ5kJ047lE
 uGKV3T37OM9xoyowmcaKjBv4abqETR/GBjgEoMzzZlPYEPhBDW5XqAxBOiAiOMtNLWxzNIa6gw+
 DjUGtd+wjsnGvJPS+HuM5jLW/115T65234StFUY9xSUfq6fwotA9g55+2ymdIZa8yXcSmSedQR1
 d9urPBz2GdqWNCfxqZSdY5DGwCf4CInX+iThtM+M54amwUmOznBltzpP1cRbjoze9dF/Osptgfp
 4MEmeWK8MKmRAAJA3zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118

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
 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81eff1..e63736e82478 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -160,6 +160,10 @@ struct qcom_swrm_port_config {
 	u8 word_length;
 	u8 blk_group_count;
 	u8 lane_control;
+	u8 tx_ch_mask;
+	u8 rx_ch_mask;
+	bool tx_ch_map_valid;
+	bool rx_ch_map_valid;
 };
 
 /*
@@ -1109,12 +1113,28 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
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
@@ -1334,6 +1354,39 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
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
@@ -1370,6 +1423,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.shutdown = qcom_swrm_shutdown,
 	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
+	.set_channel_map = qcom_swrm_set_channel_map,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {
-- 
2.34.1

