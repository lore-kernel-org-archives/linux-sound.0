Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21C2D46A1
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 02:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204511; cv=pass; b=m70hgVzBfkukK94QSXn6Fx6cyCAl2JT4PENdoaoSPZlNAaO5bgyJgpB3JINAGWCd9Di5Tj5r9GE8BXv/bnXmGKwyqQOPP9Ps4xdCQ+T7AZuchMGd1KY9kToJ9tEtY2jZxJy3wjHVMUfsJx9uLnnUcEzYCXvj3wtdsMJ+jXmZRyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204511; c=relaxed/simple;
	bh=0ROOx3ZhQVOWosh0120PMx1HVLKMFBViN8Z24nvhcPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJVUSCYdoEvZSPsYXBoM8k0M1gdGFk0vB/M+/bPFKgsI2AXEWNPEwO9WYfC5I84BIWovW4Fy4vgH5a5YvNcxDEJlZyh1qpZBdijpk3I9IGwvbMOtu6XNkWBQalUjGUwfVk8dfi/RTwCWbItOT2buGTyh5DofYEyT0izOG2AwvVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL719fxt; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL719fxt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2655489a91.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 19:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785204509; cv=none;
        d=google.com; s=arc-20260327;
        b=izOivx6bp6mGudNAg71xgwtdzwvIJInye02GuFW9UN7bRb1g9D3m7TYPIVfUbvL8oq
         ybmJ0CJu7Vnn+mI3O661j9cVzUovUyk3TeM5S7Ek1Cp+sFK6dLm2Uce19CMDfV3kiCwN
         Eag0iOdskwqEHqQo9swcyi7MuULm9tlCE9BSAt2x4vsOX87oOWX5FdoLWQzGC3QX5sSE
         RGIaedWgmCJuaAj7DF5bce8jsXG70hVbfIdTvVtlesv0nGKeQYeiz75qZIcaZORvv+YD
         RE8uZTC3/ie+/WiueGC3SE0yYsH0Tw8fjKUu9MAXHaQUXWS1A5fto+V9BiPiq5PK6jny
         +Fbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BkjrunjHZ8ixzrIuOK/V37NBJHAzAsV7EODnnJ0k+Bs=;
        fh=8Zn9Vqgnp4q5Lh2zEv1vTaHiIPdatMB3PBdU1ay93cY=;
        b=KLD7xMqWb40vfiAr8ICJB1Gf4krbsJtcqDJUf9s0hG15jEBH+ghFgcNuCZvgadbGf9
         ODm+aEqFAjPoSKNqayihNS4gxhpGV5/bSIM7OoMr5GjuBOqu3dh58yR3wDe6fWH1N0ln
         /JrLED0WLvGnb2m5KGvO805T1Bdgz+UGw2Uqsbk8OIvNJSReQ0mc+PssslhsZQ3hGW5g
         BVFg+kcBGT2zbuzrCCBxLuxk1nKgssuRh+X4lEqilROGTQYr3PHxger7QTOvSSniQvNA
         RtBdJpx01CW8yHe0lSVxY0hCwszWo3DHxajbJ7FdXcymtep8zdMfqMe82uZHidSmMSmp
         Wwpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785204509; x=1785809309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkjrunjHZ8ixzrIuOK/V37NBJHAzAsV7EODnnJ0k+Bs=;
        b=jL719fxtP0OCtCFjrAksuU9Sl5q0o156jVjU18zm0apqZr79A8MC3Yvx4KQRdZgYqF
         K5AzlE0CgtZfD4oJskzL+QEfS0P4SjPNsBSbam2eGp3bIcWZCKVIuDuLWC4sG1Y6zDTT
         J29Z3Wdirv8cbd8SLRxzRXXxoCQ6iRO1lP7fppVyxFDnT2GA4uvRqbsJBABOlCbWYi6A
         YOjfTwb9U2qiXdEvcSo0uXWLyeH9TJ/hm5DycqK4knobo/VooY1Zi5eG68Ai6SckRzsF
         rPppS0I5GwUw495WPoOcCwVg+WykhWmJaoHMDHCfc5Ur/+25ViF1tI4IA8nuCv+FfokD
         +/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785204509; x=1785809309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkjrunjHZ8ixzrIuOK/V37NBJHAzAsV7EODnnJ0k+Bs=;
        b=GppGThjChVjpt6aVyuBDSythJHaKPAuEk7TBYzTri3Ph02wbllLYVMeLwrUlXeKxtC
         O+WSFu9vDVc0JgxeBDawfLskkT+FAD+wisRx8tTLmpdI72Vm3YTytLEkvDdrzjIJ79Yt
         THW3SF9t0JOIRmgGKGHAKucNo4O1xG79jn2ywl/j+YpW9oY9Jq04MVzR+V7qXdc3jnR7
         Mmiud1rWNPqi4EoThIfAzyCHXdDC1ulLxbOhUuIxzwvApomlsXNxC0MRbEQpRK1eUIkc
         Tm/I5+RLxkjzpk7sOxawOXx9c4IV4anOqzYbYQbVIaYqtFIgsqJrmgVYfCvqur6uOHsY
         zwGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDJE2NyOlqeTfD0EIZLMCBBfpHhvQI0x1Bt5Vhm/AAV7P/tQayI0TJMTKY9/e+9/lefMLS5fq3GNIopQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLbAgCzlmpNbP4079XLYYLUQ9wgWUNVvaN0jioh31HRR4r8Hv
	A9qdOzKFEKR/eur6vvsX744LCAmzobZUmxEK81fxc2uH5Pqwue5apYBRiMDCkT/jDsD+5jnUckO
	WqwTAeGYWz2nqwLeYppVxvQZg/hQ667Q=
