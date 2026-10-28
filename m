Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224778;
	b=jp6NxsNDlXNHhOKneW+E9TjXa+RbHcXQUADnPsChndupLXwFgnKxiE8rFfyUq+R8e9qV
	 HsbIWJElX941CBrit2spEeSHKp8lRekC/WsPUmTCxsHXeVIZXDQO4kwHv3yx54de8HV5S
	 PXJSIO4a93iERKBY6JeFl93JF6RCMtc6D7iMFkYZStatjp+09pn7eiu9ucEB2+WaHLWgM
	 Y2MEHp+NIB14xeRndJrjMiw4mwoNKag9KffpQx25RWxw/+0fdoxx1J4VYzbQKYyopS7kr
	 ogigb7cx9pQXg+Qf7Lums1pL7uxgv+cD0dNAFRim+fxhGS2CMP2YSgPsIe31qY+jxCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
	b=ATm3RypeIW8uetVnjPMW6OwgZwwXF9d4pufUl4KuEjtKQBC86ZTdG5YVEQLaNmLR9vwR
	 MloyIbqdqAAC8QqOqMgrA7v8sqcxZ+1TqsccB1bSVG93kqdCtt/KPqo2p+i77JOfYGpqT
	 61Gm1h8r04uflhLQPg7mngCvXGMCxFGPyOnJMtJBHtyw3rV2U91zgLXpOoec0nvj1Gfxs
	 DHpiJbS3XxhrrfqyRXJBWDpjliuAuB1WhNCf28YMYbNEvYdv4lEqgQWJDEXqPPZkq+Y2i
	 n0L9HSKTStiIx0styCVPuxgZE99m5SyJYPp6Qz7D5fHIIKQRBI36mFcaT1Kntw/bPDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C6F606A332
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 21:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C6F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPKUu1898273
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 21:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=; b=Qzq94gNCm29yddEq
	2mnaoytNhDl9X6hqSkD4rl6cke3dTfYXobdfGBw1qXK5XPxuynjoFeOWI0LxuiZo
	Q1zqGflIzEd4iY8a1gmSJpFmjurp1IR6nylxCqKHlMucaP2mEW+PcX5GQ8apj27g
	HnR/B1ZSRZ3+vTs+/eWRttJhTolaZIzzZcnlh8lNDocQgH9S09QW3Kjiw67Sgi/K
	VZSzNZeDxmWhkkhyFHbqhZqqsOQAquJ5MXMlPj+WfQOb+LS24vE0a7SjE/BvKNhC
	rBQXDsbM75balqwCfmKjlEi5V+tSAo3iCGSNGS0mPBV46/lr3QRpN+yrK21NtJ2N
	UIL8Tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehjpeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 21:59:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so288286285a.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224776; x=1793829576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=Pud78NrcNSED4MERVPeYoyd4YwNdGAFxjQWEmYZAiKWGBCh04kWTQbh+uQ5Wt4+EKl
         A0X3yC3XPSJvND8+4yLU2oQfyg63Cs78nwiwFFquBlWOVeEh2M+mBMg2PWYzSRvHs5eu
         yXQXtHd1VXj0H7+Tx8c2kLDgW1lszwuSY5rpyN5jybGmQy4gZSLIi3jGbAnTdJFlDcTE
         Q+Z9ZXpfN0gqqvg3iq1kYAnaTB0vhnrsPSulpGgPXfec4AxFDraIXoQCw/EFCJOTloOj
         vXNNT92jPSIhPaxudLEoO2HqR0ZNdbdd8kEttDJpEdT8Vlr8/DAE4pyKecwjGQHjZD1Z
         mF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224776; x=1793829576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=cEauGwtCMy/QJTGVvLmAo4Lb2auGYNqEyAP0E7O/N+wS2ZTY5EZ4QzjO+p1CE+mqSd
         fJcOuIempgpOUilCV0W2VWi3BKtXMjdlmrUxj7no4sliBcv8BiZ2Z3qxTOXsj5ZUJ3iW
         YsgvLctDgJUfE0rZ0qQ6oXQDu7zwJ6s2+7AOHk4cNFEuPJvqxEnyq0aEuJFNHGB97qDN
         NFvkkkHZqe/q6uH19ImWSjqJT1jp/ot1F1hgS6uoQ48XVolyOM8Uykn3qazQ0vuzXJy+
         zKjs8+wg9uk36+Wu5OuFF4A1sPBKfufLdPNsBBTCKDeHS1XPBx6lZI6rJF8cs2P5l5HD
         mZGA==
