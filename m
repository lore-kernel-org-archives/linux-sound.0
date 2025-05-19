Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA47261E
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 18:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678088; cv=none; b=H5YnbYaz4J3vKHbRKtuDllZSMLyqoMRrBJukY+md1thbSNuzO/5L7a99YmkNLzJ+EZ0lQZUf4gAkezvZQ8jGEFtR+BjoEqr4otC9MMmKEi6UHJbRlqqAnW+SY9u2q/DVzdyXTgWDIOi8hH/Nif8Z1lyqMANwi7e2S5R9+zWoEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678088; c=relaxed/simple;
	bh=WsTXImmmeVij6gXaoqqI9LXcarP206XXvosD97USOv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeKTDkvLh6QMibSRYqhbuRg8AZt8rA2DNAgHv740sACXmBW+U97DHn47vUkvKCqlD/E9irgIZnOgU2UkxdKQ2EXENuc/Ajydo+NGN61BXNE8O4USePk8ZJuM62Er6YOprpCX5w/U5I6Un+9+2VJkoo2FPYj13bgGoh2O6xrwNJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mSCkU+cP; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mSCkU+cP"
Message-ID: <225cf5ee-dcba-4e1e-ad36-e4492ded82c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747678079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ml5HcEBxOFg28Hzx3BiFqA/HBZEYALYMZEs2rOXMfo8=;
	b=mSCkU+cPuEPQDI/KwIPrwvs4mdTG+lyKUmDZkil434F/WrAJ8/nP8kBgjLNWzl7OPkjCsU
	b+VUfgE/XXz+vcMuDY3MeeW6a2gSzYXRZtYa4eVZKHMTU0cEK2KkBmL5s+DzrDwCOzBstF
	PAXUkh92N/++9ut9MYVg3z5Pvx0h0hM=
Date: Mon, 19 May 2025 19:53:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
 <aCIrKasDhXrI9SLq@opensource.cirrus.com>
 <01e25477-5475-457a-8c33-4b6c9fdbdd3e@linux.dev>
 <aCSa2AuuQrZlEPi7@opensource.cirrus.com>
 <aCX/IOoDucKs7SNH@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aCX/IOoDucKs7SNH@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/15/25 16:50, Charles Keepax wrote:
> On Wed, May 14, 2025 at 02:30:00PM +0100, Charles Keepax wrote:
>> On Wed, May 14, 2025 at 02:15:01PM +0200, Pierre-Louis Bossart wrote:
>>> Humm, that one doesn't seem right. There could be cases
>>> where the DETECTED_MODE is inconclusive, or that additional
>>> vendor-specific steps are needed to decide which SELECTED_MODE
>>> makes sense. I don't think we should assume everything is
>>> handled internally, or we have to define what 'internally'
>>> means. This cannot be generic SDCA stuff, it has to be
>>> configurable for specific implementations/vendors.
>>
>> Ok yeah I see, the current code reads the DETECTED_MODE in
>> the IRQ handler and then updates the selected mode. I guess
>> currently what is missing is the handling for the JACK_UNKNOWN
>> case, which could probably require user-space. I think it would
>> be pretty easy to export the DETECTED_MODE as well I will have a
>> look.
> 
> Should hopefully be able to send a new spin tomorrow. I have
> managed to include all the comments I think.
> 
> I started being a little more unsure on this DETECTED_MODE again,
> but I am going to go with forcing the export of DETECTED_MODE
> for now and we can revise later if we have a better plan.
> 
> My concerns really are most custom handling will actually
> want to live in the kernel, except the case where the system
> wants to present a dialog to the user to select the jack device
> manually. In that manual case I also can't see any reason why
> just setting the selected mode to unknown would not make the
> most sense, but the spec does not say the device should do that.

I am fine with a TODO on the DETECTED/SELECTED mode handling for now. I do recall discussions in the Audio Subgroup for the Retaskable Jack where there are just too many options and a basic driver would probably give up and say "undefined" for the DETECTED_MODE. For the UAJ mirroring the DETECTED_MODE and/or asking the user for input are probably the two most likely options.

