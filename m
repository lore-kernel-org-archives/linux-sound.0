Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7287D12C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820423; cv=fail; b=aZjmb/rON8DvvQdRROUUO/7/4IdlmMZHHMpnW6BaXVW+0JX81l+W8r7tZxG2PSlBp6Nl/mEuuH7u32A0Y3k9R21kytYZdkQX2dwbHtmOd5Br1bShJEJzQMaaIXBuv2x7HBMmWRZA/VsoMQfVQyS/ega/hL4YUolSYUbOvl4NgfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820423; c=relaxed/simple;
	bh=ZNuL1kDBU74hYtAjtrRtgGTQn82KQrCH5DsNh/gh5Lk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oGARLW5v7MmPgC4dXi72gzNthr1srX1493myD+F3AGpesEg+K9XwDhVAd2B4tidCkX7GLyescKPPvV2Ru2VfTggRNLwOMuvVRqHyzl3Eyl1MuRskHF1e/vQ2Fpw1E7QlaTbNAEZDoM6WS634xl7E0eqZQlf2rtMuQpThpC/Gt9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GHsMRQs8; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GHsMRQs8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E30GCIGSl5rIn8DTTuOQ4ltAsBtQfYSaej0xwuaysHsbK2vODnLb1mqieNDuXP41im+CTssVzmYZOZ17mh/Z7qWVbsejFk02OQnVjgdkoTqzwMd5BQY23njta2zrdcGEbMPjbIgf9RfSkYpSZbEqCb1AVSD5nGjxdEOZUm7hiRFBXB2HXN5+bvM7lGyz+ouA5+UqykJ17FUoRAHuwpkBVoY5uqiJYeHE2s144PnQjdd9faK5nHmDUWoVgMBDotepLrmS9m0w8YFXxxLix1oX4Bk/dQ+tOF+/i2e3wpVrNdVPdMQb9BJPvu3bmK1uwv9DWepdHtJHZM2qAH0n2SdfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kajz+LuY8oLr1qq6Z1Ln6V0GldhEvpyTumEA7wN9lw=;
 b=ajLN1cGQV4U2MV2h09+5BDu/6UIXyDFeTpj92L5y+Ri/j3sBcVQIvHwkeGB4+42IQfx1OM9+12HMMNo4qTGDjXVMI5F3b4c5j8sP7f4f8+lEO/42OpGg3Dp9TSFgx2ypqcbeVG2PUC1O/SbH+qcZcJZe+VcebL1ZxSSbq1UpG0SUCGt7keaneKXLyh9V16hHg1RVwEEs2pi44xhbh5CIg8S0K5OBBrbu4xZsjYXw+WMsmse/1uBLbuSQXVhwWwgAAhVG1MXof+NZiB4SGlJ7mJbXBTZgN4PYdE7hjVcPC5/dktH01jAYJEXQnWOdHIqrVY48ow3A90RjR8vx130b6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kajz+LuY8oLr1qq6Z1Ln6V0GldhEvpyTumEA7wN9lw=;
 b=GHsMRQs8HYAGq6WrZmlAqQqKKGn5MrUNd66+nKucuta1+6Vjls058dS1WABuatCV9qZvIofvUCvA7dqWHzge32/UHYr9zjnrm98Jaw/V+dp6p/dVqIdiIyzLUNp/IXXepjis4rDpW3hVKJ6qM3axPpdNmoLwM5uIeLywna+FjMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:18 +0000
