Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB33563FE;
	Wed, 11 Feb 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802468; cv=fail; b=Z0JL2PYX3ecU7uFa8DSfxMaLFo8gbVHGNQP5qx6FN/aZV0GiVxpuXlzLqKBuZcC8KZj5DcWRg6aLVjHOIAfarir4wNCT5+ySomoLIyKbvuIC8KJkhnvZkfKIIggLbe24qTz2keC9nkYKVFy0b0EQ3E3LH12I5eBXwqCYU0ENd6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802468; c=relaxed/simple;
	bh=pypZT/H8AZyZ4gX5viKqG9VgiIwi06hRI4XkJxjPe5A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tmzEo+JO3MZucVBe6mVXekI9SfJryL20SxcTWSpEMjgWSxCQs8JbOkENW5KWLXunnUzQUXrbkXD/gBVA4fNSvlmlFHlrSQ6SCv4XEibkqltTHWSXGxDHWlHLEaJPULh0Xc2isGoyRMDV15fPSF0o1E/QbBdj/jpbwEB+nYEwsVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WzJtS6/h; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WzJtS6/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fe6x967dgsgpLp21AF2Ucj+nEd0Doh4GFI9Eyur49yM+Id+r9aAilkAr9/+GEkFjSxJ7bwl0r0GjKEzuITIJvtIDVgA+EEU7LOueAW1cr1YydInxEsoWzHuloaD4/dh77DLGmYrxiE2S0fJK1InZBMGEJrrGUpgaFqB7ttQZ0NzJM2oCYsXeqZOtC1STLRFDkcyU1SpEQOvwEBSg3f/z/fxHlNAhcFpIZ+UoDQMjtJnCuXgj2kI+Q36S/40jjPT1/hwTwt+qzt+kJa6itVKLC1wMZmJcnEr1Aaxn1qRAqabTDlOSdm4BZ28pB+PCeE82tRMiPVV2OinIr8qva+9bSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbmDglBkeDMS3KAVj2D/5eHa1uZAW+FFF8V1sYr/Zuo=;
 b=fBRQ2olSZoIk47RNhlibyysCmLcQEdhaMXzoM8WmTybB5hN7qsNxplW1e/kbXqzowXjxg6CFXWi/p0pQgmYbHAo4vO+3aRb3AY5uVyEUOVX7Ua7Jxlvm6c6t7KR3c3/Pa5v1qewzsCYQCrLrugtC7Ft1P8hONDaFI1dicDcYEFZuZeJ/5cD7jHzULtuFsdh+Uc/6qjMdn3LuRVCoOQcHxGzHavEvShFysd4qJKm8HrinKuzStRmGe24sbpzMOw+c4azbIJYQjmqlZpUoZq8zV6ChpR1WhKv9BPae02antQNRLyCg7ofU/U9fEY2Zdhy1zVIFtn/g6iq8kAkkO7b2eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbmDglBkeDMS3KAVj2D/5eHa1uZAW+FFF8V1sYr/Zuo=;
 b=WzJtS6/h9W4AWSwF8vOM0HBqGCt7+NOfZfnynko6Mjs+Khaa1YE0foqgLtJAp8SGJw6cB/mQKCrVoy1DQNw1kYXzPuWvknANrFIrbqtq4kfA8Tv1Y1CFtYoSbnQkpQsQRy/mLr3HmrtWwMamH6zNrobC3cEly+VbzkhKEgOW61UwUYLCnP7lJOvpAHNH+hXDhXOqu2mB6joRnrTX08S/vFOqdnpXv93yIt+6/EcXtTubJ+BkvYi7fL5k46gDVnlUVeItexOyfmIjn/JZpMkCv9eGFTlL/JOfTEppjLX/aljqtRYTG8lNZ3LO5eiyPSeKJw9EJ6ACOMF9nfQ/rmPj2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:34:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 09:34:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH 3/3] ASoC: ak5558: Fix the supply names
