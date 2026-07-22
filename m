Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB835C6A3
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729931; cv=none; b=CxyGjmqsT5C68+r7yVm6QVT/iJMhntEgPY6Ab2LZ52+0TYrTTK1i5uzNAImPSTTOmp5HKxkf2O+Wp8h5Ld46oh8VBr8yanYk+mSH9QxwvJ15oWB900eG3Isx3yqGhnrPi8038Q3DSyPxAAPOdkaWYs6Ww0NXyy02mEL9Dy2XkqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729931; c=relaxed/simple;
	bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqda0aX99OnFTRwLD6wO/c+RdKXr88QAx5r1+edAuaIQCLjAzIRrLwbtylj9jzqDsyx+YaZzuKKbiZE+nIj4xUFpfNwxLIF2NYg5MAh0mjichrbSPSvm7Pxz0D8LEF+RBEoBp6OgiG0EScz6eRizPL3whM8gUmDzhXgw7YEtyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSwt2t2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9TRBkRV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSwt2t2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9TRBkRV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDXBgE975332
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=; b=lSwt2t2sbAiUA89l
	IN82FGl/dcq6AfXTx2vUdRPKGhw9zBVIr8B7JfExAPZUL3AV27MO6d5d8BSE+Sz8
	lVq6dEwUnNOnqqC7yaHrjtbOyiMYAvnLBz+YbE2bqOmajvshl31/E83Po4ZPoJRc
	Ys6tpnoDC+Gb75wKBBixLAs2APXtUBS1u3qOlIq/tbFfqw7f/AF5v+JGoJRbxx2Z
	WJ7ZWRbB+J4TqIWqh9HBubh5cxsKrXMdUbJjilAJA57qvOhKfFccLVr/LdepqFBU
	b/X4YLxxXj7PPSVAeJOAmOE0A0Ute71t29NxHCVTtbfH3cVhxBvhhLZkk4FNij87
	h5aKDg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu78xn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 14:18:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so15545540a12.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729927; x=1785334727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=P9TRBkRVZ+og8R4bjm+IwKrYY5mnUenWIbudpOzJ7Y/pq9nevh5u7WOREJY7ZNIgEo
         QSwscx8udvrAHNnLqjbwHqteXVoUsy99+qa7bjybpNLWkuEXREAmg+8FyG5xbPp/oF+s
         4Y32EpzeBcm04USYYABRO2aCzgL9CuEwMiiExECFn1PcDT6VOUS7DVsQ1OjOf6HY2rvp
         HPDXfmQXw7jkSazCSTjXu34g6hMgf3ghK5PgJjzjSraajHidUWuOZme+SIxsepjhsM24
         J7ZH1tXkM1aZ/QfWhR4M0oF4ebzResFzZv4oEdwWLTJK1S3NNlu1XOWXMLlEeuQ/Xd/p
         GAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729927; x=1785334727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+gVF74D98ZCDGk1vuLKZwAiZcOamvsPyVqq7gP3p24=;
        b=l/s2m7TiASzEXlCwACWH2JyikF+2yXvL+zhUqOoOyAZMQ1S5NXZGzPO2tnjhYohOeL
         C8sXtkwc5YPebofzLIwTpOvcebYDBB6xUZudfwNV3H3HnYUQUFwRC8I/OFDlhck8qG+r
         wZhbI20gehdXd5Rtt6tHugSTufc1MJFFs3/mV6LC7FVw2169fuxl4rmC4GHMZnAILj15
         M41I6yBQjmOfusWADyyMFdIX0rMy28fDPFVEQjktx1mKPZAbNkiVCoR+X5sXqdNuWcdy
         cutYL12Rc8QPGF95ThLG45y6gx55lJiWDUvN7XNbdplEOt62y1J4tgEhsbBnkRNtG+96
         3kEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNDaOkhYzMPwdxV8QTq8b6BOmB+NKIJ5AVFTU2rmMnKmpMiypkxuzrq9NV0D5qhTDMSKymjpyEa9ozfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGI6qIDsSLNDFewH7sFvLJufT+OmJWoJJcQyyGmG1RCziB9gGG
	1TGFsOMkbBSRYU9DUCwm+q2bGpu19uuBvWIZoPf3dM/Y+DOjte82DwWEl7PL04fxJkVUrJvrivU
	+KHugtTrM/5aYRPRF3dyWmW14jTnZFr+HMcYqWDh87kAUnUTtkpQBuhzcpUX5IJ/VcA==
