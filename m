Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DE272E54
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422293; cv=none; b=hcsuQCG2OG5I/EU0OeE4hz8aSnu/hgB0XiXGQV8I9yTOx37nz0Tvz8y6XKz2TrCTgZguP2btKYveU+odfd3bKqC+gFhXQ765GRYiu8BlThYR4bgzDywszcxCYOUxnKvjQYHIDiYdxeF380BwxUb3UH+c8Rn1HQIW8BGe0gdqWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422293; c=relaxed/simple;
	bh=8ovGvZCqwjWCnMvCGhP69qiIzWR3JWOhrYiaIxD6IQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sv2KyBMqtWzlKUUPJP1UAJLtr+Q3+9a6RdAdzzo/v+klpJvy0dr2TiOkEiBNlOUl65nbYPekWJojAksmB1Qhxs+LWMBpr+/M8PAgVFrsVc8jIE2vWOxUCS9nPaCLaB9D0puXbHgMp2/fcAwuxA5z7cr3M497GyrA966qoklA35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFvqu2wL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ly08D7bS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFvqu2wL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ly08D7bS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT8qFLe2280110
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V5KOudL6rBk5/+I1FeGWBg
	g8OueTM9TbKBT7Hh8bzN4=; b=FFvqu2wLHbMcAwzYwWyNXk1tcvsprI1j4cS9Wd
	2XiI84ESICnxjoN2gWtoEaK1vRwhfQD/zIiogHPGlXAF8O0PwQ9boMNpuVDejQPF
	i7TR5cFIILKY87WD5Nm+YNpeT0vIs7v7TEySXtauUTDRhH9Q3wSiSxty1xzxCAqp
	5d/6bBNsYwd0v5TSqE1/HPcGlyI5pa/ywwvel1YahVtd16OFSmLMVcfhRI/cc/LS
	s8pz8vIZsSKJYdIK8NEqlkMPRKDSuE3QSEqXCfFbwlxyRjOFGwOBb+u6weaVGy6N
	w/p6dy6OjRuVimgz6WrtEGuI0ptObP2zSpPrQBjgLogepPrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqphf8wwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 13:18:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e41884a0so583190685a.1
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422285; x=1765027085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5KOudL6rBk5/+I1FeGWBgg8OueTM9TbKBT7Hh8bzN4=;
        b=Ly08D7bSEvo9+ABC2WzO0rKnwP4QKmIIwunjLF8BbLDKPJAogeY6AoTWwXSDQgXTu9
         VP+K2QJvBxXwjxTwGN2mvaHVzF1ZGLfKhsj0vXNKj4BNlx142zFLCzaUYiorG9zSCJDx
         jzz1IgurRkJ6p6zVoVvIZuLgimGrN5cPogp8PWBBR2TwXXJFha1hNNsvdBmUfb8kA9FV
         z+6P3Vi9ajiIDB6HHf9ceF25sqnscr2oIRsdjOoHNTndLv50A/29ago7APGZsEoiV7aO
         bREczR5tnv79lL7eXnSaePcoCqENG9uPXUr9GQdSi9ZnOr9xwNQ8er2wehkHErB/4QuR
         5F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422285; x=1765027085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5KOudL6rBk5/+I1FeGWBgg8OueTM9TbKBT7Hh8bzN4=;
        b=RjkI+AIMv/xEV6SKVgh/ZoC6KI6d/Yj2WuUVEDYFoS7EpBIcH0IqcLaqvEjI5ikPRK
         O3B+BBVlBEX6El6iq5IXt2y9+p8wn2W8vHvVhcMQVKI7IbDR6bOZf54wfkZ+b5Gw6HKc
         84mEwixa07qy7qsIJ7y42W5cVqceLtP43gHmLIpcHAqrAsO2zuKc8eMDIInZ1HaVTgh7
         MbDrqbtG3zpyV6rzDBz+7NPbVxoQBRx5rylc20OrEhzwfogPB9N5PLMGRqy7SuoN9rGy
         7+VL6QQHHLHa/n7a8cHGS6q41jgpQlEnbOXzBosq9BcMICE4tJVCtzsMZl/ZQxJgsKir
         YKew==
