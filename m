Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F241A50A;
	Tue, 11 Aug 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437988; cv=none; b=kdKOpaUZ9MJmaqNAidT5N/v4vjBJAJtUraAUTmTC0Gpys1Kxq34fJ+5J0OgwueSdt9R40j9j2Hx13ardKOxEFtGx+zicRFHs92VSx0k/sBUMynQBQUUX+cNOsurpjmDfyI0Ts3fNHOFlMMN6j64c4cXkeLWLhe3eb1f9pLzo4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437988; c=relaxed/simple;
	bh=XRePFFRFFuEdeFZE1f7+bRSIURX6KvwQXZmNGnqiXY0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tt2eQFSZATpo6kT70VcGVjcUTgtEDFZoRuq9KN1gEe/gsc/y3JSgNuK35CFTWxkMfQSMdo1n3L8AzNKYHQ+KZKgY6HTDeVrdKw7nAYGhZFPKy79IeZFUtA/teR0LlXH6NcvNd2/LzeacA4nTBrB4W1fsHnwg2v+qKejegFIclX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q214f83R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q214f83R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6xQBX4156735;
	Tue, 11 Aug 2026 08:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EVboqqb7IHQjNhHq1m/6G3cPj7h/RM9IgGL
	cRI92jaw=; b=Q214f83RQvPL3RfOG6+O58MEVFnauR+91XLczTl5FE5jThi22nJ
	DPyFb4mDBI50+0b7zhlwG9gdiLlNk+NBCCdf/cBhccZGx2UU19j0/NakGCmRAOAD
	NT5803RnEu3Fl94QYRg524AtfY5KzI9p7wUxmkiaAJAruXXMVEgdM+YkiBY7nxQx
	re/U+p2wtCtYAIdkjSb0H3qsHkQW58ThQmHp6jNr8DDJLg0Q8Bv8NPcvmViKLczr
	WpDCnNHiJDNFfLc1VagNebCXDpYHP5DXVZuUY7RJQczstQrEmzmREBXSiy0N/hnM
	OclFOnXs/XUxLy8VTG5W5eI8qPdup4MgZ/Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8kkkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67B8je80012075;
	Tue, 11 Aug 2026 08:46:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhjtqv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:09 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67B8k9bi012324;
	Tue, 11 Aug 2026 08:46:09 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67B8k9tb012318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3B55F63C; Tue, 11 Aug 2026 14:16:08 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
Date: Tue, 11 Aug 2026 14:16:03 +0530
Message-Id: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX2+crrbjNWn3C
 LS54R7kRL7oIgMHa3TeiSG0V0FCWwOWM80ixmPzo4FVI+ZfElJFlfH4aHLZ+Xsf8oBjE1lhMxoa
 RD3BWyWV68zIizVcsCdHDHfIPeRTLnM=
X-Proofpoint-GUID: CSxePJk8G6WW52CzbO_JeB5xiYvgxW-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX5NB9avUETUcL
 0QszNxStGWLJ8LvL0bB3dut3nfmaNw5w6u1hVP1e6k2/I2uMa4KwHmpFW9ofpe9K6ayg/aGaSDp
 YBZQsYJxN8Wv11n4+BlrNoXv/qrJGTKx8eIbhdB6/1MCgdiq5wANRaqdiIf6Pp7QdyX02QyAlBt
 u3SVnmH1W+U70nuiEZ2qbKWxi2lZs4PtXnJ7698V3/aVj4bOlx8qB1MjJdEH1Dwcw2krqVpF6Mq
 pCWhp/WMzLA9jyiPcTR8bAhQwj1Izp91XXF/x6BPqKnNQrJZr76WuIDbah9H0UWWiwYhJHLyfct
 E1oK2tY38QVySmvZrTDjD7UQLf69VTb6xeu4EU7FVwKgH3jzMUV7z3CbYEvaBHMtlVkhAO7ANIK
 vYWb0j35l23+TxslLX1hcwgiv4cMWwkyF+DDckjHPHR4n/K4F1+5xlw+8/3l6jSiW/+5+CAvW3n
 eJKPWyGsq8y3lFULcMA==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7ae155 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=2ONNBEPcZEuYU-ivlUMA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: CSxePJk8G6WW52CzbO_JeB5xiYvgxW-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110071

This series add support for sound card on Qualcomm Maili boards.

Prasad Kumpatla (2):
  ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
  ASoC: qcom: sc8280xp: Add Maili sound card support

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1

