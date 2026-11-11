Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390938;
	b=UHdg5Fz3VuK/cRuKZsWTWovi0oRgj5vtLsZ8NlpKIXXSk5dupuLOHxt34KmmdMQip188
	 tdw0GGEvn7eKyCOuvWTRz/281BKZNPzTGRmFA0WbUgXpDKGAzvNeA51vaixfGCoFfa7xp
	 aW5couDU7yJB/+fGz0mCrlAoebnfBOj6j0gsCI5dRufp8XveahYRvrQ3Dw8frtxkUa0q6
	 4bjk9QhVKrnQIbCpv+d00E5+vCi2WHBFntrkYSjPAsMNtQ/F/J22c7iXu3loLw59e6eq/
	 GZY4ZN39BrkrcX0P6sbFgCRGK6bvARHCjT+LHPAtrDlcGLDdNBSJ0cK/JqYVZfw0ngg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
	b=4CuUmgp61gR7efmWMcCNYvoK7Ko1Soj6X7Ce9+UUWQH1ckAHOQULMq4RfeROPBrbLMRU
	 RdsZw7iFQLGDs4FYfX1NG+KCshCNIFhjb+w7Tq/90cOoXUu5cJRGUx//zrm4A5NIA2zNy
	 yvyvFTcjBgyY6vBs3CeYys17pKOrC//l11paoX04ul3xjJZxxs2yLw60XldfBJCGoPr65
	 1hmFZYYUKm3tzJuJOWkq461REUQwbRaoZorS9Tgy6ixY+7l//7/Vi9W9dgVpWJzw6GcsU
	 AwjSu17fUKh6RRCDsMpyKr390RyOpgZLbYWcTSnK43g2x5kw1IxLk3VyYKgZaEwssaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ByvdQeCW;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E6606A326
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ByvdQeCW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so36162425e9.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794390936; x=1794995736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
        b=ByvdQeCW97xpSfcywMgPEu3DP4l6m75jFToER/s6KG1w+8ssAoQnPmSm57oSzHn5tI
         ELjceSIB+TCPO8pi5TX0CIIVX7c6D8BbZlkwNDnfPDxq3LsBxF9HgJEEjTcFRraPDmV0
         ZcJmKGSnRSQ+zjBi3rGryGI7LrkHAJq0J4PK/yab6XEqA+GM/LLi6jmIDYQOy+dA8I2g
         kqzNwqz1o9UScfI18ESZ2XxEsQlZe9eIbXvVQdY5gVIGcyO7DOpa2aRA+tEUyidpzHuD
         t8yuHY5e6B24caunJCU+D71G6P/moCeidVFRvkBAMGO1V37deG8+6CMKhtMyXsVOSteq
         b7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390936; x=1794995736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
        b=Z9bk3R6vmwrxPQZirQSZ3I7d5+9ANYFyM/yZweJjJZxkjS73XJ7SSxbJo0gfUYTm0O
         LBw784it5yK/yHhYMvQz6KMMVFdkmLofZJazj4RFV8JXgSBxewyR1jm5Y1LFcx3LdOpo
         ylK4qDoahiNYY4oVmZY2mHVSB97qGw6lVyJDSY09f4pKz6nXNMyzlRt9BLcU9QZOhvUA
         kJIP8WEC5xu68zwbq0vK7NFMcQw5DNUCns0OCOhWgQok6t2THYVyVSDpItY9n4jUGFUs
         GuynPeRw7ywaonYdSiD+6gmJSqiqFVc2rJ7wVY56Oonyl4wKf+sA+ZfqUrjs0UOWzcSl
         7REg==
X-Forwarded-Encrypted: i=1; AL+hErF161mo1DEDysTcP4vg95VbXNpIXu7OcWthyVlkwNOqBc6t/EIqzTn57WAjwzzQr9jPQqo8CIvCSR2iwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5ynZDaSAsOmJMLk+soE6oBCaBvCWG0Vd9Aplv5c7YZpDKxwnz
	6A1DinMSGS4rNLrNdCoh1TjoW5JSC9fAefWuOW10WVdTo6su0qjQ6eWayr6twCPSU0c=
