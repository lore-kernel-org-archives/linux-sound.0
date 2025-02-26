Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F2219340E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533812; cv=fail; b=UlfSpLslJ5g0dgi5ScjVTocjT1S1ZGfX5oxWWI1L4vbFBjp62fecLRjQTskqgmcJ/xLtcFWVM0EfwppQbvY2l+1tNZ5DktIw1D8oe4EScnbSzVpV2L8XNs3xS5uSSrTxrxVgNZ85TCxPVD6Eho2yxvag3bCtOuRc1yZK2iGy8w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533812; c=relaxed/simple;
	bh=P4vPH5xt80KzIthhbnukkXE8my6YPgyEWkXSG+e3j64=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GekOCdKbym3y/hWlCB/Li5HJJiehCoRkHlvcaT05XmOK5+9jqFK+uZ4XSWwph9BUqFTyBTpXJ9fnLdA0OpIWQB8P0yGx0IHyLapVV1D4FTGvTGITMVAn49W/ZaLY0dfE2u6vDG2+XmmCHKY+ZuI3bVlE6dENUFPYZxcdxuKoiR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZAG/AyTg; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZAG/AyTg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCtdhDPQx7ylV74QmN4bcSb2HuhR91ulRpjvcku216n/DbSZQ1jdRT51r0guw/u72gfpswNeNreTIGunMxy2fxfIHywRMeLFfqMP/noRYWn22DCouHT+O904sEE9Aobynldz1uYJll3YUiYdjJFYEoB2sv4gRFsbIn1Tu8Dz7Jxa1xCePlgRv3pORJZk6eVBdbwpH0ChmIOUpiT90oxfFYjMOdGNElAsmYmXTsXFX2ckjc6iuQBWqapPmANNnDPdKPYE3R0HWjTve+0rFxhMoQpgXzd5VlYGEQLpGme2mU2+64d7ZSn6dq4gPIAt1iLXRbrozvPIyeZsiFcmQGXB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYQ8eDy2Az3znBerasGJgPuDGh9goZbHw9uqeL+al/8=;
 b=ruvyxnTR8RnvlGBLDkLUo32vItv+sy6vZr0PF+R1QK5s9xKIJEjXz2WXZIn7dZ01kc6Z6dRHYEfkJAek0yOur1fGbgdNdeHmgof/H6oSqRuddz6IDrPnaqT4MK2i+iDQd54YlPVZaWrsBmxp5GpcTCvWlwrrUihlmAAIf/fAAiN5UKBAq6cDBaUBgmmgkzdoAbPcuOuBiIiCX8w5odFB8RENiuRtSZDuGkKPoVjoA4MGab9YnkLcRHtqH/3vp9zASgwGrW0B7bsh+hG7DFKpQJzWhDbQkhL5IPPeSflA7CXmjfi7swA2UYHeIsAuygywK4tim6NFZgpa+qBoMwb54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYQ8eDy2Az3znBerasGJgPuDGh9goZbHw9uqeL+al/8=;
 b=ZAG/AyTgJd423XCeZ1/7KeXIXlma/0gr+NgTx7JmsPnAKF73HSMGHSdaI8g+KlODPkTjn+OFmqiAcuyQONvjkxGpYqJA0/rcG610e2iL08W/kbxTl3YnBTMsvbfruhJoRUSX9mHUb09Xi2MAMdPKnvKxg2mcyHfSKsb7mZDHTAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:48 +0000
