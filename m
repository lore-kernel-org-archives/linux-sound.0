Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089767;
	b=kTIcjOs/gO/kUQwD4Ho6ZJ4BTHCPafnjDr8VBdctPHdBxKcw3ZHJjmKhJXxwzoGWdjk2
	 t4Rd8WXXX6m+WGehvZ8fhUWM9QGHBWAXKHy5iAHVhZO+SNc+fFnbbYr8LICNKO+h1J8Q6
	 Etry1KSr17nqTBOqUbhhXNxQ2f+6O5qzcOS7VdNadzy7s3iar/WoloBVDYi3I1htbT29q
	 J313oqtSvVJK8MJ+K72eTTpP/gjxLWxHbF5UnbTWHppm25O6yPmRCCqtAQQB5OfU2Phn9
	 S3HrPM2JS4Rue2dfQ8jywDgOgQvOPfxltgee8uEvOzQq6sFR8zHe/uyK9m+GCnix5MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
	b=e57zGvYEdoo6qzSWqq6oRfy/7RC1tNDIqqBbdUeqoFbL+8BT+uc7vwWxAaX0I1LzgA9R
	 F0FBc/It/rdC0E9w3hmj0Sle0rxWTzJLHNIfu3lYP9aTBdOyOlixJTyvh0WunaRd+z0Sh
	 igbHxzK53r1jibWR9uP8WsntRoE719CUndW/JMLh0iETB4s0rbm5P6ZbTr+aT68frGh/x
	 WK6aq15Ux7ZMbLzk9S0iMmxC/ZqZuY2+G/SBMC64uIjY0Qu47YSud5XDoKbu7XYRqIAv/
	 wfTA7DyO0Go7pSRW3W3QeOL34+jFNLWdZbMWzke0WFEFmk087amEGDvCuuzVV4AbScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mzIx/jwo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2KnywB3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCCB606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCCB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mzIx/jwo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2KnywB3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJUL3950107
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=; b=mzIx/jwoIISBSLsI
	brqUo+tvPFgIKfdROBM/ENqEm8Z6RQGuegvcH8/yyh4Kj8KbO09SLKqwvg1g588Y
	sIaVjiEpqcgUQYKPpi3wxALFrHiC0RZUd6QX6U0omfZCETP1MHHGu99XQ7nUMGyl
	cAJtYa8hUVzBzfJUG9T1F+zJ//LMULGJMlvlm6mi6g4luv7wdU39B98weXlDiUDS
	OJ1PAwjlyeKW4kxuYneleHuY4dL6lLmjw86d9PIrfWtVBjpwihZuht9mWbyB9Y11
	IDszBB2uoFXW33KLC5xwVu6TbKzs1iU1J6qsKaVXBCIqrWmtU8EUdBySxYpRw+9e
	VIVgUQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jumk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:29:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so3569422eec.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089765; x=1793694565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=T2KnywB3ELqNGV4RPBeI3kSAIFaSCNOVhMGxI5Vp+fNbF9WOtE1F5yhFwTIW0OHHpc
         9cUod+Iy+sdh2qo6fKtmfhW8xmES+vWkBms9ZQqqGVmWvDXwLBo+aOn8cR3QR1Iz/Fow
         aX0ntRD7FWWxVZZXUvDuxTeRE55Rjq5LkxjltRUejvobsE6RXVsO63hQlgDlFgwCsKGO
         ZzFArHoowr819Icx8u0dBTtgRBbpMotcYH9G7QdkcGIWydeQ4irGG0wNQ2QVNv4RtOQn
         BsUmJWKEP8DZpU7dlZmRW7Hh00jPROgJwYUhdxykkZfnreLXW4Se0+zPpXpS0JmE5wwA
         p3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089765; x=1793694565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3tu306QvmnaTRruHAjjOf5ov6BIeViqF9ztL4AcPLM=;
        b=QTlhAjRE9wJKwp8MTa8J1bDUiwzNauiQKoqPE51CWoOlspI4K5VItqFoFDn4EzzjBH
         ihIK2yOSB1DbgMK8vEsiIUe+NEC3SijRutjc5tfkSZjnaAmh3i0VVhHqNwlRER8eyLAz
         5ewqFmYyulsNmetc4IaL6Yw6Y3O9DSyjw683DQk+UJQYDBDfDtlE4j/IlY12/NVvsrqM
         II21aiHrbg1ZIy3Ochrm7nq9ZKyD1sIXyrBG45W24TzTYHZ1Zp1lHo29j23Tuphn2mMD
         fPrMH6dohsC68HGEYwbs/mT1pd1qGSCe2AjQgy+O/YkVV60ho9/pA8GlLifX6cdE3hKk
         m6nQ==
