Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8515DBD8
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716812466; cv=none; b=Aro18eDTo2JDtYF6KIJEvP8JOaH7vQfZIMTF+48c9F6IWvXN9Ay/ZejX7LFqyVrWxopeUZy0yXQYUjUiWpNVqC52utYY810pPh3B5Dux4qTLhX054b5R4YRY3nubFvBg/mPumr97qCQ5b1cyM6qBEeL37pT93gXOttf77Kr+ag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716812466; c=relaxed/simple;
	bh=DGdZksjTVp/liQYPYk++7GpAosy2ZTwN5psFbdYPY7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/mC73qy6mROK1lxMskqVQgk9DvPTy9XDGylUMqxr3awNi1fo6MbS6xHe1w7s2RMCWF47Jmt+Rv8Y6YoeSgHyhjWTIcNeDISNBRKQccrOJyH80fLBiwy/Iokee7I/F06s3F09nXm2joVzjqZ3wZp5Bj2noQeZerje7AuaOTg5LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=KeOr4lAK; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="KeOr4lAK"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4A48C4B9A;
	Mon, 27 May 2024 14:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4A48C4B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1716812457; bh=TGHkcplMCHXASyE5PCQaAIOAXNcW4R6D3fsyIieScr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KeOr4lAKxNL0g/vYpVBRGE+2BPuvpCN6MyMHe7FwTeg6SwM5iMNmFndQiRrjj0K7Z
	 uOwP6ajamUzT4FVrHnjSQxdnWoJqhQ51ngKjxyTVAefIbfRWWkHDlrwC+FtFIxF0uh
	 +HSQjryg+/z/qSX5xAwjhdHf5NALkcIzmTEyulqM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 27 May 2024 14:20:49 +0200 (CEST)
