Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615328BA87
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444877; cv=none; b=eU1/nikLCnBt4gOoT80aAjOru/VNAGoIssjglmITD4IGllO9F6loe5gMXc8IMkXxp1rlTzWvmZvJ/vV0iW8TRHTH7efl5cAh0Alybh4R4kXYfDU1SGtKYvxArnw6FaiBkOhhYG7Az7c4NiK9bhfZ7GNhAMEffeXRu4W7fPdGccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444877; c=relaxed/simple;
	bh=eP5T/3qpa46WCtYicGSqpDmblYqTBRA3wTFS43IZLJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eMnObYWSG7CuDG0Wd6wxdvO25umZUFs39gW31TxsHgMXL+p54tSqi0WSv/SrrZzQfIuv0ebTDla5T3Vg1RaksmF8fhqXYbI8U+pVuf2ZrBzHg862/EA2ETnwUTaJkejIqhRaiR/QKq1Zb2nOuQOPxCm5fZe1AiQOrf5u4ACVrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7heSTcY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7heSTcY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAB6eV012234
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 15:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gb3xYR0twSf
	q1c//vnklZfUitvGdMHO5hjz2yEsPShM=; b=N7heSTcYMgQVcfh1o2dxo8/pNnv
	hivx2q0ojUQrcqKDhtFmqBZh9Os63/Aayc2nv6TVv25dquQN9E3WXOqz/3als0Kh
	uHCrdisqNeI8UOLiXRqpa+Lrs/DZIaImgjNn/0Z6l43oZ/5Lw/wnzTJefTgRtWRZ
	hLnrt/GPBfvPPIHvCA1FXVrjyAomXy7prBlyfCikxbZwwKoU274Q93C/o8Kfzqx4
	PXyFk9TIJvcYil3B+H0CLHqZ01jK+mX6U3Rj106OEmenEu8oKWHwwAsO4+b2I0l9
	MHuo1rEspv7/WtUqflvbGdjWf1dwikkSZe6ahIQVSharCdwofgh+CUz2tHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691d4yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 15:07:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73bfc657aefso3172554b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 08:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444874; x=1749049674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb3xYR0twSfq1c//vnklZfUitvGdMHO5hjz2yEsPShM=;
        b=VMRmSVO6aIpubOp5wkR+0XA2n/XtXWcs51lvuMKVmyp2VC6uvbdx/ZbGb7T+jfAvPX
         8MGqN+5Bfwpr7pEFEfp1NerIdRmk7dZmxxA9AxVKsO/Bmtn3oGwijXJzZsH3TTdgM9jX
         R5kGpq8YhMKDPJrvnRby700x+Ouqz9CwvBnzl1r7UPIMRsPYs/Ej7y8FtMnjdxTNaYkA
         sQ7MOhrl4byX+K/R4yh0WwnpaPf25Fx4lO5s5tYDe6Nhr9LDA9nE87XcRbPWST+PfbY8
         6rdhI6vuYJIlo5elPiLJPUA5ey6u9shJccEn+52ux0gEoagPbzOoMXi8vFv+mfZd+aIa
         Uvpg==
X-Gm-Message-State: AOJu0Ywurcpz1+94CR/gjAeAClnzJi5WTCki2RYT1tuezOAtHRnFeDzN
	nF03RU8ssY6S6qKJ4c5xHaVy6JFBP7RGhdYMMmFj3mvqFuB2exs9/2TRL40mUOdcPd6H9HTl/DY
	mFK+uZXnybz2K82auMSiRZVIqZhLQFAfvsXQCa4J2raeGr1zUrpf7YGR5dJ0A7zJ0RA==
X-Gm-Gg: ASbGncvum/yHJvhlK0BSU+At9uAVhZunHMZ2i9Z1DestTY9sM7oceFgHVxyYXVtquBr
	cVJWLXyU3EI4EUG4cCqic7Zo3M/cNzcVGOBwgJ/rF6iY6TqgFwsKTGTMpdxw6DTBWciVKJqe7gz
	DAqAQrzzUl7cFeWc8gG8/o5GLs0lmHB37DNvUkO8GH1BfGAAIEpwpPEHYK22wGqs83fopwnON3A
	sfvh6TjzwYgTtOukUvdswIxCJJQkPwlRKNb/MZkGzrInxJGCGUl26In/vQ6KfodYj33GPwjdj5t
	uypFJrh00bojdAzGbNid4Un93TRjefdDpffquhiMLX0i3g35
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr23275025b3a.5.1748444874056;
        Wed, 28 May 2025 08:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2DPZNzIWOgIK1UTiCkv93RY2irWaXKYNcC4GZJqV7teGlU+c/3gBg+IH85a/2jZay3rIAgA==
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr23274987b3a.5.1748444873687;
        Wed, 28 May 2025 08:07:53 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e340fbb8sm1373211b3a.106.2025.05.28.08.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:07:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links
Date: Wed, 28 May 2025 20:37:16 +0530
Message-Id: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=683726cb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Tf-tFfCcsC9FfDuVxHQA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: CyqSqL2W0M2YUna1e70ukfNXgERzkHu8
X-Proofpoint-ORIG-GUID: CyqSqL2W0M2YUna1e70ukfNXgERzkHu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMCBTYWx0ZWRfX30A2+ITQIReg
 dDD1DPAFpsHzviLoQ1c2dY3QRn+OvLGxYrnUtNjyJY4Grpzhcle6HnlFNSHNP5Xw1lIAaOA0YLa
 QkjkwU83jNUY7LKis+Au5niwupSs57tfBSHaLGtOxQ6k7BbhVBvwcLQz25S8+B1b3pOoqljjqeQ
 6yE2vMDWWhWo8lPH04TGU4uW70zzWTXfif4ZjOc2PLxKR0cBlEAPyFb5bY861aD2Rh+l+EMe24i
 s3NVKghfW8Aw7yM6xLcPZdulWZLdmvfc8gZDvlW9P6rn6EVDLiQJITJlrjo8WfhsclakBoW5dzn
 1uvj9FgYXuARSu6aw8dlfJ4NMMMj2ex0okI0OjNn7gxXYr79nl3ueivi51CtKR8lS4il78t+nyy
 YNvNpOk6jt8VVDc53GPEWd4ErrXF2HDfQnSHbW7culECzxITHQx6OAx+dCI9tHCiDatdMizu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=982 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280130

In the existing implementation, the link->ops assignment is
conditioned on link->no_pcm being set, which generally happens
when a platform entry is present. However, in scenarios where
there is no platform but multiple codecs in the DAI link,
backend operations (link->ops) must still be assigned to ensure
correct codec settings.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 99fd34728e38..b1b31d197b42 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -147,7 +147,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 1) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
-- 
2.34.1

