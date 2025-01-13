Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE6234995;
	Mon, 13 Jan 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759094; cv=fail; b=sbJKP1yqwSNLzy5OhDG/kY4qmpefYrKeJsJhF5zzT+pXh9AghwUIMvlU1Oy8FOkrstR+NRkHZLR4nWrEk2H7EqVh6KdUxwU7CAf5QjcQzHsyEC5FohP70gETTvsLvCHUj/02dOTIdX5MIuugftoKw1+EG6JzDPU604ZTwiMS8PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759094; c=relaxed/simple;
	bh=YOeJwP85033gBWk/jInVZHxFm++8AaYbfNNCvTAHaGA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lkpq8y+6Snt0466W+qEvSe6H35YtczYUtbyyAZDURn2GObyQuMypbN7ZP6LwanxlhC3uWXTSGjoQRgEGC+noEeyBdnbTEAm/TPE2pnpJaes8nWIljUiovGWLg4sjogxTQQ4Ky6Jcd3qvNJraS4sL8pE8iJP3VX9QdnoFXWlX+qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SC/hXfaC; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SC/hXfaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqK12M+4omUSFfmCfVBh/hOIkfFriM4LdUW3ATsh9Lf1UumQLUpe3SBpJqq9sGOtVRPQZrdSlbxQ+SmokCg34mD7LSSWgFuruzjaE8Nx7h4J1Pw0b7JI/1fcRd/ozuHuYzxq8UsueSjq0T9Me0IFcGWTUv/BrGLBWsfnBExOw7wcVlpO2y0ZWbhsvw73/OKKD/Agt0wXlOcCkExxwthFzyJuWoCdsNXe7tYEOaXZLuPwZO+zJ+2LjplzpOiRH4d5gLWzVNStqFz5wX9H1VTzVJa0cKSk6yjw0k5lGx9Iy6yyM62+ZiOWVRtIsrsj9WDL34q91PIal9ObPXy9QNKxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEtWM1Cg0IR+sfMW481GrdMby0bSCxDNZdqnVDHHncA=;
 b=glKfRGpJMZcM4kUlScL5rewk9e+dhI6ahienYhf/lxtRA+d+uRVE+1rLQ2nj3A4zMdI4usDRfNnswXRmoOplXMGWpXVMOtI2steLS3PjKP1QU+uxNLMv0YIY32PiGcBPmz1GacGJiQzAziiuwMjR7hTsyOGfEnHzjOkHAJvz9MUTpiKuqCt4mnaBBnJ3pHXLmRwWhu1bEPJfETgi7Tqz7u4/IiJOCNUrAUh9nCM8KXG4I7T6Z2hUzQLbq+Ku8DeSbvxNTN7K+rcztPCGDjvy0JfgfxUGr3rD1nOLZCVyPBQdKMgQiPA4eb4oybPh7TTVzXrj9IJNZ5kikA+l3BvSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEtWM1Cg0IR+sfMW481GrdMby0bSCxDNZdqnVDHHncA=;
 b=SC/hXfaCf8EHseL5fi0ZXR9oijgOpJH/E5dMLiHDTAxHC5PGCB2EwgpJwygcQL1dH3wN02ShA1AjuVJgmzussRfhAo3g5klVCPDFCwHge67BGVw5wLMNHT/AKSlXZA8cRbb0ZIaFhuehxCEgL16ws8awKDXeMB+QsQsx37i6wqGF5GfPG5WSP0w8TX6RTiBXjD/kxQp4S6rW2DW+H7BwqiLVkwpJWOXQEPO5Sw82RX1FGk+JMu2tthnoGyDtqo1sqKr4oMTdbzsnCz0OJQ5PXe9Yylt7z03d7BdUu0SNsjPomP5NnhExsK6gg+tyNbvdnlH/K6X2EC5P+ID5cnj1Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:04:50 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:04:50 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_mqs: Add i.MX943 platform support
