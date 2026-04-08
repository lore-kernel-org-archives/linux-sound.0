Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D363AE6F5
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639212; cv=none; b=FUtHC7GkOFCJWfIPjmwy9rFmIxx5XKRbaO8MMYWlX1SS3rHcMaLf3TayRlbai6BEnrzw3qmjQWwIbLIcr78PcMDUlqXosD9Hn9YzHZeLyTgv7YCgWo7CM+qCA2fbvWPTT6ET0PPQS4d1GOvZcicPijBj+Nt6GldGqO/R/c6WJkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639212; c=relaxed/simple;
	bh=DqOQ78xd3eCCyPNyCn03OWQN0oM5I1raa+T25OZMDEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgdOegjCwYoEKw7/FRzKQRWE31ml+oivqrcyXHVTbBdBCl+CpLES1jmJ9kt7wn8L8R/R10MgaX+IuTSQC4b8v+ol6frm7R1ig95R4oovWBNXA+VJ9rE0g/nTwMSYUqHBaaYE23na5m23MFusraP3LVHuszSGnHAGhBN+usdMGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+QsC9wt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9yUJjF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+QsC9wt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9yUJjF3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385vmar249536
	for <linux-sound@vger.kernel.org>; Wed, 8 Apr 2026 09:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJQMbpIVKNlTG5eu44Vh+yTzjtmXorfu0uv6ojWdYq8=; b=k+QsC9wtzLOy2ECU
	ETrREYvnsQ2i4loZq8J+fp6dcHxiV7b/FW/bOilGyq2r+wPSVutHv0PU5YKSjMWe
	M6Xq8l6JmuGr9R36qLOm6jlMcw05zmsl8HtDlUtfMTwIcHjAem8QzSS76tclNq6D
	XOG5JHm0bwd+CRiYdEKdLIYd+ShRFFOSCyIY33dtKX5rjNQyq1EVf0wIbHRS/h5s
	LGwmgZx9aVy7Y79a87J7iHzRM4ChGFL+FfugbsBNuYW/DjEjxzxdKN/dtQQc0to0
	vVKjsgYzc38eNWC/gSC0MDNAfTGqSQb9ePWNDV6kmp5lDsxhZPblEvNcmpLM5A+4
	lVbHZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9a913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 09:06:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d0095b0d80so112164685a.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639207; x=1776244007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJQMbpIVKNlTG5eu44Vh+yTzjtmXorfu0uv6ojWdYq8=;
        b=W9yUJjF3ukzpN7bAwneKYeSSc0Dg5Jbj0Mz5Hk1wW0BENJ4+sb8bSN3PTWpLZJG+gn
         QI2MzEnAgi2UQwhuc0vMMmL8rVSoCV/D/rD+wc7XMKn8KpEju5cz0MDdR5IU0nMk2To2
         VSbsPAv9pvyzWYfJqEqx2dsaVYdbO2xV5BU6/qAxTsjEOC+FUbt6PRQdEURvraDoU7kt
         CDrjmEWD+Z2vUgtsxr5RR8d2J81V9IMX90ioGqJ4nm7h80QQECZmjxemLaoGrmsTspBS
         S8we1ZWYa3FxOlOqv3XUYHqzuOt50E1jtxFY9YkHUMmtVC/UXaZE5nj0wXsccy0Q0mEZ
         VY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639207; x=1776244007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJQMbpIVKNlTG5eu44Vh+yTzjtmXorfu0uv6ojWdYq8=;
        b=kJtd8+1wB7Quwa5xRPPmWegcNPtXWDxstUZcQQcEgSpRJ9CyaJwfCOLVjZUD9q5IKV
         TfXfcZ5hJ/z0j86mKn7FTxLEISSDwqqi7ktxbPXTW19WwEVgBncIq6nNESgolxWJRNxu
         elcX5fL7mKutyoltMn75sHuA6jBhIx1fmd5DmTWkYRmIpEY474Sc34mcPG9eKVwdplMf
         2/p9eUAvvPHbDyMFcH1987V7cxC4Lb164+iSMU8kvvlXb6vEYTghzwIA20cxDY7sjMe1
         Xhprozx9DJAE0xKyELKWCWsiTRD3NTeHYqTaXBrBY2FcwKyUVoULLoMeuyPi2u3rlRgz
         yNEQ==
