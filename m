Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D627395DA0;
	Mon,  2 Mar 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446045; cv=none; b=YFwg2bLNkgbUiafMcUctg9f44Gf2dHfDELaRzjXaOs4krXBSxnfkfitvHmH1d1aJUn2mgbXXpZ+dAPz1unC71vkgJ4tkh6JUTpBjb7v/j4p284vH10jdhzLsIGQF3fcoOD3knH41jY5qdKpENG8vbVGViOqE5Jgwj8TWcs65Chg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446045; c=relaxed/simple;
	bh=z4Z4iggxR7ebWPQZD2ZayLiYcVKlocv7IQjUKO3+ScA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCAhZ56zgWJPs5Wr1EjP9m62wLlEec6GjAf0SRgoMpz1lngC9yFb8SssBqOl+z4lZuHxRNKJfmTX5I0vXGAbT5Y3/xEiZtssJTsmElaqxjJ72bmnpBGwB0eIRiaXkXKLdhCHGyWPtWN5HGDyBWywFmpMVs7yRONRTw3TiXyGZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOY3XL5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOY3XL5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514A9C19425;
	Mon,  2 Mar 2026 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446045;
	bh=z4Z4iggxR7ebWPQZD2ZayLiYcVKlocv7IQjUKO3+ScA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sOY3XL5orV6+Eol++gw/re7ejgloFi+VBHpCcgwLZn4WqssOwVOVNrmITvaX1xy1q
	 VCK5LJUl7koi9HYdbClYPwWpceozAfY8w7xQEcVYrCGGXO2aPGEhG8QpkbO14GweS/
	 YgBsbbXsjJLIklGCJWcGICxFmigS9kiy1b+4MeuQeQpwPDa4nKy5ZZz+Vq1bVZhrvN
	 9ASUbfHtRKJp3EhpU2C+xGG6zC+Uh6zcN9cvbN/IAJwt2UzSkRO7NpPKixL6gB9prb
	 AQPMrM7hYjIkXWpN3wnT/OApsd+u6aQnde/inqHFVi/cnSTosYGIxgFMz/PPt+3DGP
	 ks00rwN319WUw==
Message-ID: <cb84f8cf-d3a4-407e-bc09-8757674e3065@kernel.org>
Date: Mon, 2 Mar 2026 11:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de"
 <tiwai@suse.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "13916275206@139.com" <13916275206@139.com>,
 "Ding, Shenghao" <shenghao-ding@ti.com>,
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
 <ff6d64fd8f954e82832e7470e20f955e@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ff6d64fd8f954e82832e7470e20f955e@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/03/2026 10:37, Xu, Baojun wrote:
>>
>> ________________________________________
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 02 March 2026 17:27
>> To: Xu, Baojun
>> Cc: broonie@kernel.org; tiwai@suse.de; andriy.shevchenko@linux.intel.com; 13916275206@139.com; Ding, Shenghao; linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo, Henry; Chen, Robin; Wang, Will; jim.shil@goertek.com; toastcheng@google.com; chinkaiting@google.com
>> Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
>>
>> On 02/03/2026 10:22, Xu, Baojun wrote:
>>>>
>>>> ________________________________________
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: 02 March 2026 16:58
>>>> To: Xu, Baojun
>>>> Cc: broonie@kernel.org; tiwai@suse.de; andriy.shevchenko@linux.intel.com; 13916275206@139.com; Ding, Shenghao; linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo, Henry; Chen, Robin; Wang, Will; jim.shil@goertek.com; toastcheng@google.com; chinkaiting@google.com
>>>> Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
>>>>
>>>> On 02/03/2026 09:24, Xu, Baojun wrote:
>>>>>>>>
>>>>>>>>>  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
>>>>>>>>> @@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of_match[] = {
>>>>>>>>>       { .compatible = "ti,tas5827" },
>>>>>>>>>       { .compatible = "ti,tas5828" },
>>>>>>>>>       { .compatible = "ti,tas5830" },
>>>>>>>>> +     { .compatible = "ti,tas5832" },
>>>>>>>>
>>>>>>>> So it is fully compatible with tas5830 and most of the changes here are
>>>>>>>> not needed?
>>>>>>>
>>>>>>> Yes, it's fully compatible with tas5827/28/30.
>>>>>>
>>>>>> Then above hunk and many others are not needed.
>>>>>
>>>>> Hi, because those chips have different on the voltage, so the parameters
>>>>> is different, have to use different firmware binary, so we must identify
>>>>> every chip in the driver.
>>>>
>>>> That would explain other ID tables (and should be briefly mentioned in
>>>> the commit msg), but not this one, because here you do not customize the
>>>> binary at all.
>>>>
>>>
>>> Hi, we save the chip_id in the dev_name:
>>> strscpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name,
>>>       sizeof(tas_priv->dev_name));
>>
>> And where do you see the name in above table?
>>
> Hi, in the patch of first email, I has added "tas5832" in array tasdevice_id.
> 
> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
> index 41b89fcc69c3..9228b3b6383b 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -119,6 +119,7 @@ static const struct i2c_device_id tasdevice_id[] = {
>  	{ "tas5827", TAS5827 },
>  	{ "tas5828", TAS5828 },
>  	{ "tas5830", TAS5830 },
> +	{ "tas5832", TAS5832 },

And was my comment next to this array? No.

You keep bouncing messages without replying to the actual problem. So
let's rephrase it - provide arguments, e.g. logical code flow analysis
coming from human not AI slop, that change I commented under is necessary.

Best regards,
Krzysztof
