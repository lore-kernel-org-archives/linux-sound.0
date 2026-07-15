Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDD43B6D9;
	Wed, 15 Jul 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109800; cv=fail; b=Q+sWUvLyVMC/1WrDPtaxIACgq40p3DJCvs3kPMI0XTC/K/PYGW+fGJAu1IPJep4y8xS16otHO+YC5uaU/b/mhV8rZLjecYWOlsnGsApQN0miaOB5h67oepFPXj4xaIKySI43k+KrbqKIG6vbehYQl4M3l8ts7QkLHfG7IqE1S7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109800; c=relaxed/simple;
	bh=70o3FFgkTSmucUlwUtrkxExAtGlDKmYAaJk2462o9+I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UZarfKX2ZVSWEVtmQoh/hWnBVwvwdACD+q42yePXOrSPZVG0yDg/VVwXMuIFf6uSSYSEXRmIT45pbSExo5L35KcToG5t74/NIe8AHeOq+Sww56M9nDxN25+pHKJCvldxPLrxdk8Z8qpyD0dRDQESsbMpt7PF8S67hgz/iQEUNt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tkv5wiET; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tkv5wiET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGq0+qAOwQlpbcWWLdlGnreIGjqtDI2hPMqm0xVCUIg69YLyjbDJxLbutvmJ6J8ymCvCDpNIymkxL5Foe7x7iSJkZj7EBj62A/Oqn0kP9nwddoUEIGjAiM6pJZS0iCj3MCD/1dmlrDWfwXLyOm4hnL7Dgq0PF3GWfDcMPevZUQviX0AqQ6NkTQ/RC4cB3fsA8CDeZq+d1Hcz6sPrY9pTSFDco7hCACF9gqw1XcApu7VjZmDNOQHGvzzm4U0zeeMR7S6Mzqpi0i8qxut/zqzcCFUvEbu3abpNssa6N6RuX6gYsSEGCQafzRFV+bbiLGVD40iunQmIV13GRv3fDYlToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXfGNoxbVtxK28xTgysYLN9D15d+Ezf4/qe6riSxyUY=;
 b=jcy3x4K+T497s8G8L3HGXe0jigAQtE8imvaILKFjyv8mUk0ivBDoHud8SgV3UTc4uKQBH4M5CKRb0s0043+V7ubNrD8K4vhqgwd4GKqnONCzpdsHaf71nKLenLewZ0ZYytYOrFysWm/mczlcwE9ZSM9w7psKHMM/o9iM1LyxOZwiCHKUaP6urCq0XZs58EvowM4UQSjUdumO2Uk01YxYRBttdFCRgUXnsCcXvJ1BltWcQxnWJoFYokk8NIEcmgTRPwTSxmzzs+iDgsm8/aKcDGV3MAqPNXpsOLLxFXP+7zq/urF3wKf+7BICVSynHBnKLn0QSelNIKFlpBevTwPykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXfGNoxbVtxK28xTgysYLN9D15d+Ezf4/qe6riSxyUY=;
 b=tkv5wiETrJKhsGm7freR0GnsscW1aym5i2h41EyWw53q92lSi0maBWNcHcoCrLw3Vgcf3RTE5JvEsEcQHwEVcycKAp6EwhccnTBHa2ChZt+RPsN9gJTtiK2WN4XeLVhdTDFIGpoBfdDdc2yNcwdfQ8An+Zcv6pl/GXKRc3ziHgKfS/BV+TsbLN1+ZaeOHSpG//ItQsM+g4vnH2xdXeydAtjobHbJ7CP7UYOmwBWzlUi+7K+e06Wk8BcQ30zzab/x+LrXIojCFQ92QaDDOqGf9FCH7danCO8cAAoTMw9a2ooN6K0Gey8XxvLOxXAWy3ABjmCsnqn2ccWoOlqARxQKRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by VI2PR04MB10545.eurprd04.prod.outlook.com (2603:10a6:800:270::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 10:03:13 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 10:03:12 +0000
