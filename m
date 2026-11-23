Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469908;
	b=LVZAu5GZHqtlDxRkNPhfFKVvdK8biRFf0bvUJ4Fj+aajfDFxshFpF9rlScevJ8VZQ+s4
	 zTEHQ5FgT5DfGJUG5PCMPgePj6N1GER1lNnxl9IaXTUX/6cBmfScTy+/bOA1mnxdInbJA
	 606yfS7FukpWY4B5snn0+zeCqVhlVJA2/sEaAO/I4N39f/cjy9PDpHmXncRxpkYuiKMuU
	 FnxgTWPP5/A3TbqwRGb/OLlEER1DLy/0ZZYxYomggmo1uQQY7XvAxF3RW0h14YokGKVSa
	 q7QSePpN7aPq4eBVAvnwAE2AF1xFpaOc5iVjiX/G8irty+KrCENeY0DQisZqlZy1fnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=;
	b=PxQGLR9i9n/XBDKuzP40lwPHX2NivdFP35jYAJCXGN93An6LTLOyvA+bDfUodOD8diwE
	 DMFyWVud881jOZcCn6fKuDnVDOzb7cgyOC3N1MGapS2C6NQ9ubfxqddJSWSF4/1YC8/a8
	 zGbzjfwlum5B3kLlNKNK7VbHRQNWEaqRg6bT+Mc62VkeLMVprEE3vkPf/sxj5uaIlNhe+
	 NqBpkIabel4Q33k090v6lR8DK9Ru4YcO+O4eYp2BlAv5r73iB3e4dhkkp1b36wAR+Uh96
	 LWzq+CT3N5Rg7Bdf6Ob0ZSATKBknPOc0+B+kfQ5La+NgShMfl0hI0NMI1JYbG8VLdMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FsuiRv9o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8oq38co;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8151606A32C
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 21:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8151606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FsuiRv9o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8oq38co
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANLH2Hb3502830
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 21:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=; b=FsuiRv9o4rhbb/eZ
	HTPrneLisp2RJQ85EXK03rswce86Q4Be6kd1F4XCcmeT6DHwdJzB9XsWeecROHPx
	xmoLR/ZJHKGrq18HJmoQ/Vs+9oVt/3awl44teU4CR/k2NyAPkoXPhemZ97gziAcq
	ZfrsAtVicPbiX89pKR9eXpCZKlPNtodlTs1cs+LSPYpqg7N6+2kiHhKdpL5EoM0S
	oW0CCYnu0ki202EbslNhFb251Gpz4EI/bQGbXZtPhgv1T9hy2Hh4owtQ7M8bLJ6E
	eu76rb1r7Phzb5tf8XwxiP8w/rn9lwK8+38707ZLdwB8fWdWjIf3YWoAjeoa+z2/
	+IAT6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nrjbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 21:38:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so413383585a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 13:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469906; x=1796074706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=;
        b=D8oq38coSHRufd1WNPxgFyTGlyy/6xCyRV18IKo3vJ3sYSAFK1X00+7+5SYsQaZgwE
         H5RPQZiNd0zW6mzELCX9l8cdWiHQqi61SscsV+DGWD2YFhyjHi+JxW0mUbj1/K4FsT9U
         reWqKgQRu8Xu+SvpaUoLQBWBvHr9UBqpN7aSlRce3ZQ1UuSQR+mmerht+iI8RyTfK+J3
         XhyvRfIwkvxR7ctQSd4sXczkbnAUA9tork/nz3IxAuWEmv7qVd5bCL4QxNwNGoKBh5aQ
         UKRmOVHX0CYJAP/gZtEtPOwSiSAvKcalQ9s+eKQ0We+qntgNHPSsSixiQBQX2g8tR4m5
         5t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469906; x=1796074706;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOChf5ei6tKRsrDOrdmMbxP5In6X9pQ9ViAmnYuG8k0=;
        b=Sfq6bn3JNRbeh0eFgpWXW7dAuRtBbHcPYyy8UxEY5K/9+8lLhQMxY/kP+z1WwQwcR8
         48oYDFjiC1qQpX+eScLQm+kihcEQdkrmbYrNqBYeYDDJdbASl3zj992xcdL4NA6lwycE
         mgrdP4um/6KdbG4qeAi9byOT7gnK3oRiezhU3w4Q9ev+uD2gr2bgFhznAK/QOcI5DD1c
         dy6m3mn23atV0ctWmxBTEimUQvUJMpvNwoOU4wmLw715TCjbXo2tuXnIcrExW7mmOiFx
         zu7tfQV6e6kAc4/qcBqBCKNYX9bobkVMXLtxjhP51eliVwk1vuVkjrN0K+ih/YAZ0A3x
         W1jw==
