Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6340DB32
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228415; cv=none; b=rryzK8i5wr9sGbAl29hBXNvFfpHQ6IBJTM2NBfVZKXDwt53m5p7vXBv5pG2LD5BSE2O0D17sXs141ZX0CttdsBtkRgDe+4BkUZoewnQrbGzQFR/+zrJ+CKmATDMghm2kIy/bl8sPtGVDYVNdMwPcCOmK22OyeEYVjVQv6xrZssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228415; c=relaxed/simple;
	bh=1tV0+Psj+FfL8NL5f34ngA7GhZQql2F5wDPRQHPX6wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWpxzkH7mxMBybjajEvPPGapj7ty2FQs91J/bl6x+mrOJq5JFzt++TdrycegmPoeCSL9t6MkiN4Hgke8SlfMaE7yBo43NnG8gOAgKCAxgPnO7ih4EgMqv2F0lggCd9tIg15ftQ8+3eq4ZcdHt/oJsazGG8gMonTWpctNZrEgHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fi2Capv4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fi2Capv4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954aff6088so31162315e9.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228412; x=1785833212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c54cqGXhz/SJTHWhCb90DeS7wjO3Bb/W1RLYxOpKmSg=;
        b=Fi2Capv4sZAmlzVUISwWTWjDvqiRIsNNTrlH1sE/yy/VMgCPgDTCh45b+wdv9y2eng
         P5nwnVsKOHVMjXC8YwrWi0Oxpqhmj6XlA6zG9J9tmB3fIO2p1R+n0bdS8pALPGA9NuBo
         rBzEDavof2klJA0nAMHX0jGVstQshhgJRDF76XebWYM2AbHU8RJ4DttluzpsUhA1LR/C
         1PaXSEVJuqcIrAtRBldAfApR2Yai3sP5pkisJJJ/y6znaOt94ugNlWZTHf1oSKIRPTny
         go/FILFkl+9pOMwwENgt+kW8jSdUs88Q1YBJNpGV33cufDuPaEM9K1XP4bCCIqnNDIbG
         +NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228412; x=1785833212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c54cqGXhz/SJTHWhCb90DeS7wjO3Bb/W1RLYxOpKmSg=;
        b=aWrA44/eVQQSJmCGtE+p7T4JxGdxtpmDOZKu+7SJ2tZHsgrxaV1ETj3BobhWgD3TwS
         z5VSLNu5x1bVaa6wIDyFU+2iUlVKL2fFqxZPFaHrZFM9MNZKVgJvv10uwUQABPam1ZkT
         JMpKHM7dXls6i7gMY/4VWQsVz/x9skz3+1QMTdWNBDRaW32hIDjdVL/OWqpwTxore0hf
         twTMfRT4vdzyMi5FCEzE3OLO8UDQavENEbEIobyqc9QXi0bPo2RvfSxRVn7u0NqTuapx
         yTmg7zC+FwgzIvQVPyPqvd8s37x2V1DUxIoBcBan0L3JTPpbIZTH8jHoByts3dTfytfQ
         hgZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9kyrqBFRzJ8Wx5qvwRdVpPEq535pM8gf9/TQZBN7luHknEpeBo/ur2kSwTY8+XI3owp+xzAdcD91hog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKR3PIJzXUTIYAYMbZCZp45kPK9xFsA5Ad8yKGJF/1uHbu9fRY
	lU1g0mV9NcpBoV7ERN5/m2vLM78hteAJGmxiLZpDzjXz9yt8DovAJ14sR6x8zHhEfIM=
X-Gm-Gg: AR+sD12lYoa0NKtNY7liQAzOiW/yCPKK5T2shCC4zD8DlN3fjnEztMb6fUhGnhwTKEH
	znrdXxqGZACzjt49jutvrsUtTr43vQ+eYxoL+b6dlMquhek1yEODOGvl0G7zpM8RAWeawSnX+3f
	vU/oQoSx9oy00gMJeVYueUohAXvKUxIqEo4zCBdoIoegBEa4laYxSVK3CjS84/+kYpQpjaElTKt
	FnG578QMHWRkF6ZcVZTzsD1LkgA61+XSQ0l+HM+3On035E73uBmYC5uPz7J+wYBSuRghZDLaW/g
	9VERauQu6qxGrSSv44Tsp33J7ZZQxijsGlPGxHym5TDxP4g5QwIqwxGN0ERMn+b8B7VHgqec1np
	54DVzGhXV0TvEC5vCFvHATZ2CKpTJA16nfNpdExr3yiQKFlZJ5giey/WRour8BLk00US5Llt5I+
	oUzvE5CfrhisZd1GaGeUXOSXNeppcQTo4qJw==
X-Received: by 2002:a05:600c:8b74:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-496c657651cmr14654045e9.18.1785228411664;
        Tue, 28 Jul 2026 01:46:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm64658175e9.15.2026.07.28.01.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:46:43 +0200
