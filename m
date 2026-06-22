Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1985361DC3
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122003; cv=pass; b=d95Ro6uRjdG2xEEqRNOI5A8icdoCMoLkx5CgfVtoasIkXjKPHj1N7opdoAkZmsUErohVFcaXzT8lgTGjTMmbnKRbT7L0pxnqBSUJLQEfCHAM7wah/Qvsf4sveXRifFxF74Oq+Nbl8Thq5YQm2yCWwXuhFIJCiuA/IY7i1Qvb8Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122003; c=relaxed/simple;
	bh=GJ99Km11htt3iSYym+KZoipLtwBpZrGGIG9FMtzMVxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKnBz1LaWBZvGI0dMAeB4/r+hCSR9nMPkMn39kN947w4m1xUV1DG+FNFuQ1rUa4y6PSCS+63Dlwv/dlRrdO1GPxXk+3W2iOEExeGBJSOmWzAkt8KgHQloUMG9y+9PNvYdoEEHSlo9HmT3G4u9tqt15eZZmyB4pAHwsJxWCoA6a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZCWaBVF; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZCWaBVF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84229481d44so1845639b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 02:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782122000; cv=none;
        d=google.com; s=arc-20240605;
        b=jBYgLXArFrf2YoVVgxazKieBEVAuaFZ55eq8YpDtraPfYwf7vf7ktgYxkwWEqTYsiS
         yn0GzPutLigjnwUW5GPqJpElKcLO/c2SyOTE6pS+bxULbTKdc5tFvWKFW4yiZXwy3St1
         go/zaSyQa7zC3JSqYVsgVqgDMGGtUlgObI43kDgqy4clYREyIzddnrrjKx/UY6Hx9yAa
         rZr9m8tUBs0OUYn4kmKErG4y4B+nMtO2rYSGncTDq/pn/xDJqvBO9Tl9fVfKQVi6ZArh
         llj7VZKdtQ5BvyaJhJlR253f6NLkJhQNB2ffnsySNz1LvHT5XH8JA6LJPp/MOroZVYzY
         CtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5iKhL/UMBJjLQChT89iQi10OQDWGg/OcXBZIak7Vk6o=;
        fh=FGw49Nb3AEjoywVUwD3LR19iXc8j0ZF9G2WdmB4XdyM=;
        b=IxDgbAH4wjmL/aaJXjkd4ROdeuevPpKgEUEUApEP01fMsoOTgvL6MK9QRpcklSPgnT
         kGIE50Lpizu36GkOORxOVTuPdec0aQGliW+oIFHuHAUeObvLqfXlKbxrUxRsePKGnEe8
         i+O2FQ4is7JvsqjtfI88b+N0FsRBe8dq1Dc9Nn9A8fj6hEGhyrw6eeu2biEvvGFKTQfn
         C36xmhuurNROrnOPuESdf+VeZSU2S9/aL9C22g6OX892rCAbsfpvD09LuDybvgN8z4Ok
         EKoALdkGYpUiGv4GWs00N79jzMiTx2OzcDHRY/yIzvgueguYu4MLlUoI3fVmo/UQi9pl
         eqcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782122000; x=1782726800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5iKhL/UMBJjLQChT89iQi10OQDWGg/OcXBZIak7Vk6o=;
        b=pZCWaBVFiNlzIjJQ8F5J71YdVpFan2NNrxGfOLKuTpX7JaRLfoYAB2cZQlv6usR+qo
         5X3p7/Zrq/iPfMd4uyHT5+1A9Cu+s/3IxR19tTq4vIChsRdRrrMhmyBT7UsXet1J/8vg
         eTscpkZ0LODEwkSGaHIzxrGw/FeqDtYffKiXTKaqZ5S+LYGqWq8V/eU+ukqe6zpO7AL3
         bXkUAtsxPBT1K2n4Dxofbnd13B9N3Oy54tfgTyrjbpz62m979K/WlDSW22jSqC/l9qBj
         6nlTJ6y3csHkeU49hcchjOt6oE1JelfLqKhdTz6h1+ihIrgHGf74bm65/nLsde2eRktZ
         U1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122000; x=1782726800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iKhL/UMBJjLQChT89iQi10OQDWGg/OcXBZIak7Vk6o=;
        b=ZZD5WXAjoiuZ2e/NKLtrmcbmPpuWPycpS0XlxNBClhTrMXcbWhWxFzy28pY/mxt4Q7
         Scvl7SMgJACO5AHBhW8/0+p5gwfuF6bk/3V9O3CSZAij/b3o2rlarjhvpftMUWfwqNTB
         dYEzRXUR9dFn6V7+xKYGKNL6lujUEXxxH5/wI0AJhYa3Kx2csMV1sX9+/ZtMRP2F6gCV
         T+6l319ZBtt/uCZxwyKd6tLD4M9Zeq/ZxoorGzhC894WGRTwHezE0cj1Rq9qGmGJpz/b
         6okbYLkrcz/RCoyQWDIO+7v1OUI+TrGoy8+6Vl/LiTg4fWUmZUJm8qu/WnJZQ5dS5+FQ
         9HdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+InFFZRz1QgA+suCZo3jnfizBkFW6YnKm/ckf9CtAWLfjHsoyBfZP1UjgEAdrWoLqq1lY876o+qWukvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKXUFibp0p0ezt269/EmYklahsap8kDoCBvuEslC/WBAgXvbB
	vG3K+9HBCow9tg9GZN5YgOl6OzoQuACH2S5fVq78bpUIUvyg1BJkoXqJQPElx3DVD5oFNU1lXaW
	rwTSHkbkO6aENvaJPYexMHdbt6UV2p7Y=