Message-ID: <874j0hbi6n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 108/157] ASoC: codec: sgtl5000: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:48 +0000
X-ClientProxiedBy: TYCPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:4::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 75759e82-f3db-4a8c-11e6-08dd56060960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oMiT3GqMNx7wJ7wHp+6pDD4+l5lRcf6b+ub64htRHAtJuhQFsscruBQSOB9H?=
 =?us-ascii?Q?eQOPagVOp92iwQHMlnGDYv6K56MXmnCM0trPINTWx69jHXFQcG6I4L/UkZJ2?=
 =?us-ascii?Q?zil6YpdID+D8+Bok1cIbzgYJN60t3GpfDyLpQgM1GZBHWodd+erd9o8zh3pb?=
 =?us-ascii?Q?xb+7g1dYGKTgs9izoelE1n4QARfgi1x8E8zrj+th59sLXxFnn+mbfaYHlykC?=
 =?us-ascii?Q?fYSNKVB1qyBnTZMbKsn3j8wHHJSpc3egqaV50aXYpChj19p8No2jmic5Gtby?=
 =?us-ascii?Q?JgpGdEwr9wc3sPNIdLNQx+Z4KuSPSG9MjZxjKc+bj4RRTfRrbYxhrak9ls5M?=
 =?us-ascii?Q?5KzTdSUMJwBcOXYUIu7qNhAORVnhxtT7OjsyKcj245mR0Ua69fW3RdgMDlXh?=
 =?us-ascii?Q?GozgUAFCl/8/hPDUXBYOJB62/2aAfwBwFBfqJr7sqTacBNP8InHWKWczR2HM?=
 =?us-ascii?Q?99D6W1T2aQFL0Jd/DkebpxBoHdQMNpJ9uAWa5Ulkhrh5Y35Ty3FEqFk6XhzS?=
 =?us-ascii?Q?m5r0+dncsZDCCkHL5tsXlUB0Z1bSs5LpDETCkRo7R19o9pBh9ZWXvUA4SEsG?=
 =?us-ascii?Q?128GXNtlMiDLDfHTmnXVDmecckDlYXXkV2GcbFCy++UKzWbCInYVMqF7Kmi2?=
 =?us-ascii?Q?2tl6NluA1pWIAAJLKlhG+VK7gCzi6pAgpFx6FcJWS7VW7qt5FDxCSGKdhICe?=
 =?us-ascii?Q?59Ng9vkUz763vScyunwukb/2fnS6swVbpdV4Ohehle1T20heTP9u2ixZrXp+?=
 =?us-ascii?Q?IXqRHaVDMyZTYaWUX7MaMTZfUekvaAvqY17w/eMqK4IS+LJCQwqKkC0vOgp3?=
 =?us-ascii?Q?ZG70AnNLUtI83RefYcnEsvzcA+AbzG1BvebO65p6CxUsVd1eieiUuALoECKl?=
 =?us-ascii?Q?At7OBLVaC2Kf6ir0ULPJuA9rBOuTfLlsmotu+C+eS/9LxDRCze8ZuMTzflBG?=
 =?us-ascii?Q?uHcz/lY9abDPYRRYBokhRsZ943gfMVXny1lypbsCpm+jlEYSMhTLnl65r4J+?=
 =?us-ascii?Q?6evBMxFR7wAZZ7c4FRMnWOs/tFAPetiYjRzU16hibxX//mtTLy9Pek6TRKz1?=
 =?us-ascii?Q?nDqfF/8Jps872KuZeSoWYyvkvuYBosK68MivP24UaTVtLFWVyxFljh2sfDMU?=
 =?us-ascii?Q?n9sn3mi391AJkIvXo6ZWI6BYhVRHOq84+fMakSRJkcPxdBpEcqw+Y4pipwCi?=
 =?us-ascii?Q?Xpp0YTvt+ZRlI1EahTvyH5NVaTXlr9Qo68bG82KVlOovXVQMhl2X0A3Q83xf?=
 =?us-ascii?Q?/b07Ln69K/Fwy3ZVx/q+WHLa14Hcbfipc5y6yu02BJeGNg2niXZ4KlyRi8Xw?=
 =?us-ascii?Q?2mz+2trRIVZiQlzlGA/pBG2WDd2SqU5k5lHD85VIjB6Cib374ARwH2T9zC8a?=
 =?us-ascii?Q?SI8IC2u02c7pOG8r5Typhy6qj0/lS0XEyHJAk4dQfYLbFT7PmnyqRfvVI9v2?=
 =?us-ascii?Q?Mt6SeHW8A/gKL5HsaFt+kWGtzeCojn/M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4/LG+PST4jFyM9h/RMsYRrrmm4hr6F3PY+Y/JwL1URMql8dzVII5fJdlUVhg?=
 =?us-ascii?Q?J5OeEbFaZyE9ohDxs/0LQiI4ZV886PYiD/B3NtgCVRPEODlxOvJGyTAGw74F?=
 =?us-ascii?Q?tKFqjrA9uOcxLMU5utAaJx0xvkhK+qmw20fOulXiXeafP6JqvVOxjLAYDOuo?=
 =?us-ascii?Q?oWAeVtJuApbVebfL+Kkor56YNqW6CpWrg0kcXzH+sZqlA6VgjFVK/S7euzbJ?=
 =?us-ascii?Q?KHjpSYfgYNkIbsX4EPYfTpR94nmqeg6079nlnJZozC91Tm70Zp2jIctxMwmn?=
 =?us-ascii?Q?Jbs25EYP+ftOFwSo5j1LWYo6g1WhJCbvsWNa/vt9JYql0E7f1NJoc6/XB5Cs?=
 =?us-ascii?Q?5VBzANPF8sLmc95E6Jwj5vSqJJYhxqgFJdwKNE5tVTN1LwimsrDYX40rhUnA?=
 =?us-ascii?Q?kt8C42MHuQ5UGPyFJz1DCYpGyLSuf4GOTuhKm3533VuK/al8x2xDHEY6Q0PL?=
 =?us-ascii?Q?9iDcXYq620wBEgwCoW8PZwtp7RfHCumJ4cwOgOWPBsEilPye/RWKq7J3vgjT?=
 =?us-ascii?Q?voRfAOCBCv+1eaXF3lty11ntKvcpa2Nvz+bpaNvNn7sGTWdDMTKtDatb+3In?=
 =?us-ascii?Q?PDG19dURXlCgyVihk7+iTnDa+x692+yHMXqJNbr6WZY/hO1gEcOsqUoCoFLx?=
 =?us-ascii?Q?GCxKMn1NjayFNVBC6M6LAqn4N+bjh7eSs2cNUhrYkw6Iag+6PE5LGIrdzpJp?=
 =?us-ascii?Q?LLI79nRkhoPC9kR0igfhrNTV5ER3Qmn9CSKpCxs7PH6YUekwEPZuiiq6+n2W?=
 =?us-ascii?Q?M+b7q/SuLCJjkrUE2iM3RXLcXgtboIH0JDXJ1WjcdXwVBlXmdyZ1cj2CFIu1?=
 =?us-ascii?Q?nmkanbgl18ecVIXlwQgls1I++wqVXvJMBfLrJP5difu2s90Wm6Qjyb/yfTvU?=
 =?us-ascii?Q?cwtXSpvNOu55l3lJtTUWwYjxK2OGrgRU08kmq5nJs5/9bmbrSL5vv+e6DYjT?=
 =?us-ascii?Q?TwykjCKJIPx6J9S4inE/gdjIbRjPESAhTNbe6To/eNr5yTCZzc60M8CiEZKw?=
 =?us-ascii?Q?/q7gVUtNaFOmVEojv3tuL/l1NzPAwReUWVQgF/zXJA4W2Wl0idTe+GbciAMA?=
 =?us-ascii?Q?ss16bU38+cofduzRB2WFWlBUbmVN7ACZYwf1EwDluQt1Tha+ue2Zb+ttJ8Dx?=
 =?us-ascii?Q?t9cxUKcXmoNMt5hRXbBJYEHrwt4FRSqkyeX60zM71DLSWQHnixX2VBHn2fWx?=
 =?us-ascii?Q?69Nqm8s1PRTT8rAI+U1sY4IbiuKi3bsnSCVUWT0d40Sg69Ef7Dln8XrXBlpk?=
 =?us-ascii?Q?VciqFuvfhCmSxk20w6yBF+1yInWQlxT5ag3mMkVjl6M+Ajt+LVWLI3hS/Dt5?=
 =?us-ascii?Q?FzrT/JHwKtbY6tNj1uIFCm6X4b9Pcy+IXfnz58gn0rb/H3+SR08+dPoIGS5g?=
 =?us-ascii?Q?6p39YF/WfO0kQDzp2zMG9Y1RRKaMunNjanfVdye7nYb1ecEtD/jnkfMdmdx8?=
 =?us-ascii?Q?qnZOPbmua3sIKtyGpWDPNiFA0zUhH9sqQFHgR10Ax39g44mxhhY3bnSf5sRS?=
 =?us-ascii?Q?i22HL7sR5vwsYpW+olxsMBpNm6HGv6F1e+9b3Op3/cQJgasnYazliamka6t8?=
 =?us-ascii?Q?rfwwiyM+0ozMv/j5Npd4B7RHWQ4/6oiVW3Z7ZA+0SACtVhAQK+k5q2HHhKYR?=
 =?us-ascii?Q?Mk+WYYlb2sw1MNWgEOpsVf4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75759e82-f3db-4a8c-11e6-08dd56060960
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:48.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glKtx3xItPac4+cb1Kj3PmOjOGABWDGZtMWwSkNugIPXyhkzFzW8J5U1hA9E0UfSu2Jl3jtMqWFwY3Ip7AIUWWB3sUGXPlYHUjKIoE4iCqwIx05Jn58+vWppI/izworw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sgtl5000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 7aa89e34657e..2cc8efe3d896 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -806,9 +806,9 @@ static int sgtl5000_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	 *  - clock and frame master
 	 */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		i2sctl |= SGTL5000_I2S_MASTER;
 		sgtl5000->master = 1;
 		break;
-- 
2.43.0