Subject: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-1-b29f44720178@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7504;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1tV0+Psj+FfL8NL5f34ngA7GhZQql2F5wDPRQHPX6wo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaGx4YaOPhtT4bstSihMFzMLSMi++dIyuT5ypE18I
 gYQuUMuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhseAAKCRB33NvayMhJ0V+iD/
 4/5JVhRWGtIXTh+xezNOEMbQyssdxBTkb3sDkUe6XWcMMOh5fi96cSHqw8T90gKaCJOaL/lX4K/orC
 gGC+NopUoYq1jgfBYaQnad5FbPkJDIOqW+o6zqwy89uH1/TLDPgAHbxN+fWcskxFPAGHEO8x6BmNj/
 2pIpYDk5du5g9EROaerbsMg5fZK1T5r6yko/JyGQmFRdSzQR3aGqqsJOJvnX73Fvlic+iRG8fohmZP
 ODX1Om+vIiX0i1uPN+szzuxOJlWJWKipYhs5rsllNUaKDHqCoCajODEyt3LET19dUxTtxr8dty+xTh
 t/oVUCppiMifF/m+D04fOcfjLN7yMgMwbq4XNldDFbR2Mutr+Q0rK+0vNKZC4jEB2pG7YfJ58Y5YoY
 1VgqtDK92ONLuZ5zYwbG40QDEF+b7Tq8D6L/e5+RUFZaya0cz5lqWmb2LW16LwPO8i7OCC+qIEg3pC
 7Tx+69dGA12YrDIltGe4KoEx4rb8e8ijvhi+g2Txf6I4/0+w8F2IwlCk9oen/IWWL4++HKYfoE79dS
 eONEunT+RMk80oYXEdtn/IgCJppe855IAT9SZoWAVn4VuUIqGPg6gFZ5NbxSKRhYKZR8dRNRl4O7Il
 PPKya890bJsv96zf77Zh/rTfyietFex0DXk1q6Tr4225OriR5XJjmadlo8Iw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
of 2 WSA speakers connected on the WSA2 lines.

But the Audioreach DSP only handles WSA2 in pair with the WSA
interface by using the upper bits of the active_channels_mask
for WSA2 and the lower bits for WSA:

/-------------------------------------------------\
| Bits  |     3    |     2    |   1     |     0   |
|-------------------------------------------------|
| Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
\-------------------------------------------------/

Setting only the WSA2 upper bits is perfectly valid and
functional but the current Audioreach code builds the bitmask
from the channels count with:
	active_channels_mask = (1 << num_channels) - 1;

In order to enable the WSA2 bits the channel count should be 4,
but the lower WSA bits are then also enabled and the DSP errors
out when trying to play on the disabled WSA interface.

A solution would've been to add a fake WSA2 topology element which
would be translated into the top bits only, but it's not clean and
add some special exceptions in the generic Audioreach code.

The solution suggested by Srinivas is to use the channel mapping to
set this bitmask.

This works but makes all the other calls using the channel mapping fail
because the DSP requires the channel_mapping table to start from index 0
and using num_channel length in order to apply the mapping on the
active_channels_mask bits in order.

So we need to skip the empty channel mapping entries in all other
users of the channel_map to build valid channel_mapping tables.

This should not break any other usecases since the default channel
mapping always start from index 0, and will add flexibilty to allow
some special non linear mapping for other interfaces as well.

Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index e6e9eb2e85aa..0cc840aca69d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -703,6 +703,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
 	int size = ic_sz + ep_sz + fs_sz + pm_sz;
 	void *p;
+	int i;
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
@@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 
 	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_index = module->hw_interface_idx;
-	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
+	intf_cfg->cfg.active_channels_mask = 0;
+	/* Convert the physical channel mapping into a bit field */
+	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
+		if (cfg->channel_map[i])
+			intf_cfg->cfg.active_channels_mask |= BIT(i);
+
 	p += ic_sz;
 
 	pm_cfg = p;
@@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	uint32_t num_channels = cfg->num_channels;
 	int payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
 				APM_MODULE_PARAM_DATA_SIZE;
-	int i;
+	int i, j;
 	void *p;
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
@@ -860,8 +866,12 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->sample_rate = cfg->sample_rate;
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
-	for (i = 0; i < num_channels; i++)
-		media_format->channel_mapping[i] = cfg->channel_map[i];
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+		if (!cfg->channel_map[i])
+			continue;
+		media_format->channel_mapping[j++] = cfg->channel_map[i];
+	}
 
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
@@ -1080,6 +1090,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	struct apm_pcm_module_media_fmt_cmd *cfg;
 	struct apm_module_param_data *param_data;
 	int payload_size;
+	int i, j;
 
 	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
@@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->num_channels = mcfg->num_channels;
 	media_cfg->q_factor = mcfg->bit_width - 1;
 	media_cfg->bits_per_sample = mcfg->bit_width;
-	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
+		if (!mcfg->channel_map[i])
+			continue;
+		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
+	}
 
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
@@ -1163,6 +1179,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct payload_media_fmt_pcm *cfg;
 	struct media_format *header;
 	int rc, payload_size;
+	int i, j;
 	void *p;
 
 	if (num_channels > 4) {
@@ -1202,7 +1219,12 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->q_factor = mcfg->bit_width - 1;
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
-		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
+		/* Convert the physical mapping to a logical mapping of the channels */
+		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+			if (!mcfg->channel_map[i])
+				continue;
+			cfg->channel_mapping[j++] = mcfg->channel_map[i];
+		}
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
 		if (rc)
@@ -1279,7 +1301,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size;
+	int rc, i, payload_size, j;
 	struct gpr_pkt *pkt;
 	void *p;
 
@@ -1320,14 +1342,19 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
 
 	cm_cfg->cfg.num_channels = num_channels * 2;
-	for (i = 0; i < num_channels; i++) {
+	/* Convert the physical mapping to a logical mapping of the channels */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+		if (!mcfg->channel_map[i])
+			continue;
 		/*
 		 * Map speakers into Vsense and then Isense of each channel.
 		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
 		 * [1, 2, 3, 4]
 		 */
-		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
-		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
+		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+
+		++j;
 	}
 
 	p += cm_sz;

-- 
2.34.1

