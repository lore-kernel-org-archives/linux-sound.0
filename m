Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BED19ABCE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533972; cv=fail; b=jV0E+rrUlM+9onNyfWm1YUlZNzPaVk5lKjmpeADw4TUbWdwPwjqQKAvdypQhbh9JSd4IBzxLkpfYfZfvovP+2HDuoyfDjy/4zUHRj0oVvfUmppJVsiUTAS546TsvS2m92RNv8YisT9x+bbNdzhQZgwjxvlINiR/8tFNQ2536me4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533972; c=relaxed/simple;
	bh=/IJx/aS57WA/NzIXSiMXmXLAuvzywfPJzVWBhCZupew=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Hz0AV8CQjolBSkWqaB14kfBguZwIwzyFG+GmyvzxoL7AbRgVe2cqeoEQ9pQmTyUxwUotvmF1LzI9n39H2N2ogtVAqXJYG6HVsZpuTY0lcFEWYnXvLkOc8xugHuhlsowsG/tGPiJWos2GdURA7SIiXDaMjmxELIrElM+R0g6poWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ELp62y2G; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ELp62y2G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/YRGQI4xnjnYhRWCgY+Bda7oAAiqsRO+vupND9C43EGN/cPnse+6AyGuZt+XjEpREPXtJbs5DL9a8PGe1cy11lcqAnVe7xXXkj2SnFzP6BrEBOGOnEWaSITwW5aKEZqfwiCavEaSJlKDwwlp6J0maF63FOeLRqQRWYVPlfqudfQc+eEKsLSTYAg1zpy54buQ9Zefdt6bf7BwddcZpzPuOjbKiGSmH852Kc7iqsfEOhqOgDGGbCOBnM2fQQdnmFnmVlEdQUwQz7VyH6/WUy3MsZ0KJ9QFUG54s6FVBesLSmCp7QoQ02pYvLMa9akZ9EL8pzgP48NnLqj/u37YytPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZVnlZzArZiezvNNP3s7JZ5jjgQruoUBXFmUtlxTrsA=;
 b=E7N6z+6r08go8ARxrYnBPKb3qnTXC8X+kpg9L8Bjurv/iUo3qgts0vVa0Y22YDnawUDNBpNZOSNtdqFtCdsQtvK7YfZwxd3Rx6PXsdukZvN33XqBVhHZNoCEvBArgqg2znjAA9I7dfalnUOBe3ybv0YQcS6YqPSBqweR+Anca7/sttAkaswB8a5mWfCWRGMpZy3p2PyJS1GNvHn9Vzt/YY2WI9o9/Q9MlES1NDP8e1E6VCSVAbNxkp51qIwcEdzLIp1iA+0etSmQ7JsF4S0ofga6upW5LF9HIJlgmVnOuG9d8HBkl5vuRk65wEbRN8NZaexCBO/OCD/o3igDAgZLsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZVnlZzArZiezvNNP3s7JZ5jjgQruoUBXFmUtlxTrsA=;
 b=ELp62y2GTF+HkY22fQQHGia9EC+OGgz0r89/QefZesXeB+oDx3Y+ExPE1ardPPADIAqsuV0/EwCA9jCOkL+c8zuQPnmWDXIuIVLfaFtE+GHLWu3qvrerpnJK/1CzM9lhLRFPXOUY+Z3J4gBHAAdJUOMV1n4huthkqL+cfED5qwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:29 +0000
