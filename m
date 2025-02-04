Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6470820
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738656968; cv=fail; b=Kqp+SpzrIILf96qyMOfBgTONU3W7y9bkDMUQ3Ck17Kgt67bnMUa88v+C5o+dMVKN4bQelUfXB7SOSmFujb2KtBNYnX3BZmg9uLpo2jH96lkRFwGo2pA5Gnyi60HoRxUOsdgBEdrGADnQ4aScUVH5LlVxe0RMW/vLqvZGtAJpeAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738656968; c=relaxed/simple;
	bh=afIAKipeqa44ctIZjkXCxG8kBp69aBeG30RS/O0Yu6Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MrsgKQPOGx9WGwSn/nQTX3NP38Z8jhorftimTTsXtCEfwO9fwhaV/I4vHsQX3UXYIi9TOMDcnyWtROT1ek0kZteeL/6JkhMAIx3miHCcZ0GvSsWvAZmrS2JPUgANc4jYU/xGhZpcfDVsZ7Qye+3Rz8Ye6hbM83mTiPVXdvomitU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FMUIkwJG; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FMUIkwJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrjjmNIv5s0yHDHFFJOeS4sxhqD9kk+UnxkKycX4dMbQAw/YLpN4/HXydkxA9R+Ebd5r+MiiQPcYDOf/CSdlnjsOmd0mOicHxpkmWgB/Fx5zjxpVky3O4K1tRkwazxfdsAHwmze4nlnJN95xJoG0epACtn/aBtx0SQCwN32LLMI3/KdyO2twzeE4x7Z2YFVcEkPYUWKnDZzF6qAlBftOSeuoIGeCbnggiwxQsn6OLJY1ziX7WFuOZegt1amLG0z7hi0a5t0cRgdb5/tbrkDAySWyppS8aZjbhP9X/tzeQiZSTIJN4pJ1rYn9qPb1S/3OEBRQUC7jKTleauRvLFDhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbJKPqK9gOhq0oMTW/Xuu5wcX/KyCY+QrbzhSY31e9I=;
 b=cp+VBLA3beWUqJCE7v8Ft01iKev2lIbV7ZobJu+kEQLRqqQ+5HFiJ8RreeX7Xkxw3Bk9JwQkPinNSDBgArWwcZ8ggG1/IdwHUoawHP5rg/DIU5UQQDwFWo/Q9lRnb05XeZjpjKPaafOB8PopygKeIWi5a32q24AM1+dnSSeUEEE3+Ke5UI0IU4LhyMEQbJP692KCiKKYseuGLA8nZMUigaCU5XLpk+sHpR4nnKJtz6txtoFKe3AOX996WNVEjTpunl8545nTW7kOtpQlJWv7F5vMmeJXE3ypSKqE6XyNxhNUoPBKMfS78diTnjl3X/huKdOAUyP06KRt2a7HTkno9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbJKPqK9gOhq0oMTW/Xuu5wcX/KyCY+QrbzhSY31e9I=;
 b=FMUIkwJGpsl5xPRjZ+VNV+94KMoZworK4cn/z6+dyTo+6oNXPzmH9wNhFo+Bn6z41zjgnrmpO+jSA+r0hI7sPJhWgUC2RbUVO/3Gs9gGda2F056/d0idoE0Xnp3v8zvhop+4x3ySoxlE4AjdUpjmQRCmtrhkW0ZwnnMZStr80H0=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TY7PR01MB14592.jpnprd01.prod.outlook.com (2603:1096:405:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 08:16:00 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 08:16:00 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 3/3] ASoC: rsnd: adjust convert rate limitation
Thread-Topic: [PATCH 3/3] ASoC: rsnd: adjust convert rate limitation
Thread-Index: AQHbdqXtMoxkkzgC8UOcF71BuWi7QbM2x6QQ
Date: Tue, 4 Feb 2025 08:16:00 +0000
Message-ID:
 <TYCPR01MB1104070724CF1AC0DA1C7B7EFD8F42@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
 <87jza632r4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jza632r4.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TY7PR01MB14592:EE_
