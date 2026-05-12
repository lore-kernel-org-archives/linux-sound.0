Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765FA4C77CE;
	Tue, 12 May 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580880; cv=fail; b=FQXKb1EgaTcyXVQdWpB+rr2Z5DjiLbXqmzP9ouhCYNv1N+GGwOxLXPbJJeGzb4VZ+xfAF3HG0Mz1UN2EMZPzpOns9dsrzcyNUDX0d5OYhP3rpdxa2KSd00CkBSAxs8xElwrdeqXRn+trcu72EGEeVuDN8+kycpAiXBqbQggLFZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580880; c=relaxed/simple;
	bh=+BKr0JFLyrdOB7h6QMlTQACyTzqnmlFN9IV5DdCUMlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W04bdcvqU5PE5FjFNq6GQSVF+56AlGuX+nBEXsouhOLJq2K4dJK0r4q7+8f5Dkva4ctveKnNKS9ubNugK3e52CxgRVMhw3ITW35C6lJKLFCrKHXnlNEKbqgh0/uKWDQteTkqobbFyl2HCD4EoUf9L665vFVAKZKSf7moWgBNkcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DZrH2JRf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nVmPVEaY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DZrH2JRf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nVmPVEaY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5x1Gi900775;
	Tue, 12 May 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bsRbkq6ZgbDEbf6qwNKbXSPFYZEA1zqxPWIaMkgzOt0=; b=
	DZrH2JRfYGbv6vLy5dEVQ7OS8vPsdtd7Ogfks4Bx5bil8A8Duyjt1RCPWiEPF8fw
	1cZ8sBaDp7O4Z7uh2eOsBUjoWfI1MvK5UWFBSogjzlckTQdW22qB2Crs5dO71mNY
	964yRwZ/N7mJlk/Us3AGJHkmOwuDofUynyhyGVoF8I4Jun7wW3q+guFse2SUoZLW
	TGgReo/YQjHNDnRcRI5SnZpj32C9dNPG16aMGtUygtYCMh1ZAmn8/xYovYmfd6jM
	iOh9edm/JPP9bqGmFbJ4MS/YWY4PgeLTI8WDuMcp2shBfaZoFcjrNo+oZt7u7H+x
	qm6UPDKEpHxVvr2deib85A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022129.outbound.protection.outlook.com [40.107.209.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDdHUgdNWhm76H2YHmNco0CmKB4hMU29Y+wy6McmEePwD7fwUaJZr4nCjVIGnMGnr0Q1qemn0bCkNmJjsr4dE419Z7IFN3ZZBOfxDi2DEcJWgwhtCdaix+C4/ZiohI8V1NEHlD4SAqET1Wx+UE3CQVdJ5yARF0nzgPDtIt3zLlvZH1cP8crENu5A4v2b0mT7zUe70VvPYFPkORRgKxZtpLCAlEvpUGTbKbwgnOq3EFDveqm0GiIpaJXmfpIc0XrX1y8pWGHZ7Yb63+91DqNQm4NVOTymtl4ZcyyQ9GoKFflKq3y4bNd/IjaoJ8PK9H2RrGeZ6QXTj2XsDGibQIGT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsRbkq6ZgbDEbf6qwNKbXSPFYZEA1zqxPWIaMkgzOt0=;
 b=xz6Et69mhvQoxTNzN+5cqNMa+bjgIaAMqVhHwsedkk+J7yQBfyJ8JeVfbHHGrKk4Ggr7TAR8SR08NSequ1LsfTzen3cEtUd67BuQ2WWVJi3tRFo+vD65UgXCUR62KyeL0c1u0+V/z8f8vEfSelVxBAvj4hL+RwqzrG9MxdysUnglQh+Dpo5aOvemIXlFPS6tVE0eEmy3RFdseEux6U6y9wF3CsBoChQB79u7JNI2YSE+UibSHrrATnoAkGTaGysEOmuwcNQGFMDDR+XmZvyFLJ9r4w3XNhr3FDc52iYi/lPjd+xJ9/PIqlYeeqIwmX5BUBU6SZLF6GHB9Ot5hDhVOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsRbkq6ZgbDEbf6qwNKbXSPFYZEA1zqxPWIaMkgzOt0=;
 b=nVmPVEaYN+YeJT7og6IGNx0irtfAeFfpYiCuYRzZcrZJ6KbCVCd6Wl8fwdJ6oTmeeij+HIuMIaWyionG8yowR7LJfbKgMB01FrgECj+JCqa5nW0wBwXXgxcxE4k3/OAyoN57aT+xmTvRF7zG02Ne503Koar28XryDrGRX10woxk=
Received: from CH5PR02CA0018.namprd02.prod.outlook.com (2603:10b6:610:1ed::20)
 by SJ4PPF046A23232.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:53 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::3c) by CH5PR02CA0018.outlook.office365.com
 (2603:10b6:610:1ed::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 10:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9E4A2406556;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 86D4A82254A;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 01/18] soundwire: Add a helper function to wait for device initialisation