Message-ID: <87eczl8oxa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 151/157] ASoC: mediatek: mt8365-dai-i2s: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:29 +0000
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e02f4f3-504c-4d88-b449-08dd56066977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w9LxVeq7YH7hqLA2wKnHVGSknJiaHL9+ZdGdeqoYMx1QcJI2i7hOsYfyvJfW?=
 =?us-ascii?Q?++6zDD9VE7SCus+XCx98L2tkzEUDsXwFj1RHz8jO/XAb9ZuFGfWr/c4sV4H9?=
 =?us-ascii?Q?1xNwhWFkiNbr/xC0ixTcTHTwjPfh7ZeQG9o1IIerYRlDb4pBbf2vTVAwLTt8?=
 =?us-ascii?Q?m0YfiDu3wSBQ55IWZ17Jw8L36x8meA9MG0PiNf2NmoCdLk1W2P1Tmv+bEyy0?=
 =?us-ascii?Q?WIpLVYjTycAw8ypSj1KSTuLrR8rNnhvSJ/dAFnuk0/vAV77WihWFmqQsLfMG?=
 =?us-ascii?Q?X9h+7otJxoW7FOxer3MeOiFuPUI7Kt7SSZsH77WWFOsle9mg2Mb8Xdr4knum?=
 =?us-ascii?Q?PRadTn1YdXN4JurR0NysMSHYneTlx5+TjJNgcGvfHHutf/ErFICRSM2rawjR?=
 =?us-ascii?Q?Ex7QADGc+YfZ9tbRBBZx+CvLBPsEPfgEaF8cIAnyUPoAuxoAPKnZ/A8fmzFi?=
 =?us-ascii?Q?UHgbQUb5qlmd5DrIlHEYWHuZQ0kRLB0DZ8l5JBlxuS6XxnqBzs+FwLJ/k8hh?=
 =?us-ascii?Q?ovDm0VWa+4enOMAoEdBxn/RUJFctKBrK8GBRvohvxAvPBLSxmLsZw0yFDOXB?=
 =?us-ascii?Q?qcD+/iJedoWmB4297YPRYcxsaScbCw86BajNgtIQnSuFq+UQBdglngHnzjBx?=
 =?us-ascii?Q?ujHzG8rLFiqOLaQ8rYSVUU2UNOELepdZg/YByMlNC+ti44/jNRhFJ1VsT8Ri?=
 =?us-ascii?Q?ySk1Wwjj8YT2hfJZXHCJKCz0D7AfkhfZpXp7H255TnxYbAuVtiCcRbO2MPq5?=
 =?us-ascii?Q?sgb4Bi6AP32mFSo1m6TKbXOkRyUCQYRsUdVxaIjWG+c4NUt0VraIERidt7CX?=
 =?us-ascii?Q?/CNWEdn0+04nMeNROTuZLw2EP8bfarzNnYYa/zWD5T0lUUC1iR6kvzBHxxP+?=
 =?us-ascii?Q?AuXFLYvcoehqHCINHJPPTvMC7hMo4nLrOMMaLzAKxD0SPy6mYjh+ArQA/kha?=
 =?us-ascii?Q?t3B4y7xa8kHhO0Wp2nRGU0QQGMtRHY9JbZcK1iY+HPIt0iDv4xBV72mvYB1u?=
 =?us-ascii?Q?eQDIYunRNqrLQKWlMsGaLVjgmDz7An/+f0dgZ0lE1H98TLo+SVpQWDPLkPUr?=
 =?us-ascii?Q?ezY4RRvs2LjFiufRM1Et5oU1IxqUrinXSlUgzeqJGLkK8iYYU84MBrGchxNf?=
 =?us-ascii?Q?CMnkqDJfWiBryHHFEorkISttyZ/VTNUGjUF5UtP+LvfvTpH/v29go/W7QzLB?=
 =?us-ascii?Q?y3nyqYHASGANl3r7W8VGEUVyesUMDy/D4SQfPRsm9mWfQPvjqr/u3S0l7Sf4?=
 =?us-ascii?Q?jBSO4iwjnUOSpf/vz/es+JFneQuHAPAFboVpBp1delQo5w4sXBYyLt5lu0FS?=
 =?us-ascii?Q?dhzPXqmX8JziCjHMcoKlGZel3Fzf1zDjBBG8faGtY33+LVDG4u10MkUsX6vP?=
 =?us-ascii?Q?4QDBgkfd+N1ZKjDAwXg/ZdB+6HMzUdqckt5/Ebth1l2GnokNwzA65YHAT8T3?=
 =?us-ascii?Q?8HLcJDpbBAW3ZXSxN3p6xfIrEVwAjwBz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQ/ixDVNpaSqCIwBVF22gUvhRxLm15SX+8GTLqtAX3Ntnul2OYIj9M8biKD/?=
 =?us-ascii?Q?h8LoVj9TBUUQ9c5dXkWWrBV8dEeZ2JBkeArMZglnbBMjZuDKgYmPrrFOF4zI?=
 =?us-ascii?Q?GQQdIehwwURBKPjM5WmfbMh9aAhfYu7jD4ZvgWmHiIXpUqYXxaD6MisffgNo?=
 =?us-ascii?Q?tlwVSLYIaOF2Q00YGRXQLzQWtB7MOPvhDs2m4sIUaW0unFgb9dF88b1QN2Kc?=
 =?us-ascii?Q?iELJ4SoD3fOXw6ghdGubQDFJ7ZB8qJ1Z9yh0C+lfWqfxFnar56wXnUY/7CJX?=
 =?us-ascii?Q?/QSgkL572SNNhEO17EXQvurT01bbv9oGPz3NqMp5WTp7jgP8F91/QiKPlBwl?=
 =?us-ascii?Q?J119QmieXi/1q4nCeSWoySchKta+T4czZUkPE2dQ+kzD0zGZXewsjEbJERM6?=
 =?us-ascii?Q?hpTj1uKOtOEB2nIqGQgnTEIVuBG+HAbytcobxivup/lxFMySyUpklMqsIX1B?=
 =?us-ascii?Q?o8NkXVgq5zz2fFR44biQxkt/n6vabD16xJRYw9JIir0lCTzoM4A8fNNngbEh?=
 =?us-ascii?Q?0d0XtabIUpUThgge6JVFlG9di57y5uj0max4lnHoHVrj9n8ZZdE8O4kZxxd5?=
 =?us-ascii?Q?VRCVk9Tu62GTOSZSWGBb5SV2x7v+jgnNxWANVkwL9WiP+PfeP8h0Sllf/LQM?=
 =?us-ascii?Q?igxfbvdcN8mDPVfZ2MWuPYjbWhnRsJoyPBFsGYNHYLCxODI/MZZiw4xyxS1C?=
 =?us-ascii?Q?qRg4dfO8lh+u2tLIH0KV0iN2LwiedE2lLBKPsXRIxPTekk3XZBrQhVv4swfs?=
 =?us-ascii?Q?mGK71hQwxhjLbX4cnwShaXTxZhdbbsZsEqriMDw6PfaaAru+kx5PhqANoH23?=
 =?us-ascii?Q?VsLTx/SFx6L5bRroKpHY/G0gawF5lWXL5Vp2S0gfkp7QOpTEMA3yBUKcUawJ?=
 =?us-ascii?Q?WE9fCTMnJ4cChLplQslTTfSBNhtWdJ4r2dH1MGfpKfX4DqC0+ury6iPlKU8p?=
 =?us-ascii?Q?F5wA5eUB9GwVOboLnpAj/m8S+tSyoGjpuAJ547Z5uxZxfQmG0zQ/3d0XjSF5?=
 =?us-ascii?Q?pwZCwpfHxUmOWYx5mljSH9S3ooMcAnA4UWGj7Q3Dlcj1xptHb+eX3etfXiQh?=
 =?us-ascii?Q?X74obDnRP6Mrr2RWQL9HhkH4MSSbx2cH9rwQEe+mb9R5rOb8ULXGk1KEE/xP?=
 =?us-ascii?Q?sPGrWqwO7wmZM5gVFeYisTpXfdLKQ/ODydm9dll9JEJJwOF3IkilbHMCR2k+?=
 =?us-ascii?Q?BvKK6P5vfRsdo7/Gra1V1XwiIQWEm/9Kj1BubkgY4xbybTPjpAT4iijDyF8C?=
 =?us-ascii?Q?EHYwyabzC98xsU1oVH28APmvZWiFxdSf6BCpUOLuLYzjTnKranaYbCUSRpIn?=
 =?us-ascii?Q?21ow47/2n0MayoMe+QS9ZWYfLOTqop5Bbj+ul2rLuSttKq9GOpdbfIHZyUqd?=
 =?us-ascii?Q?tFK8vCMO+j8knjH0rrMKrb89TTfqDHg/ogU03sXD+XpGaN9+yr3K/w4ZV08X?=
 =?us-ascii?Q?Byb/63NbZKTqHxYA7IMpw6IxQx8uzoOrr+po9w0D88pIDyco5AhwIYErUCaa?=
 =?us-ascii?Q?wInMVyUb5s7/UBBKKgaJQIB1i8WC7Naz86BlKKf9hym7TrCeU3Jw2qpJW06p?=
 =?us-ascii?Q?4usllOa5pytZGeddG4Aj/pJfUdyBTK8idtniCSCBozszT7WBGo+qMWXP7+hT?=
 =?us-ascii?Q?uuNWdkn3zU+9+gELAiMlSkY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e02f4f3-504c-4d88-b449-08dd56066977
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:29.6817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFIXSnTu3XFo3GkGBK1e5bwuiH8vQIVBipAGU8t1GU8pmoz8ieqC4QSq0wZOe9HDBx7Pe1XEBFw1aSx56/e19imIOmNK5VoQ12gd8VfmvtRicrkfBZQgeRB8bTsxZdn4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index 11b9a5bc7163..cae51756cead 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -313,7 +313,7 @@ static int mt8365_dai_set_config(struct mtk_base_afe *afe,
 	}
 
 	if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
