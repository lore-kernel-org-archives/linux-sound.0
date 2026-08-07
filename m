Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D5D43CE50
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080890; cv=none; b=CRUYzmLRlmBQOaIGzGC0yB8T3jbuOOVXj2fm6NPgmEG3oDe24ACxsCAcRkSipSwHmtNbPgd8gqqV2VUJp/SXpYqd12TRxfT6n/x19iHjgmxtnaig8A1SEPkwmyPtUVjHbJoheM89wsj6AabDJaSatd6qzfVF0c7rEM/kjtupPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080890; c=relaxed/simple;
	bh=y1+KOvVAfbwUwq2w0AC46kOuD4GsyPE+3xZ5CCt52Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gj/Wtfx6JpJzCkBbReWdNuqW2Q7NZIjIrQ4aU6Y/w6KbbE3xQ5N26O04+ETBv62/9m4VL6WJH4vc/VRMarqL50f9QG5fkys1MIkEJZhSRpSJACfmCyDPPD2BUj/NZ4MRNlLKrN0NSNCTI7L6U/KM9LP7AECt8vtFt1YjCr1cPe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=nQmmypNS; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=nQmmypNS; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=BuOYTTlK; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="nQmmypNS";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="nQmmypNS";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="BuOYTTlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786080558;
	bh=y1+KOvVAfbwUwq2w0AC46kOuD4GsyPE+3xZ5CCt52Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQmmypNSogDV8CKpYcrEP3q8Ds8XaoY/Ae+50XAd/JDkMM46tAmNV6OE/oljio5ie
	 UoXu1/7M7px4W7O9tDngpLoBM29lM1YWvuDhAKTNnEbAMsBkgGw2eYMOo8z+vW9aF4
	 5jobiErfBaVSyn3H7GeRfG9XwvnHKJeTEIlpF1rOGmYUHMXmF7/OCmlVDKn8vrcb/p
	 MM7dFK5AE0aBayJ2argXqFBFbU690B6Vw2MJzQbll9nW0j9d557YzYrRm3lhdmSHZ3
	 BJXJxG1XTXulfpkZZiFgblDK/wAuE6+FxZKZSQookf4NO9uT0TaiDQ0VKPrd+JMmW+
	 3x2N6hTrIJRvw==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 4B0C21AA70
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 07:29:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786080558;
	bh=y1+KOvVAfbwUwq2w0AC46kOuD4GsyPE+3xZ5CCt52Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQmmypNSogDV8CKpYcrEP3q8Ds8XaoY/Ae+50XAd/JDkMM46tAmNV6OE/oljio5ie
	 UoXu1/7M7px4W7O9tDngpLoBM29lM1YWvuDhAKTNnEbAMsBkgGw2eYMOo8z+vW9aF4
	 5jobiErfBaVSyn3H7GeRfG9XwvnHKJeTEIlpF1rOGmYUHMXmF7/OCmlVDKn8vrcb/p
	 MM7dFK5AE0aBayJ2argXqFBFbU690B6Vw2MJzQbll9nW0j9d557YzYrRm3lhdmSHZ3
	 BJXJxG1XTXulfpkZZiFgblDK/wAuE6+FxZKZSQookf4NO9uT0TaiDQ0VKPrd+JMmW+
	 3x2N6hTrIJRvw==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 306621ABD9; Fri,  7 Aug 2026 07:29:18 +0200 (CEST)
X-Spam-Level: 
X-Spam-Score: -1.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786080554;
	bh=y1+KOvVAfbwUwq2w0AC46kOuD4GsyPE+3xZ5CCt52Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BuOYTTlK7R98iSFyRhrqSqh/R3c6TP7NDvjHMAdUl/mGs8wZzy4SuIjiEDhE43LDL
	 8ovzwfmdtg7+Iqm2okbtJbTHREOHhR/IYEV5Q4M0ScfZLvI2OpRXN+Qd7i0YCMNS2C
	 QwS9wavnVRo93X5srHF6s/YQCHy3Q2ppnpIwJxOLmmn068dZQyRNf/UEa24TUw9Ts6
	 qi+MCuXGTQsST6GBrBqB6kU5tnieTHtAaU7sijrl+fMipMm3at9CiGi/9YpZOSda6o
	 r3nSBQhuWYg/ijI89me8fZLPrLKaufRyp6+hupVJaMV/TYyh4T0FAq5czAE5Seeyx9
	 6RtP/onypZ9Og==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 5AAB01AA6E;
	Fri,  7 Aug 2026 07:29:13 +0200 (CEST)
Message-ID: <fda82e76-bbac-49ff-9e0d-c4ae7315aa11@lysator.liu.se>
Date: Fri, 7 Aug 2026 07:29:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/44] ASoC: codecs: max*: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, linux-sound@vger.kernel.org
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87fr0uwwb2.wl-kuninori.morimoto.gx@renesas.com>
 <8ea031ca-92af-4b51-9993-c0f34c85bddc@sirena.org.uk>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <8ea031ca-92af-4b51-9993-c0f34c85bddc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

On 2026-08-04 19:37, Mark Brown wrote:
> On Tue, Aug 04, 2026 at 12:42:26AM +0000, Kuninori Morimoto wrote:
>> We can use .auto_selectable_formats. Let's adds it.
> 
>> +static const u64 max9860_selectable_formats =
>> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
>> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
>> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
>> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
>> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
>> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
>> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
>> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> 
> This has the same issue the Apple controller had where not all clock
> inversion setups are supported with all formats, I2S style and DSP style
> are different with DSP only supporting normal frame.

Hi!

I agree with this, but I worry that more such limitations are ignored.

E.g. max98090 has this:

	/* Remove 24-bit format support if it is not in right justified mode. */
	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
	}

Should RIGHT_J be preferred over I2S/LEFT_J/DSP_A for that codec?

I started looking at max98088 before proceeding to max98090 when the
above problem was spotted. I then stopped looking. It wasn't exactly
hard to find an example.

On the other hand, I'm not familiar with exactly how the auto selection
works...

Cheers,
Peter

