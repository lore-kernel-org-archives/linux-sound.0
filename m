Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108D1DF27D
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777428; cv=fail; b=ogCDfkFM73ClUv3ZymJCS/Nn8kpfX4QV09z+KizDxYw5WVZvxserfeVD+cTK1XWF39ciGuXmOhHCjOV0Cjh+pp9nwD8lIHtS3X9MIBlkK1+b4qjxaQCpYoKThgZfr+Fp9682kvNKcqdH6iDo2wqt80LLUnDCIbTFF/zA1gWmmNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777428; c=relaxed/simple;
	bh=BvIvO0mlBJoqtc2uhWkuIEgqa7GMj/l6YBY4fhdgDbI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=klKQbBu+w8CSpUwh/s0CqcCrRH6nV6Gx7KZYJWC4JUtNmXCTc23LArRHFJ3su3+GrZT2bl7BNxNRvbM8NhWNQmOPRqpFYxFNvCIOr4azrWyUjFG+jmIu5b0SOUpSw/030ghVUXGYp9FfU9NaQ/GFQWY0aohnMDfoUfmYcSzcVbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fbwrbkYv; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fbwrbkYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0CrkVrvt4uQy9TSBAlnLdQAVcmZ4bvCaI4ohKvP6+PD3QXbpu0uwVR5tT5nXoJXdUCKuJacint1mkWb8U7ionu/kxD2KNg1jE2Z4dj33anEaKkieOoevugd5IFrNW/YDdarTWEGmZdp44VwpATf144y0v+592OBRyaMtCYxnVu/M3fi9i3kUsxh4ITGuEHrI50t4zeYJpJu/qt2J0wWAxaY3k4aXoYdN3Be9sLZhgJ3W355IyCRz/UKvHpTKXWaqmKwotdGZKgdu4eN3zHJalL6GKZL1SkZAiKjn+7aeymL/6xbB1jGmo9nw4qBNa+4cVFc39gc+CzsIElDd2tJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+NK0P4uE0OZLLl+gF3M53gOZiOWgHdwhuRJrn0F8MQ=;
 b=WdJBUPIHUzQ+l8OUyso+Jjuw6cEPgfpXzZkE9BJv1ILRN4v13GH1/vnEkapbnF9Vuu/AAFffnVktPlONazcY/H3bPvl5P8kEr2xKdDs4d3q/w7QA2HS228ixJU59AS2m6XwAAXrIQ+i9glL7Ojtv/ZHfOfEngtn6RIl7sFRel5RahcAKL2eVq/CxxFsER2WpOAZH3mqxBCVv4HLPMAcrOfwzigSczLFvR79N9BiIAfvXJwEOowYPcjc1I0ZryWO7Jo2ky0uHoogOn1Wq+0OEECIDBP+YDUe1GD22nbWKw1pPFQKar2mNeQq4RUZkBopx8wwvQvhpvwySWxq7jx35Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+NK0P4uE0OZLLl+gF3M53gOZiOWgHdwhuRJrn0F8MQ=;
 b=fbwrbkYvqgvjCzVHcW4H45LCtKztqemBRg9ClG7XQj6yoJJ3ciCWYJTTgPn7wtxbwtk91jgldZiTR4xDySdthxeXrE/IaFAF1hThOv6bxJ0SS14r7t7lzgZsw52kXjd0f2YywfjUWRJW8kRpCsXISo1dqqCJR+PgU2RiQBCEVGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:04 +0000
