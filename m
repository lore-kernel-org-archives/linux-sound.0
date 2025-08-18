Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F407B218ACC
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518578; cv=none; b=KMyqbmDJJFQtJOkaDRa1JBLiHxeTJC/XHQNGdIE8pOQKiJLkUwc6v7WPi1nR9awwx3Nv8+Kw5wy6b+dEpeJGwB7+UozmWADQ2oxR1Gr957QbNRdLIeFiWcuiBJiNImW1Te764gETI9EaOkwuE4zQz79GkEeQ/o/isaXly8fVhzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518578; c=relaxed/simple;
	bh=v8TQVD2vn2z73mguUbqfgNSQQeQbImAiZzcexQv4K1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jECofQWWcyCYbcHe2WC2HVhMX6LMcw8+VW0s56cP/IvjNHsFGNgkBm9DIC1kp+8Ar2B9UTAR5HCkbPTHjI6AZO1gUhXkzdqOwQdXwqzqCIfzsEcyZCGFRhr4O/UPweYjYqNcNUUxV3QdOEknPxHQPuPCsLiFLtIffZcHEzqA1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp18PK8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp18PK8o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7AREM020199
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCju6bcx4FiaoDBIgpe/cizWDUazCG2B44X0S5ArA7E=; b=Fp18PK8oqdg7eB0Q
	YrzI0r4a7Pjfp5CLiiFL7B2Vm7cSybNXwlFXwRl5UstuBRBxUKbxOb5Mf/+oOmxA
	QNW+6A9BFI5YMvedye3lKFtQhtHo17tI/MvhQ5dtOpx5ZnBePGbb/VBicr8rEMt/
	EX4QItoDp5zFOdKCHXWLZwA7r1je4hHSsUOnnK4nXVQNyrAgshxPVjNUu29uYb5j
	pheu8bg4maEUT8gDego6+8ToSjhH0y1DuV0e86K6RFwNXAzSSS2K8knT2LIcDs2R
	rpyIEgYi1sjlncPg9yFOd+23TsZCxQ3WdP1lBXMf4BUA4Hzw/4FmGq/3U4AKqNJc
	evtmzw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjycnew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:02:55 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-74381de242eso5848266a34.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518575; x=1756123375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCju6bcx4FiaoDBIgpe/cizWDUazCG2B44X0S5ArA7E=;
        b=cplIlZHj/fHMofN8lSVeCB0Y7zI1/ol9PtNeNOIjHtc4NEFddJ/nbtYF6VchFnQU4G
         oQHTtMyPMtWZnrhSx9REfFNU6xDrNmFeCjDzHBZoAf7sDYM3psP0aNs3Us5gBBXQSCA2
         xnzzYaimSu6zFwz49huHp9zdIRQ0A0qrmo/jUccpvCysLHBfmJGbZJwY0+DVSwPfQahR
         MzqHRlXImNRbmq7kLNtyGKqyh6LPZcLyKy7mJducMno6sT8RSCzJbkNQU/V85xlRlQqK
         RhJbCR158/TeyV26PTbZ5UlnRX8fPpMJL0/OjFbokB6GCCit+Bekc5goCsgtq5RPeQ3s
         DEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZNQ+s0KZwQ5XfN9nSH+If7CLGyP722jH8y0IDDt2tjxaCJSkk3J+dqcN3gyoleFb8r9LaJCcOAExhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyefrpW04bzKqh7j8ktJtD0VUBJ3i107yNrgPW2dVDyXK14Ert4
	XHZwRnVC+EGa6BGpjdcfiKUom7/nrXCdNJlSy/kexa+/rcVkJAU9dgIYvsWXOvGa2IEwyd6Illk
	8UY6fex54PCWMaZASBQ4wOaqFPRdU/e7eyRmDlHn76BEXF2hzlSR11FqyHdiqGcAleEZnOUttNQ
	==
