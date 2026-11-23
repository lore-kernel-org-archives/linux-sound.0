Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418749;
	b=sqc3Esppa4s/uS1otQ0zYtjKl9mpdhddZ/XrWjRPhthUmKyfRxezj0rnIFNCbQYhMR8X
	 3KQchgnN+7Dh40A+mpQYfm0+JISDdQNWqmLej0uD8C1mVENa9tj+kzVF12stGETFRxaBi
	 2PiJJpo+EuGrV4XMJB41H6SVw0vYX7qh7dlity1BRJvVFNYKi5twf7r1oG8Qo9NbtVy97
	 fgx01uONoQfJAElpHmu6gsFG6JrXpb+gbFK256nRdFve/i7ssFrjgtnhbnMv2ng7EZ6kL
	 cqsj13NWh11cBEuGCzkshd7jca+bRpxgNJa1pwfFt6g/mrmY4HDQobQ49Xl2VpOKg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B/VIMLW9uwq74hDCaKMANdZjfSsLSIzgse+hp2I55OQ=;
	b=n8H6r0gP2OE37qZeiGkntNdLvmdmNbuUGh2i2KYHaa6DhdqyRJj8q7kd/eHa8ufC9gLN
	 437QTlDJvYsnzL6r5YFtMqrz2+GhcCDMTqDkj4H/vcW/TOS2CGj8CHJ7gMEVVf66hz3uV
	 vmmmSs45cZLX01fN8jN4K6pN31xcp6N3Me5QJxRokpygMYi8oCe1n7pnZPAoGihuLhBgt
	 iHwKw/oxeKM2LXv9EZprW1yznXuTfCxRevMpcSpL0OmvlP2p3jqTlwOjpqqAXuCm0EmfS
	 eJgtMmDWQIGrPVnDJSQFMI7aoRPDEjkW3PV8q98/To4poCKVyapHTFJEmeHNL5KQzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ANetDoVS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685AF606A31F;
	Mon, 23 Nov 2026 07:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685AF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ANetDoVS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DvJ71664778;
	Mon, 23 Nov 2026 07:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B/VIMLW9uwq
	74hDCaKMANdZjfSsLSIzgse+hp2I55OQ=; b=ANetDoVSPOz8KiK1gGBeAohBK2+
	d3M8UcAxY9QvAGgDrUrp6I50sbui3Y+zDqv8tn8uucjhaq1XQLRKExwo8L44vy/8
	7wlEFcoF8dIqKevOWmcUURDnSveT3raPxMfHJDLkF1l24aZt32hi8m1SBGgbEo93
	IuD7krhCE1S/9zspwK/JJqlWTXGXfeJLWMQXSdrobW3osgjmpGP3jZPbUxNt6bsh
	TsKOYUZsOm+kEqo8WrCNNwOQnskYLuZgjSpLchJfRpABaTpBjiMrIOmob6LzqUTk
	6uWoAHpZ0GxEbiFhcUUBaOGVg9IJc6wJBXv4GHVwJfRuheFitknKh+YavsA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p881c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:25:28 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN7PP9w1919465;
	Mon, 23 Nov 2026 07:25:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AN7PQD41919498
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:25:26 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 1F85A675; Mon, 23 Nov 2026 12:55:25 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: dt-bindings: qcom,sm8250: Add lemans-draco sound card
Date: Mon, 23 Nov 2026 12:55:22 +0530
Message-Id: <20261123072522.2358819-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
References: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: fBfn2humHbNpLd_CcqcpbwQfp0XBXAZ7
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b03ea68 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=d0hnDUOrrfP14rDoyXQA:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX+AnIp5b7Rbov
 3JRqw5fQDw8DtVnbSwzghwCOjOSsDqxhwTK5DoRUOrRw4tBZ3YH3LmLkg4piRLRo0juXbMILZJ6
 dxJgq/dERvI71jNY1XEfq+9L9/lJaPU=
X-Proofpoint-ORIG-GUID: fBfn2humHbNpLd_CcqcpbwQfp0XBXAZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX5x1cGZLkZL1F
 hFXraAI8kQanHE23InnEWaX6YiiW7IBlMDhpietbzK6GL9K4RQ69edRn0uzVlOU9gcxrMWVvfkW
 HEYhty5lleee+Z0vw+rz7PlDGA0zGpcrueCA3IHW8QgsKHCfTqQQzYyeLz5bmTFX6Pbx5yTzJhY
 acgL2hVI+fj4OYJpN7wihUHaDzdX3O5eKcMHPfa0zyuCLu0omHcjTCK+Wj6EXn1V6cGU1kUB3u0
 JZzvOFZmLrxL0ditfnTORsx5XQPlufsXu1PVTkhwcDGKwuQc+r5R3s0VsZqu1a0HNAwRHGsopP8
 C32d5PfCxeaLwvYd/YJqO+k8js4uLw7HLwK8iL8zAW7B7CmQU8DrIYhWhan3TmNPR0w1PRn+/Bg
 1tgz7Y6FK+eEQWLsJ281V5jRjsNBH6+To8KKw60Mj1hw1UlZ+WDGsloo6MFRSbwYAjawORHen3Z
 AKAa+pEILpbhMHfG+CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230029

Add the qcom,qcs9100-draco-sndcard compatible string to
the list of supported sound card bindings.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e2e3fc99e6d9..ce999ca531e4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -45,6 +45,7 @@ properties:
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
+          - qcom,qcs9100-draco-sndcard
           - qcom,qcs9100-sndcard
           - qcom,qrb2210-sndcard
           - qcom,qrb4210-rb2-sndcard
-- 
2.34.1

