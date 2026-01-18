Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D4C2FD7BC
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768758962; cv=none; b=kZm19+rBkj7eCqwZxEMrP8crOC+JcngSyaVWEIGkNHgd4MS+ymRUJ70cq5deoTsJifWvtfH34yuOLX6SBT6lrEfeM5jFJwl8dBamEqY4PARFZ9aKwTU8LnoU94gRkLMG7gx2GdigwY6angL4KKJ/HvuAV/JgKRU0mGpFQfMl8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768758962; c=relaxed/simple;
	bh=Cc02viVpEJM5zY+cD0JHltfguubiCXPcNGv6tOSGjus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhyEY1vf/jRmTRQERc/qdgaP3I1+h4I9HNb5x42EeFaXz7fIkonQwA1w4/u6oVzHEJl1gTJ5IFyoFccKf9LPeZKd/Sb5GLKUTbic7P3Te/2Qz9F6TAZU9QWbj0Q0Udy15UJ3gpVvG8oeKbMX1MiBFBBCZaE/UMniRaTFIAN7dSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExXiwYo7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExXiwYo7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso23210065e9.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768758959; x=1769363759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmufyVTFi2Nm8r9yuM1MA+Nz0GRNSPj6jIbhD8ad9xY=;
        b=ExXiwYo7eGrOGhBaJX5ze0KqbdSB7nR3TpZewdhUBEbmJjHgOZUgJBkDyiaI5U9wsy
         QLW8Fd2w46SWxlOAfYAaLyQYdJf0SDxkBsSQbwgdnlMDiWYW+3Eq1c0Z/SRNqgUNie1q
         7EBMyv1tnVNXbduRqAe06LEcn53Dus/yQG6UX5mrVKgReSAnpRCZLpH9uoRV9/JpPsuT
         q0X3yv6lQY0LQNKZXmQe+92uqLhCUXRhHvIsWj8hM+f+CPRz8qVb3p5KhK1Xp29SaZRC
         IcUcJeyKJlsJD0DqWn3NCQhQEZLnVBBWUUmoI/DgLuDywxjBQg6R89svQFOIC4GVJuOA
         LSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768758959; x=1769363759;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmufyVTFi2Nm8r9yuM1MA+Nz0GRNSPj6jIbhD8ad9xY=;
        b=OkUXwkNdGo2vVw+05xF8MlmM5IC3Jt0RCiGV0hdnRqlCRnlTOal1V3qzfCLGZS7CNV
         sjFP0jHw4v6rP6s57dReFskr3Hl4lewTiTdbvLq2iV4zpnTqhqQAK81GmYQSYhdvVYjD
         QL4+h6m8yb9PWPuCkv7FCURrAQXVgU/RxPjpxJcXmJCR39YNGfWvTUYVyJczJfqt2PlZ
         F9HaXwD8A48/x3Yib53z9wsGHS8+ECaJOQoZpVXPwtr8LyHJzElWfo9TrEsgfODj4Wwy
         XbxMcOqUA+rExjEzFFXmjEazjZG2mY0mRP4Sqo7By2Fqg6V5RBvJb55AxZo2j3GCexCd
         J+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp9WnkAKxzLdFRY/L/PcmLbB35/+96m9W39l1RTSrxlWXQIDfWT85p4cEOr1rni22FbNC4i5qAexLD5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZMTdpgJWLcoEq6LhGzKugftqnPbqGTtzVB/udGpYHlNEgq3Lb
	GlJYS4bQhvteiYEQnj6enNOCMt+T8r+Pxrb0wRlchS8XvXzzR51ct8mL
X-Gm-Gg: AY/fxX4LYspP3tr4SzQn/A38JCl5TPTR2yXK5UARH9O2C8kPPNhny/lnq/IzgxWk33T
	CO/FCQhvCTZah9LYkiib7jRM3zpBHgc+g0wHTLYzwjWlanTapS3yAtBwIKTeT0C30u9MKXgf5uI
	1tZo7NA4iR3BQIoDnlwZq94s54VoRbFnGK8yHWAHEnTLze+hdGmmYbgRdVs5AZulykFUwP2uao5
	XlPOtB8YdPCe37QE7a4RJY0s/1M6GnNMf7xt5kharWHy1fFBU8R2poj2pbNFTegSZHLvMIcOup8
	XOhg06atOE0aq/51zC4EzAHFbE+QhwslZ1ds6WIPrU7awrqW1raM0wFdwx3tiPOyEPdFQolt/nG
	ZkLe8ncJXdFtsuNHRQd2Wvp6CkqolEbSy5a5Gp7LbF4vYNQ4QFtJgLy2IavDXiZggtg8DSysutL
	ex/UTfpsaKWkiDBZMgBONaWEvCn6UX6qZqpoe3KdCzX3U=
X-Received: by 2002:a05:600c:1c24:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-4802590e305mr97146725e9.14.1768758958917;
        Sun, 18 Jan 2026 09:55:58 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d90b3sm154086955e9.15.2026.01.18.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:55:58 -0800 (PST)
Date: Sun, 18 Jan 2026 21:55:53 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aW0a9e8Lyv1tu-mZ@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
 <aW0SikDtd0HIrT4v@anton.local>
 <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>

On Sun, Jan 18, 2026 at 06:32:24PM +0400, Krzysztof Kozlowski wrote:
> On 18/01/2026 18:07, Anton D. Stavinskii wrote:
> > On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> >>
> >> Please use subject prefixes matching the subsystem. You can get them for
> >> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> >> your patch is touching. For bindings, the preferred subjects are
> >> explained here:
> >> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> > 
> > dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller
> 
> No. Read again, I even gave you DIRECT doc link!
> 
> > 
> > Is this anyhow better? Also in the documentation directory should go
> > first but I didn't find such examples in git follow. 
> 
> Huh? How so? Where are you looking? 99% of commits have correct prefix.
> Where do you see sound:
> 
> b7d53fe53cb5 ASoC: dt-bindings: rtq9128: Add rtq9154 backward compatible
> 35bffbe49dfd ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
> 70d95c5d2081 ASoC: dt-bindings: rockchip-spdif: Allow "port" node
> f66e7da2a6b1 ASoC: dt-bindings: realtek,rt5640: Allow 7 for
> 101b982654ac ASoC: dt-bindings: realtek,rt5640: Add missing properties/
> b540b4e157c4 ASoC: dt-bindings: realtek,rt5640: Document port node
> 25b858474497 ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> 66b47b9c069f ASoC: dt-bindings: realtek,rt5640: Document mclk

Sorry I'm new to this and learning. For some reason I thought that "binding dir" 
in "<binding dir>: dt-bindings: ..." is actual directory of introduced
file. That is why I said  couldn't find any example because I didn't
find anything with "sound:". Thank you for clarification. 

Got it now(I hope so). Removing sound, adding ASoC. 
Also the word binding removed as you told me

ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller

