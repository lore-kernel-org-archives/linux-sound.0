Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776339;
	b=X4tCcSrdQiVYLhZxlrNfAo0Cuc0ynILT9HpcgtaWW0J2bUvuGMOeUahhaR0IkyvdohId
	 qdWg7uAW593Um6lYiye9YjGu4a6aycwpWHtvKo5iHc9ZKt3TmUhHO0IeQzniumSGNsGJz
	 uL/KEaODK+pXTtOBmsTe05xT3zHwXurLe+ZPNsu4DP4MEkN6GF7AJwuOwFTn4xFB/bx2l
	 PPPC+NuggxLfQqHftYIbAU1DMyZTTV41T0A9q4ufRBa8I4M9NB72oDdf7Iz38w5wQ2NQ/
	 T/J3sYy+ZwVYnGC/vUvHR8gVaOv3h7Wa8OGq9Hf0WWPPvpVXAMPlLkXcnXUyLWPgVBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776339;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3vsCmFmBGAG8hhCw1lQebbsKuXHBuf8BcGkBdPX6mv8=;
	b=xX4RjL3GGJ/JS/Tv62l/1SZsqeagbgmN5wvraM7lXcunm79MVL0ax9XSyVhdNsBaQxMN
	 4mGj5HTTDNNDSTPVY4RayKRc/08bylF1edY2KRZR4ji+34gjWmSk0TkExW5CbwWcCOMKu
	 QtWeOzOSuAHfVyIwYPKDYrIbtzMt0kMkd9jgiTaI2qh0+VinOfwDxzQJeuK1eIYB5n3ID
	 EA4Q75DDzNjKmCPZCTbljwqphrME9zhWIT1pj+iHl3wa6TG24vesGHX4RkVMg1A3m7aV1
	 Ke9rscLxQYOqvRz3wOoNyG61CoV4/aK8sW5qqgoaWsd/c/76zzMeORjW0JzmVnipg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uy6vdpci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F2C606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uy6vdpci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26911F01825;
	Fri, 23 Oct 2026 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792776339;
	bh=3vsCmFmBGAG8hhCw1lQebbsKuXHBuf8BcGkBdPX6mv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uy6vdpci+Ya7FoHdAr+mfll1tlW8EurrP+kG8fbmbmf5rmt+Jm3tp7QqZAyjnSTnE
	 F/1qvJXM+oiVJ7MR7Ws9+D4fQjpLrpqvY5Wa97Qw3EGgKPW2lxTM0ecrb83M9WYc0Y
	 abR/OtmDXWpfpJ4+w1ruyPvvIfPHZAU4CqhECpkm8N4Yi6kA9aCSO3HZlYcgtycvVi
	 s6dfkzIBsGgNUNYPAR6ftlRdXSEZ3z6F3DTaEqlR1/gEpU3Nlbeoe54bGums66pC4L
	 B03fgbqL0VY9elqPromJH8HMOm9S2UN6SU26+6b/fc37xHamT6SnIJo0cyzamYT8or
	 3836mf7EI8Xug==
Message-ID: <sashiko-outbox-182999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] ASoC: codecs: wsa883x: Accept temperatures across
 the full trim range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261023171316.819857-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171316.819857-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 17:25:38 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: wsa883x: unsigned cache in wsa883x_get_temp() corrupts neg=
ative temps
--

commit 48fab137fbfecfa73800bb6d589df9724b78ae8e
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: codecs: wsa883x: Accept temperatures across the full trim range

This commit expands the valid temperature threshold range in
wsa883x_get_temp() from 5..45 degC to the full -10..150 degC two-point
trim range using inclusive comparisons.

> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 442cf9f3eaac7..ccd4404c1644e 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -456,10 +456,11 @@
> =20
>  /*
>   * Device will report senseless data in many cases, so discard any measu=
rements
> - * outside of valid range.
> + * outside of the two-point trim range. Do not narrow this to ambient: a
> + * speaker that has been playing easily runs well above 45 degC.
>   */
> -#define WSA883X_LOW_TEMP_THRESHOLD	5
> -#define WSA883X_HIGH_TEMP_THRESHOLD	45
> +#define WSA883X_LOW_TEMP_THRESHOLD	WSA883X_T1_TEMP
> +#define WSA883X_HIGH_TEMP_THRESHOLD	WSA883X_T2_TEMP
> =20
>  struct wsa883x_priv {
>  	struct regmap *regmap;
> @@ -1430,7 +1431,7 @@ static int wsa883x_get_temp(struct wsa883x_priv *ws=
a883x, long *temp)
>  	unsigned int dmeas_msb =3D 0, dmeas_lsb =3D 0;
>  	int d1, d2, dmeas;
>  	unsigned int mask;
> -	int ret, range;
> +	int ret;
>  	long val;
> =20
>  	guard(mutex)(&wsa883x->sp_lock);
> @@ -1493,8 +1494,8 @@ static int wsa883x_get_temp(struct wsa883x_priv *ws=
a883x, long *temp)
>  	}
> =20
>  	val =3D WSA883X_T1_TEMP + (((dmeas - d1) * (WSA883X_T2_TEMP - WSA883X_T=
1_TEMP)) / (d2 - d1));
> -	range =3D WSA883X_HIGH_TEMP_THRESHOLD - WSA883X_LOW_TEMP_THRESHOLD;
> -	if (in_range(val, WSA883X_LOW_TEMP_THRESHOLD, range)) {
> +	if (val >=3D WSA883X_LOW_TEMP_THRESHOLD &&
> +	    val <=3D WSA883X_HIGH_TEMP_THRESHOLD) {
>  		wsa883x->temperature =3D val;
>  		*temp =3D val * 1000;
>  		ret =3D 0;

[Severity: Medium]
With WSA883X_LOW_TEMP_THRESHOLD lowered to WSA883X_T1_TEMP (-10L), val in
wsa883x_get_temp() can now be negative (-10 to -1 degC). However,
wsa883x->temperature is declared as unsigned int in struct wsa883x_priv:

struct wsa883x_priv {
	...
	struct mutex sp_lock;
	unsigned int temperature;
	bool pa_on;
};

When wsa883x_get_temp() is called while wsa883x->pa_on is false and caches
a negative val into wsa883x->temperature, it wraps around as a 32-bit
unsigned value. If a subsequent call to wsa883x_get_temp() occurs while
wsa883x->pa_on is true:

	if (wsa883x->pa_on) {
		/*
		 * Reading temperature is possible only when Power Amplifier is
		 * off. Report last cached data.
		 */
		*temp =3D wsa883x->temperature * 1000;
		return 0;
	}

wsa883x->temperature * 1000 is evaluated in 32-bit unsigned arithmetic and
zero-extended into *temp (type long) on 64-bit architectures, reporting a
corrupted positive value around 4.29 billion millidegrees C instead of a
negative temperature.

Should temperature in struct wsa883x_priv be changed to a signed type such
as int or long?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023171316.8198=
57-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
