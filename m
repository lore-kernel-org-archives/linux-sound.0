Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A64279E9
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097568; cv=none; b=CX6yVumrTlEYfxfrSTTyeCTDYC2nBxTGjeSUB6bmnkpgJlnS/fIX9sykFqyczsHpSiSyDWZJ9opNXVJNSMWyVORYNppmFVOc6AWQebonUkFUrIZqR5RVeEcoJ4GxEvbiZW6h0XJo9OS9OS8Rj1WQH0FvViy+1F8UgFE8bnpT9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097568; c=relaxed/simple;
	bh=JA1Emk2GOGrNm0wBvip1tqJqrJtVwNB/O0vGeFWX/84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/GteZOjSVNZLfRlXSsRFvysg0MMrIMuSaRTsiv6bykglJmSQLKyqBCBpCpisoBFHdvgj1ngC1mjdIeY8gTs7FA6k4gz1XlV78ISI0Zw8d8u7ABZhoCtgRMHvV74PRYcoNvP1JC+8xic8i7MY2zpjnH59h3AmRChPGtjAFu3CA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cR9bULr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8XOX31C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cR9bULr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8XOX31C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCFgf1212209
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 23:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v2mAeI36jMe
	fxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=cR9bULr3HuHIdluNoBJGFv+4inn
	oEkch/dAK8iHZXChBmP5YbxIOSs9RppPQ3TOJwqxNc6KjUG44l0NGpnP6kv+bW+n
	93OhKIOseaCH6RpcaT4bQYVVTt2zIv9g1XXzGixEOaqkG8xPAETVQCoustms+8/l
	1XL6XKajpsOZ7fXoIessDCYomEMqLT1Sx6X3lbhM3jZxWSOKB3YGmGnJ74qcBg4q
	AsE7BsGsPW2E1XJkUAqbhWuTQ8OdZtuPblMct+hrtcMMvkjsLExjzi9rEA4GjGOg
	PXDfBsHsJPiT4nYN8l0FHvpiUBgWVuZ9EIQhJ32d6/k+OSx5hXtL/yADkxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj0ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 23:06:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50333a8184aso970326471cf.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097565; x=1773702365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=g8XOX31CxcmXx766z2IReF1IJvIswtIf5plLemO9Y8QXZHkKlFmlhiDNpl3v5o3+zZ
         SC6yDf7u8KyhpmeWRkL8KN4vIbavmu8TGnR/wapjh5/wN8uzqXrkiSfAypXpIjl2LpMH
         NhsYyx9v41ITpBZ9SLwd+I17SaxI1b8VPt1/JaSsnbFLGbE8Mmiacpd/ru8KB0+GiOyG
         6yQtx+vxXwnTukAkBwhS/jqXA+tCa0MTrStzdmLlXk2bZxumm07HAYvqA/NTEo2tv1H4
         gS78ZaphzaKzKMKq6AYNYL4ZJRp4iFJFFoWeO27TWz58d4JoCaJxtoaQHqJiZXruBvL5
         vsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097565; x=1773702365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=kw1i/bkQNUqVtklhJZnUGvUWdpbDwYb5z1TbEdeBGAfnpNKM2HP1ocYIf+VHEyB+qO
         su5EKN1Qk5hMrsBd30ZaUMvgY6ub4ubbt7HaXzXqBTNIv9/NApbRaIcRqV161dn0ghdw
         1xWuHTzGryFFp1uBJic38Kg5IdT7hK7s9+SVq/Zf5RMCAVVwjP1ma5bBmvgQJidUehnk
         5OOhsTI+uzHjkcV3DXkqXHxn8Q1r+YQczQa5a82e9bLq4i5lSdnpdtT0sQWOrJl8IfFS
         QvNy3VAkpbA5ySdwGK1nzj8H4UpKshmHGh3idkEufCBxNA2TgoRaWp64uAKD7YBfbMI6
         OfTw==
