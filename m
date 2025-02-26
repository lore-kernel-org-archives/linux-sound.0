Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ADA17DE2D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533421; cv=fail; b=MMTfsm/uUt59MVkbEENMhVVXodecHqlfP5s1oAALWEoA2/yLVdQr2oYnJ9c7XjD2glpPm46ZRUxMlJl2vbcRtO3Y+CBQygNRhJKCXIHEfg2gWTlowlU5QAA64e9fqd6LboSosFUFNsf/l3fD//pOTTWmtjl1JUYQOEysfJMxg6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533421; c=relaxed/simple;
	bh=zpHuuvG7LYxyw0whwbCV/SVN2+iSxYx7Ctl07I0d9xU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q/YZpdr5fCVFpOQhdF6D5njyronfR/h7E3PaO3jm0THVPZLtXWo8E9k/cYcymO3w1sKZfYcqkFk7v3CHTtH/3gtwzEUv2VurXQebXI8ROm/7V/bGoiWmE9PWT/mgDAlFYfEMrBtPhBel/JnVLDAspAVquBU7T8GtaZrHVKEjAh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hJAYchF+; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hJAYchF+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aW95xpWYQ4PGIPl10vfLLIKQWy2Tqr9+9AJf30xzAIHA7iZmqt+N2nAw2sKGBHS32m31b62eK1UODnhwg2elKJt+3c5V+MoQIhWM0/4x14m6SK5oS34AcJkpPP05QMiMxwCrpxC735wncOEmrFd27opZPuCsCNVjJ4Zc0qZhddkHgVsB2qDegtvA6Az0rEsiqogFNkJR99S3G+HpYiOXPJzw9G4u2HSS0NMWoB3VNuZ6XrdPRWlugcCAxKcrdi/TKz+j41j5RmYgikAnhhw/o95dWOQbGi9+i1qWYJjnmHpHV48vBcwYwQVltgk5qQJl244boNQdOG09NXRJDJIzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuiWPTKhykONVQMgOxe1DW2LxFI2qV7ZTAIZy4g1s3M=;
 b=SFbHmqjxelYoh2vAdN8cac5+FSKYbXIq16c8eayyWRWJmBCYB+8W4wcAQeen2J1Dq/dLHyF+viYGThAPgWedZfsLZtMXlHB48Ajoh9gkxdgLasH4GPSvj2eY6Nrd9cFdJtin6+iyQzP8juxCci/cSZ6XZSVXc5HlNdRfJYzzY6XbqHTGbC2CtDl5g25vZfkFLIcSp37aPoImDo5+9SRH4NkhgvwiA3ecoHA0IBZaZCKwG2TflxzxaGqbbB9deEY/vOyGx0gruIkt6a7IKqpHowPITk08wFkT6+QGUtvxKZRlD/BHQ6sLfsSDLWi+dq29C/lDJvvCouso/QBeMSKoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuiWPTKhykONVQMgOxe1DW2LxFI2qV7ZTAIZy4g1s3M=;
 b=hJAYchF+svZ3KDWP7wyXJIoXF0ATJS21gHSbcw83jtpR1FZzgpNBP35/WvRs1UAszUPj3/utec+vuio26TB9YpCMzSLbRVefMkXla0vmsFB3CdmXMHb8xkxRUHDjqq2dh8RPxg72o9arVR4hcmVNzoSUYAMUmnKrwDhrfFUBhvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:30:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:18 +0000
