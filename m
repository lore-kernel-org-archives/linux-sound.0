Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B2333725
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144762; cv=none; b=kXGuhzYMeyZ7na/X9gK1nbXNAW85W/qTu2nM5sVohK916lA7TG5rg1cIRJ29VeTi2RHKpmrCEK/JH3J4uvgsNm80Jf6jY0kA76wJbVuNDvYUm8vGnWk1q2yAl7hDck1KUL2z+dCJnHo4MOZLSTYfMCtb0u11W80P9Itazm+M96Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144762; c=relaxed/simple;
	bh=Degls3YyxMyfY5Nqt3ik52p7vh9Q9ulviIfWRf+xnWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDf1WT5shux8Byyv13N0NJ3E5hYLbfDmXEukRNqHLtr4MPYQmRNFAsMbgZ0KUV+m7rdm5CV4sPSXeJNhTEUZfhWHJqbyctoXM/C/RQNotE+pTaRI9V+Umpu9KvwlYR8NUfDtH8HiJ3RvmIfUeBhsRD+bXpXbwOz7xfNGpmykQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHkDi32t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTFOSR9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHkDi32t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTFOSR9y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBfJKA3990905
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 11:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsntXj2xs0vSWboav+9ejaf6M5WSMCuFplOnSmz12vc=; b=cHkDi32tgle3y2EJ
	PQTh7sMT231rVjiEmQeomTyJ/sUr0vJ0w919lEiCoxnmG4vEdCQ9sphVtwaW4KWy
	jhdj5MwaSGBBfKJzd/wfux5wYxeMU8jnBlX5BhkMj10JKMuRVaUteMJyBho8+CA7
	34qJBIVWyPFR+KAk8WflmCKykNUXWKq7L8Y3fQT5VQeI7clVqI77xFt1D5UKg6cE
	eqWL57ufxlsjZOaFivhq9vHkYX+XqTVN56FWitVYru7YO44uSBNx7GFDRrq2x34X
	EOs7cKSuNgCTnBjDPf0EboqZ6wg6NTBZwhcI1ZOpVYaVhenedQTRkKwaWq2xHPQe
	AoQxBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2daf3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 11:45:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so53214621cf.0
        for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144759; x=1766749559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsntXj2xs0vSWboav+9ejaf6M5WSMCuFplOnSmz12vc=;
        b=jTFOSR9yNKbjYBsvjHwSTV6bNmkEjEwuGQwFPTBPfsecaaHluw0rSNnkTW3ZB2E432
         NrELYhUPYtstiP0dvtXw1tesmPmS25Wgaq8p7yyZKeJS3Prc0IUtbHeXzR8nzYzkkw1g
         WWD9aNUz+N+Toz6j2pMDbkYQ9yn6PjTbqLoikAKnVoFQyEElrLS85O6P6cc3sJq0BkSV
         3SezCE0Uc4ynr3c8UFgJmswkYM3V5EabUUkwq//pdpGVMV0m4tFfWLzU2KBJrArPsoFs
         WgX3DtSxb8Wp0Ni45dvod5reHwMTi38mvWv0JsRFeqWEC+u5xyq44LGrMuk8HAlc3rlF
         naPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144759; x=1766749559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GsntXj2xs0vSWboav+9ejaf6M5WSMCuFplOnSmz12vc=;
        b=XV5fx21gy+UzG0O2OwLYp33me7ox92JfFAcwXZyLOJiB3S1/NqV2Z6UlgnZBemK4hd
         TQNsoKvYQElJm111R0PtwWG6kpUP4Vp5zkfHd1K525oaPOBXXE2toUxKy7/tNqMUquAi
         lTJVQ7vzZL1r0fKCXlAYow9tKGkaADTNHMkoItDE4kIjIJTxq4lna8k7tpIBKuQBSJ0z
         tQHTiNPHyRin0OcNNI8xssb/exAm4vD3eSenV75ImoicXAluWuM/iqEHUL5DjuK02HD1
         JZOagj1IbHC6a1tKUNw494KrgCNa30BMWTpTJPpFfwuoruSLC6JRQht6DptrIX5AdmcB
         HLSA==
