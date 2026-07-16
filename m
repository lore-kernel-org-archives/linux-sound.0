Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A9423EB8
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211189; cv=none; b=M+BkK8LcE4m/dP2G7G+GmylI0WOWr/WLnyJ6PypTFfx35sn1gUwdXfw8R4OFCFuAsIA6lSdVGRaiMz7CKZekXI242jS7j+BCE8rAk2cH9PnyEt4s6dZ+WIIJhEdS3cTZGUVta+1PbS0Su17RsyaJGkN489TjBs0+H7xwaMYKMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211189; c=relaxed/simple;
	bh=mS0Ga4Pt/PLsod/JJQWij1WkU/4wsX0uUIZOw5oLu9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QHFZ6SMoRJ/dgRUtXbn6Q/7opbE/vt4/iGiY6pHgQyl4tPGPATbDTkySGnjZOh8p2oUP8W9usqBoeS28kGYOkrVJVqGaIo4yI3rCBFYTMjfJaEHQtK49xZ3pHzICuSNhs5Xsabs8FTayxrYHr3Ux6r3lmeyfOU08Jpvy0CFSbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LVVH+kF+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LVVH+kF+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso27354235e9.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784211185; x=1784815985; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=;
        b=LVVH+kF+kfNd4CA0Qx/qrJsBZfIPQu3wD4HMKyxvRBfa23EBJgZTwKmHObccxLlmqP
         oPZitTskEW16YhQUHjTNxPW4f0mJ4/FzjjkFekTRVUb+vcKjSTutASqB9BOLuMR/mqra
         J7s0ItkwjNBdyKSi1MniOdLCQfVPielINWWC1WwhUlg5ICvoIU8C5leKxLYcKywu6LF2
         fIleKF+FvpJOprRbDPST+N6CSgTlF2pCpcYL626i2wi3I5kn6BHFf3WzGaKgVjf0lKs/
         sVRMwGzfyquUMcEU4iP4R8tGbl95ok68qMRHSXOu/H/u8cvzOIvBPmhwKShdsNavxCdx
         Z/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211185; x=1784815985;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=;
        b=oMdfNo309LgjYma3mjTMMXM4iJcrVZOSzFGFWRWMFGf0ksoY+WmOmHskVY3ZbE6zVg
         pPrh6gPCxmJMADHMxNLd9Xr4uSe0U4ou6nnXufe0SayjOnKBQlJNbDW8oFtSEgGdlb7Q
         NXxB3Sq1ILSuzhzAER49m/QLGefwrY5gctCEhx8UtTi1+FxbZ+OLZTrwE4w4qn4GuTCH
         p6n5H4QNWXzIgu27FBSNbXj3G88ojZR8Kmj2YvsGGJigu1Rvy20swK87NT1w24LZoSEl
         ZxOJdw68t3FNk3iC+Qj++gFFd4VDQKi0PNM4FLbhWdx7KHpQ62EWiX7GXxuWrR6OdumG
         FG9Q==
X-Forwarded-Encrypted: i=1; AHgh+RogIAR9MBhNwR/Qt0ysMRxLsawH12e0TIbJRmRtutY3OBPVbgFoc44RQvAFtI6EQQrkZTe8VDAttVFpKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXtZdnrBBUvW/P4Xq6f9nl6V9GqjEnUACpbJiGpcQko2H5PqyL
	nu8YEBrhCUbpMc7PiMOHxWvwQKw0rizaXs35PQyM7aGrVxFZwztFTWJPhPcQiv2ChnA=
X-Gm-Gg: AfdE7clKCvh29rE0h9EAL+MFkaqo+SSQjZdjqYMoPl8TlAqs6SWAgf0zOauYjIyafte
	frPeuLNYMnShxmvZ2mc0zzi4Z2RaZdPozuHJQHpJqREOFHqi+C0xSD6++PQVCXvs8JXUZLxavIv
	/E4pj/9ChRRR1eO4yoIEF+HNGQB5aVumXrje4LNFL516tYDfXNtoG++rtlPWRLi8GntdncNuVI/
	JJUfuEDl+48IdiU0Xzpb6nJKmKkvNgGU8qROoBqR2v7sCtFeumiO50naZ/lM986e1JN/m3XETjC
	NWLVoKP94eLotf5+DIGLwpaKJtcBQner+OrTYe3EJkSwoTZLxhlJI2yKmIEhSXlzk87DpMExYqt
	Bg9XuVAmPp/fMHwcGz+2+kTe3rnN378GgmjZjeVc+Zfi/XnAjlHNgj4qJKV72i1LSOAgWCvmbXp
	3Vhyuyih9cfJQ=
X-Received: by 2002:a05:600c:8509:b0:493:e451:fb8 with SMTP id 5b1f17b1804b1-49515904c4cmr154217465e9.21.1784211184975;
        Thu, 16 Jul 2026 07:13:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9758:7353:c342:aed3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c1f84sm25108252f8f.29.2026.07.16.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:13:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
In-Reply-To: <20260716100939.1381759-1-lilinmao@kylinos.cn> (Linmao Li's
	message of "Thu, 16 Jul 2026 18:09:39 +0800")
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 16 Jul 2026 16:13:02 +0200
Message-ID: <1jh5lzf2fl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 16 juil. 2026 at 18:09, Linmao Li <lilinmao@kylinos.cn> wrote:

> meson_card_reallocate_links() grows the DAI link and private data
> arrays with two consecutive krealloc() calls and updates the owner
> pointers only after both calls have succeeded.
>
> A successful krealloc() may move the data: it frees the old block and
> returns a new one. When that happens for the link array and the second
> krealloc() then fails, card->dai_link still points to the block that
> krealloc() already freed, and the error path frees the new block too.
> The probe error path then calls meson_card_clean_references(), which
> dereferences card->dai_link and kfree()s it again, resulting in a
> use-after-free and a double free.
>
> Set card->dai_link right after the first krealloc() succeeds and keep
> the resized array when the second call fails, so the pointer always
> refers to a valid allocation that the normal cleanup path can free.
> card->num_links is still updated only on full success, which keeps the
> cleanup limited to initialized links.
>
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Thanks for this

With this fix there is not much point in keeping the labels doing the
goto error handling. Please remove those (and the err print) and just return
-ENOMEM.

> ---
>  sound/soc/meson/meson-card-utils.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index cdb759b466ad..38c1b2ae227f 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  	if (!links)
>  		goto err_links;
>  
> +	priv->card.dai_link = links;

You must assign num_links too for this to be consistent.

> +
>  	ldata = krealloc(priv->link_data,
>  			 num_links * sizeof(*priv->link_data),
>  			 GFP_KERNEL | __GFP_ZERO);
>  	if (!ldata)

Adding a comment here saying that meson_card_clean_references() will
take care of the above on the exist path would be helpful

> -		goto err_ldata;
> +		goto err_links;
>  
> -	priv->card.dai_link = links;
>  	priv->link_data = ldata;
>  	priv->card.num_links = num_links;
>  	return 0;
>  
> -err_ldata:
> -	kfree(links);
>  err_links:
>  	dev_err(priv->card.dev, "failed to allocate links\n");
>  	return -ENOMEM;

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome
