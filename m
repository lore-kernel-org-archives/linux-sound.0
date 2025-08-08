Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF11FC0F3
	for <linux-sound@vger.kernel.org>; Fri,  8 Aug 2025 05:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754631024; cv=none; b=TauyX/unybBfeoECj8SZ3uam+yXk+amq2Whmhb3SLQkoXQAEBoCBoYhhAXwqdtToe8QP/80cRScgdaYkxC1fHket2/YX9p8NsCIKzFb9WkJr0sYUbi04EK6o8/lASHkYW2n8EYL9bekxixorekR1KS72lawinoLJU7bnTUYYk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754631024; c=relaxed/simple;
	bh=Jd76TxLJDO6ktnTVki7hB04b124OqwCvlvXm+sVtsuE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KAWkAC3jUyLsSaRGtlFGpna2kJLXipOVt5bDktdHfw98PQDB1MDXzyTKfS1rYCO1vXrYnpgYFEVSX1EK+jbuAe3GhKicuy2ITjGfgk/MziUw3mRWuvke9Jd6N6UJ04mqCTCJE7SwTNn6GXAOx1TOwc/neI5jYijjZBId+9PI3zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loOboYIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loOboYIY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5781mSaP030293
	for <linux-sound@vger.kernel.org>; Fri, 8 Aug 2025 05:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8Car4PvODcLhqhbydD+z1uxMFD8WOqlwfDy
	1GI1vIzo=; b=loOboYIYcNiY4EYj1NpU+mpoGcaaQntaHilmAFXH2NpeyP9lDbs
	wqcnd6ZdF14ktVtV7b6kzD/A7KgpwAuCTTVjg07fIKtUF1Mctmq73bF98HG+MIvH
	3bafSzfLQw7cpH06rzhk/minn4W9fNr5jcCXJVaNcotYNn9TPMSUsFOoa8sgjh4u
	Kr6Oh3Fx3c7Pw6IUklGU+DNXTkFHoi9e6L4SrkO2sCpPH/yWkzClgKktyUuvUgYm
	ZVf++isdZEa+VruZaMtMrlh8RJqlm4SaB1UoY5a1HrySCja/YB0cTPg+CL7/t4Eg
	nBH7/4zOXomkd90rTR793lXZdPi1ePYteWA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw00w8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 Aug 2025 05:30:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bed3183ecso2093884b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 07 Aug 2025 22:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754631019; x=1755235819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Car4PvODcLhqhbydD+z1uxMFD8WOqlwfDy1GI1vIzo=;
        b=ZhjswSREBwTgccM6WCytZ0nCirPKarMHBYjc2Rxsvzn8FNZtJdV+WdjdOC8asfylSx
         3oWM3/3C95cqDnthFz9EOp5E2ix+DgUEzhqiqb///y4xHOg4dTmQYf+6h6e6rZKtGhoF
         0HTi4UFEV2hoNihorCyyV1MD1W8Sbr1R9XFOf9U9R1hp6Bj7QE+K9WdcD7OsbAdBrFIJ
         kkNU+gxH0N37i2ol9IbfVl0CvGBCURrVTP/hmEMLxtmRd3ViLLWPtUjJ7FZkdyXkt9ez
         5UKcndiajlDJY3PFrq0+IHEmyqXQHYyDzGq39FVkvKXYcyI8AK4j6bEgt8nbLOaLJvIi
         cAEg==
X-Gm-Message-State: AOJu0YzC5Q8300QqaSdN/MeEOJnScBoS/E/ql/v8LSwB4YuLLWYocj8M
	unvq3HhoZCmcht2GNSG4oG3d6i1CMhx8YdBkwHdnF+qNkWIoIzVpcX+dGFI2+ouolE9GCN9Gxsx
	KflF0I4jWnhv6/axEkloK+NZDQl06SwNi+8ZWKucwZOnZd9PPuoo06Tk7CZwMHygRsg==
X-Gm-Gg: ASbGncu4ud2HsvmkvDTCNqph8MZsNSIMk6WR1hj1DiROYS1SZchL6h3x9VhVxiRWMCf
	TbFPv7gDKAvKbvZ2wMX40SxLFI8rkjBIwY4W3WeGOtWT0i8FyYJogqzcKD5kRCi09p7dexJzqEI
	Nyg7ZrkVBPhdKXscaq3iGBtit33azkVRka1Y3XhbFTcu3jcQ+dI1nDYpB2jxDMMGb8z4wmfqXDp
	Ue1wko5lARN+NawG1+PGWpJdNH7BzAOta0j7PsDEkC+ExaPWvIB/+MXzvxLLLLD5QwR0zjKCJfR
	CnFIvRlMJZZ0SXM4ILERzWFt4EVg+aQYjpj+/ZqvSkT2KtMwJMUPAQ//V/clO1EhA30yG7cGTs+
	L
X-Received: by 2002:a05:6a20:7d9f:b0:23f:fc18:77af with SMTP id adf61e73a8af0-2405526b3d4mr2604476637.44.1754631019255;
        Thu, 07 Aug 2025 22:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2AX1odTQ7pYbDdG+vscDveuCfUt/q/c3s8e8DDzLhI/9qs3snSGEcgCMTUUe5hjWo6pSeVg==
X-Received: by 2002:a05:6a20:7d9f:b0:23f:fc18:77af with SMTP id adf61e73a8af0-2405526b3d4mr2604436637.44.1754631018849;
        Thu, 07 Aug 2025 22:30:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f483sm19278662b3a.31.2025.08.07.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 22:30:18 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Add sound card support for lemans-evk and monaco-evk
Date: Fri,  8 Aug 2025 10:59:37 +0530
Message-Id: <20250808052939.1130505-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mz5ECRzVaUcCxgR1LoB4ELJC1X7bdno7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3fNVbyAOMgB7
 +wU8oY5Z+uFcSfRu+s673c2SIZMo547nfdW557uASsxO26zqFvY+BYBUAIoRzL/ahGmZjgSB/4U
 kHLOL74QhlmdrW51QqJcGvEGRFt9MydMVbmTdDS+shV/ysSDY+qlEXOOsWUH2XBp5mUC9qBmZVa
 rI6B+Y2dLMAkzhmOt9N/w4iYcKedzXZk9zQFxIBg7vlDLs/cKxgSTVTr1j3LJ0i+gpicrFVOfnl
 OrazB+DKu2ivi9PkB+HteSLqKIc+yxW8dDSSANn3W5AgGT0sMmrzm5y+8GM1jFffMuL97YD+Y/8
 x7a8u2tigJdsKvkcfyqdJBlvDcQi5vYX6jQG5UySXLV5r/gL2aCb8g68UZJptpo2yDXFuw3XxaA
 BPApduMd
X-Proofpoint-ORIG-GUID: Mz5ECRzVaUcCxgR1LoB4ELJC1X7bdno7
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68958b6c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=XcHJyV3jQw5NWJaZqmMA:9 a=zgiPjhLxNE0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

This patchset adds support for sound card on Qualcomm LEMANS-EVK and
MONACO-EVK boards.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add lemans-evk and monaco-evk sound
    card
  ASoC: qcom: sc8280xp: Add sound card support for lemans-evk and
    monaco-evk

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1

