Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224569;
	b=powMMRfWHLXyQtNgHanx8oYYGcv34XeMReODZLhSazCHJfHj2Vzj6cXdSdKgUT40yG+n
	 d8+01uxHnlVbYbW700qpNx9jSTcCC9K5UsXFra49l4v5jiK/u/SDBM+EGXbOwTD/Pk9gj
	 hk8pmkNOV6t09FHdwj29HX4ekMyB4+jTB0TOIQs2UyfxQwB0Akh9YXKFoOW+Bk0EUe4sE
	 daXtQ8A7iUq5mC5g50rStclWi6XxoIHdwNWmYRPP6DiJVfC+PnARspDQSKXYTHT/LVVg8
	 kbI1ddRztsXxXnauitxchO5Bboesl6cHK715guF8kGDvrRBKigKMi11aKhJUogxvFtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
	b=QJSRTs7IVB4f+rSHtFVu5/KHdjyrVCZgJSDcd5cw+9zho99zr3NDoqtbS0YmqbrL1rj6
	 eIsKOyoSgxNHLtzWOEuWjQZQy1GVYLmobsMvZ6H6JZ2CTEVik6qvjK6rQTfEW6eFfflSy
	 0ppqJ9Lq343FyzKSvK6/lGk8DJTeMqp8qQSHxo7gDFqXCL7IbPjxqP768k1VoiLP1XhqN
	 VNHRm9nJ7vMnl/c8ptAvtB8s8m4zFaV9Pz692E+aNKkeUF/TaPLzPBEzpv3BiQPpzPzdM
	 dKCSjszO7PQ3gGEldbPzapRi7r8/TRsaSkA9NBZjszZ6Z6dguqoWW/qHf3XSdYEOiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6+V08SU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Kb/ZgqIM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F423606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 21:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F423606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6+V08SU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kb/ZgqIM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkErf2546832
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 21:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=; b=I6+V08SUWFn8OrJj
	/oc980yhRpnBQ54mN3PIWbEuO1FUMEMdNjS6wI+GTpHqI+3erfHUvhl4JPKS6Kyh
	XhsHfvUi5kNq0lg81sAV56Z83lgeiT6GEiSbLDaybfRwh2ryNGLSRimZuF6aWlY2
	A8iBxYUtmYNACwXeCfNOvdcfUEbrXlzoMkHPcPfWRF7RSGM/Pw12Y1dKtxkzhtSf
	6uzsI+/W2xjo7qSi0D6IrzX4P5rMmEcCnlFmWAJ9BbPMRp/bNoUwMiCPC7vBnuzC
	Nyks3CrstZZZvoWl9+kootfOwOkFWsXcXPAgWGuU41nAKgyxrbu2S62G6VbDT98N
	NquHDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc0muj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 21:56:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so303781985a.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224567; x=1793829367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
        b=Kb/ZgqIMOFbmJghMIz5wr8TduAUH94lPMO3jGQ4yYylSWZL8hAUUtRhUtyBAuUGAUr
         BlhK/fzmMHeTt84cIDpNadXx3BXzNZ2vguZhyjJ5eQqVAMJf25ZFm/0JHhKfESsnbwQu
         HZ5RO6bzBck9XbD2G3gbfMlIzeWPKkp/hVf8o95i1djCkge/Xn/EdPJRx9N8UAtHu05G
         r9MYyWJKENOjVvGrVm6QiPxiq0yKkJhZ8izo0zqia1d1nNcesbw3kbnOo3sq7KFGAe3O
         2iBAv9UZsnki9296U93dO167MA3OkrV8VZhzCOPZdZfspRNKssTrLYa+ar9UuJZQ8mlq
         lGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224567; x=1793829367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
        b=I9lXpkAakPejVQlM8aFSUqwbDtoj0ofziOOi54tHSjJE8o9htQzqMiqL0+EruUAsLS
         pdG+lms1Q8TMqjb33qjlJjuTWnqKg0MX3o0ZztQqmJsVkKO7CRl6HnmRXEDG7w8myGmz
         G1Qoas72xWwH7RBJvFoLyuHg/l8Z1eiv2R05T1pWjMs5vlNZpTjblYz1e6JkTruFRZQ2
         vsVsJ+/9Zdp+OVNTWL897ECuahX1sNBciyRdZquDHL+j67eB4q/fqV0CS/KvLWQywrpR
         +kkKJbt3nxi3Dq5qPGZnBAlVrrUkE1tDGBVU58ltK9+IBzvj6nmwOg5ispnjc7cOl8a2
         AZvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM4FtnC63K1khyHkGtmV76pTpscK6mLbANaa/8kz2+T6tBte0DqaMi7Yh0U1ssy1aOpBzjZWP/v761SA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIUGCc+dhMv5mo4QEc+39lUEl1wi2lsutjqR8ordP35rMja5xbZ
	pzVCFDdOerjZgd1T/bEMTzbts1FjWZHZmfsOVIsNd+YNDmNCbKHKUxAnFVrHcBAuoUhiFVEC3/+
	vg0RdV+/UyqQjtK+yJpA46t5rbYY9GiTrMfdUESZ/+ad4IaW7fei3R9npd6K07ioW8g==
