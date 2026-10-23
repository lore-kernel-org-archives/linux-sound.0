Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776516;
	b=LED75XpTzniN2hIFNgWTsWcsqxiyUvyI6La7HKqw6a4h+0LBikXaozjiKz3cmNJSUSd1
	 hN/ZXke6Js0yNDXO2/PwbY+oEL0sg42QEzI0MV4O1qtyRL+OMX9jGVeKEyHQ4GlpDhGTV
	 g308WziVFB14Q5/iWtnR4FfzPargi36CqDiDvP8rPSXrWft67GPrkKWguijKJZhzPy1IL
	 H9WXsaKfOiAXZyQ9Pz00uXYkOKjxOcVRrDUkOKAHPRxpyGA5+rslrxBaOUPg4FL+pcAJx
	 12+arTL2lxzED+onVeS9qR2iNECWApC/PIzq3pLECYW0xdPUdZjIpfpdjUm73Hy1dRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R+AogU0JzzWN12eY2VIxMNDge0nflzovYEOJgdrBxn0=;
	b=iPc5v20KlrNlDTX9kgeLmiTLTxoYnSXNC4olv1YhahudthDqFbL4e1o6mYoY+6eg+R/X
	 qBqtzFwQ0Hs0uQ4daOMEhsPzissY1wO2ywj8oTgt7Uzufm/u/stZmrltPe40gGPYDkoK2
	 IAfr5ZE9Wn5cxkeOidlVMR2Iy4ZccvR+oQ3m5q5jq5AW4RUShMHJ86CDY9XDLIZZdouLT
	 OEJuFufSHzoJg7DcOP3BmJm1WP5E0nN+wDlGmuDSp8GmGxbdQoZI0XOHpdFDgym0MJnXH
	 pQltgRBa5NULT/jZgCKDs/f+HQR0Zrf6wtjjNwYAJRrrX706dTV5gIMBPjXyBBR0mTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGC1K+tF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B8606A31E
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGC1K+tF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD7B1F01825;
	Fri, 23 Oct 2026 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792776516;
	bh=R+AogU0JzzWN12eY2VIxMNDge0nflzovYEOJgdrBxn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jGC1K+tF1CTM9j/PPIYrRq6UvqW0fO05Z/ykag50DCOi9yyfzf9JRyCmcAf1Gdc3b
	 ggRor9dw0ewD0eohJeFR8uTabNKocqKyhleqCUlSRnq+2b8iWNyIYSapcMswsmdCsl
	 wAU/p+YHb0ssickaHOJPMmW7HD5y1hT8oVqrbRqT2KhcUhIzDMoo/pArJucDfLwEnq
	 TEl7k4TB3zIlS4cNKVGsoL5QFTBNWVicAP3fwOkHZz1+/JqQTUXcjUUqLWR3HrKdFU
	 aBTon7QSsMRk3T2enK1GjYYjDCcyXphHUBKsFb/iPnRzI6mP5yfnxYEJb3LapSW5gs
	 o/PJr2Jzrm4GQ==
Message-ID: <sashiko-outbox-183001@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: wsa884x: Accept temperatures across
 the full trim range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261023171316.819857-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171316.819857-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 17:28:35 +0000
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
- [Medium] ASoC: wsa884x: unsigned cache corrupts negative temp in wsa884x_=
get_temp()
--

commit 9c63fc2fea2dd9c9655f1be7d3c6ce519dba204c
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: codecs: wsa884x: Accept temperatures across the full trim range

This commit expands the valid temperature threshold range in wsa884x_get_te=
mp()
from 5..45 degC to the full two-point trim range of -10..150 degC
(WSA884X_T1_TEMP..WSA884X_T2_TEMP) so that valid speaker temperatures are n=
ot
rejected with -EAGAIN.

> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a367c94bfb4d6..f0857c0588d51 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -720,10 +720,11 @@
> =20
>  /*
>   * Device will report senseless data in many cases, so discard any measu=
rements
> - * outside of valid range.
> + * outside of the two-point trim range. Do not narrow this to ambient: a
> + * speaker that has been playing easily runs well above 45 degC.
>   */
> -#define WSA884X_LOW_TEMP_THRESHOLD	5
> -#define WSA884X_HIGH_TEMP_THRESHOLD	45
> +#define WSA884X_LOW_TEMP_THRESHOLD	WSA884X_T1_TEMP
> +#define WSA884X_HIGH_TEMP_THRESHOLD	WSA884X_T2_TEMP
> =20
>  struct wsa884x_priv {
>  	struct regmap *regmap;
> @@ -1929,8 +1930,8 @@ static int wsa884x_get_temp(struct wsa884x_priv *ws=
a884x, long *temp)
>  	dev_dbg(wsa884x->dev, "Measured temp %ld (dmeas=3D%d, d1=3D%d, d2=3D%d)=
\n",
>  		val, dmeas, d1, d2);
> =20
> -	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
> -	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
> +	if (val >=3D WSA884X_LOW_TEMP_THRESHOLD &&
> +	    val <=3D WSA884X_HIGH_TEMP_THRESHOLD) {
>  		wsa884x->temperature =3D val;
>  		*temp =3D val * 1000;
>  		ret =3D 0;

[Severity: Medium]
With WSA884X_LOW_TEMP_THRESHOLD lowered to WSA884X_T1_TEMP (-10L),
wsa884x_get_temp() in sound/soc/codecs/wsa884x.c now accepts negative
temperatures in the range [-10, -1] degC.

However, struct wsa884x_priv still declares the cached temperature field as
unsigned:

struct wsa884x_priv {
	...
	struct mutex sp_lock;
	unsigned int temperature;
	bool pa_on;
};

When wsa884x_hwmon_read() -> wsa884x_get_temp() is called while the power
amplifier is off (wsa884x->pa_on is false) and the measured val is negative,
storing val into wsa884x->temperature wraps around modulo 2^32.

If the speaker power amplifier is subsequently enabled via wsa884x_spkr_eve=
nt()
(setting wsa884x->pa_on =3D true on SND_SOC_DAPM_POST_PMU) and a hwmon cons=
umer
reads the temperature again, wsa884x_get_temp() returns the cached reading:

	if (wsa884x->pa_on) {
		/*
		 * Reading temperature is possible only when Power Amplifier is
		 * off. Report last cached data.
		 */
		*temp =3D wsa884x->temperature * 1000;
		return 0;
	}

Because wsa884x->temperature is unsigned int, wsa884x->temperature * 1000 is
evaluated using 32-bit unsigned arithmetic and then zero-extended to long *=
temp
on 64-bit platforms, reporting ~4.29 billion millidegrees C instead of a
negative temperature.

Should temperature in struct wsa884x_priv be changed to a signed type such =
as
int or long?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023171316.8198=
57-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
