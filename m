Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B061946A1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533796; cv=fail; b=XpQklMUUINaRky7qIfZ0LwEHvLAme/T/3/oVADQurc4vKcytoy39LHz8t+cVMH67DoJVielER6fga+64HUaiWKNoVcfwIgYAmv1n/Tk3DYjhkyhc4uyJ1zJtD6vYpQxCBmbIOvqQBhIhMLzddB+YLtxmRp5Vy3ki4nHgDqbLd5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533796; c=relaxed/simple;
	bh=4rnI6mzDFX//Caadt+n8F9PBS/07XNzousV7v3X2+K0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RxOH2/zQU+HxzDZr+/3lCcJo8fXTnDJH3OoDkJGqhd2X5zjRYYHOl+4p5xsx2sbrBWWIdyfZSnlmqFAtclCEOL8HBDm0iRF/rD2Na6UhWYbpe7qb4QwJqD9P8t6M4Pr4g9fi3fDjEFXuzUoAKq0UVa0VD/MkqGxX9RmI0NaWFe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iQkzBq/w; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iQkzBq/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3P3cEFRmU3cEMfQ4WaVwm4+HL9vfnnt3rEGl6JRC8V0Paber4ow94RmcWH0m/au3ti3wl3Pb3AJ0KxfU+78r4HXBaYu8VPk/ejAJTaq/Wn/vLIqBuCFHYAzLxHF7ehrBQUDD4vvHfdvb4hZDwMnux+gseIRBmJGxcnGXXe+h8sLNN84xic3K3CnuoH3csgdyCgHO+kvVaFLfFa9vxMHkptyvN20ctzCy7Fx21XLjKcLgAuHFLHqGbEMPtpNaGKcC/IHad1sEHvoLuy4KRunyvuXAFinoRN4wHeMtJW/1E0aFOEdaauZllmvxzpu4XQ8n8KhqhvxphpYSP5Km9q1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahAybyRTojzaI5xc6MzdpMnsKudocoYJMibn4OaYMFA=;
 b=Jcck3ffmNFga1KG0WDO/eMWTJdd9BjPcy30qAQX3TuvjYLCIPZBXeiHvyXp5dhAugauWtVNhU/f2NwcbEVw/h5Oxkr2P9qbXpKEDpwfvIEa1yHdZYoRlXOiS8dxEQnFMkSNY1LdRYuWDzouecag6AEyYBJVm4O2Zs9h6hoghedXlJRpDosgthQ/YWrYmArWfYiB2yTLe2mscP/kWXLCqwecNlMy2IJTJ2u9sHtu0/HNXABpq5b1nuhA0+sLK/5bHe3fMEnD7xVwL6LAms5dQV57M7LNykwZSsg0PiSzfEz+xkQ7Q5MDqjgxZEuCqEU3YMbxrtySvBw9rz/b+fe6KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahAybyRTojzaI5xc6MzdpMnsKudocoYJMibn4OaYMFA=;
 b=iQkzBq/w2MkPEqDwz+JLOWuHTurX+WhH4WfzkjuqPq2TudBxrzxPxIjNuqOqfUKivUcaPXSRcHRoFeGdh+CPZcTdvG0UvVCYRNnunFj9ENPdMMKO8eigqRvliTsF8NK7+vK/qOVRUdnJcO8jQst0+L+D9y4ziNprwov7OySq28c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:33 +0000
