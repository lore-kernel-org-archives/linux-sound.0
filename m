Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83E2777FD
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975755; cv=fail; b=oIG+Kr9JyMreageRnOtSUzy10ooiOD3jNhLVRF+u12gjddNzZIIfbA7Gmy5Rm86ZJwRDYPgQRwzr6hWvG4cQNLfmJ+8YnH+fMdks9TBWg2trwMIWqTzJPuDSRBn4ZpFdIV6F+xPrJcpNhnx+VtvDs19N8nPdPneSUNZpvisbk+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975755; c=relaxed/simple;
	bh=comK6L82qAzMpIALgAor3N9d6fI7SYEGeE9YCymudDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wio9LK+TVFqmSJGIkr5sOa6jjnC05+jYe6KXlGvBgWVJps/WxQJNaSLpJxPAtwlrUJhGKSnrUFD9K61EmbDyRery8J9C70SZ23hfdEAhfHAkKEcL7ROXsoGmtzM/2TBLPtpJJmJPZzC1QHKJE2FZGFUA1w6ZSshTgHkyaeP7O24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aZyslpHy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=L88fFE2U; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aZyslpHy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="L88fFE2U"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAOJJ941189;
	Mon, 20 Oct 2025 10:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GF8UHzl3NL6nXHKF3VKCO8eIQEIY+kZNKH+2QYEgU/Y=; b=
	aZyslpHy3KsVUnJ1R9XVGx7TaaR2lPTY0twi0Af6xTAMaz+D0ziUEgVsHp5ZMbqB
	iqNQRmZnalgZNQs7Te3ERVstPV+dOgm11MFs6DAx2TvVNajUOcj5kNJ9mvnAx8WB
	baSuRjj+LnXtT3q23cwYAapZ76LB9/oG9+eGsApZ0jiVr42ngwEVmTQycUKyYla8
	aaILGrv63b/xevZYySdtY7Td0WbYcCrDvh+LIPtHjOiPcrcRKrAl0i0PeUdEqLQu
	0mJrZKBpFRqdSKzxbsM2IHDvRMh68FvDWoAU7Y8jVKqmA0GwVD3ZB6zDnK/bTGse
	RSAvyEpf6Eq38uDjDyryRw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020098.outbound.protection.outlook.com [52.101.193.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aek-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFrIYZA1YB1Hzm2jKMjs5z0dkT9BrdNdG6hEIDBBzspUK1Olmk+RtBpb8v+EYYIpo+16EGG/533OW42aJ3EEhWqPdIyIVeY0JLqTVYWmPmej4zp/S421bkcly0EV5KM6YRTO/F7peZzCdjmgy6aZ7NQCyZvtvgS3m1ABdJU4v2yHwXOj/agTYw/ZlrvMxHi50bqA+Mw8ggW0QABHRHBJY5IX4BG4fkxA61J82B4o7Wrvw59xsu2OJjqcErG5KGLxXov/po+hKgNXux43sf5JZQ/5KgAMybGQA/yHj4bXJ4Z02Ito20MNxW7eH5uUTko0RnQQ6/tTo46Z/e/623gtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF8UHzl3NL6nXHKF3VKCO8eIQEIY+kZNKH+2QYEgU/Y=;
 b=jHq2HVP4p4VEI3sUcXWYTr+st1hUthOvpYW//3uZg0dgXdG2WnEM9n67wgj761m7+n5h0sSeGe+BIF5diOJVCfT1MQZZ8bsk9byfk0hr4tNpIkhDgNTZwPwD/Erxnxtf2cLzxyHpn5T/OuZtUsHQnApvX9ZhFZX2MBuwqbiMg/PTuVHQc1/ZFPouqlQYy9NPSsKj7deu571QhXejE+Km6mM/0SrikDe/4BAQ0kiV5OhPbFaGm71kPh4AwQLEnlTOR5iBkuAHy1OwbhP27eU16spMUHqPXx+14cg5n/4ZtpoTAnVlaA4sFUsedK8dDFrM1uWgjGmUKJnoz5gspGH50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF8UHzl3NL6nXHKF3VKCO8eIQEIY+kZNKH+2QYEgU/Y=;
 b=L88fFE2U2oXGjFWGxiytd2f5ZqxMraPgLw9fX/6RDF43zSm+iOCKvlszhHWOezvhHoeRlV9NC3KkeRL0Wgy+kTKNxShMvR36rlapP0ad1cd7Ay5bpZnw9j9JXyK1Hejj1kFho1dHRHNeCqtcm6eNuhxCyPyzW+zPcfVqwfzZ6lk=
Received: from SJ0PR03CA0187.namprd03.prod.outlook.com (2603:10b6:a03:2ef::12)
 by CYXPR19MB8404.namprd19.prod.outlook.com (2603:10b6:930:e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 15:55:22 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::7e) by SJ0PR03CA0187.outlook.office365.com
 (2603:10b6:a03:2ef::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.15 via Frontend Transport; Mon,
 20 Oct 2025 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 79BAD406561;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 68983820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 08/19] ASoC: SDCA: Rely less on the ASoC component in IRQ handling
Date: Mon, 20 Oct 2025 16:55:01 +0100
Message-ID: <20251020155512.353774-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CYXPR19MB8404:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b447eb5e-43c1-4b79-9251-08de0ff11340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GXLpc2V+Ut7z97jomrhb6l7NBkW49/UIRiDeT317ODE0end/U/u8Wv4sWw1O?=
 =?us-ascii?Q?4j7WgtY+glOXC2AvEK3RBQ8jOkJv7meTrzsNjTyUd0FKU92iuZY9mxXtlTnH?=
 =?us-ascii?Q?rgJiyn13EYvdedGipCvmi4DxYse48hppUcyvQ2d3aMJfnuPEI9BXryblCdNt?=
 =?us-ascii?Q?KttoEIFu+zv4MOlhGidX04+oI+pWJROgxpI04g43s6mDH8/2uc/rIzD94nf6?=
 =?us-ascii?Q?LfA42v5/OEjbi83skGFwd3m0Tk0riWVazmkXFUeG8ihFG8M6MwR/i/p1kAiI?=
 =?us-ascii?Q?5guiPlMuQapYLVP4XssQj+9s52g/qmEFu7f2x27TcqEQOVMoDwuqiUYXOF1p?=
 =?us-ascii?Q?WyJU6D8ClxKV01uEmsRFO3tqmsUXZGADr7wW3Fe7V6UeKmVirqUZ/q1Qcd/Q?=
 =?us-ascii?Q?4T4tfBmosP4duO/C9vR9CiaHwDlaMfDIV1NnK+sfzHrnk35Bq9uuPJXMhM3V?=
 =?us-ascii?Q?bjAJCvzegPd3T0cjil1d4m5c/8Y7+/j9UGza/I+tc6u+DejaNfuWK8I9cBy6?=
 =?us-ascii?Q?3CX6m2g9i6Dal/vrYHq9KDe6/uc1fU2DUafvw4+ZO+fqxLZeLm//381hW6Ti?=
 =?us-ascii?Q?666QzVeC6NzMFD35Vz+BKNHu48wJHCE8xi+F62Zqs5q9LOoOEaI/g9DCg7yu?=
 =?us-ascii?Q?0vVyHyNhxifjVyQokDZCspZ/lKSuZpcXH9Oy1CjdeMftO4T5F+oFqHAighvi?=
 =?us-ascii?Q?T4le//+8oGjGK1B3Abv6HKczOyEq8ydAAvkpYSpvlKNixfebxqM5nco95Llj?=
 =?us-ascii?Q?evXyQl8RQYtbPhIsqWp4h59QlUbdd4WOLv9YlsiFnyYUydmKy6cdR6R1mCsT?=
 =?us-ascii?Q?DXWDRpryourl00RIiBXpd7k4X+7vPmgGWbpBGodlscGTpDOWNdj9edtei2l9?=
 =?us-ascii?Q?iDm8S68gyv3pwb8GaWfXzlKxWCNYvAA/3TbHI89GQ9nJKLjA/qguUxHInJpF?=
 =?us-ascii?Q?+5FWFNr1ty2e/Va3daTJUPIbJx3pWdh2nFsUuR8cMxrWMe/PsmS6Ewwqlbip?=
 =?us-ascii?Q?y5nkZ7BWLAFokaPciLu8l6zHAwxehMin6GdssPP4zqyTtu6GOsDt8iTfzAIn?=
 =?us-ascii?Q?6SFKFLMd/x4+CcZ3gsqQhU8yxpUCc5Qi25q/+XBWw2DNpUwrMZLBoMWJ0JQQ?=
 =?us-ascii?Q?kp7MFgOX9r/lyP2t+ZekAlMzt5dAo3RcP8ZHIpPiSswSUwq0fEqZPmln+VlC?=
 =?us-ascii?Q?+n9L7zk/LtOyqRsZE/AgkQi53oNzmuSSVd0Ea77QYG63C11XZcvUg8yXnMUI?=
 =?us-ascii?Q?Fgglhn5lbh6WS8nZw80heONkHEy+ACkfNxQk6Z6PsNlmAAgYCgmqzAq9i+vP?=
 =?us-ascii?Q?Lii7AEL2KVhnYmKjMZhoEQ0h/I3+JCF6hLbrNNrLcpAaENlRDLST1uSDEY9I?=
 =?us-ascii?Q?fMbV9x7sWaMcSSc21y26AU+WTF7ORso7jAJH+WpxuTtKz8vm66Kvw1uB9l4y?=
 =?us-ascii?Q?WPgbtdP1K8RYON/VUNIJg/v3SKSXKL0u+UR8K+W/bpusvdyaMduFC9cjc5Eo?=
 =?us-ascii?Q?LEYbs26azPV9yLanTNgjw5RyzMb2jDTmjUuGxNVX03ggYa+iRU/y9zbkt0+F?=
 =?us-ascii?Q?amzoSRtCL9nHGKHro/A=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:21.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b447eb5e-43c1-4b79-9251-08de0ff11340
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8404
X-Proofpoint-ORIG-GUID: F0xV5G21iY9x4M9hPUvtIF3SzI5HjM_H
X-Proofpoint-GUID: F0xV5G21iY9x4M9hPUvtIF3SzI5HjM_H
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6d cx=c_pps
 a=q+eJXYAZv4KaB/BLk8O09w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=TB0_WRDuyzPla43S73cA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX3q17ZVjgMwuG
 Op7Oa6ms+AHlOUYSdN4DOyppqqbxQIrj/6VmqMMgzhlBB2L4iJqZzd2Mw0tMcPoYpT/62RIUg2V
 YGwjQXUfuu1V9xTJ5ptr/xFtpFnLX9qOepMc3Qi263XnSH0CcA4IE4wLAYrLmsEiAkq9y3SEukS
 7VxZ02TJ67e7c/07/hyQWkp3H4dA65D3DdHf7Qc+JcG7ZX35pw7o09CpJedw6w3VA5PCRLW6KWc
 QKEPrdMaGICK0ojDkcI9weklRs+5rQqfQq1i6v8e1azoExUlJSlJSVHaFj3NfK94aSEhiYqWs7r
 6dDmSBGbDPDi1txjKojzttzfeMZkro4+9dpM0tfhhgYSUu50cJaw3UqdMTp7kcEZCd/FFOUsPRp
 h3qr+5tJPE+W0cHHSyOmFkRAEyksgg==
X-Proofpoint-Spam-Reason: safe

In the future some IRQs (mostly the UMPs used during File
DownLoad) will need to run after the device has enumerated on the
bus but before the soundcard is actually constructed. As such
refactor more of the IRQ handling to use raw device and regmap
pointers, rather than accessing things through the component.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_interrupts.h  |  7 +++++-
 sound/soc/sdca/sdca_interrupts.c | 37 +++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index e4bf123936bbd..3983f515349ad 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,7 +23,9 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @dev: Pointer to the Function device.
  * @device_regmap: Pointer to the IRQ regmap.
+ * @function_regmap: Pointer to the SDCA Function regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,7 +37,9 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct device *dev;
 	struct regmap *device_regmap;
+	struct regmap *function_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
@@ -65,7 +69,8 @@ struct sdca_interrupt_info {
 int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *interrupt_info,
 		     int sdca_irq, const char *name, irq_handler_t handler,
 		     void *data);
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 2b3bb7d0cb443..d0894c8e0552c 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -77,7 +77,7 @@ static const struct regmap_irq_chip sdca_irq_chip = {
 static irqreturn_t base_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 
 	dev_info(dev, "%s irq without full handling\n", interrupt->name);
 
@@ -87,7 +87,7 @@ static irqreturn_t base_handler(int irq, void *data)
 static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
@@ -103,7 +103,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
 		goto error;
@@ -136,7 +136,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 		}
 	}
 
