Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775890;
	b=TmLq0ZcHyzBk/gtr8B8I0ESgJDB3rqZsyaTOj1IASlYVcLxUJHdeQKzXjFmFixVANE7C
	 NCo954RMOQkexHwEwGEFpSr710RbhLYfZZQtxprUjirAGhENBXYrsRwfVMfpajbnSr+Wb
	 LOE4pZ1Z5HClRN5mAq3nigoNEgTYs1HCBRKGQ3KM0Ry3xDDMhpRhj4FaO7FD2HNgeE7gQ
	 OHA+LGDN2oFk4Po8kvZKqmXV35wmXGr68Y4XuG+XuonUvoLW9XBEP2i0c9nAUnvdO21kZ
	 KliGw3cmCcgcPq27bFJ0POvAQTNWMC7ndBMkX2baIemzhmEno8k5Y+YUDczrZUmmDUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BBp91ryXprfz1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=;
	b=OW20RIUEDrUCT8THYVnVOWoShz/9HvbGFBCjD+gYqQoFPpWkyZJLQo31HxUxlX7+MrrR
	 NxGuoHPnPMT6BTsapxYIEVCOrFrMWajvU13R+bN4+Wn+sew8gxTAiRBwxDz81u79BBjLl
	 FC0vDO0suY+60hBRuv/DlniWwvYxcqktMDWnNOp9BPM2M84i2uOUola1i9F07yleWu4HL
	 xhEBbyNunymzA3mK22Z+3dZfiY1vO/GwYuG43m78R+ylZX4/3KB2yn4P60VIL2NTEs1jJ
	 c76tP4woNgAaluqStqzRpW831XEilS+VlnN8UWHloJJVMnfd+B+88/Lt0qmzhOGYPww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6IxDb2K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iruQaTTJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A6606CA03
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498A6606CA03
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6IxDb2K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iruQaTTJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6C0e2462551
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BBp91ryXprf
	z1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=; b=O6IxDb2KDuSTwXT6p4Fe7WRNr/L
	xAHDjGePM8cidyd2XqxWGyL29PozVBtcIUy6JLAI2HJurpNpXaIXB8zYcpd+oXoH
	iT05cEobw3gDbsT+moMwRHG6Ug7wbWvruALmi3LWmCwyKL4x6Ap+YdGbINS1Kj9/
	FBxzL/CBp/l6YbC6bjBS7ZnALsR0IViHCBknJU5XTdT1pnSHFK41rhLqv5YrfjOz
	h0EjYsIIzEX5HY1VAxpqz7mCJS5eSGxK8JBpc9j+J6FoFDssWvqFL+RFpx4rdUEc
	yG08DAx7QzXYAl4mhosFWlZ36lDH1KTVLmpbZFKi6wwYlrMuV56BNbHBlPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvsjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so210007185a.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775889; x=1793380689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBp91ryXprfz1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=;
        b=iruQaTTJGLpU4PLiNJW+w1kPZSTIsBGfHtR2r3kdVGmCV8Q2/3Jyad5CN/PlrgQ8wX
         EWbOX5+PNMP8PjqEyBMG4SgHEYgtq4ejSJxZ954kO/OW2YvaI6LYZICBJX1Wk43pHPgi
         x4KnP2eD6CMua6JkAnqE3noUHhvypS1EnuRrSke706iObiCh9JB526586Py0eg6MtR4W
         Z+TDp1Ca/l5eN9NWSf0ObbytsQ0ycd6lQUiNYIvCU31vCewlrZFNTDk5FwVO2g7AEOIw
         D5kV7/T32Wbq8gdYuP1N7zJ/5AZxU0A4EDEtzSLF6sEHyZD+t+PfSQCMN8/VW1f/duQ1
         EIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775889; x=1793380689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBp91ryXprfz1PGC/2DRQbdRSPoT7PElTxuGgCcKOGM=;
        b=QZ6T/fZxdWDNDy5CiaeXgckNx6ZH0s/L8lb6j72QyqJZXFB4Zdv7jxHgcBFYJ3TgWG
         GcGlkYoNMMKWJ7UPRtpIRlvgrBCXNOR9fAgQNOHWi5ml6BhHotUSmOmGo8G7lRrCwehe
         m2jzDplbybYzO1F3SoCskRRpJcCTvKY2rYlgYgwIf6YH4KgYP+q5APYSWelBwVBszKSc
         m/lFJwL0caO/qXkyExJDbSHgWLlkJJEjQToQpqnYB3ubWMZHNwSIEggq0DB2X13qs4P2
         VGbA3DFMW9i61Fw68S+1OD22U/cG9iUL19Y5/ZpjE8wjTBBmPVkg5WpGEYxGcy6fz0dK
         Zy+w==
X-Forwarded-Encrypted: i=1; AKwUvBzmoOtDSz0X61VeX4RpGZsIcrV+c2QP+QnuEFB4BeSFFabysPZJIM/NeuLKUR3OUZdD+dyy5TFRm6eGNw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLn6+k0asvss57ucZvX4+YwxxQtf4c11cBuRAAKKo83qLuNn7Qz
	UDOYTKoDzfy92Kp2Sg1Y5YGGJzF3oQXQFrwGRSvJEpTtKwxvMHWmlOMs8uAPM0XCf6KwIPEzyxr
	sUvrEAz5mlXnGaahiz0Yd+IGRf3leckLVbFYdo1wGi0CU2rCSmiUmXH5SR3fZw19H0w==
