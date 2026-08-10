Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082FF3B813F;
	Mon, 10 Aug 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358467; cv=fail; b=kFj3QyUE4TrX0KSEYZ6n4C3OLmfqpyrK6G5KUMnKraMoBABXXt7WnyRmg+NDrA9VLjeaHhxCj7VBtp/I7pkgMyCp6u1I5F+3C3X1g6z9DudspVci/PF61lS4sz1Aa+D2vZF+wJXWxBijDgK7E9YSpyK793Hs3y6uk7vUwoEYgio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358467; c=relaxed/simple;
	bh=Ahs66vytiMg4eLQbow57JyuyzF3h7QebpinKs/Gloo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYgtQEqEvUEURiykVywdUhheusTvpdGhrkl0Fl+iGemUZ8TOFmuGuOJPulHU0cypkhivqAZAb1Ur+JwTxWHAMJ6SowX1SbRhII+AIQvMjFmkrGEGUvSZTVTV5jfWtXtOxbUDXODhetOedEHPHFJfxQGVxV4VIrkDUbdzp19dvck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aixSbaxt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=azTmPVgh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aixSbaxt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="azTmPVgh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4bbbR2527591;
	Mon, 10 Aug 2026 05:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ru+bxVzt3rEfKExTgcOwgnkoi1yxEPP8rMWkpQwnO5A=; b=
	aixSbaxty3pc4n7Qe8wXh45pAxvh4HjgqN7Orsdb+B97oSooabwisgm2OTetDmyh
	WjoDMtzupoZ418SymiVGzAa01YwKog+WCXPXlO4iAz26z50UHxZRLWj1GqjZKGyS
	krYEksd0HgoTV4Ua+FW1J23ExSF+1R9wX0fqWuQOukuxwxKXRxIKgBVjk69qym4N
	QyL1McuwKOhtwsJKn0ZJVDwyDRyHNoRo+/4RxXxmue2LaAk4E0l/FbylDoKSe+uy
	86bQGI+KDEKXk7WqddtxgKE6JvOI6zvJdya5nvuZuQ9HFv0EupArShYwGBK/1CdM
	ZICriMnB5G0KQwSi/ZdWxw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021133.outbound.protection.outlook.com [40.107.208.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v0tbmp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:40:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPnwxY5CYjLgvmIVTAPFQHuE2XAwKY262wO0IDYcrgc5zmgv+yLKvQuUU8uQP9FOUhJKdlZwBvf3s2xpno48Z5XQLe8wQ+zN4WzgmiIzYT5KwdjeVUclz+Tha4PCGM+WvavRtVo2YwMkEpLaq10Z9Z+lJMOuWHI0rikhEH5dWBeTqaUncbinqL3GYhwZiuOJRohQfuP4J4OIJCgn8raDD+AsEeogueCqQ7xQ0wg42bE98PHDyXovJDitjhdoaagTEpjCXuzGllLPYkpl0KD2uzhgQ4/ElUPNe5JuqAtrF77I726NRAWxWuVkdOl9Nndq2SVqw1fM+bDUAMd5o3hHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru+bxVzt3rEfKExTgcOwgnkoi1yxEPP8rMWkpQwnO5A=;
 b=pOxOyn1wasKekQkhwzdYTMIbEItTnqdP6Yz2fNUN3ZQSt90IsnGWUkVVFwdgk3yR6q1XLiWMoVfyzIpq8o4+QfnxzFJkKvPAD28+ai8TcSVwuuozvvaBLHvmzbsNwXCC8aK0ih9xYCJnOt/1m8zhdaosKmxJARaAXyePQzFxPlOvELJB2vkb0jRv7PYpSVrxm0oDMpjokmCYAYlREteNqr2rnqcG4jqs4utzXwfKKbcUI7mTR4miMModqf0D4vgz9FVhH1J7evs8Ve4bPlErZ0ACyH2vlAm8YTkCxi7DSXw3a8jKytbfsipqoe8cKxnJwGoR7RxllQf22mcoER1qwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ru+bxVzt3rEfKExTgcOwgnkoi1yxEPP8rMWkpQwnO5A=;
 b=azTmPVghfqXFWCW4IRUTre0AMxB1GmxRkVIZBhrFeJH5Gb/TvQyIni8duSxOWpnXZ2nwmH0AxNQDdtxk/dpUT1xQSt/OyIPZP414qa7GqtkzgbMYdPNjztfekhfms2AYcAna/BszX1PRFecO/U2D8oKiMK0fUQSEZPuG84HTJdg=
Received: from PH8PR21CA0006.namprd21.prod.outlook.com (2603:10b6:510:2ce::18)
 by CY8PR19MB7641.namprd19.prod.outlook.com (2603:10b6:930:72::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:40:48 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::5e) by PH8PR21CA0006.outlook.office365.com
 (2603:10b6:510:2ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.1 via Frontend Transport; Mon, 10
 Aug 2026 10:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:40:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CC566406552;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AF34882025A;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/4] soundwire: bus_type: Create IRQ mapping before calling driver probe()
Date: Mon, 10 Aug 2026 11:40:44 +0100
Message-ID: <20260810104045.60701-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810104045.60701-1-rf@opensource.cirrus.com>
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|CY8PR19MB7641:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1cc197e7-6ef2-4684-63cf-08def6cbd6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|16102099003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	7BX8lztzEBv3WHcgDKjZwwRKO1ZgzP7PdeyASlCVDwcvv8/+1om6+Xl6GZuPe55V+lNdJZyGEAQF+hOna5bQTmM95aLNT9dkQIOmt6G29VRuXLXy8cOJHfPesBrO9LHNbK3JpCvOQ5pGHLuZuEAFF/p2sJcMvarBtatmptRFA+7EZZ4dj+nJ/VE4lLeCdjF59WmJOmkpXj4LoK9RlTcaLcIOqp9SpRiLBdTqeUaqLY97wiB03ipBFX5fzJr9iQKry5reDUQ0n7gp+RgO52ueMIXG6iQTancTjYfIFk/TlPpc8O+/qg8I/0uSkTRcnDAq7YtNTPeGUyXxcFTLUyt7W2/acBXweNroUr6Rr1mmijKQe32bLmBXT6WUe8c5UWk1sBjtAJm8VlGcmCjEm9bDvO9tOvOXY8cqieh+28HNtgq3TvvqQFeUZF2gbiypsupVzpUlZthFKrcizwWKEFioUYg5St1dCpgglD+2hy6zSqAXpg86ug6Q775NoTg2uJAkYvC6/zdcaUygRJKoH1V0g5F+IcDSewghVu/WETX8hwR0wS9CfOUEam/mu07ZYJlKYSt26tWzGjSDklizPhV1Euqx/7KRYXWj0trPp8DxIjxJuNkzosIxxStk/5+zawasOniE3SZ+Dh5r4YD328tGgbsroCw5ZzmWnIq6hXM036CkqOm9V8lQXQTUFIycXAXAJzIlIoWCj06CZpAbOvmJqA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(16102099003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1ngDx5ijjcSz4lqbZ8qffThpI7BaqZJvOy6Mjscrt/WQGqrBVixQp9icZhStAirqEjzXxnqyT1F7bqJRJWe/l+MvWJd1iZKDUFvazp/6yDeIYUHJ/rjvqiDArsfZAhljvLw6qjRP6mgjebTsOwsoSfxN2nkcdqaRUFbOCUPjPRUcEHaQVtDZ5i8BDSlD9dMYaCBgm9OLevqbBqWxQaQdt7wDADHr7ayam4Rx8Z7aqGqnk8+82LDVqQldMS4ZRBMwcNhpxtpyFgdsqoKHyJ8l2+s7NUlBdzfx3i5ItuROJlPMZvSiZd49WurFy65GyFtuQAPv7JZLbZGCZQPrafROtBEstKyTpLFJcHlNHbl3KLMn1kM6UUM3+OxDjx6LDRuzUQ585SeyKAzTl5lZhPRX+NaX4VIw6m+RCYcVQjwOhBd03DJGtrGZog4+vvL4y9A/
X-Exchange-RoutingPolicyChecked:
	iqMbcS/BnzUfuS4du8Ws+oYjA4+H0Bhj49t/nDLPmkILOGnxITNIBRSRWGCPw02X+iIDb1QkvkBMrSTCHE7FKdCg9Gpen0rMy5qqsh3BB9fGgOCY3GxLnA7GIndTBbrPqctWZuDdOcuKL+1ChjQhGC+DzpyTYydZafWxrCG4bORC+vmirfSp8hR9f0bLoZsptNPuC7hLANCM6DxOMeyK/UNBL3/UYkAw1rkSkAZg+jTKvftNdiTXrqnxruJF8Ia4+JdzggDAz8rk8sB24Zr+0GN4b+n47GwvzHsh8JDROhErLNdx65eg8x2JXBrApKYQcE+bMJkEQrldBIGrf6WnEA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:40:47.0183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc197e7-6ef2-4684-63cf-08def6cbd6a5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7641
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX5ppJptfizbNR
 U2gqV7SBV51i5MH38ZnOz1eaGXtxuM/e48zycU5WUlLsWqfuNrI4wiKz88ROmCCAjiJ4KfnWldO
 kKrX6d99TMxxkMt2IMQXdwtvmOGzb7k=
X-Proofpoint-ORIG-GUID: 8LaksrrJkFZ2wPP-e0JKhBPLuBT55viO
X-Proofpoint-GUID: 8LaksrrJkFZ2wPP-e0JKhBPLuBT55viO
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a79aab4 cx=c_pps
 a=oB12z6Vl+/cAOQgROE5n3g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=3CxaJLL3Bhqc2n9QydMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX1K1yZST/NKV8
 hKg9DAzmwl8D2kzP2K65nzTNz3iD7g2+c4JlVLVy1cADAPqo99b0fHqysthQS74KuOnyPvib8aX
 SGXk3NpINCtl29SCKYP3bs6TW4WB7/Hat9OJDkomukf1cH8Ttb6FaHU3s55ZN4h/QndalyuqXw9
 HQ6D/IPizozmnMwm3BABP9gHQPgOlmmEXidPO+fBWoScUBPP15iVpgde+5ZU9N59UMHwJwC74PI
 CIvUDAfO5Wy7N9x/EKKEg0xQ9bQjpgLrQ6JpZNyA0GUERV4lKXwhTFN6H89zDY2qBnI4HyaX60X
 RxplrlKf3T/KhdRXKvz/IIZrC1nejqvI/t279CkooiNeIiCGe4KVHQS67l+nLVU8TcRP260qG2e
 U+8k3Il6QS1D0gAfbyXqT2AGDsRodfx1qFy7ZoW7frKPOdCJDb1qdrISGKKGS1d6kEEQT77rqnm
 uUXnZMwSjYkLKiWHo/g==
X-Proofpoint-Spam-Reason: safe

Call sdw_irq_create_mapping() before calling the peripheral driver
probe() so that it is possible to request the IRQ during probe().

Previously creation of the mapping was conditional on the use_domain_irq
flag in the driver properties. But these are filled in after probe(),
which meant it wasn't possible to request the IRQ during probe(). This
was ok for MFD drivers where only children requested the IRQ. But for
normal drivers it led to the non-standard behavior of having to defer
requesting the IRQ until after probe().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus_type.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index e73c1bea90593..d61a97c5b41ef 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -105,6 +105,9 @@ static int sdw_bus_probe(struct device *dev)
 	}
 	slave->index = ret;
 
+	/* Create IRQ mapping now so the driver can get it in probe() */
+	sdw_irq_create_mapping(slave);
+
 	ret = drv->probe(slave, id);
 	if (ret) {
 		ida_free(&slave->bus->slave_ida, slave->index);
@@ -117,9 +120,6 @@ static int sdw_bus_probe(struct device *dev)
 	if (drv->ops && drv->ops->read_prop)
 		drv->ops->read_prop(slave);
 
-	if (slave->prop.use_domain_irq)
-		sdw_irq_create_mapping(slave);
-
 	/* init the dynamic sysfs attributes we need */
 	ret = sdw_slave_sysfs_dpn_init(slave);
 	if (ret < 0)
-- 
2.47.3

