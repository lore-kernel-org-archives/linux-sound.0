Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F01C5F13
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903982; cv=fail; b=r8ZcjYSL2e8PndQy+HIU85FE9V3AzZ19v7LBWL3QL2GuuWv1uzA/dZ/qWvDFS9ajm4lsD++oSdPPvpPdvpPSvnnBhE9cVoMijWDDCuoCIqahb7buzITkDjvjuEmJ0yeDL8WPfNht0apc+ihXWeN+VTQmGJti7Vvd+1rnZPIXRPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903982; c=relaxed/simple;
	bh=9OudBo6eAXvIf/cUFjOGQzznVTSbR1Jjkrmu3leZVqk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t9Ux4xbOQE2u665ebpfIbhQuULFmh6OmK0LBQo+cHqxN3AQLpTetWnjxmVtK21r9ARFBtqoAEWSX3DOPR6lR9km1Vd6O5cCkQWpzJoetpDZd/5xvnKG0jMmsm5k5vCXzVDrCOJshlTnzh8sKOxyG2vpT3cSWl2NWWfG8NH2mCuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KP3km8lR; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KP3km8lR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMzFCFeNyhFbPWLvWZFKoOIVA0LwpBlFmXLbmUcXZxQUuayK9l0mgMQKnsFwgBvnt4Hp4nFLk3utUTNa7nTUh8rpTuVZb+FsO9j2cd5KmNkGXhkz7CPjMt+NaewhP194hZUfkL/Bloik7aCpK7Om42NobQxGpBCk7aWdDmzBYoNdsDrg18fAV7sC2KZ/TkWcvSsCanpiaIm7SKjWfP0FFuAdURNAB7b4Z+SnXK8oqfEY16eDTf2oSP7yGUKtA8NbebYSxeS/sjyht1qirzFBXy4V23QMn4gdUA4SwZpS1ui3BVd8TrmyLtY5MEYXLctek+B9Q4w8NAcq9H6r2USlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTaIJMvyz0iJC6Pk6YatBAqRDCogRSNO1abfTeZ2XXI=;
 b=qQJki04Y86YXTMAFVXdEnYHJgW+OxA7F+d9g+8izH60CCWWMs1HOIdauxbZBBM4PLA+DJnNgGtzIN1xN3ha+qNbcnM9DtzURrwS7Xr447lm5R5z+uNbL7eX2oc51lm9RBeACzvkWglO72m/O/LZQF2L0eneEZCrBP0+POKYImQnsG1OxSsnKQM7Kak2K5Mfq3X+TVPvwLJPzNGDwfCOa4VbCrqFHwyWpMqxP/iGru2WTiZlgOYB3JSEg1WtQT2nDkGCZbd1vBegZY1PW6KrN2INPcp1eh6g6+rO69timzSfYf4NTAY1HtVfXP9No54gH8G9y/U3R15Sc/eyBta2DVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTaIJMvyz0iJC6Pk6YatBAqRDCogRSNO1abfTeZ2XXI=;
 b=KP3km8lRZKavrwNVm+2vVM0rf8NK7oKQNtA1ZHnMbwbtEpvUwbOe0xObo7ooDFhJCvMWZYr2vJGFQtKAZtmCWr7d4bweqkmy0kpLIQ6QeSO/ZEdr+t3Uvhk49YgrYqjR86QS4XJ5sht1dcuWosXm2n+W3kMVvC6++snfV6bFvj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:59 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:59 +0000
