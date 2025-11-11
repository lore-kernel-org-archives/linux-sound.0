Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC21624DF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820550; cv=fail; b=dsfGtJwVW/SIjtYKWo5+y/pxNbIZeIFvIsFfmAGdH5zRMjNQD9j0kRhm/y1I8qAU5vleuk4Fo8RWvimo3p3lIlqkV7VaBfM8dCgtK5rv+/4wTE/baouZS6TSrICkzaZ+MWoZccKXF8Dx20S1DpTEfgTX62xtHGVClmwV/egLKXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820550; c=relaxed/simple;
	bh=KItTh3JemJgk5xtfvWg4aGNbS9SNrxC6w2H3+iprKyA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VGQcGO/LpWdPx5s/JNsDtPqy5x0RVK4d7uKLe7GwiL3UpXbyNrczspNB0pEqyH4GWDybcFDA5QQLoWIMm64Ba9wjKPGcyqDer5pJ+NQrkSRF5Q0cPgGV0Dl8yhl+WJZMcA1/93Wb/47HVn44sGS2/jQrhhhm9/3w15DBLq4HCjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cg5WB5tp; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cg5WB5tp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQX4OVbyTn8FK93Xu4wdKyVH+ZcWAXc5uEcIMLfm9luO12OVLPfdjiZYSd/s/AWPrzsET426sj1NBy0LT0eOXU092N+zRFfbayJNEfymq68dpbBCqkxQhOae+1aAovxJyh8Db90xzQy5KAhgPHXA4ZKD0v5hg5Dc//noEIE2+ARwHh00W/CTlbfRwoDOW52brBrv9Nffk/E2JuR7OyV4VAU4I2kAvIR8hV8zVw1VxKPOn+HXS8nXlrFzGnJ6CUc7MYL6zUeex/Njek2V4U/bx2g4kNnmwfFBGpJ4FgrhMdMLAt3nNCRLA9wpP8g3xP37d2emhVZ0NcUYemwN4wxTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5vak8OdcHGzvv4runDumMkAtpcjT6KJVkfXapcMQ3w=;
 b=w4HMgcgPZVEHphS3qP3G1Eyx2fA1rKoiap+iSD8CTiOG1e3Am3eX6ErbRV6MPc61WFF5qsCVCUMywsH60OVu43aN8HPioJ0E7OkMZnQWhcpQy/6RWj+at0KIem3YkYliWwve16NMu6MDDA8ESsdlDJpEcOXJ7lhlKqB+KCWiXJWSvvWmBUEa//abt+9E8N6f6wvt8mdhMlQ28Kf1VpgpGfxaRVuYCwtpXgqs7Lj2ns5WaoYKLsjCUY+Yk+YQqh1QqV1NUdJbWY2MLY+hwdnXrVkjEcZdVfQ7n01i68KG5XJli+KCv7zyHLxTrutJapx7dUG2VZ2qUHnuXqzXGw6zIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5vak8OdcHGzvv4runDumMkAtpcjT6KJVkfXapcMQ3w=;
 b=cg5WB5tpOdkcgolBTAUd0A1GZ4AEg8PAGrazk3glgBlVV5U6aKhIQSGm97BwW9eiEdO52tZU56Rwvt7sRjxlhVjUw1CWfpPvkZ13rM6+ktthZqf48LUUX2SxAkpGySQHuQmqXtwv297z2d6IIctq4Cs4ANDfzAiSwCIxJ/aUBWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:26 +0000
