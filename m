Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419321;
	b=u3Vs8cBB5CkdqG3ctlANjtK0f0bM45NJVwb5fWYpo2HUxL2fc7UBTF0Sq+CTCCasGJ3g
	 o43HbeNgCPp7nc6A+doUCYgVKJPlJJk1IbVq+EKYWxeBpJzrLdz4wnvki0wDFTwkA7aWr
	 VpNV1XNyDuCXq6TEUi7EI7gDLSVOkaiRJyeZeu7WonBFvFD5fRlm8XQFcCnseJ7vHYXYn
	 Th1ip16kMip8/smoOYuPMbm2FrPlAZ3Bf0Gl4CLeKoyH/kMnY8GThCdc22bq4qX+4lukO
	 TY85DsJtUDaudjmwUm0szDwaYJrC3TqxdPGLg4VuFQZLMj/2lU24uqe2MRSCdvjQSUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cqv/Zr+NIgftspVpooFU3j5HIHQ8n1uj/sAMKpWSVcw=;
	b=35+f/UDhH8CGYmPDuqWaxq0oCOQGfYhCK56YGhHe9hRrMLrPpHfvDmvBrOi2KBZFMWJO
	 7641baZzVBA17ckNhC4Et/2xouTrSIoWFP6jb+4Y8vwZFHgg2kOHN/JeY9n4cDGn8nWSX
	 F5Fy8bIhkXVRWBugLUal/G6kQnUa3q+PyeRrCCusTaypY4gMZOCCooM7GVJ3TDwS15IlD
	 MBBzrBng+Dx6sTLFb0ZzdKQS2Xqx13vqOAWZ4X0RfUuCZ5SMpArqh2enu/ERxo6b1lkug
	 2sQCeAvYPmHA43iWMX4h+YKYfEcz6WNk1v0guc7Mod/GrHR32avRgs8jQQVbq9eFF+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7Sj7l48;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DE606A31A;
	Mon, 23 Nov 2026 07:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7Sj7l48
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN68uUc2371825;
	Mon, 23 Nov 2026 07:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cqv/Zr+NIgftspVpooFU3j5HIHQ8n1uj/sA
	MKpWSVcw=; b=E7Sj7l48ps2/Wmem/R7LImS+sqlakMsD/jmmVy7pO2vnTIFONSS
	QuYP3Imet/hJWf3jS2IBIbiZxXr1/Y+a1MwsftU9IqW8JJaDtxIBCQXUVGks0kvM
	EQKNeIKIA1mT2KkrpYqDIylwhEi+mSqy10S6mHC18x4mVZ83Lqyt1RRVMgd9+xLb
	G6ZCrq1rrIT8WjbOEzKSKKZf4+ihTz+4e6U7HWTxfR4hyxO2vQUproVwSKca1F8z
	tXi6e9a4LTcJ7F0n0voL4Uk2j916TMu7nW+uwPxlYZB/EcgKVc0Zep0U18oXytVm
	b9qWyLX1cLIiYConmt/TUXOF+YEhLB4df/w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd09hw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:35:04 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN7WfWq1929498;
	Mon, 23 Nov 2026 07:35:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AN7Z1dl1934126
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:35:02 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 9DBD1675; Mon, 23 Nov 2026 13:05:00 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/2] ASoC: qcom: add Monaco Draco audio support
Date: Mon, 23 Nov 2026 13:04:57 +0530
Message-Id: <20261123073459.2361169-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: vPr4kBw1f7EXLGNNdwHkdfGDaIh_4BIc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX01X6yC0Qmemi
 oI3zSKLaXxsKSlypiFafGhE7Tlneisy4DTs4eXsk6YKcHPQAZFQUxk9eVSYxW7LLUZdB0QZOTGg
 YqHKTrR/g6Lnxp1TEghS5pxZJf5juCPY5r7hlFOJZbHd5dqsMnZV/OxPPgpOyNXnDxgWLZJHTP9
 MjqOKbFaFRUqbLx2vnLuvfKJjcP9ly33eqlAsoTiQ8OXwe/6/SVgyoiMFjRRJdaGfuZ1BujYz6I
 1riQwuD6SoWcvG/G1bzup/AVARE0uwyBUf8NXYXhGJ+cvXpDQJhf1TMVRVFyl8Mv79ViTaQNJGb
 KfwrancECmZZhU8wPo1rvnsAdnnTriyNutIlxFcfz0GjefZvAqQYSGS+TKKd4A1cgVfzzUN2tht
 p78AkiHHF4ZVC9zs+66Aa6UX/uDe/CpOuJv/Sq4oFn1A7NniO0qb6yW0rEwTEWvpKMChmlwYSPQ
 Le7Y8yDiGiubqvC0Rsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX51RwhHVGpTDH
 7pyV+4lW1zq0XcaN1nl8iodUJy7l6g8verH/zLGfbozl/6+lx1jJX3R71gEHrqmnYaDFPN87bxS
 Sr+FS13WXKLiNYB7TXoe0kEBUK7WWsU=
X-Proofpoint-GUID: vPr4kBw1f7EXLGNNdwHkdfGDaIh_4BIc
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b03eca9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=vhFeFoQAgetVqjRuHiUA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

This series adds audio support for the Monaco Draco EVK, a platform
based on the QCS8300 SoC. It adds machine driver support for playback
and capture over the MAX98091 codec and capture over VA DMIC, along
with the corresponding DT binding update.

Karthik S (2):
  ASoC: qcom: sc8280xp: add support for monaco-draco
  ASoC: dt-bindings: qcom,sm8250: add Monaco Draco sound card

 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 sound/soc/qcom/sc8280xp.c                     | 38 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.34.1

