Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C50274FD0
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914058; cv=none; b=i37nkyCKX1D/woA8fSlwC4/Xfovg7L41PxTbvHBKPNDm5Zk1JDg6App5kmd8xwl5p+lR2OmzVopV3x4bBLF+of5KmJWnakf70Jm7zHWjOY6SKnhxRSuRIO7Fqas5dY+pO+kxgs8b2yWaalu/wJZi1cCzN6BPew+PRx43fqRZcEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914058; c=relaxed/simple;
	bh=jNkxQFpGbzG/0yYSyjVsMpe6ZquVSEMcZ6PRyLjigU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc/AQd/IljeClTSO6LD1aWvQ2tpJHYpzRY/UVknJYCYXrasOeheRcIQs50cdb0l0G8fJT/AQRCX3+tYfJyRf61251956G/sQhZdwTAWR8rMzssyuyyULau/nVE5n/zLE0wGWZdu3vN1A3/v4dP6kSAeIlR9GNElTqzqGskpcEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gi9d2vSm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gi9d2vSm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-473dc4cf238so428240f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782914053; x=1783518853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNkxQFpGbzG/0yYSyjVsMpe6ZquVSEMcZ6PRyLjigU4=;
        b=gi9d2vSmKiNXHKaJy2MYH/hMzwKFwrjVh055glUwhT5dgVs0OvmKYZHMedrk7MqnAC
         pWGtvoodVm544lVYwR6nxSn//v4vYQJRqql7IbuEO7V+A8r8cHu7MI0W5Qf+P1oFWEby
         OQ905yhy/8LlQqf2oK9krxU/KlK62WG5BQMFWJ8hzPJ933NSh7umNc5m3a3Ra+PugRBa
         +tJx0wRS9oQhJRjGJYt93r2HH1H2/i5ijHP8T6H2PZ6EzOic/w0zU7ZESXQodwOiuzWq
         NmcJBvR1ov06P3OrxspzVGvtuwGg9ZLBLGF2/SznujpaLvubnk+qybl2cNwO3/F73E7T
         Snzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914053; x=1783518853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNkxQFpGbzG/0yYSyjVsMpe6ZquVSEMcZ6PRyLjigU4=;
        b=D2VbqgRXam6B57Urf6U5GgE1l480wqtNMH9hRH1kk6jYD9qkrMGt8z11i86sUMvpEB
         Rl9yzbrWzWz4jq9j2LdWsav+wtfLI6okCN0a9TAaUQup13jOSEAFyVn4zC/opLgmsXiN
         ADcRboc0LmVf8a4NTIJcDbGZJBP9MKTaYTyOQ2tJAOfnaUxz07J6aoJ7c77hFFIDvOSo
         OlknTUb+GRZ3OyENDsQjucrxVDfofKEMzdywxVNfm4D/opET9r6j8AfBU/CdlRSMgUXT
         IzFTOblrPGaKCNESaVJAVvwHCZPI2oQXgIgLLQoh3f6pEcLjqYgZGl3HfKPaARkxz4H0
         p2OQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgOp7qzgM+eWryokOSoeGSryQ525G8LVEl5wQVDgW0FrKddAhmg496PBbzSCf9IIXzeJxxsR204EWWew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjRdpQ6v9EwOOjgQCslrUSaONWkcNwbbLOWIId03T3jI3zCSf
	lBafDDGuyEN0yWS9RcSH2OgRMJY/GpeiyB8frHWZD0sFrpk6Ya53WCeyQA5osIJ+wUA=
X-Gm-Gg: AfdE7ckDSq/vwYCg2UmKfxoxKIYGzs0DhZFpeY11wgG+UXi44DQVyfVRCtvQ/4NqH33
	4P9hhx6jmR6N1GF//gZd5ECXu99O8Jh9gZS+33ARN8bqddfTI6SSUO/YfXLGVqOwsH2iFhEcXzO
	ByV+Y8KYRze2xqvrWp/7mw3xPt+mL8Qn3D/z03dHST9FY+CPBwntGlxq9d9qfvjrsfNR/IBykVq
	WJLxU2rRX5Afj+i0+Kq61F3WK8uuRsrHXmOk8O5bLLDKptT6RLQ2bZyfq5wp9sspy6QJ6OiLvs0
	14Tc/DSsA3U+njLiXkN2J4hQbjh2RVVsQBRsko58nSvBqVw35Q/Vs0NAZsHgiEGYdsHE+vlinpI
	W1/DEETtf6srv+nZmh7vrtr6NMojxdM5RJvn9sXNHqnJEdm/tyEnxs0WgWx1W+e/LEKexbgk/bb
	BOLF3bjFT1zdOLo2L7hXce2fBcjmNeQnNDxY/5s2blMA8MNWOzArX17rDA/GdWHnHf3yW/5NRBg
	5imrxFAbs9y3+g=
X-Received: by 2002:a05:6000:288b:b0:472:76ad:b329 with SMTP id ffacd0b85a97d-47757f4cb69mr3021322f8f.6.1782914053541;
        Wed, 01 Jul 2026 06:54:13 -0700 (PDT)
Received: from localhost (p200300f65f47db0433d7c6fee2411967.dip0.t-ipconnect.de. [2003:f6:5f47:db04:33d7:c6fe:e241:1967])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db8a4a15sm21222f8f.14.2026.07.01.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:54:11 -0700 (PDT)
Date: Wed, 1 Jul 2026 15:54:10 +0200
From: =?utf-8?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 12/16] ALSA: hda/core: Add include defining struct
 hda_device_id
Message-ID: <akUb3L30pH7guU6_@monoceros>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <2e365146b67ced2a1897785fcc0c222c382f14fb.1782682124.git.ukleinek@kernel.org>
 <874iijudts.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hfzuvjk5333lrrmh"
Content-Disposition: inline
In-Reply-To: <874iijudts.wl-tiwai@suse.de>


--hfzuvjk5333lrrmh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 12/16] ALSA: hda/core: Add include defining struct
 hda_device_id
MIME-Version: 1.0

On Wed, Jul 01, 2026 at 01:52:31PM +0200, Takashi Iwai wrote:
> On Sun, 28 Jun 2026 23:58:47 +0200,
> Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> >=20
> > Traditionally all *_device_id were defined in a single header
> > <linux/mod_devicetable.h>. This was split now with the objective that
> > only the relevant bits are included. So including <linux/pci.h> won't be
> > enough to get a definition of (the unrelated to pci) struct
> > hda_device_id.
> >=20
> > Add an explicit include for the header defining struct hda_device_id to
> > keep working when <linux/pci.h> stops providing this defintion.
> >=20
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> I sent wrongly to v2, so again:
>=20
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

No need to resend it for v4, I'll apply it there, the patch didn't
change :-D

Best regards
Uwe

--hfzuvjk5333lrrmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpFG/gACgkQj4D7WH0S
/k7fbwf/Qn0wb4zvYe+DwooPghpsotlbbCJPzoWd2oDZDOiaxjIEAvTr6IMQFbRq
XuBhqSpML30oCAxwYicgD1Dc8iEE7TyhnN9NvVGIpGJs/43nBqei8dSqVACXhY6J
cnIomxGNLXuFDXjlhlR4aBkwTEVQEMc6MNjTbqEIXT6D4ApCXyfZJq5r1F8JT34U
TWpF9zrI7Wis8Z0PHujE33cN0nKvRnvz2m2bXNJ1DFC2SxtneZtxB162pWp2Ku2/
Ly9qF2cSxg1z4LZ9hkB4S8blZv2kGLTAokjxcfHCQVJepRiUGWoE6e8tfxi+qJoY
8sdEUH0m+wzzqTrr8fbMm+tWYjkmBg==
=zK/4
-----END PGP SIGNATURE-----

--hfzuvjk5333lrrmh--
