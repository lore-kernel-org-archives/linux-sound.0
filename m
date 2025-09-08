Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA4224AEB
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 05:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309839; cv=none; b=mNzC/8onkU7MnhrYmNFzFfV0UmtiTUen+nkQNYKYfFF/RW0fuuw6zTmhO5QM7yba2kMapdkfGD5HlqFb988X5XP9BuUDyQnRgUg3zE9bWZvq5Iu3k9SgvAHhYaT9VFjSYYWiTSJwik0YzsSmafKjoiRNkQqzMRpDkowKZ6pRYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309839; c=relaxed/simple;
	bh=CaB1TNSUbDHyyFdrQnQBPgQfdsRu1OOu0HhAAigiGDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h/M2mVSXI3HZaoqOvGfx2sxsQUT+m/EF1T2kKbpe3+MQNVfSf7o+ZTXOrJXkm2UHfvd6Kz1o4YEuq1sAzs6CUbuGn1dEB7Hw5wr5KgAVdUnBx6xtqNUFCxufJHIQq/tyIGd0fFT1CwGb2fXEpVj7SBvE+sIv7M18iJHK5Zni0RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpqscwuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpqscwuE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5880TsmD004353
	for <linux-sound@vger.kernel.org>; Mon, 8 Sep 2025 05:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lD8cwxf7MZ8m4wMdcW4NqOMxZLJgf7K+8dM
	uzZNQ9+E=; b=gpqscwuErW1BX2hi2kz8Nlw+r8zmPO2a2Hq/Ek4uAW9HqgnSiz7
	tzY39FjHxH2D2hL2m9mxYieGHRF4BjoWp6fF6OUvFskRWo5s/E3uJGelWSvdY9CB
	YI/U792TtBcHXRzOu6B/qXs61vRYRDKsnQuYCFWDQZaP0BQtuhT1ln+gd42WLFI0
	5FbiRPGjo4GmntP2ARDYvSE0vQ4XPAULVKfQAsYcnO/JI6ljKns8KTWOf4SkyZT8
	owJ4i2eVr5Rk3xdzttX30PQBALTcZ19efp/XJtWm/Z2n5zKqdncMOlva3iH0/ifb
	mRii0nxTCZR+8ymh6UsOPO3w4H1rZ85XvxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4ku8hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 05:37:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b521995d498so1804938a12.1
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 22:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309837; x=1757914637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD8cwxf7MZ8m4wMdcW4NqOMxZLJgf7K+8dMuzZNQ9+E=;
        b=Uiep0RadRjaIpth2saC2fRGlr/VS7NkChGLtSy1XM0GN9zGf0gjQtAkcSE7LVgrMV/
         0HbZhgqkMePQZUzHVYROykSFicrEaBCnuIo4VHR8OgrPl4oIcmKiBf3SobiM/AWQtc8g
         W3/QKfkzV2BdUj3RZnX2DETpJJaqeX/pQ4lcyZmqUuz6Om3KgAffBmh5YIRO4KQWov6t
         BbbaSnX9EATgNdY2JKGi55M7prPvr0EgXcT7pGHgw5i1ASKMyiu7o4zUmRu4kzphKFKL
         kvvdp+36DijGgqFQALVklApFqohL84sPA+owhO5w2fVr4/YyZGlV56LZ2JTlIYQjD6nZ
         LAeg==
X-Gm-Message-State: AOJu0YwaMoCntqByKkltkpt5pD4HafNSSh5/DnHiXzz2E7rslkq12+bR
	iLTniBpuakaKLDuCN138JjFVfJ+2LhX/DC6nB3Njz+IE6qFUG6gFTgnFQYiZqFBYoYvNoZyJxzI
	10A9VZLBA09IfcUg4FP2BXl4G3MgIf1KM8V3RcKMlN6Pbjarm4mRILLyXD1ZPWOYdUA==
X-Gm-Gg: ASbGnctvB+9mDPzTgxqSK5EuFjJLkmBks0Nw+P4ZlTxu4qA8hLEDCEWBNRd8mF2wAQ6
	rZPWVdU63PNvt9sAK9fBpynU08xx/lzYOCELh7NLL52zVDrn3oo3hqIGx2ygWIglUXJPdpOwAS0
	3CDbkChENqbSm7nj4epPCmQZGSrCF7QXJuo7KujmSFIhH6XJcHR0ZEypYF01tKDbryafrxAa3Pj
	rtnakquqUiw8H+UvH0xrjcDS5nrfNAyhF69YLJdICv7qVIaugIRznUa0tqWpbU6jqZfmXiJlHft
	5phmlUTODYOghEXPGdfHibikxXIGLgVkaAg4bfbnrEZkEvQk3MZM/0Fa0Fh76hGyuCbwHt1nQk3
	k
X-Received: by 2002:a05:6a20:3d88:b0:246:9192:2779 with SMTP id adf61e73a8af0-2533d60850dmr10791538637.7.1757309836692;
        Sun, 07 Sep 2025 22:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH57rjgychLB7Qf8P+tE8Tlb0ThhlaBMZviRf1StqzDT6yykvqMOcWbNKfvbcwKGmoSP5L4Zg==
X-Received: by 2002:a05:6a20:3d88:b0:246:9192:2779 with SMTP id adf61e73a8af0-2533d60850dmr10791504637.7.1757309836229;
        Sun, 07 Sep 2025 22:37:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/3] Fix lpaif_type and DAI configuration for I2S interface
Date: Mon,  8 Sep 2025 11:06:28 +0530
Message-Id: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX5LCLpr/xnUXM
 xggggjb77Ay8lMBmgPHEN6xl7psyh8+bkckjQoxPXPSd5kvlwokcFi1NVfDGLoa2IJa9TTHm1hu
 hSdclD1ZpaPlGbxZQzrYqF509uMi9hnvi30KlYnXf0zI5oUhlYBC8hEZaD5APvEdR7SyysVXOdu
 keKIrelCTnisc4pjCwkU3cEpgHKcXVpwWgKq/xUx1eq0MdQ7gyfmPs6KBLOBHXaiY2sObmOyZxp
 jEVuBtUaX7MxMWSGTEMx0Lu/tx/AxUHl1G7D5dEYfNmEVPlK+N5Hl1Dtph33cVsGVjy7AUAbXrr
 MPrl1raxKLE2MlcR6CgrOxPE1XXp9octQrk5b0P3UvSImTAlllBbPDiOccjqGTM7HG8fOq9/flD
 J/nFdvoC
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be6b8d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: yYMOAbqzQdVn_9JQdHyfZ_rwpMajcSHp
X-Proofpoint-ORIG-GUID: yYMOAbqzQdVn_9JQdHyfZ_rwpMajcSHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

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


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1

