Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A9339393;
	Wed, 22 Jul 2026 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716519; cv=fail; b=AebzpPB8Rt9qk4YM8GwUfJlDL3gw3ClrKq2tkgmN8q82a8YbraHqqOcBwtIwdDz7yMEL5rsJtlVUfok3znGCtEezf8tOabZ3WLmmppjuBqQvPkPzzxpBl7RbrRT3UfHEsUvnklJ3CbYdH/AfTM5Y3YtLzAQoLE/gHbDf4ueScXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716519; c=relaxed/simple;
	bh=9miyc0cpvB2dI5lVGNARr/J+Hpea86YeTPW/lFScVPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4sC1kYuUnk8yjIUVU+egfhyG8aMKU4mdXDsTZnbpDgIggFibHS8lvvCFnNEBSKEzAFLqMsaJJPWxO9Vc05bWMbIcr3F1FuoPSw0Fj9hIWDP1c2tnsCVRgo6zEaCjr8mt3R1vjd5bMHp0SFTMd5oHKl5oHc5r/dmsQ9R9erh4Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DwxeD6x8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XYWs8YOW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DwxeD6x8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XYWs8YOW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LNXTP73629501;
	Wed, 22 Jul 2026 05:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=D9OJ5tbKbSG8d7lpSAErSS9Xo1hFZzA06j+4DBn5kyQ=; b=
	DwxeD6x8Fvy0Q6FgnWgUURefFuKSRzZLYOP8RNRUdojRREmbRhlnzhKfpp06IXtA
	O4PIefAFItoihYmXaOQhJO72f2/gX8p7Y8jY+ibsk6CwUoLaaDVdZaVeiecwbGOP
	ofx69KoD9J18T9WMMijDBAhq5E1YpgwN+I6+GgmDtJE7Awp+Qc2mFi+y3SUagg3/
	+akXWMvO4eV2N6A5fvf0dcpFRttVqeHN3Ohow579VqAn3m+bdEqh0Lr/avYkED6U
	bH9oel6NUpMcJGMy7loO6/NNYME6NiZ2bAMY5quTe9aTxk472wMYUddNh/qUq+Mn
	aOCa68lS1xrc1M9D+EKMzA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020100.outbound.protection.outlook.com [52.101.61.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vynn2x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 05:35:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2jJhuXYGE6jikZmMbRPxYFgDTHa7Swd7UukzX7w/h33OnIxx8EGhMm0s4XLiqRiUcXgADEssS5hB4D/XJg54chNualy9IVpS/B7kemGGqHfKXiqsYwAjHiiYvG34LTHn55sIkcWILv7cvx9dZe4/lxDcDquUD1mRQHL9HjV8COrUuosopS1fL9jlPF079qcbueQmXya6Y6n90w6q0BuCYlDhb3ZsgAKA2HXsAKwNzQSebkabJrJUWUu5gWbRoXZ/S6dAHjbnbLRHFDdOjGfO6SojCvX/ZcJ7MugKfQkTVPJV5nenCOIKJaUzMM2NaFt8a08vq/swzsUOaoXfDMIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9OJ5tbKbSG8d7lpSAErSS9Xo1hFZzA06j+4DBn5kyQ=;
 b=jMA9t9bmnpl7jcmkCCNFTTqsgLIBk8mU/CyGjat/RjX5FzShfxQVUP8hWb3up9NKvJB1glmnkSgpyRBghJqxv+EQg05C/RQEQzEvnv+8cxK0kFTZ/Xys1ShgE9VFbkny7KQSogPFRDlzkWEB3eUpZXhX6N+BhguA1rtk3s3lYlVaWFOVlnqeVCznPdbfJlTKCUaz38EWnlWZ9EGLnGH0IZJVWl1lSazat5+A7NLpRU1EIez3D47Z8hh2Ac9hxrgkCWMhOh2OpKHB0z+7qaxXBon9cZKYzVXGkbB4AIiQ3N8o0R1FJ0pdCa/lgoSVJcsZ/sW53gol5kMVn2NU6nq3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9OJ5tbKbSG8d7lpSAErSS9Xo1hFZzA06j+4DBn5kyQ=;
 b=XYWs8YOWb7BgWDKfSkSv5MmlznqpUX+MQwaOpesFje9xBGSbrtqwoUyjLvT9Nuw1BS/X8ZLjti+ydX9vhoyjxr6eixn3s8dR5n6EwB7RYTn0ki5vGbW1XDCQ8K6D7aWLNj4YLUe1V4t4FN/7cFRkANiOM9a7Fqp7KR4lZiA1/Sk=
Received: from MN2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:208:239::19)
 by LV1PR19MB8909.namprd19.prod.outlook.com (2603:10b6:408:2b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:35:06 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::77) by MN2PR08CA0014.outlook.office365.com
 (2603:10b6:208:239::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 10:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 10:35:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52F45406547;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2DDE0822542;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: SDCA: Always free firmware in FDL path
Date: Wed, 22 Jul 2026 11:34:58 +0100
Message-ID: <20260722103500.872714-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
References: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV1PR19MB8909:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33188f61-7e87-4b02-7864-08dee7dce528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	1Qkyz8QoL4AN6vWpZddhz0eIL1CWyFeZirEn4FND+LX8eRy333G+7i5B2c4VJVqVOtLLkZ/awIuC/TYDzZVgVlhlcX/mw7hutvmvkM00YvnlUsUogDfgWYybNqWR0NyTxTMm1pEL5VMfYlky63D34IqzhsK2BmDGV6j+ixbt74NHvCEhMJxdigcktBN2Fs0gGe1v3wPgZf4JuXZl5bzfyH21XX5PjqTsouiVm57IApZUdBdYlHZYKfZLsaCGNGNNA0tz02QVCPh8o5BWWH/eifAqd+vqfBLSfQJW2DaR9CfoEPwutk7/jUYlnSaNukysqcyLkoBHCbaiWBaFtg3GxK2/MHl4X540jLQ149hbguordRbtJeBMnYO61PEXzPtGV5XQcFX4g7BH6sLZCA8QbWACnIwHny3XlemtreXOfRn87b8LHM5JnzE/RiRFF4dZlLH8reAbyIDqpM3a1tosnSJl3Mo3vNmNpKBw2JI1Q3Mfe0Zz4X9zlycQTtCea+sARkj9IB1v8WANiC/qi9Hgbd3iCWaOAQgpaG6FAWAWBsxPtTx7De8bYkXEaHmP11i08jzHtUTpIa4dMGfwBKxKdQKJ5ZuN6Nuy0VjphyABPdCi0cUCbTLC8F7ahy3L4MeA3kqdITvKuL3xPjsYH4i4nt/ToeH24uJ1DwCu6QOGqeSSZwCftd30tJFbXJKJbEcqE2gjwGp7TH9SaB82BtxiiA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fSHVjRFLpdJ9W+w5YHU+7ndmiWWI6mZ0TrH1+AQhtqwSVQ1NXQceecjn8EVA9gPKAgU7Pg2dErQrSeQVPAV51l+BkYjXuB6XxXhjzI0Mxzzrks7IGfSwBtB4RTzEOJiiDYxJvHQwKz7yB/HirNCGrRuJ6aMiG+FwB8Fxn+kYPbYSCdGMmGZmB7m185KV+PxpgBtTTSmXJC7tfU5i2cdseecgwWKLf3U7jFDCAYarNPrFHTfrP9ZZFHig11U7YYxaD8vaLQp/BXJ7evUZ7SlQHGWO6PDi6WOyzgeuEKycaMT29CavMGUkJLvL3nanCwdlMq3dF5O9ZEmQlwhZK2XKIeDX3kv2HryIGp/o38nSE2racWXxDB6ky+qFezbUkPnMSoU8zjAUJL1CU5H1k86G5cCvmRGIe5c4SRdWVpqfvTCX+uSxJJTd6Yh5dIThtRc3
X-Exchange-RoutingPolicyChecked:
	BXOA1qSz54aGaB3eh0v8VA+JaXCboGuqrvvqNpO6Hr0KTVbl92XqbpJF+fZtRgVjPAzwg/SHjxvY8iwTDdkgGQfhCKdhjVJlInEM4oncABON6vCM7Wd43xUCr1O9WDDlxK8qzK3lS9pTR8GPetmt1L/aFyPSV7KuzPBuynK32pQ71rjaMza5cxkaAES4KW+7F4v0uvkbnSeKikOLkAmwewXiagVdLQ9iH8C2vP8DDX1TyUxWcR02AVprkyLMwG2H9cfGIqXJIWeQV1Rp3rafCwtws3U8tlUkmJdGELxQ6w365tV4J4twE9q2UsUWR05s0IGcn/cgTKaE7ri8W4ypKg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:35:05.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33188f61-7e87-4b02-7864-08dee7dce528
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8909
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX4zLYNs1BEGda
 YQM5/hXJVEjU81tdezluIvnzyW8RtRE+neLsPGGnJXKnmSUYs/tVCVICaZUwJgXJBsiyMMVQzq8
 xrAcVbBx7fESgyrzgNtrOMW6e3hxVSI=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a609ce0 cx=c_pps
 a=jMJ9LDLnn2qgWNxml4ptOQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=2hlMXfdl9gbE-6Pf8VYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX+JTpkFiuVJyx
 DG+8BHiI8zLYRg+skak3CJET06Tt6iB76MZdZ1s/1sQllFq4I8haHx+sGtC9MRuOnXK8swlf1YD
 T9wlWgWMhY4Ps4qlmkCA4xt9/2ATFTWocMdQ/xqJVltCkGCiULxkhqHK5fXA4Mc2aAhlgu4RO2W
 rP8T0xtrG6sKKVztsEgpHL1NWFUUtHE5uWVXFwbU721AVYhGu7ba0zInqXS3iznqcZq8dcCndxk
 rhNYYLoPVXZOXuhRl/u1K9T1Pc9IVo8N2qXFFwEwHjO6sbKQqqOVnc//LfIEUcg+6b5RHiQh8S5
 Nhk39ZbzdF0x0jLkBFISEYV0yfmWq8biw+mwnx9cmUqTEuzqRYGTBHaP1oi+q6zY0a35QtYhRTB
 GenqufDg5C/t6MJaiZb12fSb1VC7zrrVoJHv9aNqPx5Y5S9nbYSk0COy8nlEPtixxemeWMi7o1P
 CL/ZqQc/PfBnOetzavw==
X-Proofpoint-ORIG-GUID: Ycx9AkKqL3YrG6EEx0Xz0jrIYc6SCglp
X-Proofpoint-GUID: Ycx9AkKqL3YrG6EEx0Xz0jrIYc6SCglp
X-Proofpoint-Spam-Reason: safe

In the case a disk firmware exists but is invalid and no SWFT firmware
exists fdl_load_file() will return without calling release_firmware().
Update the code to call this to ensure the firmware is released on the
error path.

Fixes: 71f7990a34cd ("ASoC: SDCA: Add FDL library for XU entities")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 994821a6df617..60fdd406220d4 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -258,7 +258,8 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 
 	if (!swf) {
 		dev_err(dev, "failed to locate SWF\n");
-		return -ENOENT;
+		ret = -ENOENT;
+		goto error;
 	}
 
 	dev_info(dev, "loading SWF: %x-%x-%x\n",
@@ -270,6 +271,8 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
 				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
 				     swf->file_length - offsetof(struct acpi_sw_file, data));
+
+error:
 	release_firmware(firmware);
 	return ret;
 }
-- 
2.47.3

