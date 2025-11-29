Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04F9475
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424964; cv=none; b=KfthQblItkHtXMX7fVofWejjNwcrBRnUWiVHT/DB370vi8HWGj6LeWJeYt3nFrli8zVNOSAMAqc28FVAGLPbLEo4UDBIObL5q+gm9NBlfawwU6H8iNSTggRS+FccU7YaaN9dYfu+t6YnVYLnww7TR7h/4uMbEUOCL/jyhKLMXUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424964; c=relaxed/simple;
	bh=Du4tTQVH8cigYiiUPz/IbtsJKqPdH5n7CJX2qM6f6q0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gin9VVP5FbBm69d4Iv1aBedByPGVNNyAnN2erFqy1J3X0tkCIBygFZYfZoYIUOaXDKPkSMMmElIU+yXJ9KhWKuYTqVOY7efiqtQhIjlRQtY5Y7TiQl81Q8DM6de3xs/PX4D8TAMHRzUx33qo7Uxi6UFFzJqrVKhwiClptCcaff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ihv3oyFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzRrGLZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ihv3oyFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzRrGLZz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATDig833576708
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/2IyHOK6vDVhcmTCnGXFbD
	uPsPhfzzZ6WowjEy5TLJw=; b=Ihv3oyFMWbYFoTAskW+D9x1BWGXt0+PlpthW3j
	7ZJ0qXaVhNkKzpzccqxE+MrrPhKaiHRqD8mLqjb5OpjNNF1WZUd0p0MRWfe0VbX5
	vFrgJN6lurA7uXktsHU8WVRzacN9gz4HruGs+e/NHly0EkBOJHULmffDqFwf8GO2
	DRCroxCv7iTLlp+dSNU/oUrFV9OVvbwRpVeYFC7msXwqTqDZUAdFj5UQcb+8Y4lC
	8JxE46TL0h7PicjHV/UHRLUlv1ebtBbiBgc0gbCqHB65nbYkUSNtj4KyUUP8IB0U
	OZd54Kcx5nTLpzHQ58BPAlKcEhLrBqcbzk6mtkGrH2SFG7Zg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqu60us0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:02:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559e9092276so1312515e0c.2
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 06:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424961; x=1765029761; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2IyHOK6vDVhcmTCnGXFbDuPsPhfzzZ6WowjEy5TLJw=;
        b=SzRrGLZzlDp74EmirlHBit7VJnFsFz8D5iEN5zgv9PYhUItz6STWgkloXaCaCBhdXU
         vUzMwhv3fCuvmNgzlUjiJZ8goKbwVW+IUfTHq/vUIIuHTVdO3fxriCNYUgdCxozB6Dkw
         bFYzv+XOs08kNWf4ysMulY0Y37oodLRAQ//Yr1PzpR6TvGK3jRSVYlXSDYl01I4gG1Fu
         hgJzra1mErU/M7d+nGjtiKD6BTOzaCGnJkbmoj1U62/8snK1KRKYFZ4a4cO+zmAb+0B2
         Qh+QZ2lsLgtZHlhJcDv5rBGmhr+vgVsCOD79vwOTGqbwrLyxA/dcrgIPxakPX2pZuZfd
         91PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424961; x=1765029761;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2IyHOK6vDVhcmTCnGXFbDuPsPhfzzZ6WowjEy5TLJw=;
        b=nX8qx52P5yIyHLa7JMdWoNggDerghDaXYFbdZcXiEZNaOrAbn6irVr5O9RsPWqnUjc
         Y6KnMQebEfU3YyIHU49ZfBAYyMNPIv5laRQvaMnPrs/bctb/BV+Bkg4XC/Wt29m8k8tU
         xnwCceI7rVP4cY3X/kSseOtc58/CcF8Xs/EfeN+2IVBKO+ePNdUq+jHFVm38ZQ+vzEL/
         3dGZciHbLk4oR9r6+Dj314rD9yLQmdPoY+63blc73vnnREZhZLctN5j3qXOYVFAxu8as
         BimW5nU6JZpE0aD1q54w9JkoqvTIq7vN1UC3xA+7xANRpacyw6D1cXrZELFRQHe3w1XC
         GkQQ==
X-Gm-Message-State: AOJu0Yx4ZUXdqBTXQwb41aL3IfPfbgSz2g3/VgTQ+tOYL2HT0AcXv9xo
	qumd3xvEch14YLmAbinIPhg4LWeSl+DvKyHZUcXQNNOL19amJOi8Qd5SA9DwyATJB4LsXOb7dJ7
	4Eyx24H93Gk2Z2zomPvQocmF5gT5TtjZrc6yUdxc7kk0irlA/UuPQqmqLwcjAsXGXtw==
X-Gm-Gg: ASbGncvBk6bWZqrUWo/ONxGU5CB3XTZLrGga3achAXjXjuQQP0XZZzrMTvh83SJ4fD+
	adkpjPKBbT/r04b0PHHm3MMiAxCA1wcAk5fVfYHEbIJkGO2kX4zfuCDu737pFR8jK6cYQqU1Xrx
	qd93oi9F5kR+zhNBwywLe1RDi9ejUFOS4ZFqik6x++FodY5mLFfX1PGdDn6Bhh44SP11ZeHO2Ps
	ka1Th2bLRXiCQlSnAV2BXSG+OXorMmeLIrBLDqBZPPVCRrTNahghBBQFb9fV51S2UgGNUhcDkix
	SkAyGqgDwQvd+nc/ASpHxiRKtlxe2il/qLvcmbbnxO5AkH60cqafMqoFYPoB/zYBrFSpwqiRmcg
	x1dRC/Xc1ycVqWPJubhvUbuf8kO+FUuSKJA==
