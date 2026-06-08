Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F983D891F
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939255; cv=none; b=nuW9uaMwd4ujS9+9GTV2wLY/mCJW2NBpSAXC8RGt3VZK+cmivKjCHtj0yWwPCMlsTPTLjeoY5scEfRo679zhgDEpFMVPoo7378jmwIHWo7plrJASUFjVu5yn2E7aZtqZ5Dv9SCDm20OggEPSBmnoju78yIbnlA80OFWhQarlWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939255; c=relaxed/simple;
	bh=OMLP+uCENoAFecLoBJilbqGTAnWIIlg7uB7y+iEierI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BFRROyHBR51Ts+w9LXOG4iK7kooTMqv1q/K8XP1InOy8T4ny3FrcBSquoaJchIiT4AYcaNadQXsp95iiHiKhEhOoNPprNeKPPmRPBn8yp81M7TEKVOL0I0ACKGm4bvbEmbUGlwN/oYDFIm9K4lyPhyk4JkvB/FLME/HjrYR2H4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAVg628P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgXBfl/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAVg628P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgXBfl/a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFStr3596137
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 17:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V2sa5Dvnjol
	aVGPuM8QeMt0IAdF0OTIT4oFME/COs60=; b=QAVg628POzrG7zt3KSIKtKL68OW
	rmtBx9jdbZPm45NozJZchs4HyY5qVubhnxqig+ij24v01h2VhDSqdfgigr6Nfhc8
	XJ+jB1BiGR0heUXYg5t+RSShM1Aa98W4MP2ukrSqUPSomGln+y2fsDu3Q3C4OVQR
	r+cEVWg2kqESTTGC/BMn1plMBLGz9llIAaNUj7rYlnh74+xOk2MtOP8tx6n5j45B
	zhi55bNx50PyXIpGVH5pf48Vd9EF5PABXXc4zr8EUC2hRRMVNs+nd+N4J6NDg03N
	M/z43iZQuCRtWhz9acvCnsCUIU9+DTN2J4gXCOvscFMgazswZ5qCLl25qIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj9tme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 17:20:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f6247c6so5241386b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 10:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939252; x=1781544052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2sa5DvnjolaVGPuM8QeMt0IAdF0OTIT4oFME/COs60=;
        b=FgXBfl/aY2qtQ7YIOG8CjayIVkwOeWwYfM1nvOCzZXgqu0rEbdoKSXB2KRbreChids
         MeTwbs68j+1s016fIXXwtCmSmD6qjGe/FLAfyb43HJsVklqsNRSpm/UY5epsgGiGZohS
         5UJEyf7VtFQAQ6dqjpEw6OhO+0uTSmgBKaudJQEata2cjNLPyMX/2keppRiAlkPowSTh
         TAaZfCR0btcCMKEwXqLeKUs+eRztdfxzLzkp4dp0CpdNlXthWnz28nxM9SwDh4Bml/r0
         +M6FxVtO7jcX82w8zSZLOt/J9nAoak80QoxoeTqh1ghW8abOgyrkU6ei37Szf8+CT7i6
         FlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939252; x=1781544052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2sa5DvnjolaVGPuM8QeMt0IAdF0OTIT4oFME/COs60=;
        b=GYbUK5RgMuy06LgTmFnZTv/2w7umGoIitKUnyF0IgoiBXPhPvSr+nlJlrzpvVP0Bjt
         AltfcT91dcvOhPp0nsjieOVzKaOzXDMCj6iTBPxDQLo8T+roSM4h3OaACQrEbWgqDJXA
         M0de16PupJumj+TsW1b9BagU8HD/LwRZSipHlcIMvqcu+pI6zEnBegXc7Jx5B/g7Z1cB
         lPAmEv4FIHCUURo6ItVwsLbjcVQf46odk7wOta5wU4xjtce7YET7g5sG7ICcHI5xOlh/
         Ve8xz7b9E0OcRTntDcyCu4mRPkX/dwV1VvsJ5uI1CcJJ2zWsOWCGA6n1TW0Q8Tvc00PF
         bJUg==
