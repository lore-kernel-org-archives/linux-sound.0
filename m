Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5D3D5671
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240131; cv=none; b=I4fgHxALGXH+NAAYguktt4/itmSxVlB19pBjCG8C/piZGH0MALX/jRFQlFexVXxvz02j903yfHqBAH2ILWcikOSgSYcgOehucmyGPnvZrlg3vGvWl+rM526yV6KSoE5Z07cG6i/yK/bt3tUcRIidTMEWXckeuMFK1ouQVcLRRW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240131; c=relaxed/simple;
	bh=NlQZtn8DstSzwn5GfF6MCPKiJ3wQUfF2KdGszpPbtHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCrf9VaZinWB0QAo3VAClcLg2xD9RJkBZfCCbDxNaXpwfcbjpjzTzmIqUHITpnNnz/KmwK4+ZnQx1dfPK5EVvxebfd/Cp2Z9oQXdAG5QcnQjs+cR6jS3ki9o1ZXAbP/fWRXBSLMv/3U7S2jjvbtK8rU1PnLnQPw8xwMigjdzr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpr721N9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxLWERQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpr721N9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QxLWERQN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jKwd258436
	for <linux-sound@vger.kernel.org>; Fri, 8 May 2026 11:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JDnZkDYkQHa
	2ZUxRXFBjMCxswhOtEBVuTzGFMevyzBM=; b=lpr721N9HQ46g6uRpBntDNQRvs3
	5/q9xR9QM5STLeiFqc+OY338vIxWaxcHWEUScN/V+ne27xYL9QqpTprEmnh+x3FZ
	766LndK3Rz8AbfVNISJJ26ISruo5+A26Wif+dZHQxLbQOTSpAcldq4JB10vw4b3F
	IVLP323ixmGDtC5+oevvxtnTR1pbgI2EBOwE2JaeUbhH3YURNbkdRMLgNLFLyTO6
	ZgzzvvDHZYL10NDBwa77kEjbCSyHRQwojCJacd0RV3IcHP0BogRDHm54moGAPqb3
	qqnhyetjIjGDib0ZnIWenldI6uI/sMoslVJ/xG2Pr2AWrhZ7yJlgR8zes2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh2qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 11:35:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so41126265ad.2
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 04:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240128; x=1778844928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDnZkDYkQHa2ZUxRXFBjMCxswhOtEBVuTzGFMevyzBM=;
        b=QxLWERQNdelnPRmk5/CdjH4qDZjyNRYdVte/5KfnBe4Rklce7JgX49fRVCYQw+efMy
         26WDcO/DllIM0ckcggNBewYffkazf1BVH9vO/K6BnmjpUrUtY+UDI4u+84XjyvmYViXp
         f6/IlaOM4XETtxip5ID1avotckgqoL5RM4sC5pQalMKznwjMXyaPFxbdXRH9aiFwm1Ar
         Te5+yn2avzA3VbLpNGbZ5995vu2+cLe5NVHk4tDEB80r/Wb6SZ+MqKY+FA1UPgR6cX+4
         GG3qJbWLFkgbfR8C6IE/S7pfcyw97bWgVOTEbPH8ahwE1nnHqB/9Sr7wipQuGtv63ijO
         O3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240128; x=1778844928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDnZkDYkQHa2ZUxRXFBjMCxswhOtEBVuTzGFMevyzBM=;
        b=qSpjqFjYa88YDw+CECjRDmGsHliuFEDzFXz3w1rC+ixcB5Yu062NkBzBBJjZhS6jPM
         aCBM9Wchut6ktPqFICMN8SAcdqm8keQIeAzdMe51au6ycPAkxOuUSsdieX1DNVUbIcs1
         SeEE8Hmxb5ARQZqum0zMqhM96yFTr9EGrR8AyacsA6ZwUJ+kT5HcuX1nLrRlMwHrCTAo
         0FT+fUbwA/y/cI0fTdRqmTzgFsdfxN3n1DyoYm59R/25TFAulZqtHv+WM5VMDSqsrSQk
         sd0q8T8zgVwjSA1VqFGfQlTGPQCvT39ZX2i8iVP2cSsmAOYQ3apfJn7peW7keUZLx5Il
         BP2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8D+Qw8myTAbRp+jOdBozvb+Bg0DevtmjH5pZttMkyq+ep1Wuqxk6CpIhC6Bwc2+aXFG265uH0F+cRTPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XO5cVcjhfKMAOXPv749z3Faw+ZkQhws5v8e+JlUdzuDZjZHX
	uRPno4V9SXlUO3WPEHAEGpc7f96DEXaRHn5FoTV5ypyfCY4+FhEjfFIAdYkN8KpP9VHpXtr/YbA
	hUiDVTIIcxQ4xYRkXoeGZu9mH8i7f4uhg1abGiy2GHopC5fjX+RxEi+r3QMAV1TDVrA==
