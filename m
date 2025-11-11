Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD921FF28
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821227; cv=fail; b=KFvZ3u46+jpb/HPnjMOt4xZMRXNwEjfbzw7G+vZUK1IgIcDRilLePro/2irSxZ1NzjKlFQIYfKSPcTylbRYJAS3TK2xt02mYR1qT29zGYLewkpqZFqSSg6gQ6Ih6GPK1U/GhNCyZEdJnyDjY9rNcV66ioKeDStxSuMYVLB+57eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821227; c=relaxed/simple;
	bh=fQkEUmtKqRa/9mCNORwVOSV6NuytKAixHcSWxjqqsuo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m8Pxb3a9ufb5kS/FurPB2Nfnf1B72jWQ0DO1stVU9zYJ3yZuewXuUUSnO+kYHLR4GGdbb9YuWv4k30i7shWQZN4ORpMnydGPJu11KEsZ1wKE7T6rwgzhpsCTv7TyIdKaUyfSAfHTJERDk09x6eOahZckMBVCHlpKIB5hsOZhQ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O9Q1BWX2; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O9Q1BWX2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyWhedUroEvbyniY09KbWYjq90PbAjHc9JvqaxkK0eVkfSUkhU8C2qOclMeZLWL+J7mOgBdlLU5a3br5P8208sYYxk9zFc15FUweCzR0pBgVAskP2g97oQ0HBpMorVXSCY5uIfMxFPYIz4zodU2Sxi1d7p72Ifg95M6/hqe4599+WfL75vJB76ZL1NjTVVCz+AP6VJM4S6Ae6dw6AMZD/q9Br0OJS+ETlv53wkQjQlpJ3pxodItuB7+qMJUDmWVs/c6GhM1Bm+tChM4Ogp7c8D0qc+UiXaiCRMpU73pqEunKimnjsrCji3MptI6hP8zPnkLtQyihGlW1yBrU69Yi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR0cjlgr2ElifzMTyXhUxcHtWcLgWPASDDNCiTNfDb8=;
 b=fSXRG9zA3sWSy1mmjBZqKtyOb8k9Cpj8WXamCP23bEi832DtMr6YfGHLzhe9dZisH7wh0ZuEs51Ap1/a9HuYqXHTAd9peELBz+nQmWBfdPo5xom51QaOl7+KTqkgDQzPdsze6sLQacRKb7KzZtXVpyr2luD9JlTodhgiGow6CbVUMTOn5AtmO1TR+Z2EPtlyHVt5j6vnJ7ioA9+Z39rJuKMYze8XlFVotYtnS3YNt8vunEOZIZIkXrlhtBCFwBWwL3k0e4kv3FFpytt+N5SlDROhR0K5RclUvs5YYl2WUOGMniI5vuGMjRVvlkNNQQwzPL/iaVJJjeedx+bc9Krpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR0cjlgr2ElifzMTyXhUxcHtWcLgWPASDDNCiTNfDb8=;
 b=O9Q1BWX2D9iVI8H4J0co8DGtLt1XEKJGN9d6rmC1C6n7D/T7zQLgopCglQlrf9S4DoSbm5Ud9WqBJshk2TU6q5fra7HIdTN7gP5Pp/3+sRt2nLsp5BiuEqnFqfoNQCJVYve0Ih3k6u+LOQkTDsjiu6WkZRHHJJn0BKufB21uYg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:43 +0000
