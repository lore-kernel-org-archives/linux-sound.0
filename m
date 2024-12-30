Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B5152E02
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 06:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735538573; cv=none; b=UA3JD9npHQDg5El0jbKvxrA1UJKhea+zY0XmOds8OgaXlBJDmPzwvljNzDE+3KhnMom/d6K0MD97+RvmGgueNGVxqR1ZzZebqtQ4niayiWJ5lISm7gzSwqg4ANcEcPauqAjXL3tIUFP1mrZ7mOaDnodI4FXnTQD3WGDPH5iN1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735538573; c=relaxed/simple;
	bh=pwISV1s0ttT49ePKsiEIOAJIHFvhg9nojqojA6dU4oc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mSfQfossdOe79W/pzqEc0wxoXRQa/bh7l3+a+LSd+n8covcqDUQ/vi1xwTN4VKfxWjGm5F/YNPcfQ0umBxiH7v4dnuys+E4MFYepGFmD9ebtP6276Z6pVCS39n0dK1+9j+GpnRIM1U+ssdOlTO1/5MLZ9gRGrrmByKst7LD1ZC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=BeaGHZQM; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="BeaGHZQM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:To:From:Subject:MIME-Version:Date:
	Message-ID; bh=MbNvAVuCvs6zyENeYb5rB2uGRCZBbA/gg3MhdNTY9GM=; b=BeaGHZQMwbcLx7
	DZwODnu81rx235Xf+tHYSDGk+G2kZT73CON8AHgRqXS3RTaS9AwXwHEyzupE4z6KILasAF+yW4zmt
	GzMrs2WktfaiI/16cxhveOc/He2LnmBGLVX2ZlXVjTPn8MOGFJEG0D9XwLC2smt7ggFOZk+6vIAIp
	tpH2DQ/tWOmQkdS+IeFWFgxk8GznZFTBVPpDR+v/JLpygReg7cd44qPqDwNOP/Ys+bvJZI2E4tdm5
	94DT+3zjyNwkgt89F/x8fxzoxTFNkwfYJWmnUVBOMWkVN1eN72w1UR8h9ghJgMYD5M1tOZpiGPPYo
	TueCL3OBUTkGeSt3uvwA==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-0cce97f01b2d699e6) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tS8rQ-000000001zM-3cNn ;
	Mon, 30 Dec 2024 06:02:40 +0000
Received: from [220.233.184.101] (helo=[192.168.20.101])
	 by CMR-KAKADU03.i-0cce97f01b2d699e6 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tS8rQ-000000005Gy-1L4C;
	Mon, 30 Dec 2024 06:02:40 +0000
Message-ID: <bbdced52-a155-4c9c-9afd-187200fa5371@iinet.net.au>
Date: Mon, 30 Dec 2024 17:02:34 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ASoC: extra format on each DAI
From: Stephen Gordon <gordoste@iinet.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
 <20241220110133.2e8f1986@rpi5>
 <87cyhj88dp.wl-kuninori.morimoto.gx@renesas.com>
 <83a2706c-1b30-4ea4-94f9-42353f64a653@iinet.net.au>
 <86c91aa6-f185-496f-b4d4-4eea1e67fa27@iinet.net.au>
Content-Language: en-US
In-Reply-To: <86c91aa6-f185-496f-b4d4-4eea1e67fa27@iinet.net.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=WdsKaVhX c=1 sm=1 tr=0 ts=67723780 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=NEAV23lmAAAA:8 a=X4cfkUfD2AOIzgeCCQYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfGvtkznv6h82g3FXxwBe5PpZgiUwIL/ej6PxOWGswyk7dyap7GH6e9OqNUug6HMs93kXq8bzjbAHZrtHkw6WSr/eEaUecyK+UplHDFGogTLcJvSZla5Y pU5mlc3/JNv1rxtI/V0NPpQkCygWhu1ofGNaQ/GUU/jdz3m/r4CG4HCA2o7/hVNWdE4MlwAtc3mDcgIs8C9s25M6O4PytuFUoxc=
X-atmailcloud-route: unknown

On 28/12/2024 10:18 pm, Stephen Gordon wrote:
> On 27/12/2024 11:21 pm, Stephen Gordon wrote:
>> On 23/12/2024 1:01 pm, Kuninori Morimoto wrote:
>>>
>>>
>>>> [   27.333830] asoc-audio-graph-card2 soc@107c000000:sound: probe with
>>>> driver asoc-audio-graph-card2 failed with error -12
> 
> In turn, this is because the linked list of siblings is actually in 
> reverse order due to the way populate_node() (drivers/of/fdt.c) adds 
> them. 

It looks like the node order is fixed up later...
https://github.com/torvalds/linux/blob/fc033cf25e612e840e545f8d5ad2edd6ba613ed5/drivers/of/fdt.c#L330

However drivers/ot/dynamic.c uses similar node insertion code, but 
without any reordering. I guess this is what is used on my machine 
(Raspberry Pi 5) - perhaps your DT is just built differently :)

> I get a playback DAI visible in aplay, however the capture DAI is not 
> visible in arecord. If I swap the order of the codec ports in multi/ 
> ports, then I get a capture DAI visible in arecord, but the playback DAI 
> is missing :)

This was because of the playback-only and capture-only flags in my 
previous DTS. These flags are actually on the dai_link, so specifying 
this flag on a port/endpoint affects the whole link. Since I specified 
both, whichever one is processed last takes effect.

I think we should either:
- Make this a flag at the link level
	e.g. 	links = <&link0 PLAYBACK_ONLY>
or
- Document the behaviour

Anyway, once I removed those flags, the DTS works, as long as the CPU 
port is listed _last_ inside the 'multi' node. This is equivalent to a 
requirement to list the CPU port _first_ on other platforms.

gordoste@rpi5:~/i2smulti $ diff graph-working.dts graph-broken.dts
48,50c48,50
<                       port@0 { reg = <0>; link_dac: endpoint { 
remote-endpoint = <&codec_dac>;  };};
<                       port@1 { reg = <1>; link_adc: endpoint { 
remote-endpoint = <&codec_adc>;  };};
<                       port@2 { reg = <2>; link_cpu: endpoint { 
remote-endpoint = <&cpu_i2s>;    };};
---
 >                       port@0 { reg = <0>; link_cpu: endpoint { 
remote-endpoint = <&cpu_i2s>;    };};
 >                       port@1 { reg = <1>; link_dac: endpoint { 
remote-endpoint = <&codec_dac>;  };};
 >                       port@2 { reg = <2>; link_adc: endpoint { 
remote-endpoint = <&codec_adc>;  };};


Regards
Stephen
