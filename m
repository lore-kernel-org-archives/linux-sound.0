Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261866;
	b=vMTCJuPKZDZiL7nyBBDUKhhoXzatXERw5uhTosI2XDFtaHmlVefxCbE8QyHMPZbzzy5c
	 BKuvgOWMLV0PH2cegUli3a8yI1RoUunfRTr8cDtWXVL8UiAVDBrDrI45VF24PAUyEJ7li
	 Y87zsV7c0Or4TOKiLH5Oom7v8YaSTFrIDL5BsE55ZvrrMA7fHYhedR4BknoNzi33CkiNx
	 9tK3/kMVbuWdqGpnTcTCU9AevZibntszfTqnLsbJ5ThY/B0JWQjn0YabTn6qdL5xFwFtu
	 /T0rMwK3E9ftIuel9sW0Rx1lQK0uVEfKFrrKt5rcs8dCHd+q4RH/5kPFC6kjcDeinBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
	b=vyTHonnxV55aDp+JNRKxB27LzUBirwJamrrtPBn7e16x2wLFbAseURe1fsE2QzIHq4o5
	 bm0hZQ3+ugZzW61xNw5cPgYMaiwNzWtw7CoAgEZ3rKi3ofrMGDc8kekb0QsoBV3ZUn6ZO
	 XjDfJhtvbBqRdwhMQEbECPfhbWcm/NYmuWvQBjx7Msq39UOEspRTSwJea/zecxmD1Yt6C
	 CQ17A7+4wUBPx8L3D3oSG4x1Z0pb7FTBNC8H619SgH/BpmkMBGX6vxWv8fjSQLza6ZQ/s
	 ZrvUPF2qSaiDtNh9+znOQ35h/weJeUbnsxhTKupH8+J4a5LyGuCMuaFxRin9mY9eBEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+8a5gz5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8Wh0s30;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BA2606A324
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BA2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+8a5gz5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8Wh0s30
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6Cm3295093
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=; b=E+8a5gz5mE8FXXzB
	7dU6HJoFxJEsPDc1K5cQDbAVcUEzlQHczx+F90ln4xeMzG0yVD/wBZ9yp/E8ZqA8
	l2iVSa9Faw9da3rCY8/Zqtms4r5ypnhoFQNYXJkNdMNofXPhvMsq4kRiWPnZrpGg
	FYO9u1gFcN4EavpgfirAzGfir0Z7IfoRP9v0P39XnSOrHy7tzROg/XgRypJM7tG9
	SodkDhrFCXhxiuZjGwuPGc6b12RPyknhPfa1VP7N4g/vLn2TslK9XAx3/chyDMHI
	7HiXrxtQzUhpqTxoGuAwYNDvpEjjwLTTCoavmWdHwrRaqI87EwAMffOVf5qSl/Id
	hHl6hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrtja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:17:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944102381acso24652885a.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261864; x=1793866664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
        b=i8Wh0s30wwQ8+60Q4lgSWrocQzkGhURYk+4rb2090UuebIqh+mMGsHZ4S7GvIFTM83
         kZT8QIgAbjfnoGd9wECU6zMIgvczBcvFhRp9yOY//n6SNW4UDjQTwLhQknFnKgPvMUVO
         g2vGPUsdv0sAMIY7e+ABGgRh8Lwi2Sew535RITbTH6EEou4R9hPAbzAHp0EMnHkRqRC2
         EXgZyJ5Y0YTmWCf50kn7GpuUps829IhMeq39BvMQV2TnA4kr7U/v8zOcfSX1PpB8pfd0
         TtImLFvBuNMSfVlWVbqFj/YukRcdQ+BLqK57vG/V33/sYrKPtCjP6Ub0CyVHtNc3Ay0n
         G24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261864; x=1793866664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
        b=W8+oxp5bvGU2rhCWlmhGKje8wiiYaTsQXAX7apKl3hC4w40UKtXNjG7Je2qY5TSUZt
         Nx+5VFJWh4MyqvI3MSm5WKG97KlZOk4L53RPRnNA4cWgbnNlR7zfX1I6e/IiPKqONgG8
         oiTqVrEO99AyT6967iSmy2Lyg96R8u2WXgCqRxt4Ode8Yp4CMylb67YneDqE0gU3RMRq
         aqWIiuc3X8yRbvLqujYVYpXkX4egyH7d8KgZow3L+lYCXwUaalfGeqbSC1K6D4p/Z3V6
         jS2zHjHMHHVEuWv8bb7psWICbGBVpHMFV86zMNz/ta820oz2i3SwJi5/UOLHG9V7FKV2
         mGzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL3AB6jFTh9zT1UT36kObM7QJ52TIQ7Dz3zXA1fYmmw5dpFCONijP+LD/sZnSv2fvj8Xuh/pzSCXtSag==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2mz/Ht38/JTtUEeU0C3pv8h+yKRVUk2zcyCR1VF7pWSEPAnfH
	TiO9CSUH6faUI8Sb2KS0Y0goszK/03jLjuwgtZZtztR2u0RR0RG62Z/OHP6SUntTUHVkmyK4fLO
	nXmEtgsURGdkdd1RxAjRZRbTg9/VfodDHi3/OZfg7/BOGxj5YnxnPWWuRSr3OS+dAug==
