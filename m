Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A836B640
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 01:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733968458; cv=none; b=FtiAaFTsST5y/TcfK5ife1DfURa3jjAKT/Qg+MHUpbYCkv0pb5CEt6Cr623CalxA6lenL9azOfhsdmboJRQmIYykPSehzUP7LIa5Hx5WJ+mRLXjht448VZ3fbHUHU6iBWp8g9UR9VxgvwgA0adLy5dbfBkrdaX+G3a1BpROY5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733968458; c=relaxed/simple;
	bh=jJblxjVH1KfsV+i3nlMNPVdNtuY/1DY+6oUGKfvmBCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajwwwEbhFIv83nFoaMAfTHkkQssBnnx2iwnoNmNyVIvORBgtK27gAEDtA72TomOgPd5VwfwzvygePFpHwUpuP6NyvXut7+0en5iNKeup5qcU/SN47vgAb9EWMBv69/0Ml5eQ3F78lgOhyQhT8TwnGv1MwYoJ/cMvpzvZQS1FvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=RuF2JvMA; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="RuF2JvMA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:From:To:Subject:MIME-Version:Date:
	Message-ID; bh=jv1XeEngyvM0mGuu+VgYO1aoqcP0ir2wpkQLXNaoU5g=; b=RuF2JvMAfqNckK
	HTJcvxNM6MYHDQstMQzSjV6cqEG0QqoPEBxxNbH9BHdn8vsC3SD39AMLAcSCie9Iwtn/0EdMwd6T2
	kkyc9vE4Ol0B8UjpJJO/r/OUCU5a9XBldcH0KtPH20qIvqTR5HMabksFsntq72c1nW98EcUPd5fYF
	ckx0xYbGSnq2/Txqs9tDnLvmPM1ZmiMf0Az7Wf4mUYDZQ7vmE7swZBaHUrAmzxhjTHwy8j+426aBn
	eE/P32q3q2sSHzXLVzZ5Xl0IQLBxla+bXb9Qk+RHB/5fJiX/TRprKtaP3LjFFVMKB8QS39oRBDtZt
	xXOcsE7x38ouGw03GTGw==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08bfa4c5bdedaf3a1) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tLYP0-0000000080Q-3ndq ;
	Thu, 12 Dec 2024 01:54:06 +0000
Received: from [220.233.184.101] (helo=[192.168.20.106])
	 by CMR-KAKADU03.i-08bfa4c5bdedaf3a1 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tLYP0-000000001I3-0aOc;
	Thu, 12 Dec 2024 01:54:06 +0000
Message-ID: <e17b11ac-bd78-42e0-8fd9-272fb5a41bbe@iinet.net.au>
Date: Thu, 12 Dec 2024 12:54:01 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
 <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
 <cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
 <c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
 <3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
 <20241207125222.7aeedbf6@rpi5>
 <878qspobvg.wl-kuninori.morimoto.gx@renesas.com>
 <20241209231258.22f3902f@rpi5>
 <87o71kjm66.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <87o71kjm66.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=AvHo3v9P c=1 sm=1 tr=0 ts=675a423e a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=YFmsfNhnNyMbrLlGOXAA:9 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfC41gidBKDSUR+6fnjXGKo0OdMwUHqSz0ou7ElIixsI9dalb6g8SU3B8WcF1ybd/ddv+b/NSAr/QNlfeGv66hRmHG+7fvxsGC4LisseryiQcgb9x+7Lc Qk0GRS0YwhwqJGLwtw95U9QS4N6zCIKycp+9AvotIiWTX5cf5IaOuF+aRJ2clKEDxu55oFNIwBzbzKm1MMVLUCGBJMreiAhdBVo=
X-atmailcloud-route: unknown

>  From "Sound Card" point of view, setup directly Bx_Fx base instead of
> CBx_CFx base is not a big deal. But if we do it, we need to have such
> setting for each DAI, instead of common dai_link.
> 
> Now dai_link->dai_fmt is including 4 type of info
> 
> 	1. DAI hardware audio formats
> 	2. DAI Clock gating
> 	3. DAI hardware signal polarity
> 	4. DAI hardware clock providers/consumers
> 
> I think we want to separate 4 (and maybe 2 too ?) from it to support
> more flexible system ?
> 
> Legacy system
> 	dai_link->dai_fmt		// include all 1, 2, 3, 4
> 
> New system
> 	dai_link->dai_fmt		// include 1, 2, 3 (or 1, 3)
> 	dai_link->cpus[idx].fmt		// include 4       (or 2, 4)
> 
> 	fmt = dai_link->dai_fmt | dai_link->cpus[i].fmt
> 
> "flip" has effect to 4 only, so New system has no issue with flipping
> on dai_link->dai_fmt.

Hi Morimoto-san,

This is a great idea. I'd add that #4 could still be in 
dai_link->dai_fmt, but the new field in CPU/codec 
(snd_soc_dai_link_component.fmt) should override the setting (not a 
simple OR). This would preserve backward compatibility (I think). It 
greatly improves support for multiple codecs sharing clock lines, where 
1 codec is the producer and others are consumers. The bit/frame logic in 
simple/graph cards should be able to be changed to handle this properly too.

Without this type of override, the original patch is needed (or the card 
driver needs to write registers directly, which seems bad).

I will wait to hear Mark's opinion.

Stephen