X-Gm-Message-State: AOJu0YzJdYpHyLDMUug/NH1CSzZm/JEJDdTXIqHONNVhJQhSeISrXv8p
	ipy6/JvPipMhVaJoDo4gsRAq2pmgFAXZBXto6WTzXlBcUSYH/B3mONbfOyN94Ipkx8bx/C7nmgR
	f6AVzBUkxbhJEDz8bgjFHMvNe4vO1ByYnxEr4Q5WXPrU+zownTJAxRSwExuBIyoKf1g==
X-Gm-Gg: AY/fxX7zEG6k2C5F9f+B4WZehAkMkmcTbB/QUDQ6SGevahD+EaTCRQmwyXCtYgpk7ik
	QKr8bH2wMjsttfAixz4vTDPbpoq2YMvO8wZeCPRLVrYQjROUDl0iFb8XAQmZXmPg8/ufBtrhr+g
	GdWIFAlcxSPPZy04QGGifdqpntLl+aDlk9K8reEL/ZRPOTMfZREXCQDgBX7mTWLNL7kdVS26BDF
	POrqT5e4lCRHMxg6zaLG0m4JTnUWZjoB/QbBRLE/s12x+ehkRiI9cay0HH2WYxUtDmkT88HHAez
	S6fuy1dO018pmPEoTh84Qkgahq0q4pfyHWW9yk9hXstFm/dNvd1Je+pmKnyPtqyU1UrQ58I9hZ9
	NmyfltdzC+nOKBnhQTmnh/mvMvMIWKhMj2jSJQpZB4O2mdEgz8P0mzkn8rt8VUogLd+hV
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr32426101cf.36.1766144759403;
        Fri, 19 Dec 2025 03:45:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmjQSEZmBvOVjyOK0uOW28Pz8FDz6PH8SP4Yl2gDZFbu33MXEK0ukDwGFNSYkrW/XA/r6oew==
X-Received: by 2002:a05:622a:540c:b0:4ed:1948:a8af with SMTP id d75a77b69052e-4f4abd0dcc0mr32425861cf.36.1766144759035;
        Fri, 19 Dec 2025 03:45:59 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm1974465a12.25.2025.12.19.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:45:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:46 +0100
Subject: [PATCH v2 3/5] ASoC: qcom: topology: Constify pointed DAPM widget
 structs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-b4-container-of-const-asoc-qcom-v2-3-05fd2ecc06fe@oss.qualcomm.com>
References: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
In-Reply-To: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3537;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Degls3YyxMyfY5Nqt3ik52p7vh9Q9ulviIfWRf+xnWg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRTrt/kPDT4bOMogqhALmeXi5csaLRHkvUOOx0
 ghQzeFut/mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU67QAKCRDBN2bmhouD
 1xzfD/97MowV2KcXIPb0DC2OArh1iphmizBgoM6FOVqXqMZnKf4redDsc4AwMRhKE1BaIlQkiYp
 OkS/qhbac7ju7izGZyeRWBN0BamdEvC10DUGfvygklFiaNWJxTSiOgE5bY7y1cLjDIqpu2q8f2J
 eqg4toV3LPbQSCiYmbU5ekrMhouBOwap51sXFs5mbE8gogcenKckDdqDf943eUPAHayeRI/4ZOw
 jA3zDjo43jZ1F3+cwShU5++/nCoQd5LEiN+CzuQ3/xG7HPsDE9lLxgdxxh872I+E90MdWWKWyxA
 k+MsEFY9jFTZKYCZhge0o7q8CzVC0AYP3c05DBJDsIs+AypiThOHh5TIgJq3xxpjh5vDtnMkrL0
 5KhCpQ4dNKzeUSZQ0SQ5SgEDkYmLuJU5oEYzObqsdkLOrHqB9xuqnrRio0yfmwfu2wBNiK8b3Y3
 oDRDjaPzuRISGwGNTnN1EFGbvr3ZLkslvMT2xF6dAu/eI7iZLLsP1dxfj77r+qEXEfWvUEFpAig
 NWq3tLh5UlQkUz+i++KdnBJnmgJ5YOKcYs3iQGSSL2yQG4o9d/hLGbWQsHcO4IxpDXIJ2TRrCMG
 pZPFYB953xn4dhD8LvWUraypzr0uVt3/cZyltSYZioznSOXM7KTiCEB4y+TOYe6PcTLLp9sbmUY
 2ZHkQwa4nlm89Pg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69453af7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p4u2xNunYncVunGlIlIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NyBTYWx0ZWRfXz0GqV/2DwZ7E
 8igNyYlyJcrcWDszPpaSmj56zsCD0zNCvyglFLEUeh6444sVTkWerQub01qC0pQSZ3GARPeln42
 dfGWMY8jsBsuuWFXPbOzGj+lsiuRdYzmCZI/ZKAZb2uiRnnSLfibakZpkKpwUnkX7tJOw6/OaFM
 9W2mG0NWi9e24EGYbybDxDiGfSrdHG+2lMLvGK39lTu7AXFZpndhqkDfUjZC1fGkVgogwTwQgAP
 ubnN2pRmxlfUqJGpH1CraRWRKB68dB96axTKwuNNsHsT4Uf1+K5uYPt0rC4HZ2JosSHW1U2WhzZ
 LqmR98407fEkTiKCDrCKJgqPnD/6ML2olgh7zveY06dzWD8Jt/c6eeHYyyaVIgoedLxwWp6bkk2
 OGPQyogH6AOD/YyPl2kE44fHRe6jEmhcfOVgeMuZ+LInkY+oWwq6CxwoNgWc4oWVAZ0OSnHZXgr
 IxY1m+TN01OdSJU1TcQ==
