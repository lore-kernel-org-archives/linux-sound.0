Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3A47DFB0
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630827; cv=none; b=KyOYGkpKFBl+DIEqkaK2uujfgbGAgu7F9hZZuxdFDxv/aZXsPiPk4jvrMdy2y4mvweFQrS4aA4/F2uPss92xnlrgOI10fuPqTZRYkn/TFeTFNZ5XFrmPPEosu5Sl7OaqraQ3v83C/69sHsZ7MVbUAmRjk0AYjOfZw4wS4QuUZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630827; c=relaxed/simple;
	bh=SUwkPtlXOsmNP6cF1T8HNSBcjNt+gAHsjYjGGbvyn1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZBurz/kPFPVqtgmzEqruSENSi4oJjH0O1RhipKCj+6X/sItE2sj7ZIqpV0LedAu6UG9SYqfhMIuOuUU/1JAP9ZjcrNX0bEZE13DxFyhj3ZxSYVZGaPjhFnFpcFyE4pWzSngo3G5EaJDr22mruhDdZj1z/5C3N97Hw12id4zOlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech; spf=pass smtp.mailfrom=montane.tech; dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b=eiC+aj6E; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=montane.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b="eiC+aj6E"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-47fad256d40so742315f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=montane-tech.20251104.gappssmtp.com; s=20251104; t=1786630821; x=1787235621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SfAKGmfr125rj4bOdK9jysD5mNls1GfBxGnD+4aAwQ=;
        b=eiC+aj6EeQG9T0tI/xjqXpVCbYb1mrpEZvEGPKYSMtBof8MTrgYJg1Q934hWyECplg
         cl9+QrgfJ9u9rhkerjIoRnI8eiNTw3nCmtWOIXGBTvEE3kNZhdpNJhBvg0g6XdFVTM2c
         376DNEJiS4bwU/CNbkZh1i5dyQqDcNoHSEotVVFPkQsRy3vJEyKUHmLQY3cCA2xUedl2
         8p/3YqdU+PVFVngwrxU8FlYJuw6WF0/0jq1Sqfxe396AfsQwfeQyh62OWTvSETDWeU+j
         uvb4Pzra8WmfSfJYADi6JCs5rUu5Z63Ab6UDFGzy41v/knnfTSI6E0N5EDsyEldDKJ7W
         0/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630821; x=1787235621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SfAKGmfr125rj4bOdK9jysD5mNls1GfBxGnD+4aAwQ=;
        b=F5ILt28x5J2Yh84LecmPB0E36ZUgcLlfUc1J1EIXgI8+dD4kHaWtR37ir3M22UxSTH
         Q9TsCpuq4cd5SO5WaGVZdnL0xERzCmRaZA1CgPmtiRbBX03isotKJgLJ0t848dmL6iSb
         p16dN7L0LCqDfU7UWAnWHOi4ITthnAkuvO6vDDBHnKj1oxSIILsnXiqwpqQy4oygjgFA
         nz2FN1/XS7ll41L/QV/Nj6YV8YpLPJpxRzze1CwiydLje57pWkTKru8sDf3Qt+O1z91y
         sQduA/k4C4FSSRgQteBaXIiwq5J8kttb81WZtnfubnwlA3BEkhE3JbS4TPZknIswYq16
         7wMg==
X-Forwarded-Encrypted: i=1; AHgh+RoaQrHi8iq7xRRcd358BRvC+onnfzAbgs60ZzxWEe1VC27TJU6UFQakYUXCXddMLDTLO780sjfrUJtuUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0xENy905hkGm31YtJlQzCohjJg8ySwXEktwjof9NrJUISz2W
	T5R41olSmHVSEw0zshLU2ZfEbbyRIGfQxpcJU3/Z202OWEJ7aulOWc2JKOWw8qC69nc=
X-Gm-Gg: AR+sD11/7EE0inXYJ3urzPKz6ZKvW93p9AnzcMqGy0wEcc/MTUtxme2s66fJtx2hLRe
	yH0tZqbtg4di4ge4n6yS3ONWgEg7qLMm9x/Y1qXxD3LHmyJNo6Ltk5cWiMhsfzOsJlU0jKVnmDn
	+4X7Xr9ywCpFddrhoR44RnSb/kFZ+3esM2bghtXyncEdoZ5cAveeWMr2/80H2eXG+4BmFbGEAwj
	hw5Vg/su7esQ25Gu7m/Zi4Lfj+xxiHWo49GFeFcRr4tXf6V8XYyh9OJ18UT5CUxY2RJCVslSUB1
	UMJYNWliMRhJ5yf1Mh3Dq36ROEYWI6MmYsh1He3kemHq2XYhVAnGTsgrNfkKTnLSuXJp4b/DjO2
	DoqLI48WNJXhvKOy/K2ZdoFP/zWIb38zUUcR0zhQWzK2GBmEGM/i4niHEIpMVDMjdCz5PtGcABH
	Mdbq5SW8vHCDRRmSPYYWED+13LchcudHNtFUefIZkE+WGTlZnWCyXQrivL9UU4B6fNOuFnt2MRz
	PsFMLzQdVZhK0fqIb7e+6eMGb2uHjryUtc=
