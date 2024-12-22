Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF1B376E0;
	Sun, 22 Dec 2024 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734886288; cv=none; b=lAHZtOX3WsUXM/wJpff5DPCkxhaH+Pe41Enjwu7yE88NTteW6forE61Nl5+Q2l10hZpE5r4Cu+ymwqXMS2Z/yZBTzgiKS+9StdvjxaVGDQKKth20tzkbuEsBQxGvwfjL/qr2aTxGz2SXZxLs1UdSuZfyW5WToHB5DDOEQUHpuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734886288; c=relaxed/simple;
	bh=SsbXVSyTcrkPya+YAYeCev286lM8MMbSIv4JlipzZe8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBu+fjb8vHsY4xQZqzvcpj0RrfyjxENAj/Q0amyl/0EokrLBBVNMaek/TmiDso4SrcxIKrw4sBskeVIx9FVGysljUp2rHJQ0QsWeEztxTS7CayYFQtC0fS+3Qoo0bufpNtATd0sU3YwEbERgRxowPc1H1CaOL+APa93BYs1ob6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iheJ2kZS; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iheJ2kZS"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb3c143727so2302744b6e.1;
        Sun, 22 Dec 2024 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734886286; x=1735491086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=;
        b=iheJ2kZS5QcXnMuxhjiC3GbNBynrYaDkOCmqOryTB83vWqIGcsFfmngEh+14GpLGA6
         /t8mYIx4gS9kfFDJEl7kVMtPM0IazW/RkVkErwRQzkqW8coHpMfRlQiDSQImr1/Ufd3B
         AkIXDWIcM83O0didkvK4kcx8oKMzm0L9vEeM/+yEsX7UE5AbSt4+9sE7UItvuARlingV
         e0vFT8OypNIjLLD7cr5toO/y0oRl07QU6m2OTk5bKZrHCHPpIGvrNoH3L8ySmerCfkkW
         p9MJcMbQOBZHvcGenoIHW5znHXg4cfj9T66UzZsDhj1Ah/hPdjBwDtRsKR3NsK7lD4dM
         5Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734886286; x=1735491086;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llvFAMVKzgtFTmydFpXfdQntLEV5hPHDDyb2zSA1otM=;
        b=AldWKgecn5LYtlDDjyR1XiTfC7M/yA8heA+BY+QZrx+G9dcGWrjUnpO46zT0riRTfH
         GhpJbDIsxCGmVTii3fhCxDOCmglQ8r5m/6i/pH1jikv0HcNyt35OxfWKhpBwJiT9XEtr
         +A0+J1w9PtQqXKHweFiVVz48WB3vdP2Ufjgnq/vlVv4a128JYZAtV07K7IIccTzDflCQ
         VMJcoWalfPwnK9N8Ru2G7lAhjhANLVUZc0kpiCvlvYrNWWPLOsRVRqbFGKzlBLYpwN+u
         /yPsqe25dbYoJpQNqKONnKvIgb8KJLnMszyOPI5rx6s8iornmgSoCnLzZhAbFf6PFTyF
         Qx7w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4oq58T2L3ngR9+0fsoqwkIZx6PyovL49yQbUn7zeE9YlkPyXZ+1ii85AQH/2BhqCSv5ke1sQVGJk@vger.kernel.org, AJvYcCUpuuaSmaZYYEZ2mY3GFH3d+fGxpZjixVh9t5T8cTNXNWn9crQysbQL3UFynU46P3JbJ5lzcw2hGIgjsIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM2lfWJyHRBZ17diH9UyZHL2fyMlJkL++6YV0dIxhDKsCe746X
	Lvpstdwzdx+HsAqWT/Ryc1pTATeWlH9spjiuTsEBjvWDqYhkGXT5
X-Gm-Gg: ASbGncumJcrdu71gUj1xkLplYBJxYAcXth5iNY8Z5PZeeLg1A9zoWj5wGvBeA5MvQJw
	aLr8vfeK8S6I2XsQYGjrs3aU91VDSXiv8oGY5082fVnj4KUiRDbT1BC2ldGdRDedZHkcp+uCgjl
	E0zYe3SrYcLF/+FYzdPe3cyGY7fsLHEbBdU6aMUe8lW5ttu2bPG6o77Tv9ZgVxaITQnCIj2xJey
	Z+JK0VOhq9p/BKnIJDPdUF6D8+ryrUnMYtvEvmp6dc=
X-Google-Smtp-Source: AGHT+IGOSjWT5nZh7oa9tWjzH86Cpa0paHAdKsw6pkoTi7D+l+JPXI73dPghgcyucCe8yUcH/SZBQg==
X-Received: by 2002:a05:6808:178b:b0:3ea:490f:da54 with SMTP id 5614622812f47-3ecdd77f492mr8640803b6e.19.1734886285936;
        Sun, 22 Dec 2024 08:51:25 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db755632sm1757228eaf.27.2024.12.22.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 08:51:25 -0800 (PST)
Message-ID: <6768438d.4a0a0220.399c57.89b6@mx.google.com>
X-Google-Original-Message-ID: <Z2hDjJqf3YH5BEUo@neuromancer.>
Date: Sun, 22 Dec 2024 10:51:24 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
References: <20241221094122.27325-1-ryan@testtoast.com>
 <20241221094122.27325-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221094122.27325-2-ryan@testtoast.com>

On Sat, Dec 21, 2024 at 10:26:32PM +1300, Ryan Walklin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Devices integrating Allwinner SoCs may use line-out or headphone jacks
> with jack detection circuits attached to a GPIO. Support defining these
> in DTs.
> 
> A number of Anbernic devices featuring the H700 SoC use this mechanism
> to switch between a headphone jack and an internal speaker, so add these
> to the allowed routing items.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> index ebc9097f936ad..b4b711e80b65a 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -98,6 +98,10 @@ properties:
>      maxItems: 1
>      description: GPIO to enable the external amplifier
>  
> +  allwinner,hp-det-gpios:
> +    maxItems: 1
> +    description: GPIO for headphone/line-out detection
> +

If possible, I wonder if we can keep this without the vendor prefix?
It looks like for now Nvidia and some Rockchip codecs have the vendor
prefix, but audio-graph bindings and Freescale codec bindings have this
as a non-specific property (and it looks like simple-audio-card does it
either as "hp-det-gpios" or "simple-audio-card,hp-det-gpios" depending
upon the circumstances).

Also, the behavior of this is very specific to just the Headphone sink,
so we should drop the line-out text from the description. If someone
sets the routing as `"Headphone", "LINEOUT"` the state of the GPIO will
affect the audio path, but `"Line Out", "LINEOUT"` will not be impacted
by the state of the GPIO.

Thank you,
Chris

>  required:
>    - "#sound-dai-cells"
>    - compatible
> @@ -247,8 +251,10 @@ allOf:
>          allwinner,audio-routing:
>            items:
>              enum:
> +              - Headphone
>                - LINEOUT
>                - Line Out
> +              - Speaker
>  
>          dmas:
>            items:
> -- 
> 2.47.1
> 
> 
