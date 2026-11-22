Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364118;
	b=4N8/AUo2lvEB0qlcLB8uIUtvyDahtl9HZPqJsPnnLoLkfIqIbKqDJa3r7SgucFf1N+s2
	 o/W4zIU6aC9yd4lUUXYitK6uAsHRwb6bD1W9yjQthn8KLtmyEDpCRA2im7CWiIKQgX2g8
	 7d3mlelnBgjuaJARB/vEv/is20ItkjabSsuLNuv8itWbiJLNrL/9sbyvouMhpk/uoSR0A
	 dTuvs6oNSRxOzPW4P2NFP7NfuRjfRkGJ/xMcWW9aegk1F0jQ+dajRs1bYuDlLhXgTI5w4
	 vQkbUtKYzzn+sx2seHdp5fH4VDLTo7GCKOiCZgc2R3vGX5ng3v+2jFA/KTdLE4dmL4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
	b=k9VDj66g6uZ+wUtiliqiHb+RS+AXr8ycF0eEZrJtiKn35Q6d3X4FUU1N15IVx0dyD+lC
	 ea41twIrRvaDBu9gFPUzKHkCZFk8tRgkP1Zn+bV61htZuf48o6aJRioPsq3jKzhX0BJPZ
	 /snDDlCZOsjFoifLuDvxh13ppomSd5TuScGlJ3oymPfQQAVB1Cz/mmbgfegYMAdNp4I8g
	 0OMlYYcNVEt7by1ktdwtnbUn+A91TxODIqhLVPPr+7/2qGOYj7YiYhNnij8D1Dg0nKLu5
	 mqr3RqU9R96cmuhnrjsH2YppO0VG8oNc4ESB3ozkiizVXUlIZAPRrVCJeE/atYtGNCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D965606C559
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D965606C559
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mnr3WYf0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3l2cn3L
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ9sV1854224
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJ/t3yJRSO/
	I8Krm7cGvb9xURXfceDUgpjT74EYPghA=; b=mnr3WYf0RMNGwAS1YNEC2qcMZvo
	ddz23yc/mN33i1IAq9VcyeneKk6iYtaqJnOUdLuit7biAar9ZasMSpxBpW2pGokO
	0XG9aHzZwcLo0cJi7R6VschHqq0Jn1/GHYLOXqRNY1a6XTB4ia9EAso4YFmflJXa
	wlyrCnlZV8CWnjtPrmuS8mvcRL2Pxj8bS4BTUxsvDemaDSllCnkjQ3qOohqsLmXW
	anqnPAl6hs6vlClARhyPZemiCf17uaNlALmvAdndWoe0u9zJ7BWXWsSpIqR8bIdr
	Az8ZPnjXOtWayd6XXWh4v508JaKRajOatkt7reQBhVMex0F7N9EOT0S1KIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv41s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so435152985a.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364116; x=1795968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=D3l2cn3LhL/fO+NgI2ydQfHPum2bBeFF6S6SzD0DuXBbPrrszCCsvWkJFEjiUjOxN1
         /+GUmZUO3UTcDYnQwkzweV5hcImxX+Et/zioQvouwnf/IkUdZQcccKkGfn6vPQ13SYMW
         S0YSlxSv4z39+8itLx6MPzmolh7b8XRRWb9Dbmiu2HjXZbdyb7t3MMzq+SuEWwId0hqk
         t00INT4qYNVbaZubFuiJprTpUgpZCarwiW4gPP88sj2OE/to/SU1B+42ma9iu+OyiblG
         4JStK4KTQooH/i5Y3O45OfJk+lx1D9PW6ink5BGI8+a77try5lSMYg+7DDT7+7NCp1cF
         aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364116; x=1795968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJ/t3yJRSO/I8Krm7cGvb9xURXfceDUgpjT74EYPghA=;
        b=MfRCcW1Ffk/00pEi8hX6lNE8+0Y4UXLKtSB1lsVuUz8D5JaLUDSIZSWDiVau5ROEzN
         HquxqzP7A5tJ9xe/z76xENPu4nT9/XP3J3H8DDBlDqEpeK5h7schmf9W29syGHzXu9uE
         qOVLgBX6WNzoANtDru5XTHtXR4LEzVFfmz8QKUxOe/7Pom3Ulyq9HNTIbItMSHwM8mZc
         m9Cl6KQ4SFPsAdhDjgwmxNkFFqMTwXozxeG3lkhyFttRg0HEZKkH87EZRBwsCO+Rzj7p
         ZxasJ4zllID+Ma5Ucta2g8rPAhsl26/Ie85Xx6RKCzhIMclFYoRzx2JDI5lrx7UJXEWc
         /FwA==
