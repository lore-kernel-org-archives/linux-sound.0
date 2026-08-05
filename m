Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E13C4547
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900273; cv=pass; b=r1xBl131A6HYQ2ueT2sFUQBD75FjbxAalKA9WjCC0EPwky/fqgLdq6HD84txg8ev4VgNZxLCqnTYARA0ZKv67crz6pKlWDLbG1U/unFSlEUYvp0XxP2Wtgn8tt7oLp9/cgFaJMhTa1GFXwf/9T+9Q4794cXPd7EQ2yrG23fcuQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900273; c=relaxed/simple;
	bh=kzHUs4aFlrfw29jj/2OPq7Ny3j2bosxRBn0wvjn9Hpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=untOqmWKuIAYqlQ6PbKCRbqdlvX4O6v+QrALMQQB17kHdVpFXcbouHb4tttTvvcBENME4aTaK47BwMMbgvthlpZlNztCBB9gXH48rgwtLHh0P04ssYRtAi6rMMPUX1aFfFecJA4JR3vOQhOl9opU1Tj8yuyWpNa8JR7OBDp3/wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyRttAO6; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyRttAO6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848595b338cso648964b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 20:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785900267; cv=none;
        d=google.com; s=arc-20260327;
        b=Bf/LE0FphEKrlRrnvY7KORRr0ZeCFcZalD0LiXW+aFrXzmjP/VLpY2HNGDM5/hGiKt
         PE49p3QSVFAjbyN1QD0y3CmL1ZCri5ciGH8arGA6Z9js1dm6YCvH3k2XZ3RYFciD/jji
         1zUYQAKqi2+B/8X9HZV6KOefvmihAwy9E0yYtAvJB1fUhRRh+urW4QPjEZRlrbR9dBEv
         7PpzvQDEPKRfxQHEtbGKsLc4H+Cfh8THwoefSTHYdFdYk3x8jvNQQ7R5Z3vMW4TWwaha
         +P6PNOnTlOkxhvaj5tbLZQo8KctcmWw142fdcuMKNZ/F/xHsNm+5wceV40+ud7Hitq9x
         gKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kzHUs4aFlrfw29jj/2OPq7Ny3j2bosxRBn0wvjn9Hpk=;
        fh=iVLfIy22R+Q6PJdva0wTTa0dxbMOj/g4Oxt72+FZxbo=;
        b=cua/XQ83UCKi2JwDmUinoNuh+v/LDDiy9WYravfULeqosBWDA52U+vuufqAOU5gU51
         aTCOIw8wVHk5hRXYIQ7ZJG6O6OajqjbwXDqLegN00/eZhvYniEENPGaqxSlJQKAwzeZC
         QAjiKWAQ2XB17TG+++rKvyxx/f/unjLD563hrAafB/mkbY9zEuqhZ20CN11Egv9sJL7A
         jcNI7/nd3Kn5mLfxHJf09KiGHTSWHYEjZjTqpLmW3UlVjCVByQ1z7ckkVpz6veQT5Uh6
         x4D3FqoZ2QQ/Yl09jVIFCr0Debxtb0ijDfke0bNzICzFSLfxkuNQsslVJ+yO8dK2Mf1h
         Psnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785900267; x=1786505067; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzHUs4aFlrfw29jj/2OPq7Ny3j2bosxRBn0wvjn9Hpk=;
        b=AyRttAO6e4gndq0MVbbLHU8Ks6ZRK95Vw+FMrYpXYSbxtGpM17KMrlKONRbXtryPM8
         2EcIfVcfJ2jVV8d9TIosMfnvgou1tybWRM/ZSwfijFbnnoEU8rC5iARtVxOJKiTcdvFx
         U3sYpIR2WXTx28KoKxoCcLwkbRwfmTRmeRmylxBLJEYqm5oEDqq9WVTbMerVzEvy5uct
         QsQ9ZBD69SIYYVxKrTKNkj1xDkrXJujcRagIWNOvOhxZVjnODkpVFkqPhm+NBIP4XvB+
         jCKOzCZLv5x+ERN6KoWVz3JmyPjZ/qZ+yBKbCi4S8pLSLqgSbJKOowjo5sop8C7/bW6R
         o0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785900267; x=1786505067;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzHUs4aFlrfw29jj/2OPq7Ny3j2bosxRBn0wvjn9Hpk=;
        b=okqCq7+BDXakYgdfginsDvGwvit/5yLv3obdP4bxC9gyw0kimmWqyWMvUKLZix6h1G
         KNbhwdQKN1bqoIvP++OwfpbgYuRWn42bM+kcSKWHuvGsJuyF+jDw1rNShUfPnoiMrrgW
         YFK7449KmuXD5eBJtLfOxn9dqRvyNm4RLpUzMM9ZrvVDDVt21GO8ecEedgUDCpzANxaz
         JpihVWtLod5d3sHc1a3v6eq9oYrdJ+8GeSwfj1PoOpfNNRcWywut3X+irnWiRTrYiCQo
         CmwrOwzrPLQX7kH+pOScabk5kWgQ5eBKeGensC4UNUk2QbhS96j6rE/XqBCOUM6GwqIu
         dnlg==
