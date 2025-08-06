Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7C4431
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 04:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455319; cv=fail; b=Xzj+27Nu3ge6W1MqSfS2pYWvLiI5lKhjnBNA5cFrjYuy7u3AbriIETgcU3eh/QsOMz1h68EdkzQjHo8+quxQa7AFBLmOHfl4BDZg6O2nuvgwkNQ/K/C494cwqt+a+1hlGI56AJ9s2xDUnDDDLiwt5I9jbhQV9fDY5Z1ql9dGtPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455319; c=relaxed/simple;
	bh=tcGorN3T7Amg6oyJbPBEIFHGy7aLxCaX0DRKgMRbzzM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KFqaEGnE/NytyfU1KJIxVwrppmF2LHh7DY+gytLGATITMhKaKhbF/3jgLL8Bee9jvyv9lG1YMA4B6H10/VjN08nyXwGTkez54f/96bKm57X+E0isexAknTWPysp8M5fJ+FH4xYc5nZcvU6MMiIRncYShS3LedXwjr4fekUohKR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nee47WwP; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nee47WwP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4Zjq9EHVGzBahp5IBLdA3W7PmF36A41Mr/yDFsQAdYaaLFKxG7yNt35QpiTuJf7sltm5bElb1dR4ZWGaSyU7B+YrGdD9B9ebCLhqpLekft6h1mp5CZ5HnR0IGesLt9BKSvhhimYuKT8YoAscqD8GqmuSZNtrmCAe9zA3ue4Yoqr+D9zEdTsNsUb381VjDjlXyWoBveuhyhDDTvvpOl5wtovvRE1JkiCb8ZzGxRHpOzc7S/bdhchbPyGAZIUC2Z/cWhhei1zKt7YVEoDyyQsjk9zuK7KOGKoXvmjPYCo23HC++bOzRdMUSD6g4ZrzjbaPPJu1v1TfgG0231ehI/xDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuKorl2AOcS+eIFqWRvInDDg4n5fXVtFxFVFbVYoYF4=;
 b=d1Q5tq+xLBpDzYKepevn4+TJdiy4Ej9p40qL/uodfEhK6PTJ3PVa/sPdAuhxI0Y7gXOodtqLuRMSaZk78/DUWhaGUtCS9JQo7ixvI+HqIKji4KgAmhfENkeJmRHgDgFcsd6cTK1KsTLFbu6Mdt1lL70xr7vyJuQpTqgpHgQeVY8pk6LrwpkWIh4GSAwIvmYuU4VFP+AJG9oWltjIiS22DrCRM3VwGCeJyM0jnsmdlJ3Aax6E5mzJiIw9lcxoH6aj0xLEsy4LM3kzUObPwIXyLxUwfzSbHt/Efm28e/4OIKe0Itz11yIQKd8GJzkH7YTVtqBs6LJ1HFw5A+z8jZ3E7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuKorl2AOcS+eIFqWRvInDDg4n5fXVtFxFVFbVYoYF4=;
 b=nee47WwPDkvu4xyAYK9W8IBLyyUsczg3hw8ILIIg6RRGQgIwJFnC4TwKFC1vDZWe++UNThlWI9ggdDUHLY090Z6BG86cPYoOpEKxcogLnna9HMU0a12XDHQ7i8mbxblyAbExMAB2A9OE6qboUBv3G55613sTXH0OVkbWJ61528Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13956.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:41:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:41:55 +0000
