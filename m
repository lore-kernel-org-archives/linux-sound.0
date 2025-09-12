Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C242EB85C
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673334; cv=fail; b=K3uLFajYwzrhhhNYsMYdO1YmnUDvOPzZg8dvWopFWu1vQOamRtwZAIRQ8KNrepC2WiUNK0MhjloGq2HuzZYX9IIsyd0y7m4be1EOj1PKv9KioTRzmAqGZKmZ4jFXm9N5lgQnn/0Sf14EA+7q3D4+KO4seFdf4xF1IErggmB6nfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673334; c=relaxed/simple;
	bh=voxpg+wFy/pw5iQlRCZ53z/m6AxHR7te7DRju9Ndla4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cgIZhaPjnUwX+SCTzHV7ei8HYkKu1OV3Q2iIrzt8y5NX2Iz/cl6EfqLWAi6rmBpNGbTeCK0IFm5iCnzixanYNA6gHlaeFTGZr4jomVbqa6o2U47IP0WBmTO17B/g5NCzOwQ6RAKQZqZRhTs1+Bsv0/jtmtixyEd4bBqgBKm85jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iKudIEeA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TJ2Sb9Ke; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iKudIEeA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TJ2Sb9Ke"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5o57S1233047;
	Fri, 12 Sep 2025 05:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Zf7awqDhMARqYv/xvDJyiE2wP4IHWthcbEZPmJQQzC4=; b=
	iKudIEeApwKHjwFY/eQ7jYBagS0irYIGH1RqAIWIa8wqRL0at8xVR9FdconKZmph
	o87UuBGnf9LJhB7dlXHP+1kULsB7kHoceGtLQgER4o8ie3KMVKoWCGvb3142DE2a
	1EUFyLv3/afjf847xuMc4SUHjfN1qlbdf3k/6qaGFkj2D0WCKGGvF8LJ8AEpEpth
	j0Uv7FIAROsdqhHelFZ4GtNLn2JBlbZzO0R4rejDfx3RU+ZTL3+fVwoiCBZBnyqc
	X6B9P7Y/znhRw6gN19zISLuRJOGmk7FNGj13hDoCxx3kJT0LJ/Ha2fKNp2BJ/1qB
	A6d3AwR1k/db6Mn/HM1fJA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2117.outbound.protection.outlook.com [40.107.102.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcpha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2QqE1wnwlOcNclrAClN+Uq2v0E7pSpi8WifK9+UYZ/QkVQr/2WX7QIled0/5/zjsDi/t68MWSny+vOBgB1C3N6e3QFccXEDv5OL1GQ5IrCaMzOlq9naiad+59QQIeeh4K9l6yEjiO0tWls0myeqQsIXpP1Vo1YW1jHrxdMMyxOtKQgFdCBcH0GaIt9SOMWk8bXt9lafQTsSe3OLLPTfo1BNabLZQ1D0uj6xhmCmBp1ErLHvS4ucFSSaYOEFJFwI5iYNM2mTw5rEcIArxC6kxmTvFXKSzGKY21vf86lWFafKwoSWG43RKKHr6fNxI5YNmB2pw6VGaZAEgMHS0A4fHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf7awqDhMARqYv/xvDJyiE2wP4IHWthcbEZPmJQQzC4=;
 b=Dt8MKkxhx+ETMNjNr95JBov/V8Kp+3EyCpeMRn9nKk17QpFh5Aua27931+Rjk2Pj5FkNoa7jir717RqbNqrXTbgw8t/KE+NfhHJk4OyIPCvstiycAzMci4xGx3oiBORagDMdKrLDLlLhtIhaeRFWtrEu6amlPo1UmSgpdToBag/JdsxjqgthhQNSN5MKI22jsub+38dWyw1ApoVUEKw1SBuHgWLROrRJ5XEl/KIcekWhjJr0w52OQuIKpTmSxBIbThvPcYvxR/x0S8J3Kr3zALCzw3Lk+2LAYgCPqO17kt171NTe9nCQTAjwlrbR1OkFStsOadFgdovxQHr2vu9HSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf7awqDhMARqYv/xvDJyiE2wP4IHWthcbEZPmJQQzC4=;
 b=TJ2Sb9KeF1Ig/kIR+7/Kc/9Wiq6fR0os4CePZci9MOO0kNbROIgD68AEN+6CYvEW7QNH5ufnU8hCRsj6qHAan5h4XKT8qoQeEBrN8USlLoOpw8zdopv7lwbHGzAgPttQjnHpWm4eIsRmit4ldouIj9KnvYJvKiuFuyoEWXapjn4=
Received: from SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31)
 by SA1PR19MB5136.namprd19.prod.outlook.com (2603:10b6:806:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:13 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::da) by SJ0PR05CA0116.outlook.office365.com
 (2603:10b6:a03:334::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.6 via Frontend Transport; Fri,
 12 Sep 2025 10:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2FF9040655C;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 08DF282254B;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 06/19] ASoC: SDCA: Update externally_requested flag to cover all requests
