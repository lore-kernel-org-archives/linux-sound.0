Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE14334695
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486310; cv=fail; b=KgFzFoIrL8NLnaQ3sVhi8g86DIadn76vEvvWXwLEUKS7lZDy8rK/jT5tR/aH4nXm8yj/KkKwQ1Ws2BbAsIyBzMM6WreWOsi/UdXjhC6PMM5ibFmdTJ+SwKSPx6foV0LEfezqXFHAkpDNdJOBhwtURkCTtJwLfdepTAkD62wq3Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486310; c=relaxed/simple;
	bh=fJynbMFxRXzFCRrld28vbc7op9935t/Z+OdHp8LLKVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gcUnqTD3kX1As0fvCG8a6YZbiPPinAXOLKCuGJbYrcBzsSrDWISMW8T7iRF8igGR9BcoEm+BtZgmWQjKBTiwu+Sal8oRKovM5nqSZQsHikuTBRO53bNvbGfTLTssNliqUbc8eBPyP51fK+rb3aXfDH4c981lyyRVE1mcuL9IByY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nbMbfYZ6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m1GI1Oy6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nbMbfYZ6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m1GI1Oy6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5QnFw1662531;
	Thu, 15 Jan 2026 08:11:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vWtc8xTcdW8Il8jY
	80a1E8SqponBZ7qB9TSJH1AEqAI=; b=nbMbfYZ6o39HbKuAwMR20DPXlapMQUJT
	w9FYEgFuqePwQg5nu5mtrjOBWxT1cTFiAouj+7AE/ZDCbmfzwXCrDvLl3MbQk2B8
	tMZfeGB7oGX/OCOsv8e87wiH31GuTbapS8XMbEx4ZK27KtLkzMMR5LB8Ioqu6pdS
	QklpUGrWGIUZBLs2Y7baG5jCljarg6yM2bOUHSKGykJBXyqQKdB6rTyraD0J4yw8
	VDui7MPs+4+FXw8dfgyvxkVj0HHKpk2rtinidMAGMSeZShooR9q+uV6ZLWIzVRIf
	dhY1M9FEJ9rgSMKBrwGLQd1TgVfsz1AEuDzuhrWlnEgbxmhUso/Fzw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020093.outbound.protection.outlook.com [52.101.201.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n5x5q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 08:11:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqkstKxO1Pj69o9JqCJK41SAaAp4e6A0TTZseyW2lw4uTir6xA8P7MP+d4Jk26pE8M/GE3drZItX3XGu9hCvlVq1w1v7vXNfIHbeCH+IsxU1oM+JcXXwV+2+jt4EqF6gKi677xMIVxRvqC5bb82RDywcv4XRoS0BQWqYqaAq184EdkUgQqqUVrw6Tsu96VhbIpZmL0z8Dh3jQNjMg5eRVCASKWIZyEY81dzAl6iRXMwy46omnWlVtGHTNCjVQLx4qiV7epwuwUFAogZbZSw8+9GaXQyo9VreTJZJhLf/qfVEMmPMK+mOsp485bODY1XRsChG36n6FuAFGpIRQi4W8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWtc8xTcdW8Il8jY80a1E8SqponBZ7qB9TSJH1AEqAI=;
 b=WLsiYP3yo4e3aiQKQDFLJOyxGjascAbOQ3ju5EJEDCZH2ARFU919grjNupVY32IrlP+RNktGZefXFX8gDYpRHRxtmtMiArDEoAlCWQnGtnxqRQhLeHBh1IpQSNmd3as4osZsgKvfBG8y3naxye/7wHiTlwNGr1A5JkSvXaeOxSV+eITFj4XYNqkktoxNxJL+QNWk7jALz13gP8pHjyoo5Rq0mtX9PoU1rmQqc/a4QChe8FMB9MoM+H0GDm7BZYu33ErGol04p086KIu/ESntsa06r5EO14PEOHdqz+PjKkP6KbcIiRyKGktHJSqj65ZbmIsxvkpB4N7mLcY63cVMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWtc8xTcdW8Il8jY80a1E8SqponBZ7qB9TSJH1AEqAI=;
 b=m1GI1Oy68MDDHLvL+nin6+Gjh22Y2hEMuliYhEBSyNkcmSp3FsCiRTBxX3BwpgVopZFYj3KmPqUQOPytKCmBuRylCmpFKPAbJ3xNveDOmZVBlnKFK3OQJRWnLkn7e3DFA5Ak9lPNXw9/894cauqyzIdE9FD0eAkbjgSWxLqnQyM=
Received: from SJ0PR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:334::19)
 by DS5PR19MB997195.namprd19.prod.outlook.com (2603:10b6:8:340::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 14:11:12 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::3f) by SJ0PR05CA0104.outlook.office365.com
 (2603:10b6:a03:334::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Thu,
 15 Jan 2026 14:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Thu, 15 Jan 2026 14:11:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2CCD340654E;
	Thu, 15 Jan 2026 14:11:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0F7BD820247;
	Thu, 15 Jan 2026 14:11:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Handle CONFIG_PM_SLEEP not being set
Date: Thu, 15 Jan 2026 14:11:06 +0000
Message-ID: <20260115141107.564929-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS5PR19MB997195:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c6e3e46a-77ed-4bcf-e5fc-08de543fefef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?83SwGGD6kvEpIkoAHn1i9qm63uhkEcN6W2O+MnLXujGEBI4uQO148KbbguYQ?=
 =?us-ascii?Q?yT2Ia6d6+6tj6mXj/pibyNZUOozdhucBeO5cycZ6zywWuaisxabc5B9Qv5Ey?=
 =?us-ascii?Q?tcK5Lw4AwvLApKBGnLOjQ3gsGpxKUnkSB4r+PYRx7Q25uWZYmvd218Ljb1Ag?=
 =?us-ascii?Q?/dZ434QHjOph3DHkyDLWpTsiVbVfgsqQos5cMgd4THJ0UDUuqfzg6FT0L6VF?=
 =?us-ascii?Q?aI1SeGz26ALATfnbpkmQtS/L90hat1pRyxVCKHrPf1OVbF6oF6CWh2NRqJnX?=
 =?us-ascii?Q?y+WQwEn00/0fP++tppbR+7ygl5QnFM5xKxq1AwiHnw2AoZAs4D6u1ZE6KJ4L?=
 =?us-ascii?Q?KqqEIn9U8g8Nz+OzYiraZ1Hh8TE3CC7klM9+JTeeSpJsleVO9kqYIYRY6yOU?=
 =?us-ascii?Q?fBVLEu6T/X1AKRx0Jj6Cs3gsIhttMH/7hFOnha3QTVyd8ufBjcONjIuMVbKh?=
 =?us-ascii?Q?SC8E8zEgLYqtXxxDFBZsNhYVb7FAIZqbnob+q0khvO/IHLiN34QAIxPNVzM0?=
 =?us-ascii?Q?+AWXE4wpPWtbjaXQircbbufgMW4nzNuDlekw3YCQJmmWYlFDY/8cLUI46xOk?=
 =?us-ascii?Q?e9dKLKeWA7fHnp5uLL5D7SAhGWaAMlFBfOD+yu+gxYcD6hL4n0t0ebSS+hBJ?=
 =?us-ascii?Q?ICjyqtBzJhe9dpUwUblQHB6KKsWvZ22UipyCOsEGrWPrJhlA+jB3PGjcAU+1?=
 =?us-ascii?Q?8c1QiHzYxnjyFtJAHpIEQVl+tvi38woby7WKr5KrmYa74c9CbUEu93F6SlVA?=
 =?us-ascii?Q?s7haEL76oqaHYNxq8GTQstA7hfIwuDT8/oj0ONgkKdbP12zAf0XSCZKcXQCV?=
 =?us-ascii?Q?67ZwJczBm89OkAdlzirctNd/zel6yG17SoAQpmo7ogks791dfuRgSmiE94k1?=
 =?us-ascii?Q?EdiLjXPgJCQLIo4aFQ0+C5GjsdL+HsWUNlEhBnYjvd8EmvgzUHJ95LrLLyww?=
 =?us-ascii?Q?DTkQIOdour9h0TQUuHB5E6BB0OHFfRIaOv/goVME6SEnvhlKe8CxiCs/YkYW?=
 =?us-ascii?Q?TzWy7r0rTdZH6Nc608As+BT5nXsSUDyHoI0zQEDb010YfJ/15pfGCFlnvVU0?=
 =?us-ascii?Q?3mOU+tNnLreNPB8YHi047ILHJcqX67Y00QzQUWHdIJOlI03XlKGc7/bRn4tP?=
 =?us-ascii?Q?TZUzJ31bt2UQQfxW1tbTbJjFharwlxiN6JxAJvb6Daywhu020rGDhtVcntD6?=
 =?us-ascii?Q?f3HOKfb1IYAXbO8WLT1hdqoPOKGMaHNHu0K7sKV00acwB2sqe5k/oAJPAnD9?=
 =?us-ascii?Q?pG0qTcvJEZhufHgcez3gF3Bq2f4MClY/Cfgc3XpN0PWe1KAW6RmAzjWs8dL7?=
 =?us-ascii?Q?wHfoCT2w7GZArVpCcBLKfP4BgtvaERZPN8zJdB4vfqbMBrZhXvKtbsZ9ITT6?=
 =?us-ascii?Q?1eZnn/Mepfrjq5AvfT2WWIFCiCz2jLNUE7uAjskBmaG6kD1IVztMZ3J8hX+6?=
 =?us-ascii?Q?XvW7v8owM48Bz5KrFOtck0xbh1hO4KWljixTJJ62ekiPoBdKjqe4gnRaUXha?=
 =?us-ascii?Q?VMxo6zsMjZODDeoW6AM1NUVtM8wjCTj6sdmACknqu/jdqesro8zWmwjdlOcw?=
 =?us-ascii?Q?NYVfsSl73nVlqr8fbM8aftpjqAEtds3FquNJA3W0OupiJuXNJX/pHmkrp+aS?=
 =?us-ascii?Q?TgO7exxTlArGT3/AUOI7U9nCHm7zk61qQw2JvTKseP5vYXg78PZxv4xrXp6G?=
 =?us-ascii?Q?JSgPtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:11:11.5084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e3e46a-77ed-4bcf-e5fc-08de543fefef
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR19MB997195
X-Proofpoint-GUID: I8f3cE01ZyqVNbWZpoSEsV5BSAu7L-np
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6968f583 cx=c_pps
 a=bYRzraljH1LAKK9Y2O2T7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=bp1g5Iz1D7c7guLF1_8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEwNSBTYWx0ZWRfX3xaVBPN1emB1
 S5jHxwox+GzuICb5vs9aAwqXsXaFHNMEw3cga5HVZA3XkqoZmJK+P/HBI+ptF83JVWQwJoPDE2F
 Rk2i6pIB9XurYPkRk0xWusP8qwSFmWi5BSQXGg+U8a2M4r86a1+0iuUmSVpHEJrSMij7EbOF2+n
 xIpuDSUqLIFoKe6D7lR/aTxC6q+59WahLw2d7ibq729RDyobrin82pP5XCMGfHvkHHwL/RiUj0T
 jII+C8Uibl0eV6EMM1XHadhi/tI2Fexgh+0IHDELpm9ovjRCMg6s00xJ2KUPJ2UM8pOM8FUL8Mr
 161feRaSfXfIggYyfWNa2kLZ66qU7Wah/QrJmOi/eyzMGdIhZ6IsDSpG4tv5K/jTRf9wQmkMKK3
 6g3w/vUq/1a76H7qczBongWbkvYqLdfJU7dF/pOT2xHf6IxudOk5baU82Sx89e+k4vMw0y9IHQn
 Zcba0Xk9BBpIJnlVxMQ==
X-Proofpoint-ORIG-GUID: I8f3cE01ZyqVNbWZpoSEsV5BSAu7L-np
X-Proofpoint-Spam-Reason: safe

If CONFIG_PM_SLEEP is not set the completion used will not exist. Update
the code to avoid the build error this introduces, without PM_SLEEP it
should be safe to always run the conditional code.

Fixes: ffd7e8a10111 ("ASoC: SDCA: Device boot into the system suspend process")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601151803.XY7KryHC-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index cc40732c30ccb..d9e22cf40f77b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -198,6 +198,18 @@ static irqreturn_t hid_handler(int irq, void *data)
 	return irqret;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static bool no_pm_in_progress(struct device *dev)
+{
+	return completion_done(&dev->power.completion);
+}
+#else
+static bool no_pm_in_progress(struct device *dev)
+{
+	return true;
+}
+#endif
+
 static irqreturn_t fdl_owner_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
@@ -209,7 +221,7 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 	 * FDL has to run from the system resume handler, at which point
 	 * we can't wait for the pm runtime.
 	 */
-	if (completion_done(&dev->power.completion)) {
+	if (no_pm_in_progress(dev)) {
 		ret = pm_runtime_get_sync(dev);
 		if (ret < 0) {
 			dev_err(dev, "failed to resume for fdl: %d\n", ret);
@@ -223,7 +235,7 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 
 	irqret = IRQ_HANDLED;
 error:
-	if (completion_done(&dev->power.completion))
+	if (no_pm_in_progress(dev))
 		pm_runtime_put(dev);
 	return irqret;
 }
-- 
2.47.3

