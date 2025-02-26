Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35519C575
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533977; cv=fail; b=M5Y9fIqQ87S/X/4kGDC6j+pNFs+ab9jkeIekqcZGjVzahzmZVr2BC1UFTWn8lKJXF9xa+T2c2zgNJkvGTP8TzVZeVhSVT6PKPtjWdoZEidHlG2gMhNP18+EARuvn601E9Wp+b+8lYZol3uzkvAyCB8veF2kK4zS5qJoOSEPMwqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533977; c=relaxed/simple;
	bh=DGsd9SOhuvRVTao4E08Y665gsKAZfEpKisdKJujch1w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZyQq7DqM4HTNDMmbUlRDqAh0a3Q07XJ2OcOyeqKfW0nPyWLTt2aGfm/Tivf6w/xs1iXoWoC4Sy0FTtZdkiw+3rIF5kY4iTlEeHd2HSRrRHzmljbyOtKF8aCduL5AItuzBD6i3EDUHCZKLoZNWy6XthLiq4dPsURrqEdo0Ml3ka8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U9/TnDEC; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U9/TnDEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sn6joEirQ/zHBWRMiwpHb8J6/MZ5YIq/cT2CINftAwHUS+NCKbGSMcgi80jKywGT7qFXupX60E4gOEkydAfUSY2fLyrldUbjV1UKbbkGHDfA/kkleeivbhzPoxMJeJiB+pt+xT7fM+Lh7OL5hg9ea65Lz/3T6y4Y36fFwIzyUAmE8Tt34pYA+K5gSoPo4RTe1HAJQMb6CI/88Skvg1oGAHrHVi92VKsj4P6YMHfb5DcYtnFt9tqUxJrlHvQW7jPa3qhrCNaabplXREJTs2cwHtzHldngNAlY+UdHKiFp22KVz/zm28Oz67JcVC+qMQyLKgDd+Rhh+cypfQIK4F23Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjBpIx5Ort8ywdSepi/ZJE5Rt9/Xe7bKs3UuP1pPI+U=;
 b=miDBQNc2aQShiSoJ8ME0994kodMpOxfFAacn5v6SMT6eFisPoQm9jU+AIhGzBFUTTyb6Af6nZGiot8QU7/GJorihmez1/tc6/1Im9FWGCu/t/Vrrb0vdk1145nfZfqebYhz9E6RAKkTy3Qj9hiOTwlH39HT9Fu9u0a9a3dw0UuwuJOW5pGAYBpcwCMUFJeSrh5MYBCcR4P6uVRbedTxqSzOPf+JWNG83WN5XpaSNGGx3Ll34q6tuTtO5TKjQ+Fet07cggSbSNhf1e+K/jEb6jqGTi7zYZ/4srMgN0kFD8oHvJQ6DQJs1vvtoXKw8kRRmzgnhvTEdiRuIUSGjkCIsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjBpIx5Ort8ywdSepi/ZJE5Rt9/Xe7bKs3UuP1pPI+U=;
 b=U9/TnDECzy6IMK0GTbZ17Djc8HFgh0TemQVDUqb7YRFE/wyoIYRTetJkTyY+uokeUvU7vQuJGkHyveHa20bQSNzQ/wl5TCa1EW6BaH0EsY86FIBjl4TT6H+9g1Y7JlX6s0X+KpOreg5GI/SnTYFoXtZcdwq1GbPGzpOiQVrcvPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:34 +0000