X-Forwarded-Encrypted: i=1; AFNElJ/EyQVBshjvX/DkCPaeMWJLWR4kN1wWyJArLFgj6VeBmH5+3pz+6jVACO2jTLh/LhILfeaQ8EgHhT1x0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YymRByISSZuus3sWvoWAtmXIy5IQzyQyUMFtxGFwzMl5mWwmuw9
	9C25pbRkOgzGZkqqaaxl5B2te7JOVox2JQAIeItz5fxGSc9sWm4w1V4iH+D6lYCJiwMdsx/Mota
	GHE1E8HI1CtlBwvZ1kqMfCSmzxX0fMtnVFLyJYhCv/mhN5/6vDG1KYhmh1c4PMiowtg==
X-Gm-Gg: Acq92OFjBaSxcWZZVIjNcTe2n+RfrVtAQ/iekfmYL/hhFDkx16Evv2usnZeeBqSBFfG
	q1qz5FfJSebbJtzQAQPLvqloMYQAH5mYLHtvsR0PFNQhwMVLhrLHixacOO8mjhwLpqtRTJzeBwY
	eVk0KtUUL/y0Es/G1Y8g8mqvkGJF1xjspopd6P4u8YnMEjh3sbWkq12hwAmo5beRObzADT4+pI3
	2L7hOQVMWL4WBk8/z5ZQOpFil3Ydw4zbzWJsrTdinzXFZnMnloexR/JQT+mbBs7Cr+sZiZ6DI4Q
	zALjJJTWe0T4wYbTq6DZm3m7DiXzXdLa6CGgpLfjDUoLAIaqUmZDsvGJTNdixzXUQkHxsud6RRQ
	MqyGvmL5qpw2371Mb0DMI9qGCtnCk6CcrwNX2vjw7iYmEBA6AGmstRBqPb19+QPsh7XGN
X-Received: by 2002:a05:6a00:114f:b0:842:7e7f:2914 with SMTP id d2e1a72fcca58-842b0d837famr15464850b3a.4.1780939252530;
        Mon, 08 Jun 2026 10:20:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:114f:b0:842:7e7f:2914 with SMTP id d2e1a72fcca58-842b0d837famr15464822b3a.4.1780939252106;
        Mon, 08 Jun 2026 10:20:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:20:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Shikra rx and va macro codecs
Date: Mon,  8 Jun 2026 22:50:21 +0530
Message-Id: <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ptn7EzHtrbnD1zbpxnf6evFQg0GYqonF
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26f9f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=oREbJnUDou8kn3UKV8gA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ptn7EzHtrbnD1zbpxnf6evFQg0GYqonF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX7iM2JIE7NfwW
 SHJ7Ak91jVz7WWMGNpEioUz1sK3l77mRYeyeKX+2kjbvTYiTacy7cp0wlAgX4tZRnx2wgf7j+7W
 oPL4XWoWeCTDXSfGeYmILFNHln06My4WvmjjWM0gexRKxDhQpv4EQFktlKfdYn1z3cppqPiAhHb
 1VICCIvMi5zpblvB0GdSFJ5bc4Y4/ESiIcbbVspBIGVlItQoklUy2qr8osbVKzsTFftnFYZgGc1
 k2uXp7WLJ7LXYMs/6KPx7IgAs6djJwJjfAIHg9iYhoOJvq6UYc0Bd+Q/PkHT4F4AwACVyMBOu/w
 o0Fkz0XEK6r5QhbMssGvLSYjWSL6mnCKPwMr5vkmJ0dyk1syGSo8F6Deczh119eo18UYv6xYJLR
 Dv+RKD3oX3tiqTtL3j+OjatYDcR/I8uRRsn9IMzMVyn7KgdNMpJiLMxPV7TB8JZ3+IphO95/R7Q
 MwYHIFMbls6nFZbrpBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164

Add bindings for Qualcomm shikra rx and va  macro codec.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 2eed2277511f..07fe0dc51801 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
       - items:
           - enum:
               - qcom,kaanapali-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5c42b2b323ee..d43adaa2fbff 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
       - items:
           - enum:
               - qcom,glymur-lpass-va-macro
-- 
2.34.1

