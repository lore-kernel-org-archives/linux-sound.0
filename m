Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364108;
	b=fl0YR9CkTe8HfkPMPuBVraCdAfYyXOQ2J1bJUg598kk/1DJXBpZyyHJtJuOCuVx3kCS7
	 V5zsLudS98oLn3/T6T8UzhsjMB8RTrLV+TY+KcCWEQdj1eoKOzQLpECFNZ1vKgxzJm5Kq
	 b/VEcrxCvB/V9HEbZqGJKanXY6GxKCiRq88KmOEuVpCKlxWyc5Dat/TxFyJH+s7ljpt7A
	 JhIIV7V146cSTnhdFUNgAacFLa16YoYdrGYEC5GeO6fSVZbmd2EirJKTmeAzF+fZiCPIv
	 KkIzW03dwEv5Bw3NgZuwR9x8HMmL8ZJ9nfQ5gldFAS7ipaP2GdfLg0WDTWEwCwVsyaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wf89pT31Kdh1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=;
	b=tkkklPuEfzpjFryd3vLd+TDR/lJkqYybjldyMTi96p1nUovxWUYe/lsDdGP4qtWhwnmO
	 G/mkiV+cVbPKyRiCwXO3h43oRUxTGuOcs35su1llzER0U/ZFpGyCizJ7vao0Ydyt2Gxna
	 RcjYCD2NtvF9xBHzn0seg48HnIkvcSuhWKB7L9/QtMr14XeeB5WFmV1fS6xD/WhKlthGr
	 fAfA3WpPiibSMtTzbiVc1ryL5w0/u+8TKEofKqAaHxGql9UX46q3E+Q/t4GaQS72UaUzD
	 shZcCPiZIY+0/iMIwXTDRqNvy/f6cxTKM4vY0iKfuvwkEnwBTphKE8LrtAjj6gBAQzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jXLNhJ9X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkYgT5gU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824660A3826
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9824660A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jXLNhJ9X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkYgT5gU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQnKJ1248380
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wf89pT31Kdh
	1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=; b=jXLNhJ9XTTMEanrAkb0PvlUQN5O
	BUK7LHiMq49usMkD51T4vyW+QWF8hxtmNFUJpJvPcvKLd0Cmo8XwiObZDTg5ZWMo
	ctOYVXi+ecKrgvmzmmBpUHpyXzqM9/c2RHsPQGY2wX1ToQECh2csgz6rIqXWhcHw
	wuDVT/ashxh1IBy/j++9agOB7JYaB9zWrFwPo51K/qIA05jgo2GQ3UX55fdWDn6f
	2uMQ0GiBxG1yrD4px/5/0zV/0iBJCucV74axsx5lx+ocVqPGndF0hpfcaOsze3Dv
	/dJpOc0i65wxuy0zYkt4hak/9yhhbJa/gmkEBNRimG8PNFOk3xworNU4tPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03ruu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so431807285a.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364106; x=1795968906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wf89pT31Kdh1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=;
        b=RkYgT5gU71zRO0ubsTKHDUX8PHhLdEEOGingQuljKUujbVn42o+UVR636fpTJAZxsW
         xELHGHBYlaQRcai5feahCR4w4uLqd2ghCqL30+UofPJedB4mqslqbJgvUqTxzElXGSOf
         EFIA27uOTH1vwolFjRW6bdrMZntl1Zh7PTpvWWQUN0kusEJT/x+bCamgLgvJnVfrFU6f
         tgSSeMRjiloXgaBVVE2EoCrX2TE3PJ7S7mN3LfwBq4wIwQeqTK7T6AeJXDiWKBrRspBa
         zWzcoShM+hCZlZvoMpx+qOzdloRI+HypgVN4rKcDiUUvaL4uhpaPjnp9juxfzkjdjdn0
         1pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364106; x=1795968906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wf89pT31Kdh1yExYrq6GyJjLDWu7pImGlA1nLeczhnc=;
        b=j/I54ksfaH/SyhC65m+6iJwJyNAaPRDCA0ukakgOYuTj5qO+CIMyqQRHQcEjHVeiDl
         so1H+UzN2i0z81YxCTHUvq9fJsPLAPzEfrf8zdB8dNgDtHrJo4e648MlnBgeU8YPu8jp
         EnrCS5QuATZJPefXi0ULHap7Taxq6e7PdatQx8yofbHrkP1n96batmn3OgfqS2chCDl5
         T8FxdYe5IseOyXQZvaGQ1chwB5ULUtP2pLfx+xQX6sEzKneWwTAiHYjBzwoHkrVAd7nF
         VoCc9u+6TGuFDSU3kaeSMF2OshqnM+RqmK+ee4raLJHVCsTqDeh97obPbD3l+7m/PGIm
         1y+w==
