Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061B31B80A
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084734; cv=none; b=XbWqseDqJgd3NHW4KeMD4rnwjFyvggd71dXGkmfrOcY00Gr8kb6E3b849LKFjj1PQbSLAMH4AgkowKZZugeW1aa/4op2dnDusSHs60oaE6jGy+Y2k+BCDzAccLhOyN/yDa8U7xAmrXq9OUVtdquDzYGuhRf18zOG5fNj/HDZBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084734; c=relaxed/simple;
	bh=WC0wC8Q7sdcnE55UR77nZ9YhFbz8kmathVHMq557/fQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nFBk1As+MRLMtKxfb50JI7hrnGRvjUCnx1vb5+hj+MNJoq5sgd/NCafup3brnwscdWuYq2VGEfdD1s4LHWyrT/cdqf+fh868G05ajOFJzWw/HUlvkR1GL4n7SFmuiNFMm1MP9rM1FD2wFvli+Ipyk+4PQM0DKXoyAbsC9oFr11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha3gWJbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha3gWJbS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856pBw2013645
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dfLc5hoIAeVv0LRPfL5wwCPsZeYeR0ugf52
	QpVAesm8=; b=ha3gWJbSz1VNvSmS/04o8DaHtDA28rx+/tSSudxsp9MH14BCbB+
	BExvOxFlV3f5VmpVQ68OacA0KytJzP93Q5C9emaM0DcS3fN/XCBjhz5nhg5fjrK9
	jU3+NYm1mmycDFp35Sa6BS8GYW9PweW4khuRziyvg4IWQjw6orNKAoxFYtm24SGg
	6y3xGixxnKdtPT8vtpOd9T5JDd6waobe9FZuX/70TV98V2Tf5VKcXqWUqv5/E8Cc
	UNcKcMLkhmPlRFsGrWPezk9ukMvMWPSZo+Hv7Wv/i/Ht65HpqzQaQ37ZSnBg2lGO
	5i930w1VUqPPHgFJs+exPp2wytNMnA4IZHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyff34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:05:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so26174765ad.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084730; x=1757689530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfLc5hoIAeVv0LRPfL5wwCPsZeYeR0ugf52QpVAesm8=;
        b=g/PGPtznVtAc2LgU7fadXZm9lyU/UxBbbEBdOZ02of5OtVeyAwjKJVO/fSe8xmkNjh
         m0dppBwZuqJVmm22Uu1F32HVX8gp/yg0cLLbLiTDXbR28hyNrFov2lazs1Pgfd1PKifh
         LyrZPAXZzcE5tt+kjZz5ElsEuKVOfGHHbOx8CJLUCE5qWywHA+I+aest45cbeNOWbN07
         L1nF6jZ2/fx05xAyeVhIPr7uD8XQTtxIoQL8AcyxOw8JvGfyovREom9qKCb9RhycdSno
         6cpdpVxeQIQAE+sUmr3jEDJ3Mi1C7qIEJxUGKnJrWegD63THIgukhVCQQvvVq0f8cRkv
         w7NA==
X-Gm-Message-State: AOJu0YyQiak+C/WpcRmqm9dCZv2QOLbSNsT7Hi6ZGoENCyDCub0DH3dT
	k9jCcTWQx/Zsa1zgrAqM6tXPP+J8Z8Ksp9TXQyH/ReYnz6HPLZOOea/bl6qgStEflsNTvDWMMrM
	lDjlLw50zppauJ9qyXCZwG/OmkTk+ol54Pc7itjhc+qCLn3VbM5wqK35dVlTMX274Ow==
X-Gm-Gg: ASbGncvrkimqTVNsUvQLkZFfL/DNJBGXdSveP2F0NRm7B1IVIA03Wew4ae8qEfmSC8J
	ZXc1lxwDUw2eTU3ikuqFTGvuLz53OrZSt/HDT7PKgQDy9mcRZ84Kmsi8RhXws0BFrqbMrIn3dZ5
	9QYNvHHDhZ5cxOXrlXpDFW+ckbb1Vdp4N1YXz1Z4NnRqWm1kw3i4IAYhC760CYBSDqjDX5ldG9P
	YZd63wN0BXrXYX1kEKdwUzDaHB9h4HYYJHXUS9mh8AJqUbZu3v2LrqMiLUGC9xkYR9YOSYVY13E
	SSCFvC0SOACr83Ua05FW/p3UWsBF+ravCOUc+NQKbBDTMwm/lGJjgY7AlWVHJDEuDpLEhKOJq9X
	Y
X-Received: by 2002:a17:902:c949:b0:246:edc9:3a80 with SMTP id d9443c01a7336-249448dce41mr332440765ad.5.1757084728510;
        Fri, 05 Sep 2025 08:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEur4fImbfHnLpDXHW5l9lSq6IXnaOlfb2z9L5MzDU+HmkU7aw7yrqcmOlzzf3CXuFiwl+f9Q==
X-Received: by 2002:a17:902:c949:b0:246:edc9:3a80 with SMTP id d9443c01a7336-249448dce41mr332439615ad.5.1757084727663;
        Fri, 05 Sep 2025 08:05:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 0/3] ASoC: qcom: Fix lpaif_type and DAI configuration for I2S interface
Date: Fri,  5 Sep 2025 20:34:42 +0530
Message-Id: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bafc3b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cXVXCxjhMTluyCL7QjyRtBDq6N73z17C
X-Proofpoint-ORIG-GUID: cXVXCxjhMTluyCL7QjyRtBDq6N73z17C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXy5mpaw6GPmg8
 B7+bY4ah1QyJQVaoPyqJ4fYdRfaGNip3VufT/UPhIq/nKBT+eAs0PqmErY9p9bQLDQ1vUjVA6yJ
 XEp6Mea2yz4NL2eHpDnwgPiRLIPCYyHcu2x/YhEoylyskUzScAGtdcyG5GQGcrGheao0jgXThSH
 QnHDzaestt8GRwQnMu5RbyvxOH7C9CmJgAAQCTGt8+sGher/vejNiPgfq1xcMqXgMyS5icLPelq
 MUVrhEVfa2TJdRQrRqQWKg/bQE1UiHd+30JUP1sZ0QhDw6Hva1wvA02M6Gl9yJ9W+IQeTPL46s/
 MeMbmrV1LbSy63LeeMdBrB3QFqJmv2I4MolP9KQGgpD/NRQCzbMQwJPXez4OzX05abORZejFjio
 DwSwwAs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Fix the
CPU DAI format misconfiguration encountered during I2S
stream setup. Tested on Lemans evk platform.

changes in [v3]:
	- Added Cc: <stable@vger.kernel.org>, suggested by Srinivas Kandagatla.
	- Added QUINARY MI2S case in patch 3, suggested by Konrad.
	- Link to V2: https://lore.kernel.org/lkml/20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Used snd_soc_dai_set_fmt() API to set the current clock settings,
	  instead of the default WS source setting, as suggested by Srinivas Kandagatla.
	- Link to V1: https://lore.kernel.org/lkml/20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
  ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 4 ++++
 3 files changed, 6 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1