X-Forwarded-Encrypted: i=1; AL+hErGNYDTAq4mpoMYJzDzS5ClO67OmYcjQYIns3D2kBSY877c0cST1GPKk9IctVhVln3OgicNUomH0zyaiUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/OS2iv1bTCfuHOdfD2UYv/fJ6E56Fdk7ocSuD/EmacGtK6eFC5
	pR4vO1lB6+FMEMSBu0af6IqlbxGdUPPu5z3aO91W+Yq3ES8Xa/bZhnenF+CwjMSYRRPG12DV4AZ
	5x2C7W3swNyxMyb6cFxL/mFv4P3KgkE7ziKEx2UCvEjAQZxlRJUSshcMT34JkAB/LP/6gZheeYQ
	==
X-Gm-Gg: AZFdTZfdGOcTyc5BGlM4g+9mEPiEtswG7nh5bQojW3efSVWeTd5tTT+X1IuKSTbVVAh
	yb5SPCWb1uj7Sia6WJaUP1WTv7zNc7HV2jONZjlO/MgvkjXV2HhJbOfE5BMGot89Ubc55ISC92/
	hpK2Vc4pr22OK5ZqzuIRu6cx1HdCtnzwCyRFcIqDrgQwcF6Nijfzc1QrLF1DtlEF3yB+HY92Yc0
	yq3EtDbIaykTYdOxAnH0lD5PvgHSex4zCH9IfsFiiZNyG7VoQeH5yZGxScKUAn2De4LN/5WhCWg
	iFMzXpuEBr5i6aXVYZKk9WNjGFyfOIrRz1LsxSgw9Ghej7bP4DxF4XgDzusRMjNykXXBgzmt7yr
	bxRewEiQiMLVmgu4WLJ4DmNZBYrW9yeYP/jTC3tizYtWahcPQ333cTGjBcd6PZwgiiPL11GNtlH
	zV7g==
X-Received: by 2002:a05:620a:4714:b0:949:60f3:1cdc with SMTP id af79cd13be357-949ba8260e7mr2404865785a.10.1795469905812;
        Mon, 23 Nov 2026 13:38:25 -0800 (PST)
X-Received: by 2002:a05:620a:4714:b0:949:60f3:1cdc with SMTP id af79cd13be357-949ba8260e7mr2404861085a.10.1795469905307;
        Mon, 23 Nov 2026 13:38:25 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm25478791f8f.57.2026.11.23.13.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:38:24 -0800 (PST)
Message-ID: <f7de8841-1345-4360-838e-d2b67e9a4b6e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 21:38:23 +0000
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
Subject: Re: [PATCH v2 02/24] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-3-srinivas.kandagatla@oss.qualcomm.com>
 <b3df76ad-e002-4ec0-a1a6-812d22b51432@linux.dev>
 <e10e701e-b478-4fe5-a62a-2365507e5d8c@oss.qualcomm.com>
 <062359fb-c169-4253-aade-07cba63a279e@linux.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <062359fb-c169-4253-aade-07cba63a279e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX3yf2w1iRe+2c
 sHSDdaqaujvdgiYcZ59lXjsGnjIC8elrYWWUv5zRvzzrEAVsAXjQRskpkFbrLacMhxK9SWElhNc
 BHF0ivjBVYUT5dAkzgb7SBdlF3KQOUOBP3VvKOb0vyRlHgDtwH7drmrQOD/ytJwsexZDazqIcCH
 w3ePFp6jyTllcPoMiYyjUm9VJdRrxKgQztFRgSGgEbpEgsmk91+lUevKqqoNrRkZRDY0Q/I99Qj
 T85WrFdxodhPNU1ru65vhWqeGU9BzLEZhflE+LHXziLp+GpLXh+WlZsFsQxTdekRUxPn0BxY+B6
 g9E7zwySpkiTbkMLQ1kI+ufLHEdbmonUCq2XYiBI2hG50ZiX9J1te7R94JutUFh9My3fLbwwU0V
 erf1LopqbKydgr6ESKYKx68ZrrA94ra7eX2kvvkrUqxsmx0/fCU456bvlOX8jFHytkUsLh0sun+
 rW2CMslYMDGBtzUbUPA==
