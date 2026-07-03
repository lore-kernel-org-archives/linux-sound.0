Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58B35B63B
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 07:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064091; cv=none; b=dp1AwiBt5MkEnE2wsXSDOvnPVy++wPxNU7YZEryrB0u3csYKYePeMkJHG5l98uG5N+CFCoGidHObJD70/MfvOwt8vlvXYFv7q9UzXUF2Uadt4sNdQxCSmCRCZDzTMfgd6Yf0JOaSzpT0z59jvKY9G9QO73G3JWADfz8Itc0TCNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064091; c=relaxed/simple;
	bh=eauUBeRESJvunQL23izSm7fxSNDrylBGuqp7cFk566U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iDxt6+R5uhIau06DT76Di9hdm59K7pks7ibGngY8erERYpKz6aRum1dQV7Cnjk+cCUmG/QkQT11CT/N+NoibeC3bfpuZ0CfvJwsiLQ3vMxntWu9YmdE8UYtzcC8k7t3745A087Dky5XWy90wQ9pX6sUOpjDAq7QJxJFUC92YoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0laT08N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXHqXhH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0laT08N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXHqXhH/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636846g3053370
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 07:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0Tz
	eDf8erJg=; b=Q0laT08NyimY/Qfr8Mhm5jGuxmePCQLZSjG7hoeWuOAijhPz5XT
	OMncWBvE/i6shCCdbyi9eiy0kLhPYH+kqVmx5V4KgqjHneJI7ydRB85rTxNj1XSm
	mZ03AJQs+IzO4s7oramstsZVOfpsryc4lRKFJnAIkx3NdmN4wi8gPZwLZdUpG6Hr
	6fF0T1TUVIChSo46Er341RL7bFl3wd0+mLi4Oq9MG+tor3qitq+isI1YXMSKWu85
	ZyJz4LFQaVnh1D5HZt7/2eVUr708YpVjEo1d16LYAbpl0RbWL1DmUPIVRBaYc7zx
	QccpDr8O+YsmeMqhDp+QVmPzdyu2P96SjQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00avv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 07:34:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c8018f11fbso3333315ad.3
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064088; x=1783668888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0TzeDf8erJg=;
        b=FXHqXhH/HxG7He5i56S1nvr6iLMf8MPhCtR8sUgL+rgY+28v8tSmn5y2RbPLfJkjic
         /zqkqwDWH0EIyLK7DBXN452Eie3Mh/gXRskVx5Wf7HXEoOsmJTy+mA2gyzOkWMi9wFL2
         zTmR4D/genWs8dm4FpOm6o4lq8ZhQI9qRfTTQCLmnt4KdonKBiizIRIj2aeHXVQlxePF
         7MEasOS+Gtsj63gIlIqsMLuk75oxjuGFx0lDz0urWGlQTEjBEhG0tqeBJv31901SaJVQ
         wsBOFh+Ue6fq7icRp4lYDSPUZ9xabdQqgylXX5zopSbNPTo/jO77xNg4yD73TCKpYIGj
         ippA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064088; x=1783668888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHyUhwDmcLAxlYD1aeefz89XCxrIqpex0TzeDf8erJg=;
        b=dGFqLe4KF7YZKolCgOWNFkeBXqnP+hG6suB5H5XCDKdqpNXTHpKgCLFWGNYukP9xMx
         2yp7Cr8KwmwJlMBlEC1nQbSvVshiulI3hfzJNzyCPwNemR3EDLgADMFLvuYfemMiqJxi
         s0F4PAleRbDFr5CoYi5b+zycbj1y9bERBW+iIBVpD9QWQifCogoD9mozSa+wz9Jd2LLI
         RBtj4MpyEEbzWhTw+J6UX8b4kzUGUutrSeSO/3slXqLDc++ui+flqFaL+yDFfVddFCSS
         10tcuXYK3+EzUbQYcL6rpbM+rNJPlCnRSd0l+NIiqrk2zdzLpWS9ygDzxH1UN+GkDbEH
         9fjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+cJ8NfiwmX4/TqYew6izY26U2+sd9acS+dyFu0YMpgPKGlKvd+6fbZSsCNXd4BEWAglAxHskk5FlqVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWTOqNtKTNqfS3K/lhjvekKIOyn3rexz8LtFBD45k4PItxlFEq
	wIUBa4v9XvBg69KH+KPluFG0FUmb+ViCTHSOOiMZ2jgsetV4VH3uo0XYssEWRjqiuKzwaT9uegh
	JcL3+3uegdcVGHMPbRkAuSGa9aGim1oBlCu8yRGKCl8u/xIpG51eUxLS3xp0lahH78g==