X-Forwarded-Encrypted: i=1; AJvYcCURNLxDoZWY2UH1GLYDhkbcav2DQS13I7b0tYoFZkDkbe3nNDM5Z9p2AQXw3HgEBYcmGUaum7CvISjy/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBXY+vERu77zQW7pkphIZQcla8jz93yLmOLxoQuHXRnHZ2JVS
	HRAtiz/dubYDhJf8PoexQ91i7DuP1T7vm+oM6WzTZ49uWg6fqDOYkXDsCRHQdhdn4s53Uel0DTR
	QwDotbpB3+n+O205ryGowK+vJFKscVUAHtY6xHSVY6TmuLw5t+bcKPzwiqyGOLwgiqg==
X-Gm-Gg: AeBDievzsRjgInACrQhNocn0jLkfFJFqVIipWUzjOkRtqiekWJJNt4bq+sNSZk3XRga
	0AnQ6AofxsvN0KVxwtnDJoTUWA3DAinnTsh2zBiv8bBQDjXsZXmEAeicoqOr/vf7/fIJxJOLU2t
	RWEYfzrwPplCncUEA1PkKFwu5aYFAivN5+7R1rN6OAWfmC+mseRl5qpsN+HWiAswm8HHDIXe6RE
	sK+6dgKiTba54Rj6UgnuEkR1Y3X0mtE2R3PpB+g8J8BVYPTEawML0f5qJ4GYxUqbuauEL8yzYT7
	vero5wPSwn9UYhCMIVLWyck/D6FNK1BxLwflbM53ZokMQoHsftMg25KoacdpGFTlX3FeIWQBbWo
	IuRVfxGInsj68rPEDfbPfQvyVBxNDktfySlbJ7NkYI+2+xUVlANu7cjC6QlsL7ESSIgP2ApFW5W
	m68Go=
X-Received: by 2002:a05:620a:408c:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d4187cafeamr2030391385a.1.1775639207247;
        Wed, 08 Apr 2026 02:06:47 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d4187cafeamr2030388685a.1.1775639206745;
        Wed, 08 Apr 2026 02:06:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bb78esm5207821a12.24.2026.04.08.02.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:06:45 -0700 (PDT)
Message-ID: <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d61aa8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=g-AGuyTcngxyzYSZuwMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX9mGg7goAxHEw
 OtFJOX6HSDvli77Ox6QeeTnuXLBaLs6X8w1bpY0sTRX+hNyN5YPRJ3W2VglS68coKYghnhhkWwZ
 6u3hagmI928AzECTealhXP3hwgsiuNxFcxM8pdbRp5ifYzAt5TNwU4DHhzM8ViU3EYwk+o6fQ1O
 KFqN8Woju1oht6Ei+kebNKkt+4EnVNPPYpG+8yOVXWmjlzYpiypN/RvjYRkid+zI6IA/D0xpsIk
 1qwZkOziUDhfsKbU/SYorsbZ1EILB1I+otNZ1zh+sJNXuHy+XllGLAvzP7XsKd0av7Hy4zydxpV
 X32QIbN/eaByxeOF0xq0mWlKs5TS+064sodMNC+qyx00pJLfJ7kL71UfBMoI+bv+0rvIzvILMFX
 +Wb047b1FZ001watoDF2fj8zfyGC5nQTGXafVg+V96yY55f0mZe/JMTFvN/jQmfImWoYgLrjRpU
 wsy8w3enktw9df/rrAA==
X-Proofpoint-ORIG-GUID: nnkFMJ7Aug42_qLkABSqWiYnXlf2uIPj
X-Proofpoint-GUID: nnkFMJ7Aug42_qLkABSqWiYnXlf2uIPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080081

On 4/7/26 5:20 PM, Xilin Wu wrote:
> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
> Q6A.
> 
> This variant enables the LPASS blocks and codec macros needed by the
> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
> that the audio hardware is owned directly by Linux.
> 
> This DTB is an optional configuration for systems booted with the kernel
> running at EL2, where direct CPU access to the LPASS hardware is
> available. It is useful for users who need low-latency and fully
> controllable audio.

I believe on Chrome platforms it was done this way because at some point
it was determined that they would specifically like not to use the DSP.

I think this is more of a hack than anything else.. but at the end of the
commit message you mention low latency - is the impact actually measurable?

Konrad
