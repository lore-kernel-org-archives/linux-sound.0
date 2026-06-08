Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C933E2F6184
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881901; cv=fail; b=nitXyKodmZiUi0FWlZU7K2pSSEm4Z+U8gGeFb8ZHEwG4vK+wqTs1/u9m5thB0l/Kx9Cqgn42x5YZJBSIHm+gLY6bzILAXsDZ3Zs0OaE6hY/RJLEg8NuKxpur6BGWQ1NthRjZKARVfVLURuzv6lixhIaSkttgWBUJoKY8ycD2XPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881901; c=relaxed/simple;
	bh=4gubxXiTSjUslimICc9zGI7dRTO9NduglokDTbmaHsU=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JI/6DGxmNZpwiQb1rwVt0+soCUboh5V0cOj4HyrGwEXo8MxjQYlXjmUEaszGectfs7lxjdFVL0NN1HG43tncvJpDTdSiBwyW92fUIn1RoWNcASdepsW45374qLxf+Rp6zHcU9DefLB/zcikkyxGJlPexxqO5h7lsc9KPHQ9bH3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eigfXsuu; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eigfXsuu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgUB5FG2BnfiJC+MV1HIvASswZxmmgIXd6pvNWeHRAYlTpt1rZj3b3EBajV8lC+4KCOwBkASRn23ZVnOJ59GvYs8dqjGEgmetwqTMeSYF/P/kc6jRkGsMFGqo9KAQK8QAldECOJUl5T/GOsQp6oOk/oAZAmAGur/2NiZm66TvyehyvNhlsVoc3JN1M5et10dAk1LdrvTtDM1BiXcHO5e/AINzf27Fl5TyqKL9zCT8iJD6n2f39JwlHbqearo+vWRXwhLviW8vy8KS8/BxiS+OgiQR95SHXqqlOqpf6KdaWmy7bYcUVIIbbSkl80YBiP8Jg+D4+3p2BKK6DE8lyKRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbONV9FDj2W4pv5P6HQVqvZAwzThH8S7d+MCHZFctwI=;
 b=T4QdLRe3/9Do7kXlp1NQVLQtqWnPRYH+yLfaYcrbCwdMIsvvkEYklb31JxYXTWGtsAS5ZDECAomgnQ/L2DC1z0qDihnokbg6UrFFSSWfEoKVIFzRL4bWmLWaQezzmUrVD1kHJRrn+aQ0XDnrUBWYedSMEoRwTZCiYRj/c8hEoaS9XRo8cZ4Ku+fTJbOdIWGB1g3Sr5coxb20VrOJIu/9sstfkp6nqopkZQtObF3JeNYXZrf3immkmiGx6INEKi6y3/zw6adp6+TNK1Boi4rn+dA7X82Ujw4YXtxqrR6uUYoeDlJB9+YMDcyHNVTmklUEL8KQyAvgMYMerPQ8Sd3kkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbONV9FDj2W4pv5P6HQVqvZAwzThH8S7d+MCHZFctwI=;
 b=eigfXsuujiKTpv5EpahVyyFoJx6mo+aZtdkkChfQiMvW2Y1TeyTnLpmx/WYvJgC6o6HeBHEfHHEIjk2bnMLMLBoCmIxMgbnh0x2SpRVNmj7EM27p9ZsME9It0iYtMxKL6j2RCPu4XHITryGGrUAAiTqG7hq8/AHhNZm2qr+Pe/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:24:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:24:52 +0000
