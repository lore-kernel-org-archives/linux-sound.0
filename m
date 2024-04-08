Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF513D28E
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712602139; cv=none; b=pNSWwI371Va5uqrxpceZ0EOqFifhSICbHsynyHYMz5kCzv8HDOPr988EU0qJJFgmsyKSW+BrIOX7d3mmtcE0UBFdrudRiqwbyTxIcKZkC0WUbJjCY9UMnpf65tPyWAHeamGm/lr7uoyByHsopQEXcy1nP24ZSWGTLbnaQx9m4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712602139; c=relaxed/simple;
	bh=qtrTZPVJnDWvjZ/bNpqt1kAPUsC/tYujbJUF4w+jUBw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=US3sRXZw8AKp+cc+mfCMBZjYhDMG+NdrlfMQJ9JjQvdW8B1fP/0HZxMchVv1qIncCCEfwoz2qOPBb7jrTwrlQGmXtUtDCC3Vos3cg8xDJgc2LLzja1z6Vemauvr8+Kv/9FrL6IfibgZNkqsPJXMjcI4pCKg4Zyd8t8C/UAPS7c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3DtYl5ac; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3DtYl5ac"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3455ff1339dso1436309f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712602135; x=1713206935; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=/5O9U718NHGvhBsjamAS1sHo9zrNE6S5TEc1aVEiLaU=;
        b=3DtYl5ac1yoh7J8kHGQOF0ZM90DGc6yvJynBnaGtrxL7yOaYG+02GXrgDj37MxKpFA
         ev/FSvvixxDjpxczZXNitqWSgCdBtYj6q4TwDDRfxO990a6WW0t53s05ZL24ZH7nEJ4u
         P/2+7KlMXUyO6lQsqG7i9wfksxCeEDkyEauTNAzHa9GUBrAFKeKu6ofUkP9ShE6B+xjP
         l4hNhheAAXTN3gdRD8jywiRw1uORSa/yPciFQwU3KzJmPxdthb6ey0BMVANECf7VWiXw
         0kIhWcgxz9dbF0jG5xdtnfQCtwyxURX5afOBtfd+XYBw8moctxc3r8kTh/lM3xq0DqjH
         w7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712602135; x=1713206935;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5O9U718NHGvhBsjamAS1sHo9zrNE6S5TEc1aVEiLaU=;
        b=brAAmp2vmTOPtxc6M9dRJloaXVfNvbPNLFCI+vPzSLqdOaFY971MqUnRduDJsWAxEB
         d4o50SlyKdiDRNFEhu+HfIz6gAFW/Ade7VQ+7C+XZsGNQC5msdkTZejmXZqpa+RvYKPt
         tJ2K2Mc0WRYAe6X6mUvfO3U49v1ASQIcRtzbu7kk/6c2Wb8ClxPXw/cLrOGp9FaFNK8v
         JJpfEJKVtj4Ti6Kmsvv4cGYqjHE4riJgmrx/DkRoaQipDUqBVtQJiCnVrP9sNB5A1sut
         CKxM3b1Bzsq632Bze3egqi/kBMnPzbpQRhumhoiNs1TKC/g0HGeGzbZy7Ri4K5RLxcSV
         IHWw==
X-Forwarded-Encrypted: i=1; AJvYcCUMZ1ZD8Zw1ZzycRcw88OeorEtAWW4v2z8pv9sBRfEdUxNNJf+lXWKBWXkpVMk+Alv6bW/PK9aABd5ky9zJpVEnlpZ0jWtNGUuCeuo=
X-Gm-Message-State: AOJu0Yx79fCsc3+k18rW1iqSJ/z+D9EoCRWHzW7baoBaE5d03qM8s/FN
	K0anBnRipxrq938u8zv/YmnVaq+23KPf9fQhYM0L2+ddE6ImyutKvK4WgLszJ74=
X-Google-Smtp-Source: AGHT+IG3Lg7mm8hPe5LwKDEb0DtuBWPIrOCUnl2T2Z41lBT6Pyv73n0DcdIqqnsFwOJp3c6VQ0kGmA==
X-Received: by 2002:a5d:64cf:0:b0:341:d7b5:27 with SMTP id f15-20020a5d64cf000000b00341d7b50027mr8950388wri.6.1712602134884;
        Mon, 08 Apr 2024 11:48:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id m6-20020adff386000000b00343300a4eb8sm9561770wro.49.2024.04.08.11.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:48:54 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-2-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, lgirdwood@gmail.com, jbrunet@baylibre.com,
 broonie@kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: meson: introduce link-name
 optional property
Date: Mon, 08 Apr 2024 20:44:36 +0200
In-reply-to: <20240408164947.30717-2-ddrokosov@salutedevices.com>
Message-ID: <1jsezvofl5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'link-name' property is an optional DT property that allows for the
> customization of the name associated with the DAI link and PCM stream.
> This functionality mirrors the approach commonly utilized in Qualcomm
> audio cards, providing flexibility in DAI naming conventions for
> improved system integration and userspace experience.

As explained in patch #2, I think this change is wrong.
The names below describe a possible userspace usage of the interface,
not HW. This does not belong in DT.

The only valid name for the interface is one that helps map the PCM
interface and the kcontrols exposed in userspace.

This information is already available through dai_name, prefixes, etc.

Using DT for this is bad, in the context of these particular sound
cards at least.

>
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 ++++++
>  .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml    | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 492b41cc8ccd..46774a3e4b1d 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -66,6 +66,11 @@ patternProperties:
>          maxItems: 1
>          description: phandle of the CPU DAI
>  
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
>      patternProperties:
>        "^dai-tdm-slot-(t|r)x-mask-[0-3]$":
>          $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -137,6 +142,7 @@ examples:
>  
>          dai-link-0 {
>              sound-dai = <&frddr_a>;
> +            link-name = "speaker";
>          };
>  
>          dai-link-1 {
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index d4277d342e69..975c148f9712 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -52,6 +52,11 @@ patternProperties:
>          maxItems: 1
>          description: phandle of the CPU DAI
>  
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
>      patternProperties:
>        "^codec(-[0-9]+)?$":
>          type: object
> @@ -89,6 +94,7 @@ examples:
>  
>          dai-link-0 {
>                 sound-dai = <&i2s_fifo>;
> +               link-name = "speaker";
>          };
>  
>          dai-link-1 {


-- 
Jerome
