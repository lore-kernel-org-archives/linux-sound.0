Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B219AA56
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533997; cv=fail; b=OWO6cSVolFk7Ep4bz8tOcVVSxEwTq/xjnRI0M0tR+mCIgPxILxM39IikLXMjjw8QWpyia4BjpOMKjPl7kaME/Y2hE4aa1ZTspGtE3KfBsv6Fk9f1p5PZKrFIvAzqMUH6FgY0I19OuzbE0ctrR1xNnRAgrJnJYKePrTUz/7Xq9Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533997; c=relaxed/simple;
	bh=2tv986juFz2M8knLNPLeg7cvhykmZgkiMjercHW1noE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YunGEwW82s+LFo6cLzbWgYBrH0BDy/urCOwtQmCCGSUiYHAl49X95P7GZJUDXAMZ1ibq4/q3WfZ3Gck0O4PBoccUzjRuT2CY3+SDBxtL3v/TiPcEGa1RB0oqGJ/lYO09o0/HLulFxD4MhzA2hdvVYjRO1HM9BP138yDy9SgQido=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DuzKSuP4; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DuzKSuP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFiPBzEi4K+6dqMqo77z+FEE0YF9RSO193bWB7ss4DadX/ciHGpuCNdMSNFkkJ0wYZkkXBWbshcw5tE8hD1SWvPuVnOGglVCuSdpVGbVMvPmNzc94qMMPiBGlHr+Wn/7CgfTsb7Xls/tC2izfQUn/QtMDAZ6UXKPM1LSnsTNvTBLWCOTXawTk3iZGqjfThQF1Y9W0raqwDZ9rDpQZ9TobxR8zebzDBrrHN1reKIJ7yMJluBWNHuOY2k5e/cmsccE8wy3iBdM4sball2G9XcRwF4hz/OoihSN+ipVrNXRxSAC/AWLSdXvdY/Q96KYKHl/I3EdWJyfuHUtMn1bIopQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VYyS6E0qrXqeTOPnnSy50gE3fXL6Wc0iRcxlE9vZso=;
 b=xv6uv72PMEFYlq5pl/lzZ3iUczDE4GEYdCnktnjGvT8eWQyy9QYERM+Wh+oRpTUyCXY1jXOu3cat5X7CG15q5Jak4zmSE9E0gsHz2L1fKWmQsnplENt4UP6SUcVGT6+Sbc+5152MY8aXRXxO1PFCmkemuGwWWQ4YgxGdVcRHF2AMyQCrk5Hq6w4ncZbDm6zmE+T+niBjNbNeDk/cR3yD08KSbL0Jb18pX7VKQ5t0rCKX4SVbQh1u4XPTgb9gJPlHr0r4Adnzk9wf4sr19buanm6qe79QceCmfF9kURjUmcYyKXlFURt1zK4qdhAtRAhGQrsyxQVQdXEWoaLHt2cX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VYyS6E0qrXqeTOPnnSy50gE3fXL6Wc0iRcxlE9vZso=;
 b=DuzKSuP4H3jefqejSmhZJ2AWmi1y4CH2OFw8ty646u6PhHsaV/sD0yNoviDJR5tjwdeQ342Xlm9AxodqrDNcQBQ3B2qr15qOgTTtiFR8ATvsEgwd3pR1W4JdgjHEwRARXn5XGzZuFgDuGE77kRXt1N93va5Xo0Bc22Gg3huPwXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:39:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:54 +0000
