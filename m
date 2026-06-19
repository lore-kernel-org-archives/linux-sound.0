Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1698313E2B
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857251; cv=pass; b=ODiMV20hVapSpRAa5nyRmCj93XPEgNkkjU1SybvJMIpfkEC3AZG4v3wa+59YBrCFxjJWCjasVCxBh0LRlsTnAmnxIs8hlcoW5m886NiSeMzMbhk+ivK43xOqtmwmTQqnIwGQvI/koQeCNkhM5S94QZBtZKq8tJ1uKZgHFty2euc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857251; c=relaxed/simple;
	bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqM/kgA36CYWTr/QWIKACYkuGTl+TBNe6ocmFdNAEAWTYx/j7c0xM0tC3gvSQEDbLNkiYv6I9AjH/2hFWUuV7mtNgKV2+vM+nLXHbi6OoPRl7H6pxOgaJDQHfL97px9QkBC6PKrWw0E/SJOME2o7RHCpoIdhQoc5ij2du4rI9II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWm3soFi; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWm3soFi"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84231305a80so1071645b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857249; cv=none;
        d=google.com; s=arc-20240605;
        b=SK1umixWiEbGWhCAL52u+dQ6Gg7T2pQJg4VqiU+9xMmPKwXrtcf8WZuQgM9sLEIt/k
         lTlRdwtgKS2fncMKxV31DwHagosgdNp6bpa6cI8CeAea+u+t+K5E0LDRcPZC8bB0SDLX
         qqJjHB5tj912Rw3M1W8UqIXQxw43u6x8nzV2mDQyD2AGHIGCW/UZjMgEgdvnBh1TT0Fe
         XWTpSEjy+WzvoVV1i71qEVsk8Ipomzb8b7j/iwKlISUaTpKJIXK4p9dGHSJHoolJ/VsL
         +IEyJY4UDfF9T7Vujfm/xSiXKnuvyg9EWcVVSQ5tPKo7lsTwv0F0u6H5WRCFCySnJX8X
         Xgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        fh=/UV8hiddh4s0Cj8Cyh7zuS7onRbtSmaa4wZ2QGetMQc=;
        b=kuepqTPJx1Rvqua4J5sgXq7hbmNr9lzDMoi2Zi80WoRYKRmXhSCBzY5TwXceq8XGUB
         zQTvZgZTpNVldyyTtOvP58l0318xaLPIt+11ISon+9+lme3QTKBYv6scYx4vP1yJgUuI
         zh/YxAOZfB9oEcakUfZBAnoHzCVYvTeuJmIHtbV77Vmrtz4/fISbyI/1L9CuZDN5bdAo
         fUym+TNDio+3miSp9KaXT9GORlEybM91SIl3DcATnsFMHG+UeR+cQzwFa3Us/etaluoB
         yHuJffQSOACvQBVRvfhsCAHvgQ2hqMLDDcUyfFUrIUIghnDPlyEcjthg/2A65ikqbKOw
         7X8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857249; x=1782462049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=hWm3soFirZ9rISqzBUdz2vMZaZC/l+qulyXwX2DxJgoWNXZgicsoCKqnElMrhc7xKq
         1EuyDUBLQXsqPzle8p1pYHPJ8rGAtA2zgbVVdH/BNtUoWj77UkfpBbzG8xg5dWXxvvOi
         kfgdG/75P4xdYPbW5piMp7VAoArwTqh2ngBy2tXyNiRhknaVAMN5gs/RVrVnoT7SIvrA
         GATiectR018NPCYVksZUC5HUqahevcwMkrave00FpVqTJVFugsl8PAUh2k4TijegRqDU
         wOzFPxCFXgGsKQBJURMLPMD7EOao8w2pIjyY4w5C93AiUCOmCevudD6F5gN9mPXuBpKA
         e1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857249; x=1782462049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=sRyV3E+oqnG+CxdE+Ng1WoNUEmH2dSWeEXpvOwBOWtZ/kdn0bQoZYOzXCLKPoOhqss
         83HWyaa2s2dx/PnBX2IGlILBkairLB022C1k1WhbW18Bye0DokMrRjNM5yeiQa2ScXZQ
         FrTwDDSAJc7VY+z0XsmMUkiqE35VWcYQwf3+Z5D4gLvHvYJ1A0aaISn65o+V/OA2QoMS
         0rgUU33xekbRn1IF2tiOM7jGVjLgPYdov4duvotulQMSNp/z7Wtw9VIRqbWA51eLg+/U
         J/gPdv2DUJEvatMgv1SOyN0nu3LjJGPs5HKLk0o/bmp+mkb4NCcHJXaMX2A12vdtOukY
         p+Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/5S+3yW1TrwLIuOixZw/wsiFzNvfHjznE9P6mWkmNwec0WyuqO1n6rcjXvr+kmLx7ffjLbWvXXb72kNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfI1z0fqag4Z3S22MlpTUZNowLY5Z3KCn8SYgL2YoEjk/4ORj
	jT7tazQAfvWCuUTcqeh7+uYNdaPOU8xMgx/sEr8QuAr0vNGuDrFgSHyX50k/BrkY1obyhBXJfN5
	JH87qZ8nt/41kTPKMVPyVve5FQRnvHj4=
X-Gm-Gg: AfdE7cnqsZe6ekz1xcv5P3ADDiH811DVAnr+6b4hoiNz47VS90PpvQ30E1ysO7XPr7P
	pdj8U6URfhT6YlOkINOsdldO6i3FLBO0j4MZivVM6JcGrHu4FlrZA9Np8w85zknHQgleU3GHhZP
	vXnL9Jhs4PE+H3zbZwzO0bsp6jTVtDqXPzI7PpcWy9URpPsRPvhxak86CSGDzRhnKKET5SBIkl2
	UHe1D/C1p3+jOxRIsUMhk/6igtLflWrdxoCC+2fkr6gwiVsdnYe49fh3wGpf+nFfQGkQ6On8JCP
	8ZdN2SH089nMKIrsV7en1jnjJTspayH6oW32fA==
X-Received: by 2002:a05:6a00:3cc7:b0:842:6a97:52fb with SMTP id
 d2e1a72fcca58-845507cb50emr2639722b3a.18.1781857248942; Fri, 19 Jun 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
In-Reply-To: <20260617140209.3f89706c@pumpkin>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:20:37 +0700
X-Gm-Features: AVVi8Ce6D0PT5nT0JZlv3l3sVJ8JLAPJbKAWX5-seLq2FMr-NiEk00n-taoSGeE
Message-ID: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: David Laight <david.laight.linux@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Charles, David,

Thanks for the review.

> >
> > I believe you have to use scoped_guard here, as there is a return
> > from the function above, if memory serves it attempts to release
> > the mutex on that path despite it being above the guard.
>
> Indeed.
> I believe clang will complain.
> That makes these mechanical conversions of existing code dangerous churn.
>
> While using guard() (etc) can make it easier to ensure the lock is released
> when functions have multiple error exits, I'm not convinced it makes the
> code any easier to read (other people may disagree).
>

I built the code with both GCC and Clang and didn't see any warnings.

My understanding was that the early return exits the function before
the guard is instantiated, so it should not affect the guard's cleanup
handling.

Could you explain what issue you are referring to? I may be missing
something.

Best regards,
Phuc
