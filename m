Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17809352C4F
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840490; cv=fail; b=fAPiQ4NVhfNfeJxMzlZjuTeUMNm5nkvD70LITAzEwhHUnp+ScuXmrZaUtasZuKpGYQYcDWKGxZJuhCSwMSmzkPo7U1S+eQ00yHcKa36Bacp04vpGYKTdMC4r7XArc0dyoKeZVl4D0EDDSlSBjUDunwFwo6B1YVtMmmvd7rLiYtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840490; c=relaxed/simple;
	bh=DplmFY26cXU/CjisvlMMb6mXd2YnQ1MADFW51ohhVg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDnIC7VfGTBHaMGVZADWR1jLSZq9gy4+cwZvbrbgP7xGPcZocotjsycQZbRKZtSSzHfTxnhkUi3iOTayB93QZnCkrVBNikCk/GWeLy6unklpQ653GyVmO/JZB0oRGDqRA6P+UsnPJKf6HAHs3mCnjRN1qCDubqMiAAG8yDK9csQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xw6WbfBZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=S/BaMfWI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xw6WbfBZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="S/BaMfWI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8HZmP1324652;
	Mon, 23 Feb 2026 03:54:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UwmQYij4k5+C1OihT2BB4Op8x4/EMlVP23oNNRZK51A=; b=
	Xw6WbfBZoqDqyeaDV4MLihSclj7Twi+hF/Ln19CACRsw9QidRBkC6+52ySm1UK/P
	Y1I7NPBKVfsRHmExarLSv0to6eLr2zoS7nQ675h/4R/kafN5FvDi1HRHAMe7Tqff
	f388h5glea5oAa13HjWx8rDIQpKpfevdxNyDHufZ8RjB5TxEgM7Yhc3cL30979e7
	6+RxSSRM0zb2uGpFB9HizZxeRJ+ME5M5hnCF9uB0D50vxvmCjJVEsKC0MC7f3XcG
	u/iJCp7yqpyxMWKbWo4/pcpJWkTo1rBb8l4vcnUnwyJ8TyvXKkWg4KqKpeMIXMeF
	mpi4GwyRtAbcJTHQdUFQwA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022089.outbound.protection.outlook.com [52.101.43.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019bhn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:54:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5dLmq5/wmUTfCplUsk07wXs5teQtelKMNrcqhlpaNlLyCF4GL+sGf8/I8FmdcEzznpaeq9qhKQSHA9CvNUdK3lbS+4Pu+qnenms2Xr1Wv612rLg3ldl8pRsCpvyGMSekBaLdrxoR3V5upmdgxGVPC7LSgRac8troz35wGHkCS0pAO60bav40AO2n89ExqAk3FkCbOKBMvD07LNedxLQo6bT/nDclomnaOYgdm5+HlMQXE+bQka+KHSb5+KBSiJeSp8Hcyd0QwMD0lkWTPYQHntgPwjg6IMpTrvAHpZp2OPs0mZkkMHLkJQwOdUP14WcUv7akbfegrSih19Pw52Kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwmQYij4k5+C1OihT2BB4Op8x4/EMlVP23oNNRZK51A=;
 b=pw4UMyH82KwTneMIApiWJTYWhgyG9RturT3umoS8E+1jAA5kudQxOMUfnbP09qYjtnoWv7mObiJJQ1YsG+BPrgQ6XSwVINk2EtYyUxN1E1mqdnr0dMxQVH9TUVQB3+ZzgzwYm9vOm2GmSvumh0lwTG5DlN4vSCJEoGTmp3Ay2CE0IyqtqvljiPcp7DNZ96/vhEuJ3sXhuJktH4tDlrb2TNFX/cg2ovLbS4mfXggV1u3QscfB0KaEJw0nKQFlCDT0gETZSd3OOFQg0uUZ2BzV4pjBcG+cUcJABeucC0kWQEl+hEBwQdLLvIEKR7xq+eXdHavAyJPfB47hXJXymLQfAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwmQYij4k5+C1OihT2BB4Op8x4/EMlVP23oNNRZK51A=;
 b=S/BaMfWIBw0Y0/dM1Gwl9XkB4L4/zbNhRUI4eDAz3wpx11TopskvXiALA1AHopHI3LTtDP9IeQTkFKQtW8Qk4hXmNEFXpIUTqMC3dcuuA1XCXRCoR62Kc+z+WuRGkqM0S0+LxnOV6xZ2g44dZqh8+tjEG0xkmvq2zX3TiQ6tR30=
Received: from SA0PR11CA0083.namprd11.prod.outlook.com (2603:10b6:806:d2::28)
 by LV2PR19MB6080.namprd19.prod.outlook.com (2603:10b6:408:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:54:31 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::6d) by SA0PR11CA0083.outlook.office365.com
 (2603:10b6:806:d2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 09:54:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AE6AC406542;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8FA9D820257;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
Date: Mon, 23 Feb 2026 09:54:22 +0000
Message-ID: <20260223095425.3905703-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|LV2PR19MB6080:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 84b3dad4-905f-4721-10a6-08de72c18aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4yXO0qXO5uhsbCK+QK6bBhAF0qMFbKZY3j6X3zKda22+Y15R8hVcQlAlyilC?=
 =?us-ascii?Q?4U3l1HWcfo3eKjkzewMDbgGix3Y5MOpDpRrTfDglymPebQVjdb2dgAY/bgvX?=
 =?us-ascii?Q?/hnQqcBGoWqFdb6zNOIYuO+AQfCTYoz6ieQylU8HJRqwYgqHJRtg2e3YB1X1?=
 =?us-ascii?Q?HrtqQA6fuilyT1YjW4fBaQtVHGaImQecxOhhVuSCALpbbbQe4W+GCuROz4FJ?=
 =?us-ascii?Q?bTjeQ1x6YR8+7hig6YpBJqf287XecS5dBVjBm4NiTCyiwTc8KgX4VgxnO73Q?=
 =?us-ascii?Q?ZIWVIWs5N/ClyYfdRWjQvInzyrX4hptr7kX9xnJ0AAQyq2S8fuzgRTQ0m1mc?=
 =?us-ascii?Q?DeAQehCVzxxPKs+su2ueVP0+ZxBtOvgnSXtMNLC7R+TuZ01lvzU5T+h/FLnt?=
 =?us-ascii?Q?80Yo2kIK473w8XU4NzAIsV1RWEykP/ui32nxnabvGp0gN4ZQgxg98f1im7OL?=
 =?us-ascii?Q?9nkAdC3ZeOUB0AuThNqwMACJ4wzsqVVAzmyhZXgJ3dRC4JCMtaFHUnl4usYk?=
 =?us-ascii?Q?dE3tjtcTpklES6YOZ4gEfCqvpR3niOdSNjeQYzvm2joH7yVIyS4fkVysy4sD?=
 =?us-ascii?Q?LllBVpWeBkk0vfDTD/Pv5Mqx0QiIhXQ0Gu1ZtPn9QfT9SKxfPz3SIB68OXCl?=
 =?us-ascii?Q?Lujfd2TXKQy22rQVh0U1AFNkYAAJJNUycfX4UyPsY4EnseK6viHXv6197Fdr?=
 =?us-ascii?Q?7nP8ivp8rP80uiQ8NYlJ7eosxHtb9Xc/PWflMBouIfzJjhULZSNkUT1OSPCM?=
 =?us-ascii?Q?1NpPsrOf7WKG2Rw0caluudxDdRhhfTnnfpsjsaszV2RoT8FaJy63LQJqU933?=
 =?us-ascii?Q?nDSraqRRFJ88lgROhQv6ELkvI6ebcTLSLRqDFWdIaqvUxDdhXWpW5EPaNil0?=
 =?us-ascii?Q?wCqutqEIRz20LovIZ7NxQuLFa97F1XRTqfKSUqdO/0KY2+TT+B7qT1R014ez?=
 =?us-ascii?Q?uAAj1F9ftSyg6vTP6q/WhJ9rzwAeOUbG4GovHF4rSdScbAQrCVr719HUNHMK?=
 =?us-ascii?Q?qHOc6zBtx1Wlo1ffC1YaJUL4sCyHX3XzXgy0XG8XpDDqI2oh6W2OTPq2UwKo?=
 =?us-ascii?Q?Lf+bDsixqQ1wFDtZjEEw7l2UJeYC62Lc80qrzywAO/jvvWk8xpEoqwaP2eHn?=
 =?us-ascii?Q?0U+EC6xj24n5aYGGho/FU8aGT4JoWBByEtxl/TWAt17WXODCvjkxdLenym+l?=
 =?us-ascii?Q?X6t5dWlhlhRArlwZlbW7FxSO/KhVLo+3iLBycraTC1ejXqKuT2Kn+zYwOiN+?=
 =?us-ascii?Q?7npjo7FDzr1KGNbTrDhx8/sstKStCGftBwQMcHtdVLzEeCHvhtnSGIpVeJJU?=
 =?us-ascii?Q?KNRrcgUmZfMJiULCKX7SBPVJm0tOSIv+q3NosY+3oPX8kZW2deaSEfIAVxl/?=
 =?us-ascii?Q?gIMAIKdGVcAvGSgzKLYKSrOERbnFNx0HLwX0SvPGKcYcu26XhHbC0YNdBRfM?=
 =?us-ascii?Q?s5/3Squ7e1T+FrBwB6xiAEOMs55dr78uySafXhRo6fL/0vwOzIzaeICOT7+y?=
 =?us-ascii?Q?9lAykKDsK8cttoUzdD9IRq94AnpZ9VS07gQRWF+zZCgLJQZEO5eg9+dsenBW?=
 =?us-ascii?Q?W5WsIVDcPLV/UA0s4vhSZxUIgnqF79vxyKrgtZg9akA8amStAy4y2GkbzUPF?=
 =?us-ascii?Q?eB1vT8zM6/VPte6GubeDTDwR2ti8GqkHZUTc7O5rEpdMEsMx1B5HRFfprDnZ?=
 =?us-ascii?Q?+j236g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f2XBVLAEzn09QmZVmU0gwzu4rnTjKmGvwQ/Ud27ODPHbilbpJPmoXG0k2vcCQdFd6bBCFy7EE7XMNRVD2EgsnZyth+Bpuzdg5GINsMmasKvJXUlehJfM1u+yT7+/fkd5nGIogTs3aT8OSaTnCGZ0wlk8YdWcdZCfaXfOnOcVdZTfXaCL9Ox+F0HLR/skoLsN7NZ+SOmpQ6c2gDeDxWiOf8FGxYmblfBBAS5GtvmPlackF78MoWnTQUuSqK/ppTJZkQWyTLCG1GioVVRRC0YWbMcZfIBHjlHAjK9e1PmkskpHbBGfxgE/ELIpV+vngHk0KHooQ89GhPnXDwpk3WUmy6rQ79hGsjfh4ZHoEUU1/rZyaX0wkuAWk9JVq8oPjvVIjTsnBm0qO009e2dQV2kmu9b0WpTRuhuAEn18kDfq4ZwtckNtGXWVtnGO5e5mM7fg
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:54:31.1381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b3dad4-905f-4721-10a6-08de72c18aaf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6080
X-Proofpoint-ORIG-GUID: jN0Ia20OgR4AAtHGo6CsvWks-a0v6SS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NSBTYWx0ZWRfX+QevtanuEvUu
 oi6Dpuzkp032QKf+ocG2xZCrA+ViGvSjEfFxGnTLuPfulqht06k1PPflccROoS2z8W+WsVWgjpJ
 yHoqiehO0go0jHcG+HBNQjD5FHv8uIMJbozFIqAd3ghDloJILKXmF0P+QRwIy2fSncX15pc8u4C
 qSs1JWlW8t+Op8zFJwijmeVs0K3CAiQIphrQ0vsdsqo3wI8D4iEixAgCd80jmbPg/dGmTbsVDnZ
 eJ54TyBehKusTI6MOjOMw9njmswPS32BC93+JguKGFr4c4RAlwAmayvjFgyCHUItZriZ6MZlQem
 YRXHzmzmhJtvnjjpDLnEiU+/9TziPmtfk9P/EB+jwSRHZ/bqKWlQrYzBf4phg4boWhPWdVpWz2/
 byfvvLN1tjPpRBAl8zX2XRHJiQS22y1BizfB9VH/nYhDKwTlumUmEYff+/CTYNmyjCRcy2NwAp1
 jCyvL8ULPsieBrnl7Ug==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c23da cx=c_pps
 a=ebY7fRpV/2+SmvP/Q3YtXw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=htvLyNKjiG02CUU49GAA:9
X-Proofpoint-GUID: jN0Ia20OgR4AAtHGo6CsvWks-a0v6SS3
X-Proofpoint-Spam-Reason: safe

Add a default value for the function reset timeout since version 1.0
of the SDCA specification doesn't actually include this property, it
was added later.

Fixes: 7b6be935e7ef ("ASoC: SDCA: Parse Function Reset max delay")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c       | 5 -----
 sound/soc/sdca/sdca_functions.c | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 07892bc3a44e6..994821a6df617 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -46,11 +46,6 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 	if (ret) // Allowed for function reset to not be implemented
 		return 0;
 
-	if (!function->reset_max_delay) {
-		dev_err(dev, "No reset delay specified in DisCo\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * Poll up to 16 times but no more than once per ms, these are just
 	 * arbitrarily selected values, so may be fine tuned in future.
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 95b67bb904c31..a0aed95c76345 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2167,8 +2167,12 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 
 	ret = fwnode_property_read_u32(function_desc->node,
 				       "mipi-sdca-function-reset-max-delay", &tmp);
-	if (!ret)
+	if (ret || tmp == 0) {
+		dev_dbg(dev, "reset delay missing, defaulting to 100mS\n");
+		function->reset_max_delay = 100000;
+	} else {
 		function->reset_max_delay = tmp;
+	}
 
 	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
 		function->desc->node, function->desc->name,
-- 
2.47.3

