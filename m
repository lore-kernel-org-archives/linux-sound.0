Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B63537E5
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804611; cv=none; b=cqzHdzF7wy9QSVbpN8Wn9VpdXhwFe3GQo921OwD19UPWFkqV4PdUeazenNodLh/0018MTQ7lFaLm/zywdumvFOE489uHLhw1ltjzkw61S7qulwbd2Fj45PKth5Z9tgj8OWuh/LdI7cJsLMYTtn0Y+5NZVLCc2vs6Ih3IQZyLJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804611; c=relaxed/simple;
	bh=CVrEVnwNk+Us7cfjRj/Zz0hY36WdkjOwnysyX0mfQ0I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SBLolK4kByiAMkcrXkLh2zm9huK0TQS/oA2E3AqfFGdeKtM6TYde9yl8DmVXkgDqu38GWusjHbRRKC5u1Yt05WN0sLgdK+wAo/HKf26RatBY/AZG/LMD3A4Tpf2Le8YIF7KhlHnrNH8sP/UPaCPc4FjpFWM8a5gT6YOUA0nKH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeWiOt2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQJ4bLPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeWiOt2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQJ4bLPo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7mCQ3484609
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mRiByXxuwAggEWwz8GmTmy
	VSiYkyHqy75fQn32SH/c4=; b=ZeWiOt2xPu2E7VHcz1o0k1DmhfCOzGmv18fmHb
	y/UFcw8Gj3MBdCXdP+sd06tz2BC/w42eF+bcBYkPmjwJyp97rLRkwcEopiRJXyEF
	FrboCc5qsMZdXBE7BpgZdtmfHtrLoMNNVMIkndzlG4vc2VzUlroM5PfzWb8UOer2
	IsZVk/RvfKX2dnfCQ5MzpD5bhql+5SAr7ssHNRoj222lTQcS2t6A/Z4P0uzqW8AX
	Pcw7iMi7cbPcTHsxxn4TU9hY1aLc5BcgO2cXGWzMlLu8dj+OPoisNxR/VSwHjTFL
	whala7rv3fbP7m4rxIAazeknqZXxnzNwO7VlFo5nRmLegKWA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty1tp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 18:10:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1707646a12.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804609; x=1789409409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mRiByXxuwAggEWwz8GmTmyVSiYkyHqy75fQn32SH/c4=;
        b=eQJ4bLPo5zFfxPXSErCnG0l1VB0YmHDuo3FkNP1UtGYWGUtciHfsGHU88O3Ce481/+
         IfGTr3twaVS9YKQH+uL7fy3A781YKBa9QB51Qn/T0gVaA4+TjqkudIOtnxtypHU7j8JM
         kkBVgf15oW8mpLxfZuOmFmXI+ur13YtE7G8kQkyI5d7wi4EU/yzwIC9tnh5zicICV8XG
         BFYmNsF1oVj7wVnN8OYnoyDfggB6TTirlnwHqRw5UAZktFwZq4HDEMOWEo+Cb2y3lau1
         XY5Fvkh0S7tqZBNda+zTTkAX3gk/5nUJq3cHeVKsEy5cDGV224uJh6qAN6Yrx2Wx/YhY
         J3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804609; x=1789409409;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRiByXxuwAggEWwz8GmTmyVSiYkyHqy75fQn32SH/c4=;
        b=j5En0T43niYQYUqte9p34/GndXjZezvEYpGu7iadkNmP1n9AXxr9JNPYmqfEOIjmv7
         TXpKQ5+f6E5wcmSv4SWgkBrmZRaAuCKp2Uh3VG/NpSl4Nazjcd7num/sy6SCuAvQmfll
         Kop+PmIZnxzMxDier1v7pqn/fDlkJ/NY1MS+iLmSG8U+wMrvELFN/42Yqgwy1787Zqbi
         e4AJM95FnyJ/r5EBeyq0KMir81Yc7/U9vqVn36beF9cloS9uWMT2QCHXy8ZPNATuJn3Y
         HIQbXZy6bWGs5VX8pYniwy5h6mSE3TFHPqN1EXuSlYTNTnCbi8KO4ylKCdPr9nBAgfkL
         Hs1w==
X-Gm-Message-State: AFuF++mF4XZLNAY/38qXr07uE9UuZ6FkOgMmm/GuR9PYPJCb8vEbk+/8
	d0MKZLSNev0qTAWWgDxLx8eEkEHa4bNR0lNRvp3cYjmigZ9MiMzUnk2qnyqmsavvUimqDIRnfFI
	Q6PCqjoiiE91DDYmPLkhUH3NqPWLcTz1cG0EYojKWvxYTBffW/k6Y6zcZnkcGI2krNg==