X-Gm-Gg: AfdE7cloWOjXknKmLx4cHxFsriTj3L5nlUiv7neNpBGRiZQo7ZWmCOZ3QbDFVVohfw0
	BCm6Zrr845Pij0ljqAvVx93M09QBOZNL2W1S7ILfqCUvQDC8kloK56G8brv4OoFNFumJbcujI5c
	zR7TXZN8POoiNvzmscsBmYe0N8zcFl9n3ZemTv90R04OXyTRyUCbwCn7YszRuSL13GiHFlL1gsn
	qp5ywWLxe0r3YleuhFn3wou8D+Xs+9TiRN6mXV87vjAkC6ZhdT5iAYfMHidjvr6neXuUk3IlFQp
	G3Tl/ixuFWLQoFZVtvGt+xFpAogs03neRzE1vQ==
X-Received: by 2002:a05:6a00:1792:b0:842:6a3b:60c9 with SMTP id
 d2e1a72fcca58-8455087226bmr14129417b3a.24.1782121999547; Mon, 22 Jun 2026
 02:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
 <20260618110649.227062-4-phucduc.bui@gmail.com> <dc0e04f9-c43e-417c-b92b-c1db1d201e5d@intel.com>
In-Reply-To: <dc0e04f9-c43e-417c-b92b-c1db1d201e5d@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 22 Jun 2026 16:53:08 +0700
X-Gm-Features: AVVi8CeLePQ94fLrVcw4c2PUQkz_KPugNw6boz7zulLW_G8yBOOtABRw_n6fTSY
Message-ID: <CAABR9nFzwq7uwJfVqq3mJThSkQ06UvMNfebkqP+8oAhE9igOBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: Intel: atom: Use scoped_guard() for scoped locking
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the review.

> > +     struct sst_runtime_stream *stream __free(kfree) = NULL;
>
> No mixing of cleanup classes.  Cleaning locking != cleaning pointers.
> One action per patch.
>
> ...
>
> > @@ -347,13 +346,10 @@ static int sst_media_open(struct snd_pcm_substream *substream,
> >       snd_pcm_hw_constraint_step(substream->runtime, 0,
> >                          SNDRV_PCM_HW_PARAM_PERIODS, 2);
> >
> > +     stream = NULL;
> > +
>
> Is this needed?  If you believe so, then I'd rather see it placed
> immediately after any operation that could cause the variable to leave
> the scope.
>

I agree with your point. Here is how I will address them in V3 submission.

1. About splitting the patch :
I will split this change into a 2-patch for v3:
Patch 1 :  Use scoped_guard() for scoped locking
Patch 2 :  Use __free(kfree) for stream pointer

2. About the "stream = NULL" assignment:
Yes, this is strictly necessary. Since 'stream' is managed by
__free(kfree), setting it to NULL before a successful return
ensures that the cleanup helper does not free the allocated memory
upon function exit. The deallocation will be handled
later by sst_media_close().
Based on your suggestion regarding the scope, I will move this
assignment to be placed immediately after the final constraint
operation where the variable leaves its effective scope.

- stream = NULL;
- return snd_pcm_hw_constraint_integer(runtime,

SNDRV_PCM_HW_PARAM_PERIODS);
+ ret_val = snd_pcm_hw_constraint_integer(runtime,

SNDRV_PCM_HW_PARAM_PERIODS);
+ if (ret_val < 0)
+         return ret_val;

+ stream = NULL;

+ return ret_val;

Does this alignment look good to you ?

Best regards,
Phuc