X-Gm-Gg: AR+sD11iLK1cwqLyqTQY9NeYV9VGRN0YQLidvBeGan0DvZZxY1tWskyBnHvUZ19Rljb
	vpBmeePrVkcy4OZooyHR4/jSTjy/NdWR47o6BTi3LHCCKcTOPDtyniW7QiB6GuShs3v9uhW1VSv
	2kqVRriRprLzcyn4yLqTWmoaiOfDSoH4egmItl92f0tgRpRR68EzMiujyiHpgIapoP4vX7V8cGd
	xULnxEGGqx7sSBeuUNZnaNeRmKE1crqMNVdQ6Ji5DrLSXjc8BjkyvDRXIeut0+P6s9qmC/mE1lj
	zvDA21x2kdghXbEmRx4cqT4tSqDhtmW42CvpYO2t/V2R/UkGSVwzxwdwGWyXMQLi8zeJF3Ufb+a
	N22Uqsu9kZ65g9AwKZg==
X-Received: by 2002:a05:6a21:62c4:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c3ad64aca6mr26199961637.23.1784729926666;
        Wed, 22 Jul 2026 07:18:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c4:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c3ad64aca6mr26199915637.23.1784729926195;
        Wed, 22 Jul 2026 07:18:46 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm10084210eec.3.2026.07.22.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:45 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: qcom,lpass-va-macro: Add hawi heartbeatpulse clock
Date: Wed, 22 Jul 2026 19:48:39 +0530
Message-Id: <20260722141840.596101-2-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-2-ae200627ad62@oss.qualcomm.com> <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: d_-kB6Bfq-ksl0FPqNMKm9pX5TsShCEK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfXzhbwRTAHnoCH
 pcSwiA/AsfrGGBBcJIHKsnmmqHJBH3iy+QukMyokWOI+mSAigz0mhAf2W1DPUt+/FFqcrasM+FZ
 C7Voz2itpNC569kqhVZcImEsRiioANA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX83uMRTREAqcB
 WdhhvjAD5DubybcxK89hA59isesRn2A8Fon2YajJH1DyyED2TOv6AWLlOmPdlv79k5OeWFxWI58
 PCsfrSuyrwoJqufzslS1lvRJHWc/m5/HDuhMLb6IkahafLel6GB3Pzj8W23350nW+eTblIBHIRz
 t+gAa/2aajwQgADGTE58hBgC5dNZ1G0CnTJlFMwKoiq+Zrndo2nxw3RwrGLzSlRwSx7g001MeS4
 Ax3Hzf+M2KY6fNcJDFZsVZkcf93M4W/EgtvW2jjRd9kcRXZMWysINTxDJm/wwPGngGqSYEwZ+EU
 QZAiguiN4T9xqfx+nQVk/03w5sCBo1ZYSZ5dcamlZ5TFbfbHGNh0WAU7q+pIz0fm/j1JTBEZGBe
 Tb1Hotraq21eju+s3z7RA2YUet87EJrY2WzfuOcdPbCn8KxOIo6zYMQGY0oYXH3fclUk2C4G3On
 vHkST5X7/7K3m7Emhlw==
X-Proofpoint-GUID: d_-kB6Bfq-ksl0FPqNMKm9pX5TsShCEK
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60d147 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_lnWTncF0BVR8YGM9z8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:01:15AM +0200, Krzysztof Kozlowski wrote:
> Put this as first entry, trying to keep alphanumerical sort.

Ack, will update in next revision.

> Anyway, where is any user of this? Please carefully read submitting
> patches (both documents) since this breaks its rules.

Thanks, Will remove in next version, as there is no in-tree user yet.

Thanks,
Sarath
