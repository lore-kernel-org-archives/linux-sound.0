Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364106;
	b=iawq5yQ0HrhAQhg6e5JtAWq9y5aRHdXTd7AOOOFZtSyNXERjfJbHNP1uGBjTbdx5Ttk4
	 B3ngL72NB0vwJ+pvczTFG/a9RCRnnNPJNQriNAhqp5QW/GuBfW7yMin+/mzQCkcdkMRdy
	 AHoqoOwduriCZvuRcdQ60FH6OeJSI7iQE08YTGCVfBFsprp0OR5qetItGZmf/TtRVEXBs
	 fOwRvj10wVt6QbL5OSu8UBnL2SSqSQwLdQ+/GSwRJwhEoSi5lJ9ag//RT0nHhKkvOERG0
	 D9p9qYVfKfe6TcxleDO0G0A1LpdBoeQm/KNlCMzml1txdv528iKLxVgaXxDPS+vZJtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J6CpBXJ96T3klSRodMhel+LQ/6Itb/IOSX2DC35FfnY=;
	b=EikzmFLlxVUI7A6XN9hsCwER7+rk+eHYLMLZIk8SngWDgf6o1M8t9fvHpcQS5b37aV7h
	 P9UCfubAAG9tdMwDZ4m999rw957ZR53bSwJpufC6lGW6X1IbQ2VietXv/5HBFzJee9wFz
	 whpUqBgkdBs64IfrROhLX/4CeT3BMWQYvimJJdor5ejWFHPL1mNch/iMGq0FLaAJtAoje
	 v/qAYOUbI06rSHsPcjz5BCtaFd4Rj1e+UGmXrXzJ0ZFV4I06oUidSBSiKCV0hDopWjDdN
	 v4emAA/ppEqfPKiYkvDLmMA90HV8JH0YhYwi5pT4WzHh4EePY0jk+NNX+O8oQdYG8IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZsvSSDL0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fDBJ/Sof";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3B60A381A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC3B60A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZsvSSDL0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fDBJ/Sof
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQvQS3853472
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J6CpBXJ96T3
	klSRodMhel+LQ/6Itb/IOSX2DC35FfnY=; b=ZsvSSDL0VWaNO4d1qVKyNutyJ2q
	i6faLRytSNKf0SjaAJgwCYxgGNE3zsYwvZjFkvvogUtVO3Z8OjVCRK0fcgEVsnST
	RxaiiCKszBokvbedImboXq+YFS/9MqdsdGBsC75OIkk2cL+4pwYTlPwwiustNjs5
	0iuM5k6R5xUCNNNZVI7cYeuKKW5l2alhTj91eq1oT8YaWvmSIgQ7ktCUuPgfUN/s
	/xCPZuV6bgJxeNIhkQC4ZuxbjUzQrDx6ZwdMGMSblPOROADLBE6DhZcRiW0uZLJy
	JA3FOYsU3SSuaauUWK0NdodDK6GbG4ynAmVSHQLbsBIDzUGCxbNJTmUBoUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so570896585a.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364104; x=1795968904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6CpBXJ96T3klSRodMhel+LQ/6Itb/IOSX2DC35FfnY=;
        b=fDBJ/SofDlwgH6O9JW8DDKtAYWwZejt3g/hlAsPQY0TP7ikSTQL9jQLyMEVjB3wisG
         7TNlkp6Va0rZfYkp4WBXg8nVeLODYza7cl312LUQQgZlA3ZcNAy6CW0SPRZQpjUe9xZE
         aKTXJ+09iNBqv2OAdr3NmdCjfmRT1KHzQ3RKZ2GgWAMwO17x8kerT6O2hV0OFz+FSqdD
         nJjV93GpHk7chzxwv6G+xiOLI90n0g+yN2l3HUxrDX32HYeVcbNg7DquSNGxMo0O62p1
         fF0TQC2RoI9Bq4ht8evF1mR7I9IM1cpZj60yv5zRZbnkzylFPFxj0mcyK8AgURbwMKt+
         AEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364104; x=1795968904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J6CpBXJ96T3klSRodMhel+LQ/6Itb/IOSX2DC35FfnY=;
        b=w+MHtA+Voue+QfBtYDLwxQMfPtyF3+XvBGlT19xg2SdrNK8G6mVSlqygLR0G59yiR5
         DxWMj67ivPFxCx4vkroXaKrcohhUkuYblT3yT+hnO4KpWwiLaEAGdHiFHz0V+JATvVfF
         DchGODZxN9ULWZDjnZbTVdOl8gQJJwzUPFhmXtMPdG+eUpoL1oVxVGRfuLvP3J5xez7t
         /3EhZACjbKfOM58j47O+87bLYR+/jEstyi1Of19F4zCQuQiGMYo2JRcqWKZiq3fZfS3F
         7gdw+nO+fhFoG/53oUtIyh26o5jY6wdMyw5cmiYLNCjRpXyNrjLX7HA2vloGhEi0ys6h
         gyNg==
