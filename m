Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368947;
	b=yk08XleS+5vtFVhP34QgrGgdIIXBys/lZE2weUM0Wbjkiu/Wy4rGlt5Zs6i6ZL88SDpd
	 4VXvMWUlK4I2j0Cn2NFxgkW6oEegr3NYsU6o/I7lzEHSSpqhqbjCHOHCklsDD9PNAc+t7
	 DXW0i7rjbji5Zv1rnz6ODLss5E13NSWinU2f3K6mGbFmAplQbIgu65W0wmKxAp5QyPMh/
	 yi+jNKPJkS04bApnBA/VwDPZFnJ70AGCjP35bImHUyYaXlrkI6a2cAmkTJaXusRNVRB3D
	 krbMNl9iq0kI9Rr00vkz73uqDm6cRlyMPhtlqQM6GeCIsHf9cTGVrHBDGmHokkSoR4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
	b=1GuQTY7Y9oHirEuCow8gUR7s6vO0pKqxyHC1z5c4kUOMW8U0CpKW2epn0ZhTKH1OzKMy
	 q1qOkM9bVSBg6OW7nE3dUAmpZ93q2GZKdegVSG4CUQCOHOdK+yKL4UvylLjnB4GH+AkHl
	 MWrCcO64AlpKyQWvL8a5FJUh7Gb989E6RXeHiHulltIdOMz52KjTurL3CN3fALgJ+/dyM
	 hBJCBYasKhUqOkTici1PKOgH/CGXXJWbhGUGyegd9dT5wBu9ikA6bZc4w5VaoRlCovqOL
	 CDQkF3DzYelonrJzRcKLPaLbjM7j/Gs//BuIMPigWrdI2kUMm1ASLrz9wHWxMD0VUtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLpyvzuU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BF606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 03:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLpyvzuU
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed08b07213so11441405ad.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 19:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368946; cv=none;
        d=google.com; s=arc-20260327;
        b=HnCRj2HVfPWejz2vZ5kXeCqRc2KgZMSfq8nXel70Wm8En+Ms6dPtFWgTB/HuaP4d04
         MoEqv79CpGhq7ZeSDqek3Q9jOf7EHQ5FSBH5qfWyTGhx2MP4PThaDBCbW3dGA0vrbCxT
         b8knN4+P78NakG/10eaQkM+g8tXXQO+ph3zZ0thKzV5Vbr0TF/94ec6b9a7qrlZ4cKVR
         tcSe9tjQ54YieT7ucDYxJLqchBwc0WCeOXqfHbIX+yOlZbebBPzeIoUI4NNugo5J5703
         qKlMXJ0Rg8OV7JFJtD7o3Do9JY9qAN3Ou4oAm8SHUUY4mNS6BgWgJRadYrYHGTN3Wk/f
         Hmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        fh=Y0NG9j6z+yxENHwO+Ai3L6CT8GXRHfVOm1LedGawBA0=;
        b=KLmE/qzuxd+0emUeiIYjOoHZ1dDpIhLBILh4zngzgZNeKUdaMAmYN5J6gYnoOHdMHG
         wds6m4qWrppwVp5gRbZfm/b8OgUcbMb2q2ORi7zJqQkN4IJLsn3qhIqHr55iVE3umiQW
         su306xdQsKE0xXv7DVMq5JQPkRwaKD+hgyMqIicvJZhgOa0j+jVpXrp5sqn2PHZfoNUF
         Ao/y4y7z79+lg4ZwBntJpEn48j1jm3O4t9u7JnO59gVgZTGw4BanrzB7A2T3OlLGILjv
         5fbKL+VEtEm3gDwoWUF4xB/1cWRScdvzJuVBwyT95i1cKWQaOVVq9josX/09pAyYvSeK
         VdgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368946; x=1794973746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        b=uLpyvzuUjOziycscbYMwqyMtydI/pMiEeQzEAFxqpcdSU05lFxRuKipfJeuyu2ZKvS
         9AtFUnY1vM4SkKmQegXJNp5nq7LUYs3ozLpKoyMc0DoRM67NE40qmtaFGD0jMy4sgMOb
         M3LXKOU4A8HLGzg8maCeY9CnYhru/vgSghVj6mBpxWvCACe0Y/3TH1tqNUoLYUlw1IR/
         ubphfLWcHt1xvUmC4U3VqFdVWeD39w12lDXm6lmWKtF6k62vgyDri4w366tdB7DzCL83
         RRejL3gcsE0g115mySOJsv5BulPveTiz+vJl2xmq3s2J2+8XDkq55pPWrYPIbHl0pAT0
         9Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368946; x=1794973746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        b=XmexyoZv3oqP1/Fnor4fDeIEbHlEgBvNd0mdsEKeaNMonf63VCgg342xxtwVVcnR5i
         FfzHkYMXJG+2azzafSGQsls6mtH0A/7mxNht553aqC2OenBYBaQYXPVqJ697DAeycvqe
         1HlH5Jbq4597kMXHq2qjeNZIfkaZIStxN8GeZtC3UfB4E/zwc5x1KYA5MiOIVi9cL/Eg
         cMHCanrAcdfifbbvA7OCWPX/e+nDkELrtLEeXeNlp60UGzKhEXuaAYN0McjU8GoZcME0
         8ZaZBGb1AAMW2NrE1CZrVfwO6fKUC3QVC+gv2aht23faOKqiFoeKoPPahL4f1uWTzHEf
         ponA==
