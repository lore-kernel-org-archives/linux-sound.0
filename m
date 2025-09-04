Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586A2E7F03
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981568; cv=none; b=B8GJcJNdKZuetRQFOw0gCdT2Iol5mpwCjqUHgxi6LR2sd6AjLdpQobt4QuSBmCSK+JTgRSxtmkShWgajo2WAGY7wOVZsNF8ajvkhG8h9iCW8TOc4glvrM1CrQ2gc+EPDNF2AJ8Nybaz4AiUWu19KYFpP9XpixgB7nD3hZWpxHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981568; c=relaxed/simple;
	bh=l9J2Y9GpKLwrRdU9wenRiFKqKWiew3Y04G0qCOr/oI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrTZNAzI6k9ah3JCYjR+FqSh4NDHTSMTI9eHx6ltGBMSkyoFslOY5UHIjbWS+COgOcPoZMjPfivodqfzEs9lcDzjiwsvdZycYwf10+suheovoB2DJ0pFjHGFbI/xA92g0up25i07e9dQYbsPp6tzhr9hMLdYhy6RgISwL4pMo14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1Dj6fPy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1Dj6fPy"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61ec7a9a002so143530a12.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756981565; x=1757586365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roQCLGhiuskOQD+2xmHpY0PjCIA3HKeawtbBCLIt+vs=;
        b=e1Dj6fPy/J6d7dq1j+Q2XvcpUutphFZEQ46f+aFidlJ9IH8FviYvm53tabJVBVd4Fy
         hAEHhO7KJSr3il5uhm7jDGO3GQ/me53qvC4GslhWyAsvgKCkRs7ev8SCTvqNdH83Hs8R
         4OrfuByl2KoDkCDqb/ACqekhcxVmuWlGyzGIGCXEq+c+gbOwWNodqBwalljXCdaf8PGg
         5MtaAgh3Y5APkQ3InwR5/mlKtCry48dKKust37moV5EBtuo5lMayExcGWFRcsPY3m1O7
         pcwS98xWRpbnCb743SoGqi2uKMbYwieRwjDa1ZVlwrDQFZTiXnUp42pusTuECw8qb5ba
         InHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981565; x=1757586365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roQCLGhiuskOQD+2xmHpY0PjCIA3HKeawtbBCLIt+vs=;
        b=xN+FvRQSoinl+oKpSq3I/FgjFcyjtfay6iY5K8275d3d7+1TzJOXBCxpYjgVXho9os
         i7NRnvKlipNqSKe7hdruyrcd0ZEXGomMIWqCQBEbXyCgcFPqnmf/IbuB0/Peno/OLNds
         lhP3VHp+nZJNbGIJt9hjQpMxE2oqnGFvKAkliRXnGFdsLIL9jq5llbQ8XkEv2nktblWt
         6Mj7OYCrQ6B+W6Sfud9+V4rd9/en2vRhEJhuvgP4uGcthoeCKaiwCm8DEFFmNoyS5+EO
         rcV/jZJTF0UMenPKvqDneWe6wtWm7mPK4FoaiZAKtKCzHcw9xjKH77LHLOF2KeGXrdv2
         nc6A==
X-Forwarded-Encrypted: i=1; AJvYcCUD+hup3sH0cr2wIpNa2TEnDChplYKb/f9DCccGKSDvjwG15Utd4OuABBKeQvRFUIb1TDWBZjgDAr5HmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3KciBLBruC4R0mM0nTT/coc/ODdE3Vj+ejaLMjYAZRokfDTi/
	hFLBtRdOgwRPl8u8E6dkm1w3Z6nMHiB5Iefnk9Rt3gvSZb0zhIgbzUHYRl009mT61y/F93VKJRl
	hZDvG
