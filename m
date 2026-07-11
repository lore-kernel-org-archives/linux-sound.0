Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551AEC2FD
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 00:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783728521; cv=pass; b=L4RC/tokAWTasxvfSBam1UcP42tEodxlf3//JnH3v1hQa0XVgUmsnPUbZaIqdiWUpwwrgeDiL6heyv8zla1DEz5sJUVIIGEk60LplfMthJebHta6UE3hX3W8L5wCVFSKWjsD0IfXNXlub+LHpaHtlWtCCq8GH8h6Dry4d6gEtnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783728521; c=relaxed/simple;
	bh=kT3WGq7xQUJl/l7l2sBFuylj1Ru6lkFqwsVBVS8paKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgxNDQGc7YHU7Mp4Vvo70PC0A/IE0KX4LoVYqK0XuBA5QTAlqUu6OQ+C9YOn8RX059EY7MJSjwRnK0Pm2omFWcH2ZRG0XGTwC1LHlDWpFzHPzxUFUQNfLMnRCs+mhldoMgdPLJ0L6r97RlzyYHW90KeGJY9m4ljRBVORLS2F1o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKtq0O2o; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKtq0O2o"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1547572b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 17:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783728520; cv=none;
        d=google.com; s=arc-20260327;
        b=qUmwEkbwFMGBtPxpHZt7Z6uDmQdvBO6SVLSroLoWw+BSPmjA6JrDeDl5XlsEepmYla
         OTNFsKMo3KBUwO/P1RukrKIYLHa1cxe4AufrgJKI/eFdGaNPfXTkwyw+Uzcc1HDDsHiX
         aimPxtHa3zeoKbJlvExnpcQRJzVxbeQDSUlvak8o9t/oYbSFC7nUUyPLk8XB4yX1dAjS
         NLioj4qeHIeVi99eQVjoEU6RWt0AGeQUt2BY1WA++q9+/LCDIsWQws0UUDU1zqAZbKc/
         ihLo7rQMmmpMY/1uxNcTDnjKH3Udya8ZFM5xX1uI+OPrQwoZwTESriHk0KZyBM9lCDSl
         B6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        fh=7MCHi1mIF4Cw/165TN17IpJ1sMfI1nSZ8rNHPz9skdY=;
        b=swCKE5Pt8xvhbuj3KZfz6+aeC0qyyhSYXKwBgVHvTBqcIG0CluTVI5bNPPsoH65NB8
         MhUXPTCeMUZ5reL58Piz6E57Muo3OHTLPDLU4gIuzDX6CvSreVUQira1QTTTlcmaezNg
         ozJWRosvyHAT5KrM+qM2Xsv3V01MdRp2SfYopyXslvcdjLcY+8c7hxWq2VhHIXOFRMI0
         ff7oAs6lj3f/RmY96k0cjvwDUFXTOMXun7BFuqjynXz9te8q9FP8emqBLCnN2PbEEAOE
         klpa/Hu6TNfobC+UNGfOxYvM2NypzBPDvEHvzzbNE989lpd13TaCY61NmmcIHLtLrfI4
         mxiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783728520; x=1784333320; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=hKtq0O2o2RARziqt7tciLijHjVjBy4k3GjO4NLSkJLqLOp8BM1X/T9zgpewnzNpXIf
         JZj9csawlnZvMDhlQdWKl32CKqY9BSkyFVPWrgr5Xw9fyaOcD3aT/b5LpITKbxn5AfMl
         r6xIchUgP36JET5Ha8/DRz7MWW85sRIM/5iLY9uwqeDBMB6vsr6a1OiARLx2k573muzn
         f0wqjpHhBkE9N/xnkjJIC3hzh/Z+9yPj12S3KCJoTsxX9iQPYz12cn0BeYw/rLJf7lqH
         Eyr6vvwo9Q5dYpQSfVkWJ3+ZGwjZOnjoRCLWKe3mNPLh0gYU8sC+n4lMtmUReEwB4l5D
         0Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783728520; x=1784333320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=qx2WhdaGXRnZH4osUoEKale0+RR5SkXwBufEdQZWw+rgCkvsp13vNKkHYIdp6Muvg0
         3klNiRBNgooKOMfVlVgn6F12Pdwi70eySlX/dlDcK+kwzVZYldKuGKXKVfhqJGeKYwL6
         JCpoewO70x4aa8ulkKlxcQSNVgkhhNsW0iq90uTOsPLrsxEJR3PFWHnXrQBWVxZNzA9R
         8afPDxLcoSTF42GcjVA1Q89XqCFxNpfisyk/+KpZ/zSKYbU8hzMhEp7Ui8pbY0bI9NIq
         jK/KFxn5Mjnr7iL1as/lHTXzwtD17HrG8NBsoxSgL9VBb41r103BsPYgsYJ36MJvK9oh
         McMw==
