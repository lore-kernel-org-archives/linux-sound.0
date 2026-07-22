Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042413B47D0
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706062; cv=none; b=FZ4wAEgLAbJL7kbCSFvpqG64OgpPhL1MEnQlQpKr8CfxI+u60+Dy/2lx1NpI1pjBHVCMO18kIMRGFaZuxXCOubD/szLG1BcvH1WRUmz/xbH1lUtPr4pgEXPtYiZ6Quh2M1WHXlLPYLLrafAOUtCBmrEQC2yC9eiBdv19KUEzYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706062; c=relaxed/simple;
	bh=gQxBbM5etcTEezXE1B1JH5ER3yiGi6xTZs5DdLZI0LE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FueqKRSnour+/XSpFLJHsa+F9r9csZ/NwG7o+G2SperebemL4aOZm7j7Vxi05QSdxL0kahi3Ma5mFUZBCM6EqVGcg1sZeKFH+0Pm5m4j4gRdzO40tMEmvWD6D1SvHxkNKFONV8UXH4/n1kQdUhlyFKOlYUVnoZy7oQ5wvVsqnVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mXYWDJhQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mXYWDJhQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954d29264cso22385475e9.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784706058; x=1785310858; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ME4lepCTDaiBdE3UAEs86uArPM75PRdP2/SxaEDo12E=;
        b=mXYWDJhQYHOEuiBG2d+lNkpjBcRNX+HB3Ve3+FB68lKXi+3cbkzwonbMncl9nAOVbW
         p29QtwW/gaWF5HFAGKb1dTkCAmMA+xmD7ywkxvr94F7hdXhrYPaPdA4QJQJ7nqVTqPPr
         ur1e84WZIQFhKJetGTSGBW7yQk+n2YBZztRWz1WiyZAA8HH9BPc1CQYS40l1aX/K+oiK
         tEe6zNaDUp/VCUZaObRD5epfeM5ulKYz4jd1Oijic7jpZWbW9rXhSjkltLQSxDmpM+OL
         ot2lQFbQFgjREfqtsjc9rUyLAWyC5VWfYAwMGWW2sH4/R41QJ7vWd87fOpsPpKjBgoLt
         egUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706058; x=1785310858;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ME4lepCTDaiBdE3UAEs86uArPM75PRdP2/SxaEDo12E=;
        b=YszGTDu4y5fbq7jekYY8mWFzodIoi8VkvsPOAGRnQmSjcXdSRAyFN/+Hn2CIjp4eMS
         UrfmM4Y1WTvaW4TeuamuKaWy84UXOaoTkPMWQQM3y2CwQNVgQA/wX+wwiH+yBkAUhr3C
         x2KHYDIpVHMEG/tlbKob9mSBOhVYcvjKeUJQI5c1FWj1u7y9hb/ncOmTLWVz7x++7+yn
         8NuIPyvRPJQyC46YUQxy/OSMFS0gIvihXvdsyZHHDreFvyv/AOW/u/vruU8xbXg9Hp/2
         3FxK9GHs0U4qqAqn2J+SuKfBvBbU2MNpP3o3ZKlSSTSIsWpPKpJ/2vETGZaOipOkKYdL
         bzug==
X-Forwarded-Encrypted: i=1; AHgh+RrPTCzv6EN5/uVXIy6Lqjqbg36c5VRsQa+yg0MyBFB//tIMZm/LMKHJ+s3hcvrPTJDxXj2glUhN0wr+nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1yzItbPl9rMp97WX9EeCbEJWFUtwrMgZvccuNFTOXSiZCMjP
	6MFnDohTt9S8mD5DEVZwKQ/296w5ZKeyFXIWXQgNJv7LDwzHxxCEGgeenJBxmtZHiwI=
X-Gm-Gg: AR+sD12uDfuEWTv5Z886ZYgO+ozAwM4r7Cl3arKVKQUePUSngEgy5RPamSxflUnVdET
	Fc3bS/FJ4TOq2WU6OaowrxBOHUD5XW1vTvb0p9PECbwv3mqnyFNLa86SR+81SlLY1KNbZKyVpNv
	EU4Y3TvOy+8kZAvUL26RwfkBb7lTl73siJZdmJge3ixwbpkP6TAW1Y0uH3hFEDWtH9FQ0dLGAFx
	dc6yNgZH11dFkoEtW+tsHXH0qIzV5Cp2gkW5ojxB9wU/tf7A3s7o+NX+9rLt9ClcXQXMPw7BhER
	yKssfZUJWWBO/5ka6RgbiI0Vhcl5ZK/6/pAx2I7rKkRNp3XCkLp16zyo28cMY+CJTyqLemQdUb7
	LB6l5OCbYcy4bhvqilFftgZzffikMu/wE/peiyO+penTzFQxs4UHSoKFkWEZiJnZem+N8ca5nI5
	ae
X-Received: by 2002:a05:600c:21da:b0:495:3e08:ad24 with SMTP id 5b1f17b1804b1-4954a51b524mr172945825e9.33.1784706057686;
        Wed, 22 Jul 2026 00:40:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c52fc0sm3587920f8f.23.2026.07.22.00.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:40:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card
 on each functions
In-Reply-To: <87y0f3zwrt.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Wed, 22 Jul 2026 00:35:34 +0000")
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
	<1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
	<874ihs0vz3.wl-kuninori.morimoto.gx@renesas.com>
	<87y0f3zwrt.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 09:40:55 +0200
Message-ID: <1ja4rjeak8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 22 juil. 2026 at 00:35, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome, again
>
> I now double checked.
>
>> > The change is simple but it will make more complex to backport fix an
>> > older kernel once this fix is applied. So again, getting more context to
>> > understand what you are trying to accomplish and why it needs a standard
>> > card variable name would help.
>> 
>> Basically, after "Card capsuling" has done, we can't directly use card->xxx
>> anymore. So we need to update all of such code.
>> I would like to update such code as much as possible in advance.
>> Otherwise, "Card capsuling" patch itself will be more complex and difficult
>> to review.
>
> Current functions get "card" as parameter to get "dev".
>
> 	func(card, ...)
> 	{
> 		struct device *dev = card->dev;
> 		...
> 	}
>
> After "Card capsuling", we will use "card_driver" instead.
> But switching "card" to "card_driver" only is not enough, on Meson case,
> because "card_driver" don't have "dev".
>
> On Meson case, it don't need to keep "card" in priv anymore after
> "Card capsuling". So I would like to add "dev" in priv instead, and remove
> "card", like this.
>
> 	struct meson_card {
> 	 	...
> -		struct snd_soc_card card;
> +		struct snd_soc_card_driver card_driver;
> +		struct device *dev;
> 		...
> 	};
>
> Then, we can get both "card_driver" and "dev" from "priv".
>
> If we can switch to use "priv" instead of "card" *now*, the diff will be
> more small when "Card capsuling", because the patch will have
> "Card capsuling diff" (A) + "switch card to priv" (B).
>
> This diff of (B) part is doing very simple things, but is big volume,
> because it is sharing the code on Meson.
>
> -	func(card, ...)
> +	func(priv, ...)
> 	{
> -		struct device *dev = card->dev;
> +		struct device *dev = priv->dev;
> +		struct snd_soc_card_driver *card_driver = priv->card_driver;
>  		...
> - 		snd_soc_card_xxx(card, ...);
> + 		snd_soc_card_xxx(card_driver, ...);
> 		...
> 	}
>
> -	func(card, ...);
> +	func(priv, ...);
>
> If we can merge (B) part first, remaining part (A) can be simple.
> But yes, the backport will be complex.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

I think getting the device from the card (or other ASoC element) is a
regular pattern. I get what you are trying to do with what you call
capsuling but maybe you should add an API to query those things from
the framework ? like Something snd_soc_card_get_dev(card) ?

The driver then does not have poke the internals of the card but can
still get stuff like that from it

-- 
Jerome
