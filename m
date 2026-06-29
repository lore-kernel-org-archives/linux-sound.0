Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043771DF25C
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708687; cv=none; b=q95KAO1KoSp5w8y1jUJHbj5YVqtOGItKRxS4S3BHFcEVtEJZaknvJrXgR7l3lZlj1uxMEezoUqQOcr8zJWoOgvRNLJMrYkwyymqDHsxFOko8Iax4SIVSa43PL6ta+vakWJXLUtR2dUGCXfShepqDOnYTQBdl2rNsXLSHUG3n3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708687; c=relaxed/simple;
	bh=T2k769MKZqT5yEUVpWFWxieUNhOvc2eKWBo5shbADlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sS1grG5LcuJFk+9jMW+YpZ9UOXmS+8oTJqzLSqdMk3kImwi+sauBgWUb8QkHGEo6712zYCj+4ZDhVWeWCdECYrb2XhjYoiF30EM+v42nur/979HsANjvIv/dI9Ht7MD8WkZoyNjTsXKLozgYlOiHCG9ihDNBytd4XHUHIKPU3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqYWQPJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeMox3Da; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqYWQPJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeMox3Da"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NEc11729595
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=; b=bqYWQPJN1syE/CZK
	0d9/ly4zI0dILjUJPETN891MR7IZkedrfQt/jb4uPx47H9mM6MBgw62ElYGketeZ
	bdpOY/G2jVuVGe0NNLcMRXHneieD1Pvnhv6eGxl4jBymULCkYrSk693DqePdjHgg
	EcdwAXo+RxRVoWo9ZsEz3rOTiVtA5kbD1DtW1BCHSH/E49W1NuCcKxWHlpKaIXnD
	mRMA0kEgWZsSgMtCdTWHuW1LTbOZaWJlRY7cMkc8RXvN8UruyKv+wWkZKvoWs1kw
	TuezOHjzPuIxF9hOlGHtSRARvjo/BF/oK4GrzYJ1roxiR+flDf6VuBN89OvgU1TP
	+XHirg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vcd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13980b6561dso7465759c88.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708683; x=1783313483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=;
        b=TeMox3DafRuu8g0nMGV1LuCo7V0XURRN+rhY2CLsPFquyX3zzTo8S5spn1MdsY9DTP
         YAINA9+1k6nWDferdqTeZxEm2bzPBF/XDlOBwIYD6RtFawlTaezMMcnimnfpyS/OXlkr
         Az6Od+7T4HHU8phq5SIag78HmNxto9LRQHHd+uhIKt30w//byFnpaXS06qfkCKj3ayby
         51V8ReudhkxkuDQkw6JOa2jqgqpKjTX62zXnKjBnEKIRV5Tdx9cryEY6Mi0Ucnctw9xd
         PxHsOCnjj8X6gWQYwdcExgn0sqiIjh/VbMCUiPcsLnd6fVzW9n9JLvhU0HFyEU7IeKLG
         8mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708683; x=1783313483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=;
        b=sIEskuQ6v58O+b7Hs9nr+ha0Bu/6eXoLaBhNi8GWU9lqjm8YHf0QZyQ3Ejw7sBDb6W
         +1M66ZBZibt3+xbntOy7H9qloz662vLjPx0wpS9E0Imqgz9IrLN+u7zvM23g1XedMEam
         8ctHQaLjxJ1x0bCmU9VsnJ4ndPSqa4GvgEDW46tItDjz8e7dZeqSOhZsdTirHQJqX246
         Fdddw8f0GeBbPcVhtsqfLpL4L3MAh1GZ6zA2BzZCxIvbb6oaU6CQgsCSzqyRp7FDFa/d
         8hu0ZyfWOGZIhbE1g1vUZ93jG0LO4CF0Z4M9gRv6nPnOAbXdNgYPZHlpWnmcz0GYj7/7
         wlDg==
X-Forwarded-Encrypted: i=1; AHgh+RryiCoUjiRZyjuwNTY7l23MmgAKAHualBEFJXFBFDFovCFq5SVACGa8iQcLdatAkLPszBE24GLKzud2ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmtZviDJeMbIkMpcf0jwo9ksrKj513TOrDrmFrpMx8GgnMVk/
	YvgLmH47ilQ8Ut0yrPHqpWvXkI3Uglwn6fAEXcbjbkJxILZIMdeGMnByHy7BXkINWMqtGTDzXlG
	TaeLLKboDVtTIZMkB6RTEF8uxfpHjtDiSlTM1APqV3XpSVtpxQCP2KjcWS0axJnazsQ==
