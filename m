Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C907923ED73
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021370; cv=none; b=gW5HZRoC6YCu86CXllI11fL5gPY8+YlLF728WWXbGpHpul3rPbW5fdfcFCMCYPTHy5oFcND2G6JnK5oO1uuV6F1mIQgQcSZS9Wn9xTZd/VJVakcSOBMpimZfFXaqhYnmU/eDmWBlPGYCLelRzBHXrok3JilqOpLuu4uS6cJ+NbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021370; c=relaxed/simple;
	bh=j0SxUnuDVYO2JZYCLop+naPFe4NlfD3BdegfyxmRTfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ij1H/1IldJyZAhEPbcQrmgtN/3tEDPwggs1CdcvvheXmZjq/mirQ6+x6oiJ3avILc3tRdDiFBlYMd3OSQTMsSkG7zOZLRSmB+ZNrBa4AFmYvPR19pF9xZ2ICflz9/d8bZPUwWdekc6XU87aUfWGzharCpQ0uzlAj2kWdEB8IXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ALE/zs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ALE/zs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC872Ck027443
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 16:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1YtoqDvIa9oxEwR79Z1UxYpdC9VmaaKCVP5CSY5CeXQ=; b=i/ALE/zsKE6LxvHh
	SiGpY1A+2QBQsbkKzGAKRDEIwOy6qINRrSN7FY1FtcE78WOGVory08FoSqB+jWJz
	qCCn90T5Efc2kIyQ3F6G37n1O03+KXIIDBWRiw962rlV9TthLvVT10wxu+undzkI
	UTmsTm090cr1NABGTqHrEV0AKYNQQ9fy7dC94X2Fs3LTvpj+NlCeSQKpXlQfxOUe
	yZKqpnZHQzbvamlteXRH6AldLAbwSWKLhfz6WgXCFlFdaNWOZASJeqhSrridr/IN
	zDJZeDwzcYMk7MfRvEHXKgRN6QgI2DQL4L8/dyXI+qotiwyz/D3ORzavhwMMHemV
	u9Y/mg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8xv63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 16:36:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467616df6c8so1459421cf.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 08:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021366; x=1734626166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YtoqDvIa9oxEwR79Z1UxYpdC9VmaaKCVP5CSY5CeXQ=;
        b=BUifEEO70U+OjpSO5ZMAaQVaEIYX2IosCeCWgYxsOcB/duZoq8fW0a8UcwVHUHWZ3f
         /Y1e0rgPh2rHw/S3KzOXrIQi9QbFhbJQNCWrD2u5EJvBRcTqxXGwvbtbrkPyJlyBRH82
         PTJWnZEW/71AsHG6Trpy3ub/M63FjsQ4IPsUkihJlrS3kNq3i5cAHBguAvewptUYNy45
         TxNZ4Ypz+w7VDfz0KVoik4YSwx/cb4A9XVrHR0ka6U4ck3tVyE0aOloZrPjKpy3S+mLh
         ARcI52gDS+Bk7OBbrM210/59K1pl30cnJ5RpeAMXFT+vPO4nB+eXs31j9tHd5BHTLVHB
         vH+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXG9Jwl4LUMb0SSlYCexh5Xxu0y3plslihZb0hKqdQ1tE8/q5n0pjQKHICOcNYD4aVtjxAm7BSFWWVkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSEVHLQAPZ9IGRXJAw/CALYwJEopqFjQOwXgJumyoZ5ztcYaS
	yyP9Qp52IpEz5+odZlwH2SgDFw9L9VE8OsBBFtFEkChTPv9d0lkqHExtI069KbyAR1YaYeKO3Pp
	8RB9rWoqh2PDyOVXpi4coC4H9eSYIJmB9uHe2UEInHqPFWlKzGoB85mYQKZ5tWA==
X-Gm-Gg: ASbGncvB9ert+M9YxgL4r9+tbAS66pLQsv7vjDSxEkfd33qDBuddpiwVy8Zq8AxZtTW
	Uxd8PoqvhDZW5mfiWKNojommummV+jihmIGx9kzUnnUke0iOtRrwYssCrA4sId7x4/TFfz/D8TM
	r1ta3Nmttu+p2iubs8RWwvaWs9CDuJ5tSK9qP3X/qDsyLM5DO/R1Ecf78QhHGi1Dk7EeVKdSxuV
	Qt/wc3wX4xYIhWAzuP2mPSX918I++ZNOmaL60V5V4iZ39dQMYeJ/+dNjwj5wqwuQNt3YOA2J9dg
	RQKEa62Tjj1BvoNzi/D8eCfpr1w2FKlkS+Z6mg==
X-Received: by 2002:a05:622a:110a:b0:466:92d8:737f with SMTP id d75a77b69052e-467a15ce4camr6863001cf.8.1734021366624;
        Thu, 12 Dec 2024 08:36:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVd/vSE0n8cUZsCd5G+SQzCt7rdg82WYVr5UWrw6lLsq9BZLsKpztwlR6KttQvjAc1CxsH3Q==
X-Received: by 2002:a05:622a:110a:b0:466:92d8:737f with SMTP id d75a77b69052e-467a15ce4camr6862751cf.8.1734021366287;
        Thu, 12 Dec 2024 08:36:06 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68bae18cfsm577641266b.115.2024.12.12.08.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:36:05 -0800 (PST)
Message-ID: <d48f3064-be74-468e-8b7f-203eed33d238@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:36:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] ASoC: dt-bindings: qcom: Add SM6115 LPASS
 rxmacro and vamacro codecs
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-2-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-2-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S5tE2wQ0biLchdy8Hw3JyA9b9fBS5zZN
X-Proofpoint-GUID: S5tE2wQ0biLchdy8Hw3JyA9b9fBS5zZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=938 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120119

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> Document compatibles for Qualcomm SM6115 SoC macro digital codecs
> (RX and VA).
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

[...]

> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sc7280-lpass-va-macro
> +          - qcom,sm6115-lpass-va-macro
>            - qcom,sm8250-lpass-va-macro
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
> @@ -83,6 +84,22 @@ allOf:
>            items:
>              - const: mclk
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-lpass-va-macro

We all like pasta!

Konrad
