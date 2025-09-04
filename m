Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559831CBEB9
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963299; cv=fail; b=kX1uDSJIROFtGrg7oCHy+uIySDzKJRg7l+OEzU4jqRWfvroZok/EQ9hv5fmVWzaW6MQ8ZriuinfQYoJlXgftGH4E+LlrknOE+BJg8TApTVxBYLujrDWkTHWqwl0t2Uwl5//0N08jGvcOwX6HwP7JvCxwqaRxZZxjTI/W2hoSKbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963299; c=relaxed/simple;
	bh=VOWuNlLh5BbOmkfivOrCdNVpOVqwjLRcbz5Dd0cobhI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jvHvhLkNIpfkUtRlpJTXP4fZQUT6JpX3SVebr/XSxpQAjmQYoDHIKWJjo5HXdhpw3eIi18/B3UV7R80r2Wi/260CuuhBCNDqmNW5n4eUPLWVv5TUMOlwm/IiduHCHJh0dSQ+UB8r0D5KzZHcPcn6FZ7OD8JmmLW4zSGY4yV92UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CqxW51gz; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CqxW51gz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs2l+wKPDPYj8C9b7z959aKW2fFhmSJk+a+fn6vhVv3dbsQ0Eebl0AY57YNmlOECgKcFNZnA2ycZqpsGop01bHo3OQcc7aEsIrBvzdVmyY2Ka6wx0XOhiq2vuUU2a5lW4DYgc6W+WH7cWyrHaXDHi2IRUugkHrChgN58ufx1JqzDOhCSg57pZ+9lv5Mz+Zmdimb2OSQ3RTRzptYhla3m1eYhrVZObWA+qF4VMGcSPvoWtto3Oa/CDRrDBCJ01nCyGUTAXEc1OcvJj/5BA+CRLa036XErYaZMaGbc3+OOLw6U6T9nS5yEuPE1ilh5sPBmxxmli0Z2ZjI3ZDCfsjsk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIXkmDWXqnWJKE8ewTD1lFvT4JoJe2+t3r9fOxU03vo=;
 b=CZSktxGa3MKTTcErYTBBjpzfr4r5oKP5Lcj1Af2T6qyJZ2Hq8QisnGRgqaElF4ok9GW+z0JiHtk56o11JnxODvLiHO9VdKeOGB2YJqmvp6Us6zPD2X/ZthrvqIZbzRmbSNj9tAD1VPiGusPnhPa6rrTV/ywcG/yA8QtsT/1BMhyI7mbvloXTXUmatd4tK4Y4NHM8snRJZEqHEsJnzBGr3tkmbuJ69mSKYpPz4qN4uJ596pVrXHTZelYcQOBIhsQUZg9eTSEJcOQPJA5UNDYo2uAx/P9ZnKHDL8onVAfb8Qjix8aDaGHHV+CZcbZbk5aiILW8H3WRRT4Vxn9uSXO1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIXkmDWXqnWJKE8ewTD1lFvT4JoJe2+t3r9fOxU03vo=;
 b=CqxW51gzVt/L5aNv+LIDdAewOc2pJaMiWlhZmtazCM6sErLKeGojDpVHG0z3PWXidEUDCVxtC8H35sod+TGPo8Vlr+AkwQZBraO9RoHOXtXWQdg3pEkoc5BtlSDZ9lrezkzI7HsmdzFY6KnfdCLE0Rsx6DPfOurMzbXQhWw6904=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:34 +0000
