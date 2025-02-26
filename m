Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9072F194C77
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533779; cv=fail; b=ma5Oep1H4lrIkS7hEHP8U2EuVP2MDknq5tm8bs2qYVVeZzwA1VHtJYahR7zHqKC02jJ14emh/04sutHPf6HZPMdIKuZSJDFt7Ye7CHfoDp6oC0hEVPfYkdTpoPVJSWlvx+85llAhbPq1tRDaXTxE5AErvF35dZs7CDRtQoQIaoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533779; c=relaxed/simple;
	bh=3cnWL9zI8+h0FeKZv89i3avtzRAT6COh31PMmjrDmdg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iGCixBQXRkSF2f4MRET17sgAih6BGo0pynetsctW5FcXuGD6zct/Ca86fflQ3JdJ/Y7k7d4l5bLg5h9V3M4RAnY7RnAkkRZSlnaKfeG9t0w+ghT5LODRYXYGaagcfgJPeOD7e9GUTDK6h4eU77t074YA/d6xGqLK0n1J4HOi3p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OFuXiyb5; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OFuXiyb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2MtzU2+cxaYmjVZOEac3EkEzqH65GTHDWDAZnCpAZLvZcaxmK1eTINCHnqatEY6KM5KX8P1uyOGz/I54a4HpFGuQ7ieSitTgLJKSgWdT/cSz8gFinICuR0d/JIflvy5ZdLAAbX5E27vqo0HK+YmOOhTDbvPUoRZ901uv5t1AzQo2yOuJUdy2rtThBeIMkJXlRFCy2C//AXQEoIWf8ayQ6zAPGkCC0jdIC+YSz8BmqAScvk3uvYixkz0lVBlmR7lB+l+O49aydDapYGAQwJNn1WxiIbozkxSWCR8buosq5igZancvSG0Fa7PnLgt6/0M1mjwkH3bI9+1r5oRa5CnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Bi2ng74ySn5oqQKZ+JGVyc1EQCdaz5KHaYszlDFH9k=;
 b=bGTT8kxVCAAMihZVzn+IwIMIgL0wSSxHYNh7VmOp8Jgh2LL2Xw8BvxTWR2VsXd3FFZn2TqzHfmlfuxmrTcSROI/CcGL1dx7MrZZEYxWlxE/b5kE9BbWGdc8oDOwdWiayp3fU21vQeCkBHhUecPhNCzZ0a7MFu/h0whDlG6wG0VUSXBNA6coizFuvbhQftUkmd4tXeZLw72rH/l9HZKa5QnGYvu/cfpGkYNB1kX2W8aQTBTCquYDlB8nrVqSSwV8IN9T9wXLYT2wLCntantqHN3xDk6ANn8DhHzAOD70PBTw22t1RqEgjZFzHRFsuNFZcPSxBm2wpfYYtX6XRVlA9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bi2ng74ySn5oqQKZ+JGVyc1EQCdaz5KHaYszlDFH9k=;
 b=OFuXiyb5cmvupaXs2sxlcbHm9B5U6btqorcLulkEuQXu/QII789vGDNWpCamGSlTCDh2bG8wZ3jFMZCXr6jwiWHY2AZhM/iTR9BSJxMhLVygzKi+NRXyPXq0TYdsLLIgmp9wdVLcEXSVpHE5Q8yMdjwnfG8T2uGZFUqSkuEFHWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:15 +0000
