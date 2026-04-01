Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43943D9DA0;
	Wed,  1 Apr 2026 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036506; cv=fail; b=oQmy2kojPglfGiz5p7Uj0+Wa5/nkpsf406QFUznbKIhcpwuk17wRXigMl/UCCzunB04NuFWZYdzznrB10WXumC9l03n/SrWjG8ZTfmGqf1GNT7YqjlXMGi6tjC0tNtfSe34+Uv2v1RuBsUWeyNmdAsU+UklMRte9uWbIWlP1x8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036506; c=relaxed/simple;
	bh=72BKGs8TzH7Tv6r+rEjW4XSfQ3tWbwVnDZlIzhmbrRA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WBN5KxPfKUsMmjnFcumEdwkzCAQk8ULMbd9z0hYkVK8OuF6cZqrC4ixd3T3t4awLaw5rHhf0U6QSRUs97ZMEvr6homaUsJ5g453YEhDaE1OpUgencyX9wJORzncL/6vVATsK4U4pLRFiY9Yer9mlOT2714W51wGc7/1YKUyiQxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Nf/aUkCJ; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nf/aUkCJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH4aaLX4ZoPPWOfMzy8rl507RHf8gt0zMHaSaMgmgu2H7M8cuu3CHnKkK0ZzKYMfYT7Y54pByxl7rgUEThDYGfw1ngTTP9sW8kz+u8Ook/FDNjcwoDFdzqCamd1dtFpAMsSMteTG+Y02gD129WMg3HbToPeEQSt2lzo2DbIviUqRGqaSZdPf4j9jEJnT/GSbrzoJiNGWu38xsFOqz7ML8VLJuS37RlCRd47aFZylfAKae8thuAIXV3lMriDqZ6gxGwDmTx5CBmY/cIyhO9OhuYftdR7L7LItYNOreQyVf5OTKxV32MQg+uYXujIrlyqmvSyjNL5BK1/Umw8Ox9h6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W8Z6I5k4qC1og9LoTkBGolQOg+dtplXEcqMJbQxjaw=;
 b=NDq9Ul9/yBkh+LyQCn8J1ib09WGDXNzuawSWRoduxrJI9FMDZTm/9Smk0tnBuat3fg/2UwRA8dD1CS54oMYTsjS3kcRk2S/slwx5SIlu9ji+rhJc13E7c/d/XHdHCzjLaScUaSaLKH3+RnkL++l2Yh9uBbTdv3nH8YEFQ4WY+qT1S70stjqCHFJQPzSW4jlutR3mJaowMPlb3Db61Vnwg1X5ymlShXYzH/FDN330yxLWDosB6b2wuispgYg+vONvQzbnCCLYii6RTamXzLhJVS/dwiL1ZbwicrVCygJrzAhSJ5DA5tX8Jkf8MkeC60SywfJB4IHuzQHznZ2nKfCUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1W8Z6I5k4qC1og9LoTkBGolQOg+dtplXEcqMJbQxjaw=;
 b=Nf/aUkCJK2Bw/n4Wst2RfRapMh050n5gYUw+DLwz5Gm8VITUuSEd1eIgX5D6rqXeHBToSWBrqK5q7eN/ykGSXZcy5vx54VwbBr4604OOlmyVl7YiNCHC87T7vKyhAg/0pilOqp3iheoGtuGBJiKlqdCsCOo7h6jZnNilrCRE0YVj180kXgqCCj6bu7nisqBfWmGaRYPYQp1KTAZPw3Fqvxy+wOx2C95thAKcfHwAlK3I5SlxbKPJKcM0fh6N26ZBuSUHfCm0qHKQleSIxJMcfU1j5RhbV5LFOVgI33YIj0oK1t+vQ89kmX0L9T1Ji0ElgZoabpoy3VoE9PAsn7/l5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AMDPR04MB11607.eurprd04.prod.outlook.com (2603:10a6:20b:71e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 09:41:42 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 09:41:42 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] ASoC: fsl_easrc: Fix value type in fsl_easrc_iec958_get_bits()
