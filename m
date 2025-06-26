Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0A1BC9F4
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903975; cv=fail; b=QEt9ykLn7hWYRigo1RPSZR12NQ+V0nA04VzmeRSn5z7YElBCtnklBNR3HoBEtD/z4RuPk7mo/JWQyWpxW0CfsnDU7MmoKSx8RCH6BpnoqEiaPB2W2ikFQWlXivBOduS5+Omnxjj2x/vLrLy79bXXIYdCpausfycxpKrPlJZwPhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903975; c=relaxed/simple;
	bh=XkwPL89XblGPOFQ/6E7oYyTy59110gvErRXwYduzZuA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uirQecKTUSUMd4s9pBXbZztuTgGw5aLB9Kcv8LHHrAQ5Y9tLZXmi+6gKC/MmS7kp67rsc8BLRmkkloSew9BhyHF/5ug3A4qc8bs8WR21gERfe7ipOZhvNnOOkD86YqTE32J9DOvrsU7r/MNmZj4l9GxEIpDC5SNkCzTHiKXC0LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gILeeMyh; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gILeeMyh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMBdEvoqIF08lsHjy6kZk4XMGuJCq8OSuSexfoR3++NfeQDGj3mnTMz87NswLpRWebfNRKJDpqJOJlYb0okGviAev4XK03wYie4+SQVb3x7OvvJQKnCQZSbU2/Eo52DEh9KSIqifYi4SO+UVzrmsgnQugXW2Cx7vdHl7IY8ZV+FxWgDZx7id969CXhmOzqWVJOzHncX0iAdp24XXeBCnWQdqsS4cNv/4txK03V7aFgG/8O0oYswGyETPSbaB+3nuo8oeb73egn7NncHIqkhNSOfFrL54W97JSPdwEMemSNyFx9knqV9fBWEAuAQywGB4B73DFjqwU5lQRDDjNGEiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTz0QGAE3xMqSjxyZLfNn9JjleXWEdTHz3+alIwvMI4=;
 b=Rl0xe+rm8+1StiIGx6kBYI5iwY18BayqNabRy2sWBgxI/2JZwZyUk0Oewzf7YARdeMxljhO7GZ6IgeEPRqIsFf4qOnyw0HI9JCbTRodRnvC8wq++qRGm7VendQNrSwUqNEMDfiVOfVGrRAh4ztXKrxi8SCtMa1OFoWmIohw9Mo5j7Dx34Gby6VKO8/laQADpad4NEa1Ua2GGPnFM+ACuY7+8jpUn+JQpABNhJEawABosIq/V+FgsUsT9NuDPedEqx+brt/SNHYB+iuJG8qv6EwTql2JruyRjPrSQyo5YKHPXVoXs6AawWqXYQDAMpeQLzMVM+7WhJY1f9EcTyYRLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTz0QGAE3xMqSjxyZLfNn9JjleXWEdTHz3+alIwvMI4=;
 b=gILeeMyhRotP7y2Pz3tqhVQyfmmqmnu9g4fCGLfSppn6wrxaCu0Oh7ZIE3udObswM+MJRTEKw/Bask3aXb2uGB4dzHpwqDbLfyGoiDkp6O/BMqSrABG/BjsXrqzI/TeRlRMXHARecYvoaqlldnaNgPU2wyvD9Gb/C98QwfofM8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:52 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:51 +0000