-	    SND_SOC_DAIFMT_CBM_CFM) {
+	    SND_SOC_DAIFMT_CBP_CFP) {
 		val |= AFE_I2S_CON_SRC_SLAVE;
 		val &= ~(u32)AFE_I2S_CON_FROM_IO_MUX;//from consys
 	}
@@ -523,7 +523,7 @@ static int mt8365_dai_i2s_startup(struct snd_pcm_substream *substream,
 	bool i2s_in_slave =
 		(substream->stream == SNDRV_PCM_STREAM_CAPTURE) &&
 		((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
-		SND_SOC_DAIFMT_CBM_CFM);
+		SND_SOC_DAIFMT_CBP_CFP);
 
 	mt8365_afe_enable_main_clk(afe);
 
@@ -551,7 +551,7 @@ static void mt8365_dai_i2s_shutdown(struct snd_pcm_substream *substream,
 	bool i2s_in_slave =
 		(substream->stream == SNDRV_PCM_STREAM_CAPTURE) &&
 		((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK) ==
-		SND_SOC_DAIFMT_CBM_CFM);
+		SND_SOC_DAIFMT_CBP_CFP);
 
 	if (be->prepared[substream->stream]) {
 		if (reset_i2s_out_change)
@@ -613,7 +613,7 @@ static int mt8365_dai_i2s_prepare(struct snd_pcm_substream *substream,
 
 	if (apply_i2s_in_change) {
 		if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK)
-		    == SND_SOC_DAIFMT_CBM_CFM) {
+		    == SND_SOC_DAIFMT_CBP_CFP) {
 			ret = mt8365_afe_set_2nd_i2s_asrc(afe, 32000, rate,
 							  (unsigned int)bit_width,
 							  0, 0, 1);
@@ -659,7 +659,7 @@ static int mt8365_dai_i2s_prepare(struct snd_pcm_substream *substream,
 		mt8365_dai_set_enable(afe, i2s_data, true, true);
 
 		if ((be->fmt_mode & SND_SOC_DAIFMT_MASTER_MASK)
-		    == SND_SOC_DAIFMT_CBM_CFM)
+		    == SND_SOC_DAIFMT_CBP_CFP)
 			mt8365_afe_set_2nd_i2s_asrc_enable(afe, true);
 
 		be->prepared[SNDRV_PCM_STREAM_CAPTURE] = true;
@@ -712,7 +712,7 @@ static int mt8365_afe_2nd_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	be->fmt_mode |= (fmt & SND_SOC_DAIFMT_INV_MASK);
 
-	if (((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBM_CFM))
+	if (((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBP_CFP))
 		be->fmt_mode |= (fmt & SND_SOC_DAIFMT_MASTER_MASK);
 
 	return 0;
-- 
2.43.0

