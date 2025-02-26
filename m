Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B119994F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533955; cv=fail; b=JShf/5XUBfdL7Cy91AdUfxnf+kaKXSoqlzEePQ+f7W6C/pV65VImHCDTRF5ZZJKqN4ODrPdAp+SMKk/wnEqswK/lXC1FkCiGHsAZyGohNXf+6T+e0IRYAdNW+5PZK5bgVuXrex1WnJaPjwj69b6sQUI9970GLPYSy4zItCqyo/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533955; c=relaxed/simple;
	bh=miH4HbVu4meBw5UIuZzGlciECsBofnFrpdp52KIsqls=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ht/wnkOIXRNaov3ZnHsrtZrDRpTluvH9g56N7pEMSjb2Aoczee+lciI+bpaGIl0QVXwkMzjb7VXmSNGA3Wq+c9HFKkD+RQCN0baGAvfI/odurSekZDN1RlGEbe/PysnWubgCxxaFosfS05Ef4muKU9S3ZHQ9W9uSlF0e2qYu/+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CVPkcN6h; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CVPkcN6h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN+2GYZ/BkFJo4UBsZGGOf/uzQNNFmiPvUqKrc/H0xbJXSemuo6AElITROzQjR4oTRGe1Ds8vr2xZSNKVX9byqi+OsJJ1R8N1b9h5XgiuqXEIjs8Xw8RbVYwh2mR9Q3GL6Xu3e5pFBvUz9uQ7NjmqOIbm0JndpjNgQ+g9wJs/Xya/dmAMwDfWBGYkWZXzkDAEajEuLkHzq2OwV/FNDSi+NPmuo8aOdr5CahZRRA6SZtifQahAlSX3BF/zk1gWu+gZrGRN37ZJxW+y//fRtHxDKr5mpwxg9RZLx6G9oNjIfXL7zyQne1UpO7MjGQD6qXdAgPp/AO3mj3fIUnT+KAoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki2HBbBDbbTpdjN0ItbaGqBS8QKTfwtqS2/jh4iYF9k=;
 b=R4hWChW/4dGE0Qxuf1Ovc7FnLLTMoDwgOmnLjNMWDxIOT9KavS2xON+WjD4tuhIwqcRH2YStBFYGD275RK9z/XPwIklgSWJr5TjkoFeCrSxQCxi1jy4FtMWu8GbXB8a2Jm3crCDo8NsqNqfhZvystuH5EeF8Z4uur+UcAGafaSkCzt1oLHoacDT66Gj9M2eXd96Jv03IAJIkFRyQP+YyUKmzYjMqm91G45TCZrIoxpti42LLt7yhUrc1vH1ewCl2fHcyUkWbkiOZl3U5iTbWaPBSwqtjCc5K3Py/mgQfRXHvuzPCKAXaSJbZ3TK3NhiCcqPvE83N8v9aOvlgjYIyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki2HBbBDbbTpdjN0ItbaGqBS8QKTfwtqS2/jh4iYF9k=;
 b=CVPkcN6h9h3Wr+zDT6xqRaItmXFj1rTUJLWVSq0qpzR8HSX8Vgk0zrxbItbplBu6MTXd0oUDpuNw3b4DOuJHIBtEhV1JHOvhnK7Q1dArK9cWJujwDcN7XtLCVQhVeU+PsnEEFt68EK8mrn8jvZPAsNAw4ckKiUXtPuKz0YVvfFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:12 +0000
