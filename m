Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96235B12B;
	Fri,  6 Mar 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793689; cv=none; b=SjFWDXOZdnFfrk1GtxE2BA0bPlvEsf4kotWimEb+J9lpSFzjYyKr31kYxqMOmRrRED32x9ZM2/ENFSjaMdoQK8zIML1gR1IgQeKyZQ1JeZ49OxrqkPyxr8ehqYCa/kz9Zd3zsGyuLL/ruE9iNjUsOiBqXBqXhVx6FsrGOrgNMfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793689; c=relaxed/simple;
	bh=wUC14RnhdvcAhcWHU9TzbgcAedD2DWvQjmFMdi8UmZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfqUhzVp05YD5z/+G0F5334PgpLO07Uvu9t3q7QROhNZUQ+a1QA5QbyoQLK9jFBaCP7Evew+F2H1tJAPTfrGEOR1csfk5peZgh+tqrug8lQegRo4ipsYMmm3hbxiRNYsQJuyRGpRfJyD2/Ef0YmnxvjKC29A+U8PRFRucf9eNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlqAXWcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlqAXWcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E47CC19422;
	Fri,  6 Mar 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772793689;
	bh=wUC14RnhdvcAhcWHU9TzbgcAedD2DWvQjmFMdi8UmZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HlqAXWcdQBTWqkBU+RvjncHg2W2umlwoZVD32c3UXJcQPcr+23oeH/8yjmfdfqM3U
	 19wihtbQXOhwACWoSBDh69qhginNXcXV8dBtlYgDXnNCiqirYoBqqoDfFYCkvD+uRE
	 dx104NBd1oc5EJmukGDFTHcUQ+JO54vNElmJm3tomEH4gwCkeTF0zF0+AJbJrL/SJF
	 GJvlxr4NpnZbhT7hzedjYNuvWXu27IFwIu1/8EMfKOY9lDqdLYIqwOEoxD/LlF4aXa
	 766PV8+6CC7jF2rTWnVJY+TaviOzRbo/OIfPQ33CjfI70Q+mC308VevW9opsngxIXQ
	 k5hN2wL9ZbgHQ==
Message-ID: <f16d2a7f-04e2-4d99-9239-caca9fd1f7b5@kernel.org>
Date: Fri, 6 Mar 2026 11:41:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: "Xu, Baojun" <baojun.xu@ti.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "13916275206@139.com" <13916275206@139.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Yi, Ken" <k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
 "Chen, Robin" <robinchen@ti.com>, "Wang, Will" <will-wang@ti.com>,
 "jim.shil@goertek.com" <jim.shil@goertek.com>,
 "toastcheng@google.com" <toastcheng@google.com>,
 "chinkaiting@google.com" <chinkaiting@google.com>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3af19ebaf32d482ab5cf575b831b2d9d@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2026 11:08, Ding, Shenghao wrote:
> Hi, Krzysztof & Andy,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, March 2, 2026 6:09 PM
>> To: andriy.shevchenko@linux.intel.com
>> Cc: Xu, Baojun <baojun.xu@ti.com>; broonie@kernel.org; tiwai@suse.de;
>> 13916275206@139.com; Ding, Shenghao <shenghao-ding@ti.com>; linux-
>> sound@vger.kernel.org; linux-kernel@vger.kernel.org; lgirdwood@gmail.com;
>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>> devicetree@vger.kernel.org; Yi, Ken <k-yi@ti.com>; Lo, Henry
>> <henry.lo@ti.com>; Chen, Robin <robinchen@ti.com>; Wang, Will <will-
>> wang@ti.com>; jim.shil@goertek.com; toastcheng@google.com;
>> chinkaiting@google.com
>> Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832
>> support
>>
> ...
>>> ...
>>>
>>>>>>>>>>> static const struct of_device_id tasdevice_of_match[] = {
>>>
>>>>>>>>>>>       { .compatible = "ti,tas5827" },
>>>>>>>>>>>       { .compatible = "ti,tas5828" },
>>>>>>>>>>>       { .compatible = "ti,tas5830" },
>>>>>>>>>>> +     { .compatible = "ti,tas5832" },
>>>>>>>>>>
> ...
>>>
>>> I don't know what you are trying to get from them, but I²C enumeration
>>> on DT platforms works in a way that it takes two tables into account,
>>> hence, if there is no compatible (with given part number) there will
>>> be no matching name.
>>>
>>> AFAIK it has to have a compatible to make it work in such a case.
>>> What did I miss?
>>
>> Show me please then how the OF table is used here at all to get the name.
> 
> This code will also be used for ACPI devices. To ensure consistent bin file 
> naming between ACPI and DTS devices, the mapping table tasdevice_id[]
> has been introduced.

We need to stop discussing with irrelevant arguments, really.

I asked to show me how this is going to be used in DT. No answer to this
part.

Now you claim this OF ID will be used for ACPI devices, but YOU HAVE
already ACPI table there, so that's clearly invalid argument. Do you
understand how patch/email review works? Where the comments appear and
what is being discussed?

> The code retrieves the corresponding name of the chip from tasdevice_id[]
> based on its order in tasdevice_of_match[] or tasdevice_acpi_match[].

Based on the order in table? No, that's crazy buggy solution to tie
order of entries in both tables. And it makes no sense... and I am sure
code does not do it, so again irrelevant argument.

NAK, because all the replies so far are off-topic.

Best regards,
Krzysztof