X-Gm-Gg: AfdE7cleyN8r0D2l3w/WtTRm6tBheVBl4IJQZ2yhm5h3iXxA06pED0K8YMAThO1a2lE
	Tzfd3GfMnukwbQetSUmJs7sQU1cyqZNI0WrJb7qL7Z+nXRbyqNvvwz0btNLoiNNUv8UQqArzmuS
	GNA5k4pKz9qKWtRqIOrxtSrC38+ztOdpe7+SyLJQ9wmwJtYVFS7cYsoKmM/dbcY0LJkEGwNUuZx
	aYU3t+Mv5HEdm7RABEawKWOC1e9AqQ3sR3MXi+du1j2EEcpfjCl7hIAmG4u0dNcXiYNd802HXbS
	l2n7s8zt+B3ls1502q2vVKMo31sYGbBm4tI8gXF+pDsRfBfrzBNqogKgcQ30mtcT5Mzu8ghOlxb
	63NoriUgrAVXY8N/OOIKsPP85Q5aAfLd0WZZRBctg
X-Received: by 2002:a17:903:32c3:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2ca911fe692mr84498665ad.38.1783064088272;
        Fri, 03 Jul 2026 00:34:48 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2ca911fe692mr84498455ad.38.1783064087753;
        Fri, 03 Jul 2026 00:34:47 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:47 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: Add Eliza audio support
Date: Fri,  3 Jul 2026 13:04:31 +0530
Message-Id: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UMS8a-OwbEwxan_lcUYvOOVmzQXUi9tA
X-Proofpoint-ORIG-GUID: UMS8a-OwbEwxan_lcUYvOOVmzQXUi9tA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX/Y4WH/SMZsPI
 mWEbDuhdjWAUpzGbaWZFbvMK5fslzKlHy81wrXLqTS6samLlLd0vaA3HRMB+7QOZ3zFR6jJBXfA
 CxnWUD1LqjUcXqtljxluBhh6aSWE2EU=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a476618 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=TcntpH_QWam1UtUSv7EA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfXxT0BAuKs/7te
 fyruiCrq+XB/pEtTC4MdY5BiMRJi5Vyx9I6y0pwomLkGDl3GubbUS+sY59XCJKxUM5VpLIGFUQ2
 dA1D2EeYpUyBJTXAJMoXRa8TC4tfs+Z8HOSbyhqorXgvDqX6Y3Rb25tVL+O1wMb9n7mPOsfiTUX
 Q1xJTQ62o9MeVWoWXg3yZ0SC8/Nl53tCXh/P+zleS0D6VM7mQEJnCI62eMD/L7mOEXLjtxIhINq
 Q5nvjxSnRU9euSoI0hhH4x0n8FPNgW67HNYBydeoEcxy32EwmS0TKBpBEL/reeDq5lo1kPdvaHz
 xWvnVf9Zezmf7wh0ZqTvtx/Ig9nTwmq9CMlEatmjgu6vE8uWcQtAex1zwcitRs3bIGIcRO7CAgk
 4JoIMraG6RTU92OPkjOhiPRkshs78GYHVROjcBCEkvSc0Rl0IzAUROlE97sdtF4T9FlgPO4X19Y
 FZlMGbuzLDBhNJvmidQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030070

This series adds audio support for the Qualcomm Eliza SoC. Eliza uses
the same LPASS macro codec hardware as SM8550, so the existing SM8550
fallback compatible is reused for all four macro codecs (RX, TX, VA,
WSA). The sound card is compatible with the SM8450 generation machine
driver.

Patch 1 documents the Eliza LPASS macro codec compatibles in the
dt-bindings for RX, TX, VA and WSA macros.
Patch 2 documents the Eliza sound card compatible.
Patch 3 adds the Eliza sound card entry to the machine driver.

Ravi Hothi (3):
  ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
  ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
  ASoC: qcom: sc8280xp: Add support for Eliza

 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml         | 1 +
 sound/soc/qcom/sc8280xp.c                                        | 1 +
 6 files changed, 6 insertions(+)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.34.1