-	ret = regmap_write(interrupt->component->regmap, reg, val);
+	ret = regmap_write(interrupt->function_regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
 		goto error;
@@ -151,8 +151,8 @@ static irqreturn_t function_status_handler(int irq, void *data)
 static irqreturn_t detected_mode_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
 	struct snd_soc_component *component = interrupt->component;
-	struct device *dev = component->dev;
 	struct snd_soc_card *card = component->card;
 	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
 	struct snd_kcontrol *kctl = interrupt->priv;
@@ -190,7 +190,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
 		goto error;
@@ -209,9 +209,9 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		 * detected mode is unknown we need to see what the device
 		 * selected as a "safe" option.
 		 */
-		regcache_drop_region(component->regmap, reg, reg);
+		regcache_drop_region(interrupt->function_regmap, reg, reg);
 
-		ret = regmap_read(component->regmap, reg, &val);
+		ret = regmap_read(interrupt->function_regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
 			goto error;
@@ -309,6 +309,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_data_populate - Populate common interrupt data
+ * @dev: Pointer to the Function device.
+ * @regmap: Pointer to the Function regmap.
  * @component: Pointer to the ASoC component for the Function.
  * @function: Pointer to the SDCA Function.
  * @entity: Pointer to the SDCA Entity.
@@ -317,21 +319,31 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
  *
  * Return: Zero on success, and a negative error code on failure.
  */
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt)
 {
-	struct device *dev = component->dev;
 	const char *name;
 
+	if (!dev && component)
+		dev = component->dev;
+	if (!dev)
+		return -ENODEV;
+
 	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
 			      entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
 	interrupt->name = name;
+	interrupt->dev = dev;
+	if (!regmap && component)
+		interrupt->function_regmap = component->regmap;
+	else
+		interrupt->function_regmap = regmap;
 	interrupt->component = component;
 	interrupt->function = function;
 	interrupt->entity = entity;
@@ -394,8 +406,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			else if (!interrupt)
 				continue;
 
-			ret = sdca_irq_data_populate(component, function, entity,
-						     control, interrupt);
+			ret = sdca_irq_data_populate(dev, NULL, component,
+						     function, entity, control,
+						     interrupt);
 			if (ret)
 				return ret;
 
-- 
2.47.3