X-Forwarded-Encrypted: i=1; AL+hErFbzCLgY+hXGcCcKB9bIAHaIRjNGMSS6yGZwqUIqcuJxnY21aA0WkGKN75u3BIjEtM5XEQvz8PhAxgVVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bWgcS8zo3BnQnwJC4s1XVmStECrmsX5BN24yE1YgXInb/yf+h
	RUbFC1CMK9Elu0zDD8QHVEOojSAyiLkeokRc2yrxoCvKuv5t4Zm5ECy7QduZBgWAdONsfEsfUYv
	FqTPZ+xpMHe3PunPNoviCQozhak+gyyF7zI3aARi19k6IZprpM8ewZn/uRl6c1kpO4Q==
X-Gm-Gg: AZFdTZdOCfNuNQsLZYVJlJfDRlG5wbKi1l/29qDpcASzkvCYV7ogMCrCqv5NytguqaT
	B8cf0pfLLVqxfSirCJzErqC6Y182fdtfElgAd1kMMhidHh0pGgb5wYLOdBjMOsH7QQ2EPUJremU
	MJ12aptC82OGkEe5CGXp18lCY0DqXcCSN033FjtSwPhE3D4RZTBj/1kmTFQ0U06QMBWx/EhSbDt
	pnU/lmXSsGQDCTYq9eUijb3EHlGQR1lY+AGLhwfs7sPC52be14TTVZHficpewLhvLSILjWqGXAa
	yBlEooPI5QF+LjMQrOyfoFK3vWaygyWa1C3ACnOiGtGaxG3GFx6tPBXyqQq33I6AcE3dRaizTbW
	fXLKXMyfwgCXB+cnRVxglNRn0PwvXVfWYfK5EPyWu8RM+YyWdB2HNeZgqfd8R9vnM
X-Received: by 2002:a05:620a:132e:b0:93f:571b:c72c with SMTP id af79cd13be357-949ba9f8cbcmr1595306885a.46.1795364104129;
        Sun, 22 Nov 2026 08:15:04 -0800 (PST)
X-Received: by 2002:a05:620a:132e:b0:93f:571b:c72c with SMTP id af79cd13be357-949ba9f8cbcmr1595302585a.46.1795364103643;
        Sun, 22 Nov 2026 08:15:03 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 09/24] ASoC: qcom: audioreach: add control link support to graphs
Date: Sun, 22 Nov 2026 16:14:22 +0000
Message-ID: <20261122161437.5994-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: tffwFf3Nl5jtnYhb_V8XD95FLozj88Hz
X-Proofpoint-ORIG-GUID: tffwFf3Nl5jtnYhb_V8XD95FLozj88Hz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXw+hfwczsSiBA
 JMhrP81/mnP7Sj5gbRkVN8ZDgkQkz4YFn0KyON9YpeqHbDW0sEKdPE7cw+cilaUo9UMZ88z5Go6
 BT5U/jZJdyiEnCgz3K61L7Qf/+C5zSoeKYOA7IoeitXJeX+vB70qNrVYijzk5PMn7LZXAbGrWhU
 BqIjWc6N/i0uV7ds6VH97SwKz8L/YznQkg0BQ+YfhoElx6yb8vrLUlJRpgNlfnUVaQtivoLMUpS
 JYa9+5qD4RE7M4r6m2So9w2TPf0+DhrDm9uopzCswPjhz/i3BMKkuwgua/vD0so6HwGYVTsrPtk
 CAgJgpRlBv4Qx6HiK1dlMpHsa3GwGStKEJtjMqMai/IaR99825daTczqLWan1wohWC/xO+qk5qD
 f1YiurRZxnyjdccIu6AXrdy5ZKE0B0za4UqRPOi1AY3XwMBTvU361a1KzAKTxx17xEcZDisOZ8u
 1pVrqnhwMTciknw1QJw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b031508 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8-O9kgZlvKaYWh8tphcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5+mMSQBW588o
 aVYU2XKjd/S7JgZmEpvgyKYtSp49G9sc6DPWtudGBYVbfgnux4UfInQO+9eKL3piqe0VSGPAkpV
 dvGJI+txxKZob6HaB63VSeAar+3YlxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

