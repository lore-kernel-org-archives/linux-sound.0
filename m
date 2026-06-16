Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01651384CEF
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640893; cv=none; b=peLVmZOtWI6bxYBClYD8l3d0nC81aDrprkcwn8yHN3jYbYN+3tFE2uASuVGvdqzzgpepdzNc8Y7CwkXrKd+7bxBw4IbQnqoF4cCz1lcsNoM5QLz9taaOuqTniSQ71lbUz+rDIbGFv1KEi22iz8LZqtgtYONaSV8ehynza9+nMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640893; c=relaxed/simple;
	bh=/UEGMwZc7K0TpFDTh6unx7m3NV5lThRr1LpgH4Pt5i4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sXfPJkmz8Y4k4P8b8Oxe4rJBiZxkqCRSMfuoK1Hcq+PbbU8v/BGGNVTfRAlfjW+X9mipdyRdC4uj5qEILJ+ZKwm3gnBR0yLFQvGW0x1g9ena3f6BB9dYBY/f72APltBHZWxXbmp0ZTUUjq3jaGZvKgc2M/aA/1FiS0LvAhXFPRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjXFRdKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEiAnXX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjXFRdKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEiAnXX+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOVli1376814
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f3PU4aei7FQDBxFDjwv7YG/ciJu4b/LVqVJ
	dzRxaFbE=; b=GjXFRdKg4zRsNoCd+gIAvyC1jev+vuuoBQAYDthf+RtJ/UnYcSJ
	l69TlMBTMQl/KaOuEykYAVKNgaAER/Bda57TxomYdXc6+GFfOxExQwIaDC46PMto
	2gpHq+YdcVHfMmmYBe/mupSLhEfVfcenXYCVvwc9DhLMmJP3YvxK4Xtk3QE2CpB5
	y+B8FRfngjCjIZYN1ytGd6YIDXsFjsnMkl9W2P+jLWqVZuD48rgpoKtJXkiDymcx
	pSRP6CQDZbVVNnPwpC8pt0CiMjclTuhKRaVkln7KI3HLoWNzeNjClsu4MzMmPLqx
	DVA8cH9Y57g+ns82ESl6XhHWmWT6/Xe1Crw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsba9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso50566055ad.1
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640889; x=1782245689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3PU4aei7FQDBxFDjwv7YG/ciJu4b/LVqVJdzRxaFbE=;
        b=HEiAnXX+zAAoBrscfRUAqAx+f0FR9BhbEYGH7d/GgzjOGcilTz0cKuXVe3xD0+n1YJ
         GCIbzTcPgC3rBhGs4C7fr0mNYchhoCGG20zvawpJ4Fg4cnb3IHZhe9WlhNHuhXf2ZBAQ
         UM6VzFhZrfgk7kCvCdkl25y8s2s4TYE3916u5ETvHrIOfz8g1rdhQe6rVKnb726xzusz
         B5iMfhWPBfpa5jnL63DUyikRgSF96aAOvd3hpKPz6zK/g0fw57T0hMHvfXitD50ve3Ra
         ln7R5TIXdGxZKOoxLU/NUE5xmtntcNoY7XK+qTTqvKvPF+EjBPNTY21QXmXNeV3IKL/5
         zs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640889; x=1782245689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3PU4aei7FQDBxFDjwv7YG/ciJu4b/LVqVJdzRxaFbE=;
        b=YXIsNlRud2F3CxzJUrnTJouwdeGXLaxUeTdsPLy3RnUjTdXZd2c71nWOP5yuDNn79y
         qdEl835GZEUeaF+K86bu6vwb+0Dz2dgtXuDpMTE2YtYiP3kNjL9WOrKi8G43cuJFzb/Z
         B28Y9um27w1lYNHrT+KnVXRs9raDL4AVR/Ql42UB5Ca8SLu6trDPbavItDwWJOMQIzyG
         Q9+cRY3gzgyETrCi/xPF4SDwy7Sp1TOk0Fjo/pI9Tsm4APuz1P7eHD9FsE/9RnPbiMaD
         sPt4G/TDesgqsoRXN9P6z2zCZ84RsdnvyEpiFOCYPvdr7IqTVVuYCMq8KknqPUNNcO2E
         CBNQ==
X-Gm-Message-State: AOJu0YzQAzMDFsJPViGZtsPW8JUSvziGukqvpOywboF6jRryd/28DTbt
	H1nvwnp+v8b2kdK5lja3PenVGK91rh1uIBrod08fqBSEC58Z00xcHT2ODoG7hsyur9bXHym4YYo
	N3f3y5JJajmf99v80m2r1yyBpxWJcAfdVPmuo3/zkhvpyyKpSbViLmLl3KjwQALGr9Q==
