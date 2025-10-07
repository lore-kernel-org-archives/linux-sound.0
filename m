Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429C2D838C
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832666; cv=none; b=lhSokT0FSFxBPmBb5mukHoVkHlytlqZNAWsUAMSajW59Cn/zzOra5frhJq65ryw+XMM1NjMmfPhA+J4+nAyUP3KxnrJrBXZAgyN+T8XsYS2nYu9Dorwzv+kk7xjackh9Ic1QDbfh0gMWHLZEHF4znYl0oKh5Tnus2ftZnuVOa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832666; c=relaxed/simple;
	bh=Hz0Lw9XoJxxpUtx9lMNm5Vj6GKjcPnXjgaggtSuRo28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H07lZrU40CKjjq2V+eAMDREQyXGNZumc/gX6snKNhGI0Wr6W9nMVobucGYzkmwed5ETNJ3Lv97yTRyO4ZBMCFvOkz6Bh+xp+Xb2KE7VjsaDoydY2nK5tbUYUum+LCPKKUAjMDsIO3/oaeXJXkK20aXSOcJa8ORR0jr88BjDE8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU22RQAO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hU22RQAO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973GLcH002759
	for <linux-sound@vger.kernel.org>; Tue, 7 Oct 2025 10:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hz0Lw9XoJxxpUtx9lMNm5Vj6GKjcPnXjgaggtSuRo28=; b=hU22RQAOLlj20ycM
	Lbxfz4cMeFzA0X2Ot+4wz3AcNfmsC5lxP+YqcYQqJRyjxRwBi1dUV4AgDGHT+4aB
	81hRCV0nIgmAhXehfYcBEL8gv2qDdblLL4a96ufjvUAfxTXzpe+pHwBNHye+NcSQ
	JsEVjKFN4oGDGQfzy1p20pESqAPrFYaQNt8xAUePTMRGhUeYtT/5MAmaSbHjaffC
	PiIThhhvXnaJAMmwGvsIGVZntwV/y9Ws++NNiGk93spi4n5lErcoqY7+oNG7OnCp
	89v5Qa+SV/5GCutVILDVsDQJvvwsXqnnd6sQUbwNWkT9jT1pcieHlQ/1uoIOsfxr
	Z4N8Tg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn76mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 10:24:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-873eac0465eso22847156d6.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 03:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832662; x=1760437462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz0Lw9XoJxxpUtx9lMNm5Vj6GKjcPnXjgaggtSuRo28=;
        b=cld1+mRvwWGwKnBxqGPsoZk63s7EFF48QtLRK8rL5JjkWnM/0V/wZwh6cAer7QBO4M
         FuHdRjfOUmsZVJRCdI2cTPaKh8/dE8T6FpWjl0PH4T2a6kKr5CdzxXHOhIKz5ag3TWJ6
         Swkgt50lIzzweW6UWH/qcTlEH3W//VIgnqQ8yRqpxE0OY65yqBgkbXKdl9S0682Rh8KP
         9o0tCPplkJ7LNwyN170fPCKvDd7ZNe2qHKzUxvvCkq9oCwBUhUHZgmypzcSo1oIpYtvO
         1Fnr4jRSy+JDc12CFZn+cDaUPtpAnwWAdsMWpaCXvGjGxloDipgbFw4cQiAN6QhZ7GPE
         Qi/w==
X-Gm-Message-State: AOJu0Yy79GNH2WO6Pqq21KHETaNUU7CfzxkUC1UECw3nBsOwZffRccPj
	1WCTU8A8CL03EV14okLVrko6cK1doVMqzRhz+Y2ZrcWgCdGor2v6YlGqlAcV2pTgEcrBy24ITFk
	8RLSjw/4n5sva26pxVaFRiQNwD1tTZ3ZCzHliUgrVbFoBPo06Q28CS1Y1qnGyHKZNZg==
X-Gm-Gg: ASbGncuLn0s1eZfpKFsR7NkG+nwYp4oS++hL3lBypkV1y++6VoaZksCAnLVnKU8QYJK
	ncHsvWco1FxptpN50hCZcYmoqYN/Ph/oPzJhvn35hZIhfQbTBb7WhIxm4e1AUBsIkfR4f01/G1E
	XeUiQ4flw2UTIuRZhpjtGPDLcxvMvsp78kkHnd9rVJcH1m1V387CEZDiaYQzRa1Gs1ECEyaaxof
	QXGaMzCj+wwxFccBxX/DuOJcdTQYpAP7Q8Gh1KQVSVEe3mbSYyi+b7CArT2Ex/JYDDWO5nORNq9
	NHAzIrBHd5a4LQcK7RX4+k1F3EuUFHl1v9EQFVbE4x0cHlrJjAGbNCyuIE5yM4gTvDRGSs/5Vtb
	tZPOmcowgevnJZqOF+/QiCtgAuTQ=
X-Received: by 2002:a05:6214:230b:b0:815:e14a:1f44 with SMTP id 6a1803df08f44-879dc6b708amr132820106d6.0.1759832662341;
        Tue, 07 Oct 2025 03:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Zrt9GJ0jEKgSzWhbAu8xtMsQTKHzxXFf3iuTYiuMvNb+I+Lvf727ImsmH4W3gKxk48yO2w==
X-Received: by 2002:a05:6214:230b:b0:815:e14a:1f44 with SMTP id 6a1803df08f44-879dc6b708amr132819936d6.0.1759832661751;
        Tue, 07 Oct 2025 03:24:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881011e9sm12024316a12.25.2025.10.07.03.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:24:21 -0700 (PDT)
Message-ID: <64719a5b-0747-4f3f-9bf9-c04900a5e0e5@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/6] sm8650-hdk: Enable I2S for HDMI
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-4-184b15a87e0a@linaro.org>
 <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX7UNemhBn18F0
 968ezjEO5kj56BB/7YyrQpjuoXg3AMto7oUups0bJUydFOSxqF/CugSRU6zgPiRl5G9wj45con6
 PErfWZptD6FLgQtpB/G3rdhRrfivtNUQG7DS77PvSNQKwd/VDjzY7n/1Xympm9AKDRBNhedwQw0
 cZwC49sEmpVJXqHJkMCrr6VEUTBQl9N+/1wuPiFH10fK5LGcRz9/6WYNv51zvX/1vKjs5ldgEqV
 zCD+5uowY6apThiX5QF9r8hJlRn+D5JXm/RvydFQMVR+v21vj7R21RO7oVldohaOZ0ujH4a1ONr
 YNMfKe9EiRbQV5vdG1icEf0rIQJAUGQMCwYE5bCQp5gDes0iuwD5maH1QJQWCpeWyW2kw7QkT2d
 X1EJfpjALaf6X1p5TOTVyut8z3YfCw==
X-Proofpoint-GUID: upQzVSXA6zTsuQdvNzEhFeot7ydf8c2s
X-Proofpoint-ORIG-GUID: upQzVSXA6zTsuQdvNzEhFeot7ydf8c2s
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4ea57 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=T-gaThBTW-us8SvG3JcA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/7/25 3:39 AM, Alexey Klimov wrote:
> On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
>> Add the necessary nodes to configure the right I2S interface
>> to output audio via the DSI HDMI bridge.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---

subject prefix (patches 4-6)

Konrad
