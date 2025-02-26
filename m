Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ADE1922C6
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533706; cv=fail; b=tF1FMP89KF7E3vmOhjYUfuBUJA5evbjg4HVwSULqXda2J7ltKJrdeWA8MVcKSg9JnkvzdgDScC6YrNsW0An3DyRAlM3qPF1UOnZrqkr4azXAIXWzspS05TAbg1cX2CaKdMylqMiGNDFpyvGvmU9sbYWM94u1ucQryqzqzQp/GwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533706; c=relaxed/simple;
	bh=DNh+mGPYP4edIppD72qgTsoQEjrq+xOIihk990Ub7hU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MA6/4y44j9cdPql0qD9Dg5B1XSrg93yZsnFqSlDRQvJTgjA6zgO4MNBU1vex3vKfqN3nqaOERhB0HHbf0WJ9l7FYMtN4A8wAyVQwcSS3rxfQEVIVl5Vd0zRcsfXnls9OjDV/oXyrT0qub0RO5lyIsJG95VRWR1wI72qXxvZ7z7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jbcN6ZNN; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jbcN6ZNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeyWblYQy+XBWRtsk5l29PyS8/AbiQ/yt2vFA+ueYPbzYd8uQy2izNoWMrsXA4hq4ikzCbzJuqF5fJ5PGbQj5xgO1M1VF7jSpygTqD4199/6OOBUSrPgyF27mNq5RVMOHFNUr9hKIOysCAPWbQKE8zaWBnIjJWYnmZo0Iy865cNzaT1BIvLYrxCAGboBzg69Hyd4sc/dGw7Er/sPUCdAlzwEOD1ds0AlvFjhEs3g4jYm1qTJVRK/sysg3w+pamWvkjhB6lUnG/5IpLw2ay5z9jjEGtlnmD4qFRuEwcc1mh2gcuC4JR2Le3Hje5DGOz21jgVnhBRmtPuJmZjvL/78yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW5xuDhWhc8vBNPeIyrRq0yqwTM41l44JuQ9ekKUdpw=;
 b=ZP1y9U1f5oluI2IojfTgvrt+BNyIW7GRxkewY2l3gtpQLlfelyE7Ye8obyIInTUVcQBpZf3B09aju4EmVmNX/2Xjp2pNGfhobAPc34YC95Bb+7vgfjYlEuiS50vmt8TGX1D/O+dz6VnnoftlcGnzwS31DuxdcO7N68ZUUeCfQ+GNPy9mCgGBP33mvh+ZBHrZ8oUXgfURdejdktNwEUsEkjq778go1tWKoTdFDm3vn8CRFS/T9KOY8ZtAhfn4sDZW55TL7KgkWvLpagytYx4NamwztgJwI+13Wf2suCZrbM3ca7gvg1YDxBMbXGt5x+jP9x2L9drPCG0zF7ihY7M47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WW5xuDhWhc8vBNPeIyrRq0yqwTM41l44JuQ9ekKUdpw=;
 b=jbcN6ZNNOJxvfG3WeKx+5dMjZPoAtXzof//QDuPs8H6y8u4/ojEIoNutHh/et3l+978+pVztNYW/kQL3xy6fJYJEDnUfhKH2JN6bAwZFjzr6n6WZ0LLUg15nyKmv/MZtjIF+z5SDsTIPwwlpFYb1D6NLA0BZDI/MvbF63DXSM1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:35:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:03 +0000
