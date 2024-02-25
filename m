Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2042.outbound.protection.outlook.com [40.107.114.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59B763CF
	for <linux-sound@vger.kernel.org>; Sun, 25 Feb 2024 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708903283; cv=fail; b=IGbKnZRPRSKMV2vU5sIFj8PYiyvf+EbVqyl5nOb8K0OFqYcxJ4q84yaV4JBi62lfLiZRa3R/3aIykJDILT7zD+rcFgSNhdd9Ye72Jmu6VqupzG8nRJZJDCLuNrRkL9DRVyTFN6qcztirk6IjwftxWv1yc9tzAeHdfvMHa62lZbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708903283; c=relaxed/simple;
	bh=IItzQVy0ZSPcr6FKGN2cRJ3wz3i1ztxCZ7dGxuchO4E=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PStvIGoP9jigoW8jRsEHGgdT1Lr+D3MqaI0ibCP4ccU8yKUJ6qgr+B2lOsUAx2Wuk+Qk4VtJE2vjXly3uqcvIyTarPPFbten2UgUJGH+hiuXgtGzUEY9qygSjL/vQQLYWyJ+TJqsQMxxUM4cFoYWDrl2NR6bKZ0mOUKadSa5Q6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U+VsFGc0; arc=fail smtp.client-ip=40.107.114.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U+VsFGc0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gtre7QhgLUrCr6an2WcOOa27Fz8kXqKNc1Ui+eSNBBUVivMxSFkVxSsmfGFV2zvO3vMaDkdGrUd0Dhn1zi9n++40BPPAhQz+0mqOBGyViM5RtBBvMhWgwFsVnhP8fs8t7RiNC4ib9HnBY9pD3ai2rCT4zPqm35haUEtYQu2p1fWnoWNDFOg2GSeo0bWRM8uW99iW8kEhok8JGXFK9sSqhrtVKZwM11kJvcgWV2RWUy3bJLaKIVnSmOBoHt1r3l9wqltXuiBmlbFm/sJNDLRmuL4nPmfWYaoyWLWlRihEDBJEvuPC4jay429/mY5qY/dguLQVCcU6VfEEvrr26owGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPECB9Cq4XB3uoT4oFKG5WfHkua0W3AVpxxd5yIk0go=;
 b=ltQJqMY61WXd+bL9cepZKlNLcTMeWCh/umvGnSlJi9Y1nEGe6WNqcYiUxUtOKhmRTE9SqMaAPkI3qx+f8spjuQA40d4vh17lHuC73JQkQRnhTVhUF9w7HNdYLaePgXkQpLB4IhGgFna3UZmTcBsD7Mec0A3CEYqJI7p/QBCJmdeUcc2mD+O9pYCN+XgBgSIBf6i/MaURkA0x4EJr2LzBIB3F2bu695QzeVS3JY6W+bhLi8pmKH8bZlU9cu1wrjsZhQT1UxejEycWS9obHXzlZCM4ASn9j9TSI07s+6UoatT0v/x6Nxl1RA0mAwJAots+JKyPXwe2hBehXVzR6WVgiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPECB9Cq4XB3uoT4oFKG5WfHkua0W3AVpxxd5yIk0go=;
 b=U+VsFGc0/j+mGO6GBfW8odDg6U2+QH3cWXKSUDMTKEkluiQZ4aAQE0qCaMAVAIom4r1NaPa6PeNXbQeLAescBymUps937mFrepfPch7ENlV6heH4jLmMnUFqI89VcfoOp4S+tSOelcNPaZkBzG6VjLi+tKPwV2CSd6HDhdyJtrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8691.jpnprd01.prod.outlook.com
 (2603:1096:400:18f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Sun, 25 Feb
 2024 23:21:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7316.018; Sun, 25 Feb 2024
 23:21:16 +0000
Message-ID: <874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
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
	Eugeniu Rosca
	<eugeniu.rosca@bosch.com>,
	Andreas Pape <Andreas.Pape4@bosch.com>,
	Yeswanth
 Rayapati <yeswanth.rayapati@in.bosch.com>
Subject: Re: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
In-Reply-To: <20240223163502.11619-1-erosca@de.adit-jv.com>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 25 Feb 2024 23:21:16 +0000
X-ClientProxiedBy: TYCP301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: f7385a91-5c39-40d4-d9a5-08dc36587725
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTos3BZUYqd9n/AkOuY1AHEJrnxWVr+knsMKxR6U9jab+Kp0NcyawSg3MTOK/tpMKpuPO/TC3L5Jf2DCrHFJ7EkP6PlpseOYe4hmK1ERkFKucGtMo+LpQk/Jv9C/VARsEgW0fQvYPq5jFpOQOuOKdh3WFITY3CwHqqquvtx2nXc+3vjRxS22AtZQAbLt/jCDpQhLYTgA5LuRbxhvXWPgusFgm1ovVrS1nlRUpchKePa0oCskNK/P3kA7E0LJrhDczy+XRUteXCraKg7CO/0w5kMyWE1vLEkn6gUo/Y8U/k6Z6JpsnCx7NbFIFElDVcL2IzHnEx09MmmU99VpiDuIxgmgbvMW/Icw7OJo3UyKvXpeBhJdEyuuT+ZaEckdvpHerNonJIlNHR2RsRKBmLlV4epIEEXo4Wusu7hAnwWZiVqx0yCSlJXKEX7a5a4z6D+XYW+DgGO31i7GnxCsywVLUj1NXOzshxJyPxDhbDcUb8Sa59PWI2HN3m/4CtPIJHjvrMGz6TTMmzNucMplB8d0EW8D2qGgsvtI1aEpVSSESyeVdROZa9JxHiuuAWjPMHOE4jA5bEPS99j3187ca+iAVRXk/9WDP5ViVMHJ0IBnIKYg0BR0C7aYPDXCVfb1HtFERzxN9ZS8iH1zE9mZVWPTU/l61HFX873few77zagVyJbJfvS/Mm5OgDH8kiVltuTLr9d+2ddI1Dma9JPPhfZkGjHzxcIGDMYEfvdtzLNI+Jo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LIrLOVdK2aKPZHeQvdme1JVF6l+jhoJpix4Jh5bPQECxTZ/PBNPi0ZDhE5mB?=
 =?us-ascii?Q?hRaD1l3FUxKQscfdpNYmOBnsGoP7xVhjTrNXr0BaaEImS/9O0suefJNOyQ2w?=
 =?us-ascii?Q?Sszyimf9H3/ok3Y+POsSePiewGMRrRBI0Svy1WdPhvmu4ZSJ0bqWrUXEIE1P?=
 =?us-ascii?Q?EXReKtr4e07GgHcVTPCkvDGL+kCQbfTioo10qC3jVbhQg1aW4k8+0+wvPTVq?=
 =?us-ascii?Q?Xc2LQlXtzhMCBy26LSbcQohsaVY5iEtlTNCXmX4ffUUEHlkhSRq8uzcDLMPj?=
 =?us-ascii?Q?rKGBQe+W5AqzgVrhvg1pjudAxnjPXNtELFwatyIqgdywiWEBtsypT070KNIh?=
 =?us-ascii?Q?3+g3uWcQbCRwpORqwhN+ja02Ktk/qNxkGGXuty3J+NgPbyqU9Qf/zRTqpbb9?=
 =?us-ascii?Q?/+AKPG29VmckY/R9mnZmD5ABXyOHnl5KneCNpjmH//Fdao39cDhDt1HoqiSC?=
 =?us-ascii?Q?5GdyQZ+I6LNthFZk9ENG91iwh1I2ITToNAQCQ1UuLnQw3YK/syE+mIVy+QEO?=
 =?us-ascii?Q?PWF7RPwpqvg+yrZj8BDocMfVqVa3wHSzXyUUG/1q4Th/iKcH4tSQW5QpIBCZ?=
 =?us-ascii?Q?vw6o6YA34evkKS6Zmo7w5Lng+JT3weLVSzbchVqlNGdPsrWkvmK7riIdFhNA?=
 =?us-ascii?Q?xiNsSPvBs4lCyMambadiSxrMbsKLKYrcgiTVtYiXjdRM1o3rtuYbkDx7JOHE?=
 =?us-ascii?Q?+46NQI4GrOsmbbFsB1oZHogHa8z+0erWsfxyQhuDSFT1aONr6aFPz9sJbRKQ?=
 =?us-ascii?Q?fy6dh00JPY5zuqfXCyXvQi4CJjjKFRiqlDairauzDSpXFucOpvKJpRXjjBMF?=
 =?us-ascii?Q?ApfpdYeAXq4AHlz7lVSWP5g+fj13G2QCBU0ez4m6glbE+/BYEojE4eE12g8d?=
 =?us-ascii?Q?pNAwC5uzXOzGVJzuPmye7LHo7Xsz4wSFilii3o6nPgOpMsamGc7bxY45xRfE?=
 =?us-ascii?Q?vrOJaiZaNGoXASqoVTacsfzsrNylgIQ2ClIpIaUGw+VGlpsfcnuBR/mJCgbG?=
 =?us-ascii?Q?CGKIHdZePLrQzcR15e3e9YN2faAEZPz8QMeyoBfdNNPK9KP0wzgDgQXU6jgd?=
 =?us-ascii?Q?U41FUPQgM8LFlayN3K7LqD8YkWjT205CTrvQZLbuNXTJO5Ev5tlSF6//xDQ+?=
 =?us-ascii?Q?wxoXi6I84nIQol7b6yJzEh0jLWcQ7Zciv+omevjCyKd8uJz1dRdXNF3T6aQe?=
 =?us-ascii?Q?aXyEPxeBFfTiVbLJDoCWUqlb2g+XQqy97Wy4AnDBdsSHG5FpVhSVuDB2P+3c?=
 =?us-ascii?Q?6oChqjz5oY1dLwVzhUtluFQiDyQ1N3D3xPbWGFWPZFYRqvbtCzZvabo7rL+c?=
 =?us-ascii?Q?kocbSUfWDKpM9hCEf7+0LqNBEm/3KLhCm01auy9VfdDN4D5AheSa+/OHCYU7?=
 =?us-ascii?Q?1aZorcA/Uu4/raSsjopylXaNgG+f7Cv9q0t1m/GFghELsImoQHO9zceoAoPn?=
 =?us-ascii?Q?Zj3maYwiZcLq1MJjhoUl6OahYM2c/BwnLQx3vERUmrZ6EAQWPQ/J1JM1soLa?=
 =?us-ascii?Q?rdIjxQLfulq5n/XdQd8CocvzYTbzJM0Phjq2M6WkM9V+SfLkSkOF7ISNNseB?=
 =?us-ascii?Q?uvkzFl5zXDKsCKClGkdLNPzPBNAatam580PNjEhoTFleCkZ+AUhTd5S8bJCY?=
 =?us-ascii?Q?18PScE+/FSoCGMhapIB0x7A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7385a91-5c39-40d4-d9a5-08dc36587725
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2024 23:21:16.4536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Yck19JR3If/BHfCdreF5kngQx+qFfU9CQYgR9Pl/6k5XFB7xswZotxidhBBR/A1lW9ADM0FRNtqJ778dUdaxdGPoOotZRqbqu7o7mE/A4ZvNKoRqfsoIK5FYDxv11t+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8691


Hi Eugeniu

Thank you for the patch

> Timing select register for SRC and CMD is by default
> referring to the corresponding SSI word select.
> The calculation rule from HW spec skips SSI8, which has
> no clock connection.
> 
> 0110: ssi_ws0
> 0111: ssi_ws1
> 1000: ssi_ws2
> 1001: ssi_ws3
> 1010: ssi_ws4
> 1011: ssi_ws5
> 1100: ssi_ws6
> 1101: ssi_ws7
> <GAP>
> 1110: ssi_ws9
> 1111: Setting prohibited
> 
> The driver does not currently reflect that GAP, leading to
> prohibited timsel value 1111 (0xf) for SSI9:
> 
> [21.695055] rcar_sound ec500000.sound: b adg[0]-CMDOUT_TIMSEL (32):00000f00/00000f1f
> 
> Correct the timsel assignment.
> 
> Fixes: 629509c5bc478c ("ASoC: rsnd: add Gen2 SRC and DMAEngine support")
> Signed-off-by: Andreas Pape <Andreas.Pape4@bosch.com>
> Signed-off-by: Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
> [erosca: minor improvements in commit description]
> Signed-off-by: Eugeniu Rosca <eugeniu.rosca@bosch.com>
> ---
>  sound/soc/sh/rcar/adg.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
> index 230c48648af359..137db9feab495e 100644
> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -95,25 +95,40 @@ static u32 rsnd_adg_ssi_ws_timing_gen2(struct rsnd_dai_stream *io)
>  {
>  	struct rsnd_mod *ssi_mod = rsnd_io_to_mod_ssi(io);
>  	int id = rsnd_mod_id(ssi_mod);
> -	int ws = id;
> +
> +	u8 ssi_ws[] = {
> +		0x6, /* ssi0 */
> +		0x7, /* ssi1 */
> +		0x8, /* ssi2 */
> +		0x9, /* ssi3 */
> +		0xa, /* ssi4 */
> +		0xb, /* ssi5 */
> +		0xc, /* ssi6 */
> +		0xd, /* ssi7 */
> +		0xf, /* INVALID */
> +		0xe, /* ssi9 */
> +	};
>  
>  	if (rsnd_ssi_is_pin_sharing(io)) {
>  		switch (id) {
>  		case 1:
>  		case 2:
>  		case 9:
> -			ws = 0;
> +			id = 0;
>  			break;
>  		case 4:
> -			ws = 3;
> +			id = 3;
>  			break;
>  		case 8:
> -			ws = 7;
> +			id = 7;
>  			break;
>  		}
>  	}
>  
> -	return (0x6 + ws) << 8;
> +	if (id > 9)
> +		return 0xf << 8;
> +	else
> +		return ssi_ws[id] << 8;
>  }

I don't think we want to have table for this purpose.
SSIx special handling exist every where on this IP.

How about below ? It is more simple.

---------------------------------
diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 230c48648af3..bbc7845c68b3 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -113,6 +113,13 @@ static u32 rsnd_adg_ssi_ws_timing_gen2(struct rsnd_dai_stream *io)
 		}
 	}
 
+	/*
+	 * SSI8 is not connected to ADG.
+	 * Thus SSI9 is using 8
+	 */
+	if (id == 9)
+		ws = 8;
+
 	return (0x6 + ws) << 8;
 }
---------------------------------



Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
