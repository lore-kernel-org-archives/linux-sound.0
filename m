Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7111119D074
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820708; cv=fail; b=I/zYT2tIgAbQ2rtP9fx/ji7kpdCWlwEMt6wEkBSYIEtxYC+w4Mhy7+PuAaazG+3RXKnLvaEBSXdnyb09XCRGpmbkSmZ66nsMYO1Yqy2Z5xf+6KwfX2Co9DQ1O46Ot9H7FumNcfkGFatGf9IlHmew4col0IRxw80I1Qz1fYReAEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820708; c=relaxed/simple;
	bh=1JoGb4g5REq8ZrU3SLSa5ofY8EgK3zt1qpmHNJNVSeI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fl0tNGKYDdsRcMgj/w+6GYEXWBV/vKwLv0buzOHfBAOIzhSiPHjxd5Vf1RtbiVdTNDiThrf4u4qjxT0S2I5VDaSN7Nh2yutrniEg8x4g+Od7tqovg0PchHGm4iPj4XkZiO8YfAqSpWu08Qip/1MKLf8wF97p/Rh9ker68ZI+XzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BxqFVsXW; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BxqFVsXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfoReo8tbsUHY5y5vZzB+yriRnQqatH+QUEbsz87rkeE8ErULtdJldDKggq3+BZOzBOFm0ZY7edt5QWKcftyfNEAj1xJJIDAH+bYrIcIt2UlcPeFGUDHS4AQRHuwmDEQXvmMujpuM2yGArngkUZljuHN8QAbbJD3iTM5wWaNK20tgN/dP45y6SHdp8ZH4/BbTUafdSNm68JHb0twuHr8kud5ApFOTOnYLlJA/33fFxIQdgd24u3r25+RkULNKYwAVFtJPuzEUIiH9nQDGBE1xinY09YQq12XpPgiqK/2OpIBjCM2wuWL10Vh0gAjCzvAoeXsb/rv7i7RmnfKw3RfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H7RR+tXnm2ZHoaxMIRlVvzVaBW3bR+BhOfZer1TQUU=;
 b=Xd80azA1VG6BhK8/lhsXFFPxc3K2sSPMbZJJ0WFSAU0S/tGDJjhgrc+he64sQ4NQ0MXy1fhwDLzL74q6RHHeuCLXewQjtsdyjBP3HaBtZQfzoCVbDgP42ihDYmnHMPjyTtivU5/BY8VAq+/uD2kC/kWO7vw/GxxP9VzYna5NgHKOvf6hcMJGhA6XYCJ6hqWZw/O8ItUM7QcWC39KyHJEyJaboLfohTuX8cTjdLtWqpY22Pz6P57VPyqS5jHOGu2XlQoG+K1mOwu2uAZlTTILeE9VHwX3U6petOC1eUOoql8BH2RRimqWHmdoPCFCC2aNBJtAIC3454RcoJebRAeemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H7RR+tXnm2ZHoaxMIRlVvzVaBW3bR+BhOfZer1TQUU=;
 b=BxqFVsXWT90/S3klxdop2GlhNdqaNYrpUpufgxxLGCU1t38DvTr2KEMFYJhSoB7DvPwj79XBQ7JByemrIEIP+cvk2VYIwv/JKHMqRuETZsiBDM4IL33UmhdpDZy8rWd5fQfPkn4MC4+o24ryfsq4tNveopburss+HN2NepeYZqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:25:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:00 +0000