Message-ID: <87pl9p5sfx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 065/292] ASoC: codecs: es8389: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:26 +0000
X-ClientProxiedBy: TY4P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 843e1bd9-1cd3-4ad8-65d0-08de20b8645b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GyAwvQUk1j9gzwTXqLkA+5xwUWT0B1ET/vqtGEMcAAMlt/y1bNox8u95FXpK?=
 =?us-ascii?Q?NjMSVYjHt9qT4qJk/JkPUqWPvtA9+YTIjGddb01gZ5HRKiqN7iTULopo/Yo8?=
 =?us-ascii?Q?o76domqpi+ikgQqivu+pJbXTyoAujRbreNor75d05KXC0c8klhLIoAKNDYXk?=
 =?us-ascii?Q?p6GI/brlHRmYRJRKq+2PZA90znUvO+zzCqOYAAumLa5w1g6PP2Dhf7r5+LAX?=
 =?us-ascii?Q?xFMiageYp2Cj6MeL1i7F1rKNd6kEasyNvuCS24dH6ZnlGrF/M7t3uL2e9a+Y?=
 =?us-ascii?Q?UWyWcxJV+L0kFIgqqt8R2MY8jckYphi24ojZw4Jh16Lvq4GYVE5ThvBjaQgy?=
 =?us-ascii?Q?lhWqHfvRU//dC8TGYagQIrCH2KSgk4yWEE2ZDmpnlx7CJFuBPZO17Sahlx5w?=
 =?us-ascii?Q?brXF1GXhmCPO7CfK9+A+zwWytUZ46HECOSf7+1t4G8o1hF5huc6y8wMHZYPw?=
 =?us-ascii?Q?PCknTJqYdbBUHuzY3X0cYX8128QNjQHqkhHFNN0dXWseh1VERdI3zxiui/AU?=
 =?us-ascii?Q?lI14L65ywB4G58r8PhNIypm6KCgpvsJLxm7W7yRoPUK1XhWiUMLLfWXjDIrj?=
 =?us-ascii?Q?QVxEBRMctHaq0vciUP6dvBT8Pco0QpJg/ndxVIrwbc86fMhfh0onYWnwKFbM?=
 =?us-ascii?Q?8P/bSK/3oDa/mwultU/qr3QBeupeZ4Ksmxua3F72MocSKD7PtDzuLZEx23Cr?=
 =?us-ascii?Q?IzGZyBUsG5ccnLSAXWPemS2yr+t1oXTNVc+xL1OxEPyilsjVqUP8gsVPBzF5?=
 =?us-ascii?Q?3BTu2WTz5Qb78Wm+83J683T6TXvuR5KfelT910d5CRYrSYsoZzH5pyYs21sy?=
 =?us-ascii?Q?KDIUJg5ibiEGkM2Oo2CkNfmgjO8uYoCxHHXgSxuUEhVkE/geDDK1taiNxG8B?=
 =?us-ascii?Q?uP+k3HaOK40sa5ewYds9ALtK7poWlkJImKKJQZ5QMWxBSbyb7wiSpn/6ntS5?=
 =?us-ascii?Q?IrJmmiPSpvZ8Vg2b9f57rSq8Z8Phrmm6Ou6Y4KA0g80rRCrnKcod09lk2e6Z?=
 =?us-ascii?Q?fKbh4/KxiLqbMEhwDOrfonCa1JH/MX3aDv92VAFIGPKb8BESnElBw8Ne4tPL?=
 =?us-ascii?Q?5PPc9f+xfPjcCLdPEfjZlOwGcUUZS2ulCcxfRt9zUOCRhvoT/oGpc4zyHVNM?=
 =?us-ascii?Q?3ndOUBTum65s2h72Y/obi/mYArMgfm9TgyhGobckLxaSbtjTl1R1JNwkY2P+?=
 =?us-ascii?Q?tHA8B7ZCa4tHU8SytqW4N518Q8zfyn1480IVWTfpdCUd4XPFt7DmpuPr3YKC?=
 =?us-ascii?Q?4mwcwygt5DHAynLbajNIQfaRK9+myRhPDjoWiFciilnYgkEcaSVEvr615QrG?=
 =?us-ascii?Q?SAD8eKe7t2RMYd0pECILk2QqSV+KR1VaXyufMJvYWWuCcGRnsBY25+sQbbmz?=
 =?us-ascii?Q?KIX++TCPXkIYy8+GtUa1c0z08jKBx47EbKRiHv1Y3s0nzo18/DPR0IuE5hIj?=
 =?us-ascii?Q?tfjpzvO8LZAI/CIfZxpuAVycuxla3iXO0ZkHzXBs7E/jPgKwBTEb/jN2Bg/I?=
 =?us-ascii?Q?k0NiX+grx6+HLJbebHivKaqYicjOMBUdfHmi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uaj+ZRtiF6vJa2eeiS0rgddLr2hfe9LFlK96mxGXkZ8/0FmHuAp2jDV97EXi?=
 =?us-ascii?Q?TvZ1NJggXezuIebKaEvMhjE/Xb4giHT594LV5ADR/joKcXkXWm9tBoxxV6iG?=
 =?us-ascii?Q?lXQxOhh1hMrQ91E3Y2MPXf4pmSbCTookLvev0oJIrROvEpYyFP8k+0RfIR9g?=
 =?us-ascii?Q?DyessVwjwdraIHTKqtpXX2qhDIHHa7254zCk4nJUAO82YciwG3AelVOPsZVR?=
 =?us-ascii?Q?VL4dsT7dAW81S6PUqbhsewchDsaoSOAoLtTqgb/M4jUPgZfw3u2ZZ46alrPc?=
 =?us-ascii?Q?9mJFgDfLnfd4o/y2jSEhZr1Ehh+amJOSWOdlYFUkb4ZzIATWt0jPo0HucqO/?=
 =?us-ascii?Q?QFtlTeXnEMRMTckD5NCxs+TWmXf63fMF7rHnWLHoliugW7DAxa0k+bnCpauQ?=
 =?us-ascii?Q?flxCbdPNaBInC10CE46BvWk/51wGQZuAjOsmAnvGuLOWrS8j0oYnfyi/IJgk?=
 =?us-ascii?Q?N31wCFiEhQ3ZALaLe+o+Rxs4bGB7fyczQJWiQVC9l2lkt2Rs4+VRJSrxdDS6?=
 =?us-ascii?Q?iy4gxBdxpMI5fN/+0dOcrMG7J+4y1fntCsI2yMcJFluL9ktIpnJ6clJrlPeI?=
 =?us-ascii?Q?ooQF9iFhPNCkLVA11QeKLV6IgKjvj3RqHijZS9NHGS4cQUJ1ZCJobo34O0MI?=
 =?us-ascii?Q?eUf9t0O8/VqWncJBLGR3O0sQTr/0x8TucHpmLmdw1/IqmZ0anliA4Z4NUQ5R?=
 =?us-ascii?Q?EnOTwrwsr2owv2a1IOsYMhsUSJz20LqQJ2jQpUw9zrL/QsIaIzqgdvQQewNp?=
 =?us-ascii?Q?eOLpttv8Il4uZTRWFfyd6Vcz5cVqh/iX9IuKvK/dD6WT5/YVE3faovnB+IZQ?=
 =?us-ascii?Q?FF+nQvJAlCYDiXEOOFgFAE9tzEjZBh5mexqwhKmJs4GUUMZOlIBmM8eZsd8C?=
 =?us-ascii?Q?0AyQk3qoZk4bD9k9MdmH7QrWq7jF6CfpIJEwfwPib1QtPbzDs6e2xUOXMuIV?=
 =?us-ascii?Q?oOsuTlimsZTlBFFSFHuYRtZ85f83TO+9oCSKredLaKKOke/Z0Ho9or8mLITD?=
 =?us-ascii?Q?i9UadCtOG3ApiKVh3PAd5A1CYEPZLiViETotW7oinTGqAngT9Y7Yi1pZlfQt?=
 =?us-ascii?Q?GItDcOfT7g3oLJMpTVn7mcFsIoKxeNZcbh3qg45qYK5WlOQe5N8Mu4LfkUX0?=
 =?us-ascii?Q?0Ebj0gII9ivysYlOIxa6BkdTIb1ojbxxaG6sOQh8OGG8Mw2Tky5Ywt4+jIc/?=
 =?us-ascii?Q?+CkU7NcVotdhy/1/VDfinnhzIPveSVdVlHA3O/1tYyy6rJwKIz/e9l3efgI6?=
 =?us-ascii?Q?+FiznqRkMz7PGGoCq6TBzQYdaLN7+ls9T4ld/bk3YzddVHm5VE2LkkQ+W+1K?=
 =?us-ascii?Q?hO79xCBemPKxUoY8aMpIMNbKGCrdRoWeQQV9+qZ5zqWz3FE7McBFCu/7/jfX?=
 =?us-ascii?Q?WC3fYhdZ3djD4IKnTjAvVSgnFK41G+FVraR6naGEKjlFuPRpVJPIpLVXnikv?=
 =?us-ascii?Q?pHYuVigVYpbI9qDPgTKv+rYEq9MOI4btJQsPfq9TgtEeJnZcYK0ZJCyTeAg7?=
 =?us-ascii?Q?WSk342qIU9tvO+tV/rfHJJVBnIjPox0Lxo8a6ViHSpPD7dGqqOm4PGmqrI4N?=
 =?us-ascii?Q?GqkTA2CLdkvwtjrFZXjIN3ILL/KyzTTBWNzAvj1Ve4/dFmisFpDFTaW9Vngl?=
 =?us-ascii?Q?NtKW+mRdAFDj3XY8hdWPtA8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843e1bd9-1cd3-4ad8-65d0-08de20b8645b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:26.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nEZuq3aXpi8Bv5QKo9hS+7/77uIgLNgf36aVY03cSC0d57NTNzZCSCO8boj+qAOv9I/ZLFlVRLsfzIhlMS2cgUhsuu5xPCVcQwQIidpq03a6eO0yLmpxO/Q1tpjexuJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/es8389.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 6e4c75d288ef9..a84d79f9d3d18 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -57,8 +57,8 @@ static const DECLARE_TLV_DB_SCALE(alc_max_level, -3200, 200, 0);
 static int es8389_dmic_set(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int val;
-- 
2.43.0