Date: Fri, 12 Sep 2025 11:34:51 +0100
Message-ID: <20250912103504.2679226-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|SA1PR19MB5136:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 38d6246c-0170-42a9-61ca-08ddf1e80df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jyUB20GNjZ4p+lP49clUCq3L7sFw31hWJMnkzUC+lZj/Aa4VWWkghqa7gwgP?=
 =?us-ascii?Q?C/RxsgasLAtzX1Yb1iOjHEwl+YJVY0/792iTFEoGS2uaqngZxoL6av5NnQjc?=
 =?us-ascii?Q?xxi1f74j3CJ7dxSI0Spp50qb/g9fA4puFi5NTGdwnQ1pUut6aGhjQvaLgkbY?=
 =?us-ascii?Q?dfYZG7aIs5bOgXvxsw4f+vZ1wUxJsa2XUl3FKYuDlH6IvOKXYhdrAfUcQaUp?=
 =?us-ascii?Q?PILFgQm0a5PQrIixDKQb7c3Req5xfHd9ZpmYaozElynItLmaLPF6eX/FZjeg?=
 =?us-ascii?Q?ot06wsqWzmVGll+vuj6COvuxeKibOtVYFuyuCwVHCFI5NMau9A2JJp+/R9jf?=
 =?us-ascii?Q?mcbu2iOlW+aw9YiXq9TOoKwMC9Yjsb5mS+7FAIMoaTXoCpuJjHZd2iacVqe2?=
 =?us-ascii?Q?v8JYOmHAV3A7kYEtBilku7I31UF0jxoRZicFthRoc3K8s9+8r6wi/YlDYD4l?=
 =?us-ascii?Q?OmDGK6ddJhzSrkQlH4tmjq5kj9E6dAVcX5mlz/lsXZI/sJQXnxJ9YHEHuI7s?=
 =?us-ascii?Q?zk20InegoEB9D+n1kugTJ7/sjXyGPrLNnxVF9mahaoGSM/5Zaho2m0B/+U7k?=
 =?us-ascii?Q?Y1CRQk5ofweOBkUX9CK/BOtatpAU47UL9UjPqyUmg3shU5NUZZkj6eV559GU?=
 =?us-ascii?Q?Q+hyz11WFRESfqbx+N8eQK2MTja0AhIpq5taPb6sie0NGWAos1DMm/ZOleco?=
 =?us-ascii?Q?MYfNIqRVQG3zi+Zy/PLQuPL3FX1S4HHWYrRQONDZgN5mjy15AxKscIk9U2kz?=
 =?us-ascii?Q?EjGr6FUR/yjyBcqHJT3MiQkAHuB8PDvaovdBMt19l8JFzvi3B6Hd6RIpQWSw?=
 =?us-ascii?Q?0CJM3gEuFtj7hgf4Qiok9KMTo2Brs2J+yI5DerHQUfS/HOvRFY5P3PFdr7oO?=
 =?us-ascii?Q?o28OtwQnxrBC0+tSYAyARbFYMKI7hrdqE56ifxfic/AmFvKI3ioZb9i1bLUp?=
 =?us-ascii?Q?rrGtXoMct2aB39ZolBKzEt9ZpCPlQlMZZddaecQKl52HmkT7R1QHKuSrR7F5?=
 =?us-ascii?Q?9/x5bNhiaFHxqGdBki7r2Z0SFmguDC0IAfMgC9t6/D8Zrlx75WAeslUq9E04?=
 =?us-ascii?Q?/RLXSc3I/HGhOCRRTH+fmnWbUlUKgXOEY7n7u8Qq/UNoXjkqIHwRVSuE2b22?=
 =?us-ascii?Q?5DKNa0XUvpHEG0NJTMZQhp7Z6/XE4PMCxHj4tZ1gVHbt+R5YSJcMrf717tZL?=
 =?us-ascii?Q?WWUptiqUR3rDzLFtxJAA/j7xJBvP4CHrg1jwp3/fXY13Rk9jZdK/ApPILsjJ?=
 =?us-ascii?Q?L3JptodES2Ko9OJv1EK4oACyFs5lJTjirZrlpqc1V6vAXOOm0z+DoXdOVn92?=
 =?us-ascii?Q?5jJN3jvGeO1WQp17O1RpU68Bkt2GfXR+y8TkVszs8gTfVrWLh3vYKkzAp+2b?=
 =?us-ascii?Q?ZsYuDA912EhUoK6O3dROndK6uXCtSXUibkOIJdtVQnBoILALw41W55EBDLdk?=
 =?us-ascii?Q?6opFxvlquc3BFo5bciZ655XGTCv2bbkyBYO9leq0K43IkOMRb4jVChp6I2Ff?=
 =?us-ascii?Q?y/L8WRpjhSy1krLsiU7OcgptU4r9rBEPY5ob?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:12.2183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d6246c-0170-42a9-61ca-08ddf1e80df2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX7U7sAPzkDeEe
 FfLpsMV7i9k0u+ny9HKDJNLPLpaNYOGS5eSMqdsu0lrWaYsH65b1wrxszvW8HVZi0cnL/w2nIU9
 SkvKvvC8v5wf0/Wza1T/V3Qp4rly1ahxl+St5kcefYpT1aoQ27uDmmIx6yuSWdAZHpTXoX1oRvY
 3jVQEsHlqEad/bSZIX1Kag6co9iCQK9QqXXzuxZtEhkzqgKUZjklhELUP6ac8W/+AoH9aanPc95
 1gBCK/bxpW2aupXyH+IzgtPnSGTMzw2aLvmsRHuytLj1zM2x1WbQ5YuPLk4Kr8Ea1QQ9DwNC/Mq
 vgnivTIMYOriupyLXXNYW7HTGnRjTuykoKDAYzrG5630SrrxpbeU4t2EDwzAxE=
