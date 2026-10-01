Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F723490BE8
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858691; cv=none; b=Z0pRmYMnMQYQxHGPQom7akBAiZ+C+6hd36ALkIHpyGjUE+RDSgiIXuF61Kzuc4BFEe2aKzeEZzeaSHBc21uSgffkJkP9KttOIH9AuTc8CJnsI9Dc+vy35SOTpbEbDtgyfkE0+iAEKrz9PrcMSgWyuvOhPQ5gbrlynZKRvb9ZDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858691; c=relaxed/simple;
	bh=BTtd272bU17jdABMUVjppAK5baR+BMfWUD/+b95sdFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7QLVPszDDKzQP+bYoD57loEzjXEv5sjKdqEyr7YvaJYn64+zbgwabZob/p8h/GkT9BUnZTt+DRyn+3BkQGOlTXVcAlDZxeSPzv4x3ZliKh9saF/1HiiKmEjx70XOlm9nZ7X82k3B6Y2yQenY2KNr4gxkQysCLRPEQZeWBVGyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKHiBqo+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mmpa+sht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKHiBqo+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mmpa+sht"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691COiWH1289124
	for <linux-sound@vger.kernel.org>; Thu, 1 Oct 2026 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlitKy/nrCvAze1hM+Q/FIajbaUAfbBwxqbmkKAKWNM=; b=CKHiBqo+E42rOQ/m
	/VM5GEDEeJ/paIrpQQM/G85RB5CfV9mDCG9lKmef4gseR8XD56PB9fszQnngHkEM
	evYlLXNulycUSOkJNDht/5MLF7v/4fkMEibe2i5pWvp8NvSz2bvM0245fknJaKeF
	FEayiVKTT78pEB6i38DNtzqtTTllcSfBktfLsnwxGk8UgH8d1vTSoYJfG5AQhgXQ
	o/xK1K0zFE81N9EHh/K0pHFZPrJHd76NzfxE7ErKoKAYuJhQ+Vojp5V7vgyDgAV2
	oXTHGyLL726H7+Ifr9W7vVed8myA0ZiUnoJmRg780rYuANoeQy577QvHaMRrinB6
	S+DJpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjbyth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 12:44:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so6372078a91.1
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858687; x=1791463487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlitKy/nrCvAze1hM+Q/FIajbaUAfbBwxqbmkKAKWNM=;
        b=Mmpa+shtoNRzgPvzPAtR3tBbjjrL+/AxZ1C5H1HQ77RpkGK2Ti7bHY20YO4Gu/ZpOj
         FBNDPhcjmEGt7jbtcPayR1ek6VMHVagzMgBqslN+JZCMoeJxNZi0awiYTsvYrgYejLlw
         jshsL+0idLwq3MP8nl07wlkn6voL4tJ5yIkShjWpAXTkYx976YRdsFPsI8ExBvmWbOjr
         rbd5cW0LFhoQK92o6kwy6wFk6tVlCEE7e9UwOOogXgBcEB2Rskq/LxapMSKGLVBmECCX
         4CAZ1EQywavvAYfA45N59yprzKS0TDxdcjBx7tv6WwAWxZE5Wx+FEUC93SdEHhNs0kZv
         QTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858687; x=1791463487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GlitKy/nrCvAze1hM+Q/FIajbaUAfbBwxqbmkKAKWNM=;
        b=V4Evyo0zUPSm5tUOuQyNWdxq5BY3nriO765pfXxjZjuIOavwMt5vACyfMwdU6VSBP3
         F+aEDOHkcPThJkpI3Sj/vC5CUrNdWKHw1IzR9pPPOyG71Yk5Ohxw93kbrBAzmUyGgUyu
         qoHm/uQpvR5txPzbxQWUaYqFkLiOTM8NOu1o78aotPPrehGyVftI9KiDDyLSBzh7R8Fa
         vJYsq4I7+0hbDNf5mRcHTgVQ/hg3srwfn9B/TEtYo09lD5Q0bItLh7Um34V+WhVTH4Oo
         mWhgKZ4fMSAadix14piomRXodrcUMfjJhJsXsO6A+PivkENa8XZK91pLRX6jXhHiy0LA
         xb6w==
X-Gm-Message-State: AFq9FYK8Dd/9IsG5xlKRlICw+sRdVEDp/Jn5UroPGlPYNXte7b0HjXw1
	GIyyOQ2z9TA1vwVwCeeXKpHHYpfKyGzaH1BUNeWeGdirqMnZxZzH5s0aPBK4yx/mYV/58x7LYrc
	DUWn0nbB5TZMkDl8zoS/quyqJtwEmUpvC90ZzUOCJLbse6PIvBzuvut4KI7zzXfh3NA==
X-Gm-Gg: AYBFou0momVKRf7jKxcFHJ5qdkxsXnaiX1Pcs5rvW4vYEcsjpeqdj1U/xBm2dgE2cbd
	x2WfqIxQg5CFHGJgUlJjdviZtYnmEpg7YWIOpCEt4mqQzT/FYkeSuSLR7z4O/qC6NsdRL1NmoXi
	UdSBtPHm3UYQKFs5g33YdoHFetDI2S3s16kHiLTN5PnKWIzikZj5oUpGErs+taTdMBkyvU4GtYu
	7Pc1hyCKGWOZ4mrHbO6nL021TbhrT9pHZlpqUabZSyBj/JerRCEBUcZwvsRPI/zgVbEtDDJ98P4
	3aqxwOMCdkaLn0YZhDbDMJNR1ICZsJ3NphjUD4A/V/nzQHQV38Q2RdslAvQTXXEKbiYE3OKJTTZ
	JXNADsf6Lcpt6J7z8CmWp8dML5SDyzlgY
