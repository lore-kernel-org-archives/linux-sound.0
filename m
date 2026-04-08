Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7F38AC7A
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683569; cv=pass; b=gBW/KqrK3RoFc8VCWSR8JyiOfnG3JYXgERs4/4CC1LUGK6AT5XgmzZ1UtgwzH31E1Q5rXiajXiy/3ySoOw/USEC8Wr8CLAMag29+vkssUtP0EwtxrQmXWUDTUvm5Xno0iQiJg9vA1L1DDVReBx6qE4ZOF7MywkeBhtuPSWAWelo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683569; c=relaxed/simple;
	bh=IjEhnGk+PnwNFCcn8LSU9mwNYM/h4JiXspnBYoeLYKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9gvRq1LwPsQHpHkqwaqiipfPJvHnusJQVzqpPDv2gU9Iab5nq35K5LBxO98Pvyv2GipiCb22lBEKJdKBwmROI88wzU40jHQmZHVhxwhpjDE5Jpubn/kfoxYA7VzuaCtHIIaYpLZTS2r1hs0FOqUc8KPzhiK7Na7AKpx7AmJu2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTndhkJQ; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTndhkJQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dea72099eso199884e87.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 14:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775683566; cv=none;
        d=google.com; s=arc-20240605;
        b=exaCxl4nwHsUvnY595cuq4xv8odbtso5bmDS5mfHsy6tvhVht0l0dVddhWDdsYc0Hg
         h/oKkCvWfRh/wxiMzc8++EV+oKKRGXDw9S6b/INgrxPPqM881E+1Oqxz2PNwbsJMHXZ+
         KSHE93CmRDdsojfojav4/iCIdCn0FPm2uAWBGQEQzs2P+ree/eRSLwOO77Xf89fZGSuk
         4NGOLUQ1rFsMmXUWEM88ij7mh+OYO2VX9gKAOnl4upXWmECX0NPnPNkoOMItsSCokEOS
         nIf5XJ9wAnqg04srjsG3w5MyL6i16W0uUHO9rFYZ+Eut6p9tq5EScqIKhS7RRewxoay+
         rrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dwZXnwgA8rxc31lodqUK1A0pWXEiOHI8DyLdgVyJCi8=;
        fh=eyc9Rggb9SF9Ciu47hFRCf1cx57iVMNTLkzilZ9eqWM=;
        b=M13aKmYBPZekAmp6d1DzZwQKiiak3sZkNFXb1V/5teXi3G34Xcp95MGxZpXrOzydIi
         d00vqdJN+ReVFJEPpWx+9ZyyJzmlS+qlpgoGhMrTG+73074XBdpJ/VTttXvwAvO8gadp
         +yEILr2YcMoAkkWN7Vp6Rt+WMc/Xkjov3JkWCnua7b6LCq9fDGd0HcuSQg90IfncnzwJ
         a3QZM9Q7wKytncnshdSzwPkkXDjbhOmo6ZRGN3M4IB6fm5uDT7SZhDkq4KVASzM07O/1
         s7ZnsrhiRFqlCwx7h0bfZvaEm1D7NNd51WpfpoB+WaJBxA6rCkFs+8S4uXCQynggFN37
         4P4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775683566; x=1776288366; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwZXnwgA8rxc31lodqUK1A0pWXEiOHI8DyLdgVyJCi8=;
        b=CTndhkJQ/Wq4jJ1qvXKvvzBYIJe+TDLnIZCEXNqKZdSZ+T82THRh4J7BSeg+q/sgxG
         +5MxHTJ6GpWg1ao88BdFJMvFzTmj8TPQLHOPfRSx8yTjYWDH3mkmKVzhMvCQqR7UCcNe
         3NfN0dlYjcLt9ekb6mzQTGNC+hDhV/Z392oWuDX1gHOvU/y4iBZZeHsCQh7niIxWr3az
         oLi7/8YiX7JuEP4ImJFOjWicPC6X8s/MV67m5cE6/XEZbOvRw2Boetnu+V6lrIuk1zpg
         A9xx0lkqyk+WW8mGaG8NOsD87zppXnegvaTgXysEpzebCmpseIioV3Jqd3HyXBbJUYh9
         wKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775683566; x=1776288366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwZXnwgA8rxc31lodqUK1A0pWXEiOHI8DyLdgVyJCi8=;
        b=D7EWRZUSNMBoVnnVUdnGp0fRQRtjWgSQFB12FgaQzZ4jYhlWByBD2+1ikS6gwez5BU
         TigGvfrb73HfkDyi47j31CMTB+eTo96SwtFVvH1BKSG3gMYQ8Jw3M2kZbAhAVOGkdVEB
         swHp5DnlwvGzyOtncqfJhUNgc8QJbFm5uJCCy2cwJkWjK1Q8J5Jth/SzNxuYrxnSGTtx
         rQrQg2Z7mGzpMDyP4tPZIL4LerM8/7+SgoeD19VnhiOGR95jWo68d365w4F0mOyUn5xr
         GTf7v3Ww9Kal5DUftIwAEXDUQHL5Hz16Fwy4HRB+d+R/ShWG+EnsicJcPl7QMbevJ3Zn
         i66g==
