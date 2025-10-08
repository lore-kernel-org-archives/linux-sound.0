Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386AB2F6196
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920307; cv=none; b=NO8agKFVd/BAnfqOxEabhINhWzMF7VXgSbqYHEbdxYW3LnbOp/S1FTJXxS6t7Go5uNBCnFeFImOwLBar/f0MA5otZ6+KeJph+4BnfndJ+l+CLpyf2KIgzAMX8cVm+8jM/VjLC9eHY+DHW0K0IMWzPyibbeSU/eE0VzCcD4acwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920307; c=relaxed/simple;
	bh=cRPMwx9imB8LGxt5KpydI9C23hTrae3cRPQY5wdiPss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i48fusm7D7PnIEkYGBnw5qy1+qk48g3oo7M5degUXoHuaE/khzRu4mplvPVozJTwzeYbDQw+Qk7SF3ogOevOjBW6B1gy2yaxkJFzWYf6+PkfId5Iberakev9xJloFOqqzf+IuGkfNLMOlK90BL63YC+Dtv9wgcLHuDuzYI+YbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvgZLBKS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvgZLBKS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-269640c2d4bso10792165ad.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759920305; x=1760525105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hl1t16hNpxqBDLDUSMCyXh1Kc203/8UnUYsCqiLwTA=;
        b=YvgZLBKSMzn/AKhECNfu2CuA5DwVEBBqaQTKPE6hLSzwE9NouqpEhstnyO75863t+d
         GvB1WkyAQcJKIM1Zp4xxz4AvsPeF1u1O+gxjz8XY2dBgA99DPAYCsyUqQHVJeLVLm26x
         9amvm7ueceRJURdNJQZFbLW61v50P8rKOR5UETGvjHfVfKNSlRVzdfd01HaMVygBtnsf
         zWguOFHfR1qnl8RSxsew4AZ97GaeMvOol7G4qk//fSFuYdNbDia7RSbtI60v0v8eDZeJ
         H9isY1d2FeD6Me95ogjnjW2j2St4bwWpGrRH/qrDkaBdiYs1Ag6Jec5Ig5xxfpl4KJoq
         Q5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920305; x=1760525105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Hl1t16hNpxqBDLDUSMCyXh1Kc203/8UnUYsCqiLwTA=;
        b=JIDVb7QEwNg8MupHLGBLe79nqH0Ad0HHXleJDozEerBmYhahSJWdOP6ZLCBJ4EOAeF
         suUSuV5uMvuPbGExuj6pBpndGxxjDWztmovSlRtL6ef+lnxWfOxI1+5o9xckNGYPBWsV
         O31o4W9fNfk1sDpdVBrzV1/EPAB5GasMOucXOdOWopMAJ3i5WTvCLPdqlaKDdkpzKPXU
         TLPZUxOShTwcl8kYqiSgAW/+DKjumdAQP8rR6d69KNzU5DKmHzLxpcN0TYSFG8pz6S4D
         UlG40Z4K3Pv2PxoUskO3lnx8Ek9q+qiuumvUC4nZB6A+xiRMXBYIK4Uo0ylS9rp5lXfb
         v/bA==
X-Forwarded-Encrypted: i=1; AJvYcCUhWY82g19WqXLrie8aZGzyI7tp8FIxLz6PvoiBitUyFYiHvMxUyvqLsqwpCpQewEN6cyL+6rqFlNeoyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSfqhhv4pPhlDQrqlNxhxYN9Sd04sZAQhD7damcxOSaTHnHXo
	A0cyL25teLfhIwYoCPLAOJGkHvjEZf/R7OjonNNz55JTIvpwfunN1nNCDJtFz/yRSCM=
X-Gm-Gg: ASbGncvuqtxF/9e8PO9OIwY7iDSNqhJjQsuw94oUh3wy616XDKSkO4MxaD1NHD7jLKt
	vdv+/WIpeSObwnjaBGizW1GbC/UtTPMTpra2tf7jlPr10YkduIHUXVDNzAtg3G8rQGRUI5BUP2v
	DOhBveNdroxZ5xZzyvZ8xAvTcA5qgeMbbSgKKSBBN5HIPywzVpoJYU4xKKZ8iIRnPV0O6vARwwh
	/enbEtirEdzTin3z6cerzEqxi8D9R2QDbXb3Fw5gwE5ThGFfa2+oFKDy7bC5AcRvf/ELDjNeWnL
	JmquKYic9dWXsVbiyU7x7At1T+lOUg3J6v1TMXaAzjHJuP7Rz1m4plci4N1dBJdX9wZdaGFFzG8
	vcM2MbZb50Jox+iWUyasLZAkSkJhBb0bt4osi37YchVkPYJleuWxylC3WNrgu
X-Google-Smtp-Source: AGHT+IHGiKKyXWaH2FUNU/8LIy8vFJtrsOw9lRDSztqkSkjNUEd36DnZQT6tGx3+jF6WFobJ4wCPtg==
X-Received: by 2002:a17:902:d4c1:b0:25c:b66e:9c2a with SMTP id d9443c01a7336-290272e3d33mr24053345ad.6.1759920305547;
        Wed, 08 Oct 2025 03:45:05 -0700 (PDT)
Received: from kuoka.. ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1127c7sm196117135ad.28.2025.10.08.03.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 03:45:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/2] ASoC: qcom: audioreach: Add support for VI Sense module
Date: Wed,  8 Oct 2025 19:44:50 +0900
Message-ID: <20251008104448.117167-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
References: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VI Sense module in ADSP is responsible for feedback loop for measuring
current and voltage of amplifiers, necessary for proper calibration of
Speaker Protection algorightms.  Implement parsing
MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
as command to the ADSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

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
index 3b7dffd696e7..664ab0be7f56 100644
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
@@ -1258,6 +1283,84 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
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
@@ -1312,6 +1415,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
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
index 9f6ddcf081ee..a03949b790bd 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -32,6 +32,7 @@ struct q6apm_graph;
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
 #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
+#define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -554,6 +555,32 @@ struct param_id_sp_op_mode {
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
2.48.1

