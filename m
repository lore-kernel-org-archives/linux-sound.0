Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ADA43635D
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929810; cv=none; b=J0aBBrXM6Y+PWGOWyR4mdt842KnsHgaaA7VtoRJiK1bpqE515UwUt+OV9rmWoYd1SRSw6mqON7hCroOmT+bJ/LwQLiHSTd8b6PItzZLIsmvFKJE5ikGDRmyGiH+SxsDmS1ihwcXPF2WgGul1GH/DXR6Uf56cXhEzyJhDzInPxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929810; c=relaxed/simple;
	bh=HvOaSyaubcWGnvu8G7COzydNX4gVIagbZo6JUJnP/jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWpFngu3fe0bQMmNBmA7lyaS/EO3WwqoJ/dGUit7NnVqv/s2Ps0c8zBOTsVAl9lWY6sDvG8M9xxrbDA7D60u6SYtUzUneoMisJkaRvSPONkK4iTYcwiK70204hnB9/m++5j1VcfmtnVqaweqgJ+0K+vn+iCUW7Wf06jjkhlno88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJLnBNAD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJLnBNAD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e347638adso920741a91.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785929806; x=1786534606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5l7FenGvrQnRcqxVxpQbcS8hPgr2hqhc1H3dtV5WU08=;
        b=fJLnBNADcINKop1UZ1vhyWAAPHxAIf2g0cywh0PS5WCnRWw7SPjZp2CaOow+ADHxMI
         vFb5Wobra0BWFDBNd+y5K6xmWKtIX+DV8bbSrF80SdOFhWT5y0Hm2lLDX0eR9s0ICPQv
         ShpN47jOgAaOzXTPlIMFBdOkumnG9YLR1yKRj04Zyhe4EAXIBIqmANXynpdihx6NI84K
         V/ArQP5ne7D3ifv6PKKuE/ZxvLmGEcw/OyW8cC7Vsd0QA5YdPGLxF8AHofyoSFn2RkRo
         c2q+tAwUjQt21SDjdsghLyhNO1XhqLomW52RqQPESI49TKLdDhySagrnl+57npNdtoaz
         qTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785929806; x=1786534606;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5l7FenGvrQnRcqxVxpQbcS8hPgr2hqhc1H3dtV5WU08=;
        b=TCixLKq7RLKq5ranI42bmEimAkvbFF+a5PrANUryIqm5+nR3Zg4hROMYh777UDxvoi
         +M8VR7Pkc0T1qUDujdqHqOkajwVUmsayDm4tQ/tnJsVlLD5JfBLrh8+FXrf5zRT/apZ9
         8eyAlbKCljAgLAQRI0sPB8D2eeanWh53JgYX1gBHtx8KD/XvjqvzTCFjemSJCgojBAH7
         FUpQIkBrOd/OvJvddqH7G2ZXUXRBtwH34MrwHpCB8e8eV4ooznBIaKCxv1GuicmvSAJ/
         bHgkcLmocRHeaHM3knjZWn9ViA/3imGSFuzS7RVW/YKP70O2FDHxCfWJ5s7Qi+6OhBGH
         cSIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWppolb7PwTuCCgyQVtyg8Rp5XbayeQSLXpsxK/YTo5PSDCuvJrCT7Iht2A5M7KjPzfLQaSV3s7BOdiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHil1qQwGUvkw5lbcP0mCjoJFylwYxAiwfph8BiUC1uBzrKORF
	E5DKvzQVaDiMDWHtqqTdJPrMm1eDlypsU8x0NZFaodnkCFs9IFD2i7yr
X-Gm-Gg: AR+sD10/Nm8h9VXuUavDlClYR8ofyVVrj/jm2NnN1rcnhMfrQes1731/Fn/adp9alKT
	xCy410M8TzYzVfEmd9os8DpghDiPHbi2RxPpLLGnkhUo6VE+W+NyHp5CQRVeV3f75mvEU4CCD2x
	NgRRbXep5TVmRGmEChMkOOo3G9fgl+TmOzGye4cjWybMDtHpoy9SSOO75I9YxyjW9MKnxXHa3A/
	xqYhaTrm2ees/hF/PyCgsBIc6vR+5Ib0fOqCQNa9to//Up1DkhT6VCUnpLfSyvU8PZTaLGWhgs2
	MUUCRgk2Ep79UsRykBOwTSb70MMfvGdwb32A5L4GwB/ei7rIoocaJSs6R0T6OtFMCaT64m0H3/j
	m6qdeCHzlzWOUhQZl8nND76Gm5OwzAI5XquKViaXjdsofAsI7+dSMccoIC99LH+7Cv4pmP60wXX
	v9mBHU/4bN+ne9PzzfplW/6XBNqZMoxVLrJu/6y4QzHOYVP3nnTnYeAdcLIDm/uJEAwvlSmW2Wq
	iGmF+KNrtk1F2GSL35F/QB5EA4uyLs26rwzgGW8A2k=
X-Received: by 2002:a17:90b:6cf:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3903c559075mr6498561a91.8.1785929805614;
        Wed, 05 Aug 2026 04:36:45 -0700 (PDT)
Received: from [192.168.1.110] (111-243-10-58.dynamic-ip.hinet.net. [111.243.10.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903927db6esm2893962a91.10.2026.08.05.04.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 04:36:45 -0700 (PDT)
Message-ID: <79bc356b-e727-7e40-9faa-e622c9a24ee9@gmail.com>
Date: Wed, 5 Aug 2026 19:34:28 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
 <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
 <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/26 18:30, Mark Brown wrote:
> On Wed, Aug 05, 2026 at 05:03:01PM +0800, YLCHANG2 wrote:
>> On 8/4/26 23:58, Mark Brown wrote:
>>> On Tue, Aug 04, 2026 at 11:29:51AM +0800, Neo Chang wrote:
>>>> +	switch (clk_id) {
>>>> +	case NAU8360_CLK_ID_INT:
>>> Usually we don't have a lot of fine grained control of the internal
>>> clock dividers of the device, things are a lot easier when the device
>>> just figures out what it needs based on it's input clocks.
>> To make sure I understand: Should we remove the internal clock IDs from
>> set_sysclk and handle clock configurations automatically inside the codec
>> driver?
> That's ideal.
>
>> Does this mean we should avoid configuring them via the machine driver
>> entirely? If so, what is the preferred way to handle clock fallback when
>> playback stops or MCLK is absent
>> (e.g., via PCM shutdown hooks or DAPM events)?
> What do you mean by clock fallbacks here?  Presumably there's some clock
> still running, if that's the only one running it's reasonable for the
> device to switch over to it.
By 'clock fallback', I mean switching the clock source back to the 
internal clock when the MCLK stops, in order to keep the DSP alive.
