Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41094472798
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635969; cv=none; b=uiECjZQM8AsCwgwn73xpBauaK1CEY4pXTzYk7Vqa+FKirWIIIaPX5kcSMFskR0OoqCL7k7PppCVHucY8DFbJyXiVAmseoHAwDojpzMOuosMmk7nl6UrNgHG71Y/mC1QbyzlSZ2bcb+RzigX5vkhoRYRRtX6TcmZzfPw1IoVqBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635969; c=relaxed/simple;
	bh=71YRGNfb6pVliDbZc+wyDG8P1MQuklaHbOzojhZ8seQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDGXWrL/jf9bYRby4TcSkfJ3H5gS0dB7FtgTWS2kKkkyhbHOtWIGL9xNC8uTz86fijVbr8F3AeFMEG22ezrQdPWNqywefzwbWRrpvlWA7Dlcg7R7Aq9sf+X1BxJg1cxdSpuyVIwjfwKEt7JEQGh//sHcFH/TZswuLUqYZincvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYZT6pTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S00ZPaoQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYZT6pTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S00ZPaoQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOS3h330631
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9RsvBKT8pQ+ENjTfA/wlzxT+pVsKeuMFCetpo/hRJo=; b=DYZT6pTty40HzhEk
	yW777nxpkYDPpXF8OF+GlsG4zgmgwlsJeaeOoFzyCERsDbr5wT6cSHOViFnA0UtU
	D5+WY7cN/3U4fZvCjBajMWUtN58OZqwczKCJ9yRNjSFSV0YT37vQn5NC4zFvNbp/
	kdKHZtLGqz7AgKJOKaM9F3JkjMHgebq6VhZFrkzgKLBk/9NIh0b49orWSoNwxePN
	fjiiYLjO/jzPtyxyAD+kEutyIcG4wbLrISKhEuAJvaCsEjMAY/JGnSrmIoD+Qmng
	NeO1CHwnw+up8U2p/DkKEM3h4yw5j3c/tGdFZs6cQchGN6WxmaGU42TyNPrfEtUS
	rqQHjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09gbnb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:52:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c1997732so973367685a.3
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781635965; x=1782240765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9RsvBKT8pQ+ENjTfA/wlzxT+pVsKeuMFCetpo/hRJo=;
        b=S00ZPaoQ2N9J3EAUQgJrN32Ewew4pKa3QdyG44f8DvRiMKh13txpKDPaVLvrVA/9wp
         cAswfmNiwzFohvqOoNGx20So/NHfgylt+lKC+JO3v8lZC8uzacUnWsl0u7xAfBqjBw4L
         3RCl9Y1Jm4cCTwklhxQ3bvYS5jCC6FEsyhkJRHliYzYpY2Rn9iyQE3KowRg/vORDJoye
         Q8t6OCxyS74ABiqFYEaROfrSkMEOok+ViQH4oVohkFbsp2yshrIZXSf4bUC07PD9TeF7
         ogOrEePYAWRRXjVHS85XDsRLscUcyuO/zflnAnsHpUNBiZhLaWwZx6aShMmtNqWcFSRx
         sdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635965; x=1782240765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9RsvBKT8pQ+ENjTfA/wlzxT+pVsKeuMFCetpo/hRJo=;
        b=H4v9sQtjkjdT3ts6/1RApEg1Qm1dG25b3pHB+XXlePuU96/37ppzKV1AO9c0q9Dihs
         8FaLvq2jqMgBHdQrmC28dQRYvE3XjpvycU9H4MlHRuVu0V5tVlKCYAmz3YNXRj+Zq1Gc
         33iZvWrDWI4cUYDOA+M9UJ1tvA6eVWzDwEo8ZkjAbcwrZOWJ3VD1iTKloewLmt0cD0yQ
         VxVu6VIKa9SZkWyHO+LNHLVtlPSIDGUrQk56pM3GjjjHyPko1Wvi3Nj/pkaTzIBG6Pp/
         Hm77I1/QTMzXoFvVQ0M+pO7wT7C7RR0XQcAaOBqnwVHj7eJGeDGBn30uUSyQKT0vUJ6j
         VUhA==