X-Gm-Gg: AYBFou15jvJSNsm5fuDN/zvOSBcErb1Jw7OuB3Eg0uyYTX2DeRI46xBmkhNwvLIA3Tt
	UgtXwZjvfDROeaRa8usXq6LRHGgY5VODLRxzfviQvrK7V8UZaynIo8ccbDoJbGB4thTwbcJneXt
	PeVbTC9kyxWjBuvTc/ULg52eXE5INg1y0VuL+jt/hIE9cxZJwL9PrKfvytV+r3opulhIfWksDIK
	ElbNVSBODAt9lsPN2GwlGNuKwLJkLJ9zhJ45hlSUGI4K5mlTWKoKrbi+q6WIscxSuKnlpWZN6N+
	KG1xgNuRTYaOGjPUqqwc1vhfiIg/fdyPRLsmwC6N2sXDW+TOv3q1FtSzYCXsQ6GgKtWnNYi/gpV
	A81YXmIa7R01B
X-Received: by 2002:a05:620a:4509:b0:93e:920c:bfcd with SMTP id af79cd13be357-93f6f7e4205mr529239785a.57.1792775888484;
        Fri, 23 Oct 2026 10:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4509:b0:93e:920c:bfcd with SMTP id af79cd13be357-93f6f7e4205mr529234585a.57.1792775887909;
        Fri, 23 Oct 2026 10:18:07 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 12/23] ASoC: qcom: audioreach: make the speaker protection operation mode configurable
Date: Fri, 23 Oct 2026 18:14:22 +0100
Message-ID: <20261023171433.820092-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PqEgyVe3TUi4HKbwGR0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: n18lW5qtXpFoyhlv-hMokCKHQiMJxlhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyDl1rluyXlht
 yel00NuZfdwvlqt8kdayA8u8QRJoJILsAiCJAFTmFlmk2SxhfmGfPffxUAzWxqiWm1UPj2Fnp3E
 9yGAUF8hufzxBAs7rJO6RhGSV+DvpGO92HVudKsxivRPhOVWCc/az+eG/gg8C9AakTwjp940adQ
 Tej+Ua8k0o9sk60eC9YhqNyoRammoQsA5rN8XkBe8pDnuXknwta7Yv8QbEh8ZqQAFMpnRcvmStF
 QHq9/mu5cQT/+stbg59T9xaIyU+StSq6BfXjG7ao/HUb848coljh//lsIHjV+jv+BBt7kHagvfp
 niLz0CMci7prmcFpICETa7f3Wo28FHPSWS3S/HEV3MmAwV8XpFtbdCZYVQDW3PLwXbT/HzluTXB
 ILTx0xN8qTPVnvRYGPQJXLWLL/ZY79LC2rW7i8JbvOmZxSyffN9N/Po0zA9GcYRCz5m5cxurkbr
 H+uzSjFwSY9R1NpeP0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwdiybIzkouwl
 gu/NINFxWeuY3u2aMFtRzvAfYL/ecjZV7JN/F+0gJwc6ZrYH9ggcfb41pGheFNMXwEEA5WjUnQ3
 rQcd1uQIKXHDgH+YzO1ymO64obQelGQ=
X-Proofpoint-ORIG-GUID: n18lW5qtXpFoyhlv-hMokCKHQiMJxlhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add a speaker protection operation mode, Normal or Calibration, and use
it for the VI configuration instead of always calibrating. The default
is Normal.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 33 +++++++++++++++++++++----------
 sound/soc/qcom/qdsp6/audioreach.h |  2 ++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index eb317b704b54..7c15c91888b7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -13,6 +13,8 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+static u32 sp_operation_mode;
+
 enum sp_vi_cali_state {
 	SP_VI_CALI_IDLE,	/* Not calibrating */
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
@@ -1474,6 +1476,16 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+u32 audioreach_get_sp_operation_mode(void)
+{
+	return READ_ONCE(sp_operation_mode);
+}
+
+void audioreach_set_sp_operation_mode(u32 mode)
+{
+	WRITE_ONCE(sp_operation_mode, mode);
+}
+
 static bool sp_vi_cali_state_is_failure(u32 state)
 {
 	return state == VI_CALIBRATION_STATE_FAILED ||
@@ -1575,11 +1587,10 @@ void audioreach_vi_calibration_event(struct device *dev,
 }
 
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
-					 const struct audioreach_module *module,
-					 uint32_t operation_mode)
+					 const struct audioreach_module *module)
 {
 	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
-					 operation_mode);
+					 READ_ONCE(sp_operation_mode));
 }
 
 static int audioreach_register_events(struct q6apm_graph *graph,
@@ -1624,6 +1635,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
 {
+	u32 mode = READ_ONCE(sp_operation_mode);
 	u32 num_channels = mcfg->num_channels;
 	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
 	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
@@ -1647,11 +1659,13 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
-	audioreach_arm_vi_calibration();
+	if (mode == PARAM_ID_SP_VI_OP_MODE_CALIBRATION) {
+		audioreach_arm_vi_calibration();
 
-	rc = audioreach_register_events(graph, module);
-	if (rc)
-		return rc;
+		rc = audioreach_register_events(graph, module);
+		if (rc)
+			return rc;
+	}
 
 	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_speakers);
 	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
@@ -1675,7 +1689,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 
 	/* The DSP calls this field num_speakers for the VI module */
 	op_cfg->cfg.num_channels = num_speakers;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
+	op_cfg->cfg.operation_mode = mode;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1766,8 +1780,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
-		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_CALIBRATION);
+		rc = audioreach_speaker_protection(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 232faba6d83f..e30603674e37 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1114,6 +1114,8 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+u32 audioreach_get_sp_operation_mode(void);
+void audioreach_set_sp_operation_mode(u32 mode);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
-- 
2.47.3

