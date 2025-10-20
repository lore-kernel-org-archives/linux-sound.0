Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852122773CC
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975754; cv=fail; b=dRDaetk+4QvgnQvBlUiTMuwdwNyxSaDvLDpWV5bwoFsP1BtfuSicX5hioXT7k7oU4aN0ORxDw9Q+5QwC4o2vXJnE7IHd9oj3JEBQOXXvx5h1IOpXT/5hM9B+81ZnRsx2IvBzWZcPTbbQ/r1Eibz1DqVk1N3LqDoPGSKMrGAdwV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975754; c=relaxed/simple;
	bh=/6ukS7uDJNbAe3TDMWm/CryUqzACMB1RTwAiJo1wF9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LdoUOWCM4rOQ5ua0e9Hdcy5bFLoTnpOjPqPInriONHow2nWgAT6EFZrVxfAN2PBoXBSSDoU8bHZ0siVu7XfYOz9EFhgeAl3XxwnZtl1n58aJSyvc2vf7CZagiD1pyQCpW1RoWwBioOb0joTJzWXkSxXu4Kq05KcSd9fp8MEdL3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mNs73tbI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jCHdSA3f; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mNs73tbI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jCHdSA3f"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAbkX3744837;
	Mon, 20 Oct 2025 10:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZAcIBrm2cAMZF4hpVg4h+PG9iG48zhaUnrKl6MXMSe0=; b=
	mNs73tbIQXzLdWtlkj5rfkjZOSRd00tCije0HhXHjI0AQFq5v8AD1MG1sAlR7N50
	UyiBXSsJmbgC6fiIE3+it1HDb2ZwPHU567eIoVRK/3GmEDJ6dGpof9NXLnIyZ/Xw
	JURg5pEAI/nBUdLSfc4ZvN8euzKy6lxgv7iVZ2ywyV12+4eVJJJ4rUmeZtprxNLC
	+gSUDXyjpoRwq/lzQniYdK7xI3Bg5/WA0As84FG7QCMKS1ID7OoqTQbWLnzFCRYh
	1xZ4W5ci6f/H5Or7evijK0K88YQ214UfczhAuWxLq5cQN6ixS2EBfvHV5/JJctRL
	rG4UdB4rojCX8v8MLEx4eQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020103.outbound.protection.outlook.com [52.101.193.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8d8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPDb/rBSnsGlSeU+tPpnDsFF8hnXwa41d7c2IAymii7eF4zcnMreFqRX7COBdEhUZwmN2ddtuuwv7DOEbeVShvV3fdsvy8fvrH0iXwU2Q54trurMMYO7nxmy4tb3mFaSX5TCZiLmkxN7W6PxIk2QMM8JUYVTFslFKhqFs2I32X+YDkdkejyJrnLcJSq5GeX+omJgYv3UCOJpQ1VyW++pYSaJGFqmCMkTUUwXpe2BDwSq1KDQZXf6FYDP4flGQ/ptS6sZoEpbxsgEL/zuh0ZXYkVLSRrj3KiowlkaVeH8N5qHqNfNLoicOFc/TIBlZFcRI7SpjGOT/OYuPYchrIbjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAcIBrm2cAMZF4hpVg4h+PG9iG48zhaUnrKl6MXMSe0=;
 b=tKufcVEh8qsbbISyZxp9yuQzSOoLyEvMJ9LhBtAhOgr21csjR6x6ZDEy3uZ02vc+Ub++UC7WpY9Ttd3vz9JRglNupOC8DJ0TXxz11ODIUjFpmOPqmBPVcyvidc2ETDoG9h4jY1rXo5AJZtcY8Z4ScWZaHep/Wm04KMbSraOGYopVYGFiU0ZSOx6i979UKAT19QEDp+YbMOU5RYqjf0fEZA9Pb6Ed0uykLOG1RaS/RvaTvvZiP20Dwe0LrSeHNoFjqmjQQjiFz8YTGQW/06f4nvShl865NukIJnJ+9UZk5z4nQlPwSsmidJbI3QpbBGKpNXW99dXkUXPYQojSfbMiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAcIBrm2cAMZF4hpVg4h+PG9iG48zhaUnrKl6MXMSe0=;
 b=jCHdSA3fzME4mBUZbLjqjkvDtHlY1uzOyDX+eELPK4YEcs9swJeS4fRWu6PHxsh0wmZphlxrWeiXNRdgUU3DDTYZC9ijQqrcAtnPUWgocoIz+Fdcz9e2C74WuUOkDjnAH0pwVOPspG0QfBAFhMyfddD1M3eC9JexZyXzEmtu9Ko=
Received: from SJ0PR05CA0164.namprd05.prod.outlook.com (2603:10b6:a03:339::19)
 by PH7PR19MB7608.namprd19.prod.outlook.com (2603:10b6:510:26b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:20 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::11) by SJ0PR05CA0164.outlook.office365.com
 (2603:10b6:a03:339::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Mon,
 20 Oct 2025 15:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3C54A406553;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2A98B822541;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 03/19] ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
Date: Mon, 20 Oct 2025 16:54:56 +0100
Message-ID: <20251020155512.353774-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|PH7PR19MB7608:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d4446061-0b55-4d40-5424-08de0ff11189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PMd2Tf8h9jH1YIBi+aoK3mQdNB1JvcqoQCvsJkVsQiwuFwdatmoS/M50Jyj0?=
 =?us-ascii?Q?x3r8fdYlYp4/5iYYpxJI/g1hh/rQpSdVLZGnJmqotIZcMf6qYxp+jiljFiyG?=
 =?us-ascii?Q?OYE2f0qrHdbC/BPO0Xg7nmvYzutUnmnwRrxniNvMFWGRMxjSc2PuvCChBEXc?=
 =?us-ascii?Q?TqWMSly0vfN2w2gYVXIuQsHk0ZtZ2JtgbAofRUHtFaFxGlXSbXG2jIZZF9F6?=
 =?us-ascii?Q?Evin9kVDc5QGgVORcYJQprXoqu0D3UCoIVMxJ+l9XzKnyQRo3J8dJdaS48At?=
 =?us-ascii?Q?KdlutaTbyXf4/Nl+lb3n4sHRwf6ylMR1vbfA8guxplLYA/4su2i8s17HQN0V?=
 =?us-ascii?Q?e/9X5O1xLPn1WcgPI0pDTfF6s8iYsORqhtW2hiW+DhIbfM63dO3w43TbjM4F?=
 =?us-ascii?Q?lQ7WFi/z/1GU3k+ziz3L5wCCiwmwnFIvxsK3z2E2TGMK3SKJiE19iq0KHSfO?=
 =?us-ascii?Q?YlgCcoAHY1STECcKbLokGsSbu7+BIDzpv1TN44r4zsOMdxkGDN5hDfg5rmbE?=
 =?us-ascii?Q?DEgXl80uw2UHVuxMg3xPe6Z/rN/c9gIjjNtzymQv15h/WREBKx0r7JcodIQX?=
 =?us-ascii?Q?c1u2jnswI8Y+/zvDHyFjY15y6iig+nCn8SHz+kD6FL1Jkq7FEMrdXJ3cRaqG?=
 =?us-ascii?Q?1bFCjEV5VBNPLXwWsrxKQU9WM8s04fjR2N+GTRr688ZyyZRffxB9BFSu5Pfw?=
 =?us-ascii?Q?6NZCXlTvgN83pAQLxHxS0Py9sY7KyQxN/nKA3QGJ6K0FK14jOWGees1w7qdu?=
 =?us-ascii?Q?qyxjs1zPrqpPhFqw34q1OfSAf8+4s45DPTP7GNsE4BKdKyXvveyjMdsIKseQ?=
 =?us-ascii?Q?tdd9nbilvKyIDiVXYn1ee72wnlioXl+ZAeDWqdz6QbQZsqbxCzzGmBqNvPsU?=
 =?us-ascii?Q?Ihhp7SwxYwX8J8Q5DBsids+F7ZkOvpXc8iqbymsZkW4brX4eOg+Vh5uvZcXJ?=
 =?us-ascii?Q?o3hbXR0yEElNd7DMybXXbUJGiNJ3HMl/5s3ty0TJ1JSz8AiOCEBFaGNYZ0S0?=
 =?us-ascii?Q?dAPj8uGhCZ/wwVDAgnKELt93OwiYHdrCjGzVQ1ioIBgXaeCQHPgDde2HYBgb?=
 =?us-ascii?Q?FURt4pdT1nFvKdxDh00aJdnb8gBEdKaBNGwrgt4nC1N+WwQFZby273UGDB0p?=
 =?us-ascii?Q?ok7d9D0uqRW2UY/i7a3pwQaAvydqwv0XUu3TBh96O+gQuHbr1zMNga/tDJIM?=
 =?us-ascii?Q?6Lk1JEE+nfzfVAc8RinscragzeT+ZowEGsTpFdPa3uEdaJ50sgZ+63oTx3DW?=
 =?us-ascii?Q?xB5if4Ii86PSHLFjygNS+DcYWV26JTcJxM3n7B929JrWRMUd2t3HekR+aUj7?=
 =?us-ascii?Q?tf+r13bdFKDwal4E9/mNmCI0iaH+vh+TQ3VqIAbC5YpyK9xYTUoChAUi4Xlj?=
 =?us-ascii?Q?LNQtyBy7wvqnAqOOFBngJ1ujPrEdz88qwQCEN1hlfz7UHOxV7doH4c9oY3pW?=
 =?us-ascii?Q?NmOxcJoz4BveSsb/qOavLNkgguWZ8okyIqU8qOWm1l5sqKODtIghwTzmbUig?=
 =?us-ascii?Q?1cQwI+or295Holu08NSYXM/24E7BXg6lfM7YVwCD2JV85cvXqv/6BQqchQkO?=
 =?us-ascii?Q?LpSLLe4FmyIODt+8wbg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:18.5753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4446061-0b55-4d40-5424-08de0ff11189
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7608
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX38KKwudFbToT
 N1bMiKgT6ucf84QdXqa5PozZCoIO3k4+uspbjYfUuBSqtqe56GjhaBQdTQDaJk88HtwYlvkB953
 96kwniQIwiakEfSJNYSYVIhaaHK77VhFzMe3WGURH3EgyglLQfa9eqQLaIXNzLW720PsRyK8lRj
 /8v2LVPO5NMs0UpsiHis/AJcgi0MjBTuIKB+qKZHdqWHtE3iUKFFF+MriQMgTu9hmyy5sI2oFgD
 ZTWxGAk0s2cZKHWciODeeA2/OhJk4aC7WfqQQ7r3XPg0pnDgZKRVOGJ5rJ6PGS+jBJifFM7CMgU
 0cPSQ8c5nW8ZSYgXD2RhjFoHfafdYdXyyy/ASlx1eaNEBcPrs4uqCOAnomYn2gDjsL0ptGg4MKJ
 68+UaLJyr+0l8HYm6SpqGYq5/d7AxA==
X-Proofpoint-GUID: TyVeL80h6Qodh8zsTXCXlp6Ug6xwgnyC
X-Proofpoint-ORIG-GUID: TyVeL80h6Qodh8zsTXCXlp6Ug6xwgnyC
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b6b cx=c_pps
 a=Zp4+jYQMTYkjuDMG4rCdsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=2W7Bv4yKaM6PJBoyyCIA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

SDCA interrupt handling is a bit odd, the SDCA IRQ registers are
defined on a device level but the handling of the IRQ is at the
Function level. As such the regmap IRQ's PM runtime operations need to
be on the device itself to ensure those registers are available but an
additional runtime get is required for the Function child when the IRQ
is actually handled. Add the required manual PM runtime gets.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 42 ++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1926c0846846f..9295d283be910 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -11,7 +11,9 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -86,18 +88,25 @@ static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
 	struct device *dev = interrupt->component->dev;
+	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
 	unsigned int mask;
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for function status: %d\n", ret);
+		goto error;
+	}
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
 	ret = regmap_read(interrupt->component->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	dev_dbg(dev, "function status: %#x\n", val);
@@ -130,10 +139,13 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	ret = regmap_write(interrupt->component->regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
-	return IRQ_HANDLED;
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
 }
 
 static irqreturn_t detected_mode_handler(int irq, void *data)
@@ -146,21 +158,28 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	struct snd_kcontrol *kctl = interrupt->priv;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
 	struct soc_enum *soc_enum;
+	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for detected mode: %d\n", ret);
+		goto error;
+	}
+
 	if (!kctl) {
 		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
 							   interrupt->entity->label,
 							   SDCA_CTL_SELECTED_MODE_NAME);
 
 		if (!name)
-			return IRQ_NONE;
+			goto error;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
 		if (!kctl) {
 			dev_dbg(dev, "control not found: %s\n", name);
-			return IRQ_NONE;
+			goto error;
 		}
 
 		interrupt->priv = kctl;
@@ -174,7 +193,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	ret = regmap_read(component->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	switch (val) {
@@ -195,7 +214,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		ret = regmap_read(component->regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
-			return IRQ_NONE;
+			goto error;
 		}
 		break;
 	default:
@@ -206,7 +225,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 
 	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
 	if (!ucontrol)
-		return IRQ_NONE;
+		goto error;
 
 	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
@@ -215,12 +234,15 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	up_write(rwsem);
 	if (ret < 0) {
 		dev_err(dev, "failed to update selected mode: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 
-	return IRQ_HANDLED;
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
 }
 
 static int sdca_irq_request_locked(struct device *dev,
-- 
2.47.3

