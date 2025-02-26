Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932E618DB1F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533568; cv=fail; b=dY6JoHMZaULM99TiXqyvhXFTpYNvapLpI4mYm/O7PatR2G8XH0nurnTd38xjl4xn9OuBCOXtxdsGcps68LTfRm5gVAjV3ISAmB0FAIbUmUFifuMf9wxBtVB9kLt+Crg/YQZEejOHj/lxsJWiVAK/V2dn+Pu6yBY1SSBxmKQUjfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533568; c=relaxed/simple;
	bh=2Zrrj9bsmWWutxhsZJnSfDeEo/brxasE2Jkj1UjdjGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NZ3NnH4E6w2lfIvp1XUMwDmJLu5CTJhEYeOPKFbQYwToKDg7AwWduAgHH1PyhY5cOEdEX7z//+FxwhV1Sry3cvfi0rNXU4R4JqFMwsGE3rHiwr2CHJlZ4WIzKqY7tcWYcsc4AQVoXfZE1+9lg8tv08PGwgVFMlzMLDK2vN2+zSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TthKs6CV; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TthKs6CV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIx3T6ElYfCmZVm+pF8KMRT+HwiCOFbgQkUt9dWkzRN+hJI8RFlMECQeCuIEoAQzD7CIQSK/cpwpfQr/7r5ym3nqg/mXg6IdRmSPOdBRs0qSg/PXw39W68Z0ddV9RPs/dbnUIi/bc0vfB4hKnKHumkun1xE1zLpwZrfwf1KW1jEdXSlYE2qOs+MHwdRKLEPEg3Ad9V2aIpsHgHRO0BraWTEq7MAjeQPv4nobURUWAVOj1TsFTiToAZszdHiv5GeMVTuqz5D7xPPXLRxQoHr5dPXN2Su+JtUqgSB9NxtnAqveIqUB4wnu8i9FJ4Xg9yR+qTvNZba7HHX1vtTyfo/DEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTc9DR8C2HQEEFsrqmJ6dmlzi0BNiqjRsz1Ut+cQIxA=;
 b=ddJ+75xmGCf8Obel8rbNyyd1Y/34mnN9JSFm8E7/+sdJuNlQk8YTCi+SUYJ92NGQJeVGUMGnzA7LoR9349e1gN0PqbzvpwLKH0ROVy2flYbBuJ9117Wt4e33Io1KH21KrlCwnubv8Pw+t69siNEIrioEtPMSxh9DNXqhCaujrtgZJTNB5CiLGufnHQFzaxSC3xLwsAftZJ9pRLmbAwKn6j/kuDFU5FFOPNtk/k/h7nE9El6K3mXDBdcUQp3MzGhzgDgnNlOasu0Q4iAnJcgZkg7vEYT9OceIci1BuaQtQKfEGClFV+wbSa/3XYYyCf6yhhAAeMpK+eO/sdTfEVUBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTc9DR8C2HQEEFsrqmJ6dmlzi0BNiqjRsz1Ut+cQIxA=;
 b=TthKs6CVUNElXj9u/bO4hzb0iN2hCeH881IvZdw38TMkuWTgFI1U1mCFodA7HfqocYY0L2Yy2k4FulIgG8rkhoYqoPaEcwE8qxkjCHwd8On4MoKxxXW42sQgV9XFT2o+0bD6KbFJtRu9c2zmUyRMYPzmQQ17P9NIpJc/bj+GGA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:43 +0000
