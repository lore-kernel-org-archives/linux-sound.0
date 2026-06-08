Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49E3D47CF
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939250; cv=none; b=b016dESOJ0BOex0XAvBQYmHNvdRUn9YmfJM9/qjn1xOMIOs2+2rAICDkN0nehMP7ByQu//eWRBY9SaZp9so/SoLh6VkqFKZ08V+1x413As94ATTHetX6sXY/oyHFuKUUFOeIiFhLPEE1I0LTA/B9MU7N5M0v6riix/uR2gYfepI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939250; c=relaxed/simple;
	bh=Q2JBR3kGC10lZH2CiMxZsObJlEtkLEh1ibZOUMTXwhE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fMvPllBqoqtsp11JRNoTMfyLadrN2dXC54JNApAtKPA0P5F6WX3Ww18dt1N5A6uk7MUkruY7oKOMgQGfbxIVBpbnHTIUH5ohOXYFKsVa0fCzIc/cUC+ShehO4ju2Qagik3J6bMYCt17OqF4QotCEvFQ5KN6iDtZv2ckRHS0p6eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0Qb3v+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZxbtwVP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0Qb3v+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZxbtwVP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTWa3588401
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 17:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFN3LV6HI5bxZIkIvwfrDMorw0Yst+KEONq
	BEnm0csA=; b=L0Qb3v+Yuwt2MqxBrwmzePhPmeqefmybIoycc1CfOX8aS/d72rF
	mRaMFpUf573dw2YtHD64MD2EMb1T0zxcvwzALXnLuyTgBXvQrbo95ggOgzxjAtM2
	1MfoVTU2MMd2Z1rek5p2XBW4iJo87RoIdAGQ36GI1thySdK+42Ykw0UnFs0WZ8mG
	wrf8FSEjbG+3rEAgRZ9S22I/Sn0RwS7IpVQlKJAqKv1vZZyKHpdXDS3Y0KK5RF4D
	zwKb9vxpDM9u+4etawEPTMwWc2nADDigjc1RuCfVajaQdSjKMSBtrNwuyqRNV0zk
	Vq2PA8rZw+2z38RxlFvQteMqwDhdWkF6XPA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun421km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 17:20:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422b1354edso5437307b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939248; x=1781544048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFN3LV6HI5bxZIkIvwfrDMorw0Yst+KEONqBEnm0csA=;
        b=AZxbtwVP19IxOR31fkoyQHrZ7mOTCxXB67pr93eH5EgKBVnUOxvRBgAj4CPkD6KGJo
         kxlT223KbukFpEC60ybwzWcu8i2+vcsMOGt4XukcONtV1zgKBrDj1Hb03mZ10dJSeylU
         tO/27RQyVRSHeuhEWkblhlhO7f40HFi9J5rbg3xpa3Xs7uYTnay3p8iXU5i2ZqgNWHqv
         y29xf123ZUqJCZOt3it2/vx7P1G/HUF91d5NHYlNwJUs6RuXelwePawQzBcsUdhZGI/A
         cHlSQ3gQNUdX8WaAdW2q/M4Rn5nGB0ItMh0kyjckRGi4zdFukH0bcNjIs5zqIUe0t0ni
         5WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939248; x=1781544048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFN3LV6HI5bxZIkIvwfrDMorw0Yst+KEONqBEnm0csA=;
        b=M58/mQ5dxS7jOD8FiwWwc/QqDvQt9e70u5BIy5OF1y/kvAbJtUFFBx4Y3DBrSToaUt
         L9d3bZ5sblIE78iCuC1fL9SyklkRtqjLrkPVhdgznDmpP1Q9YoQhUoyzwVbbzCCzutZR
         AuH8rU59VLOZkB99yHV79t95GasxYiXN/MadmJapfVlCR2j58fjNZrOufaiEH2tJJK3c
         exl4spT49/9xE23djmyOFA5v7Kt8d5mldFw9xTPS2hoLvpbME4EyM7mqqNpcgsDV+KsE
         fQVT8skiw9zWPEVCdBPIgpqXWZkJqavB2g4vVzKU+xcTA2neUhSmnDT9xwWCiqOwfEwX
         qqEg==