Message-ID: <87346lwgpl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 231/292] ASoC: mediatek: mt8195-mt6359: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:43 +0000
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 16326877-c2c3-46af-a116-08de20b9f7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mtid1YIb7WQDpKbRP9TN8abSHSBz13sZGcv2+1Y5VKksRhrhX6k8VEz63YDx?=
 =?us-ascii?Q?N3AQHno4hyoU8HGJIn9MMuWDl92xMI1WX8W+m9lTHrLoTzJZVpiRXhWrQHHZ?=
 =?us-ascii?Q?ALeOjBfJ+MJR/5U+odQ1U9GIKKMrc9L9yFk1L7bNEaV7qRN8xARfhRygtqGy?=
 =?us-ascii?Q?jjV10lf4jA373yuL9smZZ/idPWSg4rRPjyAY0WUgG+pDqJnPaBJUsHBiWFBn?=
 =?us-ascii?Q?A4jjHhKal5Qe8CxHWzWtDKtrvl/ewzwp4Trft/z4rmWCrAcLklCIaRfvhEU2?=
 =?us-ascii?Q?xw/pd+JYlPvVBib+81ZeKeLNmETbdD8wuXktwLDnft+yiunNBtZcrykrFIy5?=
 =?us-ascii?Q?G72BWtLuKpE6sjvrUdWwFvsySkk89DSISO7ONMiGIT5YXmO4HJY3mC3Kapbu?=
 =?us-ascii?Q?3CNsPf7Fv7gyEbQZPfjKSKT76YMD8gOgRvZkmy5U3K//wexxgJQS3IMGdOe5?=
 =?us-ascii?Q?/3QBb9nZ+sldxlqZJG6CvAgaYBLkMqEcWP5h64fevMNQD1XZbHZ2C/HP58XA?=
 =?us-ascii?Q?ysy80L2CoC/kFKVZDJ8Qw0h/OHjw7QvO0B34GRpb/Wsc3fjcVLdfOEVtdZUE?=
 =?us-ascii?Q?pOAWZNOeKEcqOTMJdSVnL/PeXurpBLx2KgBZqBNQTav3Jyh8TaLr8zYvy9ct?=
 =?us-ascii?Q?bdHDAZeDvV/4GfqRGlDZUQlupmxD0o9hAKK8lsYUxOjaTODmORHw+gibKNq4?=
 =?us-ascii?Q?vniO3oC8Y0+HYY/kJRz89wfus4TyfUE0AVoGvRAANctNffz7gpIiN69w9tZ3?=
 =?us-ascii?Q?Rjnl+29/WFU7ZuY34Bnyi2YEh9+b/517cBIvt7fh6hHxSfOueiOI9WdnO6OI?=
 =?us-ascii?Q?CUbbj/Un6JEHC6x6S3NOOuElc9Itzl1zOppeqU+hFgrB6RAQnhiJZkgYk7vH?=
 =?us-ascii?Q?mp5z+Iu83VYcufQj+BwaRVECMsTgBS34brim5XZwqQTEci2wTYMsj0ZZebGy?=
 =?us-ascii?Q?i5Z3Lls7I4G+ag0e/oCEkHV1ohH+ZLmXa+1iwN0khUOu0xQlO8T3Izbdgerh?=
 =?us-ascii?Q?1urhH6S6fTmrpoSmOx4+7pNBo+ExgAiRvMb0s8rzy5pDRf/kaZV4ZGgJto75?=
 =?us-ascii?Q?1FSkzgYHyxCA2r0JHk6udsTr+ChgubUR78Z7DfH7mQZ8iL0pCs1M+bgW45JG?=
 =?us-ascii?Q?5YDsGMiVoJhfV6z4xq/i+ryJxSwkBiDi6A0FI5kj3u382QQ3+e2K3lzXoe/P?=
 =?us-ascii?Q?UmBydKoTpKxytTarT2UppqoHTlIykU877dzOahsyA1QR5B15kOcB9eJJDw5J?=
 =?us-ascii?Q?Qyg7RtreJZMOJOzvsujuJP5E0+8CLE+Hp9lNMt4gAdXk/rGHe+Dx1qD8ZOte?=
 =?us-ascii?Q?MDO0FtUvMAYK4p9ff1DufUNY599zlx7p1o5keeAGATcrWWUo4u2nhUP3yoVV?=
 =?us-ascii?Q?xj2psGNGed2LNLLeDqsacc8SuaMw6uucgG5HK1pYNjjwQYkKMroARahw++VW?=
 =?us-ascii?Q?JPBadEPJNrVznkmCoZtyxPw1g5gE5R6PMhxGeTuEJQdrcJRobJAWWyT+wl5M?=
 =?us-ascii?Q?z47e7ZsB74uar182VmL9Ks+wBA2AgOGuPvyS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y7NV7O8AxsDbErsAouoMwcUHV5tHDTmSH4gRzI3Yx71FfPy/17m7y0j27LeQ?=
 =?us-ascii?Q?KbCswudDR21ELilVhNBnivrQlIA3084q43g622KOZHABQ/RUFArf1hz1djSG?=
 =?us-ascii?Q?Y5io1d74Kringe6Om9eLnMwYQaw3RZY5QUIC9dpRDUu4G01LqyQsxCdpsw8L?=
 =?us-ascii?Q?ZJqa3AaV54eT9HxLnEU3cCpe3zhRpud8BTyIo2PomZN/1whzLJMahQew4Icg?=
 =?us-ascii?Q?hInjB/u1Wwzwsgt5MDiX3tPmx7ZnWi7Vjqfth5APpgbDY/8732e/WgYZ2eZx?=
 =?us-ascii?Q?Nby8M4bfJWa7XvxjQUHvKPATi07pPg6NHzH14dXVEGafxDBBQzZVfNUbNKgd?=
 =?us-ascii?Q?Y+xAGxP85SAhJtVFzUEhybOnkq7YFcsORGFa6+9U159vFsqNqmmaZMHs5Oig?=
 =?us-ascii?Q?XCpnHT7aKljQ4w5Xu5NcWzHHre8l+kob6l2Mp2X0oibaCsIv6hLz1NYqmZ6K?=
 =?us-ascii?Q?gPlmj2bfNC86pctOXfm2c+Ym+JInbSPg2Lihql0Z2VncAY77KKVAPQO+JpQJ?=
 =?us-ascii?Q?ZOAjY4Oht2xGl0YWC0RLV4Za2Tk776C6o9+qSBW9WJ3r67/ZPQ+o1+iNQ7Fn?=
 =?us-ascii?Q?4SVP+H0VEkP3XHdTwZ/a+daJ4hLcgH/aS78RJRzja60/s6p+AH7EHEl8LdFu?=
 =?us-ascii?Q?ctabwUwrRxhs+/zOfZDIgrbxPN/4dvddo3RHG3Veh5KN4TA7g03CQfst3D0E?=
 =?us-ascii?Q?5IpIzFu+15jmgDWJnfL27gUj9fKfbv9f/hYtpvB2RZrEb7VOXSo/qu89nVaW?=
 =?us-ascii?Q?eaqAGdoQxqTuFDMIuRIcOys0pjmXQwbXcYL0G7qT/wiSfwzo0Kh7mUAz0gMF?=
 =?us-ascii?Q?rfok/I3nYZOj18L713ohkumCRd9e43lS3EioPgze/IzNMW+zp5AdlthNnwLs?=
 =?us-ascii?Q?wRWyJRzzosh9YX8Nj/sgW1jWqlQVlkahTivVOocG9BNvloEhL67Ea+XFhVOh?=
 =?us-ascii?Q?TIVPaaxwvRAapj7tx0+yLNH3gMFO5Wr63oZCMBWgPxrsHrIGJDYim66JZNrG?=
 =?us-ascii?Q?uEprQKyEVa+Pr4WqzmHCjCOIUdPRnDiMxgQ7bX918YX0KdJ4agNh0/Qhr6s3?=
 =?us-ascii?Q?+sb+3ANgvKx75jXDkewjuCsbLTHqlI5Ym5isg+CKSojqe5ZdBrSi8YnykV12?=
 =?us-ascii?Q?BafckYyhEnZDMKX1OblrCEVuIShp2te+k0R0lgVVgfjiu9kPup1fx+drt+Nv?=
 =?us-ascii?Q?G2pbpRTA00VjSYMtG5R468oabYWfLrgOpKz8RANnsrC82nAcjSripyeuJLDB?=
 =?us-ascii?Q?uqBAFS5IYCK9hZHst5d/vIBJ+QHB0IU4u9MoRkO7uZ+3NKSUaEDZBidfovt7?=
 =?us-ascii?Q?YwO4yVdtPnf18sDG5zTg8ZVhckJ93ubysAaJQN1w1Yd/j+tvETW9EpO62Jc2?=
 =?us-ascii?Q?7cUl6O41nWxr68Vm2Ea7G804bms60FHRAzQd4Rald+/7TBm2xsVtvcmOk9pM?=
 =?us-ascii?Q?Q8N+TSwSDuF3YB2KBaUPA8tpqBp4Kil31dGpChrMg9O7vYtKpFs0V0B+Ry8m?=
 =?us-ascii?Q?hgh9g8fD8aJHPvA7OBx1PxfQpP1EsrMzGwfot5smya3gftlmCGcGRE2ANCZG?=
 =?us-ascii?Q?uoNH+yGI89sCGYUimTfc69K0JTx8R2FYLQsodl3D0jBs1BAm3SCmzaQbYCMX?=
 =?us-ascii?Q?3vmIkHTDXsTTEzXIPANS9jM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16326877-c2c3-46af-a116-08de20b9f7e2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:43.4967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fJYn5Mi8jNGlOX4g6puMQeBYtU4vgEZ2NUo2ol/biEEvzYg5VMYzXsv3Jo9tN46geDcl0xMyGTJyPcVgYlnBw+ZyPYH1tMZLZbFIe2V862t1/jHhTKYMY0oRikkCqgT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 7b96c843a14a5..4d62bc654a587 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -451,6 +451,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
 	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
