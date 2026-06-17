Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50C401A02
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702878; cv=none; b=r1vdZta7y1atgvm/GFHBPNhlf7f5Euil/oxiR4w7/C8Y3nHgKKG3Oq+6QveS5TkFSf9K4XBIqJL3o60JUIo/1n6RooIoj26pVgauNt1YK3P8l9q6kni3s1fl8zLgif0roQ9vn6yl9JooiHK9bdv6prvnlSWwqv8Pmkw8Sr+5BtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702878; c=relaxed/simple;
	bh=UNgDj/HhVd5CGFuFsZnB112MTAOb8FrY++RoOaK7DHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdJf9q7AdFAhv6/fhm6+/uaxEQJ7dHxGcPng/K2+R4ymE4XSBFnSzIT3jO6c/jLzCLaSDKdiPoWCmSnNhPdHF4iDyyJSaC3DaEmFcoV4O7TAtif5Scs65mJpPX/F/sm1/Q7lHeVJviMxdFPqG05QJHiVhbok6CcW1Z2UQ+rTa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Apd2xe4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9nQ4tAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Apd2xe4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9nQ4tAV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UsGa2025338
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=; b=Apd2xe4gqdncpXDL
	1t6SRb9eoh4XQC1uDRlDvHUVz6Z7QKHd2Nw7g7RCVimYpugCfH6I2+U7N1ZYin0r
	lWaljejPz+mXDApBVval0MzQaRMosfkBcbv8TnQv8dJlxd7fKIcT2f82cZhokkvL
	5qpHhiZ+kBxEezBpS5ymhzcksfY69Ml5rTKkfF9xR4DrraHAfSD3BKoKjwViF7iT
	pJZv22rXH2qAocdtJLABC1KtufS0IrIHJsE4xnRF4+v99ZNR0N6dU36hUiAj7yzy
	FTQOUhH0CGjQoif/X5xV9IuZVYNG9KY5rQF9mbv5DqtVNVA+yx+e1N2tVD6aofFj
	ppD2Xw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees3a50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:27:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422b1354edso7027820b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702876; x=1782307676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=;
        b=X9nQ4tAVFH69kpzI4lv9ZB1leUZadRoG9vo8GDSHRNEywTrHMR0Ck+cGgr4CXwLKub
         Csk67OH9vNHyTLkdXFPhZzgFwsJjnUbXGkB8eMmynH/OCes8SRCfZ6HoNms7n7e1FUot
         2DwG/nQ1+Vw77d2UYc+SHemvoa78sYxWgOHmnvO5dBMSSYdGDZC3nH6kyOBxg0mKgq3Y
         IEh9qVaiw4BE7hqXTYaIe+DWgvOwVnTJbMBq/7zaQ1wAgTNKNLY+SbqUyR2NDkOqEUjF
         H3UTRI2AYADvcGK5jDRuZYaM/GIYiJdzD8vKk070J1gMmXlymCECcsfv6suP0hJDIXM1
         70Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702876; x=1782307676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=;
        b=b0rzC8ATu5W/wjKHUSJeOijgX2ZcD7bDAoKTmASFzAZwOML6ASUC2sP502hRNM8Le+
         bP+0oRRf4BQCIo8k74BktUSiqJCAo90u9y4XVXBeMLg2bjikVpuU6ZQ/LzdvCqxhBhh9
         zXMmJLKvZi4axtLaPD6PeQ+DO1ttNuquQ3gjhtkFrlp+oZlj0ArlQFCPD4AGHo9tbXEW
         guOmtdOaG1JojWvEsGReofNsBR/UpWeqFdz/rJNfT2g9OcJxKHoWuKvO9ipnTl1Mn/uw
         YfJhWgu1LGDJOwLZWEmj646vB1SfAYgXqRfcPHmLXD6QcnrlwrpQl/wHvFU1QVHByyKy
         76bw==
X-Forwarded-Encrypted: i=1; AFNElJ/8LAjCG5y3FWWIZSWJyNTHtLPYMcX6i/4e7YE6VSQOlDKTjumX1qgo3H3FB9d6qtOR6d4Nc3hN2dDN8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwES/OWM76+MckNALaglEY/wAiRznPjmgzxm76C+gJKNK1C9QoH
	+iiiEnsful1iedN9UMq87pD1PGJiNkLgxW51Z8I7Zmp9hXYOZ64mkVX0c1AmgHSHIa8OeTgspa8
	lN0Gg8dTtRzY7aJhD8rH+2Yrrh39Y+vX9s2ur7j89bBLxhwupiYtCtz+EOM+k3VAQAJM4EYyFbw
	==
