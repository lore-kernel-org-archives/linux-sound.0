Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33E43BDBD;
	Tue, 18 Aug 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042840; cv=none; b=BSef3AWDlDFJl/EPvE0ZO9O+q9FR3iIdu9gVj9zxvKvPxRU37HS1Tge5uNe5opG4J7RFBmuiRCYHFMqUBD+Likixq0MsgXg62emyV/WT3bw7AfYyL+e821Ivc4PyLjKEaR/6/YpYMs83ASK27sI1uikJsv5imtA7FH6coi0NADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042840; c=relaxed/simple;
	bh=gEO+CjJlca0kDF5255fAlVZru9JNBewmv9dRQgHRCFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emfjtxzmWv/XwSYKqtupywAJ4NfbblMz//PADxVxTk1vmbeOldES2x1+opNF9egr9J+pBLx8fzI4QzvOCZD3ulOQWj5SRo+zIS5ByiNKtS6btM5cEcutEgCHJVZ7ORqNYLm3G41p+u2TtXo3DXxem3+e5dX2mJm6Pn94xWsltKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8cto9uU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8cto9uU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLBd310046;
	Tue, 18 Aug 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qoOnNtoJ/nqA52+8P9u9Hc53VnxEJNls2PU
	xo7B4hQM=; b=Y8cto9uUSb1/opVj5c12T+QephxqKTbqBPJQ6yqSgr74gcj3enR
	KKfoXk3MA5L95K4/kKsoDxiv4H6KcBVUefqjt3D4MOaRhTxQfDkk+Kc3wAdJJ5Wu
	be+5YUXM6XrxCrT6TieLgq6ImkepD0dtXYxDA8dLjNkFdLkMRV340oor3/UXWhXU
	iv2ZKWBa/d8Gw3JRmckTudgXB1P+siXZC/ht3WyJHyTw2R7lU0WLroRAy1srqYUn
	cUbLgoTnADudXO0+dSkDpdZzqTukRWA3Mpsb2FJuVTmwcqGld5mLRPkKfyJLH319
	07vGa5QMIG8+mBwg/EO/uKApmkY7Mel4D7Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9akb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:47:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67I8kxPq000890;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jq1g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67I8kxFm000864;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67I8kwRI000862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 0A73463C; Tue, 18 Aug 2026 14:16:58 +0530 (+0530)
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
Subject: [PATCH v2 0/4] ASoC: qcom: Fix AudioReach TDM review findings
Date: Tue, 18 Aug 2026 14:16:51 +0530
Message-Id: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfXwaJTtFpZjaYb
 ipDxsIMc6V4KO0fvjHtMugKSSBdUZj1CVLoLwyMFAKIyUg5JI12wDKDlfIhOFRfgGfllCB6+G63
 4ezWZw5pYVFUepADpAk3GrUvZKYXCtQ=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a841c07 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=ZGhvr3efECkBx1CP94EA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: W79bRwzV_m9maq29GipAxPDL47meWOGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX+QGr4xKEom1f
 NOesPZl/tP4O2PFj5+JTAUnZId2q7tfK2bSkhAlEbJsqaCyqRjNdvnThpNQVHoPFokgjwVTpnyv
 ebkQmc2+TutV6aizyG7EQ7qIPsV3whZEvf5xJK1suG3GyFr1csgMTz+IzOPCJu5HWcloPYdMqNi
 4eZGRvPBfGm2/H2EThScurfCPvPYl6sa27Gvt4KhfEAc3vJsuu7a/pvFIpubhGSm6glgggSAAJk
 ph9LuRvyZDInI1YwV4/Ouek9DFSQT6eSfyVcX1rZE2M5tR/3GiCMVGatRAYTMaRTUv/dHnQXTZh
 6rlkEAxRzRUC4hiFSpa1fqetbYjcgAELhiVYNIXgsIaiWy7l54t4BZYXu6DjruhC8HEaPAAlgO7
 FXjyZmGRYiktSydXVgzdQ8TUGg3nJHXl2GA6knWzSwNzXCAe7+ChI8NViQvgmV9wDp9uwCw92F4
 pyul7bMzHjkA1B5yZ/A==
X-Proofpoint-GUID: W79bRwzV_m9maq29GipAxPDL47meWOGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180064

Address review findings for the recently merged AudioReach TDM backend
support.

The first patch fixes a typo in the newly added QAIF clock ID names by
renaming the LAPSS-prefixed identifiers to LPASS and updating all
corresponding in-tree users.

The remaining patches address issues identified in the AudioReach TDM
configuration and machine-driver paths:

  - Zero-initialize AudioReach module configuration structures so
    unspecified slot parameters correctly fall back to topology defaults.

  - Distinguish between missing TDM configuration and malformed TDM slot
    properties by using separate return codes, preventing valid DT
    configuration errors from being silently ignored.

  - Fix sc8280xp TDM hw_params error handling by properly distinguishing
    optional and invalid TDM slot configurations and propagating errors
    accordingly.

All issues were reported by Sashiko.

Link:
https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com

Changes in v2:
 - Folded patches 1 and 2 into a single patch so the QAIF clock ID
   rename and its users are updated together.
 - Avoid an intermediate build failure and keep the series buildable
   on a per-patch basis.

Prasad Kumpatla (4):
  dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
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

