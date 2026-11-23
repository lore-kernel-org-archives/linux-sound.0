Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431666;
	b=bbK67SY/IyjmDo2jJudd55AWVkbvPXahKbSHmnUp6qrwZFHE9suxjaD1KkpZ/XH4rYIb
	 MpcjXBEK+HF/X2/pICd8XyI/nZ7FmfZ1MbBE+YWXVscZpZcUhwvZipRqrShrl08T/CAYw
	 JpP5moJlabCn1ocxTZQsMgdZo51cie9q+zut2ON1OkrAhnF9kBNmzJXf6EXrm0rv0yY5S
	 VBeMGaTr+NJIzaVGju/VVWE2edsHrMYcQRPaj3GPuK5ZBpsrPeaKct4Gepq2LrGKYSNrS
	 KLwkGtlxkE/27B1raiUoazR3j9x7r/gO87psfvFrTplQIJPJbJv3epqSMUztHuzefZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JC2jhOO2vvGsqjSNnXq4243F8zS/Jv7fOIlQk3qsKV4=;
	b=YGm36nORhiZa+UFkCdaavSHAWhh2KqOeTdfrOAxzHdI/rh8yOiNyjHqab7DJJ7rsAlhq
	 F2P6nMIV1NlYwAVuyce1cPkdaKzJ/n4sY3o1D+DT48yv8+GocuRGnji7aaOCF7d78jhlr
	 iIA8p4wdcAUj5hWpBorXEtWNBm4+QxOJx4FXHvqdRW3ewDDxN/HX8QPEps51OUUHtvyjW
	 p7rUL7uh2hjH0MX5Vj3pYEo1ETIPpCTDRuD7sA1gZpg27zrMuPb23b6m02p2LzadmIy3a
	 2OHfA70cfqvLwM+oglO89Ix3WF4VigTTMxDaqZza0kTLogeXFkzHJE7u0MDRdAAcygA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2WEdLIW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/1ln49g";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C5606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2WEdLIW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/1ln49g
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FtHK2785551
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JC2jhOO2vvGsqjSNnXq4243F8zS/Jv7fOIlQk3qsKV4=; b=Z2WEdLIW3zWthshn
	iCy4SR/8U/qu09SNR/Mtcmzryhu/xhNSSLPE/rRbN3eAYWaP0helmj7RXT/yo0RC
	DDSFnNu6oerwBpBOZJq9a/yksOz4ri4bDZtZGmV/YQp/vTRTJGr6QpYmi1iVtg+N
	5m9FJHJOdqN1jD2Y5Cw4lpX2uxsyrnaa6/XRtuc0m2W63eR7S5AZYGgAr56h24sD
	3sjX1BDeuXkChqB/IQW7eKJSQnvep9y27Q4Jkjw2dp8ctybDUjEtyuFy1nAO8EYt
	VsOfFijue00jD0gTluGEY2LnewB9NEiaNGYVc4NeX9FM50jHQ9JYAozmDn2nDSST
	aIdPtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd12j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:01:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211604468aso49605386d6.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 03:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431659; x=1796036459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JC2jhOO2vvGsqjSNnXq4243F8zS/Jv7fOIlQk3qsKV4=;
        b=T/1ln49gWM/591JfRh6w1WgROuUxTP9mu81qOJDptFLFgwnMaHEjTu1T4b/qmw7MpN
         bkuBusU6NvMv2Z24fVuDfYsG69oVibD06hjyQCo0Q7Jo9SsYLvC+X42hSPYBEdkGs6SJ
         TMa/JRQKLGVMuqKiVkTV18CwPUUeLHCif0akCdjoDLzaGNMPF5ay8IlwsYdzbqKWWyrm
         rT/rGSnQ+Sk3IO9f6y7YLVPmNqNx6j8PVDtq/BF5qG//fOpzf85bCEBIuJ8BhF3QwjrA
         JBEgV4zEn9Scb1TW4S7r39tslQcEduyu7LWwTwKZEIhnObHthvI4TA1oXGTwK1/8+0OP
         ZXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431659; x=1796036459;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JC2jhOO2vvGsqjSNnXq4243F8zS/Jv7fOIlQk3qsKV4=;
        b=RMQhvyo37Xuv5p9OCyH0S5iZlZLRFa2NKSFHw7jrWF3ECqZhUPOPC0xa3cNaXCtoJz
         DT2ryrqW3Rqjfw2dCzbJy3psMarMUhkZdW/YxQNLSm+DDLToeuXdcwWXzcllNWKRYtgP
         6orQXXMuG7DQjFUzFdlqyaJ2bLzsAnwVghgN9AdTVsBY/HnBG7DNYc/J3JHwFpTOqh7w
         dBgMsfmHqR8ywTabtuE5ZHPAQEIShQIRZCU38nzxtnrjmNH8nDtwt6NJxwhDo5XwE8C5
         ERhZvKS1KGmJZHbpvLsjcQKmHNIgaPlAoKVnke6XAGCuCHAx4kaWrXfqGl3wFGDRzBmW
         DMxw==