Date: Tue, 12 May 2026 11:13:31 +0100
Message-ID: <20260512101348.1138044-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SJ4PPF046A23232:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 64749917-3ecc-4244-62fa-08deb00f2b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|11063799003|22082099003|56012099003|18002099003|16102099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	RRxCwQQ6KSYJH38gHnbDFX9p+/O1ZGGV6wDTMHjNggh10wx8N0DbfVr2h+Q7xz7ZrOBgB1jdIHGB6vRjp5RQ/x4yu2eKyNTJgRA76P9Hg3iusP43avDrqDS4eMHF6oQS0LY9DK+H86sqKkqPnMituWOIUlXXqPdFP115SaW6LrNZ+YniRDd8h3yZYg5aAGuLKKIMzfhTK0EV5QEGqYTV2n6JHk1KYB/34HAvEM/Abpn9RRyYvUnCkDb+dvvsDKWBHRn8xY3tqh/VjIUB2DdIc1HOjFunfyGZCKqIS0GBtpGyhRFwzp25MouShBCTl7fj+bVZqVJY1wXGb0ZbLvYNgdRzd4zmkeaxJGryRVd8mls8OdS3dSh5GdxXhMhC8LVliKoALCME8pT2OohCeUN3JPLmMtIR2oIYLb14YEh4GUCFm4dvpLO8vCX5LpnLu7hh42DYMHBy3Y/GGsJe5j9Hd2EqwvnNb4zQ+1T1RAeo6VYRsezcEkTpCkA9rupW0LBQfFeFQCzbtBuRpnz2c1BAJLaJ7SMHp9eq2LtDJJjRuL8dby9/C/lOaqEhDYUy9IL9oA4W7VqNNe4avW8/UBo1WGSTeFN3Kyv+4T1GT6U2KUPlG360OKDPSXVnkqePeIJSc3B9ZrV5Cv7otRL+m26a/I4fbk0+5pfk/wdI99syzUJbnRc9q1gzo+cuyFzjau/XMK9bm3z5x5LiXGi4SclyCu+hNVN7DuU0kO7bhsXc3i0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(11063799003)(22082099003)(56012099003)(18002099003)(16102099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dwTGL0vUbkaMasuilvsjBBFg9nOCEBYAbT/PrmwIZz+AON9zUWypdPea+mQZQxI52F43bu1O2XrrjDZam6gPptvkCHCh1y/9PECZPQOLoc+Tb6lR4dNOgclOc2iITdMWqhzxeL62WuqHGNe0AhZJGwipbPYwpJFY8G2uJtaqaZOwd/hEo1OhSZy5NsqMBlKsMetSHhJ+OwIzBN4iWVnNL1IdthquIWX7ytk1DFSWnKvojdFKkY/wa4QlEGucXZlHiydp/qjKOke2zyU9/gDct0jekAAZVJU4ja5J39wjCWhSfrUKGk/+VrxbwAP4bkmOe2Blzk4LpREirDtbPW3RhEZPPrBq8a4VnxQom5TzVpoEz652PRyyYPtdFTJxHSEucGhJSaspIQYJjlxaOuDUnn8IY+MZMXoUeUsL6NoWT2490ciTqevASV3jJ8kQAZkn
X-Exchange-RoutingPolicyChecked:
	O4hRHDJmuhCyMfZPwaHswrnR9W7jntPdJK6LMnPS6oAqPb/cj3H5te2A4G0kdopxRbHZMNUiLCc/lRAujPnDQogYlU989qWbI3JGX00nIJFJhcQ7W6HsWGv80EHYHmpjarZ75Cv8p6hU/D+jzyOXI+LPu0J0flB8oKJLMY5uo3UKhn828o8ilXohD4NsPXInD/O5CwJzrHNpq3ZFlZa3Y/tm+Yg5QwriZi6jPY6NgjBQEHUh0Rc7vFjFDOLtDsNuW/x5mqf+l3XrGlYUDvbdhxEnQ/9NiGrM+cPUSOjQBzvWjuILMWsE7faYXnCfPTBtush3gcIdphzTgdsUdoYKFw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:53.0015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64749917-3ecc-4244-62fa-08deb00f2b66
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF046A23232
X-Proofpoint-ORIG-GUID: JFmHI4xy0v0I5mO79N0Uk6lGwDh4rbLU
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd66 cx=c_pps
 a=6Bt0GI45FyvFQl6hnU1EVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=G7TytVl67iZrf8OmxWAA:9
X-Proofpoint-GUID: JFmHI4xy0v0I5mO79N0Uk6lGwDh4rbLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX49GqI0fiAig9
 iFsyDuLTfZIsCIvzGa3EFkmb+vgJzmXDkbf4O/WRmohVFqRHXFzzZ0CacZHnTJz4+xM9uPcZb3P
 ww95FI4SNde1W78wWvrOmUSoGqq8ayFScMhaQp+UZYRrAA2IF/NZ054fvgpYVLBvnLOOnpokb69
 rQEoKlJBxZ1klrsR3AZaBEchR/x87VHF5c1JBGuD/m/QSxXbcksE+QL91kzDvf0bZWp//ylWi/X
 aFjizwhjiq65GmCrrrphKyGaEjfXRjU5dZouS83FSW57podbuC6qCqSNzKdWu0EaD5CYU7OApHv
 PmmU1R6FQWXGnNhuw2EFCehaWAu24EE87qQJR4ZD6HH3VTA4Spp/BjZ70mnRbYK2wShEeGSAywv
 ibannX3C37dwde4h5uvPuPEX3wyT4LEGfm6PR3RvOaWAJZ7cXeYPsrTcA9Pw7bu6t5DuuwI6VmD
 UtgxJCwukbvdKRjmZdQ==
X-Proofpoint-Spam-Reason: safe

Add a new helper function to wait for the device to enumerate
and be initialised by the SoundWire core. Most of the SoundWire
drivers have very similar boiler plate code in their runtime
resume, and that boiler plate tends to access various internals
of the SoundWire structs which is a mild layering violation.

Adding a new core helper function greatly eases both of these
issues.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Updated timeout_us to timeout_ms
 - Updated kernel doc to match

 drivers/soundwire/bus.c       | 31 +++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe5316d93fefe..fba00ffcce03c 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1372,6 +1372,37 @@ int sdw_slave_get_current_bank(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
 
+/**
+ * sdw_slave_wait_for_init - Wait for device initialisation
+ * @slave: Pointer to the SoundWire peripheral.
+ * @timeout_us: Timeout in milliseconds.
+ *
+ * Wait for a peripheral device to enumerate and be initialised by the
+ * SoundWire core.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
+{
+	unsigned long time;
+
+	if (!slave->unattach_request)
+		return 0;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(timeout_ms));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete\n");
+		sdw_show_ping_status(slave->bus, true);
+		return -ETIMEDOUT;
+	}
+
+	slave->unattach_request = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sdw_slave_wait_for_init);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 6147eb1fb210d..7e5818d989294 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1093,6 +1093,8 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout);
+
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
@@ -1136,6 +1138,12 @@ static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
 	return -EINVAL;
 }
 
+static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.47.3