Message-ID: <87zfcd6oz0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: soc-component: unpack snd_soc_component_get_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
References: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 04:41:55 +0000
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1fc969-ce50-4e70-5398-08ddd4a39232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n+Yq9J0LZjfpPBLosk+wj3AYtv9kNtFygyS9N2bBTSjG16YvclVaeuanhGVk?=
 =?us-ascii?Q?J4tkUSLGTCxZYJmGAL2Yf12+rcKRDPC9JGSBmwUgWKI/XSJr2cdI/DiU7+6e?=
 =?us-ascii?Q?AUp+K8AGW3EEskbaPdQqO6VbbnSnM50Objud4yZUWvdV6HGxNBM/ISI+TEpC?=
 =?us-ascii?Q?qHdcNL6FA5YIp12ngpb7TE9/Pktrw39Jv1l5zWjageDVma+h2gRkXC2IVfSn?=
 =?us-ascii?Q?wKSKbBsbSE3DaZrcbQXfQh28PNTJyRYzqbsNgMdKPxDDB2H4C5tRKVYdx4SX?=
 =?us-ascii?Q?9tuXDzw7wjH6oYo9nOcaEGQhSbuxFy7S5VbNhbkQKCiHiK4CHf9QkhsuDFCa?=
 =?us-ascii?Q?CmbLZ6EVuF0nz/0QPxziAeXCR3QPbMRVZ7xmuTvbTpdZ+HJMvB3r1F3BpM87?=
 =?us-ascii?Q?Y+CnR7I0JxvkJh247DmlIaTU1OUL09fnV8tEsdKFkLmA2JflxeRkmNqjCNsM?=
 =?us-ascii?Q?e4SDWSiwiOWqGAmaLtJdMfL0l/H8pzjg3N1qhZCOalcxJ6B7RUUWjygzkqqG?=
 =?us-ascii?Q?DofaAriLO8clN+mte2qJiPwLRLZULMAm6OsJ+eZM70RYgALjjUPGm02QUFa5?=
 =?us-ascii?Q?67IRxaf2wTWkKfy3unJvtkzf3PmOYgNU8Xdo6bYrqSXG+3B2f50Tp7Y7g+ST?=
 =?us-ascii?Q?HFG/++XYP1XC4ouvgI7oiBJ9Zz+NPcZ0yVpSwrQ9Lf7WB5o7oS81SFdlGm/e?=
 =?us-ascii?Q?R2qIZ7VFkSlRiU867ieHhEOvVN4GUYM5hXSQjefAD2Yg8HaPsgI7nYyQTFD5?=
 =?us-ascii?Q?3gliEVRRvLQZYV67bTuwkkGyKhnUAOL5yW3fpvBRLSHv/v5jI2pgpCGCr/is?=
 =?us-ascii?Q?vHbkN65gLAq/5VqxNva7sMKer42ZEHkTAyZTPPoDJhlXWAgdDFX2YWEhFp9t?=
 =?us-ascii?Q?f2aqbbmaNBtaIAbMOLbK9TEQxUgWUYepDN96kIMPP/dLTXGvzJ+eSTPc4t66?=
 =?us-ascii?Q?U3A7GfNwQ/YrZaL+KTUXJZpzckFNUTSNUbsKXPGJgSfP2OnRyr90+OWDUZMA?=
 =?us-ascii?Q?OKZNrK6eIwvvwaeo5khrDoigq8Bmnn5DK02IROxRMTUYIVNBZFkmr+XVinF7?=
 =?us-ascii?Q?F2gtNtUw7IUuicBOTzOqkzQM0diVDY3I+JYtLC6Cld2ABXHm750a241U0zWA?=
 =?us-ascii?Q?UrbueOOx1ZH1trwkWxkXau0jRamrvEu856GR8d4hd5YnItqRcaIND4yy0x3G?=
 =?us-ascii?Q?j96UXBbR9/nZiZU8HZsM5fPYXKzegkNY1iAfaL5B8RTZN+XSZr8VPpNJWcKu?=
 =?us-ascii?Q?3dLFLQfvok4iSX6RThVfh7c7Nm7OqCtL6/6LoEpdO1t2X5FUa3LCvsTyHC0R?=
 =?us-ascii?Q?QRYYuI+uVUPyEaDjyrhFAMZGjEzwS3CoDoRAegJIBmf0Dx45y5LqHfBSxiWP?=
 =?us-ascii?Q?CF9X6i0jlJqbWHxwqExvr6fHr44um0ew+3U3aoTNSFU9tMtafzDkBMVa3Ls+?=
 =?us-ascii?Q?9yQ+vQjQCKe1CBW6uqvHpVyMFtUVzLXCQP9ZqSqM1oSZ/eP/GLTMgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VhbxJSdky/L//ek9jWjGYD/GtqY3JHlyzeqKDjhFJxvtFhrIG1DuyiKRaQRy?=
 =?us-ascii?Q?gwFWxIjKNpFJJURUuCRmzaCLov0o9K6DtyjBcVE7ZQC/l7/+cjpN2h2gxyVI?=
 =?us-ascii?Q?M86csF57NbQPdN4SxnoCH2CpG+J79DOOGc3iGg+w37c15EK+Ra6icFppBS19?=
 =?us-ascii?Q?5vn0yJuZYn7VvapfazH07LhjNqFX+ti1V+bfTz+i6d6HSg1CDNCE0tKL9Gfx?=
 =?us-ascii?Q?zoAgkrgsbdvs0GNpNmT3MrX67mPLvfoWfNMX4Q3KVGHpW1QXfkjyBDwao4WN?=
 =?us-ascii?Q?9lU5gN2Ji5NGmkRCQ8MG6YkQDKaa/Db10W1QqTK+7BoSMzywtyEPr+F35uOS?=
 =?us-ascii?Q?5YszZaZPnbVSDLB4up4Yqsvyl1NppvA83GrV/SP4ssLwFumH8seB1Ka02ZKt?=
 =?us-ascii?Q?WM+iPyvVVLyC8P/ws5jhAtWAZeA1I+iLBrTgAug0EqXbmJOyBbPxuliqrZal?=
 =?us-ascii?Q?xNSwTYH4nekqJWTkSIW+HTO/unk84+EwkCFjSCtUjeXwScVskUCUrstD0SWt?=
 =?us-ascii?Q?ftjDPNX3tsjlxu0bgaA19aRSqToFFtIXV+pKdCQprHHsnxJZsIT8GG5I3Cab?=
 =?us-ascii?Q?ygpNUU5+HKQxlcqNVY/5f7p+0P+mFN/c85Lz0RPmSLaHh5pCwVxABKGTx7iX?=
 =?us-ascii?Q?nwrL7VhOo9ebuKgssoOvAXEfhau6gIaJwc01FXr9Hv1HA3Wmi2PZgQee4IPu?=
 =?us-ascii?Q?/jJWHRYbxfSyrfzLn82wLmrsolskSA/Xnwh/QbcIf8PUlH1zQO/gHZybCbaH?=
 =?us-ascii?Q?v1XZjDFJBOKmOMIEZ4sPyc6Z+GfTLW1XG1NnB2LEopFWyye3Vv7+iGXNJWfK?=
 =?us-ascii?Q?b/nEcJuDIjKQCyf3YSOlJzKJPQhsyPjlHgA1Hsqdf2HV7NqLH70CKNvvesMV?=
 =?us-ascii?Q?B0DqoWZT1QMQrWADPA0KcY6hEimd3Z3rp6veNtXtFGOCgZcqeU2JHUBxteyI?=
 =?us-ascii?Q?1qbU7I3GiCpD9UqEDthDKYTE/PRzZN5rybFkdwitOihwnUAnJ+1R1Flvhy/z?=
 =?us-ascii?Q?OzTlGl7NYj000o8M61AwdXsMjHQe1/v450z08JEfK/ijJRLwI05dl2PlgIFZ?=
 =?us-ascii?Q?NQR9FUgPqRGYxXWN/DKvXwzB9sM28qjkvi1N+SQqzlgSQFTRXw1VOe/JwZ29?=
 =?us-ascii?Q?AsAdtFFj+8Xg5+TJenL99E7l08zJS7XS1UuQqtMCPe4tJ2M7qTKPxS0FLGQ6?=
 =?us-ascii?Q?/dHmmO064soOWQrETu3+C/943P/gYW1rxs64L8doAMMuV1WHZAuuWuoVqDWj?=
 =?us-ascii?Q?PTwYs88aM63wyXQwsxGyc2ejEn7WyNk6QpcrDa5N1/SZ5WrDVtayUdIWs2Vj?=
 =?us-ascii?Q?b+sh4NYFVR2XdiUn0clOkNW5OJwEGENMOBBfh2E67hZ1MLVs3JiUzbL3xalI?=
 =?us-ascii?Q?c8GvDAVqlOszoCtGer5CO+3RWbUQbtwllHgCY947vozI0If50FMud6RRJ9Mg?=
 =?us-ascii?Q?ScN/0xz745lGvwBM9AAJx9KS5h6jTmpCLihV0IGKbex138f36Ukwf+yNwJQ/?=
 =?us-ascii?Q?vWL9a469Hb9LkAG3cYnbKJYhTSbYMMij604tbyevSBV0BpbJiC5WDgaXedHm?=
 =?us-ascii?Q?CS7em9YNgN2KrOn2w306JPLED0GrefgUWtGlSAHS3EX+w9ouikxz6n5CZvot?=
 =?us-ascii?Q?VWUhoBQKrCI3PUEjVPPwERY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1fc969-ce50-4e70-5398-08ddd4a39232
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:41:55.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcicVusfYVA/4XAWSdEhL0MvMveaePHRTxa83w5EZRC0lwudGLrOPgfx+b2NLTKzUdzr3uxJD7dhobeDS/1ws6r76jgj3UH7nrbE0U6/s9XB3Vcds2HDh2TqTBxE8cwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13956

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

