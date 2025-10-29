Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688A34DCCF
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753671; cv=none; b=Tooz0Jj9Pw+nv6C4X4nhzdpyn1/6uvBc4Le7QVXOpioVV5bODczHAZz384aJhn2ETGXfQypVwgyz7jZFP/IZ/P/VKUF37iuUKN7j8jtWcZyv9NXpZuN3VqDC11l2ZXqLu4sTmnKJntv1PQufLWr13R7p5rWuCJNi46iBBdggN7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753671; c=relaxed/simple;
	bh=TILMcgRj0kC60wf4eiNeL+x6Ppo3TKOdtnZW13u6rEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UeuzS++kvgX6oKQe8Ds8//JxKSj0PEUdNFPufquGfy00CUUjdyQKDxAck5UtNAfASVnrrODqRMa/2TJPNrq3/Y5jhAMiWgqpcIf8PiAG+sKNtL0Wy/6Wvi9eKO0fHATzPX6BewUcHDRZ5xxsGSZw3WsdMaBicCLyKlq78pIw/e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DT/xK2qK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHWVSwhg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DT/xK2qK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHWVSwhg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TCatnA3664310
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kkVD4J5QeGsAGYyihfrN5ZhJkOber/W0iUx
	3w/k7ZD0=; b=DT/xK2qKa5JtmyI1WU/9Ici3j/1AerHU2c72sfVfVIUjIdXfN+Z
	Qu3g7J7XfnuaIlQZue2mW4RaMYRams0Z21n1Xa9fazra/g3n/aznvtF/m40laJSc
	ypwOyATWAXTDhkil2GdxtRkbFB4jtjN+AOFRcWF3vOLdqpPFhC1uq8QwPqpV9UF6
	5PjtMMEVcXpGmZKHwmNoDJv2pD4D0mzOVUU79tGRa17Jvbgp7dATY5ZpkjtcDB6b
	nNdxD78crJTnHXodf7ib9z3tn44kmIn16lWjynDOevTrbSnw5M/ipqoMeXyTQ0LQ
	g3cvp8x63xhDvSpGTjq0Aq97dsQBEY2fZvg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1u5fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5569ecd7afbso29588e0c.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753668; x=1762358468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkVD4J5QeGsAGYyihfrN5ZhJkOber/W0iUx3w/k7ZD0=;
        b=bHWVSwhg0KGWjSDQWY24C77vKygdjW6Rp3GLrV5PMeyCDKrJJqgE+fyLzqhvHSzwqt
         uK02FWkI5A7N0HU4KSECWEoriCswixnwHwUQ7jNw4oGaGGgZDsScG5sv4tQPqTDQfvfv
         4fIMSggkNxOW6/62z2Kw2HCdjsRppKw8Z3AS2QxL0OFsEAXxT2SxKP22sV7E3Rr4/9vY
         02St6K+EsCAmfV5WWELSuOowKVEFgNVClRwzKWCPg71IVOH+BrkmJIxoHk81Og1Fy8pe
         YSlRpRz+8tkv9vmCcOX8tgm62No1HpTNKu7++lD0TiJ34CT5YaaWfkaMoPSxTQCc3OeM
         uz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753668; x=1762358468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkVD4J5QeGsAGYyihfrN5ZhJkOber/W0iUx3w/k7ZD0=;
        b=LgP8wb6Qe2uViUe2LaKwUVlzQ6gql7Rw4esZ9oIkTnEiWBc+x6FzSW4rddhSpF+cl7
         hLR/Ai1NsXDncOrIZBGbp7Id7EMDG+JKYW0h/NshHqDpf90gwJ34JmSrQxP0MdT3ul89
         gfMX4v2/a2C4WoA2fy06kt6gQMped1ywqJtj/wotZG6uMps0s4ApHVwKjArDlzmTU2hg
         OtLpW9CxOYMWCzrZCvk3KhxXtOqPbVuzrR4iZeh9SlmRtOZmjf/DAa+BMQixQASQeJkW
         sgYapifACTUZLe3YnE3Si0WpDm58qdwTwFyMYk9htgtBv2yQsjd3/mIUmCnxMdRAo24f
         2uRA==
