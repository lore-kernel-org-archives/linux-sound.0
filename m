Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA14329E11D
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406520; cv=none; b=UV+pEuqzCTPwTzes/4qijlyYN7DIZ7jQu4zAjGOyVnGyZ/YQ4hm3Z42PaKRO+jl1Rnk/JuPOGSevN5nvcXgvHRsc8MnL0o//r8xStvO2qIWGOoNC41o2lrKiTMU8NhAEviXvWNYiSjHAx3+0bBormY/OqaJvzM8Who0Ii64NCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406520; c=relaxed/simple;
	bh=tCzrKewO/AsoJV/tUKNN8Rp2PiPJHtir4vXTi5Z8uqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBcMrILCPjZpsVUv7roB6/BLUFUhhPed31i5sr7agFjZHzVH3oKBAcGuU5G3VJsuJfdesXexbmJkf/RXDI9sd/lTl1S7M+ip3U2v9Xvg6wQd4J380LraUbnPDNIIjm6DIjqWbpsWrw7pMudPhe22U4r0JzMNVqcJxRZL+CYVZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dfVuCQdi; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dfVuCQdi"
Message-ID: <04b94a00-18ef-4540-ac49-a93d2247a603@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777406516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NY5YDty0dJbaiUSBh8KmOmU7rMZ4icsJUmc7nQ6Xr/I=;
	b=dfVuCQdiE/OiCV6uTrqeNqEO+haLch38QlObsuUfrYxMRRMTFGp5K384eQk9+HzVmRKJMu
	jK9r3v0l0lkZEzAloUU7Ge90ef3hdmV0fjqqucwp+doxk8Ou4MxqTK9acXFdyscELY6e+A
	lyNCVVg06mXnayiaY6mBJJWQ26zeL2Y=
Date: Mon, 27 Apr 2026 16:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Aaron Ma <aaron.ma@canonical.com>, oder_chiou@realtek.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 "shumingf@realtek.com" <shumingf@realtek.com>
References: <20260423101338.1040131-1-aaron.ma@canonical.com>
 <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
 <CAJ6xRxVy5+PnoNDK0z=15PrsUXewAgZb6y=a4pdUQ5JTqphk8A@mail.gmail.com>
 <5ef5113c-b66f-468f-a906-72a8dcb67920@linux.dev>
 <aeuR4AddzJ2sKU1e@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aeuR4AddzJ2sKU1e@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 4/24/26 17:53, Charles Keepax wrote:
> On Fri, Apr 24, 2026 at 03:09:10PM +0200, Pierre-Louis Bossart wrote:
>> On 4/24/26 05:52, Aaron Ma wrote:
>>> On Thu, Apr 23, 2026 at 9:01 PM Pierre-Louis Bossart
>>> <pierre-louis.bossart@linux.dev> wrote:
>>>> On 4/23/26 12:13, Aaron Ma wrote:
>> While I am at it, in theory those registers are Dual-Ranked,
>> with a 'commit' mechanism to deal with all volume changes
>> at the same time. We'll need to add support for Dual-Ranked
>> registers at some point, not sure how this can be bolted in
>> regmap support... Cc: Charles for future SDCA improvements...
> 
> Eek... *hides in dark corner*. Yeah at some point we do need
> to do some thinking about dual ranked controls, at the moment
> there is no support. As far as my thinking got was really it
> is in a lot of situations hard to tell which writes you want
> to group. There is some low hanging fruit, for example stereo
> volumes would make sense to group if dual ranked. Although in
> those cases I tend to see user-space changing the volumes one
> channel at a time anyway. And that is even before you get to the
> regmap implementation details which is foggy at best in my mind.
> 
> Sorry I don't have more, it is loosely on my virtual todo list,
> but definitely not something I have got around to thinking
> through yet.

Yeah I can't say I have a good view either...

In theory at the Function level there is a Commit Group mask, a Function can be a member of multiple groups.
The fun part is this statement in the spec

"This Control selects the Commit Group(s) which contain every dual-ranked Control within this Function."

but then the SoundWire spec says

"Every Dual-Ranked Register is associated with one or more of 7 Commit Groups"

interesting wording, I am in the dark on how we would know which controls are part of which Commit Group.

And then IIRC there was a desire to update volume controls on multiple devices, e.g. if there are multiple amps the volumes would be updated across devices.
Not sure how to achieve this...