X-Gm-Gg: AfdE7cmhWhzCtlEzj5cKSSp8vMAgJUDaUbgKrmhpZCodmEx8rPfSxaSu1zogl4DaQhp
	zg5VSIO3iwxrox88pam8F5PnUA1u1N/XAfVhZO0fMv4qLXDTzgnGLRiVJAVV61YvAanDQZHd1P0
	f/DgBJt2kW/Kjq+6+QIZF6HNBUVQfeggsjjwYSGoB0EdaXp9eUUd0Up+dwigZf/C2p/klRf9+qj
	/mXB/UKwDQrdaRUa6hwsPn6mNofl0RxPge2v1r7hpNom41HbFy5l1v42k0V2t7pTsPp9Jld2SZv
	xh1km1Vu84Nqhf5PXWai4A1PGm3Kz0qhthZzH1vr0h3PCALrkTyDXV6rmkf1MGd4NQvDTFv4aad
	qHsmxGJwAKyIdHyOfBfMfHCwL7LAYtJlAI44SxcxAa6RzdDHKkgWdOXsRiD+pWpsRF1Nv3Rd2Zu
	CHpFs=
X-Received: by 2002:a05:6a00:1f10:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84524443d7dmr4092461b3a.13.1781702875562;
        Wed, 17 Jun 2026 06:27:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f10:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84524443d7dmr4092434b3a.13.1781702875119;
        Wed, 17 Jun 2026 06:27:55 -0700 (PDT)
Received: from [192.168.1.112] (ptr-48-167.coastalbroadband.in. [163.223.48.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd17f5sm14768044b3a.39.2026.06.17.06.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:27:54 -0700 (PDT)
Message-ID: <8aa63705-08e9-444d-a262-ae255d5010b4@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:57:48 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610154517.134570-4-prasad.kumpatla@oss.qualcomm.com>
 <6238983c-6b10-4639-b6ed-d1d25b00e748@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <6238983c-6b10-4639-b6ed-d1d25b00e748@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F7fLl-McdA-7HeBNz7zUJDq54qYW68u7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfXxIyh0d8sUgpW
 rU/gf+q8WJKSxhw2WafkPdsjr+ScNM3+xE9qrBa3/WrAG9M5pxG9Q/ZdxGXJQLDI/xRUawYUrKo
 yCksFIAMClv+iKS9XIVGxKIx5f2HzQNumcTXXqXHrWQVzR5U9UlElwxHjwSVdSrx+ESkjUkB94r
 aVWDXC+A8oJ5mFyX3xZUZCauVXilmHbpPvVZlnqS4NmKId46bOhKfmyRW5pXBqbE5wxSh8zQ6DW
 GxyiZzXosCnqy2ofq1fbufgDRHk7nsfzpQWxOICzDKvRWNqsXuWUMNLBapKmsPcwjjScaiNaZSE
 PMm97sB1Dfe39nWQi/ehTx1byS9ySex6gFzkLSSNycSZtLyFq4edLi4ViYtf3KNIOfyRic982mx
 tgQgEHEVt56mjgmnoxy3KYxRcJSLSd5PUSWjWLnUGLFl7Ewd7VO9YKYbGSyvBO1BhrGyoy8mTMK
 buOzLpegYkuqXA5psFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX54KAzvjsd7CJ
 zGlUJjgqdCQO5lFhEtYoPRqAgTa6iQkgpZI37ergno3MmPrPoT3LKBunhRHpnqruDbCep6xgsnZ
 OYy5Tu79DaTJvr0ysnVVmIBe/nw8ji0=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a32a0dc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=D3hM7nRbATf/MWm6WF+yZA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P-nLkKpV7BsKi0cTG20A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: F7fLl-McdA-7HeBNz7zUJDq54qYW68u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170128


On 6/11/2026 2:29 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 17:45, Prasad Kumpatla wrote:
>> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
>>
>> Platforms using Audio IF module backends request the interface bit
>> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
>> header so these clocks can be referenced from device trees.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   .../sound/qcom,q6dsp-lpass-ports.h            | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..bc860fcbf 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -233,6 +233,63 @@
>>   /* Clock ID for RX CORE MCLK2 2X  MCLK */
>>   #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>   
>> +/** Clock ID of the Audio Intf 0 internal bit clock (IBIT). */
>> +#define LPASS_CLK_ID_AUD_INTF0_IBIT 71
> Missing indent

Hi Krzysztof,

Thanks for reviewing and comments.

Ack, will update

>
>> +/** Clock ID of the Audio Intf 0 external bit clock (EBIT). */
> This is not kerneldoc. Please do not introduce your own style.
Sure will remove and add proper comments if required.
>
>> +#define LPASS_CLK_ID_AUD_INTF0_EBIT 72
> Why everything has "AUD" middle prefix? What is Audio IF and how does it
> differ from Audio on this device? IOW, Why Audio has to be specified? Is
> there non-Audio block?
Agree, As this is already audio, it may not required to use again AUD in 
the macro to represent. Will update.
>
>> +/** Clock ID of the Audio Intf 1 internal bit clock (IBIT). */
> All these comments are pointless - you repeat the define name. Explain
> once what is ibit, ebit etc, not every time.

Sure, we add comments if required.

Thanks,

Prasad

>
> Best regards,
> Krzysztof
