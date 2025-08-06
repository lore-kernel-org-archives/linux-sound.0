Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0437A26A1C1
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754523302; cv=fail; b=gOi4Vv0lj2VUeHD8in5mDYvPEMcdN9NjaXcHZIAZd8biz6VJwh+p832OEnRg9nFhhe+5s447WleuqQHWfIw38TAhRc3Ta9kSm11OZSFGls/WGcuS6uk0BJs4Hb9vMXqvrkQCvHvU8XZPFbnM0GwdQiQj1oJrPDzC/7ircw/ar9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754523302; c=relaxed/simple;
	bh=15MHDoU2Xk8oTCzPGQsHIvInzZRZ2gU0mKWMPw8P1eY=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=pO329yivzMBN85ny4rXJcDzLo2n4lLQFuVOueIYpSXXADWXIez2V2w/ylaFxptVvSQ8PkwJFSl8x3kuj8wx6yyepzBIXtuU8b0yKVSGv5e04u/xZgSxywyCa2PYgqiGlTuPzAp6+9d/yEwkmLetx/zi/5f3UXFvtNdPi7QLaafo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=enOWaJmv; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="enOWaJmv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG0zaSig4nbtMzjloxYXzTye3UNmGZyGUgFzXXchDV29/NRLcJN8mhl5NMVIrsViKz/I0BR5qQzQTyKjJpnx1L6Bnw7PDF6CYiC219w6r0uMhqmxOTnGAytnQ2o2f3mO6Jrp7odQ6VZgzvx7/4da8OQ1ZwAcijZXTKVJ2ZWiGl05wCxc2aXRPNWExsdmP2riBaKWMwvp3FiFfQniLyRoJQOpHjRhJ6mGW0P5qqbd8OOwcwHkwn1oxPLJMqnTxwM9U070BoyDmHHSN+yX9AoIdpOibcbLvuRQWguxF6C+ucLwkAeivwbxNFNYzvkSkyFW5rzH5uN345neSTX67rY8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCu6/iDTsu3/8uCvH8kdC2VWLntn/Vh+4RBMG+9AgFQ=;
 b=OQIVr8xZtIp/yDqT71e8dl9XkFKR4l740UGM7NQfubB9X1NcuptfcCaPEjvtgY/YaMD8iBCcKY5Kh+p1L82juWs5dII+xQICjDNIUcUDlvsZxxbkK4+rjGzs+x80glAOZbaH76W4fIFov/Ffh0+N4TRXQqBe+5984/Ib+kefzFjAbC5Hp+irZudwivcrB/vQ/9vp/XNiOyEbGdVoyBbZDFwx9O1L5+yHcetqsJ9rJVdUdpGwWTu1oL03Kr1AJqnRed5PyAQNLyVMdUTlzRAIQE6urAo5XD8oCk37n+K071nrzQzeAUhSmpt7gfmDr6xDNobhzIRqvaKqsl7sapVVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCu6/iDTsu3/8uCvH8kdC2VWLntn/Vh+4RBMG+9AgFQ=;
 b=enOWaJmv+Y85ZiVsF/uK2A0A7RHbal9/VpXxGraXY96pH1Jhu0krmERUx/8Gthlp3+xt4ZeD47wIqi4HBOP5KkPjN4Z5fxwWKsE3wDREHxr0eRvOULWf1KRpOZdvdPMELiPhXk8rnG6dFvvZ5bdQuiJnRZjZWFJ8V7h11zEfb4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13822.jpnprd01.prod.outlook.com
 (2603:1096:405:1fc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:34:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:34:52 +0000
Message-ID: <87v7n0c9d0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: generic: tidyup standardized ASoC menu for generic
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:34:52 +0000
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13822:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b08846-bd2b-4807-fead-08ddd541d772
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r5O1+1fCFIxaJCdjOLv+upLp7OR9FHccJEvOWaw+RENT8x5oPrVBbxx/QfXg?=
 =?us-ascii?Q?a5L/MYs8B/EzY5cqqRh47mU09FJWBAhtB0qg7+7OCWHLOcdAJbDxv2WJKjT0?=
 =?us-ascii?Q?0v/Y4O4jBUMDJCcUHcUdgCcGkVwces3A6JKKvJVaEEBUkCfzszC/ZDEqXEv7?=
 =?us-ascii?Q?4RT1DjDiQESnDIBHuuw6Veu0A23RZtYQ2p72Jdkqd5mOnRyus5jiBSzrhj/C?=
 =?us-ascii?Q?L1/5gBpgrqw5o9+yqGCBPkzGkCT6KA/YL4KZctiUYZb45oiABjIfR0aIJuPm?=
 =?us-ascii?Q?EZNb9Z4ZwVTs0EzI/gIA4eAhMmiTzwMmlj/VhH7JHO3zMDflINqqN+igbget?=
 =?us-ascii?Q?L9XB9WSQnRcyrgShH36AkwZbDN5wzF8JoYTji79eSYBP+v4WLRPbeZkpETYb?=
 =?us-ascii?Q?gOqq25V3eyedsubwPtmhv49uFwvnjn66hl3KP7Y9TFvoIEj8bLkNfaSOD2fD?=
 =?us-ascii?Q?e2Q0NM6zI4OJeLZbD8xefHZd9qdOhNisrN2ap1xoPTZ+CRlpWXaz6sDEe2EQ?=
 =?us-ascii?Q?D/frZ4vjm+SxRBi3oSGVTtwnMVddLgMvd771NEUx8SBFY+T1YFcHwFsbQdrc?=
 =?us-ascii?Q?T+UVcGG3ajokY2jJjo40yUOQK9WHswAGeLr0Z+hV9fIzpk4KeaxG/FhqJZcs?=
 =?us-ascii?Q?SM8nJ2DZ/GO1EjsV1oDeyusPvDN+TbnESHduNsO+IMNju7d52Gkm6JjJJMvW?=
 =?us-ascii?Q?qX6jrT3ZJsGUTbae/sv+cZlkSRaoc8+9ySTBk/bKmSNCA6xMV5r820gewCFd?=
 =?us-ascii?Q?cb/DYNioq6OoDZAmKKlclf7vNbcdTiQt76z2zK2tyJxwaLeuTxt2XSNQARm0?=
 =?us-ascii?Q?+rVUsx+FoEP74V9vy+FIMDN9c/ViYzmsyFPhXHNkmlJDbazFq1ODV95atB99?=
 =?us-ascii?Q?NMHAvi7W5c3OmLB2syCvqaIGbnt2Lvkqh2gkqGnN9cfnpxauLgMP73ucRQ7d?=
 =?us-ascii?Q?/DutrMmEbk4WJudvXi9f4Lemd7EZuZHrWThmJ/VzmTRtLltLdLSRCjehNJci?=
 =?us-ascii?Q?2tsOwjpgmoM6VVaY1GhQ4tsNJ7D/DhHGCgSfp2567f7Ag3tAQ5miPd/QyuEP?=
 =?us-ascii?Q?XWuj7uHndsEC6QJDDZG5E4KyPQKHswGLz+9OVfaf/6qBAhkvvhTphmKk1FQs?=
 =?us-ascii?Q?Z6sYXmbLQTvtRZ2n3M4ms8kc59jECvtWzb3abeiL7Loqlhw4TTLfTd+ZG+uw?=
 =?us-ascii?Q?70h2nlA1WZ/sInuz/ExVwS0YwLT7R2RW5QeBT9jQvbjRfcuPj1/I6nBCLin3?=
 =?us-ascii?Q?nPC4E83LWTjLycnc1W7uOmbLOS2/LUi8LpbfjzDa7UXLg1C/t8Lhwa1KXSUI?=
 =?us-ascii?Q?rrcT+hScaroysB2M/QOzcriMSQi+VBu2r/ClHlEo3LS8wTekqOD/BjoDB0bn?=
 =?us-ascii?Q?B9ov9z+ESo0ojjs/p+BDktNu55BklPTRPozg/LGKVJ2e58sywNcvRylH4U/I?=
 =?us-ascii?Q?/h+5KDLR6z2WQK43FWXFZv5FPdOdDsfsHYOUcSI+Pf8EU5C0byEk0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W45FiUidnePRBpfdWcC+BR1gwdYc8VriEPMY6v9d6TOKvCLdi0eKmFaTvzFc?=
 =?us-ascii?Q?qik3KeSL0NgYziorn8BZFN0WHwNskZW2vNZ90Bq3grShK+6THjWMo5J15Syl?=
 =?us-ascii?Q?Lg6VKRTQRxK1jOgmhqniYJsNwcjCgxNh0gwt2HztAvAZycC9i6HDhwkpiO7H?=
 =?us-ascii?Q?WXUgyzUF6UJDtbGvpv16mIoq1KO2wUk8akbIMTIXfNW4+YRZpugmWjMFB499?=
 =?us-ascii?Q?RY7T6jxs04X/a3GBhPAxZher3CmIoEqDoCM7ktnd+gZCOwWPErhrnmW4s+9z?=
 =?us-ascii?Q?BBWRAhO1VSHeO6uNR0AifrxN57YVrk4a814JdVm6uTmS9tLQc5tauIHN0QI5?=
 =?us-ascii?Q?S6nWGze4JZ21ruF0C9sYzffVu+FWqk1wceKbJRPuV818mQlNkuKJr1bR9AXa?=
 =?us-ascii?Q?LvvSZLF9z94vWC7pP+dlCkeYKyqa7ng8kN0QVe/kyGaq/QyjuRvQOIXjznri?=
 =?us-ascii?Q?FJ147XEL+EV3+fj3ocrsVPUbQFu+s0IZ2gIQAh6RO49PAoK5Aocasj83hKq4?=
 =?us-ascii?Q?IWTys9Td8soyDx/vbkVvfo15I1uhPcerIRbhbp/R2UUB0/mDjR6fq9RzF1A/?=
 =?us-ascii?Q?HPp2Ugaj0NvMMKLUx6N5SXSgLUCilKESsJK8HnSo/bCIlkLpzWwiFIdmi60p?=
 =?us-ascii?Q?bwdu5QELJYsqhrUVZ7PaRh7f/PXltI6vNUj9kx/V8CWhTDK2LNx8zDxYRhgT?=
 =?us-ascii?Q?3sBQv6E2/r+OZ1nsrqbB3HB8vKrD5tXLR/xxJSktNMPCkxF+MgcUZdAPC6q0?=
 =?us-ascii?Q?NJKYDdzj3VVlxKwMj6DjMKwpdCgLE/Mg5vKJBKbRo9qbwnt2m72ks2BJUSil?=
 =?us-ascii?Q?f0b8e6mMGPv38460cPQUjCst3d754VG80nUtv6iCVOPRWfNt2fYUg0Plp17L?=
 =?us-ascii?Q?7f2CF/9z+QC104DNrkem8myWHk3qbxGUAdXBCUGbnJwvuSNRATwhPTl2qlPs?=
 =?us-ascii?Q?NSnZoJqBWvwypVwePWSzIuyqilpvdWWksfsDEUch3IA390eCV4LpNnlmDPog?=
 =?us-ascii?Q?yy4hCjFPcKcQQpUhFqk3p2cnRRM3b2RjbLLESwg9JqjuxilwnW6yU7ChaZX6?=
 =?us-ascii?Q?VdFf2ZXR1JOIk9N55s+ZwKfZhe9J++uacQsuIWo40XoMNsE36Q0jroodZ60F?=
 =?us-ascii?Q?ccJQykJiIw5+irKR/VKyH6fhpE6jXdhQmUgTdIICpyFLwxw5McZd9QGN3nl/?=
 =?us-ascii?Q?6JuROjTcohsje/886g0+HG06Nc8CS3UWxAU0VyAhdE0IQqn8hHZzGJemMz8v?=
 =?us-ascii?Q?BMPP4rh7fikvF7JtXcw6O25MEKJehOD+xyRXntH9OOfHpyeGaouDv03apMzH?=
 =?us-ascii?Q?DZRsRgy2gnnZhu7Ec5YTO9m1HQ1f5NHNpKLnBrIx0Q8GgCVX4qsu93opRgpc?=
 =?us-ascii?Q?cBj5bHBqIDwj3XwiO6NBPbscx6znR9Mq9Lqo3xzPAZFdHhMO5Aqj5486UzDW?=
 =?us-ascii?Q?StdBPUhxywQGI51JuarySLH7aaCrLfnzH/6nLaLjgN4Up5Fw+ZQn/rvKg75B?=
 =?us-ascii?Q?F5nQUhPE0+CFXdNGbOfY0j8VwtffxNHKGzXHejBp8IFZNMtByRVZ2vxrha4N?=
 =?us-ascii?Q?pc9d5hjmRjPCTyhbnENnBaDs75S7IP7y14rzqGQQcHwRoDGai0RdLs57r1H9?=
 =?us-ascii?Q?p6hSGZFzyJkBJGri7trRprY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b08846-bd2b-4807-fead-08ddd541d772
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:34:52.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEixF58lRDPxPe6HOQN9neqjVAdBWiouWsOUPS7x2p78qGF3LAWcPjOLIAeqgKahOx2Jh+VTnVhCvsNAI84HzvazjkpJFaczoOfXbvOO1sHgRWS0TdKLBmW0uERmd7Ls
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13822

commit acc84d15e45393fb ("ASoC: generic: Standardize ASoC menu")
standardized ASoC generic menu. Then, it moved generic menu position
under SoC group. It should be kept generic position. Tidyup it.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index bf362bfca456..ce74818bd715 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -111,7 +111,6 @@ source "sound/soc/bcm/Kconfig"
 source "sound/soc/cirrus/Kconfig"
 source "sound/soc/dwc/Kconfig"
 source "sound/soc/fsl/Kconfig"
-source "sound/soc/generic/Kconfig"
 source "sound/soc/google/Kconfig"
 source "sound/soc/hisilicon/Kconfig"
 source "sound/soc/jz4740/Kconfig"
@@ -149,5 +148,8 @@ source "sound/soc/codecs/Kconfig"
 
 source "sound/soc/sdw_utils/Kconfig"
 
+# generic frame-work
+source "sound/soc/generic/Kconfig"
+
 endif	# SND_SOC
 
-- 
2.43.0