X-Forwarded-Encrypted: i=1; AL+hErFmS1Ehc9kHzbUUNlGTBCOjTqbEKKb8x8aqLUCUiBMAjxmFqQLYL3g6ekqPpXlgWHYkz/ACJNNWFNJ5sg==@vger.kernel.org
X-Gm-Message-State: APuU4Z838Ls9Nc5F1WD+15SUc2CUr4wP6I9HxnQ5Qij+MKLQHkELYn1w
	G3Jt1wE68St5UArHYqUaPHJ2ixCCjhiaGN7j+/UBR/tYYibiQwHYy76Y+a3asqNnnRGnpXOhvEn
	cQ5IitHVyJTALPn8bJGll/9sWas+1vHdeDZq1edKyBMAeizLM3uTmmiMNhDGGYeT5Hg==
X-Gm-Gg: AZFdTZdXOi1lLwlMAinsDKWQwkaOrB8pS8UAaxuhuZQ1ViQuIs0cMfg3vzLStko45zB
	ARDZpMqyrxPiU3Eu/1SWeCyNJf/zrx2brIne1G9fRTT6pOl+ZDCjeUTUpnt44CjDeBgEHdkshre
	CvqjpKDf2J3pg91dfSrg+uNfwCDhssrlTUjFFDNj1VuiwhFI1naGAmCSrfQs+G+j+LX8WvJqVzC
	cVYOSYOGQpL+UBLayJXDQinJ4zf+iuCaMYNlejtx0IWiHCkEOge6kQeG9uyc3vePCHkRsU/2byk
	mfobdzBaZ8d4QWzmoz1yc2312VTBjc5FeSfzW+MqlU3yQkh/i9HVSuroXfy3z6DQ1rRyicnR3jC
	p19ENuKtvP2MHDrtiHg4Z1mFNA11LsL20nz5fV2kEyWb7JBqti1HmP5X2wC7ecwR5
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr1536479485a.40.1795364105748;
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr1536472185a.40.1795364105176;
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:04 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 10/24] ASoC: qcom: audioreach: run VI module in calibration mode with per-speaker events
Date: Sun, 22 Nov 2026 16:14:23 +0000
Message-ID: <20261122161437.5994-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXy9QyTMUDBMCL
 fj/5GJze/UmN1jYpC4v5WHN8nnGQlMjorh26aXqTNbzRJ0d/XrlwaUvbWF6uKu8rjKRDYXmo4Ga
 GEU1Zgot1ErIuPoSR2yIVM9qaiqvbALLgoR0eIJl1P9HitpHeiOI1nEwT+cLccXUYyoI7cwGVVN
 zfDTVdJIVNSZhFhfzYv5ejenqYcgclt2Aod+/0PFt7UGFa98efuJ3DucNlhIMtZEdQmfDzHmG/o
 AW5gxDauJHe62Uxwln7DPPFLTm2KWYj2Ydx86fvQzrZBLPDuHEPwL5o77fj2meNl3yLUu93G6RT
 tEoYBDE2lahI1ZutX72wMu76GPDOhgbmEfAEhwndLv8GF+e652pj1BmWz+PVG/AbN9zfOBYSPwK
 aVxRwrlPP4EDZXvfVM81IMBAhSv832BSO896W+Pv/2Dzq8ExWpgSTuEx/jql+VFnw8XBQ8VmdG0
 rpEZv5HP0G6WD4x3GEQ==
X-Proofpoint-ORIG-GUID: dmiO2_rR908JfsDq2O-OnlPAoexcc1sg
X-Proofpoint-GUID: dmiO2_rR908JfsDq2O-OnlPAoexcc1sg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxapy/aDpXKDx
 AeyU4xgyhWEp5CKqUg82W+YusMatiSLEaBK/2i5sohgDoDGAI6HoblT+5w9eE9dGZX6xY6EWWXW
 jeEfTvnUzwzseSpw8ZQE53j1quNZjNI=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b03150a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5EnwkQkph5nfVeabW8IA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Put the speaker protection and VI modules in calibration mode, number
