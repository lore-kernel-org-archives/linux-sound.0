Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07F3CB569
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455323; cv=pass; b=kLTxi6bBvdr/8HtWPDd+LgY4+ewl93GnBaRiZ49O94/jo4d40/g2hAAcF8dFnMXBKIqqW2QRT1c2bMw7QWd+g8e2cTnCJ1yWfGktAO8+TaXYCxKOtKPUjCR+/QpBHYrtQz9BxyhpyK2tP2YE1HxKyAm752ol47eJzE6GoFFWs90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455323; c=relaxed/simple;
	bh=4kkSE1ejTcnRbMKBPQPOKSGJxClRIs71SQcsbDPtpfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5SUPrD0TStzgkENq0uRQqsQOxlulmoaFy9ziO8Qf/+sncorSx2JNPbTQt8iOAL6mhq5ktQS8hYZj6PeNwdv/3ruvlNvfyBliyqDkqmBep9UJvVEl2Rh0R56YEvcjfsJYyWioJyIBnbxEchE6l6aJI0wCNUsR++raVIYdcfMdQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgfvTriu; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgfvTriu"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so30757715ad.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 23:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455321; cv=none;
        d=google.com; s=arc-20260327;
        b=l0rAQwqQOUtYlpMFkAcp5um8fxL/kjMpunaayb59EyiIgpXjb43ZqNrm1kNZFdkBAi
         IzmyhBGZ9sonF7H5aGDGb/F/Hlz6W1FH8yNfgbDMZi4LLYqaYJAQg1yn+6jRZ1++N6Lh
         XnnqeiEcDY5Gn+vONFYfjuHgEkB17XFuy0YINvjv9fH3SvOtmlkfhJoXOySYKrtpEH9U
         fdJWJr8W8N1l0P+UYFwhmhgRNaCgIehH8zIr1Z9s6Z1ZTovB9jXkgrILWT/1BWSrMVdy
         PAM+DGc4OF9qkLA7xudIhAwePivtvZzbb/nxqBhWHL9jLluuyZIZPWo+sg4excFNaLy2
         IJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        fh=lQVvcIz16AHAzeuPjzQLp5cIHNJD2XkpqHi/Ij/ePzE=;
        b=bpMeW2sMxIGMeTTQS3PGQwG0QrOJ6wR8F79n7abB7JGx2KE8hFJcDQTak8CCAFv22O
         sBUkGJ2kZsFGNWOKwek0NKS3fpWws1bA+FV1R27inN7vhOVJtV7TO4GLLCp/v3bMtv+J
         CcGVS6bOijksJhJGecRATBOq0jbdm9CsiAq+42uxulXhTqbZgOYbpASrbx1bgfPH8VaL
         OywsPQugu/SdFLttn6ijF9v77owzn3VEiLaIjgsuE3xHAW0/EAMNtNvShBh6efVfV2hx
         TaCkFTuYE/mEO6a+yfSLyERl1ZQq6f6AKhGgmNDTAK6e5uROesnkG4mWUfeiuEQFU5AR
         aM+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455321; x=1790060121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=HgfvTriuz9TdpdtX9WUoqEefMDLL0fWafq+eJIjV17xMUdBgmPiT14O8v++jT1MF4d
         Gn2y+9cBOAYW37VJ8ZtWROBnoTNvMT8iaI3OLha4WuQmNMiFmDVlmrt6w1LsZ3K8PmWi
         tJIBEewA3r3QwIcoW3lY5KZeWbr9yZK9V8sMVXgug49klYWTnjH+vgdjkLbMxq3Slxj3
         TLtr7L8GYQBN6MyHeLNTsqzx5JKgZBbhAAaSAWw+d+SJ+/g8B756gX7VqTK1dmJk47EP
         jieG7j+UyS4vrz6MZS5/sr8sVFIJqsCo3T5fcDaIegeTPzBtqExVzIkBg1Xv3+Gt0aSj
         wVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455321; x=1790060121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=2eBZ3NiWPUipOLb8mlzGHu+uynzdYdScDKBX40I9zJcJvaQFL9BLIN++zVZPq/NmtC
         C8gJJqxxD1XJogAChiHEMUf6yWmTShiuSOv8cvDx9CnuyOsRepKncKTgW5csYPRnJ8ox
         FINS5Urq/vbu+mji2wI5hs2is4JtLtctH61lLjIOxODfac+KlUZsXez3QfTzj3sKe7nr
         2jisGBzolRSb3DKX46m2o7BjHxV2gAEm63gQVi237TuLba6xsbc9H5RtldAKBoYPuwSd
         fB2JT6ETqMaridGbCb8v+uwRCTjyLhBEGJTr4FdyinsFNuiGJlwG0hWx50SnVhLkSzN9
         Ovwg==