Message-ID: <87a5a9bi73.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 104/157] ASoC: codec: madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:32 +0000
X-ClientProxiedBy: TYCPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:1::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: a7620a32-0788-40af-04f2-08dd56060029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z/r+uDPQNli7AMwWRV33392EduY7MlQD40kXoEyzGoBP7DJS9rONh/BamHLy?=
 =?us-ascii?Q?KwZIxPQYyU67FDebO+obniNfbslM5HlYDm4kl8o4yg5Idd06x/NQ48i7sbfW?=
 =?us-ascii?Q?kiEGvtwcfO/hTgcTL+ZUeKQBnrUlS9doBOz0DnXyR9ey/xN+wdpNbBfUcry/?=
 =?us-ascii?Q?hM/+XV+qaTvsYnI1aW0i5RDW4McdB8JHdq6lvTg8TYIUN3IpldvUu1zYEm8p?=
 =?us-ascii?Q?HBGP4uK2MLNCUQ7UlvISkDo5TFOkIwoxSLkOUEIxNZ7SLb0YUMNvdQDtg/6g?=
 =?us-ascii?Q?pJbs2rxX9nyDsKK37M0T6TnTuaYrsaYFbO67aQlKO0CMHLU1uoUapCSn/5Bz?=
 =?us-ascii?Q?Um99CBfUTwcOUf9cYBI+QKteYfylyCQJq4rG+e/ENe5lcmh74IeV53CDdpG9?=
 =?us-ascii?Q?i6iAGbK1i++mZmtJpW9sgoMs0EM4dO4UckFxIJXcWXmvPpF3gCIJS9hUjQcI?=
 =?us-ascii?Q?39pYTkn4ECdzU+JCBNHBOOwg1ROvJiLxxOok4ndCrXYqa4l1VuwAwrJoom4l?=
 =?us-ascii?Q?cv9HpXDfweJZ5RbhONbizQa/Mv7+yqJVHeCiVUxRqVBE5tmdPkTNOBjg0h7w?=
 =?us-ascii?Q?PZsMmb7kamCgXZQwt9EQ9r48On5ww7K/HSgxbhWtPMIwJ18amKm4qwhbLqrz?=
 =?us-ascii?Q?XxWpQGU+1/onmRzENWZgZlokxbrdHA/8tfn5Jk2MxQsUl+lIb9Ko28P1WMmw?=
 =?us-ascii?Q?SJi5EGHLgXGPQblkyxntL8Pw3diokD+kTxXWAMK8QWDBnFf5X0vOVRyplG/+?=
 =?us-ascii?Q?6nL2j8NG2ofL+HzNZzIXi29BAT7xYTYNtUmyAbMblUzcykfVJYM1s9RK7wie?=
 =?us-ascii?Q?G7Fd9QcSfLFlD3HDEM+ZDbNbtql2BStPUbozD7PwAhsokl2bsBzRK6nPKOKt?=
 =?us-ascii?Q?rE6gN7ViLBraBftEv3i+3Bm07tR3YM3W0CRniIKvsV55Q/E2nyXKTtdLm0Zb?=
 =?us-ascii?Q?7bUCLk1R0ZS+IwCo9GAi42OZsu8l0H0WdJd2MWQsfO/hmPmHpfBYn+2/4T0h?=
 =?us-ascii?Q?iOIt8uRz9AVI3Ux3NPPxCzNgxq1Bdn+2UckFsWVHp/JQhEGGpdxmTcinvFPd?=
 =?us-ascii?Q?e7jo0Ahh1e+hWmTkoKYE6aXc+LVTL8g6EmBr5NDPEeZIW4EXkq7HEwOQJb76?=
 =?us-ascii?Q?4r1MHYVaA9/VlrydR+PF1aBqxg7mBgOjXzVZ07M8dqHVBW0diBXiXodqUy78?=
 =?us-ascii?Q?xjPW8jCJQHgQNOpd6sMEeEzP2htXMTjbtb3stMxU0tKYf1dhdGgz0zzDwXYK?=
 =?us-ascii?Q?ivLYtG/esdHJ7kFlXV+lG9d86Gu7+gaVOTUS+0tQsCY3qWLIPASnbpvb35kh?=
 =?us-ascii?Q?HdzDLpQg2Eu9liI+rCLlOuGG32AW3+a+SWfmZ5MYryLiNeTCpK0mC4ReYsiD?=
 =?us-ascii?Q?TS3MYHAEQN6XMSNeXUZeBlm4QEabxXMyFvylBaSdHoqglQ0PlhUk8hboRiY4?=
 =?us-ascii?Q?06pDEv5PTJGxItA7I24pktE0J6zXaS9f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AiNgZnHDhmsLcEZ3iyA6T54zV6QrFBbwS4lUjOcsZg+AeYBoh7Q0WOGPTihV?=
 =?us-ascii?Q?wtXcD1K7xwY5LVj/OlI8JVONt4JUrRCtoGrlVy4rW2xLnP9euH4uxfNDA9CB?=
 =?us-ascii?Q?2CsbhLaNGye9KSEX3rzyrRoi+PmSpQ+MoNWJzlRSxWlBAS9eHU4//u6uLCxM?=
 =?us-ascii?Q?XgPT8Ru87POhjBMvzsnql4JJAYG+EciiqrLxeKQu6cC7pjIRw5I1OOEJBRUY?=
 =?us-ascii?Q?rqw/IplMcoMtt5TihsArInpxTUxQ5wqatBZ7vEwMXgcK4BWLffmHTPZUQftc?=
 =?us-ascii?Q?dMuJEYpL2q/2TOshVGviYmU+iJklUSmjpUrQ1LX0Z3i8yvyG/3ACAnA8e0BD?=
 =?us-ascii?Q?P77eAusW5Mo+1dBYphpQYnyN7/bRP79IjzoujgGsV+jxpqGDAEdEyCrzTmEV?=
 =?us-ascii?Q?TDvTLP7mxepDxOLfnQ6vBcuxEnm4Khlhmq2mvg8jqlvnOZU9JFdnK7vO8fIm?=
 =?us-ascii?Q?PJuqlJ3yStUePXMG1k4SFNVkFuJG1CBvzLCErce2ruzHkGPyU2v7EM/DYbhn?=
 =?us-ascii?Q?S8QNdWiAJDA6vemjpr/KwY/FcAx4zdBkurlYSjDZCN50nlXxxt0jRbOaprG0?=
 =?us-ascii?Q?ToameweAfNshvirSPe5OssrBPInmrt1QnVbsAoT2P22hHUUsiGVd6jHQz008?=
 =?us-ascii?Q?EL8mMbgZH+ztRLCZjiEFKjn+TxHOf/2PBcIrYSGBtfsBLRULXtyG2i6XKsQb?=
 =?us-ascii?Q?wVpsGAmntDVIT5BZVAc04Xqairu8FmqSAfjexLTlMLPvgaoLPwRULQIUtRfO?=
 =?us-ascii?Q?8QsVWRfoILcIEM7val67FqYaywJa+f8IijFH4NeTD0DIMU71TIJ8kwN4bUsE?=
 =?us-ascii?Q?z5ZbU9nLFSqqGKGSdvmQq17Uquskc4Wxjene9el492Y8GRCqOXmGkC/cfS4t?=
 =?us-ascii?Q?1/QwYEMt4jxQ2Tad9QE9gFZPrArRXQdTpwc+3e9TesrrJ+lVxUxM41Q0MLx8?=
 =?us-ascii?Q?qqzTmHyOIA0eTUth2qv8LCe+wHgym4jBRVATIIGmFPKZ/yzpcatntiGqlTzJ?=
 =?us-ascii?Q?5D0s9biylzn5/zpc3hyFPK82emjQXHlBf/laapLaEfTCjGRw/OOx44T47Ll4?=
 =?us-ascii?Q?BuZKsrETyjbEnSXPb8SQDQBXIeI1TV00yPL6DP9pA8k8eeJUdmrC1xBZGgqb?=
 =?us-ascii?Q?hGHDVzQ7yXqH0t60xotyMGdVSkWcUI6U7TfzvcEWovs72B58bmQy2uN5n2x2?=
 =?us-ascii?Q?in0JA91XzOFphAtWN/A9tCMNNjLn2RCM79JxH0vX/g8YVj4Et7V+VxcxJtqZ?=
 =?us-ascii?Q?8X+UD9lqSgZLXlaP8yiAcy7Cro0qy+WFS2qNAxqFEQ61e+Ro8rwY2gzSFeti?=
 =?us-ascii?Q?VIK7Og4OxRjAz50v0XclWV8mTau0HscM8cJKoIfHuBgheKwsedl+HPxFPk8N?=
 =?us-ascii?Q?YUseCBd2YKlSk8qljq0O3uu8W4uqnb/09mR+csBTpnG29ASNp7cxM46gc8an?=
 =?us-ascii?Q?Y2c3+G0HTNOZ0HvxhNHbqW8p+drovI4H8NgdsLnlrXoZVZ2fbz+7XHZHRecp?=
 =?us-ascii?Q?n3ZSwGOnMRuqvRrCFfAuQB0RjCrrzjVCqLbRPARs5GK/oTyLH9PlteXltzPG?=
 =?us-ascii?Q?FbVSa3CmZsibL6YiB0HQIaLOCpaTn9PbP8SWXYR/GFSii5M3QaZM0MrL837F?=
 =?us-ascii?Q?mc4EBD2EbZXLOIdKGQoPQyw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7620a32-0788-40af-04f2-08dd56060029
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:32.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3X68p4XwchBh09opIfHCwjlrkvvVthVKCIp9CEQUoeQoEJjv7xPk568iIZiNr427G7ctsKCUiZl6J7K9m491Fa1qxCGdJDp5lIkcuePoyMvABWPT6RlY5QSkJGm5ePpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/madera.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index a840a2eb92b9..b0b5973509e4 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -2776,7 +2776,7 @@ static int madera_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) !=
-		    SND_SOC_DAIFMT_CBM_CFM) {
+		    SND_SOC_DAIFMT_CBP_CFP) {
 			madera_aif_err(dai, "DSP_B not valid in slave mode\n");
 			return -EINVAL;
 		}
@@ -2787,7 +2787,7 @@ static int madera_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) !=
-		    SND_SOC_DAIFMT_CBM_CFM) {
+		    SND_SOC_DAIFMT_CBP_CFP) {
 			madera_aif_err(dai, "LEFT_J not valid in slave mode\n");
 			return -EINVAL;
 		}
@@ -2800,15 +2800,15 @@ static int madera_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		lrclk |= MADERA_AIF1TX_LRCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		bclk |= MADERA_AIF1_BCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		bclk |= MADERA_AIF1_BCLK_MSTR;
 		lrclk |= MADERA_AIF1TX_LRCLK_MSTR;
 		break;
-- 
2.43.0

