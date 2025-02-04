Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD132205E3B
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655666; cv=fail; b=CuEziuMGLEs4NOGQ7JdQoNYHwvN1cvy9qvhys6ilaA+xndSEc8dmtPKASNr8QMuTxU6MERzOFyAqqPXU3X7UVKxSb+5/YzVkXnN86sj4BP5ud0u2BYhfMZEwGBPhNNqBOA5PpvcGwTDSDdXQE023QVpWRsRITAohCDoy2BsHyv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655666; c=relaxed/simple;
	bh=s1zB81oq0wULXY0ctU2NfUNed1lqCkm7mTKNOjunUCk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Td8EhoNxzQ0RkZNrpOuAwomIONNzBKSRIodHeBDh2IGmA4BValqHVnKzZ1OJYevbHLIrsOSMts/fWwUZJLf2hn2gsmb0NO6B69XqRxkkFObenwh+mlD4im3MdOk22Dp1+jo/NQpQoQ6yaLms/4SOvL8JirwjIakjLDjK+RhvvGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hr/3YTyF; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hr/3YTyF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFc4Isi7lbgko2tzjsKemeqefD7yJggV5QlW9LaNi1uYa9hyT8fdE8rSSHwHOetSaouLbQLZqZWsVMfIGmh+jt6X+1tlS/FMNnPFeZrcVpYiN8JSB4jlfO8YG9rtykvY8W/ODItPRCFHDjE3GxY+5fb+Sv2yNO7HG8c9lVYBWguY14+LGxPC9VuI4+m77HdIxbAR8UmnwN0/Di0CCpF6lQ+QpUaaRTgmZ61FojKMkLfWO/B5dpLLJh35F5+fQFBHnWpqhDH34/5slfthZ3SSG/ZcDqQLHNQnRaNn7z0fZog52SNppt1+dUBuIt03woaMC7M5DEAHgd31g4UfOH+wbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F3yS8v+9xHbVbg62VLZ3qHb3C494OYU10E4Oh+Kl4U=;
 b=kBB8eBDtzD28mXVyAwzfa2JcCv1aEC5g2kX96Ike9qcX0+yRFfmcKjb+rpgRdBZS3m6s8/Wii/9ZUD+WjJzB8gVVHuN4dqX8qg39Rf/BUtRouHjrdXTsJ41BTk7MjhVc5ajvLE7Y2jfMa3JmlNsiwAT2eKhd3T8/1zinv+OmRnZywBTdqBhlK4rAlkNdamOUe3PaUTey/4JmJiNRZt+spPjb0JPalCU917f76YlsfNhhzG15xLm/hAgVk+5EfI1l5OJNp07Lgr6DVFX2R4WmZEUJbSExlrjw5mR6DV6RZaO/ewYwQ2nXaDVtkjoVbahWueULJZns33L84hGkE4AxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8F3yS8v+9xHbVbg62VLZ3qHb3C494OYU10E4Oh+Kl4U=;
 b=hr/3YTyFj87qKqwrXUbKf8mbee90aeqCeya9xBT/xj1eboa5b+BpXpgv1eQkwj6S4iK+ujSLT0qr2xk8o3c6Uv/so/8nYEjM8frWFs/w4mhIyvGA7tNFkOUFHfdDuIgttzh4RITNylEkJWNBYqdcJi9N1TUp4ZcnsJcgKkHkGiA=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYRPR01MB13278.jpnprd01.prod.outlook.com (2603:1096:405:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 07:54:20 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 07:54:20 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: rsnd: don't indicate warning on
 rsnd_kctrl_accept_runtime()
Thread-Topic: [PATCH 2/3] ASoC: rsnd: don't indicate warning on
 rsnd_kctrl_accept_runtime()
Thread-Index: AQHbdqXrObUGO4fotUCQepm/tNgUO7M2xaXQ
Date: Tue, 4 Feb 2025 07:54:20 +0000
Message-ID:
 <TYCPR01MB11040765267518911B34AD591D8F42@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
 <87ldum32r9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldum32r9.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYRPR01MB13278:EE_
x-ms-office365-filtering-correlation-id: 9fabe9ef-9fd6-48f2-0ca6-08dd44f1223a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?17E98fJJyFxhED90Zr/t75M8gxy8AMcJOfYk7At0OUz1zdkcsXYKMrwYJLo9?=
 =?us-ascii?Q?/22qYy55D7K/vLsCRpMLOKOtamQogzlFMFIxamsvjKEqFZRX03PIJ0ar31gi?=
 =?us-ascii?Q?SXdJ4KPfGG8vk1phgdC/DvF5IbSl2w3YZBRvMqVtPsNLnzbH6kxnngAlhq5V?=
 =?us-ascii?Q?oG3vX5MUFz0RJxZESrESmGzf09wWjDLPeKGy83I1nkc/tXNWdC6+Nnj+3BKz?=
 =?us-ascii?Q?gCn4Ch2ZBAV68u9Aru4xbsxbGC1eYPOElxpARjlqsQgZ7dX2P6SerihZLDu/?=
 =?us-ascii?Q?Pev3eKEHQZsZ2v8n5yyg0nKSvYU64W3pgHCHGv65UtOTPtqzStOI95bD8wlW?=
 =?us-ascii?Q?xS20SEQtIk7S3mrk3jncyu2fOXjvNUcFqpMVUyf1ZLRqbqRw8J/mr4w2HVRP?=
 =?us-ascii?Q?mUfdKYcQhPvL5cbWGm4xIfLDKAnfm9WdfzMDxcjHBB35gsWx9N51UmBTvTMy?=
 =?us-ascii?Q?6087+r33xcgFrl2ZpuvZhpzkZkpROj4vPyIMPZefVp1bOJ2fgHqR6n3f3mK3?=
 =?us-ascii?Q?ZgaMj1lyVd+a9Idqql5WWu/kNi0mDWhmtlzibM8y1XV4ecdGEJRReht1OvNL?=
 =?us-ascii?Q?VfHI9ZHXZdkvjyfUSOc6LL6VRCggg9DcrSHcDVSDskNT5d/YyB4DkOguIYgM?=
 =?us-ascii?Q?oKcoNm9O30hnvcEJ/B5kDjXsmwJPgOgzNfKtAiRDFDeieZftwit9cbjFYchN?=
 =?us-ascii?Q?gP7SCbm6GRb4619fVSnFqu7fn/towbOJ61i//aWfgYx825MQNSc5qHjrFOzU?=
 =?us-ascii?Q?cSwOCiUq4FuLvc9odPqVumGNZDE9Bi9cY0pauDOcI4xaxk/ngKFMJU9HtF8W?=
 =?us-ascii?Q?W/YtcnSSYqPMoms9qVN2aqvyuGPH4KSGcLt4Rmlq0YuG3KBqlmshs9s+aRjj?=
 =?us-ascii?Q?URcDiZWx120XyvtZKEDvcR0dj++vglNCJz+XCFRlHsGdazZEUDebvv/WBjKD?=
 =?us-ascii?Q?kZ/UtyG3G5jvvjjN4o7wQQ/Yf7ARXJpVycIedaZhpOUWwlwLCzeCFlV1+j2+?=
 =?us-ascii?Q?O60DlA1zfAnJ/C3pG/YelpaS56YIzVrBP1k5eI9pRBts6RsIgFIhalsx0yVy?=
 =?us-ascii?Q?5GoNbXn+2XTqtFgzptYPWS75mSa5Unjv1SaJc5Zo4T3GfSzRG69JcaiTW/jO?=
 =?us-ascii?Q?j/s2Gi2ZenFK5VZB2VujKArx3Kog/UgOu6J+d7y60K8MzAsd8KhspnsqH0QL?=
 =?us-ascii?Q?LYgcrDgpnB69xMLgrHWYaxIa6y/JNOXQWCVa8zcIpJJo3xB8xwfAop8J6Nip?=
 =?us-ascii?Q?yffv2wsU09D01NBEBzYeVY6sQkduIonlc43dogjjaBhYn9rSkZvfamLrByQd?=
 =?us-ascii?Q?4ox+ilgHkY/RFRA5Eiz/k8FReKFioD2MIx2Z4NmkRMnkLEl2X04N8Zdnb+DJ?=
 =?us-ascii?Q?DKpR71Q+o3y4JG08cbNb4mqH7UgTzPXjAbD3s2/0+SV1k9LOd6OUOVI6IGg2?=
 =?us-ascii?Q?TS4ew/pDSS7MiCW7g1Zz5ibp+ARgjnq1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eLsdo/iihagCG6xidgLeBSA0QLwE8064UEfyem77lEbPlqtOGAnWeMGctaxj?=
 =?us-ascii?Q?cJ47avxvZ/+qpF0gcYNwO2mk5IIm0HEJAdet/hwoSxw4kQeJ7R8V0uNOh/Rd?=
 =?us-ascii?Q?98e9el8apyCIUndqdikeOLZYN1XjZTcJDQgeRu/e2iCPDBj70BoXo6chLBZr?=
 =?us-ascii?Q?C+O6HRqdZZ5iwvswzdpHELysy6g2iPT/Pyr4/IVedkJANbNbRgMraPze69rS?=
 =?us-ascii?Q?s7mC47lNK0fNG1t7ZlKAJDuzUVFECDhJr14kZDMfh+f4lKR30P8p/P2wMIYO?=
 =?us-ascii?Q?Kla8nGN9f051DLY/llJH4YuqRs756G9xxSVBdcdEojOTHrhYBR5onqvLbRRU?=
 =?us-ascii?Q?LdmWJTIqwo+ufgSVqF8UPIZsMnRwpJtJaGdX90ljTAHJv7+ygvYSifAGt1s+?=
 =?us-ascii?Q?ZNTh57MzETTYIsl2vrztPd7hkTSfvskaaG64rlg1jxOE+loo2e7xq6vM2HBi?=
 =?us-ascii?Q?6mftgeIVGWjRnqCMR3QlU7prmurh/L2NawfCiTSFd+TRLjk7b8XwDQN5F2I3?=
 =?us-ascii?Q?m/YmONRetN75p8S3rxdlKa09FdhrWPsqBQXxOhu6/UJ0o/XZhHdXxSchN6Wx?=
 =?us-ascii?Q?/t6Uv/eGVJisAfvRr4bME5L6EellZ3UmfU8Rvu8vtpGsYcKVUClSCym+LEZx?=
 =?us-ascii?Q?JBG8Ys7ehX82d9sPTqzRLUzsLTuzpycghY/a5uGIilAjr+Blb8FbZXAEfNej?=
 =?us-ascii?Q?qHi8nZjEINjaOM05I+Zz8u8VA/6P0sPQVrMMv06b04VPU8QzvP10icrhkEDu?=
 =?us-ascii?Q?9K03Sp2K4yljQ6ARgLHtH+9EDnDiR/5xtcgQGZFKpQOSQg21J9UHMTxVIJgU?=
 =?us-ascii?Q?3NxoOgcUR2+HHD21ExD7JRJwKxDZD5CtdqxMJTh81lZDodqzaT1EJ727ZMrj?=
 =?us-ascii?Q?UaZ5lLwSgSELyYX4JqlFXptr9dKtXD11r1BywQPGYDR5E5yV4ogW0HHhapUx?=
 =?us-ascii?Q?TrKKE50dsfyPmQDpqsSsWv5NCKUmxMNZkrm4uEjTppneP6+UODxIipW69oj4?=
 =?us-ascii?Q?E7a0F5EQdX/QB3akJTI2DR7sR2S/RlyyEf3hijZUA6rcwXJpgdWtczrRXr3Q?=
 =?us-ascii?Q?mR64NezHk67zg3Pdt40rxPMJvyUa6a3G5PS91Vilw3iv3gOmz8n8vV6AAwSd?=
 =?us-ascii?Q?Mv/J9r1PzWM43XZWDH9TXLk91/d+Doa87ffJWgKDoi0Mhdx9wRfFWuaF7TUZ?=
 =?us-ascii?Q?wgI1Bmzkj1dUXFRMbsFLiQBq7kBOcbGrQC1wutWGPurJ4r0msd3YT0c6E41k?=
 =?us-ascii?Q?Bk7OIk5Ah668gitRrzbmPzEahi+nkZWScR/8+hNNOERHZv+lvGlR614IU1qc?=
 =?us-ascii?Q?dFlfLssvOkeJCgXy/ui2Z49SKVXx/dsXSBTNjR2JNBx4uOMz/UKbA8fSh5yK?=
 =?us-ascii?Q?Ex92lxYWAGqr2qMgzYJZ5nDomI4j1auATA6q3f5mXRUe+mjZbfayyZ8Qd7T2?=
 =?us-ascii?Q?fwXK5JopxtpMx6t6d8+8FEDc09GJhg1LXXihQUgJLvD+2VHpWDAy57KjRY9D?=
 =?us-ascii?Q?WMz+m6v0MwanUhhbX6lcO3xQkbfZmYnVhPMy8Q8sGRDgYo5pZ2s4j5MRxGaw?=
 =?us-ascii?Q?1iDC4QuYhtQapVqS3V9Lga4rjOMfGg+gokBlc5aKQ5jyk2gUteNsFqzlOUVi?=
 =?us-ascii?Q?ejlJxfrkhj7IYHcRJTBqlR7Tj6OcpW606Cr4yY4iMjCm75ozDSBHwwsihY9v?=
 =?us-ascii?Q?3N2nFA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fabe9ef-9fd6-48f2-0ca6-08dd44f1223a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 07:54:20.8459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8ucsK5yomuoMsD5FFf1ThKFcc5LIA2QITRSF59sR2PaTUSWjOj49UyyidaicGMi7BSf9rjjktKR5Na6kf6jy7VqznKdg+0PbHC1XQPRUsHHBMZNae24PZIKtWKj6Psb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13278

Hello Morimoto-san,

Thank you for the patch!

> From: Kuninori Morimoto, Sent: Tuesday, February 4, 2025 10:42 AM
>=20
> rsnd_kctrl_accept_runtime() (1) is used for runtime convert rate
> (=3D Synchronous SRC Mode). Now, rsnd driver has 2 kctrls for it
>=20
> (A):	"SRC Out Rate Switch"
> (B):	"SRC Out Rate"		// it calls (1)
>=20
> (A): can be called anytime
> (B): can be called only runtime, and will indicate warning if it was used
>    at non-runtime.
>=20
> To use runtime convert rate (=3D Synchronous SRC Mode), user might uses c=
ommand

nit: According to checkpatch.pl:
-----
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit desc=
ription?)
#17:
To use runtime convert rate (=3D Synchronous SRC Mode), user might uses com=
mand
-----