Message-ID: <87ecihesd8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: mediatek: mtk-soundcard-driver: tidyup set_dailink_daifmt()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:24:52 +0000
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f3bd45-dec7-4dcf-bce3-08dec4fcbd5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7uQjzPamZjmJts/Nsc3rJVC8Z2nX9YgwIxrGI/RDDwqwgG9D+F1utKOZSIC/ee1AxXMpdBgYNtmr3JTjKAYiOZZya4hPKbr8NX5s0Zv7dGZDUCMDhMge76B21PDbxXLWjh2X1kvfmpKjdN1vgWYvtuicvlOlWcs0IQ/2P6JlIakOwMcDRNQU9zqK+INnfZ1LTV6eIKBzxn3MbZEG0Sy9qiD0kFwdESoWoWFwmC3eieIM30bkd8lu/3qKVcSTBYBWoH/AueDpFYMBfZ6VULgIe2IneWq03wXeqhVB+TbcE86pFvZUQZqDh6AYpdQnBK44fy0TUgqrZJwSD2LvaMptKzaPCsQGMlq9sQxJNfht2VZiE8GGaOHJgfuvN/HmPr52iLeAYA/T4+LoyTHaLmGaXSPAv9dvhyexVnal31PYTJh75aAJNNeV+9KiVzc0Chy5NGPfIU25Cl7VCGUw+TGpCiLCVz/5ENqg/ITR6dyqS9+Kvgp+ioXN18nv0R14KX8QRS1eWMYpWSGh0jMKtMZPt5kgJoFkxhC0sVzJ0UVANidjiPj2XHMSoBffv7jPgRmDRZWCF9fbSWTlM3ogb2QKtEqZ2LBsIDf6Foan1qMqG6z/LrDG0j941rcKWvT92rAz6C+O+v87w/4U7t7APLTyzInPqJSXqq+AgSpVcURWPcWJidta+Qr9FWRFwMy8yJZDd5ySE4Y4NEUjtdpZ4oVlA/EBteZHP/hTKZi+Y6zW4gDSffhJNnIM38dUmwf1KhjR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XObyTHmSnSac8oxJURw7wmd3MW5urMxauqlzqd1FBCRJY8SNiE2SAdR4CCUr?=
 =?us-ascii?Q?fefGO0OOUZB//cLaF4CP9SZ2i5inQeo1lIZ8cYEtGh9A7mLeF8xv5NFd4rZN?=
 =?us-ascii?Q?vIKl6BY1HUXQsIZRbHSFQgJDjpVLTNnMCu+pBn4tjFQHkAvO35khEmncVisQ?=
 =?us-ascii?Q?aYnT3Mw7ZJub3SOGn6TMxOWCtPbPw3Hqu5RdfFR3ekPdv3YbcxM/AwDvkCIe?=
 =?us-ascii?Q?/ldXazS4ivpjODwhaPUhT3eGXCPAR3IhB1SnVA7AptnvUNMXAk2X8RfRzcpY?=
 =?us-ascii?Q?dgZxryBNEtf+uidAhSZS4xVp+wkFoFKu15TpG6FbwIaEWTVbQBLfGbvykxiY?=
 =?us-ascii?Q?LLKeVPlQoNnO5mnCMRgl4diBfPj/BDGFqE4h0DgpNuR2AJVSRNRfBZT1eg38?=
 =?us-ascii?Q?2lJxlRQb9EwntMQi8XtmDzOdmqRg2oESf98qV1fx5OcUGpN+hzSwrqsZzvBn?=
 =?us-ascii?Q?/gHW20uVS8Z75icGs4q0uSANnLBKLoFaw+12HksH3DEL/jcaDOn4nPINQA7q?=
 =?us-ascii?Q?soLRE9JJaHEASOR5e++x5b9uzwXcwsjHlWqZiEacWBcVZi3E6HSBomPSxWLu?=
 =?us-ascii?Q?Ym0DU0jbN/9VfrP+lAeVmAeCANYcc2boSaHioPj8vkwEU3bGHLhmLmnv8jd3?=
 =?us-ascii?Q?IpejXr80IJv2Vnk3MdLmnc8FvBk6l3tC+WV3TU5RFgBju/tdpOQE0x9HVTVf?=
 =?us-ascii?Q?Dqv63JNdqfAIQ4/D8FwqvZCGUHH/febPG5J1q8cqmmJPIf3HDE1BxyeLe4ez?=
 =?us-ascii?Q?mJvqsA2nVzQFf5p+2iYZmLNmZMlAmccW1HXrMMWxuSbIRAzVGFi11E5WSd+c?=
 =?us-ascii?Q?fheYDU5d1M6GOQgagf6pzpwcjNm7KQYryE+1uB/7zRmrsnKL8DiBXjv4Vyxw?=
 =?us-ascii?Q?am4snSk01fB2zmkKFk/CmbJAsNoMxla9Wf7PStKtsNlDqG9DGez81+v8EecI?=
 =?us-ascii?Q?Jx8JGzUSSnXh40jqB3X+HycLPOwobcC92mu8piHlmBeALaQ2Yy+OGFpFCsdY?=
 =?us-ascii?Q?Wku9+e+Ny50ojOplij076uIXMptJI9sMN74wP55hYGu61DTEXyuD3HDV0dWk?=
 =?us-ascii?Q?+4FUzc1UkX+zvJNhApgeadkBq900Kvdxf1uz/kejKwo5wyx0pzVSaJ9wen4h?=
 =?us-ascii?Q?9Xq+RCE0Vu/y5NzQYOUA0gYAy9IoKxlllCwhhhgNVIErFePrqT9j1QATBCzk?=
 =?us-ascii?Q?UPaztdS8C36kSx7b5N5bCt5651BEwxH4CpoQ/tlgSUX27t0SQVXsxMqMDwFb?=
 =?us-ascii?Q?oteesKcpuPUV0M3NWTYjBc7TZwceTPG7gEjrGIoXORu0tv0I5uGn2IuAVhWF?=
 =?us-ascii?Q?w29A+H7OnqDLF79Ga5EpmaDvtclaDg+Wagaf8Am9oMEr2ZLzlp8hRuIRsvgx?=
 =?us-ascii?Q?HhKZgjPFWda8ptQdahOF0U/ZFr+g8fZphpn38+So08/TSkExk8vjQ8XtDqan?=
 =?us-ascii?Q?kJGkL5EVQpTzAUHroavlnmBuWMf7EuffYYa2CIuvYJckvAdqk+v6Rm95Vpsc?=
 =?us-ascii?Q?KZd7XC96FdHDy2q8aFErU2MHDUoNPMUeUiNRZxrSyJIP9cHHgnR7yz1fGPBW?=
 =?us-ascii?Q?cw91GeKSewM1vvfax7sGgnXbsabUrHacL2gIwdL4o93kION31LdnTmcOuHRx?=
 =?us-ascii?Q?sq6VLgq1twu9U0BX9FmrxXz7EDqCUFvV5Hy45E2NxBCeT2qTryH8CBiDPc2X?=
 =?us-ascii?Q?GGIIjuDOs4GzPyqQh0FojdVkvRx8aQTHcwQTTIqavWiofPT9UJ9uZ+WYWp0d?=
 =?us-ascii?Q?ii3C9OY9WDO7ETetxJtShbzt3PxI4bz47mG01SKF4vlhDYJFqYdU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f3bd45-dec7-4dcf-bce3-08dec4fcbd5c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:24:52.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WT98u7kP4KxqPl1n+lrmSB0J3OOosZG4g4dLLA29T0/WVqlQdGTFlZpFUdk41nz2LeaNp2VpZDPhDmoPVg9bXIgs4/Y2VsfIXy5nrkhVF7/cG29xG31hlBbGrLCmGjrT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

card is not used. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 720216b32a0f4..2d39ff23f8540 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -44,8 +44,7 @@ static int set_card_codec_info(struct device *dev,
 	return 0;
 }
 
-static int set_dailink_daifmt(struct snd_soc_card *card,
-			      struct device_node *sub_node,
+static int set_dailink_daifmt(struct device_node *sub_node,
 			      struct snd_soc_dai_link *dai_link)
 {
 	unsigned int daifmt;
@@ -110,7 +109,7 @@ int parse_dai_link_info(struct snd_soc_card *card)
 		if (ret < 0)
 			return ret;
 
-		ret = set_dailink_daifmt(card, sub_node, dai_link);
+		ret = set_dailink_daifmt(sub_node, dai_link);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.53.0