Date: Mon, 13 Jan 2025 17:03:20 +0800
Message-Id: <20250113090321.3193464-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
References: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: a338db9d-fa11-4d64-0ac6-08dd33b155f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l9gUGPGuBE3k3YC8O3VIG+knEf9PFmCwpKZ2QwGKwkD878C7OBKsE5MDKal6?=
 =?us-ascii?Q?7+/v+cNdHffqB+pkQmBCrinE8sh51g8Sdr87IDQMxNkMJ3LuuGNrSuJ6NB0s?=
 =?us-ascii?Q?P+mFQCb5m0uW0Z6hDEH3kB1lO7nib5egKi1GLe4dHD/Rmgz69Jd/ygF0zJ2w?=
 =?us-ascii?Q?j2LvuEv+IQTeVl2OgZ0ygWdkKDwoYo++musJO+clKTq+BdMsnt5jqiw163NH?=
 =?us-ascii?Q?UBiI0WrZeEzFrglsncDnB4PSWwm9mxO6wDzDEHPys1UD06TSUnuxsjc+t7G+?=
 =?us-ascii?Q?e/tfHniUd3JmZc12Pp51YX1QI0HeORZ/ELV2Sa/PGxoRF6uNZap2/FEznxDn?=
 =?us-ascii?Q?S9oYwE1OomkOuWmHcg0Glq/W81w47Uyfku/DMw3T+i3Rgg+sY8qDWNi1HpNL?=
 =?us-ascii?Q?QDPPgbSHtnQ5ipyDeSNyQ8k9Mtxj0pfsGouEs2EvEYV9ZDPRKFWU7W0mrG65?=
 =?us-ascii?Q?Xs1nKnzi51bsv18GdvnGHzunm4Wf0Yg3MUT6ZqyWd/U9qBoA5dkNuXBmTghl?=
 =?us-ascii?Q?TrIJSZGAoXSYr5JzYof9fzges/Lnooa+17SHCWGWtlgpwACZVvYVZb4uT5o0?=
 =?us-ascii?Q?i9UG2WswlXOZ8ARRmtUUQ0Pd6u9HEYxu6wKOCHaPa7m+ZLft0YuVlNuqkG1+?=
 =?us-ascii?Q?W6OItAgnsdixu7lYzXkBt2WdKbgpZZYxV+diWDcwLsG6O1VrNSzoFYx8iU05?=
 =?us-ascii?Q?gctOpbyjY7k8IG9YtYR6AQSfBHYDsHUMdqY9PlhNbTdLLKorUnkr6CTzAUGY?=
 =?us-ascii?Q?LlJPkdL2EOD9OyJ86Ai5S25Ys59u706ZcrCstSGT4OE9SuL2D6Xgxrof/Q1U?=
 =?us-ascii?Q?SvzeNvwzraZ8FI2/8vV/gT36sMvCdONSuem7QTIOaO83JQof80X3clmN6f18?=
 =?us-ascii?Q?0CDfeXDMztdtAK61iwBycn92JyJ+KuObkicibzQuDoo3elUOH4se58SJ05ua?=
 =?us-ascii?Q?c2INVPPMz/vb1Aqur7srU7Pr5Pgxu3WMXP/5S3YOFl6dNx73M0reb0ZCGJbM?=
 =?us-ascii?Q?xdB+H+intcAgGr1kMpDTYpfUE2dCgxlTin23lsYHuLdk+lPgFWCmJK/eRZTf?=
 =?us-ascii?Q?cwX+QH2dzfDZgKS7JtIldKf7XVQPCkk6RMLikY6xdY4wfme/uumngMzL5IDu?=
 =?us-ascii?Q?6doFOwToPC4rw/87uCqiogcB9A8RUXid6ZvrK5F6MF6gWOw5u4UvLQCxo9B+?=
 =?us-ascii?Q?DD6GrewLp6Ozffj0E99tJYAse2YhM9qmelE+tJrKceZz26aGSc5Jj9PG24E7?=
 =?us-ascii?Q?r74gXwvUpZ5KqjRCOMHKPOT3VBXA8krsRmPUWqUQLrYROT7ThcVp3yzcvDmb?=
 =?us-ascii?Q?LVx9mRoAESMpVkc+SgFPgNsXfqASrQhzQR4vqmvpGfpkY9yEMfJGXAjpb83k?=
 =?us-ascii?Q?asr8dZIRJVOTcd79RgoQ6+T3CQqrab++rgVqiKXzzpt4p9/PmiK1JJJKFrlC?=
 =?us-ascii?Q?6eyGL3A/O+NzHOoURyYn+3IGqfW0hgLb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sGTBdafH7HgCMJKFF25UdlQdQp9MOk+cHtDmzjSxQWkQxU/wi9darmMbXs6p?=
 =?us-ascii?Q?TWPxPgQN4zpuw6OODxVbjnNM8Hfk9SSIpch+qYSWJ1vCjNYOWsSQoie+yLdL?=
 =?us-ascii?Q?9n1qp91C9hB9XRoqeWk0v5Ku342jzWQ96FMv4Rze4RzQjCEy19CxA2czb7ke?=
 =?us-ascii?Q?V9hHkhjHCYKYibI9fGDlYjw0hTmbF3a2Z+1ApWZbaI1I/4sAIE/piGBQN3fv?=
 =?us-ascii?Q?Ca/SZoWowlotbQM/szVkDN4xU5mFKH+sPJg5sXfOB4cERdFOIwoBqYBsKS0H?=
 =?us-ascii?Q?J+aI3jaTiDXEzgAagZ4Dt3XxzSAJ/lVDlyYEc+SMkJdBWdufH9GnSw3flOZb?=
 =?us-ascii?Q?8oxBmzQxrotQNqPGbI1+HH/7I9IRR4n1nuX3LyFWPYS6jmLf3Yb1+BiyRYGE?=
 =?us-ascii?Q?sdSfFOgxmHw1/up5aydXvTH55uRzrBDInULL/S0fj1P4vLLywGWaDUtkv/if?=
 =?us-ascii?Q?aShQ5KYDT8q4lciJMrNVy69K14dpVX4ER9SK/9b1Ns24dCZ0tF5+ARnBAxth?=
 =?us-ascii?Q?sntx9XZLQnKwccOHmVOrDHnSkbAD9J2BHlbkqSfTywpU9/tg7ajtLGh80ivQ?=
 =?us-ascii?Q?FaZUiJRFMKRtvEFW4RtGgj0IpwECldgOZJUBQ8AoOotYQsic/bJSttA5tqax?=
 =?us-ascii?Q?xnbdLKMd5TRpQanhkgOVPI0Nq4pNa+pB61xarFA+lh4ZMyfRTrSz2jVBH81l?=
 =?us-ascii?Q?HdNcpTmTH5t5jcdBE3AZw35T0KTjYRvtJkXEKWwkMPKSajiQPaqYyy6igucD?=
 =?us-ascii?Q?+UKgSqCUO08SOCdiKyn9T9haxGJ4AwleDQlw1areQM9iWjG9cf2U26Exe58w?=
 =?us-ascii?Q?laRg8mPpTHBmi5ABL7UEBDxQJRj1DfaDppHYSNp+C7EjwyDvRD78wJF/CtP0?=
 =?us-ascii?Q?+lpZ+/ETpuV6UP1ABm4z+I0jlqiJVi8Qg7g0o3iuqTyTL5qWROn4gbHCPbPm?=
 =?us-ascii?Q?jPsFuWUFKcfZFYfTFjoVEoqReI83/Uo4ADRSn/XhgEn9NQAhTRERNPAOYzbP?=
 =?us-ascii?Q?quYXXsiS2V02HC7knkbnIX1J6+PhWAW+6Cc3+tyD6WCueWX5y9uer3EQk5O2?=
 =?us-ascii?Q?BOst0WDzZwWv1Ow/kv4aPDI4P+mZXqsXiSKFKtqTy34ut66iCer8CJnkGs5w?=
 =?us-ascii?Q?k6BELFTv3G6O7qgl0rMcthQqYbQHBqPQJHGa9tj4dap6KL4yGcb/pIsQzbAG?=
 =?us-ascii?Q?8X0n7EniTWCJNJD5L4f7yMENz7lShC07v71ItoxiwlFn2Y/4gKj1IpQp610P?=
 =?us-ascii?Q?CyzY5FqpbIbSMAbF9bZxvOeDX1/cPTg/NKj7h+iE5lz+2ea7/cqK8EClB46Q?=
 =?us-ascii?Q?ttooRgZLkSHYMIh3rbR2j+oeR4UhRe7g1N/CElAWjJJivG7wdqWcx3bt3bhK?=
 =?us-ascii?Q?Yg3AmmPZ/wUeBRApTvGJG1rnHOTPvbDi6wdBIM7QDuMcKrBUysUsF1a7O9fV?=
 =?us-ascii?Q?oRyu2dXjijF27eWN8dKz4yb4CLdx/VQ1s+0l49QLGVqKUYQA4iQr+5EZV6sk?=
 =?us-ascii?Q?9aRo6VNFugOxoXvYeef7xjORFqmDfm28lfiSoFD84W5DE0f5Iv43wawdQGPk?=
 =?us-ascii?Q?v5cXEIO8iXNQ1+3tLpOH7pNEadIbhaCuOUdmy2c1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a338db9d-fa11-4d64-0ac6-08dd33b155f5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:04:50.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w3kRMBF7gwxOoQ/+c76kpv5yS46CGMJbW5glrnAhbiwuiOK6ZT1uVVu7Y7nYZDBTnMYw4A6f0KlRT2a6FDZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377