X-Forwarded-Encrypted: i=1; AFNElJ9sQsNHLIOkZ1aILKuAuBFyTGSMsgCs4hBe5HUIKH5jBCa36fKoORMeONe6xjzXKNRve4nLkbs5XTMzrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuTRo6uWtqpMGc+L9ullYeyFKPEU4V0PIWUjx2wb6Q9wWTwf/
	9MxmQNZkdPoIOq6Hgn2u6yjMUcRxxLLBPRHX2lEFs+WJoAmBfnbjlNqdDfI2JYtmAIkIlJWjrKt
	1kWS0bGfm96bIfFXpIF+O79Z3Is64l7TOClqj2jscUnxhYcw+gC6GVnlmxSHxRWcw8w==
X-Gm-Gg: Acq92OGQ2fSKYkSJOILYyB0D3O8dAjJevuifg5SK+QM/YRA5UdSd3Iqhx0ktXMx4HyT
	veLfBbACasmQd52F6fZ0hVvq3JHCQ6HNpu8dOEoU0Qzi5ZydzbojUGTpscLgHYXFJ02y+73jU3j
	I/y4fp/oMFewATVOgPzDnTKQRm7uwXYywckFPLJr89JO17RLrfUO61PELZEMBJvEOI+o/UzYncj
	+49yDuCbfeR1gjyPJjFXGuac8SUCLY4kwu4Qvp2/0z6FIRHCz6l8nmXoI/vLxWYRNoTeOSFMjp3
	Q9xRwdfARyrTh3qxeroKH4srM2JWMIg6fU1+rth76nYeXiLWksXL7ZhQYdZIhYmgxjUbJbqGI0B
	SXTXJULb2JxqOgH377eedGjeZ4y2f9XjjhRa0k/e0Ev9YLd/FFUEb8p4oEYQZKc01HPty
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr17238698b3a.36.1780939248475;
        Mon, 08 Jun 2026 10:20:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr17238658b3a.36.1780939248066;
        Mon, 08 Jun 2026 10:20:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:20:47 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] ASoC: qcom: Add shikra LPASS RX/VA macro support
Date: Mon,  8 Jun 2026 22:50:20 +0530
Message-Id: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX7fUWHKnUW2Nd
 7+AyfHnoX+8IrHmU237MupbWD0kYjGeMdzUUySMX/9grFb4C9jMSfDvTysyi5iY/GHJ7nI+hdCD
 S2uhvPkvw++T2y7sMutbif9wuYO5oWJRiPbCwD81pJhWATD5TP7CFNV1ZYntvNCUA6jwiI+kB9i
 Zkhv2NrngdIcqG3LuxFr4JkyxZwo4akkauxGPgZ8XAJQnxZmBPUjSuAgbq3sizf9BIJokfQYdNE
 BLVb+gJLYAC/aIvcd54K53KlDH8wco5uO03VM14iLSJzXIO9sSNaSXOg0VaPsWFcAkASoclhAyB
 dKia7KQFPYKTjIqV/Rs43qu6fe9MHk2TOk0SSsIiQ0ixoSeOC2ht2AsiT3HDqlZOOq1HdLoINdA
 cGbef8cfeHfLFhEVDSJvrJsVgRLdNTPVSmhyNMIgMhOsY+Yqj6qmNXMFhGaUB9AC9V1EwscA3eR
 dxSpdrESs4MacqhQIfQ==
X-Proofpoint-ORIG-GUID: -o26VOux8lCAVccrzgfylLeVufyGXRRx
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26f9f1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=433bO3dLITp610D6LnIA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: -o26VOux8lCAVccrzgfylLeVufyGXRRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164

This series adds shikra compatible support in LPASS RX and VA macro
codec drivers.

Patch 1 updates RX macro handling for codec v4.0 and adds the shikra
compatible with FS counter bypass support during MCLK enable.

Patch 2 extends VA macro support for shikra by adding v4.0 match data,
a shikra-specific regmap/default table including ADPT registers, and
ADPT and FS-control programming required by the platform.

Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom: Add Shikra rx and va macro codecs
  ASoC: qcom: lpass-rx-macro: Add shikra compatible
  ASoC: qcom: lpass-va-macro: Add shikra compatible

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |   1 +
 sound/soc/codecs/lpass-macro-common.h         |   5 +
 sound/soc/codecs/lpass-rx-macro.c             |  14 +
 sound/soc/codecs/lpass-va-macro.c             | 276 ++++++++++++++++--
 5 files changed, 276 insertions(+), 21 deletions(-)

-- 
2.34.1