X-Gm-Gg: AYBFou0WKWATPUgQnlOi0SkQ1mB1ICfXIshp9smtEV0/IsTn2kR1cMZyDy5elEAyB4N
	bhUCQIApOCgpM434NHgnHHatp5ljTjtNBV/Gvu6KJE327MPiqatMWY2Ut5fW0V6Osbww9FOCqF+
	Js3A/LiJ/EO0GgTQn2rLh3q/uR8Jn6iTTYlT6H2wd7l26w/Ct+l738Jfg56r0g1l6Vn4D3QPsH3
	7zPaOKa+ssokx0fdVMT5h6Qr803iIpESklMMxBTPi5TMAg8YISaPWn4DvEOz5LSTuZmdqaavn3j
	15KE0PoQ0g2+vrbnoguuUot92f5/l3Cx5FhtMXFUdU/qcaLTzZP37gGRVC2D4lWl4qaqj6EVs8K
	MHDRh2O2HIDK96Zj04U8sZ9bvOijBjmliXQdeY2D5RfNCzw1k+N3zB5k9BiRqdurwcTh0oF1RAz
	tsPfYE1BqfRvHzvf9WVofwEJx8KiD52+IVOINgblC9Y6VjHFJnPh50NqtEigsr150/Y/pOL4i22
	gQy84pzWYTUiDjpry4pDjyvnBd3YjQQtOwc1NnVkX8cEOSEbbcOnO7XGqcPQuh2gTUs4R18YnH+
	nD1LlmxWYjmFbCfVIhy6HcvMlod064WQVwecENC1VtROT40VNOCjV5n7vJgVm3289ba9bsjODhM
	IlFXaR7VLWEQ5dA==
X-Received: by 2002:a05:600c:8b83:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ba0935bde1mr34105275e9.5.1794390936037;
        Wed, 11 Nov 2026 01:55:36 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fea9eesm204694395e9.11.2026.11.11.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:55:35 -0800 (PST)
Date: Wed, 11 Nov 2026 10:55:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
Message-ID: <avQ19KBnQ2mnhZa-@monoceros>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
 <avQrO4etMgpOhvwF@ashevche-desk.local>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4cbpzud5ptt3x2g"
Content-Disposition: inline
In-Reply-To: <avQrO4etMgpOhvwF@ashevche-desk.local>


--h4cbpzud5ptt3x2g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

[adding Pawel to Cc:]

Hello Andy,

On Wed, Nov 11, 2026 at 10:45:47AM +0200, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 10:54:35PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > While being less compact, using named initializers allows to more easily
> > see which members of the structs are assigned which value without having
> > to lookup the declaration of the struct. And it's also more robust
> > against changes to the struct definition.
> >=20
> > The mentioned robustness is relevant for a planned change to struct
> > acpi_device_id that replaces .driver_data by an anonymous union.
> >=20
> > This patch doesn't modify the compiled arrays, only their representation
> > in source form benefits.
>=20
> I don't know who is the first, you, guys, collaborate together and come u=
p with
> a solution, but I have reviewed already this
> https://lore.kernel.org/lkml/20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodp=
enguin.co.uk/

Oh, I wasn't aware that Pawel is still on that. Initially we had a list
where Pawel indeed was assigned for acpi_device_id. Since then I went on
to do these changes per subsystem for several *_device_id at once
(instead of per *_device_id and subsystem) and stopped looking after the
initial list. I might have mentioned that in our internal chat, but I
take the blame on the lack of coordination.

Looking through the differences I found:

 - different commit log
 - I have a cleanup to drivers/mfd/kempld-core.c which conflicts with
   Pawel's series

@Lee: If you take Pawel's series, I can rebase and resend. Most of my
patches still apply just fine on top of Pawel's series, so you can
preempt parts of my rebase using

	b4 am -P 1,2,4-6,8,9,11-15,17-20 cover.1794347059.git.u.kleine-koenig@bayl=
ibre.com

Just give me a poke when you made up your mind how to proceed and sorry
for missing that conflict.

Best regards
Uwe

--h4cbpzud5ptt3x2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0O5MACgkQj4D7WH0S
/k5a3Af/bShGrqVRN2amCZ3YsA8JwcyDvTbN7ekxEzRPDe3bdsK6O+VNVq3fu6+A
rXE/yf27jSePTzpLzVN5UjaJUtgdLpi8JIUz8tFpWvLxcQ7XJGC09ZljCzmR9D1+
wCj7azL1dvdk+jjz7tZ+RnsUPK6bvSWhgvEV2mbVfggFIU/YqhySmIhYBhrc50mN
1GRlU5cIuEyXVwwmIk9BRNv9drjXrFZfkJTd+H4hbRAFOfVq1QmIjHDUl6qi3Rbz
ubQBpDM96XgUe5HUTXgG0Ho9KdASNlB+OVv+iwb32nfc2PZjPPmSKFjK7bKTV1Lh
3u6/0xqIvwenZeWxe7CkONoCcve8kw==
=t/3h
-----END PGP SIGNATURE-----

--h4cbpzud5ptt3x2g--