X-Proofpoint-GUID: oVdnGRUejgGpHh4mD2OqfDTPoFfZ5KRi
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b04b252 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=0Tsbpnv760q_-0Te3r8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: oVdnGRUejgGpHh4mD2OqfDTPoFfZ5KRi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX8emf0Pe9e46h
 dUC0EmVd2XtJPfZcL13Xf2qCQPESgUY6/9UKXwhvj6JyXaUYQ3X7S8v/jOTIxLJvGhTwMhv1jW+
 kWMvqGHDx4sx4ay6b4UXcFWjnCLDHcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086

On 11/23/26 1:58 PM, Pierre-Louis Bossart wrote:
> 
>>>> +Typical use case: a smart-amp speaker protection link where the CPU
>>>> +side is a playback-only DMA (e.g. ``WSA_CODEC_DMA_RX_0`` on Qualcomm
>>>> +AudioReach), but the codec side exposes both a playback SPKR DAI and a
>>>> +companion capture V/I-sense DAI on the same SoundWire bus.  Opening the
>>>> +playback FE should bring up both the amplifier output chain *and* its
>>>> +V/I feedback capture chain atomically, without userspace having to open
>>>> +a secondary PCM.
>>>
>>> This is a valid use case that has been problematic for some time on
>>> other platform as well.
>>>
>>> What puzzles me in your approach is that the codec-side will be
>>> configured/started, but *something* will need to grab/process the
>>> feedback IV data generated by the codec DAI. That part seems to be
>>> completely hidden in your approach, is this intentional? How would a
>>> capture DAI be configured on the CPU side so that the data is provided
>>
>> In this setup there is no capture codec cpu dai. The capture data is
>> never seen by the userspace. VI Feeback data is directly feed into
>> Speaker Protection module within the DSP using the codec-to-codec setup.
> 
> Humm, even if there's no user-space visibility, don't you have a
> SoundWire capture port? How would that be configured? At the very least
> it should be prepared and enabled.
> 
>> Host only drives the playback data and the VI feedback path is entirely
>> with-in the DSP.
>>
>>> to a DSP? Some of the patches, e.g. 11/24, mention a capture dai but I
>>> can't connect the dots with the suggested codec-dai changes.
>>>
>>> In addition the feedback loop can be made of not only I/V sense but may
>>> also carry an echo reference, and that may have to go all the way to
>>> userspace depending on where the processing is handled, possibly with a
>>> split between IV sense and echo reference making the topology even more
>>> complex.
>>
>> multi_direction_flag is really agnostic to driving data(VI or echo
>> reference)
>> All this flag is doing is setting up the codec which are configured in
>> opposite direction.
> 
> but the configuration of the capture part is missing entirely, no?
> 
>>> And last the SoundWire core exposes a concept of 'stream' that is single
>>> direction, and so far we've used a 1:1 mapping between dailinks and
>>> streams. If part of the dailink is dual-direction, don't we have a
>>> problem on the SoundWire side?
>>
>> 04 patch addresses this, we create two separate runtime streams per
>> direction instead of one.
> ok, that should be made clearer in the introduction, which mentions
> codec dais but omits the gory details of SoundWire management.
> 
> I have mixed feelings about having 2 streams. It 'works' but it's not
> optimal. Maybe it's time to revisit and extend this concept to deal with
> data that's closely related to the regular PCM data but flowing to
> another direction and used for a specific purpose.
> 
> There's the case of the IV sense, but also the companion amp which may
> require a device-to-device communication scheme. It would be much better
> if all the prepare was done in one shot for all the direction/ports used
> for a given use case, and likewise the enable should be done with a
> single bank switch. Not to mention that this sort of solution should be
> handled at the SoundWire core level, so that we don't have to implement
> this dual-stream implementation for every platform.
I agree, with the Idea, I can send some RFC this week. However this
series is already a 24 patch series and I do not want to keep adding
dependencies to it. This series can get reviewed as it is. In the mean
time I will send out some patches for this new soundwire multi stream
api for discussion which might need broader discussion.

--srini
