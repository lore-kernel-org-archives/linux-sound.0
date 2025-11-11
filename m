Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA756223DDF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821298; cv=fail; b=FiB0QxneFiaU8AHA1ToQ+dwBURKXQzqSCzeNEeqFTKHEzHDRr8/5s7nyPTinLY+OAeS+zVgDgrvlPARMEjp/bej717w5dg79zKhmP01FDg1zkXoqTZiSXQKd64k+FeWM5gXJfYIfu2riOlmGu4th8AHNfvPMYfJ4xOSaznWd418=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821298; c=relaxed/simple;
	bh=wZldhIz2K+nAddJN+rgK5MFen6P5PugbrleDm1F1Qkg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Js5N2TPhl1GAUKW9ljvqxMe8tZSqxR5WjvMsTHQ4KAbnYcvlHdZelfcYYM9exLT22RJak3JOnuVc/UuyjGihOy+yEl1jYN3J26yq6Q8L3itz+jvCf7q6FxgvxKl9L8hEBxXAT+Bt96VDVczeZHIigIfXe5UzsOi9C0ZpJUQjrZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ijf6vL6v; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ijf6vL6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZBmCwdnrecJxZUmUun3l/svt++L3yh8p5JF+ebywJNKuZhYE6c/xphkvh7iup2rBUqx1kVpllUnxLsmaBDaYxF9RDEUV6Ovp2rRmTrl0JLyrcekuEVoRp/p/QLAG2gCDm/BczPp2uqbbt2UAnlPHzwHErr3YLT6krEtBXCxLzz9uMEzQ9OK+1iTt3BSU6KNE9LrbyOGQjhDmOHuSz/Cthas3K3gvlG1xGiNvwlWJC/gLOz5mLor+jVLCn3HacICEC9os5XxxrVyrT2raLUJW8EI2XHRDQG/idYQgo6WTZ1dXoh7vOlAHLzLNtxktJbcReE7NhXwmsWwyVFvaZHhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZBdeo4a8aUKpM+84XFKt+Mvxdc6umaOGBTCz3R7qd4=;
 b=ShXOIP0hC7pOKGCE/hNcBJqQIQmgEU/01qmJK25RhktZbwFvexxDDU4KibT7bpKLX+YT7BOzcjQOmvi1LP18VBsHiDCGcKydPLVpjEODvIDC7djC7QlvOtwqClEwl74pYF7pDU3/i8xE5HWy0rW8dtUJVsj9T6Rc/IANphT+NVL9JyMGxBE80AXMwvwmEJs6+nHlYtNKSjOgCzG4VeYl91XP5gzUXCVZFRkCC+oEBmYpDfJJNxdkTWkKDXXkpm+sJYiQPZGoLGrHiE+QF7cPYTZIWEfgL90Z3Mo2sLarAER0z7j8bXvAQAZydmarW9aJRot36qSs5Sku5JGq4xWXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZBdeo4a8aUKpM+84XFKt+Mvxdc6umaOGBTCz3R7qd4=;
 b=ijf6vL6vgIR/k+ypPYiBvxZEMwXL6OhEbXLif53yhqXSVZjicVjGkVAVD1rvBN9c1hvPKFEHgyb2k3V905xv2GewojP/eTkFZCReObT5lAUiVryMB/lkuXolVfeRgiSKefaBDYZHm325BfUIXQKrWTkOpnIL6LYBxnRzxgYZe40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:34:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:55 +0000