X-Received: by 2002:a17:90b:4b0e:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a4d1505448mr4083700a91.11.1790858686809;
        Thu, 01 Oct 2026 05:44:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a4d1505448mr4083680a91.11.1790858686237;
        Thu, 01 Oct 2026 05:44:46 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a50f01421asm2055122a91.3.2026.10.01.05.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:44:45 -0700 (PDT)
Message-ID: <2bf53c39-dc58-422d-b472-a7c95f445076@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:14:40 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-8-6c6cb6444caf@oss.qualcomm.com>
 <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <6f2afa91-6355-45f8-b6be-6b556c679813@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe55bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=dVCGMdOWq-ePsS7X_OMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EqDMgFaz8pX7_BjDzWjMW3dJFVSbUVMK
X-Proofpoint-ORIG-GUID: EqDMgFaz8pX7_BjDzWjMW3dJFVSbUVMK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3qGrimI7cLx9
 GvB4NBNT/C+jvAuuGvLD668uCyaFqgDMBXMZrRMnvUFXMCw3fhuFfajt2prwWB+0bnkbfooDRok
 oyHG+2gU4D249c4GrIZUZ/wifTuGs60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXyTiqiFr5GSIX
 m8y492U2M/68KVuyavcGSN5BckHPi0NAlqiEnZ1Mz3eSmzoM8EcbEaRGloOQnkq9oes5SBSA4Tp
 ZH7yBttWHwZv3N8nqLQs8pR96tyPLYXat/hqf/0FGVwzMJP7c1rRLpwyTQ2tUOXIs7YVjKG7175
 3mPNPm6aooTzCKCJ3y6p+BrvhEaMNs+FDE7JAMnvpw6YK0USaPNPXTpvtG0Bb3T/g9EqwS/W7my
 ZAErVOgxKIQvS8WP9P1BxGXKD+pi7rwpu6QBnUSC1oQw4oZS4sRAvsfw++qnJw73KoDgiFVnFwF
 y9vSKW2UNy1Riwc8m65QlncAByKOXMCBRFLREdSYkUzw7RcfJMgkqbFh7sp+ZTac+JgViaMZs2L
 XsyRGHcAau8ZtRWkNWTPFBSvLrNQm6nk/Iv3HYCQw1GEY+5IxYLIKeif/2OXyAJ5TypSblh2pqT
 69bQJLy2x1dZ8u9aVlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050


On 9/25/2026 4:32 PM, Ajay Kumar Nandam wrote:
>
>>           rx->rxn_reg_stride = 0xc0;
>>           rx->rxn_reg_stride2 = 0x0;
>> @@ -3959,6 +3962,8 @@ static const struct of_device_id 
>> rx_macro_dt_match[] = {
>>           .data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>       }, {
>>           .compatible = "qcom,sm8550-lpass-rx-macro",
>> +    }, {
>> +        .compatible = "qcom,hawi-lpass-rx-macro",
>>       }, {
>
> Patch 6 documents qcom,hawi-lpass-rx-macro with `clock-names` 
> containing `lpr` instead of `macro`:
>
>     clock-names = "mclk", "lpr", "dcodec", "fsgen"
>
> https://lore.kernel.org/all/20260922095522.193FC1F00893@smtp.kernel.org/
>
> However, this patch only adds the compatible string and reuses the 
> existing RX probe path, which still requests the clock as `macro`:
>
>     rx->macro = devm_clk_get_optional(dev, "macro");
>
> I do not see any Hawi-specific handling which requests or enables `lpr`.
> Should the driver be updated to request `lpr` for the Hawi compatible, 
> or should the binding continue to use `macro` if this is the same 
> clock from the driver's point of view?

Hi Ajay, Thanks for the review.

The Hawi LPR vote is already handled by the PM clock framework. 
of_pm_clk_add_clks() adds every clock from the DT clocks property by index,
and pm_clk_resume()/pm_clk_suspend() vote and unvote all of them. 
Therefore the LPASS_HW_LPR_VOTE entry does not require a separate
devm_clk_get_optional("lpr"); that call alone would not enable the clock 
anyway.

Thanks,
Prasad
>
>>           .compatible = "qcom,sc8280xp-lpass-rx-macro",
>>           .data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> diff --git a/sound/soc/codecs/lpass-va-macro.c 
>> b/sound/soc/codecs/lpass-va-macro.c
>> index 79abbdd158b7..46ae627ca594 100644
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -1896,6 +1896,9 @@ static int 
>> va_macro_set_lpass_codec_version(struct va_macro *va)
>>           }
>>       } else if (maj == 4) {
>>           switch (min) {
>> +        case 0:
>> +            version = LPASS_CODEC_VERSION_4_0;
>> +            break;
>>           case 1:
>>               version = LPASS_CODEC_VERSION_4_1;
>>               break;
>> @@ -2166,6 +2169,7 @@ static const struct of_device_id 
>> va_macro_dt_match[] = {
>>       { .compatible = "qcom,sm8250-lpass-va-macro", .data = 
>> &sm8250_va_data },
>>       { .compatible = "qcom,sm8450-lpass-va-macro", .data = 
>> &sm8450_va_data },
>>       { .compatible = "qcom,sm8550-lpass-va-macro", .data = 
>> &sm8550_va_data },
>> +    { .compatible = "qcom,hawi-lpass-va-macro", .data = 
>> &sm8550_va_data },
>>       { .compatible = "qcom,sc8280xp-lpass-va-macro", .data = 
>> &sm8450_va_data },
>>       { .compatible = "qcom,shikra-lpass-va-macro", .data = 
>> &shikra_va_data },
>>       {}
>>
>
