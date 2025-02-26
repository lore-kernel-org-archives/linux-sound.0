Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A419994F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533970; cv=fail; b=BcBSxlkhedlISfm0B1f0hE4lpbx3VoYmWjxxZLO74k5wkHLWggPCvvt4qNvFZocGEFGoL2rbCcg8pZVFHVsD1j0FklJ+AGFoQyDKE19SLyXcHM2jYRI99QHF7tFo2JiSZ8EMeZY5zFe30O/PDXpKLEkGUGj/8y+94aYzjvFO/Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533970; c=relaxed/simple;
	bh=mLF6aTFdCqdjIggjaEviDHKGdLaXmUNOd5TcCAVGLlA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fkxJ88Uz62lcQUYsR70t7f7aI/7Aznnct8wCaAo36MjyelYh4BKI5l+FQZGcq+WvaN3hxEEj6R5JyWz2O9wy5Hu+8SoIGxXUp+v58ZnEMg5ZZZ6yL2myjpjwVo/mA5Drv9xk8PI9Lrpt8Ig4EOuetTkOt1zgIDHm+qDx9nT/yZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FbEJQcGt; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FbEJQcGt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKFIjyR+2ucCBLN0MDFkbLKuqXP1vdraYaZu5NgAVW+VySgWqVD8xhVW0s0KbFq+C8IDFEpqwgI/iXNVUZp9r0+IUf94ZQbcfSZC6Bm0/1j50sZusl88uGgJC9UjTJZUn3j3Haal264rF5hMWn/ahTCqeW6TqdiILLCaoERMiqHpCnkF058Y180WwX/hse3tpGR+OUj/EXAohnipmqN9MB6wtUKg/dxLXp0Q7T/iOl3PrLJepUkuxGwzjVo7FIdxMk0Pm/KkBSPiw03qKcUv0kE4yKUzwT7bm7bsv2d9rQ729solDRTjeNCJmAsqrNFimt+zGFj/inXPjH9euCjA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+T+k5Aw4mERpJ4hnSLG7O0qb7Oh9hAgusw8mNRHYOo=;
 b=DW/R1NYxzR/7tbZyhTQH6U+Vfvkyx/OS+rHUQhpGV5yOL8XUJBAsd0Y6n5B4krxgonPyZuaf2xFFAdehYG020aI8n4NemDF12GCYdrdpNRoP9Q+vQ2RF3RiQongmExlL09T/yHQkfXt5OWfA3k3V1vzR3hD6XdGG7MGTIywPjG34QV/lT0h2/DhXIsIyhRgMSSWXfaav48oELMdL9ws0y2nbrKmg4VJ5AKfNehfNseG8wrNdbdLifFCTZLuo0ZnwJQ44diikb1PTIz/Ehi774kT6Kg59YHuLOkpnF50yYyYYhB+8wXWoH6VMivec5p0rr1/0Ddc1a18OqtlBGzET+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+T+k5Aw4mERpJ4hnSLG7O0qb7Oh9hAgusw8mNRHYOo=;
 b=FbEJQcGt7ylwumeiBCebBwq5etZG3XASRJ6yshUtpeAuAg9tmc7wGsBec1hOGIR8UJOWJi8R2fJzza7BohcTUSRoRNE2kPlorAzN/3q/xBpTol+D4hDSQMFymxoFR/DoOmJjWNm/h+RxH08kFtbKH+woh6D3kIKr0S+8q56JLME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:26 +0000
