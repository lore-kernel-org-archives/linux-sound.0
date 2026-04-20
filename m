Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFCC35979
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688253; cv=none; b=ZYG94uStzMn1Rjri3dQ9KOiYXhSdWZCMP6jmqE0I03hDQYJIS5ZonNu//pHOZKJwbL1er4g6yyjtuP9rJYGNhmtt9GPoabBeytO7Zm76CploiUGgcTeofSYtI77sOU5xSYhQzwSxDvdPpPD27mMs8+1xczD6dNvrNEW8IXNzsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688253; c=relaxed/simple;
	bh=PA/QvOlsC0u0/qbxAcT5gkNdGywkpZrUjPHFiDBLqbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tkZmoiaRt7c0ALS9w+klsSV+LhvljDgy1xk1TUOu7M/LHEc3OLRZnJG/YKNtOzhDbV+2aaOa+dLZbY5IMq9qynF5p26l/nKP3Xw01kkx99FZcxDtSohY6voTVx7QBceeEH0ymTfDrf+pE/CrGe7m9jbgaNLDmRmQlLg215Cnazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZVnKx6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvQJTcqT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZVnKx6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvQJTcqT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7ZE4B3456412
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S/Qeg3RgPaB
	xLYXsfip8wmrQzxBx8ciePjzK0KBJRGQ=; b=dZVnKx6gR+f3uTBkOGa7lWvTbrL
	nw8nVHpSkdmMsYf8o1hmDDow8x5W+XaFQnKQQV7mGCU79sZzNFKJd7iouOWNzPtb
	/X0D6zv+siqaNYLtDaEueSawkpUy1QaSJRIkIX1v2nvLk3KtpPGLJ4mZbeKR9Om8
	+JxwKqXb+VbPkayDCpl/gzaIJxHNd2/IulGXIuoPu6DRcJq1yQIqVQn/fuSmDeI2
	bkqIaB+KRFOg1u+bI8LFTJGhwqP7LbKvvdnyT4dIEgc0ZCA2v5zmtgXHZuaboRqO
	mWZjoWvk6q4zefKO2ao9DXsrn55k3QzAT8n+2j1VZBES8PBm0fwNgEDX1kA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjs7mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:51 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7a3715e9e69so111612617b3.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688251; x=1777293051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Qeg3RgPaBxLYXsfip8wmrQzxBx8ciePjzK0KBJRGQ=;
        b=bvQJTcqTi1o2uZPgcR/QDXlFXuudy8NNchYER071yVXXdXR63CpcrGlvn0gXFf7oet
         T3WrYHzREdll/wIF/HNtjrONrv9AaZN0KxAltvmP3XJwjX/FQVydYM6FG+O3p5W1VfAA
         7f643xYdfyITzSqd1v54KOpdYyyffWIqoXhqBap2Moktxb+fjXc9KOpYP7uTYzM0O90U
         xUpuYUFOmW5rXkLwNwYSuUdCidA4PoeG9DAF1RxNCbb53sMbb6JhjmFSad4BxuBVLRj6
         93Ksjqn9yAG650rX1oErSkCOP9FLojYc+CKkBdW0mZHL9iOVrNh4Vd4BPLTLISJwh4Xp
         EIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688251; x=1777293051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/Qeg3RgPaBxLYXsfip8wmrQzxBx8ciePjzK0KBJRGQ=;
        b=JHfzTpwCNopYCxkYna8ODD2WOSh3YFFXHhYTlAME62gmcZZ6ntKSBuLfQcDl9Pkq5V
         GTrsV2ZLp55PWr2W+H6Cu0p7NRHLp+OfMZ9nreBznRBI67f/utlDE0CqAzazpUZzTFuF
         eOA/CGe+BGzPwoZPPR5a7Eb+FHu7bbtBJWMaD2bBqHvezGa08oK2qUV4MG7F3fcR9MHy
         1mjyU+9aN0zUz7EKBASXeS2dfKVboaF0PU3pVhyE+M9li/I4Q/8oLVPZikZJb1c2D9ZY
         YsMnZ71ZTGqeLCTMbTZMyEdqrOBasyx8qmpRFHIQ2/FgcK0SkBEny3TkhD+PtVTiUfla
         P0Tw==
