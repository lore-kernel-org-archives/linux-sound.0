Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAA1EE7C6
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 05:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849760; cv=none; b=jAU33j69ZCUnJW9yKU9InKt7XpjTGy5JhWudXyA/x7J3D1EKRbykbSN2+Dp3E/y2M0FEAPcgW+Ht0sh2ymeJefsPSq5wlJO6Hc/rnPtTCQK6poWFALee8s9y8mD/rNvDJYjJ/r+NsZNofCtMmXdx9R2FT85QZwYKYefBj3q9WFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849760; c=relaxed/simple;
	bh=JJib5epLYRuHjuMYrMXAq2Xdaf1Jvt5BuxzmyXeLSNY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qXnOIaYldUMkavPKBo4owNGbqZsW1Zk97N5QZ7DIv9OjLn2mB8XzmyrRSgoqozEPhO6vza+9WC6h0ipu3UnmYHd3Io0YSdsEMXgAp0KGRNbFS65GZi2mh4P8oSsYOVp8RSdaoIGq7uka2LxwQ2UVbX1KqYnrQ6PYDf7bkey+Elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rajCxUAN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rajCxUAN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so42145275e9.2
        for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774849757; x=1775454557; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fetVgXx6p5dzBWcp057ayPs90uOGBSYCCwrgacNo9LI=;
        b=rajCxUANsKeOuyf3QqU+UqiPuicCC6MsP6RB7l+SonZU3lIGiPVHXpq6AguCcDVTVF
         WpLQPFGfz8Cpr5qhnn3NtkWh7aR59wKr6uxfjCxk9ugXi1Ulssh/eBShAi7mgn0QaIEX
         v0+sANzUeB2HvWAUbDVjyV/UPkV3CoiRG66qs32vV2L3mmWW8uSNbQOmLLZcgJ6j90st
         K5Xf2nftC9kc33Lh0QfQvBLJBXMKIXQwc7EDz2DDCU9Tly62Hqv7UZZ4xMuQB+mcwyCO
         TIMApIRJojls/at7DtzWNn2RVifle/uUanHK42ifbLZq5gQCovB9UWhBNUos+xVbYGoi
         B9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774849757; x=1775454557;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fetVgXx6p5dzBWcp057ayPs90uOGBSYCCwrgacNo9LI=;
        b=P4EVKw2NXrxCzEEAg1KsHReHuXa7b9v+/XSHmn9iIz6t7yJ+8zwPfdmaQi/HlulzT9
         p0WC7mSH907S8+2sA5I2CsDmrUhhOF+Wct4lvsADaOnwmilJY6hhwJUuPgzcvNmR2zhy
         fgAr/WwA9Mup0ZyE6fLNk2RiNmU/Z+G6MosFZM85yDDNRKDvxSf5HzAEzIeTXhU/K4C+
         jwSDGItywNeiuyRqcbNzhMRFBjDTUdqU7R4v5bpAk6ytr7xTjCaZ7E752ZiI8lYnE+XI
         aORpnt1GZS78z64OFyPNv172cwHbax5vhJK7L3cX8nPdSyixdkymisZ5ZC+QcXO+J9Fu
         Nbrg==
X-Forwarded-Encrypted: i=1; AJvYcCWxjuZH5Z1TQq+VjCM0DqoS3k1lqHdZSsP4rH1lJ/+0ByC1+hpM4p/NBYXqsaa4aETsr9E2k8wzY5OYSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYroEVCtfwR6caOaaa6csUPRdijeQFb6daW28iP9ZFUMiFIKk
	2xA6CdMONyaerm6V+SHOmW5e0mtm+OMlS0S2QANsig5TqbhLtV1I6F9V