Message-ID: <87ikkj1c9h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/11] ASoC: soc-dapm: add prefix on soc_dapm_dev_attrs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:59 +0000
X-ClientProxiedBy: TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::18) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: ca123075-1676-4fd2-6bca-08ddb456f8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WJDPImm28MOulGs62xEoQliiACGmKlVmmK4NaiezI5g43Uhi3S7pypD3HygM?=
 =?us-ascii?Q?1ehKMdrrdKZJDzhvxM0bzr5b0ANiUi5/A6TucI8iAJjA0/KtwSig5N5nUj3Z?=
 =?us-ascii?Q?O6rUVhoFNO3c8uDdFtVIZ+O1sLvWBwwmeiTCCZbi7m1MtvN3KVCktLESUihO?=
 =?us-ascii?Q?upLC09I2pjG9OkfUB37/SUN/X0cXwXoTdcmTK6RzxmYkvzADse9bSXN6p8mW?=
 =?us-ascii?Q?WJcgTKrrl+O/sbfPe+tctECnviNu5cKZE/aId0PdVAIR1xBQFPBURYfXcGKw?=
 =?us-ascii?Q?qxrv0Htyjp9MX+zwztBFhZxjfOema6jXtd2V4lnB5ynU/xwBq358IDQAj+63?=
 =?us-ascii?Q?HMOu2+pic0YsMjDgw1Jqb1I3+7ZIjkNgeY7Sih4T6HPPd2VoK3Gmb0QPewSj?=
 =?us-ascii?Q?oot86dqBG4WzA81qAHOhJP0ZfRUurlwppzpqrkwtNuamdqAZFyjdr4uVKIco?=
 =?us-ascii?Q?hQIh7u8s/jJUq+oNC1ZceY+9jHIPp+U9lhOw1bHQdS4zHjHu+yI6QYHqIwCc?=
 =?us-ascii?Q?Pa3WnuBNHPGFMcIqOPnVI1rLis42kKIU0eaWC6ytgDFOvRC7TE8FMzuVmR2k?=
 =?us-ascii?Q?0p/w5CcAycNed7hR9IF2c+XjOjgcWgvdqM32Pnn8DaIL5A/BZBb8XQFog1hF?=
 =?us-ascii?Q?1SmLQYfwpHmVWhkgLiMksv7WnGh0LQIThzpcfCkw1jgjAnrYsKEfLyGksC6B?=
 =?us-ascii?Q?1s70aJ5J/iU9rNfRSfG0z6qaJFm8CQAtqGbKfymEu69/PpScw7ae2idbez0v?=
 =?us-ascii?Q?jZTuE5fPbGae+9wyfKZ8fkQxC8xngW8aMO4FMn85TWa2C2Fpl0pprurGlnJn?=
 =?us-ascii?Q?PEp+EECFnKAcG21tc8x5sbDyPa3UdPrHsIoUKmGYdZlFBjz66/Kw+Vav9TZq?=
 =?us-ascii?Q?AVzVbhntgTfHWghvokpr+mkcUmkHlf4KIzBfu8ohGdmNAhGViy5Ov8+g9ZZc?=
 =?us-ascii?Q?hpBbIV8ZhWeBYzZzgzTbhaD/4q1inw26I4UCRY6DpJnEVW1Mn/tX7GjuTH2U?=
 =?us-ascii?Q?Uc7EyZIMTTg98aCN7SFi99Q22c5mcvFa27ldQA4MgosgNNaUNz02kTXTCgF4?=
 =?us-ascii?Q?Qle+esSXzNWTtIL7oQOdUN+GHPZXc1GSCDkOp6wDEi91ivTUNvaOiBuwjDKC?=
 =?us-ascii?Q?mYAhncqoQjWghAz/00FZXQ6UAupYEjwrdGC9CnGgZKsXJEQ7zWU8Q6wiazLj?=
 =?us-ascii?Q?dCkbKtwA/+8k4hdPoq4K6Tyeu4cqeYinaG6gsf1yfd8t498GfwbNQs6BVGaw?=
 =?us-ascii?Q?3BXMxaH0L9R8h0mCKURwJYF6UCL5ODYPSUWbwcnpFX7uBCnYLd29E34Ajo9T?=
 =?us-ascii?Q?BFnR5D/Cxotcem4X442tk3bhcp8uAsdkNFyZHR8GJxLljPAbb0JCixu6nUgT?=
 =?us-ascii?Q?6h01m4gQZxZXhYd8RGAXtoORZu7BoKSMpzBTA9SRlgI2M/MRcFnRR93VjXe+?=
 =?us-ascii?Q?KvlK97+YTnLD0WfwQmVvrqNsTbw8GN2nxou6hzhEJg+YkSpxcK6DcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aImmjXoc8A/+akzO9e003bd2YLS3cNDSSOAUDA86Us7/QF5UH5LmBxCZabhr?=
 =?us-ascii?Q?3m/aTRKMciicZTk1q7HwEz4SPIhCYHpZRGRaXuD9m8zAVU/vuRbbhJtb+kpv?=
 =?us-ascii?Q?QcwGiYAiga0i0uOYYXvW+cNn7MDcQKBIRyu2YGMJh4xYcB7Lw9cJbeo/IE0J?=
 =?us-ascii?Q?uH43rgUeGMkBpHqlp61JIhoF0LqpDHs52aHNBz2TlQhQOE+SZBkFeTzQ0IQR?=
 =?us-ascii?Q?O7ANC4eSHsuU4c2Dro599MHnczpECT/fHEtYqjpmgz35v7t7Sgv9fRaF7oxM?=
 =?us-ascii?Q?5sbCYw0awold3SIRDSugUX8tcLguWxmfzaj+YsZqB4Z0vUs+OdnVwxWM5vOL?=
 =?us-ascii?Q?XTXpX3iQLF5cgtqQKFfqmRtJrXAGv2rQvR4HgHNM+hThhBT6FpHRqvbW+SBn?=
 =?us-ascii?Q?2VmI3u1M9DCWBhrFELjN6nqdfEvhDm8jH3AgtMwc1tKZKpzclG1Hx+OqF7+C?=
 =?us-ascii?Q?Hb3/xn4ocgLJZq6KtuNKgSIA2Upeem3ni+w8UVLrB3rGmKX55fVjOVvA8PRb?=
 =?us-ascii?Q?ZHhBwBkTVCxL2icFP/faTRVborcMsMfxkcIjWC0frw8eDlrxlvUS+7IR3MQv?=
 =?us-ascii?Q?Pr4n3hpXQI5+R9voaqF9lzZoC2dfqKImKB6E7fvSd+jp/ac76Lijs3XX0dK6?=
 =?us-ascii?Q?z8LWnwDYJQRmujqklz3xbUayfTQAOs27uEi2NC53v1a5hZ/IKdabpvLokShu?=
 =?us-ascii?Q?gl7S4+Ycy3G77djESsa8hxITkTS7sQ7vK8p7xKh010+5ZWNMpHdvTg2ica/p?=
 =?us-ascii?Q?NEgoUjMOyOwkinJBfkSCVpGEfuZhQT4/SiSBDANWgah+qVUyq6ek6AoQRNUp?=
 =?us-ascii?Q?ldIzX9lUobS99ZSBTZVJvhFhonMhi2NcAEhDqXcjgI4r+oBA0OCNMnOI2XZm?=
 =?us-ascii?Q?BO//2iZjL80CtIqZshg8SPKWCPymTNgWW/7bMOJSeaWGtVslI+1ORN5dxS4B?=
 =?us-ascii?Q?7nKi88X3crZZRsAUBswhUjL28h/L0tP4StgGAWFS7R/c1Ub7mIrsYCPZzOtW?=
 =?us-ascii?Q?WbHtQVIJBir7oe3z1rYgpJZI45bdbuI10p10sFttRq1bnAzBmaLM4SCcIdBJ?=
 =?us-ascii?Q?HikHE9kfiMtnDahMH8bR/VtPpjsdgFsWtHQ6mFE80vXk2zNQqQsNxCPnXvRJ?=
 =?us-ascii?Q?6Ahh6V34NAzCRAvvmjCQAOJzJhQo8UVgxETSJC8DnEYh5hZCb0LArrHhbf8l?=
 =?us-ascii?Q?d2ic2zDREui1U4FgdV4niqT40GuSLrE9imoIGRXHInV6SEIhwZqGyQFMldMD?=
 =?us-ascii?Q?mqBduM9guRCu98SGgKr/Td1y4I9qH5bqnr6hZT08PnjI41jaqSjO73umSbJ4?=
 =?us-ascii?Q?tPUC7tdZEKYs/LpsvOHaiFlW51JaOg4ciZwnh/ZEl7a5fO5+t63m4OwnMBpv?=
 =?us-ascii?Q?vtoZkDylfktR7cW6plrttWYR5LYicF6d1zy1Q+XbnQZBYk8QjvPGSHufn/4g?=
 =?us-ascii?Q?GdeaGn3M7JhWJz7exbklmJjTMV2nAIwfejouypncdCHwWRKc2g4ZobWh+UAD?=
 =?us-ascii?Q?m//eGnpNpBtY7qK0r1Z2ia8h411oAb3QTAaRkhZjhoYQoCIsbmD3FnM78Yxv?=
 =?us-ascii?Q?PucTXRqo2m9bM8CeSlGwA0PKBFGWSa5TUZQseyGPwdjNYulV6UF6PoKk9E12?=
 =?us-ascii?Q?OpJRgC129XDUd+TTWvnLY9k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca123075-1676-4fd2-6bca-08ddb456f8e0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:59.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+eeMPaXJy58RdMyR3tvHanxoNHlRv17J7keJIq+gWY6nuJCT88aw3PYJKKuPaxOig8muPHyf56wnx6D5f580jWW+nJL3N79h6HlgNym2kNCYMYwYvoFLePks6mVWvma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

