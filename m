Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032D3BD224
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082727; cv=none; b=CVsoIfVvvx42OZ8xkim63SW21K4vhDt23Hnnu4FeDa2LLussCYs4dCrcU73AurNgjnxabwb1wDxxfK5OdDAM1ox7QZy+2VrhggKobp5axkB+zGLPjhzu4gM/HXAc8wFJM83SAKRZcXhDxfLIt0O9A3zgj/sj8HxDNyv0UtW445c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082727; c=relaxed/simple;
	bh=Cwg1+vByOg2sv4Tg94ihraEmYWWy9x2jxIZ544ZXcVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dZ7GZAZQQ2ow8AmLea3oPZcKTpdUw1KhrhFb3pxr3A3XVFq5fS2ZVsodNxvnFCadYdnN/EL4Nh1tv3Sis3Qwlt4qoGtpxIIjgwqAXXzXThUVF/s36jf/n5+3ZPFiK9uDNjjMYvzfvsuJs76GeRA5bLopyPhYX8/teUGUcHs4cSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqovQJ9Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6TOmlYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqovQJ9Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6TOmlYJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D82R0x605319
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TNMZx3Thj/Vh4IZ5qumE5TX/VQZLtZF3fa3
	bvPXu9xs=; b=cqovQJ9Z8Rh4K9LrgRFPzgE8wCqVel0wBHGX4PcNqID+wiPh2Aa
	M3QwW9qxsynfW9ayTjTSxRGYCIGjgIKNXIyFuKpbPd+holOxJBS9G9gdzC/Ae7O/
	YGVeBQ+J7NT+tv2Jq+p+vMjfNu6TdK+Rylnd5tKVVdA8RINYxjpMPr8RJbRK70uf
	hWDFnnwORbLVQawC3uG4r4NQG05dGYYrKlJXZTQLDoG/v8m6ux8SS17R/6ujJ42d
	AocLrU+FdEinYiCz1HfYXgnKPyTHCvAbLBJVZmJFoH/rNOrINOYceVFE738IT9IY
	UT/j7T0y4CBI4xd5teqEiJxM7e3LtWaLDaQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhw5wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:18:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953a7e2c35fso2035736241.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 05:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082725; x=1776687525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMZx3Thj/Vh4IZ5qumE5TX/VQZLtZF3fa3bvPXu9xs=;
        b=a6TOmlYJwuhct5heLSWT43Zr2JHo8hrHdVPsGuxM7nRKEEXh3Vhwj8TvS9cb1QDl41
         Vhb9ASlkoZDw1y2n1LXypzojOUot8oNIX2OYBacAZxSZhAS2g6wO9BT10BnnLwL22mD2
         8aL4thCc9vOycImIkrcywv1m+mNjyhRfUrNvBQNn1SqX37GMW7llszy8VasT5XdNJdeQ
         9so6Go/+nuBvb+XnT+Eedbdla2HCwFwBQR7kE9swLpzuaBiSRL9C//lCpUKE/qhgQWkD
         n2rTHsSG1BdI9FfMQXExlOVn7Vy6LFVRJnCFP6e/RhzHLKfxO4kMOczWw0oR42edmGor
         +GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082725; x=1776687525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNMZx3Thj/Vh4IZ5qumE5TX/VQZLtZF3fa3bvPXu9xs=;
        b=P1zLZD5sLjVlgr2sVQa7hX9sy4RvUb5nBa9i3WRPD1yhOyCTrwl+sp5CJK5604bk9Q
         PnjPc7Js+pR4Mwh9B+ns+/bBxsFalBayRbXnjmGfzGM+Iwj4wVIQjtzmrEXnAJdz6nO8
         dLr416eRImvIygmtS8iMze+z7HVlBQIlDmz055xkriGSwMhh389/X/2ee1tGCxH9HPR7
         8ETITNww3iGg2ECJb7T//ZHu8FQsvCqb+lO5kYRBJ4oKdLwBnFIgvspiXV9+Uu6CP7Kr
         m3M28Ze6M2pmVtyO/O0/N3XrbE2XpCWh+cin1qcUdHtB+Zjm81Rws8nht1t9aY8uwaQW
         VdAA==
