Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB92433055
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619158; cv=none; b=Ewde48YVmv2LSB4zbJJCaZXwYFnxwthFG8YkZ6jPNee00aM3HaikPKLzbe/s/TcNfRS5HooaGTVBJjdCXloudRaBevQ7fJAkCOs7YvS7X2H2bcAOTDRAg586G3EpbLLpv5Fh3GSotDNa90z/o9tAPM+4Romoxrf7vT675R+qGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619158; c=relaxed/simple;
	bh=62htjjn4MpGCDCB9FjluDHU8byfqqSHMYsxKPkwoSJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HOMMGgvoIkTFknWwCR8SuvO0QovVchLuQbAGJ7p83rw2AOACa7iC7b+EChVhLm+dRXnPiZt+y55dcTqQVdQFCtXpAFydNogHk59Mn7p6FHpxTaeCYiLe7an3/iccZ6+X8phXnLrLMyeg+P/WZI4nVWRNIeolry+FoVQLMWQJLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bvSXNslV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bvSXNslV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f752b3423so1577116f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 00:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784619154; x=1785223954; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dGv7EC+RRgTgrfV+NT/WM/6UEMID2tEKb0vtTaWsXRw=;
        b=bvSXNslVIw39d5II8/wEZkEwyAv9LYHdeLlbwcpw4B5/kHqpehpNXdsa2N4rU45e91
         saF3+Z0xicdq7n6MJAhnN7DhHfc4ovd0ZyqrzrwTtimvWF/py6UqUQdEvoKCmDK0F+zq
         3ipDAuWot8S2A6CwK5B1nbart4x4dUYfo/HEzk+u8qdseCJbhI4lHQCUqU6YHcSv8t03
         l1+absrrQ95rgdBLgttcP7ZuFWJwQ7luibnUGOAGqiPO+NkhMUuCOUVmwM+44gbMqNEB
         2a8TRz7oifqoivXpoW7T3wJPinhpf5ZMnP23d1WazC1BPNk80zReNYQdlZdSSRe/6TkY
         Ym9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619154; x=1785223954;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dGv7EC+RRgTgrfV+NT/WM/6UEMID2tEKb0vtTaWsXRw=;
        b=Uift7GjVl3kMpwd5wlyyfSGMeId14q4+wIUztzSjsVQVrdPOTDWL3928LTPRcDZFHL
         dkh+4tKCz5tZ6sFZGwsZXP5Twwa7opFmSU4KJlAOkDOWLnnjjTalgH0UHKVqgsTUxbSe
         elqGWbkzKnBR8yxFRWZ6xnbQxpxS8pZqSsB9XwrX52GOvGI/4oyskJ4BASpuhvYEd3EC
         4vFeWeO3Fjo3RRTyvqIynbreCf/IL0b9lY5yn/a49uaC5kdn1MWNg+/WB9tfFPH6JThQ
         llQN/GRqgusAa3GlehUD+hi/tE67V/753N828UTxCatc7C12mvMS5+DjoiWcb0X9rQmr
         zJIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1ty/0nnv1rXp5r0bqcBQ995UQs1CdqjODfJQOhIznH+XLr/AE/HmhvXMbAsNQ4jutacOBa0mrecQSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+DSANVfKEdAbJStpHIcx4em3lCgbDzcojVsDApX8SIJMXwcY
	vKiaEzrsqu+JjglomwYSNjsA2V1FFHEhbFmgmX9PlDKjmcOAkFfaERJgKXpBfEF09sA=
X-Gm-Gg: AR+sD12cSVlSuwhG4R996WaF04rFrwBv/D2EutUnCz6mMl9LKiw+oLR03icE+sp5I5N
	QDUexa2nF5rVj4Syryc+3JFeRyHX75oGTCkVslP1idEEQJG0FcKtQtep1xhNPUE4QItdJhmrgqL
	k9umtVNSMwuZJaa3gIpl3medaEYzYGN8QGVuxeSA+AF/zhQB8tZw7ehGVm2bAFXKVEaBI7q8Y+P
	HO2ygVJN9G8Y7eKE+xuFgM/4p6AVGL+a4UBq0buV+LqgOj3QVbcZbZiiZUYbFrIlyUdIb6UBfqA
	VxCWDIH0aXR9vcXcfw2YuaE9Lj/tDnNXG84e+7Al0/+CDI65xPjoNAAW2P2hqMZpixZmtzctoEk
	cn0IrDwDEMZlIp85y7KX6m0XXFXMby2g0ne9XzC0ygSJcLxupl4upIeMkRI2OrHoZr6chV790P7
	vU
X-Received: by 2002:a05:6000:4a17:b0:47f:80e5:b9b3 with SMTP id ffacd0b85a97d-47f80e5bb24mr1515729f8f.33.1784619154020;
        Tue, 21 Jul 2026 00:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b11:1fce:47ee:c5bf])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ee0086sm39480548f8f.30.2026.07.21.00.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:32:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] ASoC: meson: meson-card-utils: use
 meson_card_parse_of_optional()
In-Reply-To: <87tspti0ng.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Tue, 21 Jul 2026 01:36:51 +0000")
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87tspti0ng.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 21 Jul 2026 09:32:30 +0200
Message-ID: <1jldb4er1t.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 21 juil. 2026 at 01:36, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> We already have meson_card_parse_of_optional(). Let's use it for
> snd_soc_of_parse_aux_devs() too.
>
> It is using snd_soc_of_parse_card_name(), but let's keep as-is
> for it for now. Beuase it will be not able to share code when
> Card capsuling.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/meson-card-utils.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 8617a4661a339..d144ab79b645b 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -300,7 +300,8 @@ int meson_card_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_err;
>  
> -	ret = snd_soc_of_parse_aux_devs(&priv->card, "audio-aux-devs");
> +	ret = meson_card_parse_of_optional(&priv->card, "audio-aux-devs",
> +					   snd_soc_of_parse_aux_devs);

snd_soc_of_parse_aux_devs already properly handle if the property is not
present. I'm not a fan of adding another level of function if it does
not bring anything valuable to the mix.

Could you add more context describing what you trying to accomplish with
this "card capsuling" thing ? A link to the RFC maybe ?


>  	if (ret)
>  		goto out_err;

-- 
Jerome
