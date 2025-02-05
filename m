Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4713B227B98
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716264; cv=fail; b=IXbdgpnpOaZxW4aaARMd4ha7Hjq7Ex4jQuAvH50/2kFVZYNpA42CK3jFAG2gavh0kjcUL4pIZyLeF63Qp10rC3KWCvBRFYVWpbzMnIYOLhkYeMii82N+6Tm3+feqUqrzoipWCxoqzQ2lBasSeGB9Ay5puIi4NrYwRjnfw5NISf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716264; c=relaxed/simple;
	bh=v+RRbS5eJ02JNOnNj22bS3o6TtFuVkgrljuTRFyzcF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ji8TlzWNDkpofJCzRN1nq5yD+l9MguVnPjzpkTj2nZh0sK8z6omDJiuMJlpY8/DzcrjZ7/Yn6hAiRhfY1Dps5Q1PjVO7VROUNlGFIqC2NgnZMzo7y804Eel5FOc/I6V5/Y3nFAKdIoZLwzCJ2iR4jDhzRTp4hAGsN+tKEZV8vPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H2PvFr29; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H2PvFr29"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waSDVz9j8k+xQGsrNJ2crXdRbeSg/yhoyIxF+ELlEMY5QYRh01xT4g3sCnefuzHwc0bzhWRszujvgHqXaBFnWKpSCOCIGtNcTUv3Y7YzFAkOdA/GeLnxIW7iURNNMB8pEnHkcNrmzt3qzlArIb+IYVynG2Y4fiYNTRs3/sVUH9eDw3zqRcs/0QnrCO7NMr21ipM1MRZrX69rgGJb+DH2mnNFgTu/9otV0IxuJyqygWAPHfiNHtFju2Lc06Pukd736LQs923ncFMwq4FbvnZXMeLOxWhMoPJq6i1A3H10WrSMVbOOVRxOT9u+TNfX3DGS8W4pVok3IB5y5D/QyOQSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khQGKinPO7ssSTh0/piy7v4yy59y4x46q5aKGn4/398=;
 b=y3q5rD+loZOdGJ3r4uS4V+yOvtY4dtSX+4YR7AXWtMkwpEBrcXs+3TWqKhpMDyaWSSQu8D0e7yApJY0vj3YZtugw9ZjSG/KqkI9PuAzFy6EV+26bppT+g0z1SGdxb7mpUD9QpvPX1FBTVW5KS++vhmYD0jcX15llYSNd4ulMizcjbZEYZxfGFnOBc32W8kTyvCIQz5XPMevXHYwwSO/JVqvjlGSOhWQ+ueenTw5IZoMNpATR7EdudnfyxcbUv/MgWj1skMoLjtHH3SJXq7YiSm/6F5NMS0LBoKEZExpRWqMvlwLMbEPM+TiZWjSmPd06n0anuoTRM1A8O2QIZP3H6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khQGKinPO7ssSTh0/piy7v4yy59y4x46q5aKGn4/398=;
 b=H2PvFr29e/JBSBCSfHUEbE1J18sd1kkCxOyd8Q9gNO5JD+uaDqZjo4jWhgrToTc+MuW28XE2wwoP/k14oxaSzoTmzQcwxeeWYbaCvvEcTkfoFP723WrzMpQa3z40K4D0uiMmcFfsC17g+1hPcChujiGZVnD1SpMSbp1kMksOlKE=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by TYWPR01MB11751.jpnprd01.prod.outlook.com
 (2603:1096:400:403::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:44:17 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:44:17 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] ASoC: rsnd: don't indicate warning on
 rsnd_kctrl_accept_runtime()
Thread-Topic: [PATCH v2 2/3] ASoC: rsnd: don't indicate warning on
 rsnd_kctrl_accept_runtime()
Thread-Index: AQHbd2PLBzFLvw//KEyc6DEsOLmS6bM33mQA
Date: Wed, 5 Feb 2025 00:44:17 +0000
Message-ID:
 <TYWPR01MB11030B6B0A8F333B670127508D8F72@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
 <8734gt2qed.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8734gt2qed.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|TYWPR01MB11751:EE_