Message-ID: <87ecrvyuuo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/8] ASoC: renesas: msiof: add unique NOTE name
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:04 +0000
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: 7676feb8-3385-423e-21f1-08ddfbf2c3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hY6BsZ+8OSgXRobNAJbHSpbbw6gCo1wTCJBp/KUOTlNRpmlmK9ZF9KQLLwW1?=
 =?us-ascii?Q?7lATrwBan06zIrH+XQjggeOAV1/xOPKLDPbxuczta6KDQbOL7K7T/PL3YJ0W?=
 =?us-ascii?Q?bhO8nHresUFf+Tbx4r/dS5r5s+ceewAmHQ+VL/uTHUnhWfM2w1HMViYqUrcW?=
 =?us-ascii?Q?yw1baYRNQuGoVcqQZ/FOChe7hj505NGLdeyc2EdQfFrzzeIGQUpiC8kv+rAb?=
 =?us-ascii?Q?v/iaBVDUTWtaF2vJwnkCaVa2ubXZvJUQADN3cxZjRbYCW+CI3pad38vhAQyf?=
 =?us-ascii?Q?nOY1ELyhzTWmmCOGcidD8UZ2O14yoPMJShEQpim+e7BLQJYAISwThhkYTpNU?=
 =?us-ascii?Q?G/3YwENrld9RH9DftCtQtj7CxELHXF77M8+jM645FaLyloFNTQekIDXf9Hag?=
 =?us-ascii?Q?jifbKcFaa/Z6kQubdLvjqjBlgqO0pkloRkV2A+sGriemu2Qq0dICwy0ttNrZ?=
 =?us-ascii?Q?7Ouf2+73jYE5rPvE1f39awB8i1BZaP2q5Yc26Po8iclIn61o9ldWzZhDBEFu?=
 =?us-ascii?Q?eEyN5adCRNV2XvSa4GBYyaaZ3cDyYbnUrK0xl1ph/XgIWXobMtQHC4xlt80S?=
 =?us-ascii?Q?QlRG1P/QrQRHw8RYwxYwWCysN/mgecG2Dj7fzjyaXGaVtJkXvAblmPekIwkN?=
 =?us-ascii?Q?Du0xurdYuYrLQqKuE4ac2hjG3maTpVkgHASQ8tbk7BiEJVIsSL8PkpU8W2cO?=
 =?us-ascii?Q?hFKJSIjkpFZUraZ0vVHARFV1XC53Cp1Mjso+FaB8OStOoG91K0ISfhZ27QHc?=
 =?us-ascii?Q?j2IEPB37jHJXDWqsbHoGjAxke0P5kk5Qh35e9k/BhhGz8xDebJ/fqkAQwUcl?=
 =?us-ascii?Q?b62M2C6wDb9Oupilko4Q2rIiD2AannT9ClE2rSUnFZjSygNMd9crElKn60eU?=
 =?us-ascii?Q?6E589ZJgrJaXddJYpzmri/Scsw6WXudNYSgS71fdgWFFs019hTJO8/Dn5dh7?=
 =?us-ascii?Q?cVJno0PrOZcozXZbwZS+hf9/V8mQHU7nIzA5GcQRLF6hZFt/2+W9hnAvspwo?=
 =?us-ascii?Q?PhbZpjSTyC5uFMpk4AMMhPxWkL1krFwhi1vLofJ8B3Hnkou3w7D9iQws/BAL?=
 =?us-ascii?Q?NCSe7PQXDyXXfOZ35ZhaskxsdwOy7UswqWEUR8AIrb4pvt++HcgrpG2Fgkns?=
 =?us-ascii?Q?Mhtn5IlRADvLaLmNG19XZydYoOpbX3C+AJnEZAzhFGIVzQ7tK+RRwCgE36X+?=
 =?us-ascii?Q?J+UgDNV/KU2tFG2uCD1PO+112lcQbT5gupO3fL4JNjDNtslwCqcwUixvKq7o?=
 =?us-ascii?Q?Ro4U7vRqtOe07OLFhBi9ad4ycAvIehe9DT7DFAM5Qj5EK/PBSCrQVw93WUPi?=
 =?us-ascii?Q?lcX0uRQzx8DR4bW4ml8/8Zfey+/PVIpqqqosp2idt3Rb/Ublt4qQUsteNkYD?=
 =?us-ascii?Q?HTwUyvIg4RM/fs60hiwws3dRJjK8ziSJG2XRdZ6wNSqyIhhD5DZXJ3/APx51?=
 =?us-ascii?Q?0DZYTTNiiWTepZ/UCX3RO8++qtjtoACgh1sVT+uZxZBmG7nyjdbpw6rjujB2?=
 =?us-ascii?Q?3I2wR7Bn5tDvPOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZnnFLWA+iRo2oO3JYeNWNcW715C/LLId78ZWH86AYTxtHMAsMEZtO/E3OmGm?=
 =?us-ascii?Q?pP4HJs733uroT+LqVeS7tRYO3JyMw3vnWLo/D+r4yYEmKHi0mRe8ZkCp1rM7?=
 =?us-ascii?Q?YEkZ/rLCzca/bQ3pPWuFB7RS+MAI2aRlSK4vzGsMpakghoD38cCOdGpmXLku?=
 =?us-ascii?Q?DyU5alsaltlwsw5Uo9yfhum1S12zFfnmPFe6xqyBAErx90JYCnILt7Cc1XLH?=
 =?us-ascii?Q?5jaULNfs5oX8FOmk7ovjobR7aZViOsSoxnf7r/cdFTxSNIg0rLghkLRNdW1V?=
 =?us-ascii?Q?0vDlUzeRzoVLCyu2pYIEubLC9CyA0kgwaXw/NrQVCam03rv6OKb4VhxRSjCF?=
 =?us-ascii?Q?3ShbVySFbdrIoh2Ckx+pMYmW3yuzGw/XWgMkS7a/RoehT0y1xD+LlRonG00l?=
 =?us-ascii?Q?BG6lgK77qLlIp1T74Aj2L1TJAfJBhv5m1DrZDGaHBJDthbrla5uyhuCFpmtG?=
 =?us-ascii?Q?n79X8z1oqYIi3sRVBA1vqMx9sguC8172g2Q+bw93npuJ+KlIjtoDtge3vNr9?=
 =?us-ascii?Q?1dT03EzxPO6TazCMq1CRzky1AKijmIcOxe9dfj6pEZKNr8TIcAY8Ae9Qm7C/?=
 =?us-ascii?Q?Da5o9um3C80AzKz4jqjnaHqVBnhgNkLFa16pM127z+lXRR/pcZdgAOEZaFHS?=
 =?us-ascii?Q?ky0XABPyLCXHY6FUc0U5uzXa1VouGjmd56KQWQt7g4Z6MQ57X5PerhnL7JKA?=
 =?us-ascii?Q?2eSiNxYAc0jELfzmhVe/H194kZZ61Rgm8O0FGAdghOB8Y0Pn8TYD2nWoCk1w?=
 =?us-ascii?Q?r5e8x2YZJ7glthx7cwNumgnd2+8AWSch0N1VWNWgMyBPVwhw1QJzDkkgnd1l?=
 =?us-ascii?Q?iBrwQsl0c8HexkkPlpH3qTvxnYE0DDFm8nU4TVoJDMYnS/5SJBAv1Kl8Msg3?=
 =?us-ascii?Q?fY5K7q17X5GiJFcb19My79/4IIBGQdHgCdUTrKLETfJVZphJuVoE/XqeRuWq?=
 =?us-ascii?Q?u3TZHHm4gj0AJJA4cqeGMIpy0Quzmyp2/Dah5Ey0DjrHVNpi8zWt1LdM4JDW?=
 =?us-ascii?Q?/NDAJO4Dw72wHI9qgoi/hs72i7RFb6bnktXxEk6OgW+h1zuOA+wClRAv5w+M?=
 =?us-ascii?Q?ohhJSB3Z61BBh5bOTA52hUtfHEOiWlR7Cuax3bmIo5jIaeA+LQA5AMRgNzfn?=
 =?us-ascii?Q?zaqzmOg46slWm//GFceUr2JO9QrfEtpaeDcv5phRQhgpDp5Qr6VRnswEpU68?=
 =?us-ascii?Q?R4TBCg15MH+c8sCob3uifF/QMNj/FBQBgUnzFhDmMJk7UVzm9UBPhxoqZLPb?=
 =?us-ascii?Q?JwS5IIqBUSLQANvPNIlNB7T7eZS0sfGo+0GuXWktg8o0XjjOF4lHJKv7fhEF?=
 =?us-ascii?Q?vfYB6colbk0gk3e1fK+Wphxav9t/KZ86I5unX1ZELYRZA5wvAkpiMp/MHJl+?=
 =?us-ascii?Q?NL8QNaqRREBwOXexUA+l4Ei5LpN2/PaGxJ+94sNvIZhS2TE9IsLxj2Thbmu1?=
 =?us-ascii?Q?B07xR1fBbGicE1LOl7TN7GoPvaCvZleL+u4DrSciZP4YDC5pw2IV0sWqt8Np?=
 =?us-ascii?Q?6tjVgUb6Y9UtKrmhTfdPnBTpMr3IfIxmtNkY+VVdLRWbMexRisDLRj2aYSmp?=
 =?us-ascii?Q?RZ4XANOLEe67C689SLmWPKFPJfRs9FMmR+2poD11gXpeHL/ht/rwJg/U7wYa?=
 =?us-ascii?Q?RXiUCyO9NgutVTMAeDPj1hY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7676feb8-3385-423e-21f1-08ddfbf2c3bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:04.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2e7jS+ng2ivXwXecOAsgD+xlyrADKujlOdxqIif4IDXhgKkeIVv+H5zuqFZhKMOGlix3R8j7/GKlU4BVk42fDChfYP/0fkKXeOijBrIg9cXV9WHfSXIar8j3UwR5isIi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

MSIOF will have many NOTE on top of driver, give it a unique NOTE name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index f5338bbb037c..6819471fb5b2 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -7,7 +7,7 @@
 //
 
 /*
- * [NOTE]
+ * [NOTE-CLOCK-MODE]
  *
  * This driver doesn't support Clock/Frame Provider Mode
  *
@@ -121,7 +121,7 @@ static int msiof_hw_start(struct snd_soc_component *component,
 
 	/*
 	 * see
-	 *	[NOTE] on top of this driver
+	 *	[NOTE-CLOCK-MODE] on top of this driver
 	 */
 	/*
 	 * see
-- 
2.43.0