x-ms-office365-filtering-correlation-id: 16b4313e-633b-4dfb-4158-08dd44f428c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sU9VCRgeE7vu6ZITZqx8J8ndkUXTF3ZIy8d1asxeJ4lFWOhXWCsO984i8PAN?=
 =?us-ascii?Q?klOC9ILNeE7JrQnUhOHucYEvF1TJQ5O/6Qrx7TtIY9uSjzW59IXBFIlTWFnk?=
 =?us-ascii?Q?tmo1cDbBBj5FUoqCnBS4hFePW7gLXtgN4h/1oztaVveoUV2WzSUJc/ZlHIyG?=
 =?us-ascii?Q?yH9Eigav05ijJljVsRv+g+956NklAPXVYYdT9Gj1gq7lL2upPTwKfwlnILcc?=
 =?us-ascii?Q?pZdY3m7YTEMxUkNaa3fvRnQ3fqgGVNQ4LQi4WC9VdWVlcHrX7iHhQ7IR/++N?=
 =?us-ascii?Q?Q5z3d0KTC9cxnq/R0Xmkw/B6DawZ/PuLafWA6SK6BVkgFEyyAA2swfNgafwe?=
 =?us-ascii?Q?KyEIouRRi70fS9KBQ681UBbwtX6Z7n3yyZ3XoMFBoPJPxqMsU0MCmtBw3K+g?=
 =?us-ascii?Q?q1bYVpLFJJL/rQQsJaUmatCfK2a/e9IqahvAi3HN7ZP+S7lplSoNr0y3dZn2?=
 =?us-ascii?Q?JHNDOO4VFc4ZsGn+E5Wmzn2qqMxScUFeKHDTJlo8iIBLA+0u7UIaHeID6lKm?=
 =?us-ascii?Q?OMwKug0BiPOnDV81NIQTvOWp6uBt4t2LmLaM7WGd4TBYr+RbsVLrtITnKH9F?=
 =?us-ascii?Q?c+GdRV9JL4BnfDQsMt7xMgeQgcEPRMhYSdRw9+VyH9xXuqHz6jfd3VSQ1b/y?=
 =?us-ascii?Q?8LXT7UFDQLXoxCU0ZQZVBtHN3dy0lw+tDYt0HJTNfFmhdBNBEQEU+NrDOOaT?=
 =?us-ascii?Q?fUjOzLonkm1h3eIibfxbGhAul/4tdzIbhVX25jUsgUZe0HSIiE6EjIhSDzIT?=
 =?us-ascii?Q?bS2diCRM/RMAKwhF3vw5DwhrnmS9RGfW4CGxdr/4Sxbuex44fGOXtI9gsall?=
 =?us-ascii?Q?ISe2sJMqL607U/PzbnJmWmTga/OMH1I3pm5dfBE5psDRZgn/CR26FptFC8Ka?=
 =?us-ascii?Q?ntPuSOSlc2uXofagoucIxXLKMZ8HHjQRzRkn+Okxrjxc4+NvkWjAg+B1V977?=
 =?us-ascii?Q?gElJ6/7ahivbnbTSJG/pT2Owsx96yoHXvT/HfIEUQqVyXUx/pKqOPuNJSkUW?=
 =?us-ascii?Q?F0mFb2mmbxjzvTkDsAWKNUAwOMaPvnpfOWtWJtTP0QfFgcfpclGTc7JxFA8H?=
 =?us-ascii?Q?o9+Swr8WfnLZXk88GU7Z8wleBnk0fyro5CRosmvq6QyWs3m4pI9pREplKr56?=
 =?us-ascii?Q?/mfKyZAuFAVxm/jjlangGbrkDHmklrWtA25SJD8DURSzgV8+r4yT+gNQNBQO?=
 =?us-ascii?Q?j8QlmiL2fPm16/Rg6ZVOp/alD6KEneh63HfANVvpCfYqONyWELUqBY/je+yj?=
 =?us-ascii?Q?ms76eRilfsW6n/2IKcJ1keneCoEuxZbEciRGlFfcRIcUzmhAi6dVzRW2klW0?=
 =?us-ascii?Q?Y5TYNRbg1M5wVadZGzGbnR44IML/vIOkxpKquCy/DlQTAEQ7vkzPZrLh6d6e?=
 =?us-ascii?Q?LfjvPVZfi0E6cyjkgTEpqBKjT/NS3R8XicYh9wCprRGnFZQ9olBucqEKJj1S?=
 =?us-ascii?Q?l1QIvUShCuBYnFCo75/qJq4CRrSWJRo1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iuwo+lt/IAkUFr5AA2UdNkqrjU5s+QnMBxp4Eq+gwhNmu5UcmwG8RV/AVrpU?=
 =?us-ascii?Q?lJfzrJu35rAcvjlYb8BKOoF7kIh8iegrrWHfymsqHQUsBV+wrcRSsEJ+kQpx?=
 =?us-ascii?Q?FIbOLRZp9Z+zGrBixyWO8TAygDBKd9LWYY5Zo1hu6PEPZWAdBIOERuD8T+C6?=
 =?us-ascii?Q?s8OofpB7ahftAD3oYhjFaE7JxXziEyr2GgK6pxoM1cq9zSJIjihXtSEmtkDN?=
 =?us-ascii?Q?vPYB5xFEMcSBZxWc+vdD+0sVNco1R8iFl2a0ecy1nWJa1pwN8J0k3hheyulp?=
 =?us-ascii?Q?yiM3i6tDss5yZDsH/RBhJCXVJVT7TID6m7Sxi/RzeDb4zH3Vwiek0AvLCqkr?=
 =?us-ascii?Q?Y8Ep9oydhcuAWtI3jQyorVoGgHMidLXqIFrqD63tfD1IVmEJoAETvltYagCg?=
 =?us-ascii?Q?tr20SW0nW/YnVV0Hn/dB1dAh5kJ+LxLkaVC6wc666d9Y1ICAJqpKkkLbDCxy?=
 =?us-ascii?Q?KkZ8Z4hjorOF9d2byab+uZ0RIqEafc41NSadrkgIcS/UhtuRQqSA7C9DG8p0?=
 =?us-ascii?Q?G9+8sP1G0BNRtZk37Z9bxzHylz7pPvXxKPg5BG6qd8vnNmq99cCazEaGrx2B?=
 =?us-ascii?Q?UjI6y6Yp97eLgvlPnUTkMxjWxizFGEThU9notm1R3b0cWrQQzThg50C/c7al?=
 =?us-ascii?Q?u20ecZ+XvzCu2f3n++mr4BkMFKqLMBK2mCxPgY5o/SXdGHBnxxbra9wpJ/o/?=
 =?us-ascii?Q?VTecHQmnlp+hxzVWr02fZkok/QSmPreHULJf5/g7GT0fhUEJ1yXySaDr7QUd?=
 =?us-ascii?Q?A+dSVkloej5mVEpIBobWFV4Qt4pySbo43idLvfw3SqfubGdf8MXVr75oIOg4?=
 =?us-ascii?Q?mHJSrqDP0mV2XOG6yq5YKN3K4tiF/BXg5Piagx6fiK09ISJjreQJtcm4Qjw3?=
 =?us-ascii?Q?yejBp+DlkbYbQ8mzDAs21/qz8rrXsdVffnBHtdDHoJnXPnaiRDjK7BrjFK4j?=
 =?us-ascii?Q?799RyGAAxtv17IoFiK+iu64i6t5WDSKfqF1jvTqwV5PJlGAQZYi7EAt80uKW?=
 =?us-ascii?Q?fnhBKa1PfzAJOVpKZD1WToUcvcMHy1reS5vs2mdi56EtjQpxOciqA+Z+EMuO?=
 =?us-ascii?Q?QjoWrihetmoikqiMF6l8yQZshIUZa68p+F4YTojwA75mFAu7UGchJNjfMRSR?=
 =?us-ascii?Q?ZszPmLgKiKoHUhdENGkO2E+MU7fg//WfOzbxTjL6cLRsBlJnWA37tJD49kRc?=
 =?us-ascii?Q?LU9QaGr05XdaZ2U4WLfViyJXNKc3fnyKR/96QM13fEaWMJ41aZTzruBjpR9R?=
 =?us-ascii?Q?FxPyC/fvuhcXhGEYbDMr2Uxm/eHgynUPmKux4i2YJeHhIGRkR6PveNmdYt+O?=
 =?us-ascii?Q?1ElBghD/cF8NR3hFOvt+ZssHCy54sTZNhvVVrjZTjIJIHjJolwcDsQ/rDv0i?=
 =?us-ascii?Q?c3ArzGvSQoyZ45Di2UK8VCWadHUlPp+9Uoax7lIiVApvrNM4++pQRFa1iy2r?=
 =?us-ascii?Q?uQ86rxLSXW5d6P1WFbtVk0JBkpWIY/09nChJ6nQhPDHa4C4eqOuBT7wWJaNl?=
 =?us-ascii?Q?VTZ7uaUE/qINL17Gg8qLCCtSol9GCdoU1xkNjorTNBbDTx00baLEf63hCkx5?=
 =?us-ascii?Q?ukswPcNSdX0Y2v3xfN/K2islxxkYfQjkrv5eIj04g5QiR+dwyKm81oYB9tJJ?=
 =?us-ascii?Q?Txbr3Z7nfwkhxLMcxgYVRBiPlhnVFIS2akaSQULW5n0vPqU8KV6ExO8z4AGg?=
 =?us-ascii?Q?vNt3gg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b4313e-633b-4dfb-4158-08dd44f428c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 08:16:00.3346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3uecvD8FhjT+qUP1oMznoF4S4q8cpA6/Odgl7kKGzXP1ww4RUuzQV4u9GrdJsnKfUYK7prWPx2yZz02QX/GyOnwNygxFAlFanFxRFrmHeTigewN1tSnwynHuHbda4GQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14592

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Tuesday, February 4, 2025 10:42 AM
>=20
> Current rsnd driver supports Synchronous SRC Mode, but HW allow to update
> rate only within 1% from current rate. Adjust to it.
>=20
> Becially, this feature is used to fine-tune subtle difference that occur
> during sampling rate conversion in SRC. So, it should be called within 1%
> margin of rate difference.
>=20
> If there was difference over 1%, it will apply with 1% increments by usin=
g
> loop without indicating error message.
>=20
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Without this patch, an overrun error occurred on a specific situation.
However, I applied this patch, the error didn't occur.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  sound/soc/renesas/rcar/src.c | 98 ++++++++++++++++++++++++++++--------
>  1 file changed, 76 insertions(+), 22 deletions(-)
>=20
> diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
> index 3099180297722..7d73b183bda68 100644
> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c
> @@ -35,6 +35,7 @@ struct rsnd_src {
>  	struct rsnd_mod *dma;
>  	struct rsnd_kctrl_cfg_s sen;  /* sync convert enable */
>  	struct rsnd_kctrl_cfg_s sync; /* sync convert */
> +	u32 current_sync_rate;
>  	int irq;
>  };
>=20
> @@ -100,7 +101,7 @@ static u32 rsnd_src_convert_rate(struct rsnd_dai_stre=
am *io,
>  	if (!rsnd_src_sync_is_enabled(mod))
>  		return rsnd_io_converted_rate(io);
>=20
> -	convert_rate =3D src->sync.val;
> +	convert_rate =3D src->current_sync_rate;
>=20
>  	if (!convert_rate)
>  		convert_rate =3D rsnd_io_converted_rate(io);
> @@ -201,13 +202,73 @@ static const u32 chan222222[] =3D {
>  static void rsnd_src_set_convert_rate(struct rsnd_dai_stream *io,
>  				      struct rsnd_mod *mod)
>  {
> +	struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
>  	struct rsnd_priv *priv =3D rsnd_mod_to_priv(mod);
> -	struct device *dev =3D rsnd_priv_to_dev(priv);
> +	struct rsnd_src *src =3D rsnd_mod_to_src(mod);
> +	u32 fin, fout, new_rate;
> +	int inc, cnt, rate;
> +	u64 base, val;
> +
> +	if (!runtime)
> +		return;
> +
> +	if (!rsnd_src_sync_is_enabled(mod))
> +		return;
> +
> +	fin	=3D rsnd_src_get_in_rate(priv, io);
> +	fout	=3D rsnd_src_get_out_rate(priv, io);
> +
> +	new_rate =3D src->sync.val;
> +
> +	if (!new_rate)
> +		new_rate =3D fout;
> +
> +	/* Do nothing if no diff */
> +	if (new_rate =3D=3D src->current_sync_rate)
> +		return;
> +
> +	/*
> +	 * SRCm_IFSVR::INTIFS can change within 1%
> +	 * see
> +	 *	SRCm_IFSVR::INTIFS Note
> +	 */
> +	inc =3D fout / 100;
> +	cnt =3D abs(new_rate - fout) / inc;
> +	if (fout > new_rate)
> +		inc *=3D -1;
> +
> +	/*
> +	 * After start running SRC, we can update only SRC_IFSVR
> +	 * for Synchronous Mode
> +	 */
> +	base =3D (u64)0x0400000 * fin;
> +	rate  =3D fout;
> +	for (int i =3D 0; i < cnt; i++) {
> +		val   =3D base;
> +		rate +=3D inc;
> +		do_div(val, rate);
> +
> +		rsnd_mod_write(mod, SRC_IFSVR, val);
> +	}
> +	val   =3D base;
> +	do_div(val, new_rate);
> +
> +	rsnd_mod_write(mod, SRC_IFSVR, val);
> +
> +	/* update current_sync_rate */
> +	src->current_sync_rate =3D new_rate;
> +}
> +
> +static void rsnd_src_init_convert_rate(struct rsnd_dai_stream *io,
> +				       struct rsnd_mod *mod)
> +{
>  	struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
> +	struct rsnd_priv *priv =3D rsnd_mod_to_priv(mod);
> +	struct device *dev =3D rsnd_priv_to_dev(priv);
>  	int is_play =3D rsnd_io_is_play(io);
>  	int use_src =3D 0;
>  	u32 fin, fout;
> -	u32 ifscr, fsrate, adinr;
> +	u32 ifscr, adinr;
>  	u32 cr, route;
>  	u32 i_busif, o_busif, tmp;
>  	const u32 *bsdsr_table;
> @@ -245,26 +306,15 @@ static void rsnd_src_set_convert_rate(struct rsnd_d=
ai_stream *io,
>  	adinr =3D rsnd_get_adinr_bit(mod, io) | chan;
>=20
>  	/*
> -	 * SRC_IFSCR / SRC_IFSVR
> -	 */
> -	ifscr =3D 0;
> -	fsrate =3D 0;
> -	if (use_src) {
> -		u64 n;
> -
> -		ifscr =3D 1;
> -		n =3D (u64)0x0400000 * fin;
> -		do_div(n, fout);
> -		fsrate =3D n;
> -	}
> -
> -	/*
> +	 * SRC_IFSCR
>  	 * SRC_SRCCR / SRC_ROUTE_MODE0
>  	 */
> +	ifscr	=3D 0;
>  	cr	=3D 0x00011110;
>  	route	=3D 0x0;
>  	if (use_src) {
>  		route	=3D 0x1;
> +		ifscr	=3D 0x1;
>=20
>  		if (rsnd_src_sync_is_enabled(mod)) {
>  			cr |=3D 0x1;
> @@ -335,7 +385,6 @@ static void rsnd_src_set_convert_rate(struct rsnd_dai=
_stream *io,
>  	rsnd_mod_write(mod, SRC_SRCIR, 1);	/* initialize */
>  	rsnd_mod_write(mod, SRC_ADINR, adinr);
>  	rsnd_mod_write(mod, SRC_IFSCR, ifscr);
> -	rsnd_mod_write(mod, SRC_IFSVR, fsrate);
>  	rsnd_mod_write(mod, SRC_SRCCR, cr);
>  	rsnd_mod_write(mod, SRC_BSDSR, bsdsr_table[idx]);
>  	rsnd_mod_write(mod, SRC_BSISR, bsisr_table[idx]);
> @@ -348,6 +397,9 @@ static void rsnd_src_set_convert_rate(struct rsnd_dai=
_stream *io,
>=20
>  	rsnd_adg_set_src_timesel_gen2(mod, io, fin, fout);
>=20
> +	/* update SRC_IFSVR */
> +	rsnd_src_set_convert_rate(io, mod);
> +
>  	return;
>=20
>  convert_rate_err:
> @@ -467,7 +519,8 @@ static int rsnd_src_init(struct rsnd_mod *mod,
>  	int ret;
>=20
>  	/* reset sync convert_rate */
> -	src->sync.val =3D 0;
> +	src->sync.val		=3D
> +	src->current_sync_rate	=3D 0;
>=20
>  	ret =3D rsnd_mod_power_on(mod);
>  	if (ret < 0)
> @@ -475,7 +528,7 @@ static int rsnd_src_init(struct rsnd_mod *mod,
>=20
>  	rsnd_src_activation(mod);
>=20
> -	rsnd_src_set_convert_rate(io, mod);
> +	rsnd_src_init_convert_rate(io, mod);
>=20
>  	rsnd_src_status_clear(mod);
>=20
> @@ -493,7 +546,8 @@ static int rsnd_src_quit(struct rsnd_mod *mod,
>  	rsnd_mod_power_off(mod);
>=20
>  	/* reset sync convert_rate */
> -	src->sync.val =3D 0;
> +	src->sync.val		=3D
> +	src->current_sync_rate	=3D 0;
>=20
>  	return 0;
>  }
> @@ -601,7 +655,7 @@ static int rsnd_src_pcm_new(struct rsnd_mod *mod,
>  			       "SRC Out Rate Switch" :
>  			       "SRC In Rate Switch",
>  			       rsnd_kctrl_accept_anytime,
> -			       rsnd_src_set_convert_rate,
> +			       rsnd_src_init_convert_rate,
>  			       &src->sen, 1);
>  	if (ret < 0)
>  		return ret;
> --
> 2.43.0

