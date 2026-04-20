Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAC3BE650
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 19:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776711614; cv=none; b=j1wrAKgf832faeMvjAZqp0w0h9f9onnVBYI2k3HAcBnk+Fpizw4Aj5Yn9bLexV+yaOvyEBaNcYBjYvN+3RT8n52Z4F8rIF1oJE+EgzfHTiRl1L5KZy0GGbsk3GdC9Is5n+040fcnv3NsbY+9S39k8teRYJDEVH0dUJgSpk8nU+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776711614; c=relaxed/simple;
	bh=3bPq9XbKpo/gcsnwzu9YtnVKXenKZJmvDXxX6NmEBGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=irUVtLtV/KCU4sk30gJVAHeNEAiYerYaMe9ULS/bUFSxsgb0n59i89cvOq8Ya2SvE92DtBnU+2wE+AEd/20Ga8HrJslh6AVkca6p8A+teC+JACyejEDvIwg4QFIGvcH7u3c6TQ99XWw0xyl+uTtXWwJFJ9xfDw+/8adFVymuj5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfadHFT8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfadHFT8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6763cc87780so1619191a12.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776711610; x=1777316410; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rLMgFLuVT+znl6+onJbvSdsiogi9NhLqvL4ZV830Rw=;
        b=XfadHFT8ByNg1w7AUvom5D/i2W31U+t3Lc8XVTbfWu1TvWsDul/Nh982iHJPzMACwD
         7rQvVYQAmrpACSHUBXKWjKvYfzGJIFdbbnF8WxZcLOd/yqgA+nbHSHIWyjceUV3OpJ0P
         Hz6gq3kN2TtjDjEZk0PCyJaRdvvzrp9BcuzuvEWwugprYz1IbadDOC22R9Oc/1A3PNlA
         OhdDqchB8VZR7oQszoFRG6oJiwIIROFAfTPKuWjJXSm/urfsH3OGx5a74kk8GmxW7PQN
         B9gqg0hTAjs7pjplmPqpbxjBts4KcR8RCZutOty99DUnm+8VqicJh7hee+1kYwM/Or9c
         Z5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776711610; x=1777316410;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rLMgFLuVT+znl6+onJbvSdsiogi9NhLqvL4ZV830Rw=;
        b=KMY964nemfUM1+jp3vMXMfr1IKFE9eB+Nn7jbxXuqiGn37a0E18tJnhmi99Hk45oQf
         x8Y1TJ4n34J3RZ3VWuvlsa4mGiqcePP5grXNglZEMkS+06uYvOkJbASakpXq3CWCER/q
         D/hy61/7AQzfvfofhUx83i4xLpZ7c+irtKBfljfkVGts/z6vWX6paSF1nKfVSknHoEli
         ADJBoWcuF6UPcXrpV1RPYnuS2XKB2Xs+2DB2+UArBkaJ7acMOwWKmIAgFX7nGXvuORcn
         M/J8xjdZizakMlSjtvuVlr3YS2u9zUZKJpvGpoU+n0ad9WixrfTshmc9zJJmXowsForZ
         xUhg==
X-Forwarded-Encrypted: i=1; AFNElJ/8w6Ty9mlpg1XgO74bH0/NFRG+dKBJT43DeSgIVWbceCrVW9QDBoXirn+wPudb1mg152CsX3B+GhBwBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8YzFQ1xtVwSgJn040YPvH1Aoe/HICO1f11pvEhWPCKgscIXU
	ofsWHX1AxSnyvSo0Gr/VBi5sXOqHBuVG3/gYGMRzPoedEUTOodtQyTFptz/IEEte
X-Gm-Gg: AeBDievNjbBInJlSF6E0NLXcf2MeuKcs2DKvgrzK2q2EK1+Q54Uvourlwt6F9x9mYc6
	Ir0WBqDpri5fSmPMpDBCX4iW/wie+vu2zpnQCC4t3mJK67TxM4kuEIRwPSNSbulJSp/yRHcBE/R
	TscdkAPogNt7PT+Pq6YZRYxjnd0GpIlcTHQK640gYb13aFqjhURvy3MacX8j895Wwt8lZuPQkMv
	AIqMoQZ5gQLFAVFaP4UmheO0nsvX8HjvKP5BVICBo2t5OETwXvCaY9/ZvgTzaX9MUw0Kbeg9Rn4
	PrYPts6qXUSsRIqtCRQoLe0FjYRF2kI1et+dHd3mh+GSOBzE3yNWTevUV8pYafd81kwvDia2pwd
	1daImGJYXTO7fzToGTF+LjvfGm88G2dYlZk3nogrq+6XjlgYf6LjB6FDlOTiceHVcBR2RtIrz+n
	RJDAviY6vXmtdMskZ8XOF6Dl7JaJILskuQ1jQN64uX0uGacIqAjhox7onyyIOSgvNsKHHi8L2A
