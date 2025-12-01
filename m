Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6033054EF
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586784; cv=none; b=ec3nxdyc2FxRpZTw278DtSxDVejTd6icvwXrKCX7FXLLyZVyQ3znh7OFOe9q2aLXUi0wS1wXBSpCeuJJPfI0kQMNcJKWZ78qbRfgOzErzyV7fOpcM5T/1gG/JP2iC4Aht2MoH6eWxTiZD4BUWZaXr3m9pmNQTG3xoahQAdGoGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586784; c=relaxed/simple;
	bh=ZRsAnAVe5nrAGb6ovG+MsuQzA7r6lxjyBMjJZd1jnoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aH+u8LLNKoADfXEuZEdQpmm/dKktKG4qWDdFp7/+i4DxS9u32IgYmtQjz34INNLB9GxEtG1HZ4cT6Qtng6Sbigd7WCjeftST4yrPorqtkVV1X1R7uXqd9bq07eSfaZfSMKiZMWIBusbyXCWw6jKxTgpPZ78GaAAD25x6Ek92M0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o97fQFmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOgd6MkF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o97fQFmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOgd6MkF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B17uEwq3837701
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 10:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2c+Ffhp4nOSJTJMkIpqnlkvNRCAjezekaTTyr/bZReI=; b=o97fQFmHgiV+uSBA
	DJw3GOhGEWTBq6BpTvQBq7zUo0C5uTb2qJKXR7F30ntJfEsPm2w9NFkV86Ik5CwW
	34/j0xzkdXzUE3IIjwdbxECLTM0BbTBRdWhdLgFxyho/xG6aZNSMvENnGXXwuYOG
	9U9Hcf3gLQCnsfk9wfY0TBqMGhBEPrhI6uFXkF0FZhF2uQX/ajEnPqzKnTlradRq
	czHEIK1Eq+bxsJfBg1bg0iKifq9sBpaZcMDvm63MuMIqTLKLV8MgxliGnyx23NeI
	sTHSSwaULSwW/+ptKP85b3hJzXPYBX1Y6Sr0oblk5WNPJEqzIa2MGZNKjkPoJRnt
	GGa2Kg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as72p8k7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 10:59:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29f90f9fdso76048185a.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 02:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764586781; x=1765191581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2c+Ffhp4nOSJTJMkIpqnlkvNRCAjezekaTTyr/bZReI=;
        b=iOgd6MkFecr9cKJ4uxIGQWoGAU76cpfCvUW4V1HG5Vzo9VqWvdq9rvaslTijnyxxiW
         Yj29ii8/onNC9WVWEUcd/dUaeQfVmoYukxZ5Nm5iNx/iRiR0nM5SYyEHO5ZM3f0gnF6J
         WCO16TqlXpwFK4T3zcOjnIgeQT6T9uQhCZvzsi/Ll0/f2nRPIMdKX0wPtY1EjJolf0TZ
         clXnL9UUGoh0u9u0ETafH6muJav6SUKkQds0EKge/DNG3DUeVYoy0AomTOisz2tGRTcq
         R4lSpCla+ZTlBzxYlVh8bZtBMlD6nemHmAwo/nMQavtN6RKcYKHGVYmqNnmgZvQxmcXt
         erCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764586781; x=1765191581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2c+Ffhp4nOSJTJMkIpqnlkvNRCAjezekaTTyr/bZReI=;
        b=AsjE7rjgNs/idFSbezJzgl8yKpIjCP8K3GXxLH/Q2tcgqXJU77N3I0/51vR6dtR47k
         G7uAcnGahWfTZWfTdeI9vlVrhPUFSY4ni0XGLR2WRUJ7dDDP1EWDRaCSrvaneQarLHjq
         6aiVOw/Cg+XY6nLt5BAC9EqmszA/b908zyXIojCErLku7uUzuXVfHotog50ZXqYJXBAt
         i3wYO7iiT1XyNtxlAWo6OhydLBmOOFErbUADnFKnXUeuITttJzY9W+c11cHbuSARgq7d
         CqUnAVKyNqV5vEormoMEGQepHJXXPW9hDM3bIyU93bvgu25Zkgp2hUXKaHRERzj7C7Rx
         ff4w==
