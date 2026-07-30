Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981353F0AA9;
	Thu, 30 Jul 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402714; cv=none; b=QheiMaPYBPZ8Xst4BK70cFNBhbh6fPf+GQudkUi3fm6xFhBJyA6CjSwQmjt0/2EbYgUuW9GSMIEcXG7KucD2qAnILFsaZ8hZs7rRK6/tlVq7nn7K30gIU87G/axvEQXGgt6jQmuHtl2y8L6rqLdGsqHCzmZBLH4e0j5guqibqMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402714; c=relaxed/simple;
	bh=x99WJ7l+a+Wc9KUr9nDOnsRaM6WCCUFPpb1qDhsJXak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbgzyjtP/pznugl9CTdAvQ3dpsbGhSLdueeCSEC6BIglCFMPyiF3uutoH4WnZYdVzVENJssAfO6EdjAdk0XVmWJ07UIau+/pfSMoKrfpJkNA3xfubXsRQkDh6oSh2DxeSGI1mjB3BS390Tt5hGJW1CvEbU68tfcRmp2ak7aXFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A87lX1Dj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A87lX1Dj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621671F000E9;
	Thu, 30 Jul 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402712;
	bh=QK4tDLOcM/21OJCALRNmyHHG89ja+dYbL/N4PbUWHbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A87lX1Djn1UMlVJWg/0kKRKtEUrE7q5RoT5ozDUPvCOx5P0fCO2OAsg6LPYaAYf1h
	 4Xxrkx/GQlZ0pMf/PQuiKWa0rFUKiWZMs2JVhHQ6NOI2/2sSMsT6O5GsEVyONnoblG
	 yFXB0bjpcmz6Xbh7LsaBbE6GHcx9gbkvCf72NWrb9WwvthsF+u0hMvwxcFLrngjMCH
	 fNlATwYZX8sy4anrf0dUOcmrtgxTM5AbauBSULAtTX1LHq1NJFZ1OTduy7T6UMHNZ+
	 fDfIRvsxEHEJ+cgXhVpSn4xBZZBz59gKMIAYlAXrYQMTXBHsAMSCqUvHIDevE2PBDZ
	 fsdtPXxGthNfw==
Message-ID: <ec991e49-c23a-4c11-b0bb-32c12c427eee@kernel.org>
Date: Thu, 30 Jul 2026 11:11:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <cedd89d4-28ec-4a86-99ab-249637d81736@kernel.org>
 <amsUlWAueA51eSDC@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <amsUlWAueA51eSDC@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2026 11:08, Charles Keepax wrote:
> On Wed, Jul 29, 2026 at 01:41:57PM +0200, Krzysztof Kozlowski wrote:
>> On 23/07/2026 12:17, Charles Keepax wrote:
>>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
>>>> At Linux Plumbers 2025 in the Devicetree MC I raised the "SDCA and the
>>>> classic ACPI-DT problem" [1]: MIPI SDCA is built around ACPI/DisCo
>>>> firmware descriptors, and the in-tree ASoC SDCA framework
>>>> (sound/soc/sdca/) enumerates functions, entities, controls and PDEs by
>>>> walking those tables. On ARM64 DT platforms there is no DisCo, so the
>>>> framework is unreachable and sdca codecs will not be able to use the
>>>> generic sdca drivers and duplicating.
>>>>
>>>> The direction from that discussion was to let DT platforms reuse the
>>>> same class/function auxiliary driver plumbing and have codec drivers
>>>> supply the small amount of static function/entity metadata that DisCo
>>>> would otherwise carry, plus hooks for device-specific bring-up.  This
>>>> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
>>>> SDCA codec on the Glymur CRD as the first consumer. Static table that in
>>>> part of this codec is generated from acpi tables.
>>>
>>> Fascinating, a shame I missed the discussion. Main question
>>> I have is what was the reasoning behind using static tables
>>> rather than just putting the data in device tree? All the core
>>> code uses the generic firmware parsing function so should be
>>> perfectly capable of parsing the data out of device tree. The
>>> only bit that is missing is really the sdca_lookup_functions
>>> bit you ifdef out, but updating that to also support DT should
>>> be pretty simple.
>>>
>>> Looking through your presentation (thanks for linking that),
>>> am I to guess this was mostly a device tree people didn't like
>>> the stuff SDCA contains problem? I do see that some of the SDCA
>>> stuff isn't an exact match for how Linux has traditionally liked
>>> to handle DT but also really not sure I see any benefit to DT
>>> and ACPI support being different.
>>
>> We do not describe in DT properties which are implied/deducible from the
>> compatible, because it is redundant and we do not like redundancy.
>>
>> The device is WCD9378 as defined by compatible, thus all or most of SDCA
>> properties do not belong to DT.
> 
> Do we really want to take this line? It basically forces us to
> do "board files" again, which is the problem DT was solving in

Again? We since long, long, long do board files and they are approved.
Although now they are called software nodes, but same stuff.

> the first place. I can't speak for Qualcomm, but at least for
> our devices the SDCA properties can change a fair amount
> between different laptops.

Sure, all properties which are not implied by compatible make sense for DT.

> 
> Also there is the fact SDCA is already a thing and is gaining a
> fair amount of traction pushing against it does really feel like
> it is just making life much harder for ourselves.

I do not understand this comment. I am not pushing against SDCA. I am
giving you guideline what can go to DT. Are you saying that SDCA somehow
received review/approval of DT maintainers, so that we are bound by it now?


Best regards,
Krzysztof