Message-ID: <87frk18oxe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 150/157] ASoC: mediatek: mt8365-mt6357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:26 +0000
X-ClientProxiedBy: TYBP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f7f014-b7da-4e9a-c263-08dd56066784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xbe9efvKkPa4EmW3dVPJfEJ0ZLqM1FTcJasQ1liNLYtvhMYKf7mVelQ0c5GW?=
 =?us-ascii?Q?mB8xQGEPiNiK3htPAPHKob8da2R1WkJMIIoSVtSRYmn9KQPB7K535uZdEvCj?=
 =?us-ascii?Q?95uY/GiXcsUcZ63VcSTfJP5e0vsAOpX36p5UXIPQobITuSXGkbmVqRjijfcN?=
 =?us-ascii?Q?cnOLtFqFyj9UIZumZcQ88KrrWdVxTlKf58eP8d/NmwZSgpkDoXYNaOj9kAY5?=
 =?us-ascii?Q?+45cEvjKHcD6SHLbqbFTnlCDD0gTIaPhbIqWVuxQ06iW4sBVb+vy4h9CuLWR?=
 =?us-ascii?Q?xrQS0nEta9IPMt0QuW/gYs8iS6e6QD0SxL3I1k8OGmT26vbLMhaSRH1dmapQ?=
 =?us-ascii?Q?SiM/E59RpMEPCWpg0orelR4dI2DrcetjAKNuinOu8Z78w4NLNRLxUK73sW/w?=
 =?us-ascii?Q?cSiy+g2Qgc05M+YSMqRr3HFmCEuTC9nZImkQXxAbEKsXgFDgPQ3+anoAF/T0?=
 =?us-ascii?Q?3WkGZl3mRADuh5N7O357TCHCF6Xq3At5GHV4slqTXwb8j7VTqOYiASZKkabi?=
 =?us-ascii?Q?5k48VCzVUmdzH/O3+BKR6FyyMlgU7ff14DJxZi3KG2opf8lws8GGxgcTsfpH?=
 =?us-ascii?Q?bg6BtmSz3Ev9gUF4Ndrksob2WY5FZDUG+tOZXx7/dMqYRR5FlNCyOpH3uELQ?=
 =?us-ascii?Q?8rly4F726EX9vzItBxAOThpIPYTVD2EGvhKE1r3Zfk4pP1WI8GMYkSfwZNCq?=
 =?us-ascii?Q?ecH/cGrUd6FRth/Ep7xlIGFvHRJlpLsnk70ImQZSBC1tUDPE3M99iKEmpf2p?=
 =?us-ascii?Q?DG2n+1LyItjB1zU7qNxYE10xMKEx7fSFNc3YzLap68NGRljoqc6CJwHyIFSF?=
 =?us-ascii?Q?HcwkzZKraKZaT2iS3GiaZZrashzNDR8uEE5VbB+MgfswoI0CKS2+CPaIS01N?=
 =?us-ascii?Q?+l7LgyJqmXpZZdxnhYM/VEAe1tVjlZvxFN6SRWJiMIewchoAU0CS+Wx71EtL?=
 =?us-ascii?Q?/XyPsZEmIfHz45RR2sBky5f4fb8H0T1qTseD/KD6A6/Hkb2gOHH4A2sI3zN0?=
 =?us-ascii?Q?gnW+Mw8DlzoY1hWbpwiyxNBf+oV5B9J4JLwqjAfx9LYCrAGkSBgfqSzJ+JKR?=
 =?us-ascii?Q?uYfpcxEfI5D5pGIPqoSnMZHWgSreoTZmJf39lDA9z96P0lz7SXtCp2FSECxS?=
 =?us-ascii?Q?wnQR2mqthCbI15/IHI39y5dWFjIGJM8KTQF8yoz2VkCWmj5KiqSYVceopjRV?=
 =?us-ascii?Q?m4p/kaCGMPQUMdC5uEaLwkH33MCo+tAW5CX3OFhZNl7SpTvCN7k2v/fF2b0e?=
 =?us-ascii?Q?tBrPBsU5Op8+MUemiKQSf8RY1ZXssM6jnKaGdsK0gLpoKFmgy0LwQorKQHm5?=
 =?us-ascii?Q?nRfuN3Zc3L6K3d73yOGVjNn+rJ8SykHF8thl8HqmV7z9+qEPr4A2+uEMRiX5?=
 =?us-ascii?Q?5SUX2KUztY0idFP/E2QCp/EEN8eSQqlHDL2vgitR1cvby8gYRV0ESzMd0xbI?=
 =?us-ascii?Q?ZIIBlmecUJ5VUBXvzhpIj5ascilgVmMe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ejqzFxxash7IscGRYROM0eeOr/lvnnAzz+xEexBqZcGq5PPKi7rrsDGgBSWC?=
 =?us-ascii?Q?adsFffg9pw4X90RO5OuNjLQdbMVo+nYGf4C8lqE/hjlEn4JbORH7Fu2zEdTK?=
 =?us-ascii?Q?yfYzkvl8DzjyErs6v7WFZxVF+XOQzrZJVoU5DuGJ0Pk/ybK5uh5x/V/H7N89?=
 =?us-ascii?Q?EiA4Gg3JrLyxLzkUbXuRQ5iFjrxc/jidNOeRsUbv4zun/Qw/y0mCvL6sT7Dk?=
 =?us-ascii?Q?lwMi2m4p1WJXb0iga8AdLgCHOD1A2KGKNVGs8pnQzAsvOsBPGwj4ldY9cVml?=
 =?us-ascii?Q?/fmge8xZvb0UZ13Qqr+EXKYrYzcnO4zhKk5Qi5ypk0qfekgI2exFEqW0M7yf?=
 =?us-ascii?Q?xObGS4axfTelwkANIjhG3aPRU/5IClbSxqDtNDin515mamEDfbagMErPDAWn?=
 =?us-ascii?Q?4LqJ/3ZkHEPnTFR54UqEkOupMjgw65WCan2eyxkDV5/0MOvST0E/7TwcBjlk?=
 =?us-ascii?Q?5S4uJmoSCwxE3i9Wlb6fbqYfBsB3+U4iFPMA5SPJ58iRKXGfYsYw86WNI5bH?=
 =?us-ascii?Q?BC+zPXGFrzP+8RuxCmPTM4J97v1Al+nQmyVA28m0tazx2Tg2vkRDz9tzpKCX?=
 =?us-ascii?Q?P9h8jj4o108hJcwcoXa+mlswTLH6q61lwQoegV72brRidGzPlOvy1wCRxaKe?=
 =?us-ascii?Q?CPEnCSNBSsLwxBzAAnGMx/8xxdTAtxro7xzsTMwp7zEkrVTetn1Ek4UAQ7rI?=
 =?us-ascii?Q?Xe6+5CybfmkBuJSItDvQOIcY10iStOZiD/tJfYgWEOEowpnhpQMNTOtyQv5u?=
 =?us-ascii?Q?WkhIM4rNwxidW9CnlUN/nSzWLCF/WIEfxwMiXVBlCUrZruYSs4p3fRHvGNcr?=
 =?us-ascii?Q?2fpb2LmeINKyCPfdVkr7Jc3fWo1TeVkv94ZXOZqAKm9fGk+Lt+hRJGQY1C/n?=
 =?us-ascii?Q?PfPmZsBJEfv6IfkkTCzapeYDf5AmlUxMsB4nxygUQi2ta3/8bqZ6NoEjYuln?=
 =?us-ascii?Q?ooKWI1VLKUEhnj6hTOo+gSxbVb97QE3Nmsd86+4Q0F+1ycl+zk2S/C2eLptH?=
 =?us-ascii?Q?7u5lHKdT2klL7chSuxz2eWbVLKgDz+0I4iCmz98REYqeGpMjdZFbfbTgt5ZU?=
 =?us-ascii?Q?CCfUb/vnayqfIeZI614P68dDLDa6rNyItiUtjhcdjFzGIZklih7DOisSrp4y?=
 =?us-ascii?Q?iIkQPCeMdbCcTf1kybH27QFOiGSXSeO6rhWd8EnpV1jiTNeMAygn5JoGEPeM?=
 =?us-ascii?Q?HrbnnAXACNUmLsayG02CUt39Lu1TQKkRQLWsdQ5vTPaISK51304pNN8QUOPq?=
 =?us-ascii?Q?FZ0QSkpiYrWADQlDSZC5iFq6dU8JpPXW9dYkcQLHnQPGYXkiMidWrLhbfI4Y?=
 =?us-ascii?Q?6/AV6ySwoC/lzsXKdQB08vw/F4RjPFwtuRR1xOfr0GLWhj0HFMEWs1254Uo+?=
 =?us-ascii?Q?ZPBgDOSH0mUP2/n3CXzXfWLwtMHebfgLYz5gJeXOAWJM+APRBGxLbVRuM7ud?=
 =?us-ascii?Q?3LXxZNA+GVCG5ozJn+ybBTBVkBtLcE3obV7bqbEHHUg4Yz7G5cohp6Aq3Q2H?=
 =?us-ascii?Q?cLiCNKnEAcpyH3d4ZINA2hv6c2MZM/KILMZAb/m3z8gikugbJqR8T5D9e9So?=
 =?us-ascii?Q?Q6b09x0nJOZgRND2sVRuooOTly3foqhfUhIouegRM7GU975inPV0LksjhqJt?=
 =?us-ascii?Q?zjEs4BF0nuwl7euhbFjhIc4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f7f014-b7da-4e9a-c263-08dd56066784
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:26.4529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTpJQ8O+qbbiwGyxpvKktPakmAZFkhjuVt7JCTRUOrfUsFCAPyn47KbtvEPPvRwgNkX+kdGVu6im6njvCWjinWVBlmHzxnvjNKPc2e5ZCE1UOam3TslLi8Bt/fxJtXVw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index 9f28d6bf0323..a998fba82bfe 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -225,7 +225,7 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 		.id = DAI_LINK_2ND_I2S_INTF,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 				SND_SOC_DAIFMT_NB_NF |
-				SND_SOC_DAIFMT_CBS_CFS,
+				SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(i2s3),
 	},
 	[DAI_LINK_DMIC] = {
-- 
2.43.0