X-Gm-Gg: AYBFou0QbRWUsD24N0fFgRi+QKQSsYDx6kvM4vMID7I9xtQaAHeZ2Z4NK2V/+jKWZQy
	0x5BGHpwGQ1ReRCUUc81dHznxl7/K2VL8KrCAAtNJtRlmll3TbCd85J7t5XG/aC4XFnh0Fd9FsP
	ZmmjRBKhKkQKT0Rx1Ki11X3BS7UO6Rq/y94HD4bA+wgSBeT0rLTvjaXf3XgPtGI1M0ugW79Kfsc
	6DGv7qEJ7X0W/VfiRhwinaEu7Leg0AN9KSHuWfmV4bu60eC4vFdU5M0Bcgmg9SPx3otpVYAJAOs
	rB0i4wVMmhctE7gucolD68YIgrXsV9701Yfobehpri8DxTunAS5EEsGjUDLxNprT1/KHMXulXGt
	weEhrDb64wbjcV17NCD8KaCJrz2sc7/ricVkr15pcxLQ3XvjdQeB+4N6tCbpWa5Lr9UMn5d4=
X-Received: by 2002:a05:620a:1135:b0:936:2f59:dfe4 with SMTP id af79cd13be357-94408845854mr747552985a.0.1793261864097;
        Thu, 29 Oct 2026 01:17:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1135:b0:936:2f59:dfe4 with SMTP id af79cd13be357-94408845854mr747550085a.0.1793261863581;
        Thu, 29 Oct 2026 01:17:43 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49641f64csm2408328a12.21.2026.10.29.01.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:17:41 -0700 (PDT)
Message-ID: <f8c823b4-9879-4a8c-8824-a745b5426c85@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:17:37 +0100
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
 <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
 <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c5nPBflA6OlM45gruM0OQD_KrVMzTwMn
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae30128 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LyDrgX5eIXfwpl7llHQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX+lrduJsZaUhB
 zSooRedVdjCeL+m+WOJKh8bmiKdbrJXkOFCdqaNR3G1YPlXY2f9hxKvKZqEw7Wr052RDZAMpi+2
 cXn3YkrFJGsfVx/0y7uH2RmpeoHSF88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfXyfHo7u89ISUb
 5zPFz1ePWXTIUGmNuDhHvB4ZiYzt3iJutQecFbGLgoB24lVlcs77DQDz9Or7p5KNAbuVmj7foKW
 U67yu+/kzqnYIDY6RtqEDTPrc7vjXmhRUPjERCrYBBWSCEV/Rl8eobMi50UsSlxxB1WHwCuWUJl
 uULECH1Lt0BGVxaAwjGfihjDucS46eetxigu/2tpfP99hg1aSuVCIQTV4VnpG9A/SE9euuRL3HP
 9XDTCPWUxa6a2afncgyKlEu8fpiEDU2Uw00XsxxIosOt9GgJerIUUCA4YDoIAGEcVQ/i+8HKihY
 s1d2sHATQ2MYxg0xzVp0hmBs7NlRvSWKeUaahKjTD5hjvj6sJH9lhCwhLE86TjgefcjzAEgVWOq
 OqpzEjDyMiEqB7MRoIS8xt3cmUlWRlZOs0+A/ODzdDMQ4Y2YjtcX6MwA+RejdC+i7hI/vRMSfAS
 LTEmkYBozRp5OjdlQTQ==
X-Proofpoint-ORIG-GUID: c5nPBflA6OlM45gruM0OQD_KrVMzTwMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/28/26 10:59 PM, Srinivas Kandagatla wrote:
> On 10/28/26 1:38 PM, Konrad Dybcio wrote:
>> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>>
>>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>>> speaker protection. The speakers now expose two DAIs, so give them a
>>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>>
>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index 58158b51fe29..fddc76f59557 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -256,11 +256,26 @@ cpu {
>>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>>  			};
>>>  
>>> +			/*
>>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>>> +			 * speaker-protection VI capture-side DAIs on both
>>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>>> +			 * playback open brings up both chains via the
>>> +			 * machine driver's multi_direction_codecs flag;
>>> +			 * the SP<->SP_VI control link in the tplg handles
>>> +			 * the DSP-side pairing.
>>> +			 */
>>
>> I think this part belongs in the commit message instead
>>
> Yep..
>> Otherwise, do you think we could bind the speaker protection
>> channels in the driver to avoid having to modify the DT?
>>
> Nope, it has to be a codec-to-codec link that should come from dt,
> giving more flexibility.

OK

Konrad
