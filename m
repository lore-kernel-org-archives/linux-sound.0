Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA5423EAF
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 23:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784070587; cv=pass; b=ttndRyh9l0s2M4Ui41a16TLPyk2GqavR9GXUx1kxecEhbJvWEJQ3avN94xLtmEe+wEt8KQBpJnQeux+jQqeK5+TZy15WIKoOvDXsJ8edzw7wO4NwXHaUP1M0LKg0pucXBp0B+i0Wkl/xpxDIGrFkJXCpdHp39HrqZ7nMkaH6nk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784070587; c=relaxed/simple;
	bh=DY5A1oWwEBN0VKyLnOnlH5sjYbIRDBe8tPMQMp7pkQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHQl672X9KwVTSYZFBsdR+rhhYzgVA4rQZShzloaoC0Jths/u5pRxJivxKTjtf6YDjbVKJAnoCSgMKJTiDTWVIY2mRywTFej4YyXL+V25gyW8LLm8XCQU5oHkPgvRlPVNXqS5L5QzD1AFhzMZ8SS+rEs0lVRhwthkhB2abNnTRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZl6ILGu; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZl6ILGu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc61541f8cso1021055ad.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784070581; cv=none;
        d=google.com; s=arc-20260327;
        b=O8H26s1fPEPh5L5ktJXA3jvRChdJbTYltcW6EKQihgXl2vb3rpEIMGp6DdSApg4FKf
         u836hb3d/b942Na6RaWLsHdzp2LT5zU6FKZT69p+/rhvSqrP6LRI0vpnXLXCFpPtH3E0
         LORAwJLCO7+2g7nBHEKDt1CWVNxFvdnMgbcg6KRVy/2KQLosVbNPOxWb5zNto/ViD3xg
         V4FERjgxJCm/JRynZzjMStL+/Gru/HXFwR3HhNXoKwUUas65AwCw8GIzeyF1f2PNjwmk
         dmCIhlLq7IU53m8NHKvACCTXL6n3R2K2FvM8iL2CPyzfyjk8FZzj/SVnnP6fwvkDxVte
         XmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MmzNq7zlle7zsDCKvLICynJuteFH+SgQHCQ2iOLA/lI=;
        fh=tWMKE/fAcTeEdY9q4csDHcUaZNoH+Hf1lEAWuPVLY6s=;
        b=Llkc/s/8atJHiWFqhxIzehgKZt/0S2OYkZ2YkOpg7lqY+2Ptr6sAXkuQHgCqbRH7qP
         gviQIGQCOdlAi962Vrcsc3XGI5+gZMjWJQD+ET7wpzCgFouH6qFi2dEDTHerk3m08EEk
         chOADYND1fbNN+8N5V6xW3a1uCvgWNHGKwgKolDnsDLPwOGej31uoA/s/djBMs/Zv0Tu
         wy/MbxAe7ZjYVpXnbGj72IrH/+DLJaU/mtp8BMVGtzAhNhCiMs5Qf7BbvGbT2zjXPyTE
         YiPRn9l45yLMeDL292McX0mYWTwZSuH6ei19Tk0yo60kLSVcG96+IcFqcra4F29g8JAT
         4tKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784070581; x=1784675381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmzNq7zlle7zsDCKvLICynJuteFH+SgQHCQ2iOLA/lI=;
        b=pZl6ILGumQ84L9xLnXhhetfYSyZaspRgdAcHspSwR9XeHeYPyG8Y9bYlS6aYveZ7x9
         aAKlvw+7TkyO1bgtP8JDt+aNZjB66kwx9bRYsjYLBT7XZz+/sInltsVOssDveCsvDD3+
         a84AcOUvv2R1YCfg51zs+4DFE991/A5+kGnLEVZ1o+u7N6r2U+sJF5hTpWA7KsqJpvtP
         Og9+gbDpaCbxlEZu6VqGIcLz9RjqysBNyCXAfqodzLkxSxNT2LEvWuOfd4dSm2HDajWU
         KEEKvhWVAYSkZET82R+6olhiH7lSV0wigqMChq2T7hCzWFw5GK7JCZQLvhxhaT2y9RxH
         eNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784070581; x=1784675381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MmzNq7zlle7zsDCKvLICynJuteFH+SgQHCQ2iOLA/lI=;
        b=iYkQOHKPK45j7y4wQTyI/eOANJA6LgzK5L8G1FjjtL/H6RtgHfWPbWqsiGCuZPoEZF
         +Vk0IJDdo3HCw1Ak8vdahcEmS+gZsxTjjOyCmiihLw+tIZKiMSaLe6Y9sl38w4mtOZVm
         A+3xKzUYO6o6GAUHBWBtvkFY/avRUqRiPjdk78LonF150GRm3keKMFFzitHU+/U6MF80
         WGzv05p209cPiVQTzFnygKw2Xat5WCS3HO11+cAhw8O8pD2pVj7MNAY6tjQYeBMpb/jt
         1daUrRvYGjdtoM/PwMCpMlenbNQWk5x78yNCG0A/Dpg5Meeqwnk9RanI3J9RLqioozYU
         VqpA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/JFCOncuWgjL2eaGt4x8tHYLuDJ+oUQE5ThPJZapLGWllu4Hx19AOQ9H3KrN62q28jxK9pn26poSwgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybxzOm7Rv02vNQgPGFX7pJFeTcV+ajlxoFFmtOXp/cviF7T4P3
	D8wCYvf5xhoVprv47tvQR55AtAZvrFclGtdzcBZTXD+TZB274+BDvkKpSiR1iYVz2/eom/iZ0RP
	NqSAGVVaY1ouA5ursa1klsTHlaJfLkIWsWL9X