@@ -477,7 +478,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt5682_routes,
+	ret = snd_soc_dapm_add_routes(dapm, mt8195_rt5682_routes,
 				      ARRAY_SIZE(mt8195_rt5682_routes));
 	if (ret)
 		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
@@ -547,9 +548,10 @@ static const struct snd_soc_ops mt8195_sof_be_ops = {
 static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8195_dual_speaker_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8195_dual_speaker_widgets,
 					ARRAY_SIZE(mt8195_dual_speaker_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
@@ -564,7 +566,7 @@ static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt1011_routes,
+	ret = snd_soc_dapm_add_routes(dapm, mt8195_rt1011_routes,
 				      ARRAY_SIZE(mt8195_rt1011_routes));
 	if (ret)
 		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
@@ -575,9 +577,10 @@ static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8195_speaker_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8195_speaker_widgets,
 					ARRAY_SIZE(mt8195_speaker_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
@@ -598,13 +601,14 @@ static int mt8195_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
 	ret = mt8195_dumb_amp_init(rtd);
 	if (ret)
 		return ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt1019_routes,
+	ret = snd_soc_dapm_add_routes(dapm, mt8195_rt1019_routes,
 				      ARRAY_SIZE(mt8195_rt1019_routes));
 	if (ret)
 		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
@@ -615,9 +619,10 @@ static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8195_dual_speaker_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8195_dual_speaker_widgets,
 					ARRAY_SIZE(mt8195_dual_speaker_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
@@ -632,7 +637,7 @@ static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_max98390_routes,
+	ret = snd_soc_dapm_add_routes(dapm, mt8195_max98390_routes,
 				      ARRAY_SIZE(mt8195_max98390_routes));
 	if (ret)
 		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
@@ -655,7 +660,7 @@ static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8195_set_bias_level_post(struct snd_soc_card *card,
 	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
 {
-	struct snd_soc_component *component = dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	int ret;
-- 
2.43.0