Message-ID: <87ldpf1c9o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/11] ASoC: soc-dapm: add prefix on dapm_mark_endpoints_dirty()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:51 +0000
X-ClientProxiedBy: TYCPR01CA0120.jpnprd01.prod.outlook.com
 (2603:1096:405:4::36) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fdbbf0a-7344-42ee-c6e0-08ddb456f42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YtPKg5NKRT6kpK4CV5/9T+rJh9I4UHO9Wm4R9aHvFT3wDfFUd0M39mxSPd0z?=
 =?us-ascii?Q?/VSgPEHL1IpTDb+Y2qgtbclRiUXUltGns5LD3haQYkKU1xVd2Mm17W4VO0j8?=
 =?us-ascii?Q?dMdnq5GOP2SVKG7f6rqbbeAi7WSZSbNx+Z0GKc/7oR7MMf45GCuh0h+cTBMJ?=
 =?us-ascii?Q?YH8VYFvAc0lvLe4quFfxq/olK5GgCl8V43lDEONMKthUXypQpHpzzEVo6vvp?=
 =?us-ascii?Q?zbmu/f+89o683DUFldS76t4n9hxVZHZ+Ah/cFGePfpnmHkhR4/vkrDBxi1um?=
 =?us-ascii?Q?gx1NsWBRzLKaKUkHiJJfi0XVzowbiTsVWZ4T+d1RvtaMLP7Kv4fqcFXvVXfl?=
 =?us-ascii?Q?OiQt9NEwMDEncCmZDBHhm+F7jJV0mZfdcEvTRi04h646tNxoblzkXEUmWD9o?=
 =?us-ascii?Q?8ilQrx2pamiIBrw061fj3ks63fAOplYzLkvVUEZbhSWRzjC8J4vN5DCYZ0jz?=
 =?us-ascii?Q?iLN8tdGj+c+8XDReIg14ecSsv74+pKYBM8DDXqH5w2iprMwkj82qpycJA5Hu?=
 =?us-ascii?Q?3qZnwj2dr0npSX4qvAQhGzwi3gy5RrzslVnE02FqItxI8P5Rt7/E1VG1Jh3g?=
 =?us-ascii?Q?Cy4RNiksannEHGACBLg5V8nQGDxQvFku6KcaRd1/JMrgYvL9muSfGySte6E7?=
 =?us-ascii?Q?e/f8XAnYzpa9yefokgaGo6SaTIwHRPec7a9qoP75KwhjXirn4m/k6P4L0Z38?=
 =?us-ascii?Q?JIFWouqlTYHk0mEuzLwQqWHSueQBjdKDN7CmePCEIvKEdmHi7qYt2lVhJSc2?=
 =?us-ascii?Q?73dQU9fOUFMfdzsNvbWWoue9rQ+VgSOe7x+FvgphFUae3/4HlMhUS9QcQNCx?=
 =?us-ascii?Q?0FTtIPbsK3zG60imYzKu2LSTXCcqf6G6hcDBLf1m73bUOUdqQLvlXOib19tu?=
 =?us-ascii?Q?QQbMnmYtgJn8Hr5/raGJnzh/i+MmXPq7RxBc/TxA8WYyaWX9iEWKJwfofw8q?=
 =?us-ascii?Q?dNX2P11+M6kbEK7U1pfUV0Dtg+uf+Y8AziWH454tIO3t4BcaVEqS2MAuCj+e?=
 =?us-ascii?Q?pacI6+tJQrgOT1AGUYjYgdibbQATw9gBlHSQrqo9mHEXAAs1hQbVr20l1NlK?=
 =?us-ascii?Q?yCz4+mcg+2jtJ+13EknUQAK86Kjs8DXnmCwl8Os1uNa2u81YAxIcnpPRN9xC?=
 =?us-ascii?Q?uu9PHB6/7VoBtuWGQoBcZmHKWLrXCTEU9vG/GHmlAZehm12ju5qwFMGFLlMB?=
 =?us-ascii?Q?MLFzx1vOWJOGjLq6eriPRKFBicgzR9IMmw4NuGiQv96KVWCvPsybAY/QSGna?=
 =?us-ascii?Q?YyRh0nmoVO/X/2BTo6MetEcBZeThRzZn/y30IiIOqF10+3utlUlKp3LYeHLh?=
 =?us-ascii?Q?Nc1mmXWofzF8CimhguXU4CDC6K7Mtjwp9T2Ubffcurbir+oRKXW4ve1xrBMB?=
 =?us-ascii?Q?bNJPhDZrIwZU+T5nA/IF06VFDTdbMS+7lgX0B9u9iVrgIGihlBtAhSByuiIF?=
 =?us-ascii?Q?FW0EXbKgblKDuNgE7Xu1Gj2DOwXyL5ajsHYaJF2Eap2CkrdgpGzDHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nvioR40+sPNcQcDLqBDRccaFtEQH48RvAdoQ5J5OFWUlS54KzPxHp3NjOLf6?=
 =?us-ascii?Q?ZpFpyHWezTXi1DHuJIaK1EXMvWVqKgTdDz2J/Q1i6rKeU3RJMc0W7y3vRE+T?=
 =?us-ascii?Q?S2wFBTtjychvyPDjDUIUk77HsCc7q4Q2Lv1Fg+TSQXD6QkW5uoI7xdfKbTom?=
 =?us-ascii?Q?jjgCJolcjUgDgQJSJyYtFyKfbtj9QyMmibdNxS3AAWRIngiBfpoJ83hMNhtR?=
 =?us-ascii?Q?Lhp/Jg1gt0oDRjM0oa+RZ5SXlwgetMdLA3K3Y/N7ijWOsnPIsT2rPwI0S6K4?=
 =?us-ascii?Q?79vWccc8Emc3NB4YhZl/JT8G3E61poaRV/nB4t9WqFpikLaUqTeNrK5xIgcl?=
 =?us-ascii?Q?qeyYprOIhdrMFS+naL6enNR3GKkQCxJw+Wnugb9e6KYq3uO8tQ6ZCvp/lEA6?=
 =?us-ascii?Q?VxPaQwMa+2/Lunmd5nQfL4CIpzTYbsdzPDInJuCSM2yNTDwTWCHVPwn8mLuP?=
 =?us-ascii?Q?0PIXlZflcUHnh+LHBSoPocbVNE1VQ3eMdIr6uW85HCLqB/rAyVr45sGrVi0+?=
 =?us-ascii?Q?O32xRvwqfLPuUO/ZQF3pR3x7J04552C07XCJQ5yqkEKfnLgPzEf7yP0tXmyj?=
 =?us-ascii?Q?/JBa3ocw9R/Wl7sRcZCOduMxPyFQzIjEy8hDMr7b5Qs7gdgWr9QUibQoD5B3?=
 =?us-ascii?Q?3pv4laExXjup7rVmpIDInb3xV2Yl+odxl/PCtE9gchwJNH83OTLX/iMPfvPV?=
 =?us-ascii?Q?pVeSMbFAJAgqBaogCZwQHVBQw4GKJoCWPbCOO3EuhAqgT6QRDS+z/Ff+J40w?=
 =?us-ascii?Q?k3R/+DvFhhUBbeI7IHIqyY7iI1Acf5tJ7fv3dsY9pdAYUdVY/Tntaw5KoPYr?=
 =?us-ascii?Q?WNw0W3M+EHRgne3UNGMUDeaZ83hW//GLLfNYivKZ/Vtq4Q+BUDvjZHduGtsC?=
 =?us-ascii?Q?bf7ahM7F9r2WQt+1jKLL3/B5q7dCO/ii4rNn+9aJpDhNmyWYH8DLj+zxyuDC?=
 =?us-ascii?Q?SjKXFDDoOKS0v+yhfXRehjT9J+vE7RmJ5nnpjO5AlBpIYzTak1Zy6Z0k2uLp?=
 =?us-ascii?Q?saAbRsrjtmxJln0nU3AB93nlbIl3naxYDTp9goOOqnRYjMxn73k+ka2Ck8iG?=
 =?us-ascii?Q?a3B0erBnL76mv+4YVHZspd1eCFUA545RbfWqCKeIntznCJqr2V2Sbv2Okfxm?=
 =?us-ascii?Q?hC+gihvCpRCcMRvGTnoAnrhx+TcekH6VipnSmzFcCHtUdx+Jqc2vYx4Bt4wX?=
 =?us-ascii?Q?+flAOTmWjHvwRne/U7MSkx1XxA015besDZ+nJmtwd99q7ro7efyWPt6XoSnm?=
 =?us-ascii?Q?JpENSMOlkCvMsCdEvTOCVovZZLAVSG1O/5qXnL+/Q4mB7rZz8ysOEYYU4dSF?=
 =?us-ascii?Q?2Bb1/ec8yhtfYoL1q25CXXh+VFRN1Qbb5D+Fo8DpKlLYLulE2gQhMSgVfUsf?=
 =?us-ascii?Q?tJBV9ThWJsOnu8GMPprHCS5js1dkrIXGCNwGbQeuvDfLmKcX96DyqKgZw47g?=
 =?us-ascii?Q?fEZY0tAyht21omghfPqw08BKZZ/tVWuanqV3HvTbv+jtgBT0DEa1fYGzkiMw?=
 =?us-ascii?Q?hlE7PNK/WuLQQGh2XBlRzUlFf2eOpZG/vO6J2xMUhjQ3vD39Z4cXcQjv4ReM?=
 =?us-ascii?Q?I3g+0/d8w8Px5g2mXCgPVWhBxenz/t0EOc8CR9wkotfJ2aTu2bLEhPJJ15c5?=
 =?us-ascii?Q?t4xx8pCYDLf+TI2GNUdFH98=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdbbf0a-7344-42ee-c6e0-08ddb456f42e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:51.4841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDdi0WXVUkEmhVzlnmpk93Q9teGgB/UT1TcJrC4KYVzSj/xyXE78vl+c8WJXV02uZf2RdPLR+AUy7z6Gn+eOaQVLeD/oZkZuJvd8ogGgeYmOyFNyMCjWxBsP3Pjnj22W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

