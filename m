Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426839;
	b=ax0aR17vLV32tpOykqXqopeoRb5Uy3LCzLZzgKYrit4XwtBte/r8nkNfzJQeOxS8D6wo
	 q3GLdGTTaBYuN5cnDNC/Y74lkPL2j8+HOvnwN3FYw1Odt9K22a6ezKeb8oee1jCuINkdS
	 rPBSaZ2xs44Od6iXKDmySNPYHD4YgpsXcNtOzYz3IHSTnmtwk7A7W4rpPvJi2rRy08G/m
	 /1d8w6KIAHwkLUl6EMg2zAFfKH1Gk/2fIoOQ9LySjXOzFgrBH60IJyQynrK89yL4Ie6Rg
	 6OtuaWLprmuQIRPDxLYswGn0AmIoFdBnw8MwNJh2Oe5/NR8GtMlU2fVE9wgUtrIs/Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qdsvC60NxQzbYJm+RppDr2vkau27kIKEI/BGvVRhO5o=;
	b=ExYLMJ9OqmtKz48hO7VsIrFliCaR7lHFGyBpocGon+GRSTW1K7wFZBcomn2UEThgzhkL
	 86diXoEFjkkYHuovxXTnIhzGC4ybSjswx9vhB/2yWE7j7QSvzbfRnbPLIdyog/VQW6jeU
	 I2/u6K2WxaUpRia0/dnPDq8BmJAZ9KAp80SJIIsLi+umg6+MhsjuAUwhQ5Fpl+zERFoYc
	 /XX1WBy587hgQ8K7xW5H7+0YPe2TnQxnmbNNu+MQEgwlJjzU++Sfxfo1AmT0kYQCFN0+W
	 i1bwh6cv+x6VkBhXBjZXqw4tt11R4hFvYu57dWuHq/4tm34Jyrz+UXenhDHaAvK6NzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="EZzJb/hq";
	arc=none smtp.remote-ip=95.215.58.87
Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DF606A31A
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EZzJb/hq
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0H3ExrTY0hhRnRqAQ6crgQJoEU0i1hEgTHHk/fRnPfM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792426836; v=1; x=1793031636;
 b=EZzJb/hqRxdcMG5c/Ow7Hq66oQ/rEfbYoAFQ5DtSzB3TaFldVJFR12Diy0WaBQQBDCkSKpVz
 4eTKxGDKEjcU/GbX3nAZMDkZi+S4mVmTXTffscfmd/tstkdC8JApmoKt0IgocGySOkPjsEsUCqw
 EUaPFOipLIOfSYl9EIqIRzrg=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 003767d96a66458a;
	Mon, 19 Oct 2026 16:20:35 +0000
X-Mizu-Trace-ID: 003767d96a66458a
X-Migadu-Flow: FLOW_OUT
Message-ID: <f51a62bc-18f9-4a82-aafa-c315941eb4d7@linux.dev>
Date: Mon, 19 Oct 2026 18:04:10 +0200
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
Subject: Re: [PATCH 2/3] ASoC: tas2783-sdw: load the firmware synchronously
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Niranjan H Y <niranjan.hy@ti.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-3-matthew.schwartz@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261018200009.1493438-3-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 22:00, Matthew Schwartz wrote:
> tas_fw_load() requests the firmware asynchronously and gives up waiting
> for the callback after three seconds. tas_io_init() then returns without
> the SDCA function initialization writes, while the callback carries on
> downloading, sets fw_dl_success and so allows playback on an amp that
> never got them. Nothing cancels the callback when the driver is unbound
> either, so it can run on freed driver data. The download takes about
> 1.2 s per amp on the ASUS ROG Xbox Ally X20, so it fits there, but
> nothing bounds it.
> 
> Request the firmware with request_firmware_direct() and download it in
> the caller, as rt1320 does from its io_init, which removes the wait, the
> timeout and the callback. The download now returns its result, so a
> missing or bad firmware file fails tas_io_init() before the init writes
> instead of running them on an amp that refuses playback anyway.

The changes in this patch look ok, but this commit description doesn't
really say *why* or *how often* the firmware download fails.
Is this really a problem on actual devices?
Is this defensive programming?

