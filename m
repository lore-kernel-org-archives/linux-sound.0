Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7B1487A5
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753091922; cv=none; b=VshB5XCrSKDrLJngyzf9VLvs2NLvBTKTfoGSxIdfR7dV2rVYLJrXdsmq0bbPpYh9UQNgZf4qKlpi8ofxZNeNzIFZgoB6OamPK62Pn61ih80lEb7kVzYyu0T77MKVC/Z1xEsEVeEnYdagyU7p1CAIi23l+xwBUbwGJgTcnHFQneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753091922; c=relaxed/simple;
	bh=poqM3vgJ4qOdQuRnSZORhrkM+IFzaW9zZvgOiAlWIhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0AFN/wdTI6aiWLxX1xO4xdp9FhBTKhICtRPxb82MolsCnBezK3mVYQQ6x4gwtg8eYdgYbL8YV6Pvnv4MpPH1SaGU5TG8JNxrAIE7myAqlGrCzwYrEBaWMRC7OGa6EyODQTlkDl+kq3rNIZVniInE21ygLtZ4h3RUx2C/jfAh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P4iCZfUX; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P4iCZfUX"
Message-ID: <33031451-9aef-4c72-ba63-b2cc76877c95@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753091917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J2RjrMMV8jinO1nOdGIPwlCYZPGbn7mkl69AXGofTbM=;
	b=P4iCZfUXSgdlFWzt+nPvmU8VoZ0WofY80VyU6mtgHyiQ2L2VYzi3ydWucFLe8jRTlnttzw
	Uyj7W+t7drGtLEu2B8NTe+xrQXHYqHgm/fnj/zHyFi63AENNL9jp8A/irMiBmZI1GHJLlC
	6Yh60I0VfivZ/fTamBPT0ysh5KClILw=
Date: Mon, 21 Jul 2025 11:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] Add SDCA DAI ops helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
 <4336e9c1-e05c-46d6-939a-53fefb8f9a14@linux.dev>
 <aHdinBnBvSsfx/nA@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aHdinBnBvSsfx/nA@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/16/25 10:28, Charles Keepax wrote:
> On Tue, Jul 15, 2025 at 07:58:32PM +0200, Pierre-Louis Bossart wrote:
>> On 7/7/25 14:41, Charles Keepax wrote:
>>> First, a couple of minor code fixups to already submitted code. Then
>>> some patches to add new DAI ops helpers for the SDCA stuff, these allow
>>> configuring things like the sample rate and finding out which SoundWire
>>> port should be used for a specific SDCA streaming input/output terminal.
>>> Still a few bits of outstanding work here (propogation of Cluster
>>> information particularly) but his should be good enough to get some
>>> basic use-cases working.
>>
>> For the patchset:
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
>>
>>> Hopefully we are getting fairly close to completing a first version of
>>> the SDCA work now. Should be one more series to add FDL (firmware
>>> downloading), then we should be able to send a first version of the
>>> actual SDCA class driver itself.
>>
>> FDL is a very desirable feature, but shouldn't there be an UMP
>> (Universal Message Passing) layer first? HID and FDL rely on UMP.
>> I would have expected the ownership changes to be handled in
>> a shared UMP library or set of helpers, no?
> 
> Yeah we are still working through the last iterations internally
> on the FDL stuff. I think it probably does make sense to pull
> out some UMP helpers (indeed I was have a look at it yesterday)
> although they should be pretty simple so I imagine we will just
> send them as part of the FDL set (subject to change as we work
> through it).

Indeed UMP is pretty simple on paper, but as usual there will be corner cases of the ownership change never happening. I vaguely remember there was a sequence required for the HID used by Realtek.
FDL is another order of magnitude in terms of error handling, the state machine is rather complicated and it'll fun to see how implementations map to the spec :-)