X-Forwarded-Encrypted: i=1; AL+hErFKPw2kFF7WBRLXrgKFk6rLGP1NjoLmV32iaQyotlz996PUPUoSoIU2bbYsafbby4VVI3DK3ODmiAkLNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9m7kjbUCdI/j9eb/CVGMg9UWQ61kDtEF6VsVeJRwmSn9g1vCNX
	fammyYmpwcUWoee2TEAMjl5lbK5pH00TkAEUGWrH5piiLVn3SeSA8ugAUCQiHHMYHYqdm5zylWF
	58tFv5O259ODlaJYMLRJr+Q9Q5GPxA/tRIvWyqmHltM4p5T3ELVlwMSQPvozHmG0ZzQ==
X-Gm-Gg: AZFdTZdUWPmfKUEBpW51aTsbQmyXF6Tn8jpVGzYo2HO2icNiguvhM1W+3BkU6nCmdnz
	1m8JAO/E/vdRuLlmcj9vMW4ygchXLU6X2z2mMmIH48KHJaWG9yeQTDx0844mwHXgJCudVJ8o01z
	x5lQasjtx6lFmNX0iDAHEs760++Aa8n1+iuU2VPjfmQu/yFp9X+M+E2QZ3uQ5xaBpRqxxW2Zzuq
	JMb0/UcYru3H6s6viPbCO814pzd4YEzm7MRO8BM3tqn4oVVnpzejWv/HVxSkpKly411vZRMOFcH
	0SwhWXSzMpDCPG+ZJslKH+5MFywzj2nRqLiL7NfkOjurWSoTumC+ovXCm4GUbkHkiMQWEH4iV3n
	V9PZ8vXt8f0F23pUubCdv9eTQmHw9LIejky3L/uBOf1agkpbObAvICmg2qGuqfJAYXm472JKGAQ
	FeSA==
X-Received: by 2002:ac8:5d89:0:b0:55d:339e:1f90 with SMTP id d75a77b69052e-55d769f2ecbmr205715501cf.32.1795431658639;
        Mon, 23 Nov 2026 03:00:58 -0800 (PST)
X-Received: by 2002:ac8:5d89:0:b0:55d:339e:1f90 with SMTP id d75a77b69052e-55d769f2ecbmr205714531cf.32.1795431658013;
        Mon, 23 Nov 2026 03:00:58 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c513ae65965sm397106266b.23.2026.11.23.03.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:00:57 -0800 (PST)
Message-ID: <e10e701e-b478-4fe5-a62a-2365507e5d8c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:00:56 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <b3df76ad-e002-4ec0-a1a6-812d22b51432@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aMYoN5nUIlXuHzGhqfTrJQVO8zZ-2LP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX4+q5DTgSx/gt
 pT7Nr/KtQj1DCIWEM9qxAzf9pyKstbeH6BEbjJRQPVNKjJHdfXf7aDb7ybQ4z7vQTh1OCPisU2H
 94MdE1J7LI0vrtBu/u48AxMjf4bX4JkHzDLph5gNY9E72pvyUFnvcNR9bpL2IGzKTYpfdvfgqng
 0Gns3W9R9xXdqFDbjhKJakQBy7OxfaY2HNDqLZq732GyPfyWqtYn1vvC9RRR3GZfGWnGnQ7J4lR
 1r6RaL5ZrVTOmJJyu3hvqb1H/ln+Vk1fpOUUJ1sSEfUCcZYJv3zm5M1lh7G1tcBqvRaUU/AeXOS
 CGo6rH2YBMYOC6FDNYhKyc7z1bXnjsCGvNKS2utPhnp1S2g1vlOn6Qy3lHYCM7IYnhafifQOcJq
 s9Iti6EJfZ7ys5u3H4RPy1qKjdocDQazFS4ICVxNvwsk8jsnrfsQyhF1P6VyB18zFZA+04/50J3
 /rYj7vg3DOJf4cmE6bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX0NRp8YtnJXwH
 D+jSRBZptb4/UyAChQ7hMT0bYlzWcviFH3mWOGkkqQb03WI4VwVjJyx3t6tV/uxyz9Juc9W+P20
 E+gD99dayz98MUY5PfqaF7CZDysErB8=