Date: Wed, 11 Feb 2026 17:35:27 +0800
Message-Id: <20260211093527.2892297-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: eff53a77-0a7f-4028-ca24-08de6950bdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BsspN0KEPZTscoNCuEqv5vu0xgU7TFZw0feBdjbO2fEz/Qad+ZKzKBlPNpZc?=
 =?us-ascii?Q?18B6XxDe4wjc+DDOzY8h6cyorML3ylMfYsWa6kTDIxyld69V2Oae9KusFhBs?=
 =?us-ascii?Q?+HWwnlCD0B3Vb0Wb/eF/8dRhijqmzPBXcPmPHLCSn3dyptouWY80BdT9Srx1?=
 =?us-ascii?Q?Krc25WIEJe3Uw1ranTOswzODaG0houLGa5MAmxp+Y5Up6MtiKTMz/ezPYuzC?=
 =?us-ascii?Q?WET6OgeGuK+Le6UL5go6yQs+koHCPuUyy+tBRyQqkCWfAHD7By1JQNG4V6Ux?=
 =?us-ascii?Q?WG+qDN+pbz1jitM2x7cCeATkHlspaCy+or4YCSttM+r9KUrlZC5Z57WF0Zlv?=
 =?us-ascii?Q?NG1wFy/wt9NLpca90rx8IYeVrH7oFq8Ve2CJw+SbPtlLg/fJQ5arlu7YvoGy?=
 =?us-ascii?Q?FtUkfICfld1JGyJlCMaKtT3/M8w76S5xcn5PFD1El342N0PSNUW1kp8D8yBL?=
 =?us-ascii?Q?tobMgSRPwxOMiICYbRfgD9+jJSC9ojNtq9v4qiYR3ScWBG1FmFpHbPr919B3?=
 =?us-ascii?Q?UyyM9fmibLRpB9nmkUjgNtTvyheeasjs/UrGiGR6Bp5b6nAAEbyCUn8w8ric?=
 =?us-ascii?Q?T5D47d/2JIW79HFoARRVuccpi/bGn8PkmpHkpJax1WbRtk/VcrwhB4+7AUq9?=
 =?us-ascii?Q?Mza6kE2xBfyP2QJo4xXoeMKOe2uji7pFLssBH9ZV288jeR7GXtvjP8FRVMGt?=
 =?us-ascii?Q?M6Hi6jbZtDEvZc+ePfbovTfFpXwnCrcG9XJ6ew1CO7gaAHh/y8XFlhfJpn7V?=
 =?us-ascii?Q?dD6c4nxHUNHVAMgufdxdl9Cze1imMPKCOCTRdf5BdvCRUqk7BLQUltHEvq7f?=
 =?us-ascii?Q?hfqZKnVtqagqGkY0vtOa2PI5K6UPWQlxi1O13YeAYsYPX0LiJh8LgHNDjKch?=
 =?us-ascii?Q?oWYHfSIsbG5wM0U3keWQG8auCg1aVw61Ww6BbIvZ3XtolYmNGN27Fh5oc5Dw?=
 =?us-ascii?Q?u1nGpPcvX1Q8dR+ITkoTZcVnl2BkR/X/6adR8ypjClx3vvUkBEApMqTkbgxM?=
 =?us-ascii?Q?7CXtN0hLE+TKDOUhkcStn3PhtE87lIE8+KF/fXCw4apT+OJc4mqLvKBulMnj?=
 =?us-ascii?Q?Ql269c1nWR4mgrHW9j7Mp0RilDN0spR0l2m1S2JEcqWQ/bu+H1lFljIpsvcp?=
 =?us-ascii?Q?K7EPLTqTtK+XqwNtzc3E3Yryu2sFUnX8O4fOKaHieTxjSTDn6vFsdyCtOMeF?=
 =?us-ascii?Q?vkBrstfJAw+y0l+GBhXcWnMvYbfHXaAmL+NQwom/tZ0MHzlt5l9iROdi/ygY?=
 =?us-ascii?Q?sNnD7SavKHihhzEO7PrPVDxWi6rwS3FAo4GNHEqKNMvn2Qz7OBp7yfnkjEz+?=
 =?us-ascii?Q?Zkndocj2OhrqggJfsKFsJqflz2XMdmcnKhlqMS9yS0RRDBbLFOS/041AtQTZ?=
 =?us-ascii?Q?/syGm3G4/R0lk0p0XSbSCmWmP+uHZNbfqIV/DsTkdWODM1eVmDYwxwCymeOl?=
 =?us-ascii?Q?t/Mc0DeVplzmzx0kh/jXXfsvtrvCrp2T4A3Vz91p33smy2MD4l6o+uZEd6Oo?=
 =?us-ascii?Q?66oW6w3mY1E2tVOBZ2xQ5dEyPOpppUEcjnaGP42jMFB9zSADAKWkXbS0QyPq?=
 =?us-ascii?Q?ExdBxd0mH1gS5oaz+w0PZ6/y7IAISdgQbN4x7SxQHnrcJI9bLINrcdklVh/7?=
 =?us-ascii?Q?qvsSqaJXkUVSYFwkvb4pdL5w1u5EVFyN+WBZm3X7ZUZK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dIMGed2S5T+z1fROBVEUq1pFTIa4OonidgaUg6DpwrRvBZ6a55JPlU026dPe?=
 =?us-ascii?Q?GOeha9izp+cNHjC1skL0k7MQMI0V6787hlZCo1YA8cz7GgJ9qNi+A0VAp/yW?=
 =?us-ascii?Q?Rvq7ozytXOuI9NuGZERSZ/u4Of+M5zrZ4kGA9x2yQBvzgoa2T0RTraoq8nsT?=
 =?us-ascii?Q?7W4aDaEt0ETHk56ya4Tfq6qfiBkm4BqsnUloN0KdXKrVCuAjqfYUbdYRazlU?=
 =?us-ascii?Q?GLE1l/wvwLmsya032Ji6V9kf3HMdv/vaHiA5Bz5NPhKwsSV5wc2CSiybVjXB?=
 =?us-ascii?Q?myHMugxtpuFzQ87HK4KcPaQNYHUIVaVx2fvu20p0ziopZzbUFatf55yzt9pG?=
 =?us-ascii?Q?QoO4G99hERu95rfifpj/WXxTDKAuYIzs5PfVDQJrxNIhq5z+WE78pvh/9NOc?=
 =?us-ascii?Q?wbPq8dOdN1Nt40Cz4NDqfcN0gl5RjsYt+o7CQTKg6ZaPJedXnqApjKhUsz6Q?=
 =?us-ascii?Q?H3No3iTXz9BmEvJyqZahOLQJ0qAAbdQjKui5GFtOQ6Mp6LRtlURmD5X5S3nC?=
 =?us-ascii?Q?xiaiS83bLhf82Zf/pv8By2MVwQ7B+v1aDa92Qdvm1KlmnUJuxsjabS65pA1Y?=
 =?us-ascii?Q?D2BMimX/jyYcLaxSjDNQV+aZaqkhZgvx+By2UpHn62Uo5rzQCZN4oSeLQI3w?=
 =?us-ascii?Q?K6RG2rEHTLojBd4W7/odGTCAhu0m3OSMHe/T6zyWZwBvt9lovvrME1H256Bl?=
 =?us-ascii?Q?H7f1IvtcOBEHqC8/Ef5jEUYC/aZxye00vLdh3f3uGUmXvCQEFBBrXVfwW0G3?=
 =?us-ascii?Q?3ta0h/FnO5btskdBtpH2yEr2LOT0LgjQUmYNcVKXvBauAI5b7c7npKzFN9ky?=
 =?us-ascii?Q?KyGN4+dDyftIftNXDijYxYXLnW+xXkCWeO7Vg7T4hmvCN2awbcuLZAtfcQ9V?=
 =?us-ascii?Q?MEu2WSrZ+RLS4bBDHrkBoVH7/HkfyyKhqRmQW6Yokc0JR5ogiBjfg93ima/r?=
 =?us-ascii?Q?i9iijdHOYkeD2YVfLs5RR5ym0fuCLI8JPgTsJeDjb03T832ao+yuHWxK+m2Q?=
 =?us-ascii?Q?n9vHtNKG8likU9/02cMadQyGI2Ok/sRTTJEzYNPLnfWSSl8H5M2HikUdgCNW?=
 =?us-ascii?Q?VGOZEUARbreOzY9MM34aVT+rp+4LCGkGzvQ8S9OpSJbZBF/OQs2oAnFQQF2v?=
 =?us-ascii?Q?jP1PYdi5+kv0IK7M3V4rSHDojEGOffEUjoUnfxHoiy7t5kr4S8hA9wddKTqo?=
 =?us-ascii?Q?/cwYuMJEPP1wUd3GJiplS0CLDGc4OOCsaYY7PpiM+h1+lTk/Urwf0oAozbbX?=
 =?us-ascii?Q?qr6bvI0DQuq06rsxIV4xkU7fGK5zfWZc1NRj3RQxV/KeI1q1iwlLA1IgwZ9h?=
 =?us-ascii?Q?xgm5XJApzikCmqnVyOC9SfFewISBvFreiNh5OoZHYNsmZxapS74bXiTk69qo?=
 =?us-ascii?Q?fjO6FYMFYGR+jzlb3PhZINxZyzJyY+fqFyxJ27GKmKvieYZKiAOCO1+gkLxN?=
 =?us-ascii?Q?LaF/dQ49cx9n+oq2GLbBFpZnaHCgNxsQ8kLk4ML9SArXaL6RRtsX7tQCJ8oB?=
 =?us-ascii?Q?GxHsq8q1RC+R+G07YpA7ga4oI+c4J4HEnwxkrd0gbWhd8on65bDmBdTlaq7j?=
 =?us-ascii?Q?89L53Rw4ujQ+FKtMxGFlOqOJ6VsA+ksqocOvOU07CKSE0ujFQgGyL8uTxxUH?=
 =?us-ascii?Q?hBsmQEi7NB0HZg1cF18ggaT9BtXUDhxedUtCEQX9jgKngGW6Gz78cSdQYk1K?=
 =?us-ascii?Q?sNC8SK9IvoNpf/qhHFf6utC9R5i5yOsS9qLbOMPbbcxvOVXxiWws0UJYgGFO?=
 =?us-ascii?Q?ePz8d7kCVw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff53a77-0a7f-4028-ca24-08de6950bdfc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:34:24.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMdCrJeZU6vTtcSgzd9aOBnR2CT2Qus9w8jm6WUjrUVFkXerHQ40W2mmVtilUZlAhQwUZBjkKisXlW7MzS2WmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219

According to the binding document, the supply name characters are
lowercase.

Fixes: 2ff6d5a108c6 ("ASoC: ak5558: Add regulator support")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak5558.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 73684fc5beb1..48a690d81047 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -31,8 +31,8 @@ enum ak555x_type {
 
 #define AK5558_NUM_SUPPLIES 2
 static const char *ak5558_supply_names[AK5558_NUM_SUPPLIES] = {
-	"DVDD",
-	"AVDD",
+	"dvdd",
+	"avdd",
 };
 
 /* AK5558 Codec Private Data */
-- 
2.34.1

