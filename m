Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376478;
	b=w851ltaeuohlYUlt2mJ/SYDdE0Il85jw56wdVlX10W0guOdeEcPO2m2C8yRHbdtFmm11
	 MXY4yRYSq0NU16qTayLCKI7DC+XU3AI2rxYXWiOu7jDRe26Hp/aKG3EB2SFNamEYegtwp
	 RAYYKMcDl5y4kKdgNYAp2Ia+O3nxzfqON8YVrOmoK2pTNLXVUtoOp4x5zlnd+7GeL+zeB
	 uPHVXqcaHGFLtvRuh/cvZUtvyJS5j762k9mDYmNN0xfj2hrKLE/B8p0yp6Y3H/U2knRvb
	 sI/+LZzSTvyrnRUAM+tjLYoqgJwOjZDemWwWngS0Yv+I5CSxF8hn/268lBSoiymsohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
	b=Ikx5R5xMEO+bX1XH6tIUdqqrx99taYeG/LBMCZUB4ZROCklgf6NqSR/5SHrwWoR7qStF
	 Bv3lvtKjF9rdSxwZj5D0g70E3C8UXhQeaqtEs6nzPpzvcgGeAGHXLwzHig2h7Y1e1DOiY
	 S0clANEzGKe00K0rJgzWNcodf6Jw3P1MNGCOM3BZRpz6OMoccKCvAL1EewWYBdgSP404b
	 Md7+PhKz8OwDWpV2deTE19VbwNedQfrblo0hXFe/SufaEnK1pPHkHfoAds7ToRCcHl5NK
	 g6COvkiGo+IM2IAs09+LOmvBLBVNXLaDmDzpCtHkTur3pcl6xfG2pwGlZwg05dA18HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222A606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F222A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUqh6412082
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=; b=lhofdDvJJsGoeE/J
	TNoqL0yLff60i3ImR2vC6qn+Vk0CXbSbp87MWwBCTjXwN3fM//v22JsqkRXn39u9
	sDhOOF9gryeqnuz3txpcRi65p0EU/shiJk6gyeS+yM4AxftcjdqeBVZZJ3JfBgBt
	UDwaukIufNFNAxtD5VfTZDKKMZOGUV7TJReDEmCRdd/HvsS8s1rb4CkzUPdm4vhf
	eiN1ZzX6jUfrYmoH/87khKhOAfPvgXUngzbiZfR1+L4s1vNszq4gEOOjSeJrwETJ
	PAy+nbigdhOwLAgm+9/Lugyk1KMcww7S3qfcNfrergap3vAVuncYNiA9uv8E1bR6
	RSDWTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m681-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so3048792eec.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376476; x=1795981276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=jx7tbmtfUL/t6r++4iVR3GBQeYdNEME2xZnMrbpqIR77GSzoDaE73Sh6xnCph4M2So
         rMl2L1EjbvvSd01WikD3jjPA4bT85Ma8bBEWUyx9Mw1GmzlyQXfJ5P6v8ZLALynsICfk
         Hs2nGoF4xAZrVLlbOJ3Ky/V06DJh4W6wi4/kW1YyewmYItmRw1QXt40KIhY/WaJNcXbw
         IBKqsahUtviemY3K5/okX9zE4ctuew6zfo0m8UYNEJ6m06yhS7Ng6inM2kyXUQL1EdEh
         2SZsVXjyVYQEuSbSLxypUWBQVLxZvXoJJwkZNcrV8rQ5TLZ+4kGiClGchpdYNgOWBU/G
         p83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376476; x=1795981276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=hyspU/7OyzHSwD5q90s/TDByqP3AWf+YetDBtlICCi3z2jVF0LeeZ7fDVQwo9kNqDr
         IJ6BPh0X81pQ2vDCOmwM+Ek3akS1HGLRUUG7IqKQLnH+mwlxLeQqiwNGoeFOos13X+Yv
         BIzYRkuNAL23RV9UX/36HNOM/QyYAHauz7H48Xxxy1Jw/r+4sS1WecNFdX+wcf2WZ4mW
         lCu6Or52v8nvUdJtxh01hxSxyVZiEDqdvmupfBNUD6ucsAhRggBgxaaSXXj4BHgzhJcj
         7/WV5hqemWtabSjP6qdG87d2dXRIntOTrcOtUVLjtNfmu6QR0LLGe1e8kSao/enWoyF1
         59/w==