Message-ID: <875xkx8owm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 157/157] ASoC: soc-dai: remove SND_SOC_DAIFMT_CB{MS}_CF{MS}
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:54 +0000
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bd021a-00d3-48ec-887d-08dd5606781d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Re108SBGVbDT9UphJ0Ij4asIRAsuyR8RZ+GrAOLtx3vXa1lUiNQ5CC+BxZcQ?=
 =?us-ascii?Q?525aJXw0ZyoKgstib5pq9GPlwjOj464b2WLGPpwdN+xeNZBkoBPj+VVb7w6n?=
 =?us-ascii?Q?B5mcs3cTYyt387cQBw4lf5hSzgTYbiaq4g6TsF/2D+zqxIkNKM2DPmpOcRtX?=
 =?us-ascii?Q?AflFqMeLOcHZ+YcUj2qs21H/klo7eRIyHF8Chi+bQ2UQ6tcTAQKNkaIbpTm6?=
 =?us-ascii?Q?mOuRYts6NednYtchfMUCWRSghdFqMARPfyQwCgUsPNKspFCNcKI1w6eXvvv3?=
 =?us-ascii?Q?SVB6aJshKNfmdo3AYiZ4Yl6mxfqp/k0qwqOLI6jbZXbLa+7crETVxponUESq?=
 =?us-ascii?Q?/zIarH508/jzoMcUoPgNGx+0gm4JtCkfuMckNOf0CPDKXXqlYLEJmQtH5DMS?=
 =?us-ascii?Q?7UTzzb/pq5cH/Fz3B/QsD6O8jMtWRyMafznUp7yJVPXAXz5fj8lJvv05W+Py?=
 =?us-ascii?Q?3y9Z7fNewxYqMOE3i98Vh5rW0YMID+xCTFEnilZ3WN9eo6C+ewXoiuRNAokC?=
 =?us-ascii?Q?jqKSOUi9TNyTT24ULHIz+55kewYWszXWUbfPYfUglF1s7++IE0Q8VpqfsLGH?=
 =?us-ascii?Q?gucQX/Bf5+TN2fjv2XZGAg04a4gsKoxyElpE+t62eztTwHgXwU9Mq1VbiIFC?=
 =?us-ascii?Q?rG1V3bwSCoOi9c2nWocv7peR6cZPnducm9qVAF/f4FfqTd243GWBrcZILBID?=
 =?us-ascii?Q?BSIZyQLE9jBvFV0dMcOqjsq4ebQ+dMbdVqPi5kup/FSmYz16C8fnGy0mh7pr?=
 =?us-ascii?Q?HfTE7GIZYXCPMgB1u/V7J7Dj7vKDYkGuydkryeZ0hTMmNDVhWXNRKQSHK7+G?=
 =?us-ascii?Q?vU2hxjfw4Z0zDy8aiqQNLprk9WJKmKkxu58L3Of1B/yghIxx/I1F2+a3Ps9r?=
 =?us-ascii?Q?56s2yT2zf3bjZX1U4vneUG4z+j4XROwWLcJCMWtJclFB9VhZy/OcCPas0cu8?=
 =?us-ascii?Q?MUQAEKBWrz90U3DqQ7jMtNP6xx+2SdZ7W045hOass0+HcBjZrJ7lYlq6FW+6?=
 =?us-ascii?Q?3R5+1sT5NE7xkULvaSLnywDSXJn1PvccZnjISupltSMsPfmgM0YMrdPDxnzO?=
 =?us-ascii?Q?6ApjzZzLTn56ZOgCd1IgATvjEko2FXRG1PuRZQLs8/1/IQVpZRsnJl2QRnQT?=
 =?us-ascii?Q?D+Zis4Mlxv0pSj6eDfhlR68IUxknF0OZm/KKYpaTKYsSuFarjG/JQ8V2Hbar?=
 =?us-ascii?Q?rBkFv3mYDoX4fn09WrCt3r6k4Cctimb01PH4O6tlrKgn2SbnWJlKMokyZKHF?=
 =?us-ascii?Q?WV7m+4HhPBogelQvSyZiSu9Jj1xSVLdTBMjsZOskS8/PnvMi4/IobWPtRXAY?=
 =?us-ascii?Q?loo32YDBWJHyR6MEI3JA0Gl1so0Wz/WKMRj2JZMlQwAF6SQ2htyBe2HMqVn+?=
 =?us-ascii?Q?z/0eaUpZB12xCOMvCLuYVtXTfZ9pBh7NUE/Gm3dw3Bj7WRjtS5Hp/LT6eaJK?=
 =?us-ascii?Q?WJ3kfJQc0HqqUJVHbqKLNCxCgv8ANztj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mX3+I4NJaQf9z0gipD1XnH4JWulYAiMQuWOZvt2pLlbb3B3VsMhw5Oc3sY4/?=
 =?us-ascii?Q?fxMlgJa8dpr0kdQDN8GoQtesmY6t5oMTb/eICLKbHeVv6XSq/E5hChb0tAdZ?=
 =?us-ascii?Q?rVwPu+mB5LOjg+G8ofisclhhNh17oDo7Fyrnks4M5pZkIE8sZ6J8jIGkdVu/?=
 =?us-ascii?Q?Y1qmkj1dQyIj7Ri0v6jk6f0qgsrfhd56jqyxf8e5QM06vmk6cYIZrSnTWap+?=
 =?us-ascii?Q?9oJQilEg1ibxkZw1A19OyM2dhS8r0bakQThwtJ+8wXYJQb2mES9+kVl9ra/D?=
 =?us-ascii?Q?YPhUu8a9kOsVo0LiedAxsiqfKcvxUeZiLIQB8Zn17/4diYQ6GeYSY8hGiTmk?=
 =?us-ascii?Q?GfaA2UEDtr6VENj8mHtum4Xm5ifcYHkHplM6il0aVO4h9Ht51rHzsI4PZhw5?=
 =?us-ascii?Q?vWWGH9A5EgUf6G2YabhcMXAOED0DK0YGWiyA8gSAtM8XCHAC5DDruj64/S2j?=
 =?us-ascii?Q?WPnOFxFkKtFI/0euecC8Xq1Mj5kc2weADsFlGE+61Dx2c6jEHBlDOmOd290m?=
 =?us-ascii?Q?q/A/cKspnG5rGaRADLNNC8wh0isEPIty50c6WrsS7UAVRAGBOp06vABMH+k/?=
 =?us-ascii?Q?5tYct1IQd9s27/htSXlF2EyvRPoCu3jcrm1gP/HFeDILMaQ4k/CIt9VNw8NJ?=
 =?us-ascii?Q?Dr7Maw5jLTEL+87gO0NtT1wNqRVdDNUnGVm0Pp03uz7MhCUpRn18YBoXOKTh?=
 =?us-ascii?Q?Ak4tKWATbQ88DhkUDhug8LNhlnxp2j/B+nrHACOw41R75nFY8/S3GfZ2KuLf?=
 =?us-ascii?Q?3pLBTLbp7HFfCimoYtQnxEqBS3HQdIxlh83+QiBnNpOY38VT9/WnKR79v6MA?=
 =?us-ascii?Q?ej4eTV7VM/sXOdW2B02VyP2whW1SjjWaDRjwIglvcYRSPZDo6aQpyGhTKlc2?=
 =?us-ascii?Q?FTcMHnR4oP39JDuVKFW7C5RbV3Pt2QLmz4EA1VzGkgFsmB/9VeBY10h1xbZW?=
 =?us-ascii?Q?SGoHSwAp4W1DBH0bpTC0rHVx0OBqYKvtD1AeMqDoZEheVRhIjf7gWRCn1/cK?=
 =?us-ascii?Q?xe5oeqAue9XVqGQ8v/Qe8UYyfNe/L3sumdl6eOH2FFyO6qQ3Rn2lZ3c4Vvgl?=
 =?us-ascii?Q?R5iRY0cqFDKDucjyvjQV5fUEqRD0Pqva/vF8BuLEUcf8IjaslH5t1JV3yK/W?=
 =?us-ascii?Q?8Am6vmHvfRIkS7ZGeHYjFkHV7pTpvPi61Hvs9tviYsdCuuQC0Sk0/tg27zBF?=
 =?us-ascii?Q?azJO+6D4pt3u32B7kRWG07zcvjRaP3ncC7ErCEPYfvw9uu4UDrTMG98O8yiy?=
 =?us-ascii?Q?LfzOj0Ufzokt7HGNTcKxAleWKiVqPxYKlBRhDUp9EapruKj7Pjn++N7Wo6NP?=
 =?us-ascii?Q?uTfobFcX2pKdhz9w5a3ezQZ/moFqQyuZYgTzviaKL4oi5pL8CIxKJMydIdRp?=
 =?us-ascii?Q?9W8GLI6kYOwe+cOSny0okIdCSuT5cn6eGx46M1Q+NwYiR5wJse+TfvGDEpd6?=
 =?us-ascii?Q?UFacMHyODw/ht2wmwIqJwJWHr1xvGod+GkPnuEyBGlDynVe+XLdva+KwCOGD?=
 =?us-ascii?Q?4o3Ziz9g8x8dCWme1OA+bkjGrBHnaQzGQmIy2EuA9gVQwIgcs4uZPUUK9UFC?=
 =?us-ascii?Q?RYf+GRdnMA4wOrzDaf+U1hQUr0BieROXhEIXEFCwi7V9OFdbhXvfbupGsnQd?=
 =?us-ascii?Q?LRLY+THT9tMV+6syzRpWM6k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bd021a-00d3-48ec-887d-08dd5606781d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:54.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvfxSgUTjOaIWPaHMtF5IEyvP0uR5Pnfpkpjfdfeh7/8TqZoq97+YwBWOArVZ2J55SHOeoT4/5VMB7QHRnvQxzQO9riwASfbPrriOB+FnssUZHR0faCvNGcVZNi5IsWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

