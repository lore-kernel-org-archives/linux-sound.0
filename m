Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2061.outbound.protection.outlook.com [40.107.113.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4347A706
	for <linux-sound@vger.kernel.org>; Sun,  3 Mar 2024 23:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709508141; cv=fail; b=aylqgnuxY2AA785GFX9fJMX1+dptCxJ0rrHxO14i8vjX8PNFhm5rUJ3ocWeonI1aHwCRphGIumJbdfueZNEnygoVfVzx858lzCx7nA9hzJ95J58X5hRcd4mF5hXHvL9NvZ9HYZ5THnDv7SHkOh+14hyhyGNnxKM6U65uICDu/q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709508141; c=relaxed/simple;
	bh=yGG0tfLRyJhBa+2d1A++ZIRSP3Y3G9Xec+Ex5ype/5c=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MjAWG9DYnPSD8pKQrZMgjJdoF6PBiIjUY2veYb7YgxAEjtR/HKT1WCWqDupWFh3C9TDpqYardg9JKgwzf6NDEFtk5W+vlh1B0akkOXCq4BStW7RtsH2WZaxlfOP7lTbQFlrGvhuniHxtBOS+SZEbw+JFIu99BJXFjuMM5WNhzIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DlYB0HWC; arc=fail smtp.client-ip=40.107.113.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DlYB0HWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA8l2g5AMSp8wEcycb4j/d0aY7Up0QXOujQY10jpocDoQT4KTiSsaVPYYftOL0FM0EEZWWYxZrTH/NqA6uXvxh4q7nmgMjgtyQYAmx2F/rvh6efztnZtqDPG5IkYSHOl1CDeYy9WK6y+5V10HOUkTaArzIPTsKKDAvvqhWW/5TkR7U4bdMDNnuS70xqJRZZitAao5lWLpYmxMVKu7ByIWnCTurHZ8At7wPxGIEetP9NkEPBegcqpXEaYFW8ZELMzo7EkAWAc4xQyfEIJX42fdfnJTs9LB63pjleQp83e+ZxWg1rAeix+JXL37sM5G07vqaQvhPNb3q8yXS1aT+aARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l3IqeOz+7Qh7cDD5yx0iqJ0lzCvqrrkbUXdX2oOOGU=;
 b=FaUz8Uq9hdUdKYmRs4fv6bq3aho2e1EDFa3BRjNBBBUsBUgb2FiXO3OSAGA6G6kDbfAV7W+zTR2r7L8UtA1gi6QfZgKvQFxjX2Clfo/gr7hFLOwh17yzqVkaQ17E2XQHQ1SqBV8okK+0fPEJQljZdPewV6ZvnFw/Yyu6niIcUgj2txTgxwowkxvNCUrHuHRB8N9LXulx18Hzem9uHjAX2ubdn9ZsHwzAGdrADsQuQuqQmEvUliAQTW2G5igOWNFdPiInyrHmArek6ltSs0EU5OU7BdjsFZDIzlfU9lPd7uD8XdOY+2jWAdxICvuIFQJE1ASi/Vhh1xkYUVhI2JcDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l3IqeOz+7Qh7cDD5yx0iqJ0lzCvqrrkbUXdX2oOOGU=;
 b=DlYB0HWC734j8zGtoYOw9zgHUXT5DOw+kuYNPwDk4ON5ncbawtUvaDyR7OqK6Er33gNTv4CM44evhOV7OmXjF3VQeFn7YAMVX23CLegrAtfLmzCwD03w40Sg0ps94dL+Iddd5w1hf5/vZtwaStqbuy9zESwHM2tRTpZImOG+A78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10884.jpnprd01.prod.outlook.com
 (2603:1096:400:2a8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Sun, 3 Mar
 2024 23:22:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7339.035; Sun, 3 Mar 2024
 23:22:09 +0000
Message-ID: <87v862hpeu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Wolfram Sang
	<wsa+renesas@sang-engineering.com>,
	Takashi Iwai <tiwai@suse.com>,
	Liam
 Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav
 Kysela <perex@perex.cz>,
	<linux-sound@vger.kernel.org>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
	Charles Keepax
	<ckeepax@opensource.cirrus.com>,
	Vincenzo De Michele
	<vincenzo.michele@davinci.de>,
	Dean Jenkins <dean.jenkins@siemens.com>,
	Eugeniu Rosca <eugeniu.rosca@bosch.com>,
	Andreas
 Pape <Andreas.Pape4@bosch.com>,
	Yeswanth Rayapati
	<yeswanth.rayapati@in.bosch.com>
Subject: Re: [PATCH v2] ASoC: rcar: adg: correct TIMSEL setting for SSI9
In-Reply-To: <20240301085003.3057-1-erosca@de.adit-jv.com>
References: <20240301085003.3057-1-erosca@de.adit-jv.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: quoted-printable
Date: Sun, 3 Mar 2024 23:22:09 +0000
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10884:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d17fb6-c785-45d2-cf13-08dc3bd8bfb2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzPaS7H3Y2e7HeX1q1m7FZRYlp7Q5SnLqNpCydc2GGU+RlY15KcIfqNI0+JNKGlVxMk9WFVQamIQCUZi2ftakERC1C1X/qPItA1BlL66R3ymUSCn8QMe8kanJEtRxKp2lom10cYCqABVgo38u5QKZZPp3MbaUx5MFgWYvOfrg+LYtzl7f30wE5lfI9tV13yEJOsgHXzKRXp1lxtqhBgfKx81lvuHqBEUpuOIOjiLtYJuV2ko/WU7ZlBQ7X32AiNDkJL/5C5TUvwFmIoifabse+SsfMxZuamjsEzdaIjE3mYnkmh9SAswtA7pg5aIYi7kmvfa2GOanomK51V2/DsbJ2BitOKAbB4rFnWZkWchzq8+IOEZz5sXgnlGS4imDwElAxMHzAlDigXwd2fIHpFN7ivVx6/wNhXUSAMRWYWPmJ+NLnypNO9KLjZIusfUhIEJ/OMA74pvs3aswuKtTM99+A1jlxRS78alSUkfvGtkQSCpkEgqyWgvG2s/mullAq64wL/Ruk7qj6Ejy6m4ydMBii3J9uGE5ijTwhE1ysrp0Hk9gD0+tNraSHDpLxjZw7ZW1OqOt8z/JKcqw3nSV0GWd9fwNpo7XROiF9H206lAR+kUlnfJVO8p8DjE8BzPLV499inenkZrwKwcufbnfcaVOTUd8FIJF7zbZ60J2/+xuf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-7?Q?xTrsRkGD7abcy9XdG2A67G1FLybag+vprInzeem2ZGsbyPhP+J0irxHu/W?=
 =?iso-8859-7?Q?8GYiWp7v/8FhH4kz7WJA8R0vFfpn3Oa3x8zrzi+8iu8oTchzwzvfEOXhhW?=
 =?iso-8859-7?Q?sdJHP1mom6uCbTuShyKBQKwTQxeeA/IvND9UoCZuEyvE/AECB7tBMCoASM?=
 =?iso-8859-7?Q?KSw6jmdHtRWiMBJcwj4HpzPKQZMghPRFr0X25tz41tynIZKQMgM90N4SAh?=
 =?iso-8859-7?Q?Ft9tIYOj99h48dGTE7+P2MDtpm4XFgK4a82CaIfq2hVBmt39veqPuf0CsU?=
 =?iso-8859-7?Q?SfihUX4q9k/Tt/5tdRWVI1ndQzgZzAVsypQYtW2m8qNk5q/UAHcRDmD1iy?=
 =?iso-8859-7?Q?8AHDMHHNZ5OMU84bSLBHjfuQ8/3ioOki6bOTNMf4YOJaOXr3R+2OXzr5Pw?=
 =?iso-8859-7?Q?qi7Ag/Hb7ETd123uckZjUuu1pnZDI0hkoMpYi/X88gLKs9vHFvWL9yP1CE?=
 =?iso-8859-7?Q?SiBKpxxOsrQJXawkYdIHEicHpVD9WAXZqv/GJL83zMKd0Sn9G6N9Smere7?=
 =?iso-8859-7?Q?f+zGXXUDNg6TDgTM7wINAIEetUctxYTXy9Hd5kk7PyN+I7NtmpgUZbJi6W?=
 =?iso-8859-7?Q?Fi2p+UsNJjkjX+PDf0UHOStTALJmXFh6NdkGrncstowo2fzQhYzTFTMV8J?=
 =?iso-8859-7?Q?JtnU68M+FCdAg+Pn1L6JUJ4DFzoXu7PRTyrePDRyRxdvAHVkV39/yZLNZR?=
 =?iso-8859-7?Q?eMPXY/2mzGavF0aQU+SmIBEki3dUzpunlvkWVLbOkYAvK1f5c/8Movmt46?=
 =?iso-8859-7?Q?V5jLJbKeqlDk8m3J9XtLGKdKfHfhCGjzVD1G9cU0qqQ/E8Elm9F29qUB0s?=
 =?iso-8859-7?Q?avP7CV4zaBBqlERdyJyQINmVzzZLqHOtrjYUrRyAldjmH8GT3CziPvpj/5?=
 =?iso-8859-7?Q?UDjNKl9nYd1SMIWQ7H80mN65EyVi9y/twcTKrhWrDW/SBEydpgQX9fEpO8?=
 =?iso-8859-7?Q?DWe4U4/ZvLhgyFLh6ZGc+h0qISGovDkM6k15FSoitghDeqWusO+UMk6tKn?=
 =?iso-8859-7?Q?k8eoF7rZ2qhCsComb6G0kfhDm7hOgj2y2IPjGuLydxhnIMz9O58v1U567/?=
 =?iso-8859-7?Q?hjMCPGUUf0dYFKLcxpiSDi5P+Z5DuUqrO2A85pAjSsfTP8Rqpx/6pStwgN?=
 =?iso-8859-7?Q?LVolfeI6GcOhmVziKD+rL3il3RKo9W2x7qqRQlH6RjE9WmvHNFKWGnXio3?=
 =?iso-8859-7?Q?PC+iF5YKct1P3dG1cNdSV5e4wIctyhgIMczNp1LRUpYtKFlsUAoQ0SJLhO?=
 =?iso-8859-7?Q?5qKKoJNl6r3WvywCxaeMnbwPB2humqkcZJhE6CG1qyFtHev0nscrU/uHdd?=
 =?iso-8859-7?Q?n1XP4bxSpL6sS7XnWGluI/0K/r+ED41sW+9ngsuJ2vxHMrMn7/6T5l9wUk?=
 =?iso-8859-7?Q?KeK62PwBIXnhBCgpO6nbAebFZkTbUzAyvEGr0yAR+7ffMV/YlRZuAdApjQ?=
 =?iso-8859-7?Q?SN3oRlQU2zHNn9WiXQ1kDeayOZESr2IUKxOEiai6TwhS56fqrJKvl04p8Q?=
 =?iso-8859-7?Q?R9qJfFZ1HrC6TM58/Q2XjnGy/FS6uTZbf2z0i6EyBH4Jyp9J/H7cqFzerK?=
 =?iso-8859-7?Q?Ybh753g2TNc7UjQXncJUA51jbZsnmnyX57NPSq1vRanLrWWI0/3t5vL3bp?=
 =?iso-8859-7?Q?RrZLzXqjv8bfhCIAPlpvNmkE3SLCbq4vKbWxbI2tSC796NPHrobrdotXmg?=
 =?iso-8859-7?Q?KSXk81FonWRYv5DgmGc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d17fb6-c785-45d2-cf13-08dc3bd8bfb2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 23:22:09.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLORWSn/xBqhg4REyBNYFg76bIR3vyNKVVpRwdU6zucGTY7vbCSi9zXRjGXcWPwIZ5w91LSoOumn9dyNPsancbzxaxbrDm8HUTyMQaetRYSQURrBVQjIrpXDLlqVvVDb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10884


Hi Eugeniu

> Timing select registers for SRC and CMD are by default
> referring to the corresponding SSI word select.
> The calculation rule from HW spec skips SSI8, which has
> no clock connection.
>=20
> From section 43.2.18 CMD Output Timing Select Register (CMDOUT_TIMSEL),
> of R-Car Series, 3rd Generation Hardware User=A2s Manual Rev.2.20:
>=20
> CMD0_OUT_DIVCLK_	Output Timing
> SEL [4:0]		Signal Select
> B'0 0110: 		ssi_ws0
> B'0 0111: 		ssi_ws1
> B'0 1000: 		ssi_ws2
> B'0 1001: 		ssi_ws3
> B'0 1010: 		ssi_ws4
> B'0 1011: 		ssi_ws5
> B'0 1100: 		ssi_ws6
> B'0 1101: 		ssi_ws7
> 	<GAP>
> B'0 1110: 		ssi_ws9
> B'0 1111: 		Setting prohibited
>=20
> Fix the erroneous prohibited setting of timsel value 1111 (0xf) for SSI9
> by using timsel value 1110 (0xe) instead. This is possible because SSI8
> is not connected as shown by <GAP> in the table above.
>=20
> [21.695055] rcar_sound ec500000.sound: b adg[0]-CMDOUT_TIMSEL (32):00000f=
00/00000f1f
>=20
> Correct the timsel assignment.
>=20
> Fixes: 629509c5bc478c ("ASoC: rsnd: add Gen2 SRC and DMAEngine support")
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Andreas Pape <Andreas.Pape4@bosch.com>
> Signed-off-by: Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
> Tested-by: Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
> [erosca: massage commit description]
> Signed-off-by: Eugeniu Rosca <eugeniu.rosca@bosch.com>
> ---
>=20
> Changes v1->v2:
>  - Link v1: https://lore.kernel.org/linux-sound/20240223163502.11619-1-er=
osca@de.adit-jv.com/
>  - Employed the proposal from Morimoto-san
>  - Kept in mind below mapping/calculation rule:
>=20
> 	W/o pinsharing
> 	SSI0 -> base+0
> 	SSI1 -> base+1
> 	SSI2 -> base+2
> 	SSI3 -> base+3
> 	SSI4 -> base+4
> 	SSI5 -> base+5
> 	SSI6 -> base+6
> 	SSI7 -> base+7
> 	SSI8 ->
> 	SSI9 -> base+8 =3D
> 	--> "SSI8 not connected, so SSI9 uses '8' "
>=20
> 	W/ pinsharing (0,1,2,9 can be combined, 3,4 can be combined, 7,8 can be =
combined)
> 	SSI0 -> base+0
> 	SSI1 -> base+0
> 	SSI2 -> base+0
> 	SSI3 -> base+3
> 	SSI4 -> base+3
> 	SSI5 -> base+5
> 	SSI6 -> base+6
> 	SSI7 -> base+7
> 	SSI8 -> base+7
> 	SSI9 -> base+0
>=20
>  sound/soc/sh/rcar/adg.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
> index 230c48648af359..afd69c6eb6544c 100644
> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -111,6 +111,13 @@ static u32 rsnd_adg_ssi_ws_timing_gen2(struct rsnd_d=
ai_stream *io)
>  			ws =3D 7;
>  			break;
>  		}
> +	} else {
> +		/*
> +		 * SSI8 is not connected to ADG.
> +		 * Thus SSI9 is using ws =3D 8
> +		 */
> +		if (id =3D=3D 9)
> +			ws =3D 8;
>  	}
> =20
>  	return (0x6 + ws) << 8;
> --=20
> 2.43.2
>=20

Looks good to me ! Thanks

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