X-Received: by 2002:a05:6000:298d:10b0:481:568d:f119 with SMTP id ffacd0b85a97d-48159b1d3c1mr7239694f8f.0.1786630820511;
        Thu, 13 Aug 2026 07:20:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f07:9aa0:716a:50d3:66d8:1244? ([2a01:e0a:f07:9aa0:716a:50d3:66d8:1244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a561296sm7481229f8f.4.2026.08.13.07.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 07:20:20 -0700 (PDT)
Message-ID: <569970f2-c6fb-44dc-9cc6-3ec9d9213c20@montane.tech>
Date: Thu, 13 Aug 2026 16:20:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps ->
 mono output (AMD ACP SoundWire, ASUS ProArt PX13)
To: Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Robin Everaars <robineveraars@pm.me>, Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-kernel@vger.kernel.org
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
 <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
 <cc1960d677a7f5a5c86d48c3037c0aa6@gmail.com>
Content-Language: en-US
From: Antoine Monnet <antoine@montane.tech>
In-Reply-To: <cc1960d677a7f5a5c86d48c3037c0aa6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrey !

I'm ok with you sending the patch !

Thx

Antoine

On 8/12/26 23:33, Andrey Golovko wrote:
> Antoine,
>
> your patch from 27 July is still the only working stereo fix for these
> boards, and it is now the only one left: Ville withdrew his series on
> 11 August and asked that the tags go to Robin and to you, and nobody
> else has posted anything. It has never been sent as a formal [PATCH],
> so as things stand it cannot be applied by anyone.
>
> I think it should be, and I would like to know how you want that to
> happen.
>
> Where it has been tested
> ========================
>
>    - your machine, ASUS ProArt PX13 HN7306EA (the original report);
>    - mine, ASUS ProArt PX13 HN7306EAC: Tested-by sent on 7 August, and
>      re-confirmed yesterday on a current broonie/sound for-next kernel --
>      speaker-test -c2 -s1 is the physically left speaker, -s2 the right,
>      with no audible level imbalance between them;
>    - Robin's board, same amp pair, where the one-channel-mask approach was
>      independently established and measured.
>
> Robin has asked for Reported-by: and Suggested-by: on the channel-mask
> patch, since his 5 August report and the follow-up measurement
> established both the approach and the positional behaviour of
> sdw_compute_slave_ports().
>
> Two options
> ===========
>
> Either you post it yourself as a proper [PATCH] -- which I would prefer,
> it is your work -- or, if you would rather not spend time on it, I am
> happy to send it with your authorship intact:
>
>    From: Antoine Monnet <antoine@montane.tech>
>    Reported-by: Robin Everaars <robineveraars@pm.me>
>    Suggested-by: Robin Everaars <robineveraars@pm.me>
>    Tested-by: Andrey Golovko <andrey@golovko.me>
>
> Just say which, and if the second, whether you want anything changed
> first. I will not send anything under your name without your word.
>
> One thing worth putting in the changelog
> ========================================
>
> The name_prefix -> BIT(n) mapping reads as if the bit chose the channel,
> and it does not. As Robin measured, inverting the two masks between the
> amps does not move the audio: sdw_compute_slave_ports() advances the
> payload offset by hweight32(ch_mask) and never looks at which bit is
> set, so a one-channel mask fixes mono by defeating mirror mode, and L/R
> then follows codec order in the DAI link, which on these boards happens
> to match the speakers.
>
> That is worth a sentence in the commit message so nobody later reads the
> mapping as an ABI promise. It does not make the patch less correct -- the
> split it produces is right on three machines -- but it is the honest
> description of why it works.
>
> For completeness on the SDCA-correct alternative that Pierre-Louis raised:
> Ville measured that UDMPU23 ClusterIndex is simply not implemented on his
> TAS2783 revision, answering COMMAND_IGNORED to writes and to a plain read
> alike, so that route is closed at least on that silicon. TI have not
> commented on the intended mechanism.
>
> Unrelated, but you followed it: the "no audio after s2idle resume" problem
> you reported in July is understood and patched. After S0i3 the amplifier
> comes back with PDE23 at PS3, and a data port cannot complete channel
> preparation while the Function is powered down; the power-up only ever
> happened in hw_params(), which a resumed stream never calls again. Patch:
>
>    https://lore.kernel.org/all/20260813001500.9218-1-andrey.golovko@gmail.com/
>
> Thanks,
> Andrey