X-Received: by 2002:a17:907:930c:b0:ba9:5e67:e755 with SMTP id a640c23a62f3a-ba95e67ea5fmr18436266b.43.1776711609847;
        Mon, 20 Apr 2026 12:00:09 -0700 (PDT)
Received: from dell.localnet (83.23.241.8.ipv4.supernova.orange.pl. [83.23.241.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e49sm380390466b.10.2026.04.20.12.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:00:09 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
Date: Mon, 20 Apr 2026 21:00:08 +0200
Message-ID: <kEUB9WXTRsS9I55YFC9m_g@gmail.com>
In-Reply-To: <87cy0336hd.wl-kuninori.morimoto.gx@renesas.com>
References:
 <20260412012657.1370381-1-jmkrzyszt@gmail.com>
 <87cy0336hd.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartANfonzxNT1aDWgsgXvvQIQ";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPartANfonzxNT1aDWgsgXvvQIQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
Date: Mon, 20 Apr 2026 21:00:08 +0200
Message-ID: <kEUB9WXTRsS9I55YFC9m_g@gmail.com>
In-Reply-To: <87cy0336hd.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0

Hi Kuninori,

On Monday, 13 April 2026 05:05:19 CEST Kuninori Morimoto wrote:
> 
> Hi Janusz
> 
> > A flag is needed that tells the card driver if the codec has been
> > initialized successfully over the modem's line discipline.  Initially,
> > codec->hw_write was used as the flag, but it was then dropped and the
> > flag function associated with card->pop_time, already managed by the
> > codec driver for diagnostic purposes.  Since now the card->pop_time is
> > going to be killed, stop abusing foreign fields in favor of an own one.
> > 
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> 
> Thank you for the patch !
> Some question from me.
> 
> > @@ -248,6 +249,7 @@ static void v253_close(struct tty_struct *tty)
> >  
> >  	/* Prevent the codec driver from further accessing the modem */
> >  	cx20442->tty = NULL;
> > +	codec->ready = false;
> >  	component->card->pop_time = 0;
> >  }
> 
> It switchs current card->pop_time handling to codec->redy on cx20442
> and ti drivers which are the card->pop_time user.
> 
> Next, I can post the patch which moves card->pop_time to soc-dapm.c local.
> 
> But do we still need component->card->pop_time settings here ?

I can't give you a definite answer because I'm not able to recall exactly 
what it was needed for, and unfortunately I didn't provide that information 
in the commit description that introduced that code.  Moreover, I'm not 
able to do any testing right now.

My intention standing behind this patch was only to remove the non-standard 
dependency of the drivers on that attribute so its abuse doesn't block or 
complicate framework updates.

> (A) Is it possible to remove it from here (= set it via debugfs) ?
> (B) Or does soc-dapm.c needs get/set function for pop_time ?
> 
> If it was (A), removing it by this patch is reasonable. But next my patch
> can do it.

The intention standing behind that removal is not related to my change, I 
believe, then I think we shouldn't mix those two changes.

> If it was (B). next my patch adds new function and replace it.
> 
> And do we need "card->ready = false" at cx20442_component_probe() too ?

I don't think so.  It now belongs to a static structure, then is already 
initialized to false.

Thanks,
Janusz

> 
> 	static int cx20442_component_probe(...)
> 	{
> 		...
> +		codec->ready = false;
> 		component->card->pop_time = 0;
> 		...
> 	}
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 


--nextPartANfonzxNT1aDWgsgXvvQIQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmnmd7gACgkQ2WqSnlts
jBqp1gf9EBKdyVJWM37AvjBGFY3Ko+YcZuy5Hr5WFlx97tdse3UIekuF8aDEcZD8
eyAmiB5OpZ/BMlFW4ylfeMwzhoBY4njS4g6GTEH2abuswFi3YAT1KirElfideJ7o
niERfyBXmVFxCMEQhllPbWcT8eeEuoB7rQ7azx9/J+nJ5KnZ79EaPXa6zV272n8B
dThpR1ntihZw5vDnRLw4BRwseKeNirJXXA3vkZoh5wXwluxxXsAWvPxWNX1tyxZu
2zY1dBwVj/yc/4lj2Om4f95TCyXR7Yl3PIe99c8XkU+8wPdUB79lVvm9u1vfMRLb
vVRsonYBrNEs7UsBHuPdnUIkrwUzvw==
=MtLD
-----END PGP SIGNATURE-----

--nextPartANfonzxNT1aDWgsgXvvQIQ--