Message-ID: <adba58a7-ef6b-466b-a933-b8b78ed5ba2c@perex.cz>
Date: Mon, 27 May 2024 14:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ALSA: compress_offload: introduce passthrough
 operation mode
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20240527071133.223066-1-perex@perex.cz>
 <87cyp7a46x.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 xsFNBFvNeCsBEACUu2ZgwoGXmVFGukNPWjA68/7eMWI7AvNHpekSGv3z42Iy4DGZabs2Jtvk
 ZeWulJmMOh9ktP9rVWYKL9H54gH5LSdxjYYTQpSCPzM37nisJaksC8XCwD4yTDR+VFCtB5z/
 E7U0qujGhU5jDTne3dZpVv1QnYHlVHk4noKxLjvEQIdJWzsF6e2EMp4SLG/OXhdC9ZeNt5IU
 HQpcKgyIOUdq+44B4VCzAMniaNLKNAZkTQ6Hc0sz0jXdq+8ZpaoPEgLlt7IlztT/MUcH3ABD
 LwcFvCsuPLLmiczk6/38iIjqMtrN7/gP8nvZuvCValLyzlArtbHFH8v7qO8o/5KXX62acCZ4
 aHXaUHk7ahr15VbOsaqUIFfNxpthxYFuWDu9u0lhvEef5tDWb/FX+TOa8iSLjNoe69vMCj1F
 srZ9x2gjbqS2NgGfpQPwwoBxG0YRf6ierZK3I6A15N0RY5/KSFCQvJOX0aW8TztisbmJvX54
 GNGzWurrztj690XLp/clewmfIUS3CYFqKLErT4761BpiK5XWUB4oxYVwc+L8btk1GOCOBVsp
 4xAVD2m7M+9YKitNiYM4RtFiXwqfLk1uUTEvsaFkC1vu3C9aVDn3KQrZ9M8MBh/f2c8VcKbN
 njxs6x6tOdF5IhUc2E+janDLPZIfWDjYJ6syHadicPiATruKvwARAQABzSBKYXJvc2xhdiBL
 eXNlbGEgPHBlcmV4QHBlcmV4LmN6PsLBjgQTAQgAOBYhBF7f7LZepM3UTvmsRTCsxHw/elMJ
 BQJbzXgrAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEDCsxHw/elMJDGAP/ReIRiRw
 lSzijpsGF/AslLEljncG5tvb/xHwCxK5JawIpViwwyJss06/IAvdY5vn5AdfUfCl2J+OakaR
 VM/hdHjCYNu4bdBYZQBmEiKsPccZG2YFDRudEmiaoaJ1e8ZsiA3rSf4SiWWsbcBOYHr/unTf
 4KQsdUHzPUt8Ffi9HrAFzI2wjjiyV5yUGp3x58ZypAIMcKFtA1aDwhA6YmQ6lb8/bC0LTC6l
 cAAS1tj7YF5nFfXsodCOKK5rKf5/QOF0OCD2Gy+mGLNQnq6S+kD+ujQfOLaUHeyfcNBEBxda
 nZID7gzd65bHUMAeWttZr3m5ESrlt2SaNBddbN7NVpVa/292cuwDCLw2j+fAZbiVOYyqMSY4
 LaNqmfa0wJAv30BMKeRAovozJy62j0AnntqrvtDqqvuXgYirj2BEDxx0OhZVqlI8o5qB6rA5
 Pfp2xKRE8Fw3mASYRDNad08JDhJgsR/N5JDGbh4+6sznOA5J63TJ+vCFGM37M5WXInrZJBM3
 ABicmpClXn42zX3Gdf/GMM3SQBrIriBtB9iEHQcRG/F+kkGOY4QDi4BZxo45KraANGmCkDk0
 +xLZVfWh8YOBep+x2Sf83up5IMmIZAtYnxr77VlMYHDWjnpFnfuja+fcnkuzvvy7AHJZUO1A
 aKexwcBjfTxtlX4BiNoK+MgrjYywzsFNBFvNeCsBEACb8FXFMOw1g+IGVicWVB+9AvOLOhqI
 FMhUuDWmlsnT8B/aLxcRVUTXoNgJpt0y0SpWD3eEJOkqjHuvHfk+VhKWDsg6vlNUmF1Ttvob
 18rce0UH1s+wlE8YX8zFgODbtRx8h/BpykwnuWNTiotu9itlE83yOUbv/kHOPUz4Ul1+LoCf
 V2xXssYSEnNr+uUG6/xPnaTvKj+pC7YCl38Jd5PgxsP3omW2Pi9T3rDO6cztu6VvR9/vlQ8Z
 t0p+eeiGqQV3I+7k+S0J6TxMEHI8xmfYFcaVDlKeA5asxkqu5PDZm3Dzgb0XmFbVeakI0be8
 +mS6s0Y4ATtn/D84PQo4bvYqTsqAAJkApEbHEIHPwRyaXjI7fq5BTXfUO+++UXlBCkiH8Sle
 2a8IGI1aBzuL7G9suORQUlBCxy+0H7ugr2uku1e0S/3LhdfAQRUAQm+K7NfSljtGuL8RjXWQ
 f3B6Vs7vo+17jOU7tzviahgeRTcYBss3e264RkL62zdZyyArbVbK7uIU6utvv0eYqG9cni+o
 z7CAe7vMbb5KfNOAJ16+znlOFTieKGyFQBtByHkhh86BQNQn77aESJRQdXvo5YCGX3BuRUaQ
 zydmrgwauQTSnIhgLZPv5pphuKOmkzvlCDX+tmaCrNdNc+0geSAXNe4CqYQlSnJv6odbrQlD
 Qotm9QARAQABwsF2BBgBCAAgFiEEXt/stl6kzdRO+axFMKzEfD96UwkFAlvNeCsCGwwACgkQ
 MKzEfD96Uwlkjg/+MZVS4M/vBbIkH3byGId/MWPy13QdDzBvV0WBqfnr6n99lf7tKKp85bpB
 y7KRAPtXu+9WBzbbIe42sxmWJtDFIeT0HJxPn64l9a1btPnaILblE1mrfZYAxIOMk3UZA3PH
 uFdyhQDJbDGi3LklDhsJFTAhBZI5xMSnqhaMmWCL99OWwfyJn2omp8R+lBfAJZR31vW6wzsj
 ssOvKIbgBpV/o3oGyAofIXPYzhY+jhWgOYtiPw9bknu748K+kK3fk0OeEG6doO4leB7LuWig
 dmLZkcLlJzSE6UhEwHZ8WREOMIGJnMF51WcF0A3JUeKpYYEvSJNDEm7dRtpb0x/Y5HIfrg5/
 qAKutAYPY7ClQLu5RHv5uqshiwyfGPaiE8Coyphvd5YbOlMm3mC/DbEstHG7zA89fN9gAzsJ
 0TFL5lNz1s/fo+//ktlG9H28EHD8WOwkpibsngpvY+FKUGfJgIxpmdXVOkiORWQpndWyRIqw
 k8vz1gDNeG7HOIh46GnKIrQiUXVzAuUvM5vI9YaW3YRNTcn3pguQRt+Tl9Y6G+j+yvuLL173
 m4zRUU6DOygmpQAVYSOJvKAJ07AhQGaWAAi5msM6BcTU4YGcpW7FHr6+xaFDlRHzf1lkvavX
 WoxP1IA1DFuBMeYMzfyi4qDWjXc+C51ZaQd39EulYMh+JVaWRoY=