Message-ID: <878qgdv235.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 252/292] ASoC: samsung: smdk_wm8994: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:54 +0000
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 11817556-f172-40bd-22a7-08de20ba2282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HYqsI9dy2vZUlGzLtR4U1qe6xz7m7OHN0e6yIbBQgRPgpfzjilAFN+PKiV5V?=
 =?us-ascii?Q?mLC9z64GGPS4Xljt/BehcAeNGQ0ykNY8s8c6J5RwZgDmUGiIDc8Ix45L/s7P?=
 =?us-ascii?Q?MBPiN3XvTNCxHFGRiQDBJms4D3F6O7iYb15w6bnPm4viZMTsqO+kROidpSgW?=
 =?us-ascii?Q?f3HTT1upHUx0taqybxEydOGxKllMmgguK045ZEuge3lS5hjxyXZFM6/vceQ8?=
 =?us-ascii?Q?oAsPhFjRl/XOg2Io81f6OWPI8L2ISQji2NgfR1zJM8Y7uvJ3pfI57RDYTuxO?=
 =?us-ascii?Q?0JgFSoSVMaFXw5FR5luIbqCwaJ4duRudMJLRVPRg6IDfP2YsleZIiy+vRb0X?=
 =?us-ascii?Q?HAtCuGmMme6aHgB5wum0trjxJuZphzQ70yZC1v4XOTtR3hYWxu1Uh1ftwS2h?=
 =?us-ascii?Q?oVCIvrmqk7Um6aJWDh6mo7+tocvTtzZwdeYQ2sEnssWKMk3bc64ARjW/ezfM?=
 =?us-ascii?Q?Q1kAPZad83at5f6Z8DcaUtx0a375DC4HA/mYWUh6FR1ahZcyZdhpIyF+NG89?=
 =?us-ascii?Q?usEoYE9vYVQPsYsmmrWtnG0dneL4Q9kG3yYhDaJMXzuI0gD4gh2Ipd7Obpp6?=
 =?us-ascii?Q?+04t/2/A0tLoMRlMT2mSmQXOg20mT/FOMTyfk87gqqicGZ735MUEmoDMKEKk?=
 =?us-ascii?Q?WFeEgTafS3s+nTUbg2rwDm8CyL/kXh902LcWZXDruB6BISbgoNjiOjO0fDoy?=
 =?us-ascii?Q?NWQYsYwVhATvJwNOs04WNqANBzhQkLNdGa0Lq8YjLjPVQyyITK6vAVddMooZ?=
 =?us-ascii?Q?n7w7kbg8d9ahK0+LMSFEo4BRErzixZuf+Ra4ldrTu9URGtXWwlzsMUAKZ8sO?=
 =?us-ascii?Q?QoQImByNZHkTbCNXId+IeIX8hz8S8jSoUvxOKz879aor8k7N3yADvZncp812?=
 =?us-ascii?Q?+qsyHm7LA22VNoa/tQ7F0lXaTQilUND9RNsBrAqJ8Q7t89T5DCEjwWzdZ31r?=
 =?us-ascii?Q?aS8F4tM0arTz3k1VZfa1J1gPWOKmNWmCYMQIgM48USmwjjstAcTHxiAz49ZL?=
 =?us-ascii?Q?D6f2w5GuC2k25NtHP0P48oGRjcFASCu75jT5lQ2sEJ82v0rhBSZyDDXvneAa?=
 =?us-ascii?Q?ajYPhmybUnWgy4slBzzJXNRJs1LOsPQJ3Ad1Klj6rD87IrXuEwacj0GdbO/v?=
 =?us-ascii?Q?h5BHP1bF9qQaPLS0WnAOMbkLHISdzyD17Ug74K+SlfTVl4MKAdKQVfZFvfo+?=
 =?us-ascii?Q?HvJ8asDjqyImAVKMXyrf7A4lwieeAPm5DCumzmA0pU0Q0C/jc7lgavpp7+4j?=
 =?us-ascii?Q?SqjL2gPX+ciINLrMmNGO8GxI8TXUfY3OqGJTaxMPMudA3fsfcR3iYiii8C6r?=
 =?us-ascii?Q?cdHG8HXtnBGLfk9KKDSE2WlOsE170YKbqD1z6BI89RMGWuu279a8Xat3prbI?=
 =?us-ascii?Q?d21UZC2+EnmPWB01jdfL6kIFTVaIW2xx9OENGsiZK8VA8uFk6L5u4L7zAYPU?=
 =?us-ascii?Q?5h1Z07Zs4/UGANueps8Zy2Drw/WtX+e/OqGog2m79RXfzIUkEH3XKdIw/fp0?=
 =?us-ascii?Q?uk8bxxePLvsH05vbG0JFr776ESuNl7I2TRXX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a2EAn/r+80PcOmI6QX8rlGtdKLB88Q8WyLqbb7ifryLkAyXGgpUGfc8gqC01?=
 =?us-ascii?Q?OJ5GraMgtk3PJgMx0KErIe2lHTotOl6/j3ol179Ok5mJOJs2lnzQpEV5AA/V?=
 =?us-ascii?Q?qjT41yhKugwbpqd3CoxSXVGgo9neibaibRxasVdoQeBUcfyY78kBWgJg/NE7?=
 =?us-ascii?Q?POLHClWsikeLX8JyRNe0Yfuh9G5QkCqFmqCs2tPx4GSTUF7QCgvpq77TRZNA?=
 =?us-ascii?Q?5vjWJ12HLflStB4V7nAsa/pHm32geZ8rt8EH6+ZRW3yiGdfyeG9fvhSndmy2?=
 =?us-ascii?Q?XLAQHsXx8G4PAzJN+GVPeG4CxLYlOXcZMz83IggWsYWeS6Ej/q/xj/X01+K7?=
 =?us-ascii?Q?KYb6bsf7XAmDDVScLpgUTHPhn2s+nJhAGgbCIbYyrzwfzWUMjxNHNW2+bj9x?=
 =?us-ascii?Q?dMV4SK8MvMq8kzkVnOVFXaFEkSArLmQd4gzjfxC2QdRrixBQd1+ffxV6WeAC?=
 =?us-ascii?Q?ba0y9jt4K01+LgmgMkDlXTjZPsF1QseJJvYcGdW9RcVuuQKPt6QO3/gd8UUh?=
 =?us-ascii?Q?TCMBf36YSkKxt9l7rh7NPbCH1Sx0jWDIPuuKuEvz/iQlHhQ/zAFQOVy6IsXt?=
 =?us-ascii?Q?OVGIj3je8UQtbdOxhhJ19gxfgGa+k9ZBTv+EzNyEn9UG8wKZjKw2/Evjyxl2?=
 =?us-ascii?Q?+DZ5wyj0TlobVvb7SztBv6VUdNz66JNDjfzuNRYFGx5kQorykVTRJLo1/CT7?=
 =?us-ascii?Q?vIMKUD2sDnnkDKs+94ViJPS531zFfX0hYkOcfYzNh0eKev/7Kd8e4vmPHU+j?=
 =?us-ascii?Q?OQKrSOQot/pKp7Dyxy+pJ1Ep3vPMwzXZ9ZBuls1FjciHS64/Gsz25LgSy2Go?=
 =?us-ascii?Q?LYCSESwlvKfNEA7yLeUqgD6Km8+axiButBxu0OQ51ULj0C5ynINd/w0MWo+F?=
 =?us-ascii?Q?bo7L6l+yuFm/7ATnYBuAET9ufII2m8AVEf2nNN0ES8xdQDBp8/CyQwFQpvge?=
 =?us-ascii?Q?xGn6H8mXi8Ej9gUtO2fZpQ5C87enh9O7nbIel6WM4PEus4bv6ZL2mf8n5XeX?=
 =?us-ascii?Q?F9bCOsQu/IFkuQLI2E9g9Nu3sKqMQ/Mt5cQKdjF6sJf/gDbtala9ED+sbfkA?=
 =?us-ascii?Q?7udHMNAECw9vKeyr/qQCa+A8hFrW9UQ4bArILyhaSNh1gA3fTn13Jr0WkMZb?=
 =?us-ascii?Q?XOiEswYlrowgdd5Er+RCpzwYXdUuJZGGFX1dBAHVEWSwDMu/GiIUNAqWRhAZ?=
 =?us-ascii?Q?3OW8jmG6vyN8YhJ/12rrwkl3X17bbY5SGyP5IXyPJ4iAnuo6iwGLxbWGwM1h?=
 =?us-ascii?Q?+Vso+c32REB7VR+bXyW/OIvO3eC+KeRAIbOMIU66Qxiz3twnZ+Y+v/wu4sRY?=
 =?us-ascii?Q?+ja6mlCIxBMadOa4jWWcvnBiVkO/jOljHJ0eFu84LKkyk7h7/y9dKNXrb1av?=
 =?us-ascii?Q?z9JDUVgqw28hyTr2RTujV0ACcdNw1weAPG7tRV/b6tu5PPHXukOZBnmQ/yBj?=
 =?us-ascii?Q?h8I/qaTIB0vn8OwnGtIbboOtGmVX/HBih2Mxf4PYjHV11ncAKyL2KVqdRkKf?=
 =?us-ascii?Q?B+6lim0rwZ66HfPOOrxFaRMPKe/OCjRd1ZxlUe5CQTcS8Gnv96Fq2D80c27m?=
 =?us-ascii?Q?CdPvWo2zuL9AHbE1LqRobQHQe5W8/Hee4m0kvvSJsLhp9DZm7LbuMqyYfHD9?=
 =?us-ascii?Q?aU9WOllhBR5O4uWBT6F/7gg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11817556-f172-40bd-22a7-08de20ba2282
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:54.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJnR1o7IinnZ/0E+MgZAPp1Txa+MteNE5OwY+TOFS7/eKGlgFkS1i7RNN/y3dR/Prvq7Y8HpjeLVpnwV81KnNJVA3ll3NG/UDEZ5dYbbaXfFjqKD2xaGNH7P80RhjmLa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/samsung/smdk_wm8994.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index acb29cd785a90..911f56b12f0a8 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -69,23 +69,23 @@ static const struct snd_soc_ops smdk_ops = {
 
 static int smdk_wm8994_init_paiftx(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	/* Other pins NC */
-	snd_soc_dapm_nc_pin(dapm, "HPOUT2P");
-	snd_soc_dapm_nc_pin(dapm, "HPOUT2N");
-	snd_soc_dapm_nc_pin(dapm, "SPKOUTLN");
-	snd_soc_dapm_nc_pin(dapm, "SPKOUTLP");
-	snd_soc_dapm_nc_pin(dapm, "SPKOUTRP");
-	snd_soc_dapm_nc_pin(dapm, "SPKOUTRN");
-	snd_soc_dapm_nc_pin(dapm, "LINEOUT1N");
-	snd_soc_dapm_nc_pin(dapm, "LINEOUT1P");
-	snd_soc_dapm_nc_pin(dapm, "LINEOUT2N");
-	snd_soc_dapm_nc_pin(dapm, "LINEOUT2P");
-	snd_soc_dapm_nc_pin(dapm, "IN1LP");
-	snd_soc_dapm_nc_pin(dapm, "IN2LP:VXRN");
-	snd_soc_dapm_nc_pin(dapm, "IN1RP");
-	snd_soc_dapm_nc_pin(dapm, "IN2RP:VXRP");
+	snd_soc_dapm_disable_pin(dapm, "HPOUT2P");
+	snd_soc_dapm_disable_pin(dapm, "HPOUT2N");
+	snd_soc_dapm_disable_pin(dapm, "SPKOUTLN");
+	snd_soc_dapm_disable_pin(dapm, "SPKOUTLP");
+	snd_soc_dapm_disable_pin(dapm, "SPKOUTRP");
+	snd_soc_dapm_disable_pin(dapm, "SPKOUTRN");
+	snd_soc_dapm_disable_pin(dapm, "LINEOUT1N");
+	snd_soc_dapm_disable_pin(dapm, "LINEOUT1P");
+	snd_soc_dapm_disable_pin(dapm, "LINEOUT2N");
+	snd_soc_dapm_disable_pin(dapm, "LINEOUT2P");
+	snd_soc_dapm_disable_pin(dapm, "IN1LP");
+	snd_soc_dapm_disable_pin(dapm, "IN2LP:VXRN");
+	snd_soc_dapm_disable_pin(dapm, "IN1RP");
+	snd_soc_dapm_disable_pin(dapm, "IN2RP:VXRP");
 
 	return 0;
 }
-- 
2.43.0

