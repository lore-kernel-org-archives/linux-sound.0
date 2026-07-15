Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740DF3CEB9A
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104191; cv=none; b=Fq0XPbXdQvshJg0pqJUhfIUInQS02ocEaRDspPfO/caoAXLvp/BZKsPpwOZDbofOVwX+ddcjuMXu+C8gnb46oQLlcoGXYNtMrA9VYtf7QLTMVLYhX7Xz3mrNPMFer4WYMGwpAVp3Zgaa2j5RIJL16AfYykWSswNgjiBdCdWWNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104191; c=relaxed/simple;
	bh=TXKndoG9/ZhPXg6naPWiyrq5aSp08ozw/Uehu2DgDWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2+Twun04sJxF0AmgUlnX83ZvsR32VzJq5jrwVKf5IkhgLbaXERfsb4RYbNVKtSVd7mclaClY+pF4UEKueeevyq1eOBL0qVliTqBI6i423UbW7mDN2btt+ZgaFh5lmQgfBO3VHv4EYbHHer9F98Y6gTZm6gBtIwhzc738xNYSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7DfUdVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2ADEX1Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7DfUdVw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2ADEX1Q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hJH42795809
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQlEDvb65Bh/rY60bU1eTX6ID0Mrq0HBhxgNwXz2HaA=; b=V7DfUdVw3S4PKgIP
	S0NHF9DgEj/TzOzrll25oLFLA0W7XsGgAq+iTwKRYUmQ8ou04+1Msm4SHaH+ZZxF
	py4e0l9O3VeuX6YOpY2HR5DmVtCRGRI7mx7ot5OfoFCGIn4w/W7bhGzBol5jvzTb
	Q1u8p6c5fFlQuET+1/tsfd98AEMCcalYDC9CBym+6hBV7Z5VFDtqWNyTgV08sMLc
	tJN7ip6qdIk6Dgu7ZwXZAxFEV3xr70kreHbojCpw89poY/5rejp8Y/Xo9qNX3dGb
	24ExKjyYXq/EJHWR+VCg2kIm+HTQK8ps8F5VA/UyMytD9i7/jDyMGy9YVTmroVWk
	Kr4nfA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h8d2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:29:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so28573465ad.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784104183; x=1784708983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQlEDvb65Bh/rY60bU1eTX6ID0Mrq0HBhxgNwXz2HaA=;
        b=U2ADEX1QviOFgWZ8Uxwlzs+LIlNhPdY/g9jP03R5ECJZ1dahAsQpZIOgsjT5kKCh0w
         SCG6uNDS4mkGYXi4CRwEnVBPl8VB5lViR6vUVIjopZmjpXqUBx0xhHa7Mkp6G6eh3Iia
         mBz8yJ/v84tiAzzzQ3wbp+jz4jjvLXgFw67xvzErNdzODA3Xt4ljR/rcQfppW7hbh4gK
         r4nLv8gGFE1gw4E8BXD+j/E7FqeO9XOBRgSqP0uNaowCRcodqnya5qoCdnBX6ISpKmEp
         CjOVKt7EMqRKGBD7jq9qXcw4rpUBAQ8VHV4lTBvHpVgqm9mkkEvspJDMIlnqwzOQGZwz
         Trrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104183; x=1784708983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQlEDvb65Bh/rY60bU1eTX6ID0Mrq0HBhxgNwXz2HaA=;
        b=gdusGpfoa5IXzxq9ChsFz5bb2LCkYqkPH+xUFcvvax+5AMPgZbnFE63aUzFDsEXXUe
         pougXsvGFDACuJMhL09bAL4Q/Ad5lMUEfIgGtVY8lLtph1Dt3823R4HDwcc0hd87S0lB
         OhUnflasJkKDu2EmcluH7E/IS0z13GvuMDWyLt+CMHFDEyUpauZkqcpzzc/J1P8ft0Nl
         Rwd/yKcaC7K/ZoNsmOE0dC70jVeOZ42VM6xMIdn7UbvW8NWzU+pyKLY0ZqfWDS6owrfI
         DOYS+XxxApBMgUOlZyN0DJW+krUTCV6CXsnqxR/NJtERmauYbtPEuF98hDi7+2TGGgtD
         s6ww==