dapm_mark_endpoints_dirty() is global function. Let's add snd_soc_
prefix.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-core.c     | 6 +++---
 sound/soc/soc-dapm.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 1216285537b6..535d2252d469 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -701,7 +701,7 @@ int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char
 int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
-void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
+void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
 /*
  * Marks the specified pin as being not connected, disabling it along
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1ffabac1fb6b..31dd013dcf1d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -681,7 +681,7 @@ int snd_soc_suspend(struct device *dev)
 	soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_SUSPEND);
 
 	/* Recheck all endpoints too, their state is affected by suspend */
-	dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* suspend all COMPONENTs */
@@ -778,7 +778,7 @@ static void soc_resume_deferred(struct work_struct *work)
 	dev_dbg(card->dev, "ASoC: resume work completed\n");
 
 	/* Recheck all endpoints too, their state is affected by suspend */
-	dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* userspace can access us now we are back as we were before */
@@ -2289,7 +2289,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	}
 
 	card->instantiated = 1;
-	dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_mark_endpoints_dirty(card);
 	snd_soc_dapm_sync(&card->dapm);
 
 	/* deactivate pins to sleep state */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 88bc5b47e83a..3f94a6d974c4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -283,7 +283,7 @@ static void dapm_path_invalidate(struct snd_soc_dapm_path *p)
 		dapm_widget_invalidate_output_paths(p->source);
 }
 
-void dapm_mark_endpoints_dirty(struct snd_soc_card *card)
+void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
 
-- 
2.43.0