From: shengjiu.wang@oss.nxp.com
To: linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH] ASoC: bt-sco: fix duplicate DAPM widget names for wideband DAI
Date: Wed, 15 Jul 2026 18:06:20 +0800
Message-Id: <20260715100620.1387159-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0264.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::12) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|VI2PR04MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6349f5-0d8e-45df-6c69-08dee2584733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|10067099002|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	m8GYTv+WQUUDEQ1FggP2RIHLF9WaeWmRDjEq+m9PoEzOAybMoIwE85InG4RXFO0BKB58VNxMikFQlZcMQn/3+M60Tix78dGvoSepdcIInXRaPzgEY5GLLSGj73q8RTtO1ltkJEXG4tSJPHvakwcE3oubWySvuFbmJK1qFYwsK0GvxXC6wW9uhblHfsBR6Fxr7M03GJRdmgG80++MD2UsUeXnSBU4Oz0d7tnteDf1NBAJDPmGzmuzHryNmVYuyeeWwU2SSvw61tmhRWHxIbNHRFP0lA+UX5NZCddweQVCaWJJ+tbY5/npWkmq1WjvBH/4dz0UJ8JxoCFcK2rzih1tspC0F1iWmxpNiNKOXknZ2QHXCHOSKczXd5Sjz0s/C/AC8rOAdZ4TI/FE9ORFoFuenCKEZrF6qsZ7/n8otgnM38I2Wl9khLJWNDdhjaVpqft+lpLU/hxNBY3f9BBDqaSIfvSqRx5raZ155HcrCMC4ljvWTkqqrLKNa9V56/ORcdwyOieSyUDq902Be9yObm5n6kAN1YzZnWUYtiqktuOcw5OY9Ytr972BEMqmuMQ0NE4hkYXaPredlp8WZvJG1Z+wtcx2Ffi1JTLk01A987iQ8tFqTQLg0d/zPHkQpESST0AeDzEhSq6wAyfXBg47mYWEVifjbdULzrdpDS7c17xxPxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(10067099002)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7uv+U0EVedClAoA2wgd4tTZic+c4yna/+qLlQhZh5OfyaMD8WWtVGr8W54uN?=
 =?us-ascii?Q?sfE+6/1mMdNR1S30+iVW0B7bxSsfPftIXBer4BdsfVgmz6isBoZRMxsnZhS5?=
 =?us-ascii?Q?GxIBU40a8hMt+M/OlhS9B2Mc7OcU/UPiN3LoMMWQ0CT1TcpZ9SHQiUCeJNL0?=
 =?us-ascii?Q?6NXAh+ECC5h3TtjyLuh4+WwnYg66kfI92LEsMdYuQhshyLNq2oQW68HVMcy7?=
 =?us-ascii?Q?+svLQp2A7AsyUjTRSOIqNlVaYU+Th/S05Bn/JwRsLjdDUT4qVR5m993sIS1A?=
 =?us-ascii?Q?O2J2SvPr/XzAGwIT1mq8/6TVOSX65jVmqC2Dngs0TANaw7yyK+aCLF1ChyCU?=
 =?us-ascii?Q?QSw9eTImkuJfxKJS/Qa1x90UVZM3CaFlVstQ24JS3bHvNHG4e33wSnYwtQ+7?=
 =?us-ascii?Q?jgxYhaQGpztLZQJV0TFERrwKfLo7tDNQHXts1MFc+FImog7Qm+7720OowTWw?=
 =?us-ascii?Q?E2hj+cyDe/tJpNnzW+rB6jkrecRY7R6nlo6DUraTDTvenBNON9YCRhzFXNAv?=
 =?us-ascii?Q?gqo4RdhJXfyxjqj4Hc4G6XQe5/ejhf27onyp3spUNlnvLBAqVsQULJA/hPql?=
 =?us-ascii?Q?OOue4onUx6b0wJguw2Ss7yJFmwbegHt4JuP4PdG/UtXBJi993goqlTz9xtkZ?=
 =?us-ascii?Q?IOCopDKrgy83+wRCAn+Bkq1Nxmd/lyAwTtOh2ItqjEHkU+50vap0jtDR6oeb?=
 =?us-ascii?Q?yIgfViSrg2JJd4Q810COYg1hAbusQzAPuBYxBsvOU2CJFgAmBBgCWUuxFCQv?=
 =?us-ascii?Q?Gc0O6bPtFbLdlmDJMMb3ENVXr1Nx28SCbAT/tj+E8GEqzwfdwfjqqncQmxfs?=
 =?us-ascii?Q?Q5cjGEwdRaFR+272ngd4MAJXVZHqBO3vTiEueBKj+j+vZU6vkg4NtS2mw/08?=
 =?us-ascii?Q?XmZboazgNks8aPBwZnVs7KNDy5FsgeE/7pPn7EfkWg3ipPoMviIjLqwtSujq?=
 =?us-ascii?Q?6p5bP2dfDmAxQmrKKg+VR0Aqg8yBs5bmLRDX+wQc0SYGo82yRbvniSnlximO?=
 =?us-ascii?Q?kdJDDqMZd8XOw+Fk/9GyMv/M1EwGAOMJ6d4DN7pX4bLSCooRKMLtEaLoKOtY?=
 =?us-ascii?Q?doV5g08/C0RkKNEnq7ouAK6FDX3TINpJULBCowqzdaBfK77e5qWHRRdkn1fa?=
 =?us-ascii?Q?2hjh/UUSJIuUXjY7WaHmTv+G0CH/AgLjCgCTcD9sKvNf+fv1T/yg8wGXuhed?=
 =?us-ascii?Q?RFi3Q9jR2+k7q+QfWPcTFYAt7rhoQLc3uFbdCzwoFiiCOkmV03XCQpDiItwT?=
 =?us-ascii?Q?jue5lBqHYYESI3UtBpSKjSs1Hx1i3zHomNeC+5+w5rgl4DqevWn7p0HapUMn?=
 =?us-ascii?Q?j1AciEkNtCmN7ZY+pMn7CnFkuLp3fBRkUxQQScWSe0uureEsA6zxdjrjfdir?=
 =?us-ascii?Q?ZZDTZXC4AK6S23Q84qas6+DMeeHAl5QSA5rTn+Ii85Qvk2CRwNgz+iTqIYyE?=
 =?us-ascii?Q?0Kr+exorxf32vdSJC35m56Fgd+l2AKdFqaQmxoStX6sHJ3xhvY3D6wcE4LLK?=
 =?us-ascii?Q?lSyotvg3LdljC1iANu81sboRY8dNIIbXHoVUTO7yOl/H2THuWp/g5FTus6ZM?=
 =?us-ascii?Q?dtfyzeyGVkovktbfRN6GB0n85EaHswVaVymMp5ESG0yA/WZPZ2bB92Mr7xWe?=
 =?us-ascii?Q?wB11jksH7BcduR0TM5Ic7M/8yHGs9aOr3D/fzg27UjPqDIwCAUIzwDtFH322?=
 =?us-ascii?Q?ukXS8zZZF7n4zHjWC7n1nQdgxx1r2SxrimXH10zhbPoQ5c42t6uvipS0X+aV?=
 =?us-ascii?Q?dg7GZLPd0OYPdxLHLrInF09aa4igtPsSv+B21WIAERPqxF/KZDPu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6349f5-0d8e-45df-6c69-08dee2584733
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 10:03:12.4669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqEUHCzMI7w7TtQuaebueqTY4GnisANRclhHvmphW14f/IvmBbwldG8Vlfce68Da2Suhkm38aKt9LLsoRCSC2bVPE97QFnXFLQGSXJs+FtEAaLL9LgOHIi0/mJK0fwcJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10545

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The bt-sco-pcm-wb DAI uses the same stream_name strings as bt-sco-pcm
("Playback" and "Capture"). This causes duplicate DAPM AIF widget
names within the same component, leading to debugfs warnings:

  debugfs: 'Playback' already exists in 'dapm'
  debugfs: 'Capture' already exists in 'dapm'

