Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C723645D
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739209; cv=none; b=XtJnVaEySjpSCErI3qWGsoV3moLYsKPBlFDSciXkAkrEL0Wjj3y6YSgSw5Klie0Fu5VTRFGsbn9gkwWXa4jS591piVnAO8HBYagtKIMOzhGj1oUxFmWFMyQb/Sosf4mmT2OpaIEXqbl1MZTowETbHgqwDCwgBKO2MDTw6QaeW7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739209; c=relaxed/simple;
	bh=KIZQegHnKMBMCN5KurBHB75g+b3yGfCCWsKSLBYpYY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sV9Cm5ceLq9HD0fbqaiOi7Bcn6fOOCpD8oIMHS/oKAqNIBd/Ik0pGMkfSvmrqQTY5I6IWaLvyCmQhhKA4D9cjALfjzxzRThGhkzF2FrRi0lbZedlYweMHLb2/08HnUj95EJOHYzp4XymNUEae1NgPMOJ3c/9nyVgvHuCjDinsgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFoMEfi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZH04vp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFoMEfi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZH04vp6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CoFm279633
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpszJFaxfFemeV0/SZwFeF4b5jqGx1fNaw5whlTiIlQ=; b=oFoMEfi8ydvPgb/Q
	ioRIl9UCE2Svdffnd0Tg0p/gufbbq0xgocIs0qK5aWaAyAIJUwscOKjw/i3F74bo
	CBz9bnjwHQKBKlXkxSKm3woKgReR/zTiza/vdfEx0b7ir6pR9Ttqx49Zho5GsOIY
	7TE/ArlrjxA3RbKx6WipaMnWzmRY2hICdkJT+SYnn2sSUh56Os+78JOLjCCiFslm
	C8zqWEJAGIZgztDcoERIqFbIKCZeNXqWgqnCWGJJB58KaEORqU153u0M/UUpc+Nk
	tKql6CPhu/5NWPRCTlcOSpxKG12c+34dELEm+Qb3IeP9MuAk0+Rp20sA6RUtn1UI
	yhzH/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceuc2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:13:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce64c41efso13208161cf.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 03:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739206; x=1788344006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpszJFaxfFemeV0/SZwFeF4b5jqGx1fNaw5whlTiIlQ=;
        b=kZH04vp6+jEi3CReRlnDbCEaziyLmPTiwWYvdTh5fdYy5gcx0jPgg5Eazfue3MZKA7
         Rswzvj8aNZNmMJ4reGvDEocqwVGN/0YcxS2cjWd05E7PePIe4Uo+u4IJRw5PVNshq5wH
         vlqnD6oGCHkpebe9GY2NfysAkaBR/xuNk9usta5fdWLkcHxRSu6ZdBqbojZCrmX3k69o
         R8X0r6LgVfEFgSRkgjmtPe1AVhR+1CbusCbKoRGVI7Ro8YpZu1pjTJw4wjkEq3mmEHuY
         dQkd2jQx+VYpykKwH1THwnzjIaOIZI3X5CuXqq3wJNWkdVyT38JSc/33z3shDUfZNjNh
         OJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739206; x=1788344006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpszJFaxfFemeV0/SZwFeF4b5jqGx1fNaw5whlTiIlQ=;
        b=g/ywlTf3vO2CzPA08LMWPPIOdw6NctIYKMGChXCr9JjxAgUzsou9wIqIIj2Fh3Lh42
         Q4PORCetFvspTyjToQufkc2IhDRev3q6HxFHzq6ah53VTrdK4LNv7asVGTlkUtsewppi
         sBwCicAwkKs666j0+3Ac4TuzZWskvCNVBTrn7jv3iAAPrP+v4LHXZHiTreVn8Se7H+R1
         OjczdBYTSUwNZfmrwFEsiEIV+ccxaWxEa0YQ+lYRYySlEs7r1u5Ns45le6u3zj/VNAY1
         otRz2ziFxdIJ0ihpry9hwjxMHIA9f3GmZuzYGrOKp6oK/f9MpGMYcqFzPxMuuIt10XZy
         P8GA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2LSqCdLkreRPZgSB6WHHWtcohSO1ZofkTc0QU2NFvJ23pa2dnBiEeUZ8g3oo2v4M+YHk5ZJHh+N0ZUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ll0LoIVd0eMiLWUxWgEj76IMUpZ8yY5HHE4FyzEs7jFhxwR1T/
	zuOJisbiP4f1mR2NdgdGY6HYB+Y8KBcqdfybrnXb2dRKfkD2dedYWHl34mAfjc/fo+toAWzP/ip
	D0gJ5wume+ziLMgJqsngn0M5wU/EEs9bWBSt8m9+v/FAVbgTFZTyo5mqRsT0SqmRhMS1F40P9pQ
	==
