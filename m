Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A172FC017
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 13:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769595; cv=none; b=KLlXnlvnIopv6O2MtTamBTZn5LAqCvR1K4RVhF+L6qkBvPq8B5+6bv4zd1MFSz4DUzaOOSLGed67OOSiMIPgbabppZZOEfN4j4kIdKO4F3WtOp3PnPLAi4NEZKaic4mIBs9cC1enGD1qv4FlA0yCwQEpDPs27k5cd7DPlMDcUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769595; c=relaxed/simple;
	bh=a/o4XOXrv4QVAczVsrualpbuwkc+MPlE+vFmznTpZ/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FklIPgzFuH4li5ZsytfbeHp2UeYqO+Ul3SgcE0B6Z/0Qe+RZkp/uOl7ojMPDGSbbEnRZEhwoTvCn+vhGsSiUiPXOx14m2NgMmV8WkYRAdb6z76TVmolEYih3xfMgFUCphZVQP9ag2PPF1Kc2m27pEgYb5CTMjQDueIMlfrIxJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M4fQNPT3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M4fQNPT3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73a9592fb8so31578666b.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764769589; x=1765374389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0EVdcIw56Q4MfiX1Zij2fhgH+qn9wGOEe8zuhg8Xp8=;
        b=M4fQNPT3MetfM+blAGA5HaRRKC0Hnt8Fj9NJXPAsmDZGMTW5RiWBLUrflzQrjh9hjQ
         nkiepmFRKhU8AUA4St8S7UBtz8m/IzetZMqIDGB5K6LidD+3E5Si2pIj1TlWeHDwG3R0
         ZBpbvQ8yW0h6eld8KlYLQDn9pnvxvAO3N6sx48LrfPA4fn/nDM345oxoQAO2ZuZapJIC
         iZP2dX0NIpexVw0zrJhU5sDGMN3MAXbEzyCbwejKzQM2o3PZaqueRm4ZXE8fc1QTah2b
         hZJ8zc6uOCYLbTLFxQAjKa5iTROTAnUOkBMoxrVi4ZQpnhWksUjMRAFxVqCFpSLEtJOG
         8QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764769589; x=1765374389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0EVdcIw56Q4MfiX1Zij2fhgH+qn9wGOEe8zuhg8Xp8=;
        b=sZjIALH2g4GNAZXDy2GP33d+C8NGinqfozUle9g1RMuigH77TZ+ehYKGrcgl6O35og
         o9jRS7zH1wlptBpO6SIM1J7lgEoudovcI68Rg0L+ebsb21ReWxbA+cK8KPJ4+H5ogA1G
         /lxyMx/Tn1zWEmVCZy7eXhXxJ6twpSoy+EQyMWRkfipaT4CH8ocu+SMnxBhFT5QjZzoB
         OgJZ0VWAvv3oN9wv4k9Jl+ny2X8Xx90OCWWhXXLNMJvek+BzHRzcVlAlxK5RfKjwm6UZ
         p/VUMY1sEeZqylGM/mImeOoRwkjdNGQIyCLB0jvVnK/rZ0hR1flN8bCi/NIum3mTXYO1
         2Qqw==
X-Forwarded-Encrypted: i=1; AJvYcCVTd8fj0zVf/xw1pG8vP7UWMD2zzyC2MAyycbtFWhPhUnRzt/TtgaaDITTn7BX9E9bgtIH/mPvrobA6sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6E1Edpqu8rVM1tjtB0cquCOXNKTfHCb1TWK0t78lc4d8X/iD
	ipGXdjJKycPbiN6m0xGmhWSwStLoxhLIIP2WBywUveJ1j/r2yvd6qZaFWDoj1VBfkyc=
X-Gm-Gg: ASbGncszTE8SYJ/w+K8lLn/ORmBf8gsZuNkacr2jS+FO157cTddtxac4YCAf5mEKmHw
	CdkpxYjQd/OjUc30xSh95XIexpHcvQi0BlpwPgQHy3A8iFc6acEpdX3qUT4JXnrFJLQnm2+lNUC
	mZkxJ0M5WDSy+JKI7qJ0a69MUQ/MDMzC0CqiH3JCxvxd6qWIJZbDpSFzLLcQJoZEL9G+oB2fKF6
	zbzZPKM+/8U/xmVVIWoETLGjSS9OOSRhP6xJ1gema4svaiJef0S50ITzf+FoRM4DWpkMvGv+oez
	5rLwx38GbNuDa2WdQYyS7ALoOMAMGQFpv2TxTeQbMTip70Yb5e5NmNpmOhDKVLudruXfIkrXoUY
	N6VWOegD0ysNWvPRtO8ZXd2tOOPGFeqBgdKqQhNVFbi0vCNQEgPrIi/vfYykeA+kk3VZKszeoU4
	0ZtR8IBf6BtL+HsGVw
