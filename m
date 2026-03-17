Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AC36212C;
	Tue, 17 Mar 2026 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731217; cv=none; b=OT6xE/m3n4RCav59XWMKQwD7exoHBRIleiFacXwOeAgH+mJg2shX90dFg6yIPJca8fWlrfhwFKYy/B5NNokdATA+ytIQflAECSjnxxMD4veSaSKN/Ovi4DFGTz4Es5cnzj1z+18Vh9MPoF7BvS1fT6F44Vqs7MI5cCBH0iFO7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731217; c=relaxed/simple;
	bh=ncD+ciZETahyIEvstNidIoTH3GDfOd1p/Fa1wNYVrrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDqNwsCTl+UIIv/vPcoW9ALaBEXUHzKl5yJ5C6TVuwkFzg262SjsV1WaIB3TcfOzb5nzLpAMgEq4slYUvOFM/17umLliMQdYajZ/qifvAPJ5LjayBisPWUcTN1MIRvlb4q8Xp1SwC2rFEpY6uxPuwBEV2PCh5i+ce7Me2hjxjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+Oafkfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+Oafkfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D04DC4CEF7;
	Tue, 17 Mar 2026 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773731216;
	bh=ncD+ciZETahyIEvstNidIoTH3GDfOd1p/Fa1wNYVrrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p+Oafkfb7/JP1Vt+VF/mYvn1NXXBuI5NiBp8wZ9+9Ce+hU4dejqr/WQD7SeAmtSA+
	 7TSIQQSH6yC3AEbmBs9cDRanhPl4o1XBYeU9fks/9jl9nReMJ245jCw1Pj2oRPaWJH
	 DWYwCJ5OMofANHzjXrxAbzQHDHeD4pw23X+wL1KrQtlsd6x+DdiWe2swyWeMgtpj7L
	 mzWb9/JDQcaI9NAhvYuI6B1yoHTMDbmQfbk4H/cWvFJWpLfBMGGsOpID+3dO2PuNUt
	 sAUeVDLHqlwkOj/OoBCi0q0Qey2p9rALnmmPDr4MhTdXx9QmPhovMuK4GGECKw/vHt
	 yY/qZZ0Zei9Zw==
Message-ID: <53379548-dcac-4724-8ec8-50ce07807cc4@kernel.org>
Date: Tue, 17 Mar 2026 08:06:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "Xu, Baojun" <baojun.xu@ti.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "13916275206@139.com" <13916275206@139.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>
 <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
 <a7316acf9ba248f9ad1fab0313a95654@ti.com>
 <3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
 <4865c7f626a340d7847354512367577e@ti.com>
 <596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
 <aaVcDvYvi28wFR2S@ashevche-desk.local>
 <c46a8bf5-7a6a-41a9-b18f-9a7ad7a60bb9@kernel.org>
 <3af19ebaf32d482ab5cf575b831b2d9d@ti.com>
 <f16d2a7f-04e2-4d99-9239-caca9fd1f7b5@kernel.org>
 <d8303fc67ae84232b4b6ff0ef8cad6f1@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d8303fc67ae84232b4b6ff0ef8cad6f1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2026 07:05, Ding, Shenghao wrote:
>>>>>
>>>>>>>>>>>>> static const struct of_device_id tasdevice_of_match[] = {
>>>>>
>>>>>>>>>>>>>       { .compatible = "ti,tas5827" },
>>>>>>>>>>>>>       { .compatible = "ti,tas5828" },
>>>>>>>>>>>>>       { .compatible = "ti,tas5830" },
>>>>>>>>>>>>> +     { .compatible = "ti,tas5832" },
>>>>>>>>>>>>
>>> ...
>>>>>
>>>>> I don't know what you are trying to get from them, but I²C
>>>>> enumeration on DT platforms works in a way that it takes two tables
>>>>> into account, hence, if there is no compatible (with given part
>>>>> number) there will be no matching name.
>>>>>
>>>>> AFAIK it has to have a compatible to make it work in such a case.
>>>>> What did I miss?
>>>>
>>>> Show me please then how the OF table is used here at all to get the name.
>>>
>>> This code will also be used for ACPI devices. To ensure consistent bin
>>> file naming between ACPI and DTS devices, the mapping table
>>> tasdevice_id[] has been introduced.
>>
>> We need to stop discussing with irrelevant arguments, really.
>>
>> I asked to show me how this is going to be used in DT. No answer to this part.
>>
>> Now you claim this OF ID will be used for ACPI devices, but YOU HAVE already
>> ACPI table there, so that's clearly invalid argument. Do you understand how
>> patch/email review works? Where the comments appear and what is being
>> discussed?
>>
>>> The code retrieves the corresponding name of the chip from
>>> tasdevice_id[] based on its order in tasdevice_of_match[] or
>> tasdevice_acpi_match[].
>>
>> Based on the order in table? No, that's crazy buggy solution to tie order of
>> entries in both tables. And it makes no sense... and I am sure code does not
>> do it, so again irrelevant argument.
> 
> It should be noted that the current implementation relies on id_table 

OF ID table is the ID table which we talk here about. Please read again
where do the comments appear, which part is being discussed.

> (rather than OF_ID) to obtain the chip name and chip ID. The chip ID i
> s specifically reserved for handling exceptional cases, for example, 
> the workaround for the TAS2781’s lower speaker impedance issue.
> 
> Since the 58xx family lacks a dedicated register to query the chip ID, 
> both the supported chip ID and name are stored in id_table.
>  This approach allows compatibility with both DT-based (Device Tree) 
> and ACPI-based (Advanced Configuration and Power Interface) device.
> 
> 	if (ACPI_HANDLE(&i2c->dev)) {
> 		acpi_id = acpi_match_device(i2c->dev.driver->acpi_match_table,
> 				&i2c->dev);
> 		if (!acpi_id) {
> 			dev_err(&i2c->dev, "No driver data\n");
> 			ret = -EINVAL;
> 			goto err;
> 		}
> 		tas_priv->chip_id = acpi_id->driver_data;
> 		tas_priv->isacpi = true;
> 	} else {
> 		tas_priv->chip_id = (uintptr_t)i2c_get_match_data(i2c);
> 		tas_priv->isacpi = false;
> 	}

I do not see the point you are making. All last replies felt off topic
to me, so just to be sure - do you understand how i2c_get_match_data()
works? That it calls device_get_match_data() which will return what?
What exactly?

Best regards,
Krzysztof