X-Forwarded-Encrypted: i=1; AJvYcCWzKrUNdZ0Xz88vOxYs5PF/DeqnqpxcZ37WhtogKSKCaPiHbW9UAN/kSMFjHmP9KUgoIBx7nmhGViswAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUQwVuCjhZTk6eFHYL8RFyx/0D01zX2CRHuc7427YSaCT6ZL3
	q6hVmqe6DYEaCJc7nQ3HeSdJpAMGUL7wODtt/NheiqzYQ8d7NPPgiN1y7EZaFoIyElsb7g8R+3i
	WOPyLyFxew0NaqV9MqltmDyp24ittCTCmGHqojzucRsW6eQ0Zxxe7p+9+d2N26MA48Q==
X-Gm-Gg: ASbGncvYgN23rslvQM4s+qEvVe2pO0faOMPvFUTaUctliYca8EHXmmPmGQrvZEKRznf
	luvQOh1Pyr0+Cr/V1XZASvSstistLQjkLu0Kj4NZ2NhiK+Thoj2d133lEnO/1QwFv85lWjJrPHm
	Ih0qEfUx5gUtNIPHspbMam8GBPDSSurNzpU7TlCoUuL/IiyAmmqb6WFKLld5YH1ZJoLhjUJETmf
	dQdSY2Imsxppdcx1WMqxPYJqAueh9hH1Eh18sxp+cQMT54jLzgwsvsOBkhXTKGU9mM2ZOKTaOn7
	OAdQDfxIctWduI0aQvsfNNE53PtctSk5YCAPkjCXMzG8IRVOGr69uiAGlOriu5f32do589HfBkH
	gEaZH6Xz/Yf74
X-Received: by 2002:a05:6122:4f93:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-55814168731mr1307451e0c.7.1761753666729;
        Wed, 29 Oct 2025 09:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjTP9FZKurkzCHatar3BEeLS2nx9Ae/R1xxfOgAjHIz1P4IfYhsPpkU2tFJSrFrwOXmEN0IQ==
X-Received: by 2002:a05:6122:4f93:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-55814168731mr1307352e0c.7.1761753666080;
        Wed, 29 Oct 2025 09:01:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: lpass-macro: complete sm6115 support
Date: Wed, 29 Oct 2025 16:00:57 +0000
Message-ID: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sQOQ7yCCoH84lJIn6UNrsZasiC-TG0tC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfX3UBskwkgJwpW
 zX0KTmzuWMEriSVH4rpd2FZTQFwaS2EAHwz/HXzgbnp24PS35Ey1aY9UXsaAayjZ/dW9dTZeft4
 NiuSPGIR0vxLLWj3YzanShD9YmvBoe9BfsAJ5UUChUr36r9A5ddkqrmfINqQI0gk6QKFhf3KFtr
 QewG34m63GBDEusxamhdPq+dFzkDj51KRznprD80c1i5COkFI3H310/yNpHfH6wzdObSGqUlQEG
 xcFS3ZeW6mj45orUjk2896/noe0taL/Xx2+NHgxGSs0bzB52O9V0ylLVJFPRxFUgLQy2zC7LH3m
 qMRcrG0nQCl/dl/E/nRIMhA04OYKn8ZgaCVbjUuzfDx+gLatdja3QbZQamWtZvYGqUcuf7Z2hJD
 7ckuUG89EJjIKoeG95NnxqmlAIzP+A==
X-Proofpoint-ORIG-GUID: sQOQ7yCCoH84lJIn6UNrsZasiC-TG0tC
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69023a45 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1oLurHACul6UgZ_C9z0A:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

This patch series fixes SM6115 lpass codec macro support and adding
missing dt-bindings to complete support for SM6115.

SM6115 lpass codec macro support is added partially and broken to some
extent, Fix this broken support and add complete lpass macro support for
this SoC.

Srinivas Kandagatla (4):
  ASoC: codecs: lpass-tx-macro: fix SM6115 support
  ASoC: dt-bindings: qcom,lpass-tx-macro: Add sm6115 LPASS TX
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
  ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA

 .../bindings/sound/qcom,lpass-rx-macro.yaml          |  4 ++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml          |  5 ++++-
 .../bindings/sound/qcom,lpass-va-macro.yaml          | 10 +++++++---
 sound/soc/codecs/lpass-tx-macro.c                    | 12 ------------
 4 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.51.0

