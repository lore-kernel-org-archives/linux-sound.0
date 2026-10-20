Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481960;
	b=vxaT30l/hn+izipvM4Gvj7M03uCdFO4T8O4xrFo0FsFLxT4r44jLH2WRbCcXss+phzoD
	 yyESzuEMr5vIPecSAb++/5LrPZeGirlFEetkUAzlRtB9RxEufrKp6Vobu98HEq2u+SW/B
	 mcPUZ9gfHTABC7Qe0VolAujrvjmuRKdf++RTnxdz8OJU63K8u3pJ5xeX00qfEaTMvulPL
	 F241uJjW1P45ejSpYyCFVZOg+sQD6cSfY5+CniSGeGJzMTJse5fZ86G64ErdnotXS6Hbk
	 PqjXsShHz3OX3rJc2zuRw/RwIHAfz4ncGYVO7DyWAa2eTKsiKURvHDTq/yuN9IwbN/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qoA6ADeVtXSq9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=;
	b=f6gFvLgB0shlncLDMuLr/brALx4ub5LnNcSDa9aC2po0iWnmjUYLOmG2imbHEOmvW3D1
	 QUgr2O9PJ5PUgjq0or7OpDkTDIAWynqnlMaSPuPSRyHxvFedjnkVC/gRrBcvDDrhdkB5b
	 LTeQutHY+JwSMZJcZlS1l/bFB6cHT4wwQ3svZy92niXOg8ieQacBqrUQhj8YS5JP9d5+i
	 Q7B6GiHXizKX33Yg/NqgpceVKitlq7z07o+1L1Y4pWVuzGcF9CugQ2zEIHI/41HfVKa/h
	 sLxsU7PJYce5SM6kuhzbG0na0rxzqHThKbYw0eH62HG3fJMPdCx5+sPlc+dpSayxYVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4Kuknhs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8d5nr2D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E978606A327
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E978606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4Kuknhs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8d5nr2D
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t58u185780
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qoA6ADeVtXS
	q9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=; b=f4KuknhsLH070xKg974nmwJrNAc
	lBI3yzn4D6mV/ibCdntGHPF/AgmRzylNGT/On/T61J1Gt4s05eAbQ+K3nGnMve0R
	p9oLw52f0zZXvwnE5C3AR05Ug+9d48+RvLLWr+Q/cSXxsfml6LmuTq4fkt0s7060
	/B2s0xOrTotlWT1iPd8f5+o69Dfh/tuwTFya9fmbmwrK2rmLCCWHCFoFKrNXETQU
	A2BYXS7VnQN7aW8H+Vc/mIRDuOwgAiYcSlztqSDQ9mzqKw3o1S25S50IfiXJh+Wv
	sqowOVmkKPFzKyUm/cq62SjJ8MnekRP4hmWgM6ZHzlWGzaGOmfdHNde1xUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nse78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so762849285a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481958; x=1793086758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoA6ADeVtXSq9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=;
        b=J8d5nr2D0q1bqqO5u0t8C08ywBeYneEP4JOgEt41dFbafQ7uf8dJTgc6VtGQMJCZW0
         rcWhpZ9Wc3f1F/bLLuDtAlq9DYIiDM97tHq4wPRn9BIpPzcrn59FEoX4he6A9808rdUn
         B3BpVeMHMeG1RlwMOjNr1L7ZoCsO/Iheq7ZtzbizmIJe+Q7MuiFeoSFZ7FrH6cnLEo7c
         MStIrfZ91uGCW4ofsBIOnJp4sAkfzGF5Mo96TbVj4UnXmkR+Kg077rGTQWDW5TsKguVd
         1bbIGUPLQAx9YX10dz7xuRyWroa6XZTZsIEM64MiTFVl7D/IgrXygRi3PL1iQtIjrC0k
         Si9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481958; x=1793086758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoA6ADeVtXSq9JMrH4L+llb/0nFEv/ASnOYsfH0syRY=;
        b=DayOYqYpwZhuhYj+iwTzd5+b0J+xqqEmPYAJz5BJzg/bPf7nWU53zv2yypmCSyzLsG
         3AJe0Tb0D6PAjqL/iDWwOl3fEK7/1ZinCva0qtvJxcDrvNWMdl7zf+VTq+4It/3NXZIq
         cLb0VAG7oqOnpwuhEU1buMpJB2uBShlAN4dNVbS6TvP06HNzIiSmxpdcAB+983z9t/YU
         Xus6Rb7CVTkKTCPEw3rPqRu4DBi3e1JDMU1c8i2r9IyAuJpDLamvG53Hot4Wxp6UGwNv
         ttd3oUEyqrrvdEfNCelXFl12xCRG93CgD3N4BNB02ZJHPOWqWN59ZvOnmqRxJQ+yObfg
         F8Yw==
X-Forwarded-Encrypted: i=1; AKwUvByiyJiKtjVn0f8Rhz/S3j2wsBD6XFUQAoOnqKt4l39wXglhyPp2fTyj/YqXGZSiwnzYNf+rvlmp9gyY2A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIglNrfYahjyNkfn33nM+2XFQ0D2/kj3v+KbM/Pgn8GG06zDq3Q
	Q+8nsyxjhom/vlcpw9GKc3I+mkm+8pDl6hblHq4u9K9VLlWE+WUudb5pGHmvPNnBVBD4xb8mfvc
	u2NIXLxV83WTDgGlTlQCL3Y4rmfAmkwZOHQGpgHEF+oN7Lfn+KBrGb2yQnWiiBUNSZw==
X-Gm-Gg: AYBFou3vswZpn27JfNjx/5ylLVPe8CshqGkmFAAFOO8XtAg/vnRUL/fHePtEKYE52jU
	nCfO/XaHYmHMHee7u85+wZA1+wcg0DJP0ivCvvuMARq9I0MPaMNRMqWsEgjy0qe2dUIxTavdi1B
	WgBF0pqw2dp4AYL5UViFOYH7J4BBzvdLgAjWVCVRmYpfpdegp6avOZ1U40ro1nR5ZL/ujdXYm94
	Z41PY6kOn664tF7Malw3uXTgCxucPSR4KFuM824qjjfbi6Fyednsw2IBSiRhKsEKqXV9e/msg7N
	AMo4rq/LsA5DCRe2dxEFf+cvaEImlk7SSv1dJN5fipd97eJP+lMv6fxUe28dt62f1o4R1fy0Mqs
	eYrQAKw707ebF
X-Received: by 2002:a05:620a:3190:b0:93e:f499:43b0 with SMTP id af79cd13be357-93f29cee012mr1765058685a.22.1792481957836;
        Tue, 20 Oct 2026 00:39:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:93e:f499:43b0 with SMTP id af79cd13be357-93f29cee012mr1765038885a.22.1792481952471;
        Tue, 20 Oct 2026 00:39:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 3/6] ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
Date: Tue, 20 Oct 2026 08:38:53 +0100
Message-ID: <20261020073856.1177749-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: reHPHWq2Mb_rmOgkTxhLY5lHFFupajcp
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad71aa6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=AaUSbDpTSIYfnfK-pzQA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: reHPHWq2Mb_rmOgkTxhLY5lHFFupajcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX36mDuinxXP+S
 TPINmf37imDEnt+qfpWxXjdQh5YbjdOT0B8yPiSIoH+cCmOtDtTn3K5qA5u5zt0ZkprZ+7wZ0Vq
 ii19RY6Sw3cSX2Z7EOnPNz5E4Y+y3/x4K63yKZV0laK9Qdnxqxz9AClAwPgTX7B4kPk5X4RJL/C
 Wi/rcQ8axHXKJrlpvI75vFxTSTZ1m9HkeyQLyBr77cJdQnCZdYnzGiGfZ6B5Ur5ZMa3phfjx4bv
 R3vMvH3zyid6AZ0radeY4LnisQBQ2SiEnDPMgYJkRxZUFPGDTQA7QI76KN0CSMqKqxR28jdN8kJ
 P527gSGPZTiVSMxmBDutCUoejee3/ZJXL8s1oCG2CKaPH5fUct0VI/t2UYb3fqIgyBiMgYscuc+
 O+yv+hyGiM45/SrCNzV27QTa2MhWm7l9XbJvUADC0hRoaCMOlBN1KeqVjHecbVHXnmYwLhJKtdx
 shGTnZQRzpyTCI7M53g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX28YTNmanr3kQ
 UWxTT7haFcserq1xEt3zqetMedeqBba+PPcl8VzDtcMoWi1+A9UE76e3KeN3O5aQCNdnnpqr0z0
 6MB6aorDaeiVAnF1pdB7KqsFm9gwEv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

The SoundWire IRQ was disabled before pm_runtime_force_suspend() but
never re-enabled when the force suspend failed, leaving the codec
unable to receive interrupts.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index ca311209c6d1..ee61c983dc57 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -265,6 +265,7 @@ int sdca_class_system_suspend(struct sdca_class_drv *drv)
 	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
 		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
+		enable_irq(drv->sdw->irq);
 		return ret;
 	}
 
-- 
2.53.0

