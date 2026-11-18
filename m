Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969147;
	b=boTRBqGL5D7ciUytgCbsz7CTzhAHJRv0FUEr8PJ1DzjMW3fCpapWZsKfocOdeOg8dZB3
	 9vwJrvquvx7ss1yueotgMckGs/6nAF8kO0LTq1vGIleDofGbhhc3i9CDxbipUTuCG6DrR
	 8elAf0r9z9kbRa3v/k+zZY3+47E1zNUMv837gohPV085iIegbwcbzD2eQjwuNMiH2+etO
	 c5jONVRfBVh1aVq2C4A/HR5nT1GHRMC71rw+nsuyB2+9Vb5a9qO2yl43RYhco8f4bJOlU
	 GiEN08FMJuXOQBERkqQmdqC8JK050I5CY3vQU3dYdiuSipzPUUOo1RGNSx40weUb6uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4ykWseXmDdJ1kd/nDPRfC6CNGXv3xWYMDoeMY6xTk+M=;
	b=D+ny+lXYHQguLfcBzvrpwmtdWPEBD7YMf0/dz+KBUX6IbeOhrfW0Fp+z7VeQ+nH3hFIS
	 8TYyDXrF1KU8/Tt/wZSompZaK1lSBe0LA0ZeXAOggvYzQGvlHp5+ukXks2V7uFOjgdq/q
	 2uB3IVr+RrmNrN95Gk6bnsuO0JwtHKM5eo4RU1FWl9BZnY0QHkfiHsr4OgaNXGTGsbS3X
	 jvg+K9HVXXraeLmXB3SHDcwkN05Cz8vmxyozKyPmtQl8Sl0rezv2KurNd+dNLVxsqt3oB
	 /4Okq1ZJ+lFjalbiS+Yh8LFGyeTxvtaPQ3sYa0QYHPYp2u5rRXxVdzZOOERbaNWDEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mQzi3+Wz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8337606A31C;
	Wed, 18 Nov 2026 02:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8337606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mQzi3+Wz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VJTT764899;
	Wed, 18 Nov 2026 02:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4ykWseXmDdJ1kd/nDPRfC6CNGXv3xWYMDoe
	MY6xTk+M=; b=mQzi3+Wz2MdTnXtHsLJbp6L+5exEC7UfmjmX05i9dppQPI2S68/
	MyISjhuyXdJkrqpZBYTbJZdgmFrLtKO+10/gGUdVqFiUuR3GZdnDjAE/9U3MSvBe
	WqH/PmwoC+cyCqa9brm7e5U0jcB0s0rhPMoj5amogfvVXSLqKTK373jbraSNmwzd
	wInEa0P7s3pt3sHI0luVGF/wy76pBB1PzZc0wKJialQCCO1MxT6h9EmeDD38JYOX
	uMMRewzlVj73LHF6YjljM/Sk+M/RfaE+s7bXHfkrMhd5LpR/d8dyrRY1O+9SfHh3
	1IMFXBirCgeAay2BYrjXrfcoBASYwNcx1ew==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb8qcr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 02:32:11 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2W7c91766702;
	Wed, 18 Nov 2026 02:32:07 GMT
Received: from ap-kernel-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AI2W7aw1766660
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 02:32:07 +0000 (GMT)
Received: by ap-kernel-sh03-lnx.qualcomm.com (Postfix, from userid 4851478)
	id 512B640C51; Wed, 18 Nov 2026 10:32:06 +0800 (CST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH v4 resend] ASoC: qcom: audioreach: support multichannel PCM formats
