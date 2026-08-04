Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4093590AE;
	Tue,  4 Aug 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827015; cv=none; b=UpxU7dlRl8eLenHV1LcHLWYJNk6qOAmePAqid6WFlEF8osBhf/OHzU7QdM6TT708y32E/Txy9ZTAZCedaKikX98BmqEKkCramBHuxFlO3H4ylPNaeph4DimPZC8htfYTq5AbpT0BA+GEpmpYOz5OZWjCv0Pi9s6edDnl74AqIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827015; c=relaxed/simple;
	bh=v7+2P2/IT8vwxX4D+fBXmYnta0LTv2fpjLadaVKieYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c9j9DsiITZUwqtsOhF5QG+nMfJRsaZWL+hpTut2rxWtZRCykcKcsWPgvXXIoz/7lDqxMkp98HMrYtjXiD8+ZNe8fcx9ngHQOHbDkYoXBv4olo2yasfXnNtZXAhJhE7s1qbdmvZTMPKQvC4VtmYMM29Xy0mAXE5cAydqQGvtWN80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfF9kW8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfF9kW8p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67429iRI2203753;
	Tue, 4 Aug 2026 07:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TxXtGJxhZlj
	8lQi7m3xMGx3l/Bw7bJlor18mzEkFwFE=; b=GfF9kW8p3cYmpHYZwKsSrI09x/w
	EG/y17SGF+cKY3HPUSwgsz8EpK8Dtk/pydg4YxnMoOlXh8AfE+M4kb+gRXe9HmNT
	g/JQahhQpVGE03Zb7AjTo8svR5J99zxEYvM5wZwTZ1G98ib3QIC9WrbIPb6HZmrW
	IkKSwyhNWwX3QOptOfMp2AgddSt8SFZLeosHS1TTK2Ue2WWWGPEhrp1kJdRIyFOI
	+5zShsuxvkWcxbX1eUt5Jd5PMRABRDv6+MC9xLAUdD0Plvm3NofiLrKnLw6s6hBE
	KKWHgvpVd5clYLO/OhebBvjOYTQSvuOXHR9Mkr5WIVW3fGWPx0+e93lYQsw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu72711sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67473Fbi031234;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vjhjmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67473FkG031212;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67473F1A031206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 747D963C; Tue,  4 Aug 2026 12:33:14 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v7 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF support
Date: Tue,  4 Aug 2026 12:33:01 +0530
Message-Id: <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX42d6bCmfO5L7
 Y6fTiAlRDLsnhZ85OzF95YY4BgyrO9JidLf/1FehK4diE6Lop0r56uwNgXzc0zEuYBFZDPtKT9e
 A/u88WUToxDboBSs1ATnIx9X8rSVxM4=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a718eb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=qIolZgfBJ5s2WmRl7lkA:9
X-Proofpoint-GUID: qz-DUMbIrZPt4IsBesp24sc51N9XQB8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX5tD37N/X7NrK
 rBQb3ox1S7wXfVbVqLpC6FnJfRZaXNYALpD3exK/erHyVIhAS3htk3iyw2l3NqGAuy9A5TDEY0F
 Ywgm/m6RAjOpv0Z7z6fnwNhyVRrYBhnGrLjwSWUcXL7SCV18DWgXVJlkp2aWPUMuKiNtzQXFkPX
 w5bQF3oYwuMcYTJzFaSfvEJQp0P/nm+rro29I8X1DQ60jaGaOHVj8c4bvUDQARBQ7nGWnWkPbUl
 hgcIXiNFOCJA8KVAkQzE7cT02+ifpoc1Xs1CkavSxoAuyCnuAwR5baKmn2tN2Fn5QDe1Yh9MogJ
 yOVwnALzUH2oNOAiNzE7c0A/b5zWiXl9zw1XoBQ05sXhTb7uBMP36kNDE/nV3z1jU6PxCaiYx8c
 J9ct7DmbcnR5YLbYzPMS3P6PT7t41cFZaUda5K/W31j7kFXEZnjiRlOXp926EcgTAcQ0+CT50Sg
 r9/EzPlNKuGRjMp1uYw==
