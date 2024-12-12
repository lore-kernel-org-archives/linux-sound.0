Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ABE217664
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024154; cv=none; b=COelVFYpwUJLDP8oaqzq5liy8HYqbC3AvGPneRntexaq/SmZzhPBvv7NYXKIFxUB6TupW1POnYeIDv5As5i/8svsYS6eFj1me4y9dE9Ydd0YaojCLsc14i+5N4do35FjypGi+A89oq7dM78wdsIq7eG/eSFhkKdz8lBVPx36ZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024154; c=relaxed/simple;
	bh=RzhQRZVFYQhLnpEqkHEQLdhOVQLxSSPFxiLWiauqBoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+twcVqI+9yRmJ4re6zkez+eEKBBiqco9iO8wf6GlfT5IyOkraF5b7uLatj584zCA3ZX4LQyrVJ64qDx5D5m5c9k8NZfN4zxDi6EiQaJl649gKOirpYTMsIA4iIZpsgB4/U/mPpOGjvu/lzMkRfBuHERxY0H04FpOZGhQXtzDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjesebgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjesebgB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC872HV027443
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 17:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXI/rMwXSEtNCPJzmcPZTN62CU/qS5wBtOEw8hBRpg4=; b=HjesebgBHZtRhf3M
	VPqsjiVCwCD6w7SkCqMshw//P2dgEPvm/RdVYUt7SLj/m6tK+Y4Qg8opOCXPnRjY
	bjk0x3fR9G0y1a9nZGCvPIybQ1/ERSafIVxMbFtatoUOAuTPdqwgK5RDW87/tT0W
	+5Mx4D+2+SuI/6VJL/u46vAkuwL3IwzjA4sInrzSWdRxKQDKnEc3BHPT9iJkmxlE
	TLGGACVeFvaBoWvhP0XVDPcq7OZYKETts4u4xt4/hFs4rPd2Z7KhBH5PcM64dbhF
	jTsarWDgleoepFHWYN4bOdk2pAJnMQIrOBejRFWIJR1ZoDMzIPZbMwBYe6vCbSR2
	A9ErWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8y0b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 17:22:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4675a6e05d7so1641381cf.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 09:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024150; x=1734628950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXI/rMwXSEtNCPJzmcPZTN62CU/qS5wBtOEw8hBRpg4=;
        b=aUyqeHjZUy8LqcllRxU6P3oBd+TGR38naTwzaaUOKSnjcr+DPL7Xbv6UDsIxBGwYFX
         Rqk2i8bs/LvSb7vkYlPBL5hscBdyLAVPBaopm38MxKiw/O+zi/0up9DbkThvaY4VuYjz
         5dHj4/UsRzRVqOoRlXTVfX+qbAcE+tA97WcU8Yh07tbvMAUHy/95NthjvppIUsjZav6k
         mka9upIEGHqfVsjr3UPtazlgU/sb7Pr4wQDrc9fb9fteLe7IfNGkSfNtWiD4DXSetF42
         Mq/0h9BOePC7qjxT25OXRhsFpQ4A3IHvN1oUf61Y8bkT7y2hMjSWQsA68ocbDnuF/fW/
         qr6w==
X-Forwarded-Encrypted: i=1; AJvYcCUJDyfDW6yInOkzijlI3nVxPz3VBiEXd4ws5wjVlOQ+JcsVMnWYrzrLoKig5ZFXl7VGstqa5XZ7JvL5nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkgTVL4zg7wsotihbuYkRCel6/OpZM/GVICUhtmWVRRXlpaNan
	bH4zuPmtZSxEZJzZC971npdC+wAViGLHeRf73PooNPi6FydKDMUQAmWf/iIUN+gnZWROOQbzqYq
	afEdqbgecwUCnFFrwx6iK1r+PVGT3eeQKXUqzThGJwIkR5AphMrRd+7psNdaC3g==
X-Gm-Gg: ASbGncuUoJo23XRXMBqn8gPOvVma+56a628Ggrd1T5F9nKzzOqzEiqpeIbjxF55pVeP
	coR2T9xp+s/Uu2z0QoWrwxJnwbv4Ip5R06UBicg7Sh9wp5nRUAvXar1bKG0ha9UfFWSZkProTaj
	wSFu6eRO3n/eLRagfzfJQTgc6IUdPhI9KoheJTh6SQTVpEOdrROzRGh4htboDDFQiV2zCSLCA7Q
	kafqstFC8iyAIX+WHZjY/V7kGilSI2I2VDBFESpTK4Mq+SzOJl/s2kVpQSGsjq3GEEg2PGx89Ru
	Yuq8W49d7uW5aNQ0QLWB118HJkvlQDYDJy9t4A==
X-Received: by 2002:a05:622a:14cd:b0:467:5931:f6a8 with SMTP id d75a77b69052e-467a169b447mr6580051cf.16.1734024150517;
        Thu, 12 Dec 2024 09:22:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHudtOde+f8IPYAkK5rDmanvroRSGDkZDifNKDKSR1bTTXjCRopc+9Li9B48WzjRmEYTZPfGA==
X-Received: by 2002:a05:622a:14cd:b0:467:5931:f6a8 with SMTP id d75a77b69052e-467a169b447mr6579811cf.16.1734024150105;
        Thu, 12 Dec 2024 09:22:30 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3df2fc65bsm7743885a12.54.2024.12.12.09.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:22:29 -0800 (PST)
Message-ID: <ae57068c-5d73-459d-b319-46a582ed7f3e@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via
 RX_1 output for qrb4210
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-15-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-15-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QrG1O9I9FMHhLTb7zPsETL1mbBDnrZwl
X-Proofpoint-GUID: QrG1O9I9FMHhLTb7zPsETL1mbBDnrZwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=751 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120124

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> In case of mono configurations we need to enforce single channel
> output. This is required for audio playback on QRB4210 RB2 board
> since it has only one WSA8815 amplifier.
> Implement data variant for qrb4210-rb2-sndcard with
> sm8250_qrb4210_fixup_params() that does that.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Would it not be enough to set channels->min = 1?

Konrad
