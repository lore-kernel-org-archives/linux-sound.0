Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3218E02A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533532; cv=fail; b=kQfPmpwiGIAHTuVZk/todPJM1RD4wPJBEiX5kxay/erDz/NwFNZquSVoD9qdQtiKMEgr6h9JgU2uqIVA3jDPKsSDgIv3Obx0ODKqqepic2REp9jAMNci3d4GifljA69jgQD40AAjdWF3nZwxnl8jr+OwAKMv81bDNP8MvLURmTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533532; c=relaxed/simple;
	bh=HxofePnHmPA5XyxCOHp0vO+g6VrWplZCWAC2yXTgtPE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MjXdlAquK7OKfH+/U9WGCOI9gT13TqE8qJm9RlWTMuNn0YVOKws+GOZ2fsAJp71WmyZ9lhkgUArI+hpaEkBgFeLHrxXr7kjZeOPVzREnJOLhvlfGQVzt8d9a+Mrk4FxwvayPMs85eXs25mMvRvuJVJquHWxy/kAIW4u7l5gHSQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k63GQE68; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k63GQE68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygKd52Us1drfyNGJm9CaKd2AxmFEZu8AC3r3+R7uLUCX8p38EIj2oBQ321/6wteTtgW8qI1LOVNkokwRTFWWQ4T+fNMNTcnpUKa+SnMqcd6CcB5ilrXWrmzSNMoLxodtBljAlqKFDYg0c0aExAHIxywSWyeb3h9I59KeT7gtAZ5eSyYoa0rLEA33W5pRrf+Rgak9V/s6YnT2IdB94APW4obygx3umj5NOaLpskWjkwUZ145NZv4jqeucUnOJar2icGcv54S34fn40lpuNBFGS9Q+biqWtHh5p95VEUKqRD5eaXev8yMCRtVyuUUpzc4gRuMb9I4kSTPHimaVrgX6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXpji3Sd3HdsWMr4SZ6nuoi+Ldc4/1ypMsyE+U1FUFo=;
 b=J06nR4spkzjbq6+98Xy2s5gDmBtm4TKLQ6N3WQUTHTwU3lSf+AgdnrviCyZ5gW2no0gZoWAxwKsq2GFsI1X6ptfBqPWei/HgEmhaqyoldFmzQNcCaKpCVfdN8m0/WVHrNtAOCCg6XA19LnzU9h1wd1v/QMGAc7vzbpjVfyC1nCzGVyB/Ea72Y1BLIv/89nCBA5AdwoSTBgvRBMQacHFYart9gF5M6uZMBg7m0G84s78KyE1zOX0e6khJYH/QAVZDUzPZFzECnerj8WAYkI1JnUvt5XTVcb5S3jXDQAtkqNwCj6ZdUbEQipuxnCXZIua3pk7ZFhTdI5jYRq0r2TzV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXpji3Sd3HdsWMr4SZ6nuoi+Ldc4/1ypMsyE+U1FUFo=;
 b=k63GQE68Me9abmjkzp8JCGQH4ysDQ/+JuQNpf2/hJxlkyNbllbpI11KqmUcQLfSWZ0DTaWJ9xmPtJLmJuoguAzNrbnSdT/E1imyF9CHrTMAQIP9H/7E/qX4RyZpjzk59Y1EH9s45uBueza3O6d/dUpgGi0D2nkO15Lu80rj00ZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:08 +0000
