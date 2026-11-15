Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776630;
	b=H4SaXLX41Mww52CdmBlAxIs7o697K+nMjxBikSuXpe+Z+X5nU8PXsNKz9kdKI73DCTHR
	 v66fftWUVqZrESDdY2ol9wvIFmxzSEDh25egASxEtcFestsvTde2M8sMAS4D0gE8yM9gh
	 DGqu7IyCLVmjqqETQpLE89hA+EdQ19WXIhtIMpkrXXbPzXHqC/HjjnrbdKxgf5kXSlj76
	 X641WK0IS2vZJCGzd11mBa+I4ksqbExCSRUQ5XprBoBo/ob/1guysEG6T/+eBl27TahJD
	 kvNtq4siZsyh5AvpG8rA71zMfcio3mysFuGcuylTlm4ehSumWWyBSgKZOu/HsNNNShQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
	b=ny9HR1/KYMKtLwILwGeiDtTKtqOEMY33r25bNiUGZn6xm6BzIjSOe81MyXVcq9nt4JTK
	 kFVS1Qn3+r0oK4OV/upXU0kWEGtsvV09m3zgl9s6VuMUDv3wGA4vkComzVtNif8sI61bm
	 mkJexwFVoq9shOvegVSd81yIl/YU5FqLEdqNIQha+AhX5OQZfcWpNE+HjK+/9j0wa1VML
	 8QaluB9PAHpCRUaTXM+Mv69vIDD21JgjMk0i3y8br5trCtPY16qyiK3ziEFZ51YMhtho5
	 jg3AJ6t22nBTHebuXeptmQrEmyL33R2Juw3EVIh7ZjZ0RboYsU/B9CQBQPVclX/D1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPxwGchk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DF606A338
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0DF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPxwGchk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQiUs3041691
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=; b=agbTALtSR3gbxxEc
	VRvNU4DCIKPvGpMO7CugpH6Uadyx5npRYj8FJv9vBKO3NQTl5CvPYcXjWOUWbMtn
	Axq//AERbURr5exipw8deW1dUK01/D42GkdVxJS2Nkny28LtZ/iUX2aGPbBe8bh5
	Qc3z7A61AmHeExvu24i9LhT76E3P2XSEn7fvlGqNphWMFnSJlJZxR1bOa3ueo5/y
	mqaBgVCB1XM+jyxY8d+ZCvsX3uMQjKQc5aUlSUqnfXdYbQORz4AhR4vDn633F8v1
	Di9+nyS3qXAOiDfm+1q+7TEhvVQfqqp/xC1mQCkjYzV3PxH0izjh5Fwp2peOwvuK
	/ZmTEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqkvwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:03:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so301060685a.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776628; x=1795381428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=iPxwGchkict8FNXwwuxijS6mEqQTHVXY6RJbzUuKeRhQsgIRnuf+Q8z1Ps0ehae76F
         2WrKMbo5XE2Zk5TFmWPqsWR1/sbQoyEpMxyKJlByUZbegFzbcs01l4Oet32guZuoAeGS
         wc5UQgf2NIt/0tHqSoBBxFusNDaqBcJ1bEKmRmziHSFb3LDD6Pv9sl9TSCfOqLsjjiWz
         ALY6KiCTV+U+ZJEOjnmKjWknc8EvwHcR1+CpSU4uCv+KtvBU2Y1hlqdxBu30ivZ2N6JD
         rQheTgYrTIu3HFLjypxROjQ7unNiz1wrWw4BqUKJg/dxo5yvK0f8URn8aIt+hSmfiJev
         enaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776628; x=1795381428;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=hzVV+7pj73wMzv95oE4oXwm4rEe/LLkkpk26NKLuOFiGCg0X+tV+FI7rqoOxExc1X/
         96znvDuRjfmda9C+Dih22aCg14eEP1DXlocvRnAUgtEZ+HSGna/plOzXKNH1EqzQTs6Q
         1ojIACVrX+Be20tZ1ANGV5jiRKyErCNmhKKDKS3Hcetfcd/rupkWzm78HvWRwl1B6Nb5
         lt8TF3Vw7A3pDOxUv4XLXTkFSxR0MOp6wKI5u8daY6NGXsWV2K4xcq//fUmTxY72CcKf
         +zqU2/l/RU+F6coCjPxdXpJke4KpEDcB+7qzlql7MtLbaohZ5VE3OGpkAcqIm28K432J
         h8PQ==
