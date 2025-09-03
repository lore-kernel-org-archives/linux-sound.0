Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889FD1E5206
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891923; cv=none; b=t2coktYLPbUfQaRcpx3xhDeEN0HxwCimRB0Qm0kCz1IQjxz7PgaNSelgj8rXy3rq+IMG6BOOokaumLLti98Sb9x1C3dCmzv4UfKAfFjjE6dsOPwwP6L9VKtpM5rYo4nDwTuvp9i9grWMKDdB2/MPoLd+BK23lb+2qjix0cti/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891923; c=relaxed/simple;
	bh=f9dwC+mgX7pffl+TR2sx1UfCW1VDF+yFerQJW4M3mi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fasiROnBR/KsQQqAnMhBqFl5Dh47xpE8ah+u4O7OXxattAEmefxOr4TLCPOk9RrqVh3Y0sSjKlG1Qe10t6pb3CO0yWJW0lJmZjqDiFmfSximUBob/FM1+r1NFLEZCqiQpEQdB+6FkvFECs2owfKqusiyIseuRA8RwRTG2hqPxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6N4G+q2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6N4G+q2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58327HEC021319
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 09:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTJRGhJx/cb5W68b/kzmKsQxYzcRko2SczTJfWZS1Ic=; b=c6N4G+q2c/S/+FYG
	m455NKQjK4th6h+2LB9tRMsXdKqVmaLj0xs60eVQ6F0TeW/8WWe6u6x9tDfw1pB4
	pdLyfSZoCTiZ95zwn8ES20C6RBcQXpXn7FTA6FBVISb6iEIThFLRy17f5c7jcENs
	jjUZTQxT3h6TCcp8rxRGADqMxdpZuP447oBMm4/hqkxIwIlPyaF6D66GNPqahO8D
	CbJzHTd9NT2xn9xhHkV1Wf/4mQVWzwWDt7hID2g/a5RX4ed55JbGerFM5OoaFDDW
	UaTmdnnrgrGgG2jVLvBmNTtiCy3Kq9/zcFRLuv0OEwxKjbaqcxFfX+xm4HjYdrWv
	0B2sVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s349t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 09:32:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71f2e7244c7so2763306d6.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 02:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891919; x=1757496719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJRGhJx/cb5W68b/kzmKsQxYzcRko2SczTJfWZS1Ic=;
        b=HRukvNnuIWkB+MHagvE5Xdt/Ah0DJMKSdU3XvoJrAViQkj7FW8PUQVaDxiW61Cc6GX
         Dz6pYo/ZgSrDk1JN8OWUs9gLu9h4JakwR+MTPwgAJ9xr17F0C09Tjf1EjtM46KnLp2qd
         0LwyKCdpVRGEKWT5HrYjKuB6BwdCmy8t7ZNFUKckFIGXaOvJLiwokIULgPiGl8KERhRu
         U2zATgKbdY+DNjaGUBQYIfGPDwkBxtzuQypCUZTcsm5Gg0zRCznwSYsbe4brvbgKZetZ
         KId5DpeYdtQXgku9uNokZMuyWf6xcCz50d4NkXTE9XW1KVRbE6PQEO9CQMBYwKu2qXaK
         EPIA==
X-Forwarded-Encrypted: i=1; AJvYcCX+HUuDXQTEXWFQOLfp0DuKBZFkzMW0dD+RIhL8YKRClEtiReERgAhT5CQ+kwSHg7DsFcH2bNTEb+77wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTQopdMwHli08J0Byztbt7VTO8JAJPebAca48tod9vSv6ybZy
	Da7QkmOip3WX6icSmLu4XIh80GMpBAuSGW62dgYMBYfMh8gggtDPfMq31P0uElchC7KAgKmDLED
	t3ymo6FbpwYZXOD6fQzU3VFH0Q6UOImTXpi+pwut6sFgwALDP2sMqsvp/J++11c/Ypw==
X-Gm-Gg: ASbGncvcHXM+ketJrE3cIqjHmK0ybf+fb1OytLB1fKTPiGHv1F89TOYq9J5Lobtb6SR
	aiI2LDRuHh8gGqPRrwYYnr4Op8Sb4DIbPi2CyJvxaD6AB5hPn8ZbtOF/nZukLGN1yE+lIVFlcqY
	3jS2My9+vEzF0/+JadM4QTq60sQ5HdqfB9GKaa7ewe1xjU42GD5ImLwJy3L5kWw0iWbMu2wJ4sC
	IgtYxhI9nzu8SFlxCM8Zc0DITlhW2c2Cbjwww6g5tzOcZLFSxlvgxdyScjskMU/92vKyN4IlS2p
	CDgRYZc2DEoD3wiN8tgLtP1NBN7mrsIXOvBlUgjvGuzvdqGSxNUWDfifp2nSq4Yu2jkpF+5G17y
	DE9xjNwB8WY8m7RwrGpty4A==
X-Received: by 2002:a05:6214:29ee:b0:718:93bd:f208 with SMTP id 6a1803df08f44-71893bdf258mr71701616d6.0.1756891919467;
        Wed, 03 Sep 2025 02:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/DTmcbgLY9RBZ4w2iRzSeSUgH6/An2dVsN0QDNQK9nr/GKn1lX7eOnhkKaQl7A1U+RdSxsA==
X-Received: by 2002:a05:6214:29ee:b0:718:93bd:f208 with SMTP id 6a1803df08f44-71893bdf258mr71701446d6.0.1756891918980;
        Wed, 03 Sep 2025 02:31:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4e58aesm11242665a12.36.2025.09.03.02.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:31:58 -0700 (PDT)
Message-ID: <d2d01b40-677c-4ad7-9742-29a40082f40a@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:31:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX8y8QgEZQusbb
 uCg2o3RlUp9E9H/rXDqa8zcuHoMb60Do5mh0QJsM3AGaK+KrUE9mVt3SZABbYpE0GbXIoTASF51
 f4qbmBFOo/eLNzeZBg2vxBwVTPOB9yDYKnkUGIoaZt1pM5mvPo0LS0mehg4UkDhdXgWAjKd1VIR
 VNxwSZut9c4CzAnyydMOW4oYgSzOoeg0RrHu2yJ/Wxxe+776yM9gRhIe7uag4rii3HMj7AtM1iQ
 yoB+QCxTA4e/j97nDacPZ3X6UPQXMDC0dc0QySJZnSrg0y9OzQEB7wdLUZDQbPjPe+xsCrHSncI
 D5yq5WA23nJAUWMtN7jGdjnyHrLjcPHI7zGBTUx474F0SAbx/0iCSO8acqDdaFCVbWXolX1i+Mt
 FblDYd8C
X-Proofpoint-GUID: W-TJPY6uxqzAFbrVqGJcvOKbHPq9DWIm
X-Proofpoint-ORIG-GUID: W-TJPY6uxqzAFbrVqGJcvOKbHPq9DWIm
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b80b10 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=AFvlZMtuCSXtLM_4ds4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 8/21/25 4:16 PM, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.

exciting!
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +struct param_id_sp_op_mode {
> +	uint32_t operation_mode;

"u32"

Konrad
