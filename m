Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492728751C
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444875; cv=none; b=R0WxJAd1LqquCIkyj4CYzRbFnT2HWu8dwCXpH8FaRMoR+YgvM4tVR2os7QuB8QevVvlaEa9OqX886ZnYkGMtgqu4jobhd0ZtngV22zwOuqTrKpKBqLmh662b61/Jv5A/zTwdWPXnolJO/+A0im8cjrh/6SYTmwenlujNI9E7+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444875; c=relaxed/simple;
	bh=rwxIBSU4wpJK4Rss2lAtcFVb6oUwF93lFV0DEUIIzEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kvDi3KhzbLGrakXpUwxade1BbnjcYMEJesYcXtMqA3PKYN1SvWJcd60KnesAW+vSSRAn0octdoxnBvB5ADGD/SrznOqSFZ7bGLiw5PdVKMjJz6iwzIBoAmTk8JtPKGwpNj78L/lyeLO4OI0MPwUV9zb+QLg0C3e20SEjuBWhcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdoO4htN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdoO4htN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SElC9m028920
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 15:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TqvCyLn/KtAm6zKua0D07MhryvAsfRaF1xH
	groEq9u4=; b=EdoO4htNLpdp60f+0yDBQajbK9FnSRPeZxZpRBG+GZXCzu3ThcN
	3IFgCE6S1UZl4PNfIh2o/tGnEKlNBhmJt2s/nMWhXLCi5xXLPpuvnicrTpda5wRD
	f2DXh/IFA0YFhuJyOC/mqzBeuMGv3yEAahEFXi8Bwfw9MOW49bmMywQo3BZMG0/V
	3iE+s/9UD6Pqk5SaetiBoIbItDyE4rPqLL33ob+uSMHseEN1TJ2Lt5W4Q3i9Wh7U
	6gmpP/DO3Kv0+VVceA2iqV+SK2g7MeD5CuA+7P7qCdK3EZ/L5/Yxs8724P+TBk+U
	udLKEmrLTEK6jUhhLsdzrQe/CkFMxx5/hpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf30jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 15:07:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7429f7f9ee3so3416912b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 08:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444871; x=1749049671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqvCyLn/KtAm6zKua0D07MhryvAsfRaF1xHgroEq9u4=;
        b=IPY5tCGX5iWbcYW7yvmv/TWwqq+GCGOMXSQj7ibDljH+ZZ3B9J/KN6DFnhUwZkorMH
         CJIM4b84B33tYPZVqpxFw576u4VA91ZhMhWgscEZwZBHi2qS4o0Cq5xH1YWBM8wyRN2S
         elsiwdvnSQcP6l/njf2hw3PoX+tpy1k9RyJeWkkiKv9X4nZaxbFpd3A8UCrOHywp5Bh1
         dXsw1IAvYkVKZbGma6qFdLo13/E4iL3NNgsgu4ptco4bsuPZVXGMrieTc10I/8cmdieD
         wqlroipFjhLZvmnVCXNbIecfkx1nQyZpTjOFLJj0dhr8aAuWKP79WNVC/h82NyH/VToJ
         zJlQ==
X-Gm-Message-State: AOJu0YyYVCyEIk6G+34ifTO7dR/26FlfHh8QOeQFCTDL8nnBPOgh3Pwc
	7QwMz74dGQcNER8G6z0fdYEMJ8Xt4YPakJudZpYwdR4dn9otwgX1UAkHtXO0c4rxV85N+KcaLNr
	fTOgJHjwwuyQswM6a2qlR7KLJZupDc/S75sfGe57qFawTpiKww7Of85gAzSPB6zu/Jw==
X-Gm-Gg: ASbGnctA82Ze27l0tgnFmg5UInt1LLqLTUHh4J1Gdmklir6eTupyaUC5aOFg+tYpQA1
	FLCdDNtY0gRHspdvbI4KEReKgPOyQr5SnySL2yb575QdMqgZKFONK0mC8HcjQHFUArmU4qqyNWY
	lL5ewBFDOiueyO23hezKcq8Tgzhs40qGPRl0nePdUuDprBRtP7681FyfQILjzN0EXvleXyGg8af
	V1uGgZjMMc53dligxyXbcmSnT8YsJEDZS7XZ2SJJGk1JqQgQe5ZX74Xa5hgzKBbtsiOuJXGXHwO
	+0+ou5zU6vawoIBFojYQht6LWYbETXuvGacZLJT0XrzeYD1N
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr29011110b3a.18.1748444871082;
        Wed, 28 May 2025 08:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd3GjaWRf2ZUrRS+emGlm7BSCdg5uZ2Cw2RIKxyTINEtl0qgcmEHjC5BF9Immjzf3MZcpg4w==
X-Received: by 2002:a05:6a00:3d15:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-745fe083538mr29011057b3a.18.1748444870643;
        Wed, 28 May 2025 08:07:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e340fbb8sm1373211b3a.106.2025.05.28.08.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:07:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/1] ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links 
Date: Wed, 28 May 2025 20:37:15 +0530
Message-Id: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683726c8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=TweMsTatiWGVkviqWuEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Nya7QTslhvoYVD2cMLXS_z2EozCOe6Qg
X-Proofpoint-GUID: Nya7QTslhvoYVD2cMLXS_z2EozCOe6Qg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMCBTYWx0ZWRfX20qQTj5V4wWc
 VQevaZhUyReqkclsSdYNDev88q8PRob15s7x4iSAORwHIVYMpFY2G81Hcu6ooaO1zcp5p0ZG38E
 ev8S4iEGwzYpybuf4zK0Af0FzBqxqRpBShYQ662ILx2Uipoj4wR+FFz/HL2rOn+blInI3E5Srqn
 aat9SYM7vSX4CyEec1S2ZuI9fe9b8mbF0CkX2/Rv8GhInsXWB+jSj5oNEy7tmagLExpR7KAq+hl
 FL2SkmLd5OlW7KUiFK3dK6fRMKKYM2B52DHp8LSGTrnU5E5VRRJhPZmeq4tSoPchEKBZfelZlT+
 cqqARaakSQLokNP50V80VRNg1hNUKxUZAD1ZuSPZO1yZ1x1fXFpqj4cuZUut8ItEPW/8aW/t+KR
 CBXxKl43fJO/xRXX/6OpmHQHKGmutFsbpARfAVLzDHHvIqP5ajeR2tec8m03w0382FkB3gaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=718 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280130

In the existing implementation, the link->ops assignment is
conditioned on link->no_pcm being set, which generally happens
when a platform entry is present. However, in scenarios where
there is no platform but multiple codecs in the DAI link,
backend operations (link->ops) must still be assigned to ensure
correct codec settings.

Mohammad Rafi Shaik (1):
  ASoC: qcom: sc8280xp: Assign backend ops for multi codec dai links

 sound/soc/qcom/sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
-- 
2.34.1

