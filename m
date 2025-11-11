Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB501B043C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820765; cv=fail; b=omFs27a+pIrgOLARDvy8hHKNuDHpF3ocHHrLUyLSXTQxM275ff3bOZqgDM0FamJYif2328e4PM/1yfKhhNbs7azqNBqNDEV3bubD26u6sbc9AuupFNj6TnlK5mLNtjmZ20QIM75QeDqKf4N5/Cvktx5x2LubPBP2d12i39dh/zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820765; c=relaxed/simple;
	bh=pa3jmVyIdaRAyirk+N9reyAsBQObdO65lA9tTWikawQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sni6hRK3muNpDDwAGGWKxmEW6/+HccfSs8EwcULwVeZ9f8AxB7dTQO6nHU7GuyQkhlvAt+vo+YzKfXJBeU8cp5jF8ow0KgvR8QWwRBxPq4AyiNKbITHxCEV/Cg8jQ3P5JpbEWgtrIl63zmXzZIFvuXWQObQy7EUWGfqNQG2W7bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iZU8ujK0; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iZU8ujK0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9+67gwyAxJjCmgrm0Ojlbe6wRPD4ciM7q01YnxBNMCHgZ35DXo7fNr70gYo0IN2MfSRnowUjtXMQd7pMRgZtDrEF11IXpORMY+rM+HaIopdj6DGELwL5xpcB+jqEg2aCa6h/u9xR5eVyVm/LcyhWHs4kXlerwkFJbHdbIf/gxsvxNBZz25tPKraaBms+uhob9J/qX5xMPTnWY1zbiFvjdXi9rhWurLrAn+JYLx/+JvHHawnmY9YtxxlFf6c+IJSAJxAYY+l57ClQdrlfz578mOXGmccn1oL5yUAEoC4t7GWh4U7W8m1RdlUfuRJhGti5cZH6A0i2AzQIzL4NUkjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD7WFZkFm/1MdQwbpMWSbq59w7RY8zRbU8TOdK4snjA=;
 b=tRk487outu+JE227kg2yWrcS3qZK2XizfHuXSdFyK5QE1e6xCR8JZY55ZBU23NniA13QDo/ZVOcMYje03gshkrEq9NhuwLdu53t+L6YMVFRNTjzGnJkQAeMIaal/aenXJxkVG2IdIhqttovOP1dSVldi8bs0uEI4u7SJnkS3umllWsRQJR4TT/wyfWAKJgEazWn1TneCMuRRZVqTvrg/XzwikN+U/2Q6TYNXShVboiLpE9LAuJUMpDmlcQvj6kDwO+r7jiHMAYNz9+IHXFyRXg9ySd7T3zxXRfIhz+6IKO7CtFulPqK541KlJ0DkEdo6fUFuVYTjQdgq0im3X6D9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD7WFZkFm/1MdQwbpMWSbq59w7RY8zRbU8TOdK4snjA=;
 b=iZU8ujK01k4Lk9SDARx2rNii8VMsjpG3zUDwe8n3lBFDbhnc0MCdcc5cPCOFDsvac6HEDA/3oxuFKWJ+7qKLp88N+aiCnQGlTbnbGGMO909bhKs7oIYriF/WAPUq3sXyCxBGsmDUysFLrD241328zx1qlMKXOkOWrhhm6Q6cf1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:01 +0000