X-Forwarded-Encrypted: i=1; AJvYcCUuM+LFINS2lEQIePfcy8rAFCiNkwmutePpz7hI0hE9ws951ztbdbnpkDIivF/St+rpZnzoop6vn2HZRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx14gNYKGNdr+MbA9VNCpI4V2pwDxbxbG+57Sesb2Yo2efw3Jh
	rldDuXLvvouJfGprApPDyYWj+dcD87I7l/CM7GLaJpVZzMZXjppmuiY0bd/79SAjob+xBH+8xlM
	rXqCgEHKNC+Imxh8iyYwr8SETAPO/5cG3+PpePdqKyixG6FmLloy04O3avhfUhW2FnQ==
X-Gm-Gg: ATEYQzwKhLFAWJuvoCNpOkGIRWYUe0VBGGO34eRJV47Sko03nwwXMaYPx0ypzhYlGin
	Q2F1aCPQiFN0pYgMKYb4+gFT8Cb8Gajtyuypuf6ABUHGTyT8wMaJDZdhNzRVOPnDPWLNVH0NBqz
	OYKCreWqvYig8IkHIV7Gek+6NSPhqdAUURU9N/nZ+2drtoVzXQ7OP5X1v5rawpnd6SIATl8RbMm
	ktHXDIgaccloIBHc8+DXdhm1hM+wzrPvJvh8asusEX3bHr8iyQEq4tjWJj1wZfTAP+LScrI9/W5
	hQ3ZevAe5yMkJccsPtXy8XEigSNbfONbeMVzCJ5TgogdKRYLTRd7X3yluP6sIDiMWqj7q8GhaJZ
	Gn6u/CtfWCvDy4YkbKKcjUGXX55TFRYeGdf0MU588Pvjer3D9MA==
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770643685a.2.1773097564716;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770640485a.2.1773097564261;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:37 +0100
Message-ID: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af525d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=RE031ben1CQMdFOqpmIA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _RlVya-On1M1ZPyaU4S23j79DkThjwrI
X-Proofpoint-GUID: _RlVya-On1M1ZPyaU4S23j79DkThjwrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX81AKi1MJFkuV
 y5VJodliGkFjtud0IZpiCIL1ox/GGJnksL8FQwMU/nNDtr2RULS89krZ2kIVzd2DFrluoTUMU2c
 8/rw2hNyFOR+axIwqY/s6F8xNJfNTm32o/0EiDy/rw4p9yLL5roP17tBI4LTcXfVTT3VkAxFwoV
 3IwQtdfbhYgtaWngdkLdrU4kKvODd62ndsFrChlb66vnCWycGC3znakKctCMQzEPC92/EibxCff
 qFZ4MdDUykr0d0p0C7hc+idY7qNiEQjHWE6ZLCoMv6JOlk9s+Ot401thwNAsg5Jiplx8a+qLCOc
 cW6KlIrfdSKYfsvYu5EciqUNds0gE/ea/IAi4BxCQFA44cR9o+GapMD8MeJbcVzgRnF+JtBKk6E
 pDoRFdbSULYrHIXgNjUZM+h/zxEsS6sv2xVArApan5q6hfcSUXj3KpszJyUoUPMLJji32Tgdy3M
 FU/I/UtcYv3ehbMrYcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 samples/qmi/qmi_sample_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
index d1814582319b..247ec5e54c4f 100644
--- a/samples/qmi/qmi_sample_client.c
+++ b/samples/qmi/qmi_sample_client.c
@@ -592,7 +592,7 @@ static int qmi_sample_init(void)
 	if (ret < 0)
 		goto err_unregister_driver;
 
-	qmi_add_lookup(&lookup_client, 15, 0, 0);
+	qmi_add_lookup(&lookup_client, QMI_SERVICE_ID_TEST, 0, 0);
 
 	return 0;
 
-- 
2.43.0