the V/I channel pairs consecutively (the VI capture packs one pair per
speaker without gaps), and support up to MAX_SP_VI_SPEAKERS (4) speakers
to cover laptops with four WSAs.

Register for EVENT_ID_VI_PER_SPKR_CALIBRATION on the VI module so each
speaker's state and measured resistance are reported on their own, and
dispatch the event from q6apm's graph callback into
audioreach_vi_calibration_event().  The initial handler just logs each
event at debug level; later patches add result caching and a userspace
trigger on top.

The module event registration is scoped to the graph: the DSP releases
it automatically when the graph is closed on stream close, so no explicit
unregister is needed on the driver side.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 86 ++++++++++++++++++++++++-------
 sound/soc/qcom/qdsp6/audioreach.h | 57 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 26 ++++++++++
 3 files changed, 151 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index afa8e0159570..fbb9e3c4b84a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1462,6 +1462,18 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+void audioreach_vi_calibration_event(struct device *dev,
+				     const struct event_id_vi_per_spkr_calibration *cali,
+				     u32 num_ch)
+{
+	unsigned int i;
+
+	/* Raised every frame; keep the per-event log at debug level */
+	for (i = 0; i < num_ch; i++)
+		dev_dbg(dev, "VI calibration channel %u: state %u\n",
+			i, cali->cali_param[i].state);
+}
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module,
 					 uint32_t operation_mode)
@@ -1470,6 +1482,35 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 operation_mode);
 }
 
+static int audioreach_register_events(struct q6apm_graph *graph,
+				      const struct audioreach_module *module)
+{
+	struct apm_module_register_events *payload;
+	struct gpr_pkt *pkt;
+	int rc, payload_size;
+	void *p;
+
+	/* No event config payload, the packet is zeroed on allocation */
+	payload_size = ALIGN(sizeof(struct apm_module_register_events), 8);
+	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_EVENTS,
+				       0, graph->port->id, module->instance_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	payload = p;
+	payload->module_instance_id = module->instance_id;
+	payload->event_id = EVENT_ID_VI_PER_SPKR_CALIBRATION;
+	payload->is_register = 1;
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
@@ -1480,18 +1521,30 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size, j;
+	int rc, i, j, payload_size;
 	struct gpr_pkt *pkt;
+	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
 
-	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
+	/* One 32-bit V/I word per speaker, so channels == speakers */
+	num_speakers = num_channels;
+	if (!num_speakers) {
+		dev_err(graph->dev, "Error: VI needs at least one channel\n");
+		return -EINVAL;
+	}
+
+	rc = audioreach_register_events(graph, module);
+	if (rc)
+		return rc;
+
+	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_speakers);
 	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
-	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_channels * 2);
+	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_speakers * 2);
 	ex_sz = APM_SP_VI_EX_MODE_CFG_PSIZE;
 
 	payload_size = op_sz + cm_sz + ex_sz;
@@ -1509,8 +1562,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
 	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	op_cfg->cfg.num_channels = num_channels;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
+	/* The DSP calls this field num_speakers for the VI module */
+	op_cfg->cfg.num_channels = num_speakers;
+	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1520,20 +1574,15 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_CHANNEL_MAP_CFG;
 	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	cm_cfg->cfg.num_channels = num_channels * 2;
-	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+	cm_cfg->cfg.num_channels = num_speakers * 2;
+	/* Number the V/I pairs consecutively, the capture has no gaps */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_speakers; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
-		/*
-		 * Map speakers into Vsense and then Isense of each channel.
-		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
-		 * [1, 2, 3, 4]
-		 */
-		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
-		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
 
-		++j;
+		cm_cfg->cfg.channel_mapping[2 * j] = 2 * j + 1;
+		cm_cfg->cfg.channel_mapping[2 * j + 1] = 2 * j + 2;
+		j++;
 	}
 
 	p += cm_sz;
@@ -1607,7 +1656,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_NORMAL);
+						   PARAM_ID_SP_OP_MODE_CALIBRATION);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
@@ -1616,6 +1665,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_AUDIO_IF_SOURCE:
 	case MODULE_ID_AUDIO_IF_SINK:
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 0ea035fa630c..9d9449062b83 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
@@ -720,6 +722,58 @@ struct param_id_sp_vi_channel_map_cfg {
 	uint32_t channel_mapping[];
 } __packed;
 
