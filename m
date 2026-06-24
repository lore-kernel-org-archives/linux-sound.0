Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6863019AA;
	Wed, 24 Jun 2026 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291456; cv=pass; b=fgwgwrdHO4ps9tL9sIFFZJ1afgRS6FCKmmLCXkXF+XHNdEHasxnaeAT7eZ+wyJTMkodHmuflTOHBVu9Xt2wWBZszkzwujMNek+Q1fML0LejW1GcgCsuakh2O7BsRnnipr8YHrs3lYPAhx7Ebv/o56Spel5W41zoFJ19C+hErluA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291456; c=relaxed/simple;
	bh=oRkkEHlkcagwCGJGSMvtjgqx5qSm4uY2YeQsbA5ktNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DgrDW7rhaxaY0pYYPhBKCILxvtbzX3cJzBHoy+guZnUCL/oXKdV7uj5cRWUnwn+JRw0EAW3fSF63dXfFZfIljVexe1aHYwd5k3VqQNHbEM/b2FwYELCq8SJb2u8Sp+JiMPcp8JyVPn4ShN4DwUEC3KlQ5OoWKXO0I9EasHgld7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=evKOpiaT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="evKOpiaT"
ARC-Seal: i=1; a=rsa-sha256; t=1782291430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DpFn91+bjtZWhARFvMO9f4K+LOcTIP2YjffTyQTCGVBAV+cmPymOyQx4vDfMzJ5bayy0oaEa46Mo/gwBfeKEN8XNKX6BpTglrAOPQbxWww1Kzpp42IOPxkL47rzSFlhSABDbZ0MqtSvd0ovVZjdbh1XA6h0jNVn8Wq46CPNPXEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782291430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Z2dXNv3rLrXY82Odx71lPH+DoZfD3dtEOh0UsRZ4zM=; 
	b=AubUZqFX1geExzk9Xi7xJ2unHheQPgR1qlRKVgML+hnfSdW9Av29jeJZ3I7ekswTg3RdouenHUyqcpsBQro369H5+X36QS4OY719RPP8FM5sU8r5fxCX0wl/pebzKfr4AClthv7WGM4azR/KYzWK93likM/dmWhL8UkSEj/PB8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782291430;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=7Z2dXNv3rLrXY82Odx71lPH+DoZfD3dtEOh0UsRZ4zM=;
	b=evKOpiaTtlp9o4Y34yZPFp7VUp4y9ORV2307SCujKdZHOCrKClNcHC43f+1tbZgu
	qd+jDg/7/aPEnOlJugGbTv7K9ikkexBTf8Vu/XQ8LUTr0y9jr+fcBrxHyV0mnbFJdZI
	xTgK1IEuPYIzQQDJAFdnkRj/ST1N9gVdB8yFIT14=
Received: by mx.zohomail.com with SMTPS id 1782291428934490.12484575176916;
	Wed, 24 Jun 2026 01:57:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKQ==?=
 <u.kleine-koenig@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Date: Wed, 24 Jun 2026 10:57:03 +0200
Message-ID: <rKfcwvouTiqAemuVUZWRbg@collabora.com>
In-Reply-To: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
References: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 24 June 2026 10:37:07 Central European Summer Time Uwe Kleine=
=2DK=C3=B6nig (The Capable Hub) wrote:
> Currently that header is only included via:
>=20
> 	<sound/dmaengine_pcm.h> ->
> 	<sound/soc.h> ->
> 	<linux/platform_device.h>
>=20
> which doesn't look reliable, still more in the presence of the comment:
>=20
> 	/* For the current users of sound/soc.h to avoid build issues */
>=20
> in <sound/soc.h>.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockc=
hip_sai.c
> index a195e96fed0a..37e81d56bc16 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/of_device.h>
>  #include <linux/clk.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>=20
> base-commit: ef0c9f75a19532d7675384708fc8621e10850104
>=20

Makes sense.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>



