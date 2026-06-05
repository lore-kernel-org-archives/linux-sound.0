Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D27947DD4D;
	Fri,  5 Jun 2026 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655877; cv=none; b=OxmcKkdN1DRL4P2xAvQd0SDCrYsxcC6Rgbyn7tyYnZetnyu2XSW2XfJJ5hz3Q4fd7FyB0MmxoCrp5Z97KZuq3meVA3CTbWB0Gv3mmp076vAAgkAzrIo4AAudftd/HN4r/ykSUp82r/d4ZN1qz7zoIMv2+2IW7NzRYLJ4b9ZvllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655877; c=relaxed/simple;
	bh=S+zkRagjBtegqBMgsgui4iIZplI9wRsbjfCBDj8tPzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UhFxKFDSVycOBlgbZZ2vssAE+Yg8IxmBg0PAqVkOWGUFMDlEukFUKgyHbBu5DzxIlAUkoIwOTeSYStfI5TUuYNUq/zr2tzrWmG961XJvRGjKELlUv4wukfAkJF+GODqVIRI+M5LgB/nlm0EN/ONcrQkmCSqdH/UX4zS4LCDaHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eByTKZ3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eByTKZ3V"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655757lM3529086;
	Fri, 5 Jun 2026 10:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oL5PHBGnrYW
	std8r84qxXLacC3Z6sAdPjyiNdFMVLb4=; b=eByTKZ3VEmaNXRkR3wnoFKGJHxT
	AYLEpOmcZ3ND0esEbNmert7vE9XdlUOK2KZNu6c1+APm2s9K1YQRlvqTAxCMLMCW
	EtU1WBvgM9bb+Q0EufHCnIzfOuWtVlfRxgcTx8V984ItOmYKs52x1cDrLM7EnFWr
	r/3RhANEetVCXjsa+61lYMNH+NNWEZ8WvMiiY6l0mISVlA4qkhE6lh3gyPafLU87
	UPHosirOIBbbEHyg2P3Q+JMlSUbYhiaV2qYk6UwI2lWLtUo2/wRBL0t/V0VlkZ7K
	mEq3Agvbjp3ISa124hk3beTznrpsivi6qS3WcIifZjn8C7qYJQeMqNR5lEA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp8tmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:53 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6o011714;
	Fri, 5 Jun 2026 10:37:50 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/13] MAINTAINERS: Add Qualcomm QAIF driver entry
Date: Fri,  5 Jun 2026 16:07:29 +0530
Message-Id: <20260605103739.3557573-4-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: e39XlA5FrT11Zej7XoSr7udHXQMF_0oN
X-Proofpoint-ORIG-GUID: e39XlA5FrT11Zej7XoSr7udHXQMF_0oN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfXzpEDS8QrjiaB
 yxRhQh5245Eakky+fBazfy0IQ1Kqlkns8id8E24baeC14LVtxcrxcqaiTJb/UgPIFOyXI/7+Lxg
 Hlv3vqnbJ01OqSiZLTisjQWpQJWNs3FWFb3dNnV3VWyPYzmPT/6lGsVWdrXT9hfTuZkCv3ruKP2
 /7E/10M6Z5KkX0J+Wby/UQefelpi74YZUX/VUuyTGs25Wu4XV0VOBel+EHyGuTEWv6g5SBlweOx
 pIBFC44XB7s4e+CRFXsNMC2AoiKMAqYt33ybLmiGdrMf04o2E7bEd0vOxS4ZYw9Kw3xxIjAdMoQ
 GkeAvaFs3oHV6eivL6mVd3HJtqFBCtK0YYgcsK0UmmWwWP71bAM2gHVA+fF/bytt1uESzYOdApK
 BL4ZMLkpgTquXWUg8E/aTTUgmD5PxEGYhuJGi7tHu/hRkSG1kX2ByZuoeHsCw23oUJA6T3SupvC
 wJ7yTxCk7nYXZhGVuBA==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a22a702 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=5TfRDjBtmgYofzZU2EMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103

Add MAINTAINERS coverage for the Qualcomm Audio Interface (QAIF) driver
so changes to its devicetree binding, CPU DAI driver, and PCM platform
driver are routed to the Qualcomm ASoC maintainers and lists.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..b38f03680ef3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21707,6 +21707,16 @@ F:	sound/soc/codecs/wcd93*.*
 F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
+QCOM AUDIO INTERFACE (QAIF) DRIVER
+M:	Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+M:	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+L:	linux-sound@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/qcom,qaif.yaml
+F:	include/dt-bindings/sound/qcom,qaif.h
+F:	sound/soc/qcom/qaif*
+
 QCOM EMBEDDED USB DEBUGGER (EUD)
 M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
--
2.34.1
