Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA082D0606
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055200; cv=pass; b=qcm9DjlbcjyICAucdMVIYSiMVMmYQcAu5S1zWWAc7cgFYOTIGS/mqSmy90PooeV8aq3HyeG0QbZYjQyqLv/Z4Z7NXAqHBiFsooULcr+FmcumW2fIqmVjAZxeERYswhose9rj2Oqh9JJHp17pWwYGrMosmZaXYw0GQtcYHy6wpIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055200; c=relaxed/simple;
	bh=xhYUi/7BffAXKMuswl/Hx7s966iLg1PSDsFoJjwRxNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+kZ03JDG7VG6km43csNqpg+NNdDd1DsoF9N+NP6V0lQwDbISCqH0jRo25fHKw4i2H5K2qHJpuRkStMGqSqqcCiZeLBAfymvwn2vQ+irqcMQSqMi+rPWNo11fd7/BvHeSEePRaBK4dAIJDWEMYFV3r9lsttpu4yS9EHezcdbYCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrPnGYkk; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrPnGYkk"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128ebee22caso825399c88.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 07:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775055199; cv=none;
        d=google.com; s=arc-20240605;
        b=TSEK3LQMJ8Kv26gDkI5+Tj9baA9Aj80091vjmwIy+xFmlCiecuc2segE+N7Qb3U++9
         2nBFBVpg2bxe7NV8DsU1rv71NUmBFTkCRXj1VH0apZ/erykQJzm9Gzwx/5tQixheH7qk
         h8vcd2wv2zQSc0enhngTFjRRXhk1uhE0BPZsuLksGlUecixj6ybZ17pmY5z0K9KS1n5T
         Q3JCsgHp2ifzE8xGW+qlqEL3+8TOIoAC35yIQFvGB6ppC7RhR4tDdD+8ezmPJrbMhZ5P
         qs8Ng7pWmL+cR1WLyvWzcHAPm79lkZG3VS/Gtq0v1YKAZ/KttD0dHubREHury3T9w2i9
         2SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xhYUi/7BffAXKMuswl/Hx7s966iLg1PSDsFoJjwRxNI=;
        fh=6oDToA112h3k4Zh+ic8yBC+OdxAt8Lyr5WWITK226wI=;
        b=CRNLOjUkKGtyOySjATVhBya1n1RfXqWKc9j1ZsGbTPYy7QlS5xZ7hZvLGNs4JaaUFP
         M6y3eqGyODGQOXabVFLSlN9SM90A94YFJpI5x+sX23XUKIUNAsNq6r5Xy11BjI270rnk
         CxovgRC/UnWCBzggG76jguDjSxyLi0x3bKvXD4ZOCKolq2RfPER5wF6zmcs0ft08Vhpj
         ym0163Ulww0YKzcnzW4JNIqGgexHWim24k0N7XrDEbRAvSYdIIqYQUS34dtZOnFJYvTW
         9zXjHd8zw9sQsy8wg/p1hJyEFG+oAfrjonMtdpyXw4HNdmcFe+IoO4oQmOgPUjTeArk3
         fbig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775055199; x=1775659999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhYUi/7BffAXKMuswl/Hx7s966iLg1PSDsFoJjwRxNI=;
        b=JrPnGYkkiDXBGXxneqahIVTFqpzRsfhRSG7oebTD9zw/sS54zF2LJ3l6G3EODGfoco
         rFPgRm372HL7ytqigD02B6f/j95KyvacutcLwrHMmxgy8CPWBBqo95WoE6zuffGzMst8
         yLZfw6g02S3y8LEju3fFQ0jl/hs/MYw+Y3NpQbL4A29RxPz653pQBLACzDDpSJ5mTDhG
         EiaJwz6CzAvLTg7VZ84cA8Oo47et6jI3Yip7WE3ClpUJFc+R+2NSffIZdcZMoPTONZwN
         mQlrjnLmBfv65eYjs/Q0KL0+9FaUCvR5Ldl7qlhEdYfbBdp8JFK4JI24s25lbGksB1Kt
         j9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055199; x=1775659999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xhYUi/7BffAXKMuswl/Hx7s966iLg1PSDsFoJjwRxNI=;
        b=hcSBa7g+Y5mEM3AJCaqSs697ILk9WEC9NfW8D06aCtvVIQxf9AHDnZQBfyD/bdsJpf
         IY4v9/ab10cVkcUzFz65BTlImF1NX8s+REtmE1/fdvTC2reWxzKyqaN48GnjEe87ankO
         po8BCSGERfacZxLQod/BQ8mZvqPXAsO9d4+rm8Eaa4GFFS6EEyahXxLdoci3Sg94w4pS
         36q2KG72jBoDfXQabnbYzcUks8VGGgIsephdVYhmPyQDjdgWYM8j/V87kUkMagf6Y4EN
         Ckicpp6zI3yXu/gjW0T1JlSBmLpWtfju8QRJuAfrJ/3bIGuv6C1DEnqLSeLStwwBg/bR
         y8qw==
X-Forwarded-Encrypted: i=1; AJvYcCWU7T78LWxW4cF/6oT0e5G3RIVsyydJezEANbVPaVdk9LEkK/i+S0ykSjD3B0QIyV0U+8tF8P5TkhEwwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+Kt/W7M2ASwslfRLUfnwqI/ZrQA2vqAF4S4tjAFH0adBLWkq
	8eMHl+Mrj83f47QSxgMEq4rQj3yQoxQOTjKPYYhLUqnoAGWf0Nw1FqEQIC/91URksJtA8A7/bzq
	zURn20Xhx5bJCHGj4dErwbMWO5Ifk6y0=
X-Gm-Gg: ATEYQzwV4paUJU11ZU0+whkq4oI9zZxTT1GB/rw/EwX+YiwCTMOZ+pMkyjIpOw4T2Gz
	XFGQ9ijtq3wRWQ/uIA+vYHPJ9AOT79vzOOdt+7lHgeSmOeYAl4SUw9kuse4OiPFyFQsmFdB8NwA
	+N9qVlpweF2aS4R8VY5x5LTL9bcB+cZnp1uiEjdA/ED2Uksf1s7t2IfXizonu7d8kpm8FlZk+xM
	0JCHEKezUoeY6a43J6ifffIQ1mIEbY2huvOlKdQN5GdSNv48NuFKank3SaH7E2nh00UjMPeilpi
	qaVIAfiDvFbZSdzlq5tWKPu+FyXHy2XNgw14bZzcF7MS/+Rgxy2STbJWXOx8FPw+ihMZCtxNvRU
	/r2EVq4jBCmQqhjBJ/5YRLmfeewtcXkw=
X-Received: by 2002:a05:7022:62b:b0:119:e56b:958a with SMTP id
 a92af1059eb24-12be64b5885mr1891459c88.15.1775055198497; Wed, 01 Apr 2026
 07:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <875x6bttv8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875x6bttv8.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 1 Apr 2026 17:56:16 +0300
X-Gm-Features: AQROBzB-KXKwewD0zS-zCCYfs8DXjMxgjNKgCkJxpnk4e6T3ovt4hsAuwUUWglg
Message-ID: <CAEnQRZCcEc8bK8uGHiFdUrp9PUmOznLxSNs1W4JOHDyMY7cXKA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak5558: remove unused snd_soc_component
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:22=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> ak5558_priv::component has never been used. Remove it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