Date: Wed,  1 Apr 2026 17:42:25 +0800
Message-Id: <20260401094226.2900532-11-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260401094226.2900532-1-shengjiu.wang@nxp.com>
References: <20260401094226.2900532-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AMDPR04MB11607:EE_
X-MS-Office365-Filtering-Correlation-Id: 6961ea43-751e-47e5-f015-08de8fd2e189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|7416014|376014|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	11LHnqmNLnwO53z9Q+pj0Gk73gXJa/Nk9HnHsAr2mjr6p+pd6197eIGg7oUIEvqX0jG7Gpd9Lm/K5GoqmPrwBBL7t3wyioXYH8nCrPocHUtQ3hDUg0aoJt2fJoCiDo7fEUVcsat+xn1a6w8rUwlIu1AC/AD0yCadYOCkwwJ8c81gTnARToiJeuh95i6OQaDoEOYwTQKF11kyIjCpxgYhCHhtGxdsgmvB7CTB180FIEvDYaa4lKw8xH8t/ZFtH2kWfru3D1IVhz6TbG/tyhlWJbqqiZoDS5VjYLcbdVgDKvIeoLE4xEfHa4d0axsLFL4xOjD7pK7FAysxUtRXQmvssdI1y6tfAjR4VD/1fj2cS5CFW4Zo06KE25v3e2XiVPTXOJUpN6N81shVTZfnLnFraUsYdB+vBUcNnlDalKs3CurldeqUl5eDPM+ZtEuFgkkMnF9ufQhomeXwUbuq6cuWlL5dfhzcvvDbN95wB/keU8kyrDGJGO4jozkehABlahSVferZkXGAbKZY6QPJ47FSQtmd1kwLxs1jlYcZc3vRJzcrHv4sNmpz1YAwvxo7dFGkv/wAR5o3mQpo69IwI437Y7yd/oD7zQQnXUCECCKgKCirgI9JB1Lfcsx4fIOTfYlPQBhnGE7uOKxBreqNdm9mJ7AY8BziZrf08NWFtn0+zttPxxyTi1x6F3kxDFG+vvPG6zfXbPimclHFODHslIHygZaLLxDEt0iDxBt+n//PenNih+E0yLvIjnssza6+xTmO85PFNCvr2kEOij+ra/L+qDSGOV0jIcgovnTz43H9WEvj7rhD2njAVtA/Qg/vsXmI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WnLoOt7HMnAOMkd3D1c2N929LcNvhgBIvs7mTLmayqYjOTPvxdGvbwR8tFtS?=
 =?us-ascii?Q?Rm/SjVBi4ciYxTgH6WS7L9PDIlAaUXRUlK8ZlgIeo+4uVryc4YbBsp/eyfqa?=
 =?us-ascii?Q?rnr/ewai9tBEunI8PwaKv/NyiGkpsCzRoDlYUDp/zPO4H5I1ECLTnuk04GuS?=
 =?us-ascii?Q?CBWy1r2TfWPIj0wxWHeXLzC8TmXFre6mBPknwUNZtPAIbGmvOm+83/VtqoPp?=
 =?us-ascii?Q?feNdueDkhH4svg+m5jnQ/4y6/QZSl8R+3ukSD3LcTqSEYrrWhT6SxxQRIala?=
 =?us-ascii?Q?vLS4IgGDDu3Z2Pzg/XBs+V+q+G67+NCLbF87mpwUh6wlhPbiQGfFpG7nSlJn?=
 =?us-ascii?Q?/YAUqpM5xqbihJ/c+XZt4olZI7ggf6/7irMeqwg9ZkiDt39Pllq7I0J+gkTN?=
 =?us-ascii?Q?1ZFTM8Cd3ZrzYQxnZEL3Om1s/3+/mB6oMzQHuPVcJlzKLR/RFM0eOw0c74FM?=
 =?us-ascii?Q?aCdFqCQ+gRbMNCglL7e32wHBtRqaaQdB0p5NBiJP1ZGgw7dhjB4/XzQD2j8/?=
 =?us-ascii?Q?qaZnGHTgipyQJCBW21Wre66Gs+BJOswRnBRW7ujJFj4b2ORp3kuteaIV+W5K?=
 =?us-ascii?Q?8xiQD9kHbYbD1ziIiLjmvb4Rt3xr03w+E799viUur7LDKwj3hlr0OJkVxkDQ?=
 =?us-ascii?Q?lXSRhsWwlNGT7UrC3R5T8lsEhAbZV0wKNHdPWDRN1baLn3q9smN3UYwOj+Dl?=
 =?us-ascii?Q?KPz1xZGCaoQOse9b2pzALGxl30rE0VXmDH2giwvCq7jahR8+KgtpNUTp+aLa?=
 =?us-ascii?Q?EUds8skvf8U+YJfWqL6rTGFtxUfYWjD2jWaJaW8lCvh80Q4YqLmZXAIajSmI?=
 =?us-ascii?Q?9sMALPxOFSnFte9OLtXRct26lhFHvadpToMqBV06E0OxULYeGQDvpaiBR2UE?=
 =?us-ascii?Q?wADWrh2BwVevasKuinv8IzScCqERyze0RXcS8b+RZNeF10241cx+Bj11EAaP?=
 =?us-ascii?Q?S3LxOxf7lWE/0/Q52IV57a0WYSin7mZ4Qcw8XPbmcbFbD6fXvwmNRBEsCZYG?=
 =?us-ascii?Q?ZE6PVuGGMR0tEyMp7b0xZ/YBslja944kBReZtz1398jm0HB8J9j1z75CB1Yx?=
 =?us-ascii?Q?PpbeNiknBgOmmhzT5VzbFD/ebokkM0atdeq3HKXkzzpDFI0m5E4ny/NmYbek?=
 =?us-ascii?Q?4f12psQYbi06SeVWOAsk1hSL3jOK+evNE5EZqjMkQetrd6NNvN8Zd67yHELy?=
 =?us-ascii?Q?ZygVarvJ0RkEi69IHmUR6zmSq26QQHmajN7/sy3T+Hhoy1Vd7CWmRadZq6Qk?=
 =?us-ascii?Q?9AGqvrkHvvt9+oG748ZyJPgCyGp7zESBQ9Emnc4e1f1eFnFRKi6qJUt6H+BR?=
 =?us-ascii?Q?WTw2F1YxTpnbWIBo8W64UU2IaHGvGYoyZbEXCIXOAMP5Vg1tQ40FbjozkYU9?=
 =?us-ascii?Q?sXolUX24Txvyuv9GoWmUauA1lqeMoBSQTyTSx/hAOd2S4qNK2o32daKSwYiW?=
 =?us-ascii?Q?3qZOcvdrXjGVnRGci2ZuCz7GnA9ep44FQ+DGtJYaRxIQNZ7oA6Pr2D4tYbfc?=
 =?us-ascii?Q?JI8yeR+BhlFfOaDE/hXE1t6PO2aFfZesdlp3VG4+F+neB/WBf/pXHHoxdi94?=
 =?us-ascii?Q?C7LbsJChkRMlRTVWjwSd7eoS7dtFyV2EKpx1QIeZVEpKl/lJajFqzDsng5Da?=
 =?us-ascii?Q?3pPY91UvxrsrHcqVb+I0tQMngUzGeSlOLxw7JbI3zHwGGoUaR+tVOK7Mq7kW?=
 =?us-ascii?Q?EMLGBW4V2ZloAOBvseCSco26OwGiBluFYjIGx+SZ1Fwf5q6HJOuv/ws/BsI/?=
 =?us-ascii?Q?nkV42SBFMw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6961ea43-751e-47e5-f015-08de8fd2e189
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:41:42.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMw6kmyCrKl9A6Ed4MqlLKn8zzzZGD6wz6jHsiBvf7fwyvEqZVGr0dZI7YAh+0GiGXHjjabfxYT2nlsi15ejVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11607

The value type of controls "Context 0 IEC958 Bits Per Sample" should be
integer, not enumerated, the issue is found by the mixer-test.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f48e43a0edcf..3086cb758beb 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -73,7 +73,7 @@ static int fsl_easrc_iec958_get_bits(struct snd_kcontrol *kcontrol,
 	struct soc_mreg_control *mc =
 		(struct soc_mreg_control *)kcontrol->private_value;
 
-	ucontrol->value.enumerated.item[0] = easrc_priv->bps_iec958[mc->regbase];
+	ucontrol->value.integer.value[0] = easrc_priv->bps_iec958[mc->regbase];
 
 	return 0;
 }
-- 
2.34.1