X-Gm-Gg: AfdE7cn24bKz5OYViMrJQoaECpJi1F+m4xH9Qdb+ujGzKk3rNMB0n9CB463kw7zT2wF
	3rcdNoUdi2rt92KR5t//UTqRdne3SM9kovDE0BP3KJ8w9+bXs+rypKhWBbCC1ESDam/jCnY7G6h
	oaYyIgOGdgzCDF+ttdR9cvWagG7bWkLVUnx1hz5/MLwpgBC72GpCxNwRgMoDswgg1S4LB64M0ew
	9eNDd6W4NaRm9zH7hHSZc7UmU6tr/lOt5jHVXZ//Z6CbYH6trdFqNOj57G5khXVexAoN6i0Q1WH
	UbPQZ00aHDDVECmU6ronz331akol2/wqe+yhuYLvdOmtEkwGSjKYwILHJxOMVQ==
X-Received: by 2002:a17:902:f60f:b0:2cb:402:70cc with SMTP id
 d9443c01a7336-2ce82988044mr185566725ad.28.1784070580677; Tue, 14 Jul 2026
 16:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
 <20260714120042.491712-3-phucduc.bui@gmail.com> <08dc1142-0ca0-4bd6-b59f-12a167216c03@wanadoo.fr>
In-Reply-To: <08dc1142-0ca0-4bd6-b59f-12a167216c03@wanadoo.fr>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Jul 2026 06:09:29 +0700
X-Gm-Features: AUfX_mw4y0TRwTsXh-IuUCF1DYinIeTjIvxOhl0u7w5b8FRXnViXEK_7O8jyI1M
Message-ID: <CAABR9nGTcjgo2qkTCazUTLQP_aMsv3M-cx=DRSHys8Anja+91g@mail.gmail.com>
Subject: Re: [PATCH 02/10] ASoC: ti: davinci-evm: Use dev_err_probe() for
 error handling
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thank you for your review.

> Nitpick: this blank new line could be removed.
>
> >       if (ret) {
> > -             dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> > +             dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
>
> Nitpick: Could be snd_soc_register_card()
>
> >               goto err_put;
> >       }
> >

I'll fix this in the next version.

Best regards,
Phuc