There are two MQS instances on the i.MX943 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

On i.MX943 one instance is in Always-on mix, another is in
Wakeup-mix.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 0513e9e8402e..e34e5ea98de5 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -410,12 +410,40 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx95_netc_data = {
 	.div_shift = 9,
 };
 
+static const struct fsl_mqs_soc_data fsl_mqs_imx943_aon_data = {
+	.type = TYPE_REG_SM,
+	.ctrl_off = 0x88,
+	.en_mask  = BIT(1),
+	.en_shift = 1,
+	.rst_mask = BIT(2),
+	.rst_shift = 2,
+	.osr_mask = BIT(3),
+	.osr_shift = 3,
+	.div_mask = GENMASK(15, 8),
+	.div_shift = 8,
+};
+
+static const struct fsl_mqs_soc_data fsl_mqs_imx943_wakeup_data = {
+	.type = TYPE_REG_GPR,
+	.ctrl_off = 0x10,
+	.en_mask  = BIT(1),
+	.en_shift = 1,
+	.rst_mask = BIT(2),
+	.rst_shift = 2,
+	.osr_mask = BIT(3),
+	.osr_shift = 3,
+	.div_mask = GENMASK(15, 8),
+	.div_shift = 8,
+};
+
 static const struct of_device_id fsl_mqs_dt_ids[] = {
 	{ .compatible = "fsl,imx8qm-mqs", .data = &fsl_mqs_imx8qm_data },
 	{ .compatible = "fsl,imx6sx-mqs", .data = &fsl_mqs_imx6sx_data },
 	{ .compatible = "fsl,imx93-mqs", .data = &fsl_mqs_imx93_data },
 	{ .compatible = "fsl,imx95-aonmix-mqs", .data = &fsl_mqs_imx95_aon_data },
 	{ .compatible = "fsl,imx95-netcmix-mqs", .data = &fsl_mqs_imx95_netc_data },
+	{ .compatible = "fsl,imx943-aonmix-mqs", .data = &fsl_mqs_imx943_aon_data },
+	{ .compatible = "fsl,imx943-wakeupmix-mqs", .data = &fsl_mqs_imx943_wakeup_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
-- 
2.34.1