The speaker protection modules exchange calibration state over a
control link, which the topology describes but the driver never sends
to the DSP.

Parse the control link tokens into a per-subgraph list and add them to
GRAPH_OPEN. Both subgraphs of a link usually declare it and the DSP
rejects a duplicate, so send each pair once.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  11 +++
 sound/soc/qcom/qdsp6/audioreach.c  |  90 +++++++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.h  |  18 ++++
 sound/soc/qcom/qdsp6/q6apm.c       |   1 +
 sound/soc/qcom/qdsp6/q6apm.h       |   1 +
 sound/soc/qcom/qdsp6/topology.c    | 134 +++++++++++++++++++++++++++++
 6 files changed, 250 insertions(+), 5 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index cf8ab6b85e34..7ab8e11ca5c2 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -234,6 +234,17 @@ enum ar_event_types {
 #define AR_TKN_U32_SUB_GRAPH_DIRECTION		4
 #define AR_TKN_U32_SUB_GRAPH_SCENARIO_ID	5
 
+/* Control Link Tokens */
+#define AR_TKN_U32_CONTROL_LINK_IID		50
+#define AR_TKN_U32_CONTROL_LINK_PEER1_MOD_IID	51
+#define AR_TKN_U32_CONTROL_LINK_PEER1_MOD_PORT_ID	52
+#define AR_TKN_U32_CONTROL_LINK_PEER2_MOD_IID	53
+#define AR_TKN_U32_CONTROL_LINK_PEER2_MOD_PORT_ID	54
+#define AR_TKN_U32_CONTROL_LINK_INTENT0		55
+#define AR_TKN_U32_CONTROL_LINK_INTENT1		56
+#define AR_TKN_U32_CONTROL_LINK_INTENT2		57
+#define AR_TKN_U32_CONTROL_LINK_INTENT3		58
+
 /* Container Tokens */
 #define AR_TKN_U32_CONTAINER_INSTANCE_ID	100
 #define AR_TKN_U32_CONTAINER_CAPABILITY_ID	101
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index aa1f4e296764..afa8e0159570 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -109,6 +109,26 @@ struct apm_mod_conn_list_params {
 
 #define APM_MOD_CONN_PSIZE(p, n) ALIGN(struct_size(p, conn_obj, n), 8)
 
+/* Control Links */
+struct apm_control_link_obj {
+	u32 peer1_mod_inst_id;
+	u32 peer1_mod_port_id;
+	u32 peer2_mod_inst_id;
+	u32 peer2_mod_port_id;
+	u32 num_props;
+	struct apm_prop_data intent_data;
+	u32 num_intents;
+	u32 intent_id_list[MAX_INTENTS];
+} __packed;
+
+struct apm_mod_control_links_params {
+	struct apm_module_param_data param_data;
+	u32 num_ctrl_link_cfg;
+	struct apm_control_link_obj link_obj[];
+} __packed;
+
+#define APM_MOD_CTRL_LINK_PSIZE(p, n) ALIGN(struct_size(p, link_obj, n), 8)
+
 struct apm_graph_open_params {
 	struct apm_cmd_header *cmd_header;
 	struct apm_sub_graph_params *sg_data;
@@ -116,6 +136,7 @@ struct apm_graph_open_params {
 	struct apm_module_list_params *mod_list_data;
 	struct apm_prop_list_params *mod_prop_data;
 	struct apm_mod_conn_list_params *mod_conn_list_data;
+	struct apm_mod_control_links_params *mod_control_links_data;
 } __packed;
 
 struct apm_pcm_module_media_fmt_cmd {
@@ -410,24 +431,26 @@ static void audioreach_populate_graph(struct q6apm *apm,
 				      const struct list_head *sg_list,
 				      int num_sub_graphs)
 {
+	struct apm_mod_control_links_params *cl_data = open->mod_control_links_data;
 	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
 	struct apm_module_list_params *ml_data = open->mod_list_data;
 	struct apm_prop_list_params *mp_data = open->mod_prop_data;
 	struct apm_container_params *c_data = open->cont_data;
 	struct apm_sub_graph_params *sg_data = open->sg_data;
-	int ncontainer = 0, nmodule = 0, nconn = 0;
+	int ncontainer = 0, nmodule = 0, nconn = 0, nlink = 0;
 	struct apm_mod_prop_obj *module_prop_obj;
 	struct audioreach_container *container;
+	struct audioreach_control_link *clink;
+	struct apm_control_link_obj *clink_obj;
 	struct apm_module_conn_obj *conn_obj;
 	struct audioreach_module *module;
 	struct audioreach_sub_graph *sg;
 	struct apm_container_obj *cobj;
 	struct apm_mod_list_obj *mlobj;
-	int i = 0;
+	int i = 0, j;
 
 	mlobj = &ml_data->mod_list_obj[0];
 
-
 	if (info->dst_mod_inst_id && info->src_mod_inst_id) {
 		conn_obj = &mc_data->conn_obj[nconn];
 		conn_obj->src_mod_inst_id = info->src_mod_inst_id;
@@ -442,6 +465,47 @@ static void audioreach_populate_graph(struct q6apm *apm,
 
 		apm_populate_sub_graph_config(sg_cfg, sg);
 
+		list_for_each_entry(clink, &sg->control_link_list, node) {
+			bool dup = false;
+			int k;
+
+			/* Both subgraphs usually declare the link, send it once */
+			for (k = 0; k < nlink; k++) {
+				struct apm_control_link_obj *o = &cl_data->link_obj[k];
+
+				if ((o->peer1_mod_inst_id == clink->peer1_mod_inst_id &&
+				     o->peer2_mod_inst_id == clink->peer2_mod_inst_id) ||
+				    (o->peer1_mod_inst_id == clink->peer2_mod_inst_id &&
+				     o->peer2_mod_inst_id == clink->peer1_mod_inst_id)) {
+					dup = true;
+					break;
+				}
+			}
+			if (dup)
+				continue;
+
+			clink_obj = &cl_data->link_obj[nlink++];
+			clink_obj->peer1_mod_inst_id = clink->peer1_mod_inst_id;
+			clink_obj->peer1_mod_port_id = clink->peer1_mod_port_id;
+			clink_obj->peer2_mod_inst_id = clink->peer2_mod_inst_id;
+			clink_obj->peer2_mod_port_id = clink->peer2_mod_port_id;
+			clink_obj->intent_data.prop_id = APM_MODULE_PROP_ID_CTRL_LINK_INTENT_LIST;
+			clink_obj->num_props = 1;
+			clink_obj->num_intents = 0;
+
+			/* Pack the intents that are set into a dense list */
+			for (j = 0; j < MAX_INTENTS; j++) {
+				if (clink->intent[j])
+					clink_obj->intent_id_list[clink_obj->num_intents++] =
+						clink->intent[j];
+			}
+
+			/* The list length itself is part of the property payload */
+			clink_obj->intent_data.prop_size =
+				sizeof(clink_obj->num_intents) +
+				clink_obj->num_intents * sizeof(clink_obj->intent_id_list[0]);
+		}
+
 		list_for_each_entry(container, &sg->container_list, node) {
 			cobj = &c_data->cont_obj[ncontainer];
 
@@ -477,12 +541,16 @@ static void audioreach_populate_graph(struct q6apm *apm,
 			ncontainer++;
 		}
 	}
+
+	/* The dedupe above may have packed fewer links */
+	cl_data->num_ctrl_link_cfg = nlink;
 }
 
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 const struct audioreach_graph_info *info)
 {
-	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	int payload_size, sg_sz, cl_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	struct apm_mod_control_links_params *clink_params;
 	struct apm_module_param_data  *param_data;
 	struct apm_container_params *cont_params;
 	struct audioreach_container *container;
@@ -494,6 +562,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
 	const struct list_head *sg_list;
+	int num_control_links = 0;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -511,6 +580,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 
 	list_for_each_entry(sgs, sg_list, node) {
 		num_sub_graphs++;
+		num_control_links += sgs->num_control_links;
 		list_for_each_entry(container, &sgs->container_list, node) {
 			num_containers++;
 			num_modules += container->num_modules;
@@ -526,13 +596,14 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	num_modules_list = num_containers;
 	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
 	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
+	cl_sz = APM_MOD_CTRL_LINK_PSIZE(clink_params, num_control_links);
 
 	ml_sz = ALIGN(ml_sz, 8);
 
 	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
 	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
 
-	payload_size = sg_sz + cont_sz + ml_sz + mp_sz + mc_sz;
+	payload_size = sg_sz + cl_sz + cont_sz + ml_sz + mp_sz + mc_sz;
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
 	if (IS_ERR(pkt))
 		return pkt;
@@ -584,6 +655,15 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	params.mod_conn_list_data->num_connections = num_connections;
 	p += mc_sz;
 
+	/* Control Links */
+	params.mod_control_links_data = p;
+	param_data = &params.mod_control_links_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_CTRL_LINK_CFG;
+	param_data->param_size = cl_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_control_links_data->num_ctrl_link_cfg = num_control_links;
+	p += cl_sz;
+
 	audioreach_populate_graph(apm, info, &params, sg_list, num_sub_graphs);
 
 	return pkt;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 0a50b9337738..0ea035fa630c 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -171,6 +171,9 @@ struct apm_module_conn_obj {
 	uint32_t dst_mod_ip_port_id;
 } __packed;
 
+#define APM_PARAM_ID_MODULE_CTRL_LINK_CFG	0x08001061
+#define APM_MODULE_PROP_ID_CTRL_LINK_INTENT_LIST	0x08001062
+
 #define APM_PARAM_ID_GAIN			0x08001006
 
 struct param_id_gain_cfg {
@@ -893,6 +896,19 @@ struct audioreach_graph_info {
 	uint32_t dst_mod_ip_port_id;
 };
 
+#define MAX_INTENTS 4
+
+struct audioreach_control_link {
+	uint32_t id;
+	uint32_t peer1_mod_inst_id;
+	uint32_t peer1_mod_port_id;
+	uint32_t peer2_mod_inst_id;
+	uint32_t peer2_mod_port_id;
+	uint32_t intent[MAX_INTENTS];
+	struct list_head node;
+	struct audioreach_sub_graph *sub_graph;
+};
+
 struct audioreach_sub_graph {
 	uint32_t sub_graph_id;
 	uint32_t perf_mode;
@@ -903,6 +919,8 @@ struct audioreach_sub_graph {
 	struct audioreach_graph_info *info;
 	uint32_t num_containers;
 	struct list_head container_list;
+	uint32_t num_control_links;
+	struct list_head control_link_list;
 };
 
 struct audioreach_container {
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 4cb597d737b1..968fb7898aa4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -900,6 +900,7 @@ static int apm_probe(gpr_device_t *gdev)
 	idr_init(&apm->graph_info_idr);
 	idr_init(&apm->sub_graphs_idr);
 	idr_init(&apm->containers_idr);
+	idr_init(&apm->control_links_idr);
 
 	idr_init(&apm->modules_idr);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 9092359ccf90..96409075b294 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -67,6 +67,7 @@ struct q6apm {
 	struct idr graph_info_idr;
 	struct idr sub_graphs_idr;
 	struct idr containers_idr;
+	struct idr control_links_idr;
 	struct idr modules_idr;
 };
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index aa2ab2b058d0..5dd7f2c51d5c 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -97,6 +97,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&sg->container_list);
+	INIT_LIST_HEAD(&sg->control_link_list);
 
 	mutex_lock(&apm->lock);
 	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
@@ -113,6 +114,51 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 	return sg;
 }
 
+static struct audioreach_control_link *audioreach_tplg_alloc_control_link(struct q6apm *apm,
+							    struct audioreach_sub_graph *sg,
+							    uint32_t control_link_id,
+							    bool *found)
+{
+	struct audioreach_control_link *link;
+	int ret;
+
+	if (!control_link_id)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&apm->lock);
+	link = idr_find(&apm->control_links_idr, control_link_id);
+	mutex_unlock(&apm->lock);
+
+	if (link) {
+		*found = true;
+		return link;
+	}
+	*found = false;
+
+	link = kzalloc_obj(*link);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&apm->lock);
+	ret = idr_alloc_u32(&apm->control_links_idr, link, &control_link_id, control_link_id,
+			    GFP_KERNEL);
+	mutex_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev, "Failed to allocate Control Link ID (%x)\n", control_link_id);
+		kfree(link);
+		return ERR_PTR(ret);
+	}
+
+	link->id = control_link_id;
+	link->sub_graph = sg;
+	/* add to control link list */
+	list_add_tail(&link->node, &sg->control_link_list);
+	sg->num_control_links++;
+
+	return link;
+}
+
 static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm *apm,
 							    struct audioreach_sub_graph *sg,
 							    uint32_t container_id,
@@ -348,6 +394,85 @@ audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 	return NULL;
 }
 
+static void audioreach_parse_control_link_tokens(struct q6apm *apm,
+						 struct audioreach_control_link *link,
+						 const struct snd_soc_tplg_vendor_array *cl_array)
+{
+	const struct snd_soc_tplg_vendor_value_elem *cl_elem = cl_array->value;
+	int tkn_count = 0;
+
+	while (tkn_count <= (le32_to_cpu(cl_array->num_elems) - 1)) {
+		switch (le32_to_cpu(cl_elem->token)) {
+		case AR_TKN_U32_CONTROL_LINK_IID:
+			link->id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER1_MOD_IID:
+			link->peer1_mod_inst_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER1_MOD_PORT_ID:
+			link->peer1_mod_port_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER2_MOD_IID:
+			link->peer2_mod_inst_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER2_MOD_PORT_ID:
+			link->peer2_mod_port_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT0:
+			link->intent[0] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT1:
+			link->intent[1] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT2:
+			link->intent[2] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT3:
+			link->intent[3] = le32_to_cpu(cl_elem->value);
+			break;
+		default:
+			dev_err(apm->dev, "Not a valid token %d for control link graph\n",
+				le32_to_cpu(cl_elem->token));
+			break;
+		}
+		tkn_count++;
+		cl_elem++;
+	}
+}
+
+static void audioreach_parse_cl_tokens(struct q6apm *apm, struct audioreach_sub_graph *sg,
+				       const struct snd_soc_tplg_private *private)
+{
+	const struct snd_soc_tplg_vendor_value_elem *cl_elem;
+	const struct snd_soc_tplg_vendor_array *cl_array;
+	struct audioreach_control_link *link;
+	int link_id, tkn_count, sz;
+	bool found = false;
+
+	for (sz = 0; sz < le32_to_cpu(private->size);) {
+		cl_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		cl_elem = cl_array->value;
+		sz = sz + le32_to_cpu(cl_array->size);
+		tkn_count = 0;
+
+		/* Module config blobs are not token tuples, stop here */
+		if (le32_to_cpu(cl_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE)
+			break;
+
+		while (tkn_count <= (le32_to_cpu(cl_array->num_elems) - 1)) {
+			if (le32_to_cpu(cl_elem->token) == AR_TKN_U32_CONTROL_LINK_IID) {
+				link_id = le32_to_cpu(cl_elem->value);
+				link = audioreach_tplg_alloc_control_link(apm, sg, link_id, &found);
+				/* Skip on error or already parsed control link data */
+				if (!IS_ERR(link) && !found)
+					audioreach_parse_control_link_tokens(apm, link, cl_array);
+			}
+			tkn_count++;
+			cl_elem++;
+		}
+	}
+}
+
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
 							       const struct snd_soc_tplg_private *private)
 {
@@ -617,6 +742,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
+	audioreach_parse_cl_tokens(apm, sg, &tplg_w->priv);
+
 	cont = audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
 	if (IS_ERR(cont))
 		return PTR_ERR(cont);
@@ -1108,6 +1235,13 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		/* check if there are no more containers in the sub graph and remove it */
 		if (list_empty(&sg->container_list)) {
 			struct audioreach_graph_info *info = sg->info;
+			struct audioreach_control_link *link, *tmp;
+
+			list_for_each_entry_safe(link, tmp, &sg->control_link_list, node) {
+				idr_remove(&apm->control_links_idr, link->id);
+				list_del(&link->node);
+				kfree(link);
+			}
 
 			idr_remove(&apm->sub_graphs_idr, sg->sub_graph_id);
 			list_del(&sg->node);
-- 
2.53.0

