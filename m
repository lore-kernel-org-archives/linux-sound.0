Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D18C18DB25
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533543; cv=fail; b=OgwXxCQztr0LISLpv1/b3MnpI7mwN7srna6hSlvj6Z8nnRE3Gt5ofMNpQFeiCbQjDyxT57AeQ4EFTH/4WYzknY1/rlqRop6308lEg+YzI5z0Cp+fyN0Ox0cSmsD5yM1iUyR3ZDWGMV+fKhhvNKuD2uSNPbDbhqhMrA6f4orZ6Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533543; c=relaxed/simple;
	bh=WdWJ7jWN+FnbaEuEPme5JvKpp0snyhxM7hY/w+uRltk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pr1kvsN4JB4wdH9N60ubgFnkc8rDzeFAvKKVzYC8TE4H6TEvykSdTqlS1bVkL2FRxQLve5hEB5FWq6StiWJuPnw7DDNNSSIueALzCQiA1OblwAw6viOMdDyxq1lW+uiwjRb6Ib4Fq5fY5UdWalXuYZ3QEzobBxS2KsoG1rIzB2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pStIXgVt; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pStIXgVt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFhDFG9LLQajwj9LprCz7cjhZ1MEp4M/0Dg7ukcMsH7itWhmmHzdxAdtSr1LDnX4vNsvIejbgKZyMpdG/pZLHlAZmlQ+ZU7wqF1Aa1n/pRShWnnag/ZVOAiu6xOULT9z/qfpvTBZsCgxxaza88LO3aWMMOpXGotK0PAKDc/6YdVSQ5e/jNfoWY1c3Xm3WdVffOFXRLJ+LAx+6+gkgBYS2AMCB1GMIfC3hfnaQ5Gny6CMh9vLf8vFyFvqXUzaWdAMXItXNp65VmiA64CTU1NU4s5sxfRn/KS7p6wLJKWerFVD+2OcMFmnhqmevQwrOgNeuOSHr9SRey3h/k7Mb6VyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVQZ+CHHkLkQloyxCgG6jZJ8pAcLe5L+CH8INmxt9K4=;
 b=vpBVbo6JjCG5nm8xee+269AxkAiv8oIRGRIWFgHk/4YfwVdOlpJavbsVZO28SB9xT9KPhsXvsLpgDckFv66WAp4lNzOjN6fA4fPplLE6+b4woirG8m5jW6lVf3ve4ipHirWRgCtVaZpNjI8lYOPFBqDisaLdzKMNAF7pa87CN9T+qo046l7KsUR/8XQAKxopOVxThbdzhNXVDlzyjDHeSLDyM6tHqNbuUEJWs0Xck83Rfy19bHl2VwRaDpF0ysHW43F+8e4C5VNtQYrEXIwwqOXXvvHAuVBI8OiYIoUSKlOupbPx8JP6rwj+Fl29T/S8c2e9O/7mPD3IJy3hMbOPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVQZ+CHHkLkQloyxCgG6jZJ8pAcLe5L+CH8INmxt9K4=;
 b=pStIXgVtSWSUHt/78L9ro7uYK853WtZja1Vw+t+ANCtnRHtXQTHSigaOG2cYplwMQIeXucKINc3PmU5dMh70ereJDSMxDONaa8ZOaimzqBDUVaniaHx6mg5QXIHIJux4nK04rqO7BLv7zeRlaRmXtBh0qF4EQEhVNvBFMvJxNGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:19 +0000