Message-ID: <87cyf58ox6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 152/157] ASoC: mediatek: mt8365-dai-pcm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:33 +0000
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a43030e-e3b6-463a-d6d7-08dd56066c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P2X7l47KiFxZtXcxO6vZRcrva1s81Mxt+RRgfOlEDgzdm3oEiyQy9w+0LjPC?=
 =?us-ascii?Q?BCvxfKbb55oYzVFBgO+J263lBELxs43gNLGxpCugx456O8qhtFWgJmMvFO60?=
 =?us-ascii?Q?6HOOozb2wrpT+IC0eTPqS0cYAWxWoO85M1gE1zzFm4xPyb6CCA3L4vzc8p4/?=
 =?us-ascii?Q?XtvQe6vJV/07MNHUofdpjgQbLDaEqQMqnwyMe7o38jHFPAd5qItKQgOV6sgV?=
 =?us-ascii?Q?ZDLq+ASAuAqRfyqtTTzsnIYM7EUQ/+wUnsJlXtigMv0vYbVkqqsYnXPEMBfw?=
 =?us-ascii?Q?sL5/XEAU4fJBbWV8xH+Ldlj8t/kUTFcog+T6AvsK5je2tSQl/t255/qVQZ8K?=
 =?us-ascii?Q?xYXvso6yBJl4bSQthfIgUWWRTqdu6UaOncaLlsVvgylSOX0sVgliTeiS4V47?=
 =?us-ascii?Q?ePx1iazdMdSAQZc7gklInx03dh/1jg/YUVnsk3W/0QwgfaDt47gxnpsTUOun?=
 =?us-ascii?Q?xE+mjHgid3EyAUWJ+EWArhvDNhlNDabT8wHc11xIieWYwwGYxfkwvDTw/QAH?=
 =?us-ascii?Q?aS72Ol0VsJqnBXtQi/1j9w0pZbpu6lNGra9ejGoZhSeNwxuWb6u5XaCGFYZr?=
 =?us-ascii?Q?DyIvj3yRUi39Eo4+VL9kZmiFU3Y3mUkXR7jFJYG7MmoYoHZEXR2Kv+EzbE2R?=
 =?us-ascii?Q?ue3dIwYqoqhJlUVkywopFgGY8kV8E7MiuKDH/NrJRw6moAXICp8mzebUIntx?=
 =?us-ascii?Q?DsFum//d1nH4fQ0hPRAcCJ8WXVnFZXSOTvJaJQ/NFCYjzdwTSQLDJp9eq6Tb?=
 =?us-ascii?Q?xJfcvHvodaT6xbs847dUOQ4fynO4ls9WjXqOp6V+VLYIboEWx79eggnkg68i?=
 =?us-ascii?Q?8YqoCx6pk7NnHSz9j1QbVpsKSBLa2yWaXVsFmXHq3ftv9LeVX902Qwbq9z+a?=
 =?us-ascii?Q?kJGwRY0XzzJNS7e/9xUu9MlZ3n3mu/GqXW4Trgn52ajLbkmhW2o9wo1VXZrh?=
 =?us-ascii?Q?n9wmK+4lhQBRsHBjl2fp7A5yt5EFgu7RWgxmiAG7p2unMdRhIwSGsTLMbjke?=
 =?us-ascii?Q?fBEfAkoOLXACqkhBKbkM4y8CgJ7uJQDiyHseiu50aQwQOUK5XDWXjSermWBI?=
 =?us-ascii?Q?tAQ/xpJ9bD6B3U+aMjzkmEvhkuPWgNeZ7NkDZJuqe4Ug9vr7qP0bdQNXjMoY?=
 =?us-ascii?Q?Axl8BX09rRN8j2ekrLtMftRg39VbvsSwT5yud+JvJGY+zX6orhVSkx2m9Nx+?=
 =?us-ascii?Q?hrFiLBMOzypRix2kUJkwWOQ+/lfGLIHZxKynoqpw1uyE15iuen9Qq6pIEer0?=
 =?us-ascii?Q?0Y8IviGpw9fpLyq1PYivEnnPzLzdmX3BB7BBKY2IxpRKnAoZ129aa48pm1Gt?=
 =?us-ascii?Q?7br65qt2h5IlCZHhV+o7mM8JdColYqWtgX14kAqU+Bfa17SsUq9WgJFADCQZ?=
 =?us-ascii?Q?cWwdDAL7JJPxTbtKEGS7386zgd2YsEGB8mH0VkDXGvVCpfN4irBkYXixXLlq?=
 =?us-ascii?Q?AZ1EwXXaVSIo2rCIpAPEDp5S7wMkgxQZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jyeu6MOpbxRz5ZwlGTpbQcj3zSDhsImEp7LYdUfu3vwE7EFFLYCFc5jCvGBj?=
 =?us-ascii?Q?0LIiEhkSTglhTzfPny74rx9LmS8EjGkTP0sO+oznFoQV5EdcrWuBSR4LQ0W/?=
 =?us-ascii?Q?RQMlIpbo9+0IRteKijv3zMta/Q3HR9azi18BNHYVZ8ZwdcSw+WfnWUaF+tiE?=
 =?us-ascii?Q?z61Yz+QjfkSKmsg4eN++zDt1gK5pHOK9hT8u+JIJAqiRX439w2aDUWfX2VKq?=
 =?us-ascii?Q?8Q8WqaJbEM9gLBefbn8SLvoVl0c7yIt3utU/yugVGuiZNvAuW6kJ7mT6hbni?=
 =?us-ascii?Q?GV+9K2rZvjCUn7QL53StvLLyEnbvOF4TtLtW3jfrFsS6wupC3H2oi1abr2P9?=
 =?us-ascii?Q?P9fwlW9c/S0huzJcXMtjfvFMNqT9ikyQjGa+a9a8sWHWPenLfdvh4u+74GnM?=
 =?us-ascii?Q?K3kHek41HfmxdrzGDDW67QIIOt8awdxXwKkw2nC+EMrlPjyMiLN5jLgyNZc1?=
 =?us-ascii?Q?9ZWpawglYSKPVtrYhGe+iD55Jx3MY4tOi07fa3ArEGooSTp5hDTmRc4AEbZE?=
 =?us-ascii?Q?bI1iko1ZZ6BplRW3Og2/yE30lNhuI0/VfvfzYzUVtNZai/A2dIQ3mJ1Spwcb?=
 =?us-ascii?Q?UwFp22BoHdrdCWBZeiKKTx4ExjQtIRXXYhhuAdnoXbAnBThFJn8xo6ylG+o2?=
 =?us-ascii?Q?6S3OhXqk48ps6Dz6XV+c7H+5c+3iyKeMt+ogkT4Ogegra6LDWKmv8d4PX21c?=
 =?us-ascii?Q?2oA6sw7UTI1y92BpzM2PXJdqMxLhsrpe6U5LgIUq5AoXA3R2GRAT0dYBbgih?=
 =?us-ascii?Q?tVw534augc28yZujs+VNFqoThcdTeNNObK/O8CHM0Rvd42T1oR06lZnP9Ojn?=
 =?us-ascii?Q?9Bqs6VdsSBJE3Sxqwayt1CmmCM/rZ09Fq8Pe87PvZ5Jt/0x5ScWW6mMRXzhZ?=
 =?us-ascii?Q?LmIAo2gwOkyehEV+HSbp6F8lfOF6xilYshtpwN8pohMMYa+2ptrRy+dJzQ8O?=
 =?us-ascii?Q?pfnAgAfui7Cu+yMaJ7S2ruvoaJHR4YwLoN/XoeX0FEbcVDxS2SpL6bDMeiJv?=
 =?us-ascii?Q?iD5yVEHj+exteFOMjLRAeA+MpRQon8oPLq0pqO5jsrntsDqvp0cbDHv4s5iM?=
 =?us-ascii?Q?sUT/JVNOHMOXRWmc7fZXg88aaiQODBhfvBgtdL8MFq7sBqKDY/aKo7ex1bCu?=
 =?us-ascii?Q?aGv5MkuKlq2P9gephrKKEa7hBelBOaFZpDMs4IWu6mTciPqSIKWJqM1Cqvfd?=
 =?us-ascii?Q?gLK9SWMLTR36/APQCKZWEYTciUaW8qJhZFyAbgm9br9mvVeU7Lt5rFsI4x1d?=
 =?us-ascii?Q?XaJqZtB52SlLi5k2/GRL1/MK+zzD+Qp686y2lqtjFiMcawE1KOhZiTqJfh+2?=
 =?us-ascii?Q?7OBhII2bpcI6Zn/lQjbymqJLvJDVQrkkmp2X+lBMNdEzO9As9anbJEc+5ECK?=
 =?us-ascii?Q?T32C7/BhoOsG1qpwJ/bEvJI1WmVt6jGT7WfkZYOK+mrFwEJexxy03zOKz2JE?=
 =?us-ascii?Q?G4XYbCgHxfwXmsoRboZL3aW1NGZG2YNVTieFeruie2ApkNDKKpmsUUkzOWCR?=
 =?us-ascii?Q?OqIn5dqLVjR0ONA0is+57c+jotPTINMimxeoyB7OoJ/ITyfvXziJiuKwVuhJ?=
 =?us-ascii?Q?WnyRB3RndMhFQ8Mnyg8rr/O6yX8AOo7sgzZk4u2corn/0ETYhmuiy8CSNqs2?=
 =?us-ascii?Q?pUD/TU+mKDV5GE+DrrK/Y24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a43030e-e3b6-463a-d6d7-08dd56066c14
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:34.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8o2RsCp/fXYodsfuZ2xJ+HiOPnUmyt+CkG92EBA2UNFtNZlHawGo48ROVHA/sXjxJBdMhXCIoURl+pniWTR8djpKFTWN+Rq7iR6FbGbMDkTWpeQ7tHvzTWaWzx0tpEE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
index 3373b88da28e..0ec114a566ad 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
@@ -189,10 +189,10 @@ static int mt8365_dai_pcm1_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		pcm_priv->slave_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		pcm_priv->slave_mode = false;
 		break;
 	default:
-- 
2.43.0