Date: Wed, 18 Nov 2026 10:32:01 +0800
Message-ID: <20261118023201.2031211-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: E3ezhO-47lIxrKDLcKgrPnbuBVNWwC7J
X-Proofpoint-ORIG-GUID: E3ezhO-47lIxrKDLcKgrPnbuBVNWwC7J
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd0e2b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Sw036wB_Sbj6ZPNlFA4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwOSBTYWx0ZWRfX9q0vGsrd+Smy
 kVDEo92yLfym181FJwc1ponRHi4fGrjdXRKGgXLHvdTOlLOB/HQIDAwTuHN9CvZqfSZrDmh6c4T
 Fbkgjc5EckxL/UHY3xQAhgQF4JA6bjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwOSBTYWx0ZWRfX5+YytILp0VF1
 xWfudWwcW7xzZU80ENcYnkt4FAehNKSXM1jXiNHAgbE2OjH1tGcrcZh6e0q5Zg+062Om5OiRkMG
 TET3lKXKZYwYBiddrsZ3AflHESf5Ptk53kPUGm5MPObyNG3dQ+wzTYre2H0aj85H/2w8dK/LNJT
 6gDGDUKp6A/qYgAdt4T+7hzgSxiiqsoz/0T0pWiASD88yHgQiZPME+etyp5Q7WrFskWbostsbuM
 RPLfbPyRXhAMHM5GUeWQy/ih744oZAeNY0zuZ3/SQmJV1QfmwWtVveDbBXT1h7UulAQbntSYE89
 me/GTCIHeQgpRzCuCJcl0QJncRJbPN7frwQJREhPAX4zTzIwrWfMcamJfh5/gRcAkwlD/yTBVO9
 DEjaaeZfgxiI4Fy4sVKMANIm/4iJCOzJ9IWR+UUQ1HTXOMymDXnxiiws2m1faVz4ZVh8cpyIHwq
 7X2P/sid0r2ou/JjXEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180009

AudioReach currently rejects PCM streams with more than four channels in
the PCM and shared-memory media format paths.

This prevents TDM links that expose more channels, such as the 6-channel
playback path used on SA8797P Ride, from being configured.

Reuse q6dsp_map_channels() to support multichannel PCM formats and use
the common PCM channel limit definition.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---

v4: Rebased onto sound.git/for-next at fcfcd6db32adbd 
v3: reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL (Srinivas)
v2: reuse q6dsp_map_channels

 sound/soc/qcom/qdsp6/audioreach.c       | 36 ++++---------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  5 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 ++++++---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 16 +++++------
 4 files changed, 24 insertions(+), 45 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index aa1f4e2967647..5b5289bf6d139 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