Message-ID: <871pvlfq3g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 035/157] ASoC: codec: da732x: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:19 +0000
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 596c6afa-56e2-4672-3666-08dd56056949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VVM5VpPuzW85JhhSzw8THkYvOEymdwBh/MdlxmntBYsohCrhvEP4U8SbXb2A?=
 =?us-ascii?Q?MfvrmSmierq0Hn9MIPdp8LclNIzs42yh2Eja1UG2Ci05xg9u337pwU0keb5w?=
 =?us-ascii?Q?vX+M2X0QmDSmNXzIhAltcny77cYwLzIsI2nFlcYFvCojaeh7JSAkZXr0oKq5?=
 =?us-ascii?Q?Td8E7HrhaELwdbnVyHv8EbJgL9yFgRx/dCoFCFAVkC9gvKa9+Xgq9qg6coEz?=
 =?us-ascii?Q?LKwjJ13qQ1RT3xbvXTMdY1FmpQjTA0QBVhX3fZSxnKCbPeZqChmQwqBMVhyT?=
 =?us-ascii?Q?lEdfctLjpQhn1UPgRwvst5abaA1eYzItLCyWlMP/EOCnRzid2TPJ4Mwzm+gA?=
 =?us-ascii?Q?AfIMGJEsjwP8zOG87AcQ7aRIEg65d09b7xOrU1bdm4S+TYtrcQF5TVUf6/Tj?=
 =?us-ascii?Q?bEhWzCEt8nQXm8Ylu5HorpeVJyfJI+GnVVMwC3GOm2ucf/mSq09npRKcpIAF?=
 =?us-ascii?Q?zaBP376Rv2KiKbw0IERoy97KdsxVBBjexijQgfYv0fwKsjchnfLHVh/hj/B5?=
 =?us-ascii?Q?8ZT33TdGqwxSfYs8Z3ktmDZkR68BvcFTyb7lTpqk+OQiO4hiWU1ShNITIXCa?=
 =?us-ascii?Q?hZ9Ud5xWQOyLSzL38+1tjkhk2xI90uomleHzVG3W3M2L58vYWDTlRYcPxGxs?=
 =?us-ascii?Q?RtoiVirMlvoJeOUwMWr1xdMk3Y+n35gi+veA6qi0M0U11IQr9QadsJTZP8a9?=
 =?us-ascii?Q?aFXgWgjEM9YT+Vzt4yJOdS/ylQQ2WOAeIu1fn1IqGX+A/C3KxOo9eNb64jSQ?=
 =?us-ascii?Q?5Qp22MvrVtnA7JiYNUXWJ32Kj69ZNnezrvAYPXATWbE2sQ6GfxzVKT4fHbUw?=
 =?us-ascii?Q?4/Q830eypeTal5S0oQlidNveG7piI1m/SNheN5JTiufSlWMlLRujgvxLvY8x?=
 =?us-ascii?Q?6vcbfQSyjFUGcrUInnGU/EFJZFtGiQmhEIghTzQGekK5mkIJxb2IQCjxhAve?=
 =?us-ascii?Q?msblWPZY5m+SFf3HqP3K+/ul7JZiZ4zBWRSVoo75LyreMDaCPhxnI9pXlkHe?=
 =?us-ascii?Q?PRT8cIRw3jf1kNcM6PYEKu+BQDQO4a6m3RTQuiPowXZPEuQHmgjPQeof9Pb5?=
 =?us-ascii?Q?1Ifow2LiO6hG10J0wr7saS+WtVVSRKOyBoXOVnKrBvkdn1vEXpWHdjB63b7l?=
 =?us-ascii?Q?TGDxcQgWG4hU8fejdj/fomNbND+VqT48jOCZdPY7e1E5IBqHbaD7tTJHvsZw?=
 =?us-ascii?Q?eA7Bff0x/GlNSJHwYmIMHzm6v1wJifX1aiFk6XiPSb1Ey4NHrm6qyoX2CeiR?=
 =?us-ascii?Q?5VPT0Ly9iXVFQCAGghQ1tFzAv0U6EMvKdtC7U6Th1eEz2+3ci4gM3+PuAXOM?=
 =?us-ascii?Q?uy1MSx3IrBr3BaAGC4TpNpk4Q6+jV++o8Um0W2yUJq4YU9qPim7W6gzJXByY?=
 =?us-ascii?Q?ICbA9nYmB4794/eWBvRBWo74NOqDrHKqkGcigQw+/rhn4mfZgZGJooi8K8eV?=
 =?us-ascii?Q?7dhe7ocos7kH8PaA8x8AE8sPB3X4jANg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9IOEbZJXkyCxemXz/gJoOLnxpntAdXy18ooKIene8CR1ydlcMnuYmNi10Qya?=
 =?us-ascii?Q?tBpPjWtJRyzewtHiQs19FU5C0avhu95Yt/89EDOyJdx/7AZ9nM80ZxNGbyxz?=
 =?us-ascii?Q?7Jt7i5NaWYmVwOhAEc70f3N73pQTUU0dZ7hkADEVNz88fYFS99i5SA1rT/I6?=
 =?us-ascii?Q?PPKyd2f7NBGULLdsrngosFW5VzHS0Tre/jneeA6UZgPw2zvMnOjXMnNrtvnn?=
 =?us-ascii?Q?ter4Hc0z4Hi2mERHWMgHWjHQpgGJoJY4QQEbT7eOwrcJYZGjgnJceFNT4oIF?=
 =?us-ascii?Q?xssTG80N7FqcoJ1pMFYyP/Seu+EHaKrgVO0TABm2t43yQLLp9fdIl3gUvCQa?=
 =?us-ascii?Q?JDmhBdrtT9BqkM0v5LIggqRwW3r3vS3JqsGoPCPt1WECuW9N4Hbj8QEjTC3b?=
 =?us-ascii?Q?jLrRclsBIivbxCE6bg/J6xypefdhmRdBFf6qYe9qKrwzp9NgLYAHfVR2aiiW?=
 =?us-ascii?Q?r/dxv8iIV4NDSIC5SzeRj0BZHTGF7ljBD7lnWDYhSQAx42Cx5avaL5lq0Hoi?=
 =?us-ascii?Q?uV5cMvIss23BCX6f9xIYW0ChO82qfHOyrY2+bLH+KkbjhBbn7FNy6dtwsxNF?=
 =?us-ascii?Q?NXS0KUTdUirajJ4gm5kqwKY3e4YiZssGCPCmVlSkSFx7GIqEyRuhL4bxCDfl?=
 =?us-ascii?Q?yQ5ehRltelTgPFUQtfs+oGkfMLyestOriBzCYyiFWga0zWC4caiIW/WGuXxm?=
 =?us-ascii?Q?5o4/y5ULwuekNpyK1+ufqJT9ec0RimUeCHW30A4DMQBp05exvroj2PMHa8JX?=
 =?us-ascii?Q?dzFtNIn8sFdt/qhUEZNTF2S0/hxZyeDNTBLpIRPsyNO/pQ7U7HcO8oOdNyNX?=
 =?us-ascii?Q?PybsNBuxc7X8ON6NMM7Kt8DaGIFqim4deDrOTOKURnWsUqXzSGXlesUJKRGR?=
 =?us-ascii?Q?kN7WgpBM3cnByrOICLU24xiXnjbcdMWgMpcdVvL/gmwwMcLYxcRrwi0ghbID?=
 =?us-ascii?Q?0knAzWSEXRw7obyDu1lEzPNNqKpybYH7cer1TrIRG9dac1/TGfCFqZjAk5Za?=
 =?us-ascii?Q?vCZM6Y8ztk99iJksmzb2sWN7/KtZiLJLti7i16yGhBEcnZaXiddDFarzx0+u?=
 =?us-ascii?Q?6FVijujFZ6fgXtY4E6avdfpNRa14lor6hb28CTq776LC0mvETvhvRgDobtLR?=
 =?us-ascii?Q?SAqaoxmMzswcPVjbIFAEeWrKH//+QmhPILHtHr4mCMmBfeQzElopL2oh9rgW?=
 =?us-ascii?Q?6YfX6ZEE5S3Haf78H05TP3M+tTgAH/IIoKCFBbl62mj6CH+hyrv7wBcdQOtv?=
 =?us-ascii?Q?L/JSocYAWJBNIguGzOS/E4Zu2d1rK1W+XZP2zma11IcqK/y1alNZK95G6Xjo?=
 =?us-ascii?Q?0/Es13+FnFfwAzuHuADx462e3jJpOweEvTTdq47homF9Yc8esc1qYyXCReEL?=
 =?us-ascii?Q?yaRRvZOfiJIx4ufnQufUdF9Witv/v9Azs3Lx2w8bd4uC4tPUjTeYOhgFUaoP?=
 =?us-ascii?Q?AnOVVEh2LLia+dEl9DYpLFbM0CjZmli/HKs8dnPrf8664LHOyXg4Bg7d/hqv?=
 =?us-ascii?Q?CUWBFo3nx+HQtMBVOBjV+Z5wPvszR2jbJJ3S5PiHurUlF3oTrCZA9/Q1zZYB?=
 =?us-ascii?Q?FaYK4zWmJDMHkb5YxiqbwQkZSfj3rVPDn8POU509CZWp0IRWgtS6TvqWwn4r?=
 =?us-ascii?Q?gIxMR1bx+60gMk2vU0kQM/E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596c6afa-56e2-4672-3666-08dd56056949
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:19.8744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fyjj6T4nn3CQvxpmMP2+kn5hT+BmKehBfCLvYrYcVvk4wdW6gOTa+++2yVN8jFvJECHiIvYiXg6hla+p5uSXraqXZ7iqu2jWmcVvbbUfKTBhiCKFodjrQcKtEWpM91Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da732x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index b747f6fa12e4..016c9be3ebda 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1034,11 +1034,11 @@ static int da732x_set_dai_fmt(struct snd_soc_dai *dai, u32 fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		aif1 = DA732X_AIF_SLAVE;
 		aif_mclk = DA732X_AIFM_FRAME_64 | DA732X_AIFM_SRC_SEL_AIFA;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif1 = DA732X_AIF_CLK_FROM_SRC;
 		aif_mclk = DA732X_CLK_GENERATION_AIF_A;
 		break;
-- 
2.43.0

