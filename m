Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29377285CA7
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415442; cv=none; b=ImvLtgL5DAb5bBThfODr6DmgOdhiw/EUhWU17gYjy3tjQYk8lt9a4/CydsWrLcm5ylbjVamW9ridAHh3boZJkY1mkBkVQnhP5s9I0LyUSU1wakxGkWZEk/Z9OLfqnpAKIzctslatHdogF6ZLPgDG49puGMIMl01WeNRBTqt7gEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415442; c=relaxed/simple;
	bh=FACaevhjabj+99RoTiQQq1b2jCviQK1t6Im1KybJtjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0zxcCgjaPnilhLDWAhoWKfcWXUj/z84qZToWIKK5fHRMdq+zoo4eJF6/HC6rjJ84wGBas55+J60h538na7tKuKHdxooQxSuXgb7/8pQ7MNCyeae10a9OfW+7EcLDRHONmaVG8+alHY5Chg9yfPKXYoJmEvFOlIPqw2XCbZmNUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaVgOEKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaVgOEKH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K6Xfhl025023
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D4WuNA6VbsB
	h8tPmc7Kh2HUVGz6QFTY4VzYqj8L1/+k=; b=gaVgOEKHZoPuF83f2WXzGvAqQnB
	vlQWW1Xv8ZtbT0YxCQdC/ZmvWPWdCmdHBnq+n5T2RGd7pfoybSLDissfsmtRuE4R
	+ydx8Ml+bxF7+k4TrwvsKnO2I/R10mIk5R/qf8jNHjJpi1KPl9l3S0MSX0AA8+a8
	hDR5Cl2qaN/MNIgkBG975tg8FkEPp+ekc168h6Ytri0QMRDgu+uS6A7l60UCQN9u
	oSp9r25oZnauUhg7RWwonko++1GixvXLouiHAWR7TTJdaSrgWundwsM5HKH5QNDM
	65R8MAzx7uv82FZdN03IF7sC2ppX4K8C5LSozBHpfiDomFeIjIZFl02JXAw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7jwt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 10:30:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so1907168a12.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 03:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415438; x=1751020238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4WuNA6VbsBh8tPmc7Kh2HUVGz6QFTY4VzYqj8L1/+k=;
        b=E4OPOIcEKx0hh+cdYMcSwUqXP/6i1tWNRtQ/LIksrOgYM3qZ226qX2lx05L3qZx3X+
         GqkppfzcrowOiDxoITjlV9POKlWs2ld5acL8UaJMeTFpSRE/levEx+3JkWLv/xekAZ2v
         rgH/en8WA1Npp9LxJeft6dJ+8txwcpv0LZNCzapaPD14YsGe1DdmuviqIyZHJ/e/Femf
         lu+D/Szu8XvGwhgaekrgh2dl2np2hkKAvhg7ndWybeGe7WPyCkcAvUytZSlSTiiBKn7C
         bWM5YejBLF4zITTjXOAZ008c1fWkUhV+8X127sazR6HP2CP0/iu4xBhop+hT5VXJJIr5
         p/wg==
X-Forwarded-Encrypted: i=1; AJvYcCVBUOFpcPmxUAFDgsTeevC36KDUX+UoBfiGrFbbPLURC2VMRQO72llRjAx0Xx77WzKG60Unvqgrre1OBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfIfnZpd3JVdO0HYDImjgdnY6oTfNu9Wj8ybwquuOYQUyoDsYG
	KRVyFjpA/8fDxSqBkAaCzz4yiCPZAeqNwFuZaxfM/mG7nFOdkf2eZE4HXhaNM01UK+/XP17VkeB
	UPr9mQobh0RSMUzRH9zOl+NB8S70/cdf/WjgkLTd14zBV7STxWuLWShXf66urL+nvIQ==
X-Gm-Gg: ASbGnctN0s63Vc1XY4HUWvF7CRE6bL7MDgCba2Gs5zgwh4fhFyyTiyc4vZV4zJPToJo
	FLLd+uGgs/5VlIT4TEqj5gUe6D0zlvD0PRcRNCvrQXpaD9YBjP8uQcx2H0dDAV4wWm7XNwdfgU9
	55ZN1LdfkQOWKX8qaDDFZe5xdAd2I7hnUSAuQDRr4kWrC1VYO/I4WSGE8UeEw9DAUZGjHhQn0MO
	IC1b0dk9SPi7VBMoI/JfND9fl4jiaF2iTtNwdfzbhAx2aeGWRAzBBNb6SBf64U8PqzlAMjtcjy7
	sR502QOJgUqCIoSmMnNsutoHCFDAhdXEFxrhqHcT69kMtXl+oCTrg6urC6s=
X-Received: by 2002:a05:6a20:7350:b0:21f:ebfd:def2 with SMTP id adf61e73a8af0-22026e4f496mr3560318637.10.1750415438538;
        Fri, 20 Jun 2025 03:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsRepHQERqynj9bksMS2WBRfE9QQUxy9vlASK1Gx1FVkJz/k4AGWV4kq6UMQPyMo0LynP3AA==
X-Received: by 2002:a05:6a20:7350:b0:21f:ebfd:def2 with SMTP id adf61e73a8af0-22026e4f496mr3560253637.10.1750415438066;
        Fri, 20 Jun 2025 03:30:38 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:37 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Fri, 20 Jun 2025 16:00:11 +0530
Message-Id: <20250620103012.360794-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfX9Z5pCtUN1F+M
 ujdiUNFOJ5zt0JByddWhGqwGgC9uYFNHhUwwDFxAh4vnx6n1DHlxtY4rXJvgxiC18/JESiPwYGk
 6q2nuHveJiOUPyocblnuddhrQHm/kDvZbJtXF2qkL8fwWV6PG3ElW9JchM4bO8sUCIxYF8AXSqf
 X2ecgLiy2Pm0UNLxQPB0ZRDYJFcoom6EVrYizPA8qNmkbgfvA2tWPd/2/9s9Z94qcrDZeTJnST+
 nDtH4YZtGBFP6ivfbdDDmNv0SQKbvIvSaEKK4XfULJl36u5JRv20Z0HgdvfAIuIxRY+cTXyXjHS
 bbH6xTGYQ3x7Dmv8CZqZZFny2eu2b12RRiGHYgrKFn0XkJlgVw7sMJiPkCFqnfudjfMvipduTTJ
 b+jmv3rH4vj2Z+gFx3utAtC5n/Vc3gFgryXceWzCKpzoahnOrqye82NK1gUUAXFDBJuObSHY
X-Proofpoint-GUID: ZXeGOHPFTRI8G5n7Xgdo4av6NETpaZPg
X-Proofpoint-ORIG-GUID: ZXeGOHPFTRI8G5n7Xgdo4av6NETpaZPg
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6855384f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WN4HfKPq_xmDaqbUiLYA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200076

On Qualcomm platforms, like QCS6490-RB3Gen2 and QCM6490-IDP, the
WSA884x speakers share SD_N GPIOs between two speakers, thus
a coordinated assertion is needed.  Linux supports handling shared
GPIO lines through "reset-gpios"property, thus allow specifying
either powerdown or reset GPIOs (these are the same).

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