Message-ID: <875xkxh4ra.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 007/157] ASoC: ti: omap-twl4030: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:17 +0000
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: 1240570c-ccf1-422f-dd10-08dd560520a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8xMKF9p9itn4QilPpsdI74ipMN8wzxtp6AnzljTpEDGHKNMEA8brw+NkicjV?=
 =?us-ascii?Q?yMdnGsEWdmC/EeMOd6zLZgCgYvp1npxtXm7EiZKxYljM1E0GtkU4BIhrKfP3?=
 =?us-ascii?Q?t/q3KeP6ZBeMW8vQCNJPO8FBz1naqDhWH9jMH1lQwFyhhqKRTdTkWXNO8yUO?=
 =?us-ascii?Q?Uzad3GYyoR/bq9c1bIDD1rutG8nQHR/Zh9opuv8/F5ryjJKM1TKMa5wA1IHi?=
 =?us-ascii?Q?xNUg02BHSRQVor/8AymqCVU0lMFO9+Tf7u73lMvomabCz4kawAMV7TjUqimT?=
 =?us-ascii?Q?7PLCf2fKG066ZHk82xl7A2eKCs2QsRZgSaZGGzfpPobpOkHp5dDCxATfKO1x?=
 =?us-ascii?Q?7pewalf8ZBVaqt3F4Ru46pH8MFYPkYXhdvknOx3nEvCVHDdjHJbjaPkRUrle?=
 =?us-ascii?Q?zzFGHCI6WMh9WCHXh+vAAvnCQvEKpex8lRyOzthtcOaOz6iCNUkOUkiJ5LJH?=
 =?us-ascii?Q?gd9aQu627HDI3DNNxycbU5DYY+VA2z5J4+osFbIZfFZKW+N+39l35XRVh1J7?=
 =?us-ascii?Q?bC5E6GFjKn5iv43X2eWT2CVKftu+Su1mtAFX2XppBm3xnL5W9mZzIKUWp4dz?=
 =?us-ascii?Q?ZGcAsIU5cUmwRJ5adiMgsSM189I5N8TSwpdEomPynrApbNnzSDsGppG7j2Qm?=
 =?us-ascii?Q?PQUYRNXBK4dsiaj4ovM9j/wCFof4bajqFoUaGOdvB1q7txprDWJvQY6yajE7?=
 =?us-ascii?Q?vqOOjAdfvAjWapRxvXwWIya5HoT+wu0lTN6CymuEcxD0xddLlKXHfB5ADeOe?=
 =?us-ascii?Q?AbYuiuCdtl6eS5Cvcjh3nFbi6uGoQpssmucV5KITTpU+tBjP/+QYTmZ4fqDh?=
 =?us-ascii?Q?lZtPtZenaB8up5CrxxwvqAriZWLvd1WybNntK5UMmYLXzGSghHRPzB3yFVue?=
 =?us-ascii?Q?vhhC5baM5CTzbumVX+LsJfiaevD4EXX/gHalwI1TlxuHx2YbDYlgvgn1nypb?=
 =?us-ascii?Q?83M/USYyQW7Sox4a3uFa0BY+mBgfSZ/OXXIvvXaapMItOlcKv3xX8c31rOWb?=
 =?us-ascii?Q?nfpBIt4OrhTNk0cXlAAp61rXTtFVy+8yHOgTfMxLoyFyNmb346fKmo21p2N4?=
 =?us-ascii?Q?58Zv9N0h+Gt9yCEp1H0XZvRQFZfNLMm18M//rYgQwGn+stahGLk7W3hlqlpU?=
 =?us-ascii?Q?3UwOmX1FvAqaLST1sdXVAtX0ivJFR2popo5GiUlIVJ4+oNrQq2bV5Do4ERP1?=
 =?us-ascii?Q?lYWtAEGI8cpz/QEEUBH1st+X2uFiuhSEDfl/6TBWYe+6F9XtaYUzVjx8t6rJ?=
 =?us-ascii?Q?Um56M1Q5BPHZo7jba53FovomQpGr8x91vpVHUiPWeeMUOaDIKp6vYgj6Y5Fc?=
 =?us-ascii?Q?2gypl4+EZes0bNZNRSVCyeT/Ax0mo5yMXcwB8ZSGQafg+TCmjUOQUAx17KHM?=
 =?us-ascii?Q?fsg+e/QeS8YkMDBhpiC/Tk+cdoBSgJZ2H4r6O434EQtrIHwXkE69HT5IefWl?=
 =?us-ascii?Q?Vj8MowY4T16CMOMS3ALWpOw+47cidZTn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCfBEm3Ud09w2Fy0MoiSAzo6LSV1QjjTadp9yoIeSMrgNc7M0tqVE4YarKbc?=
 =?us-ascii?Q?LjpGwUyvzB2e4SsYu8yChi515shHCTN0pYhv63vhTU+AGtwFehWAxR+M7oZn?=
 =?us-ascii?Q?pXRigAa2OZ1Ie7Y21nnn+krLjU6jl8zSjh8CFky62enJ9DH/oqnbt/c6jjLq?=
 =?us-ascii?Q?+B3sw8zY2TV3SiqR4Mt3jV6NM7EUHUhH6eFs0KJW1LVT57BwzLIvOnsXx+rN?=
 =?us-ascii?Q?BVJZsnlV7nwu3ipYnOBJ30Ey41oP/JgkXmCkrEdv5HQ6ISLHX0bntabwT6VD?=
 =?us-ascii?Q?2bDk/34O+b9HSrxKaHu/uMpM9kP9dFkxqj+hRtlbJD0ylHpPrYrq8zMprCLo?=
 =?us-ascii?Q?rHjcQ4GkGszsW7AZJdpehXZMNilu8SrDnAp56D395H+/40h8+x7EASJGnnnD?=
 =?us-ascii?Q?vXAMW/oNHuagdmInpahqHH+jiVmNp9nU9I7DS5pzUrOJLlMFBzX9jebYJMNs?=
 =?us-ascii?Q?uMB0gU35abBKgn+9uw+/qKbxbcecigGbDaLv4rio/9r+voEZL9ygsQ1UhoAS?=
 =?us-ascii?Q?liCVsoXNu+gSfVvRst5T1FdjSIhORXMpQem6GYqFPV/36maGeHKTnfAT7z0h?=
 =?us-ascii?Q?q+7YlnFUOjvMcsO3tzJMHNDhufZZ6QJb2peJddq42r1ykP/Ba95brTe1rE6i?=
 =?us-ascii?Q?Se4HiXc7iuCRYfX0B3IeQ7mg2BmpDKws/kGMWu2Zbbd85dc+t9+nCQ0SH6KS?=
 =?us-ascii?Q?NsrCu6VkwzHoKL9if0Qo6dTEovbrLe+IBrYvn2hXxJqvkzNSVLadPzfCgOOf?=
 =?us-ascii?Q?a1LgVKBZpDlysYR+2foPBhIlLe3wLh0q+8p6YkoB6QMfNWGqzKFXpQbVNZXm?=
 =?us-ascii?Q?RSs74taENSFF76kjNoQfnocP9TPPvmRszBUC2XNnDkCp5gmeaJX5Ao8NSq1e?=
 =?us-ascii?Q?E5lQo0qinTrT03A+e+PBUj3h4AlnN91wYf8DOzH2DrWI0EHDeKmN3gpx+KtE?=
 =?us-ascii?Q?OJ3HdLAdQg/2Mw6XJ/mwcnjKuLul2f6868vSOpK9w2dnz6ac6MjlRfJKfy+I?=
 =?us-ascii?Q?jmCDrz6rxsftEHOJXrrMp2LxjLYk4nzh3QODSlsBfcvdYWfR7zzqkP56YK+X?=
 =?us-ascii?Q?FMOKYyExLjrHkup/jjqL0O9TRI41y4DUUgzOQGhYN2YJ3vQj0Cd+nrPDmF2J?=
 =?us-ascii?Q?A9ySXCoVhYBBK7UUa2QR8icihLsakyHdBiXfAufx2nyjbDwgVNoNizqZdhJZ?=
 =?us-ascii?Q?4phbSxr0DCzzI0cGe1pqexoCvjrXUsZw0ugPejphSwNURRCN1r4rAAOBe9K8?=
 =?us-ascii?Q?gFfSEnhMUat2gbBxAZHvhuAMwGILTd528bsAKKEvXP6kiK+NZxU4XhCgtdTF?=
 =?us-ascii?Q?u/R87+s5+vJn5H4RwTHwTgmJ919fo9g7T6dTobr855CBxKjATYcl4uDlu1ZZ?=
 =?us-ascii?Q?NhweowEO73CDi+u21DCKjFhC5dsuDYQoVUNo8k4I0WVKGrzGt2J56z3mLyIx?=
 =?us-ascii?Q?vo3vbIjqtP+Rp5JbqZkWsq0phfvx26y0zKzsRQcP9EEWLKcGtUvtOQNdl7WZ?=
 =?us-ascii?Q?qB1jGn++34xrGfplQA+bWPfcC9OPbLlmIL2zZRoFKaKNMp7KuGHD5TraJT3w?=
 =?us-ascii?Q?mO7Of8Ay+0ZC1DOXxbLwOuSFjEzUr3GUbCYmCqv1ShPiLYInonbwOaQgyPeB?=
 =?us-ascii?Q?s1eGORW7U/rqhC6+lMDigPw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1240570c-ccf1-422f-dd10-08dd560520a5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:18.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqcj18o6LyCIi5hfgdzDSCl4RtDAkjKEzFLZKvUVXW1Tw4Pm4HFf7vlh15nIhuHz0/HfAwOmWjlgjV8RKhiXmUa5MeZNZIT1a/S6arSB7qkks13A4wmu27OcOQShW1Y/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-twl4030.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index a402d66e4f4d..3548b58002c4 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -42,12 +42,12 @@ static int omap_twl4030_hw_params(struct snd_pcm_substream *substream,
 	case 2: /* Stereo I2S mode */
 		fmt =	SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_CBP_CFP;
 		break;
 	case 4: /* Four channel TDM mode */
 		fmt =	SND_SOC_DAIFMT_DSP_A |
 			SND_SOC_DAIFMT_IB_NF |
-			SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_CBP_CFP;
 		break;
 	default:
 		return -EINVAL;
@@ -218,7 +218,7 @@ static struct snd_soc_dai_link omap_twl4030_dai_links[] = {
 		.name = "TWL4030 Voice",
 		.stream_name = "TWL4030 Voice",
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(voice),
 	},
 };
-- 
2.43.0

