Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E13FBB3
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643598; cv=none; b=Bb8FijusJwnTINYAVtH0BdxHMGRHP+0M3CEgtIy1AxiJ+pPvHAWpNtAmhqt58P9lt4Yb+YJw9ywLVoKmo262d8XQKFaqPBQ9iPoGgNtXIypIc9M02weN7w3BFOTg7DPvrM8ERDBWkjDGN5xcr251IGTD1uWZWwxOSSNS0objvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643598; c=relaxed/simple;
	bh=SJyYt+2SrMmVPKFZbwfaLb4AriBRzje6mjLBDyBXo0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cYtfY3A9DAyn2Bazlpgn5rXX+AAV4PT94sRWgKmlUSD+weWjHAeJIzhkGzNoE4g1wWOkjk11vRtj87hG3c9VjiFGCZ0ETQmbIm/rmdE42Y7nH13I6nx4b/nqmMFCr54bnMVMD6X3XxzpbwC2zZsw/so4bkZ1pLH4lMDQCoKj+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5LGzeTu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5LGzeTu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F1Dg014246
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0Z9VhpORTd5abbKb8LEy6Gb6HHnZT5sQNZa
	86+bNWuY=; b=L5LGzeTuOajVVNlMwYcskzXya/rwGuXmH7bl0bdTpBWM2ROEpIo
	vbCpgrh1D1fvLW/WTaB7/IDwTlWkHN8elLipDeWoxclucl2VAS0NhEB9HmDRMgNp
	irWSIGtxzpE02nCEjPx2+N5xbawId6fdsMZB5dgNLWTbx67K3hRcWc7G1plNoKiC
	2gXKe2mJpYJ8uiAxx3InJo4DMX+CSLwQ7NkfFynuvJwV8lYclsv2TyD2XgCJ7ydc
	2F9+eVN7FA0I916tdddpWJGy6uborAOr+sKSik67kqCDgKbrUdFFQruvzSEckXhN
	usvXTaS0g8Jdv9N0ogMjKj0PNltJ9CO4Qfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwengqrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e82e16f7fso2412839a91.1
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 01:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643594; x=1748248394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z9VhpORTd5abbKb8LEy6Gb6HHnZT5sQNZa86+bNWuY=;
        b=ftR0zAC/AlTXlhv2bF6zfzvePYc5wFB574ukUug5DC3XWyh1SeGkGVh1NSsSxD+Dsa
         wt0CwwVC/BivCO4gUi0mZUJI3lyvsRK4bU2+MTYlnCnV3MXE5LiDkeVzRFZ2sUOsch23
         Z9+/2vfXie+zp5TNX48nJbXZLLmReACc64U96Ic0+8eIRCyY/qeTAlnP+hvmw+DCEB5C
         lwpiH0zLKBKjVOb8YPC+P7UdpgUf39BjottvZ2K3+A9A4xVwh9h/qGX0JPFtfrVx4Aid
         IyvidrTqfHaNbbeY4lQzhqOhRS5NMD1Ucmixe45u8jv6p4NndPuEckBH5F9XTPmTLOBg
         dHuw==
X-Gm-Message-State: AOJu0YxZJn3/wc8SIJyZ8TuOhs9K0n+UfU2LeeOGISNx5UFlQtxDb2P2
	CyF1PmS49n0k0BcJQnJTdk5SQ56pNEWWJKDK7PRbVbnJiLI+5odGHu/xoRcXYYsDJl92OV239zS
	08J+6R+mg645yPUTH2qIEQljbbEkwgleaXds/9TSGR/arSjW+4wetL2jya9sdtrczHA==
X-Gm-Gg: ASbGncvskFAlWdAlKa7Bpbs9XNY5cUiO3MkDnGoDOa9TjOMCbqc8jHsNksppVO00vQQ
	C3poNkCUUMVhNfqN630sNycg+hBoEK9O0qYpFzlV93yBz5zdejyX+VWCjOMVtIiOfGjVij2gUAX
	ArDmD00bLZ4gaQYcn/UtWWezp3kCUONVmH3TQubvmK00Ax8dWZ0w3IgoRRzsj0DCwWQjDFRzQHE
	eWm7ecGeFikq2fnUshglDRSVHUXper37Wy16vieS2xZ3rJ6xi7MA8sgPxOaas4IE2rRPzXkn5ps
	QCa+IM4ubiHNUsqLWpyEDzvNgnroeEiqiwUgIhMqocYafXew
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr19561736a91.13.1747643594447;
        Mon, 19 May 2025 01:33:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxqNIle8z40DmsVvDOBzsAjRCPJ9BoRy4c8Pjl4AIbG1xTCC1hNBrLuU83g02ddIa7W7uMFg==
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr19561687a91.13.1747643594004;
        Mon, 19 May 2025 01:33:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Add sound card support for QCS9100 and QCS9075
Date: Mon, 19 May 2025 14:02:42 +0530
Message-Id: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Jow7IrPSAWmGaSsNVIOrYBwsBZUQEf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX+HO1t5SDz1if
 KTrb4zEymOq/w55MpDz9cAGdI1ajweJbd3yZLxPgp6B96XVmO6kMEgJrwYJH8v+3pVQTmPUVOaA
 HgzntHWbrQOI4NuFKztGjkYCG7371AAt4msKlrVlL0umPgTyhgwzE8lT18laP/G6C/NQ/X0BvgB
 na5RwNTiserzZb6WvF1T4YmqszDgZT+B7iiaX7/i9Qg28mua/vz4KOwqho0VF2BSaW8ce0SCcMU
 NtRPUPNIoATM06fXGZbufDyxuvRi/Irw5Fd8+nKMoRa5GPZ0KziKSF208Nrs0MK4YK/T7LUGDj7
 kKDAHBYqGzAjxc8Em++Z7yFsUw/MM03GpytgA1HZ6HKzy1Ezp+rj5VQrIeT9cgtesOOlcm80Qe7
 eD6Femrge4xOOCsLDf/NRSDqEC5OssbnbZGTYXc/LVTTfJjtch0rio2LKZaFB1pKzlZvle2g
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682aeccb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=-EALBZLJ3Ef-HAATTx8A:9 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 2Jow7IrPSAWmGaSsNVIOrYBwsBZUQEf8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1011 mlxlogscore=786 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190080

This patchset adds support for sound card on Qualcomm QCS9100 and
QCS9075 boards.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
  ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 484803582c77061b470ac64a634f25f89715be3f
-- 
2.34.1