X-Forwarded-Encrypted: i=1; AJvYcCUePBCNvm1gphuFE+/0FAEcglD0ZRkeEr5XJc1iRqiBRjD9imT28+hYVwefjanevfMOb6nS47Y6nYjeIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfNz9tx9wQnrzT8z5MNxFFzIGuFFWxX7W81qqzhbdebk23oCC
	8xX/HmrTRCIZprBLQyM6jnPX5ADntpfNsf7hjgmmwzBpw5idGdWSbMX2rndIPa/faJlq+wrSkPj
	QCOm0WFq1+CEZVl+WDDLlxlz1I4sw7iE=
X-Gm-Gg: AeBDiev3pirdZNkKNH8GOiKwqrC0ie6ArgIwuw80lIArZJse5U5gJ+zkI8cQKGEZBnH
	AEzsRyHHtQ/STg7RdgM2vkqYGFCGtUOw34MGYCfwqa4cT9iWbI4+aF37/PJbmt0IBvfbX0c0Tpf
	fTobqaXwCrNF8yVomidVAXn3EJYJ2+OqxY1WqERnd8nSbvEoEVEp34IqNvNrqp0IDgegfdnTbSi
	FvuxmGHAiWbq9j8EYRF7hpwiK62AC0cLgU1WyvC2A6hkdXXioI8e7a8FgN+xktrRQJo84JTH+GV
	gDYAOM5SK8MqBnp19piSIRXAAiXeRxy0VTMs6Y96JF7OqYBL7Q==
X-Received: by 2002:a05:6512:124c:b0:5a3:d306:297 with SMTP id
 2adb3069b0e04-5a3e7a236e8mr378775e87.13.1775683565728; Wed, 08 Apr 2026
 14:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com> <20260408170818.70322-2-piyushpatle228@gmail.com>
 <ae440ab7-e1ba-4f38-8ef9-85371f3236f0@sirena.org.uk>
In-Reply-To: <ae440ab7-e1ba-4f38-8ef9-85371f3236f0@sirena.org.uk>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Thu, 9 Apr 2026 02:55:25 +0530
X-Gm-Features: AQROBzBu6KzdQPIYr38nwiFPhnZEm0vYHac0EK6sgh9vp6wbo8mZ1lzGfAkVeSI
Message-ID: <CAMB+xkZbxeOvfjH5kWQxZXJ792wZSWJntw+wO90__artt71+=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> >  {
> > +     const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->map) * BITS_PER_BYTE;
>
> Why are we multiplying by BITS_PER_BYTE here?  We've got a number of
> bits already from BITS_PER_TYPE().

Okay correct, that's a bug BITS_PER_TYPE() already returns bits,
so the extra * BITS_PER_BYTE is a unit error. It also references
the wrong type: the bitmap word is unsigned int (which is what the
original code's hard-coded 32 came from), not the map element type.

For v3 I'll change it to:
    const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->byte_mask);

>
> > +     for (i = 0; i < adx->soc_data->ram_depth; i++) {
> > +             u32 word = 0;
> > +             int b;
> > +
> > +             for (b = 0; b < TEGRA_ADX_SLOTS_PER_WORD; b++) {
> > +                     unsigned int slot = i * TEGRA_ADX_SLOTS_PER_WORD + b;
> > +                     u16 val = adx->map[slot];
> > +
> > +                     if (val >= 256)
> > +                             continue;
> > +
> > +                     word |= (u32)val << (b * BITS_PER_BYTE);
> > +                     byte_mask[slot / bits_per_mask] |= 1U << (slot % bits_per_mask);
>
> How big can bits_per_mask get?

With the fix above, bits_per_mask == BITS_PER_TYPE(unsigned int) ==
32,
matching the original "slot / 32" / "slot % 32" expressions exactly.

>
> > @@ -118,9 +144,7 @@ static int tegra210_adx_runtime_resume(struct device *dev)
> >       regcache_cache_only(adx->regmap, false);
> >       regcache_sync(adx->regmap);
> >
> > -     tegra210_adx_write_map_ram(adx);
> > -
> > -     return 0;
> > +     return tegra210_adx_write_map_ram(adx);
>
> We need to unwind at least the regcache_cache_only() above if resume
> fails.

As per Jon's comment on the same patch, I'm moving the
byte_mask buffer back to a probe-time devm_kcalloc() in v3, so
write_map_ram() no longer has a failure path. runtime_resume() will
go back to returning 0 unconditionally and the regcache_cache_only()
unwind won't be needed. If write_map_ram() ever grows another failure
mode in the future, the unwind would have to be added then.

Thanks
Piyush Patle