X-Gm-Message-State: AFq9FYIOsXA8ePGYKLX24QXhqDYGbT0tzWONSVr0L4c93Gum/EvBBlFf
	6FagBnoEf2Hp9sQifyKrote/2LMCnD8FfYU2DipUA/7S11dCYFrNe5FGKxQyXAVTkKu9/gVLmgi
	8M75wR4T9IskPm89N+q7xoHQtHrvoBBtqZftfM46H/tp4bHivnudD35cRxBFZv68/Ew==
X-Gm-Gg: AYBFou0GkR3XEFC9Lw6QrCja8yDkQmYvMIyb/4LC/6PooiktIeaWzbBXpozKm4WjVfx
	nQZBDU9Pr35TNdy/dmAXjVstYvxwLtPE6qe5qSVFYjh2X6TRxWIgS62sF17tQLN/c0TYfZibkcy
	q+d9iuJ6+44DK/+sc/A63Du6awOOdPX+k5SCiuzEWRBwewUaRiyRclF+ZNrk6XbqJsK5Bue99Dh
	SbbF71n3Uu/r+h3Mbaxk8oMA6chkYuvIqW4X6hKkXtlj3bQVuE0Ve5KVmn4WyEndxMjEzpomSdR
	ecwk6+miy9LZkNjDbiKVzNCHXZrt1buxi82IWXUsNLyT6+Lzy7uyqh2vlsQimIFDvpOoRFL3dS7
	dMGzgqGdR59pVAgwAdeoJ3ZdUTKm2dx/2
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502662c88.20.1793089764926;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr12502640c88.20.1793089764414;
        Tue, 27 Oct 2026 01:29:24 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm31709403c88.12.2026.10.27.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:29:23 -0700 (PDT)
Message-ID: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:59:17 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Karthik S <karthik.s@oss.qualcomm.com>,
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
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXy9q3ZOUh34M6
 nudZHIdssK3GB678oTS6iJyut+SrVQDcaWKLdhxe952pt3l7gxVYdRduzA5dHaHXJK3bD0UzGlE
 qnP4bDLFfMNU8tb+drdgFUvf/Z3agec=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae060e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=G9vM1blcj23d2gLDv7UA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fC8ZUQ0d1tP7Fl2eonx-22DmlNTFxHga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXwioxUGc6M/ss
 UXThZCTpMEjzwry6StHVLyRGnkDx6ClQfOsXYLmKpKycv4EgNrfp6NvVKX7o8tZXjYTtVcKU/Hu
 +DWZ/4lMUW68ZZP4rIuxv8Zfwjgy/UqS/eu+KfrHCqnIZOtqEmYN0ecokdbnOnkcXIVNPlGVru7
 EzcMUHPTptKuNIquGKRmJfAfK2AwdM9ZWo6FmRLwSYIN4asVoBldZHjMRYMbmM8RtLIpiG32gaa
 MI0NYEEL3T3mDxS4Rk4ioNpLesLRum7t0xoWRsN4muwwfC3s/uW2LuS5n68NG+VFkOTw5X3GUCk
 lwwiQVDRAgWF7B7siR/avPwqt/xyW8dLTO59PICCYiJlH/T14EsgzD8e2x+MxHyuJKU1vRiCx8R
 Z0OliQH/vAjci75J8qdJn6HXd2NUuvAcrji8ATBxckwEw1Axu4iSonHb/3S1U8H1Mp9o0x93uci
 VKvKOaWvPflMZ9Qr9gg==
X-Proofpoint-GUID: fC8ZUQ0d1tP7Fl2eonx-22DmlNTFxHga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033

>   	rate->min = rate->max = 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +	case DISPLAY_PORT_RX_0:
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		break;
> +	default:
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);


S16_LE was originally added here for compressed playback ( 
https://lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org 
).
Could you confirm that compressed playback is unaffected by skipping 
this constraint for the MI2S and DisplayPort backends ?

Thanks,
Prasad

> +		break;
> +	}
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