X-Gm-Message-State: AOJu0Yy6beQcbB1oLwKYm5NIvV6ZecUaXDTMaZn+jXcyOoTXtPbP0BTp
	ysWA5VjAtHIml4hjLhGu4qhrv+1ZsQgpfl/Pie2oUUgXpY95QrGQARe7FUucNmm7QeXWgjYyxGm
	C39tbbITnvYQ72o8vwnnQ0uZspvFPD8g1Sn6YlfITMXAiQaOCbPukUdLg1waoqu6m6g==
X-Gm-Gg: AfdE7cnn7Cuc3EMfNiiZQUB5waqz17k3G2vadLoT4lhrRjfqkHBr5a1wn3KDPnRQUYH
	cqxHc5JTRbUCOtIShpzUMfz8xlPrBRraFWFv4WQDAcsCrFs3//Ni0WpKUE3p1XNASMrjGbKTIo4
	ippuC8Hp+Bs9vwRyT+tUnMnJMcboH7Ta/LO6ZCn7lnKaKRTKWQq0MupxSdpWd5LBpP2CUoaOd9M
	78S7yPg7vzmHS/MHfb+slzli+cFrj1IHbP/LZXDrs3tNIPszas2moX1q+Y2mCydLSw+eiXPYATk
	LlTPOGmtKghsQC1c92L84IiWvseVaKfRo1BJpFcqv7+WTQMGCWlEUP/vU8vx2E5IrPH8JG6iPup
	ZHNJCqpVJCLx90/jjoouVMi3wE1u7wvTDZJIotdQ=
X-Received: by 2002:a17:902:e949:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2ce9eae29ccmr149870965ad.7.1784104183591;
        Wed, 15 Jul 2026 01:29:43 -0700 (PDT)
X-Received: by 2002:a17:902:e949:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2ce9eae29ccmr149870745ad.7.1784104183144;
        Wed, 15 Jul 2026 01:29:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb75fsm129260715ad.8.2026.07.15.01.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:29:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:59:23 +0530
Subject: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX8YNdUOzwFMsL
 kYVLFe9aNJdGqtDnyOAIoPoxzpsip+svRfg2/lm8xVHGTm+3DARRZ5wWps6ft3QKwmCOCfZZaWv
 MZD4ep6XRnAEl211JTTuhfq704ElwfI=
X-Proofpoint-ORIG-GUID: b7XcmR4puR-mQ0uNTWyjPnr-QMTmYHDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX02HE3HKJD5X/
 yBlC3Qf/2mz2x4Dq4OsEJNdc5ctFNSy5081vcIGkzshidZJCJeqY+5Nk4gKfFaoUKKB2BUs01tz
 pvM2hlog1ECVi9A4X1usRgabZ8HCaLkuKTz+3goWtYWV4hXyPBYeF2m6+cBS01tD6MrHlC4ZLkE
 +Z2UF/HKnMaEpRAK+jn9QQBnhjJKysiMYhpt7AxkNas0sXluy7cmCz6pmKvtE1Jbi66sMlpPfN6
 qozg7d748BZKro1k0un1cfkLa6D/Svih1lUa8Dy+ZC3+ObaxtZ6mok+0nCah14wOkaR8dTSMnRW
 fkGiQ+hUdydeRCF4n2DC7EXO+rueInNfiuuIgP/C7iaVDw+A02hTVBd6YTdU3K2UYgCatPuO5g5
 LjPckZN0birYWvQkulyO+TAGqwPevi07iptYezT8AM1bYAJgY1ULL+XrZN5BuBcrY5AM4ZcmmIf
 4x3WFYLY1ImVCsfBitw==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a5744f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fYNuJulPh_gWck5KaocA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: b7XcmR4puR-mQ0uNTWyjPnr-QMTmYHDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150080

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA macro probe function was ignoring it. Check the return value and
bail out of probe on failure.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f511816aa4a0..fc9e0a37c042 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2773,8 +2773,13 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	wsa->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	if (ret)
+		return ret;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)

-- 
2.34.1

