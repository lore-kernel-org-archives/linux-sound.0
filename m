Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA35383C7D
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277257; cv=none; b=IBWg++uhnfQUrhjKWQMTyJyWtZ53tks9nV/J+KtEIXqlDou/aJWU9TpgO6HOYaX7n85WKKkfNKGaQmL1IwdLiVCmO0bygu03XmFcJyP4Rag3I79D8aKoohR/KMMkTaywSY2ffS+hVEqDKDmj55daE8jBNb/UvY+tMyBl7Yb7Tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277257; c=relaxed/simple;
	bh=HemjZ4dGJJ/lnR3VMSn+7HVh/otW+4HqQDvTAjiyOvs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTu/eLCat6ljl9C/dyVkhVn5zvpaV0D5sWyWcJMTuONuk8laTSCYJl1rjmhzV6OCBfEmOya5IAKGIo+/2Z9HpGP6q5afbVXqeq8yBKnLn9uNrL9OnTj/0Yw1IARV4fWMH47aeoXNALTGBBAgRSdidHHhS6OXkWyCaAxokwhi90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=hkrvHSmf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="hkrvHSmf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so118396445e9.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777277253; x=1777882053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7djDLfbHbridOeAKAQXI1kXdJlDO+hEJNHTV1iQGYuk=;
        b=hkrvHSmfA4U39vvL2f4/RW3POIbRo4quZYlYh2h2XqCSXkpbhN7Pvn6roOUmmktBIP
         tYNnf/1uw2Zi+cWfInHhnEaEiwF01gvuK4Y4Yjm1CIIaBULMLGlRGIipuROegH1bpA+d
         HLTI2WUIXLRBknRLZXv8pbV3+rdTeZlu9Ifzp7unKkmm4lWoSvs6tgb3jEudFuWZYwMN
         hmLC8+T4YbcUqoUtadoB2pTNuqBS6pgyGhduBWYUzsiHxCt8xgC1hYMvfmovhpSFse+W
         oc+ixrm1EwmQOvSkXxHAh5bTj+soEDfTom6teU5tVT3z2dOb9r8g9QucSNGGPv1MDMx0
         kp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277253; x=1777882053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7djDLfbHbridOeAKAQXI1kXdJlDO+hEJNHTV1iQGYuk=;
        b=O/rk7jXbI9V1cCqjVXfIchGD74UhV1JZTv0m8T3NLkFH6NUauQ0NtgPVykKv36xf8V
         7uM6CU3fzSNU1TBUlZ/zDynzgvp4F5qZUV+WbfcW3Y/JkQtTVg/J3APmeZQejw+owpd0
         HbMR2ST2B97w92x2ZEJ04ZdFw7EazqX3h8JFY03kXRfeZsNynh44jMAsaTdaOmdGxPv1
         +sCuGZuHiSChlEEzEx1Kut09sWqnH2qdNPs/swTeSaU1HJEINPX+5CmaQLiNAPzk57eL
         AEmrg4p9XrpSc5ONGmf0fZEDkH9ss8fy+qfSg9TlXC5sl8IbKmMredasAhIx4uVV8f/1
         +jVA==
X-Forwarded-Encrypted: i=1; AFNElJ/Vh6bbgXbmJ0YmnsXsWbM9hB7Ae2DofYSUKc6Wx/RmLeCyqOq/Hqm2NCQ1NpYRnMJT7nmsXb8OI/5ltw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNR2WUhqoWiUF1DkrnwHjrxP9Y2DZ3AGQiMrS0JxYS60w26Ag8
	ZjAcTBEYuXlGoCrGAqRU81RUoCqsFzhZhNsDh7mlk1lrjwQw8HKYdVgdEbvO8NQGxMs=
X-Gm-Gg: AeBDievuDqEIWIYFRcfWA11NJ1XQDhkMNDGNY/Q6L2zaCzw2+9FaEGj+8OPQbOqoH5Z
	9jye8AjUUqIZ2Bno86aJ/7GMGpG0Ei0J6j+gIQfgGI2T1MFmEJC0XU8kweWnvR9SFLDiEHX4zAm
	WVYlKMDOj7v+boFuIkoAK3L1U2jBrd8OKx/PjgFFQgOOVRUo8UE/PiXEI3hWqz7Hw2UYWXaIPS3
	6m3PHOqzOvun7RO8lMRAxMRmh95ic2cUAWeA9Z/opZk380ZJuhJCAuSo2JT5sjcq8gSKoMSljDn
	I8CQydnlqDF9XiJrSQ3WQ7UljhJx3raCwYL85ZFQ4/LZZUNTVxb+FGmpqlKTNj3f8gZyFVF4sXn
	cAT9ewPpPzP5wTeGNiPOoXkzrxIAyBI7sCnmOEl5woeBIXNyhbzBMVz4RTWAdG1xTViqvuGg9zN
	gytRY7NxBYg8caOZcOWgus8Tcav9OYgCSF4zGfg8etftU/RfFhTFLK/luSFhtZCaIHTm1cztRoq
	CE6s2xikx+Uoet6vqKaUKwpdA==