X-Gm-Gg: Acq92OEWJv7tyXxowxeh9vh5PTqL6VBVzLqcV6aSYyKHxmL/L3vLJYAO1YghJEAVV70
	BAaoJY39r+eyiztmuHutb6LOOMMMz6k7zLnRCmzf5dcxpZ3wlgtR5upVqMnQPua96zPIP0bUr6b
	Ju/VN1HLoE4iPZV9EXwk7BVtaNZdt2q6EQpOJNXj5/9U/rxBBm6nuVKhVYU8bf72HDYDWgC6i+L
	sunnICRV9oW5HZdFyliqrFleaJe9v1df5dn50ZFILQgy+S+f+rks4QPmLFDqJEbdYZqN2oN6dGh
	dEhD8ppC4yyEI910D1WyGaOQcnKnSd9aMnejIsIw1bMxXHDnJoc9r2Pf3VZR87rOA10f8v4DEAE
	TKOFcvizO/xhung9wgRXNmDCjtOdBnotEE7Xz1mZjG8YMo8rKBLOUm/vgYw==
X-Received: by 2002:a17:903:166e:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c6bc0ab997mr5131195ad.16.1781640889353;
        Tue, 16 Jun 2026 13:14:49 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c6bc0ab997mr5131055ad.16.1781640888885;
        Tue, 16 Jun 2026 13:14:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:48 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/8] arm64: dts: qcom: shikra: Enable audio on EVK boards
Date: Wed, 17 Jun 2026 01:43:07 +0530
Message-Id: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v3nTg0LGLWTllDRH0pN1tsnlgBvqYcoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX1wiri4zAEBjB
 FobViLN9OFjjc6XsB+Iw+KXydcIv303HT4BugLvflMPfkL8HDNNhc8x4i696v9tPmwBXBcr2jYB
 9FYNgwbmXIxx2jW+MVzmptJq2+iw09syK0skDc9BSGJr0TsoO4fXgKZlLmjvJSuhLZtXdpJTn7J
 Gd+KBPJCcfDH6rJNXUG/LWXXaSCnAk/H3KDNaPmrWPSMpstZSr1ho0msUkE0t55cng64MzfE8xY
 Ufc/88JFAno3vX7ZdIzYzkRqdv2OPjAifwiwfy6bYqYLEYBcP2ddkilN2g5/9RV4XKthkV0lcfl
 O2v+MTLHNF5kupugyKI8ZuWais6c6IQu3NApB+bq763RPZKmm7FOE0fc+oPd13P1AvldUMoOka1
 cvFga7pYgFNoD/tM1O4uuoU0Z/y0R7L2HX/t/LBLBL+XNMCiIYfP4/B8NqaQeq//z4I+KYVqKjT
 eWGTzPg1LHRMxJ81wZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXwgjY9C1j30+n
 2P8X+DEPYd21vmfzy0t6e93BDK3FV7npBInxgKMJzsIEalmV2pljnOFloRJcz/R+ced3/gFvyGF
 kkuzQfodLGIecEv+ZW98e122XX3Bwmw=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31aeba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ocK6u5s1opKHhBkIzIUA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: v3nTg0LGLWTllDRH0pN1tsnlgBvqYcoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

The series is based on linux-next plus the posted Shikra dependency stack
(clock/controller, bindings and ASoC dependencies listed in prerequisite
patches below).

Patch split:
- 1-4: SoC-level audio nodes in shikra.dtsi (kept disabled)
- 5-7: board-level enablement for CQM/CQS/IQS EVKs
- 8: arm64 defconfig updates for QAIF and WSA885X-I2C

Mohammad Rafi Shaik (8):
  ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
  arm64: dts: qcom: shikra: Add QAIF CPU node for audio
  arm64: dts: qcom: shikra: Add gpr node
  arm64: dts: qcom: shikra: Add soundwire and macro nodes
  arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
  arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
  arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
  arm64: defconfig: Enable Qualcomm QAIF and WSA885X-I2C drivers

 .../bindings/soc/qcom/qcom,apr.yaml           |   4 +-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   | 222 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   | 149 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 143 ++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 256 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 7 files changed, 780 insertions(+), 1 deletion(-)


base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-patch-id: 39475cddaf673b2cbbae703165a782916f199885
prerequisite-patch-id: 6f7f265abfbdffdc0a1fdc5a7e08929e4eec5b7a
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: 003035cc99f02794043818256ba0ef657872d511
prerequisite-patch-id: 5d23c938843176de2a02987d2832f31fe5df7fcf
prerequisite-patch-id: 430488f50f36039338965ab1fc28d83f02dbc9fd
prerequisite-patch-id: 359ddad8a3fb36f171c96da5ce5ffacd7dd63e8f
prerequisite-patch-id: a98885b9d0e0655bb3161dc2c31fd92a844a5e4e
prerequisite-patch-id: 80aead6484e36f52cb6cc7fd7d9e0326d8296860
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 99977ae9253a961b85331b9808c1feff0c2cc38e
prerequisite-patch-id: 9e3edab83e9fc008b2dc254fb3b548ddd8f8b5f8
prerequisite-patch-id: a7706e25f5951ec41e6b662c1704df8d20662d77
prerequisite-patch-id: d13035abab3ff342753f5bf87b53bbf06a02c6a1
prerequisite-patch-id: 4d40e704139dc4b0ec2529c49f096d86a4e4dc5f

-- 
2.34.1

