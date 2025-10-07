Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC9B39ACF
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832638; cv=none; b=dB4kPg/t7/2OfPuYO/spkAcZz4zBrky1hlNfLeLSzXmkeLr+SYs93STisXW3Ya492uoYEn+lw7eb29Ymke9RSO+4+0ZS7P6NsdGeV1WORWMDrGMaGcjfG2XPXwzntheTKwr9MUfSdjI/PKokxS1gqyU8174uREnSk2TB9bWDxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832638; c=relaxed/simple;
	bh=/Pulhqjo24SKTr9cc1ENnx7pLe+f8uR1MQfDkhduvfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+07TQr9//R0r4Pc2RQ2SNdAECulp72mZO+mlhUDQTS9LQ7Xrd95i6lOL194szhHr09KtGFdIlnL775KlUbynt9+o0Idp5GmIGjQK1q/2V/CI0TUgJgr3UTzohBbq2yDMDR0uv6g5I8u8ZAPdQBIw+unSNq+T3MDg7zhbn17DrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXLbaRZN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXLbaRZN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972DEto020414
	for <linux-sound@vger.kernel.org>; Tue, 7 Oct 2025 10:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkgVZee6Gf3vg+RIy3eezVROXir73E+qp+AS6AvinH0=; b=pXLbaRZN+k05dEFy
	daMWsqyxF2PdcPfdjRTE2l9yGbpOTc6lmKMnPGelsgUT5CDpjlKCHua9qEcJ8BvW
	Iquw4VlU45IOe088d7P/2DBp8KfzoDcbYUhQngK5EPIq8tubgrT4p1VMeb91dG5a
	PDJjIF1YDO1aKsPZ1iNY8Wdw4sRZ8VcGP8jp6ha0u4NCk6TtMOtTKeH59S3UcT8C
	iF8i+x3Gc9SYUUAxaPI1Gwvdx8cE3ZV/LpiEa4jn4Zzt4cx0DPKrUy8wiSL/0tFg
	plw9Z1Smn+PHWqSByQfIAkX07yYJ68A1aJY/SGgk63SBvCRjF6RljXMVczDgscX8
	QJKIAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu6wdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 10:23:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85a8ff42553so104315885a.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 03:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832634; x=1760437434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkgVZee6Gf3vg+RIy3eezVROXir73E+qp+AS6AvinH0=;
        b=PdRAjYBYFjQVlPm4qNeie8QGq0SjLjX//c9m+4XfB7oBvJjOcM3vZVAfmJTB+UmEbj
         Ca+RPEwyN3DakJzFE9z0/V6uJbAHMrC2lwLrNDy/NrwQc6QpGjYnxR6wyUfWLtehoAvW
         VEaqJ3IXwDnACBQb7zvQfcAU2WUgGYXrykjOocjvccwA7Hite2eGM9VRnGfqCiovmRVG
         TTwdn8c/hCDpeJoLKLpr6CCeVVpfBOwuBiS/TrHWQkaMiG0upuc1w6hzo4HB8OJC8dn5
         Curk/ph/JJ0PgaZzrCs8aXdwZWsSEb5/vyBCqrkiAeVzevN+7P9XssCcsf9v63g/SjYD
         iLEg==
X-Gm-Message-State: AOJu0YzaCutxutTnNG6BN9DOtK9xKPw672jH980WFp+cqJxE9zCtmTmB
	ga1DLHXthy+4+X61Zxxsn1xGbKVYrzTazYBddCumbi4W8QJ+Q/bMjZkVBqJM16GLvu60MBn3E2b
	++q9yqKqCEVoQDX94dTPJ2n5ZLL2HvrmB5I3zqxAc/wQGRw0Ymb57e+PM4wrZQctgRg==
