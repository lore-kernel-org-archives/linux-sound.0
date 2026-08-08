Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3486260565;
	Sat,  8 Aug 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213210; cv=none; b=dQabxQnnTFeDXYBAWqDHzpZiLnH1WwQ5mXOPxgv1eCkCTsoZobtnnYRv/2FipU9ZraFZjjq4ZMP7razsB+DjuWg9LXtmUvBwDhpIKjhLC369t8EbUUaxiNaeHRVj8L1jpqRhKWyeXYi13ziVAr6mQj/jyhMG42HldoYAO5Yd89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213210; c=relaxed/simple;
	bh=5+4qkVUVX99D4IodkKHZh7L2gA4EaeDSSRUnUo3tKco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iv6d283rXs0M75VgngLwXiwFnYIB+KMpKSvM7LlTp3kmsm+oTGJbUi1hSNGwpTOeF85LSk6iggJXbue96Mq+CM/a/033PWtxjtpRHmhoH4R6XfEYalmieLVgb/cv3w7E1xYD5Tri/m+pkWGwi4xCPkQLeYwhpogUwG4r5xDc+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv2sF97f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv2sF97f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Gl8WD404469;
	Sat, 8 Aug 2026 18:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/W8uncRPERZtmZOrtfm72+GzKhJirP98rNy
	mlhCkyXY=; b=mv2sF97fhAaE4DS2j/CUOBMc5V5EPkhl0mJRymBg7n0K+meyVOl
	4aQ2wRNKG1wmDinLDnqM2J5Lq+fPLcKG9B+VHKbOZXHXsyQH6FzW4wlhXX99XilS
	RolkQxu8kUIui4X+lCEnWLiNugJVN8Km+LSUaoS5F9eh2SFx6tygGLYfvkTF07s0
	fw0hgsqznysX4QYqyHFzwdKDqvvn/4Zt71d0QEYFNHMXhfES1JymZ7pS+A0eRJ2M
	ymAY/caOV9gkd/wVXr148qQ4CM4vrzfWV52v1erwoRMg2XpNhXstQamGsU8KSqfb
	llmUDSaGqBzkAPZfHUVw2ldcaOs+J+M1Vdw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1hf51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 678IJqVP009364;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhhg14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 678IJqiu009338;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 678IJq0T009328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2B1B163A; Sat,  8 Aug 2026 23:49:51 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 0/5] ASoC: qcom: Fix AudioReach TDM review findings
Date: Sat,  8 Aug 2026 23:49:43 +0530
Message-Id: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfXzV7KyKM0F0C9
 zz+S3nI/rTawL/t4yNcBNnvRnrClt5GY+vGjBulydwHcDeW+3pKTT8H+lyJO2UuOinbpujsZ2Uy
 trBPvyNJ541PvQOAFQZWTEuZcOXBkZNw4DL3/pW7+L/mM5ApZcjzaHEdl3uBPmXPj8cZ9zyooEW
 rGdWkFJPKatVF0KHKhIALs42E908Cbmh0J+EYN/TNGxVTq0El6q0sqsTHmbRwtKczZO6uKqQDXt
 6vxrVFIkQFmixwhQQRt7qd0mUYdSyYo65q2SBlyPNeXL8rhjPZ/ArgxXzzoNJ/CiBwqQUy7d5JI
 RDG6q0e46skFySxocqv0N1iaMT3bDNZ1J38aHHYcrnNpjj7UVRPVHgZ8EfhLSPtqKw5dtmNnSSn
 yhYrrYED6lo/BIMiKAL/kecYSz/bMpI+oglMzr1Lw/Go1wOMWijImaZDxI6kl53aj7tQnCJDObS
 TBhPerqw1ueKlp0fZzA==
X-Proofpoint-GUID: 4xq2G1yDCVPS5TC-whLuldFanqvuP9ig
X-Proofpoint-ORIG-GUID: 4xq2G1yDCVPS5TC-whLuldFanqvuP9ig
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a77734c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=ZGhvr3efECkBx1CP94EA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX7TA5W3E/Kq+H
 9pOzOFHN4tkl76kYeDOo4tbomblLc3hg6LkjGf/LyMLF0cfqL2zK5FkSHLxZVGjFQZ18tC/BS/7
 sCPUp+lefBwnwzU5l9llQmDaQQkAEbI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080157

Address review findings for the recently merged AudioReach TDM backend
support.

The first 2 patch fixes typo in the newly added QAIF clock ID names by
renaming the LAPSS-prefixed identifiers to LPASS and updating the q6prm
users accordingly.

The remaining patches address issues identified in the AudioReach TDM
configuration and machine-driver paths:

  - Zero-initialize AudioReach module configuration structures so
    unspecified slot parameters correctly fall back to topology defaults.

  - Distinguish between missing TDM configuration and malformed TDM slot
    properties by using separate return codes, preventing valid DT
    configuration errors from being silently ignored.

  - Align sc8280xp TDM hw_params error handling with the existing MI2S
    implementation, including proper handling of optional callbacks and
    error propagation.

All these Issues are reported by sashiko. 
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com

Prasad Kumpatla (5):
  dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
  ASoC: qcom: q6prm: Fix QAIF clock ID typo
  ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
  ASoC: qcom: common: Distinguish missing and invalid TDM slot
    configuration
  ASoC: qcom: sc8280xp: Fix TDM hw_params error handling

 .../sound/qcom,q6dsp-lpass-ports.h            | 56 +++++++++----------
 sound/soc/qcom/common.c                       |  6 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  4 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           | 56 +++++++++----------
 sound/soc/qcom/qdsp6/q6prm.h                  | 56 +++++++++----------
 sound/soc/qcom/sc8280xp.c                     | 21 +++++--
 6 files changed, 104 insertions(+), 95 deletions(-)

-- 
2.34.1

