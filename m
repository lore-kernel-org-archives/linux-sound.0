Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD7D28B4FD
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349559; cv=none; b=A+0TsngyPSu8Wn2u1juYVU5fk3lohKMCCpSbQRPrdQWDEAmVbHx+PrjeHG73DNLPfLVyfNnXWsz/OdcYOkJAeePBOLXN2N1nhcdv6LW+GF95+3IqNztjbmbHVgeRLvA7B+il5CIBPvLpGFao4V98jndB1uRhFj9q8wgymGjkqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349559; c=relaxed/simple;
	bh=KpKDXoemsveBuX/STj6AV8aHp/CuCY5D2sBI6JNWvuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PCedZu1UDE+nDkQMRipFtRA3nEmSO6fn3Qpq0uV7TeHqt/9MjDcLM8hgiybSp3dWssw198uls/2PvrEhR3R7T+QOUYdVmbAQT6ePIUV2UdjeDLC4U5yqLyOn9DfmZznPF+tS69CtNkJq9ISKt5S6vhW799h7rvE/YPWZBCX/rzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6l1ABGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0No044d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6l1ABGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0No044d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Dx6a2114256
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/guRiMdRuAu5Z+FMmb/rp9vrrBjPh8cAJTF
	k719b7NQ=; b=Q6l1ABGLddUBWDYiQK+uE5EvgNGFZgZm9beQ9+OzpGC87SycSUc
	c40DgI1JaGVnz9AlVI0M/SzCFsnWZmLwoHqUQ6fWq56T0tSR3BvpoaYRJuqMctD/
	9v8CJ4dXM8sExJvNXPhpiuDBih/yCzTvFZDuXtsQumVha3zM3Ut4lyHBwRyl5NgM
	CUd/0zmGUa9aXRjoR+K4oCt9mquVDGSnAkDFc9bJdsC68NUe211ndKkZ/XyRcmf6
	t2SpPEPOHrNB058//MvtGW0nbguf7kKw8bq0qZJaa1/2ewVJOj3AGZGC9fx3gkl3
	1d2sf/4F5NycL38qghftu2tBctnwvtqEADA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm69h11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 06:52:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297d50cd8c4so170892265ad.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765349555; x=1765954355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/guRiMdRuAu5Z+FMmb/rp9vrrBjPh8cAJTFk719b7NQ=;
        b=Z0No044dpA8dUTc+ckD7Tu3kn/RDxtHIvaJFw/BwtTb7ObMtw0WRZC61MTIH4qSzGD
         TBY/oEbzUiKcXD3pznXcZRg6lgMzCegiSF38fp5xkZCqLc8LsDnSrcsEHTCJrOejTJhh
         ZqJp4CoctUUkq5FcGa1P1/L8JJvaCvuKbPrI5xi1X44C3M3yJKPRo+QPLX2KF0CREO6A
         OCWjowsS2THerP8liceKdWkwth8FrL6N0eFqcRxhnDDFhtz83iZ+6Ee+21Yu/Zf8qPlE
         0fpVlCaCEz8weYLe86/Hjl8ZtGKpG0KH0eTy3W1HLEh16rXWsWtyK6t6ITHm9s5mYSNh
         qM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349555; x=1765954355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/guRiMdRuAu5Z+FMmb/rp9vrrBjPh8cAJTFk719b7NQ=;
        b=HEuAz/mPueXVS2UE4HMA98W4uNBte3Ao4VawnnLIrj5UrTwPqJ/qtxVHURBIWPubip
         tsBWEvebxsDwYZwXp7x93qnSMKaGEaO+w5viJzLbxt/gQqBnlpCvpG7NJMe94sUQv2l0
         ghpLkREWjp3Q2D1W319CDvP5PqlB7QFkqdf8AFrxKH7edr6QXRbF4nDEFLDNR8r0amGN
         CmU0puWto/+4qYFi0fnA2jeBnGvMr6YOK/rL+5J+R/QCXf46GOyyH7Zgc8p+rZ8/3SYI
         aEAh18F9WhrqDswtAUonr3ztCinY6afRt+zzALm64S/pD9izxRYGxWLY+JXV/HeLrHkI
         yD0g==
