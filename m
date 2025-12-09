Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EACA328B55
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285554; cv=none; b=GaPRXqOCbXfaywg6+X/d2VaLtTDBTUoUO4uSkCQ/5aAa44KFewX7s8Y0+55B7w4IF2FpE0StPZrXK4wQ2XEW+KsVedetc4/8qCx/OVyWetWWyKksItpkEoLGAKn0g8FRORoDnd3kK8+RhGluqwxdyWWCLPykEqIsRBwTkBu5Zcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285554; c=relaxed/simple;
	bh=XlGoglqt0WlSLLq9+rBAFW/+WwLHQN5ABVZTyufisHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avoxG08hsOQlbiCXd64qVMfLxdl71wWXYqbh9iA04hogk+0y+kxpGFDTvA4yCZ0CRiAyy1QAVrcQu9zGYmc+4KyGQoRman6tsdDy/12jT7PQt8aBOApweGSTVRreS6rFFluotL3BcRyifFed2aRJ6+iKlOKfpG+nU11+o8GYd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Rnqx1iK1; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Rnqx1iK1"
Message-ID: <4d811207-1c01-4302-85b1-9d4079ea1a4b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWxKZ6ZrsMhiNUlPF7znWtR882W7Ktg6UKoO+DCeCKY=;
	b=Rnqx1iK16ez80bi4e+tmfLe/PUoPNL04WONApmFCHOdhbweazyw1+DvNLunClY5fwuBBYp
	9xh4mWwJxr4gXLHT9oU7FjpuT5SN2dgzr7Tv/HVb5fjwWkQ/ImMZ4i+cH8a2n7wLjegy4H
	aH97fBaLVXZM4vNAlF1THbDqKO65x0A=
Date: Tue, 9 Dec 2025 13:04:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] soundwire: stream: Prepare ports in parallel to reduce
 stream start latency
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20251125165609.483763-1-rf@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251125165609.483763-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/25/25 16:56, Richard Fitzgerald wrote:
> Issue DP prepare to all ports that use full CP_SM. Then wait for the
> prepare to complete. This allow all the DP to prepare in parallel to
> reduce the latency of starting an audio stream.
> 
> On a system with six CS35L56 amps, this reduces the startup latency,
> from runtime_resume to all amps ready to play, from ~160 ms to ~60 ms.
> 
> (Test hardware: UpXtreme i14, BIOS v1.2, Core Ultra 7 155H, 3x CS35L56
> on link 0, 3x CS35L56 on link 1).
> 
> An initial read of DPn_PREPARESTATUS is done before dropping into the wait,
> so that a quick exit can be made if the port is already prepared. Currently
> this is essential because the wait deadlocks - the stream setup takes
> bus_lock, which blocks the interrupt handler - so the wait for completion
> will always timeout.
> 
> However, an experiment of removing the bus_lock from stream setup, so that
> the interrupt will work, shows that wait for completion takes ~700..800 us
> but the quick-exit read takes 50..200 us. So the quick exit is still
> valuable even if the stream.c code was rewritten to allow the completion
> interrupt to work. Rewriting the code so it doesn't take bus_lock is risky.
> The deadlock only lasts until the wait times out so it's not a serious
> problem now that the DP prepare happens in parallel.

The only limitation I see with the stream mechanism is that we cannot start two or more streams at the same time, even if the hardware supports it. On paper it'd be interesting to e.g. start capture and playback with the same trigger (bank switch). Like you said I am not sure anyone is ready for now to test all the corner cases to remove this bus lock.

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> Changes in V3:
> - Removed duplicate deferencing of s_rt->slave->prop.dp0_prop.
>   V2 saved it into dp0_prop, so use that.
> 
> Changes in V2:
> +	if (simple_ch_prep_sm)
> +		return 0;
> +
> +	/*
> +	 * Check if already prepared. Avoid overhead of waiting for interrupt
> +	 * and port_ready completion if we don't need to.
> +	 */
> +	val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
> +	if (val < 0) {
> +		ret = val;
> +		goto err;
> +	}
> +
> +	if (val & p_rt->ch_mask) {

Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.

> +		/* Wait for completion on port ready */
> +		port_ready = &s_rt->slave->port_ready[p_rt->num];
> +		wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));

I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.

> +		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
> +		if ((val < 0) || (val & p_rt->ch_mask)) {
> +			ret = (val < 0) ? val : -ETIMEDOUT;
> +			goto err;
> +		}
> +	}
T