Message-ID: <871pm54dr8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 107/292] ASoC: codecs: rt5640: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:00 +0000
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: ffaa3cf6-9340-4f0a-6661-08de20b8c000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W3NVFgK/990c5qDL+SnQge2phO8USgOrX06HHE80+w2lHT+Ey42htOQ7tygl?=
 =?us-ascii?Q?6DY4ShnE8QxOi/dJ/UtUh6Ca36VcWBw7s5AcFD0aM3Uhtq3I6X7FZ1Pq/TuG?=
 =?us-ascii?Q?KfT7hokeY6GmKpYRvXY6XuIInhr4v3GfSeoN+9tdNn2xDa5Zz9OD0LFBQOXA?=
 =?us-ascii?Q?KhBxYwhRDnyjVhXB+Ehq15Au3A29ItcNVKzqnzyNhlT5hUanEWtXTByKLoDa?=
 =?us-ascii?Q?e/4Q3IL7q2gNid2NU7Lpn9DcZmEvn9F21/OEvR7dnU0nZf6IZ0c0G53YRyd7?=
 =?us-ascii?Q?kRi0cNzq6Sz70jbBKGJohrvh46mDYuVY0Sz7sfBd9UX6fWbvRH7s5IjkXD5Q?=
 =?us-ascii?Q?6r9Y9ewCA9g4sh+9GSZ+zW/EsdmTz7Dx9UkhDKPB/KevGzP1GTcUaMleD7xK?=
 =?us-ascii?Q?RQwrzj8Y+UaUwOCt35D0pBl6+yxSF4y+5BUcK3WV1LQ3iBksJ7n7ZC1Upq4/?=
 =?us-ascii?Q?yq3vSJ6bTylrp1i/SL31nGW+btDmcttFsou82lcq9qsFUaf/iSsQYh2GjKt4?=
 =?us-ascii?Q?QAordnyHzx+bUyNEW7EUSw4KZcU/zTRR6+eMWO1LK73M4RgRcqNLefLKELFI?=
 =?us-ascii?Q?5kPn4VZV7scRv4SGsJigQeZEVrO63XAYGChFahIYTbXRrA4WhJoQpdcV1lX+?=
 =?us-ascii?Q?QczjRgK8vM+fZPCcWLTQ3CBN62a6oFj08RC1Im1Kt7ix10Dn6C+tSkXILY3N?=
 =?us-ascii?Q?A9talyoNYp8QctrqfikUTCDu9l6MxMkTs6itCpF6PCI8WP4oVZ3DG8ZoGRN/?=
 =?us-ascii?Q?4cQFunLC8IuX4eXfTzbApuxvzkQjT9LtiKpPB05bhNVojeEuBhF+uiqCagS5?=
 =?us-ascii?Q?M/kgL0MdkGmC7rdZeK/yXLnQynauXYlslYFEKzkwpRnJYZgwi2aLihMPJnRz?=
 =?us-ascii?Q?re6nDe1e0u5jsChjqdq/n68ZyI82u83Q12nwG1rCxfBaeHMqY8lu9AuYMWD6?=
 =?us-ascii?Q?B7r03NPrhwsNEZ8B15IPYIjuFCxFagv4CdNh/RMqRry7jMJghKc43xJz/isq?=
 =?us-ascii?Q?00HGBbPmhHF7w32N7c15VC9FaDVwAqzXOUGaqRJ1fL9UZc1KANhj+AK5rIlx?=
 =?us-ascii?Q?mCtQ6qSgQoX7/fkp3U/CTwI+ff/zIy2McGCvE93sQ4cl1xMi1zJonTowhxs2?=
 =?us-ascii?Q?1+ywrE/r0OqX7Vci/qjPkr4IZ+Pa3bmtniQXAfPVTytdD1aMZOA2iKjG92w4?=
 =?us-ascii?Q?NRiUNQ9LiDUtqwdW1A++dpXcwEOkz0tdpobkADPbubi7BqMf1zo8JAnq+tkv?=
 =?us-ascii?Q?uCRYo/C5C9gy9HCG5bv5o80VXL/DTrMvZ9X2/ro/mr80EygGZ1s8IaQi65yW?=
 =?us-ascii?Q?Usq4FqiKJ9zW0+Wy5NhEmPmC8W1XlD9je5FUxIKlEuIDnHb3xmiAPG0pPiNC?=
 =?us-ascii?Q?JFEFhM/fJEdBVp11vriVLMl6iVoJK5hJFnivwFLFTnJYkTl30jv15r7Z5mIr?=
 =?us-ascii?Q?NwXcSsIceELSmq5u8nfVV3po3jkkRLpcAZoTmUd7rCkZihlBJ2uvoF0eNLa/?=
 =?us-ascii?Q?Zias1zLBe75gLNF6BUvhCZLHAZ2K4alTsEC7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zUCGy34YPwfBEjHz/4Kja34wpAF7xg0dafHKS69iTheg2lYQFcIy/vEspd7l?=
 =?us-ascii?Q?t1rRx1bE2Nz7iJuDx+W3DmQLwV/clf06E2mPSeadQu3QEjTlwxqef0wPF2rq?=
 =?us-ascii?Q?EZJj5hDvsqsrdzE6n5MfRA3VYBjcG5AYj1lpIaTWstMH3sBJ+5n6GzA5MRiM?=
 =?us-ascii?Q?Er4Xp9x+0ultHjc6X0hBq1si6Ux06svhnnlYsxe1kj7B6YnDj/DWLDs34RgC?=
 =?us-ascii?Q?IdlDfXcGp0Wp1mvDiqY7Y3ZZf4pG2lW8co3KyScRFwgRwGMkIrt0agBswINg?=
 =?us-ascii?Q?11hBIDtGxw3AG8b9d5uCDToF1CsUXmtmflt/9fYXXaJ/+T/VipzrkTm+fT5c?=
 =?us-ascii?Q?tlj1yC+xTQusaI5wH/5odGlP8WAM0IZHLwulxbET1583s3wMzzavNRJkbbo+?=
 =?us-ascii?Q?ddbbffeNeR4bQPqxFxgKkEe6oE6czer7/fMPZhgBrwpxMrrz3/rhLJm5lkTg?=
 =?us-ascii?Q?CRkiTJZ7AAiiLYJE62iPbbu7rkOEzqyhlk++fkFEBadn1U/LEo2JMDsBEwnm?=
 =?us-ascii?Q?qJCS1aUT7y+Vty5m2PKLXojswGykFObAL2g9TXRANT+pzvotVSbJdZVc+NMv?=
 =?us-ascii?Q?+hHLTIYe0cDAmbp3LBxf6rEHgN2/EScZpoI4472ud6ucNH+5N8jlD4d3ljD6?=
 =?us-ascii?Q?hkXF4mcgXGQssx9m2qj6MMQlcXaDaVW7XJRHzeSCX0s9uRuPQJmjQmPPd1o0?=
 =?us-ascii?Q?X38Zf4Zo+VurJurL38ct4Gi+U1XIQxmsCBu0lEClFGTwG/oFvart1Dwg5u17?=
 =?us-ascii?Q?Me34o8VLDkB/dJI1bXZiRa2EBUDLOxizdTW5QyA4fm5Ev+an9Oux4X8bqH1J?=
 =?us-ascii?Q?X6sgSZSG2m+OX/PwkwAFRGLNZSB6Uzk+tdNwi+1+JQFG03ASUxuyewtzir/I?=
 =?us-ascii?Q?L1BmYysB2eIOa8kYxdTZhRt+mqZfuUXKy63BNehEcQNAB+CF8TS5iRCKaOXR?=
 =?us-ascii?Q?X+g2feA7QAhYqidlTlcj4EuBoBUyVb162mBSs3WuuD0trKY5K2WdnoMD4lZw?=
 =?us-ascii?Q?i6fsyco1yUGVGbldtzaltYRlnPfTWWrGxq/u1ssvJ3LI6aFioVpgRPpb1Y20?=
 =?us-ascii?Q?agZfXkN2/7qf3hA1QVXmjX4EvRKIFzTJzNAjYUqEmIySBkJZ7mVwU8ty9spb?=
 =?us-ascii?Q?oMxnPVDJtMsuScdl2NUw1ICsnQUmbqiLYkvL+Prjzo1gm69CY97tZnHOdeov?=
 =?us-ascii?Q?m1PzFdDTZ8fT4vx5bxGtfGw/+c5fR3Fbqk6oQlGHXZyLydT5iGqB4nS0yYf5?=
 =?us-ascii?Q?/RHc8HF32ZbFN8B60EWORB4n46k/u7UKoHR0ppzyR8xTXXUYV+HoeaT7d8Zi?=
 =?us-ascii?Q?6RFFuB33HBII3UJJqDVFgLcZa+JkJhagN7vn3cSm4IRjK7+7wv7LRvtu92X8?=
 =?us-ascii?Q?fxPYy0PhQBf9nyz//V1JAqpcoJcLUOHQ7FvtLqS3Zic3PTEJ1AzhG0lr7BCM?=
 =?us-ascii?Q?xdC3XaxqSHybMtzNFvgIoHE8BtoVw18yDtzOtKRj1CdGYwhotRWvsRuLsSv5?=
 =?us-ascii?Q?Fc6BrPqhJkP+zpCex/opTzXtvL2lAY5uMZV7cPXRSyHohgXmxTpi3KrEwiJU?=
 =?us-ascii?Q?9PG42EvYltztVDXl3AGO2HRh/Q/ex/LJKKm//j5/5qEiamL8vPwRz+gUuclb?=
 =?us-ascii?Q?rrVlG4C0cnhFu+ySizcSKUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffaa3cf6-9340-4f0a-6661-08de20b8c000
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:00.1592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqyQw4dZLFHtuGubANM7/s087Bt7O57LLOsvtNUKuO+v8PaqTe8h3c7/erXFhLFHqAtPW9vuaSkp6vL+05E3IRa0w5FAzpLp3wB5OTX5Ir7MGmD927g6RkE0Le5t7wZK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt5640.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index f50e771db24b0..4c08c274f50e2 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1935,6 +1935,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1949,7 +1950,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		 * away from ON. Disable the clock in that case, otherwise
 		 * enable it.
 		 */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5640->mclk);
 		} else {
 			ret = clk_prepare_enable(rt5640->mclk);
@@ -1959,7 +1960,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (SND_SOC_BIAS_OFF == snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_OFF == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
 				RT5640_PWR_VREF1 | RT5640_PWR_MB |
 				RT5640_PWR_BG | RT5640_PWR_VREF2,
@@ -2098,7 +2099,7 @@ EXPORT_SYMBOL_GPL(rt5640_sel_asrc_clk_src);
 
 void rt5640_enable_micbias1_for_ovcd(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -2114,7 +2115,7 @@ EXPORT_SYMBOL_GPL(rt5640_enable_micbias1_for_ovcd);
 
 void rt5640_disable_micbias1_for_ovcd(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -2586,8 +2587,7 @@ static void rt5640_enable_hda_jack_detect(
 	struct snd_soc_component *component, struct snd_soc_jack *jack)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	/* Select JD1 for Mic */
@@ -2652,7 +2652,7 @@ static int rt5640_set_jack(struct snd_soc_component *component,
 
 static int rt5640_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 	u32 dmic1_data_pin = 0;
 	u32 dmic2_data_pin = 0;
@@ -2666,7 +2666,7 @@ static int rt5640_probe(struct snd_soc_component *component)
 
 	rt5640->component = component;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	snd_soc_component_update_bits(component, RT5640_GCTL1, 0x0301, 0x0301);
 	snd_soc_component_update_bits(component, RT5640_MICBIAS, 0x0030, 0x0030);
@@ -2796,6 +2796,7 @@ static void rt5640_remove(struct snd_soc_component *component)
 static int rt5640_suspend(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (rt5640->jack) {
 		/* disable jack interrupts during system suspend */
@@ -2804,7 +2805,7 @@ static int rt5640_suspend(struct snd_soc_component *component)
 		cancel_delayed_work_sync(&rt5640->bp_work);
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 	rt5640_reset(component);
 	regcache_cache_only(rt5640->regmap, true);
 	regcache_mark_dirty(rt5640->regmap);
-- 
2.43.0

