Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070F3CA49C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596652; cv=none; b=IHRww6wv09ah2thMe0i2kwPxiLDjRlMD4CatiUzIUM7aMLMHot0OZYFtofB8LwmcfZp4GMAvyuJNfNm22loJUjy85Iew7d/HaOFaEoBQ6UovpIdF2oMAmsQLSL/zUwfcFGJoI8HO7U8DJ079B0CnYpLzlISAQYp4UAW318VfqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596652; c=relaxed/simple;
	bh=kYUmXfqxqZZvuj8FdGIxSnRn6xI48ouPfigccOD9jHg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IgGbQZzo8FEwyGL7t6zn1uPMY08l2bhnUKvBt/5a8ktomV4EkCD52w7h1Cb43orgNzMkTlAyzIOZP28OjPCWNSoFe2CcjFPpknvOnsYwBN0FwNVVq5IQnmfKmj2T8gpkxOOcdebf8LyDmyDHVM3RuJJssm9VyhVddeOv9oFGUCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORMw/Lem; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORMw/Lem"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so20894395e9.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774596640; x=1775201440; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3VXDdiy9vBdjztOvHiTr0RhuJTpmTmI6WtsO3KRPJA=;
        b=ORMw/LemGNLy2VUNPJWg6H6wXdikfyxdKtt+SuQvhW42zMbE7xHLFFzsqUf0ZJ8AgR
         ALvBNvSID5c1ODyh4HTHqPeLH4Hb4ElF6XUaBnZ6EAVA/YyJG56+82fkZMgcYHI6Js4k
         ahAoGKgU30KxSXv6hgnbNB6hRWd4iZmQA+xygxbAl4gceL5guToi4qp10eWjfToFV+iw
         3xBh1uchqOdsjVIW34dVQz0jzVpujh/GDIxVNmztWytcwXR5SayctZCkGVm8KzCtOAlQ
         lm1ZzIG8v66rx8XM3sbkgE88DSPiX1l5zGK4LkwD46psX0Dwu3OiEh6ElDeaP5KRQS0B
         x0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774596640; x=1775201440;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3VXDdiy9vBdjztOvHiTr0RhuJTpmTmI6WtsO3KRPJA=;
        b=gqzDEHe47FPofGgl7iVh+f6fnDSi5tsrK8OGSa/huUgRHaVvlXM05CXKqU0r0EgP8M
         YRZXZ52vKeuNbFuTKTmxiKQxSucsyAoNHwUW1lGugFVSZ+BklSv+Zilpfo2ai80Di2TQ
         W4NIhfMjFFL7aGDPXiKY+7IuzTGH/NDL2MWZUySYwKHQ1yZRXP5sji6uqK4N0PjD3Oc6
         ahuaaS3KMaCqtFxPgUQIpT6EeCiPfcKVsvNHxvlSxEHUS0NbjHiWD5IL+Mv9EvmGiaJR
         nnnuMrWOGDN2ggUdegYvM8NvB3MVOIMRdPPlHTiYJYWW9F/xKT7P7mUsK6q8pUQkWz3E
         /28w==
X-Forwarded-Encrypted: i=1; AJvYcCXRr6plMXAruQxaLdkkEeIYpys1OTbZ9ew5jwgVivh3VaD89AOefdfsVYleHh+QHW3lf4m+YmaKIkO3kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmq9O+Xw8VMTsJ8PQbywe8iaUDThE+5aBHzprALS2pXNJr8oz9
	FR1rKIz0FwrPnPtca5D1ImpNfDlVvalcrGLLIYMfJoXboGAYaz2BIaE9
X-Gm-Gg: ATEYQzwkORsXKeIf17VaExaNZ9rcrqAp1NsJ0v9mmfYeTNjqVLJ3Zf+Z0MnAGMJc9+h
	Rquy1vgOqpuCRrOvZDyW6ukADrqKPekw5d0ZfV6NQ2rIBHmkCCP8eKXUK+Opn/uceMMTABs46Dc
	5r/ucR/IjhQolKUfS4RENZXNV3rGYvvfhDglyAxyH5JCUL+SkAbYos/h/5lzRuRNI6kYEAv8r/v
	+K/37TiYqd03XNZrTKZ1a6KK0bYiM6VvdHYn2LaMjaspd8y+gXYHJbF82KNOGYZ2O0IMp73Z8u1
	Ca9NJhbMT59ct1ofekYkG6VwAlMj5LiBfKZX3Vn+rxBOQOChtIkGUo0Wq3HbHk9nvZGh5pZTtr1
	KADkh7gpoSJgEiutxEcKdlieb+PU3MmgBRiPULfuXIkkptt/QMdrsO+dXBOGt/l40sGvwzFWLLn
	UpJxziIzuUC7YbfQItWNTNp/I18jJL8PIKArAWYw4XEvdTIfxDXv2yppew8txbpx/R9SWwtpGUn
	71ufol+fh3cg+MyBetcw0LYNra+iN3pOriVrVCx5ErwLcUIDEt33knMdQ==
X-Received: by 2002:a05:600c:a00b:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-48727d8ffc5mr22061385e9.10.1774596639495;
        Fri, 27 Mar 2026 00:30:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270ea4bdsm18156725e9.6.2026.03.27.00.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 00:30:37 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: sound: Convert pcm3060 to DT schema
To: Padmashree S S <padmashreess2006@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326183747.528754-1-padmashreess2006@gmail.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <cb31510b-6aed-99f6-590d-798256f10044@gmail.com>
Date: Fri, 27 Mar 2026 08:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260326183747.528754-1-padmashreess2006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Good day Padmashree,


i received your patch, and support your interest to keep the driver 
documentation

up-to-date! I would kindly ask you to give me some time to get

up to speed with the context of the documentation change.

You may expect to hear back from me next week.

At the same time, i don't want to block any progress.

If you receive enough approvals from the other members of the community,

please feel free to proceed without my feedback.


Best regards,

Kirill Marinushkin

On 3/26/26 7:37 PM, Padmashree S S wrote:
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
>
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>   .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
>   .../devicetree/bindings/sound/pcm3060.yaml    | 45 +++++++++++++++++++
>   2 files changed, 45 insertions(+), 23 deletions(-)
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
> index 000000000000..ceb6f044b196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCM3060 audio CODEC
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
> +    description: |
> +      The I2C address of the device
> +      or SPI chip select number.
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
