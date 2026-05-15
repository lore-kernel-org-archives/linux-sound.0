Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD203E3DBE
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836956; cv=none; b=FefylghCeXsWyDMYcC1jeKpoDGu9AIXMl7e7sZmUyd7/Maz+TalONrx+ou1jHxybVYra/c5d3Eb1wUdcvXTLNnutNvcwK3GoKGUKjp5zbNkF5/HVfM4Bu3Q/NOVdGUeNSXuF/hiPAdZZuiHKWJzXPwuK6o9jpONRCmQ5cJa4sCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836956; c=relaxed/simple;
	bh=hF4eh7PcA0A1Lv3JKlJ8+3wozC/fVumc25/5SGMDYl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDhMq0BeErGRQ81di+uOVoiKdBZehNPi/XFTiMy8djfANO9JODoMwHSCRaoJJ7OV2mKFwCbI0m+SwI5jeq9NGUYipe3FOAqsOYy19GT0hh7AuVPZRqmCQ5fxU3odL0x6ycCOS2X59hSuuBp+BpFqLqCCRpd+S8LOlAJ9kPGhuKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVg+AjF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ie5XLB07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVg+AjF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ie5XLB07"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5M0F83200291
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut9Rue+O79MhAWlyTZLlQHEgaFO1L9dTJk5rA6FaSjA=; b=VVg+AjF4uTbozmyn
	tXlHTBj14BIHKMspvS4qkRXlQyRuNBF5IhPp6UKV3dbFnJ1aNpOrVsBnd+uSyW0l
	a4NLvuhLgQWITViBg2WdL/5S3qIZFjQjWiiS4NP48v9/je+mD4w25WS84V2H+c0G
	X7OD0lMYjgQZLRjdOxJCZY1ZE8688GccFqhkMTxsBtvhntIg1TheKcOBrw6lQuMO
	Ock5RUOJtKkHaVGmEh0eaeCOncNJ3yQAAWlzHNPGnpqCUAT+CKLS+8hTu91ZOhAG
	7J3mrd25im1WpFeXg4Z6brBH6VIp4oxLJ2vUsMmDRGKOe6v9l+UZxuWQwORyKRQk
	8d8jBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtjkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:22:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514551d5f2aso247279631cf.2
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836953; x=1779441753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ut9Rue+O79MhAWlyTZLlQHEgaFO1L9dTJk5rA6FaSjA=;
        b=Ie5XLB07RCUrdOU6qPnamQp2umr0P295+EG758HFC8o6A28oPReRBKIp9Vlea+fj+W
         5JJXuOLtatlAz3B+SsimZD6F/99La0F/0zF6PX3SVN7N6oP0WsxXivD2RM0Dp9sNztaZ
         QwEc6aRt+yhyeZnt1vTC5PpIDSQYt//MMsHeKqIih08eN0Pe4u6zmZPqmRN4uUnewP0j
         AEVuY9NvzPmNAP/+Z4HG29NjGZfIEiNZXxg0pGn29pjMwlslu/EPc3AW9tud5GytkU3L
         A5+WtiK/AHa/Uy2NSrBtWg9bUccOjAEO6DaQDIlKbpEGJAI8YFpOdhYfKNRFR4opkTnP
         9ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836953; x=1779441753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut9Rue+O79MhAWlyTZLlQHEgaFO1L9dTJk5rA6FaSjA=;
        b=LM+NsXDVnHhRw9pDYmq3lg9FS1vEwwB5EFasZqTugeYVPpos+G7fmxJs6ss27O7+4K
         NXqSZ/v4GGfmiX6JC9BO5Fdu+x9+WrwELKWJxo3eh1NR1+ZHnehp0cfK/mm4Gld00V/v
         623bEt6ZWz15NcRr5jdprJE3mYVfkA1PJZRVbCfAoXkwioZ1GPqk0b86ZZpqHOIv/POE
         FHO4mAtbuXdqEUCQnOwhmao7Y67281JvQ0lwzuL+0fKraLd5jOy5/4BcgD1TTKYyD0RA
         YC/lzwXbHuVZ9pE/uGCDY9XtFMXnl6qOd95KHKu1hEOYz9vZlfOWmfwEON4FQNtMDjqs
         DKRA==