soc_dapm_dev_attrs is global variable. Let's add snd_soc_ prefix.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-core.c     | 2 +-
 sound/soc/soc-dapm.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 944e2bd80533..1091f9998f4a 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -686,7 +686,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 		struct snd_soc_dapm_update *update);
 
 /* dapm sys fs - used by the core */
-extern struct attribute *soc_dapm_dev_attrs[];
+extern struct attribute *snd_soc_dapm_dev_attrs[];
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
 
 /* dapm audio pin control and status */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 31dd013dcf1d..37bc5867f81d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -112,7 +112,7 @@ static umode_t soc_dev_attr_is_visible(struct kobject *kobj,
 }
 
 static const struct attribute_group soc_dapm_dev_group = {
-	.attrs = soc_dapm_dev_attrs,
+	.attrs = snd_soc_dapm_dev_attrs,
 	.is_visible = soc_dev_attr_is_visible,
 };
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 72e26e1d2be5..78fac9c215d9 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2718,7 +2718,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 
 static DEVICE_ATTR_RO(dapm_widget);
 
-struct attribute *soc_dapm_dev_attrs[] = {
+struct attribute *snd_soc_dapm_dev_attrs[] = {
 	&dev_attr_dapm_widget.attr,
 	NULL
 };
-- 
2.43.0

