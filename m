Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F4357CE4
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 05:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824757; cv=none; b=U42F8k23sc5ThS0U2mLB4T/FrXNtA+VxOT021eIGnfx+JzOgHjnJ6La0KPlUYOZlmgaiG4Dp4IKS2Gv8UvkO6ivNbms8ZW1gUAJKn4pM1LPV1PUQZXwDncBXXlq75bf4zpelzhqJMDInOq219LJvUFXis2lWjr0tlYi/74CpHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824757; c=relaxed/simple;
	bh=P8XxsSG4PrQQTgL9KXKqHBOZNK5vJeXztxFNcKrFCjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj48F+V86qf+KqUJm5ss7zsmuztr8Tz0IbzwddJ5CqO1l7gJCIqAdWn/ljGlSie+ZZ7kzvdJZmNS3MCwl6KSfq2jLt/JtkGsIy94ByilkxJvMI2ELqrzeqoKey4ixo6gT259FlkAkaP+wFalYsSVmrofk4SsKg17stobzNyi/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=m+3tdlNB; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="m+3tdlNB"
Message-ID: <553e6031-9705-48d3-8831-da49b3c67d01@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778824752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcbbKAauqLHrwrsU21xAHlDi007yjCzKPdqp77G5WUk=;
	b=m+3tdlNBtnlGSfs2YX760LbYaAibrXgh0Sbn8aN8vPsVOieI5jrX0Dcl7syVR3+St+BO0n
	h2dsHvr6YtsCr46eyJ0BfN1OTwZEf1gIbaEomRo+mtANggCqn6o5lRilX4kYeGj73VV9ji
	QmHbuwfYHub+T7blg2qTxYc9GnYPZcDCJ6ZyjPZpv6ZF+MuXNPWRHuQAYjdRVLPnbWrmVw
	sXW/sQkj1yNd5qMcC3Jx4qzRVsx8GI6mpklnE8/d7c9fRzoMkTS2n/uQ0sgQjAeLGRo/of
	drlo0jxNiafIlT8zXXwLjhYtjD+m+JiOoM5JAxFEvcyL9SIx7QxI8qGsSGJJ6Q==
Date: Fri, 15 May 2026 02:59:03 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Richard Acayan <mailingradian@gmail.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org> <afU9FQnWKgRtV6mW@rdacayan>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <afU9FQnWKgRtV6mW@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 5/1/26 8:53 PM, Richard Acayan wrote:
> On Fri, May 01, 2026 at 04:27:57PM +0100, Alexey Klimov wrote:
>> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
>>> Hi,
>>>
>>> There seems to be a race condition in q6asm when stopping the stream
>>> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
>>> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
>>> ADSP. If userspace decides to prepare the stream again in
>>> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
>>> memory-mapped region appears to still be in use and fails to map again.
>>>
>>> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
>>> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
>>> need to verify. On sdm670, we are coping downstream by keeping the state
>>> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
Are we sure that's only a workaround and not the correct solution?
Thank you for mentioning it, in any case!
>> Do you have a reproducer or specific steps to test/reproduce the issue?
> I don't really have an easy way to reproduce. On a device with a
> Qualcomm SoC and q6asm, running postmarketOS with Phosh and without the
> workaround, waiting a few hours usually reproduces it.

I haven't seen this happen "randomly".. at least not with PulseAudio, 
but after switching to PipeWire and properly configuring phone calls(*) 
on my phone (sm7325-motorola-dubai) I have encountered what I think is 
the exact same issue many times while doing this simple sequence:

- boot phone, playback and recording work fine
- start a phone call, cancel when hearing dial tone (Wireplumber has 
switched UCM profile to VoiceCall and then back to HiFi)
- try to record mic sound (using the GNOME sound recorder app or 
whatever else)

Actually just now I managed to hit this right after reboot, without any 
calls..!

So it might just be "try to record audio through PipeWire and you'll hit 
it quickly enough".


(*) using the current infamous q6voice patchset, Wireplumber's script to 
switch between HiFi/VoiceCall, and a better setup for starting the dummy 
streams exposed by q6voice: 
https://gitlab.postmarketos.org/postmarketOS/q6voiced/-/work_items/3#note_553107

The log is usually something like this:

kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: 
Buffer already allocated
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: cmd 
= 0x10db4 returned error = 0x9
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: DSP 
returned error[9]
pipewire[5347]: [E][02:30:35.781627] spa.alsa     | [ alsa-pcm.c: 2722 
do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
pipewire[5347]: [W][02:30:35.781714] spa.alsa     | [ alsa-pcm.c: 2885 
get_avail()] hw:Motoroladubai,2c: (0 suppressed) snd_pcm_avail after 
recover: File desc>
pipewire[5347]: [E][02:30:35.781771] spa.alsa     | [ alsa-pcm.c: 2832 
alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
pipewire[5347]: [E][02:30:35.781801] spa.alsa     | [ alsa-pcm.c: 2722 
do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
pipewire[5347]: [E][02:30:35.781821] spa.alsa     | [ alsa-pcm.c: 2832 
alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
pipewire[5347]: [E][02:30:35.781837] spa.alsa     | [ alsa-pcm.c: 2722 
do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
pipewire[5347]: [E][02:30:35.786869] spa.alsa     | [ alsa-pcm.c: 2832 
alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
pipewire[5347]: [E][02:30:35.786949] spa.alsa     | [ alsa-pcm.c: 2722 
do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: 
q6asm_dai_prepare: q6asm_open_write failed
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: ASoC 
error (-22): at snd_soc_pcm_component_prepare() on 
3700000.remoteproc:glink-edge:apr:servi>
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: 
q6asm_dai_prepare: private data null or audio client freed
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: ASoC 
error (-22): at snd_soc_pcm_component_prepare() on 
3700000.remoteproc:glink-edge:apr:servi>
kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: 
q6asm_dai_prepare: private data null or audio client freed
…

"Buffer already allocated", error 9 which is ADSP_EALREADY, so the state 
is desynchronized.


Thanks,
~val