X-Forwarded-Encrypted: i=1; AL+hErHzhg7mb0xhNeZacJwkVc1nf8jwLeqeuY+OJWBd/w69pvwIyCsg3YUqswHC/5rjJprL/g4xgueW1/GL2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5NzRB+EeMLlmb33A/9meLZ5RefibC63yz4JFJ800U25FxRIt2
	drN0nEvHR6ghOdfTeYYmupQqIHWiv9cRbcDSl5jPD3I5Bmd0GmuJ403pplmfuE5okKCssF+n6N1
	C/kj4V1UFsI/TgoPqKGZRv3hvGMiVSU7MFwbDAeKuSfx0GPxBV17EIhYtK/ixcXcufg==
X-Gm-Gg: AZFdTZcEA7CzcEBgiwJKSn9VEIW43oO9GBHi51/SqF2KvXWi4emhTbeUVWRrmKIAv9J
	dvu2TgbnHaXTAyQNEY1M98V1n+pUPcZ2RljP6kupIYUcODczVy2+89t/AmNUREvfC4pCxMFs5HA
	Ai0RZQdcVRIlXrDc2+eiVetWttYhjgilkvFOsViGiWXLe8JqOhIJucm3bZKAhAPatiJBB6dUf9E
	3LQfQhyxoQIK9HktxZ6mnLstk12C0x4m2jyKIBBmXjEwVOVwoH3L+1tLyuEMWZARKa9U/JGvMBk
	+qDQ09iPTe94cfGbtLeyTlE/y+PC2bf96WZu53HyPnmO5M0p63RVNE9ek8V4Z+PHwaPnAUEEab4
	66IKR/dookMODFXoBgL8leXbqsvfpQ/YHO0NG1ihjF62+VxmRdSK/Y1JkrH5aYSiv
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506516485a.40.1795364115961;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
X-Received: by 2002:a05:620a:1b89:b0:945:f28f:ce92 with SMTP id af79cd13be357-949ba9b0744mr1506511485a.40.1795364115542;
        Sun, 22 Nov 2026 08:15:15 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
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
Subject: [PATCH v2 17/24] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Sun, 22 Nov 2026 16:14:30 +0000
Message-ID: <20261122161437.5994-18-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyUNDTUOZ8msi
 edw1O8dbeqjSU9rgNgCYwL7hl3blAkQT/a86fqE2FSFadQ6POZ9gbTwz/yWoeaIedZEDnAxv5ql
 0VnDwk0WW8JnUHxsz2SDU6iCoU9tPUy6HxnpzQkAxpXthQuKEMaT8znA2lfDwcBT4Bbk2dWInDn
 Vl1ynTRhOY2KWYIQXX38yTLE8zqAVn4V+WM2jEtMhoG/cq99sec1bCqZ+LuFE2lGRajuQmeBfml
 F6zj8vlTIHFHUyKNFz4ZIkOnQih3ZZqZi5oBXZ3gjIsaUtNyhOGwdRFK8ZjmK9j1d3BOoYtG893
 K1DsKx/3nZR/w9s2YA3SyEEKZXBiW7iQzEIq2QKWQOeTC33y6afHeF+itOZ8ML4UW1bJKF0lKQF
 x7jMz3wcJrCr1QVDfB3BFm59Cr0Sr0rZvbjqnKoekywhrK7QSPLe8KIAFzI0/kj+rKKKSo3H2gV
 5hqBxvzkovPnct3drEw==
X-Proofpoint-ORIG-GUID: 8knT70C-gul0E8_QGaOAnRPPhi1Y1iWX
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031514 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9VuAe/esTAjl
 zc7DCUE//zwQzfeslaovQhxGESZ9O3Kcrs7IJ6h5ehCVeGFPMSimWbYXAq1YDiaEJDTDYdchX/k
 p7WCLDnaxNNJKwxMuTt56C8uIUEoTYU=
X-Proofpoint-GUID: 8knT70C-gul0E8_QGaOAnRPPhi1Y1iWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 436d33ea568e..97d8585a287b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2084,12 +2084,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.53.0