X-Google-Smtp-Source: AGHT+IFt4IinyrSXuHH3zVjXlIMD2UrW6LpF9Rhevqpy56KnJIVIR0MMCtKCdYx79XSy0RWUudws3Q==
X-Received: by 2002:a17:907:d14:b0:b73:8d49:d291 with SMTP id a640c23a62f3a-b79d565958amr346733166b.0.1764769589471;
        Wed, 03 Dec 2025 05:46:29 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5199852sm1777651066b.15.2025.12.03.05.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:46:28 -0800 (PST)
Date: Wed, 3 Dec 2025 14:46:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/9] ALSA: opl4: Convert to snd_seq bus probe mechanism
Message-ID: <gl22ngzqfqigynqtw7giz4cbyaanx4y4dwr5ltywwlq3wozk7g@oj5l34antqty>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
 <24b2d122830599b96f69fc20386f5830c758e840.1764677854.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yga3vq5czqlwnn6i"
Content-Disposition: inline
In-Reply-To: <24b2d122830599b96f69fc20386f5830c758e840.1764677854.git.u.kleine-koenig@baylibre.com>


--yga3vq5czqlwnn6i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/9] ALSA: opl4: Convert to snd_seq bus probe mechanism
MIME-Version: 1.0

hello,

On Tue, Dec 02, 2025 at 01:35:54PM +0100, Uwe Kleine-K=F6nig wrote:
> The snd_seq bus got a dedicated probe function. Make use of that. This
> fixes a runtime warning about the driver needing to be converted to the
> bus probe method.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  sound/drivers/opl4/opl4_seq.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
> index 7bb22089a093..043c537be293 100644
> --- a/sound/drivers/opl4/opl4_seq.c
> +++ b/sound/drivers/opl4/opl4_seq.c
> @@ -118,9 +118,8 @@ static void snd_opl4_seq_free_port(void *private_data)
>  	snd_midi_channel_free_set(opl4->chset);
>  }
> =20
> -static int snd_opl4_seq_probe(struct device *_dev)
> +static int snd_opl4_seq_probe(struct snd_seq_device *dev)
>  {
> -	struct snd_seq_device *dev =3D to_seq_dev(_dev);
>  	struct snd_opl4 *opl4;
>  	int client;
>  	struct snd_seq_port_callback pcallbacks;
> @@ -175,9 +174,8 @@ static int snd_opl4_seq_probe(struct device *_dev)
>  	return 0;
>  }
> =20
> -static int snd_opl4_seq_remove(struct device *_dev)
> +static int snd_opl4_seq_remove(struct snd_seq_device *dev)
>  {
> -	struct snd_seq_device *dev =3D to_seq_dev(_dev);
>  	struct snd_opl4 *opl4;
> =20
>  	opl4 =3D *(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);

There is a build problem that escaped my build testing (on arm64). This
additionally needs:

diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
index 043c537be293..fd6f15be6109 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -174,19 +174,18 @@ static int snd_opl4_seq_probe(struct snd_seq_device *=
dev)
 	return 0;
 }
=20
-static int snd_opl4_seq_remove(struct snd_seq_device *dev)
+static void snd_opl4_seq_remove(struct snd_seq_device *dev)
 {
 	struct snd_opl4 *opl4;
=20
 	opl4 =3D *(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	if (!opl4)
-		return -EINVAL;
+		return;
=20
 	if (opl4->seq_client >=3D 0) {
 		snd_seq_delete_kernel_client(opl4->seq_client);
 		opl4->seq_client =3D -1;
 	}
-	return 0;
 }
=20
 static struct snd_seq_driver opl4_seq_driver =3D {

I don't know if it's already applied, please tell me if you want a v2 or
a proper patch on top of this (or if you even squash this into the
original commit).

Sorry for the mess
Uwe

--yga3vq5czqlwnn6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkwPzAACgkQj4D7WH0S
/k6Z7gf/UeDFjEmNrMwX/HMweCBh0S8aOS5YYCck8Hz9w5gLTZ5m6fQsx0PT1pCC
JMfvQf2BoW/dSCxgNqQ4y6+8PTCtzXMYc7EsIsp0DRhmRJUq67uEib1oCVPAOCMe
GtqXdM+JsQZc0OXwVbYl89vfJwbET7ipBKl/b1eyATiXjzsCfknGLvrObU+K+K9d
cT3cTuGPQYypoEbyXrBywSzECzFiYjkweWzd5w0Ip78Kl7PGy29dSF+/aadV7wJH
uL8/MEKGAUbQRfuEv/qMYRIfcaA9JP+Hv7vNAZdSLnlFmW9v5MruYD70YlbAUAel
zEsxxQHXWrpg8Rphv16M+fz1wO4OKw==
=Yg3+
-----END PGP SIGNATURE-----

--yga3vq5czqlwnn6i--
