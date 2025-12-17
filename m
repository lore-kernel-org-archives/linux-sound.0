Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484B33B97E
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976168; cv=none; b=ptXlQcmbD01+htAvdAac8rskF0xmkR1ooYWEA8U5/S4rKGKYia99A7yrGNdn9TUF20Ii6faKTu0vkXDrce5Tdxen5iMMXgRuMYhw3vMAjZVYynKGYJJVRSQ3a3ukHUcwEWlEC727P2AfNqRfUqsg43MZzthdJrT4Hog4hEaQrJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976168; c=relaxed/simple;
	bh=FxLM0KclIpi3ogEq/ocYeS8TWQmxPiqLN+3j26Yf23k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CenOwciO6bti/tSEPsL/regJLACtTWqhsK0fZNBfZPFEZ3p3i92gNsi8Aj9Q5oGEF3YitTL+J3itvwnV7cR8T8SrVV4H9QfMPQdDWon9sjP+2biy0gZwYnRoZr5FmKo6A5Kox4eN0EdFdJLWOcHgXt1WRBApKzqbZIrCayAeSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKVjtI5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vjdv73ca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKVjtI5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vjdv73ca"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL1Sr2684260
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 12:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOPiNKiqFA0h11hftXo+Ki9WeMXiJkxt+xJYpeMO3iQ=; b=DKVjtI5okDRDUXPV
	JCqfmrCgI082GURlpjtedhuDxtRzwb5LEAbleYuoS2QCmyQ7wAyc3071zWqjG722
	2PyFpv2dk6Sr+jZtpc/cf2jJwjCFYn4gd57Nw0iQNaXU/sKreCwzRxdvVKeErV7y
	hODjKmhYvaIAYCka05knlnX+2e5gsRiNhVO3PDvz/+7etN4LvHgd7DaowVHjNdqI
	ceFnRPVAQ+e6QWgvG3n2fCIgyfObBdiquKNMj6fJOk1cDeMcHhvvno4ZqGbgBFA2
	dwend92NOd0zrXzpHFIk+E0Z9uYXSHA1lEySpSEORmMH/KGFGP6WkyR+SAu5rcpW
	JICRtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkesug7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 12:56:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d7ac8339so173776381cf.2
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 04:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976165; x=1766580965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOPiNKiqFA0h11hftXo+Ki9WeMXiJkxt+xJYpeMO3iQ=;
        b=Vjdv73caS3dl1j2TFKvbYrXYaWoHmcCf0UojJy5jr/fvLSxIRRM2BTCgjWOgdhC36X
         iN7Gb97PHymnlOGiPhfUT5wV8vfEyuzeFWtoQWEHQMiEQ9CGs1XxSwQph/8/e8S/rWbj
         1HxHGajRx1yimRB9H66DsF59cnhbC3iDX1R1cLwP4tHy+TsokKXihY9iEWivQyM7XY9G
         qVkZtillxIg/1J306kW8rXCEAUn+ILSxOzkrZvpOfJfmefrScCxdriWDS98it34Y1Xzv
         ZHBUHvMok23oGC6e2bDSFMgOEjqJQrRjJwL0xfLdzpPKXqR78xXiRj5iotrZ8OvRLGxk
         8zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976165; x=1766580965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOPiNKiqFA0h11hftXo+Ki9WeMXiJkxt+xJYpeMO3iQ=;
        b=M/5MSwJ0MLKc57kPleIlwxw5PyS264X8a9XVROhKaSs1qfbxnounrwxQq8W6RXb16+
         YQdavsmpDyzWk5hzuBl6NTpnQHiEMZ1BZVVTgkaDx1L74jBp9Us09vH+oXuQm0sqMzuK
         igAwE8IzPFi7A7D36EtRsFho9rt89ArhW6Q+2Aedm4lHeV3xgr1y8o7e5IECmqhycYo8
         r8nujBNOgKrXpk1R1yV8/GfFPtZRduJTh3qAUJeiR/ZtlZyxX4WJBb+t59pgbN2nSqMo
         +AQsE7B5ccfsJ4yJlxkOjYkt74mNCb7PD3sqbiP9I7zfURIgAM4T4f/Hxq1efQ7DVZ2g
         aj7A==
X-Gm-Message-State: AOJu0YxbUCIP6b7oepXJ6HGg0Kz7AHHsneszdk6e5qk9K311g3e4gQVo
	Kqzj11OhSLgTc5T3Ufbv27XWWZFtUSwfegzoL5FKWpxrJvlTofe2rJN9cDQOraRfNgBiChrrxdl
	dltXBw1WkMJPWiyOQ4DPa718CldQtgOlzH9zyPvxL3Xs4gVVpOwc8rn1bIyfz/ZFM1w==