X-Received: by 2002:a05:6102:580f:b0:5dd:b2ee:c6ff with SMTP id ada2fe7eead31-5e1de0ed470mr9789950137.8.1764424960958;
        Sat, 29 Nov 2025 06:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu2lZv/s7+w7LXCJPhmqOEENsMe3FqFI/szlf2DH/XY9AwvphjEcC1C7Y8GevkbyIOvk2wsQ==
X-Received: by 2002:a05:6102:580f:b0:5dd:b2ee:c6ff with SMTP id ada2fe7eead31-5e1de0ed470mr9789876137.8.1764424960551;
        Sat, 29 Nov 2025 06:02:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] ASoC: qcom: Constify few things in audioreach and
 topology
Date: Sat, 29 Nov 2025 15:02:30 +0100
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPb8KmkC/x3NwQ6CMAyA4VchPdvEjRmCr2I8bLWTHlx1JYSE8
 O4Mj9/l/zcwrsIG926DyouYaGlwlw5oiuXNKK9m8Fd/c84PmAKSljlK4YqaT9iM0ZTwR/pByiG
 lOI6pDw5a5Vs5y/o/PJ77fgCY2Q7ncQAAAA==
X-Change-ID: 20251127-b4-container-of-const-asoc-qcom-cf4bba99b341
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Du4tTQVH8cigYiiUPz/IbtsJKqPdH5n7CJX2qM6f6q0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz5suGW30fpmZTw4ixOm9RcoMVaCChDm49ww
 tSPf6kiw9qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8+QAKCRDBN2bmhouD
 17x3D/9vG1bF7qcjwFgmsXEovrjgL+K1s5qkWokPyyhUU7UDqeRwt0HnsyDuPCsUwFTHO9ehK0R
 w6VYGikJ3i7BrBaurfFhW/ZKqtrnbd85LFANB5U4RaXSCAJhU1CAa/bCViM5sK/MqIkG9oSzoNw
 0heKmc5C5xwQRNMQASQ40O63Bh6+1sL0mVMmY/FGVQDavVzONt83aG2m20kCxDXJSy7XuBW22HD
 2g1k7rjogYrqsVP8wat8NIocEAWpjL4y3FyoR7zEMp5/3fA7TF5zdBsoxvIsZTjvowuCeaxMqem
 j9crRnVzJDvdKRRfVBcAYUXfoC70Sme0gzTYL9nQmsqZkJO66v985S09KngndaVVnYJxQGFSBsl
 qlOTAoRtqtJr2saDNvQnFeyD1gd1OOH9NiwY1q70PNtG3dTpTMxzRYZNgJDcGMiYeM6DCfSAi16
 DfqdxnkJTrWWRt19pCkUkKJJBO/eDDpk9zoeem9a5TbKLWrKS7VrJxR0qx9CaSYKsDS0n91DhfA
 hc3862m6xGX5dqjvDCLs/JMBimVEpCQb75rOXwNko3SobVSmLZeQmpksL6ExTS0wDHz14sK0J6F
 kjRm+DJ3Ip7MpgJKyEqhEdcJSehoKk1Gcbt54lNuL2eVp+poypKqXN1Dl7CxmnGs5aX/kuXLNri
 /M0cDEXjOT+8a3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: JeHRnHo8S-Ew-1VDoJBmCPMcG7EiIxda
X-Authority-Analysis: v=2.4 cv=CM0nnBrD c=1 sm=1 tr=0 ts=692afd01 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1j1XgALevlSqA7WBg2cA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: JeHRnHo8S-Ew-1VDoJBmCPMcG7EiIxda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX4CGEtl5vOo6J
 S1mbc6uHlq+/e5uQbOipuKcOmr9bR15Z9F63skNWsPImtX90PTADCaxEvacs/pIt0XE/E+v9lW2
 tXCXxAo45OpLVpqpuzb0tpCvQBc8TytbtKN6rJO0zc0WKMYW+0d6ml3IC1U7j+CyqiFgX+IZ+k7
 n+5CeqA1mKi9ys43eaLhTbo9SYxVOYOP23eVOdpCTodRBV8orUhJPMS6bxHEoCwLIbeWuV1xdaJ
 6AAF4UEM01CQII/8U1eVbPn1Iz7ArF+8BcS9SWP4bzlEVso40P+43LEYGaAYeItI4JhkupRhjwu
 d5W0gLMD38O45Y7lNT07mfOOOIGTpAqswCipa7iU0rmU7wIqzBjhgUwuSP/0bjXYksm0xxn2kIa
 friQ/yfugGutvdy+xh7olIEou+yQNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290113

Several functions do not modify the pointed memory they receive, so
marking them as pointers to const would serve as self-explanatory code.
Also safer a bit.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: qcom: audioreach: Drop unused audioreach_control_load_mix() arguments
      ASoC: qcom: topology: Constify pointed topology and vendor structs
      ASoC: qcom: topology: Constify pointed ar control structs
      ASoC: qcom: topology: Constify pointed DAPM widget structs
      ASoC: qcom: topology: Constify pointed snd_soc_tplg_dapm_widget
      ASoC: qcom: audioreach: Constify function arguments

 sound/soc/qcom/qdsp6/audioreach.c |  81 ++++++++++++++-----------
 sound/soc/qcom/qdsp6/audioreach.h |  16 ++---
 sound/soc/qcom/qdsp6/topology.c   | 124 +++++++++++++++++++-------------------
 3 files changed, 115 insertions(+), 106 deletions(-)
---
base-commit: 62bc45b15c616b563d2600a0755edad3069ff263
change-id: 20251127-b4-container-of-const-asoc-qcom-cf4bba99b341

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