X-Forwarded-Encrypted: i=1; AFNElJ9BZa/W/nnurYa5CINVsjk4OHZi9u1AFn1J5DDMfAbyKYG1jA27D0BWbtjDbKuHfYOJVYOKYD9GaxHhcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VnsKigUl/c1q9RVafT0038LGjV6jjtRQ7ZewQ747OAiextbO
	xr9kV+kxCFG/660TKN7vBTCtVJv0vkxKZXmuER9vqLVs7cfyFqzV/LVubDT+86MRWGFVa+YYGWG
	fo3rDSEv55mckQCNV6K1Gli2bkC0S70ltPyG86ogLs1SQHVzVFLVHWDAfJuP2nuhIUg==
X-Gm-Gg: Acq92OFX7QsaoGMJlmLIGWaUtTYD+L5/oo7bL0ubYt5YLq6lbd8yerxBcURkB87o4p3
	yAepnwIsrTtPNuQ2f0P4I7K1pYgR4a0k9NmBeMf/zYHtcZLkvBmqARtNKjM5DJzVznvjaKr73Sg
	DFEgHsz/bBlirWesLLfNT8tre7e9NPzeDBYzmbM6I9he1QH2lg3yENXyYk8TouVNfG1FJ+DDv7f
	SyLG0hTAsLyH7y4xB9jpEs1etCurEHfxCcuhVX8r1C1eMWh9E7bmamVXc2EpT8eo3lbuHx/z/hJ
	/6jvnq2ccvAuAeHjOMwClyCwFuN8VyLO/QzKY7qR4ZxHadSh6FXN0tqJfRJAqGg4+3/4M77NiLw
	XSRlweGrYM8ki8om3r8m3Q84mh4tFmPUjEuZ7r8t3CaTEPTFq
X-Received: by 2002:a05:622a:30f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-5165a02c2b1mr43772721cf.23.1778836952972;
        Fri, 15 May 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:622a:30f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-5165a02c2b1mr43772231cf.23.1778836952311;
        Fri, 15 May 2026 02:22:32 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm87785005e9.6.2026.05.15.02.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:22:31 -0700 (PDT)
Message-ID: <16951a6b-0f5a-4777-ad70-8a70ac4060dd@oss.qualcomm.com>
Date: Fri, 15 May 2026 09:22:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Val Packett <val@packett.cool>, Richard Acayan <mailingradian@gmail.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook
 <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org> <afU9FQnWKgRtV6mW@rdacayan>
 <553e6031-9705-48d3-8831-da49b3c67d01@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <553e6031-9705-48d3-8831-da49b3c67d01@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06e5da cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Gbw9aFdXAAAA:8 a=xBXWW545i7Fg7s4S6_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 898YQlZT-66MsRrDvoLJXF7tdZIxYXbr
X-Proofpoint-ORIG-GUID: 898YQlZT-66MsRrDvoLJXF7tdZIxYXbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NCBTYWx0ZWRfX9SQjo2L8tD0O
 eMJ791ayPI2KXqjA5P8VWKdznhXKbfMDQrHB4Y+1ywXb6KWHBMRrEAg1KRSQWtM4GijVxYn0k3v
 AdMc/lLWMsawiH+hDkqjI4lYSTPqwEWXDwzr+od8dxXsF2VC3uIjNd4UrWKqEIIhGNxIDxNuaBN
 iuX7BQ8twcfnaGJL0uJ2Olrld1Oel4jSc1irIVwdW5bc35rTbodrsav/n9+nKGKGc+r8v4QEafs
 8Cys2Tr6Pv14Z4SpoyZDinNe2SVYMQUTQbzoM1qpZUf+eIqjO8Q/2GdfeSGvi6t1vM7qpc1beSw
 QnT86jdGIybk6AthhilmEvjH+1XB2ICR6CSvYNm05jIzN6UX7SJ0PxU6TnJwLVJVECfAySP/rye
 DuyrMqyOUI0NgPTWe9qcMpx+u9MqDOG0IImCnjknre10/rGg2WQkQWvL9YfgIcFuFqYyIV3BNIn
 /FfjC8yetqYTkFBQUFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150094



