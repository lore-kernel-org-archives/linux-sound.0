Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B94329E40
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785783; cv=fail; b=EGPalA08SasCDs9dBc16PIeYp5uvctlwKOlFuWZ0wzwaMqSUgMz4RCoovxPEugYhlr0W3Ny0OhadiXaZa+52V8cNp0I6jZpsFSw90lEiKx4qMUpoNhzzIAVH1Z6jhLn3aYcb7krao6eTFLYOkJT5MBehLSBP3etpXklS8iDNzXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785783; c=relaxed/simple;
	bh=h2/Koh0a9muXEQp6d+eZKHeoKU+DlKqa05DFoINznP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D0gI6nBzJLPU8A9Y6iWHNrZnX/NEAwNWBSkmGTdrQWgyDNe9fIkJRSJ9vXrJ9lW05DdgJUYUKDvAG5nIEfpspWdaCL3fmRycHi+U2KMS5igeSMIYAD3jI0CbPPg1+lPpY1pzUZI0EIGwnaPkPrX4y3lq9wlSHeVsT3kqOv+dgSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EVgrxafN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Zd11IBfX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EVgrxafN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Zd11IBfX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7QMQe3276726;
	Fri, 30 Jan 2026 09:09:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=VtKNTLpNkAR7fbMx
	QAJSIBKZTQofai7XcX61GBfQDvk=; b=EVgrxafNxuVSGMzIUxFrfZ2hsVSi+v7P
	Hjdp8++48piTxb7mBbdoBX4UjPnYKhDm4mTOVdFKOsdtZxURYK5f6CrTtNvSZOv3
	s03I+idYbwpVVC/D4lNxxIJ+NpF6WcplY+mrR7eqGEGdtjH+SqGDAdw0puClS83f
	N4IQznZsCiZ9gx+eRQ5eV+5tmsa0moGM5Ee35s1DemNAI+4pHWw6rMJkmEcaot+g
	4YwLK6NaIKxpqRSo5XKXT90/T5qmL+Pbn74V32d+oa0n6JQBH4TMMebvb0+Y0rQq
	lYkVqBR6G8Dtd/FsE9bZ3jZAsqS5AkX9E9m1yDRGflTIMFH+t1Ljcg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020095.outbound.protection.outlook.com [52.101.46.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc06vfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 09:09:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS9K7RyCg/Aw4lfpADtTNU5mD7ogAfcizftmL+Dw09Q3i5+F+G1IHRtrzkrR31JdojkSl0j5lQrBupFZhUpvKt5VEOmYqaE170OsApFKPpQiU2vVhiQb8JLl+DuLIa8Y17XcR7IkuwpBJN5rqV99+QXtBFIYwzCfzoIOrACTRyzRsMONUQJhc3lfo6jwxI/XS72KvKgh3cJcwfO6oSEZLqo7vOEgLeaAYDssJ0M5FzuyJn9wJUKDCYpB1urrhktCC8Bww6l/Fag7IjtRODHFxi8xMX+OUmkFV2TldAI5syzh51vs1c1wviQNa4gQR2pMoY7Ll9hv763zn2xhCs6F2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtKNTLpNkAR7fbMxQAJSIBKZTQofai7XcX61GBfQDvk=;
 b=Lr4HVtPNvP8HbvO/n500pG+Ba7i0l9yBBGLCJm9gXYu9vNMxyS2auzjprD/ZGx8EQOHECkyUFSi3gdq1c8dYwoV9ne138CSmkI0GsurEyqkjzUXfFB/pIjum2do8fV3bUvAQxETj5aqqUN8q/oUh5zxhnFN3P44qZuHxJfteBRZopbxGeVtOIDaj4KOXBR3fAkUSJrOVKg1tDQNGPJAy3jy88tioyWiMJzEt9UJeD2wHbD3TfKXr+8KxlfKcFMR7FtACCVMO0Zh1RvpdZLaIBqyUXkJo6byhqVlmQM7I11wVNYL7zQk4/74v1LpwohkWYlkGD3HWuo8yo7GJmLbgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtKNTLpNkAR7fbMxQAJSIBKZTQofai7XcX61GBfQDvk=;
 b=Zd11IBfXgNyR6ompTlFjupt6kc15Q4uECIabX3YPYd3YkdQtG6DzedIBlqg1xcrRK+L0VYJq3TLXvnktj0QLNeV0OHrK5Kpo8wgiQFdpBxk3djbIVucPeViqWIKYQLfq5ZkrYettGuIqQHdqmlrK/iik7jOhycftgiEk0HpcMEo=
Received: from PH8P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::33)
 by SJ0PR19MB5350.namprd19.prod.outlook.com (2603:10b6:a03:3d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 15:09:34 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::9) by PH8P221CA0020.outlook.office365.com
 (2603:10b6:510:2d8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 15:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 30 Jan 2026 15:09:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C726406543;
	Fri, 30 Jan 2026 15:09:31 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6D1C2820259;
	Fri, 30 Jan 2026 15:09:31 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42l43: Correct handling of 3-pole jack load detection
Date: Fri, 30 Jan 2026 15:09:27 +0000
Message-ID: <20260130150927.2964664-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ0PR19MB5350:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e70a18fb-f629-4055-6471-08de601192f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7RGCzzSbdpnLIMh5NSHn8KXZkuUIX5VVhEaxymESVc8eDyyuj4xlQhbshqdx?=
 =?us-ascii?Q?HMeKNfQj+IfYNXd1tYQ7lPJBN63WVqwyP0K6pfCiakA/i626lEqMaMjf8uaN?=
 =?us-ascii?Q?8NCa5goB/9g7jXPhn9xfEnpMDTA8dKmrfWmcCMo2Hn+0kcotRk7M3a/+HA3G?=
 =?us-ascii?Q?VyR462HIr3YB1grDL3lVSgKGbVT8L+l9FhFlHJnpTTf+1QsJSJI08HzDoL5h?=
 =?us-ascii?Q?E9mVSLdEpYcIfag0hCr4yZFNM1d2o0z1z3Nb2Mk9BErh3Er+VrZvVsm/ppk/?=
 =?us-ascii?Q?Vv1zaD4EpWVPjmESeBtxZTc67hkfZ6Sa1dOszsxi183iIDOojTxklplk8sS5?=
 =?us-ascii?Q?oejPIb4IsABhT1SIZ/k6l7eRabqEVrrlb6aOln6jGGOI0QZK39oyy7mVs0vE?=
 =?us-ascii?Q?EJ650xdT2AAyx5jQWZu81Ato5jNzlK7VdcSLq9XBJfjdITzbMOimKSfSs6c8?=
 =?us-ascii?Q?+Pwmwt0EFYEkru5BrT4mT6Jg/zlmIRHScUh2z9GUkMIp1VLH/ItwogP6mc8h?=
 =?us-ascii?Q?z6oKCHPUP2ETa9izIC7CVrgxRmVcCcwMPXQ1NO+Urf4JoISx14coQCobEeZ/?=
 =?us-ascii?Q?yvh4CPzJMY1+2lEfnVkrP/KqPg1PbtSRvGcEHElOOOmi55Sn1DTNx3/4eK4D?=
 =?us-ascii?Q?IRnlXTmjhw1jUYQ5EbVjsTHr2UwfhWnCUayv26hhyJKvwkfnpICMvCz7P1dW?=
 =?us-ascii?Q?fGLCBAQVBj77yT+qR2sdRmQZd7C5KUeI+BGH5HBeB34ql++TJBSO/9Gescgw?=
 =?us-ascii?Q?39mQduce0gpK3vyy1qsL5z8XXfxsxMNrXgkDd1NdjhZLW+ik/tmLQ2ccbwXm?=
 =?us-ascii?Q?c9kWXyYkORg7PaE/Gy+NiCAkgKHb960wY5PeOLRDMbaOARqSDczWUsCVePr6?=
 =?us-ascii?Q?xsqfIhXok6vrC/LA2Goy7rSI8Z5fsuUmkAZtk1lBqJGdMJ6d369x4KwUoOLM?=
 =?us-ascii?Q?HZOA7XY8KywKv4FOnTl9AyYZNeiLqobhKCTc5n6wnuhaOaxkiR+sRoIl7Mho?=
 =?us-ascii?Q?e6eARtkGNz7xKIsi6CxBoSPUA+yPQlXvDjGvCHHQDZRtDcNCzcQGqeNWwKyi?=
 =?us-ascii?Q?lN3Ew4dIXUuSK5/sycE6R0ZpNjmMfMZ4r0/ALHBSbHmJZDL5nHqAGk6HPpi8?=
 =?us-ascii?Q?tSFHwvpMw4Zn5KYnxsSe1KjeukrYChYkUlEWe6owOxp+9nctfc41tEKz6pV4?=
 =?us-ascii?Q?450izsH3FOeKhtitSQgnyEaAs7sJ4Bb5CV/vSK7XWEJ4Mjys5x8R04WXb9Lk?=
 =?us-ascii?Q?DndPv81NyH+7cw+VUM/+r9RMTDzpnXAgX8EwuJ1M+Bl4tID8rBWPZzB8m3Lc?=
 =?us-ascii?Q?CZ2TP77vdAloO9iHhHnjzVXxPaQ7EK3cuJi5CMrv96BL8y6b+lnff23NicNL?=
 =?us-ascii?Q?HSagVm7BhIO+JDSCh8nalX81YUh7CCE3EGG8vumiYWg8TGigVydBLYPCaIxA?=
 =?us-ascii?Q?60g0xwxE90Y3Z0MSB5DRy9kNQ6waxY2jYz8XXczUBqZeV/jttZlMIBoCpd4i?=
 =?us-ascii?Q?5cr+uPfHoAu5gtpCgCS/5mPYFZzNDzJ3Dw9o0aSHZrOpGy4v2dgMFscmm007?=
 =?us-ascii?Q?O4CmlrxEhEDa2fRQqtwR1iMnSOeXokZ9OvcgwkgREKx23D3iP9PrFRTmtZrj?=
 =?us-ascii?Q?V5EKxU1U8edQeqLGDQNows10WCCmLsYJKunqoCH/FH73JxEQceSBIX6r/OFM?=
 =?us-ascii?Q?p+dazg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KR4lNImsHDAS3dFCWB3b+9BNjEESmxQWbUWfwVr6VqVanI5Ic8FFXzr+NYACwGp/wqNV1y8ewq7SaFUrvy10dAG48LqAlU+BuCN5Ok79qQJH0BeN38kZHbeIOw2YuxKzexD+RuxJ9PP9hpe380JPmxf51qIxZ4cMz9v/kX0eFXdQMTC2xg1zZhGUZ9d4s0Itc2nIAA3I5smselLBNthQzlZ4/3PVVxE97lh8JivU1gFtWLmPnXTcfODT3S3/8IidgHYKZFHvG3LUfSU8SL0+R9gi77Ji1NywWAmdmaToaQYvdv0JuxRp18aOYAuNEHlSSlquvDaCZoCec+3QQIKPedX6/Wt5zEPrhTL8ehi3xDFLUf5wwFgl6xUvaSjuQoPwv3LGrhPJYS0XNZqS89s6uekoIqbh1JPsHL7fZJPAvfIYlxuqjpDYTD0Cf0kEkQtl
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:09:32.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70a18fb-f629-4055-6471-08de601192f8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5350
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNCBTYWx0ZWRfX2KHGjzbQfjo0
 NBDywUMbGYi1MHUO26BEglWJm5FA2Dc7yFHXnvFK7Q5kP2SMsqrUYKoietzATym5rsijTJoYEg/
 VoNweB841f+/nmGw4139BDPX1MMDfA6rIRMFjoIMaWWVqaUSr0s8dTpSWC3OjkC4az/NewEDZl9
 TOQYLilXMXYlGnwmXbqysNc+0v/jvlG+Q6HaTBe8TWCzy3jODvnCUWeE86amH9AoeqGTqlE0Bmx
 sXfX2p/2yn9r8tLFjLGlaA0qGDGH4iW7onzz8Q59w7AJoRg3zMoqYSpNdxUCfXZrSGAYIBYG+Q7
 10aFFC99glGRkABGO5KnAsZJdFqSM0pTvOmpJiGSJxmv5t85cimqfj3Uobx5YGIL2B9f+Pf3y+H
 KujrZy8ot0pQ/JJT5mCMo/ds+Y5Hm/K/GXkIP7/4U/kP2326qZ42PPQlcKmsA9NiYEqijuAnrVN
 zh6//3ZWQYt0uttIKXg==
X-Proofpoint-GUID: ZtWiIY_o5MKid4PTPzFjPj3QfojrrgbT
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=697cc9b1 cx=c_pps
 a=t/0vPMNysDLlRz5oSnGlrA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=JL0-QD_m8mK3j-aGN30A:9
X-Proofpoint-ORIG-GUID: ZtWiIY_o5MKid4PTPzFjPj3QfojrrgbT
X-Proofpoint-Spam-Reason: safe

The load detection process for 3-pole jacks requires slightly
updated reference values to ensure an accurate result. Update
the code to apply different tunings for the 3-pole and 4-pole
cases. This also updates the thresholds overall so update the
relevant comments to match.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 37 +++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index b719d62635a0e..b83bc4de1301d 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -496,7 +496,23 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 	pm_runtime_put_autosuspend(priv->dev);
 }
 