X-Gm-Gg: ASbGncvIRMn5CiR68NYMZNuIPvYL6f53BYx+nbd17Pd96zP0vYGNyQoX2+bDT1pFsHp
	LBwgngUk0I/Syzqd46HaGuopb8Mk6Y7VLzyDjvhcA66bRxkvoS8D5KX0v+ytVZ+YAvubSXc6YEB
	OsM8wMxjK+72pCU3dySBODBPAPQMgbABtmRM1/DkE+0XT3gXpzO+0dNNspZoMordfO4dvXjlHzd
	37A0fYoa58aiR8OLNLr8kXLjQj8q/Y9Km50stiHhyc9Z+l2F7Fq0zHXZHR67P1KqE0jXLrmAPEq
	DVZ97yXmFvak1+HqfCnlm988jhXY7ulUG176rlc41ATAsve6bBUQ3SWVfdGaAXe2XPr3Zpf4ZeY
	t0zYTnsqWZetdH/zS21IlxRJ/LDk=
X-Received: by 2002:a05:620a:4628:b0:856:6bcd:4adc with SMTP id af79cd13be357-87a396be2b6mr1387375985a.9.1759832634420;
        Tue, 07 Oct 2025 03:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVSNzorydREG7b211hNLhPZOy+zMPqGTivdO+Qk5L9VY53/qkidtVBHb3GAFgnk0lVswCaAg==
X-Received: by 2002:a05:620a:4628:b0:856:6bcd:4adc with SMTP id af79cd13be357-87a396be2b6mr1387372185a.9.1759832633661;
        Tue, 07 Oct 2025 03:23:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4ffb161d92sm75814866b.21.2025.10.07.03.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:23:53 -0700 (PDT)
Message-ID: <f15ea346-43f7-49bc-bd5e-47510a48892d@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
 <6492e444-4196-4900-a741-a74a8c506a6d@kernel.org>
 <1eab5200-1292-4d39-bdf8-0c5084cfaab9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1eab5200-1292-4d39-bdf8-0c5084cfaab9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zfcqsBg_EqC-HApj8vEewGW9GHCI0W4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX83Ga9ebzMH1F
 UjbQ2C8vRz2wtjkcQU8yMpX/WxkumBIpXkiGECORgirZL7+DPTWVdFDkm4p2gUUzKo8eP9oMm7e
 4xAFmjstMoXtK84R8LaJ3l3x4nVRHZHw2g5E6LzlKDUHNlpJAXziJRoA+A3Qx7KqSo/pbTOeb9t
 +sc+nQo4QwCHmS5wfCS/zpF/C8kLD+18x/HwKb7yr3F9T3HhskK+fJzULEXFPZZdE6TlTnDbDc8
 99I7hQjwhqLJFjOFiBXXi3qQCJFwUOK+QKBQ7s559/oxXIiZUhhLI1uxHvu1VMio081QTyweMCQ
 o3xcwaYmYuo+FslbcY0hWl4GZ2py3BHQ3b+NnKdwO065wvvDsuDpx5MX8r3LSgdYMYXEtwuiF9G
 HsglWh+btfByNqc/+1yLwxdZAHYA3g==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4ea3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=GCCr0xkA3K9mKd9kojEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zfcqsBg_EqC-HApj8vEewGW9GHCI0W4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/7/25 9:02 AM, Neil Armstrong wrote:
> On 10/7/25 00:21, Srinivas Kandagatla wrote:
>>
>>
>> On 10/6/25 7:37 PM, Neil Armstrong wrote:
>>> Add support for getting the I2S clocks used for the MI2S
>>> interfaces, and enable/disable the clocks on the PCM
>>> startup and shutdown card callbacks.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---

[...]

>>> +static int sc8280xp_snd_startup(struct snd_pcm_substream *substream)
>>> +{
>>> +    unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +    struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>>> +    struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>> +    int index;
>>> +
>>> +    switch (cpu_dai->id) {
>>> +    case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>>> +    case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
>>> +        index = sc8280xp_snd_i2s_index(cpu_dai);
>>
>> What is the mclk and bitclk rate set here, we can not rely on the
>> default rate.
> 
> The default rates are set in DT:
> +        assigned-clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        assigned-clock-rates = <1536000>,
> +                       <24576000>;

Is there a way to infer these rates based on the DT audio
connection graph?

Konrad