-void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
-{
-	if (num_channels == 1) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-	} else if (num_channels == 2) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-	} else if (num_channels == 4) {
-		ch_map[0] =  PCM_CHANNEL_FL;
-		ch_map[1] =  PCM_CHANNEL_FR;
-		ch_map[2] =  PCM_CHANNEL_LS;
-		ch_map[3] =  PCM_CHANNEL_RS;
-	}
-}
-EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
-
 static void apm_populate_container_config(struct apm_container_obj *cfg,
 					  const struct audioreach_container *cont)
 {
@@ -760,7 +744,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.intf_index = module->hw_interface_idx;
 	intf_cfg->cfg.active_channels_mask = 0;
 	/* Convert the physical channel mapping into a bit field */
-	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
+	for (i = 0; i < PCM_MAX_NUM_CHANNEL; i++)
 		if (cfg->channel_map[i])
 			intf_cfg->cfg.active_channels_mask |= BIT(i);
 
@@ -883,7 +867,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	media_format->bit_width = cfg->bit_width;
 	media_format->num_channels = cfg->num_channels;
 	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+	for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
 		if (!cfg->channel_map[i])
 			continue;
 		media_format->channel_mapping[j++] = cfg->channel_map[i];
@@ -1185,11 +1169,6 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int payload_size;
 	int i, j;
 
-	if (num_channels > 4) {
-		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
-		return -EINVAL;
-	}
-
 	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
 
 	struct gpr_pkt *pkt __free(kfree) =
@@ -1223,7 +1202,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	 */
 	media_cfg->bits_per_sample = mcfg->bit_width == 24 ? 32 : mcfg->bit_width;
 	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
+	for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
 		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
@@ -1280,11 +1259,6 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	int i, j;
 	void *p;
 
-	if (num_channels > 4) {
-		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
-		return -EINVAL;
-	}
-
 	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
 
 	struct gpr_pkt *pkt __free(kfree) =
@@ -1319,7 +1293,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		cfg->endianness = PCM_LITTLE_ENDIAN;
 		cfg->num_channels = mcfg->num_channels;
 		/* Convert the physical mapping to a logical mapping of the channels */
-		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
+		for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
 			if (!mcfg->channel_map[i])
 				continue;
 			cfg->channel_mapping[j++] = mcfg->channel_map[i];
@@ -1442,7 +1416,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	cm_cfg->cfg.num_channels = num_channels * 2;
 	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+	for (i = 0, j = 0; i < PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
 		/*
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 587f14ce71d23..9f4166ebdc107 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -6,6 +6,7 @@
 #include <linux/soc/qcom/apr.h>
 #include <uapi/sound/snd_ar_tokens.h>
 #include <sound/soc.h>
+#include "q6dsp-common.h"
 struct q6apm;
 struct q6apm_graph;
 
@@ -805,7 +806,6 @@ struct param_id_hw_ep_power_mode_cfg {
 #define PARAM_ID_HW_EP_DMA_DATA_ALIGN	0x08001233
 #define AR_HW_EP_DMA_DATA_ALIGN_MSB	0
 #define AR_HW_EP_DMA_DATA_ALIGN_LSB	1
-#define AR_PCM_MAX_NUM_CHANNEL		8
 
 struct param_id_hw_ep_dma_data_align {
 	uint32_t dma_data_align;
@@ -998,7 +998,7 @@ struct audioreach_module_config {
 	u16	nslots_per_frame;
 	u16	slot_width;
 	struct snd_codec codec;
-	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
+	u8 channel_map[PCM_MAX_NUM_CHANNEL];
 };
 
 /* Packet Allocation routines */
@@ -1009,7 +1009,6 @@ static inline u16 audioreach_gpr_dest_domain(gpr_device_t *gdev)
 
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
 				   uint32_t token);
-void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels);
 void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
 			       uint32_t token, uint32_t src_port,
 			       uint32_t dest_port);
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 7ce2a50390f8e..b7a3cf826b294 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -21,6 +21,7 @@
 #include <asm/div64.h>
 #include <asm/dma.h>
 #include "q6apm.h"
+#include "q6dsp-common.h"
 
 #define DRV_NAME "q6apm-dai"
 #define POS_BUFFER_BYTES	4096
@@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
-	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
+	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
+	if (ret)
+		return ret;
+
 	if (prtd->state) {
 		/* clear the previous setup if any  */
 		q6apm_graph_stop(prtd->graph);
@@ -1016,8 +1020,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 		cfg.num_channels = 2;
 		cfg.bit_width = prtd->bits_per_sample;
 		cfg.fmt = codec->id;
-		audioreach_set_default_channel_mapping(cfg.channel_map,
-						       cfg.num_channels);
+		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
+		if (ret)
+			return ret;
+
 		memcpy(&cfg.codec, codec, sizeof(*codec));
 
 		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index c63622629f151..d43d97d138410 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -94,7 +94,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 			return -EINVAL;
 		}
 
-		if (tx_num > AR_PCM_MAX_NUM_CHANNEL) {
+		if (tx_num > PCM_MAX_NUM_CHANNEL) {
 			dev_err(dai->dev, "invalid tx num %d\n",
 				tx_num);
 			return -EINVAL;
@@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
 	cfg->num_channels = channels;
-	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
+	ret = q6dsp_map_channels(cfg->channel_map, channels);
+	if (ret)
+		return ret;
 
 	switch (dai->id) {
 	case DISPLAY_PORT_RX_0:
@@ -173,16 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
 	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
-	int i;
+	int ret;
 
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
 	cfg->num_channels = channels;
-	memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
-	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
-	for (i = 0; i < channels && i < AR_PCM_MAX_NUM_CHANNEL; i++)
-		if (!cfg->channel_map[i])
-			cfg->channel_map[i] = i + 1;
+	ret = q6dsp_map_channels(cfg->channel_map, channels);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