X-Received: by 2002:a05:600c:4e4f:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-488fb778703mr590477775e9.15.1777277252764;
        Mon, 27 Apr 2026 01:07:32 -0700 (PDT)
Received: from localhost (p200300f65f114e087ae82290a8cd6c06.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:7ae8:2290:a8cd:6c06])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4891cc7b2efsm327579235e9.0.2026.04.27.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:07:32 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:07:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux1394-devel@lists.sourceforge.net, 
	linux-sound@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <ae8SdLxuOlU4d5oP@monoceros>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260423141959.GA268626@sakamocchi.jp>
 <aepEedmf6sA83XpQ@monoceros>
 <20260427063719.GA37068@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2k6tlzq5vtrn2zte"
Content-Disposition: inline
In-Reply-To: <20260427063719.GA37068@sakamocchi.jp>


--2k6tlzq5vtrn2zte
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
MIME-Version: 1.0

Hello Takashi,

On Mon, Apr 27, 2026 at 03:37:19PM +0900, Takashi Sakamoto wrote:
> On Thu, Apr 23, 2026 at 06:53:12PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > A considerable amount of drivers for the first category uses the
> > unsigned long variable to store a pointer. This involves casting both
> > for assignment and usage.
>=20
> The conversion between 'unsigned long' and 'void *' are not inherently
> invalid within ILP32/LP64 data models.

Agreed, it's not invalid. But casts are always a part in C code where
strange or even bad things can happen as the (weak) type-safety of C is
overridden. Arguably there is still casting involved as driver_data_ptr
is a void pointer, but this is near enough to the actually type of the
driver data to not require an explicit cast. In my eyes reducing the
number of casts is a maintenance improvement. That's a bit similar to
reducing the number of unsafe parts in Rust code. It reduces the amount
of code you have to keep an eye on when thinking about correctness of
the code and it makes drivers suspicious that use both .driver_data and
=2Edriver_data_ptr (which is easy to grep for).

> As I see it, the main significant
> effect of these patches is to add a 'const' qualifier to pointer values
> (and improve type safety, presumably in your view).

For me the main benefit is that the explicit casts can go away. This is
what is implemented in the 2nd patch with changes like

-               detect_formats =3D (snd_dice_detect_formats_t)entry->driver=
_data;
+               detect_formats =3D entry->driver_data_ptr;

but yes, that the const is kept this way is also a nice upside. I'm
currently working on a similar patch set for pci_device_id and this
indeed shows a few missing `const`s.

> If that is the case, why do the patch comments spend so much lines
> describing the size of unsigned long and pointer types, and CHERI
> extension? These points do not seem directly relevant to the practical
> benefits described above.
>=20
> It would be better to repost the patches with clearer and more focused
> comments so that subsystem maintainers are more likely to apply them
> without the background discussion about the CHERI extension.

I'll try that. Thanks for your feedback.

Best regards
Uwe

--2k6tlzq5vtrn2zte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnvGUAACgkQj4D7WH0S
/k4lSAf/ag3ZGuYAPlZ7F0TjysI1QcgxOu4hcgebHYNfianStznc+4RzDcCvn+/l
s77FsGokXINNsgi2emnKbDDC9VDPtsO+PkvqjLNByGmxtuDyaYWtuIdKv94q2kWM
B5Leu41vbOJdvLKA3JqWtn07/nh8EZXUsx8du05XRJRB92v0rx39LYSyjEwpCOuK
n0EOQyTsSw7wn/aNWejoAbxTijrrNooQwmQ0SkOvSYyB+ulLOGgFWdJGjK7VP4kt
VWe2o9PIZh8uuw7pDmjAh7Tmxtko1DNPwK9GpHZn/Ef8Ya5lhvNYMhMI7vIcynoK
GcXagBbotjK0kIxvwJj/IcIgvy3TjA==
=8LIZ
-----END PGP SIGNATURE-----

--2k6tlzq5vtrn2zte--