Message-ID: <87seo1ebic.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 041/157] ASoC: codec: nau8825: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:43 +0000
X-ClientProxiedBy: TYCP286CA0267.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 31040e4e-3f23-4d04-a6ef-08dd5605778d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gv3lEkaOVNl9MJEZWkjhBtS5sx02h2KVEln+bOReqm5Xf0/U1A+Fwopy3xwa?=
 =?us-ascii?Q?HG2SgFZUDZ55BBB+Si/IoIDJEuGqbRoVZ/GLgNjaXQeKAyGnrbJVuvFmEqhV?=
 =?us-ascii?Q?ZRB8rXAOezTZnDrHeIApv7oPJHoigwLdIaRJ195qtCHPBOiR/fjiNJwrsWQn?=
 =?us-ascii?Q?RLBpNQ4/llxhxlhjzZnJQtPy7JsBL8uKXD+Lji6hqsdpZMYpyuB8uLcv+MfJ?=
 =?us-ascii?Q?YFdgN7rKM52bzB4PeifUycU1jiPffrNJvxpHzz40aRAo3XqIcXi9NbXr9YRT?=
 =?us-ascii?Q?dzLTyL8+1s8dYc/rYfOEDq2oiWYvsdMKLpsMwFxOqb1l6nN19lK/p2xr2Buf?=
 =?us-ascii?Q?eG6+CpKBC4vZG86N7OQZpd71/5CICbNAT4l6hqsI6hfIXPmSTwPrPrik9dWq?=
 =?us-ascii?Q?w1sbIE4BwZ0tqr+rJDYY7Oy1Hd7SgM9rkpb5gPN8mhujCy8JEpXTyTu61fSZ?=
 =?us-ascii?Q?ohMdFGtP1eZMkw+9YEST2+x/1r6sww+gCxetork5I+3xvHfvkL3sDfnRurZe?=
 =?us-ascii?Q?AGYZoQFM6F4xudlcbNlmGlX/FRR2b2sU0ZxnrX05FrJkKUT4iiDZRyfxuYpr?=
 =?us-ascii?Q?bHJO1ZEpvV+DqVkvKDvFtW675cNj5xq9EY3WBnAirw6KO0OavjS9URcnZmXE?=
 =?us-ascii?Q?y215JVpNcDnn17wylP3D7uCepL9KNz12jCx25fsZ3bJki0mrG23Hyz/z2UEH?=
 =?us-ascii?Q?o9Lp70ir9Uv2uoL5MIP1J+6LIKCO8l7G1QUEyeQKZcCLFpWVF8xKlu26I7Qb?=
 =?us-ascii?Q?3kSgGyklBkwcugnc+cBCNDNSJ4WsVX6dFzg7ZbFxdjAvwnhC146V56XxdF6k?=
 =?us-ascii?Q?QBMmNiyI4ayhh2psBqTeOioQBuIiY8EMsYE6bp7HeOtE4kowWpnghAw2Vf2r?=
 =?us-ascii?Q?l39WxHS+sFpqYx13oMohuVZ5UUoT9rAKeHUxrrB3NSurfzjG1p8D4b7f5vaP?=
 =?us-ascii?Q?s5SsoCGvQv/ID4dXtEyFZscUSXppMvEAJdCvPA9wjyWYNoycBPjVm4BQ895s?=
 =?us-ascii?Q?nlws9aRwq9KZ5yi9u2/vuB43IZlqzKQMaaydssAlXmhaCUImBrR5PRqmIsC+?=
 =?us-ascii?Q?qsGfbv02sLoCVpPfC4/n0Kf2WT0li46Ulp3HyknsDY1u7JyHshzsA2W3gapQ?=
 =?us-ascii?Q?kvj1c/EAsXE67jMKmDVrn5dWCJBUvEk9Al5NpW1Uiqgx+3uZiWK5x16SfGYq?=
 =?us-ascii?Q?RDfVtvR01RLUysn9CkMrXwTF942bSuzpY2z1AUnMS2tMgCB37cQ0VuC49pu9?=
 =?us-ascii?Q?mRPZoRZRujDHv4BDOi1CvgxyJt1zVIurB5J7DN1C0KvNjbKBYwuNQolsRwI8?=
 =?us-ascii?Q?NdlQ5whZa8M8FfbnCgNznSX6ohwe6rvTavU4oURTxuVt6F27YES36p6XiU0I?=
 =?us-ascii?Q?+cqGeN+s9ZjJdr41fDqJW2TvOiVTk/Gs/rbWDlA9OdA2AU+bJhtoWYHd2VUS?=
 =?us-ascii?Q?WG7i75fX+VRn5qQPkCBUAmFLB21ho1xN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lq7YppQcn25fNmpaj/cBSYgLeTfrpip0oEV1gGR8mAtyGa+gsOC9Dcc4RT9b?=
 =?us-ascii?Q?3ysafSXE3m/Tsx7IfiLXm7LwtpGbBA7ynKPTTC1tLTrmLifert6AnNi0Rp2F?=
 =?us-ascii?Q?Jk8Q+c7bG6bbdoFWxqOooQnbfUWQxr8BD4JzWkuVGCGV5QQRQGiSgSq/It7E?=
 =?us-ascii?Q?NAHfH7bcEVvCIWesCBVYq/XnKjzHfNlzeeeqbvyDAY17LcXFQQNSFfEekj/v?=
 =?us-ascii?Q?JjYPaO1ek8ZdjKOisYcwsedeKVZ/kDBZPITWoRFthWTbh6b6klEmwmOYs+g6?=
 =?us-ascii?Q?chrIZUgCrokkszz1M0NrJL7cR4t12HNHjnNIKhUEeZb1HsXUqyuHTrSas2au?=
 =?us-ascii?Q?OPfy7VWZKnwxq71LCeZA8TGfLjG0TXT4VmTvXHsnye4T8pB9P7GmRWcEfbfO?=
 =?us-ascii?Q?a40f4rZ/bCs7Wzgcf362r8GuXR5QyE5VKVRq+BjmGDd6tb8pMwBhprX0caFN?=
 =?us-ascii?Q?HjAWE03ye94AJArap40MLg7Qb7W79JixaKQsSwBaWLfKssomX1cmsdd5L662?=
 =?us-ascii?Q?decSlUrqyflKwJyCZbXTLb8zCcRo1e6SbStNpTlJuyW2a0j+Ei1d9BO6qNns?=
 =?us-ascii?Q?cAMYovoxaUeT23z0GqTVbU3KQmSIo6kUp/WgfhdFDyBNSZeXujx+utrebqP9?=
 =?us-ascii?Q?ykIF6D2OWZJp0nPjEzClnoyZ4ELU35260eokpZcsRq3PVgdtWSVXvJMdXFL4?=
 =?us-ascii?Q?vmYWFmNaTXNHFKNnimUSuIfpnWBnl2bKg1C07p7TedWJeHSP3ns62pc7lZar?=
 =?us-ascii?Q?VYqACIU2MzWNzygVXHXBet0cJUhz//rJrCv75/pQzYW2pokHAfUB2Ki8cHic?=
 =?us-ascii?Q?AVjkvlh4hPnsyXfoP85KmqSLNpEGAgMVZnjwYbND7oJI8rqRZWkFQjyYrihH?=
 =?us-ascii?Q?a8630YEq1SwREDB2M3V7s7H5H5L3wnABzDJJ5kf53lngFGCHg2LGMriU2e2F?=
 =?us-ascii?Q?R0qKL46RMHVR5biXT/swAEwwsUiRUwZJW8diPypywxuuW5ckoC8ad0mCqva5?=
 =?us-ascii?Q?ntpnyIbOrDFpbDdFBJ6NynaxwHnsYiQ44+R9HAaA5NuC1TV1t5fN9ImdUwUB?=
 =?us-ascii?Q?Ipst4NyC17RX5GKrkSy/fFt8E8WjMrbc4xy5ARAwc2dSnnj/LCb5gTN+X3JU?=
 =?us-ascii?Q?6UIVqBF6HL9Py4I7cHXJup21wmFhly+ruugpdLLnutV6HMGGYDRZc2qojFIy?=
 =?us-ascii?Q?fxNXXcj9MNT1t0F1tVYKo8ZfFPlWWuinWqoibtPRGQQ/Um/ECcaiSmkC8fef?=
 =?us-ascii?Q?SOdFK6s9rRGsdrdHtK6GnRQhzlJ0duf1vf3DFS6QMCCPOFg8gpYmFZQcq/eD?=
 =?us-ascii?Q?u/Upy6NmpUGX/ZZgYRjWGVRf/Q50uOzAPS7N88bCRaRYVpFzB4CCpusgbcb0?=
 =?us-ascii?Q?/kxb1Ude1Z2qQKasI0uOPH7VsRhPiX7h1RsxfZBkMx6nSrXf0Ma5KiKkoeIN?=
 =?us-ascii?Q?vsLMT2wDfJWeu5onNXMNry811DqIBu1fSaii5NsNrE9UkSefa8UbqSVTAtpU?=
 =?us-ascii?Q?JMOw5Vx/mxcRSYk9cvFeI8gI5lKOvzacpfF5lkVcx+8EtcWV4OseF3GerNMo?=
 =?us-ascii?Q?ahCBlOmo/wlXI/orUpv9KEyh8g/67Ct5HNf1WVSKbui87WSW6LJ5yxg13mQD?=
 =?us-ascii?Q?fN870WlMxSKIPVpHgSZsn5o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31040e4e-3f23-4d04-a6ef-08dd5605778d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:43.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NEixlGjgRXPYT0vlc4X/aPZ1zs8sv2GoNBw1FdYjINr79BMYLORRahvyBvvbT25GqAFWaV2dMEKcEG5Og6InEK0+kcSU8yYaRXKXGmOl2l0+f0Pe2K/xZw/robBbTOs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8825.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index bde25bc6909d..25b8b19e27ec 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1356,10 +1356,10 @@ static int nau8825_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	unsigned int ctrl1_val = 0, ctrl2_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl2_val |= NAU8825_I2S_MS_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