X-Gm-Gg: AYBFou11Ky0Gutx7M4wTwlwzM+rJbFz1Vcz43ijda1yFU1+hedI5sdPT+5Mz28n6VfF
	e+OMcCYS50kbKrtyKrJ5CsGRGN7dovXWkS1+jQ7J98W25FASBrrBzSc6xUdpXPpr/AawqMd0V0H
	vXeha370YzTEpq5h2SaZQa4409oTMfAvAPQbnjtAs7SO3CD0Kvp4bkX56O9VgeUWF2gt4IyGKTE
	CO1mi4CR3cCOL+T3JEWmzYJDOxvXsBSG5AL+zT3+vv4OQ3nYtvAvoOy6IcIUeNUgHd7ZSKoB9az
	GiE5ONrTmwuOSBcLYXOyJUp7/lIx9yuXIw/dZQyD2VQYfm9IYwvTTDExjIEt26rwlzD/YtzVXD3
	KTJJHTbPrYYhqYqSB039yE8PNhnzXrdpEZClm
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr42596709637.7.1788804609228;
        Mon, 07 Sep 2026 11:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr42596634637.7.1788804608738;
        Mon, 07 Sep 2026 11:10:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: qcom: Add Nord Ride audio support
Date: Mon, 07 Sep 2026 23:39:41 +0530
Message-Id: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOX9nmoC/yWMywrCMBAAf6Xs2YU0iq9fkR7azUbXQxJ22yCU/
 nujHmdgZgVjFTa4dysoVzHJqUF/6IBeY3oySmgM3vmzu7kLpqwBR8uEQaWyoi2lZJ2RKbp4vHp
 3CgQtL8pRPr/1A2oPw9/ZMr2Z5u8Ttm0HVCY7T4AAAAA=
X-Change-ID: 20260907-nord-asoc-driver-support-ecf0f38204dc
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=1988;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=CVrEVnwNk+Us7cfjRj/Zz0hY36WdkjOwnysyX0mfQ0I=;
 b=PzhpfTInjhz7/sBOknsQJ9Eu7ojed/7KVihrqNId652Qnf4yIeNjX48DscQBXfR0J8oF2yjXr
 ekqiI+p90AZCxy2S85/7xQWhUoOpiYcvC6fXSpeClE9Vxj8Yh/O/z0K
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9efe01 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=m7YXckNPeSMwoeayZyUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 2aJr0wHhRnq3rbAktPwBN1hbMLf63s96
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX33P0G/qA0fvA
 DUi8qI7EDecBCr3+rzZjR3fauDQGyQJoICDqInRrnwYXhu6WHsNzJbi/3t5t8TYbfECP+A0RHbv
 h0Dauc8qlAjNCP8AT4w4zqoUUaXFqoU=
X-Proofpoint-GUID: 2aJr0wHhRnq3rbAktPwBN1hbMLf63s96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXyHmKeq3SadAt
 S9g9Y8mx9kQdQTduUF48s/bNm9aD9vYu7eUwRymDEEvHgNjvkVlemxRKe69/Wwwc748oDF28lbD
 kgvkluatX45krmidT7iHqOMWR/48w4MB1G1TP6JYiGuBauQzLmE3+vIUp6DhFCl8ZqIGy7z4YRw
 pp53mRxCEYixAJVk/ik9hLwGupE9I87sKgPjbi8hn5GLLTyG7ztw2ME0/xC4UJUd+zKGVf4cDlJ
 SxVgMypexte9w83SwwgrrmXoVNmppabl3qddbWjuNBFT5MU5MEl6pj6pyn0TBvDRQUY7D1c9hKN
 FZpzOtfPmUcDk3g5Df7C5JI26C9NI6XdOaGzLPukXpcHcGIsyUD8PY0EPCxKobYAGqLB4hKgnAF
 6L07rSOUNwFUcTyht3LCZQGoUjVBNtAGTs+wwKWRx6JnM2vh5LJTe5YSk25jCCmgY2yoHMOy6DJ
 UErllj0179MG1LuZHbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070201

This series adds audio support for the Qualcomm Nord Ride platform and
includes the required machine driver, device tree binding updates, and
codec improvements needed for the board's external audio codec
configuration.

Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
Compared to other SC8280XP based platforms, Nord Ride requires
board-specific DAI format and codec clock configuration to support
the external PCM1681 DAC and ADAU1979 ADC.

The series includes:
 - Adding OF device matching support to the ADAU1977/78/79 I2C driver,
   enabling Device Tree based instantiation.
 - Adding optional SCK clock support to the PCM1681 codec driver and
   documenting the corresponding DT binding.
 - Adding Nord Ride sound card support to the SC8280XP machine driver
   with board-specific audio configuration.
 - Adding DT bindings for the Nord Ride sound card.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Mohammad Rafi Shaik (5):
      ASoC: codec: adau1977-i2c: Add OF device match table
      ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      ASoC: codec: pcm1681: Enable system clock before regmap access
      ASoC: dt-bindings: qcom,sm8250: Add Nord Ride sound card
      ASoC: qcom: sc8280xp: Add Nord Ride sound card support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |  7 +++
 sound/soc/codecs/Kconfig                           |  4 +-
 sound/soc/codecs/adau1977-i2c.c                    |  9 ++++
 sound/soc/codecs/pcm1681.c                         | 18 +++++++
 sound/soc/qcom/sc8280xp.c                          | 57 ++++++++++++++++++++++
 6 files changed, 94 insertions(+), 2 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260907-nord-asoc-driver-support-ecf0f38204dc

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