X-Gm-Gg: AfdE7ckHj8b66LMhflI2hw2xW3bZEgsgbZf8X3jYTie0zlDdLt6i02g7Ngaki19Vg2a
	Fe+vl1nYrOAxKehdTudjS2ov86SGfje0GoKX3UdY5NsM+thiK7cntty0OtKGGwOUErdKIxSAq3y
	Jq4uQkbcoPkTYt7r+MZd7tm3W94velk+RTp+mkh3uMQIZnpaoBF73Z73Yej0bc2iyTqkHGLMX/F
	EEBDr7NHLZWWGeg7JAYg01z/m4/eegUvn3ENOFBoX4e+/xWDAL8qa2uw5sH+cVYPvR3RW6AjBnK
	Xsr4K1Xvd5/i8bmh3TT1CUk68X9Kx1Ft/PRGtV25TS08Olj4fsyoyxaj6su7cnAPg6LOi5CYA5C
	aW95qHVbYZenqnUzHZj2Ulbwfgd8k750UzbO7d4XRCgYM7SIzgA==
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr14897191eec.6.1782708683583;
        Sun, 28 Jun 2026 21:51:23 -0700 (PDT)
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr14897168eec.6.1782708683084;
        Sun, 28 Jun 2026 21:51:23 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm39793578eec.27.2026.06.28.21.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:51:22 -0700 (PDT)
Message-ID: <4228e2c6-e5d6-4173-a0ad-4fd82854dcfe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260609-pretty-coral-weasel-e951ef@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260609-pretty-coral-weasel-e951ef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX95jkklU5gao8
 jjXe+qlyiuaI0pT3djigAIhwaIkpQ3joYRbekyJOnPBBDzUxxKVJYib9djtuHL2v/O4neKm+AQa
 N6YmCv/COoRJkuNF+2kXBnphElQMgvNxQ+sC4T0dhQ0GeBM5Dzr7IgDQ3QfAZ0zDmVBFBYSOZPQ
 mQd/E5swSFAqzbX7BCiOK4BJBSHENalWn8HP0sfKcvikQISh42W0CYNv2u9ZfcRwkNKTo4+sNjC
 te7apvhZ03IqdP07DmFi/bI8FmgHgY3mUoeXHjNbr/11fvCRLsniU+KzJ+sizFnQhh/3p3XGREU
 Lfcs4i0C8m0qSvmLDIQXlo6oAjcDYErD9SIMRdWM8zjmjhC1hQa5MUTIOnloXL77q/dUPNfmHzF
 R+NrApPfEWKyr8V6bh4XDkn6HLAVYqjlu+RQkhY3woUr9eVFh+kn3th4xhxaz6M/wX6Xkz65oVk
 7GVuD3x44VnyfnUJqVA==
X-Proofpoint-GUID: 98RqyWCgCo2mCoC792wQ-zyJvJLZX13H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfXxCRSWgH8rELl
 Kw5eeR1xHOR2a5TSQ9du3PeMEoBgzIsKE4aNha/Ml0ouo0w04X9CuFLYC5+mnzbt1EnMYDNYWlg
 ge5mfYaWNXpxK69RF5MTEj9WGK2XV6E=
X-Proofpoint-ORIG-GUID: 98RqyWCgCo2mCoC792wQ-zyJvJLZX13H
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a41f9cc cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=r26TJLN4OFIrFanpHjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290038



On 6/9/2026 12:58 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:50:22PM +0530, Mohammad Rafi Shaik wrote:
>> @@ -3648,6 +3655,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_0:
>>   		controls = rx_macro_2_5_snd_controls;
>>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>>   		widgets = rx_macro_2_5_dapm_widgets;
>> @@ -3809,6 +3817,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   		return PTR_ERR(base);
>>   
>>   	rx->codec_version = lpass_macro_get_codec_version();
>> +	rx->bypass_fs_control = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);
> 
> Is this specific to Shikra or LPASS v4 codec version? Commit msg
> suggests latter, so detectable from version, no?
> 

Agree, this should not be Shikra-specific.

The behavior is tied to the LPASS codec version, so it’s better to 
configure it based on the detected version rather than flags.

I’ll update the implementation accordingly in the next revision.


Thanks & Regards,
Rafi.

>>   	struct reg_default *reg_defaults __free(kfree) = NULL;
>>   
>>   	switch (rx->codec_version) {
>> @@ -3831,6 +3840,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_0:
> 
> Best regards,
> Krzysztof
> 