X-Forwarded-Encrypted: i=1; AL+hErHAxKZBlRmzF55t4b701R5Mv95Y7Wk5P/CvCIFXI9PhgrB0O39FIyfncNBGZlzMKsaV196cKsUM9i2gGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AFOSIJM2TLxaZY5hLTgc6YQlI/K8n0UqyP5fbvtwu+vdpb09w
	2edoPYNT0WvoQhExXLArWs9/v5FuJMfAvQ1+xWnS2eH8rpwy4ukHy9R5hudmW7w0G/wrqVNNjxe
	n9tVuqgmzPAfzD28CsE9+P0ECRQT3q2M=
X-Gm-Gg: AYBFou0xR1EOqqX1DIZxO79XlmcO8Y0TWDzweJbr+Q2IE5fe+jyq8vZVgwIrVqBY4Gk
	kxTdACFjCstZufunfIPggLH4KYJ3HhZ2jQ+m+6KxGr1AJ6ZYkKy8QxQVfGbVkQhVeBHG92bRKuS
	10C+Q0qh/l+4rHmNeYgMvRZiWBfmnLnRNedCGEt+hQVmvO1JbemFBbopF/qLAgaO27iDaCDGDJE
	wWSpR0frt+UB6PP6PrG6iqnfeyCmHpU3Z1JSg6QJGHMmVTvTzn/QZvmsI6BbZVaSD5ECQqfyQWy
	RX1KIJZuaiCxpJPOW6dvDETJRpoRguHtxV+dWg0FcIcuoIDyZJ9SBUqa0rI4VyreRPF0BFu2cpV
	O/TcYDPHKr2xL2JL7gy57+26Go+e9qlLK4NQBCK3JAyWzf8rhIDWPqjB5fR3400tnzScXIbOUeo
	7iRLwZEGEAA+HBpxutl1fNx4FLHzWWZZmw6PCcUtCTk0Bn17Lc
X-Received: by 2002:a17:902:f690:b0:2ed:acb:aa95 with SMTP id
 d9443c01a7336-2edd7b397cfmr13754315ad.32.1794368945939; Tue, 10 Nov 2026
 19:49:05 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002043856.97295-1-phucduc.bui@gmail.com> <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
In-Reply-To: <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 10:48:54 +0700
X-Gm-Features: AclHuK-_fA7OAuqiopVuFE8fqK_zpoIlrFShcyl-AqkfmWeSwLjfc9AT1zIS0jU
Message-ID: <CAABR9nE8Xo7z0Yg4AKPmqV9+Fjs3bnH+8pYykpFWOcq+3SG92A@mail.gmail.com>
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
To: Mark Brown <broonie@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

>
> This doesn't apply against current code, please check and resend.

I believe this series has already been applied to the for-7.4 branch.
I've also taken another look at the driver and plan to submit a few
more patches for it.

Best regards,
Phuc
