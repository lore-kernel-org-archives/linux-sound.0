Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217C315D40
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566311; cv=fail; b=EIj7ulP24RMRgVyxwBKIQrI8p6RsW4nq1bi8mE/xwzK8xDDzB5wueWeEYzB5vxIjduwSCjrST2nG5glNdfAni0Hayn5Fhco8OneAZSe3rEWMmQ0Pf21yoe+62u5c1NX3SfYEm570WCHEdNZGY32eGijnPbTmIjlm6Rb0Uhmrt3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566311; c=relaxed/simple;
	bh=UMi/tnUMgAT3DzRK+hEltdTrO+sX46dk/cr/ycv2+rY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aMPOqLI4gFBRLZNQrJuAU48Sa9nIuPSxQmiOePAZ3lcUrMkDjkzwz+pCF9gbIFMTmnz7qOROpsJE74yWBY22bShLzRLn4mBWM3viPeCq9TalgTtuvz5JHDdW6PcNPUZ63uvZJf3tO73K4wpzbrLw3HYe8/AXhRlckP/0QaQAxhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HcXugBjX; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HcXugBjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UofTfoF5ofrimKP9co8Id9FxNeCAthcS0wp5MJeRo4mrcEce2RPBhZ20zvWARPK6terH3FJPSoXJSSggB1H2KI2yZspr3Ob8f6sIkX/MJmEDYtcaoZGWSINqtdKDMvKmn+AvLXWDsaDiVRL46r/P5RKxeFbRokFu9dIw4G6TTFkrRzSyVGttKHtSVztjY7WpMuzFk9kyRTUzvF/V1OKdO8k2qHSa7t6xWbBSmseHxFF+0U7H7A9+DgjcKoY7QKjoGKlreNqvsuKjnCfVhFw/iQwJFFhoiWd2b4uWV2et97AdLxbi2/pu4NINfzX34GI9z09EZ31KjHnPpfcfCh9DNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRWGg7BAtq3FjqYvqaQlU+xpxpI+gDfMy5p9hZZPFDg=;
 b=X0Y0bq3rSMjqpyY2Tg1XgOjh3Yqd14l8t2H7Nn9zIdh0NcWS0h0rS3Fos18aF23dr++IyHVj46ZpSlD8GzdakgiE0wmNuifU06jifHl0HKTfM13QJ1IBVJsfmvTP6Rg5VUuF/t0BdMBTWOHdTBMQg+FGaF1t96dOsXJ9takxAdh5k9VpH2t+fcYqdPirvyIaVLgd7LD/oXoDw+aku721QxYHdssNysdy8ltKjiOkFO/s0qalsLxYtB5OgC8ef/BdP3K021bMq6xFpbVZXAFe1II7d4wMWdqFSXiZ8udhXmY4003XTVDa86hzKUnPSoQE+Gxeq0XIWtVqA3SYECFmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRWGg7BAtq3FjqYvqaQlU+xpxpI+gDfMy5p9hZZPFDg=;
 b=HcXugBjX8N1MLaY3WkuEJtFQQjg7r87RXHD9lo59c7uLBqWTOQLtc5DBuo1c12cryJyD8aHIM1fRI4MqkMMpw5bricFSSBCke2n46WRRiKHKAk+gaEFVwv3+l1g7VIZsKrK9KF0p/DN2iGPYgM/8l9rxLB40VBZEHsrEwHaxnLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9596.jpnprd01.prod.outlook.com (2603:1096:604:1d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 23:05:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9745.023; Thu, 26 Mar 2026
 23:05:05 +0000
Message-ID: <87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for all users
In-Reply-To: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 23:05:04 +0000
X-ClientProxiedBy: OS0P286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::22) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b74355-999b-45f5-73b2-08de8b8c1e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0nSSABbk5j/uMbs5meJI/jL8y1KyxuLPRAfVeLvgFTJ251xN+fni/NCv8G4jik187WBxePOghTToQGjGUXSVwvXuGV//ZZ3ZysNbJm2t62qBmZJyYswpaRpMsaHBe/hKYPMIDGo9lrHUZrnZeRdOVdBySAsck+xSGVCAs3MHhcHIJfVuusi8Z6EFsfSnRnLD0a1Nkiz0hZRWoTTZUNEQcNftWmQjfvYjP6mzfICuQc7AJyWmx477kpI4dcrQEWvPn15XH0VDLrlQ7s+97CiPDubPSGJOS+ZokllXewHsZxs0t6WOw/NmcTI/ui243yYiuFsm8hxKkqlROIgqowKH7DjdeCnuo9FTIa2Dsomb82JWEJQe3JDqgp6eRdoCNTGCnjrMvh8SuC3gfS5gnbZOyn/73vVatbpt5hrfyHFzOm6wMeOsryoTvWU9v22hZEdHzJwUqrH8PEadIQ7zH4f8Qw8gAwFFuVYh0MmG/Mgl/9a0EeSivN5WDO+0U29vWLktCJeVbgeyq8mK2NUxw53Yoz0f5qk6i8oSpsXOICWXlixSQDP/WuYTicVjLjy+e992Hzhu6l+5LZ9zwF16OShIpGOJUw6CFeJCfXXb6jew4+EgBVHCTk0vYz1WgIiD+2lOq+yiQZ7fNU88Fkpf5ukS8Gwboon7GPKco1e4KSY9HNcNhd1wtbY62zB5Vs+EevuUg+dmYyF/AP/Kl+yUWUe6PqTDcAP3zNk2ssFpQ/1TfVX4VC351Vvy+oa7f3GAzzDqXLMx+ERl8ExRM+Txo0xo6qAIObqfvV/IrB30B5bAkqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?4UqP4nrAsFytMMGlbviRdvFR1Vj9FwWgG0W3TwzW4JEGLQ7g3mOAo2jXyp?=
 =?iso-8859-2?Q?PTJq7eJUN8seuDbCGoui0h2jU/zLIu8I5aSAx02RQZhyL4doo+CP1jxmDU?=
 =?iso-8859-2?Q?YSrRtSc2hg8ze5mlkfqq2EtG+OZ0Zf/389YTJGZpPA02CpKXFlsvVxTdxa?=
 =?iso-8859-2?Q?yJ+iUAtEkMiv9tgnCfr2ckmggk0uOJp04DDe8teJV+Nh+z+EvgEJiSknBL?=
 =?iso-8859-2?Q?FitEcCSNlLYLpILzRVs4SxSBm45BvPxZbJPznd6LyuSK39H8C/D9yeaBE+?=
 =?iso-8859-2?Q?CYVhFn/OvWusKAyLCgstEpG3hk1zK0tLyp8CjLU9q+y7IKfgstW0lKdUXB?=
 =?iso-8859-2?Q?VEjP/VzBqz5gKongrvSGgtMgmL6nDI9mw4t1VCBOI7JvVzOe0NkGjcPPjT?=
 =?iso-8859-2?Q?rzTeE8Eg83ZX9cNqn/UesgTuJopx8cbF1wgOcrgQFqpvHPNNKH9d7VeFKI?=
 =?iso-8859-2?Q?sdIQmfPzb8V0PgbUNnHNLInR6UWSHCT672dMori3b46c5zO1Z47GIITvc/?=
 =?iso-8859-2?Q?36glXDIKQ4N/RAB3Rvj8sxV67lXsPD/qVN3m6z3Soz0oxYDw7txYGJS0Ek?=
 =?iso-8859-2?Q?tecMMJoDAWiCur2Ee1PRM0coSg3XDKwJyZhwSLR0TyPQMimeNG17IPwoMy?=
 =?iso-8859-2?Q?L7tcOQPGv4DESqMo0Xy6VvbsPSFqurwivXaBlSbikoqXdnNCsQJ6R2LNcc?=
 =?iso-8859-2?Q?ErJpymJHHbFj5l/2DEEwNTHbpqWMTQpDicjI1IaFH+WDr6jaECqBuZeAdc?=
 =?iso-8859-2?Q?qyfx2cBp40lFF3uAsuNBqSk1VQ7eWipJR52joBg0Q/2+H1qqyQOUdRV6jy?=
 =?iso-8859-2?Q?17mFU3kuHJE7IuqCKdk4cBIqPuMy7qxRyCR4AR6S8Bn1lJybPDK/vDXwMm?=
 =?iso-8859-2?Q?EYYIhJ48kH11I2Xg644v92yiXadumFcoy7CMmFaC7GgoNhCPuOX+0kEC2I?=
 =?iso-8859-2?Q?uVinkEqfWBdV3CtVg/g8aVeiUjFd6ajvvBUfnGrC4lixJehEoj1ZDQl40f?=
 =?iso-8859-2?Q?61YNt71QxrZfEUFVhO2iYjUpvWD7TQH2EZSkilkNSpuOXPFSHhY2vp0ATM?=
 =?iso-8859-2?Q?BD8u7++U31lXxygM589ai0x0gbO1DSASzeLpwEQQjhb3iPjzC2FRD1WhwI?=
 =?iso-8859-2?Q?Iy3X1eI+wvU5vxePU94QbnU49pDMCqN931l5gxf9wWcrvdSnMBbgn2tCCh?=
 =?iso-8859-2?Q?w72DVn0ZgQEwkQLzTOpShIDgHF9KmV5es96lu0ykOCnMlk0bfDidCejOqG?=
 =?iso-8859-2?Q?HQWrKg9nvA3uy1+ajfqQ5v04ccH9LjiXiN4DS5O21lxfsJuLEs6ZWDNsiP?=
 =?iso-8859-2?Q?nIF8Rs2qo01QQsSL5azALqKzTqgbE40/1faUcis8xXQcSdZ7PaXYsFbA+7?=
 =?iso-8859-2?Q?8lz5fT/JQvFp96hB4NHWBNFZhxnNQ77C7CvaQh0JRBoMyIoPJnlvGu2ppq?=
 =?iso-8859-2?Q?R1+tBZHak6KcnvnviJeDfFv2SCZdKhbHy7LsIaRtozbcUxNEIwnSBbr5Hj?=
 =?iso-8859-2?Q?hLifJRad+b8EJK9Ooj6GU3PCZCX9dLRGdhYMU+gK0r/fofnvJOwtXMCTdP?=
 =?iso-8859-2?Q?Qj1Ck4n9nUDA7I0yfvNmR/S6t18p+sF0jopFfUhQMq4whp22taIov0AKlS?=
 =?iso-8859-2?Q?t2scLE4MP/NaW13cV7WXOmgz5J62mJTK6yodCORd1uI2v4gEd1aYlkmtoA?=
 =?iso-8859-2?Q?VhqIi5BubWSeQwn4CfMXM29XjbPz33dIxFqMIH2iWbhdyOgu01+ComdV/i?=
 =?iso-8859-2?Q?e0O7pXQjk56Q2WqZG/5Si+DCgyPOFDTI/9K8ejIAGDVRR7Xwmf0JLtR13Y?=
 =?iso-8859-2?Q?mKZt54HUnAw/VxuKauBQoJTCuOb3P3OnzderzvemQGOi4PvGacin?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b74355-999b-45f5-73b2-08de8b8c1e1f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 23:05:05.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1pGcVY5JtVM3ZJFep0u62G0dRiQa//pIcwarLpNtjTwxaVW+KBLPtKk9SPD6xdvUeMWWEvnBMcafK5cxw8+NLYAF9fcVl4M6rQzdmHBChW2aRUCxon+Swp1gFzsCqRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9596


