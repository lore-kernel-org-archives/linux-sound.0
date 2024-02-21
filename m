Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D2126F35
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552001; cv=none; b=kpDilOEgKK2jR1T6I+NheRKZbOttDTZfmMODAi1afG6BpiJDCJG1ionAijNluUS7+iQphJqWpL27lvlgGwemRzcqFmr+zeXokXjUbdDAZFhM4E6HgxqvOthuU9ugNFxUp8ninca/1Hjur9Z0usGKn4OdHwBu9j0aoTxq065X+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552001; c=relaxed/simple;
	bh=of9bAtEogX5ECgh9Cm9HB0yowv3h3jorHP2cz4TfNmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXfnuzniEzfXPWs1Sae/HinPn2NcjpcD1b0+sr7xGr/l2Obc26ewxxZ1yCirWMRKKcwqd8tBstrC9QPzWs9tw+6vKd5JqdSIDvS56uPAt419pDR4VCujwc0wlJZQ8MPz46PuUGgIg6cd7cwcRdLuCw9mLLxSGiOKL3sfIh6IiG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KdPSqg9w; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KdPSqg9w"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-365138d9635so19391945ab.3
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708551999; x=1709156799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+QKepU2MbI4a/2CEG6x48g/5yOOaTqkeikoyN0HwE4=;
        b=KdPSqg9w51T7mvoBvMapZ4uHalkw+HZdr4AM5nOb1DMOYnXNzQRN4VRJV444r/39Bb
         Zril6J9mHKplS8MH0XzLxng943Uec2oSGERvWfGSe4QgYZnQNiMwiVBfiWQZULj2An9A
         Co1H9UGeJf6uJqacJPwgeGAa1eKs2bWERAYu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551999; x=1709156799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+QKepU2MbI4a/2CEG6x48g/5yOOaTqkeikoyN0HwE4=;
        b=Xo9UDY75q1DIa3fff4DszJqf0VcvifMhnzeslUG2V40WKwjYurZUXxwGQb7pqBRzAm
         dyK3efn2LDeLdiZhr9CQuV7bHV3E+K+OAgUeIwzlE8U5dBw8OVYnRI98sBPtDdR6DXVN
         YSMJ4AfNhIV+F9QMNwYHC+gj6+7trh/g2jGzZwKkT5JFpS9b2qtE6NukMr85FCKpT9zo
         h9kaHugPUStvbQrkVkXnpfJvKCAgn3g4mRQ43FBpMA0O7c9fwq/cUJitiKBb851t0dHq
         Qg6IyFKsZKJb3ZGiH65HJt24xOJ2cmiJ9nrI+35DIUAxzN0Czu625bP0lJkTigGa8YIE
         8nbA==
X-Forwarded-Encrypted: i=1; AJvYcCVnJ0qfQSr0NPmRBuAf8sE5pKMTYgfOTOss1Nclbl6kVLcJHXJ49W5JvSi/OxPNHyWU6DG+4b+/AoLnbIM8LZ5HWHe69Ui3XXFKMKE=
X-Gm-Message-State: AOJu0YwEt9o8eA5NRWBgQL7s8LoqcIEO+vLu3bIRNnjf6/odrGM8xSVp
	aPLhG4B3agDqDkFNsbQ/856Bvgx2DiWxxHF9IN9d0cxcAnAtERKC5z8sMhsnwg==
X-Google-Smtp-Source: AGHT+IFBUZzWY7+Gyh4073StMQynW71O1XhzOlaNGslbtvVVdGagjjqiCcd5gNO5djx/h05+c4TUWg==
X-Received: by 2002:a05:6e02:c6f:b0:364:2406:992e with SMTP id f15-20020a056e020c6f00b003642406992emr20453456ilj.23.1708551998951;
        Wed, 21 Feb 2024 13:46:38 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id b11-20020a05663801ab00b00473e844f978sm456921jaq.32.2024.02.21.13.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 13:46:38 -0800 (PST)
Date: Wed, 21 Feb 2024 21:46:38 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Message-ID: <ZdZvPiEVKgciB-cg@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
 <ZdZcLOlSc3FScjLK@google.com>
 <503d9ea9-9812-498b-a5ee-2579ba8a7ecf@wolfvision.net>
 <ZdZokatitviYZ7rg@google.com>
 <6a4f1862-ccb1-4d6d-bab2-f22090a1a08b@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a4f1862-ccb1-4d6d-bab2-f22090a1a08b@wolfvision.net>

On Wed, Feb 21, 2024 at 10:33:53PM +0100, Javier Carrasco wrote:
> On 21.02.24 22:18, Matthias Kaehlcke wrote:
> >>>> +/*
> >>>> + * Fallback supply names for backwards compatibility. If the device requires
> >>>> + * more than the currently supported supplies, add a new one here, and if
> >>>> + * possible, the real name supplies to the device-specific data.
> >>>> + */
> >>>> +static const char * const generic_supply_names[] = {
> >>>> +	"vdd",
> >>>> +	"vdd2",
> >>>> +};
> >>>> +
> >>>> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)
> >>>
> >>> This will have to change when support for a device with more than 2 non-generic
> >>> supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
> >>> ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
> >>> with more supplies, but that change would be more straighforward.
> >>>
> >>
> >> I am not completely sure about this. Someone could increase MAX_SUPPLIES
> >> without adding a generic name.
> > 
> > That's perfectly fine and intended. MAX_SUPPLIES is a max, any list
> > shorther than that is valid. Any longer list will result in probe()
> > being aborted with a clear error message.
> > 
> >> Actually two modifications will be necessary for every addition (name
> >> and MAX_SUPPLIES). If ARRAY_SIZE is used, only new names are required,
> >> and MAX_SUPPLIES is automatically increased.
> > 
> > As per above it's not necessary to add a new name when MAX_SUPPLIES is
> > increased to support more non-generic names. It would only be necessary
> > if more generic names were added, my understanding is that this
> > should not happen because any newly supported onboard devices are
> > supposed to use device specific supply names. I don't like to idea of
> > adding unused pseudo supply names to the list, just for the sake of
> > using ARRAY_SIZE.
> > 
> >> I understand that the whole point of this is getting rid of the generic
> >> names, but we still have to provide generic names for every extra
> >> supply, at least for code consistency and to avoid size mismatches
> >> between real an generic supply names.
> > 
> > Please let me know if you still think the extra names are needed.
> 
> Not really, the only case I could come up is if an existing device that
> uses generic names might end up requiring a third supply, which would
> also be generic. But even such an unlikely event would be cover without
> ARRAY_SIZE.
> 
> Actually one could argue that every existing device could have "vdd" and
> "vdd2" as their supply names and remove checks and the generic array.

Sounds good to me. Another similar option would be to assign
'generic_supply_names' to '.supply_names'. I don't have a strong
preference.