X-Gm-Gg: ASbGncvUUs4lBnRXvtJn12FgvQdrqo5P5GA1ZLyR+Loj6gEpatAkfp06NBsd+RL/ThB
	yo77PFqgFGozD5YmOyh7xVtCbfjzqWistPde1u7+N2FKKkfkZziCZs79lMxKQM6UT8wwlKfedga
	oJ2gedWMjROV5gc8NimptymyBC3XpHlT2WJrSSITi0e/zjsccyoONKZ8h5JV905CD+CfXwQyNrF
	wUNppqiY9fnm26qBNYkD0UPZULSvcCt2DUH0+xHPacR2cvb3U48ihkKJ3bEYSI5StumKmjses3h
	NU4NPfusVP4e8oV66yRR3E6c7dD1tL8k0jWGb94ZgnjlPwcJc5yGCcKRuFIfe1cl7RK0sM0c9tk
	e+wz/l3YqEjJQmLn8hon6zBV5Broi6v7BvGTLagtSoR5Z
X-Google-Smtp-Source: AGHT+IFMcY4NNygYdryRH3vv7REs5OjZETxmxPeh7SzLDvISkTJRooOcN1ItpxWlE+izGlMtyGbQKA==
X-Received: by 2002:a05:6402:13d0:b0:61c:cfb2:b2ce with SMTP id 4fb4d7f45d1cf-61d0d5f339cmr10009875a12.7.1756981564942;
        Thu, 04 Sep 2025 03:26:04 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5306e6sm13887446a12.47.2025.09.04.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:26:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] ASoC: qcom: audioreach: Add support for VI Sense module
Date: Thu,  4 Sep 2025 12:26:00 +0200
Message-ID: <20250904102558.143745-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
References: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6940; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=l9J2Y9GpKLwrRdU9wenRiFKqKWiew3Y04G0qCOr/oI8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouWk3PXrD70gNfzF7M7XRC6448VWZUkwRVT0Y6
 cMVkwdF27qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlpNwAKCRDBN2bmhouD
 1ycdD/9rCKePxVitTgq6M/pa/Aaxq4iRBewOmkLiFBKotxE2DNHsgBp/fCIcdntNiH0r6A9qVYt
 EF4OQQ88Lt3/MhEelrFBZlF/DjbeOUpsKoyVy1JMyfBQsQhIq3VCqvvNY3s7dHRewL4EkXWdIf2
 GPAjTrgHjEqF+wqUgoI3yEUjaqbyQZxiz4tDjuio141kPVQUNowUIyzS8K/8dRvl2kfe8qcMgwW
 fbqpmW4W0p8NC7fzXn192C3+UE8Z6eCe2PltLKErQYHbngqVO2YsmbjnvVSqrY/UKl+fCypKscg
 WscU2zIK4Ei8pGGHqMmGEwFeempCU1n0ky03jVNzHbsnfiBQMbz9CC5rzT8wEGmKdoUAoKgTR1D
 qKfSDQpnnXpd296IC7ysNX2idIMOgMWvXLBVLJArRa6HNeeRLBLsNnciCV6oW6Yzw5WoNoZHsz3
 z+EjXqhQx4BgVKzPzlttmfJgF24ZlZDG3QXXtqfJRPDM90x6QPXygWNW8czwUM/xDsJ9WsBaHjI
 JuZEusdZqlAwJg4q4iyeWp1NhwAwj/2a4QHdBf1DW34WQLFxYsR0q3jDX/LCZyJ90kZd6YwIXif
 aBdkiv9s6DsjSEu9A4LTOX3KvagXaZeFQlvGLiJZYSz07hKy4VxzpKcjRrXUXHv8aXmc/Q++xFm ajqPjv+R0Y7ozFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

VI Sense module in ADSP is responsible for feedback loop for measuring
current and voltage of amplifiers, necessary for proper calibration of
Speaker Protection algorightms.  Implement parsing
MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
as command to the ADSP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Use PARAM_ID_SP_VI_OP_MODE_NORMAL
2. Make num_channels u32
3. I did not change uint32_t type in the header for consistency
---
 sound/soc/qcom/qdsp6/audioreach.c | 112 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  27 +++++++
 2 files changed, 139 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3b7dffd696e7..f344ce80676f 100644
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
@@ -1258,6 +1283,89 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
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
+	op_cfg->cfg.quick_calibration = 1;
+	/*
+	 * op_cfg->cfg.r0_t0_selection should be set only for normal mode, keep
+	 * as 0 for calibration
+	 */
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
+		 * [ 1, 2, 3, 4]
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
@@ -1312,6 +1420,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
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

