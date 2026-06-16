Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987738F244
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640923; cv=none; b=mUlmlQc4rRVUJXfFHwOa8Ho7Fd4fTd0kxFoKTZshnqaMyX8aAQzRMmskr8EOU6jFY6Aw7YVn6YRPdKfYzTFqtXlNzfmRpMqO0YmZri2JZt1wVs0itpd3NKav0R4lnkbtoy9+w2HYKumvzB5XxW3shR1vzsWLyXNbMOJhMHN2b7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640923; c=relaxed/simple;
	bh=BfsWCD7hTxx7YcBl8tJuBnMBQqYRlgms82Zq0fuYUag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6AXOphoIdv0BxJ7dfzn6HJ5beNMmqqTDeYZZ4mM8a/UdqTy4h6X0AuagNw2GSdyBpwmz2qaLEjxFKWsgjAy+0Ju0PT4xSxydyxJxFzYURUvTL+4YG7AzVfAVWwxk5SkZDUKpBvaupPeQ/RZQSPyWFP/WfIQ25X93977kD1YdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoY+oKxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QR4+H+tH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoY+oKxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QR4+H+tH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIQ1HL4015920
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oQZQNMndCdq
	B1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=; b=AoY+oKxNpvlWd+RGp/nPpjwLuLn
	xUL5GtmCtf2Wc3OFcOhLeIDPu1E6w/SU9gh60aeEPbOdGv5paniralGCQgRmv81K
	M4JBClYL4FJ+fE+tC1DrTvUZ+23FwFGat1fMFYLxCQZ8GeERtu/gp3lHXXrVbm+M
	tDWVSXHx7YQKdnR4SFTHplVQEc9VCpJp9V0Uwd67SaFepLV/Z+qyzL4ZigJRDeti
	1aAlC5z7nC8kfxPvlfhXqVDVguKlh5LW58SIRZxgXV5+NURmwSMVWkPhjsCZ0kEn
	L6oSszSiUSRJiZFVq+2AogEFRLBmN2umWhU+Gp1XCyQ1LyLAL9njCS6NPug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253kh7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c69f08f527so8728885ad.3
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640921; x=1782245721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQZQNMndCdqB1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=;
        b=QR4+H+tHl2MWwOvZ1UJ2fRowyHL8MwkRvFGxuh/CODnJp3lTD3afTxC6kNei4FmuYp
         AvbsrqexO8Xw9EwNRRfnjUUZfax+wsWVgb6sKrpYpkU0XzvrysftGIMH/zlbx+3Vsxit
         ukhiaU4A+9Ky0NN6ve5LPdnl8xw5ABGHBT4fVhNajjVwMBhaufrLpGVx+bSF8ZIIfcHB
         NKjTE9yqxbIyQAjrBrr2jE7ZeyZkgZbj2rPb3fBpS84R03cyP/Pc8ZdZVtb9yQV/fWYu
         1fj5d4f8WFZirqpwz+K7HyYEhmlr1o9WIVaFwl8UyBUE2UQPWjg895IzVMtSMfoIzMCR
         c2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640921; x=1782245721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQZQNMndCdqB1s6Vh5Yf+H9pzsRwvIWPU9CP3lneDxg=;
        b=govureA17iyaMuCVYSE5B+QQdo51TqN1R56w0GRuqFU5JBd2RIhjTpB/2qLoFMD0bu
         jtc97h3IPxH3OdhoLWnqSs4es7kpk9ZujLTjaazqjmldIzu5OkeZluGU6FtknuQlHvNq
         na/ZCfKVsnH6AipA8Nr6pbknAZwd9WTPz8ztCtf+mvUkBr2c5mbLM1Jm7+ve0qI8tSTr
         NGGfd0gS4CfaB9tG6o5SG4mtKYScZsjDxJx+wDFYTKT5v26m99i1fymxtG84kHdhst00
         h5BE8WqX0zkySrPS6Kb3ZglektjNW+nzPA4pf3k7IFMeZdCFJxmMJNeyE33j0sxGumDZ
         rq/w==