Message-ID: <87ldtt8oxs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 146/157] ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:12 +0000
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ee31d4-a67a-4fa5-375b-08dd56065f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oGwx/LGAUJXDS2tzdWYOtmNAeqUBV4yFwD4JzEnPXZdEqYWXJx/l31NmM1KK?=
 =?us-ascii?Q?OrD0eS6P3ZV+ZxKXJFxay01BscKuDLHgntQ6WJGjeaPCRfJjKGiyjC9SyMr6?=
 =?us-ascii?Q?tm0R/uzEC26ez+lg1XDTmuQlhJ4DZrtWQujeMUzE8c6WK5JcNHBvWIomd3Jd?=
 =?us-ascii?Q?g7sMzzL7WEj5XmEZixH/nF0zflOJdZoPwtkUS6gkZvftXOUaD/5BSqVg7m/t?=
 =?us-ascii?Q?Mr80HT32qW8i1JFmSaNwIIZcFkLl7o6ciL9LdCFVktGhaKJiAN74FRvXkbES?=
 =?us-ascii?Q?G6OAg4loEzWy04cPBBWXAjn9pQF7VqQ9Zo+wx6FIHYnu3tKt8WMHLwaBwwwD?=
 =?us-ascii?Q?fxJaHtr74Va2mpNFpmg78QnraZw8Cn6GvMRcvl6YBXEdKwKkQOYOWE6HLtiz?=
 =?us-ascii?Q?xFlPoc13ray10RucyH2Hx+E3vtpARGLvuNJ0l9W/YFz08T/bdZ2PZD/+5TI1?=
 =?us-ascii?Q?iSoe18m2Is1F3gCtDgAzZgiqB1FHHGKDC+DZ6E9X98La4CAwivYu0jM+6/Z3?=
 =?us-ascii?Q?8pRygiciHwhW4Dkwv8+AVZXYwYpKG0D6+kvSPCrkvNoh1bjFBmi9KsUBCGrQ?=
 =?us-ascii?Q?7Yru3AggNGQ0gp8N+qApbKcaorAap4BR6t1BM41p4Qhbb1zIgGxPimFFw2py?=
 =?us-ascii?Q?Hmnad1xY5WgywLaXZQYX0HLc44MnKfpBSTbbbXhTW8woFGjNN20/ZMuFrSTM?=
 =?us-ascii?Q?/aa3CnWWFiYTWlASJiriobzdK3acIYGTdbIM8pLkNHJSPP52liIeZaHsx5eG?=
 =?us-ascii?Q?PWCK4q32rwEEAiUUGEhWF5+MCcWgGznXdyOq7uMybx+9muu5ESwdHhqg+9ms?=
 =?us-ascii?Q?XdG0Nqgf3LEFsiLift/CF8lrFbT9qrJY895Boy+2ww8uMYa0TMttsLDFPxZ/?=
 =?us-ascii?Q?FiynpSMjIJt851p5Q9XwW24HijpGRX2B+gq31q919kW4QMbubj0+5yzXk7ZS?=
 =?us-ascii?Q?hIuoUJdMaJoXotRRvWKDO2Mnqx65/mkNnIZ8H52ILGW30QRkaqg/xbD8DfKv?=
 =?us-ascii?Q?shudZdNunE08ulf//0YzkyfLnlQIjKppsO7z1kahYHxC9gLgczHyFd5DJRVG?=
 =?us-ascii?Q?fImi5hNG69R9WJTN3RAwkiAKzI3uGhhpqgxd6JDnbJf5TYTY/mtbzgrBh81q?=
 =?us-ascii?Q?3tzKzZ45sWhURi4+1VoHh6Gn6UWK/B3wH7B2YIztCQRRteXsTZYWilVmv90f?=
 =?us-ascii?Q?2SxvIcWgIL4n0hGz3aL92ViV00Tj+bzsO3Kq24Zc9OuwOBKsJB/sPbCrkKjk?=
 =?us-ascii?Q?H+V2g3qF3nz4aOLvfkZYUjwE8TVuZCZo5X7Mh3oyzNesMZc6WNGKXncHSBjv?=
 =?us-ascii?Q?WO2s6gVk4h5QK81Bi/FC7M5LT5XdnT5hANNs/avoFCk6kB8O7AtiCYYozben?=
 =?us-ascii?Q?14dsROk1ocLxNfWA7mPTlFp09IfxaQJkKLyWHMN2G6+dEe8cyURJLnqK9hLV?=
 =?us-ascii?Q?Qh8zpfioNL1H05kLKN+anE6wRn0IxlXt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWCMlVEkLjjuHIGEInaJsxMnfxMGVGN4Pv8w+dIeESoRLX3cuvz12ntiw3CB?=
 =?us-ascii?Q?6cosz9C/GFLhLhWNtr9CULwI11+NhSvfCXwJLVhh8waj2Zv2K7xJ3lnLWgRB?=
 =?us-ascii?Q?pHA+k71QuqBST1n19MLImLUgP55gymZ0sKAQCrnf6VZT4JhM/IGvtv7zIQxE?=
 =?us-ascii?Q?LXPlzHTR5Mh+O2fjpmKqKD8pgDQ3BxMhOdmEy2BzfwQwWXY687YHw5nND2SL?=
 =?us-ascii?Q?AfJlhJxrhpVD/5u+npdOMZ7zIDNWxjBT8zz6knC1H2clRV1AbkbnKA0S+ao6?=
 =?us-ascii?Q?Eu+SJchA9XR7YMc6CI+E9oMLmZnoBuv8mP/WZwUOafBOUPPpMZK+ihzpelKq?=
 =?us-ascii?Q?yfH3PbyXUFDKZd4qvYhSoTJ9b6cVAvc1xc+apabnlKo3A+MkevJKcYFFnTCW?=
 =?us-ascii?Q?0I8ZO8pWl3O/uqFu+zpzKEQ2PkZYIcyhZ0bg5LXjyGxSStpiswRnJ7wXa6h9?=
 =?us-ascii?Q?R2ejY5D1FJVAsf7FWlWZ+0tkXsEEBGbw9+hnz/66MKUi6uUnDS5i4/8f0+ig?=
 =?us-ascii?Q?C+sr6Vttol0BMKa9LIJThIwEIeDMUUnaS/lcA9oYaP17GUcwFkIh0rWJBApJ?=
 =?us-ascii?Q?dbpqNHHmXvxhAZDK00DUMzwdgLfx+eZ3vDYKxpGhLi7PzhhlfoXevJXXGwEn?=
 =?us-ascii?Q?Wmgk2GkjT1x9I3NPblSQzk1XvBLe1j1V8iE3iM8q3b95+/d0886D4R7jxSMy?=
 =?us-ascii?Q?fVP0dVG3tnmRi9GLx6gNw8XHq3s4D3qawjHKn6vN4Ug1Si9o72qk6+imqmp0?=
 =?us-ascii?Q?2DIaAVi/pHGSooA+S0MiMdzjKKjG9FAGNUuvelqrLDTAOGr+F1iqrg5PsT5U?=
 =?us-ascii?Q?sCKY5DRY4AUzIE3GMcy+ADKcl4wP4gWMoFbNL9zN15jsbnBMal/+t7AmplEz?=
 =?us-ascii?Q?kOa2F2Odrpe6lfYjoxez47S+2Bj3HRWAX/f4gz39kefQ+y/3KyHdDLzBfRTX?=
 =?us-ascii?Q?NXPeRci1Md7Vqe9IJ/i2c/W7DJT6N+/P2swD88r/hl45wPxuPVVXr8tvNd6B?=
 =?us-ascii?Q?DUr/ymR6ijKp/3O3jXzXqPuc5pMRlQSWZPR8WzIt5F72bZNqvEqgbPOpC/u7?=
 =?us-ascii?Q?1DaU6Z9p6Hra28PkcyrzL/+aMs1fKx3B8XJQLfqoHIiT8EiuOLhPMshy2aGz?=
 =?us-ascii?Q?yL30FFPYDqhwxtciv7Ie59oylz7k4x9A5br2f3BgOrND3SDF8rI7/OU55AP4?=
 =?us-ascii?Q?j6grKsHkDcBBLrjDAISO0ARHJtUCF+KidsG2MrCWhvJKe7Cd4mtq9mzv0lIl?=
 =?us-ascii?Q?DOwYaeMGa0nNRmW0M2nG/MUweeUM8EYrr4wCKgwaVQH0vAuDtO4JcN04zHSh?=
 =?us-ascii?Q?GC8VW2S7XdgsBDX+OYJfZIQ5dNpvcRfHfwZnspWbyl6JnweHrEm84Qxj/tlt?=
 =?us-ascii?Q?R2pl7TF+WNqSJ6X0UCHUklu1uZbJ5RcJw5SmuNa02BXgrXdGPxc78f/HgX4j?=
 =?us-ascii?Q?Okjv2FIZyvYF09w/c7w+3NCUJgkEYKyql29TdLv7sS7eXIj20yJWZj129aPk?=
 =?us-ascii?Q?VqcJlkpiLGyqC+ardSPUtZ14f9rhv4TsNQxn6pJ7eurgHPTZL1ESMsk+ZojX?=
 =?us-ascii?Q?RXflt+zHy7GCk1anJMY0IwVpw82i+7VP5Suupf8H3GMJmU4LtT2GONTrfyQ6?=
 =?us-ascii?Q?ztuaadQcET221HMYPRslWxg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ee31d4-a67a-4fa5-375b-08dd56065f0f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:12.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9rbxYuHKuFeRC/bATP7Z0ECRdi68GPnasAuXwTGQIMnf79lGU/ZQquxAOUG1H6m9AlrTP2udQLshH/e3VWhkaOvE9hT7PenehC3d1BZrL3mZ5VBt4zLt1rvpZVlwswe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 6267c8554c15..497a9043be7b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
@@ -783,7 +783,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 			    strcmp(dai_link->name, "I2S3") == 0)
 				dai_link->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 						    SND_SOC_DAIFMT_NB_NF |
-						    SND_SOC_DAIFMT_CBM_CFM;
+						    SND_SOC_DAIFMT_CBP_CFP;
 		}
 
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
-- 
2.43.0

