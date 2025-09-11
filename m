Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F5266B6B
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572596; cv=none; b=eRSGPecNFdZefizwx3Pmh+sXUZA3aeE1bHX4v7JxTfPvfgLJChblYR8aEkt3+riQWtyb8aBX2P97bHS2X+yFUPsESdbo5RcStdwBYrS1ZZhmAkznG+uDcmaf9g25RiF0MLjFuh2irC3/AjEjP2jZxH+F3RJrFaFwb71p1y7HX/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572596; c=relaxed/simple;
	bh=3WQparlDQcdEdl7ZPJ262lJlWoZyN0BU1wz+mBY/Ok8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MP52nFvyICMLfu/MO/7e//FHTYPMve3/LwwTyVfPLZx6ox7cF8cN/iyRhiaID1ccLFJ1Vz3lJfc1/bNWJ2aUjV2mjAfPZbMl9Wzcmr6QWOaJuWUfCsacQnKkoe2oMJkSf9RI9h6PyKiWoHNWPObDQibmsuK+qQpCm88mhchu50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRCHhpB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRCHhpB5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IZgR008194
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BUtZ+xnLuqe8A3qnoyRxyt10mylwZS9Sqaj
	PHtwNVZ8=; b=cRCHhpB5SIDHyO9d9RSv+z7iEbmbDlG1v89/gR8mgF1qIworOuh
	i4fGKTonTkTcQKj6sDqxV+sHlGsNBEuYSq7BK2eXQ+DhXNYlaOIhQN+6BrbOh+c7
	G3gXWwLW6l6+/bms2Ojy1CYx4NRX/Xt/XJocK/FJf4Bf/02mMzH3wHr5IY8KymTD
	HCnSTecTKlDdVUCm4/5f99c0mBTHH6QrAy3BrXux5eS/ujNsTJUv3zC6s2HoMG+x
	sudlQVjcQ5hgm+jCZsb7nQrYQ6HBGGinRhMwwjfChoJMtgANLcJB5DqrlnjxQluG
	I6IDCFWwEqu0oKc31DhrHgwmunc89LNyldg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aappt38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:36:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25177b75e38so5204275ad.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 23:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572592; x=1758177392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUtZ+xnLuqe8A3qnoyRxyt10mylwZS9SqajPHtwNVZ8=;
        b=YVM96ERBe7SbHK4GEX0UM+1fPyIwKKdpEgUN/+bhPAEvKrPW4Qr2eW3EGDr61p6hQL
         tNKYD9mNd0pQEvOcZ1QQEiFKb3iRZwPl3lNkKeSMWsxLAhfrE8yKh3cNyJry36oRL1AM
         TN+BfOKHdpQr91I12zkdG3T7qBWptv5mZlPd6dsZ6qDCH+TpXBoCTrGFUQPADmIKz39o
         ObwFtZkaP9yhuvt7XZyHugTcmik44d2Hrujmt0GBE2R3d+0JzVJ91OhtCoqQQZMda3Ds
         XYdN6f66KfEnc1CbG/67F5CbAQtpU2m7VO6dv7CtFZkbu6XwhWSPDpAD8F6pi2yibu+Z
         1ixg==
X-Gm-Message-State: AOJu0Yzq0g4QKrRBarfjhzGNKwQgUi6ljTv1qxAEE5vp9/3/chk3KJ5l
	W7sIR1S0L/5nH0xqujHPm2BzB8QTIQ/JoRaAg/kEdw7XEAZFGE2RW04LlKgcentRKz5X5JndOEI
	QLK45G0XBAHWjnv4PGgCOvS2lLsc5x5Ka+feSw709yzmISQCbs4mOQW6uIwioHZMwVg==
X-Gm-Gg: ASbGncuAcR0CGs2WNl/ukXOrX8uRWAKOvVYEgjEFd4s7xV78eyaxYoP6ZZFjVl60lI3
	RoNTm3q584y/7mzxiVsu61acQmA/jdCrYWfadc5JUIoJLP++anAjECpGfzGVruEv0fnWrJ/g3bL
	hnhjIGqq24drfU1Fr8a+B/OnIGDY0xJE4zj/RLnKodpPL6jB6vcEWW3AUeHn2HuNgm3CmwSWpeN
	PIbvzmUZARhmlIVTtNIGfPIEIiTabfCqvhYCAi/6d761Bg73/ReLkmlQSirxzB5J2DYOnsc0bLi
	cEHUs7ZL720ntJfW6/ZmIXAgj1gfrn8HTz041iGAusfqmA+Z44Ti37GRIWSVsJexkSY2ESsRTd9
	X
X-Received: by 2002:a17:903:2446:b0:25c:19b4:7ae3 with SMTP id d9443c01a7336-25c19b48233mr14261335ad.24.1757572591964;
        Wed, 10 Sep 2025 23:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYwp5uptw/HYP+W3XfteKDOqQGwpH9u9pH0E7b1QdcfjmApuxH+jbDqCz/Mj/ZSR2U7+AbDA==
X-Received: by 2002:a17:903:2446:b0:25c:19b4:7ae3 with SMTP id d9443c01a7336-25c19b48233mr14261115ad.24.1757572591461;
        Wed, 10 Sep 2025 23:36:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm7739125ad.72.2025.09.10.23.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:36:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [RESEND PATCH v4 0/3] Fix lpaif_type and DAI configuration for I2S interface
Date: Thu, 11 Sep 2025 12:06:09 +0530
Message-Id: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c26df1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KNZXAIA4h9PKncDBNc_6vHH848__T1OB
X-Proofpoint-ORIG-GUID: KNZXAIA4h9PKncDBNc_6vHH848__T1OB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX7o3/ItYRHUKZ
 DVPcb81v51262w5xhECjH8bFB7wi2NAAxcICaS7SUrddMr/IP9TeHHvM/ud4hogMn8+t2erfHov
 azRghhVsjX9TLES1gCDGiqylGXMKoUnPnWfpS2TtlCkyWIaNzPBrbgSSq1hunPAd0mXvxAR1RoE
 jv/ZuGmX0NnDzrO/44fsQWpgqPJQ+YoYr48nBzgRkXzu5wD7WSbBuGHSOSfEAhz12N4L7hcku7g
 q6p9Sf+KWZ73LsFaRcToLGg/w7qbedDCwoE1YgZsIU7RhruGvl9z0/hhipjD/PSNWtj0wF5aKWD
 pSPB44xsWCq0/UgQMwLL6as6SqNfOPr0Qf7ajzgpgnQ9oVjrTcZniUy6YqwBFIEJdGSVfoZ5p8g
 BTZ8LzwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Add support
for configuring the DAI format on MI2S interfaces to allow setting
the appropriate bit clock and frame clock polarity, ensuring correct
audio data transmissionover MI2S.

changes in [v4]:
	- Updated commit message in patch v4-0003, suggested by Srinivas Kandagatla.
	- Link to V3: https://lore.kernel.org/linux-sound/20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com/

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
  ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S
    interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 4 ++++
 3 files changed, 6 insertions(+)

-- 
2.34.1