> in below order.
>=20
> (X):	> amixer set "SRC Out Rate" on

Perhaps, 'amixer cset name=3D"SRC Out Rate Switch" on' ?

Best regards,
Yoshihiro Shimoda

> 	> aplay xxx.wav &
> (Y):	> amixer set "SRC Out Rate" 48010 // convert rate to 48010Hz
>=20
> (Y): calls B
> (X): calls both A and B.
>=20
> In this case, when user calls (X), it calls both (A) and (B), but it is n=
ot
> yet start running. So, (B) will indicate warning.
>=20
> This warning was added by commit b5c088689847 ("ASoC: rsnd: add warning
> message to rsnd_kctrl_accept_runtime()"), but the message sounds like the
> operation was not correct. Let's update warning message.
>=20
> The message is very SRC specific, implement it in src.c
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/renesas/rcar/core.c | 14 --------------
>  sound/soc/renesas/rcar/rsnd.h |  1 -
>  sound/soc/renesas/rcar/src.c  | 18 +++++++++++++++++-
>  3 files changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.=
c
> index d3709fd0409e4..f3f0c3f0bb9f5 100644
> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c
> @@ -1770,20 +1770,6 @@ int rsnd_kctrl_accept_anytime(struct rsnd_dai_stre=
am *io)
>  	return 1;
>  }
>=20
> -int rsnd_kctrl_accept_runtime(struct rsnd_dai_stream *io)
> -{
> -	struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
> -	struct rsnd_priv *priv =3D rsnd_io_to_priv(io);
> -	struct device *dev =3D rsnd_priv_to_dev(priv);
> -
> -	if (!runtime) {
> -		dev_warn(dev, "Can't update kctrl when idle\n");
> -		return 0;
> -	}
> -
> -	return 1;
> -}
> -
>  struct rsnd_kctrl_cfg *rsnd_kctrl_init_m(struct rsnd_kctrl_cfg_m *cfg)
>  {
>  	cfg->cfg.val =3D cfg->val;
> diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.=
h
> index a5f54b65313c4..04c70690f7a25 100644
> --- a/sound/soc/renesas/rcar/rsnd.h
> +++ b/sound/soc/renesas/rcar/rsnd.h
> @@ -742,7 +742,6 @@ struct rsnd_kctrl_cfg_s {
>  #define rsnd_kctrl_vals(x)	((x).val)	/* =3D (x).cfg.val[0] */
>=20
>  int rsnd_kctrl_accept_anytime(struct rsnd_dai_stream *io);
> -int rsnd_kctrl_accept_runtime(struct rsnd_dai_stream *io);
>  struct rsnd_kctrl_cfg *rsnd_kctrl_init_m(struct rsnd_kctrl_cfg_m *cfg);
>  struct rsnd_kctrl_cfg *rsnd_kctrl_init_s(struct rsnd_kctrl_cfg_s *cfg);
>  int rsnd_kctrl_new(struct rsnd_mod *mod,
> diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
> index e7f86db0d94c3..3099180297722 100644
> --- a/sound/soc/renesas/rcar/src.c
> +++ b/sound/soc/renesas/rcar/src.c
> @@ -531,6 +531,22 @@ static irqreturn_t rsnd_src_interrupt(int irq, void =
*data)
>  	return IRQ_HANDLED;
>  }
>=20
> +static int rsnd_src_kctrl_accept_runtime(struct rsnd_dai_stream *io)
> +{
> +	struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
> +
> +	if (!runtime) {
> +		struct rsnd_priv *priv =3D rsnd_io_to_priv(io);
> +		struct device *dev =3D rsnd_priv_to_dev(priv);
> +
> +		dev_warn(dev, "\"SRC Out Rate\" can use during running\n");
> +
> +		return 0;
> +	}
> +
> +	return 1;
> +}
> +
>  static int rsnd_src_probe_(struct rsnd_mod *mod,
>  			   struct rsnd_dai_stream *io,
>  			   struct rsnd_priv *priv)
> @@ -594,7 +610,7 @@ static int rsnd_src_pcm_new(struct rsnd_mod *mod,
>  			       rsnd_io_is_play(io) ?
>  			       "SRC Out Rate" :
>  			       "SRC In Rate",
> -			       rsnd_kctrl_accept_runtime,
> +			       rsnd_src_kctrl_accept_runtime,
>  			       rsnd_src_set_convert_rate,
>  			       &src->sync, 192000);
>=20
> --
> 2.43.0

