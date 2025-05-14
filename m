Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328172777F9
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226401; cv=none; b=QV667vNW9ED8Ai8rJpsWl+2BkzoUJamTuGpKSnp23Gdo9ciaCQdKMv4xiI2RyRq6FilL9LGf0rtJX/NzP1UctQGJ/lUf8ODX1E3ey2BQM5WsbjauCvefNFM06XWIVvJfwoC2nKw2nyuWllrLepJZOLceS3Y9b5JZKk5E3sMdwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226401; c=relaxed/simple;
	bh=MaJfV9vrOJxPDqohRJEU2g1G11avd/vhCdcpmpj9SjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+d6kSUNEebKWfAtBfd2pWUIi4AVjLsV9K27SB6/jJIk2bkqD/VbDYlTDBL8i/Z3nQWkcvatDB5J7TjdIJXmudMH4ahHvxco85m2uwQ5+9mXbnCOsRNMAWPQE0QlLiW2ao9EXaF41Y5g0kTjqSl4nkU+/Huwy4HULcOjk7yvd8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sR07caFP; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sR07caFP"
Message-ID: <f04afa43-ed28-4e2f-a3b9-0d9990d2a8ce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747226397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+y7hBi1dQUwcFAj/d4Yi9l4iTw8xaGiW4mhh4c2lnE=;
	b=sR07caFPaG9/fPAWAVXAA9oSHOFa6d3lT3biQqPsLAoKaL3sGaHHJj9HxTbWV5OYqLycan
	MXAdnYaAtZVe/YKO0/Ch7GGxFY8T+GGcfXdOUeZaHeiK1GkS+EyfAw+hXCeRZtqZxI2wwO
	5WwhbXNWyqV8MlTAlWtd5s9GEapXhpA=
Date: Wed, 14 May 2025 14:39:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
 <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
 <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
 <aCMdyOugv7tbXJ5I@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aCMdyOugv7tbXJ5I@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 12:24, Charles Keepax wrote:
> On Mon, May 12, 2025 at 06:14:00PM +0100, Charles Keepax wrote:
>> On Mon, May 12, 2025 at 03:53:36PM +0200, Pierre-Louis Bossart wrote:
>>>
>>>> +static bool exported_control(struct sdca_control *control)
>>>> +{
>>>> +	/* No need to export control for something that only has one value */
>>>> +	if (control->has_fixed)
>>>> +		return false;
>>>
>>> why is that? It'd simplify userspace if there was always a way to
>>> get a value, even if it's fixed?
>>
>> Well mostly it is because various things in the stack get
>> sad with a single value control you can't set. If we wanted
>> to change that I would suggest we add a FIXME. It isn't really
>> critical and I would really like to get more of this class
>> driver stuff moving, it has been out for review for a really long
>> time now.
>>
> 
> Thinking a little more about this user-space is going to have to
> handle controls not being there as different controls will be
> exported across different parts anyway, based of which options
> are implemented. Also we have seen a bit of people hiding
> controls by changing the access layer. Although sometimes that
> does result in things that are technically not class conformant
> but they do work through the Microsoft drivers, so we will likely
> need to support it anyway.

Sorry, I missed what the conclusion was, would this filter stay or be removed?

