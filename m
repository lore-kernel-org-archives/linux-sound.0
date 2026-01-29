Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922563542C9
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709114; cv=none; b=ZMjBIG9KNUvFicIv1ew41Sq4ybeGbh+wOzEDQQhukUMCQ4Xfoen/SwWdTHKKlxAJpLjwF/W1TdhLGqWYIM3j/qu0DhLmVsc54xBD2chBkFvUrui9a8BzeXszqCPDA9xh+HpemuxaRA3pwkTFmXzuFJefcSRFwj2h+Dz3x0GWFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709114; c=relaxed/simple;
	bh=glZEk1Cg6L5t1sAGa3+SYKa7s1uLzex501f7mu3ikqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiEEsSzGOC20KvHsM9ttK2Nyu3Kl+PoLtBcwQY84CQ5wZ1sbiP9r+ib5xYq6zo3z+QBUGB/Yt4bRlY2onnpkWsgQ/NbcyWpCb6sTmtlkLlzzpm0r0OfugqnQXh70FTXAu0xND+k4i1birUmBxO32c9KV5bQ/YCBPfGzKTewiMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YF0lX1Nk; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YF0lX1Nk"
Message-ID: <fbc56ced-ad76-492d-b446-630f97d427b1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769709110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfgVT6JGIMR6eXQ8tXpPICGL+iN+h0cZ4Wiaawccogo=;
	b=YF0lX1Nk/T7lN9tZtrutoKYpRmrW+BcUMWtzRczMy8JGsv2AdWYHgHwxqWCLam3ag4Z0xB
	L4pzRaDulqKHOAfy6gDYDZwfrhvAs9jxOJ4g5yFFH1yBha8mrJgXxE/fby4KZ5Fw6lB0n1
	OVjTYXBp+CiHFsmgqT3R5QeD5SJPdWY=
Date: Thu, 29 Jan 2026 12:51:47 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <7c0d283c-f6d0-4ba6-9686-ae6dcfaa4389@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <7c0d283c-f6d0-4ba6-9686-ae6dcfaa4389@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/29/26 12:37, Andrew Lunn wrote:
>> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
>> -	if (ret < 0) {
>> -		dev_err(dev, "cannot get supported channels\n");
>> -		return ret;
>> -	}
> 
> I don't know this device at all, so i might be asking dumb
> questions....
> 
> It is possible that the device supports multiple channels, but the use
> case is mono, and so xlnx,num-channels is 1 in DT? Would that break
> given your change?

drv_data->channels is multiplied by 2, so there is always an even number
of channels. Pairs of channels are always muxed together and AFAICT
there's no way to disable them individually.

>> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
> 
> Could it be the device supports 24 bits, but the use case only wants
> 16, and so has this property set to 16?

I don't think that's possible. There's an option to output 32-bit audio,
but none to reduce 24-bit audio to 16 bit.

For some perspective, this is a soft core and these properties reflect
the configuration chosen when the core was built. The data path is fixed
and these devicetree properties exist to tell the driver how the core
was configured. If you set xlnx,dwidth to 16 and the core was configured
for 24-bit audio, you will silently get 24-bit audio (and the clocks
will be incorrect).

--Sean