Message-ID: <874itix06a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/10] ASoC: soc-dapm: tidyup idle_bias handling - step1
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:33 +0000
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 042e431e-e118-419f-62ca-08ddeb72e9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hh66vonnC2yYJOySenAzGbV5+xSh13xfiMs9zor/oSuggskew+sJ7WTWufJl?=
 =?us-ascii?Q?g4CoPeoKAH+81+duLldAIyqY3G/yETr0HJ1h9DI4C30MHMfJM9G28W53AqsH?=
 =?us-ascii?Q?9sVP+/KBTtylK5tc6h0liEOgILrrn7Wt2l8DAfgz8LaHfIhXuuj60I7DAy0A?=
 =?us-ascii?Q?oAZ4rTuuyZanoKf5n5brk1v9+E73INkJD42iuMSa1yasVALzPLb7Bzf8g9ia?=
 =?us-ascii?Q?WT8iqry/D53LJ/0JrXJGU444ax27yAqGkcYb/BZjHwOglajQ20l/OkEu611J?=
 =?us-ascii?Q?OSASvBhmNQ8i3ay+2b47k935+caV+Xgi3m06gATSlEzAsvZou2Alh8ZH6U9Q?=
 =?us-ascii?Q?tdfvM+NZ9/8Hg80n3tkI5HGcdQ95lwSqCfoebFHsMz3Js9qI7HkejCnWM+A/?=
 =?us-ascii?Q?J8hstd7PkvHVKF61B8jexzVGcY+JRefZOuLYgmj4Q9jR2NnRDXV43vEgSVAC?=
 =?us-ascii?Q?4KkqP39BdncIfSAqI3uiYs6h+XhsAIyq81yC46ZLsVJx/I7rqoowSMlh5VRR?=
 =?us-ascii?Q?l596tUFkznva48ZWJfnbj1v3Ng2J4cL/f4758HUvVizonxG0RjfMTiSCgIv3?=
 =?us-ascii?Q?nA10YdpsFz2BKsH6sMMIL99XrVD04e+wupUsW5qeLnDS7ciBxaFgK7+LjsNj?=
 =?us-ascii?Q?3itONTmbzglmX20gcHz0C1iRTp6KG/dF/Jnusl6Y925A6Xw9zecalYueLyYc?=
 =?us-ascii?Q?7CB99egXL6COy5XpFePJ0Imh4evv2Ezmy7tUVfDNav5aXOnZw3UvNm6Bgu4f?=
 =?us-ascii?Q?497GyJORrnM9rQsMnNUQm08SaqPykKX/8h5mMRRrOAvS3PBQsw9cQc52qOkD?=
 =?us-ascii?Q?3tXAJpUEID30zs7Y8WpmqXN5/89z9+JJ5KU0taazFL6Tw6IVZGsCj5JlzrV3?=
 =?us-ascii?Q?rOMSPw2hCidXCaY/icQuA9rtWG0vNYE1+TZr2sO9bIc/DW0Zvwo+V/0PR3bX?=
 =?us-ascii?Q?xYdOEJLffmXZqO/NnFZY5Wr7WAHSgt0w4pHxLjf40byW7Q8hGIk6sBFsm4fd?=
 =?us-ascii?Q?bpWRgLoNjb1rgx8h5CmB+JU2LsY1iVZHnrx3/YT7AK5GbDVt07Z8Ajr4c5nY?=
 =?us-ascii?Q?3VF80MwJwShY/jvPbBmhJS/1KXxKqAGTPQwCGJvrk6nMbdkVkNIlrKz4hCvF?=
 =?us-ascii?Q?IUPGq4sz/mS5P9CcM6/uAB3lWI1tuaL9kl9kWdb/f2ZHABP/Zgh1KZVqwzPk?=
 =?us-ascii?Q?l8F1OadneI9XzldxOSTOR9LOgaHU0ZY/mbRAB09N+mS3SJZewd7U0D7yAfSN?=
 =?us-ascii?Q?T4SFKTrPXtySc/eYEfJyf29qbLx3/v7pgQGhXRXuarOIBE8g+t9jgHMCVwbA?=
 =?us-ascii?Q?68DYvTEe+ooU/dg1AjSP3D3oCSTQMbqECBQG2N7gakRqGIPo8UEanupjIVtH?=
 =?us-ascii?Q?iwPhR6/TAWtwrfBEvPr7ibICwFRVAZdGXBePYC68McCIsbYmQC6F8Um+HEMR?=
 =?us-ascii?Q?xCiAe9BORH7g5jteB9JNX+DAGoQmGDO6ns744/XUqyKmTP09Lgnnbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hp/+biJuaGgaD2mr62ieSFA6wFkLV+pUdzUCl8/Y7IjhnsmCW0vueb4q/YNw?=
 =?us-ascii?Q?tw6wfHbGgYK2Lm2cwVJMAeBxsVobuCxaU9dNv079PJKwpo5+sKt+ba9KucEb?=
 =?us-ascii?Q?zqTE/0e0AMS9jsaj0nPI4fe4zUr60SHEdZ/jxllk/PYHqGkyJP99WhN8k0l5?=
 =?us-ascii?Q?+7QdpdDSrc3DhX8mE2heATg7isZetmLITfJXdDjj3ACVclwY5Q8ljyLOtU3r?=
 =?us-ascii?Q?G5zjP1TJ8k/sira3Yrzk38EyV4cTq6iwVqeVuY8lbmxue+iQWdbYDxrOweP+?=
 =?us-ascii?Q?e+XO/dTQfM5+9RUlLP+Fs8R+Nh2nVZje3OVF8Ia/swRTDfH4luV4omL8aiIq?=
 =?us-ascii?Q?CAamsNe8+oDs0NhL0VgFmAEic78pmppZyAQZwEEPRR2oIqDyp2MPSIr5fqiE?=
 =?us-ascii?Q?ghJ1if9jfcARl4VazSBaMCK6S3A8b1h/kjATLEMsHR6AfapDuNPslbX2yHMT?=
 =?us-ascii?Q?C6hr8LJAZ+I9F6uCVECkhC73IikepKbXrXiCwljUIyG262NMqmWU0MJP66mM?=
 =?us-ascii?Q?m2NGqO1qtC3L5Ho4WDlbipTuoHBTKGJjWKwPSo31tBaAWVd7m/vGtrHFLZhX?=
 =?us-ascii?Q?p3TA4zLL0Vfqo5pIr72vSEasMxj6fzi+iBfJ2WvRws1dcy7w7FaBvUNEaE7y?=
 =?us-ascii?Q?buX1rku0YGsJbiujqqOlMGaS4HPOe2XwHjFpjNmKjEYCblMGqCQKCZ+cqnWH?=
 =?us-ascii?Q?bCtUXWt94JvMEdaq2lfRXsW7cpFR2ZaqdNU3m0zhLvKCRbFk8iIVq5ufZdb5?=
 =?us-ascii?Q?6uHKbrjGWaWDIrD9XAbQuSNgC4rydzqaX+V7dvbd0Slg5dL7fSnWqnV6M73o?=
 =?us-ascii?Q?O7h/+qJwNyy+Z+6tlBGLCgFJMxldKOacvHHoEgHcd0PM6+ZiwxSxWBl4zjUu?=
 =?us-ascii?Q?bKS6MMztFFBfKh0ut3MgODAVPlu9fjOovSLSsdiYgFN4Y1uRib9P8YVjRZrP?=
 =?us-ascii?Q?W5PBomOnsCcRz2yqDe5lg0SHWVtCRmNFEW/SnX97xgqsS37/pjrXIo+eBWDW?=
 =?us-ascii?Q?+nrk+GG6UsAzlshagfBUwtQ2YNULM/qNm7NNErrTa2m01GZzvKB4DcYvpgQh?=
 =?us-ascii?Q?FOZLoyJTVL93zELGjuigoElOGcpz1+20JS8aiJwXlW7/z8fU3EVK2pk4j4+O?=
 =?us-ascii?Q?gHfpiwhnaIdaUfgAdGpE22GlW8uwB2bF/pxQZMOA5njxAFfdafQF/eMm6Mt6?=
 =?us-ascii?Q?qz009SNoduUldrUwarA5xhy6J4/XAVnygFxS4XtUq60zSBsW7M/rfkPPxvvH?=
 =?us-ascii?Q?H2OKanCEYtfw2R37tDVFJ6Oj0geWDClioFv3RSPQo24HWkjd/Bw7NhH9boVm?=
 =?us-ascii?Q?XefMkHBWuxpSfZSbLNTKjsNBS4oKWeT9aF6wJSr1+YEaCT76xQUnHXxhl6ux?=
 =?us-ascii?Q?TCYc7R6u9osvh+qM/aI1xvO7FiS96KOT0VWqOrojun5H6MYWh+uWZ3CF5O2r?=
 =?us-ascii?Q?L92CsAsPPA9FmVvxreQ1/k3qMGlS6VaWog6qr2hbqIXsiG99zQvIaFnhAY6h?=
 =?us-ascii?Q?eEDmfVfBlNdWCszMEBJZu/GP/RQPADSEppKO5C8ifETQmpS5cDVAnl/48cuQ?=
 =?us-ascii?Q?NuBXHMhgZowSo4TKOWwLIcp1IbjcdVfJZNUDCuo52K4qi6wOJSQVEzY6gRP0?=
 =?us-ascii?Q?kjgoxRJ1CM+Vp7BrcMFe/7I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042e431e-e118-419f-62ca-08ddeb72e9bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:33.9231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dNRN1lbbpj3x7X30P5rhLn0CDS91YKpY4uptC6O1pOp3laNqBnS5/U2SYcPwC12f2/oKHaIpVL99jKMky6gZlhf2t5MEyzV3RG5Bd/rZyaBlgn9bQd4GqW1pHcydbHb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Current soc-dapm is using  "idle_bias_off", and its default settings