On 5/15/26 5:59 AM, Val Packett wrote:
> Hi,
> 
> On 5/1/26 8:53 PM, Richard Acayan wrote:
>> On Fri, May 01, 2026 at 04:27:57PM +0100, Alexey Klimov wrote:
>>> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
>>>> Hi,
>>>>
>>>> There seems to be a race condition in q6asm when stopping the stream
>>>> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
>>>> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
>>>> ADSP. If userspace decides to prepare the stream again in
>>>> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
>>>> memory-mapped region appears to still be in use and fails to map again.
>>>>
>>>> I believe this race was observed since commit 81c53b52de21 ("ASoC:
>>>> qcom:
>>>> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
>>>> need to verify. On sdm670, we are coping downstream by keeping the
>>>> state
>>>> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
> Are we sure that's only a workaround and not the correct solution?
> Thank you for mentioning it, in any case!
>>> Do you have a reproducer or specific steps to test/reproduce the issue?
>> I don't really have an easy way to reproduce. On a device with a
>> Qualcomm SoC and q6asm, running postmarketOS with Phosh and without the
>> workaround, waiting a few hours usually reproduces it.
> 
> I haven't seen this happen "randomly".. at least not with PulseAudio,
> but after switching to PipeWire and properly configuring phone calls(*)
> on my phone (sm7325-motorola-dubai) I have encountered what I think is
> the exact same issue many times while doing this simple sequence:
> 
> - boot phone, playback and recording work fine
> - start a phone call, cancel when hearing dial tone (Wireplumber has
> switched UCM profile to VoiceCall and then back to HiFi)
> - try to record mic sound (using the GNOME sound recorder app or
> whatever else)
> 
> Actually just now I managed to hit this right after reboot, without any
> calls..!
> 
> So it might just be "try to record audio through PipeWire and you'll hit
> it quickly enough".
> 
> 
> (*) using the current infamous q6voice patchset, Wireplumber's script to
> switch between HiFi/VoiceCall, and a better setup for starting the dummy
> streams exposed by q6voice: https://gitlab.postmarketos.org/
> postmarketOS/q6voiced/-/work_items/3#note_553107
> 
> The log is usually something like this:
> 
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> Buffer already allocated
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: cmd
> = 0x10db4 returned error = 0x9
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: DSP
> returned error[9]


this suggests that we are opening a capture stream that is already open.
Somehow the driver seems to not doing the correct check and closing it
or returning an error when try to open an existing stream.

I will run some tests and let you know if I fund anything interesting.
But in the mean time if you can find a way to reproduce this issue,
please share.


--srini

> pipewire[5347]: [E][02:30:35.781627] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> pipewire[5347]: [W][02:30:35.781714] spa.alsa     | [ alsa-pcm.c: 2885
> get_avail()] hw:Motoroladubai,2c: (0 suppressed) snd_pcm_avail after
> recover: File desc>
> pipewire[5347]: [E][02:30:35.781771] spa.alsa     | [ alsa-pcm.c: 2832
> alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
> pipewire[5347]: [E][02:30:35.781801] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> pipewire[5347]: [E][02:30:35.781821] spa.alsa     | [ alsa-pcm.c: 2832
> alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
> pipewire[5347]: [E][02:30:35.781837] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> pipewire[5347]: [E][02:30:35.786869] spa.alsa     | [ alsa-pcm.c: 2832
> alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
> pipewire[5347]: [E][02:30:35.786949] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> q6asm_dai_prepare: q6asm_open_write failed
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: ASoC
> error (-22): at snd_soc_pcm_component_prepare() on
> 3700000.remoteproc:glink-edge:apr:servi>
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> q6asm_dai_prepare: private data null or audio client freed
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: ASoC
> error (-22): at snd_soc_pcm_component_prepare() on
> 3700000.remoteproc:glink-edge:apr:servi>
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> q6asm_dai_prepare: private data null or audio client freed
> …
> 
> "Buffer already allocated", error 9 which is ADSP_EALREADY, so the state
> is desynchronized.
> 
> 
> Thanks,
> ~val
> 

