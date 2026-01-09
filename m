Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF900280336
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970368; cv=fail; b=cHA7arRl715NYiuZtBhmXJNs9F8iREy0wzu5DQ+nwB1Q6SgvfbCV1WNhFxvKZa1Gz5rcgbyipC+UOce2GtvfAfij+hI6rnkTFQGdcJNwemuSktbnpYahm0bgiK4Jy1tiiEn94dENmo7Rj92OBofJEbisMXDQ4xJJhAKXIDGri1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970368; c=relaxed/simple;
	bh=9A1oOzoOetrv8CIVd2aMI7Gvpyo2mGyb54uz7un4RWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wep8lunh/h8cFtm3yKx/q6SQVc9t7AdTbL+XYzCLD2YEoFwA3Ze+cjfvnYw3BeR5bqU4DRdi0tQnQKONqwZgdOMMHKdUfkmdSmc95ehFdNl9aTbMpPCyGaPGV60ejZ7KbNOFEXHUMe7F5cyD6TQeG53Y5USy6bpPWH6x0Q6grlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TVlyozZC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z5zU/ABG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TVlyozZC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z5zU/ABG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095gxT23770029;
	Fri, 9 Jan 2026 08:52:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+5TJqqtYNZPhBVS1KGIPeiXCxEaKLTTMQrYUksmT0zk=; b=
	TVlyozZCXhiyvDQK7+qdy0IyQXzZ5Q+pGvTrTrm7SMMa7cZErMDoghxrCXCkTdnH
	0vGaoqiT60vl3/j+JVdrPQUOtuT6m4N/bghdyf925KL+sfgWXbi3/yLnZtH/SiD0
	9EF+JX5HCqGJxb2SSPa5XCAucqkEeHJZYg0lxGCQtgXmQO/5Q3IKIK9jMYAUX1HA
	rok/OsIbdcekv4u+HhMUj6yUoLpF//mwhKrQa0lNa63rAEwVHB5yyafmymxo9/tO
	1Gf8SAlyaEjXvj+Rn3I+w06J325Mipkjqa8O+CI7bAsXHzZD/+Z9D0q390j50PNV
	+moJO9Dm5CSEIYeBUeCj5A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021072.outbound.protection.outlook.com [52.101.52.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bf0dnxvbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 08:52:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgy1A4n+CpMBVDFiIYBxanw3QgV2w38YJH9fFyOGthIGNuPgCsXzPG2l0ETTbXWER1YDXE5d7upYZMkhl95Sp18OF360IJAO0OCtRF9N+Q2qema3iY5QNCfBuwuUOXu1gMyJMKPa44+GrlV0Mo7MKqd55tG6r/sbz9Dr2dG/x4Lp5yCTdMUDYlqnKgwPNchT4M4y7Cm1IJZwSeKV7azNMdsyFEs7nSu0U8WlUVucdEGl92fpZ8+zVlNQwqVFr1KfNLqQ8rusGwZhtYdpxj2gauWdFObqpRi/GHsTRoxqZE+q9Uol531Th7N2XGxuvqPEkDbqCSw6WIgE/cMcgfTvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5TJqqtYNZPhBVS1KGIPeiXCxEaKLTTMQrYUksmT0zk=;
 b=rZqZ4aaltf2grW8KTtxxwDuI846WdrQcz5aKzcMj+Isj6QWXXn0ufHfkSWbmyCkg5C6+zuMpiqYPduZlO+NQTXUAo4u+cO1388YL5YDFB2siONdUZpogdz2TL01vFesA3dRJvrAds61MzQakyfyiO3iO/CI1Ns3muakHh6dQsdNwL5dX23OtSU5e8xJykNN8slXwDPQNrAukVdfjDXJ87Dfv1lrLJj0WXupbhWUXRnsmnsDGXfHznOfdX4HNsoz0Nccn55r1R9kKAW6/TUN7NryA97H6rKRPljvTaKFYMc10ytIE69hCPTo/FODUSLy07gQ09/yTF/KB+xmPpnnaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5TJqqtYNZPhBVS1KGIPeiXCxEaKLTTMQrYUksmT0zk=;
 b=z5zU/ABGXTooUDWB6aorLvTRy9xpWjuDhCdh3N6IAYnmgP9DJmvcfbbRzn63pufi7Qa0ZiZcSROZzn5HplG0U7wYYCxAxarLcIW7/pKhRW1+Ejy42qdqGcwcD8MkzzHgb8r5syJ6N435WMJUh73e1d+DkhifRPSnfCQsxGx8/XA=
Received: from BN9PR03CA0449.namprd03.prod.outlook.com (2603:10b6:408:113::34)
 by IA3PR19MB8763.namprd19.prod.outlook.com (2603:10b6:208:507::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:52:12 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::41) by BN9PR03CA0449.outlook.office365.com
 (2603:10b6:408:113::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Fri, 9
 Jan 2026 14:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 14:52:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 432EF40654F;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2A9A882024B;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 2/4] ASoC: SDCA: Add basic system suspend support
Date: Fri,  9 Jan 2026 14:52:04 +0000
Message-ID: <20260109145206.3456151-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
References: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|IA3PR19MB8763:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd61dc00-b189-4d7b-80c0-08de4f8eabd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rsd2XUtvE9/KWOTMfDBUUYVZFiCsnE0lwrzNnTcRk04zK1uz/eBwK4RZiQZ4?=
 =?us-ascii?Q?XtGTnK+9VyWP7RWyr/7RiVfatvg9uBp7HmAcNU582/sqOriONAio2DII76mQ?=
 =?us-ascii?Q?cpoCGcCtEOUJCZVBjXdpv5B9WeVHaKXCtMSkhf6a0SVLBPKwVhzhVogqpIey?=
 =?us-ascii?Q?tplzM9dO33vhwvVF1nz7ZMi0KSvZat/tr8mb/9jPIJ1JgVbDj5EJfZKZ+mMf?=
 =?us-ascii?Q?ncJHWcev3pozvkUA7SuYFTzxkbAaNzCo0l9omGecnIUa/XvGz/pgAEAHMFRP?=
 =?us-ascii?Q?+iWam4uoT9qTC2ke53rv+vJ1d6eyi2XDzgUrC3lIloaPf+0lPctgSxrU5nBQ?=
 =?us-ascii?Q?dFqVJnreCLs8XvCozJLKwbiXeg7FB6L+k19AX7W6CJ3tgtU2noIZYOTeW3Wc?=
 =?us-ascii?Q?++GY8zCoVZZ+EBQcQLcp6wrUIxvWKCzrYzn/SitTT1bFYo7y7ZTfDEINyBlT?=
 =?us-ascii?Q?2J5XC9zipxTGmcWqQthzseKb9WSyYXWEwZGM1vEGiryhH3FiTmfGHL2ilDR6?=
 =?us-ascii?Q?DqOdHuL0rNxiA0DWIB9v9+Uj44XvkmYtPePo95hU9SC+LR1AJlme5HSpxmzX?=
 =?us-ascii?Q?Aw4ar6oeiqY12/gzzNKp6rl19r7HrLmk6HodHbMCQIJDI+UPmcY6YBS3U/4w?=
 =?us-ascii?Q?fozi35aDbqRHYxnvla6bWB1uwhxb0mkeS/99OyBXszQdmJwhTT9CcnhrD0mC?=
 =?us-ascii?Q?/1RZHsoblqwGcofvMS29LYbVUbj7MbEIGWUw/wyCsKo9Q7OTRnHtmMsW/LyJ?=
 =?us-ascii?Q?BcLRDyszxN80JwzFMjDLjGUebvy4Bt3qaX7oOdwjGpNwOwWdJj3hjBbu3L8/?=
 =?us-ascii?Q?NnabLkpj/b/7jY8pKzDWyzGxsKiSXHEn+a/0REZPH/sVYLsmWqXK8BTb8q70?=
 =?us-ascii?Q?oprUdpWAAKLz0UsHw3TbIPsn+oar0WSceLFvPg9q51uMknd+TwkadFn74iRp?=
 =?us-ascii?Q?kzpI4fhlZy0FlQaOyKvRRZf9JtR9CwnwKjqgYN521fF8ZlULj6DLYg66EKsC?=
 =?us-ascii?Q?zhw1w98xeibwDnAR9WDqAkTiPebfDBtbz6GnGxGBRuEcBVNDQr7hRuEsArkv?=
 =?us-ascii?Q?NOLci24om77gXPDHN1v8uAEmY4FSgs1itcOQJWQwCokQYRQJcQfVJ6KvDngm?=
 =?us-ascii?Q?UvTVHrlS0QPuHw0YfqojNXWvqIh7DdQ3aZbGbXeDoGitzscGWR3OqfP5TBcD?=
 =?us-ascii?Q?984aEbgIt30vx7Nlk/U/x8v4mbuLPQIbUkdTzGAsyhGoasZJ21T+yK1gkc67?=
 =?us-ascii?Q?H4fq9+p13EGQxOiDC3/P4SHGoVil37/qhLELR3O6u9XkKa5sg3MGM0MP8Ity?=
 =?us-ascii?Q?JWEeIo9HLI4gPz0J8KIW//EiIS601tdIOpU7qnji8WofJdKbfdXCd6DIbtOm?=
 =?us-ascii?Q?pVm+fEfKkxPB3tCI28I8oOpwSXhzYfkXv39ba4qxuJCArrTol2JgcvJZMPzd?=
 =?us-ascii?Q?VYpvYnqK6qq/nESjOvecOpT3ZcRqMKrfXIWPVLl+QVUTNtcjEHB+yjGrIood?=
 =?us-ascii?Q?8kBhV5Y3jEkC5ltsdwXW0Mo6jijEHdo3FbmshJemh9TmPfWOOhtfTrcfE+f/?=
 =?us-ascii?Q?NwLDL3OLfYf9TitN1WQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:52:11.7650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd61dc00-b189-4d7b-80c0-08de4f8eabd1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8763
X-Proofpoint-GUID: ccXIL95iBfWkdw2eJXe5dq_VGhPlWecU
X-Proofpoint-ORIG-GUID: ccXIL95iBfWkdw2eJXe5dq_VGhPlWecU
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=6961161f cx=c_pps
 a=m2/28Svseh3Q/SQ6sWV1ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2qmRqszdQiGn4CUastMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExMCBTYWx0ZWRfX01+BqHc7M0Rv
 33uncutljzWGif3nhd2nhRVkT1Q1RwsaA6VHzIQdwXvSGEn7i9WvgHkSWsOLLh9O1E0joPQswgf
 3jtgCONyEOGkU2ztpjYUQbg38K0AWSLlkLZ8PGYt6xFr55jjuMUjLjJux3TRelQz60zWoBuN25K
 7S0j9C2EtUlQvKZAjjg3XMJXWp4lKIzMe5cnW/2UZLiZe+GJl+hT6YWVNh/J3DWElTeZMeIFkIi
 cDhDpdinpFIIvuLMHIRvQr46t/KmMi6pUNbP2m0yx8mJ0LD/CWZfCM2aILVhrtMT0VFWMINzeki
 VVvtoy7PbCRe/DjjjAhqHqnHVhkwm6LJoXj33GbKyRkJm4c/OTzJdsP5hGQdphDH5xohPvGHcJr
 01p/2nsM7lwAb3ZIpsivXIJyK7Vcb5UsKUBSjpuZ50pVu56FLZYFjpSE08vKaRJv89SHuxeqb3R
 ykxj9LbNkGv6Wc487xQ==
X-Proofpoint-Spam-Reason: safe

Add basic system suspend support. Disable the IRQs and force runtime
suspend, during system suspend, because the device will likely fully
power down during suspend.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Update some error message capitalisation.
 - Add a runtime_get to ensure force resume runs the runtime resume.
 - Add comment to note missing operations between early and late IRQ
   enable.

 sound/soc/sdca/sdca_class.c          | 33 ++++++++++++++++++
 sound/soc/sdca/sdca_class_function.c | 51 ++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 349d32933ba85..6d19a183683e8 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -238,6 +238,38 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	return 0;
 }
 