+/* VI per-speaker calibration event, raised every frame in calibration mode */
+#define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
+
+/**
+ * enum vi_calibration_state - Calibration state of one speaker
+ * @VI_CALIBRATION_STATE_INCORRECT_OP_MODE: Not in calibration operation mode
+ * @VI_CALIBRATION_STATE_INACTIVE: Port not started
+ * @VI_CALIBRATION_STATE_WARMUP: Warming up
+ * @VI_CALIBRATION_STATE_INPROGRESS: Calibration running
+ * @VI_CALIBRATION_STATE_SUCCESS: R0/T0 within range
+ * @VI_CALIBRATION_STATE_FAILED: R0/T0 out of range
+ * @VI_CALIBRATION_STATE_WAIT_FOR_VI: Waiting for the V/I level to rise
+ * @VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT: Gave up waiting for the V/I level
+ * @VI_CALIBRATION_STATE_LOW_VI: V/I level fell below the threshold mid-run
+ *
+ * Reported by struct vi_per_spkr_calib_param.state. The DSP chooses these
+ * values, so they are fixed and must not be renumbered.
+ */
+enum vi_calibration_state {
+	VI_CALIBRATION_STATE_INCORRECT_OP_MODE	= 0,
+	VI_CALIBRATION_STATE_INACTIVE		= 1,
+	VI_CALIBRATION_STATE_WARMUP		= 2,
+	VI_CALIBRATION_STATE_INPROGRESS		= 3,
+	VI_CALIBRATION_STATE_SUCCESS		= 4,
+	VI_CALIBRATION_STATE_FAILED		= 5,
+	VI_CALIBRATION_STATE_WAIT_FOR_VI	= 6,
+	VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT	= 7,
+	VI_CALIBRATION_STATE_LOW_VI		= 8,
+};
+
+/**
+ * struct vi_per_spkr_calib_param - Per-speaker calibration result
+ * @state: Calibration state of this speaker.
+ * @r0_cali_q24: Measured DC resistance in ohms, Q24. Filled in regardless of
+ *		 @state, so it is meaningful for both VI_CALIBRATION_STATE_SUCCESS
+ *		 and VI_CALIBRATION_STATE_FAILED.
+ */
+struct vi_per_spkr_calib_param {
+	uint32_t state;
+	int32_t r0_cali_q24;
+} __packed;
+
+/**
+ * struct event_id_vi_per_spkr_calibration - Per-speaker VI calibration result
+ * @num_ch: Number of speakers the result covers.
+ * @cali_param: Per-speaker calibration state and measured resistance.
+ */
+struct event_id_vi_per_spkr_calibration {
+	uint32_t num_ch;
+	struct vi_per_spkr_calib_param cali_param[];
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
@@ -1060,6 +1114,9 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+void audioreach_vi_calibration_event(struct device *dev,
+				     const struct event_id_vi_per_spkr_calibration *cali,
+				     u32 num_ch);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 968fb7898aa4..c410e2f6e6a3 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -562,6 +562,29 @@ int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
 
+static void q6apm_vi_calibration_event(struct device *dev,
+				       const struct apm_module_event *event,
+				       int payload_size)
+{
+	const struct event_id_vi_per_spkr_calibration *cali;
+	u32 num_ch;
+
+	if (payload_size < 0 || payload_size < (int)(sizeof(*event) + sizeof(*cali))) {
+		dev_err(dev, "VI calibration event truncated (%d bytes)\n",
+			payload_size);
+		return;
+	}
+
+	cali = (const struct event_id_vi_per_spkr_calibration *)(event + 1);
+
+	/* Bound the array by the received payload, not by num_ch alone */
+	num_ch = (payload_size - sizeof(*event) - sizeof(*cali)) / sizeof(cali->cali_param[0]);
+	num_ch = min_t(u32, cali->num_ch, num_ch);
+	num_ch = min_t(u32, num_ch, MAX_SP_VI_SPEAKERS);
+
+	audioreach_vi_calibration_event(dev, cali, num_ch);
+}
+
 static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
@@ -585,6 +608,9 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			client_event = APM_CLIENT_EVENT_WATERMARK_EVENT;
 			graph->cb(client_event, hdr->token, data->payload, graph->priv);
 			break;
+		case EVENT_ID_VI_PER_SPKR_CALIBRATION:
+			q6apm_vi_calibration_event(dev, event, data->payload_size);
+			break;
 		}
 
 		break;
-- 
2.53.0