X-Forwarded-Encrypted: i=1; AL+hErEgHZ0lpi9LDQgx0c2mxyHAXBVhInFPLtYFXlFxISf7flLPFYd6Joajl5QhuBzHfPtJFTTrF+QWh7l6tg==@vger.kernel.org
X-Gm-Message-State: APuU4Z959YSGOUx6dVzOZbXrwtCJU6wxfLEL+UhHPtTwJqSOpph0UQ+r
	iMAJsKE7PWcNLkvWR9Ik2oYwpb/pdPtstlCt6yG7rj5BrMSYVcp7MfnZ6LGJSoYjOlI11tznMH7
	46ISORIJzKPSFkEj7A5Gf+p+6ze8fRG4n0p2T+9caQuMdUqaxHv10DQ2ERhijAWhR6A==
X-Gm-Gg: AZFdTZdcifSwJn7GzK61rYnePKwjkki2dtv3Fee+CLFe2phL3zpavv9aRldEOTSWVwS
	k3BzRQVyQ8UPzo47bZoZOCGjtfz/XkBoZxqJUx6E5L0qvhkLZ5ZnmqLiRa+F+XsPPBsa2fUcZtC
	l2Ms6p8tRrZ2CKhzE5ZId8yFcdscVtpsbn6G5XXiK8mca4hitC/aCyl2G6cEZA2QgWnUEO3iopM
	C1jaNipn32qCmzz8jg9cFFhIXz5euzDhK/2SUXaB8hYRbtipL4K0pIf97IwaIxFwQtwOQNldNgS
	Cm080asSQIoEUncfxwKyXsUDNlzcdFodv4h9hr1K0ducmrgRgeR3y1sCUU+xUvTUjFSJzsp9I28
	ZG9RV8pWRdRUa1p8H/MMH+B5zC5U6G6XSuzrJkuBrObmy/+Qlh8vcV/5N90zde7AsKAievjaxaO
	sNUwlEFsUVyQ==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134309eec.6.1795376476053;
        Sun, 22 Nov 2026 11:41:16 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134288eec.6.1795376475563;
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:46 +0530
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-shikra-machine-v3-1-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1514;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KSrSXEahZQMd224943c8LnPie0khXp4nfj+R+BunIW0=;
 b=JZsIIoriXs60xtNNmWjttyoCFZAbwH7sBoOZDULZNYIdA6MaeevJPPUL5B4qrpXwlJRPDL/Ug
 DTJMVUA/DcYBDbGxTfLsSQYAKkWCKiXSlld/4wjVV+qzPElohfBNQS7
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: T26zTsh4H_KT5bGL8MkJm9aazEEU-1Ie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX0bgmZ105psSK
 Sk9KsFGF/VtyAbN4UsCDFmzYxJMei5yixPnPdoqVzn9v7X8gK3WChrBZ7g3NqChFKzJpfiSKK4F
 VeCvoo0kfSqxg1f/jvEDHT49c9VW7SQ=
X-Proofpoint-ORIG-GUID: T26zTsh4H_KT5bGL8MkJm9aazEEU-1Ie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXyu5+dXCaTf4h
 KAOCW/TVaof15+bM+F07bXl4r8wEPsfSx/C0C7Hl76sy+lE7yuUrnfiAt5+WYkOSTd1U9XL5te3
 JOXMN7p2Uxua8og0DA6/ZEyAqnFA7DWrsXXtpvrl4GZZIYAN1ig2DrIqzztR9H3k5dkbtA4yaTV
 TpCYZyqa15MqPfFx1tZTnEAOfSGweXtPF9TDDPcRG4JVEpe3hqHUyGl4Kq6I6hIkpk6PzckcldO
 8H3Bcj+i471AYfNrE/eSvkOX48x3paTGFhjPqCf/XCBGj7PV4Bhg4zo8oTwvwIZgRi45NYeoWHU
 GjTH4mOmIZ4fqD825+8qOAZHSL1bH+RvFU5rcFBpkYBVZTYAdPDoEqK5YrKEhvxpskebV3YrmYe
 fZiT84tpzV8gJQ9qBpm5FQnD+Zim1V2FGG2tRsYk3YAc+OhjdNgBIXCxBoIj1NpuIoENInEgcVr
 +8I60Oynhp84ZG3RFXA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03455d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a890fa288a76..1dc164e2c73c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -57,6 +57,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