+static int class_suspend(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	disable_irq(drv->sdw->irq);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "failed to force suspend: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_resume(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "failed to force resume: %d\n", ret);
+		return ret;
+	}
+
+	enable_irq(drv->sdw->irq);
+
+	return 0;
+}
+
 static int class_runtime_suspend(struct device *dev)
 {
 	struct sdca_class_drv *drv = dev_get_drvdata(dev);
@@ -278,6 +310,7 @@ static int class_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
 	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
 };
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 416948cfb5cb9..7d0a6c0adbfb6 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -33,6 +33,7 @@ struct class_function_drv {
 	struct sdca_class_drv *core;
 
 	struct sdca_function_data *function;
+	bool suspended;
 };
 
 static void class_function_regmap_lock(void *data)
@@ -417,6 +418,14 @@ static int class_function_runtime_resume(struct device *dev)
 	regcache_mark_dirty(drv->regmap);
 	regcache_cache_only(drv->regmap, false);
 
+	if (drv->suspended) {
+		sdca_irq_enable_early(drv->function, drv->core->irq_info);
+		/* TODO: Add FDL process between early and late IRQs */
+		sdca_irq_enable(drv->function, drv->core->irq_info);
+
+		drv->suspended = false;
+	}
+
 	ret = regcache_sync(drv->regmap);
 	if (ret) {
 		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
@@ -431,7 +440,49 @@ static int class_function_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int class_function_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	drv->suspended = true;
+
+	/* Ensure runtime resume runs on resume */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "failed to resume for suspend: %d\n", ret);
+		return ret;
+	}
+
+	sdca_irq_disable(drv->function, drv->core->irq_info);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "failed to force suspend: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put_noidle(dev);
+
+	return 0;
+}
+
+static int class_function_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "failed to force resume: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct dev_pm_ops class_function_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_function_suspend, class_function_resume)
 	RUNTIME_PM_OPS(class_function_runtime_suspend,
 		       class_function_runtime_resume, NULL)
 };
-- 
2.47.3

