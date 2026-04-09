Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2D2741C9
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753047; cv=fail; b=QK/EyEjJpjiCMkR52VUU0tOm4oQszQ6m1QLky3RpfuKeClnHMhnpGfl8Ttgjdn9pcCXpXhZXtFGTvLq0MXr4LPDCjOjAi1CMerMXt7C/5K6E6oY1qcBhn5azD1qYBHPFyGoEsl+CCvExcCXwAArm+ASXRyyAO+E7RzjFuYfoiio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753047; c=relaxed/simple;
	bh=vLWRrm8+rm+HJe0GX8q+1AFShmZ7KufOgjKtBivezYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebJvn+FjHeZ9AzAUj2J4RAkM9YOaqhDWQFE/TuixrxqcHKFC731n9Xp4sYviqR68v9FHw7kDb5cArSFoLSUh7NKPpElYQgZI4yGxRyUaIVJlaZSDNYVvVVbxMJCD1a2b+8sYOD2ChHBhpL8Ds/9ueixsYU76DyWCCkaZ/F18gXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gC0xRx8X; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lFnKVs/M; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gC0xRx8X";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lFnKVs/M"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394xWJV3029315;
	Thu, 9 Apr 2026 11:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hI7jS98g3eIS84YYdJPnfeoj1VCt/n29r2ZB0LncY/E=; b=
	gC0xRx8XGS1hlIH3hfxQ7syFAaE4wD/QWgA1VEaOjZ69srzKel4D8eg7O3VnaSgV
	yqlyXuiBQ4QAd43p0HoB4WwFQujsvgpm3TjVOhhr75t0WMdfDLbx9+71kSXHWjpW
	LM6sC27V9AcX2UGp1WVL3DVNToOTV3EHV+O19G3NQQoiIkbV1L2W553yVLD1mf14
	cpVn00+MHAKXKCctV+BRiIgAQPEtpPtQATkV5T29YV9YRdgGPaLM+4xu/k+mUPXk
	u8CZiV/qo5yBMiDGLc64uts3TOSXiGf8//XvZd+wH066sxCxKq+zM4XJ9ec7BCZN
	OZeZ6EJsDpefe/n0IGWkVA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020103.outbound.protection.outlook.com [52.101.193.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7m0yq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:43:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyflZ4F0UHjcY2XAdGC0Qqy6NpoGQ/uRZB5PH2iCoV+HMW1Mqb/iixMflfxGWETmnxTLiUnl+H/WQZNFi6ZkqMpSGXv0OiqBQFm54Pidk1b/QBq4i7Vnxs4/JYumxILrAWu/gvBW+bSI32rbNFHUw+qspHMrWO6xGBIPaE/nH+4+vbKbXRJd3X3wTbYf2RrcmWVrQdrJ9YfQRAZttXEmjJUxX+rBw6QCHvg9KjgjmT1VFzqcnCG9EuYRz+7xJPKJZJ08mMZe+2GEKvkwGaTAuHzxUjMxZ+mxrQLj7EPXV4p+kyh4+mbEFA86yR8huwOVMPW38MYjBbkHKcrxSrt8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI7jS98g3eIS84YYdJPnfeoj1VCt/n29r2ZB0LncY/E=;
 b=eNS9rBftxCEwC0zBXiIkUE+Aa0StpCFEwR0s8DQgj5ZAkYBPjdT3rrbOGMNwTZVvnCZnFL5gOKfbq14P3qlVo1vhI3cqZrGFn5pBuItafbbsHe/+iRfgEbl8O7SR2gNK2EIZ9DfG08EyMMBmAK5n54PwvXw3G/mrSs/Je3yjwZ0XPCP5FSESe1ZGcHbKeMp1q85jUQOIlHjJhufYThbH46vG3PqYKIRxqxcIQsg+VSUHNlgGK8dyEhO3O91ziDhh4IdrO9TatS/IJh1xWbITcMTCYAeigGZaILE22AIoYp8v9ljLpDYexGZsmRXTD5nWdkLsAYMzh48VOmmmlB25OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI7jS98g3eIS84YYdJPnfeoj1VCt/n29r2ZB0LncY/E=;
 b=lFnKVs/MWi6TqprX68vnhfutiyCX+ryDF6VERT4b4jiVV1O9zbSSrtmMSG7IezY6t0wwuhoymGl+hH0xd2JKFsHxPXkRyL3Q9t5nn3hDNRmWE3+tsSWUPg0x3XdHhmbfkyL1+02ndQ66MWWxrXj+Tx+2g1JOh27Cr220sR4GqYk=
Received: from BN9PR03CA0568.namprd03.prod.outlook.com (2603:10b6:408:138::33)
 by CH4PR19MB8731.namprd19.prod.outlook.com (2603:10b6:610:22b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 16:43:34 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::fd) by BN9PR03CA0568.outlook.office365.com
 (2603:10b6:408:138::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 16:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:43:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 57DFE406544;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 32FCA822540;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/4] ASoC: SDCA: Tidy up irq_enable_flags()/sdca_irq_disable()
Date: Thu,  9 Apr 2026 17:43:27 +0100
Message-ID: <20260409164328.3999434-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|CH4PR19MB8731:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e92f8784-fdca-4c42-497e-08de965723b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FlE2g4XXTnbav9exYO2bNCIB6RgQmAnTttU+LXqWuyudrB2V6CH4EyqODtLXIIYG2/sHZNewgUbD4EwAP9YYR4Kj8qYr2IAeHdQwcOs2SBVUawqJBTh3E1kxunA3QHYtxsEdmve5TpEsauw9f0f/qjTV8LNPM3hW8IkS4EPq3pfwO5HToVPQQtYIA5FrNR6Xxky8f8h4gXBvinSTSzT2EtteARG1BH0R8y4s46t/IK5WAbNWGm3qTuocwy0rDWjz5wmcF478kaZsBdMC/gNB8QBNFWSnFdVU70Ki+R783Di1C4XmOBS/pmu8UBfaB/jy1un269fLTsqVXYlYbk1mlMX2JlFOfFNUFCDI9LCQNMnUJQh4vQD11h5dRGP+NsTn8Nr8137SmeOv83CJ/cqfy/mkJ6Pjyq+Lg4oX4PGwo/+MW2ieD9c9FlaNT36+5Yufz6d5PPLfoq7aJrVdU02NbBXPF09sUUM3nkUA+rTh4tuvjUq40ZMUJKLJXWmEgoqHLbiXlBCQ5AJEaODJcyWNGxzgualPet+4IiASUHORTZ2GCDxn81kQWfc+GXxdV7IZyTJwNMPglnoFEP8dOS2FeaEXmaMQVcP1LXBKqS1vBxcNm7YiUP+r3epByMeDALQ7iv6DsljHedRAZ4E9urq2uNCuJNH0k3JevNjmwtFz47+RumuhO7gy2YW59GwCns6a7NEtpaEwy/XBZ5s6n79KMUMGqy4YdtRLrR0cljyhWuv1UYrrz19MQj7FAyOvIv5nmTnR+jf8fdjCaKirr80VkA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rrjNbhlmvfdPx/5D8XhJqf+g5prcEehlyzjHdm3uY0KFhddOdWTjcFrKkoyIFPJHcPuvk0lPOJGa4rAdeNxpsbFUwT/M02qDCsZx4uCM78n+fwhUH7h0OMt0IDL/FakgXQi52mzIaOpi41f3MGQpuHI8tf+XjulcuBjnoCbsCe6q5ZrnZ1roTpyNwQN6T2UwZJ2oLDPcxggTdJg94KxL4GJziOCyaV+8vsw8RUTxon1WEh5vo1CE7J/NphwJHglc3d51c4E5ADSp+1bDN532XCkyn0eYl015VverXRZoxVZoHgBIVQUAXjZpuSiIK2aBoMohr1UbmC4JocsvjyYsJHaNmxW886iPWQWRGxumAM7o2mtTzsIqlb733YLUEZZwu6QXIAh9kArmg4xgyxZGW/8f1O+52erhrIuTNFqKR4VlxFznb5ildZ3/7Oavfqje
X-Exchange-RoutingPolicyChecked:
	TwhX/xWUlJSYkU8obkZOe+uofQNcpcqWHE9HnZhbMN6n9hK7qQ/yr12p8KPm1RgWH0fnIHCbAkwIdkdTFSfXAGiP03Zhq5YEGA/vk7IrPGn0/9sw02mtcssupYcZTwSDDRmKxf9lmLlOqxd/C1+pLZ6LkXPghNg2dSGYiyTZBbLqIjlOLvEuyTn37HsHPYfP1lrXyZyeqdOCUS9Pa2AOy4R+psZADtLQpKRR46BongCd5VCZnAKXB6Q4y0YV9rBsXjrcciiZBz0Y/jK6IM2NtSgpOqkqhlJ2YrJDQZZNpRqbQ2R3KgiLI1JAnWPe3vWqSNEo1uS/mSO2II6IDK80YA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:43:33.6259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92f8784-fdca-4c42-497e-08de965723b2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8731
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d7d740 cx=c_pps
 a=Zp4+jYQMTYkjuDMG4rCdsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=yF3iOZm52z5FeNqd6rMA:9
X-Proofpoint-GUID: wa77bjZxCorumqjHdO893JTs-629qKfM
X-Proofpoint-ORIG-GUID: wa77bjZxCorumqjHdO893JTs-629qKfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1MyBTYWx0ZWRfX4Qj2/lzivYSB
 c5hicky45PgLqsoPICDAQcSfNzFkesGaIl4/JFmMkXh8HHUrmlWt1Z+Bu0+cyIIFfeoLpD60f/N
 /Ep59zO0r0CRU/Xm5UQaVE2J/ePN3hbFl+PvsJW3fVdsIEJdfTMidSxQVHxRIwVN+ZARbHKTxeQ
 f68+xBDiN8CQtOtZ4D6493Z33E2eOAlm2Llw65f3/UOzGqpo+cf8MhR2nRYyZIAvhDcnawdIdl9
 RkzHlr+GDKlPHZHq6s1Chd2u1boP8JpZtzogcKQvliz1NYMS8XqaKvj0kZkSB+HVhKKwekEaLKS
 N+4ZZ1k3ca+1+ckBUBsCRG19CLCoMg3EXXHxbQnTEECv8UsR+ZblrPkvB+v96XkMPEklz6xfwui
 4tI0/3mXYhUxgkIiHU14q08mT86BUL3yiN5ugWx9aRZyRWpDMFR1hz2O5zzcodJls7RHMePYzWE
 ghqqwA5vYhb6vdT/AnA==
X-Proofpoint-Spam-Reason: safe

In irq_enable_flags() and sdca_irq_disable() there is a NULL
check on the interrupt data pointer, however this is just pulled
from an array so can never be NULL. This was likely left over
from an earlier version that looked up the data in a different
way. Replace the check with checking for the IRQ itself being
non-zero.

Whilst here also drop the sdca_interrupt structure down into
the loop within the function to better match the style of the
rest of the code in this file.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_interrupts.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 475aebcafe3f1..3d7eb19967243 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -630,13 +630,12 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
 static void irq_enable_flags(struct sdca_function_data *function,
 			     struct sdca_interrupt_info *info, bool early)
 {
-	struct sdca_interrupt *interrupt;
 	int i;
 
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
-		interrupt = &info->irqs[i];
+		struct sdca_interrupt *interrupt = &info->irqs[i];
 
-		if (!interrupt || interrupt->function != function)
+		if (!interrupt->irq || interrupt->function != function)
 			continue;
 
 		switch (SDCA_CTL_TYPE(interrupt->entity->type,
@@ -689,13 +688,12 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_enable, "SND_SOC_SDCA");
 void sdca_irq_disable(struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info)
 {
-	struct sdca_interrupt *interrupt;
 	int i;
 
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
-		interrupt = &info->irqs[i];
+		struct sdca_interrupt *interrupt = &info->irqs[i];
 
-		if (!interrupt || interrupt->function != function)
+		if (!interrupt->irq || interrupt->function != function)
 			continue;
 
 		disable_irq(interrupt->irq);
-- 
2.47.3

