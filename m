Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CEE1EB182
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605115; cv=none; b=N3ocHT83VrOTwI0zWcAilKFjA80Pld7aZDiLw0d/gE3CyuA7wYfRK22gkKcIQWBfnWmKoNFai3Sv2VtIV0JmsRktI3MjFocnnnEIQHRwv+ONnxHyxFKZF8MKyqJLBgOV9lDzTcAbnVCFCciFwm37AkeqTPr9YEEPayZWnrgIJzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605115; c=relaxed/simple;
	bh=mOh9JSF12KAgNeLKrysjhxC4RG1o5eujRw6xxWhT4tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QaAC+0oPw53+cHH2e5HkR/V8d/lX8KduWRROvmAxZsHe1i8iTqpD5Mn22R7cZ/nF8qaW98mzNzmF5eIV1ls6I0sHDEHZOFGR/41qSpfsGVmCu5zWMTjkGTWRY1zPknTCm6XJ+tA+gBqIYJFDS3rLB0EXFQ6bONvs0J6SoiFW5fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQblERF6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQblERF6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R5uPSC004871
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UkkP+2zoex5kty2tl/9eEmLK71LbBAa/yiJ
	a2uZkD3s=; b=cQblERF6eM4d3QW3HnNX+BbnCrxZ1QbkggD7Ruw88RdJKXlGG1O
	jQ/as5ItS8lrVe4iMPtqOF9g1aWDdDo7EcsVAFfflWudQzLTz43j72+uz2ABYuOi
	c9mTtQQJR7mG5ZlrmNtNiLfBT591Jvkg/jM3ZcFQSRmAlWzBZHjRgvSTvhEkNZTG
	jf+MBF+GxhFa7LHgXEk3qBwUIXp3W4Muve6BHKeWXKi6D4F0B9W40O2AyHvtzbZF
	GpHFcXSAOxFOeBTtRwx4+xvx0cSvJg+S7nP/pS0m3ZBJm0EuK/dIkNUC5n+3qZ9k
	dRSSnWz2CwDb8bKauoFXEkpWhHsT07kc8RA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1a9wc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:31:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff6e5c131so3575955ad.2
        for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 01:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605105; x=1754209905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkkP+2zoex5kty2tl/9eEmLK71LbBAa/yiJa2uZkD3s=;
        b=Mi6DYWVlmOXZ6KB61vu7CX+7wmBlGnRfl5EC2A4XMOEDmDJSkEqDck2DPP1Itgw2yr
         PZ3sawju57F9gCaLwgb2PyltNhch+Fue84fjkgNJRGCd60V7yIbCIfLH8X9je8u4WQDd
         CElYgl1ZxmzrKFip2PTMYEFcoZX5GjaEB9TLtblkdOAM4My3gMOeXyBmpH6a/TCXmxl/
         hDaTDLCdzzUPB+7HOEJA8FBoq6MjwljItyDu5iaOgEC1QPoUrVNagdiHtEnEaGRJxiEk
         4PpIaDqmDXh03ySG0IOf9HG4xyj7jvOykdP41quwzvBuEMKkj50+GnGgDAAi6mzQehWQ
         xN3A==
X-Forwarded-Encrypted: i=1; AJvYcCWomX0v+0XqtRqa98/FMrCKq9gvynilMZNwszxLe2DkarU5NLXKLjhw2Aumf7/du1ij+usgEs0m1anYFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Yjqn6Tdlxw0kaz6qETRACpS30uyAmFad5pVy8Qw1BOYqxj07
	eCER1pCRUfUQE5QMU2heooKlKz9coLm6Gea2DNMTh4VwApCHjC3TjuKcMdUgKl9O2QuId+SWTMi
	iqDfzp3Nna+vQWsf9ll8asK/hcqbzLjHJsIIj28lb5ce5yaxAZZcp2xN9YOtQ9rw47Q==
X-Gm-Gg: ASbGnct+VxkjqpZ+b3h7wumCtJbyUzosCtFPUNPgUTIy9dEmlpKcrlMPHoW56g9nJeH
	38ESKQa+EaHAh7EXPozGRZ+FSOm2OhmaHtPad1NOASL7rixNUfsxwk+uJGTaWhlFvltnoqxhdSJ
	ozipuGHby/ClGes5TGtqZNyBmnPtu7y3ja7+PKRS6p7m8/6OGATR9HpMhyyh9aWxrlxFt4/B4cp
	L5U0bElrnPhRrK+59P6SWDuh/0l92PAgYARy9sQ+0ZGfWc4Fw6vR1L9X9H8c0TMMnFzGd4m/NdH
	up2+s4vMcY3J/qEIK3CDEA17LQ+HDdHtOSnONULAPso/lUpPYIuuILUJPabjHV6hppddq2SLXiY
	/
X-Received: by 2002:a17:903:46c8:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23fb308523emr119243915ad.21.1753605105121;
        Sun, 27 Jul 2025 01:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalG+mHbRKTRUIQDZWr2gEWXxh0RMJdEPGdsr5c2OukHXnD+E8VZ1SQE45YkaP4nrQTj3/Yw==
X-Received: by 2002:a17:903:46c8:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23fb308523emr119243535ad.21.1753605104705;
        Sun, 27 Jul 2025 01:31:44 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:44 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v3 0/3] Handle shared reset GPIO for WSA883x speakers
Date: Sun, 27 Jul 2025 14:01:14 +0530
Message-Id: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8k8mq4XqNaaeYWNP58kclqEaGyZPTauc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfX93fsMKzqBeQd
 v7oayafOoxEcnIb8vxs9Lm7ApUFlAA3gZuU8bIreitV1siHaeM62CtSbNfjNyrJeNOJkfMZvyBr
 WuaZOTRFfCFL5JoIlK0RhJz4rlqn137Nd3aMECOvqyqo+MYYeMgROUkCwkqKJAXpEYpFWpRzQrJ
 hoLKn1uAsjOYgA5OgdWxfurHOOQeCTWpju2yfogE0XCewrYPfQquKZlEr5kQL15OsZemDTd015Y
 ELdJMw4pM+tltrcEj9tLn5CnAFAA++hYOUiXOVJWZtZ0HhWIXxxCYKy0+3XGF/LeVdvZUWSDGkq
 dmBx+wtt34fqys81V6Mvsr0PVVsMDddKwfA38ETiAQJhn6/rclEIUu1pNcJYKQhoiafemVlIu5Y
 hMEgR9ok8PXn3L8Il1XLNoXyewik9CJJULQch5tzzLK0j1EfZ45SpRvsnqbMdULmRFGvdS18
X-Proofpoint-GUID: 8k8mq4XqNaaeYWNP58kclqEaGyZPTauc
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6885e3f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4I2HGNnryxoGv6TmyWEA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=730 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270073

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Add devm action to safely disable regulator on device removal to
prevent potential warnings from _regulator_put() during device
removal

Tested on:
	- QCS6490-RB3Gen2

changes in [v3]:
	- Created separate patch for devm action to safely disable
	  regulator.
	- cleanup the v2-0002 patch.
	- Link to V2: https://lore.kernel.org/linux-sound/20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/	

Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Add devm action to safely disable regulator on
    device removal
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 ++-
 sound/soc/codecs/wsa883x.c                    | 93 ++++++++++++++-----
 2 files changed, 81 insertions(+), 23 deletions(-)


base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
-- 
2.34.1