Give the wideband DAI distinct stream names ("WB Playback" and
"WB Capture") and add corresponding DAPM AIF widgets and routes for
them.

Fixes: 5947e1b4992e ("ASoC: bt-sco: extend rate and add a general compatible string")
Assisted-by: VeroCoder:claude-sonnet-4-5
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/bt-sco.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index 3afcef2dfa35..c0bf45b76cb8 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -17,11 +17,17 @@ static const struct snd_soc_dapm_widget bt_sco_widgets[] = {
 			    SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("BT_SCO_TX", "Capture", 0,
 			     SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("BT_SCO_RX_WB", "WB Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("BT_SCO_TX_WB", "WB Capture", 0,
+			     SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route bt_sco_routes[] = {
 	{ "BT_SCO_TX", NULL, "RX" },
 	{ "TX", NULL, "BT_SCO_RX" },
+	{ "BT_SCO_TX_WB", NULL, "RX" },
+	{ "TX", NULL, "BT_SCO_RX_WB" },
 };
 
 static struct snd_soc_dai_driver bt_sco_dai[] = {
@@ -45,14 +51,14 @@ static struct snd_soc_dai_driver bt_sco_dai[] = {
 	{
 		.name = "bt-sco-pcm-wb",
 		.playback = {
-			.stream_name = "Playback",
+			.stream_name = "WB Playback",
 			.channels_min = 1,
 			.channels_max = 1,
 			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 		},
 		.capture = {
-			 .stream_name = "Capture",
+			 .stream_name = "WB Capture",
 			.channels_min = 1,
 			.channels_max = 1,
 			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
-- 
2.34.1