X-Gm-Message-State: AOJu0YxdpiwvUWFERw33wcQvFlzXlw/4EahdsqSnNUR4soJEOmt2WxkS
	sXe7WQr/bmBQ0BWP3VFuudCuCBa+MCauMQ+c6Zc3x8HgjdJx1TGbYgJkZekwz0JLU4eLg2tm4oC
	2ds1hJ5Og3ff/v4t7YuNBiopiYFlOqvJ1TDYWCXsXUWNkbiZG31/lhMDRSa4wkyKnkQ==
X-Gm-Gg: AeBDieuwziaKPHDZV/uI0/aEEXggEHBVOfJLfYlnhZ3mGAye2xT3Ag7YkipKvlAUEkY
	psPUUVEIxSm2Ytwj8nDCHf5mWG9LFzogfWGThyzC+xqKR0xbWoNqrBGtaOPbwaHJD1CWzn34iku
	UdhuFALJFzBthZyljGAY+1Ol0Q/H7BpUGuQ1+8b1qPWu6n849cDEW0lop39x/pltQdcrQRQeTHO
	yqh0yhCBJ17LJdMAXLveFrQ51SjJRrxqtOMooPEqyRtsyYOF2V/GiM8C2N49aVRKHxpN5wdSbFX
	V9IKuSfavUcYcsSQE+clP0XlkiWv1tD/W0bemZlxG0aBVgRRhT+wIwPcnPF3cQ26/ZVQUy5zjDB
	clzxrMgfpxf5aMYZc/67SjBWIr2w4FLJ8eEiX8ysTS65koH5OcSR9mhZnaWTQ
X-Received: by 2002:a05:690c:60c5:b0:7b0:4bc1:d713 with SMTP id 00721157ae682-7b9ed44c8d7mr108157427b3.23.1776688250834;
        Mon, 20 Apr 2026 05:30:50 -0700 (PDT)
X-Received: by 2002:a05:690c:60c5:b0:7b0:4bc1:d713 with SMTP id 00721157ae682-7b9ed44c8d7mr108157207b3.23.1776688250442;
        Mon, 20 Apr 2026 05:30:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Mon, 20 Apr 2026 17:58:43 +0530
Message-Id: <20260420122843.327171-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KZBJLWSoeOvzFOw3ohiaPzpe2hUOTUWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfXweVloIAb/GlV
 Bdtts74NfS1btut6LSJRvb8PQky0qZDq02+ygi1u4uUloeBdoqtbluFQVZZZdzvVtD5y5rFZfzG
 vxTAQrPCyXFN0x1zRT7N/olLTO4Nzc/8GhYoibDEFmAp/IUXf3kl5pkaSZ+SviGhGx7MfO33ZdL
 Hwx13uDRf0xSLmuBuheTc/f2fQTtvDbEpcLi0zK+bNjx7/e7WQHaJLjhP8qTTGxW7eZjjS9mLmn
 Dc/+1LYCphisOj/Fi8wTm2evhCt+E++0Y+KzXbBPrkPFWiUhSdQEjNLrz6LZxjkSnAml5z6SE+l
 MORWGyDMqDoSVek2zu6ipdIwd7Z9Cga/ThH9RgQNePPS0wp+R4TYpa8yr50igT1a8aHIqsIy3N0
 U1sBZ3efj/QkJJ1VR3hdR7s/65a6cQf1ic3e94zWyfVUUiVLxUyIdyFFKfJUXwn0YFriz2M4zKB
 GU2hbYPovOrB2Q/qiKw==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e61c7b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: KZBJLWSoeOvzFOw3ohiaPzpe2hUOTUWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This avoids lifetime and cleanup issues and simplifies error
handling.

No functional change intended.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ded1cd8db831..29c8edfa739d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2657,7 +2657,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1