Message-ID: <87cy5p2z53.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 124/292] ASoC: codecs: rt715-sdca: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:00 +0000
X-ClientProxiedBy: TY4PR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:378::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd29b70-0ae6-4283-b046-08de20b8e453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v48aUgrdJGEgYpLZHJoHZmCy58ex1l3kKCELkqu5dg7CDUn0FTPA25HNwT6w?=
 =?us-ascii?Q?Oel+42Y4ZNu114g75P+d68h4TRUjUKn9USHZ+DRPMzIVFTL6opel0vlkm3Ni?=
 =?us-ascii?Q?x2ZJcbSHL9Ws0ZBLbU8nQEPvAW/t5OqY6slo1DaYbHLl2BYsHe2QqzjW08xC?=
 =?us-ascii?Q?VRRePbA5m15N2CqOugannDfS8V3BZqtg7geEALfcnxLJCnCGSvi+ryK0vTDh?=
 =?us-ascii?Q?EpbNKGlG1SOj+h51+hSbdNUy5eSVF6rU5mWM0EjfmXQgrGUFCVqYgBeGxZdd?=
 =?us-ascii?Q?7E8j9Y8NMEbMOPIU2bPucpTOt52eI3QdHmtbjq6aUfWdDFTwjkbAfyVkM9le?=
 =?us-ascii?Q?5zmEvROdc8HLlJyTpG2pDqOnGBPFmJfhJuddina07qBVBpuOFj1vr4MVQp+o?=
 =?us-ascii?Q?XFZD86Z6wHUqBr1494/bTTXv8gtekV2Cjg5KmoNTB362R6kjXRvF+wBkJA7x?=
 =?us-ascii?Q?Aghs9AOBMk3z6Fezlo1kTprObDaQltwFklAgtuW6Wet8fUIl6wTyYwqc1vc8?=
 =?us-ascii?Q?w0W2aVaDbE+Ljqf5Zn8OPA907EiY4Z+VW3fJuKVF43fq+4KiXsZdX26KMeCc?=
 =?us-ascii?Q?FHt80eQ0y1P8BZFUgjIWqajR0+l1BN0wHCI54M4zaF3u5Ow4xuZp8/13VmSy?=
 =?us-ascii?Q?ghVMs3VHrM0nkWxi8nOcBpW9fjQpio0aS/4qm/2Pry+QpFwStzA5CyNVOI5m?=
 =?us-ascii?Q?rnl6edXQqF0rl4AsqcnFj2YzDxAcOHXyKCqrrz/XdssA1dTRn+ZgOW4ngR7v?=
 =?us-ascii?Q?t1aPl20M4mm9fmoVao0nYDYdSIdMjnDv3TwiFSA3F29ddfbVsrSlkSoQplOH?=
 =?us-ascii?Q?N9yWJSdIyy+XJbZf6g6etk67u8S0mR90CnIZZBC9uPBWPTksVadeeXxFIv2o?=
 =?us-ascii?Q?FpLRBgPq8HRTtioGQ9hiu7Bt7/8TaOItYpgKAN5pQ+J/Lo8aVoMi81T7viFy?=
 =?us-ascii?Q?PNSJngapdRp+YzAALi1qxoH9tXDWwxb+aFnDVugnqNXczodgP7H2ii20zDJy?=
 =?us-ascii?Q?KdDQsh7GNBso/uRJTlpvmWu5GwGTbgmCIjCxYhSaxuAt7msh0uPj6koBOU8n?=
 =?us-ascii?Q?gW44xm2M26QNNahfob1Tk4Jy/KhVqASKCwvgSYmQHAuwxsyB7p0Lf8WVKmvS?=
 =?us-ascii?Q?9fVGn0ZfBsiE5QWCZA+24CxZFRGaPLKCpfgyh3t/iAaFZhzsWZENJ05eWt85?=
 =?us-ascii?Q?ORF6joJ4hSC3k9jM9vWD2AWH6K5P3ZpjJvMX4h/gKf7uzTs1JV52hT0oZYUd?=
 =?us-ascii?Q?YL9GtIPFSbPJxL5FZl9DGYMxRlvuTx4tLjTgdVryCzeajHbpIv3VT46EtSMp?=
 =?us-ascii?Q?+WhJ6Jd9COwFO6Qlu9+RWnz0MRX2p80JO0jHzeqf6kh/Xzl/Su/YiinRdSqh?=
 =?us-ascii?Q?TKL6U+wwMaY7bTUeTjiU7tEhRMea3nlnrOmDAcIiqUoW3zNl617yfgekFuR1?=
 =?us-ascii?Q?/4QB3cJkCwzgDvoQy27YSV4pTIQeo4sMGNNJ9KFIDA4f6v+n+w4xxpmSFlDu?=
 =?us-ascii?Q?7EPNuXt+JXM0ujMSaKDSwNMJ0d7gdDrzOdSn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWM+BRYzMHBfHrXjdxNc4weNBd1EdWe/DnnjMO3A8jf/JWkoiLOeJZX81Wgq?=
 =?us-ascii?Q?E5mKdVBnuK9V+iqtm05BUwMi/D1yNyN4WoI0hFcGfix9QqJ3Pk5IUoCeQ3lV?=
 =?us-ascii?Q?qmnBwxUT/DP5uQb59fqENynev+xEaGsrLsaaVI9CXVN/cTDN+XLAbLcMRt/4?=
 =?us-ascii?Q?j23v2zE38ON77FpylhUnHlDtIn14IFKLrhT/8zPU+OCZR8fLbAJefrpi7E+e?=
 =?us-ascii?Q?1TG+E+p17/PcbpPqPgy4KnHawolkkqtLfJ/9i6THk2Hc3eDnRMI6EHYyPN2p?=
 =?us-ascii?Q?mqNWC0q+KYpXHec5f8NublJEjjyE5Dn7GtX03qk3v8qFicTYQVumcCu04XHN?=
 =?us-ascii?Q?8quUtY1eM4jcW1KhwysX8Wy9BlIdUEzoVlJuhvuhwEjNAcz6U2JnJIEMHD9X?=
 =?us-ascii?Q?mFqEseerpeLki3NHpkgmVtmSFL3d8LbZDpjXh5xDuPee6YrcD8aTkXIQTpRZ?=
 =?us-ascii?Q?z8Pq1l7QWAvQS/o1YbAHhO40lHEWYuYwx2ElqAs7gI5YhTMhTXHNtgd53ll4?=
 =?us-ascii?Q?kWjJXfqaP7rdXWhK+COZRurjOCkwqWrx7UWxdQs+V7Pbf7q5gs0wTGON52BG?=
 =?us-ascii?Q?BdChsSFzoaN5l0jwkf9UahqpRrbIhGRO/Adf4wRhiSooBT6bCzVEZgCYyfa0?=
 =?us-ascii?Q?w95aTMv11JGgURkml6teMfRE3BwkHWgPAlwJ1Tar/pOkdCTv9tPubY2cqfbp?=
 =?us-ascii?Q?6UFrfxQ1iqyl+Z8X39P/3rxf8oKx8o0cMSFtFAubAI5XU6wDNvIl7BZKj0Qd?=
 =?us-ascii?Q?7N1F2b39PUdG8QRuugqg7PFhXqrIv3sPAizIRhLmh/aA/l0EBynnV0p7c9/G?=
 =?us-ascii?Q?7/AqtPEqQn4PgtMQ0SpCjJg7j/G6vn2RETidqfTRa9R1nVtFdn4mlcjGu0uX?=
 =?us-ascii?Q?4BSag1VdyIJ1kMD/tiuBamKNdeDi/jEsIox/UfFCjb6tsB2pAamBiJRVcXlz?=
 =?us-ascii?Q?c54OBwNA/V2XXoKSOx2r/pgFz/KwuNfcIDrzgJVcBBfStPSVyOfGWkKFeixF?=
 =?us-ascii?Q?/OFO9T62Vvg/3pUJqHVwhaY3Vcm69cORXA9Qjm+tlHY4qp8iRbMzs7XWNUOs?=
 =?us-ascii?Q?9qUkDzVpjs9vvbc+mN7GihElBbU22jnaIzEUiXyoqpQHoQ2ZN/ofAjpAj1t8?=
 =?us-ascii?Q?X4BWefOf5cfJKwrGvyzTC0+0hFtMbCG29jrZLQnzpzPuTBtorAM9qffxEWiV?=
 =?us-ascii?Q?EjD6GnE6I2cntDWNBfEYvcVQolwO3aQHlQX+Yvza4TOT7ateNAiEZRl8k2iv?=
 =?us-ascii?Q?RJE078ZJzBnRHZXWHYfToeWg6BeeGjZ4TSxO/trHt9IXCXPEwuTAuM5614Iw?=
 =?us-ascii?Q?a/zQxUguUiTafH8xs6whem5nBPBl0g69TnFFRGeRColM86TqR8UU8Vkwi729?=
 =?us-ascii?Q?1iE7y3tS5+V2qpJAE3POC0efe3SEONdZzjVTGzPCZkir5SAZFHOvpffyF3dZ?=
 =?us-ascii?Q?Ut93GHyqP3BMOXByBRUQoe8cb8JPqhBBcKfJLnD8Ch0QLNTvzYccnDdPPW2w?=
 =?us-ascii?Q?rXhrIVjKZQibv4cqYBW3Gb9x7W3Zelq4H2zG1YrlfyrrIX6CUis3CInxIY5y?=
 =?us-ascii?Q?9G5+oQ87k1ca8duRxenjYMCil+CKPz6xcr8aIBCrUDOI7/8NUYruH1R3O2iy?=
 =?us-ascii?Q?JVnMx7Pl3q17rN098xQ38qA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd29b70-0ae6-4283-b046-08de20b8e453
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:01.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y34XfqFcFqAW92uDFiPawWrQNq4bPwvDGbQ9qego004y5oEnuf2jdcdUSR1UZtCFp9Dz3Ly7vRzlioq3OploFxh36f8WhzEzrEFCL2fSdwXzOyEE0b2DklHDZv77EXKA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt715-sdca.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index db7d43349d7da..b6a7a807a4286 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -502,8 +502,7 @@ static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
 static int rt715_sdca_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
 	unsigned int val, mask_sft;
 
@@ -538,10 +537,8 @@ static int rt715_sdca_mux_get(struct snd_kcontrol *kcontrol,
 static int rt715_sdca_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-				snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-- 
2.43.0