X-Gm-Gg: ASbGncvf6ucI+ZNCiaRM8C3Nrd674KpYyzq5v9usqo5LNjHNST+B2ZhtgfhFnoSyAGA
	KS/YU8uFOv+PPVLLMEDSSi5qcOw5tNGlkmQQ/65s7U0bpbX5Ig/gFK1okRr70d2HCAvsVSXB1ba
	bmPXxwQe2pk9PJjURnk2slhfZqbPDZL4/hunnlGZM5tvz7BqTBf7+UiR0r1upCkP6KIACq9hwg6
	RfTQ0xZk9MSn5Y3EdpqdD01W4+pNyMXL3Vt6s5MU6QfckRIOFNjh2M9sL9AhCGp1Dfy0JeOlZ/f
	ErM7qnlqauFPym5YlCR2NlWUZAZAo3UX+yaYXFPYilVk/SP9usjUWUOzXZZFt+ZlPU8=
X-Received: by 2002:a05:6830:f89:b0:743:2cc:d52d with SMTP id 46e09a7af769-7439248fff3mr7185064a34.27.1755518574743;
        Mon, 18 Aug 2025 05:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0S9aYXMwUyd6iZ9WqnqRGP0929twrrupyMw9RBL7nXISanLRiCa0LYDt7gDwmTn4IW7nOhg==
X-Received: by 2002:a05:6830:f89:b0:743:2cc:d52d with SMTP id 46e09a7af769-7439248fff3mr7185018a34.27.1755518574235;
        Mon, 18 Aug 2025 05:02:54 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3bb676ca37fsm12454389f8f.41.2025.08.18.05.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:02:53 -0700 (PDT)
Message-ID: <ade7d6ed-b4fe-49f9-967b-340ac75a0ecc@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:02:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: qcom: audioreach: add documentation for i2s
 interface type
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-3-srinivas.kandagatla@oss.qualcomm.com>
 <9f050ccd-0fc1-4fb2-94f5-36ed1f2f4f01@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <9f050ccd-0fc1-4fb2-94f5-36ed1f2f4f01@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G6_Q8qGqV71n7qoEi9n_2A17PPsQDO9m
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a3166f cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=OPwlfTSxJuAJHfmk8b0A:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G6_Q8qGqV71n7qoEi9n_2A17PPsQDO9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX8aTKRuAdNYuz
 6mQurHtSIx/h19uURX+jx/GzqyixOz5FCcivcgCEEWj1l4zcTKxMgDXelrOyVTWB1Wfo6g2vc58
 c5w8LqE5nsn/e47b5ryd1jk8FMuo7aUhJx505buxF7/exEWJrSOooe9DBbYkGICjcooqM6EpD7Z
 rczf3rt+H+xkfNM03CcRJPrawqgJ95iNBTDMJT+gLUoduYdsIIClQYoZeVFp+NHMHBx8N0RbB7j
 iew/NNgJgNcv3O5p5VVYemaTWrXh6IC5J0GgMT7B6usVVRg+G4lonEHtBzc1IQFxXWFXLs3vodK
 QXNRB8sMVdCsgLltAczouPhX+Z1MlLFUAB7JzlWasZLnEXDlSsS82D9HQbe2LrtT5Q25gqVPpDI
 P9C8yYIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

thanks Krzysztof,
On 8/18/25 12:56 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Add documentation of possible values for I2S interface types,
>> currently this is only documented for DMA module.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  include/uapi/sound/snd_ar_tokens.h | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
>> index bc0b1bede00c..3aa5f4928a2b 100644
>> --- a/include/uapi/sound/snd_ar_tokens.h
>> +++ b/include/uapi/sound/snd_ar_tokens.h
>> @@ -118,6 +118,12 @@ enum ar_event_types {
>>   *						LPAIF_WSA = 2,
>>   *						LPAIF_VA = 3,
>>   *						LPAIF_AXI = 4
>> + * Possible values for MI2S
>> + *						I2S_INTF_TYPE_PRIMARY = 0,
>> + *						I2S_INTF_TYPE_SECOINDARY = 1,
> 
> Typo: SECONDARY
> 
>> + *						I2S_INTF_TYPE_TERTINARY = 2,
> 
> And TERTIARY?
> 
> Although, they come from audioreach.h so, well, eh...


True, I was doing vi autofill.. we should fix the audioreach.h as well,
let me do that in v2.

thanks,
-srini
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