X-Gm-Gg: ATEYQzyVaDb0G9gcXcPc1R6A9ClR/sHRPN0/uyGCUZ6rgr0sBGQSLC0Qqayk0gNGEri
	16zkroXoAXWIhOzNSoNRwYPUOEs+rV9IAXKkCJF8DxqdaqaMxVc3FxN55HjhOGnveXSmLLSOw+J
	bWXVm4DmaG8D9HJlr5wEPT1R6G6IuXg0wwGwBBGAOjTz6Do1uUrR26HwMxpeDgiVCcseO1tSl17
	gZUlZzGS3UXDfyzXej6M1LYwE9+0HKg+VYowDSc07BqI+SwsNatKld37GXDlnE7hyYHBY9IRMw2
	5/zIRGKRYV9LppVVg8OwLwTK8QqJrfojuDqHS0Ps3GJIci56TQdNxqXIRhDcVV3Kmvs+QRhNOdF
	oVkpeAH+ktW3cWA+e1tSF0j5iy5+T1SgDZ7aoYHED1Ooiae8UXlK4CrfwPZCt141MTZcGmFskmA
	0E2dHb77oR1o0AlW1jBqudEXiXlDz7ab/4Q969yFIVPVIFujMwPihtHw24xs63N/kvyHzHQmeM9
	91LIQv0pqIySzr3P2hzdTXTWem//rBbPZNHrpYgs737lDr2W95xzU3zNg==
X-Received: by 2002:a05:600c:8b03:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48727ef16aemr221406975e9.6.1774849757233;
        Sun, 29 Mar 2026 22:49:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm70514355e9.11.2026.03.29.22.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:49:16 -0700 (PDT)
Subject: Re: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
References: <20260327121919.603768-1-padmashreess2006@gmail.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <b8ca83e9-5a48-032a-96bc-a62990cb61f6@gmail.com>
Date: Mon, 30 Mar 2026 07:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260327121919.603768-1-padmashreess2006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Padmashree,


overall, your proposed changes look good to me, thank you for taking care of

the DT schema for the pcm3060 driver!

I left a few minor comments below, but i am open for a discussion, if 
you think

they are not relevant


On 3/27/26 1:19 PM, Padmashree S S wrote:
> Convert pcm3060 to DT Schema
>
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>   .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>   .../devicetree/bindings/sound/pcm3060.yaml    | 42 +++++++++++++++++++
>   2 files changed, 42 insertions(+), 23 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Documentation/devicetree/bindings/sound/pcm3060.txt
> deleted file mode 100644
> index 97de66932d44..000000000000
> --- a/Documentation/devicetree/bindings/sound/pcm3060.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -PCM3060 audio CODEC
> -
> -This driver supports both I2C and SPI.
> -
> -Required properties:
> -
> -- compatible: "ti,pcm3060"
> -
> -- reg : the I2C address of the device for I2C, the chip select
> -        number for SPI.
> -
> -Optional properties:
> -
> -- ti,out-single-ended: "true" if output is single-ended;
> -                       "false" or not specified if output is differential.
> -
> -Examples:
> -
> -	pcm3060: pcm3060@46 {
> -		 compatible = "ti,pcm3060";
> -		 reg = <0x46>;
> -		 ti,out-single-ended = "true";
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> new file mode 100644
> index 000000000000..2d920a70bced
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCM3060 audio CODEC


Here, we seem to drop a short description, that this driver supports

I2C and SPI. It's maybe not a big deal, but maybe we could return these 
details,

as a `description` property? Let me know what you think


> +
> +maintainers:
> +  - Kirill Marinushkin <k.marinushkin@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: ti,pcm3060
> +
> +  reg:
> +    maxItems: 1


Here, i notice, that we remove the description of the `reg` property.

It was there originally, and in the 1st version of your patch, but not 
in v3.

The description here seems important to me - being a documentation, this

yaml could be more helpful, when it describes the meaning of the properties.

Do you think it would be possible to bring the description back?


> +
> +  ti,out-single-ended:
> +    type: boolean
> +    description: |
> +      If present, the output is single-ended.
> +      If absent, the output is differential.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      pcm3060: audio-codec@46 {
> +        compatible = "ti,pcm3060";
> +        reg = <0x46>;
> +        ti,out-single-ended;
> +      };
> +    };


Best regards,

Kirill


