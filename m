Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454073;
	b=W3gTjhSIWWyhTKVafk3AoxZrlUKFRzyZfjQmGZeNn4vsYGzn8kDDrS+sAF5CrHSr/jwN
	 ocWzbLQkEzWm+WRJr/2P+a/dMnQW2FhvGaeL4qB6ImvA74y1r3pHpfQCa5zmGZDVpK6Ul
	 hHLai8elcE4K/ezy4facrE6NSnObDyx11HaOcr1qu81vmgFFFjIYBwJxuwO91xcvJsCNr
	 JjHUA2V9h0msz81H9FNTUwHJTT5FaGE7/xbFb3t+J1rnkNNC/pf6SgNqT5dTw/A1uGFEi
	 OXz5lpaR/z7EgAucvZhOVsaPT778pq3IjZ83LDMTJYR7HBS2RX9G6boosEdYWGZ7uPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
	b=0bN+8XXvMNjDArgxHFjicNMlhpE2eEFvoeeOTUC0t/61gVK8IhlJ7amwQccjFC4ay53x
	 rXdMOIZ5AKENP1lS2UCnDYrXojbk2L2E5ECiQ6uFQjpVMaMC8bnKrIfeU5YpTtLQenk+h
	 UuNPH4TbcDBxLiGWiBN/N0SI/D+2S7MfEDmg2Y8hz8PkLny8VyQAs7yEhV7FeBZ+ozXMI
	 ZBIdyEVd4U3pohkSIKLFH2iWqHvDf0stJ72NdgYaOjOJnVIGkl4M27bkKm0+0j6ozfCnz
	 fSPij4y/cImvj2y83N3It4w2lkj8bBUJPW5MRniYFF+22HkG0ZOwRB4Kb7AJBPVgkPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="juNq/kq3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ1KRd1U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C4A606A689
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C4A606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juNq/kq3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ1KRd1U
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlCf3730161
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BFs5eXxfxc5
	hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=; b=juNq/kq3v3/m83E684FI0cXBlc9
	EYxHFjBLjBIWDAg3NBHb+VClOhVOyb/+7WiBpF28scbJFskh3IrcOGQat/M6J7kk
	b3F6FtR18X0CE27YPOML+LYEpzERnzrXiMUG6PNOrqnloTUjLBgDn8Kn3/S+m57R
	QOTY2NMbbZiTphTmH2vPJWnM3076xdzxrI/E3FlLngSzbgKKh4uzUkXSyF/irpNj
	u4V/4+Tj2JXhdonk5D5M5hvH9hX/h4LAuABJvh09LokGdjb8SXP8oq1HfK99hdYd
	X8yGxPED8QdFhCgXZyHKIlfr0DQGNWAS0M0vxCb4xmsl8cusXFFjlqggqag==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2jvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fb1f981fso47294817b3.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454072; x=1796058872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=GZ1KRd1Uct1EmlSnhzzfTOhhwlX5V3+TkiqAsk/taacB1aF+YOAjtWiO4fX5H+NQxU
         D8p4xS2ypqQkYJUtvXHOMCnw7juHBYY56jXSWm5o85G4Pmyu755IO1g5yW+JBhONS3JH
         d0uGFrDjclCiTEy06iBin7zMy9twLpux4xCl6t/rn8W6Z7BafPcHS9j/LVc9lhfKxYd9
         scJTCtwiUs6IRV7C9njlyv5YmvcuXh99NbYlWKNt0N0QJrSetTueZQDP9BQmyo5xV26R
         fNWi0MUcYAVImYzLbdIsFEINkmz++DKLvxEAnFoOh540KGoyApcEtJXnTpZxlMLV0Z2s
         djWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454072; x=1796058872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFs5eXxfxc5hMfUd5d7ZeC1sAOsp+aaXkMg+LQBZ5UM=;
        b=zxo/+C4qj8j+XXvh/Tt5nOvEla8bkuTZ/e6CLCFLUppvbwSoMRmAUIOJItfQH0SxO7
         M+RbUFVP1SwszHMigMZBnZ3cEy08pmD0XAZh+jP7Vu4EqfuLDwlHmaO7xC8ylg+DAnal
         /D98Wda42Xx9M1nAq0AcxfPkIXLeMG14KM0Vv4iSlhMQXl/uedBkZf/YalhwnubkmoDO
         Q+UNVElUULpYXMuS5SXxtZbJtoo3X1+eyqKvzAf8faDGv4WILba6q7DE980z2JzIcaxN
         uN6XDit9fnQMMjcauiUUznMY8NQh7sokDZ6D8BhVrHpdHpS7amo3ccMlQSf2j8p5y4mV
         Y6UQ==
