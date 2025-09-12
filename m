Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE028751E
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665959; cv=none; b=emJRr6zZK50RtQD5RPkDLkSLWvCS112fQ9/F/yoCmTKgmWYLeCp2Pn2uf89Ld7WOgLB7HOdttdT9ir5jicNINoDj5O2IEuUNyanEcD/MObjsj7fBsx4ClP/Np1rQSxYqmQgeSgZovvgUe9a9Wdl/nFV+zfWD3Ai1T2AB5zJpc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665959; c=relaxed/simple;
	bh=HG+b+jRIRTWPpc1sxXtE1A4aG886oTSQcaj4r4e1v4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exZFRRTWjljCAcXrM5Bw4eNc/6FLmGF+l8MHiUl8PBfvVj6jZQ+UB125+1r1bN2uvQrWTnHDsUVX5DaHeU+odySgE3tVbAxukLk3QM7kAdlCxfnXIjI/1X2YZelL94Jq//vQZ8QdkOwokJ8thfRU+ytn0OMsPSwNaVH8Mv++46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bChzC7Ff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bChzC7Ff"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C6uVr4002343
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XfwpEgA5iMz
	nAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=; b=bChzC7FfP150f+quUNHkzby3T/t
	L3HCAvGe/iUAxIn2Iz7wAdP3h/8H/9Ba2qZbryLkBtUYYv8VZBjXb0CuG6ljqsmc
	vZ39OGN/abduUgV+J4iEF7aXC5xbpG4qnXfxYDVi1fO6dNeqvewqKAX2IqjkZlLX
	9z6qjHtlwz1AOJcUsFi/dlzz8sjaENwzR7hBkEFTV5Zie1/k4PC7E0tu7ArBHf6M
	7sYjKY7r4Uj7c2+a92378J8FEZfAfU/ea7JpKr+soJw6cJyn24bSliY6W7ssZKP/
	IlYliYbTB20uXuWPtdTUHGl24dbXqX1k488VOyxMcvbZd2B4QyPxf//+2uQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8tw9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718c2590e94so61426276d6.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 01:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665956; x=1758270756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfwpEgA5iMznAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=;
        b=A1OzxrdWiaYDvd0asILbRAPAJrY+ZH9kAURlhYKfESfSqI9gOGQwGJEoWFZWRb7MOV
         YJQrlNiYc9UqArRYGUC9005/OhyZmEoBNGOxmdFcuvikQe2h4D5HoI6QDSe9aH70IfXH
         fwEFswStmUoCxf6tQfZw8VjbULZMTX8a8DRdje4jjdCL5PnFkSkEq2wGtscDdIOy1j12
         9hs+594WYu8TRTraKz78pSKROcoHXWVNh4yjGHdh+DRX5xG/Y4mU8OyGIhkOsk73AEWg
         2MpbWaf58koce+dkz0ceW7I0+w5/UpvukU89aO00uiXze4VsQyHZRUCmmon9I5tQqzLm
         uKsg==
X-Forwarded-Encrypted: i=1; AJvYcCUq5d6W8YegsIQHOcWoqQUdzAIKgViCi1iD+x7q8xRVdl8WgNpihnxm3g5RuQ0myWdqzh6AlVOpmdfRzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4YZYQe6e8oB5zpcCkQtnb+nUjl0khdKwjQowmbXqCxDyhmeH
	U0dmpYBQ81zEeQee+Zk65uqraBIOea9jLKhnJW9iuET2CqBCZP2VpzmadBgPEC6H1GZWeE4jmPg
	D2ElbmZ/or9HScgR1KRlJyzvCg6ifbtVsl/gv16iSzYkZAc9QX5nWPghBy7RJQKS//Q==
X-Gm-Gg: ASbGncuH3EeC7iLwoyovM9KMByyx2BFX3uyIN87fA1zw101m5u03WhiRduBs57Ka/56
	09gTO3njlvJkHPF1QYeQJdJUaSwdUWmoinWlQHdE0ZM4Ogb4e5hRiPFlOvdc41ZTmva8ksJethv
	y2+ZffpijYq/C1YC0aHH5SL+2jAMOiMt1Pdb+UNUhHom8HjQRI4q3ZAmNetwcOVS8WGZBfUHrSt
	SYAt3LvbXRboQgYf8S7ezpv5m13C2xFx5V7Bjp/Cbvp1jzyE1EhP5aVN8fyYyTQBjGBXYBN47m0
	kWIxVraEYY1donbj8QpnFS7yujI+nEz2Z+26bQWAYKu4wA2a3p+eNQ==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr72387776d6.1.1757665956300;
        Fri, 12 Sep 2025 01:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYHFi7nQKEsfNo6HTdciqVCNkh4syB+/VM6ig6YPCJeUsIe4Add5fXHpY8kWwaY/XtcFL/nQ==
X-Received: by 2002:ad4:4ea3:0:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-7621c32efaemr72387486d6.1.1757665955691;
        Fri, 12 Sep 2025 01:32:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Fri, 12 Sep 2025 09:32:21 +0100
Message-ID: <20250912083225.228778-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX7VYjPLaokpRu
 sV4aS/JU77BscifSeP6Xb+/YMNQY94tkgfUP9dfLeVO+p5EuPks6M8bIxljLHEQMUvFIVBHh6i7
 7sFEHlRO4Q+88PrYDFuBkmZp+SfwboH0zgr2lQyIJLYHb0QRO6P8b7JDkNs07kUhoYNYU3NqFBQ
 PnpBXWbrpzdKjBCddxgLAzENmEmCeDq4pAILFO5z52voAHFMyVXCHNtR0KXLDO20uGSyNWSZwzc
 Cphxvjtea0OKf13/nrQOkoj8Eb51ecz8SglXOquRtK2q9VbUAaa2+uWNbHxqB13sObBMwcQceH4
 gMwQvCw98+HrgEkET4ooT/l8WqhkrG1kOjPDvlp7Zvf7XF6Yfoan5lq47WYH1I1AyGsXoPii0Pd
 YMzap6kw
X-Proofpoint-ORIG-GUID: UauECuhbZRgXG2wCqbLRG47jugFkRw2u
X-Proofpoint-GUID: UauECuhbZRgXG2wCqbLRG47jugFkRw2u
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3daa5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0