No drivers are using SND_SOC_DAIFMT_CB{MS}_CF{MS}.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a11501752637..c3a3ba4b0bb7 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -118,12 +118,6 @@ struct snd_compr_stream;
 #define SND_SOC_DAIFMT_CBP_CFC		(3 << 12) /* codec clk provider & frame consumer */
 #define SND_SOC_DAIFMT_CBC_CFC		(4 << 12) /* codec clk consumer & frame consumer */
 
-/* previous definitions kept for backwards-compatibility, do not use in new contributions */
-#define SND_SOC_DAIFMT_CBM_CFM		SND_SOC_DAIFMT_CBP_CFP
-#define SND_SOC_DAIFMT_CBS_CFM		SND_SOC_DAIFMT_CBC_CFP
-#define SND_SOC_DAIFMT_CBM_CFS		SND_SOC_DAIFMT_CBP_CFC
-#define SND_SOC_DAIFMT_CBS_CFS		SND_SOC_DAIFMT_CBC_CFC
-
 /* when passed to set_fmt directly indicate if the device is provider or consumer */
 #define SND_SOC_DAIFMT_BP_FP		SND_SOC_DAIFMT_CBP_CFP
 #define SND_SOC_DAIFMT_BC_FP		SND_SOC_DAIFMT_CBC_CFP
-- 
2.43.0

