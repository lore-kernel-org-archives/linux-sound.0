Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178EF194AD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533840; cv=fail; b=g3QQwWp/BZtiRmqSIyRLaBzukpGCtWb850Us8rRNWdNLWD8TbsJj6HxGqe8yFDo0kSTYbeSkGRc05fANqmziuo3Juj1HJgmR7yTMDs+cQSQJ7k65iBsaLWtoZuH9E5Ym4BGroN1UHGvCMiEWE0pS5VQ45m98gTQyvEY01Qo3Kpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533840; c=relaxed/simple;
	bh=bQVY1hhPaYxfLtOwiQ76TA3KwaZF1b8kqvD1jW4GdJQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=X0XEz+GYVenCKExSH/4jCBJaP/0rTAMrKDdLmVrrTA0btu3usXsiwyzbru7/9JRT4UTw/OWbt38Je+H9mgVCtAqc19EIxsV8BpbrujtaO1KR7Eh8rLP8JOf3M6RTgF264+WTe0QUX5Jay7F4JDmlcpA6apXfACgUqjUisCzdeuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YYo8cCve; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YYo8cCve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSddGp/Q59BfBIujoEc1xXjSy3lWHzrIx5hTcnyor1sTGNepj8Zh+tFozf3eElcvr1aLeEf9WEkJrphcRk6VIZ+OVs+AaG7Uo980DS4yX8yV8BpgdmmQsZelkoPRuE/FTg3n9N7CIsKppTfIfUogtIZvP/rcGH4r7zQqQ5jTYLm8pgWY3vdk8smetAxtgFx++1aA50s6aOEpIBNUxwcik2dcMHjy6E1R/mJOWsag0hpHkR5Hm3atSpWypZRYvqrchXghQNK/6A8CngR3Z+UpQdxCBOg6ho5LDcapttjKbSOhg16jLpOYN9twXcGwnuNf2X0Rb0PnwrQ3uYsCpkgtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZI25lFKlE2CHtrQKuapvFi5YfpD/P/3sFpFRB2jheo=;
 b=mMSjVDoT7SfnOOzvHu8tju6cNa/R7kuVSU8UztZ8HJivE+dviBWyzAK59j3oNeJ+XLabfKYUnVQPybBQ+EY7kxOJ3y5XI2FuoGYNcM3ktxv/Hnc17WsMoflcqE8dIsl9Kek7PB9I69sDetMznQbXnIFHfUUJ6bygqJp0rZhtZoHcZxgUeMnPeFrSnLndW0YZGcw+5Rf/rprNFHOb3tIU4Ero1e2J5xQwjO89VLnwMSwg2LFaOi4lIYHF76fp/Nm+8IKNLMUK/56s/FMjT07vtNUpk75lfg7VNGHI5JnO0UdCSJ01xUks23fFt7hrpWzVuybVhCe75JSvIxN0ceLdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZI25lFKlE2CHtrQKuapvFi5YfpD/P/3sFpFRB2jheo=;
 b=YYo8cCve2mo7h/qPuwPYRzOP/dKquhV/nt8AmSdYwCrpFV/KGkJR1H0Iy+OFJ2RUoyVDvZego7d/RnDs92vbGpDV3PbXmyYjzt6ZU4Xgqsh4ZD1ELqiXON4cKW5ojLgYzQpXq2sbabqoV55tdrtDkMHHWc3wCoGloahhPmBh0dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:17 +0000