X-Forwarded-Encrypted: i=1; AKwUvBzTVPxB+Icb04tXZZLDmMgwDvX2Nx++E9NLWmi/P4XAnQJJ/l58r8wcZZOhktIR5yVlI3kRFHEIMS5/NQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l7BC2IeD1ulZbdcG8fUUQ0JOvwi5i95Si6raBRGBbVtGlf3w7q
	QPr+vr70iyv0pymq1hX3gwnV6CY3oyLx7lTLpJVnmiqMG0xl2u6NftFmTDGAZpw4gnyczg+9t7L
	6wFLkF0ttg7jo4HNkr1ZmiwcXc8oU9tOI3yKA
X-Gm-Gg: AYBFou0BK6bUF9DVrcLGlRklxqbRWxsFYFKBMo6HAjK1EUBVn15wAc+kowRDFF91bpC
	YA0RKeu4ji6cO3ZINEO4dqlUHgpCV2BMUD1VUBhVY5nsvlHrm/evdab+qflPMck/4SZqTa4j9XW
	Nz/U6jsBs0/uLtMbJ6EfY8kzrLxrL2/s/B42RdrZHuf3bKBnh4nSR43o0NMgRb1ojgpnasIcxWO
	iNcha8Xb2vyVk+PaKiizksP19e0GBijPuJkTENmG7BVXTzxg2bSArWj4nf8FsuBbHwGNHrKqcn3
	NV5lH++SSuf2qYQdXiBec5vHeKgRFkcQE8HTCmeODmNCjZ1etlyy4+WqOANsGFq2yHx7H/R+dyB
	VRKnI69z5eR4qelt15U7RROWzvJ1aHvUSnWxso/fxsPr3JpzCDwGMAa2xGHhTC+/RAsU=
X-Received: by 2002:a17:90b:564d:b0:39e:53a:c8d4 with SMTP id
 98e67ed59e1d1-39e053ace02mr2555146a91.12.1789455321539; Mon, 14 Sep 2026
 23:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
In-Reply-To: <aqf-pqvBNQ21EQZx@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 13:55:09 +0700
X-Gm-Features: AcwNN1UCqK6sMPrqlCVGrE3bLZ2b-s0RCmlO_dC6IX4VPS5lJPfQdNqJWmpr8_U
Message-ID: <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark , Angelo

Thanks both for the review.

>
> > >  Though practically speaking the error
> > > handling ends up being the same as if they couldn't fail since if
> > > something goes wrong it's generally catastrophic stuff like locking the
> > > core up completely so the end result is the same.
>
> > That was also an implicit point (that should've been explicit from me): if anything
> > goes horribly wrong here, it means that it already went horribly wrong "some
> > function calls ago", and the platform likely already locked up as you suggested.
>
> > In any case, I'm not against doing error checking, it's just about not doing it
> > when it's really useless (I'm sure you understand my reasons), and I believe this
> > specific case is one of those.
>
> > That said, should you prefer having error checks in such places... it's not a
> > performance path, so I don't really have strong opinions really.
>
> Yeah, I think it's fine and sensible to skip the error checks in cases
> where we can't really do anything constructive about the error.

As far as I understand it, regmap_update_bits() doesn't go straight to MMIO.
It first passes through the regmap core, which has checks independent of
the underlying bus:

https://elixir.bootlin.com/linux/v7.3-rc2/source/drivers/base/regmap/regmap.c#L2834

----------------------------------------------
if (map->cache_only)
        return -EBUSY;

if (!regmap_readable(map, reg))
        return -EIO;
----------------------------------------------

So, in my understanding, checking ret here isn't just unnecessary
defensive programming
for an MMIO write, it guards an assumption about PM/cache ordering, namely that
the regmap is already out of cache_only mode by the time this runs.
If that assumption were ever violated by a bug elsewhere (a PM race,
wrong resume ordering,
a register missing from readable_reg, etc.), this is where it would
get caught and reported,
rather than the driver silently assuming the enable succeeded when it didn't.

Best regards,
Phuc