X-Gm-Message-State: AOJu0Yxn2gSwtVRtCBozs0I3n3dm0et7b7x07Ykg7jcgCxNeyWtYgk0T
	Y2s5lKb7fLUOxzmqmCFI05LNK/1UfN3qVAkdJZ6fHWKdOH0Z0dKvwVWekvHstaLMiFvIfFdc32y
	ajbwCs3kYKq63vAF6WwmJYKSbjafICfD07QVQ6dOJrOwimJuXYNn6YdGhQeiOnTJwG7JkebRLmw
	==
X-Gm-Gg: AfdE7cnSIVJP64ivsOMiA8r7hWc8pdCkukT0LLbP2xEhXT5F9gVsVA2igAmFIwIqtQA
	+CsEtYbo7wf+4t7Wua5j6q9x+Vo7f+AHhsgQTLoKeScHJwG4ZHSPE6uH5pbImIdi4s415oJjVYF
	OaN8lUXJo0Ok2nClKuq0LH26s4PS2eg/khBGDn5419R84+HLyjfEcJ3uEO61873oDjL0hmk47f+
	x+HZYmc4vo1DgpOH+8eJEXEHy8vm4GxOPDZcU9NU3X8OnoJyiGwUpY41WaDT91Vj/xS6kCt0olQ
	T23RURfvnPpROgkjeXh+oFKhC6Cn0VQktmFPlrWqhoQRPC+qBzLfVcWdNl3yWn1EE9RS4YS6NcA
	AvwQGjQu6VKtrTT0eH6QtqzGS+d998wz4T2PPCOjuhbUtHGaDUbOdHqReyQ==
X-Received: by 2002:a17:902:e548:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c6bc0e999fmr4915625ad.20.1781640921045;
        Tue, 16 Jun 2026 13:15:21 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c6bc0e999fmr4915415ad.20.1781640920601;
        Tue, 16 Jun 2026 13:15:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and WSA885X-I2C drivers
Date: Wed, 17 Jun 2026 01:43:15 +0530
Message-Id: <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RWjQ_hZH5th8M9WdlWb_vPrG1yOm-U4N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXzZf93zKDCsQ0
 35waxFGGYJIrYBRsyB0kfvrXy/96iKMW2dNLa28qYWIWPgqnLGOGXUVcMk3I/jJddUOj8mSoFws
 bcqmNAl+PKACRxsxicAE9FCu5o/ULcU=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a31aed9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Y4Inp1xfyx_JXr0qu3kA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX9LELFLx7cMzM
 KVk1zuvsjk5UA4cQDJbOwWicZ9g4aAMos2Y/idpw5P3Oo4zky6K+iTCNAOUM/RECRHd6g+6VWI5
 jf3EugEs6+41eWDLn1ifshutAkNdWFdUMHRdt9FXeA9LwVBSWup/2FT3q8hr6XVtU7w8RsaZNzi
 f1d/DzG4+cIObqYkkNxq1LK9+fbIFmkPoyb1ydO+V4gI4A7VPCRV7KZfRPTa/aAiINPCMTJwinT
 kjXMiRnYD9WX+n/m7tNNvGqfWbGuc480/X9VCL7KY545hMm+ZnEaoHpzXVXM7ghMEYM+MRxmIF1
 V+gvGezMQkyluh6X6fziSLzH3+pAk2ebpi4G+ID+2zG+rGKYA9W+1HlLIOB759eW40uNNu+y55P
 IaWZu4BAyDYZnV+4oDVcjUseYszebHEP6/WfT4SL9n0nH4w6WZms+5c/keHCevnzMC9EgHMJZuZ
 3/MZxNPGmDey6gmvhOw==
X-Proofpoint-ORIG-GUID: RWjQ_hZH5th8M9WdlWb_vPrG1yOm-U4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
arm64 defconfig.

These options are required to exercise the Shikra EVK
audio paths enabled by the preceding DTS changes.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 271589322efd..067f4ecc05bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1099,6 +1099,7 @@ CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m
+CONFIG_SND_SOC_QCOM_QAIF=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
 CONFIG_SND_SOC_SC8280XP=m
@@ -1175,6 +1176,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X_I2C=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1

