Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B29337119
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964778; cv=none; b=GdxA5iyD90GgTo3hvrseGEYNTUr6lUzp9G5bOGb1I7+m0bSzCyKUzjBRI80ZE5tvi4ewSpt+KNFYB2xMPhFI7+zb1WdIDGM/WMMPZ0J2m99alk5wutPeonfJfy6lyHYQ9+/a83sfWfKBkOTf6su838IjBmUdRhSHudBc3ALEB4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964778; c=relaxed/simple;
	bh=rPV/g5IYWsNboyW77QOBrpdiO8MA4gezI/IGNcvYa34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNLco9kzateWTdek2weCTxzmFjIlBtk2T5MK7pBkdK3ZVuj1Qvu5TNkx0meqjZqLX2jzEBQlwi+x4mLPve4gbAkSgvKUOP6PEvLAGSBlblvhAXeeOwUjXfE7hcKAgTNtCWH7POBkuWqfM1dxqseshJvyLLWIcK/EfELtSXTe01o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY38Wecr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBzEb4kA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY38Wecr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBzEb4kA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH86IDU1945948
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iAaqpAjDgW4
	60CvcdUHuq2L8MskyKFWKm4AdNMxPe8I=; b=iY38WecrW4LB23Pry71C5c8AXV3
	bM83IPFXaViPD6UrebRCacpZ4r+bWVALFPDmJ0h9fncG2+iR28AjIrtJ8URd1Tj2
	sbicJale1/9oINhzcdeXCGIkTBKBvmdChqiAnRPUDZzYK545b0+pr48FgpXR3AlE
	K0DukxXSrf1e7QAbGsBsDV8QPzv/VHmquaqJkQ7KoQh3OXRa5nkJID/xlTbD2n4f
	miVv9tevxvw3hlCMq0gYABMCRsy03yGIsMO63r9lCadu3sQ2thPWLyMbHCXAeuwR
	+ZdJD0ZDQp5hQX06c1B1T7XROHetQ1HsbnJtwxu3CBur9vGQC+UA5rcRQAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa8buc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 09:46:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso127417911cf.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964774; x=1766569574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAaqpAjDgW460CvcdUHuq2L8MskyKFWKm4AdNMxPe8I=;
        b=ZBzEb4kAiD5PlGf3hMWXGxkRju2l7AKGHo02atk0Whp5KwfHWuIslemFWLBnR87bGu
         oQHd48XKaextcffzFKcuS8oeDfv+PRMXWJTDfayXzsZL1f2Fa5ZgZ1qb6zty2cLHSJPK
         DK4MSvp6T+Ge9peZTEf/7R4QH8Pe2Gqu1KWARkGVeth2gRUQCVOELxkerJXmS9Y+JNkq
         7IEJNXmnr+HzdcOxCJnLTjrUDxC02wyC9Uwwr79VNlQA9DYiKu2p8bFsPjCCcGWFDnMx
         sNXdYbSeXiIzzDgXrb7NTzATbyPXkbaVsff+5wnmGn8gVEO0vKcyX6LRK7L7LRDW0c57
         6tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964774; x=1766569574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAaqpAjDgW460CvcdUHuq2L8MskyKFWKm4AdNMxPe8I=;
        b=NgbQS5n1akNKGMnkcPrDPBpgrKdnG0LisTAQ4PDocGVWh7ERQWkeDdy4YCbhH4JHqR
         j/0GO4bHX+69TomxvhAb2T2fwR7qJgAdnUTDjCD9CAXYRg7CNDB0iBX3Vy9pQhldt/xn
         WDeDUWuLDic6fJOlFXI0w68kqT1dV2T01pTaAhWapTGOJiukhGF3qoZcZEtldkQD57fh
         nucDnFzZxj5sKMhe9sYQbfL3BAy2GIX46j6+E3NcHxB/utnKSFiQfdiAPk1gwZMuSPC6
         iAQHIKAV0s/sURtx13vVby/LrjqvBpdz0sMrZk1QwHryuUPfaH7Vdbm3Nbm9pcbJzRZz
         NqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiCE3bcuFzsaRYZXqIMrJxewh/1MCwjFHVqKAvlRBsuqZiBXzmj7XpgdiVTpmaxhcndinWf4KeZxEEAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yWL2dJ13cTVa4yIfzp2VAoZILhkbNlL+a2qpxmOUCn8HERPE
	qLyTp6M91FA6fzLSTsTGzwUoi43ObEopi4n6gdmNObh1bFcVjPHMDMReUBMBoIZAs3qMYdYqlPD
	uNLyG74WAgMykTL8mAm9HtreHcc1xU1VToQRJkjeUsisinJWJ/6QER7RbtSfrlkgfT7r+jkhlHQ
	==
