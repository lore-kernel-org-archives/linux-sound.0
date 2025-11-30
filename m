Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4823E325
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764495639; cv=none; b=dp40e/ssiTYr1brZPpUZkmhvFOcwLfgmJMjTfFf6H/ubWjSWIBVRuRiGaoMR7LHe1BqDxJwSw5AkxCBv4xHZBN5XGMNFbd75CfqOnWt+/NPD/0GUfe6iTvyLLV4R1pqZ4YX1LHRwP4JONi/WNZD5CDMH6cEzkxpBK4Em9Z/PFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764495639; c=relaxed/simple;
	bh=71qYYx9iftjweAunr/mwC4ZiVQAkq9eNzA9+UCd09tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPGf16qvg6OviPGs1RQh/D6O6pCcAmu2XVFd1qH3I6I0XvKl7LxFakDhJb4bscgZ7X2Syk594cEDCvPKhCA63iYNCApX/diKcXs1cXGAgYVcNnDjAdYsUorSSMWp2eGrAOoz/NNC35327yWIaH09HUsrorWggXluuDpwPrcpeqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ancLKMAn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPrM3Xg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ancLKMAn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPrM3Xg6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU4ZCkR897028
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 09:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cCY9eEkhJa7MLHEHOwqSSHSnyOf2K4oo7zMaL/Tfs=; b=ancLKMAnt0vdD1yO
	v+MJ5Pc5EAC9qjnQGCKZUQqD+brYYvyfW7O1SxUO+sPyNDlcXovkW2+JA69RV+dv
	OPnPq/IcDSR3sGz9igRZPz/kxfL+0qnZaXgqgLLc38+OsRfhbeHq4AnoS2yY6xLL
	llWvAEjVBZXFGz3peB9t9qWwiNgWraYJHP/6K3xVmdOJ9hK0I1iTpnlx9A5H2j/a
	1tiwOGYkZyJkumoafuu9Lu46RtqcoPTMJzlyjijY9I5K3fMn+PLcdLD4Q4I2z6ST
	QS84xc6pG6mws6IDRkkmJbTYMOWPc+2dPGAAkJwwRywWnHMCW+JGFAxuNeQ/MzM4
	Cdxvrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqp6pj7qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 09:40:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee41b07099so33952531cf.2
        for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 01:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764495636; x=1765100436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cCY9eEkhJa7MLHEHOwqSSHSnyOf2K4oo7zMaL/Tfs=;
        b=cPrM3Xg6OAJDJ5Ey9iczdODrKvH6ik5p+WdSaXFOwv+IwcP4zvDg3XXLREQRFA+CoO
         93cI+6PHmSCQ+1sGz4JMINO1ua/IMQ/vTLpPp1BQwhO/A8sTunY+qvH68oeRJx9Z5BZB
         pn+MDzlCGARzJs+yuyP83pwq1c7/HEyq39C6oR+VKiXQ5p/+jBf+xpqDJA8Tb173Prxs
         dTG3vKnPGvTcOqUR8Dg+GeSX6FJhsOHlDIs89QsO2R9kCYdf3N/ZjRsGCd3HYHstvUoV
         VPrqOuMgc6xSvpnak94PzxS9MPHhxXG4gQc196eHGJkW0m+zrWsA4CeXAT2wz7BYW55S
         QVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764495636; x=1765100436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5cCY9eEkhJa7MLHEHOwqSSHSnyOf2K4oo7zMaL/Tfs=;
        b=FHlRWf+NAskx/M6t01Gob/C65jnAzI+7dlBd5WPS/jRnyIcC7IIqVlyOCwO0kBJmxq
         0DxMsygdgO68Ag+l4zZXddX+XUeQx6Y2fbhNxNm1LjrMa4qip73NnHi2qaGXNJku5GHf
         aTxlXjlC5TlMZhs6qZffCaxwT3N2ViJZqKy1RIKWKoHsdSofjJ/nGugNSvk3KPTDJ5XU
         914LydGbA3mD9DTaeWMnzlxTTpAbbbrTfVUXrNJQl/S8F02FW/6nTodo/qqEoDp3SPDp
         JdUiLlM0dWbucD7q88uKupiViXxOTPjDQAe5ha12O1nTOsJaU2kgYUr20BycrXwTseSj
         +f+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIIyz092mtjC5UfrVFZn6HrG+bNQroGEim/fV8Sn1TAoEHqctJbmL+hPReLObAE94JOYPwuxgOgF+mpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgYBDzwSPKnVNAnh/PJ830TX3eazKpmsDJtyEJDM7uoXIHM2z
	/yFCVgVHndnzKem4QXNQdTef1r0MA5mS3zknIToVulTJFhUfCu5AkPYqHs9y9/8tMdiJka1lILs
	/rSE/uwkKNE0dIYrUulb8TqG/bGCByFZGjgPjcHiUExleBDZp3qIcl10dMrO6HjEt0w==