-static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
+static const struct reg_sequence cs42l43_3pole_patch[] = {
+	{ 0x4000,	0x00000055 },
+	{ 0x4000,	0x000000AA },
+	{ 0x17420,	0x8500F300 },
+	{ 0x17424,	0x36003E00 },
+	{ 0x4000,	0x00000000 },
+};
+
+static const struct reg_sequence cs42l43_4pole_patch[] = {
+	{ 0x4000,	0x00000055 },
+	{ 0x4000,	0x000000AA },
+	{ 0x17420,	0x7800E600 },
+	{ 0x17424,	0x36003800 },
+	{ 0x4000,	0x00000000 },
+};
+
+static void cs42l43_start_load_detect(struct cs42l43_codec *priv, bool mic)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 
@@ -520,6 +536,15 @@ static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
 			dev_err(priv->dev, "Load detect HP power down timed out\n");
 	}
 
+	if (mic)
+		regmap_multi_reg_write_bypassed(cs42l43->regmap,
+						cs42l43_4pole_patch,
+						ARRAY_SIZE(cs42l43_4pole_patch));
+	else
+		regmap_multi_reg_write_bypassed(cs42l43->regmap,
+						cs42l43_3pole_patch,
+						ARRAY_SIZE(cs42l43_3pole_patch));
+
 	regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN3,
 			   CS42L43_ADC1_EN_MASK | CS42L43_ADC2_EN_MASK, 0);
 	regmap_update_bits(cs42l43->regmap, CS42L43_DACCNFG2, CS42L43_HP_HPF_EN_MASK, 0);
@@ -598,7 +623,7 @@ static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
 
 	reinit_completion(&priv->load_detect);
 
-	cs42l43_start_load_detect(priv);
+	cs42l43_start_load_detect(priv, mic);
 	time_left = wait_for_completion_timeout(&priv->load_detect,
 						msecs_to_jiffies(CS42L43_LOAD_TIMEOUT_MS));
 	cs42l43_stop_load_detect(priv);
@@ -622,11 +647,11 @@ static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
 	}
 
 	switch (val & CS42L43_AMP3_RES_DET_MASK) {
-	case 0x0: // low impedance
-	case 0x1: // high impedance
+	case 0x0: // < 22 Ohm impedance
+	case 0x1: // < 150 Ohm impedance
+	case 0x2: // < 1000 Ohm impedance
 		return CS42L43_JACK_HEADPHONE;
-	case 0x2: // lineout
-	case 0x3: // Open circuit
+	case 0x3: // > 1000 Ohm impedance
 		return CS42L43_JACK_LINEOUT;
 	default:
 		return -EINVAL;
-- 
2.47.3