X-Gm-Gg: AY/fxX7wjwOVii4MJPF9TSvyoJ9BSGomq2znnWCjxSiIwJAzmBh9sPxzehu4PpM0npI
	Ahg/HVBOUdMbJ3vHjLdCFcRxVLmJN7DYyUNFqNulgWFkBr0ZVMKGx/7JwzlqKWfJnfvBZrf7i9d
	zpUpaSmRkYLn6T//ITtGnpFbxyYAGOVaIrqfyNNzvzEDm7JwsPKlSaC9gHlHiWIaK/3ANPNMwGi
	nxot8FSQFHMOOcg5n7+nCW4KdvbedtyhtT9OB/Z/5LjLY2jxDl9WW5K9imULflQqe2WHm1NQFYk
	UVkh2cTyLJsJ1FUxS/5XqVflciDCJdxM8xAaDnMOkbv1cjPc2oGusy7wYW3BeZqRD/6AMRiL8ZA
	k+Ji9JlR1xpx0xBGe99OBD9zV
X-Received: by 2002:a05:622a:4183:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f1d04f3b85mr228111801cf.37.1765964773937;
        Wed, 17 Dec 2025 01:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEC+G9S4w8NXoOD7MPgfWKPCI2paiwk0BPgRJ+OsHjCW2BqYACS6iRzBUox4CxY31n65lGRVg==
X-Received: by 2002:a05:622a:4183:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f1d04f3b85mr228111521cf.37.1765964773352;
        Wed, 17 Dec 2025 01:46:13 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ffacd9192sm356502466b.70.2025.12.17.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:46:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/2] ASoC: qcom: audioreach: Add support for VI Sense module
Date: Wed, 17 Dec 2025 10:46:04 +0100
Message-ID: <20251217094602.55117-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7060; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rPV/g5IYWsNboyW77QOBrpdiO8MA4gezI/IGNcvYa34=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQnvb0FbpOEznWtnNabwduGl/Ft38mjc8K+3JY
 5vASWh2a7OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ72wAKCRDBN2bmhouD
 1y/jD/9VALQV7IAV5V8Aue7ldfYgjOAkT43mt7E398AAuEPDnCSXVhodjJBvpwvP/tcVBWo876R
 2+ydmTIsLvsoNVS7jgyiaE20Q8hBBL4hFdd5ckKHO+BzrF/QLYLNtTa9CBJj3F6MpTsQKSN2ThJ
 OvuL/9aVmkvqCidAynMHkRV8Kq+WcPpUC/26xpED99Q/L5Kz9sMLS+PBvCuuH6hxWtWW3v2PEsF
 LXgbtFlBn5SsEmJ7taL7AqH0qZYL2uxzmBAiRfJWhi0NyRt6q0U5Mla3qXZO/Mnvh9DaF4nUI/W
 uF0UjQ9txwV3vNKQQpcAY+LHkmyimgFrkAjfARsaEAMMvxBGstOS/m55xWlE2Lg/+rJp5Ptaw2S
 XDfvAgtVryZH3k/lAHi1XcqCkdoff8iTGYFh9Ns89Cp/vcxL4aaCCkRAyzo2K/NnKepZX63vC6M
 Uij3e9t/2Ls2Ww7ZbTgii7a+EX5WCHdUxDZKE6NDDj8qznhm9cIvSX4TA/6ykG4sH1SbEJWd7ox
 1m8mcI1wxm3g5kcDlEsogJCaQDpvRd6+u4JfpPftiENUbkym4T0gOtpJEDiX6zEdIQLamoEBnYk
 sqZ8S+11vZ+kuuaxP8yVssJRN7gPa4tCKP0hpyhyRAX+OPRrQrqj9iYVzAnFiSL4XRWq1MbByyD CpZUmKPUyRTsdiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _Av3H50IPq9ZRaejA3ZGDEG7d0F9T2PS
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=69427be7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=y_nsFCjpyUlxIsjChg0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NyBTYWx0ZWRfX8JI0Q60YrZE9
 9wuGy6fpwicO2L6FfYaHndP/FDOPpDTW414T0dgpCyBbFRYDtnZD4vJqwRXkEpo3A45zCBBwJON
 /ARk+ROJ7Lb2ylNG2z5R2dejQl4a+ntP748cBJfPtWNkL66Zd/xy37hfGI8Ag4UvlAtOYUjfCic
 bwSCeHCQVAIkk3sAjzNMd9XSkpGkcJg4YdvoiPoVh9/X53IdmvsMgtGpwKLEa88D/QhzXWlSm2N
 pe4K2RbCmLcRo2CQEGGETmnpRp+KFm4fpP/ZEtuwjHpJ+eNzCVOrZcRIRpSHZTLHh9+C1MEwHVs
 zWj5bb6NZAmWmHeyaHGfmzfbpfsrc2ViwodLk+0YEfBtrGlnCfGGjqd75JDL+ma9+dQH9H1H89Y
 9EkQlpqoy1rjCUqJsIvrWTnV+p/AZg==
X-Proofpoint-GUID: _Av3H50IPq9ZRaejA3ZGDEG7d0F9T2PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170077

