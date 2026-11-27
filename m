Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745764;
	b=Rf2ywEqVCWjHPHg9g7FvdOJTvpnjsYqaLFI2uX4QHRacsw9/7X0EbEHKE8vDIBWNPdek
	 boOyUWJzzlNklIuablusXJvAt8Gk+V7FmsHJxIAJXMrl62vsu2AOS4KquPwws/9Hq/cig
	 meH9Ne85F2W10u50+uIncF6zU3BMIblA+P7Lety0q/tiTbwUR0FfpvCurTo9keYMqzClW
	 4cViJ2nlk+MBS4YLMZ+FeAE8yrZUFS56TciWoAsLgb8DP7XDBmnOem66ucQ7XeDKP3/CV
	 t5fNONk2izJwicGynG0nzVibdYb2zNe3OQZiNhpuQFhpCzTxVeMxsvrzZySJC1PAWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745764;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZYwW11y1BuE79hCP7Uw1MSeobFbL0BdeC26vggEbpMI=;
	b=vn3YyYI6PuI5Nxj1a0xUoMwA2wOi6vnqqvjppcUvB1iQa0NvpOL2DK1hyVY4rq+UUtIK
	 Y7cuKoWAPMeMm1Rxkpio9ti0G16DNLFH6bAiXD6BpyWw4GSA7Id0Tag4jh1MLi7c0gxFK
	 gK7bGBXBNN8V8dpaa/Za90fEMyPSM0jSn93uPPGAnjik9kXuDwZvbOesktfu7JeUQ9Lge
	 XM9jroglVbhkZyzm0FOZbcy/xiPkJYQEUATYfBucFrl286skHQzTkTIvXykoyQD14VW9c
	 4OnyBvF/3koH7kFGIn/89fg/fSyRrKXGcOFtX4hJwDjzpMiD30DXZyqvAGT48v5m+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYOP3VhH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2498F606A31C;
	Fri, 27 Nov 2026 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYOP3VhH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C38D1F00893;
	Fri, 27 Nov 2026 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795745763;
	bh=ZYwW11y1BuE79hCP7Uw1MSeobFbL0BdeC26vggEbpMI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SYOP3VhHuxIYwjalx2Obow679j42AqATwdXi4unlbZmuvtN8OrGBh1r4rlZqKS4GY
	 g/qpf6Tdm/OQ4ab+AlVqpHVjZuA1Wi+RGcc4333U0KTnBuZZkEkp3kElNYl98DTplZ
	 yahxQKaOfSlwz64LX2FNFNckKQ5jGM9xzMLOaD960k0LlXd5YjqeIC9Lifns+M+b35
	 WOOxUHEGK10czZi/cw7l57kg29G4L7xq/pSa8mMQS2I9tUbs+S/ydFD2CA789Ahpd+
	 2OHXZHGXLCCn4s1Grqt03GNDO3pF82U1hOnWleUmT8H3N8VVfg8rc/kAtcFFWiDb0b
	 P7yDTMRDbWPIw==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/7] ASoC: cs35l41: Prevent software reset when
 using SPI
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261125115124.9130-3-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
 <20261125115124.9130-3-sbinding@opensource.cirrus.com>
Date: Fri, 27 Nov 2026 02:15:58 +0000
Message-Id: <179574575897.838304.8691157769089102804.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H+0hH3VrvG0QH/NhB5QAIRBccSjoGg9S67lk3ifRPAA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5nj/4oH0snPdvUMIK4aMOs1gtw2et1LfwnbdIWcsp5
 LqobUVGRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbCsYWR4eFPwbyUvVftL4do
 TDgza0575aq5fkdT60Kky+KnX5i2r4fhn+qLv2W3e6b/kMgWv/hOcN8H07orB7leFW1ffGuN4k4
 eC04A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> If there is any SPI Bus activity during a software reset, even if the
> chip select is not set for that Amp, the amp may not boot.
> 
> This affects both CS35L41 ASoC and HDA drivers. For HDA this also
> affects system resume.
> 
> Whilst the driver needs the amp to be reset when coming out of system
> suspend, the driver will always toggle the reset GPIO off and on to
> ensure this occurs. If a reset GPIO is not defined for the amplifier,
> the amplifier will not probe - unless the amp is using a shared reset.
> In the case of a shared reset, the GPIO will control resets for both
> amps anyway.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221161
> Fixes: 9bfbc1af0713 ("ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot api")
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

> @@ -1627,27 +1640,35 @@ int cs35l41_reset_and_boot(struct device *dev, struct regmap *regmap)
>  {
>  	int ret;
>  
> -	ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
> -	if (ret) {
> -		dev_warn(dev, "Failed to write software reset: %d\n", ret);
> -
> +	if (cs35l41_is_spi_regmap(regmap)) {

What happens if for example we suspend but the suspend is aborted before
a shared reset controller actually asserts reset, or if someone unloeads
and reloads the driver?

-- 
Mark Brown <broonie@kernel.org>