X-Forwarded-Encrypted: i=1; AFNElJ84n6WSt5MWoPiAlJBHtuups4CMXR/UAi5xhslRMag+HSt+I8okw1aFiOAVWlcANosTMy3NouWASdsmRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyucYxI7v+iRcscoKXAyFmUT7aRR8Y3Na7R/gpj4s7rf39o0o/2
	mIEaHSLMCZHyghXwAgxq1j+JpSSMH7LGEWF5jYm2KyN6r/7LZvFXHt4DdOVhVWDvL0OB8uUhTmA
	ZNgiktTEy76o1tIQz+qFT1BdCY9EfsQYlyQwVZJZZq3vspEaLtWUnj7UTOExaf9n0hA==
X-Gm-Gg: Acq92OFWoiFapmtrYxKjvE4A6cFRpqhXZqzTilGXw67jEVgG2+0MqKjy7/G85s9ff+q
	hftlaZ4TcYR+2L3Huwf4+dF3Gd7YvZI88Jwekgt/9a/lw40LU4iq0aWz0rqkdVoP4C2xC6CdvRs
	Dx7/XWDxKxiJ3D2n65GlNmX8Cr+oYQM8h/KplNe40v7fy+iSfQ0IuiXT9/x9CLqmgZ27GKB6QfK
	kUqIGSAN31VAiB1WNShnZbUWxZ6ygvr0u+urw2i2A+zwC/cVsQ9t9FAVZf+5fhWg9qdPjKEDAAS
	EenH6Z6ZFwSBCx0TK1Kyf4Qfr5vgNavGH5jbFC4C7NF6QM4aSM7AKf15qRmZmgGmm7KhPOg7GMd
	CzYFSIt7w53xNIK9b242HHQYaHcay1RU/WpG/eM28gAMd9Yzh
X-Received: by 2002:a05:620a:2981:b0:916:10f6:780f with SMTP id af79cd13be357-91d8d0b99e5mr159569885a.27.1781635965554;
        Tue, 16 Jun 2026 11:52:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2981:b0:916:10f6:780f with SMTP id af79cd13be357-91d8d0b99e5mr159564085a.27.1781635965003;
        Tue, 16 Jun 2026 11:52:45 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-461eaa0d1c7sm3642568f8f.7.2026.06.16.11.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 11:52:44 -0700 (PDT)
Message-ID: <3287ae19-508d-47eb-abf9-259867e7d044@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 19:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
 <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
 <a5a957d0-a40c-424e-9d6d-622a4f624343@linaro.org>
 <05e15363-d49e-4a7b-82b3-0f07537b5366@kernel.org>
 <16d2e8e8-91bc-437d-8225-eb6eedb4bd8a@linaro.org>
 <f18fa22c-131c-409c-9c8b-3153e2272b89@kernel.org>
 <a35d7f95-c158-46d1-b136-b901dcfbf101@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a35d7f95-c158-46d1-b136-b901dcfbf101@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE5MiBTYWx0ZWRfXyxrHpZ6YiNb+
 gkfA+ed2Nz5iwKEXflfTPBwLEHA26yccDgd4grtBieDi+370BQewLU2spfqiGZlRGt4X5q1w4MG
 1cKzp+ihQ1lSOLmv5+8S1y9yHpFbhUbiG+tHhDrHVcq/vZ9Nak9jQHFTzb0SOksM6yYY6R7f6ZU
 p4l8vim2O3b7/dmwTH0k0lwIBCOnGRc0ZLtMIlDOxGZGDkFT5L1G6APUQpOV6N7dYCy254Nite+
 U15apJ9RjJjWOTGLmCaIJlq2oRJUXePkWPCtPlPLLUbfQRUWgiyY99vY243HvRrbdC0Puymfshc
 fjn4X+7xrnsiCbheyJlM2WAB/E+tZlzlHhjjmdpIgShjB+TirQUP7UuMdSNyTF+UVsJiUjebuCk
 HIkCFepfWzFHkyCY8pzBhdJessgmnvTv37NSqXKP9XBfd5q46eIRE+puU8l4wngBHQp1xeLECsL
 9l0WCDyaDGkcO/Ahx+A==
