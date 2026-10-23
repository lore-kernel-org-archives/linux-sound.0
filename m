Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775618;
	b=28qgR75LBBQyx+SjpkPWz8BJNL9BSY37FGIR8/dJ0rfgKtohJ84QB+zkJqYr05TFrh1Q
	 SaWmEjiO28jQYKBxtg9K/k4fPD4VHut6UT5Q8qWNsLLnLLuyphLSwWbc3GyBnjkWNBafs
	 4PP3/DzMeyQxVHYbwsW6I00mtCnt7wn7xf7GrxEDZjsF17dhJqTDbiOkt9pW5QCd4om9D
	 uopaumo5TO6YUYVM9xuYP6s0RX8KOBBUpbaZ0P9qNWUHJu1yYnas3KUnJI3is5JOES/4O
	 hV+fZI69igZKawV9/MwtjprDODJthMuB8a7X1gBUsoSm0m2F5J9pfCpta/dRy/TatMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
	b=eLLswQZapPaOvDhQfmwqAAQGcxEgPJi3A2TOLvvnUm9rps1lpCOiP2+uRik80oE9PNUF
	 AKi5l61oHB1I4IGcskiZIbELXNOB3QqDTus7LrNbk1NOMCybiUvl3Wu7Op4amhzR2bqTi
	 7gKTOqUbeBo3/kXNO96wBiWsEvdES8qQLfbsOkVtJIPJwZ3pGget18gPpUR/7OcijiyrY
	 kG5Jgatd5QTeME72pxVuN93bGOa2Ms/msYH3JwRZS4smhhPk66Yt80HDTO9dBMy3gtHga
	 m78EYA6WdanBy5nk2WKU3fdyNAJb6f+2po9ENkJWEfCn4NuZc31XN3cNS1LQSMsG48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lh1J3H32;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVJhbyZX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA9606A320
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DAA9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lh1J3H32;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVJhbyZX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6CBo2215802
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=azg3XSvMykp
	TDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=; b=lh1J3H3233uDUfWpmdbmM52osDB
	lgKjpeS2cteLoji4ZRksboUTQKKycMhktVCqRUkY74qQ8pVWeUrB7FVfKxLyvIUI
	Hk2mt/QgnOj6wjliwkUi0mb8kNFHJd/EN85aYyFZLz0gQwOloJXdvS3xYX5vRSf1
	pO+NTh78aNXjkjQ3oHILKZIb8uhvwLOqcH8hR1dtLM7zH5rG7tQG601QgwovAu0t
	+AH6MlgjbmhsKvvbXr6UcOrRvKNrr/0vKUoxw9aql00U5T7h27i+7Jv7lQ8hxzIu
	2Unk/a/bxaPflh7gBsBr+P4PRdPEOYxdf+u8tUBNpP/V1YrABBo7+54vkxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc88j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so150887685a.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775612; x=1793380412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
        b=YVJhbyZXoLA1coUNuoHKBti8dh3bsGg1rxa2kSnkljc6VWA9A1CiNLsnQZQ5mBZ6co
         2hm0K0bQXkvWHtpj6O4l3IZVNuj4IzLYcpbbsHonajgh/fTUqs7JSCcNfcBcl+LQvgDq
         tfw35qVZUgW/OKRcvKvteyJFkJPJDAX3AYowmTB1K0WvK7f1PVgKqTaVbqNsltJSvQ+I
         lfPKyyCXKDRRUc5nSnyyZRNVFZ37CPjbX5uLntrFKYRKjkpr6YjEmr6i6u/r7EhPflTc
         Yjv/pgxVaI2b1uzPZ9ts2LSDZxpAi5q3MCVN90SloIX8ShC0X3H+yVOOIu3I1qn+JnxE
         FUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775612; x=1793380412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azg3XSvMykpTDhpzyYQMK0xeWLWeWs6SeZBLuvOTxGc=;
        b=BfmFD7QX51xjc4c9tV8vJlnMtGso9R9apMNd/fWHvoAuUgZtLHLfeDNPBukY6LwbNJ
         UHle5SOzHtkRV6uTGmL28R8HV2vAkfAk4U7c+dAIsvx4gI97aiymBJl1CVL1xP0iPta3
         9NxDYjYmGofA2q/d9+92zsqazPqs2K6FRv70a/9iGnufvCycBwY2+rhgA6j3yyB1ZkBZ
         25lGu6eGJk3ElcllXO4DH4i4xzh6FPQPd9dfAMHTpuwhxhq8uYHDMVbpPCF+gZe7i+vN
         yZIR2TPLakbkVogizih6OIEWOMqqpHLSqaMoiA67w7oQ7+EL+xR6csYU2dMl20jQmzKf
         vK3g==
X-Forwarded-Encrypted: i=1; AKwUvBwBQSK7gekga19aHbtyC3b91NWrzabewowYruHRSq3fiQKg9L6TzRy5xat6wmDzq1EjWafgDqYqiWsykg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLo+MArZk1nFveVeRSLLeI6/UpauP5NkPCj/t9ZD1x3rY38sx5h
	uCg69YUe86MEeyeLcugAkxap5a7b33DDGPY9cIoh4b8Zd2V/arCc2y5FS9+BZO8oGSyx/6QEdzQ
	f+aPd1oNKlI5cvXYpA6u3ARNhpPb3PME4HMchRdt3vP2grNcW2Qj4c+OSee3R/rYAQw==