X-Gm-Gg: AYBFou2FNOd2djktjEJRoGghcTjyGebWmryV8UOJMJGK/klu+jJ/uL/uiFGAivbZ6TK
	pdiRGTukvR88OAt8U9+KrGboLtZglWMS6nKJnd1ssQzlyKfAWqPA87vVfZVDXDVUV7UFK/wg8zx
	EiXigySGD/+8cC/wSJZViy8zYzbfj3xGobSWDcHelJSi56Yf+unRCc1yM3LvzZpgPSdSsiI7Fu5
	G/Ox/upmf/CnEI/YUt8RqGHI8zoHpOulnU4HZfoJrP6A1OW9HcyNrFsNcLOKKBc3UI58qbIa6z9
	/KzYm0qxOt3UfWGEbiMoGbTMkEK73RphgZLT1XX/gicbez8nujiw+2SfLMXfY04PYrswv/uqDt9
	10z7Ex8htbiUI7ZcfO8yid3M6rgG7fWLZMWzlVgjhuq2q1uHaqFW40T8gyYl8o5aMQOZNtBcCpy
	w=
X-Received: by 2002:a05:620a:6f03:b0:93c:29b3:3525 with SMTP id af79cd13be357-94408a94fe3mr548789385a.36.1793224567342;
        Wed, 28 Oct 2026 14:56:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6f03:b0:93c:29b3:3525 with SMTP id af79cd13be357-94408a94fe3mr548785385a.36.1793224566702;
        Wed, 28 Oct 2026 14:56:06 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e64ccc693sm1283103f8f.5.2026.10.28.14.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:56:05 -0700 (PDT)
Message-ID: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:56:04 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
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
 <20261028163152.26892-1-fabian@fielding.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028163152.26892-1-fabian@fielding.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae26f78 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mQyjg09NGKRehI6BM-EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jNVL2CsfXhQEPEEgQuM6G3eJp6iICvwR
X-Proofpoint-ORIG-GUID: jNVL2CsfXhQEPEEgQuM6G3eJp6iICvwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX8FeVqHwFaS/3
 moGLGtzaIMMnfSMCHOcCuuEeBjheo8y1vzl8eIVPe7Eb2ah6R1JN5lo/pYrYFf8p/O+Kdd5YQ4g
 m9u7RlyolNbmRCWpQ/HlpffiEUP6ql4HtkMUtdai+/3WaJ62Sxc+pjDiHGHqQZp6xhL50wbv1/V
 Dd65ek5zI8dheMkNPdYxeTDMZT/UBRXrDYJSgQjIaVA2QEofuHc/xZIgF+I3M/B2WztOkc6smwk
 yQCfVq34JQ70ALS+uBJM7ZsOw9C7hj4k71Z09BN1nXqBx0a08Xolw1IUhylfRa9qn8CHUR63dd8
 epymsHg7A6VvXmKcfrFqEW9OInGCwro3UwUqGGrpMB+zH1T6yMpGpCcTL3/xf8w0dXs09xhwAri
 U5K8JujMrjzsnRyVN/jm/705qBqbhxJE3P3UO9a4VqWAernrqPgH79Rj5aWd1GSEl6H5gEQiskL
 JehtpO1ezOBy7rmHn+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX40AOg9uP+/ng
 5eixsmQMj8GY8ekp3Qs/0w/9jMncxQVgb2QI86YHYika6//M5y1rrw87WqLgiJvGCLqxVG9Fd9j
 hoPk8zoI5NV9oxc0+Db7KsSSu2pqpXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280087

Hi Fabian,
Thanks for trying this out,


On 10/28/26 4:31 PM, Fabian Renn-Giles wrote:
> Hi Srinivas,
> 
> I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
> WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
> problem.
> 
> 1. Over-read in audioreach_get_module_priv_data() (oops on topology load)
> 
Have you looked at
https://lore.kernel.org/all/20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com/

this has fix for the exact issue, along with the VI fixes in codec,
please pick them up.

My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
hoping that it should work.

I will keep you posted.

> The function allocates
> struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
> memcpy()s from the topology blob. It crashed on the first load of a
> topology containing the speaker protection module config blob. The
> cause is in the size computation. data[] is __le32, so struct_size()
> counts elements while mod_array->size is in bytes. The allocation is
> 4x too large and the memcpy runs past the topology data. This is what
> I used instead:
> 
> 	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);
> 
> 	pdata = kzalloc(len, GFP_KERNEL);
> 	if (!pdata)
> 		return ERR_PTR(-ENOMEM);
> 
> 	memcpy(pdata, ((u8 *)private->data + sz), len);
> 	return pdata;
> 
> 2. Slim 7x bring-up: V/I feedback never reaches the DSP
> 
> DT changes for the Slim 7x:
> - The WSA codec list is extended with the VISENSE ports
>   <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
>   swr3. The speaker nodes get #sound-dai-cells = <1>.
> - The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
>   Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
> - I cloned the CRD topology and UCM, using 4 speakers, with the
>   WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.
> 
Speaker tuning data might be different, but overall it should work.

I will have to recheck on the port-mapping.

> What works:
> - The card probes and the SP/VI controls appear.
> - Normal playback through the SP graph runs without errors.
> 
> What doesn't:
> - Calibration (Operation Mode set to Calibration, then silence
>   played) times out waiting for V/I. R0/T0 stay 0.
> - I read back the SoundWire master and slave port registers, the WSA
>   macro SPKR_PROT TX path enables, and the DSP module config. They
>   all looked as intended.
> - With the SP graph active, the amp stays gated and playback is
>   silent. This matches the calibration never completing.
> 
> Question: is there anything Hamoa-specific on the VISENSE path (din
> port numbers or channel masks, the macro TX decimator routing,
> multi_direction_codecs handling) that I should check? I can run any
> debug patches you want on this machine.
> 
> Unrelated noise: SoundWire parity errors/clash messages appear in the
> logs, but they also show up without the series applied, so I don't
> think they relate to it.

I did hit some soundwire issue related to runtime pm, which was
triggering the timeout too, Can you try to disable runtime pm and give
it a spin.


--srini

> 
> Regards,
> Fabian