X-Proofpoint-ORIG-GUID: rME-zzKAIGxPgo9vfJGYOhILWvZgg-SX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE5MiBTYWx0ZWRfXxB1b22Nn24w7
 RBVHUrO87aMYSrUbbojRO8pJ+OopWn6pzPV78ZhX15pgWdlFOyfh6oAyV65GGNRPHEfkshpiQvJ
 PSac8TrXppihb1nV3/kyWy2HU3LR2g4=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a319b7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KEe7bkdQAAAA:20 a=EUspDBNiAAAA:8 a=G2-bsJ9txPRm7R4i2XwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: rME-zzKAIGxPgo9vfJGYOhILWvZgg-SX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160192



On 6/16/26 4:12 PM, Neil Armstrong wrote:
> On 6/16/26 16:59, Srinivas Kandagatla wrote:
>>
>>
>> On 6/15/26 2:54 PM, Neil Armstrong wrote:
>>> On 6/15/26 11:36, Srinivas Kandagatla wrote:
>>>> On 6/15/26 10:31 AM, Neil Armstrong wrote:
>>>>> On 6/15/26 10:38, Srinivas Kandagatla wrote:
>>>>>>
>>>>>>
>>>>>> On 6/10/26 8:41 AM, Neil Armstrong wrote:
>>>>>>> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
>>>>>>> of 2 WSA speakers connected on the WSA2 lines.
>>>>>>>
>>>>>>> But the Audioreach DSP only handles WSA2 in pair with the WSA
>>>>>>> interface by using the upper bits of the active_channels_mask
>>>>>>> for WSA2 and the lower bits for WSA:
>>>>>>>
>>>>>>> /-------------------------------------------------\
>>>>>>> | Bits  |     3    |     2    |   1     |     0   |
>>>>>>> |-------------------------------------------------|
>>>>>>> | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
>>>>>>> \-------------------------------------------------/
>>>>>>>
>>>>>> No, this is not totally correct, if the setup only has WSA2, then
>>>>>> channel 0 and 1 should be WSA2 channels.
>>>>>>
>>>>>> What is the backend dai id that is in DT, it should be
>>>>>>
>>>>>>       sound-dai = <&q6apmbedai WSA2_CODEC_DMA_RX_0>;
>>>>>>
> 
> Yeah 0xC0 for active_channels_mask and channel_mapping =
> { PCM_CHANNEL_FL, PCM_CHANNEL_FR };
> 
> I tried to keep the leading 0, but since the channel_mapping table is
> allocated with
> the size of the num_channels parameter, you can ony have 2 entries.
> 
>>
>>  From DSP docs:
>> https://github.com/AudioReach/audioreach-engine/blob/master/fwk/api/
>> modules/media_fmt_api_basic.h#L780
>>
>> Channel[i] mapping describes channel i. Each element i of the array
>> describes channel i inside the buffer where i is less than num_channels.
>> An unused channel is set to 0.
>>
>>
>> So unused channels should be set to zero, but the patch padding the
>> channels starting form zero.
> 
> My understanding in my trial and error is that the DSP will map each
> entry of the channel_mapping to the active_channels_mask bits in order
> so you can have a non linear active_channels_mask like b10101010 which
> has 4 channels active and pass a channel_mapping table with 4 entries.
> 

You are correct, I was mis-interpreting some of the comments from
modules/media_fmt_api_basic.h specially the channel map comment.

Also confirmed this internally so we are good,

I tested this on T14s,

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini


> The is what I implemented here, and it gives a lot of flexibility on how
> to connect speakers to the interface.
> 
> Neil
