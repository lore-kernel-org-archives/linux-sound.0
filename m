Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC3321445
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755278672; cv=none; b=u9yp623wu9oTCk7A8+oenHPR07SjcaHf+s73fI4Qe6cE8VL84u38fcxV7AVLSjP79VbJNUSlXHQOFaRGFmgZZs01bOlWykz1ispB0HiOPfiqwOxv6/4W/UbZrm6ZlXmTgfiFSBJIvMwPCgbd6mbbMpZjSRfEUoJMd7Z0II5DNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755278672; c=relaxed/simple;
	bh=NM5eUwufs9EQvxyH72fi6ouw9HbAH6xIggTFFBsajLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FZC5nAsBxyPcf4R7J6i0ph26mHroSuemwFF9kCPy4zEHljYG2ZdjHQPlc1/vKIr50qTobXnJ2CMgXihjRwGInpCvldY7lWtghs1Tuqw8TJd88uROyWo69XkCWpPrVFgFmxKNVLMiR0omUfxgXWEl4vy7wIemgB5OGNL7p9rVx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiRh+IMn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiRh+IMn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJAGd022207
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 17:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcwNi5jqAVS
	vH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=; b=CiRh+IMnWiLbwdbYxp6fDX+bvAS
	48aiEpc3DNLT3lDYdZZHu03MJ/YeJgvg88TrZN/3403h6molaE4cWsKKayo7PrWZ
	lfDzAdtisSrQS8KtvccEIYKb4NxhI8ejGQNVthgk9FMWhQ/HKab9USHg86GKkJBt
	uWrriM7sGAJj53oLZ89xe07a4sd7y00PhpOhNPy6Sn3fBndPaQS00yBY//LfWaVj
	0mfGuAE848KDNIhXf4AVupkePS5zb7EDuL17TD/BqTBQv0pMDycQpHyYpk5gw8/k
	0eISBGguOkXyTXJXNAL8Qwl+VoZao9jYwebwhH3owTSRwzeiG2Rsyy7pjgQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmknm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 17:24:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323267915ebso4166632a91.1
        for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 10:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755278668; x=1755883468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwNi5jqAVSvH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=;
        b=mfn/ReXjA0I8nKvSelhgZIYRGah96P1LXMgPBQ5m89n1nmy52S0PZmwbq60oSeZ4AG
         Sx7ZjL9Jn9IqFWx66ODuAE553kg7VOEPXtKcN7FyhTPPuBFTTeOku1n4T1NXJHIw1Zpp
         Bx3m1YroiVGXBz4p3SHlvwVJkg01aAqOwLnLbLKBc1O3TxcTke8MrWsHG63hwKPLlwt6
         w03CK6Z2gaosYXU7gIYdbJRDp8heVo08BzY0ewaWJp81RXtuIuUbfCVoTwTCxFYPTNw1
         cwOoLljdsroLTthLLg24Qymjpk75x70Bm1Oz/DP9R7twAFRYXlpWKEl9uBUgzhblpSeX
         aMbQ==
X-Gm-Message-State: AOJu0YzmaSdHfMEjMunnbQ91xZbbpNDgvQQunWMpKCS6g44F84ahWKDl
	XPblrH6Ecpubq6AwyauLDla9EnF6/Qs9Z95WsiKL0+VKXE28xJf4McxWie1OkA+elqCdFJtykdo
	SebitcwifxuCVN8mVnPdiQOE5YVZCyFCG5rTvIgLZJOP/PLJOFSf5taFyrnxMnjTvSw==
X-Gm-Gg: ASbGncv5vRQfu+MNYmMrtJGEwhUcrGgSDcRZqcJ5ZzTOSfwotRNpe7Fr7e50Rwesu0s
	KmWx1oT7PHfbbWF1DGYY7NnCRJAjdkwsAEIuPVjb0RkR+HcCL34RnhRCWEargIogkuEFY889VTM
	nHbwdcsxKhUvCSrOopmlWEu15c0AhBujiLoSdomE1dtOfI4DD5MjBo+7HIJahttT55ly57SnFVO
	xMT4zUJaV9XuqiLPiKEdQO31TCI6Bwc5ZLuILu6L8HexhqEmdHRwg6iM1WaRFViK9Kni9wpAfht
	Ptj6CPDrSyFFAetOzudmhxY3/PWuN8D3LI7qTCkcDnHP2keziwCsNUdzzNesj9iOC3FGhDPJfFD
	S
X-Received: by 2002:a17:903:1965:b0:243:926:b1f3 with SMTP id d9443c01a7336-2446d7a9610mr49008655ad.24.1755278668487;
        Fri, 15 Aug 2025 10:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEihBomGwZVjSUs4+UKA4oxIwLDdUcsOiQ1uMULw5AP5GlJ6JVwHuwDnUGWMxWVfKCJnYCXwQ==
X-Received: by 2002:a17:903:1965:b0:243:926:b1f3 with SMTP id d9443c01a7336-2446d7a9610mr49008275ad.24.1755278668067;
        Fri, 15 Aug 2025 10:24:28 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cadff5asm18404025ad.42.2025.08.15.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:24:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Fri, 15 Aug 2025 22:53:52 +0530
Message-Id: <20250815172353.2430981-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX5r8PUkbWelSK
 63LqJxapVymVCs6bZVyTHgj98OwYzwdp6zBEiH5FEcYyrq4LsAaMUDqpj9dlczOUDQ/Vw2F7TTE
 JFIbyTxsME7AyALYd30SsE4YtSipCT16Xit2FTpwEGHVpxjuifwvV1oNsMHhXbB/T8+t+8umBS2
 rtM6/T9V3fQz/XwbTt9gDbZnplKCv9fkKCXEIr2+AjoaLpjZo8bnk6gN2We1PMecTcC6mHXC1QV
 Fw9T+hZn2SsKy5MnHNz/kEcL0OVpT6UluGkK5+PiHbSaptfCgKpl7WgzZ876O+lxZC42HfwU6qb
 AEWM+FlSAxIo1bXVo5iYilEa4bD4GnnpwJJGCeXgUxs2EHOHnro0kLIUhphiGg6VT1lHbeHL+lQ
 Zc+Yd7Xe
X-Proofpoint-GUID: yXyOQAQGgPWz6esK-pU37jvpNTrcoDGE
X-Proofpoint-ORIG-GUID: yXyOQAQGgPWz6esK-pU37jvpNTrcoDGE
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f6d4d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
amplifiers share the SD_N GPIO line between two speakers, thus
requires coordinated control when asserting the GPIO. Linux supports
shared GPIO handling via the "reset-gpios" property, which can be
used to specify either the powerdown or reset GPIOs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wsa883x.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 14d312f9c345..098f1df62c8c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -29,6 +29,10 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   vdd-supply:
     description: VDD Supply for the Codec
 
@@ -50,10 +54,15 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - powerdown-gpios
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

