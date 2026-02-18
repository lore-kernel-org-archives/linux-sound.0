Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019213033CF
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411911; cv=none; b=AjGY3GNnxTMSt4+TvjAxnPJMNDphxsZ2WL3tnWa1RFEej3NbZl8mA6cGbcc8BdssqHGxAj5V2cZfxp+RN2dl6d99TFjt03MqqKSvS4ET9GHU6LMX9M1GG4dP2QbqWBAQO08O5G8O84dp/8IQsd1w5kpiYqe9jY13Sqhjq2EgyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411911; c=relaxed/simple;
	bh=G/LUvClZlgEmfDudpgwrBMmvENGY1RTODBIlcG4SA1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epIL2LJI0kRP6eLomGo1Z2p9nfLaRTAPL1alGa6dKPjUVPrIIDxzSYQ/xHtgvom2MYVX/7qYqd31acz6U2lHbkKiFdHox6LawT8V+97dC9lAS6ECcq3/5ZoaU2eyl5C+O+DWTjQHiuk2LYpTzXGUvHfnTC7nUKQdYOEazKxx3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uZe7fkMq; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uZe7fkMq"
Message-ID: <1c8e8c15-97f0-4da9-ab9d-e84aef9d58e4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771411908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqBpUo0LuR0KZuKNCSVLVN2BxF7L+tqH6DVQaHnusDY=;
	b=uZe7fkMqSQkzkbZk9Ax9e+qomPNHi9uk503w23OiTXPlfr5DD1stO6rlaCahFr7x1yEeuj
	z9G+G8u1ynYHtqTpdcowY0ZFxKmCdXWwPM8G1sbZLrYbO2N/bwPtSg0CGEnd4mWXWg7swy
	vwgQZ+IBKTGznDeSIrV+ulDHDawB5Oo=
Date: Wed, 18 Feb 2026 11:50:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] soundwire: suppress expected unattach warnings during
 codec reset
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Cole Leavitt <cole@unwrap.rs>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: david.rhodes@cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260217233533.4716-1-cole@unwrap.rs>
 <10794ce3-a1ec-4286-868c-53abb20c3094@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <10794ce3-a1ec-4286-868c-53abb20c3094@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/18/26 11:14, Richard Fitzgerald wrote:
> On 17/2/26 23:35, Cole Leavitt wrote:
>> On systems with CS35L56 SoundWire codecs (e.g. Lenovo ThinkPad P16
>> Gen3), every boot produces misleading dev_warn() messages:
>>
>>    cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
>>    cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1
>>
> 
> Is this really a problem?
> They are warns, not errors. Nothing in that message says that this is
> an error, or that it's unexpected. The message is accurate.

I would just demote the dev_warn() to dev_dbg(). 
If you look at the original commit, we were chasing weird cases where we have dyndng enabled anyways.
Also IIRC the problem with 2 devices on the same link was fixed by Richard, wasn't it?
That would make the dev_warn() even less useful.