Message-ID: <87h64hbi7l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 099/157] ASoC: codec: wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:15 +0000
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8511e895-26d4-445a-793e-08dd5605f590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?43haUL3jqUUjeFJAv572I0/8TCu5xYIpbhvUKcbjRWbKXvoyUoswFbySXsZ1?=
 =?us-ascii?Q?r6AtmN2a5kubEfRaJEHGRNxuzC945F3tFPdNfvGxk5Y8sQqX9iZpNr6G4ZYC?=
 =?us-ascii?Q?zrNIOj5tjR6yV+yB7rymUEO2DOUGZNGgC/MYx/jMV46MUGNh1NOeJGLw12w+?=
 =?us-ascii?Q?eNbFmRy6SmmMXmV5ISt4IZnYnbpUCULoh5eZNrmTSDGNiTs0Q590ka5UNied?=
 =?us-ascii?Q?NNL6RR5X7OLQdAgrM0G45LiYp1M2KB8LuP5FPCMOwhq9lyjmp5l6RWrJFTzU?=
 =?us-ascii?Q?tKYqn0jOda7bh49WmV8If8d+d+osBiiSmb2+L28LnVrjltm7Ct2MCsyHd0fE?=
 =?us-ascii?Q?XoZZycfG/2l+mpUHVgrcqbMnYa8jhH6Ol6MpZYK/nf/1mKpZcRXy8L/NyIZv?=
 =?us-ascii?Q?CMFoTnx+A2EYhKUAkolXX749xUo/MYV8KKJM/eYCZcDyz+97ScikIt/6JdHq?=
 =?us-ascii?Q?Atrc3bynBzqf7VOHdGlRJnXdwo21GunK7nNESq4wWeyetMZLpaC0P5FVSRLv?=
 =?us-ascii?Q?FRMd8Bm3mI4YoShmqGecwWQZgrPvvpCx38Kjj38JihgtTADI02BJBEQncfBS?=
 =?us-ascii?Q?L/DO1AlQCnz2sT1HI6mcgBv5rAh8HFzCzj9B6uTqjp1MHBVklI+Xy1K50xaZ?=
 =?us-ascii?Q?vBadUn4fL6X/uYfa2bjQaU5ErWOCVSFpR3MLBxOirMURyTfMkEU9YkOEQzsT?=
 =?us-ascii?Q?tAqReVcH4dcLhi+RWvdHSCbkll+qWckXhofJPcnK0oBq9aUKVEXNedfdH0Br?=
 =?us-ascii?Q?sbmaKEnhn5EBL/6itYdq8Jhb9RPTZH5NUKJUofLT3xvgl064DnuCZA5jR/7X?=
 =?us-ascii?Q?AML24bsLU8zRjzOVvU3eMCTrbiH4xL8OvTj9wAizha/+42xBUXoR6MYdYxks?=
 =?us-ascii?Q?8gqdMBXdrTWyeEuMMWNTSfwe+Sz9PIqCZhMCpj05+2HlcNwHkCaeKPs5sN59?=
 =?us-ascii?Q?p19HudD8v2+r0at4oOr/yY8BfhJRW8M1aoFcMevA+SLL+/5Yyim2ATuxsB6O?=
 =?us-ascii?Q?yAqKpM663q0evox2fy6WyJ/cmYsfN5EnB/X3NYs1V64iPceiH/yNoxMU5t3V?=
 =?us-ascii?Q?MEtRIncdnMXXHyx00QeKt5WJY+WQXrSd/aQXarx/4yM2vneYT3BoR84bPrc+?=
 =?us-ascii?Q?GXb40JElE6pPmdneFhK/TdZy02gsO87rfrJDSrR6Czbym3C1f37I7B3zuMoC?=
 =?us-ascii?Q?XK9V/hzHctyGNYO+uZmwGI4BtEcHKhyAQI/X7FksCvGFBYtO6K+RXi1f+PDp?=
 =?us-ascii?Q?QKZe6uW2mRcwzW8w/1mUw5NDoRg4YIL5ZEVNnlD/qXPXCx0DjwDHwCnKHtb1?=
 =?us-ascii?Q?CXJPasiHYNBjkKMKYjDq9jqcxlhtZpC01KNsgu26FJvf9n17XJGU1IDpMw0F?=
 =?us-ascii?Q?HBzU67MZdFLptYcamC4Tsh1GPHDZUC24TeZZJ3EU5S7XQcNipwl3iGJk+K/o?=
 =?us-ascii?Q?HZ77XQ+bfDLjpYnjcG9VaJJ8lv+JSar9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXekdk22KB4IzBjW4nUqgyEmKrlyn0L5wS3+IzC11Uuv1XY1tprTwQ3ROYvX?=
 =?us-ascii?Q?ZOw9KGM4sWXilXWE9muUs1A42HhiLlfbNep5Gay0xVKhzYMoqjbhs4TNitKA?=
 =?us-ascii?Q?oN4HyqFKGLZLcXnPn2TDW8oFTHfb6pp0QuY1WSyn0HTZnYBGlUX07XEkOLdl?=
 =?us-ascii?Q?J6qcAl0OQwOg6Efyg2b2UxfOP9sAFCWsoKZoR7zag3wUIpI6Vwc42iiOuxDv?=
 =?us-ascii?Q?JA72pznn9GJ7V6Ay6KAkyKlwwSbq90hZCtGfMmIBYayqvaXgxtJPpSviHpVD?=
 =?us-ascii?Q?NXM6uwk8dYDIz9ogiH0yoGDll5+NIc9josnCYOA0od92M1XhlcRV77dAMGIu?=
 =?us-ascii?Q?TG6/aV7ktTMxtPavqSy5bHja/uZnH6q+takHSXnSvfnQC/zm2BZNT0QgSZIx?=
 =?us-ascii?Q?vVEabPjZZZf0s8T7THLtqg5gEXoiK49YhvlxHNH6fQcWi8g5g16YzLPFJQy+?=
 =?us-ascii?Q?0WcyyPSTKQGyc/q3SpuDkAl9b14MDWkolFp2HogSu5YgWpWgXphIIkMATkMd?=
 =?us-ascii?Q?Jya/rd5UU6Q8sM4/iafMfVr44XSKUccgPDL/l7sv7nlVkPJex7IGYDDOvU8n?=
 =?us-ascii?Q?7xby0vqBcCotesuQa2nXZLbRc0ZL7789nC7ewBlp526xy3x2RLLMBbH/Upem?=
 =?us-ascii?Q?o7FgVW0xuhAGqJrQ5xUDlHUwpfwz82c3xjQZ1wQQWuGvo7bgWwFxk/hcthcW?=
 =?us-ascii?Q?0KsoKgR3dK2IEaJpCsk9dTSlWQcBsZUP0qpPt3WTieIe4r8FbjbsKw42SqYH?=
 =?us-ascii?Q?JfCAiQ5u2/3/o0VRqB1uyRKGYLy8jJixFx7t2bq+TvzbKB7VXY1VEgGmKqZp?=
 =?us-ascii?Q?NYtEJ7tHu+oFdPKzK65EX/ot4tVuOsmb21ngyMZ6y8gbEbMPYwY7iYZ4gHB7?=
 =?us-ascii?Q?zuxs6LEla4iEBBRVZDmZDl2oVUx3L9K4JBG2NsHOaOUuiKRXXsWv7PbovjXy?=
 =?us-ascii?Q?MRfoUCVx+jQnKKQm4hgKccnu/vmv/cJ8tdO8y7Vz9PpYB+G3yIGNh+KND+lC?=
 =?us-ascii?Q?aHe6l01gviuEzSVtdcN2VYDJ8ir6XFc6zbYJRq7+VyZMraXJwwAHTD6ZEJev?=
 =?us-ascii?Q?L7BM/5+9hiMPPobL2CN4PNquO3oaabA5sRL7C4LCKPlcMjV8QUrnnQ0iXLlX?=
 =?us-ascii?Q?mBTPK/EvAYQBzAbAQ04mWhFdu26y0l8RbjVnu5KT5oJAhW4t+muzNgvIMhKM?=
 =?us-ascii?Q?p6THbTZyN4nrUFu4kZ4mn3Bu1qPJLw5W3QwQvFXDxcjdJcYRalBg6dtjbU8P?=
 =?us-ascii?Q?K16AzpQQvkUdNgFXJzj0b6mfDppCXd48y5IeeTehrOUlTykLl6a8brkPL+MY?=
 =?us-ascii?Q?5/m3ykpcPnO7HWacS2nSnwh/vZgzb2B5vP7tF3WCHnC59rt20VUNaANoBNXC?=
 =?us-ascii?Q?mEd6RSOMbaTS3HR3vDBjcDEMauw+vQGWeU/eEM90HoHEpjjGPG3W8r0Jbb2J?=
 =?us-ascii?Q?sVSI4RRAyLOTulb66JsDrY55ReMCGvOgma7GmDL4GpbPDNqx3qY7K1bT3OUc?=
 =?us-ascii?Q?G7KHei5WVvwtz2toGqUbhpTiwOG3NEblwGDGL6b1cZfiHgA9k7iVeDXBsxeM?=
 =?us-ascii?Q?v5TKCRyeFqC31RLbmF4qDEU9xxbHcKtDnwoSghdiLEO6djsUMBI9vEr+Bsui?=
 =?us-ascii?Q?fznUmi7Psyl0fXa/qbjow68=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8511e895-26d4-445a-793e-08dd5605f590
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:15.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fuh+eF2J5lMaSbvsKdptSrJHXy0hhkl5cXQBLrnBAgDnmDHjJ4ojDaTDFaC1EdQ+UmbtG9KNcKJ6Aqq462oSRSnZY5gz6pTgTYxx2xIHntDl1kmIx4zD8BZdTIz48Hpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8994.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a4abe6e53bfc..69a22992c281 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2783,9 +2783,9 @@ static int wm8994_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ms = WM8994_AIF1_MSTR;
 		break;
 	default:
-- 
2.43.0

