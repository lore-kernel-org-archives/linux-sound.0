Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3AC2EA
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991534; cv=none; b=qu5kVhwt/rkGvvD6fA04r5ZE/kJxNLj/oimiQ8M9uvI3BcrrcYND0SMcxwP0OyQhYdGMeDT/nqm+3Vnho4SvigT+TnVCxYD9ueBa+HlVrZ9eXi+IHiWBXNJgtA9SJqQZzr8jkoYzfcM7rD+E+TZi6HcA1HhQ3Q22KoqwF8URluk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991534; c=relaxed/simple;
	bh=ogHjj3BvQt5jOaR/BGS1ykAyVjZWosinkPDYx0AtBMg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scQxWRC3uD2EoskecjUJGBr3/IIuKa5sn+8+M4mGSbtE87wuD4IZK0JK50+pohRoFKwSJDqnJQVXnDLgHoQdCEuOkAQH+KF61HzDte9+Fz0kgH0PE09zFlOb2M64a7vd6oRbRUR05j8GWzudjceOA4mjrPaYoGJjlgMUAK+Irxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTTm0tW/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTTm0tW/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b855a4700so182479e87.0
        for <linux-sound@vger.kernel.org>; Fri, 09 Jan 2026 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767991531; x=1768596331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbFlw6y6HEdQl5XBQYcsPuzEfVMtaRzKV1+itXfaKAY=;
        b=MTTm0tW/C7JoFuE3bYQeP6Pm4xTNgktuH/Z6SRwPrEyWe3nDcBJNzg2ZlhQ3E1f9fI
         HyuzCLyOv+BOVmWhPqaegSgBdTCkpCV3TNSa0D5YNazBpXq8gX3Cs7+PnQw59M/rwUD8
         wZiTuyDPdetG83S7NtRiB2XmEeeOuXixkgqy8PL2sTSrSi2x3atJkEDH8PcgEHXT3k50
         fZOHXBGmFK8i25EjwMUTCC2E1P26ALNedrBM0h1CB09PsUEO+B6pytc0g3OlH/+isVlw
         EvHc2kH+vJe659kWikdv37cruIidEJBsl9PipPwy+ET09cmBQBSvjrZsFdH1Tky7E7AF
         NhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767991531; x=1768596331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbFlw6y6HEdQl5XBQYcsPuzEfVMtaRzKV1+itXfaKAY=;
        b=tpQZfJ+vnRWQGRTvEmk5X/8zju9Li7ovelanfFgqqhrQIUmR57avIkWq3LaZ/woKHY
         N7sgiR0m5q496fvFrI/VkVqUra2brQE32bjDzbEro+9bMWCv3AqqoO3zxyypGp/LoZ9F
         7s4eEIx8mXhW804L+NRheaO4RXMjiKVY66IANqaDJwrTxuJL4H4PU7WzWzOU6G2xhlqh
         a4XJlIb+exbHUpUflGldBJVx92PE9nYJqYHaJvEDf60B2PHVMZogTjJ/1fUpdxSi7GQf
         xKaoviWwaXH0Tgf7+VC6HQ4isnFzYg0NVwseoD2NvoTbha1v2j6tNi5e+ZZDJpBR+PIZ
         VLLA==
X-Gm-Message-State: AOJu0YwVo1+1OT7pca6MUpIUFGMxLwdtuNHsL8RW67KosOrROrQaiy03
	LoiNUmQNQ+hBEqguU3X/40L7X5tW15elCjMVA16rv3NzLNt2cEtu3yMD
X-Gm-Gg: AY/fxX7ljj8zY28eNbLsLNE1+/9aCEEgiwLENb/qUmOKyVQNjFk6Rl41Wb+PZbULuw+
	UmmrZM+fhCCvlFTRp2CNLDV2CnaD32kPLFQsXJM2OODxG44QBbIIEAT1sKGZTSGOfa/Vhg0CE+0
	9iBLKdmuBHC8lO1F9f7ld1oemmTNIvlSuOyTXA2coW1t6A49KjVDC+jA+495JuRF+t3YmfTs4U1
	VRvTn2GhorVSUuJrjksetvZteQXDrrmBSzS0QQRXJ8v4g2nkfuZiZ6XdMPqGQ0hkptjyz1GgQ+Q
	FNQ+i7XCHCeLeAk1QyV/slj+A8L2qz6yvO+tU9WLVdp9U+WC29MPh3GR7ABZmVJ9VPMn3/g2nZk
	+jJYetU2Utf3O8+iSFm4qjn+j35sQGJaKecF7umCO94GxfdRR2s/w/u9I
X-Google-Smtp-Source: AGHT+IFlHnYZI60n3G/H3ozkjAxTpHjQAd8gdW/aYyEH9M7TWtUCnYa4LAq/1xC5iu68hs85PqhAVg==
X-Received: by 2002:a05:6512:12cc:b0:59b:7301:2378 with SMTP id 2adb3069b0e04-59b73012524mr2988978e87.42.1767991530779;
        Fri, 09 Jan 2026 12:45:30 -0800 (PST)
Received: from corsair ([2a01:799:8db:a400::1000])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6df1a132sm2360918e87.93.2026.01.09.12.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 12:45:29 -0800 (PST)
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
X-Google-Original-From: Roy Vegard Ovesen <royvegard@ark>
Date: Fri, 9 Jan 2026 21:45:04 +0100
To: fenugrec@mail.com
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: accidental revert of Presonus 1824c quirk ?
Message-ID: <aWFo0EV2eWhJrNTk@corsair>
References: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
 <87h5swh8m2.wl-tiwai@suse.de>
 <trinity-f8cff6e0-b542-4caf-bae7-2a84a9a58d59-1767886416445@3c-app-mailcom-lxa07>
 <aWBE7DlmgZLoDkaI@ark>
 <trinity-46fb2e4e-993c-4225-b831-2d03dc541780-1767918098396@3c-app-mailcom-lxa07>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-46fb2e4e-993c-4225-b831-2d03dc541780-1767918098396@3c-app-mailcom-lxa07>

On Fri, Jan 09, 2026 at 01:21:38AM +0100, fenugrec@mail.com wrote:
> That is so strange ! At least we're running the exact same system & kernel so we can rule out a few things .
> 
> I wonder if pulseaudio/pw settings could have an impact on the hopping between altsettings ?
> I'm not running pipewire, and in pulse's pavucontrol I had the presonus "profile" disabled.

Normally I'm running pw, but for this testing I have stopped pipewire completely
and use alsa directly. So far I have observed:

- Reaper, Ardour and arecord are working fine.

- When testing arecord I have to use -D plughw:S1824c to get direct control of
the device. If I use -D sysdefault:CARD=S1824c it always uses sampling rate 176400
for the device and, I assume, converts in software to the sample rate that I requested.

- By monitoring USB traffic with Wireshark I see that when for example I run arecord
it first checks and sets the clock selector, then it checks and sets the sample
rate, next it sets the interface with altsetting according to the sample rate.
When recording is done it sets the interface with altsetting to 0.

I'm wondering if one way to make the 1824c panic is by setting an invalid
sample rate and interface/altsetting combination. For example setting
sample rate to 96000 and interface/altsetting to 1/1 for playback
and/or 2/1 for recording. Are you able to monitor USB traffic when
arecord fails and check if it tries to set an invalid sample rate
and interface/altsetting combo?

So far I have not been able to break the device in this testing session,
but I will crack on.

-- 
Roy Vegard