X-Gm-Gg: Acq92OGYEMMqlsFF918gpagHmVZVTA/T57oBd6vvklp1XCxaYt6hpJrRM2Pjcuoqv1F
	+8fX0ewsl0vKu0axU/8pg6Jgs58K8uW7+RCa6RCw40C8CHXIwAETPyB2/ednJkQFYUPztwArkJr
	cQAro65vsxUtwf2boqlGvXcvaMRUhNGXgx5suIhF3P5XPds7cCi9aqDIgsLrHRw8V4+8rDCS4xw
	H6NQOQsjArXeBJO/77C9aol28/PzQGID4TAaYHhOeAosmdIL88KfmrzMjH+nDyvzNCGoXeG6/RR
	I+UJm0gAcUAsNYp8weXk1fAkKrUGAFmpcjUBXglipTJ4Qdpahv3jmXyQU9DV6awKMZcOyHfBo37
	sHYRN0fSO+L67v06nc1DUlJ8jmiSyLNGG04+cmJ7dplDcffLArFPAeKryBdEe
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr94486125ad.3.1778240127834;
        Fri, 08 May 2026 04:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr94485835ad.3.1778240127353;
        Fri, 08 May 2026 04:35:27 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm26616005ad.36.2026.05.08.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:35:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Fri,  8 May 2026 17:05:03 +0530
Message-Id: <20260508113503.3550647-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOSBTYWx0ZWRfX0SgdnKtsx71B
 cLHLrAg93IpdCJMjwwE0iNdYV89jo8y+V9wSsXemJ5YUpXnSXK1g5APRlXA7+KcEDL6qzkZ+fMd
 IcrBlLHKFOEXHk/CcxoQuF7EIqOzO9ciVWLR+iskBvauXWciKUX186Yp+GiGIFCe+NNr1IRt4KI
 wkFSA3zPZynDu1QbX+yiIYU2U2tqb7UAzBbkwsPGpaLGrsmg3rIp0F4QfLu7S6EtpJSQI23ye5K
 nP4MEI9asNebdxjoMi16dCTPeqmsGdy7dKnFDI1aA+dTXfIvhKX1+Tz2eh5iElY9wBXbx9i9Vdq
 zGT04pMbtqquopODSijABNK7YkMnv16/+Cjac7R5tnOx4uK/0P4RTquQ/W1M9Yc8lQYiPvknibB
 l8fmDFzPYHFMCmT0kqdiB2oZ39zmVml7LAiZRk/VyF2u2YQ7SmU57HcsE5cG53gCcIdT7KHEJXI
 xCTCFP2Sa7BnEHaY6og==
X-Proofpoint-GUID: h6J7C-1DXZd8EAZLBV6NhdDiYCGaUYop
X-Proofpoint-ORIG-GUID: h6J7C-1DXZd8EAZLBV6NhdDiYCGaUYop
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdca80 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080119

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
index 6148de1d0da0..ed442863f4fc 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2655,7 +2655,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1

