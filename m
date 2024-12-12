Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467621639E
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021606; cv=none; b=Qy36vY8h67r7/e6l/w7auXfoLkh+aiqLhMIH4jpRL6iMKObZR14ntIK8HuIIBgdCmWK9xLshr6P8PIercgTYdJR/eyHKnZTPBb/cNNhXHA1BF3kgTzZ2RCwX83wEEWjCkRckITbXiqjk9qcZSVP9z8tICzbHhGGsIR2XU3a7mMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021606; c=relaxed/simple;
	bh=kEb3ESkZIpLBxO6ChQiW2DNV3iem/uNx8Umljn2afxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xy0dyn4cx/PLej/KKlBv1/MM5K+iRZ1ihma3VRii0VopzMyltbgCZJ0pqhzP966yw+G92ak+FgLjtywOZ8P6BpC3kR9HHv2W8/+jtg2L7Xp+oSa2vUeRzs13BnOFWrbw6pcGZplNB97MsqsSBKIj47FPENPQWAzhcy270p+DxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4tNv6W3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4tNv6W3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGV651002126
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 16:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEb3ESkZIpLBxO6ChQiW2DNV3iem/uNx8Umljn2afxw=; b=i4tNv6W3zFrwF6Lz
	U/YjN2U8CUtzwk18QI3LAExBBwxyDKk65ly/sjvMIkaeUu7cYrlLMiGd6WQDoCBL
	oa3fM/o3kGxJLHLgPzbjgrKyCf45BuktOChaqTl205j+kSqmwAfMDbshikCc+CSu
	l4JZ7gh/2kwnj0Ci/kURxfZjxiA0SF9DJfJolm0eXyNOoWvrLVJLiSQ5Dpxm6Si+
	bTxEN2d7CdcHnCLn4XQFBlf7twbsN66Nxl5+02UrxwlCqzSd6kysEkcrScSgw5pZ
	PcdR5PI7UZzY6J85ehJWHK8Kfr0+46pJ5v3THx3GIvfYkH6aDc3+z6gSmrZ1PAhs
	fsdYRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9x2jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 16:40:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46763cf8565so1883491cf.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 08:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021603; x=1734626403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEb3ESkZIpLBxO6ChQiW2DNV3iem/uNx8Umljn2afxw=;
        b=tTV05S+gPIaIw13Id3Gt+5vpgHcqPiYz3m2vzcJNueljaZmcdr1uQzkBnM7oWIj///
         /18GxtMnZvQVGcsIfAXzrW0rvZAGF6TgZrmQrr580FgdGKMTyQnH+Od/Leei6q5EhTW3
         sTCq1014g/bFFrVsoZjAcTBbuqPTVv9XxI9qXtaizYMZCkRevab/FRVa8G8xf5r5ud2n
         g3GLxEDddRwoHGG5uixu+0+7oK6w91vBBMRFZcu2rG9ANbSbGduBoBVJcsMNuWUxhN6p
         UAqFzzZoeASo3tIc2ZFFTXU2LJXrvQmJC+KApgYnlNo16r/2jvdPCnrx0R7F0E7iG5Qp
         BJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVL3g24mKTw4eooVsTI+SH8v2OcZkj9wHXE2rTHCEh2teMnMtjkOEthCUIV1Jf1+E8eiiYxjgd5/76/Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKiSGWGHUtVZXtKYtEvVRkJ5h4i1VS+LCFtqq6qC20g8eezlnJ
	UYn1pYslk1Y3DSwYZ3Cf2gQwY0DYJhomgZcieR6aK4LMlkp4DtXWZf1a6BJhmvMscZinieblQZ+
	N5tUHHhd2+VRgD6Zb62bGIx3W/Y2Al2dKQ0L9WRqLZDEAB2j+tDOcgVbZvGWuJA==
X-Gm-Gg: ASbGnctTGQmU2Efkvmze4I5dHr6DYeIZoFUVpBcj2eEQOo7E4CebfCsY7YgmVOCGsco
	tHwDQt9Htowj5i3HUxO3KvyrBwg6COz1rGiPHSNJXvEfkNUM4yjUmqd2lDqWyIEAOCCvUa3kWYk
	h2WQyVktydmDruUpgLsYWUPEcU9Al+NxTbvB0+aX+Hx2eK8ZT9mKZwBoPW2Xl+Pk7OS8DZoNtmO
	XRiSYETIk8Iy2iUX3jT+Kkd23wTH/gxBwg4SPai/pATk/BZxoP9tAYM1oKqj1AOBWrevf8K+0RA
	7xbyuQcwFUtZF1kh6PJ7sczugzMxcwz/gKmCig==
X-Received: by 2002:a05:622a:a:b0:467:885e:2c6e with SMTP id d75a77b69052e-467a14ceb0amr6505841cf.1.1734021603230;
        Thu, 12 Dec 2024 08:40:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLvFj8TYhHqAdCQaswyICMngZInZ1e+XWLZkhVURT+fAjQH7mI/i/omj8bnfV+3LE8tBfFAQ==
X-Received: by 2002:a05:622a:a:b0:467:885e:2c6e with SMTP id d75a77b69052e-467a14ceb0amr6505581cf.1.1734021602915;
        Thu, 12 Dec 2024 08:40:02 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69dd81272sm450830866b.161.2024.12.12.08.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:40:02 -0800 (PST)
Message-ID: <1b25b929-b14a-44be-acd0-b5f4f95241b7@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:39:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-10-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-10-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TpUhmtLMb84u-AYCxtpTQ1-JjirxcIV2
X-Proofpoint-GUID: TpUhmtLMb84u-AYCxtpTQ1-JjirxcIV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=780
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120119

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> WSA881X also supports analog mode when device is configured via i2c
> only. Document it, add properties, new compatibles and example.

IIUC, this can work both with i2c only and soundwire only. That's
not fun to describe in bindings..

I was thinking, maybe something like [1] referencing and i2c host
would be fitting, but now I doubt that given we don't even need a
swr device node..

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20241112-qps615_pwr-v3-1-29a1e98aa2b0@quicinc.com/
