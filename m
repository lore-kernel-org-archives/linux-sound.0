Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2932BE658;
	Thu, 12 Feb 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770880883; cv=fail; b=ORi5WGBKawgqkicsiFq4/FmfQ7jTvIIZ9Pwq7W013U1gCSB4AtLL5u0X1yIWDSg90049PGA2t0+4Hgk3caaA/ujjqdT3DjaE/WhVG56N5GFmCGbKrlgXe/9aAp6feZ0gj1rBOm37A5NOeQAn3NUL3zgF+5c0B2TONhHXq/lFOAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770880883; c=relaxed/simple;
	bh=s4U+QEKnfIzrhwI508cSmfalAtDCIfWxzCvJT/3cicA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J1ud+DyW4JWZ76CKBS8iN3li27AOboX5gJBE740gQ0LYYCj12r9/qXY0PuX+HxBtJ8/L/WsThMgBuZeQdW/+oKcdCvaKZ4SpMiN3YbV69vpBKLcqJhqyHby4Qcdz2STCrurJMz08mn38sIf7y1nJOWld7/pOK2v+YLQDo2ttqaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eo2GxjRf; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eo2GxjRf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dw4uSqSqCJ2YkV/niQpSKSzKZzCydkG0U7s9AxgNK7GUyFLxHneyN6vwOviByIAaEZVe2rZAKLuTNodPC9I5s8Otb7R50k2E1x/SWeiz3buHVUKU5Tu7sL1HywwjuGlB4UugRgYuCUYqqoJPuMMBlwSxZU/qEm0MAn+B0JHy09pEjoahkwfMCgMF8o4PO+mbgg/AdTRK2aG6EdTj0s+z0MvD83wOWeXE19fKSl1ibJiOyaMoogAuUFV+M7AKF+E6EqdfzMyNu3dHmVA/GjUynO573bnXfMWMVcOxW27UKu2TyPEe3Mhsf1yiAv/w6P9PdmIwNu7Op4XWiPN80ZjYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cWjVg9xlwIjM81WtN4XML1EZUh12jVvsILTUZjDH/U=;
 b=EHPx95c73kPIzy7D14l5d900+7ylia0iAOnRCLvk6vTkTh5b6r/BChA7wUJc5fSBQ2F/zpESqSI6s2u1HbA0tC0LhxguXQNXaHNI9EiPRizHjeKYlPsh3A3wHxG6uVeWWPsCps/oEBBxuPF5e5u2QHkXOGF8hguE7qnEcWIeUJK5YfFDeLgt5UEGsjejqI6dU4O1AhzC/NbREuveXL5u1RrSM7aDGGf7lqAwpB3TNS5ws71g0RvmMK2uzo9R0E7vk81TpvPPv+xo2TcB9DM0yIouuVgdq3jj9inGVzSZ3CfVX+Y+Ne89MRBCUlAR7jq7Zbeil4KcmF0sZPegp9hk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cWjVg9xlwIjM81WtN4XML1EZUh12jVvsILTUZjDH/U=;
 b=eo2GxjRfYZrgUIS20PzFCgmii7HSZherCZbcRFO7YGARQd1v7aXVh6427d0rBG6fuYs9RU22gJzWvTYyRcliFGnmHECmMHxRCECNH6eYE3CnVS8rjO4p5WaMeQWwTdnkDajHP//LE1bz2lTU7DJIZe6gVhWBglDyRKLGCx7m8nwXMOdHkdvnj5Y7R+ws0XewIyA+6WDP+xDvmkqot9YNJNB4gnW4LzfNPLygm8qHfgBpoi6VYX90ihFllp75tNxvwiN6dZpt+FyiP54Bn6PJR0xJsNvQD5plnHGKZ5R82fNLYJ3dlsoQA51OfSmD687WlObXNxD/bL6TsdIS6PYkIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:21:18 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 07:21:18 +0000
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
Subject: [PATCH v2 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
Date: Thu, 12 Feb 2026 15:22:29 +0800
Message-Id: <20260212072229.3247604-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f952db-a439-4b8c-5dc8-08de6a075071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pTn4YdAYfylEiT6qc2BuZsmNQIiPllmJdcrIEPSuVmb129jNunc35AuIP041?=
 =?us-ascii?Q?fS9U1+R+ObrHsenvAMsULrEjb5+nwawn1cAYxKTYmhbUApKSWBZdDObRq6NA?=
 =?us-ascii?Q?XHS4lGcIsh+YL/TzdNl/CdKwCW1wPptpx9mPa+8WMVE4lK4SjQ9p6+0MrcnE?=
 =?us-ascii?Q?Nep1ycWijaLar/0dZIRWMw4RzbPxBdUiGDy8aj9Aof77UsYcHIpXqzN6nfY+?=
 =?us-ascii?Q?OYFyDooEZeKHjzEIwzUf0yJUWMKu21KNOay+oC/6s+/TCVXcgRLbj6OV2vwN?=
 =?us-ascii?Q?0jms3TDoFBmsy20pE+8EaPJRtywMJgR16FFrmBST+Pm2gZPwwHvQOwz9QdMJ?=
 =?us-ascii?Q?C9WQwkRJYkNOyrdDOa+eu24Q9j+/hsIgO9r9QgZFFV9eZOvRfykdn5k1w8f9?=
 =?us-ascii?Q?p57dFlmcfTGgSKcNsisZcwh+ZWF/0h2O9/aIDz5VTFuH8T14JNce+k+kIrPY?=
 =?us-ascii?Q?RBn9dO1hj2hkqN3FoDk7LselIwrmOzEkEHuXfubqT6YMdq6O23k93/7Tsv/c?=
 =?us-ascii?Q?02qbtsqxNooccpcP0kwxEVBeAoyRdlApai4N321xReKwAaTfCsCmqYy1B7Pz?=
 =?us-ascii?Q?Cfgq79to99YGeXrqJ2WBqozNWUPbULThrN6n7ycOiV1cKcBkCz3uU/Q6bwxS?=
 =?us-ascii?Q?NWmKeCavsdF1Bu+ZkhgdYtxEWcbAvmRsEXS14HbB4Lm0ZoKgQwZ/q7NpiQud?=
 =?us-ascii?Q?dAUoub/lcOAqH2VH7JGDyYP9E5mkgCF1d0HE35vxLc2DPEjTZdKcAeCXYd6V?=
 =?us-ascii?Q?ctUTmN3tdK+57Q8NDR7dOYXvPRuCKrtu2NnPuJvRIhZOeWj2eeanD1YjKgQO?=
 =?us-ascii?Q?o7X/O4wvlpO7fGaSI2PhRU2bF7oy9EU9xH85MiLVBQ77i+MjjSUH6AXLNsdw?=
 =?us-ascii?Q?2f2PXkzPwBD5C5TvDfWgXuFIWR+wf/iGrwI/6wFlioPVdC6NFIINpVU7hVDR?=
 =?us-ascii?Q?FS6kHx/s6L3QU+Um1Dc1bM+elOvQMRKqvDXiXA2gozXf0V8NEc0Y3YRgU9QO?=
 =?us-ascii?Q?+aCYzedzQ7E6GAfRzVxG9c1EbHWCKbx+NZZvJWqnAKm4547+LtST7u2AHz9Z?=
 =?us-ascii?Q?lzw3gm7Xp9YaFGITIfKzdlPYAOIKAPkcfF2igmV2/J0h7kMAY530EuPcE7eb?=
 =?us-ascii?Q?DPjcu9eWyiWFutcmXyQZMQbWfeJKBeTmQZpD+Y8YIw9Trec+dYicz/crL9Xq?=
 =?us-ascii?Q?4GYP0MH6ZKdFQ64f8yXTSDYY8Ui5d6n1V8n9YlS9hTfs6vv7beoDI2/K3N2Q?=
 =?us-ascii?Q?+rEbtODEgomNIw02O5mKpscyeI5C2lyEcc9aDx+33gp/4szfLkhpqReQDf2p?=
 =?us-ascii?Q?9PGTrhnvhB9vS7czurNy13d/WNx3KvbC3DP1D+oABFwizux7GQ5prkiaKtfQ?=
 =?us-ascii?Q?g9CGOVqKl6rVvWn8Q7pWO8FjPA3UzPt6I1mWhUz3UIt94KxESNa1FVYlt/4n?=
 =?us-ascii?Q?Ww/PjOg4l/ApXChEXdY+PGhjBIlY3n9huXGSrMSHrQe1mOQqqK4iacBOzUTv?=
 =?us-ascii?Q?ow1VZpi3pvYLEPVDUA/IiJmalOrEFjwLz1B6xUfuchHh1DN+SF8zOhk2+zo4?=
 =?us-ascii?Q?xfFWJLVbx3Q/ZrXz0JKkn7qTEWYd/khmtWkamiMlfrwyML++AI5voWtNfdSp?=
 =?us-ascii?Q?fu2G7luJ8/Y8lnul8Jbs7eh9lPR9k3/Dx5e4VwevstDA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h37xLLVqRomBaO+qFcbOqmgdbjnz/JkcxNKnwiu0Q4nhpayLSkjiWBMYJuHR?=
 =?us-ascii?Q?deHfrZsqnOY9QRZaSXnbfbcEwvApswd6RnHFmwyDQI9crvpnsp31rSywMfSq?=
 =?us-ascii?Q?tKF500Ig5SgLhWv+oPrRU+iO9PL+V6KeR1LNu0nlzLyMr2iSN7jzx3OBFW5X?=
 =?us-ascii?Q?Kn0x1GnZHLCsA6BNud++s8jP72BzjyYvG6QrpxRRSV11Rbv2BDQF7dkpb8fT?=
 =?us-ascii?Q?D8zrBNFSZs5Pd43VVhM3DLc7m7C1AuDfjpkRj0NKpKpCnRg1g7IUlyjwnHAX?=
 =?us-ascii?Q?KQqX9w7YPTn5GChVPM4OM69wliVdacoQEHqdrtVQZnYyb2VUqbH9VxWOBx2o?=
 =?us-ascii?Q?VukAhW3bRFqlck7KZ+LWqB66zUDaClri9uWVVJ2TLGdhMFxw2LsIdB0gIUY6?=
 =?us-ascii?Q?F93jL0jUtUZHkMm7pgPm0dFpgoe39HpGh80dXtJr3C8SpSBfYq5bIXu2Xzrn?=
 =?us-ascii?Q?YlRDzSU++9rXUnFYsld44muj805K+b2AQ271qyNoPwymEihG/J2A6OWYP03k?=
 =?us-ascii?Q?19bTBAz8BdVAiM+d2PVeVdmI4vHZO3kfrDSCsf6LaWHXXFceswpjw7OKBa/f?=
 =?us-ascii?Q?7y1Z+ZT29Zl3D4H2l9MEgoov4LxgMJ/8ZsSCU4rXT+aHtS22gDVTRxJSeUfJ?=
 =?us-ascii?Q?/tz2K+HcwfCXVbwLPFdKMsP+0z721aI3HsCD/py/UWkM29bCzosuL5avxUZN?=
 =?us-ascii?Q?ZOOY4szlE8uNVlf4m/cb66Em6V/Cqk1KvDbRTt+xqBAZBuM4G0qtZWZA6q6+?=
 =?us-ascii?Q?NFLhg6S0LazKZQEg8tsGbkxrSVd4lqn5nxWSrPaoIzM6Q8iuq5OnuI5Lnp2w?=
 =?us-ascii?Q?M4dEsgoDxShUl4YmbPvXUQQDnLCof8TU2NbmBHwah/A1nSnyw+haVhP56ViH?=
 =?us-ascii?Q?PkPZirCFDbVyvVSmG6diw1JUvGmWUrdiwQ1gW1W4EYi71jnRwxeO+JTL2mc4?=
 =?us-ascii?Q?K3JRVrIKA26Lx0mfQ99ZpvJuG3tMWV3eNO4kgqwh6lyrFpDMOrtscGm+81zT?=
 =?us-ascii?Q?24UnUvkleEwG0Hc1nR24delTcRXlxfe34H+4xh3T8GQN/mNnDZzaSS2JAnYn?=
 =?us-ascii?Q?sgyc3FDnVoFv8/dGXlVOhvKyAIwBj2XEdhg+pH6Iy569Frpg9hdkXAwipKPA?=
 =?us-ascii?Q?UzqxWg1InGmjv8oxbA2XIajtfKODfgaEjk4ERd+rQiPR2VfsL+mZ20u/WqUE?=
 =?us-ascii?Q?PRoVXAVDo9D9ACJfj7Kvr09B8RvokVIUDmd/So2xnoeudPKsTYQUC6Bk4Vsm?=
 =?us-ascii?Q?T7qwHNBpbbecFKJinelkPwR39HXSjE8J83jezcAC3DhxDrbiBV8c1RrGInvZ?=
 =?us-ascii?Q?vpgfpPfI0P4mtcYQvEcIBa2aDMbSIvg3wPP/l+XaMYBT3FP8xC/IUAOrP4rN?=
 =?us-ascii?Q?hn3RzDpxhlsM6q7aIeETaAnSt2AFHAKvw4bYLgtpNOXtwIeUCphm3tjxqLC1?=
 =?us-ascii?Q?zJO+VpMbjGx8QUzLv1sb0d02dvJgdFlroXVvXOncFRBAPb1E+sqe9rAXwkYE?=
 =?us-ascii?Q?oGw9GLfbDZotGG9CgyyQayGTfcv0ZvRpUpVBCFKgDNxg3kRTGHotkDH5p+AC?=
 =?us-ascii?Q?dR03Q3ndlMRzFWUQZfggJUSKDcdQxt0aZLX+QSYx1uxQhMq5NBUQmSdgT8BM?=
 =?us-ascii?Q?playcXW2rUzM6T2tnpleVP7BcPwjvMfnWed1Y4vlC8tUyYanWpSgglOZa00C?=
 =?us-ascii?Q?/lHj7I5Z5IXE60zXOgIA4vI+VKIo/EBwxgKmOjGxcdYGI+U0vn8DG3r6waKR?=
 =?us-ascii?Q?8k+RtWkmuw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f952db-a439-4b8c-5dc8-08de6a075071
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:21:18.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7Wv2rSExWMgFPLPiJGXuANG1zQQU6CkVPK6NK19PuGRDJTFjwlAbdBdFuvw3Q/2QdIY/XDNmM02JTPEdKUPvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

As there are three regmap handlers defined in this driver, explicitly
call the snd_soc_component_init_regmap() to init regmap handler for the
component.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 56 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 18 +++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..0196c95a7e9a 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -62,6 +62,50 @@ struct fsl_xcvr {
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_xcvr_timestamp_ctrls[] = {
+	SOC_SINGLE("Transmit Timestamp Control Switch", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0),
+	SOC_ENUM("Transmit Timestamp Increment", transmit_tstmp_enum),
+	SOC_SINGLE("Transmit Timestamp Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0),
+	SOC_SINGLE("Transmit Bit Counter Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0),
+	SOC_SINGLE_XR_SX("Transmit Timestamp Counter", FSL_XCVR_TX_DPTH_TSCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Counter", FSL_XCVR_TX_DPTH_BCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Count Timestamp", FSL_XCVR_TX_DPTH_BCTR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Latched Timestamp Counter", FSL_XCVR_TX_DPTH_BCRR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE("Receive Timestamp Control Switch", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0),
+	SOC_ENUM("Receive Timestamp Increment", receive_tstmp_enum),
+	SOC_SINGLE("Receive Timestamp Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0),
+	SOC_SINGLE("Receive Bit Counter Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0),
+	SOC_SINGLE_XR_SX("Receive Timestamp Counter", FSL_XCVR_RX_DPTH_TSCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Counter", FSL_XCVR_RX_DPTH_BCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Count Timestamp", FSL_XCVR_RX_DPTH_BCTR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Latched Timestamp Counter", FSL_XCVR_RX_DPTH_BCRR,
+			 1, 32, 0, 0xffffffff, 0),
+};
+
 static const struct fsl_xcvr_pll_conf {
 	u8 mfi;   /* min=0x18, max=0x38 */
 	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
@@ -1070,8 +1114,20 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
 	},
 };
 
+static int fsl_xcvr_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_xcvr *xcvr = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, xcvr->regmap);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver fsl_xcvr_comp = {
 	.name			= "fsl-xcvr-dai",
+	.probe			= fsl_xcvr_component_probe,
+	.controls		= fsl_xcvr_timestamp_ctrls,
+	.num_controls		= ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index dade3945cc0c..0cc7945b1d9f 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -233,6 +233,24 @@
 #define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
 #define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
-- 
2.34.1