X-Gm-Gg: AR+sD10lKXOe4Sw3uCW7AdeU6iENbX0WbfRj6MXsv32hufIrvKHBH7d/DmAFH6Yj3Yk
	nwvYUqiEz/B80W4Ieo2Brdw2TmhliKmC92k/bIpHqwFR7S+T1as17EcVt258fpw5Vsu0Rl/VFzu
	6hw2ILEWd+Chjg+dm9e3O6UokxkBx6FxjLYouI9flVfvXN/+djMNHosuVGG6tWsCNrJqOInSxcR
	+cx3GHCg4Uus/GtE5D8NyhrK3rQGvfAdTXaLKKJGvNnc0Nbs2N/vKgDWz4ycTgbXI58UZORh8DO
	z6n2VPO240jA6JaY3C4kJeP0GDy2O6YvFh5Jo4ekW50D8+nrxIU/sLKUxlwBbVAiQqkpVAKXujt
	pWtH7GwTb6SAQrC3xUJsfspL4vok=
X-Received: by 2002:a05:622a:8c8:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52e42320622mr58935361cf.24.1787739206355;
        Wed, 26 Aug 2026 03:13:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8c8:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52e42320622mr58934941cf.24.1787739205944;
        Wed, 26 Aug 2026 03:13:25 -0700 (PDT)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc13fsm2201496f8f.24.2026.08.26.03.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:13:25 -0700 (PDT)
Message-ID: <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
 <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com>
 <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ebc46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DqJvd4i33UI3nbR7U2UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfX5ZC17fka8DGQ
 Zek8r37P98PROEDmf94aOjuHmmeE7fxjeGPLPLlXT11HIbQ/irqKiT49ntkDd3p0x5HbVuNWAVf
 vluH8NN8nt02/M/xAqxcO9OSZEiyftw=
X-Proofpoint-ORIG-GUID: aJ58i4M4t_ftXOm711VVsRKi2udh453j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfX4IMo6gU7Clvr
 4Bl4/Q9wkYmhpdlQZeQGfB9x6KKFU6s57lMjCBhYZyE4JSJ+hzOJCTDYFYtcvQAJiJ58EBPRuwT
 FzeTrmVfk54l9O5mMejf+b0DNOTvx/r+1vSp8ifMxGDXHTw9s063mYYTMwvpA0GZbN+bVQKsJt2
 LmFOGYnaXbWDT1aRZbn8k9oaRIICQWPvw6xwgHlX9Fjoflb6/fYOGKu+TrZBW0qhiNU/06fFAfy
 CPkPfcOhZhsJkMfphuhj94sY+Az/+3DCwS4Foa5LEznHlCTX3l28cZhh3yXr/ZDLkTVeQYkTPs+
 ew8YOyBiD1SPjBWvDtMb1SVK4tCLHuRmFRO2PxL6Pekjdtm62JMlgZCtfnKQKsZ/oEAPustHu1x
 S6DyB7FUK6VxQzDFSSIeqWjgSK4/S8cq1TvD46GuCEOlXIbwH/1aDCcWtZeq766wQdmmmPbfsYu
 x7hddDpVMpsIRGDNGYg==
X-Proofpoint-GUID: aJ58i4M4t_ftXOm711VVsRKi2udh453j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260084

On 8/26/26 9:58 AM, Harendra Gautam wrote:
>>> +             .id = QAIF_CDC_DMA_RX0,
>>> +             .name = "CDC DMA RX0",
>>> +             .playback = {
>>> +                     .stream_name = "WCD Playback0",
>>> +                     .formats = SNDRV_PCM_FMTBIT_S16,
>>> +                     .rates = SNDRV_PCM_RATE_48000,
>>> +                     .rate_min       = 48000,
>>> +                     .rate_max       = 48000,
>>> +                     .channels_min   = 1,
>>> +                     .channels_max   = 2,
>>> +             },
>>> +             .ops    = &asoc_qcom_qaif_cif_dai_ops,
>>> +     }, {
>>> +             .id = QAIF_CDC_DMA_RX1,
>>> +             .name = "CDC DMA RX1",
>>> +             .playback = {
>>> +                     .stream_name = "WCD Playback1",
>> No dai for WCD capture (or) it's missing in this patch.
>>
>>
>> Best Regards,
>> Rafi.
>>
> On Shikra, capture is always through the VA Macro, irrespective of
> whether the source is WCD AMIC or MSM DMIC and the stream_name is only
> a descriptive identifier.

WCD naming is totally incorrect w.r.t this driver, WCD is external
codec, which can be connected to any dai. QAIF just exposes FE dais It
should not have any codec level information either as names or any other.
Pl remove and use the correct naming which reflect the dai name w.r.t to
QAIF.

--srini

> -Harendra

