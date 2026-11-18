Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026978;
	b=iSIROPvnFazxlDqwrMUfhUSaFaN0bTodjqiaeHUdKxnExGNDO8ofVa3N6ZLDMHCO+0MP
	 zaN4Hqcm+VtrZTleomGAvQklRtJoZn4hOJ+NiF21YQz6SmBLN+CyFkIm/ux8zayWUGoSK
	 J+CY8CJh5tvqBpJXZRZQvC+cETGQacq1GLYo1+g/oWAp30laXofMxppVdB9jG0RTVZdpw
	 o7bl+qL73A4qUDew7HqDxm0JM9r45Rp+ZTqKiDT9cwslBoI7oAijKIsSqbjSgp0d1S07D
	 I6Gq+O9hhboA9KjIkYxwbUkDqUIFSaojS/9PVbtjrpyYIw/0LTqcI/0pvos7dlHsNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026978;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=C7NjQ9Aho7ImHW+VL1rZO0jbAj2eUmYs3E6+uwba7jI=;
	b=BC86bsWyy3hfTt2CA8goTJmuyRzjxFfyWI+WGjGPHsxLJBtDnU9xt/DIjZnYXcZaOLqt
	 Q+4frtIxESDM2lJXKYxsc0Db+rLErE0PhuRaUbQPC3w14zlqbh9/pHERmymawp1CwPjiT
	 NKdr9+aQLX1A4+x7aOf1xL4XAwqqvpLKL8+2/IVJLgJYvYpq82+5MS6wyFzQZeYBxkOzV
	 w8SiAJSsa6XCH6Cy290+cLSx8J2D13TdSxAnY4MJkMcli5YoJbf0PUWVQ8wyO8aqp62e5
	 LpaJVuueaU/mmxBq615HaYAxPfHBIbjK/oe4TaH/gdu/e5AVbrV3tpMw0L8eeRKCT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcVDOa1K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7197A606A325;
	Wed, 18 Nov 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcVDOa1K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE901F000C4;
	Wed, 18 Nov 2026 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026978;
	bh=C7NjQ9Aho7ImHW+VL1rZO0jbAj2eUmYs3E6+uwba7jI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VcVDOa1KiTG4iT2ugj9LmX2asIM8T/KialoDezQZgmfHKdJ8HUewcEy2Z3kNCDgxi
	 a7Iw5JPZbwHDiWtN/M/5a+kIkVWg2TIsv0DaIWtlD07i1sDZWYN8BuQdOWLRrm2kEB
	 Qwj/K2CAaNZp/okD/pjeT42dbctpgP5+F8zLi8lEVPrig+JXKr4YJOuGiMTg9kMWF6
	 8KhAMrmiVNHYhbTc/MrGesbjVILgBysFGloNXjVMFb58FODYoHBKvdJNJnve8wCMZn
	 5t1PRuRgyiW4EUoWmMKevLGHRF9NoV8toL0+qvI/w4XSUeNKJuXrBwqnbfhi+CWPNl
	 IPqpe5gTYmV9A==
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
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add NXP TFA9865 amplifier driver
From: Mark Brown <broonie@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116-vantage-tfa9865-v2-2-a93f976c9479@yahoo.com>
References: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
 <20261116-vantage-tfa9865-v2-2-a93f976c9479@yahoo.com>
Date: Wed, 18 Nov 2026 18:36:13 +0000
Message-Id: <179502697331.810609.14355813199526422692.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=broonie@kernel.org;
 h=from:subject:message-id; bh=j3lbwWDAU1Q3kiCftEnlbFJKKtz/eo9gpYP1lTAGBn8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+fpCr/i+/fI/GO4Zdu8qfbd15Re7Bxe+LnuY8nu/T0
 nrINHrl7o5SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBMpCeA4X+Jx6aSpNo/nbvv
 3Dszre/avTKlFSpuu9fvnpP7sejw96L3DP9r9h6UivsqwHSy6lnDOsa7LR0B+TGmCl9/ijz5rc3
 89yMTAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add a driver for the NXP (now Goodix) TFA9865 speaker amplifier. The
> chip has no DSP, so the driver only has to apply the initialization
> sequence for the device revision, select the I2S slot that feeds the
> amplifier and power the amplifier and its boost converter up and down.
> 
> The register settings are taken from the NXP tfa98xx driver. Only the
> B0 revision and the 32-bit I2S slots configured at reset are supported
> for now.

> +static const struct regmap_config tfa9865_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = 0xff,
> +
> +	.volatile_reg = tfa9865_volatile_reg,
> +	.cache_type = REGCACHE_NONE,
> +};

There's no point in specifying volatile registers if you don't have a
cache, and if you know which registers are volatile I can't see any
reason not to have a cache.

-- 
Mark Brown <broonie@kernel.org>