X-Forwarded-Encrypted: i=1; AL+hErEjFJtPn+oeaIRNAhvCk6RF48pMHE3578RsDEW5Wmb0rFQPFykbxPb+K0BZSXseWohY4DHV+w/0DHaR2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LT5aOn2obNCPnrXj3Cpij1tc6Wjsx/cbR1DA6oCMO47tYmscu
	UdeTc5tdTxF+lpSIUy0LTAklJI9Oqei2SC7UP4L3dlBYeJT/pHUKUW1eGMl+VAJM8Fv6SCMlXk4
	HzagALaG4M4EMQj99nCGJOApxMWsOnZ5w55iNBB3kxEGQERB1oL++mOklX5B9hqhp1g==
X-Gm-Gg: AZFdTZcppi5I7BehcyQxOK0rBXC/4bVQcoCk/UEgARKY8Au04un3ukRtHpm0xyIAto6
	eTRRIbwo9j/8QLci9FLoHIfcTwU/+uN0TNgR1vppJxSn5DR3blSIsidbI3BlyYEJ+KQ45h62Ewk
	m1KD0ZVrp7IpEHyENnj0U7pNWTsvBYeqIopdtcr7FXyxfkgVfxy/LA62H5DM58ykwO2zcLBoHZC
	yh5B6d2ngZZuY3TWGEdNq+pGoIrv+B4884epTqFaZnptzZlAFL23i2pRZHXd9nIIAkozALfujlD
	0iFrnrvTvoVKeZR8lUJAOdyixHlHKLG1gNHARkWyUKIaWqw83uKj16nD8w6wLJ8RRURZ/qxELa6
	golG+oDudN+ZRbiTEynCN7BqLjQ7b6OMobobOscvs1zJd8JV5kAAwrhFd8HYouBPc
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273347b3.52.1795454071576;
        Mon, 23 Nov 2026 09:14:31 -0800 (PST)
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr53273187b3.52.1795454070951;
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soundwire: qcom: program MM_SYNC for multi-master
Date: Mon, 23 Nov 2026 17:14:11 +0000
Message-ID: <20261123171411.444381-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: moITrFSbmENfCxoZPWulVBFwwEG4d3WW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXz7hoPX56BEll
 zrjCd3rQfR+tUfMkrzVdgggfz0/Tm3N8GOjlpENiruYOXAJJgOf4fJ190y4u6UruQFSsmxxPd8G
 KaWpUgN6p+M88n1pbVmuVE9ZWCj0rCb0dOBfTqjTKbNWaeAJUL8+jpofgeD7FRem1yo3SwLY0tK
 J3/s1V64uiw4Xd3vsRvzlckfgfQ2boc+LwKvu2QeuWYbsN2xmwIQU0azg12QnDZ9lekVjz4z38S
 PtRDe34WNbxGhqKoFaeDHXL3hIlGCqUzmXb/lgLZvOVf91x17Peuy4lQVK7jLu1EvF6KAAI5GEv
 TQ2ZhviTP1T8+1cmEgTWWDgnM80tG4z57JvxcbBtKda/H86tHfZa7X83IfT4VZc3lTs8JCnhe0h
 Ou2BGGF5n9U1g5D3WUtCULn4AmAvo80LuH6Sf+AJiuehvFbDqQeHKoWJdrwBivmCHYRevAusn3P
 5jbUz+542SGmSCXu+cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX/+togTbgKFIo
 vfm5QsfURmC/NUtlFBn2GTnYPy0A9UJZNVmL+FrQRLsQBX88w8k84oBaYFu+hi34oC5FnhqcUtg
 xUq54I4dG9XTCjDbT09Zgz4zXX5lK48=