X-Gm-Message-State: AOJu0YzIrNkK0kck3It6nDQcQTn8mr705BQhiMX6e6mupZyHg2w4Qa2Z
	nBLLIqriVPsiMtJwPGPrMwz1Nv+0US0Hut4ktGTGt1Ax3o1uf4P7+89QBU/cD5KspHNNMM+OPOC
	DxA/mLyqnsAkK4zBPavE4obkYFutljv5AsNvUqwV0w52oiHOvfMK7lXSoiOnFbw2Ncw==
X-Gm-Gg: AeBDieu4xJqsCnyuWiU3LSdddtjGMcfII1npNTMDffdnY7pK20r9PTkH076n7qqRE7R
	6A+boSEDLJiZSYCL4Lp9T+/TgeZJM2KGYmUJ0Gytf8ywq9wqcafWUEiTJvAu5bNqLa0G4vYIgX/
	Vb8AVu2pql1hwwSRpbHUHXTZ23WbDU3UiuZzGPh07pejv1Q7OpVj3HFaRlkC5AUO5I1zrCmANAF
	VywDKdRKWYl03PP2cnCWcl5YYxWwrnZ8y5kl8ZeuDIMVD3oklj5alxNZgyM7EaDAUI68j+6cgHf
	PDGWZVRhCoY8csf0kkR0L9U1ENLhmX4TxcyF5xv3EOjjHe4HMbdDMC9ywOo90J2A4xInvacPBPy
	fpm+Y75lHv/LYdNJw7EfGlnH+sVKOvlfc95ZCxCC5jBundVdu7w==
X-Received: by 2002:a05:6102:4bc7:b0:5ff:2569:cfe7 with SMTP id ada2fe7eead31-609feaab474mr5155915137.10.1776082724711;
        Mon, 13 Apr 2026 05:18:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc7:b0:5ff:2569:cfe7 with SMTP id ada2fe7eead31-609feaab474mr5155898137.10.1776082724329;
        Mon, 13 Apr 2026 05:18:44 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568c185a71sm1449231241.7.2026.04.13.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:18:44 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Mon, 13 Apr 2026 17:48:21 +0530
Message-Id: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfX5LN4oURpd0MJ
 G2wB6f3b4wk1L1PPPCqkiY5QbDA5gFJEFPQeGd4k0wrQh76Xsy4RYhYz6FwiEh08aQKShg8Js73
 WByi4g3hwOgithia70DF/tkqeafO6ulbfmKrHl+juS2VccpEbycmpIBcLo1N/ZcGqIJ8D8MZ7UE
 Uk03GGqPmJlwiP7IPyqmcvKY7TzeZHypKwqSTixueABJhawAv3N1cswl1qLvQIKiAPtz3kmi0HK
 YhksTyDp2vCBrphGyY9Jg9y1bIZ1ovWU4h1eGZrXovX5+BgR8OGGg0j6YV9bBAqvp1Usaxc/j1e
 pWYovb3IvekMh7SKE+6wgNmjQcGcvxyqUFLrWYEXRXlwfqw3LgGsSUuzow0ND/k+n8vOIzDsXo/
 Q0EpISKcmAeb7vJqJULjTH/RWxkeLqH39Iqub8b0mAFqaIcX7xkhFha1a4vsCUrYbWABrL9IQuA
 kEGbUopub0UiKmK07EQ==
X-Proofpoint-ORIG-GUID: -PrGw3EVnzzbBepKBMstpstHVbNuEAPu
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcdf25 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=AlpySQgKZDKZOEJvUu4A:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: -PrGw3EVnzzbBepKBMstpstHVbNuEAPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130121

This series switches Qualcomm LPASS VA and WSA macro codecs to use the
generic PM clock framework for runtime power management.

The drivers previously managed clocks explicitly. This update adopts
devm_pm_clk_create() and of_pm_clk_add_clks(), allowing the core PM
framework to handle clock enable/disable during runtime suspend and
resume, reducing manual clock handling and aligning with upstream PM
usage. No functional changes intended beyond improved PM/clock handling.


Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Guard optional NPL clock rate
    programming

 sound/soc/codecs/lpass-va-macro.c  | 120 +++++++++++++---------------
 sound/soc/codecs/lpass-wsa-macro.c | 121 ++++++++++-------------------
 2 files changed, 93 insertions(+), 148 deletions(-)


base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
-- 
2.34.1