X-Gm-Message-State: AOJu0YzTZz2K9dXgKOSymCLip9kJklU2fu1d8QzuQaAyLfM6YzdcrksU
	pK0j+CAn7X4UdFdHBBtW7J81rw53QgYyvZWwKQR5L9alsw1OXud6OlEfyNhBZUpEaEBHwx2ZaXk
	8K6lfRi5rA4ZdEJeGGg04/drFd+ARVU8nBMUxMjAoZb4FFxvg2pBYZj33kwlHleD97A==
X-Gm-Gg: ASbGncu2fPbRgqcb9ErDW+XH27hKYxLwW4GzS69txO8wsLuOb25jXtj+DBbh3fe/j0V
	NJZ8fcpB6Syo7Yyw23XuxlkUyjFoP79PZxvFKtKaeH5itc/kXiVjWKdLxsoMRwzd4JUb1grRcHK
	r58TJFFnwN+WLaNj6i1zr0TIfxeny8U3nAkCU5vFaNUNfFmX4gWYC2dyccw8t0S4wHrO0J2E/Y2
	PKYBzZiUVlYQHWPm5E5ylYhFhCxbu/lF13Do1jwAfVcLEyuiMkBFUqcSHlKvyOOtGFnpkdJtspO
	ciC8IGihZ6OAQbUFb+HZtIZs83QT3CddJbuhadOxHHZ9PnaHS77YC8N25QulLQv/Ia17tYttHI9
	rrcrFhxGH2SZcozXRred+AJXGDUo4TXNyMA==
X-Received: by 2002:a05:620a:4146:b0:8b2:edfc:bb9a with SMTP id af79cd13be357-8b33d49884amr4021130785a.59.1764422285403;
        Sat, 29 Nov 2025 05:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY/CJRsstpjohsfuMrCwIlaflcx2iU/oSil20m9KkSPsSA8uwFHtzy4dOe+Y9AviKJiBO+/w==
X-Received: by 2002:a05:620a:4146:b0:8b2:edfc:bb9a with SMTP id af79cd13be357-8b33d49884amr4021126285a.59.1764422284982;
        Sat, 29 Nov 2025 05:18:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] ASoC: qcom: Fix confusing cleanup.h
Date: Sat, 29 Nov 2025 14:17:52 +0100
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDyKmkC/x2O0QqDMBAEf0Xy3IMqWNr+SunDmWzNgeRCLtaC+
 O8NPs4ysLM7QxGYe3a7K/iKiaYG/aVzPnKaQRIau+E6jH0/PIhNPW1F00x+Aac1UyTPiTI0LyC
 rmsmQgjSjRjHapEZdKxXwOQb1Rphw54nDDePo2lku+MjvDHm9j+MPy9zf35gAAAA=
