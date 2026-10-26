Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999490;
	b=0hNZ9RPEjS92UzUTAwBx1txjiS3GcHPKPaWqh47Wk4QkGJ4eQ42I66lSTMEdFjo137nt
	 1Q8qVXhkP2hZaQNFFy0aR/rYDk7Mq8Zgc8ZKPCeXsUq0ifVsqn+WcA7GtDaM9Nn+z3yW6
	 h2uPV+PnRb8TjdneTPExzhKiMZ8K8Cj5HxIJY3gEkWnXJHPGkrdtNmoWchkmnbzh5dFDY
	 frfx8nO1sJqZ/UYFamsypQWAiJE3dFat51X69dIGXsbTZe0ryJK3+oNE30nr8K+8ccZ+t
	 4vel9hbUM+yWz5AEZVrOVK5wKnm8J/DPxrj0IIlLxw3gWIU0HX4t58siWTD4liF1YYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
	b=gAEvOPqT9fN/9mp23LxpgOSv/wFa2B21rCYjqi+z2BdbFffl9qvsShkLhyjk5uHwPsJY
	 G3td7SYUXLklUeOlPcA9iHQy7xtL/JrouQ7pgy0QtZ3RqvkNM8RzMtx1mLpE6l5FcxyHJ
	 YCiCcsPbhkfGShm7C/rkE6N1s1hENiLVz054IsB2xUIHgy27sMZCHDjKl7QwWgcXP55ph
	 u+oCXlbchIFbPSeEVCIx7ZChlQ9kro8Odo0YQplfzhRLki9pK/GuRNQRt9YEcqHVgfyQC
	 O+GldgZfetj145UPc8UmWv9Fz9gsH4z66ZsK2tZK0ev2SXmQRLh28A2My5Jyxtl52Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyt7s3cl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA360606A323
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA360606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bxh0UO8g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyt7s3cl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aqTO1181738
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 07:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=; b=Bxh0UO8gpAPiz5D5
	E3S9mOqwI0wTzEfGTe4C7thJEq/v0j0LvzQoxntZrkv0a1xWzZh0WIFGhxUoqp5b
	qQgKnhgQXT+zjrmOYAdAwalHzLHt+FpeJt25pt2sX3cMwXfumma+HWOlqTYk+ITB
	zfGJsWkXBbhSTur0ONGZW5nSxaZcCm7g0laj9se2wuzmxsroP7ye+tp4GnlPDXbG
	PkIdTUT19X4xb4Nps8VB+8xBybbCd0QjTBms8BAxftqFxuMAj+OdYvru1iqlJnVL
	vVJxGkkIG04n3Xn1zjbsebm19izIdAUyrTG/lAF8Mh+5n/YCrSFmlW6au/R9lu2e
	ngYnkA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27w8y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 07:24:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso40453c88.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792999487; x=1793604287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=Uyt7s3clcyOJanwgjk6K7xfZ7MN0F45sfiWW2AS3MWXjvrzmCvg0RTBCe8ixNDYRam
         7o7THnY9AcvJqfjXtDRLUBOaM0HLmL10plz2s9zNnv3FYtXx3osNwzEdVZPaMeM2B6O8
         L5pJoELuwkztAlM6BeONvKbi4IinMtOvnA/swvYfbU/yDgezSYybp5a5fjbHq2RKHICr
         d9DHCRWH9QtLwR/pkT0041YQtS2tNcxXNxU5YvbGJObiKzkJFEpDDG6yvW/GrPrcZWIs
         czHC4X3QvQXn5oxg6J14RQ/1YMnBrB4/0s56+mdVpX635LfyrdOEGDsMaUS/Cek96VO+
         KEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999487; x=1793604287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q9hZOGPGHQItfvB0KvMGoubShfJzS8NO1cPSm+V9WQ=;
        b=hzOD3QRSoPu4hVuzrpnEqsH/RNif0mt/Rrn30ls+qSeXRlmnKM61Tvr9o+oSRCNRFA
         dC5OQ6d1kntL80qH1dnL8RQdomnpVDhDESsXAm+dzatstT/H1V7HkcCfbPEersRzVKmc
         mC0dcVwR7CqGt4cmQQZrRMXzkqboc+ch70SN72WCM8oqbX5Vr8U6V6kpKRMXHAWXZO98
         Cbuw9UAzEseshEH5TFDjnSzQwjdNV5xeFW8CvohOUCamLxLiAjgcHFtCEc0azWopTSi2
         ZFVvnaNlkahprW7F39C8J823ISu+JclL9aAlssFBk94ROt9PWk+mk58KvaBVMPax9/OQ
         Dv+g==
X-Gm-Message-State: AFq9FYI2k3rKITDXQ/vZAapp9xGxcFUPvUxeSxiFkGd2jKopfS+d458a
	gqzRTUp6uuVVkhpSLkZ2vHOy5p9Lg0t7gPc9KBDx04GxXSYeFfqORm8if6aZOVX2V5oseg/jYFM
	iepp2uoWhYr1cfRFPmJbpv/rOE6Pu9alnWvLSbwzbDMJIaX3gy8MTDvI2kzaF5Qt27w==
