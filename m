Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75053A1A27
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121616; cv=none; b=uil1qWw4CYJ8KH7d9q0UtPiKYgAeSauNHsHjnInC2RWM89zVpf1VaANUjSOuVHe508/cl8z2EQQLVHqc8b23VsVTDxd1YLSo9MWCw7bex0zv2UzeDMwbmzuxhwOxv/CpzosMSZ6ed0ZAlh90bqfJkrXaflGet/GC6oJ7DmpyBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121616; c=relaxed/simple;
	bh=kxki8cIAvKPeJmAXo9Mr8uYvCtg8YdR+BFmfW6c3amw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVIVjkSpTbBWenQVsT8tBtGlikpkeJIGtEqqW1g0S3CmnUTh/ezYbXZc0ld8s3JQ8iJgGFyyovSd6noPogeNlqTVIqmRhm8ELMZWqweWmw0sr1+r+pDNXDYz6SK4PeGGAOcLlCMqV1G2EAo0FDKwMo6ATMNXxATQg7GK9QxUBqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QlRsivKE; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QlRsivKE"
Message-ID: <d4c4ffb9-8ea6-4fb2-bcfe-1e2265c262fa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782121600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1tyeizybCdN4SqnjAFdHgN6lgKlC0KwXKTvE7yyZdY=;
	b=QlRsivKEhsS2xf4ZV/pOwS9ld8OB1BtXi1pyb7YH9Et4H1Ryew1M8iwundA1jaQWsV2k8j
	U7ijq7rNpxDV5RiO8IxEI0hAYwNkBDu93kvAN4Q3Ih2mFLJQ8J0+3dx0+fFYQumElqxpDq
	nHtHk6OQo8IdxOjSgdKhkdU5+7EHylc=
Date: Mon, 22 Jun 2026 11:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com, jack.yu@realtek.com,
 shumingf@realtek.com, srini@kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
 <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
 <ajVpMYzqnSc0x/YB@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <ajVpMYzqnSc0x/YB@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/19/26 18:07, Charles Keepax wrote:
> On Fri, Jun 19, 2026 at 03:41:44PM +0200, Pierre-Louis Bossart wrote:
>>
>>> The patch series in [1] added a new helper to remove common boiler plate
>>> waiting for a device to enumerate on SoundWire, however, many devices
>>> also wait for enumeration during probe. This series updates things to be
>>> suitable such that we can call the same helper at probe time when the
>>> unattach_request is not valid.
>>
>> So if we are no longer testing for unattach_request, should this be definition and its use be removed?
>> Looks like there were multiple evolutions since the initial patch
>> "soundwire: sdw_slave: track unattach_request to handle all init sequences",
>> is an additional cleanup needed?
> 
> There are still a couple of end drivers that use unattach_request
> to attempt to track if the device was reset. I suspect that is
> likely better done other ways but its very hard stuff to change
> without detailed knowledge of the specific devices.

ok, it looks like a more difficult change than a basic cleanup.

> I think our only part still using this is cs42l42 which I think
> someone has the power to test internally, so we could look at
> that at some point in the future. But I am not comfortable
> changing the realtek or ess parts using this myself.
> 
>>> There is one final step outstanding which is to add a core helper
>>> that waits for a device to drop off the bus. This is not include
>>> in this series and should be the last step of this process.
>>
>> Humm, I am not following why the core needs to wait for a device
>> to drop off.  If there's a bus reset or device reset, it's almost
>> immediate.  It the devices loses sync then the core wouldn't
>> wait either since it's not expecting the device to drop-off.
> 
> The problem is mostly from the device side. This usually comes up
> from a device reset. So the driver does a reset, device drops off
> the bus, the device driver doesn't want to carry on until it
> knows the device is back on the bus. So naively one calls
> sdw_slave_wait_for_init() but there is nothing the ensures the
> core saw the bus disconnection before that call so it might
> immediately succeed, causing the driver to attempt to access a
> missing device.
> 
> Yeah the fall of the bus is fast but so are processors, you need
> to actually ensure you can't shortcut the wait. Although typing
> this it occurs to me it probably doesn't have to be a wait one
> can probably just manually reinit the initalization_complete
> completion. But hopefully I will get this series ready soon and
> we can discuss on there.

Don't we already have the interface to detect a device was UNATTACHED?
In theory the core will invoke the update_status() callback on every status change. Each driver would use the information to know when the UNATTACHED happened and likewise when the device is enumerated/initialized again. So far most drivers just return and do nothing when an UNATTACHED status is reported.

The only thing we can't control at the moment is that when a device reports as device0, the core will enumerate it and attempt to initialize it. If additional time is needed prior to the enumeration, we don't have the hooks for it - that would not be quite standard behavior anyways.