X-Forwarded-Encrypted: i=1; AKwUvBzRVM3zzrV3y89MrWSyCV7MZ3VCO3PTWnGqVf633ncd9cRq9LnNxpaRQcl95aAjcH7LxqATqzyoEkP+Dg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ07vGNMhrkJGWYJeHr2nbIB3CluWn5JRkedjgKOKw6fTsQRxYO
	XDic5lmSwqGuzcB3AMcU8RZA5MNkteaK94dELzJ15xFDanh1T4oMTr/I4O57QnYT/ZKpfcauEyN
	JtbEP5LHME3Wl1CF3r7tRbrOF03aWDdgULEk59WgUwk2BnBThTk3gQmG+pF91849uHg==
X-Gm-Gg: AYBFou1W8wnLUJCoLFi3W2nIXmcImC0rrWUsCmfsuTY63sUNyTQBn5ZFc6zrKBkol1o
	F8PQ6kjnUeTUF94lRWim3g32yZtNWETgBojJ2WnWXAeO3SFjjfCeW2F9xPR7zcSElrnc+WY4EuG
	82IrcefpcHqCFMk6b9nH6qbeGjkk3BWUCslNCLWupFcbCzHIHW33mWrFo+RimLjpSJ+mp9jf6fa
	lL/zsfPUyg7XtTMUWYBd5498eBRvD5uTRm26S+QkHPUqLF/nJCUhuzcUUgY9h5NOuXUL7Z5uQAp
	AeDiVJERHNvN33adP295PSXdNjCBScVWcaMKRAn7bNpmVFVpmib5dQPnIBM4qlPpnuDzj6h3mDP
	WXkk2hIUl5EeLlcI0ZXTXKEEEAjWMf2HbOHVMlV5Va6A5H/kObBCuEN4NMJGNB+Sk3Limg0UaIf
	E=
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592893585a.69.1793224775881;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592889485a.69.1793224775294;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa82516a45sm24352855e9.15.2026.10.28.14.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:59:34 -0700 (PDT)
Message-ID: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:59:33 +0000
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX+NPraf3HGheg
 7xgMCZpXE4zmFIvEjrTymXCytT94L/d0byvPipBezX46Z7nBDzJRnSTSnnHL8jZvLQsqjg5amfR
 Ft/adToLWUVi8LQM1AgYSCcS46pFrSmD6TVwLHy+iX+OXH3OJwIlAB+5adOHkgjJQucJHcinIKl
 UBvYiDJpxjsD1AIhX21oJzi9j5a50DP6zRdv8eRJO5OS4HNliQyq7jT7oAa39ujoezn/Sp3QPj7
 o2useHx+ZfiVz6p+rSKAWjIIrh07sz+qoKKd99aE+d3boYnvS6tpxAUh6017USppk4SkZ13I2SK
 gTsGduCkJTqRSOQT9OkhiZTP7R/bpuapOuoKoUIn5LwAA0xYNz0awfDEpOKtnatsjd5FelWlmrH
 L55ILQNQABdrN/U+ycLQay4sFqhrNN0zsh8Uv76gn0iMa42O1ZZcwW59HnoASRSHtZFBOiq7+EL
 E0Jvbi5mrvPG7E0Z9uQ==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae27048 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qbwID_QRwwrUub8pYvkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3-hsxFNTp0YbzJbCwfuYGuthO_WZe8qf
X-Proofpoint-GUID: 3-hsxFNTp0YbzJbCwfuYGuthO_WZe8qf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX6UUkvoYHuCTB
 BWxSjd3lqhdgb8Z0gshNJJwupO1exGdM/q5V7vzodmhs6vIaiWZJ2jd6upoHdUGP6K7H+KdGWPR
 Hif0OnZOGSJtoCgbUKxs0jDqhVQ2v2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280087

On 10/28/26 1:38 PM, Konrad Dybcio wrote:
> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>> speaker protection. The speakers now expose two DAIs, so give them a
>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 58158b51fe29..fddc76f59557 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -256,11 +256,26 @@ cpu {
>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>  			};
>>  
>> +			/*
>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>> +			 * speaker-protection VI capture-side DAIs on both
>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>> +			 * playback open brings up both chains via the
>> +			 * machine driver's multi_direction_codecs flag;
>> +			 * the SP<->SP_VI control link in the tplg handles
>> +			 * the DSP-side pairing.
>> +			 */
> 
> I think this part belongs in the commit message instead
> 
Yep..
> Otherwise, do you think we could bind the speaker protection
> channels in the driver to avoid having to modify the DT?
> 
Nope, it has to be a codec-to-codec link that should come from dt,
giving more flexibility.

--srini
> Konrad

