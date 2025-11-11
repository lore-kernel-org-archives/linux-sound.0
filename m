Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BC1891A9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820529; cv=fail; b=JLMwjZkMlXBm46v5pAzP80iVNJtNUrBxTkRFJHieuK4H6v+d5v6DB4+rkTayPXAgN+6Ikj6gzPO+cQN0lLMvU2FD4NsPfMd4q82hz+oAH9J6G9UdOmioB93nEOxmyr1WUJIybWTQm+DnEiA3DEQDT12yAA0mtG+FrboUQ10fKSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820529; c=relaxed/simple;
	bh=CJOyc66aJG91pOW/66Nd5IjCEtb5GW5Dui1Osmb8Lb4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bPP2fBKtFQYIDX28p3ckUMgAwIV21iVxPxPvm4U3IdlMElIr04thB4pa51w8D42HuVcNQ4ZbfVio1lKoHlbaWin3GJZpV9S7QV+/WJUduIr35it2zFo3CeX9V0J8/fbT8mhdjTa/3F5oTUhR+SOARgnuvZVj5+y9jqC7Yx6iSsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jkI0/c6u; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jkI0/c6u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTGkrnBe/sGciV/VTLguvWKcsqwXFGRwKcQW0PsK+UdjZCt48gI6DVJGSvtk5QhdQsEa1bGN52z21dB0RtqXRtdidhAVhW9vyfbNIUrO+nDIgxNmevUVTu1jIcRZ5UohpTTz/RJeIIjRWfKeQRDfYCbRyGKlOVxYXKQR/AdL+DFsqDcR4QH90/MOP4RAeRimiXp5ta5J02hTSwBShjaLv+HsK4vcjwcplHTzzsgZcIj1ybRP0+9NqcX00u5mgZGqIyMoibLYyuq5tQVE7vsJaYXpQQQauqK5r6j3bYxP4KUFlWS2umakrjdc/n9lC1Ndj1rv5/1htEAec7AAMCn7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dLLqCd2oLZkS5yV4Nfn8u+tlkbeFiMJg8pf9ze/U5Q=;
 b=aUj/+81WX8dLB09Q4OQUlTrFplIPua2mTa1MG96/LZjtU1+yZFKa/lUY72lyXdk34+zofdyrWrxrMHf8212SyW0bgxjTjr9vf1RDgf9/wKyJZM+O1HTqIiOtGmrx3uYNwI9ZgILF/oRqRrMH+L78Dxv3aP4kDEWhH5fhF/8eKaruDnLPmHrUCJCHMJjZnf1gHygOg2b4Sy4lcwnYawYy7rnQ+vDUXnycQG7K2EqdabBfpFVnWKsLzc0JPV1GWSWNKlb7/h9KqmZQH3ACmYLqPo2BdlVSCMxvXsG7EYACJ2G8ZtBfUfMtc5NczGC7kjJyGtuKWIZowJAU9pa9nAaSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dLLqCd2oLZkS5yV4Nfn8u+tlkbeFiMJg8pf9ze/U5Q=;
 b=jkI0/c6ulu2JVNbGDK5Upflv/NntHx2yo3JjLyrMS0wIZaonEmUvXTeArh3h/xlNkYyUiEP1pNFJm+P1gW4w27ibSmMof3xKKwJqbE/b69rcLwHgLmUSb8E9TE+7z9ERUIF9ylKe0b+8ttIZ3fwlVHfhWlgskAyBALqH/i0VG2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:05 +0000