X-Gm-Message-State: AOJu0YwCqh2D0qwH7m+s5Dnwn0YOtp4t5wSV3oYzHS49++QfqkoyeOap
	K9FDuWWVLOSc+wnDN7hrielJLvz7qUubjuph8kVu3t7ND6apdNHTs3QVGWUrVrvyPb3brTkTNj0
	C6ELAcO49TDrl/nlJE+rSIhWM75PFNyRTnIDJb2zroBqPst2A7AuBxJktr6rXA3LlIQ==
X-Gm-Gg: AY/fxX7W9QAsBW/NSVv8+2rAjVt1I24aohIdTOzc4fJoSaP0YIxgdbo4V4By753t6hJ
	fXSUxM7jZyfGvDQEQrnwtAxRTB9cFBMUfLFFv7M2X5jkPUgogUdbBoyzSxW8U+ASLRXQtezzEhb
	jMlkd35X+HTT/lMKxd6q4eWTVgrTQihso6kvHnGCvAVbWJhtcS6Hz4YB6iXIUGaOM1A5RyUTfi9
	nv3UvqIsuqow73Uh27WhGno/XCSYED9FRUVMGH6FChw8VUY3XcnKWTGD4E0oBTIUbB5Bw51ymVn
	gt8j2/cLXaMwVbPgayftzeb28psgVJW8wpHDH4jcSP1hqp8RbuanYaDZlLRT4XD+rAp+UNraL/M
	DUdpC2MQ78hWnpAU0EhC9z6ePLyq4jWiAttEsHDw=
X-Received: by 2002:a17:903:3508:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29ec27d17f9mr13992555ad.47.1765349555523;
        Tue, 09 Dec 2025 22:52:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyFa3r0LjOGGGw6Zax0bfNyI4OFRdfM/ejz2rz21XatErfmeZxoIjj1Z9zeFJQ3CaAN/ssUg==
X-Received: by 2002:a17:903:3508:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29ec27d17f9mr13992355ad.47.1765349555064;
        Tue, 09 Dec 2025 22:52:35 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm171728205ad.81.2025.12.09.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 22:52:34 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling rate and PCM format constraints
Date: Wed, 10 Dec 2025 12:21:54 +0530
Message-Id: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2_kmIt4DQdRAmncnsu3t1C9Wk2fph_Gg
X-Proofpoint-ORIG-GUID: 2_kmIt4DQdRAmncnsu3t1C9Wk2fph_Gg
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=693918b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fYhDv7OwVwtdUCyixT8A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1OCBTYWx0ZWRfX3XSGAIlKEdjg
 hVM9bUhjsxe9xi4P1Z6tWdtqpEpgTgq+Hz/kO9SM2PzXQ+99b3rIhHgg+6RNBH2MNYA98l4SjBn
 D+ip0dLOJhMCi/D1nix6B+zOdMwhs7oVWr0p/1rt1mwg2KfS3nbK8KFuYCDhnkEgINumC2iJeiZ
 gOM6pIcZw44EqDPL5Zh5ZmsQ9OicIWmmy1i+ofI9OhmmcnUdOKAYX1V5lbb54kvsyqSNf58ZyUf
 IBU2svIuij2gM9jsvtMnevYpmW7mTInKrK2jb7UjeId4hpumxsFL6hhGtmlOHOzsYJm3cJK2jV1
 JFHGUTFPnGG66eENYj8MXLIlMbFgMTyclrGfaN+cfDj79QIyOpjMz4pkvDVybAM2D8UAZloHC8C
 ZACH+587nbgsl+aoRDXftXMw6qp8bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100058

This patch series expands the existing constraints in
the q6dsp-lpass-ports driver to improve compatibility
and flexibility for audio stream configurations. 

The first patch extends the supported sampling rates to cover a wider
range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
diverse audio hardware and allowing more flexible audio stream setups.

The second patch adds support for the 32-bit PCM format
(SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
and 24-bit formats, enabling handling of high-resolution
audio streams and improving audio quality for supported hardware.

changes in [v2]:
	- Updated commit description as suggested by Mark Brown.
	- Link to V1 : https://lore.kernel.org/all/20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  ASoC: qcom: q6dsp-lpass-ports: Extend q6dsp-lpass-ports driver to
    support additional sampling rates
  ASoC: qcom: q6dsp-lpass-ports: Update constraints to support 32-bit
    PCM format

 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 108 +++++++++++------------
 1 file changed, 52 insertions(+), 56 deletions(-)


base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
-- 
2.34.1