X-Gm-Gg: AYBFou0QX42wlnQRjwX/O+KxUGclu7pLCJks2l6lAVfqRaAP0dgKd31PNJAMe5Z3Lw4
	YrqBKdqqd4IKAgHnuYMvVDQxQM+ZfLWDyikZyBO7318vDnGOUVxgY1RtRN5DxrXHXHszXkyojwT
	N9QTh27vEfGuyh9qeM9UZLUxzwiR1i+2Gcw6W+CCRM4/tqdOpBIa86w4Ufo5SUu6rm0xSl7Mhld
	bfNbnQgBn3Yv2vsTDX8fCCQhdagPe6YM+o/raHvG2SdOCsfvhmwNNAREs08GtZkgcOzVVv6W8gv
	YPkFVcrrD3FJbj2kS2AoQM8gebFQNhfO4KzEs3p1tfQfkhkFRph2n4bm55PtBnECbwwpyw00ZQ3
	lhouVQuu+9YZcdGOB/+yl9Q==
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9361020c88.14.1792999486607;
        Mon, 26 Oct 2026 00:24:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2501:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-19933f05474mr9360973c88.14.1792999485793;
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm13556700eec.21.2026.10.26.00.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:24:45 -0700 (PDT)
Message-ID: <f2467cdb-e4b9-47a9-bf64-51eac8732b28@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:54:39 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
 <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf003f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Y5lwcFhJtQqtPFhOBPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: UYlAzixiFNgfTp1CxZIJirvZrcVIEe8u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfX7wmmeMlTDgm7
 UzEYiS3Bki7DLrDGH7R4bM6X4DAjchX9hejqi1pLZ6wjJ5V+/RJMyTuudHjYZSLZyES6vtcPS8h
 a8zdJdOxv2RZTXzbfCsqwBuTp4SPDsM=
X-Proofpoint-GUID: UYlAzixiFNgfTp1CxZIJirvZrcVIEe8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOSBTYWx0ZWRfXzh8wWypWjiP3
 AafltY0X9vF5HsaHfPiT3dJk2vl0ppJ2XW3Dek7vwWIew4soDhtwxyBrSu3oK450TueoSK/nW5s
 ankL1Sv1SHIBsC/dZ2umlmDOpldEdLviXzgHgmz+xBeQXiNtHuCGxsQ5Jn4xVj+pa3aTR84vIQJ
 nDtSohsK+BO9aqsGRSCe8b2xDZP5Iii1fg6qCeVqUXpZfGi4opqfrUjVwLG/iV14p77SK8huCpP
 +P5+7/fg3RIkdkrYsSOvlMQ8PiADUfJhcSOYoR8JE1KC5IeHKtg8katgxst5ei9ZDxlxogOOqsy
 rxTVQXgi2TsRBGX0w6WbcI8Goa/EiCfx79w3HMPkPlQsASy5u4pi+wqKSps2Wo+eG5SPdTQ6Vrj
 I5KI3PTLHniIIyR+1n16TJexpzECzuqsY9ht+sSJkYnSXEIoAnPby7hKE8UziG5YTMCi+kE4p7/
 /1+QfSimKDDl4avy+ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260029



On 10/22/2026 9:37 PM, Ajay Kumar Nandam wrote:
>> +static const struct qcom_snd_soc_common 
>> shikra_iqs_lt9611uxd_priv_data = {
>> +    .driver_name = "shikra",
>> +    .dapm_widgets = sc8280xp_dapm_widgets,
>> +    .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>> +    .codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
>> +             SND_SOC_DAIFMT_NB_NF |
>> +             SND_SOC_DAIFMT_I2S,
>> +};
> 
> Since the codec is configured as mi2s_bclk_enable, shouldn't we also 
> set .mi2s_bclk_enable = true here?
> 
not necessary in our case, use case is working fine.

for example in case of qcs8275 using max98091 mi2s_bclk_enable is set
but mi2s_bclk_enable is not set to true.

>> +
>>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>>       .driver_name = "sm8450",
>>       .dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -608,6 +617,8 @@ static const struct of_device_id 
>> snd_sc8280xp_dt_match[] = {
>>       { .compatible = "qcom,qcs9100-sndcard", .data = 
>> &qcs9100_priv_data },
>>       { .compatible = "qcom,sc8280xp-sndcard", .data = 
>> &sc8280xp_priv_data },
>>       { .compatible = "qcom,shikra-iqs-sndcard", .data = 
>> &shikra_iqs_priv_data },
>> +    { .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
>> +      .data = &shikra_iqs_lt9611uxd_priv_data },
>>       { .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> 
> Nit: please keep the compatible list sorted alphabetically.

sure thanks will update in V2

thanks and regards,
Karthik S