Message-ID: <87seo1a3lf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 116/157] ASoC: intel: rt286: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:16 +0000
X-ClientProxiedBy: TYAPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:404:28::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 413d0382-abf6-4b45-2f23-08dd56061a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGvF6wa4m9O2rC3taLXhrtgGVTWUz0BYpP0e9141gl0YopNPDe0oc10zqY+y?=
 =?us-ascii?Q?lyLKbglDyLvWkwuIZ5jMHsOezY2+lg+BnD7Xb+FUp0ZJUHMAjLEY7WcgShyp?=
 =?us-ascii?Q?aZJbBnOgK8V4vISqfN09tsx1C5c7UnlAAJ22a+PAKUNe5YFWdmWAgTVIhvLL?=
 =?us-ascii?Q?XsZFvEPpG6f4FtUeHoPDalmMhsVujAP0c73/oHDSWcAjc6VgQIElOBYyfNsV?=
 =?us-ascii?Q?ZnZ9zfqepDu1CjEUcChhgIL4N9AxCWW66ys71I4GDj2QrxOEFocxlSqR4DJr?=
 =?us-ascii?Q?HblGjXcG6lkIxDw9Ry/wBop2BZkupqNDfTObI1rJTW5yXXbT/JWLQwgP+kyl?=
 =?us-ascii?Q?xSgWL1O5CyGcbHCpR683snas0n1N/KjprbaUl0tbhyiex4ERIEba1myKnN7d?=
 =?us-ascii?Q?M+cBBosJMNxignlgqmoiZAGdhlfeWvUQ3H1kX5t8alrOd3Xs5NQhe0S//LHX?=
 =?us-ascii?Q?3vJujTWq5Madb5uMdlnxKuSiBW+cDcQ0QMYH9y+jzreakPNAyFBI+hvmu/rT?=
 =?us-ascii?Q?I5dfmmBBeWRlQ/DyX40XjTKlIr4RorZzbRWGNK9trx57XPlwqzVXNoHwPEbx?=
 =?us-ascii?Q?43d49jbgWmprqcJ7rJarvgpCL0tSf7vTS4JViXqYYWWDCER17IiGEzxfJBD5?=
 =?us-ascii?Q?WrNxfPWrwPWX5xNCnM66un5iWoJKJJB79uto+d2jGCi50tzZVPfdhJ4Psgxa?=
 =?us-ascii?Q?0VQT3tiEULIe2iCq0S+CBYS6BLo4Iy/BKACPbEur3LD3oqE55VZ1FrKr2h2q?=
 =?us-ascii?Q?7G9Vb7kzkfV9T8Rohn5qeTJpWYcAGsmkXDelfsSCXSTepx4TCz8oqzbKUCIn?=
 =?us-ascii?Q?efj27uQN2BafLnX0EtlmRq4N9oKD3E00yLGg3KFxI0sUETYqO48cHXbmRyq/?=
 =?us-ascii?Q?SdKu9maymPl5d0gnq/wqAsoJyfDEcmDhvnBp7wgnQ8ERP0Af7g5j6RSZiWYi?=
 =?us-ascii?Q?X/8BCtj4IbhnudyKhaw1O/GJGHpyAri4mAuzUx4bKgx8ZCo1dLBj5x1hxby9?=
 =?us-ascii?Q?I5mtmy3W5NZ5XiKoNQrbbq8lRvdqwTED/+h6rNj2WQvkSI8msqzlcKW+CD9B?=
 =?us-ascii?Q?VubYOgwMSHoEHGYltwBSljRU9fvV7HaOJEylxN0cxsvRuLT2mIOjJ3KxZFUo?=
 =?us-ascii?Q?ut9/w5afu6GU5fLeIQ76uOYYmCFMmIZvc/IH/jJIbrnvRusb924UmgOsRxys?=
 =?us-ascii?Q?sv3ta05cBYNsVsj1kzmDMaZZrACSfdioQGiWcrpqUhb7b2tvsWxqGcf0Ujta?=
 =?us-ascii?Q?LXAoKd5R+LxaSUThvkvA1PnJ9CnUa8s83yysQ3W90s98jlEmqzQaQkhbG8RL?=
 =?us-ascii?Q?qRfKWap0S7yX4kcde2Pcki5+Yy9L/9G/OGT08jA0djLPfk1irPAp10z11J08?=
 =?us-ascii?Q?HIPe82RhtbhuHiA5UgHwEjNP0E0KrxUT+TGq3pq2jzmBt7Fz/HCKESlwLHRV?=
 =?us-ascii?Q?Fqq0cFYXnNxfd2cjoaehG6Fokum9NwSN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WdrQK/i8IR7ip7P85Xq7Kv7NvGCQgaHvHbQaTjLNwBftCbik29sBqLkrDblG?=
 =?us-ascii?Q?N8n1kOirDNqjJdzjR0EuRT4PPR2XIlugNVTzMze0ZD7R6iXCIV9ca5rmf8c/?=
 =?us-ascii?Q?CdqlJ/INlrKQJa2fdmXbJ/i7RFKHiNyijhrP0myc3xMjUirBI+SoJ6qsA7I7?=
 =?us-ascii?Q?7IenSRrzuY2+JrGPZhUM4ErETbVGAlCqV8j5F/8odd+T4TmmFBpRGzzo93j1?=
 =?us-ascii?Q?x8UucGBAADjO/PPi5o97sZGP7whxODd6nDPlgxQjP9U0ue4x/DrMvvxDmQwC?=
 =?us-ascii?Q?4lT4vF9dTntOu8nm0KNHOGaf6d0ru1DlSy7M1kxAFY/imGsycPQVlArUCfcY?=
 =?us-ascii?Q?Zk2jqfQee/uBr1OQ+0TUlIALNWgG+dAkk7+yKEsPZ1cFJy9460t8D8sdHwGD?=
 =?us-ascii?Q?rdQt06rbUIeUwNscHvpzawerkN5XTKv+k+DUHTJPFDzLR3jkTKa1Phh6Bvmo?=
 =?us-ascii?Q?/E91O9C8hSmm3JdCxNbLqeHjvw3Jbu/iBk1x720c3CK0DcHYLrWBykAFPZHn?=
 =?us-ascii?Q?pf4EPtnYNSPtYSs+YZjUte2IomX0Miij2ElQl108N4msiSk5O14HU0Vf2HcB?=
 =?us-ascii?Q?684HX7/q+smUGltgM10vCnZv8M+APj7MbGA92GNKvdvy5I/pErPx9ODir0DO?=
 =?us-ascii?Q?OQBsR8e4+zo+mDpaKWBATF0wNAg8GC5VkZ7XAul02UTUorTz6aWTDz9aN1r0?=
 =?us-ascii?Q?vqe2AdnCZuLgdjuWGJKBPEXjvuVnOGWeDy9U4Ap8hvgkRO1bG1qZH6xBU3b2?=
 =?us-ascii?Q?ccUD2i0jTbdGkGFa2QQH3/MsSuU9xvF5YTJ0DlIRIXBG2cz5b16acN5p6+/s?=
 =?us-ascii?Q?BdS45oglqyHfttOuh9ESqRZ45j58+CpHcY2tHE8sfhQfmqTqAmpKmVDX8UFh?=
 =?us-ascii?Q?AiUav6CZ8u6cB+Ak2dWvZAkhu8Lswe9KjngH/+rokSWRMj8QPQNrPL/aquip?=
 =?us-ascii?Q?Tej8o/MI58YXWVyAvalnZP0woqtSDOM7n/n4bVYO4VqlwJtd06A1/3Ccto/4?=
 =?us-ascii?Q?xVO57YRyiqFN5AAsc8sPoHyMnn+XOo1RDpKc8m4Tr8HQlSX7uz0bZSLZGCwL?=
 =?us-ascii?Q?x1M/wQGWH/8aYjR4F+d4IQtzARO72R+aMbTl0CPRx/Pot5zIWyXOPr+LL53C?=
 =?us-ascii?Q?+px+uuPvKApNeY0QX1ZWu/Ksv/ycOe3kk76Gru771pSfHX6R+kO997iIvxg8?=
 =?us-ascii?Q?/FTwIYK/fVT3lPEMyuw7HnxjCBKGIZqfB4Q+ut54pnMiRFMSoV9Z2lGASH30?=
 =?us-ascii?Q?fe38HZWiOOcBnG2Ugp1qWVjhgEbbMcpN3PbasQ3t106/GExpMsAUrIBTHjlE?=
 =?us-ascii?Q?PF8/+XwjW2YVgM2qwHlmHaHfm9DI0dZ7rtT6O2izRaIOcGAYQ6ESQ+LxI++p?=
 =?us-ascii?Q?m8jQimpuaQM9L/zvZRIvM79zY0OSwhsnEjaUjnXDQ65gyhSj94n0SgbiPdYb?=
 =?us-ascii?Q?XxsoJb93yNFsPmNzEAHGwHa4LFxKEa5RNCKNVBVi4x+I/8T85N6j7c29llKr?=
 =?us-ascii?Q?uS1Lg6GD8+EucFdrLnk9blQK9BfARiksKfVi922zgO6Xoe2ShG6OTjzT9u7a?=
 =?us-ascii?Q?emhhG3pPueFxZMLG9Xz/sKXKT3438yHw/woJv8Bx0dZiggRDcLxwquu11+/9?=
 =?us-ascii?Q?Khli1U94ateQEA+vOcC0lIE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413d0382-abf6-4b45-2f23-08dd56061a73
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:17.1162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUdu/74sX6i8fOseIlmWVc9mH1oBo5KJb6MdHgSdaUCELZne3oDCPhFHtXeIoHcyhukT/zKMbEJ1N7GISftf3mEqWu26VKVVvvbGYKLv8LJvJIAeqq8exEk0ftjwRRw4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/rt286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index e40563ca99fd..e5e83d2adaa7 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -146,7 +146,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_rt286_codec_init;
 	dl->exit = avs_rt286_codec_exit;
 	dl->be_hw_params_fixup = avs_rt286_be_fixup;
-- 
2.43.0