X-Forwarded-Encrypted: i=1; AJvYcCW5u8GMGOAx2FjtvWtLaAsAfP9NILrIVNoe8E41LqV9Jg6ACyM+T6bClNyrtbRlNfc1UBhLplM9K1ro0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9LuM/8wGupSejyxLQKa/91n0xG0Jq5SofVOz8TIM5lyyfoTV
	4gChu1oZYgDP8slbyaSXR7Kcn9nLyO6nkNFERpXt1so44ynRM92dh34yru5yizAGdPx5rslrW2w
	0j77BEBbSsnQGXXTIDV0FHIPFFaERpuzdKBOOxpefdwiPimEBRvUJ1cW9P64NNC/ZvNjEigRKcg
	==
X-Gm-Gg: ASbGncutftjNsEO9viKaIDDI48CXi1YnhDfV7wpPNDQHUutWDfBj0f3d4cMp/w7uRsA
	JNsslSf5Lf5X/wVtRP3mUVThWtxPEoXOlanMouVFrukaaR0uqojvyEumrrm3aAGt0uQVbJ61nT3
	fgq6t8PSxLE4EX4RitHUw2p3jGY6+V18JntcLj5BzyUGqkhq5vsMwtaTqImuxfMYI2k+RE91M3+
	vLEgcLHPRKZmgJevzFKb92mjB9vnh3dP57w8xJ/cHAEfQkyb7/y5a7sOXGE4aCuJJ1vj+M8yYT4
	vLeyjnz1huO1LcxvYvj8+oVLVczuFwaoxuqtBPb4nXEQa4sgXgTrm2sd4i5DWCRzVX6jcJAyblJ
	R206jskcmUWckYAISuBlZTj9USh5STrV19Rt4uWArw+Ll6PIoF0zZHtvPEIDgpMO4JUk=
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr389386351cf.8.1764586781394;
        Mon, 01 Dec 2025 02:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzcAz6lnqni0OiVA7BeYpFQ8kmZk3t9z8FC4vAg7GbpyN5xeNg6eSwVew0K9ygYxkwJBUUuA==
X-Received: by 2002:a05:622a:1388:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4ee589272d9mr389386191cf.8.1764586780868;
        Mon, 01 Dec 2025 02:59:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750ac0276sm11886760a12.15.2025.12.01.02.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 02:59:40 -0800 (PST)
Message-ID: <d0323387-df46-437a-bdae-719d142ad61e@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 11:59:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: Use guard to avoid mixing cleanup and
 goto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uS_wSDGhTAy2VZ5bkIlCrq5QDcJVIUpI
X-Authority-Analysis: v=2.4 cv=fs7RpV4f c=1 sm=1 tr=0 ts=692d751e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6rSAO90NPIHcuN6HuFQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA4OSBTYWx0ZWRfX9nv0JznPzoUc
 IdnJScoIBFIhrKjR7nHU0F65T5lyFbXDFe3Zl6pzhmVZ9W2sW88sDXQl64HipyOos80jvwwJKF/
 sS18y0nU+2B+9EO36v42i5GRhiWmlqMBFOIqJn5E0qzEDid0YCVCUJmdwhLbM514yMZ3WQJE+Pj
 GB2Zw5bpopUmbDrlSzdHZp3uk9k9g6uefBwz0HXF5f/FixD71QgESKjXfXaCNUFbAno3cyDYmAU
 +qS157bxDr16P2su1jpB0rvI9gCxG74ot9I06rHmdNoo4UGsLvc/yIoZg3GBMknVnUFhp5x2P50
 R1EEyao1NCewQgTIrCpl/KD1lnrVPiux7AZsnqpOAyPRudTz2wm/Mc9xnHw6jfVLajHVQ4HNiSh
 PFL6UO+ivdjgNJNHXKRX6vwSMSXmMA==
X-Proofpoint-ORIG-GUID: uS_wSDGhTAy2VZ5bkIlCrq5QDcJVIUpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010089

On 12/1/25 11:26 AM, Krzysztof Kozlowski wrote:
> qcom_swrm_stream_alloc_ports() already uses cleanup.h but also has goto.
> Such combination is error-prone and discouraged:
> 
> "... and that the "goto" statement can jump between scopes, the
> expectation is that usage of "goto" and cleanup helpers is never mixed
> in the same function."
> 
> Actually simplify the code with a guard which allows to fix the
> discouraged style by removing the goto.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
