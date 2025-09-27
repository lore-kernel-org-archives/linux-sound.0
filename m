Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC62BE652
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758980915; cv=none; b=tyctEizd7SVOWAyR3W95vE0WB02on6sxxEdpxgHbQYk8t4BM0XuIWo2IS9He21A4zsMlNe3sBoB87bsiFPjVsG+tXWePt6UVIr7vyl63Jzcfjn9eA7C56llKXFbz9oeUZF/cdQKlN6cvriv7G5qMKXo48G96pmGmkwky2uwWBz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758980915; c=relaxed/simple;
	bh=ycjD+GaoJf+K++XmPN4L07Vpl5Or9LJ+0MA9nUzsKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXSHjc8cktfNxMZgYcv+K2H1/ofhEydRkHj88MVfa5yQ7tI8dfJHnwvqKYcPF4x42XaFqpRUMyfqyQXg2GKHnp4UWLIpt8/BBbELJQgxaHbHm1Lwi5mc//nuGwAj+IU/KWgQJCRjZJEAoFo20I1s+jweflF64jLQve/dNhi5lxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFr8+22y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFr8+22y"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so3411578a91.1
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758980913; x=1759585713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycjD+GaoJf+K++XmPN4L07Vpl5Or9LJ+0MA9nUzsKWg=;
        b=iFr8+22yebv0tRqT/lfxWOw75zo3Ig5zj5E0W4Vg1x7zt+1yW3trrWBWCr+ZJDNvOa
         X5dWZk7aT2kjqOy0c8T2Xan/ZLNrFiLOawZHK5zXyKobolGS0PnYjFIR+ge2tErhov9l
         jl6yQjqMbYtmKZYgZFKjJv1ER11tD0blo45w1Or+KiMg14DbkkGhZJeseSMVxUl78QB+
         TOSYvUyqwy0dQ28y5qV3D/rTZDIzx24MCgM12Qu2dlQTMAbpoYMqVrVAbdtZU0giQJKd
         KTQ2wQUhuoVqNoQPLvK+LuM+p0+5sg1Y2uFPVSbSoBxMwuywG4amwiCFFream60nwgVn
         d3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758980913; x=1759585713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycjD+GaoJf+K++XmPN4L07Vpl5Or9LJ+0MA9nUzsKWg=;
        b=l+Thh0X2bp1fMnvYifBwXbwMgCzSBGDDfUQ1xJbPwuR9hCJygAU8ZG2shN5vnyBdES
         AM3EAmsTXI2Yi/BK2I+sO/a2JH+qdDFqIARORv+u/qaZkSm7AK0uZ5cCG7MXHKa8tuRc
         vROUh2myN0StkI2pCvASSi4Ex6xFp5+TFg4bdvFeD92U9+wfTSEzV87Z/ewPID3qvlsy
         uwBYQIMRdY7pTY1o/dL89kmdgKxhq8YFpceQQPoEneVgN/WKca7pryVReuG8/nsMUfqE
         Ebq8D/MVsRNPG8W6EE7mXCJKYIEHk+ck9IJBxOSH25BmyLFB9ZkPldvTMZlRwDpWB8Tx
         +6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXfTaqCBxcSY0g//85n+8yseGOG2QTKu7ZzzbWyS9KOiNznj9VCUTGsbqxJP5WdxBdWCN3jr8RaG7av2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzefDc07/7fbUEknxz6LCIa8qQNq3pekyj19ewooT5QyKoj0RiP
	Ix09CBNe89frffIQBia8xgOLgNNCN51KSNzhJDQLkALt4tujsMzx0As3
X-Gm-Gg: ASbGncs1zSGjYIYlsqy+dNMwJ6aJ28Gi3lbGTmSOdvURvpGidaNcGxgmVlXj2IMndJ3
	X5R+tmlkXoLxYbYda75sIzxvmCaL9pNSbxw7eB1mm2LH7b1u39b8YoGX6zQ+frGN62y/RFKidC5
	2JA/SgnwJ6v8X6W4CtGxNvWqp9jXIuiqAI9v0+9lftmFgyR/P08JZUcQ2r2IQ1Wt+v9SqLM+B/8
	dnEnMUQ5QXmHIJWe+boApcZhPj+d0JPQ2+yL55fQEDj/PMp4hY3RdYus80/D3m6WvgepWhxn7Yu
	mWPQFAfaia8uIJ5R1TwOkc2Nw7xvGqgGfKJO8Z6QV6SlKirfz8pf+HEoEoFm8muiCnRI6wyaKhy
	hAQhcgle/JEmo7yE5nb2KllVoJP7GZuupfqwf
X-Google-Smtp-Source: AGHT+IHlq36bPDtRaXhQxlBatzHjr2m7hsqlTZFnSIYGIqATigx/sqLVQ5bVIxhmt+m4FmtviBZzpg==
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr11203678a91.23.1758980913343;
        Sat, 27 Sep 2025 06:48:33 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be2073dsm11911785a91.19.2025.09.27.06.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 06:48:32 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A179C4220596; Sat, 27 Sep 2025 20:48:24 +0700 (WIB)
Date: Sat, 27 Sep 2025 20:48:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH] docs: sound: describe 'chan_map' member in snd_dec_opus
Message-ID: <aNfrKBeu17kdl_8D@archie.me>
References: <20250926162658.989479-1-kriish.sharma2006@gmail.com>
 <878qi0b97l.wl-tiwai@suse.de>
 <aNfRhzjqs6Z2fi-n@archie.me>
 <CAL4kbRMp912C+xqO4RYnGBO_VSqXJDSkNMgktd04zcUMOn_4-w@mail.gmail.com>
 <CAL4kbRMLnkJJcC9zoS+vSbwPxsU=82960vc1pOcrDZKsjLbz_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HfmnOL6c3qw3oUjM"
Content-Disposition: inline
In-Reply-To: <CAL4kbRMLnkJJcC9zoS+vSbwPxsU=82960vc1pOcrDZKsjLbz_A@mail.gmail.com>


--HfmnOL6c3qw3oUjM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 06:33:35PM +0530, Kriish Sharma wrote:
> Apologies my previous message to the list was sent in HTML format
>=20
> > Thanks for the feedback. Do you prefer me to send a v2 with the Fixes t=
ag and nested struct documentation?

Sure!

--=20
An old man doll... just what I always wanted! - Clara

--HfmnOL6c3qw3oUjM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNfrJAAKCRD2uYlJVVFO
o39AAPsH6L0/F8hE5Ds7jMn7R2yRWpO37w7+7svlGjv+CnaXegEAwW/qs8CqfGg/
M3srlivPMdJcmao/5aIqEmp0TVCvtA8=
=6hn0
-----END PGP SIGNATURE-----

--HfmnOL6c3qw3oUjM--