came from snd_soc_component "idle_bias_on". It is complicated/confusable.

Let's handling it as "idle_bias".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h                |  3 +--
 sound/soc/codecs/wm8993.c               |  2 +-
 sound/soc/codecs/wm8994.c               |  6 +++---
 sound/soc/intel/avs/boards/es8336.c     |  2 +-
 sound/soc/intel/avs/boards/rt274.c      |  2 +-
 sound/soc/intel/avs/boards/rt5640.c     |  2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c  |  2 +-
 sound/soc/intel/boards/bytcr_rt5640.c   |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   |  2 +-
 sound/soc/intel/boards/bytcr_wm5102.c   |  2 +-
 sound/soc/intel/boards/sof_es8336.c     |  2 +-
 sound/soc/soc-core.c                    |  4 ++--
 sound/soc/soc-dapm.c                    | 20 ++++++++++----------
 sound/soc/sof/sof-client-probes.c       |  2 +-
 15 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 498f8af79cfa1..9618a54a53485 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -583,8 +583,7 @@ struct snd_soc_dapm_update {
 struct snd_soc_dapm_context {
 	enum snd_soc_bias_level bias_level;
 
-	/* bit field */
-	unsigned int idle_bias_off:1;		/* Use BIAS_OFF instead of STANDBY */
+	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
 
 	struct device *dev;			/* from parent - for debug */ /* REMOVE ME */
 	struct snd_soc_component *component;	/* parent component */
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 9be4f6cadba39..75d923c2c9cac 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1536,7 +1536,7 @@ static int wm8993_probe(struct snd_soc_component *component)
 	 * VMID as an output and can disable it.
 	 */
 	if (wm8993->pdata.lineout1_diff && wm8993->pdata.lineout2_diff)
-		dapm->idle_bias_off = 1;
+		dapm->idle_bias = false;
 
 	return 0;
 
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 240ec1bed2347..128c3a59beac3 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4182,8 +4182,8 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 
 	wm8994->micdet_irq = control->pdata.micdet_irq;
 
-	/* By default use idle_bias_off, will override for WM8994 */
-	dapm->idle_bias_off = 1;
+	/* By default use idle_bias false, will override for WM8994 */
+	dapm->idle_bias = false;
 
 	/* Set revision-specific configuration */
 	switch (control->type) {
@@ -4191,7 +4191,7 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 		/* Single ended line outputs should have VMID on. */
 		if (!control->pdata.lineout1_diff ||
 		    !control->pdata.lineout2_diff)
-			dapm->idle_bias_off = 0;
+			dapm->idle_bias = true;
 
 		switch (control->revision) {
 		case 2:
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 12e4e0aba5fa2..eb2b40894e3f2 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -132,7 +132,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(data->jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_soc_component_set_jack(component, &data->jack, NULL);
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	return 0;
 }
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 67d2c4585cddc..4055ecc60838f 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -117,7 +117,7 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	return 0;
 }
diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 706b84ffe1ef0..97d1fa944188f 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -67,7 +67,7 @@ static int avs_rt5640_codec_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 
 	snd_soc_component_set_jack(codec_dai->component, jack, NULL);
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 68a3d345dc25d..27b63a853a48e 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -77,7 +77,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 					   byt_cht_cx2072x_acpi_gpios))
 		dev_warn(rtd->dev, "Unable to add GPIO mapping table\n");
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	/* set the default PLL rate, the clock is handled by the codec driver */
 	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0), CX2072X_MCLK_EXTERNAL_PLL,
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 62594e7966ab0..2ae54e82bb2da 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -165,7 +165,7 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	int num_routes;
 	int ret;
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	switch (BYT_CHT_ES8316_MAP(quirk)) {
 	case BYT_CHT_ES8316_INTMIC_IN1_MAP:
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 0f3b8f44e7011..34356662a48f4 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1321,7 +1321,7 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	int num_routes = 0;
 	int ret;
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 	jack_data->use_platform_clock = true;
 
 	/* Start with RC clk for jack-detect (we disable MCLK below) */
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 67c62844ca2a9..642cfe571a56b 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -570,7 +570,7 @@ static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 	int report;
 	int ret;
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	/* Start with RC clk for jack-detect (we disable MCLK below) */
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN)
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index a6dfbcfdf74e3..72c0e5941ae84 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -288,7 +288,7 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 	const struct snd_soc_dapm_route *custom_map = NULL;
 	int ret, jack_type, num_routes = 0;
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	ret = snd_soc_add_card_controls(card, byt_wm5102_controls,
 					ARRAY_SIZE(byt_wm5102_controls));
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 1211a2b8a2a2c..10b189ea88dba 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -276,7 +276,7 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	int num_routes;
 	int ret;
 
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	if (quirk & SOC_ES8336_HEADSET_MIC1) {
 		custom_map = sof_es8316_headset_mic1_map;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cc9125ffe92ac..9dd84d73046be 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -717,7 +717,7 @@ int snd_soc_suspend(struct device *dev)
 				 * means it's doing something,
 				 * otherwise fall through.
 				 */
-				if (dapm->idle_bias_off) {
+				if (!dapm->idle_bias) {
 					dev_dbg(component->dev,
 						"ASoC: idle_bias_off CODEC on over suspend\n");
 					break;
@@ -1652,7 +1652,7 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (ret < 0)
 		goto err_probe;
 
-	WARN(dapm->idle_bias_off &&
+	WARN(!dapm->idle_bias &&
 	     dapm->bias_level != SND_SOC_BIAS_OFF,
 	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
 	     component->name);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b90d0adb77132..cbe945f1dc9cf 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2180,23 +2180,23 @@ static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
 		dapm_seq_insert(w, down_list, false);
 }
 
-static bool dapm_idle_bias_off(struct snd_soc_dapm_context *dapm)
+static bool dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
-	if (dapm->idle_bias_off)
-		return true;
+	if (!dapm->idle_bias)
+		return false;
 
 	switch (snd_power_get_state(dapm->card->snd_card)) {
 	case SNDRV_CTL_POWER_D3hot:
 	case SNDRV_CTL_POWER_D3cold:
 		if (component)
-			return component->driver->suspend_bias_off;
+			return !component->driver->suspend_bias_off;
 		fallthrough;
 	default:
 		break;
 	}
 
-	return false;
+	return true;
 }
 
 /*
@@ -2224,10 +2224,10 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 	trace_snd_soc_dapm_start(card, event);
 
 	for_each_card_dapms(card, d) {
-		if (dapm_idle_bias_off(d))
-			d->target_bias_level = SND_SOC_BIAS_OFF;
-		else
+		if (dapm_get_idle_bias(d))
 			d->target_bias_level = SND_SOC_BIAS_STANDBY;
+		else
+			d->target_bias_level = SND_SOC_BIAS_OFF;
 	}
 
 	dapm_reset(card);
@@ -2291,7 +2291,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 		if (d->target_bias_level > bias)
 			bias = d->target_bias_level;
 	for_each_card_dapms(card, d)
-		if (!dapm_idle_bias_off(d))
+		if (dapm_get_idle_bias(d))
 			d->target_bias_level = bias;
 
 	trace_snd_soc_dapm_walk_done(card);
@@ -4825,7 +4825,7 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 
 	if (component) {
 		dapm->dev		= component->dev;
-		dapm->idle_bias_off	= !component->driver->idle_bias_on;
+		dapm->idle_bias		= component->driver->idle_bias_on;
 	} else {
 		dapm->dev		= card->dev;
 	}
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 3ca8460774bb4..aaf0ae4bf01f8 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -525,7 +525,7 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	card->dai_link = links;
 
 	/* set idle_bias_off to prevent the core from resuming the card->dev */
-	card->dapm.idle_bias_off = true;
+	card->dapm.idle_bias = false;
 
 	snd_soc_card_set_drvdata(card, cdev);
 
-- 
2.43.0