X-Gm-Gg: ASbGncu82zpPC+Qoqta72XVSgi+K54I1N8c2+M2+OZbl0oT4QUkxi4TfEyqYM5H/HNX
	XdqjCq/uSzJdpm0c4kg+fjiGvKIl5o03wFNyFAPEXzJiZ5X1Q0WHNtAX34ecsODTxT68nfcABHa
	141FxDwxb997IOZxGbM3cqT4eFyKKlOtB0SE60ln2ZJd4Ziyud5+9voingzxX9UJL4ccry4NW0X
	RSG7NluIUFhhP7fHwzrXHdX3+1iSlkd4SPY95IUkPqfDj/PqHI+k2feqAf7/inZxJRQ252hTwmS
	A6ACxWkyX3biFf/xfc7p9EfECy3fy5WUZkKRACSvZhSvRLoH0cUuYyIkEm+BY32foOx9CuhFM1Z
	LhmVm8gKLvJCA2Dht657veEZgqEbHqyGIuA==
X-Received: by 2002:ac8:7fcf:0:b0:4ee:1dd0:5a40 with SMTP id d75a77b69052e-4efbdac30aamr270523031cf.59.1764495635679;
        Sun, 30 Nov 2025 01:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB4mK9aqraUDpV9Vr481X5jKFhwQmW11TyEdvN8SijZD0eSdS30c/qQBsenHcdrIqr2FT6qQ==
X-Received: by 2002:ac8:7fcf:0:b0:4ee:1dd0:5a40 with SMTP id d75a77b69052e-4efbdac30aamr270522851cf.59.1764495635238;
        Sun, 30 Nov 2025 01:40:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b762sm906138566b.67.2025.11.30.01.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 01:40:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 10:40:23 +0100
Subject: [PATCH 1/4] ASoC: qcom: Constify APR callback response data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-asoc-apr-const-v1-1-d0833f3ed423@oss.qualcomm.com>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4542;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=71qYYx9iftjweAunr/mwC4ZiVQAkq9eNzA9+UCd09tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLBEMiGJ1Nmqt4k4gxB2UaLE5/7py1Q36a3ZDO
 r+HNYrOwzGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSwRDAAKCRDBN2bmhouD
 1+okD/46HW29ESF7881WXrPKr/Wlcs67Xztj/6UBWpwaJUXNV1K/vgkPVPgui4oOEndnwY8nWQe
 M7XLCDtQEk15EIVHNaFMgYHC/cBn0C7bgawIJ1tbuUquSSf0diMa1NZ4HFTsk0sUuozDt64f8iQ
 +TQWS1stEN4c0tXmYxgQJbFctuToHNre7UsK3gEMcLReqmShMVfSlIRFasSj1Mkps9FK7RaiQo0
 EWq7Lzc7WrOx48Xu3ViOI6TAmENcdymVzcN6WVjIJHfJncR4nNmLsYG8SoClR34l3M2UqFAoGQU
 AHg04erbO7MaySDk56SQyavrXC6RONBRKQw+tgId335J9ky8pAUkxoNK4fjz9rjtDweLioeJg3V
 R+OVqRe8/GuaSI3PC0hFXVzq2ceBcGojUMIMVytbI2LLWRIBkTtaPxZBPhBpcDzJr9zN4izBp/l
 2QS9H4BnA3HL0Pk/pv5Afwf2tPlz9D+Y79ZSAK4em27APKpdKaygCE2+WpzR25nayc2nSLCArEL
 W+WnWOUsB9EZEs7FmNYFlDKBVL9KrBceWjgo2AyLowe734SAekxwUVIjHuGkE3SGXcQBF8nOlhM
 lsBQqWW5o8+WRbRcS0wZ7OpWbt/790JjsQdUCC8R2MPAgM1dCEwp1VYyGev/2BD1L0dF020kQ0Q
 3NFN6+7x7NuzsgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: e6Dx6fqc3M48lR09tkA5J1gk22krz5mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA4MSBTYWx0ZWRfX30Sm49CP4gGq
 7hfktfZC7riMLa+/fuaqUZLwCf+HnL6xpCViT0UofR57uhcPBfbp0fN5K/NctC46uarNZVUrbho
 5VeRPx2sbNcE78s6Vjw5/UNExo6rQ+vKzjm3HWdGmmjMBw7hzVyl240dsASHXbDROIQhkqzWjwM
 pQLP1WU+/XD9mRBT+OXumY4QadWvPjhXG88tP5sawV8G5kr+T03zG8OHhdFD3Wi2R/fF8768SRS
 frXP66ewrLt50+B9I92IwoyZgalOTAUAR9uFtG3/raSUC4A9/l/qtgen0Car49cUPzSpYgMh/Ow
 IZght39umH5bqCKv28yVfT4zz9WLCCL7QGLyrhg7irM4VGmft42N3JljlvTdRowr19a/jRW/5tY
 OTOAHAYS26fjiJDDH/7W3Ygz7nUMJA==
