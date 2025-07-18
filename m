Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C142BD00C
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835614; cv=none; b=OMHff/oCdkfxZ2QgtEbrW9tXQpjuAqSvOWzxBvjCrR6H7jzMAUQN3AIMIRZNjK9WmCjedfsI4XS7Po+VplRbC0N49vU/15IaEkERy9SLWIWHoBNNZyl1cjUpfyI/I7KiTiMAnwW6HQKiaNiwaafW8TyTb8a7RUdcCjT2zgCE95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835614; c=relaxed/simple;
	bh=ZCzgqQ5wClK+CpOspY0xkNzERE+nZ0OAJ4Bui5yuNYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IEd7VDqxtksFUOqk20eP72XtooSTr3EYWhjK84cM0mD8FpFed62pVcTelOE87L9Rzw9Rwj0SAjRdhQaSZ0ZpwZ5+NYlNSht783MPX6RzBAO2JuDqWOp5Cb8fDKjevnBnJtzqxmfHpNu62Yz9w0+8CcNw8JsHG87fPSz3gXzil5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2Km+4oP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2Km+4oP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8U4x7025183
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 10:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ii7gkbQDsBKlsIJbbjCqaJyes15tBplO58P
	17UvUF84=; b=N2Km+4oPwfjpujrdM2mZ5jUpTNJuE0rWP6QSfUbBFuau6XKkLwc
	nG8KQ16CcGbpEwVptjno9cwKyk40YkDjgQzExwu6MW4qCarwbhABvOOPojVwlZnQ
	ieuOtDe+98BL78x58lW1NdVexVM8XB/hWzpqfaYt1KWyECZfUPrpXqifqPghOovU
	8+VER+xCszmMJXwaNR46NW0a9yjc4znlpLnlq0JbjnM1/mXYkn9WyRsRJon32m4W
	8FvFBfIN08vHnpp9l8LrhaP/oKBmQsJQvdphm6YSvmc7oyae5hkJtXmDiT5F10jU
	Fr9sChhiYHn5p1S4wSvfZKZ/6nchUY4l1Dg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqfck5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 10:46:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso1946938b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 03:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835610; x=1753440410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii7gkbQDsBKlsIJbbjCqaJyes15tBplO58P17UvUF84=;
        b=GHl+OJ34NwjI9OVuE14bKZIP8bh+37r3grSK84TRwiJn3alJDCxdMu2U4//Tmfg2og
         nG3Xe4ucvR08BjAQlHGBCcUjfV/dOpZixyvqYraSQBtT5qjq5tiieYaNzVbFgGWBq9V9
         CIbr/cmPv/nyDXr5nlFjPVv1IjhZoeWJ6UTAdFid0iC/PUuoZjxQxIyEpBr70xMjp8gq
         8r9g+k8impyGfLahM6mBApDiiQrokYwVwio1hk1MQnSeKtQ8Ex29MByTzFZ2vzWxyPh7
         QzlD3CwHYs1Ms46q4+N0cCPDbWG+1Rlad0U57l3OHxlaEquGoSuWOVWTc5rXatPgvT38
         RwKA==
X-Forwarded-Encrypted: i=1; AJvYcCXPoibUcyW/ALamIc//QmKc1Gv5ERIlgrmLA+r3pVjXIg0mnbWv1DX1ZISpu4RJGXf8CfTUCzK46/YPVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqACd/6Rbf/SBvPFjaTPl7WqxOhhoBE4IVzt+mxk3K8sncU0A1
	WF9JrDYEyJVsOXXiXKrU/voz5KsFYoeRCk08gPHSpLD7Qa0rHKEci3OPDKr5nDVTfotasn3bh2Q
	Y9luOyv12IcNMG3dEiME4TK8nZL9gOiMX9OIJfe13JmxbpA5v7rPZcreqbotgv+NADw==
X-Gm-Gg: ASbGncsdOD1LqkQHEs45GAoVORCwwIeRVXEVjom3jYacJLEIlNZH9ndgD6yD4hqlvAj
	i5+852Sy3ZcG6eGBaXEmQxn0R7w096r+gMPPyojssgX19tvt5qt5lE1zLeGMk6iUsyf2NGbbusW
	krAoxWkW/afgIENLMD2lPjn7d5Cn+5PJpzY6ktrWTi7StAiCX7IrTqUjfZXZfMbcLqP0W1IlW6w
	WjdfuIUKnivduG6OWq/hnGLDT7ihIMj9ud63ExLVNpgcikUhf5B02uV5HafINt0qTKnf/0avRgU
	GC0ZolXVIcEOkNKEVYFpxnJJAerYg1imYXQZzkwGxsaOSKABWTMZy2J4Gr5Hvrny4Ps9C+jpWC1
	D
X-Received: by 2002:a05:6a21:648d:b0:231:6ba:881c with SMTP id adf61e73a8af0-23811d5b72fmr13279534637.6.1752835609903;
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+oIQZv7zeP2XrajyPNGsv0HOcYRrzrBPX4o99YzxCFVD8DkN7dyHzSjoLscfcsLRkcELSfw==
X-Received: by 2002:a05:6a21:648d:b0:231:6ba:881c with SMTP id adf61e73a8af0-23811d5b72fmr13279503637.6.1752835609468;
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678cdbsm1028989b3a.108.2025.07.18.03.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:46:49 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 18 Jul 2025 16:16:26 +0530
Message-Id: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a261b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sKMTf-CTBu6bTl4tlAcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 69pJCS-e4Lc2xmwUl5o-yyR96DxhV2jO
X-Proofpoint-GUID: 69pJCS-e4Lc2xmwUl5o-yyR96DxhV2jO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NCBTYWx0ZWRfX+5cpmQlt/s4i
 +JVEaOaLZ6D0apfl1LmaaZwlQvWNaQW0NCLMEFVsKrLV5A25Jwaw7oDp1r4krgEoR1opcj4Lg3y
 ZZHvoVsZk8ZVb6aImmCKL93STaEa4IKw53DUDpMPTT44N/h3138MLcMiUXbEZJBTTSCwFP6lg4Z
 EcScN7OpAEM928hE+5PrfNcg0OjwfLZcCLHvGnaqLZM+n513nS/ryvxsT95PVlonYbm7UDgM0PI
 ApyMhXzaM2934+EI5h6VTei0iir/8V3bBaj4xpDOLKlmpS9xS0fKI91MraGvLT+cSI/tPC0viaI
 emWoURrsCrnYA+SkRsvm0Opf7X6+1ewtYwhSooHFC9ZYk8eOTt265/IoGSdiaxvhpj1wjXkMVHy
 jeTNDrl+NIAg3V7WMDZ3DQncsqhq7CqMcQV0rcSLqyoS+M7TQCfcyi3tDVVmxGeSO0AW7tMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=894 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180084

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2

changes in [v2]:
	- Addressed the review comments from Krzysztof, Dmitry, Philipp.
	- Used devm_reset_control_get_optional_shared_deasserted() api.
	- created deasserts/asserts functions to handle reset gpios.
	- Register devm action to safely disable the regulator on device removal.
	- Link to V1: https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/
	

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 ++-
 sound/soc/codecs/wsa883x.c                    | 93 ++++++++++++++-----
 2 files changed, 81 insertions(+), 23 deletions(-)


base-commit: e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
-- 
2.34.1