In-Reply-To: <87cyp7a46x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27. 05. 24 13:23, Takashi Iwai wrote:
> On Mon, 27 May 2024 09:11:33 +0200,
> Jaroslav Kysela wrote:
>>
>> There is a requirement to expose the audio hardware that accelerates various
>> tasks for user space such as sample rate converters, compressed
>> stream decoders, etc.
>>
>> This is description for the API extension for the compress ALSA API which
>> is able to handle "tasks" that are not bound to real-time operations
>> and allows for the serialization of operations.
>>
>> For details, refer to "compress-passthrough.rst" document.
>>
>> Note: This code is RFC (not tested, just to clearify the API requirements).
>> My goal is to add a test (loopback) driver and add a support to tinycompress
>> library in the next step.
>>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
>> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
>> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> ---
> (snip)
> 
> Through a quick glance, the general idea looks simple enough and
> straightforward.  If this satisfies the needs, we can go in this way.
> 
> A few subtle things:
> 
> - We might want to have a safe limit for the task creations.
>    An evil user-space can fill up too easily.

The limit was proposed in snd_compress_check_input() but not used later 
(TASK_CREATE ioctl). I will send v2 shortly.

> - The error checks of memdup_user() are missing.
>    A caveat is that memdup_user() returns ERR_PTR() instead of NULL.
>    So with the automatic cleanup, you'd need to fiddle with
>    PTR_ERR(no_free_ptr(p)).

Thanks.

> - The use of __u64 is rather for uapi headers.  The kernel internals
>    can be with straight u64.

Yes, thanks.

> - The task list add/removal might need some locks.  It looks racy.
>    Also the task runtime returned from snd_compr_find_task() might be
>    freed.  Need for some locking or refcounting?

All task operations are covered using stream->driver->lock unless I overlooked 
something.

> - A linear lookup is OK from performance POV?  Maybe enough for small
>    number of tasks.

We can improve this later, but I would not expect too many queued tasks. I set 
the limit to 64 for the first implementation.

> - Better to have a protocol version check and accept the R/W mode only
>    with the newer version.

There is no R/W mode for passthrough direction. An error should be returned. 
The direction is returned from the driver using SNDRV_COMPRESS_GET_CAPS and 
also open mode must be O_RDWR so things seem to be separated enough.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

