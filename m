Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6701930FC16
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424971; cv=none; b=N9C7acPj9WBJ10o1YX9GM0bTuetPGgO9AyXuZq85ihrHpOOVtjXtrb8DBVz6IjAhlwpAwG7FVfS4Y0f8h6PD0xNgBQ9R+RJCOLQGeRR5lHTQ8YeLp/4f1wHBfsLvmxYRYKHZWfz+sxXgjAK+tRTKe4u8u8dm95Az8rKrg+NgYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424971; c=relaxed/simple;
	bh=+iLHjHQTVG2OHhst/G5TPG9xLkVHknKVmtTUh2+jk7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koYhreh9rveEg4zZzdd9PV5Ew1CLx1EuQBRcuomrAjeNomisFUj+Yi6238yZO+R44f+YvTuo/4qkQNv52dNm516Q+WxO0lgCaDT1H5Sxy9J13pEoPiFsPTlXKma/vwzUZV0zrsq4LXvxDz7sHAtZlyd+M5I0Qe4SPz2QobDJsvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhmr9Ocq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiF6LmTA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhmr9Ocq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiF6LmTA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT1oJ0i1929010
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9TUauSfE+BDA3yQ1ZnIIquvI0/o5pt0Z5i1/L96zdw=; b=mhmr9OcqPkWlUmWQ
	I9aW+YiHT5LfLJoW2NouwE9djWjZa3Rm3HPulJWISLYxS2FnZ16+4HftgFkDWmHR
	tCsSzhDX5Jy1xFQnRbN8QK3OU2f4QlybB0YnRyIvqqmr4NAB5GrL4Or6uHYa1bFn
	1qxMUpOW6wA9bPe7G0nd2wMEyuw2QTnEQvXfYfGgwHA85n4f2cgu5DEUPRSU5RdK
	KmKpVg6bKbz95zPVkoXQRTBtxeLkrUmkVknzF9S/NBTt22kTxGc8n+Ww1HTTW+QF
	8YInvXxOUCxWbbpJdz45PDxqYVtSl066n8as/83Iu1e8J0yx9jpAe+qMkdOsObX+
	gP4dWQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqp6ph06e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b188806faso1237063e0c.2
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424968; x=1765029768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9TUauSfE+BDA3yQ1ZnIIquvI0/o5pt0Z5i1/L96zdw=;
        b=BiF6LmTAnhY+PkDytMDshVDEMuitwOlJh66CRoAmDQJFQy0zUb7pEn3s+xBxGQEPrh
         nDgdPgE/TmnUDWAa0bGzp35g5DeWzrz5X2/EXnOVYuXag2lyvsAUu2kdWrrz8lrVc+RY
         bSYaf8yFNrYVhk98aA9vdIDSJ59JAG1sHKt9IhFBYMfxntS2m5flYR2K85eRUfEF40Ev
         scut+IhpDDBYTevJevJY+qZew1j4JB4HBku7qrwoxwkqQV//b5CC1pKcJFoGHJImIY0U
         VuyKuUaWSTvJ+jdt2mqKQJ0RNj8Q4BNqmSx2iMvN/UFXDxblOA5m/w4MfosZkOJYeAvu
         P/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424968; x=1765029768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d9TUauSfE+BDA3yQ1ZnIIquvI0/o5pt0Z5i1/L96zdw=;
        b=lp94UDEOhijWmootLQmLeijPVWq2U7v5B1bfsmov0AYa3CwEPGGxtZR/GLipvtLUL9
         ovVBsqM1A3mv1l9rK8lCTRFxw5BHnLoZk0mCxkSz0LacpZwRDh+lKAaktWByDYjCDx9i
         F5ypz9w2INmSyw7IFr9cqgO53hTFGeLSXjr4mE+ACw2eCGgvCd1P/M94vm7EJ+keWlMK
         vJp45ZiO1xS+yZj6I70pSVEEMWMCdgl32/OWzW7Cbg6ZJvAeMJUmB6P5h9Nh85g28lwA
         ILr/Kef3qdI6navoPHczxn2ZHkVGcahW+SvPV86T4dlLMP2YT6FLKYttv+QZNmvxoLOb
         xttw==
X-Gm-Message-State: AOJu0YyDwVOwQ4RSR1rFA4AtrzaIEUygra/TjKJ1IdGbrt55GCcJLGoM
	SpAx7vtLBKa5U88nguCVxBbbqj+SkyLEt5trWiaHn11Q2ZPFvhFVJpovG20yEGVORIDbMk8oL94
	kiuGiNgbG+eBu7/cSLgk5DyuPRkXKNbXKa7WE3tJRPnx+gov8kybLSmT3UbBc3n8kct8oyGhYYw
	==