X-Change-ID: 20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-ebe8abad6e55
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8ovGvZCqwjWCnMvCGhP69qiIzWR3JWOhrYiaIxD6IQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKC79gAfIMlK4qpZbLCo6s1nxKPDX0A/cEyF
 CPs1w4qbZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryggAKCRDBN2bmhouD
 1zR3D/9h/KwSIs1oF6MNgWPZlK4tEUnKWGw3WKxblZhB8RvrqyI8+mbf9iAcWH0EtjrtQNjsEmg
 qGR6YG8q/heBkiIUZhgg4ds8QXVHR/GEvJFPeGd+jowtzEhpu9Kui/iWLTa3xKgELwcwTRNcnCe
 EcaGKUBnKf8YOW4Rrt1oDdU4Itqb8MvVaSuE9P1kh9Ivej9OBmTLtDdLiPi3Aw467FaN8wWDipz
 B0Jh067H7EEhhKQVltSSN402UWkRE5Ac/z6TUBWlGwEJhn9qgrt7JnDlt1PB6Rer4wMSmVn6+rt
 VdE3Re25gjIDLeOZAhWig0N/RM/Q28wky1SFoa+BG7JGnO8XyeGE252UpM371AO0Ck+pzd1NL9s
 O+s7/Jqim34XzAtKtTc3tINN7GshgwO/Qg2bVj11mCB4Ic00pnJxxQNxoK/tp0qI1tLsMtVArAu
 D3f7DDqxPfQtvWG9ntVV0TM6WPKWQC0LTeMp6jCDuvKtOqTFzX14VBf1oWJPn3CWYx+w/K6Zy5d
 W91PtFZTfu/vDUcWgDwFZckYos2+7xK+Eq/YsL2aGK2qITHolNyXYZOxT21GKYLpA+lOjkJyYv7
 3o5LtPZ9FnQU8SEJMsrln+/wCN0wfFVTPqrowkHkmmaPVwW7jway7NQswcMDv8Z0v1GvBq0pjsj
 fNg9dws4ctt3QYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: exRBEXK_ktt9nYGgtxvlH_ZWVtzTfpPk
X-Authority-Analysis: v=2.4 cv=FvwIPmrq c=1 sm=1 tr=0 ts=692af28e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1KnY2-9VyibwWvIg4X4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfX0VEwNUGvU+2J
 RAvBFF2WB0JBfY4TEE9peon5TOWFzfh3FBqk+D//a33Iy3cMCdHblQErmvMBmqFLWglmjlgn8/c
 3UWfFzerSCeiDNvg2w/Hn7qjbll6Um4SuquASwgyyg+09mlv9/gW9vUFoKw7B0TiIkgcJEOHixE
 AylWNVUHhOJ5B20H9R+w8NcUvd1tFMgwbWIKmLVpIfCHLfgZQnMoN3Nx3Jkbb7cTcEErgn4Kt+P
 YP/FjG7TLtFGoYhX/GuGPUyDBDd0d0xqGUV/j+2c88H6dJS9gQZSrb1vROvIkPBtmQhTelERtAb
 WZM9XE1cXZ89wkcsOYIUJ63g9Hsy3qowdd8/r/AaWzf3qpiE7rh6nqWgrv8fmGYcvD8NfwPO7eu
 7FkQXniqzLlX3Bvvgrz7iokAIkaalg==
X-Proofpoint-GUID: exRBEXK_ktt9nYGgtxvlH_ZWVtzTfpPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290106

Please, please stop ending cleanup.h patches for very simple code like:

  foo = kzalloc();
  kfree(foo);
  return;

... *if you do not intend to read cleanup.h*. These changes are making
simple code not necessarily simpler. But worse, if you do not read
cleanup.h then you introduce actually undesired, error-prone and wrong
style of having constructors with redundant values (= NULL).

This is actually worse code.

If you do not agree in declaration-in-place-of-use (fair!), then do not
use cleanup.h. If you want to use cleanup.h, then please read cleanup.h
before.

This is second mixup I see recently around Qualcomm files.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
      ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
      ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
      ASoC: qcom: Minor readability improve with new lines

 sound/soc/qcom/qdsp6/audioreach.c | 28 +++++++++++++++++-----------
 sound/soc/qcom/qdsp6/q6adm.c      |  2 ++
 sound/soc/qcom/qdsp6/q6afe.c      | 10 ++++++----
 sound/soc/qcom/qdsp6/q6apm.c      |  9 ++++++---
 sound/soc/qcom/qdsp6/q6asm.c      | 19 +++++++++++++++----
 sound/soc/qcom/qdsp6/q6prm.c      | 16 ++++++++--------
 6 files changed, 54 insertions(+), 30 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-ebe8abad6e55

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