X-Proofpoint-ORIG-GUID: qz-DUMbIrZPt4IsBesp24sc51N9XQB8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040054

Add topology parsing and media-format programming for Audio IF source and
sink modules.

Add the Audio IF module IDs, the required topology tokens, and a dedicated
topology loader that stores the parsed interface configuration in the
AudioReach module state. Also add the Audio IF media-format path that
sends the interface configuration, hardware endpoint media format, and
frame-duration parameters for Audio IF modules.

This keeps the serial-interface configuration topology-driven while still
allowing the machine driver to provide runtime slot and media format
settings. The same Audio IF path can then be reused for TDM, PCM, and I2S
style backends.

The new UAPI tokens (AR_TKN_U16_MODULE_SYNC_SRC=262 through
AR_TKN_U8_MODULE_INV_EXT_BIT_CLK=276) are added, together with the value
defines used by the sync source, sync mode, data delay, interface mode,
bit clock type, and polarity tokens.

MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
(0x0700117D) are introduced in this patch.

This Module is validated on Hawi and Shikra platforms.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  93 ++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.c  |  93 ++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  90 +++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/topology.c    | 103 +++++++++++++++++++++++++++++
 4 files changed, 379 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 6b8102eaa121..1700e3f5cb64 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -168,6 +168,60 @@ enum ar_event_types {
  *						LOG_WAIT = 0,
  *						LOG_IMMEDIATELY = 1
  *
+ * %AR_TKN_U16_MODULE_SYNC_SRC:			Frame sync source
+ *						AR_AUDIO_IF_SYNC_SRC_EXTERNAL = 0,
+ *						AR_AUDIO_IF_SYNC_SRC_INTERNAL = 1
+ *
+ * %AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
+ *						AR_AUDIO_IF_CTRL_DATA_OE_DISABLE = 0,
+ *						AR_AUDIO_IF_CTRL_DATA_OE_ENABLE = 1
+ *
+ * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
+ *
+ * %AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
+ *
+ * %AR_TKN_U16_MODULE_SLOT_WIDTH:		Slot width in bits (16 or 32)
+ *
+ * %AR_TKN_U16_MODULE_SYNC_MODE:			Frame sync mode
+ *						AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT = 0,
+ *						AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT = 1,
+ *						AR_AUDIO_IF_FRAME_SYNC_MODE_LONG = 2
+ *
+ * %AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
+ *						AR_AUDIO_IF_SYNC_NORMAL = 0,
+ *						AR_AUDIO_IF_SYNC_INVERTED = 1
+ *
+ * %AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
+ *						AR_AUDIO_IF_DATA_DELAY_NONE = 0,
+ *						AR_AUDIO_IF_DATA_DELAY_1_CYCLE = 1,
+ *						AR_AUDIO_IF_DATA_DELAY_2_CYCLE = 2
+ *
+ * %AR_TKN_U16_MODULE_INTF_MODE:			Audio IF interface mode
+ *						AR_AUDIO_IF_INTF_MODE_TDM = 0,
+ *						AR_AUDIO_IF_INTF_MODE_PCM = 1,
+ *						AR_AUDIO_IF_INTF_MODE_I2S = 2
+ *
+ * %AR_TKN_U16_MODULE_QAIF_TYPE:			QAIF hardware port type index
+ *						AR_AUDIO_IF_QAIF = 0,
+ *						AR_AUDIO_IF_QAIF_VA = 1
+ *
+ * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
+ *
+ * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
+ *
+ * %AR_TKN_U16_MODULE_BIT_CLK_TYPE:		Bit clock type
+ *						AR_AUDIO_IF_BIT_CLK_INTERNAL = 0,
+ *						AR_AUDIO_IF_BIT_CLK_EXTERNAL = 1,
+ *						AR_AUDIO_IF_BIT_CLK_SKIP = 2
+ *
+ * %AR_TKN_U8_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
+ *						AR_AUDIO_IF_CLK_NORMAL = 0,
+ *						AR_AUDIO_IF_CLK_INVERTED = 1
+ *
+ * %AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
+ *						AR_AUDIO_IF_CLK_NORMAL = 0,
+ *						AR_AUDIO_IF_CLK_INVERTED = 1
+ *
  * %AR_TKN_DAI_INDEX:				dai index
  *
  */
@@ -240,6 +294,45 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
 #define AR_TKN_U32_MODULE_LOG_MODE		261
 
+#define AR_TKN_U16_MODULE_SYNC_SRC		262
+#define AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE	263
+#define AR_TKN_U32_MODULE_SLOT_MASK		264
+#define AR_TKN_U16_MODULE_NSLOTS_PER_FRAME	265
+#define AR_TKN_U16_MODULE_SLOT_WIDTH		266
+#define AR_TKN_U16_MODULE_SYNC_MODE		267
+#define AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE	268
+#define AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY	269
+#define AR_TKN_U16_MODULE_INTF_MODE		270
+#define AR_TKN_U16_MODULE_QAIF_TYPE		271
+#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
+#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
+#define AR_TKN_U16_MODULE_BIT_CLK_TYPE		274
+#define AR_TKN_U8_MODULE_INV_INT_BIT_CLK	275
+#define AR_TKN_U8_MODULE_INV_EXT_BIT_CLK	276
+
+#define AR_AUDIO_IF_SYNC_SRC_EXTERNAL		0
+#define AR_AUDIO_IF_SYNC_SRC_INTERNAL		1
+#define AR_AUDIO_IF_CTRL_DATA_OE_DISABLE	0
+#define AR_AUDIO_IF_CTRL_DATA_OE_ENABLE		1
+#define AR_AUDIO_IF_INTF_MODE_TDM		0
+#define AR_AUDIO_IF_INTF_MODE_PCM		1
+#define AR_AUDIO_IF_INTF_MODE_I2S		2
+#define AR_AUDIO_IF_QAIF			0
+#define AR_AUDIO_IF_QAIF_VA			1
+#define AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT	0
+#define AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT	1
+#define AR_AUDIO_IF_FRAME_SYNC_MODE_LONG	2
+#define AR_AUDIO_IF_SYNC_NORMAL			0
+#define AR_AUDIO_IF_SYNC_INVERTED		1
+#define AR_AUDIO_IF_DATA_DELAY_NONE		0
+#define AR_AUDIO_IF_DATA_DELAY_1_CYCLE		1
+#define AR_AUDIO_IF_DATA_DELAY_2_CYCLE		2
+#define AR_AUDIO_IF_BIT_CLK_INTERNAL		0
+#define AR_AUDIO_IF_BIT_CLK_EXTERNAL		1
+#define AR_AUDIO_IF_BIT_CLK_SKIP		2
+#define AR_AUDIO_IF_CLK_NORMAL			0
+#define AR_AUDIO_IF_CLK_INVERTED		1
+
 #define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
 struct audioreach_module_priv_data {
 	__le32 size;	/* size in bytes of the array, including all elements */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 0cc840aca69d..cce0ad31ff0c 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -152,6 +152,13 @@ struct apm_i2s_module_intf_cfg {
 
 #define APM_I2S_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_i2s_module_intf_cfg), 8)
 
+struct apm_audio_if_module_intf_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_audio_if_intf_cfg cfg;
+} __packed;
+
+#define APM_AUDIO_IF_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_audio_if_module_intf_cfg), 8)
+
 struct apm_module_hw_ep_mf_cfg {
 	struct apm_module_param_data param_data;
 	struct param_id_hw_ep_mf mf;
@@ -168,6 +175,13 @@ struct apm_module_frame_size_factor_cfg {
 
 #define APM_FS_CFG_PSIZE ALIGN(sizeof(struct apm_module_frame_size_factor_cfg), 8)
 
+struct apm_module_hw_ep_frame_duration_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_hw_ep_frame_duration frame_duration;
+} __packed;
+
+#define APM_HW_EP_FRAME_DURATION_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_frame_duration_cfg), 8)
+
 struct apm_module_hw_ep_power_mode_cfg {
 	struct apm_module_param_data param_data;
 	struct param_id_hw_ep_power_mode_cfg power_mode;
@@ -1052,6 +1066,81 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static int audioreach_audio_if_set_media_format(struct q6apm_graph *graph,
+						const struct audioreach_module *module,
+						const struct audioreach_module_config *cfg)
+{
+	struct apm_module_hw_ep_frame_duration_cfg *fd_cfg;
+	struct apm_module_param_data *param_data;
+	struct apm_audio_if_module_intf_cfg *intf_cfg;
+	struct apm_module_hw_ep_mf_cfg *hw_cfg;
+	int ic_sz = APM_AUDIO_IF_INTF_CFG_PSIZE;
+	int ep_sz = APM_HW_EP_CFG_PSIZE;
+	int fd_sz = APM_HW_EP_FRAME_DURATION_PSIZE;
+	int size = ic_sz + ep_sz + fd_sz;
+	u32 slot_mask = cfg->slot_mask ? cfg->slot_mask : module->slot_mask;
+	u16 nslots_per_frame = cfg->nslots_per_frame ?
+				 (u16)cfg->nslots_per_frame : module->nslots_per_frame;
+	u16 slot_width = cfg->slot_width ? (u16)cfg->slot_width : module->slot_width;
+	void *p;
+
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	intf_cfg = p;
+
+	param_data = &intf_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_AUDIO_IF_INTF_CFG;
+	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
+	intf_cfg->cfg.qaif_type = module->qaif_type;
+	intf_cfg->cfg.intf_idx = (u16)module->hw_interface_idx;
+	intf_cfg->cfg.intf_mode = module->intf_mode;
+	intf_cfg->cfg.ctrl_data_out_enable = module->ctrl_data_out_enable;
+	intf_cfg->cfg.active_slot_mask = slot_mask;
+	intf_cfg->cfg.nslots_per_frame = nslots_per_frame;
+	intf_cfg->cfg.slot_width = slot_width;
+	intf_cfg->cfg.active_lane_mask = module->active_lane_mask;
+	intf_cfg->cfg.frame_sync_rate = module->frame_sync_rate;
+	intf_cfg->cfg.frame_sync_src = module->sync_src;
+	intf_cfg->cfg.frame_sync_mode = module->sync_mode;
+	intf_cfg->cfg.invert_frame_sync_pulse = module->ctrl_invert_sync_pulse;
+	intf_cfg->cfg.frame_sync_data_delay = module->ctrl_sync_data_delay;
+	intf_cfg->cfg.bit_clk_type = module->bit_clk_type;
+	intf_cfg->cfg.inv_int_bit_clk = module->inv_int_bit_clk;
+	intf_cfg->cfg.inv_ext_bit_clk = module->inv_ext_bit_clk;
+
+	p += ic_sz;
+	hw_cfg = p;
+	param_data = &hw_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
+	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	hw_cfg->mf.sample_rate = cfg->sample_rate;
+	hw_cfg->mf.bit_width = cfg->bit_width;
+	hw_cfg->mf.num_channels = cfg->num_channels;
+	hw_cfg->mf.data_format = module->data_format;
+
+	p += ep_sz;
+	fd_cfg = p;
+	param_data = &fd_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_FRAME_DURATION;
+	param_data->param_size = fd_sz - APM_MODULE_PARAM_DATA_SIZE;
+	fd_cfg->frame_duration.frame_duration_in_us = AUDIO_IF_FRAME_DURATION_US;
+	fd_cfg->frame_duration.allow_frame_duration_normalization = AUDIO_IF_FRAME_DURATION_NORMALIZATION_ENABLE;
+	fd_cfg->frame_duration.min_normalized_frame_dur_us = AUDIO_IF_FRAME_DURATION_MIN_US;
+	fd_cfg->frame_duration.max_normalized_frame_dur_us = AUDIO_IF_FRAME_DURATION_MAX_US;
+
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
+}
+
 static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 					       const struct audioreach_module *module)
 {
@@ -1438,6 +1527,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 		break;
+	case MODULE_ID_AUDIO_IF_SOURCE:
+	case MODULE_ID_AUDIO_IF_SINK:
+		rc = audioreach_audio_if_set_media_format(graph, module, cfg);
+		break;
 
 	default:
 		rc = 0;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 62a2fd79bbcb..35541b2d8c99 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -36,6 +36,8 @@ struct q6apm_graph;
 #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
 #define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
 #define MODULE_ID_OPUS_DEC		0x07001174
+#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
+#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -544,6 +546,74 @@ struct param_id_i2s_intf_cfg {
 #define PORT_ID_I2S_OUPUT		1
 #define I2S_STACK_SIZE			2048
 
+#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
+
+/*
+ * struct param_id_audio_if_intf_cfg - Audio interface configuration
+ * @qaif_type: Audio interface type (e.g. QAIF, QAIF_VA)
+ * @intf_idx: Interface instance index
+ * @intf_mode: Interface operating mode (TDM/PCM/I2S)
+ * @ctrl_data_out_enable: Enable sharing of data-out signal with other masters
+ * @active_slot_mask: Bitmask indicating active slots
+ * @nslots_per_frame: Number of slots per audio frame
+ * @slot_width: Width of each slot in bits
+ * @active_lane_mask: Bitmask of active data lanes
+ * @frame_sync_rate: Frame sync rate in Hz
+ * @frame_sync_src: Frame sync source selection
+ * @frame_sync_mode: Frame sync mode configuration
+ * @invert_frame_sync_pulse: Invert frame sync polarity when set
+ * @frame_sync_data_delay: Data delay from frame sync in bit clocks
+ * @bit_clk_type: Bit clock type (internal / external)
+ * @inv_int_bit_clk: Invert internal bit clock when set
+ * @inv_ext_bit_clk: Invert external bit clock when set
+ *
+ * This structure defines configuration parameters for the Qualcomm
+ * Audio Interface (QAIF) block. It is used to program interface
+ * characteristics such as slot configuration, clocking and frame
+ * synchronization behaviour.
+ */
+struct param_id_audio_if_intf_cfg {
+	uint16_t qaif_type;
+	uint16_t intf_idx;
+	uint16_t intf_mode;
+	uint16_t ctrl_data_out_enable;
+	uint32_t active_slot_mask;
+	uint16_t nslots_per_frame;
+	uint16_t slot_width;
+	uint32_t active_lane_mask;
+	uint32_t frame_sync_rate;
+	uint16_t frame_sync_src;
+	uint16_t frame_sync_mode;
+	uint16_t invert_frame_sync_pulse;
+	uint16_t frame_sync_data_delay;
+	uint16_t bit_clk_type;
+	uint8_t inv_int_bit_clk;
+	uint8_t inv_ext_bit_clk;
+} __packed;
+
+#define PARAM_ID_HW_EP_FRAME_DURATION	0x08001B2F
+#define AUDIO_IF_FRAME_DURATION_US			1000
+#define AUDIO_IF_FRAME_DURATION_NORMALIZATION_ENABLE	1
+#define AUDIO_IF_FRAME_DURATION_MIN_US			1
+#define AUDIO_IF_FRAME_DURATION_MAX_US			100000
+
+/**
+ * struct param_id_hw_ep_frame_duration - Hardware endpoint frame duration
+ * @frame_duration_in_us: Frame duration in microseconds.
+ * @allow_frame_duration_normalization: Permit SPF to normalize frame duration.
+ * @min_normalized_frame_dur_us: Minimum normalized frame duration in microseconds.
+ * @max_normalized_frame_dur_us: Maximum normalized frame duration in microseconds.
+ *
+ * This structure configures the frame duration for the Audio IF hardware
+ * endpoint and, when enabled, the allowed normalization range.
+ */
+struct param_id_hw_ep_frame_duration {
+	uint32_t frame_duration_in_us;
+	uint32_t allow_frame_duration_normalization;
+	uint32_t min_normalized_frame_dur_us;
+	uint32_t max_normalized_frame_dur_us;
+} __packed;
+
 #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
 
 struct param_id_display_port_intf_cfg {
@@ -877,6 +947,23 @@ struct audioreach_module {
 	uint32_t data_format;
 	uint32_t hw_interface_type;
 
+	/* Audio IF module (TDM/PCM/I2S) */
+	u32 slot_mask;
+	u32 active_lane_mask;
+	u32 frame_sync_rate;
+	u16 qaif_type;
+	u16 sync_src;
+	u16 ctrl_data_out_enable;
+	u16 nslots_per_frame;
+	u16 slot_width;
+	u16 intf_mode;
+	u16 sync_mode;
+	u16 ctrl_invert_sync_pulse;
+	u16 ctrl_sync_data_delay;
+	u16 bit_clk_type;
+	u8 inv_int_bit_clk;
+	u8 inv_ext_bit_clk;
+
 	/* PCM module specific */
 	uint32_t interleave_type;
 
@@ -907,6 +994,9 @@ struct audioreach_module_config {
 	u32	channel_allocation;
 	u32	sd_line_mask;
 	int	fmt;
+	u32	slot_mask;
+	u16	nslots_per_frame;
+	u16	slot_width;
 	struct snd_codec codec;
 	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
 };
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 1f69fba6de26..54661bcb006c 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -753,6 +753,103 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
 	return 0;
 }
 
+static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
+						  const struct snd_soc_tplg_vendor_array *mod_array)
+{
+	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	int tkn_count = 0;
+	u32 val;
+
+	mod_elem = mod_array->value;
+
+	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
+		val = le32_to_cpu(mod_elem->value);
+		switch (le32_to_cpu(mod_elem->token)) {
+		case AR_TKN_U32_MODULE_HW_IF_IDX:
+			mod->hw_interface_idx = val;
+			break;
+		case AR_TKN_U32_MODULE_FMT_DATA:
+			mod->data_format = val;
+			break;
+		case AR_TKN_U16_MODULE_SYNC_SRC:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->sync_src = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->ctrl_data_out_enable = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_SLOT_MASK:
+			mod->slot_mask = val;
+			break;
+		case AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->nslots_per_frame = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_SLOT_WIDTH:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->slot_width = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_INTF_MODE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->intf_mode = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_SYNC_MODE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->sync_mode = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->ctrl_invert_sync_pulse = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->ctrl_sync_data_delay = (u16)val;
+			break;
+		case AR_TKN_U16_MODULE_QAIF_TYPE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->qaif_type = (u16)val;
+			break;
+		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
+			mod->active_lane_mask = val;
+			break;
+		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
+			mod->frame_sync_rate = val;
+			break;
+		case AR_TKN_U16_MODULE_BIT_CLK_TYPE:
+			if (val > U16_MAX)
+				return -EINVAL;
+			mod->bit_clk_type = (u16)val;
+			break;
+		case AR_TKN_U8_MODULE_INV_INT_BIT_CLK:
+			if (val > U8_MAX)
+				return -EINVAL;
+			mod->inv_int_bit_clk = (u8)val;
+			break;
+		case AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:
+			if (val > U8_MAX)
+				return -EINVAL;
+			mod->inv_ext_bit_clk = (u8)val;
+			break;
+		default:
+			break;
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return 0;
+}
+
 static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
 					    const struct snd_soc_tplg_vendor_array *mod_array)
 {
@@ -806,6 +903,12 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 	case MODULE_ID_I2S_SOURCE:
 		audioreach_widget_i2s_module_load(mod, mod_array);
 		break;
+	case MODULE_ID_AUDIO_IF_SINK:
+	case MODULE_ID_AUDIO_IF_SOURCE:
+		ret = audioreach_widget_audio_if_module_load(mod, mod_array);
+		if (ret)
+			return ret;
+		break;
 	case MODULE_ID_DISPLAY_PORT_SINK:
 		audioreach_widget_dp_module_load(mod, mod_array);
 		break;
-- 
2.34.1

