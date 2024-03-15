Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8493A182DD
	for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710497580; cv=none; b=WLSwLkYa2S6BwRybisuqSeJsrshqSt2r66wI7JR1rTqB8vqL7UaJdsKXicmUm7EyZ+mnwpfdLy+FgCopmyjHuxFBRffW+nBfEnHQxiicvIJpnhbgE2csFGU2zDvkcppnllGCaS47YN2iVy4m7jQCCTVCB+cf4TyUCNWTKrCewy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710497580; c=relaxed/simple;
	bh=+QI7pZjV5YnoIH6SZx7QJZM4F+zGSldQpGRXjDpUssA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=EAot908T+VyMoGAF/TjlG1kSi4g19itLkULwyAerDkZci2/X0lulsK4wddswKHKDLjzBy2s0V6aVz+vXokVjCzrBYcZabKfgeUrxxWkcIqttMjGNiiUxaJrTPXYlK4QWtu1JAUC5KmaXy+kIKa5WcSUavuBvoZcqSGxsOCN5MQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=T/xwh8Ck; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="T/xwh8Ck"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413f4b5171dso10397905e9.1
        for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 03:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710497576; x=1711102376; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=LQKgoyfzzduaJ5jov9NmJ8PCZR9rXm8iDmJsBk54NZ8=;
        b=T/xwh8Ckt/9itzt/WoPlSWCGVCc8RFmeaWg8oUn6LbKMoaqb208buZ2nxKkZwMGjNJ
         MEK+GurRZWeeVot7WTz8mavZ8GeOYoHfyKnjL8+kmXtwqv+nKIsEQRHBsSdK/ok9qU+D
         8rvGaR2n1WOEqyyIonxfRWKs3d94pRkUenGfmGjKFaHDghTGIUZgkJj/PXz0dzyp1AaA
         6xvloC+Wr90Q8RwUL3+ukgYxNY+qh7pU7JUyr8yAIh4DGkc7e7wUchVIS8d8fV0luIgV
         CMLO56KDeoJji7d8r61crqJKbo8WQV5xBsD4fOUFvAxnHUgdm3g9tZDZxzNmlDmSbndT
         47sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497576; x=1711102376;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQKgoyfzzduaJ5jov9NmJ8PCZR9rXm8iDmJsBk54NZ8=;
        b=It28XY0AKUTV2Gy9igQWgm+Bnt3fdyOf8yPjwtaeEWOal5Kts6A6GO/XvITVQwi1dn
         wq56jCRp9iJye4mvi05Ac5+YSvtfuUeQnl4d2Y9pC0h7detPygh3otfdrIxqpqny7VjJ
         FiTS3Uj7rqlF4kI2Aak9Dabfsvl7xp8S6VsRDbPusoD6U8CZcK/LggbhysaFBYYRmiPT
         NnTdFZfgaMbp41CP6AVrwyDmoUROWR6bjpwK0A8g87PLCrxavysUq0YvzuLSEPCgHwEi
         ugaKrUkZzj4iHsQJRsicL8qBmFy5hdagoPAqr8uFQFbaosQ/+bt+R3XYKOSKrMtXGJaj
         CSEg==
X-Forwarded-Encrypted: i=1; AJvYcCXY1H/O1C+LAeDiuTgV//dBUPO+EFsmNZ1kxAdE0/t4urRJXUicPOyFTa/mXaMgtcwqLqSa/3YVNVMWa+kL/w2X7SjPHe2yIx2YcsU=
X-Gm-Message-State: AOJu0YzWfZyS5uie83T/rjIxkMh9Hy7vshy9n3UJ7ez3OIOqTHqkE+rR
	E8samoCpka9Iqds6BH+u8Rx4aBei40ITqWVUEO60EJvtzMecmKGSffxTB1Pm8cI=
X-Google-Smtp-Source: AGHT+IGkpPwSpcUKRjM84ML2A3Du8Hq7iROZC24mk3kzA01vpaV9CKlS3GgcL5y/xRPaeZYOGOCuww==
X-Received: by 2002:a05:600c:4eca:b0:414:1e0:2afa with SMTP id g10-20020a05600c4eca00b0041401e02afamr788040wmq.3.1710497575919;
        Fri, 15 Mar 2024 03:12:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm2481373wrb.110.2024.03.15.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:12:55 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 19/25] ASoC: dt-bindings: meson: axg-sound-card: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 11:06:52 +0100
In-reply-to: <20240314232201.2102178-20-jan.dakinevich@salutedevices.com>
Message-ID: <1jr0gbhkgp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add "amlogic,a1-sound-card" compatible string alias to
> "amlogic,axg-sound-card".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml   | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 5db718e4d0e7..492b41cc8ccd 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,axg-sound-card
> +    oneOf:
> +      - const: amlogic,axg-sound-card
> +      - items:
> +          - const: amlogic,a1-sound-card
> +          - const: amlogic,axg-sound-card

I know the rule about SoC related name but it is different here.
This does not describe HW in the SoC. 

The axg sound card is just a name, much like simple-card or
audio-graph-card. I could have named it "amlogic,my-awesome-card"

We would not add "amlogic,a1-simple-card", would we ?

It is purely a software component, which aggregate HW ones.


>    audio-aux-devs:
>      $ref: /schemas/types.yaml#/definitions/phandle-array


-- 
Jerome