Message-ID: <875xkxfq3r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 032/157] ASoC: codec: da7210: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:08 +0000
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: be9e5292-3afe-43a5-0321-08dd560562b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HMEA+8wZIonakeH7W8bjrnbViXIbhxy2ueTQlzhYcB/moDOsCfotwd+Zpr00?=
 =?us-ascii?Q?8sEuvZML/iQCqkbtaLSEUNFI5VypMqlkm8Rogl66Bb26JqgcOIOOa6vkNAxU?=
 =?us-ascii?Q?izQhs+83PlamTe8nTtj5GqO/FbMQVK63VA18gb7ijpP/EB33GQMeJ1/nhZY8?=
 =?us-ascii?Q?WfL4r/WjPfY7lnsg96ORGugDKV/0VOafFQ83fN61umCRxlfWRwemF23bNhee?=
 =?us-ascii?Q?T24zLHMgNJS5mTdZYNgC77FMPJE7ZF0zsBdBbacUbxkw+Fkaeytv+WB/P5A+?=
 =?us-ascii?Q?Y9RvvLqVg28X6VbbG6rJzDbdOZQeRd5MePx+5P/oiRajBrsd7P6i/cyQaFHS?=
 =?us-ascii?Q?PN7qTwhkxG0is0JyIpNdnyU20wIYXhTLlyTyRYImezyzA3xhSPnKaEpvOf3m?=
 =?us-ascii?Q?f7ZLybKT6hgbqTlKWAkuGlYf7YVZC5McruPDwTFnQYnVZ/j0OTynFmnBVLc5?=
 =?us-ascii?Q?W9lBuKca4nD6SaeWFCvoCn+gGLSbwdbz+1TyRyZ8iqJ+BUyLWTSuTB0loxdc?=
 =?us-ascii?Q?vHfUGUkHkDbcU8W9Qt/3tqmnCIUlip7XT7EWFw2tmyuws4+MtEocD5cuHtH2?=
 =?us-ascii?Q?lYEV9VrHUaCOCubgZRQ5dfOGNVsEW+Fetu46H6CXawC5ZD6d9IACbyC/i6c2?=
 =?us-ascii?Q?g+gwL32ck/jCKF4vSxSPGNcAC6sSyrffhsGIfA9WJWbcDjGfNrAdWLzaixys?=
 =?us-ascii?Q?E5zMFBiocIVFxU75vBEzOpa0/NzBmrO/DqmXNlO+zRXRBZ1bgZnxUpWGixMg?=
 =?us-ascii?Q?VwXiCglM+4w6yUVpnr6BeLyZjnuT4eYgVqV5Y+R8xD9oPfDn21thT/vfX/7M?=
 =?us-ascii?Q?n0op4nzANPoQl7ypx3BsCSWfsTNw+EU+V3oP39Z8U2yFKOY3BWyHZ3RSL82O?=
 =?us-ascii?Q?tHEGMeY9Mbs4wZQdIpPi7/m7wFF0Qdu3tIkGjPEPxFpChbPMP/lvbOKkM9iR?=
 =?us-ascii?Q?zyBWBKSFWzcjcWukiwrfDo054djp1tGydoZaGGl8wholQ0qxVtEHtL/zsY3N?=
 =?us-ascii?Q?vb7Pzlqy/97Ngsuzleomcw0/bUSqEbBjGCCQ0+ejk/gILpWQxer929uryCXx?=
 =?us-ascii?Q?OE3YoMPlTDOQgZ/yAQU5VaOvRITKe0kE4qrJ2ji/bx5B8UGmIszzzBeM7sJN?=
 =?us-ascii?Q?utMjmaC9xKp5TnVnwLTogYArkImEogyTA/jJ0C0wdfv4Ye4fxbMlsRe/ZSGH?=
 =?us-ascii?Q?sGpHVw4hoaVedLviWTOM49nw8eBEXr19DR12igZLvhYqDEi2cqgYCXZ5LPhx?=
 =?us-ascii?Q?BxaqRsWLwITUX4IFXxop8yxQbhBpVGu93oWv7G99wkcVyUYP5K1QDHfIV1vD?=
 =?us-ascii?Q?zq98LctMoyc2PmOgd4UVtB+Eqs89UgD033diaoMRK6vBtEI8DBUevZ23aJwm?=
 =?us-ascii?Q?6OwTkhEOlJlJ6eK9newJA6S6/MAUZ1jkH3z/wPKbu1OMagrvfX8AXJtgPmzd?=
 =?us-ascii?Q?EZ4zgcSbd3VtDNhawKYsc3PjMAp5QsYG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1QNIyViNolJ6EAztx1nDmGsCoPAqxMaL3AYpCkQ8ouDKSb3r4+gDgQZq+M7?=
 =?us-ascii?Q?vWfvghIX0/MHaA0OX7+CcZkp+D0D7NtJtWESKu5Rq+o8r4k6SZNRq/S9iCpf?=
 =?us-ascii?Q?GGOU4IvRqT5BDCSUjt4dPTnaxtVPezC1a+0fnDTN+Nlqdq868D2UtL68BAKS?=
 =?us-ascii?Q?s3RnGPROO6F/oFUmm2d28jDvc9JVk0YFY/p67S+8vQGXtHXqBtUnzSmXkLbI?=
 =?us-ascii?Q?9A5RxA+x7QpyI0RTdga/ECEiZG6qPx8R5ab+C1Y8EmuiYnemXjdcFctIkWVX?=
 =?us-ascii?Q?qHDvMtgGuGtRU81yDUvUZ2MDWkJKkOt/nvlC8s5Xd+1ffORgEw0zW8oTsyyK?=
 =?us-ascii?Q?HOlLo5/Iqxvw+2JCODPPudCF3xRkYI4Bur455gPhMIBEBtzt41+YucALCutr?=
 =?us-ascii?Q?Z28wJDHWD/iH9RqqFg7djkOiDgOMeskY13PnKzlT1lFm5lNlNnp8PjfFu733?=
 =?us-ascii?Q?mqln+FiQALqLC/n6Npy1Pdv3EI3DPDj6Nch6zACdcSCbBMRwLwxabm09fuzL?=
 =?us-ascii?Q?2lvla3rQ/bBkjqn0q4fxKyQCAP7a8/h1Rkk+QAUebfC9K/SqZ0FYIAYx+DyJ?=
 =?us-ascii?Q?xT2AEupLmXLB0C+b0DQWPBMojnjDc2TLKdUqVAfeUDHBOnpkXk84DS6ehYOR?=
 =?us-ascii?Q?HmHWj8D5djAofJIPKyYogVgBAErr71c3+aVr09RRVyhVP2NMmQ4v4z2VnHaM?=
 =?us-ascii?Q?8Atyp1moxwFqmOHQZwSMXuMSawLdbCP/zOgtkB79B+mj4qgZOjtcau2ZF+G+?=
 =?us-ascii?Q?y4LRbPshAGX9C1GNgfnbZmDVVQRcv8VCdHz3GUzVncE7/msy38IV8GqalBRY?=
 =?us-ascii?Q?GpgQ0vlamzjXtSdvXH+j3/HCAgSDtocHpTmfVKaoe7LKI2xQK3Lm4QderWZ3?=
 =?us-ascii?Q?1D1AKY9QdaudrgA2Eka6F8Tdcc0ZrsyPYjG1snDlvIgpzwe6Dv6PmG4rdVVB?=
 =?us-ascii?Q?nbEPseX4WVhb8xohWCY1mrQGlcHTwRgBTbNfdatXr4aLBPP4Dl5uE3u6DS3n?=
 =?us-ascii?Q?/6KceCCmPEoUqdwdqLLczy/wjT6V4KNp9Chuwa9jmZb5ZPzVqrL3USolXjli?=
 =?us-ascii?Q?Ji5JZq53F7WQom15T1+HaPu8tDuzYCfDUA2VKIzf34GR4tklG69U9p2c4D/c?=
 =?us-ascii?Q?+UYMx8RAWs/iu1lV3MYuASD9Qls4Hw8MidtUUo0C18N03jRlCZ2cbWG7YUAJ?=
 =?us-ascii?Q?BBa2JMw5ZC4QAW7KHsX48wQ9rIhjkVgZzNYxNAD6DPpjdibVnmpiTPELwW8G?=
 =?us-ascii?Q?4N8YVU99lJlTVFYEgNxdWhGtybsBamwODl22ykSAM6lKh8EGcDGKkXTlCe25?=
 =?us-ascii?Q?Tceu53aMOBgsPfHczryvk+/KS19xWk/mzlGj4u2mD8p5WFUzTAlg8i0AXbhe?=
 =?us-ascii?Q?8IKotpRq0m0MmsqZVWJUgtBn38viLMXCoQGt47Wg0qXXJDnbw1NZ2L/dVwHd?=
 =?us-ascii?Q?CXnJzNRBuJRjiP8WVPMZacEULo65QJWbOhBQIU0FYPuC5EX+JaCteAeVg3yJ?=
 =?us-ascii?Q?eF8pZeVQxs8SMGI4nzefOwPIIFaAvnj+nvjb3GsZ4Tg0kFkdqe81L2X1ijtb?=
 =?us-ascii?Q?OmXlpwoG3ReQp8VgB8+nTKOZ/Fmku0oHf66EjqZB5WRmzvJhf5hnnVuRwjXq?=
 =?us-ascii?Q?vx8RcEG2oPnCLsrAEONdsjA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9e5292-3afe-43a5-0321-08dd560562b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:08.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCM01KDp+g7OzfS3KTXvbh0XGo9h5pcqpTh6azTmS8YRq3SE5AcaSPQr/oyhjJMAY6rnfClqh3mH/0oZRDFUOkhTyuLiCvmsQMSsQSenym11c7ttbhqwTizyXULV8kkv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index da2d0242019e..a889f05119f8 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -882,11 +882,11 @@ static int da7210_set_dai_fmt(struct snd_soc_dai *codec_dai, u32 fmt)
 		return -EINVAL;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		da7210->master = 1;
 		dai_cfg1 |= DA7210_DAI_MODE_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		da7210->master = 0;
 		dai_cfg1 |= DA7210_DAI_MODE_SLAVE;
 		break;
-- 
2.43.0

