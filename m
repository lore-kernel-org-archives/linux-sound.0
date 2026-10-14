Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA573B6C14
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946755; cv=fail; b=sOYcJwoS2H/dixgfLnKkdhkgy+0cPv5FwBQ7/8E2/qyb4YIXqRJUiiPNBPlaXE+Hoytopfe03lDVB+xtRM4xA2ZQ+7DcU5/GLlUR8+Id4d6zCsQHVzAhvLbbLmtaNdIKRpUghQfnv48d8xxpfJRZLiCIASw9yBG8SyZ7mDh7NoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946755; c=relaxed/simple;
	bh=jKGLZFgKB1ITPTq+dID1S0Td3rMuPtXaW+1SqKMq3Wo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=boYKKmbaipBa3LKgFytRByscvSZn1F6xPdgpA/9HHYwQdBQ/wDaVMbjfhSG60NmF4dhyuCWr9AvbCboo60eN7gANiCd5QJF563pqXDFDAYy7gqPrQ7lMEjt6tH7Mn7z5TTmVpnVPZ7jI4c35jECftEOzA1UEbJhyZRXNPcwV4P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=id/AH9Dj; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="id/AH9Dj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFBQcqXsRpXNZLN3Jsq7Kbsjw19gXSKesSl8Z/XxYi+5sLks2WOTIaDEjVYQdBnfmfokVdCTAnAvG8B2s1V+YnsSGfHjvuhbqkU27s8Ok7aEdfbbWviXzNRUjNdIRzfeDVamkqzSlX7s2Coqrxy2qjz5uCmuGBv4WdoVyOZnfPlsRw0QlW3z9wMOGP8Mumcli7s7M9ubjX89YQWCMWro2/leeCAKIa7qOBChbQfgnWpSxghPvQAWOdzx7LM7+eEQ2u5zE3OLIQ8YMO1dwNMK+5Qvq07YC3W8D75Fub0EdZOIWxph3eMlQU1jolJy7T50OpsgvJfNy93Jok729Y1w/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3jt99laHXWgvRwvB2MmQmuwl6yXBxvw0Egd1xCn8EU=;
 b=nCUhhw+SmKn3DwB6PZoNnXn869C64IpuMetB1WxwnDJXIImJ/Tsbv+jYauCbezr9Z0Yp/t+PT8Jva134oTnr+kItPdpk3UErhilvKK1vsyXtAapt9S0/a4wGdhz7m2S9iKJKQ0+Ur6wzDct8xxoUP2dr+HtWWGXWT56ZmeXvb7Bq+NnYxe/iJrfihM+Mq5uPkxNNKUSL0xEvRh8Uaqo2Nea0Sx6XHT2+5E91KFclsGCTWNmgr98PwqvRGjDyGhZ5J38rDeKw10fPgYGNMypgKOTtA4veyqJRYKY72jKJwQqyCwYknsp7UPWJq1jT+8HPtWSmzrAtfi5DZlTxYbs9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3jt99laHXWgvRwvB2MmQmuwl6yXBxvw0Egd1xCn8EU=;
 b=id/AH9Djm5v0znDa0rucc9jWHoJBTmt1puhrIylJODAsDlOtfkYPbeRfEzVyur2ezHTH6VV2AmYqmsfa4SbP8sgZjNlWupX3cJGUdW0d83lPut+GQdJHlxsq79ElGy3cLkhZkITvDSDhDcCkRzowUmYVFaVZQnzoIBp4eT6U5/E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OS9PR01MB15638.jpnprd01.prod.outlook.com
 (2603:1096:604:3bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:12 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:11 +0000
Message-ID: <87ecdtyolc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/13] ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:11 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OS9PR01MB15638:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8353c7-696d-417a-92c5-08df299f1fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	Q9+iZyMHpp1qbPPsJgiCoPE1eoXPI31gx7JyO1NgvXe6QvDmvJPlG+iWOAta/0aNDFQbhsEIYxvaP7Bfn6/pKyiKhtaNuG3olzAROXeKymbIBEXyGRaGs9eF7MNJ8Rykl0GcIAxB3cqi7Lg6bAus7wmLhUbdOZuYs1xAH/KAQOTZI5I038qcalekfFcVeXIVAnbt5O3cXnPXyW59cSGZPdOER1w+yfSd7I8JGsypnfECp5VJDgLRlMHLhNK3poWLYwZG4FBPLJW3Sjsa0cy273V6unJHfrDYYO2G45exhEVGJVVd9sKGXMRuKOOoyoH4jgnb9g73weGxk1sM4OsZjcrKJN8r2UC17nOZ/ovPIkhRQs5tyvjh/4xyUhp2Mm5SnFNE458JiVaKX6gwe1zFWhn/SFDenTOt9/fQpsBYCNUq5k0rZfyiu/1YGmJHdpVLWa0Lgci5CbtVZh27PTyms3g73lP5eOTQ0WHxsbFbnEyHOV2C2rr527NyO7MoZJAtGi5LSyRWBAXbmoCU6x9lbZbncMsZ5eozQ+sc/BviF0n8nCrRKUJh4P+t2l3uJz6b8IHHKy7HVuRLK4F88at0yRiSY+/8+AWM8lXxqHunMPRYvFxyFB95LnGYTt2jVH0YkOokEflzpPAJ7kwMx4Br/chgOUPoBRJb7IgvVoJapMbSsTDEDJcvcZIkjn9jBYKi9e6QitYK6IXpA53xy+mtyV8zF3ml6LDVoPT7ilom2Fo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?NQxuCEBgfoD5DGBaAl0/5n21IEgUdP1lVu6mELBbe85AqDjcVvulYoVAB2?=
 =?iso-8859-2?Q?Xhf/WwifLnTQnmHGhbaIyw1udS6TgaycDeO7QbM/dxqTrf7sgNKuIP+vii?=
 =?iso-8859-2?Q?mhrPKWNTJNXJdazYQp1nqv3SSytEL6LHyiK1oORyq85YvHVmR4dHEQtW61?=
 =?iso-8859-2?Q?YrUQ7kF9BfwNWMtPydHVJplV/uO3fPEkJcnkmvJ1sah/g/p3xT7jHf4w4O?=
 =?iso-8859-2?Q?qmksBiDy9Q/+Y/Zu5x2mYibDMuMkRWgjicvycH37FX4wv5NYgJUEWGSr14?=
 =?iso-8859-2?Q?8/1qePToFlgULCpKxxnS9lWk+SUMCmTbKetqQ45td+8F3p7aFLMqEFVXZE?=
 =?iso-8859-2?Q?LjRvUwtUHreDzc2hHq2akWmhPeV4k3E9gjB49Ku76lfB8In6kQrvphmjS3?=
 =?iso-8859-2?Q?KN0DsQfyVxuhzU0dcjSLf4yVedWAaF7aXQetyLn1ZXhqhn+UMOUDkP8DNn?=
 =?iso-8859-2?Q?Wg4yB7oTj9ryQe9ieAMNvVBEW8rZG9oeFnVhXzsuYZ3l4gwQuTrd5RBMLM?=
 =?iso-8859-2?Q?QafaW/u3Mh0UT6iXuMQhY3Jc1QU2ot76NC7TL3b50VnBhGwlkzMcSljYgQ?=
 =?iso-8859-2?Q?KI6Ho0meevKc6EFFglQ9JT3utdOkfPTzQ6zeequSXczi1T8Fk2SZh/BcBQ?=
 =?iso-8859-2?Q?dpJd3uft76hImMggIDxTglM4ow/Ue2LGMcCYzI4d4fjefy0/QQOeGg1TuS?=
 =?iso-8859-2?Q?nIEukWXdQKaRJwuJrkLKbKl8ERbX5QuuE8eWfLoiF/mv//SLH2XA8DYkI3?=
 =?iso-8859-2?Q?FTMPk+YXcaDlTKTdueavvJIQ+OICQqd/1tgo0Y2DUl8qfd5p8ieoZxbecE?=
 =?iso-8859-2?Q?+1lI/FNbWOYmb97iXR2Tkoh16+zWQ2X3QxTsGcpWBQHCAvbBqQLJtjEI0i?=
 =?iso-8859-2?Q?UpURNzL0Dvm6D0VS0M5Bek2NyWiTjxJDRMhmiPbiXh8VVZ+OQUhplbDzBz?=
 =?iso-8859-2?Q?KxBdp1tfh83nCGMs9roYeH7YqnmLnAI1o/z5V6mhWXd0TwV4a19Vvm+zzI?=
 =?iso-8859-2?Q?TajbyGY79TfdWFDGUFUrYRzNN2hbFHQ1FuC6yoVYQjvE/lXV7B8nTNHJw9?=
 =?iso-8859-2?Q?9DLat5kZm+PCuaR7Mv9b7lM3EPW9YWjelEY5xCmwiWaRbEz4bOVYpbdIxL?=
 =?iso-8859-2?Q?+9D+uebbIv84FpEIkRaAjpH8IhYj8qp7tH9YsK7h5UZHVEvTvuSxH2gGJV?=
 =?iso-8859-2?Q?wP5300GCE44/j7WO7ZUe3Cx/f5ZPLj5cXEgGsYJO5k8+jkHcMP1VCZEuIh?=
 =?iso-8859-2?Q?cCnRuUdA+QEfoyPhDRGF1sXEvLGXf77ch/qNPemLKFTmB3WpZw8s2pp5xM?=
 =?iso-8859-2?Q?hR9cNtQYPCRRgAKktR453CtxjyuwGktb6tiaLjhP8AbtGSx8qXqAdEOES+?=
 =?iso-8859-2?Q?ipgAoFQuzFjOgRldfciguV3FEA8zV1eFD5wuCBhP/wplfLy/I7z/Gn68f3?=
 =?iso-8859-2?Q?Y880gkKToKFr5cfzcFS9yo7LUcWVrTNRaJvNsT1PFQVmsJxCRsBxvuNuxN?=
 =?iso-8859-2?Q?WqwK9a4v4qqcZQk/hJ+bU1rIrBZQXZjPGSgxmNPoS1lalGT9Z5793dBtGX?=
 =?iso-8859-2?Q?iIE1Sr6srhgR+mmOHHSV6chEYbtposCG5KtDXctenps7ogmCAeFjf1gTMI?=
 =?iso-8859-2?Q?Z/TTvSFrrT3lT6+Vce+9eBF0WwfbXl7GGmVeqj374q5shBBa9x0uLlonUe?=
 =?iso-8859-2?Q?YTwjGFS7JPZp102wjFPre4oiUJq4swBnxSBPze8UvueKMGnx7bFOf5tMAV?=
 =?iso-8859-2?Q?nghiN1A1ljmVOmP84gFy9TID2UmLlp1b+bGV/TZuen51Ece/QIQRQSMsCv?=
 =?iso-8859-2?Q?nxaX2jDRNlAsEMhyDrprmoIFDLb/WHK88+U0LlgA+mQ3RDaBwXM6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8353c7-696d-417a-92c5-08df299f1fb2
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:11.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30/ZbfdmbDh1dK37v1zYP7g9lpt0+IkKvrPQW/Upi6jczBpT41F2VlPYA+0t6mF0+LLR/5ii9IA4csTDi3lkYk2V1YoJ8JO56CFcGOsysBmZ0elXWM37Y/aRgL/tCNIe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15638

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_to_dapm() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 11 +----------
 sound/soc/soc-component.c     |  6 ++++++
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8c8141fe9e77b..08cb74001fe32 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -272,16 +272,7 @@ struct snd_soc_component {
 	     snd_soc_dai_to_list(dai) !=3D &(component)->dai_list;		\
 	     dai =3D _dai, _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(_da=
i)->next))
=20
-/**
- * snd_soc_component_to_dapm() - Returns the DAPM context associated with =
a
- *  component
- * @component: The component for which to get the DAPM context
- */
-static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
-	struct snd_soc_component *component)
-{
-	return component->dapm;
-}
+struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
=20
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardw=
are
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 25f50041fad31..ca776b6a7fd0d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -49,6 +49,12 @@ void *snd_soc_component_to_priv(struct snd_soc_component=
 *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
=20
+struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component)
+{
+	return component->dapm;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