X-Proofpoint-GUID: e6Dx6fqc3M48lR09tkA5J1gk22krz5mu
X-Authority-Analysis: v=2.4 cv=KIpXzVFo c=1 sm=1 tr=0 ts=692c1114 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBgNFb7N2acfZoSAgXgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300081

APR bus driver calls each APR client callback with pointer to the APR
response packet.  The callbacks are not suppose to modify that response
packet, so make it a pointer to const to document that expectation
explicitly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/linux/soc/qcom/apr.h  | 2 +-
 sound/soc/qcom/qdsp6/q6adm.c  | 4 ++--
 sound/soc/qcom/qdsp6/q6afe.c  | 4 ++--
 sound/soc/qcom/qdsp6/q6asm.c  | 8 ++++----
 sound/soc/qcom/qdsp6/q6core.c | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index a532d1e4b1f4..35f44cd868cb 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -155,7 +155,7 @@ struct apr_driver {
 	int	(*probe)(struct apr_device *sl);
 	void	(*remove)(struct apr_device *sl);
 	int	(*callback)(struct apr_device *a,
-			    struct apr_resp_pkt *d);
+			    const struct apr_resp_pkt *d);
 	int	(*gpr_callback)(struct gpr_resp_pkt *d, void *data, int op);
 	struct device_driver		driver;
 	const struct apr_device_id	*id_table;
diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 0b8d06ec8b26..608ca0e41539 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -186,11 +186,11 @@ static void q6adm_free_copp(struct kref *ref)
 	kfree(c);
 }
 
-static int q6adm_callback(struct apr_device *adev, struct apr_resp_pkt *data)
+static int q6adm_callback(struct apr_device *adev, const struct apr_resp_pkt *data)
 {
 	struct aprv2_ibasic_rsp_result_t *result = data->payload;
 	int port_idx, copp_idx;
-	struct apr_hdr *hdr = &data->hdr;
+	const struct apr_hdr *hdr = &data->hdr;
 	struct q6copp *copp;
 	struct q6adm *adm = dev_get_drvdata(&adev->dev);
 
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 980851a12976..4f9f9a7277df 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -958,11 +958,11 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 	return ret;
 }
 
-static int q6afe_callback(struct apr_device *adev, struct apr_resp_pkt *data)
+static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *data)
 {
 	struct q6afe *afe = dev_get_drvdata(&adev->dev);
 	struct aprv2_ibasic_rsp_result_t *res;
-	struct apr_hdr *hdr = &data->hdr;
+	const struct apr_hdr *hdr = &data->hdr;
 	struct q6afe_port *port;
 
 	if (!data->payload_size)
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index e7295b7b2461..df183b7a4019 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -599,12 +599,12 @@ int q6asm_get_hw_pointer(struct audio_client *ac, unsigned int dir)
 EXPORT_SYMBOL_GPL(q6asm_get_hw_pointer);
 
 static int32_t q6asm_stream_callback(struct apr_device *adev,
-				     struct apr_resp_pkt *data,
+				     const struct apr_resp_pkt *data,
 				     int session_id)
 {
 	struct q6asm *q6asm = dev_get_drvdata(&adev->dev);
 	struct aprv2_ibasic_rsp_result_t *result;
-	struct apr_hdr *hdr = &data->hdr;
+	const struct apr_hdr *hdr = &data->hdr;
 	struct audio_port_data *port;
 	struct audio_client *ac;
 	uint32_t client_event = 0;
@@ -744,13 +744,13 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 }
 
 static int q6asm_srvc_callback(struct apr_device *adev,
-			       struct apr_resp_pkt *data)
+			       const struct apr_resp_pkt *data)
 {
 	struct q6asm *q6asm = dev_get_drvdata(&adev->dev);
 	struct aprv2_ibasic_rsp_result_t *result;
 	struct audio_port_data *port;
 	struct audio_client *ac = NULL;
-	struct apr_hdr *hdr = &data->hdr;
+	const struct apr_hdr *hdr = &data->hdr;
 	struct q6asm *a;
 	uint32_t sid = 0;
 	uint32_t dir = 0;
diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 49cfb32cd209..51398199bff3 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -67,11 +67,11 @@ struct q6core {
 
 static struct q6core *g_core;
 
-static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
+static int q6core_callback(struct apr_device *adev, const struct apr_resp_pkt *data)
 {
 	struct q6core *core = dev_get_drvdata(&adev->dev);
 	struct aprv2_ibasic_rsp_result_t *result;
-	struct apr_hdr *hdr = &data->hdr;
+	const struct apr_hdr *hdr = &data->hdr;
 
 	result = data->payload;
 	switch (hdr->opcode) {

-- 
2.48.1