X-Gm-Gg: AY/fxX4GlMSKsiJdeCJEfGL48POHJhlB+N2VQ5U3LqP8G3CAex++bg0nU8G6M7qEk/J
	CyaL0KLeUwUhC0VIhzZ0Fg6xUX0q5e0G1zAENdO9yWgxOxMa7slJgCUFhI15gfrcCUYqgNHJxo3
	329mKKtbEPZ6QlrXf4Rfk+9AgWoNTdIfm3yGyPCd6PwX20lzMH2F1q8kEitZO+EgKkfivaYjs4N
	Hl6Iof8rq756zKV7JW7LNFKlrREQJuURrWmwn7J4pD7ELAcG0rLVTrIshjvBADPKHDVfdhXlFf/
	x8zP0wlIMu2y8p827kyycje8uPPgrj1oquFEVWSD8LX3IrFzh9Uw+ncm3VwvG2tB4PrJRj2uh68
	UpwGGZpHjP4NV0AT3HGcsFOIsgkYYAAkAu5Wq
X-Received: by 2002:a05:622a:2286:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f1d04770a6mr262595151cf.4.1765976164863;
        Wed, 17 Dec 2025 04:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMUuNr17Mfyov5u2N+6wQXww6mFEqvNtFZsN6hnrLUNMAp9We7iRc0kZfQeruCjmGbm5NMTg==
X-Received: by 2002:a05:622a:2286:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f1d04770a6mr262594811cf.4.1765976164463;
        Wed, 17 Dec 2025 04:56:04 -0800 (PST)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4310ade8063sm4664963f8f.23.2025.12.17.04.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:56:03 -0800 (PST)
Message-ID: <d9e64bd0-7ccf-490c-a6be-d9cc9484475d@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:56:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
 <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
 <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMCBTYWx0ZWRfX8wOjzP6Bt3FJ
 IfSMyqdElaf/QzeId92/DP7p2SlAMDvhSRKmtPaTYMHvXD9AgOKCLQsvTPhSCrhzBzzvTta6qZD
 Z1z59/MUEZoVgYiDcB+vXfwInUcukGDsRkV5Lj/j4vH3NG9Liv4B+30zwGqCjz5NtS4jbh6ppX2
 I9jVH9tzY2HwDPIrn4SP4eZtWQWL9yTRZWbRFqtyioAuAyYwLznTZ47Y+Ej2+W7W/JCaIxir+6j
 CDn3n4ZSRwnuBXcUlzN3ohC2KeuzwmkJ9OPEcxwWv4FAhtwM0XRh+6pRTAoWdRbLNGNNyO6GLnz
 SFUwlnAOYbD4xfUMA/EUa9bBCBVaiY3s640m2vIa/c+UV/kQsznd6WgiUJ9UyqoNqLQgaHSp7Ps
 Qe3ex49CJhK1Jaapt4fgTTDwuFZzMQ==
X-Proofpoint-GUID: uMBy-EDnjkF9cw3dLpnwMRvYqvairIp0
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=6942a866 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ee-W4yJ1yma90M8iBOkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uMBy-EDnjkF9cw3dLpnwMRvYqvairIp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170100



On 12/17/25 11:38 AM, Alexey Klimov wrote:
> On Mon Dec 15, 2025 at 7:29 AM GMT, Ravi Hothi wrote:
>>
>>
>> On 12/10/2025 7:26 PM, Alexey Klimov wrote:
>>> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>>>> This patch series expands the existing constraints in
>>>> the q6dsp-lpass-ports driver to improve compatibility
>>>> and flexibility for audio stream configurations.
>>>>
>>>> The first patch extends the supported sampling rates to cover a wider
>>>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>>>> diverse audio hardware and allowing more flexible audio stream setups.
>>>>
>>>> The second patch adds support for the 32-bit PCM format
>>>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>>>> and 24-bit formats, enabling handling of high-resolution
>>>> audio streams and improving audio quality for supported hardware.
>>>
>>> Is q6dsp-lpass-ports involved in compress offloaded playback on
>>> existing devices? If yes, then how is it gonna play with
>>> explicitly setting format/sampling rate to s16le/48k in sndcards drivers?

be_hw_params_fixup callback in machine drivers can select any format
that fits the usecase. currently this is hardcoded for s16le samples and
48K rate, but its not limited to this. This patch is expanding the
allowed range in the dais so that machine drivers should be able to
select other options, ex: for HDMI its better to be at S24LE or S32LE.

>>>
>> Support for s16le/48k is already available; these patch will expand the 
>> existing constraint so that customers can use a wider range.
> 
> Unfortunately, you didn't answer any of my questions or answered
> a different one.
> 
> Perhaps the main one: is q6dsp-lpass-ports involved in compress offloaded
> playback on existing devices?

lpass-ports are the Backend DAI ports, So yes, they will be involved in
all the usecases that deal with handling sinks or sources irrespective
of pcm or compressed content.


--srini>
> Thanks,
> Alexey
> 