X-Forwarded-Encrypted: i=1; AL+hErFvikGwbtLbDifsxsdB3tEE/3RECabhvTnNaN8CiTl8Mb7wbG2kCJW9B6xZcgbeixaV+QSl4Q0ONXPgDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/M999Il/AI82DYdWo5J/v4zqQMyMPxmvQDlYZGz4oEjB4DCp9c
	Yjf11rLb0X+xOxXgAF8/kLSKvyvdwa5GHfyOUhs69a7FicKeby/ttGNc67jxd3HqYgUPTDHP2Qh
	Ri1LZrxS/lttc0Wc+0pCzYAnXQa6JaCw8l2YN+rTFwY97TKI+XmBmU9V5Qloncquimg==
X-Gm-Gg: AYBFou0JjRIOdmDG2kAhgeGK2mm07qNqsyITtUdoFJYGrGtwTEz1+Px4iuKa6s7f7f8
	n5OAL8zUWPvF2nIHaZkg1oj8t42Y4uqyfSByYvF4KY+pDqf0bj0zD/kGQerhZBTpSCj+fJvIfct
	cSIa2kC40JUGDd/jLEOLRerPsWXCvLR6K777dUg6TObvEarmQWHDJdAVaxitOvcWbJs+gFWVhiu
	RoFuRWV//5hRAdECvqAKTbFiN/lX/pPjotNYBUTqUffmx3oHhBG5FX27a07o3gydATYTOQnYMWY
	QNoYhRwfS7Nzw6H/i8TkWULIUrJsbfai2oeymRwKH2VeFK4LVRLqtQe5FGflUZgMh+DUYIA1dMf
	U9UM5H3jk+vsFmU/XL66s9dbopf+0MBpSJBEkncqMqQr8m1DBhwZJ2G7xjYIWY2mWpMMSloB9e7
	rM
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733614885a.1.1794776628040;
        Sun, 15 Nov 2026 13:03:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733611885a.1.1794776627637;
        Sun, 15 Nov 2026 13:03:47 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm18917479f8f.6.2026.11.15.13.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:46 -0800 (PST)
Message-ID: <ea0f1a60-b2d4-4d3a-a7a0-767f4132f8be@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:45 +0000
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
Subject: Re: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on
 the WSA Playback BE link
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
 <179476416983.140154.148298781294201106.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416983.140154.148298781294201106.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa1e34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=eRThcyuUgiMSaGfv38QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX+h96KAXoBfMp
 LFunBLHuGzo/kXHWIcJAUos1/wMbrgHr0ZQxj5hiuoztqZVNSC4yC6zaCz5Ffp1emNim37Mk/jp
 bjGXdLo75r0aAPIjVJYE2Z2VLW27XyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX7LhZidybpKKb
 JejDsTIDajEa0al9FLTldgbVsiAo3zlYvU5FQhOYPIZa0ydWzUByBoVw3wTDR78t97NXc7M4RGN
 3V15NmAQKFU9NtkB+JHkyh+vvrASUdKQpvUhkbZ5FQeNL0rS+MCO9pHZAhhyFaHP8PiGBp8ZrdI
 7kb4+ywVQTN+2DjGSEOz3ASf13Q5fcDtyVec8UY/Osnt/ZcQrOBjhXu6m9RnQKKkOuSk9EdNTiZ
 UcLYjY/PzkDq+iib2u3O2Zld2pAKCZXdNDwawWjDvtVFYv6b5QDUBWxdia7LQgPZT8xtD6RGPAK
 uDjyabuWb83oiELGL27QCNjCLzoFqOp0cGAlsnCuGOU9oNI0LeZiDv6fjXz2iAR9Vu1VZJqS76A
 qlalT9pBpMTdV3zOcfVDH54VlkEZYXQDTY8p01sSdnHo6iuBU/Hvr+BnWs0vl7Qs1MXImXmgpz4
 J+GdXfIzSkgEST6D//g==
X-Proofpoint-GUID: Rk1js5SyR9uXCYGoWDPrfU3PyL-JvpR3
X-Proofpoint-ORIG-GUID: Rk1js5SyR9uXCYGoWDPrfU3PyL-JvpR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the WSA V/I sense capture running whenever the
>> speakers play.
>>
>> Set multi_direction_codecs on the WSA Playback link so it can carry the
>> VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
>> core's capture stream events for such links power the VI widgets.
>> Nothing changes until the DT adds the VI DAIs to the link.
> 
>> +/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
>> +static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
>> +					struct snd_pcm_hw_params *params,
>> +					int stream)
>> +{
>> +	struct snd_interval *rate =
>> +		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
>> +	struct snd_mask *fmt =
>> +		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>> +
>> +	if (stream != SNDRV_PCM_STREAM_CAPTURE)
>> +		return 0;
>> +
>> +	rate->min = rate->max = 8000;
>> +	snd_mask_none(fmt);
>> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
>> +	return 0;
>> +}
> 
> Shouldn't this also limit channels so we don't get something wider from
> playback?
vi has min max of 2 channels, so its fixed in v2.

--srini
> 