X-Gm-Gg: ASbGncuNfrw2+eDvT7XO2ngmFT7XoAZ6CHqYGT8h0smJSxSfO3ypYZFWA6m3IFkzGp2
	+4tgz3MnIXV6ke7NABTYPng2uVixFfrgUYRV6Tqq1uzlEmIeNJbmyWceCJeXZGcMdBk+UAoZfyA
	wdPXA2zgS2rnTHszeePiBaPbMKL7Aury3bLNjurRoYKGcQcZS7caci4kUHDSwoD3def3GyRDCrG
	yaq/cDBHt5Vprpk911O53bL8KclWTnxJW0tWhxlKMjUHLx+gdQ7r34fxc/B8uMTboqbsVvkowoi
	CWF5lWtraTgBxtyuY370A+f5V9O/VqiCnxyPUBr+k3I/XV/+AUg+eLzkYytgs/SHn/1BPxpuNXy
	PEQBzMckhOsKxUDB2l0l0UmDY1tA5p6otmg==
X-Received: by 2002:a05:6122:660a:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-55b8efff034mr11931514e0c.16.1764424967258;
        Sat, 29 Nov 2025 06:02:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/+rd8LU3yrULl6C1sddPFZUT/Z4RMrXEJpzXlKo+59MeEJ9akiHD8aNXFDZ8rNQnGnnPTg==
X-Received: by 2002:a05:6122:660a:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-55b8efff034mr11931406e0c.16.1764424966661;
        Sat, 29 Nov 2025 06:02:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:34 +0100
Subject: [PATCH 4/6] ASoC: qcom: topology: Constify pointed DAPM widget
 structs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-4-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3456;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+iLHjHQTVG2OHhst/G5TPG9xLkVHknKVmtTUh2+jk7w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz8G6l6zvGWOyuBEr91udwVM26vpsSxAWySv
 T+R7RdaBuaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8/AAKCRDBN2bmhouD
 19tJD/4g9FSnPGuog3x6JWd08Ifl5r6zvP9C18FRQz/hoxNttZBoDbITbubDp+zJdgRsqEzr5eM
 TNouP1TPoueluOTr0KCe2s3qFkBZquNq4UvSVKCxeEeyj+6mfKvXBVmpYsiq92RBBVcorcdZaGL
 R1fTnAMx1OpZms9bf1dr41Of94HYxZjOQ7aFWqlMv9Ri5Sbu17iNbCqO3iiJ6uuT/d/zv7iar71
 0gvvyk0awfGUS4i4C57THucmzcXEwGzpsaD6X3LgB6/uTDEehtr6rkaMQlmx+obRHCi4jfxW4zD
 v8JOZqmcFzBPemiuX5dGkHkwfuzUgdRCbbUTh8ogL/Of9CYogbKvOHJ5bmt5kdI8bDlKr4POyZq
 yTGyRHpvGt1RsJaRd1YSc1OyRnCYN/hGb5PINqvvlbTTfdN+Pt5Rbih7HWlJAQoqQWKedbefMBX
 jNbGVN+f/+ECi5ylyDgV8uurhXSfL5znGhwVFAcKla5HCU9yAy+4hbMT/5TWRt83rAZFK3sbpPE
 yseitaZWASc7iHpTQObHRpklGPvF2gZMNgxkF05qXA6s5VuNpqQs0Jp25lht3pS89TIViZJVWsc
 WEkIJTnyCazlL6fIismdep8NXjBq6Eu9E3Z0F4XWwjuMaeJwZsAqL93DRDzVMd3DrZ7b2SZRaiL
 xTa7L8I8lt+ePqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: nid78Ftr73dMy1vVf93A6PpyZoMQsUYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfXyn3QTbKELuoC
 cPzh4BGABgnzvACnqlNQz27+nDLcEV7I3HK9avmmyFSeHXDJuc15rgo97d8ruF8H+WD8slw67PA
 vNMC61huXUEro1TRr7Dx/TkqqEpk4ojlFym7RpUOPrcxyxPqEbmmVCsgNvjgb+yyxZgkWo4TK2L
 V1gESuHRBizVH+tDujkLqShBTJrX9QRAh90peP3usrdjtx3kqwBVpE6ZB8ynngx8HU1R41R3yGd
 xpk6w/AByKJtQBGusBC1m7sIN5XGQf10IMgHTrFE2MpUgT3WPpDn+LEzJlpigcDFrNoWb+qZx0R
 pUwUaU5fvybumWjncu9wCtsbuyk0ZcuxnJ+iKyawUyEvGiGbwSJMm5foX4T0ky0qNojNx6JrfMH
 8o6zeuyxDGXf3CdHJjduPfdt3C+orw==
X-Proofpoint-GUID: nid78Ftr73dMy1vVf93A6PpyZoMQsUYJ
X-Authority-Analysis: v=2.4 cv=KIpXzVFo c=1 sm=1 tr=0 ts=692afd08 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p4u2xNunYncVunGlIlIA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290113

Few functions do not modify the pointed 'struct struct
snd_soc_dapm_widget', so the pointers can be made as pointers to const
for self-explanatory code (pointed memory is not modified by the
function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 67d3147caf62..fdf144461cfb 100644
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
@@ -1204,14 +1204,14 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 }
 
 static int audioreach_control_load_mix(struct snd_ar_control *scontrol,
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
2.48.1

