Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769AE2F5A05
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797662; cv=fail; b=LwBQ9wuD/HhtLD5M7RxjYECDXConvY1VzZBjfR+Ih4Yrbli85/Oza1MTsGHgbtd8P5udD7QFU8GAfawSo1RuoarLXB9r+WdWpMznaJMqpK7YavsZzzmdlObDP86ssiF1U64Jujy4Q8eR75jjcFNFIXJ3W6S4wuPxJ+v8TipE/wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797662; c=relaxed/simple;
	bh=iIJjeQ2MvyYmmg8Y2gm/aLGzAnfAKVwROFXm7VWQffE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8J1b1xeN0E76J9NSZgAVsuCrqYWC98/py2A0xefU6zhR5mcFv8D9ghoPgFR5hofqFsuly19S6kAw10anXrycpapnmzyVAKRWIpgnaMGcSjANxv0WF0NinOR7gZ+pj/t95x8AzWDixCdnnEDHNMcqi3syL1QaqMr0RBZQ5ChR6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FYHeUrkw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e1oVpeU0; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FYHeUrkw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e1oVpeU0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4cfHd2734368;
	Thu, 25 Sep 2025 05:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=e7vku+r2E4678bsiXZJUPGGceI1Upp6VCD/swwvJu+g=; b=
	FYHeUrkwwXI7tQxN7Vq6fvrY/selF2NzOZIvVGZwQuP/AZq522+QlIDmaowq4tH8
	xz0cQhDT7GTaKhEEC2JiDIbubmC1oNq82OqaTwrbyC5+pjRdPyC7Sh1Ag6p9lp3P
	zgbosvnqWBEAAmnAxfUz2gb4+iB5fdStX4IWXS5ux6qFSQOOdtD8lARw6JdbxFeL
	ybMfNETDe4nTzrRGk5c+uHhkghDY61wViT9JHWJtNKRZ2IoWSoTc+uToUP1gbClI
	e9kOpDS8Dd5Uf1gIJXuQEZ25qvVcMdddwPMvKKutsA1aXl975752LDOJf6G3QsdV
	ncN+eDPneOVqyqoRDbQVVQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021077.outbound.protection.outlook.com [52.101.62.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8ww-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyamEkHXf8s2gvb+Z0n2Q1GJNF4tyao7AyzNdVeMErTH3WGckcj19gI4EzGvA2jnfsKtTiexhFaNMkvY2zX+svOBQOvHOZaVFghDEmjC6s3CiM+Xm3cQ1nlOEEjKqGgRrOyRk9o1W9Nj8loPrEOqLcl0Fq2DkoHE7RNzvOR+fQ6k6CFca/h7CFBZNH2/FuBDpU6B3mPwkK/nITBbn83AdP0wc+HyMr26tSWW1kQgVwOa4DiOKlJiVZKZdz5vNOMHL0Ace5u/P4Ru3p4VvbzqHTadX1MW+BnhDMyA5TLtBFcLeJiy12QoxeoVhBojXrwpR3CqLphBxcgWcwRSYKr7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7vku+r2E4678bsiXZJUPGGceI1Upp6VCD/swwvJu+g=;
 b=ki++IyuYpStSaeaWyvK2H8VaEK243va3kSdhEjaEuwPcv4TorJEbh8o3E8nY//mohy5Iw6ousHYdpy/JY7ran2FNQjbGfyTkAP8FAmHKx5PeR/GpTjkEZ2ZVql8GPAD/kVELuX9zT8ir4/3rOcHfYycU+IMfooooAPtKPVRE6N2gk0zn9B/zAU8SeVsHXZJyTTP5t7FNa012lQVb5sPjnjydPxFFU78HJVfW11bSCl+q+7Bz0ikeQg04l3tpwrMEwuCBPpL+P04h7+/o3IE5N8W52a9rFQAZT2G/nRzanpdrjdpOVArqJydADD4XEeWjQ0QjpWuI8/3895w2QnwtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7vku+r2E4678bsiXZJUPGGceI1Upp6VCD/swwvJu+g=;
 b=e1oVpeU0RjhtMa7ieJJvFWuzuv37pzHU+tM9pN7vIJUwDxx1X1RjEQaMeJ5IHJBWjkCF/8OQVdRx4uw/pRwhJ+viTW7gb0mqgoPAIwwdaZTCPQXqeb0cFpfZglmyKOA3my9krOtMDwBhNs3BMFSdjnKHQJp5azqq27xdZGrkS2k=
Received: from MW4PR02CA0016.namprd02.prod.outlook.com (2603:10b6:303:16d::22)
 by MW3PR19MB4316.namprd19.prod.outlook.com (2603:10b6:303:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 10:53:51 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::a5) by MW4PR02CA0016.outlook.office365.com
 (2603:10b6:303:16d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 36C8040655D;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2E2C882024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 06/19] ASoC: SDCA: Update externally_requested flag to cover all requests
Date: Thu, 25 Sep 2025 11:53:28 +0100
Message-ID: <20250925105341.194178-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|MW3PR19MB4316:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db8cb532-33ae-4806-ac45-08ddfc21cfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uEc4MjPxK5cu0bXi7jbnpwu4EySLGT0FCKZb/8TF030bvBKlAEjVPcS6rnJS?=
 =?us-ascii?Q?5aBSS6nEsuCroyM2NLcs/fEpOcmE2iD6Dvd8Kbi6IS8DFnw3j/g+2A4VajkP?=
 =?us-ascii?Q?2Eh7LIIJKMcatJAR27kCO8SdbQVzQwXrQ88bpBHDw1g+jSI6Xay223MLm3Af?=
 =?us-ascii?Q?MIGJZr3uTv3/G5AZhUVyeNHDnwAJLoSFAqpg2+NZJXdK7qVDagQNiFdYlo6Y?=
 =?us-ascii?Q?ZcLoZdRh3JjqlAxR/V6alFWNfkws/dm64Ipy4qZNkDz3fnMUy1+KleXfD6nO?=
 =?us-ascii?Q?acxqRCX/h1otZpPe4fVf0+wx5RddHeYM0ZqCe11QbBDPdtYtOoST7wWirvV/?=
 =?us-ascii?Q?mbj3eNKAn42uD2biAYB9m3G08Agd8gMsBiXozZsFGLDFVhACrHPwHgPzJK6x?=
 =?us-ascii?Q?mP2fDE2PyGsmrVhudbSjqQ88PabXsLfo0WPNBLHK3seue83bSLCcbgpTxqo3?=
 =?us-ascii?Q?lATgM+oVeSkDMBstiymFIvMNpSXFvauM2kj3lJzs1lYiBA90+q6fCbH7QJFh?=
 =?us-ascii?Q?Es3XRCN3ibPt8e8uO4fVNXrr9HmbH/O4Yv/cOWj/jotvXz/nC5AOSoJ901xw?=
 =?us-ascii?Q?aWZvaoyOfj250tFMFdC2pbjbfqq8Yo/cJvAZJL/7vXdECW0Vr9+1TsuTGlTZ?=
 =?us-ascii?Q?Id/RGQuK8JxkkW4ZGZQdnuxg9I7ilMQWUe49PiLw70RkEKQHgS1sJO6Zax7w?=
 =?us-ascii?Q?7IEvx+Z0xAaeU7QkO2JiZC/WYJXEhUxRLwCG5csJSdAjDlfl6r834/ftu/K4?=
 =?us-ascii?Q?jv4V/7JsgpPA3pNkP3Dq5oo03pPj2RrtgWK/FGbjLh/Z4l9rfQEV2UoW7Tdf?=
 =?us-ascii?Q?0wwJlkoD7Gd2aKMnJpDEE6u4kZXxytKdRQhNv2rGOMSAfULTn85OvTqGgQ+N?=
 =?us-ascii?Q?P4OWSwBZKPh5M3NHixhlgtEg0FsId4YN29WNA9MoahZt0v4ajlqsht64v8Fx?=
 =?us-ascii?Q?PRjsVNGv0qxmATweP00xYI+o53g81PrQgwDfTLwOVKh4zvb3jCDN/d+XBmoL?=
 =?us-ascii?Q?eMqhMI5dy2Wql8fX/ECOkgWuHsBoHOaD4qxZf5UhBi8JnZVQyeKEHB+/PU/2?=
 =?us-ascii?Q?51ltuOhKK0RzvSNEKMjj7um1XMuuzIJTziPH0x8iAyZO8vpDIpMzMN4HT7IM?=
 =?us-ascii?Q?jMo0vqgHKfoolt0N/HHd27/6+eiTQttO847lvaGr/5+dAHCumyXFWSJqbDZr?=
 =?us-ascii?Q?X5s/zWwVDfa9grW8BtlNLK8loIf1VxRr6KY3LKWnIqZbdyS/6Qkq80aC7XAV?=
 =?us-ascii?Q?mjbJWFPNIiXZ9D1TxonvKARHdaCQNxfoZOmaqV0OncFEgBKANF0dHv53+ccK?=
 =?us-ascii?Q?R3Ur5/NuyUK1et0PgR+JNgINmh4aZYfpR3nZJqmZp7xL2KIgG9wSc64k0FdT?=
 =?us-ascii?Q?2V1P4+cTxJbul4SB/zulJ5vIos0iKPcFYwBRZr+ZvY2hAoylRkltbRlbI5KV?=
 =?us-ascii?Q?ZMqIIJzmCWO1pZqDC64HfTzcIimd0G1h+CEtQuVb2CuHR5ZM7DnVguwkWmNl?=
 =?us-ascii?Q?g6FjlYq+5AgiyEXt5oGq/TZLKM3sC6H6vK2Y?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8cb532-33ae-4806-ac45-08ddfc21cfc3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4316
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX7uJhTtmLsCKJ
 e2Cpcn8hSUNJI4spMJ/8Stpgd4YbgnUfD2ONhH+423uOAL9UYoylq4J6WaAP0qUoULpDGTsW/xF
 4nQEKOTs7N+wpUwrQvRqfcpmwfijhwC5WaYTDAanL5zmchhDSrvH5hApheL32hQw0WM3gW/w8yZ
 8Zd51figgVLsPUhuJ6OT/YQDEJF7+5Bae0zBfgsbiNwESW0s1Fro2P31z1gP2VxVr9ZoqEiffht
 hMh/zwU/aQ4lPNi3vSEx3O/zCBJLuls/mIMkVrWMUSCCD1BlcOnnRPNji/bBRZHt/py4hltd8yR
 AAvcejIC67V4H+aceyeBvLtZQ2wgYlM6ql/kzTPBGzlZ4uJecye1UmoU0lmv+Y=
X-Proofpoint-GUID: xqQ8X5iyzhTivEKr8ZK1yZGzXIh5T5_Y
X-Proofpoint-ORIG-GUID: xqQ8X5iyzhTivEKr8ZK1yZGzXIh5T5_Y
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f43 cx=c_pps
 a=Qy130IFfx9qnCPISBCfGtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=n3emF70xWfdXXSmRECkA:9
X-Proofpoint-Spam-Reason: safe

Currently there is a flag to indicate if an IRQ has been requested by
something outside the SDCA core, such that the core can skip requesting
that IRQ. However, it is simpler and more useful to always store the
allocated IRQ number. This will allow the core to see if the IRQ has
been requested, to perform additional operations on the IRQ, and
request IRQs in multiple phases.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Use IRQ number rather than a boolean for tracking used IRQs.

 include/sound/sdca_interrupts.h  | 7 +++----
 sound/soc/sdca/sdca_interrupts.c | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index d652c6e94ddcb..e4bf123936bbd 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -29,9 +29,8 @@ struct sdca_function_data;
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
  * @priv: Pointer to private data for use by the handler.
- * @externally_requested: Internal flag used to check if a client driver has
- * already requested the interrupt, for custom handling, allowing the core to
- * skip handling this interrupt.
+ * @irq: IRQ number allocated to this interrupt, also used internally to track
+ * the IRQ being assigned.
  */
 struct sdca_interrupt {
 	const char *name;
@@ -44,7 +43,7 @@ struct sdca_interrupt {
 
 	void *priv;
 
-	bool externally_requested;
+	int irq;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 898069ceffe93..cb7c7a6f356ed 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -262,6 +262,8 @@ static int sdca_irq_request_locked(struct device *dev,
 	if (ret)
 		return ret;
 
+	info->irqs[sdca_irq].irq = irq;
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