Message-ID: <87a5a9cwu0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 079/157] ASoC: codec: wm8770: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:03 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 305b284c-241c-4f34-471d-08dd5605cac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OzbX8aQMyWmT/JHzCcHxOkC+urfDP0s2v2+8Cq4JfN1U5wl+K5PtJYy+rLyD?=
 =?us-ascii?Q?gLTGyfueseGBBYBgcZeFo/0QA/SRNSQdPT0nCSl7rJb/cCWslhKPaxngT/9t?=
 =?us-ascii?Q?WpsJzBPx37lJY3BWmNH5UislGjfEiKNOKu+W/s+roiu6oIK7rZI3A3KnHCws?=
 =?us-ascii?Q?5EeCHdxVestyBOucvxCiMUtUjfMLou01cawx9gb2DgkE6axzUqyXXZgFhjEF?=
 =?us-ascii?Q?CHQdflDUBuAlSPsOUZQq6FOyDngVRFBWlb/qJwK+vdXIDEwTZ5mVgm7+mh/6?=
 =?us-ascii?Q?tAOXADpLEn6ec8H4cQgDvjeNDLzkJ/P6ag3jYpM9Ryy1bWIqvGbVzi2OmPly?=
 =?us-ascii?Q?V6GBe77x0pDkWCOOVk9+EOKs0BSs4WoQjaezOo9jaaCbaXgZk13FO6sd7en+?=
 =?us-ascii?Q?HiyPn+I6494aSN0jsP16jStn0CsfL/GfERswifhio0CiWRFhDUYQ4YPABE6T?=
 =?us-ascii?Q?Q/PBbTiazAIcyd6TGR5bnYXTpCNcryB2w0AE+OLIBI8n4kCpMz6nZtSgo0yv?=
 =?us-ascii?Q?j7urO3fdNsjdI7hTnDqFc5MopXIuz1MjJJnh8ZBRttEMCwiKTW+6dpjUmsK1?=
 =?us-ascii?Q?g5SuP7B8lfujWHmzhdahsgftQGgYAR9jmqksEiU7UDkHA/DuP2po8E7Y73yq?=
 =?us-ascii?Q?G+lNG/mcMr8M4C0dYoPvif8eOv1vxKGmg8jHc2vWND7ntbZPXfwn73CBYPoi?=
 =?us-ascii?Q?aqUhm9i4uUBY3BPb0rVrnFtYUsAa+6wttKj2ME1SmXHOtbzrRLz/Ei3wPbmJ?=
 =?us-ascii?Q?XQuJRLIOYb0Epu/cDryCpwC0mQnqYpV/8LLSH/FMLjWCpwT0FxMnnId34SM3?=
 =?us-ascii?Q?Lrl1sFREfi6rL2NwnQPbyaeWp2nUKllO6o0uZvbS/sS54dR86DWuCpGEXmjb?=
 =?us-ascii?Q?nlO0ks1z7SVIHT/k0F9xfJb0acAH5eT5oY36qQkgO7lQlZTRFHGjAV1Obnz9?=
 =?us-ascii?Q?sC4GdSXOrNvIOfQYNNEUwZLFlebiKxtW3ZhTRQZ2xG0IF2bfSQOk+vEIdS1K?=
 =?us-ascii?Q?+9VeRzBJQpY9plN8szznwMqyEwbxU3/GUzcjpdxcjAiGgRPoVgy27FDKMDTY?=
 =?us-ascii?Q?/H2QhmAtaQJWFvI6CyB2rxPArSu+jenVUX/PEn8JnhhY9AeL5/wNbe8JRdx0?=
 =?us-ascii?Q?A875SPrLQQe9zN3OWtpT1K25wE+LxOaSNg6C04KCIoznBuy6THkwTZWCTW68?=
 =?us-ascii?Q?bsrhO2HVSWQLV8g3DNWWicz2eFczJ+LggIc9nKTu6/f0z1EbbKZAOz4g8PY3?=
 =?us-ascii?Q?g5ATv/tEydu5tyQJkQsQJeDsNK7Ps61Q8FcvoY5jS8ntuNl60pKySpwtQ0ZJ?=
 =?us-ascii?Q?JvdUf0FQUzr55VhwkIvVIs6uUOSa4g1ZVv5jQtvmCYto4OSwcQa2hiYB6612?=
 =?us-ascii?Q?4YihQCL5sTnqiNoeX2WW0qgjJHimfs3FZT6B1WSidog/gBSDeTd+iFqPXqSR?=
 =?us-ascii?Q?/BwR0h2B9YSpgZakmVV7qUFL8QRIgSGa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9KrNDOWRTp4VxC/f4eNz9Eo3SZoxFRHb4bJk+/0hn4JdSC3vr/Bb6yUbD1ma?=
 =?us-ascii?Q?anCsYWJh4pveOVbx5mzhfRctwUDhpH6knN99Cw9hK+hEd1TrmEb3Xtrg8wVo?=
 =?us-ascii?Q?U6ZZ21MaHpZJPoZjnhzA5oF0EuuXSRZEepC488m0lAU7D5Nh3wMRVKFL/EQ8?=
 =?us-ascii?Q?0Sp8XIvV/W02CGN/rmZN99gxlZqOBj4GiWGCteTN3UEhlOkVco1i07ikZBId?=
 =?us-ascii?Q?M19dkRyM5RcF/X711zjGD9iURdBc2p4S1uC1p5+kFdo8n+mu/AETt8jy7DON?=
 =?us-ascii?Q?9qA3slQebiWAhqLGrbhILYH4WFRjcYd3Bl4wTYDs3YSi0v4M6QoJiZta+CTo?=
 =?us-ascii?Q?LHDQ7PR/j4oO65V+brRVO0A2m+JcfJ9eYIevLp+j/FjEy2YRzo+tDSeAmGBX?=
 =?us-ascii?Q?F/tNAlyD12oXvPDBXWVNrHK+B9aIevDOY05WDZHNpN1TUmJgGH5Y1eZiiaST?=
 =?us-ascii?Q?efSbd42KDrgfQit/IJl+r5W11h6tcqO7Ql04Q6i7nw4XEO70f7hk24m9Nfk8?=
 =?us-ascii?Q?MdQCm7E7Aq2U0MpJUC+4jOImX4xBFZgg05QmwVf26SCFotbce6+yQbHUAwNs?=
 =?us-ascii?Q?dhTNmkds47C3Xh7X/VyOEnA1tDWoUPJcH26F1Y9Sg12jaIulZdWYsDAmml7F?=
 =?us-ascii?Q?voojwBoEHfzGGKoAf7ukYgemNrIdUtvatO5pcIGNJ4X3WGWoTfgCJpLk02Rp?=
 =?us-ascii?Q?5nlfZnvYdsNRDkCwui9ZwugdqluYLFVUoZyZlxOYS3lf627G5YiKFvztyKAM?=
 =?us-ascii?Q?+FB21xVKbe1wSqbkC2gQWJgzOVWxEww3p1BKh+bYGdsP/73Rh/uLdYiY/ylq?=
 =?us-ascii?Q?K4TLdQXDX8g79hgTYCgwcpkPHpdNkAp5or/7nBehKNnJK8UGUhAEkPDpf69U?=
 =?us-ascii?Q?H5iro+FIdIhQ7WNLdVIJJhljutbJSBukpeG6fJAi/VLlg+/RzUrH3iqTNbfs?=
 =?us-ascii?Q?4WQI0vcYf4X19WoO9SlDbzhpMqk7IFoaHfa5BYGdpCy6yE5n769+jFV2mDEy?=
 =?us-ascii?Q?DNEnaljfLTL1wdrVdxORHqmAPGu1iVhlIH2G3Vvtr0JQxuXEZhl6fVjIEE6H?=
 =?us-ascii?Q?HsOANLpasi40eis6tputT9QchO+Zco1rt+p85Q904oOmcDI5Wy5BYBgBAXZQ?=
 =?us-ascii?Q?g+8s1mOElDpus6sFFqDtcWSPlM3L943DQAh8BIRakRsRk7N9qImyMUd2IThE?=
 =?us-ascii?Q?fCYCeFOAz4FnbrUi5gTy1YOsh8VmEtAfKtm2n8jdBvOVJblD7/l0UKBNAwuf?=
 =?us-ascii?Q?KDHstpfEEiUX6Xr2s5X1A+Pj+GL3caFliobh2lRl2wu9eZd1eM6qjd8WWfpl?=
 =?us-ascii?Q?b7KNOdh3niq+j8JdnvYPH5FOwx3CSFRdlsqHzX+JIL815mLMtSOcRPzgWfc3?=
 =?us-ascii?Q?e/7lpeCbH7aqvnWJjh1a0K/m5b7p7YNo8Mok1u2L4qA8RcUHeg10eA0SFy6M?=
 =?us-ascii?Q?YvaTlE7yqFNYF5Yzj/RWi8wZIAiEDIFOeDH6VkuA8H6kTNmGAa4wVoCLXDNJ?=
 =?us-ascii?Q?7Dc625nA92SVBiyIK7uEvJ5Rcp9dtDTcI0YiHipu1nq/O1HaFsEIKDIbLYuY?=
 =?us-ascii?Q?o5tIA/EmT8DvA9KN9SrzAdcCGRTC/lft1bE1F0O0eKEm8sGvsbObPr7WX+u6?=
 =?us-ascii?Q?lWkhEBAwlBJl1K2wbyDwDTk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305b284c-241c-4f34-471d-08dd5605cac6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:03.4666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUodEj49CRQSBot7/BPZBgVowg/yjA0meaOJFsTiqF62urOGB1dy7L4KoXbyGMcuOu5uvJ6oc01s2GAvDtrY19lIFARref2q4mZSqlia+SsXlk0ZBNDxfs/a5Ph5S58f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8770.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index 38376b605201..5685c3bb5555 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -349,10 +349,10 @@ static int wm8770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	component = dai->component;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master = 0x100;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		master = 0;
 		break;
 	default:
-- 
2.43.0

