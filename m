Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093934A06
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 00:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741133578; cv=fail; b=hDDqnzK0vDfMy7cRjjq7YBWJhz1Fd8xNtPCQCLxoI666Da07GkXYxCOnv6TxJpSVDh1kcr5xgBM0oF95FdQjva9rh4MpUHeWa5Uh5217VbYNuiZzxhhoHASjqV4tR1uQw6reHqVK1ZLEwOi5ebCZoU8F7eM3VY8mVAHEseZQovo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741133578; c=relaxed/simple;
	bh=TqoyTDHFnoFUGz5Z3dtvFSOppx8gQ0SVXXTt8GtZm3g=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=mJ6qS/feG81TsZYzSAUf6RPdmcY80x6qd6pzK3b4LSMkdOFckJEJbBen3RQyHENw9xsyLY9NgIRGv6eBH0HNfzbGtb1BDmHrIJV2VUz3mLFNoK6PG8X60U7bSCXDSZP3uCywwq53p6pwm9OZAcQIQPvIqoEce3qBVlUtBZFTx+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AKY/WWmG; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AKY/WWmG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXlHjhwfO4IutLhA7bT/9vcJBmo+P7FF8UTmuCnxRUGN106VswZ3/5lWk4FeDQ31QQKdrAwoe0XlrnxNAxC5qoMJ9V1ifIBUgGgkO9jfgzxdALdSaByCcz33XSyXuJ4KDmIQpNmeyNaPql3rnaQW1x8LyHDz/CtGCNgEziLJl3gw1WHWvJWpQWflGlE8ad1m9PQ+RlL7+KZBFGb0N+COLKZehSl5elakgStNF2PRLKNuLo6X1jwMplMjf0OU6YDNVs9w1xSKCTCAtz/r5FQ5W9b+Wkr5a1zfM6SJoub3aC2PoIKQpN/qZTZ07qUxcTmVAukxh7aIiCVCeVOfRbqXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag6Gp84bQwPxgEHEV1GHsSTFV82GE/YyDUOzS/TA4nc=;
 b=PpPdG8DngpO1ItQ1v25RO3stRg38F7BVPbswX1B5yA/JHBk9laW8EsfaIPpBxoIro+QE0GKa5xcIngYjP3StVtp9UTt2kP6k+3zCmzTnzFArvi5vKd0HC1MLOhGS5R3jJGemjDL/s/ZteL64oDjW8J7/5DnsP+Md9CbDp+MR3/vcxj5t0uiqpns3Y3UZFM7g59U/MB4MsQhXgnKNOMwhczQyTxiV8wAjByUaH9TkDG6ZzdINjSMzUVqNP5AapofsPgJj5dbzDXmwe10zN/XQGYiPTlBMUaqbIbKiQ1QddfpbxQSLWBaBeQexCwCYxDxF4dnK2/Fr7b9BiCZxbdOVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag6Gp84bQwPxgEHEV1GHsSTFV82GE/YyDUOzS/TA4nc=;
 b=AKY/WWmGrOS/X4J6oYNIZqaaJafUXhE0eJAkFc6sJoBnodxdlqDTcX1vXLZZdEOwtpbltwtsc+XXgfmoNYytsR388UABB3tRo3cc5tMggE7vxSYzDcPCeEjM1bbTzlC4oqtuLTf/q652bEVJX0ZRjGF/XSJ3YIujF5yDuefl2bE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10785.jpnprd01.prod.outlook.com
 (2603:1096:400:324::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 00:12:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 00:12:52 +0000
Message-ID: <87v7soz664.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm: merge soc_pcm_hw_update_format/subformat()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Mar 2025 00:12:52 +0000
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10785:EE_
X-MS-Office365-Filtering-Correlation-Id: aae782ed-2bfc-4a99-f044-08dd5b7a788b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H5VXotGOlQjc8toc47peEWHcK+jRW8BGZDUuI6C+JEUuKn8rJrwkQThj3ica?=
 =?us-ascii?Q?jPLOxyP+rD0i+g4/JdgyulkzGVUaPD10xWrI64xc9pbahQf7d3cpD903MmBc?=
 =?us-ascii?Q?1DIRfxR9U1Xf2X9tbI4FyYGbHOMDHvfRKeUCr+ZgiRKhdaXCUuJfdhtTLTCU?=
 =?us-ascii?Q?74IGg9rKAuybLQRrFwEJs6y06b547qWNK8a64X3B1pkVj1b6eozRKTbxU/Pt?=
 =?us-ascii?Q?lkbAupNC9kxRHxIE6dvikQ48G/TewwVK1TbTY08W7yJEb4umzWjR0RB/1nO7?=
 =?us-ascii?Q?I/FBnn7T8zx9dv0tuN/nIAKZrWsWHRkw3wG/4v+rcOZLoTZSwtdOIvKefs/h?=
 =?us-ascii?Q?X4GVkpIj1nOrsjGXYyTo37o8azbK97lwXrxvA8ZCJnDKp+2Ux2rqiD8YuBQz?=
 =?us-ascii?Q?XThjtse01KHzuZpWivircOC6PnfZwfRGDVxcvwwI2FStCeYS4OLgYPPJv1/S?=
 =?us-ascii?Q?Xv+uTSp06ooXO42aDAFPW2S3/EC6zuHEaDWZX5olP9Mp3+BRZPZzopyYTbCT?=
 =?us-ascii?Q?jvzptXDv3Avnfr/fJQzmRJJrl52In5A9ZT4gKfMV0qYTIsDQar+5w23CG9tX?=
 =?us-ascii?Q?ghiD0wfFqQpT6ustKhxz89Ci2qnyaBkdT6RfAkXQJ6rhZlNZroxfBtVRrhPq?=
 =?us-ascii?Q?DxuMLtog5e6XdKI9TOUA6oNRNifAgK10JYeZEtYMcuAzmKPL+ZhObRbIGkfg?=
 =?us-ascii?Q?LciPlRMTJ6NTIx5yJNjurEA33ntoaPnomFEdzwAOuPZwEgTZb+j9lk05vtcz?=
 =?us-ascii?Q?q9GoPkOEnCYuHBADxidWpP1Xsas+olQzJYkpFRFkMhGmsYaQqQlbHTWghAnF?=
 =?us-ascii?Q?aICn38Vu2CloInPuaW1glB0CCguAIBI6veBbOtjNkFXDx7r/X6Yk0BoQCbl3?=
 =?us-ascii?Q?lGtCftsCpU9/hADeTaZmWaIWfOYjIqXalDhYNdXcqcMxEANOj9uDIMXdqXzb?=
 =?us-ascii?Q?aKksZT6931H3nyHdLxB2GCVN9f2HwZZV/5dnFEgtxkRRmlQqJk3sef953qCB?=
 =?us-ascii?Q?VxPW+W7MnGcrYg7CeBO6nuBeT+rFuDFBe+zXzt8SrkJTOE7z3SUiY7Elx+Cf?=
 =?us-ascii?Q?lRbNTrVv1DGvJbRaBQ3N6/9nLm3fUazqi2aJeiMSgcAG4UkwbS6OpwFCH6uZ?=
 =?us-ascii?Q?mUBpuikCM/4DInsVhdKD8d/FschCPujeKoO6wjSg44/MygR/5T2Zho14xnJK?=
 =?us-ascii?Q?jQ6Q03Ri5jAgtnMIY3U8qv5e+M1rCuId8IyFyOmFqYGdB04mpxoolVSxwb06?=
 =?us-ascii?Q?k0J2bvNh/OApQSmnmKueGLChDkrO1FbHGd/wQ2zchLpcUOW/sREwAkOR5ph/?=
 =?us-ascii?Q?5ke5cK8+u09sIr9VPvkP7hPnLCuLHc74SbbJfEjSBE6hcZhKUpXUUOxtcIw1?=
 =?us-ascii?Q?XRi9bTq/82jMTA8TTKKeWgCMuPcEdu4tEhHcvFzL1OIUu/R26wBnwmJqNN8x?=
 =?us-ascii?Q?QkMTdJVOj7dUMteDM/bQy3gMenEiY4KA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XzxX7q/eWkuFctBiGzDoQRAbIJK7mFR0heXyQKLGr7R+HD1ApQsrGfFJMmeP?=
 =?us-ascii?Q?jfes04N2C3PEwz9jFWyV6QAFN28CqJd0yWH8TBzu8JCWOKdFkk2HNmU+9h3g?=
 =?us-ascii?Q?6DDO/096zodnAWKfc5KSKIMkK9Z7iir28ifi0lYUxil4lYX/+eogUaMhjRJr?=
 =?us-ascii?Q?XKc7d948Q8sjB8LVHjggdT+Rf73JySiNJTj+Xnzg9qcncERLD73IvbzS6drJ?=
 =?us-ascii?Q?5EJF1DWetRTtCx3flL60ocpj8brzBd0ELU/SOzxGCe3joBA30gPn4T1c8OLe?=
 =?us-ascii?Q?S2i+oJFw4g0MUSpj2qU5GdrcmWQucezWYnNQTam2a7eonkwwIdJZtY0QaY5Y?=
 =?us-ascii?Q?6Xr7ouugDUqXbawfIrin4JNp0UCAq1OOG292ygiuyVwz3leeaZIFg2z40LJq?=
 =?us-ascii?Q?3vRnBcsvpnmcFSODj+ygu5WL3euVSXD9Gl5QALNb7eSE4eaNyxJ4G19SskFN?=
 =?us-ascii?Q?Uq8Ludm+OMXFAmGu76Rhc2RoRkk0R1otrhO3QJqvwbCgabP3jTtM75U2ek7f?=
 =?us-ascii?Q?bQAiFz+RcFtGpTIaNVG9356TdQPGPh1nYadnV3Ajkbngbig8x3vP8oPCA2vn?=
 =?us-ascii?Q?+6lL0oRYatytKvRoxyjEL26EV/3rRDsE/h50UH4N/jQLSHFrvw6AtTJn7Hth?=
 =?us-ascii?Q?thS5aAmddNGgfgtYsvqE3xIRxu3bnyxpaj5JM27v0422muTv1/XFVNgxAwak?=
 =?us-ascii?Q?MUZ51tfiI5Ier1jfnvDTWWjt7Szk5ilADnPRAg6cnXa0UxSGEGk1E7afuX0y?=
 =?us-ascii?Q?Ip3yu42NV7/WYuue1bd0vI8udHfXirf94+G2Ks5Y+N0n8jBqcQILfGmE9qq/?=
 =?us-ascii?Q?8QB9Nu8IL0UF0UNVGC7G8U875lVQRpUu1X+ixx/2SqoXBH/QzNX4xANQACE3?=
 =?us-ascii?Q?F5q3tdgEJEOQi0AVbRNajRLWQXJSF6B+0kAekoF0wychTna3A3YsbjcrNtvO?=
 =?us-ascii?Q?bxnX+9JSy2KNKwy7bPnciq+E8De4P/dybdDFctsMm8iNcE9Hk/VeBegjaIlb?=
 =?us-ascii?Q?BriGD9vGtsvwcAtHbtVbY4oEW541TGgyHWgTYl4VoGMnyEU2dZlwNFZN3oFK?=
 =?us-ascii?Q?v6x5pVNRni2p5b43lNoZ2YddniF1GjcA2TnvtQKsicEpZdaGHaPODV/6gqiH?=
 =?us-ascii?Q?i23OAifIoOSeufNjKpnMJ47iPNNimfGNCwPx0TRCr4FxM5z14ebZb5kEDEoZ?=
 =?us-ascii?Q?Q7GE764BYghQ3YgmvdLI7fQJMD20/JBzLyicya/fSgbVNxxLPjOB1gx/yEjd?=
 =?us-ascii?Q?NxgOlBKVwEmi9tviYcjicR+dAdV8mOJdM88K5dgJfPeanQWjwT54or9kaIRM?=
 =?us-ascii?Q?EoLjywgpZM3wVwyqeihYb0NnqxYUucpgANS/nleXJo0vo73i3m2LiOhyrDaw?=
 =?us-ascii?Q?ZrmtvXULxeu9hm+NbMO7J+u0/+2GE2/+EQ8R+mJdEygkQGjNzxw8kfmtHN5Q?=
 =?us-ascii?Q?xxtuN73hDOYnkwZemfiXQn2SwjtVIqufTxtnE+MglshfinlbHacXAPFlakJE?=
 =?us-ascii?Q?yjO7hA9loVYrYQw8pS3ymolOk7p8Z9DcqT7hQYkbQAQkXwyobJePfFGt4Mtz?=
 =?us-ascii?Q?BHr+nUAUNNRZfn1lFDhyiMbc/eURFoKYhSkvttulkV0UZ+9+JnIkxfAAqFwk?=
 =?us-ascii?Q?x2ndyjXgMFtMI5Pt2yf7NB4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae782ed-2bfc-4a99-f044-08dd5b7a788b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 00:12:52.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKp2Fs7wezJorCvAeSRfjJ9WrFECZRl/fJaZleuK1XeZVG9Puy9iFr2RVMkHAPycI5nd84ww7W4cAi1H58LoBLyvE7MWNA9PHAZo3MrlabUZ0tafj7+tDVuMc2ROSe0E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10785

format() and subformat() should be handled in the same time, no need to
have each functions. Let's merge these

	soc_pcm_hw_update_format()
	soc_pcm_hw_update_subformat()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/soc-pcm.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2a53a2eb4acd..c2d4becf0c3d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -603,13 +603,8 @@ static void soc_pcm_hw_update_chan(struct snd_pcm_hardware *hw,
 static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
 				     const struct snd_soc_pcm_stream *p)
 {
-	hw->formats &= p->formats;
-}
-
-static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
-					const struct snd_soc_pcm_stream *p)
-{
-	hw->subformats &= p->subformats;
+	hw->formats	&= p->formats;
+	hw->subformats	&= p->subformats;
 }
 
 /**
@@ -650,7 +645,6 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
-		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 	cpu_chan_min = hw->channels_min;
 	cpu_chan_max = hw->channels_max;
@@ -672,7 +666,6 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, codec_stream);
 		soc_pcm_hw_update_rate(hw, codec_stream);
 		soc_pcm_hw_update_format(hw, codec_stream);
-		soc_pcm_hw_update_subformat(hw, codec_stream);
 	}
 
 	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
@@ -1765,7 +1758,6 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
-		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 
 }
@@ -1803,7 +1795,6 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			soc_pcm_hw_update_format(hw, codec_stream);
-			soc_pcm_hw_update_subformat(hw, codec_stream);
 		}
 	}
 }
-- 
2.43.0