Hi Cezary, Amadeusz

Sorry to bother you, but this patch needs your Acked-by and/or Tested-by.

> commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> supports complete card rebinding, but it uses unbalanced pair functions
> It added devm_snd_soc_bind_card() (=3D bind), but its inverse function is
> snd_soc_unregister_card() (=3D unregister), and it adds new
> devm_snd_soc_register_deferrable_card() (=3D register), but it doesn't ha=
ve
> inverse function (=3D merged with above inverse of bind function).
>=20
> This feature is mainly used on Intel driver, but all driver can use it.
> Let's use it on all drivers.
>=20
> bin/unbind functions are soc-core.c local, so let's rename it.
> It added new rebind function.
> 	snd_soc_bind_card()	-> soc_card_bind()
> 	snd_soc_unbind_card()	-> soc_card_unbind()
> 	snd_soc_rebind_card()	-> soc_card_rebind()
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> This patch needs Tested-by from
> 	Cezary Rojewski <cezary.rojewski@intel.com>
> 	Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,
>=20
> v2 -> v3
> 	- separate bind/unbind/rebind and unbind list handling
> 	- tidyup git-log and Subject
>=20
> v1 -> v2
> 	- tidyup handling of client_mutex
>=20
>  include/sound/soc.h    |  6 +++--
>  sound/soc/soc-card.c   |  4 +--
>  sound/soc/soc-core.c   | 61 ++++++++----------------------------------
>  sound/soc/soc-devres.c |  7 -----
>  4 files changed, 17 insertions(+), 61 deletions(-)
>=20
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index a30f95ff7d86d..a14bfebcb55dc 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -425,7 +425,10 @@ struct snd_soc_jack_pin;
>  int snd_soc_register_card(struct snd_soc_card *card);
>  void snd_soc_unregister_card(struct snd_soc_card *card);
>  int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *=
card);
> -int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd=
_soc_card *card);
> +
> +/* REMOVE ME */
> +#define devm_snd_soc_register_deferrable_card	devm_snd_soc_register_card
> +
>  #ifdef CONFIG_PM_SLEEP
>  int snd_soc_suspend(struct device *dev);
>  int snd_soc_resume(struct device *dev);
> @@ -1088,7 +1091,6 @@ struct snd_soc_card {
>  	unsigned int fully_routed:1;
>  	unsigned int probed:1;
>  	unsigned int component_chaining:1;
> -	struct device *devres_dev;
> =20
>  	void *drvdata;
>  };
> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index 235427d690617..04d1c2ec11484 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c
> @@ -151,7 +151,7 @@ int snd_soc_card_probe(struct snd_soc_card *card)
>  		 * about "late_probe".
>  		 *
>  		 * see
> -		 *	snd_soc_bind_card()
> +		 *	soc_card_bind()
>  		 *	snd_soc_card_late_probe()
>  		 */
>  		card->probed =3D 1;
> @@ -176,7 +176,7 @@ int snd_soc_card_late_probe(struct snd_soc_card *card=
)
>  	 * for all cases.
>  	 *
>  	 * see
> -	 *	snd_soc_bind_card()
> +	 *	soc_card_bind()
>  	 *	snd_soc_card_probe()
>  	 */
>  	card->probed =3D 1;
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 1a744ad237c9d..a3862506b9ead 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2144,7 +2144,7 @@ static void soc_cleanup_card_resources(struct snd_s=
oc_card *card)
>  	}
>  }
> =20
> -static void snd_soc_unbind_card(struct snd_soc_card *card)
> +static void soc_card_unbind(struct snd_soc_card *card)
>  {
>  	if (snd_soc_card_is_instantiated(card)) {
>  		card->instantiated =3D false;
> @@ -2154,7 +2154,7 @@ static void snd_soc_unbind_card(struct snd_soc_card=
 *card)
>  	}
>  }
> =20
> -static int snd_soc_bind_card(struct snd_soc_card *card)
> +static int soc_card_bind(struct snd_soc_card *card)
>  {
>  	struct snd_soc_pcm_runtime *rtd;
>  	struct snd_soc_component *component;
> @@ -2313,46 +2313,12 @@ static int snd_soc_bind_card(struct snd_soc_card =
*card)
>  	return ret;
>  }
> =20
> -static void devm_card_bind_release(struct device *dev, void *res)
> +static void soc_card_rebind(struct snd_soc_card *card)
>  {
> -	snd_soc_unregister_card(*(struct snd_soc_card **)res);
> -}
> -
> -static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_car=
d *card)
> -{
> -	struct snd_soc_card **ptr;
> -	int ret;
> -
> -	ptr =3D devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return -ENOMEM;
> -
> -	ret =3D snd_soc_bind_card(card);
> -	if (ret =3D=3D 0 || ret =3D=3D -EPROBE_DEFER) {
> -		*ptr =3D card;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> -
> -	return ret;
> -}
> -
> -static int snd_soc_rebind_card(struct snd_soc_card *card)
> -{
> -	int ret;
> -
> -	if (card->devres_dev) {
> -		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
> -		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
> -	} else {
> -		ret =3D snd_soc_bind_card(card);
> -	}
> +	int ret =3D soc_card_bind(card);
> =20
>  	if (ret !=3D -EPROBE_DEFER)
>  		list_del_init(&card->list);
> -
> -	return ret;
>  }
> =20
>  /* probes a new socdev */
> @@ -2578,15 +2544,9 @@ int snd_soc_register_card(struct snd_soc_card *car=
d)
> =20
>  	guard(mutex)(&client_mutex);
> =20
> -	if (card->devres_dev) {
> -		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
> -		if (ret =3D=3D -EPROBE_DEFER) {
> -			list_add(&card->list, &unbind_card_list);
> -			ret =3D 0;
> -		}
> -	} else {
> -		ret =3D snd_soc_bind_card(card);
> -	}
> +	ret =3D soc_card_bind(card);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		list_add(&card->list, &unbind_card_list);
> =20
>  	return ret;
>  }
> @@ -2602,7 +2562,7 @@ void snd_soc_unregister_card(struct snd_soc_card *c=
ard)
>  {
>  	guard(mutex)(&client_mutex);
> =20
> -	snd_soc_unbind_card(card);
> +	soc_card_unbind(card);
>  	list_del(&card->list);
> =20
>  	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
> @@ -2832,7 +2792,8 @@ static void snd_soc_del_component_unlocked(struct s=
nd_soc_component *component)
> =20
>  	if (card) {
>  		instantiated =3D card->instantiated;
> -		snd_soc_unbind_card(card);
> +
> +		soc_card_unbind(card);
>  		if (instantiated)
>  			list_add(&card->list, &unbind_card_list);
>  	}
> @@ -2907,7 +2868,7 @@ int snd_soc_add_component(struct snd_soc_component =
*component,
>  	list_add(&component->list, &component_list);
> =20
>  	list_for_each_entry_safe(card, c, &unbind_card_list, list)
> -		snd_soc_rebind_card(card);
> +		soc_card_rebind(card);
> =20
>  err_cleanup:
>  	if (ret < 0)
> diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
> index d33f83ec24f27..c6364caabc0ec 100644
> --- a/sound/soc/soc-devres.c
> +++ b/sound/soc/soc-devres.c
> @@ -83,13 +83,6 @@ int devm_snd_soc_register_card(struct device *dev, str=
uct snd_soc_card *card)
>  }
>  EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
> =20
> -int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd=
_soc_card *card)
> -{
> -	card->devres_dev =3D dev;
> -	return snd_soc_register_card(card);
> -}
> -EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
> -
>  #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
> =20
>  static void devm_dmaengine_pcm_release(struct device *dev, void *res)
> --=20
> 2.43.0
>=20
>=20
