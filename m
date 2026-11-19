Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106850;
	b=ud/IdMIA0n4WqYYZHe1Yli7Sz6kH0vTpu30Ps88hKv9Rd8peAPVghQQkhDFndJ168hyl
	 f8jrYw4f+MFvGnEXrDimGyo6p+vJxEf2oZT8QP0nxmIh/hqCz6zND18uLYYL9mABFKavO
	 DBF6IcdrTzyQHemETAWIr8BRnsuQRVOQYK14YOk8O74R4q58ANceC3sHyLzuIzSrYbqhd
	 31LC2aHsptWxp+1/kuKNb57Gzws+e/TmvIVMcQPJHn0S8Tmz4mWUBBf1ATUOW51m+iSfp
	 xkEuWlnn2X8mzga7EQyiioW8WU8CY1tbuXY84PcIV05oSrc8J351D7ILfuYHI3CJBlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fucg6+H3aj0x6Mrul3oYN/ia4zpxh4Dp21L5L1Ca8I4=;
	b=Fjpx+WUXSCZZo5s09HgeA4sHpygOhAoAfDh9HWEal5J+jgHBAb/6PpstCJtVSpxUixQT
	 9O+nNhLsTWwwvbBAbYBFk+XlV2vZ/bZSxW9q4BAROH7kzgW6czsPN/SnhIzfk2RbsxRmX
	 ww5oesM9MHMqjC5quclj8Zr9HD0kxx4YWz7Ntm7BWIOEavdyTuuxAPMEQ/p2u0SF/RCy1
	 KgmDKELCPEPWT6HG+ZwqoGUEvfJqKlFVGvhLwQU4VtXvMAqVAQie5TUeW+aaW83guX4y5
	 cmz3tHHGLi06bfR6dnvQFx86SjwAgNX7hNLzJRs5jWKhv4vNEZ2QNB18/jSaVE8ey4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1hYm9ms;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B0606A33A;
	Thu, 19 Nov 2026 16:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00B0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1hYm9ms
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6FEj3048019;
	Thu, 19 Nov 2026 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fucg6+H3aj0
	x6Mrul3oYN/ia4zpxh4Dp21L5L1Ca8I4=; b=O1hYm9msiICzgnPiehnv4OefxWt
	ZC5OFu2el/n0PJq9P5AWWIcO12TPYH1t24NcOPqQQdZcdyMc+B/B+2mPUPK3gcms
	8B8oZd/9Em/f4Ad2EtJGxlrN1mI/AklXfi38T6xSjx+nHoXBEInKyVWH8hmlkmZZ
	7K/0laYq3VTwwwPhEYCdL/SjwSCYfLdjyHR+eL6I1N8EFzdMEl1gjqUFBmWJ/Ib0
	SzyPPLIOijXKWxDoo1Eu+7spRui3+ETIJ39PREJ8lYoE8vTrgbw0tVtjCcgYuxco
	6bT2sS62/ICtSLj5G4lCMh+fNGbqGW3bXbvYiCSrPprVmRU5rwr4eZp/YgA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcwf22-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:10 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGl7R61031921;
	Thu, 19 Nov 2026 16:47:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AJGl7FN1031909
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 0249A661; Thu, 19 Nov 2026 22:17:05 +0530 (+0530)
From: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: [PATCH 2/4] iommu: arm-smmu-qcom: use identity domain for Shikra q6apm DAI
Date: Thu, 19 Nov 2026 22:17:03 +0530
Message-Id: <20261119164705.1594066-3-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6aff280e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=v-17ujD_Twj6ygAmxgMA:9
X-Proofpoint-ORIG-GUID: wC2ghJhxz6WMV-DFTheIyxPKoLVf4Dlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX9UgiCs/E2Yat
 UULRiIb3XCEZTN7SmP5Xy2Vf/vu+S0yKQ98thTZbjAx0hjW7mFFsdLEgiZJaUuLZutDtB5WILjM
 tXtOnqDmGMLDXnSarWtMa6QMCGdH4IS5kn3FDVpMGXeleiJjiE2VbYiaPaa+R8/FsszgjYTFJTf
 t6JK656qRsYGUGMa5Q1Iwu4GEG9aL1iAd6dx/4Rg4JftEovaWpI4CjI/pKsZ6GKx9MLjl2RBAV3
 DaBa/QRGdY9p7p/wZONCg3C5vZaDbMYiDH7PsEq/CrYU/XWackYaF3/fzuivsbH0tvhwf8Zi9LM
 rtZrIMjZQpZcByUgrtU9OvbVsK8N86Jzqv3cp3F94hApCeCXxrjhigYtcYXgtw/BQ+Wonkv2JfH
 nUW4Cj0nWsFQnOv0UicZVzA+8ct9YYYg43oXTRpL1tceyleqyEfP/J4ofnhL0fgzXduSxiXynxB
 j/OBjnO8kPuhkhPOP3g==
X-Proofpoint-GUID: wC2ghJhxz6WMV-DFTheIyxPKoLVf4Dlk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX65YRz5FHVS06
 cQm2+oxNAhq3G0rYQ+OrDsawt2pRKH74NsIbCBv+svYmsKjmYNXRWXykYFJFirqh3rMR/egRId+
 kCDO02V6V7J7OTtwM7BlzjXjfkAO//8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190066

Shikra's q6apm DAI is hosted on the modem DSP under SMMU stream ID
0x1cc.  Its firmware consumes the SID-tagged shared-memory addresses as
physical addresses, so a translating domain leaves those addresses
unmapped and causes context faults when Linux owns the SMMU under EL2.

Add the Shikra q6apm DAI compatible to the Qualcomm SMMU client match
table.  This selects an identity domain for this stream while retaining
an SMMU mapping scoped to its own stream ID.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a0550740185f..b340ca5f5117 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -435,6 +435,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,shikra-q6apm-dais" },
 	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
-- 
2.34.1

