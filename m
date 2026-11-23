Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419319;
	b=x3CXETr20Fm7FYmihQXn9oxNyPFUF9ZEk4TmZ8B2A7xgxSKaSnC6Au7ibb1YVws7Hnfq
	 MtRvh3eRj9N1zLgu0An8ZJ60bDL4i+LFBbQeqb6DMk7YD7Jcj0qMupaEzkMrTyDpw+oSj
	 pXbg6oHHoflM978DkAdXYEY5XiJ5u0CeboNwIkqnLUSu6daxyxBKftDhwfwdxJH4fgWS6
	 OhNvM7HefE9JUG+VFyOF3rY+X4xcEHBlgKy4LW14ZMSC7Hmu8SWfYTdnA1oPr4BDQ/vDP
	 jwefEyslDKpqog6/8F/QvUWTXAEU8fj7WxCgJcjFAOLvPDy3RB1JaXgREOt+9w9nlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9GYyKQxYwc+zkve5bNFKIOXY5Kz6X60cFyASKJWSLgY=;
	b=VLD+f7FTTTw6PLod4tA+gcJLod6A7JXM8KXAn7YpMuSGHT7DzuES57wE8vEzHuFcWV2B
	 HoVhueE1W9wQaKJWl9kEDfrfG0AmOu7gT5u5zYsW4IN/kAzaL1+ooaIvI6URAfHOmTcqN
	 WkTo5bmKB7tqyKzc5IG1LioOBlwEMOaQSog+bPXr1c4VU1QPw7KvQvIv7Y8MQ9aztWvzS
	 H7EaOPcFl6t3j7Dpgb6qunMHJKgXTrwtOT23vn4yxbtO891N4n96WnyLGMkDzb15rDylk
	 y/g7VmZUKMPBwzOow668DeHaIaLnFGVj+M2ofoNbRAMIpHhJNwkgb4EwZsQOjuyulng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRCvzZ8l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E9606A31A;
	Mon, 23 Nov 2026 07:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRCvzZ8l
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DYYt1490125;
	Mon, 23 Nov 2026 07:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9GYyKQxYwc+
	zkve5bNFKIOXY5Kz6X60cFyASKJWSLgY=; b=LRCvzZ8logZ/9ZuNX+ZgJQT+t2S
	pedJG2ulWWpyGUEB4tXElD0qgfot+AgLkmPlx1+18DXvejPMyeji6dmaRXhf3NSw
	1UWiXJd4sT/Rj385BGB1EXk4oUnhXXwpGFoHI8M1wSz5+q7A0UX8CjbJ3+JQk0j2
	GtoY0IZFde1RcjvaP88scknLeUIIp54FusOLL1sFf/tzaCtbsepePAnoAHqfkgRG
	G5rstSvCBNw0upyNy8JzJKoVjV0F+wdehcZFOmUxJAFEqNW1z/5t/OyKrGhiCYDm
	SNJ/5SobT5/0oK0IPWem83PdYfjp8UnemnYXoczM0+HQtRzo7eFw1u5IHkQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k08yy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:35:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN7QY3U1921316;
	Mon, 23 Nov 2026 07:35:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AN7Z2Wl1934243
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:35:02 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id E8730685; Mon, 23 Nov 2026 13:05:01 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: dt-bindings: qcom,sm8250: add Monaco Draco sound card
Date: Mon, 23 Nov 2026 13:04:59 +0530
Message-Id: <20261123073459.2361169-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123073459.2361169-1-karthik.s@oss.qualcomm.com>
References: <20261123073459.2361169-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX9IBtnf5uW7Qt
 Wzb27trv9ToTllRKO0M+4BYTsSp5comjdSnvo22u5ehZr/AjErIN0UXp+BUSIHqni4vRnV5NAl7
 IKXOohY3DQfUT1jlyIeDsk9SHlvEEdM=
X-Proofpoint-GUID: XeVtiVgZzlz7qPzff7Hemtl4MbjJvb5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX3Okq+IPn7PNn
 Jgr1NGKNCZYvahnkkW4BfbYIYEC9iM7uQ3byuwetCuqt/Qrm/SdajMD1Xir+i87qur5HXqqFa6F
 wZPaa8Lxx7pgF16yzZTROLQapVHeBWjZ/eZG344KpxUt+5acRF1YgVQq9rE/hCjJQMCsEHaDVTO
 zNPCtZu8DgWZQnZQ9N6ibGMuUK9lBB9h4I1cUH/UU2pa4a6pRl7DEm495hWTcSoMSANCNCfK5GW
 H6hKEEBzy1PH08L6t60p3vH7WUpE8EACP6N9iWJPdzNBQ3LwMlxo5mxpGRHAojKsd4Nrv9JeQ9j
 siFg7KRWwFyK9nWMrroLt6wLZeUi5D5Gpsi1X1KNo263a+PEWs4I6I1fFV3n8jCmqLVwgtdSjki
 TubA2TGp5Mn9eggYSULw3uqXowNoNEY42TpjACdaI8+PpeUBXQhYpvDbVtl6Q9qj0veeDf5hEWM
 mUKSdi8pDaCybmJ4Pvg==
X-Proofpoint-ORIG-GUID: XeVtiVgZzlz7qPzff7Hemtl4MbjJvb5a
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b03ecaa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=XQnLujHBaOl_c0eCC8YA:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

Add the qcom,qcs8300-draco-sndcard compatible string to
the list of supported sound card bindings.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e2e3fc99e6d9..8af1869c2d35 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
+          - qcom,qcs8300-draco-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
           - qcom,qrb2210-sndcard
-- 
2.34.1

