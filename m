Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002120E002
	for <linux-sound@vger.kernel.org>; Fri,  8 Aug 2025 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754631027; cv=none; b=YOxWCEWu2abyOC6Tavq7IkbUBZ2NORsMjkpETzdVpW5ahzrrk8ndXJqaP5jwlGxuSJr/gK1fhq2oVgbLsBt9OhtdKkKl3LhvXdGe1jBV6NEpOULw7fK5clBEYV0uQyhnP749BCcJWlvFSudChhEXS/zIY+zGnAoZBm0LWefip0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754631027; c=relaxed/simple;
	bh=vudh6ChWfb+QAp63DxN/31q2MEqtFSevu7JbiruqA44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmttMTNN1c4q/am0OUTmmSRfIviX2hJhRv7Q84kZ+LEgUzCnF2zkKoqJCWUhRuIK/3Z1WWO9IMpJVRg4ValGRKjKgWuIVOezt8wfKFbVnftupUCBL3EgfMH+7tB7kjnujWmD8DPsm6lfUaRNQfspaNqyzd4rdpyxtypKEvykbBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBn9bP5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBn9bP5P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577IYaaw025030
	for <linux-sound@vger.kernel.org>; Fri, 8 Aug 2025 05:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0/NbC6Dz3I
	Sr1wnPGqDAmCICjCJoiyEDtY+fN1XBu8=; b=WBn9bP5Pv6wjkiTgkiMnxIDcsTK
	iJFDyvg4NcR5yVnOo7RRjGMl6z5Nlo7nnL7uiLP+6cFhl4QUKqiKYbx1fDSHWZS8
	dsp6IxyaHZ54eCAHrmAAkyChQIg+vQxPN+LA6HbFwFFs/17OoERFqu9pYer8oDql
	E/vF0hUYxFYK3VIGDc0ydL4ERlu7X1avjGfy05oOYcVySm2UbFs44/7SNS3f4+7u
	kV6smLhpOo5kZ0s8RraDxmDs06K3RBfuhXotcV96U6/X28BFc55byHE/2fjzL/4S
	JEhwPfET5tX8BjkQtZ7sacigyVVkee6aJJgv44A0VKxFoVOru2dqi383W4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1gkm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 Aug 2025 05:30:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bb326ad0bso1982098b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 07 Aug 2025 22:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754631023; x=1755235823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0/NbC6Dz3ISr1wnPGqDAmCICjCJoiyEDtY+fN1XBu8=;
        b=dWM61NcIbNZwn80qY9XN6KdCustrPPMQ1gFIzA/IW2EUadwxwj1QLNNJnaoYx8yBqc
         0AgKXIbxCZUclFl4AkNx8GJ7M3I7vZGgnUmM9YTO51bgtFzI5UEnOrSZ3tP6Udz1MIaK
         z33dweT62kisH6dCLEnGJQ73U744Xn7adJTkNMwI9cDuDud8p6L0EjPj5FnU/G/mGHMb
         EEiWG2Kwal5tFkXliwBfjomASGp+ExvmmseeSRwHfFMzOlXR6NM4hYTkxJ+CseWPNGNv
         P/miuGAsa34d6+WJRp9rTuiaChdjPtPy2+ReTmnj6B0c8ZPhqX4FfPX63YibNiDVnZSn
         cjQQ==
X-Gm-Message-State: AOJu0Yw/nN1H77bjscCZwA+/uDe6DtHPBtEEcyETmrO/U8UpCkbVLy1j
	85/0yhARAwJY4GtFOTKe5xUobIfdIBkpsmWnzy/Vq8PzQ0xAh2/B27NZmSc/wVFj/DvtgD9joZ2
	78YoWF/1JYkQxMEcMhBtjAu4RNQSr7J5eDIJt6IFcFS5uAcB9hhF76AU2F2tFDpRs8g==
X-Gm-Gg: ASbGnctqj9ale3f/v7L6ewu5oID8TpH6aOo6avDD+xvTWPZjkB4002kCf4E59LN+zIu
	UNZT2RUWsubUE7EL4nxrujPkRx6zQjZYdgNSSz30DndEcyngGZPyH91dr0VODyLqzX4f2HgkbMp
	FYD0CKay+RFSgJur0pH3wJCBxqhmV2nAvKEmdH1hCMa+FtlD5pDdOZOiedqMW8EHQ1M4f/RTb8z
	t8S/DAQHzeNai6np5gMN8fhHOtxjLQMsRKQupxZQldqw9rK8CJ2E94d/4LejsdhvfTt+5ua0jMD
	/kNls9Zi/HlJ0CA4oZa41x0ww7FbKQi7S0vMknDPQxWNH8P0eoWIsriCQwMA1SzVgLFMeUHCXsJ
	K
X-Received: by 2002:a05:6a00:3d4b:b0:76b:f260:8614 with SMTP id d2e1a72fcca58-76c460ded44mr2946496b3a.3.1754631023406;
        Thu, 07 Aug 2025 22:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE322Xtuer1nSvLoooPflfHEOze81sggfs2Qy/lSDwJaYopil6xUbkHvvn+WnhQgau0g52mJQ==
X-Received: by 2002:a05:6a00:3d4b:b0:76b:f260:8614 with SMTP id d2e1a72fcca58-76c460ded44mr2946439b3a.3.1754631022958;
        Thu, 07 Aug 2025 22:30:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f483sm19278662b3a.31.2025.08.07.22.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 22:30:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add lemans-evk and monaco-evk sound card
Date: Fri,  8 Aug 2025 10:59:38 +0530
Message-Id: <20250808052939.1130505-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXwY/TMHKAWqgw
 NdSMZz/RRK6cUF1u+5VRNB/wBg/FfV9Yl+SXWryjam609ypkdBhr768gIfKW+GlgpbqSdSGmpQW
 Qdc9kEdLZyGf4OjAlYCeUDjn37ErxJftmpcTVxJyuAQfHmqn965Q52wVDEe2V3GKlnwAXKesUqZ
 S793UCEWnNJezjkfwtPPg3OcmsCDWAQr8ILGmtM4kii39a2ILYNGQNYFIHzQc7cc7qyM2lmQkq+
 g0hDBBfQO+4AvzMMZjKEZQ9uk6dhVEelbx6Ang5j9tZM/np9fZUBHksU/hmPCnk9wJdvFTLDz7M
 f7L6+VYsC0j7d5fcAbZ/Ze0zafjJg7+H4yk7cqXop4+T+evoCxT1rTTHy6JTsxQBY3WtNZIysVR
 qnveHi+D
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68958b70 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=kbphIXzXdx9KadpZM_wA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uWqhuW8goSGc_VHKd-UIDTNv4H10yaUr
X-Proofpoint-GUID: uWqhuW8goSGc_VHKd-UIDTNv4H10yaUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Document the bindings for the Qualcomm LEMANS-EVK and MONACO-EVK
board specific sound card.

The bindings are the same as for other newer Qualcomm ADSP sound cards,
thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
is separate.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 5d3dbb6cb1ae..c63bfe031b57 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,8 @@ properties:
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
+          - qcom,lemans-evk-sndcard
+          - qcom,monaco-evk-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
-- 
2.34.1