X-Proofpoint-GUID: xG6GaIkJLe9eaBfA-m2hUpVpYYUKSKR5
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f766 cx=c_pps
 a=rxPFeLSN7eQknm+0RN8j9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=n3emF70xWfdXXSmRECkA:9
X-Proofpoint-ORIG-GUID: xG6GaIkJLe9eaBfA-m2hUpVpYYUKSKR5
X-Proofpoint-Spam-Reason: safe

Currently there is a flag to indicate if an IRQ has been requested by
something outside the SDCA core, such that the core can skip requesting
that IRQ. However, it is simpler and more useful to just note that the
IRQ has been requested. This will allow the core to also request IRQs in
multiple phases.

Rename the externally_requested flag to requested and set it every time
an IRQ is requested.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_interrupts.h  | 7 +++----
 sound/soc/sdca/sdca_interrupts.c | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index d652c6e94ddc..e2c1337d24e0 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -29,9 +29,8 @@ struct sdca_function_data;
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
  * @priv: Pointer to private data for use by the handler.
- * @externally_requested: Internal flag used to check if a client driver has
- * already requested the interrupt, for custom handling, allowing the core to
- * skip handling this interrupt.
+ * @requested: Internal flag used to check if a client driver has already
+ * requested the interrupt.
  */
 struct sdca_interrupt {
 	const char *name;
@@ -44,7 +43,7 @@ struct sdca_interrupt {
 
 	void *priv;
 
-	bool externally_requested;
+	bool requested;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 898069ceffe9..348462dd67d8 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -262,6 +262,8 @@ static int sdca_irq_request_locked(struct device *dev,
 	if (ret)
 		return ret;
 
+	info->irqs[sdca_irq].requested = true;
+
 	dev_dbg(dev, "requested irq %d for %s\n", irq, name);
 
 	return 0;
@@ -301,8 +303,6 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 		return ret;
 	}
 
-	info->irqs[sdca_irq].externally_requested = true;
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
@@ -379,9 +379,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 			interrupt = &info->irqs[irq];
 
-			if (interrupt->externally_requested) {
+			if (interrupt->requested) {
 				dev_dbg(dev,
-					"skipping irq %d, externally requested\n",
+					"skipping irq %d, already requested\n",
 					irq);
 				continue;
 			}
-- 
2.47.3