X-Proofpoint-GUID: moITrFSbmENfCxoZPWulVBFwwEG4d3WW
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b047478 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=c7LmfZLfTtV-q45nPo4A:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

The primary and dependent frame generators must lock to a single
SWR_CLK for the shared bus to run. Program SWRM_V3_MM_SYNC_CONFIG
on both sides at init, and re-apply on resume as the register does
not survive a clock stop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 396b57d8eb0e..20c805204de5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -48,6 +48,18 @@
 #define SWRM_V3_COMP_PARAMS_RD_FIFO_DEPTH			GENMASK(23, 18)
 
 #define SWRM_COMP_MASTER_ID					0x104
+
+#define SWRM_V3_MM_SYNC_CONFIG					0x108
+#define SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK			GENMASK(15, 0)
+#define SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER			BIT(16)
+#define SWRM_V3_MM_SYNC_MASK_CONTROL_BITS			BIT(17)
+
+#define SWRM_V3_COMP_FEATURE_CFG				0x10
+#define  SWRM_V3_COMP_FEATURE_CFG_BASE				0x00E
+#define  SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN			BIT(9)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL			BIT(10)
+#define  SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE	BIT(12)
+
 #define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_V2_0_INTERRUPT_STATUS				0x5000
 #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
@@ -949,6 +961,43 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
 	return false;
 }
 
+static void qcom_swrm_program_mm_sync(struct qcom_swrm_ctrl *ctrl)
+{
+	struct qcom_swrm_ctrl *peer = ctrl->peer_ctrl;
+	u32 conn_mask;
+
+	if (!peer)
+		return;
+
+	if (peer->bus.controller_id < 1) {
+		dev_warn_once(ctrl->dev,
+			      "multi-master peer has no qcom,controller-id; MM_SYNC skipped\n");
+		return;
+	}
+
+	conn_mask = BIT(peer->bus.controller_id - 1) &
+		    SWRM_V3_MM_SYNC_CONNECTED_MASTER_MASK;
+
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY) {
+		ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG, conn_mask);
+		ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+				SWRM_V3_COMP_FEATURE_CFG_BASE |
+				SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_PIN_AVAIL |
+				SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+		return;
+	}
+
+	ctrl->reg_write(ctrl, SWRM_V3_MM_SYNC_CONFIG,
+			SWRM_V3_MM_SYNC_IS_DEPENDENT_MASTER |
+			SWRM_V3_MM_SYNC_MASK_CONTROL_BITS | conn_mask);
+
+	ctrl->reg_write(ctrl, SWRM_V3_COMP_FEATURE_CFG,
+			SWRM_V3_COMP_FEATURE_CFG_BASE |
+			SWRM_V3_COMP_FEATURE_CFG_FORCE_MODE_EN |
+			SWRM_V3_COMP_FEATURE_CFG_CLK_STOP_EXEC_ON_CMD_IGNORE);
+}
+
 static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 {
 	u32 val;
@@ -977,6 +1026,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	qcom_swrm_program_mm_sync(ctrl);
+
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
 		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
@@ -2059,6 +2110,11 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	} else {
 		reset_control_reset(ctrl->audio_cgcr);
 
+		qcom_swrm_program_mm_sync(ctrl);
+		/* dependent was resumed first via the device link */
+		if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && ctrl->peer_ctrl)
+			qcom_swrm_program_mm_sync(ctrl->peer_ctrl);
+
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
 			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-- 
2.53.0

