Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106851;
	b=cgfayHtvm5D5erV4XEZJTiYO+r7htd1CFzjMfeOZRTunFBpyMpbT8IZdQd15SV2CYZIv
	 ynfQ54/e6pGbLRipMPfPooyedDrOveZhAUBnaeN4kcvdlmM13oP+WhfHMqTWcw7KDsYV0
	 LMmoW+RFhZF2rL7Nff0r1l1+gPDYes8oUt1D9WPqBAiLaY+vQirbsC8il2ohDu9FwHUkh
	 IFPC8uR8mUOHP3pNSuW56Y29ZxioibiigvaHSdS2lNXva78F5GW8kOxGqANIgHr/HZUhD
	 B6RH0NW13je1in1trMCCW4tpFh8qHofAbU5rPF7TFoklE7NK0Rw5Tbtw5NAsI1J0QWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S0pBS0SqdAVHAnZfsUxZv+nLG9+suSfmjHczuL66frI=;
	b=Dje8yF4vISMVXujRalei13RiyDU5VPXAJr7v20FAELHM5wa5o2zcfCPDEG4vXzqeqIq0
	 E5xV/tKoCFO0RcknvjkvslRIGO2ViLO3B4k49ofM4brsUORMqezR7ptALuYxBG2YcHcW0
	 bmR1ig4ONR9uSYkaeSRyqj+sMJRkXa0OPNE5occ32koNZfZ3uURh8U0fE4smBuHyOQk/u
	 trjZgxoH8c/0pn5zdlzAAg5VCFOaWwk0rXnCXY/X+W3hax4h49D3qEA44hO/NlX3wIKV7
	 wXQKMMpC3KuQ3QtFWFMusMkDPSpwqxRFWWZZNnHn9aEa0Mg+VnqNAiYuWvn4wrUTmKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mY5gtW+f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0444860A2603;
	Thu, 19 Nov 2026 16:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0444860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mY5gtW+f
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6Fvg3048024;
	Thu, 19 Nov 2026 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S0pBS0SqdAV
	HAnZfsUxZv+nLG9+suSfmjHczuL66frI=; b=mY5gtW+fVonGIXqlrLO0zQRsQbj
	3dOmqPRLkO+/ba9r/SPHZQfppSjBKiAiY78+7M3HoQpKT/OqWK0GynO7r1A4/u8+
	KrNt0Ry7j3Jt5NBWYckVBvBb42NOIzDEk2DsE1PXLx4l5VijdZq74DOkqk33nXHq
	BRFy6oPDVkB+3O4OaIpv2wVVAepRLTzGheSRGGuMd/SVlQqLbIPkImoM6PxWjvQd
	ln1YxNlbVvGKPL+uv6xCollu7r8XVR+tVnMLwSyYpUZlaamtupCiZUdmVzVgDcVy
	I/dgr2WS1m52/mZVmJ8CYQC4mxIFaCwJFfZsC8C2B3sn9ikVk11JJDfA7QA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcwf1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:10 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGl7di3118418;
	Thu, 19 Nov 2026 16:47:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AJGl7KM3118397
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 06E436AB; Thu, 19 Nov 2026 22:17:06 +0530 (+0530)
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
Subject: [PATCH 4/4] ASoC: qcom: q6apm-dai: allow the mDSP IOMMU path
Date: Thu, 19 Nov 2026 22:17:05 +0530
Message-Id: <20261119164705.1594066-5-mohit.sharma@oss.qualcomm.com>
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
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=2pjKgLFfhSI-GXVsdeUA:9
X-Proofpoint-ORIG-GUID: 5d5OSiqAc5WBOxXiI2XB2wzN-xfwXaib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfXxJ4dgXSYadyP
 YVmWxPufumT6rrwbzkzdqQ4qdi+QPk8kdBZi5umtejVM7s88u/ixzcCw7q0iRr+OFI+f6fyjDbh
 15mujC4oYqaX0xl2jz+4cRrIEg8dP44c6X0P2CIgFyMhk4RL+eAvDX66sSVWjZlIIWjKICtJx8c
 LhqReCpDUOp31nvSLWAuzAhxsEhg4ovVx4TSaVNaPvKssCMJS9nyc7nr/vRE/N686Wd+LJrvzw/
 +7FDIdooSeZgOjf6vFXBSLrIg4Glt9+2Z1w73t8MFM/KyYaVwfhgc5lhH+iiyDfwIMg5R1eyMQh
 M7nH4ZJbsYg5Qvt430rVaopEIdsDE71334OHXlreG/dpyTrgIiUm/UKV3I8SJ6Z1mYHm3HLKKQ5
 Ilo6PfvLdvUV1n2Ys7aexpD6ZWeIB1ua9v+ujzU5Lva/sBTzXV9dNNvQhDhY+dcXJLytYNUrZLl
 FSxo6mRfsLZRH2moL+g==
X-Proofpoint-GUID: 5d5OSiqAc5WBOxXiI2XB2wzN-xfwXaib
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX6gVH1GCBdsU2
 kvJ7DKIKNb0en98VLXGiDFW8Jg1G2ADIwoOApJmtdH78EqCvHHIZlhXSCyYd8qzZYrCbf8oYzvI
 Ylc8Sh5t5LPdc1tb1eoJwdrezXnlQxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190066

The q6apm DAI currently selects SCM buffer assignment solely from the GPR
domain.  This prevents an mDSP-backed DAI from using an IOMMU, even when
the device tree provides an iommus property for environments where the
mDSP stream is routed through the apps SMMU.

Use the parsed stream ID to distinguish the two memory access models.  An
mDSP DAI without an IOMMU continues to use SCM-assigned buffers, while an
mDSP DAI with an IOMMU follows the existing DMA/IOMMU path.  This also
avoids requiring SCM availability for the IOMMU configuration.

Fixes: bb8afd437d79 ("ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms")
Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c1f0af93e808..a29fe4241776 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1218,16 +1218,11 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
 
 	if (apm && apm->gdev &&
-	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM) {
+	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM &&
+	    pdata->sid < 0) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 
-		if (pdata->sid >= 0) {
-			dev_err(dev,
-				"iommus and mDSP SCM path are mutually exclusive\n");
-			return -EINVAL;
-		}
-
 		pdata->use_scm_assign = true;
 
 		rc = devm_add_action_or_reset(dev, q6apm_dai_scm_cleanup,
-- 
2.34.1