X-Gm-Gg: AYBFou2RHKqD62mFQ/lhISl7Loy1yZGTAy283FiHXLDJ0L6MzPsBFCUQ14JNjvHfy5m
	lt/i6vvxpk3BsWJBMGolCrRRizQrgeePCYiw8vEl5SlTTzWYqKcLp0Q/Ko8B2KpEb/NneoUcX5s
	LhdAaFGCdOcVx2zkYtVKiFUxvpiNcoWXWY+ytkgFInMBER57+iQ9mQe/4cqk68iUZnKxvNas8GQ
	ui8XzFhiKIs4O5u/zfis9gjwMvjR8FyoYakckjhZZSzujYPYphIc/chhMPMqBOVDbRikAd4b20w
	lXuFUUHJDPjmL2S94ujFVJktsFln/AxyWOjKQB7H4WTTgoIk874KoXvW9lFcMevicJP68+wYqcx
	sWEoGZ0/SLebV
X-Received: by 2002:a05:620a:6011:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f6f9e0c43mr534099085a.64.1792775612070;
        Fri, 23 Oct 2026 10:13:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f6f9e0c43mr534095485a.64.1792775611626;
        Fri, 23 Oct 2026 10:13:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] ASoC: qcom: audioreach: fix module cfg blob size handling
Date: Fri, 23 Oct 2026 18:13:10 +0100
Message-ID: <20261023171316.819857-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzlJMqDIgD/uG
 SUPCtPnSKt+0dbzypswSCAy1srtQYO+0UCnETCL+lOQYk+WnJw4wLQrnxr59WIP0jARfhmP3Z4b
 xtwn7jDTxu+vuHGCDB8bQ1PbWEDyX3HE1+9NI3OGD6UHdQWSpTGI0lsPS/7yujBnqK+fp73vNnw
 mmG1Vt6DYldXXUx0QNHMjiggNLpO5BO/j3cgS50h8fyE2ZXDKeJ7mE6IXanyLM2Z7PmoUhRFFuJ
 FYNwGHgNNrmwmtOL0Vm9ze5q0EEa9vpI0i5nt/KbXunaC16tNdqoLyrS4EogEXuAHgb0y8rA65j
 SFGFGlAdLh/TmXbvPpaODcGFxf2nCR2NuCxuV2G/r134epzEpqFkB52vH00nO/xXmk1lIhFsI0C
 /yorVq9zluioWNrj5svV4mRrczcXNWTue0NoSUZYQ5EvU2MWAqdi1/ODNPRWDXQ+6eHTlwMuHBM
 GEbBDMJQVhn6u/VOxGg==
X-Proofpoint-GUID: n3cyoDixpGzSlzItGad8-Wsbb2jaedbn
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb95c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Fq9-307z7DJWB1LruX0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: n3cyoDixpGzSlzItGad8-Wsbb2jaedbn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1NJjr9qele4E
 39RdkRxOoTyJKf0Md8+HC+nv02Lk+gBsUDqHaHKD5XNOmo+uoK5eATaPDcHXslO1qOTfbC+XfHT
 TLmw7NMAu3OwNmlm9UJdOn4Ds/CmYhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_get_module_priv_data() passes mod_array->size, a byte count,
as the element count of the __le32 data[] flex array. The allocation and
the copy are four times too large, and the memcpy() can read past the end
of the topology firmware buffer. The size is also never checked against
the private data it must lie within, and a zero size makes the loop spin
forever.

Convert the size to a word count, bound the blob by the remaining private
data and reject a zero size. Also check the returned pointer before
storing it in mod->data, as an error pointer there is dereferenced when
the graph is opened.

Fixes: c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static calibration")
Cc: stable@vger.kernel.org
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index faafbc5c0ad0..612d8f03e6e9 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -312,22 +312,37 @@ audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 
 	for (sz = 0; sz < le32_to_cpu(private->size); ) {
 		const struct snd_soc_tplg_vendor_array *mod_array;
+		u32 array_size;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		array_size = le32_to_cpu(mod_array->size);
+
 		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
 			struct audioreach_module_priv_data *pdata;
+			u32 nwords;
+
+			/* size is the byte count of the __le32 data[] */
+			nwords = array_size / sizeof(__le32);
+
+			/* the blob must lie within the private data */
+			if (sizeof(*pdata) + (u64)array_size >
+			    le32_to_cpu(private->size) - sz)
+				return ERR_PTR(-EINVAL);
 
-			pdata = kzalloc_flex(*pdata, data,
-					     le32_to_cpu(mod_array->size));
+			pdata = kzalloc_flex(*pdata, data, nwords);
 			if (!pdata)
 				return ERR_PTR(-ENOMEM);
 
-			memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
-						le32_to_cpu(mod_array->size)));
+			memcpy(pdata, ((u8 *)private->data + sz),
+			       struct_size(pdata, data, nwords));
 			return pdata;
 		}
 
-		sz = sz + le32_to_cpu(mod_array->size);
+		/* a zero size would never advance the walk */
+		if (!array_size)
+			return ERR_PTR(-EINVAL);
+
+		sz = sz + array_size;
 	}
 
 	return NULL;
@@ -611,6 +626,12 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 		return mod ? PTR_ERR(mod) : -ENODEV;
 
 	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
+	if (IS_ERR(mod->data)) {
+		int rc = PTR_ERR(mod->data);
+
+		mod->data = NULL;
+		return rc;
+	}
 
 	dobj = &w->dobj;
 	dobj->private = mod;
-- 
2.47.3

