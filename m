Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5DE3A7831;
	Tue, 28 Apr 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365222; cv=none; b=soaLOQbHueFWgdadDMgjcoizQy5gFsCdP7B8Ih4w84IYJY8yE7uUDoMhsbgHT+1Bg0KqgiEFIwNP5ylBlNUs/Yx51oYiCkJyUvaoNKEcMU7hYL/moqp34IbrDkNGDjCl63IRbmwtKonMb03/iwBCsAemygKmTHSm5svgzjH6/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365222; c=relaxed/simple;
	bh=2nPWt8y0UuftwYQCEIiW1OXFPIwhT16kB5elrqeR8CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9D5p66Gc5b0OorHg6M11zhdUMCUVyXD7v/8i6tanRMrABff0rGCIdSD8E+9AkbV+EVLE5ybUrkIbHtaJnxJ5iQW1TK4LZVscHq0OfiiDi1y6bPUkLG8R/puzi2xDItt/FWzEL8h2k38DcGPRN48yEBCx6QuO0MMyQsSY8WRY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=neludCdP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="neludCdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5745C2BCB8;
	Tue, 28 Apr 2026 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777365221;
	bh=2nPWt8y0UuftwYQCEIiW1OXFPIwhT16kB5elrqeR8CA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=neludCdPyVuqwrZ3HkOG4iu+5k3xY8RLS92f/EliAvjRzWpnops+TtpkywG5JVHsL
	 t+GlCsSuQcDxfAtinXOOLf9Ld7GLVJYrMQBa8HLEelbjzSKEzyBpFgRy1pOtnHVLCU
	 Sf1o6bb1jIkVRu2SNym1PjP/fhu4GxMvY7e1LzNe+3h8MUc8JYBttKWYS8oSOARgbT
	 VfR8BC38J5gxIjyBf4JCmOK9kuaLEUSOO2tQ0gdKPjz3k0H2Tvd316H3Q+3IFfrDx2
	 LBtLGPomk0xokGpU4MifF4rICybi4m909rrvMY6xS6PopzvMZn75XoDp9dreo5hwbA
	 +AZdCMsA2+zrw==
Message-ID: <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
Date: Tue, 28 Apr 2026 10:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source
 definitions
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>,
 David Rau <David.Rau.opensource@dm.renesas.com>,
 Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
 <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
 <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/04/2026 01:40, Bui Duc Phuc wrote:
> Hi,
> 
>>> The 'wakeup-source' property already has its type defined in the core
> 
> 
>> TYPES. It is plural.
> 
> 
> Thank you for pointing that out. That was a mistake in my wording.
> Regarding the two data types, I’m already aware of this and have
> discussed it in a previous patch.
> 
> https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAuz9=w@mail.gmail.com/
> 
>>> -  wakeup-source:
> 
>>> -    type: boolean
> 
>>> -    description:
> 
>>> -      Flag to indicate this device can wake system (suspend/resume).
> 
>>> +  wakeup-source: true
> 
>>
> 
>> That's wrong. Commit msg is making here false statements that it is
> 
>> redundant. I checked (and you should too!) and driver does clearly
> 
>> device_property_read_bool() thus the property CANNOT be the second type.
> 
> I think Device Tree bindings should describe the hardware capability.

Yes. And the ABI. You cannot have ABI which has an incompatible
implementation. IOW, when implementation contradicts the ABI, something
is wrong.

The question of course if read_bool() is here incompatible. From the
actual code point of view, it is compatible, but how it is documented
and how it is intended to use: it is not compatible.

Also if future schema-kernel-ABI checker gets implemented, the tool
might report here a mistake for that reason. read_bool() means property
is bool.


> If the hardware supports wakeup functionality,
> referencing the core schema is sufficient. Hardware description should
> not be constrained by the current driver implementation
> ( e.g. the use of device_property_read_bool() ).
> Bindings should remain stable and generic, while drivers can evolve over time.

So you claim that bindings can define property as integer, but drivers
can evolve and for example read it as string?

> 
> Re-defining the type locally duplicates the core definition. If the
> core schema evolves,

There is no re-definition here. This is choice of subset of types.

> this approach would require touching many bindings instead of updating
> one central place.
> 
> This follows the recent cleanups suggested by Rob
> 
> https://lore.kernel.org/all/177628888260.592110.11727813820499601669.robh@kernel.org/
> https://lore.kernel.org/all/177679687272.1458365.1328485324673928433.robh@kernel.org/

Where is Rob's suggestion to do such cleanups for EXISTING code? I only
see that new code should come like that.

Anyway, your commit msg is for me incorrect because it misses all this
points I made. Whether the schema code is correct, I'll defer to Rob,
although I still claim the same I claimed before at v2 or v3 of your
previous work - this should have defined type.

Best regards,
Krzysztof
