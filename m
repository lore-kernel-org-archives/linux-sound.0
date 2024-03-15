Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4117C6F
	for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710496887; cv=none; b=K5l+HTIUAweMfw5pFb6I++PwbluPBisvX6X8GOATGZlWdrFi11Yu8ouBcOT9tu5/yLJ1lPYHpKid+4aW0+jhe/sF0DUMtI+nUlVCTVx0IC9aKWGNuCJMtct5u+4p4tlrtNnxR9OM6gyUt1U+5zeaFt+IP5YLrxGURcCKdENSyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710496887; c=relaxed/simple;
	bh=gacD0vR1r8l6qYGtakyqNg/sNRdABilWR9geZMBzIqY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=o705w02QIkKcDbt5820KdBzr1wUx5vifuXQiI5DpgmP/z0oSOwc/DHCHzjwilPTmGGojHJD9qExaZe3A/pfhU5w+6FmCx0H1KQBwPw79QVIMHFK+Cqn5lkGtj217LB8e/EAN4AbXSkFF11Ht8l7xgK6NOj1lzdnDRx5sAEkR/po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nlK5bv2i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nlK5bv2i"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41401f1d665so1961265e9.2
        for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710496884; x=1711101684; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fWhlUz33vWZPgCe1jVxjs/Yq8Zn8UQqggbMUOeu+zYA=;
        b=nlK5bv2iZIs6DLhQbcorkDWWig6i2Zs//yFuBtTGg0hivLi5rY3PgbpZ8tmV9/kteP
         0EdssU1VXeyowlgHtDNYqxEMbO9m17j9T1Mgj0xT9H+xqlZinLy3cVraYw04ravkyc2C
         g2dkIQkRGH0EmcEUaORHZ2eG3uPfKI++sqaAwgTFQrsP5PNr6FuUfC6ri6Oxls3sJpR5
         p4HuyZHA9Z1DglfgQOinEzNhWyhneuklWQKgO41ES4E8+UK+9tHwCxm3I0VuCG84JOZw
         xZUsshVdq2qSC5bBekn/7Iand7YMrKopHZ0HTd7v3KTIpa0nXfKapUE4bGVorimqPb98
         4HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710496884; x=1711101684;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWhlUz33vWZPgCe1jVxjs/Yq8Zn8UQqggbMUOeu+zYA=;
        b=JTW+4uXmMbML4+/ooh0hW5jiIkij0KNTVVz/K9rgNqBS4ri7JwJXDZXeo6VteyvTJN
         1Z2W9zoXMsLXavvPJNvEIvzrZ1pipNvp59hltQSU0EOaKhTt5NAMKT7ehN5xSi5iBaiM
         8VtvE+AwrgEeeoKd/qbYadwzBRStal5Hc2qqOMe+9FB2Faqeo0HJ2Hu2Z0Wshv53wtiS
         AT2ToNyHX/0IH5TQO7JY84IV/1LPiNehKrPlYlFIUfclZXIvpJarO2ksHzUwHkQOEeS/
         vXxIAWFNIt6NAM4nnji8lwC4+EfdyPleImifQLyeYpaAUeu61z8XGIPiFl82jKZY9n1w
         semw==
X-Forwarded-Encrypted: i=1; AJvYcCW+mNlQBrfsIzghYRydh9T0wGbu4JzMeZDr5qJl7W9UbFJFSfuAFEoh6gvzELjQUbW6p9RkyFLFxidq9oYaWhuqTI6UQRqf4NNnMwI=
X-Gm-Message-State: AOJu0Yzu5+KspQsJPyBiQoVtDU118pUXD4XfF8coHWmsvo+2S8ROsw4C
	85Ug+JPe8KF91ZI96MCsaY4nAFoGuJIXmQS4Yz6Fxe1RnOLRiZK0hIBoXE4Ye0I=
X-Google-Smtp-Source: AGHT+IEcDrisOCqCMJOmaLRgZQyAaHTXXz8anuBHbakkxYTiPreghhV1D06Sq2gYrDwj1MifnJt7yg==
X-Received: by 2002:a05:600c:4706:b0:413:25c6:1981 with SMTP id v6-20020a05600c470600b0041325c61981mr3480578wmo.20.1710496884073;
        Fri, 15 Mar 2024 03:01:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c315100b00413f76fe7b0sm3887726wmo.21.2024.03.15.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:01:23 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
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
Subject: Re: [PATCH 06/25] ASoC: meson: g12a-toacodec: fix "Lane Select" width
Date: Fri, 15 Mar 2024 11:00:35 +0100
In-reply-to: <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
Message-ID: <1jzfuzhkzw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> For both G12A and SM1 the width of "Lane Select" should be 2, not 3.
> Otherwise, it overlaps with "Source".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Missing a Fixes tag.

Ideally fixes should be sent first in a series - or even separately in
this case

> ---
>  sound/soc/meson/g12a-toacodec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3e..b92de2235627 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -229,11 +229,11 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  };
>  
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 2, 0),
>  };
>  
>  static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 2, 0),
>  };
>  
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {


-- 
Jerome
