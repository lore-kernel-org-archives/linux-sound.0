Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA73D47B9;
	Thu, 11 Jun 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175120; cv=none; b=lFdVt+xwC5YiGf/qQARzsI9Yg63NyoeOgkuKMTZy3k5SVksQhRczSXZt3k7fVXwT6CXwBy2XmhOf1+Yq4dUYb6/Obr0LNpRLgc2rAUOH6i7JI+W6IeINDzJDO5LVxfgLfuPgUaKG2hkEUMAzIuSgzhZVEZ+6HzKXkDg45XSq41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175120; c=relaxed/simple;
	bh=XsAwsfbpUsMLhQg5kQCP6nIjC9CFE9yy3cQ1S5sKI8E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lwm1llFKq9p64KbYU16yQ9QnRyiPmCKflJ0Wh4DHKXfUV5lif+yu5RBoHcJlmUJDukhCusH3Ta5SezJzaa5Sy6gcP+J2rarefitvsWD8aFdTxflkXfVxpahzVFmon/qCfe0oZ73Z6RVuF87a9PyNvTj8MC4CGX1ECOCQR/8CPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ+4agAK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ+4agAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4281F0089B;
	Thu, 11 Jun 2026 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781175119;
	bh=LVV67R3x6hGXlKRw2JHMhwc1bj0uJDygKzOfGTw5BSQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=mJ+4agAK1204hfFWf2M4hFMunYvkK9gkhPqKE36B9y8SyNwT5dodrn2+1KwDZ3u7w
	 s/2QP6Pb1LeGL4BQFkEsFFlLsyO0jKzRvQ7hjl8NJKlimj5iQOdLukK9YqsRON+70p
	 3mZcnVyLEaY1yH0AJxaee12fXphHI28pZYpX3rzWbU1/MVct58MLQGpJZseCIF8DsC
	 pZn6zxPnOPSj692FwKXZkDC4w+h4UeNsqRElivaK2+SFN+Sa2yevywhFA8NpNqAqtG
	 rdXyBA+JPve8rwrgUjdRhYPey0Ecz3R1zTpvTEn9AISuRI9iM1Wzs7YGpSkuHIw8aq
	 KI3dShs9GQHwQ==
Message-ID: <c6d33f8d-fcd3-4b23-81d0-6583d943b9d9@kernel.org>
Date: Thu, 11 Jun 2026 12:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF
 and clock
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org,
 devicetree@vger.kernel.org, tiwai@suse.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
 <20260611031824.4628-2-zhangyi@everest-semi.com>
 <20260611-mamba-of-legendary-anger-af76a9@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260611-mamba-of-legendary-anger-af76a9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2026 12:45, Krzysztof Kozlowski wrote:
> On Thu, Jun 11, 2026 at 11:18:18AM +0800, Zhang Yi wrote:
>> Add members related to HPF and mclk_source
>> The value of HPF is not dB, it is just the value of registers
>> And add HPF settings to the example
>>
>> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
>> ---
>>  .../bindings/sound/everest,es8389.yaml        | 23 +++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
> 
> So this is like third time you send the same.
> 
> You never responded to feedback, I don't see improvements and you keep
> sending the same v1.
> 
> Version your patches correctly - read help of git format-patch or just
> use b4.
> 
> NAK again because you just ignore us.

This was v1:
https://lore.kernel.org/all/20260608083540.12581-1-zhangyi@everest-semi.com/

Then you send v2 calling it v1:
https://lore.kernel.org/all/20260609025605.16945-1-zhangyi@everest-semi.com/

Then you sent it again:
https://lore.kernel.org/all/20260609030623.17404-1-zhangyi@everest-semi.com/

And now you send v4 (??!?) calling it v1:
https://lore.kernel.org/all/20260611031824.4628-1-zhangyi@everest-semi.com/

All within three days. And in the same time you never responded to
actual feedback.

This is not acceptable. Please stop spamming the list with the same
version and respond to the feedback. I expect addressing EVERY email you
received with reviews.

Best regards,
Krzysztof