X-Proofpoint-GUID: aMYoN5nUIlXuHzGhqfTrJQVO8zZ-2LP6
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b041cf0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ooymtJbJ3ozu6xgCZjAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

On 11/23/26 9:39 AM, Pierre-Louis Bossart wrote:
> On 11/22/26 17:14, Srinivas Kandagatla wrote:
>> Speaker protection needs the amplifiers' V/I sense capture running
>> whenever the speakers play. Putting the capture codec DAIs on the
>> playback BE link ties the two together, but the core skips codec DAIs
>> whose direction does not match the substream.
>>
>> Add a multi_direction_codecs link flag. When set, the core also calls
>> .hw_params and .hw_free on codec DAIs of the other direction, with the
>> substream direction switched to theirs for the call under pcm_mutex,
>> and sends the matching stream events so their widgets power up and
>> down. An optional multi_direction_params_fixup callback lets the
>> machine driver set the parameters for those DAIs. Links without the
>> flag are unchanged.
>>
>> Document the flag in Documentation/sound/soc/multi-direction-codecs.rst.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  Documentation/sound/soc/index.rst             |   1 +
>>  .../sound/soc/multi-direction-codecs.rst      | 156 ++++++++++++++++++
>>  include/sound/soc-dapm.h                      |   2 +
>>  include/sound/soc.h                           |   7 +
>>  sound/soc/soc-dapm.c                          |  32 ++++
>>  sound/soc/soc-pcm.c                           | 136 ++++++++++++---
>>  6 files changed, 314 insertions(+), 20 deletions(-)
>>  create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst
>>
>> diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
>> index 22878d73f7a5..62d01a0a6e52 100644
>> --- a/Documentation/sound/soc/index.rst
>> +++ b/Documentation/sound/soc/index.rst
>> @@ -18,4 +18,5 @@ The documentation is split into the following sections:-
>>     jack
>>     dpcm
>>     codec-to-codec
>> +   multi-direction-codecs
>>     usb
>> diff --git a/Documentation/sound/soc/multi-direction-codecs.rst b/Documentation/sound/soc/multi-direction-codecs.rst
>> new file mode 100644
>> index 000000000000..2af61598dd7b
>> --- /dev/null
>> +++ b/Documentation/sound/soc/multi-direction-codecs.rst
>> @@ -0,0 +1,156 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +===========================
>> +Multi-direction codec DAIs
>> +===========================
>> +
>> +Overview
>> +========
>> +
>> +An ASoC backend (BE) link that bundles **codec DAIs of both directions**
>> +on a **single-direction CPU DAI** can set
>> +``snd_soc_dai_link.multi_direction_codecs`` to tell the ASoC core to
>> +call ``.hw_params`` / ``.hw_free`` on opposite-direction codec DAIs with
>> +their own direction, instead of skipping them.
>> +
>> +Typical use case: a smart-amp speaker protection link where the CPU
>> +side is a playback-only DMA (e.g. ``WSA_CODEC_DMA_RX_0`` on Qualcomm
>> +AudioReach), but the codec side exposes both a playback SPKR DAI and a
>> +companion capture V/I-sense DAI on the same SoundWire bus.  Opening the
>> +playback FE should bring up both the amplifier output chain *and* its
>> +V/I feedback capture chain atomically, without userspace having to open
>> +a secondary PCM.
> 
> This is a valid use case that has been problematic for some time on
> other platform as well.
> 
> What puzzles me in your approach is that the codec-side will be
> configured/started, but *something* will need to grab/process the
> feedback IV data generated by the codec DAI. That part seems to be
> completely hidden in your approach, is this intentional? How would a
> capture DAI be configured on the CPU side so that the data is provided

In this setup there is no capture codec cpu dai. The capture data is
never seen by the userspace. VI Feeback data is directly feed into
Speaker Protection module within the DSP using the codec-to-codec setup.


Host only drives the playback data and the VI feedback path is entirely
with-in the DSP.

> to a DSP? Some of the patches, e.g. 11/24, mention a capture dai but I
> can't connect the dots with the suggested codec-dai changes.
> 
> In addition the feedback loop can be made of not only I/V sense but may
> also carry an echo reference, and that may have to go all the way to
> userspace depending on where the processing is handled, possibly with a
> split between IV sense and echo reference making the topology even more
> complex.

multi_direction_flag is really agnostic to driving data(VI or echo
reference)
All this flag is doing is setting up the codec which are configured in
opposite direction.


> 
> And last the SoundWire core exposes a concept of 'stream' that is single
> direction, and so far we've used a 1:1 mapping between dailinks and
> streams. If part of the dailink is dual-direction, don't we have a
> problem on the SoundWire side?

04 patch addresses this, we create two separate runtime streams per
direction instead of one.


--srini
> 
> 