This patch unpack component wrapper to cleanup it.

The function will be kept by using macro for a while, but will be
replaced/cleanuped in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 13 -------------
 include/sound/soc-dapm.h      |  1 +
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c616f489c237..86ad2802879f 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -301,19 +301,6 @@ snd_soc_component_init_bias_level(struct snd_soc_component *component,
 		snd_soc_component_get_dapm(component), level);
 }
 
-/**
- * snd_soc_component_get_bias_level() - Get current COMPONENT DAPM bias level
- * @component: The COMPONENT for which to get the DAPM bias level
- *
- * Returns: The current DAPM bias level of the COMPONENT.
- */
-static inline enum snd_soc_bias_level
-snd_soc_component_get_bias_level(struct snd_soc_component *component)
-{
-	return snd_soc_dapm_get_bias_level(
-		snd_soc_component_get_dapm(component));
-}
-
 /**
  * snd_soc_dapm_kcontrol_component() - Returns the component associated to a
  * kcontrol
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 5bd9a27b12ba..6e2db79d6a97 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -727,6 +727,7 @@ void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 
 // REMOVE ME !!
 #define snd_soc_component_force_bias_level(c, l)	snd_soc_dapm_force_bias_level(&(c)->dapm, l)
+#define snd_soc_component_get_bias_level(c)		snd_soc_dapm_get_bias_level(&(c)->dapm)
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
-- 
2.43.0

