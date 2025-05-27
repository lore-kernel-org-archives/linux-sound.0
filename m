Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB2527FD49
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365444; cv=none; b=PX1Qb48gsZ7KtAnGHjGYtjZ3WaRsSGcex7U1+rOZmRqibPQaT0HibQbdLlduotxd+ZXmCcoL01a8JvGFuAfpWPRnDbZKDEQ9trEBAdJYtbcVRRTsjQdht/x3v44HhzTAkftL4ln6CckPM4wDyHgmIbBlMlxaZAu0gY6LkfhCsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365444; c=relaxed/simple;
	bh=D/exj8D4Mdt6FJYvJh51f96SRZVSyPsguFJ4c+GikA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOsxy28QYGM8tt5x1QMUzP5jYSkV7WY3R01jw0zSNtR0zNPDJzmh7b0/2HyGmyKYfSdTlgSF7y41vTmVrEzeULWHcp5bKSDGrZkV3AwgUX9vNJbclob9xDuuFnoITWExccOCQMH7vDrOaGXAhzxb3nQtXQDeo4hMKa0Kd4KQ0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAX7QMoy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAX7QMoy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9msPq014049
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 17:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=; b=pAX7QMoyiVE1rY9Z
	+cKXPpiJ98pUzTz92OcGDPCydeOAXwvebWP7QHok+kDYdfdzki/19s9jOgDF556F
	Y0sKH8EIvRhxDrtbrbnYwDxhmdtJY+wlI6wEAuWp2hpHj9cbU8iNmJU5v5nBK1eu
	J34qCPZjcchBCurdEjc909jY4kpc1plvTBAZu0lb0wx7KOYTLhqVzDZZScp9n2VH
	xrRs4rI2YRo0H0/+3RGD60ngh3+YcNwy1MXS6UDbwJlbjT6CbB9Mbl0Cr8Ao84Hk
	JdkEmD5qE+OFOZ48YnC6lAN+/ZzLUUZbLgQ55BohYDY20fYtMNalhx+1mjWJoWfW
	m7VuJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejyj66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 17:03:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so95526585a.3
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 10:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365432; x=1748970232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=;
        b=mC07m3AZp58CgnsrukcdwzJsaL1zNWDv9wCthTgT5cpncW4HixgQfQfGHJZLYVsA9F
         y6gNs0AVQgXyWGg6Oso2+jMnzMplZpURWOpXOrfjeS1kUeUtbXPnrolsC5Al0FG9WjPc
         S5wIlOrejQpUfoPxkLmiVQTc8ki08qAbm6OcNm4d2Hu2/v63X0VRU11SEgjxCp+OR2Cq
         /CQKHZPH1qlgnlqyuRBTivDO+m8/dpnnwp9zo5o0TkVveBMXqA2ADMYT+cNLqwKnWssW
         FSuGQ0tISCUtvcfChXBorizQToi9NgOOs7kxLbKHoia0WdBXvhPZPXwTzN0CkqTG54Bn
         bdlg==
X-Forwarded-Encrypted: i=1; AJvYcCX1n5JziXizRQwkdpr7hWYZFpjhKZ1IM9zDGGZS8gDqDdZvxqTGv7hz4wq9lukgY94pRvnFbGMReYm2cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB9EUINI2GNxfGnKVwzRo011q5RaQ3tuPtaXGM3630BVBuW5EY
	ahasVdOm0IktmxSeHX+neKsXIMwnyb5p66G0YMnIAqZd8N7jN58WKRauXHHtT7OvVCkkIeBuK2C
	1f059MUjix+69pcYi8b0HN9jBBIfv51gQwWvMOlyxavy0NzMDXRGOQFlb3gstJ69J2g==
X-Gm-Gg: ASbGnctSbyHOWUsv0m+iLCzWQpX5VKlExBnuyqCMUvux4wTPFIhv8fX1BTlf5h9+rK2
	SkLp02GxXhtzqtb+y05V4YGMEiaaQy9HL2ZOPCxNTJrB8WLHqFY4T4H8OfQ7oTEr4XamTNEybFw
	ellpH5HW288eALhbuau+XOdzdz7UxMUR42vEm8IbYbNrLrzMhAMdJ3ySFsd0qbvt0qObUejcfGZ
	lr8jbjMyNxx5CQOxndAOEAgVu7oCmauYQo79DYpsxFQqfw196Keruj0GmMm4L0ig1scyIjWMV6T
	N+w7/l4OKtE/+WcTxQpc0DRxkt9t15JoayVcqDAdGb1UYTy+X15jRkqK5v/hXB71qA==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14854985a.15.1748365432590;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDevCtCl7OkxCN6/99TDwIJJTrAXaSCvcoslipOU+QfWt40Ux7PUXxxh0fu5f697QezV7y8w==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14852585a.15.1748365432068;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm1900573466b.10.2025.05.27.10.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:03:51 -0700 (PDT)
Message-ID: <e40e3078-cfa7-4927-af6e-f66a5dc4861a@oss.qualcomm.com>
Date: Tue, 27 May 2025 19:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
 <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6835f07c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=IU-kIAO4L2lcGG9yRekA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Su13pGsSuTY6GZ-Cg7ixq8YJixF61GJv
X-Proofpoint-GUID: Su13pGsSuTY6GZ-Cg7ixq8YJixF61GJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0MSBTYWx0ZWRfX8CusNGF/7Bzi
 GayCqelfLvgzhlJRW9v4431G1pQUw3MzSRKWnWYNGoW9Too8f81HEn5bvellIz8hwejm8T9E9WX
 yxBz+MSXtODuhAvwawouqIiVzrr+ZY9uPPd34YKC0TZ+RcEnqJFkQYLiVZTPN8kBCeMOpDhL7GU
 OCQ4A7UEkKlvrsHATyxoUDbzelqmb/tLensCOomYPgpJOiPdXSWC3rdOV0l+wTjRDuRtPbbyqRV
 hwZVE4X8ll6zx0Zi0ykzvBFD//HD+Ue790FsYTCF1w1h1QkYeyzR6Iu83ZxMNm/7wGzDn9wGNZa
 2K76+FA6Kexq8i460ajoi4Jvt9w2gORg02XsqulX25Uc9GlyFHak334BAnxeCnsMkCVAF2uhmcq
 GPvGHZmJNbVfmLGA3PhSHttPI4IcOCiPhcBKeNyIpkDIvvGAcVgO12eV/+B+CbdcV17Y4XdX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=839 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270141

On 5/27/25 6:32 PM, Alexey Klimov wrote:
> On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
>>> are required to support audio playback and audio capture on sm6115 and
>>> its derivatives.
>>>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Just keep one CC.
> 
> Question is which one now. Konrad, is it fine to keep your oss.qualcomm.com
> email here?
> 
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Missing SoB.
> 
> IIRC I took Konrad's changes but at this point I don't remember how much was changed.
> So I need to switch to Konrad's owned completely or somehow indicate using tags
> that it is initial Konrad's work.
> 
> Konrad, what's your preference here?

just loosely mention it in the commit message

Konrad
