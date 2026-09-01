Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CB47D475
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259823; cv=none; b=syJuAwpeWKpvuSH/sRWzO5HWo8lQf6WeBKzknTDovz5Gk3Lijf9F0xc+dJo5elY0I4MiOO4b2Km7yZrUiCJaLuDHnYLMO26pAs84HjDqkugwurTSInOHdQH5HtrYorzd4LAVNz3nX+AVq0JnvQjLFMSrN1DKD8vK/qna82/kH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259823; c=relaxed/simple;
	bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7WW9oFwIHkAwPfwjXINY/HZXLqVQ9viPPsGidTdnALwiURlvxoP1udoSp0hdN7jJrfz+NLGPr80lmKlVS7sY9R7b+RZkIDzyoPq8+Yut1pS61CRFygI9lJK+/mlWEK1U76/nCx4xhXoGY7DONN5Y8t23Sq03i5sAoCL7Uq1GhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzuP6YxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlMxcLxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzuP6YxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlMxcLxP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJOnC2993708
	for <linux-sound@vger.kernel.org>; Tue, 1 Sep 2026 10:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=; b=NzuP6YxJu9HCQXoE
	wCUBCXCQtR0RWVjIYR1In0MR2weC0zUZHs1l1O3JdvPiKuOPLQDCid/G9bmYrltb
	F5YRE0BoCceJ5rIcS8NHIbEk/zxtUWpsxd5d436gSKLCVTuv7pzCIX6Oijn7pM0k
	WciQW0CAjTDCflUEGWFl+nECwyYd6OdC0ZuM3xLRcuhgKgxyG0TSzyAOPAJcRnOx
	mRPxoBN1+t167BsloMlQ9qAAFo0Kbryqe2ftOEhlwBA392S9RKgqvBwWAz7XjOuy
	Mo4b84PErRs6PGkcmS5T4pgb6tChqUOp7GG5PT+HQVHTjtudtLs8Y4C4/bZ5doT1
	HEM7JQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3c0h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 10:50:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1975234a91.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788259820; x=1788864620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
        b=DlMxcLxP+GpvOCSpqhFNzqMA+kTR4i7qRM1IPKWiGNfjab5af1SWKaBvLhbNTPgFmh
         To8KfgLrNIrHmrNCXptn918pzCDf64fedmL89AeS/durebHJZ4W2gtV+ECPq4ZxPr71F
         CNgO+JUZmVCjd5Vz0+tge2gjaqRa/FK8honVAHl/zRjpVZtl49jrKfTY3XYqGqemMdiQ
         gojXTmKK6iYNzlmRkSycraZzPdXo2PtvdMjvaoNdYNenma5bXBTOLc6cSnChCMtWIt6m
         YzLx9dGZ5zlkwoXBJhGRpdbWNtMoWLlvd/2xapMJjBbBMdfhEL+wQeKiiUAKR/A4OQTI
         pxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259820; x=1788864620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
        b=HYeG6Odb2NEm2kpj7OPiODbm8RkjhlOFuNhUGhyPt2FT87Ov7CZyBKq52BZj8S+FEm
         A8v3oZqmah/+kzt+PIS6gXui/Nboj/Dtj+vUShHDMW55yZXueImqO5ht1UsjuaHWK0Ls
         OTgO1IfVvrUkR7rcI5jsulLrGQ7V2K9XojkNVi+8WzHaOMHwnNOjQgKgWwJqnc2qbC/H
         4YNlR0+oap8oJ2rapdDqHTrcycxGJeqBn0htTy4nApKeDt0+oGIvAUSfWRJYBEaKsFY5
         y13l6di1ZaBTVwj2Mt+lPYIg6dF3RTFUxd9qN90LZj/gyFLaieDc5LDvDywmRtfvUR/s
         egTQ==
X-Gm-Message-State: AFuF++lLRNTsI/IbVYwovJnvsZIfJAk6aXf8KnFfK5iYbtIqGUb8g0M/
	73+bV1vi2/JQbJhnKBkclLAK+WS1m71S0cccBUAVbVSGUPnkXBRpst0+g9rKwbj4Uf0TSjIoJea
	MTnKuOwhtX28qkZUTj1T1yYnn3F4y6wd/H18yrbKiHR0TcwRu56u8q51zHMfpTc4xPA==
X-Gm-Gg: AYBFou3fnXQ1oeNTVLoQ94sBw7yOk1RZlkvSccriZY95C0Dqwxe6XCoLxFQM1Vo2xP1
	hy/Hrn9/QQ4hwC4IkUckkYg8pMT0x3Yyp6PtdpzTGf3QR1xR1cCbH/TfkwzoT7HfskXG9bj/BQg
	eRIcW1uZqkXnVd48F+LmkA1YRFEzFy0cGO+SFbWnJ/6DlIO0nIl/5PpcdyUMsEg0tZzc/nrq4s+
	LW2ilXNK/cT6XTLP0efQIIjfu+5uPTooLl9haOG1gFfEEPoAyjJ1iJ+h6Xm+uqtJKkdmGU/XLX+
	1eN0tTBUEeTS+UbDpqcgXNZ0eWiDoCoVvix6LBWmh3JgwTm6qoXWTW86T3IuvC5G9VeicKJGr+6
	7xQKZh+2t9orL1InCHkwVYBGYQg5r3+6kNw==
X-Received: by 2002:a17:90a:114f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-3989be5b50emr23508927a91.25.1788259820093;
        Tue, 01 Sep 2026 03:50:20 -0700 (PDT)
X-Received: by 2002:a17:90a:114f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-3989be5b50emr23508860a91.25.1788259819580;
        Tue, 01 Sep 2026 03:50:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4d92sm32534466c88.13.2026.09.01.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:50:19 -0700 (PDT)
Message-ID: <36b9f3b5-8c20-48f0-96d0-92cd13761ab4@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:20:14 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Fix incorrect properties names and
 typos
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfX7szXp6fuNc7V
 29jiq7VK/OjvrgXmcysgLAzxDu9uVFtFKFKMUmrCw6haM4RxinPv6Hmr2ju45ML98PY7XoXQqCH
 kVcKk24L3E109JESN3qwiqz+WVqvwUCXdK81H1x7rrwAdnGhshlHXLWLuCgCIqhfsb0zueoG+EI
 Uz0LQe+7VoKqW96n54t35jg0i4Sshv1dbUSqfTg3aV6fdlP8cNXus6ErH8nDWZDWXiuDni5s/s+
 z3jWSrlZ+Df9ptrgLu8EREebq5Aflz6hHsjxngLoTwt2CMDMvjIgvFTRGzhUqa0goyJ8csg17V9
 sjDKffyd24D65ZcpGCt8VkAG6sJyp/Y01NREhezW23caeusSwaFK9pnPMxCJMFJVIH3JTQbEuC8
 b84TwxjBm+JDl3CwxgrGkMIkd81HIvAExu5K2+W9U40Ybgkd/4eSx5nFXjqinimZQjt7sjknNtd
 +kipgOzsIDTSQyWuzsg==
X-Proofpoint-GUID: kLLSrypWgtibVimK7a4yTOTmcwKsWbnb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfXzd/tSG/O26JK
 iVRsbazLUPo+63Dk3sN5JctRkrWBb2HVkdibwPXtxEwaHmJV92iyvTaSzAOdXLAZ1pc8yAZkxkI
 1M560c9p9MdK2vn86BmGBuweHBxqFi4=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96adec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JTjWdI1eHk-BqoT7USUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: kLLSrypWgtibVimK7a4yTOTmcwKsWbnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010095


On 8/23/2026 2:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> Improves debugging experience.
>
> Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

