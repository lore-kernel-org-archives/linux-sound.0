Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3E355F46
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536940; cv=none; b=f0O6wqj/4Rjd25iMGpL711fKt8mRsYAazo+3fWztwjgBErsgifK+WtpB3UCosviFDJZsDDOynoXhkgM11Q9Ps3kIXPxPWn5zvnf6LQw9GlMlmq1RRpzaU3IC6RjNSww/8KVgXts7avapRDcrGDOf1euX4f2B0FpwPthBYvb73fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536940; c=relaxed/simple;
	bh=HjqrMYBM6MID0433yRT1x8xmj2KupOh8u2Krj9yH/Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIFfUupcHlapBJxo4+2ixL8wFal0/TlVZZLJ2ht0rwRsGx8oA6IzKEcbYtjaxjx4v2qfv3S/Fp27v4a3SIIBWu3iXFdgLsQXCvXwg61fOfur4LspEJPdf6LkuxjNPG7+rufvqxAhfAfe2vi5L3uhSxEeRKZwi0fpiALbQZruMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tBnKaOhi; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tBnKaOhi"
Message-ID: <3be07800-9c02-4d9c-ae9d-b2dce44c5fd3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777536937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w43CDXPHdCJtj8zhL3o+YGyAGmvtZaH32iMve4CbegA=;
	b=tBnKaOhiR8IGfx6Mnr3Vsl23atfUiDiZrn9xNiB4Vyvb+dt9ez31SgDk3fWoLnk9rjYxOg
	CDJnyVD1tuG+oDtIUeXWRB7pTN1c1D3PX4eXILGJEPEEqspQW0xxhascuFLBk2mU++rrGw
	WRBBL+Vfego1NWM4k5EGF+V+GMHibm8=
Date: Thu, 30 Apr 2026 10:11:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA
 jack status
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
 <20260427115925.3801099-2-ckeepax@opensource.cirrus.com>
 <cb90c6dd-5976-4aef-92c4-e7f6b91fda90@linux.dev>
 <afIDNXrQ23Cja0vm@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <afIDNXrQ23Cja0vm@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/29/26 15:10, Charles Keepax wrote:
> On Tue, Apr 28, 2026 at 10:18:17PM +0200, Pierre-Louis Bossart wrote:
>> On 4/27/26 13:59, Charles Keepax wrote:
>>> Currently, all SDCA jacks simply report against a mask of 0xFFFF. This
>>> works fine for system with a single SDCA jack control as the status
>>> reflects that single control at all times. However, if two SDCA
>>> jack controls exist in the system, such as a separate representation for
>>> input and output, then the second control can cancel reports from the
>>> other since it will only report its relevant bits and zero in all other
>>> slots. This is exactly what the mask is for.
>>>
>>> Build up a mask using all the possible states for an SCDA jack control
>>> at registration time and use that mask when reporting a particular jack.
>>> It is worth noting this still doesn't handle cases such as two headphone
>>> jacks as that would require separate ALSA jacks to report to.
>>
>> I couldn't quite get the last sentence. If you have two
>> functions for separate headphones, where would you have a
>> conflict?
> 
> For the SDCA side this is fine, as in we create our controls
> there is enough to distinguish everything.
> 
>> Don't you have separate ALSA jacks created independently by
>> each function?
> 
> For the ALSA jack side we still have a jack object being created at
> the machine driver level. Primarily because the existing jack
> APIs require a card pointer. There is certainly an argument to
> pull this into the class driver itself, such as we did for the
> mic and speaker widgets. Doing so would let us support even more
> topologies however that is definitely a bigger piece of work.

ok, thanks for the explanation. the TODO list seems like a Hilbert hotel, always some way to expand it with new things...

> But either way this change is helpful we should really mask for
> the bits we are reporting.

ack.
