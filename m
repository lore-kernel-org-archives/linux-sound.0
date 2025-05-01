Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F21E2845
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087828; cv=none; b=fyx9NmBPkr88pFz1uPRfpJJ3MaUWYP+kj6S3cEfRsLo0xS2ypUaMvl9GjTB9ZB3rI/8T/WC8evK3FdvZdhqIZQPKuu7vefcj1+02KvWulT5SDF3HpQIUnH6Y5UD2Zp8Gr8bFdQzACNWXELMW1gK0wlPfMoDLl79ap96inq3DtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087828; c=relaxed/simple;
	bh=i5qIUYMGnYjh3O5bD+pGUYppyjmm+gTXmK92O4h2v8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlHjxZnTM9be695DaxjmDTlucuXAwcZ7YD7Yjwnns4f14FUNHya9GfSSXXw9fbu0qwP4PPGc7eFHLWPSj9FuTFKQKvIhTOvDfJzDYkUY4b3jac1UKtiFVShzT4YlzG+qfgJl8rDYsaHlABGa2m8OwDP305WhI4iVctybcRbARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuEqgNET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuEqgNET"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGtc64002524
	for <linux-sound@vger.kernel.org>; Thu, 1 May 2025 08:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=; b=cuEqgNETSLOwnF+d
	ZFgIEOtfAFYyS4pTUChbA4F39BV2Gm/ODAl0V1wTqhUO8BQTnfzQn+9v8rqdC7Oz
	m6ht/j0Zj3/k9B1CDDciVcxTl8lVl0444rYLdRuRmrDyEglgVqjwJqut/36mtZE7
	V5SvB6sPwD07anEYlLdcDXPlFovNxs1w7gJrTtfDxRHXvQF7xXXXBrOUSBJfaShJ
	Q3FIl6xbxyBcu7gIh9xIHQqn21FSZfdpMcV5nk61SVbJPiQtBHttNIKPphrBUkEC
	m751KYZjnn6uqc5U/7/AzCa7o9ZdEM1jNe5JM4PlmaYY83IHgY8vtel7q28vYtwa
	T2io0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8cq14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 01 May 2025 08:23:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso14504885a.1
        for <linux-sound@vger.kernel.org>; Thu, 01 May 2025 01:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087819; x=1746692619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=;
        b=iTUYgqKaBD9k1LMhJBqLHmgLMAK5FwRe/JR9KJuFTXS79nTLN4vumIEEYLtpMbwyR7
         bkVd2xH/p3nPslXVN7DvxzcYRjudP1MGBwOikaDImkgRcrCxb5ENgjWVTInwfGfMvptz
         Lc9t2EhsSKtoXWYJDdQ09AtdCwJkLGbFMiMNtVilPkgBGLkGrAqhYfz8VLRp+ffmNS8+
         /2Ci2UalbyHSJ+rCbkdNR4W580putoXdUe2s4MFDEJYnIwsgBWNnue6BmOdini/40CYL
         IY+5lRFfxqbeLB23GmaG3zDobryCp7oAncmF7QuvkUMmXahNmH7KW6yaQEcxwRsRHUHS
         Bg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUkUX8Ee1+csnbHezW4czk2mZ1TxhSyvtX6Ar9+mCV/MAikfT7x5un84pR9FiTs+uaL4+a2BvTDOXlXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlY3fToja2bhoag2f8loz0sjijwm+nf16yTThlRSm0jlxGnlv6
	p96ZjqeaZzMaRU47g/LuZFQiEZZL1wOk5PwSit7w/e6UJdO0450opwEF1NRx+Tsj1Vdjkq6Hbti
	NRENeVSQmJAGccQEEIvjzQWgJKZD75D5OglM9yGCIkrjPKET/1jkAYTm/cqLs1w==
X-Gm-Gg: ASbGnctEauQhJGGE7fPiqoEBtC3TrywR85uTdjfbi1pT1v4xyDHDEX02VhJrbjtRs3T
	3wV4pSYjqdrp7G55BeDhm7w5SdcLTGuE/GT+CBiAZ3MeUoZjrfQDEMRPCbyKERtOCtpG53k4PQ3
	kEs1oQP/Bv8CFnH2yKRUrGMfTc9zXud+xWv6WwaWs5O2/wObfTurEg6algDh1F0W5C7ybRgNXbU
	rDxZGSzPUG6UZ+NRzUEgv6dpKiIA2H1YLxCP6sB+b0ZkINCoOb4qaOfCzI5yT07Kecc0z8f2g07
	iXZq5n/UjqhZe9qz+WN7+4IYCkt9VAZgXb8kTijZHGFsJ9JvWVHRJ6/yFTQyqMWpjwg=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162399185a.4.1746087819106;
        Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJbzEzGsqZkwSu1kNt92eSKw+iLzFuEHzTdaaxapBQpXXrMYs7ZN0NxD9KdvXg5kB1l+jX5A==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162398085a.4.1746087818757;
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af93sm7624966b.146.2025.05.01.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Message-ID: <a9f893cf-bb92-4acc-8d9f-5a3180b67d75@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68132f8c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: OQzn8fqAtlqfHhsE9xkwuuOaJD3lTVC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX7PzJYbG9YQ26 V9jZ/pS6UTpqV78qq5Aqo4XRz5LVtulRk76jiW1VyJE57IvNkAEl76qliinWzZkvw3yOlAQppJT meQuf3BKTp6KJkfD9q0WUZshONoeLhWMOqCXXYH1o80Xc7GdO8C+aODvEvyPlr3DzuEgnu6FBiB
 rvaR5yNAlvvyY+tIbMN9Nop6mIFkecQHNu2GLjYETkpUIUl8x2O6ngC+EVDVQVNMrSRRDL94j69 7G8XXh5MqBTO/8+hLWg6Mzr2rEoNJV/QKBicskW7s7Tdxdgnpr77ss0iZrmCQt8lPHj9d7dhrl2 iCtwdkZDhw9nT1p1O78d6DBnPa364RKcvKjQk4y87e5aUb4aHDLGYlNrTGkr8mZGKl3b1giUDM4
 fDqyjee7wPnhSXnQDffteZWZlF1ibDxGsyxNBW3TFG7OPvOaxS87rlrALyjhPhIx/QRFlg6X
X-Proofpoint-ORIG-GUID: OQzn8fqAtlqfHhsE9xkwuuOaJD3lTVC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=917 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