X-Proofpoint-GUID: Zd9wrQvAK5i-VZJIaJgr5gTPAURQOWta
X-Proofpoint-ORIG-GUID: Zd9wrQvAK5i-VZJIaJgr5gTPAURQOWta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190097

Few functions do not modify the pointed 'struct struct
snd_soc_dapm_widget', so the pointers can be made as pointers to const
for self-explanatory code (pointed memory is not modified by the
function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 9bde799146fa..fbba543bd976 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -947,7 +947,7 @@ static int audioreach_widget_ready(struct snd_soc_component *component,
 static int audioreach_widget_unload(struct snd_soc_component *scomp,
 				    struct snd_soc_dobj *dobj)
 {
-	struct snd_soc_dapm_widget *w = container_of(dobj, struct snd_soc_dapm_widget, dobj);
+	const struct snd_soc_dapm_widget *w = container_of(dobj, struct snd_soc_dapm_widget, dobj);
 	struct q6apm *apm = dev_get_drvdata(scomp->dev);
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
@@ -1144,10 +1144,10 @@ static int audioreach_get_audio_mixer(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
-	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
+	const struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
-	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
-	struct snd_ar_control *scontrol = mc->dobj.private;
+	const struct snd_ar_control *dapm_scontrol = dw->dobj.private;
+	const struct snd_ar_control *scontrol = mc->dobj.private;
 	struct q6apm *data = dev_get_drvdata(c->dev);
 	bool connected;
 
@@ -1167,8 +1167,8 @@ static int audioreach_put_audio_mixer(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
-	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
-	struct snd_ar_control *scontrol = mc->dobj.private;
+	const struct snd_ar_control *dapm_scontrol = dw->dobj.private;
+	const struct snd_ar_control *scontrol = mc->dobj.private;
 	struct q6apm *data = dev_get_drvdata(c->dev);
 
 	if (ucontrol->value.integer.value[0]) {
@@ -1206,14 +1206,14 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
-				       struct snd_soc_tplg_ctl_hdr *hdr)
+				       const struct snd_soc_tplg_ctl_hdr *hdr)
 {
-	struct snd_soc_tplg_vendor_value_elem *c_elem;
-	struct snd_soc_tplg_vendor_array *c_array;
-	struct snd_soc_tplg_mixer_control *mc;
+	const struct snd_soc_tplg_vendor_value_elem *c_elem;
+	const struct snd_soc_tplg_vendor_array *c_array;
+	const struct snd_soc_tplg_mixer_control *mc;
 	int tkn_count = 0;
 
-	mc = container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
+	mc = container_of_const(hdr, struct snd_soc_tplg_mixer_control, hdr);
 	c_array = (struct snd_soc_tplg_vendor_array *)mc->priv.data;
 
 	c_elem = c_array->value;

-- 
2.51.0