Message-ID: <87346l8loe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 031/292] ASoC: codecs: cs35l33: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:17 +0000
X-ClientProxiedBy: TY4P301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 651de0e2-4e18-420f-a250-08de20b817db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YEtf+dXqKWKAXs5euReRxP7R4suictn0Obk52NhhWyytyO2C/yloyegOrjPv?=
 =?us-ascii?Q?P8DpsJjNCoMV27XmFlp8O2+1HA5mSKMl5O7YnpTOblRez2peY1vOfV24OvFu?=
 =?us-ascii?Q?qrwgIHA+P45WHJ+FBGSA0KWdsRTqtBRiLmzRJJg0qvEthgaf1NDzb4h8agBx?=
 =?us-ascii?Q?OH2qL1Y1+r1tQd2g507oY5l+ptma9H5t1a3iZvfzrE3+49R+3NXDAQDcmyXg?=
 =?us-ascii?Q?Nsjh74OclFGmtG504/keG4w3UW9owwq+zYuny4iWE0gLXJ+HNV2BeP1ecxOY?=
 =?us-ascii?Q?/GMpi+NTfeOI8NI8OhmWmPgIjSZFVzXNopXRA7gzfepR4sokiV6fZ6SJzxu2?=
 =?us-ascii?Q?Ie7DaB/6H1mGizpRk8OTdSgrlxu/4/WGec/1wGmeM3emgq1OWHq0xyPsj3wY?=
 =?us-ascii?Q?kGhEANMhm4mBNEHuELAHgg1G//ShN0dASozi0wiO68e/qo7sjioGWyndPMeH?=
 =?us-ascii?Q?NsmqRvXDg83Byj7Rcu2vyu7PrHcSTLPhlm0VBUoqPjSv1iJBT9ZJmM0oGF7F?=
 =?us-ascii?Q?wEjZGBSs0FFaWjZRdcX1iVBMdtM9E1p5Sr4jFqWh/RTlKMSIJUgsCcSUi+lf?=
 =?us-ascii?Q?s7hLiUNE7D2cddZvJ5KSlU0jiN9NxuWNh3hafMxuzMizbzHsezMcVTGBWzHJ?=
 =?us-ascii?Q?6ej5HkLmTkeX9p0+iu2rS59Uq2KjcBM6wVt5OOch2uN3aa2WXyB/4X9Ggqml?=
 =?us-ascii?Q?hCBCzD9vBk4Rwqk9biC8FXDmh+nI0O4O3zxo5XAp1d5lBAUd/m8e6XcQlz/3?=
 =?us-ascii?Q?hBtjW1fIO7MLHu6ywIkr+GBjZIXfAI37R+7neX1H1C0gex1a/V9smF/6JLXa?=
 =?us-ascii?Q?dyhRZjGHFHN2DWxG6q3eq7hFaNapb/R0WXCmVM0y53XvkusF3LcClKTDtn8d?=
 =?us-ascii?Q?yeo9YKfynNXZQtaWnwuTqn5DOz0A1UCBk2+R2VjeTctDJwvGJqIHfrWrJc3U?=
 =?us-ascii?Q?wdU4yDnv4+7fqcfeFuPDsEhJLlOcQdA3eXq8kE9xQo6bhql52zOi8hhTrnjR?=
 =?us-ascii?Q?gDsdxhI65O0SUKR8dukn0dxGO1EmS5BDlEL6FR46WwnKTNWTLhI1bCMaYfEx?=
 =?us-ascii?Q?kj6vckbC6QT9ogzs9ptH0GnE1RcY2mW2kHzJWoZNWBbec6A2J3AzDL4aECGS?=
 =?us-ascii?Q?SQCE0i9g3PWswJMkTV8TwJC/9Ra/S9zTQ1GIZBtrEGFmy9H2KDzMBS47vIoX?=
 =?us-ascii?Q?qLvKKwnLsT0dzlRTePIa2x+D6tvSMIVBfScMo1pO/80nXyQuTAxCJZqv2HW9?=
 =?us-ascii?Q?qTU2cNBBhDnNRAHdpf0Xf/2Mm/TiSFMCIMn9bYPFRUasretYo0cCFf/gVeKQ?=
 =?us-ascii?Q?g3IXcmsZP6lucst+Dp68lvhI0cfFRBkJv6WWwzRDa8y2gGKhK1S3Xh4XcM10?=
 =?us-ascii?Q?/XpLqgu+34qxb5kiq4il0htI2Rke8TQ9gMHVBLXHRkc5kR1vxaH8VGfl/n+Q?=
 =?us-ascii?Q?f6dG9ZXcoLJQD8O2wNhjNB7Rjh7xYgnHZuKFICxG/dN/PWNq3mx3vSA/BQll?=
 =?us-ascii?Q?f4K4gKrC89TdIwd9UMINHW7YgrvKgvAmGdKS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UJUygBprdxw1tD1kMXMyeAHuOzSubnl+TLpPgkXJwua8JlOGCr/WTsosI0hZ?=
 =?us-ascii?Q?KGlwHIPvyOIP4uGCjqgcPYJ2dCeMK7jq6HFk2GrPXHBtHUhMRs8CDV7/BvsR?=
 =?us-ascii?Q?xH9+CUnnfoWxzalYy0zXCycHPqYOUa51Sp3i1mnns5B711Klq1fzkWSor9bQ?=
 =?us-ascii?Q?cWIxfsCH72GDiv2j+PCtONgMyncJsVSPIEYw+S+HLEWtqYaiv6LpjlKv1iZH?=
 =?us-ascii?Q?fLgBU84fHQ1mnFfpSUNF6mcY+vYsmR478lHF0vw3sLJBCw+ngDoaQqZafFIY?=
 =?us-ascii?Q?tAM5pP2IoxKgUiU9NcvdFDfawuZx8Uyf1BUoq7wK7p0Ztg6j4UanL1cVdOPY?=
 =?us-ascii?Q?eHa/wYZplROedfgH707z7iJsnI7Wz6IqF3kPYqjGObPFF+dVpVrBW9wrBQU8?=
 =?us-ascii?Q?McjF5SabkwUHu7qJgaKJrXjlDmeGVlB/u2sm1pC7dAVgLBWhj6q5KeBP8HbF?=
 =?us-ascii?Q?DtJLon4XnbRMcXilUi8U8JDQlCzrHYStneRYXbDLRgdkrX/6lJwfxhiOX41z?=
 =?us-ascii?Q?juNBroMv6z5UPMjR7gWEB1aKUwgXw6XU2gJuKT6MZzJUkjPdRreVoorFfcHe?=
 =?us-ascii?Q?IajBoBI+f0XAO/ePtWFMHybYsTFEL4srSBAnJnWJTwbVIVyWTu1nPrsKaDUd?=
 =?us-ascii?Q?N/lxCQ1hr1JF9I4KSnIrLJFaxMC20nHVxxcINY6aIvj39/fvjOFq0jIv8YSf?=
 =?us-ascii?Q?X22zBnzIPTuXf78E6qxKREn8H/ZZ7A2MLeY6OFNBF0ZmIPP9BBQd2b/r3v0j?=
 =?us-ascii?Q?fJ9hMZZLQpEqh+AeO/s/9AVLdh1k/2NQDKMqT351aOCxVkCYQ8WneBSOIElZ?=
 =?us-ascii?Q?KoOvTiqz3lba9O132dyxFwpX5hDceeRStqRJL/SUKKkqcf5+KxuE6BDxh6qr?=
 =?us-ascii?Q?YgOJ1N2Cb98R1TWfaAWIMZNojIFJuzzsMENKFB4GG3aIHb2brPsvzwRL3KHa?=
 =?us-ascii?Q?jfwhXA2JRbVgODRbeAnrlia7I/LaNs2gjC06vB6POxQTXiMfnqLcP9nQr3QC?=
 =?us-ascii?Q?jGfkNo0gWP3QeDM6hFUkcMLdc4CJwgOxu0EYdJYbpFBz+YYL6aD2hXg4UX4E?=
 =?us-ascii?Q?eEyMbi6oQ1r1QlWmLnq/COkV8opU3j7qKlKC9+17Om/XMEQFhePQvpQNPgDk?=
 =?us-ascii?Q?f2X/OnxHljjApvXLhGlZ4g0N4m0F9N3ZtB7H/ls0igLMS/2OaBwUlJ7H7CGf?=
 =?us-ascii?Q?A5tH9KfbKZ+nPS3tMBDuSEgany4PFnzRKtwkz+aZk0Dz0l3HcTUl4mCL3USk?=
 =?us-ascii?Q?NxXvKs7iBIgCNDxig4doZs/1sAeRWAsUabuMjRHJVMqkr41ZKNgmLDdGicC6?=
 =?us-ascii?Q?pNx6ESrep1fq+RHRfWADegb4UE0VNSC3bpCdU4TooUrjAenGs8JMwWEeeAXC?=
 =?us-ascii?Q?f4gtdSJk7+Z+pr/OtCXkNnxeEuLMl4upuqw11zxBr5bnT39WkVANAfWXwaU1?=
 =?us-ascii?Q?EwCfrQxNnFz/1d9gW4N7wHSz5ZvVHTLxLKYFO6WxnccdsRfwrMMejmEP3SA3?=
 =?us-ascii?Q?XC6sVnWLz6OPUkqXFwtvTlwWSXwWDAcbiLKWF3i+uA428VMrj7L1LQAjUDvR?=
 =?us-ascii?Q?dyfl/mDim0dlPqrDaLCQ7AsqYBfDjkhD8qB9U+aE0P12yofFQzno9/oUv5Dh?=
 =?us-ascii?Q?JBOsNWZVhci5rEi577a9hKs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651de0e2-4e18-420f-a250-08de20b817db
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:18.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMfYvDaXyxto5exAnlttx6V9NwKvXXY7sPorV9BUuMuSMtIKDe4yCN0QJn0lN7CLo16W4DpDh2w6gjxM4tyBXtdNDA8KqlsCG5U6QhU7OIKcrUDKGTF/meBVpX1Icagh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index c927592f90c9f..98b4d371d9312 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -547,7 +547,7 @@ static int cs35l33_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs35l33_private *priv = snd_soc_component_get_drvdata(component);
 	unsigned int reg, bit_pos, i;
 	int slot, slot_num;
@@ -695,7 +695,7 @@ static int cs35l33_set_hg_data(struct snd_soc_component *component,
 			       struct cs35l33_pdata *pdata)
 {
 	struct cs35l33_hg *hg_config = &pdata->hg_config;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs35l33_private *priv = snd_soc_component_get_drvdata(component);
 
 	if (hg_config->enable_hg_algo) {
-- 
2.43.0