VI Sense module in ADSP is responsible for feedback loop for measuring
current and voltage of amplifiers, necessary for proper calibration of
Speaker Protection algorightms.  Implement parsing
MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
as command to the ADSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. Rebase so it can be properly applied

Changes in v3:
1. Add Rb tag.
2. Drop setting cfg.quick_calibration (Srini).
3. Correct indent in comment and drop stale r0t0 comment.

Changes in v2:
1. Use PARAM_ID_SP_VI_OP_MODE_NORMAL
2. Make num_channels u32
3. I did not change uint32_t type in the header for consistency
---
 sound/soc/qcom/qdsp6/audioreach.c | 107 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  27 ++++++++
 2 files changed, 134 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index c32a5ee801e7..b28451558974 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -202,6 +202,31 @@ struct apm_display_port_module_intf_cfg {
 } __packed;
 #define APM_DP_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_display_port_module_intf_cfg), 8)
 
+struct apm_module_sp_vi_op_mode_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_vi_op_mode_cfg cfg;
+} __packed;
+
+#define APM_SP_VI_OP_MODE_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_module_sp_vi_op_mode_cfg) + \
+				(ch) * sizeof(uint32_t), 8)
+
+struct apm_module_sp_vi_ex_mode_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_vi_ex_mode_cfg cfg;
+} __packed;
+
+#define APM_SP_VI_EX_MODE_CFG_PSIZE ALIGN(sizeof(struct apm_module_sp_vi_ex_mode_cfg), 8)
+
+struct apm_module_sp_vi_channel_map_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_vi_channel_map_cfg cfg;
+} __packed;
+
+#define APM_SP_VI_CH_MAP_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_module_sp_vi_channel_map_cfg) + \
+				(ch) * sizeof(uint32_t), 8)
+
 static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
 				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
 {
@@ -1200,6 +1225,84 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 operation_mode);
 }
 
+static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
+					    struct audioreach_module *module,
+					    struct audioreach_module_config *mcfg)
+{
+	u32 num_channels = mcfg->num_channels;
+	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
+	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
+	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
+	int op_sz, cm_sz, ex_sz;
+	struct apm_module_param_data *param_data;
+	int rc, i, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	if (num_channels > 2) {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		return -EINVAL;
+	}
+
+	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
+	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
+	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_channels * 2);
+	ex_sz = APM_SP_VI_EX_MODE_CFG_PSIZE;
+
+	payload_size = op_sz + cm_sz + ex_sz;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	op_cfg = p;
+	param_data = &op_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
+	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	op_cfg->cfg.num_channels = num_channels;
+	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
+	p += op_sz;
+
+	cm_cfg = p;
+	param_data = &cm_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SP_VI_CHANNEL_MAP_CFG;
+	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	cm_cfg->cfg.num_channels = num_channels * 2;
+	for (i = 0; i < num_channels; i++) {
+		/*
+		 * Map speakers into Vsense and then Isense of each channel.
+		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
+		 * [1, 2, 3, 4]
+		 */
+		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
+		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+	}
+
+	p += cm_sz;
+
+	ex_cfg = p;
+	param_data = &ex_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SP_VI_EX_MODE_CFG;
+	param_data->param_size = ex_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	ex_cfg->cfg.factory_mode = 0;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
 
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
 				struct audioreach_module_config *cfg)
@@ -1254,6 +1357,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 		rc = audioreach_speaker_protection(graph, module,
 						   PARAM_ID_SP_OP_MODE_NORMAL);
 		break;
+	case MODULE_ID_SPEAKER_PROTECTION_VI:
+		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		break;
+
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 19828b4accce..03cfd32f1d0c 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -32,6 +32,7 @@ struct q6apm_graph;
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
 #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
+#define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
 #define MODULE_ID_OPUS_DEC		0x07001174
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
@@ -571,6 +572,32 @@ struct param_id_sp_op_mode {
 	uint32_t operation_mode;
 } __packed;
 
+/* Speaker Protection VI */
+
+#define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
+#define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
+#define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
+#define PARAM_ID_SP_VI_OP_MODE_FACTORY_TEST	2
+#define PARAM_ID_SP_VI_OP_MODE_VALIDATION	3
+struct param_id_sp_vi_op_mode_cfg {
+	uint32_t num_channels;
+	uint32_t operation_mode;
+	uint32_t quick_calibration;
+	uint32_t r0_t0_selection[];
+} __packed;
+
+#define PARAM_ID_SP_VI_EX_MODE_CFG		0x080011ff
+struct param_id_sp_vi_ex_mode_cfg {
+	uint32_t factory_mode;
+} __packed;
+
+#define PARAM_ID_SP_VI_CHANNEL_MAP_CFG		0x08001203
+struct param_id_sp_vi_channel_map_cfg {
+	uint32_t num_channels;
+	/* [ Vsense of ch 1, Isense of ch 1, Vsense of ch 2, Isense of ch 2, ... ] */
+	uint32_t channel_mapping[];
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
-- 
2.51.0