x-ms-office365-filtering-correlation-id: f4ac8702-d63d-48d7-d1ab-08dd457e38a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FtievPcX9pvWKp+a0g0KSAxG6IeN4uwWt139Jrr5PQXLOn8gbt//suKN6u6v?=
 =?us-ascii?Q?57PN/DlMuNJ3N7jo7HOOv79YOQP7JcZOIkqw8LfzpLskDparmu7HQi6Fy1vd?=
 =?us-ascii?Q?0EqQ0FTYHnlbyV++L7SUdnIcFaCAQm1Im2QNiXKiCczmS6FBJWxCJUQ3KZ+r?=
 =?us-ascii?Q?P6lpHrO8fL3nh/MuvgWCvsvEXlOMO8xYxNmIO0q0GMK0DFY+IOAxTcg+N6eZ?=
 =?us-ascii?Q?2R8u3XvWfFVvLgBJv4mSXcQxkvfC8knqG1bO5snCFPT/upHBUaVB+QwZwINS?=
 =?us-ascii?Q?zHtvH7XH41DciRBZDAQWJcmonglYeMUiOeP6FwcKs3S3r2bIHwytTRBt+Rfa?=
 =?us-ascii?Q?EAll+o+A7df+2Nt+CA0wE0jeaWxhYbbfJwxYRAPBx2uYi1R5d505VYvWxDLB?=
 =?us-ascii?Q?tqczAMebrEfz8ySHmAl98Gx9OU+uf/rjkMV71xUGe2uoy7fZ+/boFBrmUs1N?=
 =?us-ascii?Q?mHD7LqvM273AsRIFo+mGtuccI30W8ourUB82eppLB+zarihJgdjCAGvoXj4W?=
 =?us-ascii?Q?nAz3FagWkuRqBDAfddc5om/SsNkWY/qFWWVw2bTUH+Mox1siFeFv1+hUiAJ9?=
 =?us-ascii?Q?CKM93JIQ0kYC+BpL+awK/2Q9lZllDuM1ClSxkFnYu+QXYl55d2D0vtItsOOC?=
 =?us-ascii?Q?wibY022chVV3KhEMRCOEDh6MNnVTGkN5ROjfgC6ARo3xNwAycaGw/HGzsGqK?=
 =?us-ascii?Q?Ef0IpxcYqskN7ROBaG6J+RtD0JI89OAujMVqFL57urEPujOsscmEzKIjx26X?=
 =?us-ascii?Q?UBLpFLITJUllsR6fucQBLUQalgHJQSvjhhbtJjgtgF0mIU4DypT1coguuPRb?=
 =?us-ascii?Q?WWfT+8DXgp0WCNgzfiFXGRhizCbE8XGX0Qn1FwrInGYQq/rZ+hhCidjh91P8?=
 =?us-ascii?Q?E3cPIyWy8ouonUB4r+lFez8CEO9lXjfI1aG+As2TEGZL2fVxL/nCqUAtlpCp?=
 =?us-ascii?Q?V717IFgz4OjQTbzIQV+j8pfb9bXLV6gmGWPbv2I13PTBhjNmmCEZ2xpUaiT+?=
 =?us-ascii?Q?Hevvy8yPiyWW8Un/pA4fgNr31niJ/mx0LufA+087c36/0yjy3mIOGg7dTt9i?=
 =?us-ascii?Q?WbicMgmBpGYawiaU768GYaaiVmSl9/Ouh2+EbZXthMdzTW2w+Hu7dwy0LRra?=
 =?us-ascii?Q?nzeY6iam2ByMOpPb/uR/Mm8dnoVne1LxUOkj2nYcIF+eJcCa+ahI/LKUDNA8?=
 =?us-ascii?Q?/Luq0O5eIgM0NXr+IeUsbAKnMRnsoW97/EAdRTBPQcBK6u55tFKLGMSLHvw3?=
 =?us-ascii?Q?S0MiuKrvWrBpOTsrKWeDrK68UA5GibplMf+Yl6l1UABJhDqPycSQ01loJP8U?=
 =?us-ascii?Q?Kfk1mQ8tdzHy0jm5THxD+QEt3AvxO/FZk07IGwpuIUV97VDpXQJv+WLZIR3o?=
 =?us-ascii?Q?AO0pfWMVD4uljqdDMuCh2EXig4V8rw3N6eb7T+eHkmWGHvGJ342qWQ1yTKzQ?=
 =?us-ascii?Q?5QTHVhqQ1mRTqPhyN3AbztonDDl87+ML?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fh51quwqW0INstcEEb8HoZ727ptCPXy1c66jkj2iXPS/c7Wd8gNVhAjAKU6o?=
 =?us-ascii?Q?Zh3j7My24TuQ/MKZKxi+DnxJkJ5Y7i702dCQ/x06/vXp9Zcv84ig5fRZSKsS?=
 =?us-ascii?Q?L7h01sezYAo60cdcyiyqw+jq61sJBfc3ojYZwp28Xis1oYhQkfVyg+esjsWj?=
 =?us-ascii?Q?LmtgdsXcJrcpdGJXsCsA32BNty7IWiQrWFUEZD6mGgMxyoosxGwetgpsBDVW?=
 =?us-ascii?Q?7xhwkxT9YCAm3T8UYgZcOvQUI5WIcgZk51bMYNVrzUjBX62vuFWy9xtK5mkw?=
 =?us-ascii?Q?8fmSEFnw38nv4jUUQtqNTHT0BVp2a75RERoho1W10vgJJYdOjaY72SxCmIa3?=
 =?us-ascii?Q?TrKYxoA8XpJ1wlJj5squcfCDCMMfhVlZa3u3r0XOxNwZingbeHu9OZYT/7zB?=
 =?us-ascii?Q?kWrjwJXOF4ur09eUp/l+D6x23YyWvtZneQRL+CEITK1ojMkoyeKp2ckHnmmS?=
 =?us-ascii?Q?XqS9/4gh5p5X4znhSGTWoOJjP7FiPzcInk0arYVfrudsmRQJBdeZaexVGJXi?=
 =?us-ascii?Q?8mDztROjrGdEWC9M46f1NEBpPPbgE93WPHBvqC+q28uSeZfT48I10/DuzRi8?=
 =?us-ascii?Q?Ya8xY+z7Rhe4ymKmtLEZK2mxS2kgY0YlS9r/elOneVNgp5/RVvVwaWwLqhih?=
 =?us-ascii?Q?HmOU8O/098O8p6mBvbKtntYm4dnRrMeTUE9A5e8SRDXWvwaylneGqMKuoVGO?=
 =?us-ascii?Q?gQpZy8heQUmtvg2/+ajrFEbFLZaaZ8cymqHnE1K9H0m5LvP+n4vv5d9js2eG?=
 =?us-ascii?Q?9YHAiQqdCGAZLkZdBjwxTF2XiHXb+FFiv3HIMiu2HDRKu4II565LgTZBw3Vw?=
 =?us-ascii?Q?VxQZmt7xMgO5Xq567T0u9I0s+XRSyAwy4pnjzngDRvD/f8BAaFcVQFSfiWN7?=
 =?us-ascii?Q?M8YUeFMELYA9dZrcYd+sUAniz4d7iR5jd3GiljT5YkRKRgeJRDsW7eRGWLn9?=
 =?us-ascii?Q?OhKRZn3QH0ZRMCukv0DHuRNXeTx3jrZ19Gm0FsO+73TvqTBUsBNn7rDWYDRq?=
 =?us-ascii?Q?Uluq7po3YxaIvx9+DflxEJbhP8lJJqusry7BfJ896vMAjgR8bgO5N0+1cWvE?=
 =?us-ascii?Q?LLHKfZ4X7nTqUkeRCb8qevK+Hgmpd2dTKeUCA7t6HuBxMRLUlntqcMhepiHA?=
 =?us-ascii?Q?xbM0e1tDCXymwt6pEglWEeUpOUop7bpWjz1FKaC2petAqLfHNCXUdPdjPMxp?=
 =?us-ascii?Q?i3zQUgvy3yXfe/h9kWTKYZKsWoiQymJM3/cYjGPgDKT4srnMaseKLNwdOaeK?=
 =?us-ascii?Q?hQjwceZ7GA65EJNtLuQ/Ap0h/vV0p6aciLWbffGheeO2+d78beBw5Pblbppk?=
 =?us-ascii?Q?sWMNXy/pZejb0dvOiEwYdtJ1BgoBCH+AKUkfvRVkdQ440aVVKPVeHY8ERcSc?=
 =?us-ascii?Q?SM2dUecQ3mlGRKusHv/3vZxZOzN7dHmpVLkoBRoK4w02B9o151UBjOSNJo+f?=
 =?us-ascii?Q?3vUm6BJjhVsrUjh18IG+LxCj9Rb1WNZX/W5NFXdnA+Bwsis+LE2NnHpDM6up?=
 =?us-ascii?Q?XaOO9EE/RRktDNzrfWcRdgwwxlJQV0+Wg5t226mBmbsRRk57nj9AKI5qJez+?=
 =?us-ascii?Q?E39NTGrzDAy/l1C+R2r5tzZfYm3quhCqgkvbEH99FVhmpNa9DGac6am3p7Yt?=
 =?us-ascii?Q?Mt0N5DX4HEG8qpgXL9HebVv9gjf8YU21Mqvwra2adOa1BH3NPIoROB8CT2wx?=
 =?us-ascii?Q?4ENjWQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ac8702-d63d-48d7-d1ab-08dd457e38a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 00:44:17.4842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6RMv4y5L1dbfnTvUzzEBL8rAk8x3UCHEHMPGN4n9i8C1O38w5qwJePEHstoX9gQdRwwiBPAvstD5vIfFf90rA3DxxaB7TV8LFzLJ5+UcvOrWd60MUSk4wwsYqi8tbtZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Wednesday, February 5, 2025 9:21 AM
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
> To use runtime convert rate (=3D Synchronous SRC Mode), user might uses
> command in below order.
>=20
> (X):	> amixer set "SRC Out Rate" on
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

Thank you for the patch!
On v1 patch, I mentioned about 'amixer cset name=3D"SRC Out Rate Switch" on=
',
but I confirmed that 'amixer set "SRC Out Rate" on' also worked.
So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

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