X-Gm-Gg: AR+sD11H1ROX8vH5kjWH1OOP23oc2sdEFftcoMax5S+V6z7PZR4wIFFdtzS0PTvH0QR
	BNyEE8J8npJaj9+Uap/ATyJ8dR7sN/Jc0xcpUrm5h7Rd5ghN7xOUupCwtQUcfUIFLXLKi2xB5q0
	S77Nt9mosk9MiPPCC8kRLXFJxX6tiXZHx9qGoFXo6SAycmAu4Yf6XkcNpd28g6B4MsC/XVpq6xW
	iPY9notvNFvirk6fOzecV96U68pcWeyOaojWVW2QJccvpgqhAqrrVbBcGjdRRpZqi5pb/qblHRX
	Plz8rO2QLZ2Om7lzeYpZ174IVSWQjDiLKWsuW4H7zLbMVXkMGF81KElf6KnFH6BnXvE4209nehS
	UVzqTUNNP
X-Received: by 2002:a17:90b:58f0:b0:38e:6a44:671b with SMTP id
 98e67ed59e1d1-38f6a29f784mr449251a91.0.1785204509345; Mon, 27 Jul 2026
 19:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727094046.23001-1-phucduc.bui@gmail.com> <20260727094046.23001-5-phucduc.bui@gmail.com>
 <512ae60e-abbe-4d5d-8106-8b4020c7a2e1@intel.com>
In-Reply-To: <512ae60e-abbe-4d5d-8106-8b4020c7a2e1@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 28 Jul 2026 09:08:18 +0700
X-Gm-Features: AUfX_mwJjsnQw5Xc907EXiK4wMek7-JJgF8qkGzgSccbb5oZeaZ0h7aYKk6Mqj0
Message-ID: <CAABR9nEE2AxRAQGiSMdpkEibTkKr6RpzBw4VzkOgchtxZxpK2A@mail.gmail.com>
Subject: Re: [PATCH v2 04/26] ASoC: codecs: tas2781: Use guard() for mutex locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

> >
> >       /* Codec Lock Hold */
> > -     mutex_lock(&tas_priv->codec_lock);
> > +     guard(mutex)(&tas_priv->codec_lock);
> >       if (event == SND_SOC_DAPM_PRE_PMD)
> >               state = 1;
> >       tasdevice_tuning_switch(tas_priv, state);
> > -     /* Codec Lock Release*/
>
> If you dropped one comment, you might as well drop the "Hold" one too.
> TBH, these were redundant to begin with.
>

I'll address this in the next revision.

Best regards,
Phuc