X-Forwarded-Encrypted: i=1; AHgh+RrJ5jw4P1lBF+Z7bgPeiSl54qeWzt+FuSz6c5Bvck1sZ+5UIEzEW+nZKFESCvfwBE6T6NTe1c8+JGiJuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqK9Z9MsQnGf03cJyl1beWP/8YTE9B1mL+NuMrTE8traeZo1q4
	TfPBwNCniMmddJsjnWPKsB7Hte00TGstZsCSDkzSP5TiXDoD2/t+Yft15o+BEhp6oqlIGlEbyTK
	vcUhwdRPZNF7w+v4zFx3aXlcXVzvlPdk=
X-Gm-Gg: AfdE7clIlakzgXci/w7R5OnhqLt1i1qQI4v0TyN6n93F53gOt8GrKEkxJE09OBJbe9T
	c/njKDUbLiXHWU1HpqM2ElGB5etP8I0irNlcx9ontAyMVHIs3QsEXIElzqXg95wM65vjhKro+Og
	3ItkDNsoJARlmLhHluzfDRZyfIsSgDPb2Kj8jdKl2kxaZSowhQIGyzJvU7RlHKgu3GspD3nkX5s
	1LSxF/R5aGnrSsYyMaO03vECmXBFPrDdRMR0qg4JRqMZJtUu7c1a7sy14ED8CaJiQGtioiVERpf
	cbXfjGLFDSW5ERNeOYFg953sFz0fhs4H6tDHpl+abFIDRFSqrguPsWO41yWusws13NMc3C2T
X-Received: by 2002:a05:6a00:cc1:b0:847:9e62:24b with SMTP id
 d2e1a72fcca58-8488961c11emr1089390b3a.9.1783728519714; Fri, 10 Jul 2026
 17:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
In-Reply-To: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 07:08:28 +0700
X-Gm-Features: AVVi8Cfyiwxnu7eGIzA6KyPzlQ6PObhKgfr4WFgILFEbEKhBTf8y3pJA57dwTdg
Message-ID: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

One more note on this:

> It seems this goto block was added recently, and I missed it after rebasing.
> Sorry for the inconvenience.
> However, looking at the goto path, it seems we might need to unwind the
> states more completely. What do you think about rewriting it like this?
>
> ------------------
> regcache_cache_only(rt712->regmap, false);
>     ret = regcache_sync(rt712->regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_mark_dirty(rt712->regmap);
>         return ret;
>     }
>
>     regcache_cache_only(rt712->mbq_regmap, false);
>     ret = regcache_sync(rt712->mbq_regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_cache_only(rt712->mbq_regmap, true);
>         regcache_mark_dirty(rt712->mbq_regmap);
>         return ret;
>     }
>
>     return 0;
> --------------------
>

Since regmap was already synced successfully, marking it dirty again
would be redundant and could cause the next regcache_sync() to
needlessly rewrite cached registers that are already known to be in sync.

Also, in my understanding, any register write that happens afterwards
while cache_only=true should automatically set cache_dirty=true again
(see _regmap_write(), _regmap_raw_write_impl(),
regmap_noinc_readwrite(), and _regmap_multi_reg_write() in regmap.c),
so there may be no need to defensively mark it dirty here in case of
a later write. Reads aren't a concern here, since a read never
changes any state - it's only writes that can make the cache diverge
from the hardware while cache_only is set.
 Please correct me if I'm missing something here.
Best regards,
Phuc
