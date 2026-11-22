Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364116;
	b=ZtAi9m92shTsS7iBNRlUZxVX8rMDa7bfXLYWHhCaycUQlzO2FXd1JlBnbjMZI/CTtjqW
	 7VQxmouH8Wm5dxWQ79njQzhBEX2RFOSJHrDn4pfePil5jCLAry+8m3AZWGhmPuLnHRqeJ
	 nWKhioks6bYplkA8Fc70nyzgL7W+X3yN2oMqwTtgzVSYnf1aAv9K1KAYW89WzyhV+fRv+
	 04iZBmYzjEJo/ttySGVd1uSLzNjow5LOrZPbEWvd20VsX7IaX/z5pkirQoeMQGhK7vykd
	 4suVveWecv7FxRQyaiMuSoKDrmaKNP0UZ7Q+jUjSOZoufhAeyW1AnCFtQjBrEvw42nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
	b=4nmbHpbfeiEZBXfjIcOvXGyJZdgt2YW+RnXqJMwxzmMbrpvCHy1CicNxfMdQaRpzgWcq
	 /X3elHfqr+A2V8naVrUTc264lUFVCIgdzVPM7/6QuLioCmuoHb3H85Np12AboStYHrN8P
	 VIJ1srOzWBt7rHCwaZgoNwRTZJLB5q9neVzpL6Go2Igox5vBMCaGf1X+5NdxRV5e3evZY
	 f2AskgAEj8dmCJPCbxelNEwSPl7lhXm8Q4D4zcCO72vY4ZeTans9j1CNazVsutWbh6itu
	 Q+BPR5Zx6CtKvqxxlFKEm3vqdIIwvVl1GfAkJexh45OL7XQ3MepxfRbntmFo+coFqbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E45606C578
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E45606C578
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lD2kb50o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAUmqffo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFR72q280794
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xe9mNmGNVrg
	K7uWOt7PejiC56UqOuv9iVTxY26r7kf8=; b=lD2kb50o/CmUvZAkZUGmaOPR3zo
	ugh1ulOK+h8IWxdZXdl0ashI6+BSpcTNTwSWI7feOjbpnoP91r1f/o+wsi+CM7mn
	tPDKbNW1DhhAS72Eef6FaXlBgVvLep+oKtABMlfYXQI4WwQPmB4EmryCr5eEtgQD
	zBcsKE347dusT/KJx8ljOHmTL39ZvHMLA3p4Raupu7WkDBUDlCvEQXlEVGNoYk7m
	tSGoiaCprWWD6oQzm48yNbULcM+8p/XUW2bpqnmkWeL7fjVCkiFgqho4mOpyKqPC
	zc//MgbCt8Oc6prp+p9hCaeL71YKZlVIldTRI5N2Wnl0xLaTl3InBqrNDDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92125ff2d08so48568206d6.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364115; x=1795968915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=PAUmqffozjd6kpMEtcqqtil4WserDjEBG4hsfIbq7RQN8wPEvs2dgCeBZoCQiSoP5U
         KaVw9jlPN6HxMmMVO17AbTxSpb4+mES2gl7pdAA6EzogZhKhJLxHmpLpWcWcoaMmVA2I
         nRulq6tNJoda0RuENDR1HWj7ABkWdHOJprqxXvGtdMYduJrk6livbs+G3GbjOSY8xPE2
         +zux9KallTW8izr9H0wC4zM1Id1AYjgPjfKl0EEFjlMDLNAQSIF+SiSQgKfJ3mZRMtL8
         CUMWuZ/CLRk9UcSE5NuoKw2A6QSVdvua+8zRmwdDAtrLJspvN1LlZaeCajEUtPqj5acn
         3Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364115; x=1795968915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe9mNmGNVrgK7uWOt7PejiC56UqOuv9iVTxY26r7kf8=;
        b=buIqmYk3DTkruyfjvl5NnlivMqhj4CJgH0FEeK7rcjVIZFvELQ/JSWfZp0l0oVAidN
         +5gDYBEZCU1DQEpnoLweGOnO02kI8YckCqiTaHyGLkV92lKR58ni7QoSGiCEyk0V6r1n
         6wSxISQIQ5zWA7YftZwG7ewnadAcS/il7+5jLUgiW+ZSyfz+kHjTb4TpCB8LxskKFAdH
         GPQA+fHoQ4rGzKxv4AVYe12Z57sGksytfhVUk55Nx9h1fNFFRQ6e64s7M4UCImcn0u5L
         kJy5lBPPXE/OzPyQ81gW1pU3jitG+JFV0om9uTWgYtR6keDK/Zu89bGSMn7pvYeF01Nk
         QuJg==
X-Forwarded-Encrypted: i=1; AL+hErHavgHjsDcMHS97u+Wjxu61MECmC4+KsXtcN7pOwWX0lKoDbDXHVMzqdtYo7mz+l5UWM8MQTrwdB/Praw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xeeqbblNUaDvN6iAk4Fwf0JkY4zwaYJykdeIL+tabFJBkdHXu
	SEijqjTWpBQqDIJN0X8N6uRIf+ofJYeeLBpDsZi7JCvP+7V7hZgACZoLlQCNcNfRtG2a3nbGbdw
	kRjgQJlgqQ9tbGR08ZfunPfBpZvRqXF2u85jOzvQpIg3pupLWhOM+vdMVQYPKRgjFHw==
X-Gm-Gg: AZFdTZcpbSHvKmeRyrYNPhZj8oFsW1+k4lYoia9xRwemePY/l/AWSVRXa/UbuapKDkp
	zl7ZVqhXrgKmT9Gg0VHr5O7PeNxPfXiy9/OFOtVZCUoWTfWNzUEucnKsovgQugV9IKvTA79Zu4P
	SGSZQlHlzkRh11hTficFCRYsVPqdDZPpAM3AAAy/Hi/MisfZqIerjIi0X7Qj8GC47o/9qWbNbHM
	ZihUdfTp7bC2TpBtokVq2oAvo7nb/84aiTtnSp5ZfCDi7CrH7oyfK7eoxawhWWrr7gJoouC+42m
	CMbOJ3Kvw9X8boHKmN+9xX+hbGEzsyCiq/jmRnXjepqUZFkZNmgJ9W3hUGfEjaOdsuK55YO4+Ga
	IDWdb9OIYkV5DiH/pNP7mBlCkKX61PdXK3canuoWs4dD7QesaeYaxkWuXgA484fK1
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619399885a.28.1795364114580;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr1619396085a.28.1795364114124;
        Sun, 22 Nov 2026 08:15:14 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:13 -0800 (PST)
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
Subject: [PATCH v2 16/24] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Sun, 22 Nov 2026 16:14:29 +0000
Message-ID: <20261122161437.5994-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: _XoPu9rKFtf8QdlDd9XwbkpO9cL6NYMg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3UC0se4cz1cq
 ougyQFwJL8MK2tIVU1A2XWnLpMdONvm90nCwnJSBcLNcBcc1dzu3iT7uRptB3WDML4W5FitpER3
 +IlhDBhpwkT0ZomDO/Qv5VentRsp6k8=
X-Proofpoint-ORIG-GUID: _XoPu9rKFtf8QdlDd9XwbkpO9cL6NYMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwphmffFhGq6f
 keUy/8Ct4qBkgBa/creHx6GzXkWS9yKq852we15rd22QgTiDNVB5PH4zGT0ea3J+gZDwjRHGLtM
 bmBsD9ty8EEsTmJSCT+0A7VhA4B7/h+PlDZ/d7mbgwFQC49Iv1GmTJVp6n4cuIXMoDGRr3vTTIR
 PZ3msUxIEpk2DZGRun2yw3mhdZQnIKNJ5Ya8Hgv3a8PIqfMRFiFvf+dRjDT1YQI+V1tUcfPWTpR
 6MhyMpVqsSVAn7x9l5iF1Mh4zq6DR3bmj7IsZnAylEcpkiS/0cIG96Qo7p9U7NcDuwbAqhPfWLI
 3FdpySV4E+BrfD+jmNZ3vMipOK1n3z9ZfRAgw8XnDgnqvKCHRr51zSlulvYnwZrgzgvcE2tcDwR
 qvzm8BAJ6NtJKA5XEYYa+cQcVIMyVaL8bZnF2A3CziUUTP5kcvhNX4qsYYrL3r5Iv3M6SebAsIJ
 62kY5vOOtUM9ihbGqsw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b031513 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=U_FWf4IRJOzsE_kR7ycA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 75 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 7ab8e11ca5c2..db62dc7f9c8a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -57,6 +57,8 @@ enum ar_event_types {
  */
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
+#define SND_SOC_AR_TPLG_SP_OP_MODE_CTL		258
+#define SND_SOC_AR_TPLG_SP_R0T0_CTL		259
 
 /*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5dd7f2c51d5c..c07a27bdd3a2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1465,6 +1465,68 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int audioreach_get_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = audioreach_get_sp_operation_mode();
+
+	return 0;
+}
+
+/*
+ * "Speaker Protection Operation Mode" is read-only status.  Enter
+ * Calibration via the "Speaker Protection Calibrate" trigger instead,
+ * so a stale alsactl state file cannot flip the DSP into Calibration
+ * and nothing can leave the system stuck there.
+ */
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	return -EACCES;
+}
+
+/* One R0/T0 pair per speaker, written as a whole set */
+#define AR_SP_R0T0_CTL_COUNT	(MAX_SP_VI_SPEAKERS * 2)
+
+static int audioreach_info_sp_r0t0(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = AR_SP_R0T0_CTL_COUNT;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_r0t0(ucontrol->value.integer.value,
+				  AR_SP_R0T0_CTL_COUNT);
+
+	return 0;
+}
+
+static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *scomp = snd_kcontrol_chip(kcontrol);
+	long cur[AR_SP_R0T0_CTL_COUNT];
+	int ret;
+
+	audioreach_get_sp_vi_r0t0(cur, AR_SP_R0T0_CTL_COUNT);
+	if (!memcmp(cur, ucontrol->value.integer.value, sizeof(cur)))
+		return 0;
+
+	ret = audioreach_set_sp_vi_r0t0(scomp->dev, ucontrol->value.integer.value,
+					AR_SP_R0T0_CTL_COUNT);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
@@ -1505,6 +1567,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1524,6 +1587,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
 		break;
+	case SND_SOC_AR_TPLG_SP_R0T0_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	case SND_SOC_AR_TPLG_SP_OP_MODE_CTL:
+		se = (struct soc_enum *)kc->private_value;
+		dobj = &se->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -1550,6 +1621,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
 	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_SP_OP_MODE_CTL, audioreach_get_sp_op_mode,
+		audioreach_put_sp_op_mode, snd_soc_info_enum_double},
+	{SND_SOC_AR_TPLG_SP_R0T0_CTL, audioreach_get_sp_r0t0,
+		audioreach_put_sp_r0t0, audioreach_info_sp_r0t0},
 };
 
 static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
-- 
2.53.0

