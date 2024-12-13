Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0771EE00D
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134163; cv=none; b=YbMqSqh5fbqdHae2tzXnCHe9heRznkrDPYVjkaS/ZGVC3gamUlGt+cKJ9Sj1Vqb/QMgLmbYlSK4cUTVGtbyYjHzOkqJlyBwgWNOHeSmBjSd+Zg3yCa7rNYaLq6aQWIc9A18b/ZOcH310BADVQHKvEsW4C48Q70k4YSLi0y2jtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134163; c=relaxed/simple;
	bh=eB5hO81qvELqW1QVwzwykvukceZ8/b4PMpblBqb8Ec8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtS3S8NjfGmL3p8zX+jQNR9xsVk/dzeKTeMvUmAJwwa9G+k/agIjXIax+dbjFJ4VGtVSuzYAB1ZpYJWbiEehF0sg2SEdRCU0hN3OM0zvE7ALveoasSl4Xqth/TZS8d3SUz8HM+PAbLOVV3ytjbClPYF4ISjXc3Wbfh1DbiV/4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVbq75gX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVbq75gX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9h2Ga007034
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBfG/0PIjoHp4oAUPd3vdYoV7y4Iyy6FP/GMZ3kUMk0=; b=oVbq75gX0Jdii2f4
	hT+6nR8fNoBzXancBaX8SEhqeAl4EMEkRs6CvwDvUVcWDxPoOT8GUV0d7HiRMr8h
	5W+i6W21IsiTyJVUluDc/xaXKFpi56XDvSLdqdFEyJIPmk1r6P9IgACME/1Gg/82
	yTgC8BCtWbTfw+ZQGU957AnCos6j0gZABaytXAs1Sl2HHRMxyFaIP24Emk+0dlqN
	Wxh9ze0lVUbfCT9Jzd2Lp+4tFvF9y6e1d+KAF6R6QKyBUV4JEI7CwfvUxbK/f3Tr
	eXr6+Teullg45G3mz+03g0c7SO0zXZIaQkEBPWx1ILveCoQHZtUZra2ur+At5Mi+
	SeuyEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xuuk3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 23:56:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8eda4d80aso3085446d6.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 15:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134161; x=1734738961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBfG/0PIjoHp4oAUPd3vdYoV7y4Iyy6FP/GMZ3kUMk0=;
        b=u+igVRULJqLuKedz/DbT/fKBIaPNQbbuCrqeZuNvSF9jVKCIvAmpYGg7RK6Pkhv4Dv
         BAmleHnVWpa8s5Rt+idG5fkl8aGDn89NotSV9ihu+YW/tUvogKrQyjZlLw6zJopqj5Te
         T1OF7yYNsQPDaW4MtbRBzv9agPacsKyjgQT2TtwgYO8XNb/FCIEG7w8/v1j0m6dn0Oaa
         0kKr+wIW3IGAvjTlGQwLNq+T/HuQAOy6V/TWi6wWrY7JYF06TfGa3KdSHVm5nRp7LJrA
         ImSMjZ7Wio4qHphYvDRKTv1Zv88fZ/x1y+pckMaKroadV2ig13aga5dlU+f2Hf/ex0Uo
         E59Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgpce/00m4J1HjOPbqx/OKqiF5nly2Jp7199M2O1+7AAsMcjgRkS7iHt2DJk39LFIa7F6IVD0GImxSMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQyjsx0jSr5dQklmB9ze7faH4FihCC+jbNgUC0hm1zWwfamUSB
	OymGZL6Qpy+fxMBqIQdfuTK7AFgRcWXZent5OkHEkq01OeKdTfaNUPNw2MvzzyRFrbyHq4HvYPU
	0EQFibZ2bN+ZUii7/BkgRL7d4Q+RGivC22cBBryo7WXyx1KjGDcMjv7G051IwTw==
X-Gm-Gg: ASbGncvzjF9xCem4apprGAtlhYAX1hcoIezupbAW47ywK/LiIH2duVBunJUCzpEjiN4
	tn9rWdzgX7gvl27zxPzGAKZEWayrsZTDV0WNmpfLQ918Ey9lbTH6wVSWn3RihJCuhSS96McS8VN
	siJ+3qLCc28H1xFWtwh0NZ4gR0tRH4ke0pe1H6pOG8sfyJZcTonHssAkbeNp2SFI/OMpDCrXHPl
	nEqmkoEksY/C37+8EW+TonOSLiVJwohhrHWNILfanZtopqHaEPFQvpLV9IkWAN7XCnHz1KR7MqF
	gFGZ0Ot2VwQoqjpJxkwSBaCd7ldSsd36A2o=
X-Received: by 2002:a05:620a:191c:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6fbee75e0mr249125185a.5.1734134160887;
        Fri, 13 Dec 2024 15:56:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkQ+V4mTkhQO2bVQpzfTauk0x3WapSTTM9VWOMeUP6/EPzzWU8xSQnJaVWpSSlnYUHGIC8pQ==
X-Received: by 2002:a05:620a:191c:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6fbee75e0mr249124285a.5.1734134160575;
        Fri, 13 Dec 2024 15:56:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96006c3asm26507266b.19.2024.12.13.15.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:55:59 -0800 (PST)
Message-ID: <a106e659-1ab0-4eeb-bac9-ec882766094a@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:55:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] arm64: dts: qcom: sdm845-starqltechn: add
 display PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-10-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-10-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vpn36b9iHPXs1mUT3wVKwFQkGEGm2mcn
X-Proofpoint-GUID: vpn36b9iHPXs1mUT3wVKwFQkGEGm2mcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=763
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130170

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for s2dos05 display / touchscreen PMIC
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