X-Forwarded-Encrypted: i=1; AHgh+RotG7+60V9BC4/0GbasaQ9ISELY4zntikoxZJvfuYIL3RIad57CGUuzs5ovCMBlN0SkFEQpJfc8w64fuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9QzLwfKIcwLBTsTDaLsPLogkqARsjlGs6OCIllkRlgaXm65D/
	Ha8ng47o9jPk9dynKm2VaflJ+wrERanlmWIcy/C2K/HTFu1LppYZ0SFiPTUE6u9rp3mwOhKdQQa
	XtaVceMEpVkeua5yq1uLhFhXYlckQJgw=
X-Gm-Gg: AR+sD121j3UD0cKhIxGyESJwE8eL4rQZcqk9XDvfrUW9ZKt/25MbvOKYBcV5IGna9Te
	3nRIbHmpSLm2XA2/64xvof/3/sEqqRagft9JWqU0JEn1/Th/Z4v/PZ2q98Xrt5rZpm5FNhDZGT+
	XSO/ulcm6iXJ2rsZE5Bp4Myw03qh1Ct9KkAKb4DRHd4MlueYi+LAdrDQTvjESEyOW9F1ylvIIKl
	Q0k1qUwlR9G9FfcW4BUuTLgNQun1kAaZwLxVhu/KlU3u0ylXZKx2ZtP6gIKTVriWRVs8pUt9kw5
	kKxioghHBPqZ2j+DINLwf4yuRNvodL/YOq46sln+MvFBNKkVp2Wa5lgnDUobqGZ/2TS5dZQTfYX
	Z3pD1WTnIS1dt/scPi9pN5fYPXh+GJlVsj1nEJgbagYSBWIw4MfIqepBJ
X-Received: by 2002:a05:6a00:c95:b0:845:3033:6cb7 with SMTP id
 d2e1a72fcca58-84f2dfc8ec7mr2949970b3a.9.1785900266722; Tue, 04 Aug 2026
 20:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
 <20260714120042.491712-9-phucduc.bui@gmail.com> <20260804193542.3a83d4c3@kemnade.info>
In-Reply-To: <20260804193542.3a83d4c3@kemnade.info>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 5 Aug 2026 10:24:13 +0700
X-Gm-Features: AUfX_mzxWGTQnXbJqsCTv5UKdmfzTCF4sry8IO68g78FicqfF5OshtP5CK9wMR0
Message-ID: <CAABR9nFc-7HnB_4FKXGaRzA=SuGCy1dT=vWUn+Sjq62BqLT7WQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] ASoC: ti: omap-twl4030: Return the original error code
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

Thanks for the review.

> The error message seems that is wants to catch a non-existant property.
> snd_soc_of_parse_card_name() seems to ignore that error. Which is then
> really catched by devm_snd_soc_register_card(). It would be good to
> point out the error explicitely, so probably printing that error message
> on if (!card->name)
>

You're right, I can't be sure what the original author's intent was here.
But as you pointed out, we do need to also check for if (!card->name),
since snd_soc_of_parse_card_name() silently ignores a missing property
and only returns an error for other cases.

This patch has already been merged, so I'll send a separate patch
to address this.

Best regards,
Phuc