Message-ID: <87y0od5sgi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 059/292] ASoC: codecs: da9055: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:05 +0000
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e9fedb-f6fd-4748-1f62-08de20b8580d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ehA1zX2jR/tyOkCX6pYmsRT06zu0fUrO+53Qm0YJPWqHhI+VtpdL6dmCOOdO?=
 =?us-ascii?Q?gDIsFK1bjMHAiid3QxW3bVyi9k677XJ2HmgqjJ29ImZm7xg4uzB/KK9U/+ac?=
 =?us-ascii?Q?zsmCBN+0VBftQcb2cXgv25hccqILtvIAmUg1PV56A5ybhpaRzh0R4N30Fm+B?=
 =?us-ascii?Q?SIV2ag5OCbDMPkTevUYsHUuHjS3cfPF+17ANQSbKIXF5CPnIEn0qm/n99ExK?=
 =?us-ascii?Q?/9OyFvcqGiE44RGyiIUwlZreK6Gh0j6OOszlduSMPxwAVkZ4aSc96LSXxtXB?=
 =?us-ascii?Q?lYp0PPOJiG0i8hBBlNt9LQNGGaA/Vta9sprT8GTrMiwPH+eDoKzdwwPpfFsa?=
 =?us-ascii?Q?6T/uBd3SfMTP8yHIJMwhgMD48NpH0fzyM0i870UJuE3a1E9HXh2ncji+yJWo?=
 =?us-ascii?Q?/8NTD5uMrc9PhGWnI387cQQUY78shBtmsHZf0W9XNOWKBQXpYllAEZNTdLDd?=
 =?us-ascii?Q?/MWyQ64MiU/JLFRU647L7LM1f29Ftz9rnQ1hcag7hVAKEJaI5qHcS8RR8m+w?=
 =?us-ascii?Q?2OOCkGmjqzQbMkbd9nWM+MDftDQ1XqgAGs1JsDcHCO6NIdDD1BMo4BjS5V4S?=
 =?us-ascii?Q?C8ty3f8o4G6lZdsWtqjpsAFq1ab2fGnREqwrK+fWlrnlXxuL+fM2SB2sMezs?=
 =?us-ascii?Q?tVfB9pnSOksGsrotmAfreLxmmYECOB4QTJwtivu96gc5lIFN0Lx9zwFd6tER?=
 =?us-ascii?Q?0LJ758Ytqrnsxlp5oB1y5curBmdqhE/PUHYVMWOwUmWRZ+OZNk24SJwa5wPG?=
 =?us-ascii?Q?bgLHwtmxULa3m2W2wSCF3ViY2l52/VXkNIu0vxIaW/S29xt9w7tzDANwJUIX?=
 =?us-ascii?Q?QgsK7kaqRyX9NIGAo29BRGulL9ShTIE8zCUtOiP71eu/pQn3a+9Hl+2CAgY3?=
 =?us-ascii?Q?KilsP43KUJHnOFjnsNYNvMD8QS5dIDe0ITLaC/0S4nQIBA8kvy6Ga+ETRdxJ?=
 =?us-ascii?Q?7lAlmBbuuShIw/j6tVxP6bIb02z6JFrj+dIh4NnaJ2/2qr9OoDOcRROu0wm3?=
 =?us-ascii?Q?/r5PMMkodnmNBE5DVT/V8+mZOCV192dT4qw4+hiBoZ+Abaa0N9LmL9pArO4L?=
 =?us-ascii?Q?50lRPuvVXItSjChZLW43uewObsqi0Ev5Pb/5SO0XZYxnicQiA5kuSeW54ftt?=
 =?us-ascii?Q?Y83bR++KMCV10Ig0tYeWHvv7V1ydn8RCPN8bBNoCWRrbmya9XLhfhmH36ii0?=
 =?us-ascii?Q?zxcCFwpoZ6qqsPhtBt5EL2cu0/yQTb0Lio7E+4gaSIfB7wmRKcr5WKbV/m/m?=
 =?us-ascii?Q?RmVOnhm8/aSoU+/wOLqbktGAAKiitF/6Lw5/rp4xIxyV2ItkjFFcI+Qteiwd?=
 =?us-ascii?Q?IR7VqT5cnFGogu7mgkRlBMH6gf0GK/1UvNWp0UdAyT5f9YqEPLXOsBSI6uOu?=
 =?us-ascii?Q?nrOIklXwTtsCtYI6vrt+ULHZ3hoNxWIuKNFFCb7Wm40nAm2xPauw3aGaZ9rS?=
 =?us-ascii?Q?tf24Y1qxZ33RVtYWfaZa0noPM4jaaNbh73K3GDiq4Iws77rFqOiGRtSdangn?=
 =?us-ascii?Q?Yy+PKvJbTH7oIFToXqkYhSb6s2v3yT1NVe0j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gpv7BaJoiL72iOSkQDyaM9evF7XT2zpXyUjz/QMSMz27L5XfMdnhQcUYEXPj?=
 =?us-ascii?Q?oPIIItTGWND1dJfdervmJJ+vYFzcrorPTCJaapIt4F7yH9rbetF7Fe3PXXQ8?=
 =?us-ascii?Q?gRCvzJaPReXTOExiYpCrpSUk7BvJqbxJHs6yqzBdO22+ftXs09F4TQZeN7PB?=
 =?us-ascii?Q?3t51648juYNf57Qfgpj6z9bX2J+UAZ3UVz6wFTbuoaLosIlFN+gk/7027ZaE?=
 =?us-ascii?Q?B4kGZ9YOlafvqU0Quf1F3Q+gaGcprk0N564CuagItm9BEWITaSP1O8TwTRBT?=
 =?us-ascii?Q?rVXG228YX6Y6T4E0Hgfl998fJetSwOx8j/xs/A9EA/bzd46qn2+CZJSdpUpb?=
 =?us-ascii?Q?v5NeligDmhWs4qGLG5MihrFyEENmAvkcbSw7m2xYqApaiUA/uPM69hTzouI8?=
 =?us-ascii?Q?eKhbV4m8PnJflRDIrHVjJwTwNrfoMAIplBI2jddmXVhyt9tBinwcu0/XEF+I?=
 =?us-ascii?Q?lGqWhMXYoNyFu6rwzKqcd8S7aEo/wFSQQ5fxu34KnIOsbyJv9kruYyUHdu93?=
 =?us-ascii?Q?53yrxcrRSBw6FMcgngG28SWjvNj6B9vjgQMsoKxvArgZ9ndTSpAs6dedig+Q?=
 =?us-ascii?Q?qjAQv3GX+vc4FsvvvoJqcxFxhG1aovhRwk42W+afOl1HTbZUzB6QWw5XoWBP?=
 =?us-ascii?Q?MbG75GoKZiVmvJkNVr3GZJ0Phu3k4SDBi77sEKg4WBxqui4RRYwOAeJRioiu?=
 =?us-ascii?Q?YzDxlOHeJtsWThn5vHRKb+Wn3Y141hnOib75oKvrEeDRVIq/+0O1cTePegTE?=
 =?us-ascii?Q?yeUxiXkEFvJu1y4SSrhteD/aGqnO2pXylTXdydtX0Rz2SsI0zW1w7Jlu5TPm?=
 =?us-ascii?Q?iwJ0LQPiSSpSFs8ZzkLgoleaOwf4fqfA6czGm0ySB+qVTvxachWJa0VUm3lk?=
 =?us-ascii?Q?mN+VxIrYVyjA2bsmA6NSQW1cuHuwdVbhz8oMjpT5wr+cOsWWYxfv/n+BUqCW?=
 =?us-ascii?Q?LaPUvZFDso74kYd8cXHcymT5jk/jkn6VCrSU1+s4ARClgQCnmp9BK/3ae8AC?=
 =?us-ascii?Q?eHPmG7+HBUERJRdhpFu8gvWscurJTXuATB7o4JZpSM90e/1CcsDQWqRECihA?=
 =?us-ascii?Q?0jmN6J4pXD4l1J003pPxNMSl68XSP5W+4YsuRH6jnsfRjrLLJ4mVieit8Yk/?=
 =?us-ascii?Q?zRSgqmLWCzW4QDJz4zf1ViJs8WltH3CCTv8OpS+A8X5uFjgTQ4kKAEsVWliJ?=
 =?us-ascii?Q?WtL7XlGO5gP1/zye3YsA203nojVRDw+E3cxyYDq8Cd6BTxN6amICCNfLwqop?=
 =?us-ascii?Q?tqoLBB5FlLIz0rZDIA6MkzfSRG6wDwkY3rSv6B8UUI4ZCu0WUNJhBzom+42T?=
 =?us-ascii?Q?AY0vJ5ljxnujKxep2BWyXrJvwECpdf/voGybP6E3hRTFGK0PEIkHA9hLZdBR?=
 =?us-ascii?Q?Li9cQiBTrDEC1axOHYLP1kkLfj8kToctcqUUHjtlaY3lSd9cS1BP33HadqJP?=
 =?us-ascii?Q?e2iWhsEU+tYgV6PQ431vtstQIXTOehIScb1TL/0SWCsI8kfpEDYjXUKfXh/r?=
 =?us-ascii?Q?2gJOvk6MycU3wq5btJpX8miNCKf1Gz/R6DQV+j4ZECjYqHgYdGuZ7ms5WGbL?=
 =?us-ascii?Q?5DLOYJQDqD3rfWrL98kDK7l9AO+6oVE9Sxu/311AW+rjmPLPY7c5CxmpAj1b?=
 =?us-ascii?Q?DuJyidjlFbOpzb25xxDRqtU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e9fedb-f6fd-4748-1f62-08de20b8580d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:05.7332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1po4z5AKdHsPcP6lLe03WgfhxKmQVU1lqz34PqZ6SR3VgbSEc4Ohs7VE7OqxK3X02oKGQtKEMYW81VtEfrHDBgeHjVZBMgkiILBbts8eRyScdxppbsxyrsRid4L832CY
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
 sound/soc/codecs/da9055.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index e64b510196143..a52276e32f2fd 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1352,12 +1352,14 @@ static struct snd_soc_dai_driver da9055_dai = {
 static int da9055_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Enable VMID reference & master bias */
 			snd_soc_component_update_bits(component, DA9055_REFERENCES,
 					    DA9055_VMID_EN | DA9055_BIAS_EN,
-- 
2.43.0

