Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B0432BF3;
	Wed,  8 Jul 2026 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513808; cv=fail; b=FKe47fcrZx1lPcHrbbhMCGHFaJYYmP5YdoBOZ6I1NiBIvQtEhiJokI9dYnG07M/SzWgqoZcy2RpBmS6BxRE19Uw1dpqjf0MLAy3BUm5HpeZ/o/gEafZ4Jh14IJCj+S5KMY/6yknWvDAROWM2ojLBpgj7eT2VeKokbMXJXk+4/oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513808; c=relaxed/simple;
	bh=th3CoUfBKCHNcehd9+wSNo71/N9fz0ND9vbwdnRQ94g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kcQvre9g8WzvD+ucl/3bnjCV3YezUIwpyPB74SWkiliFc1Q1i3O2Y8YxJv6xmxVLbGiBm78kRqRNqSfH8F3XyAOxzr3r2O6noMoq+GDlEdL5xSZzQXCZLKIsxVwfcen1c9oCHDb/XmJ9FD0LHT6sDaK8u4M4iVwA0AT2Mw4AM/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ROh8ZRDJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EJz3ipxJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ROh8ZRDJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EJz3ipxJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684gg38666804;
	Wed, 8 Jul 2026 07:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=a3StbB5oo4CvWFK7
	TuXCyC6zeWrZl71hFkpVhjGXuAs=; b=ROh8ZRDJoaUuJHycPxJiYF0Ly/ctPcW3
	AZidymkgOuW2bcY3z+ydcBu1GKpOJ1rfeJju0quI28s5svuxO3GNOQnsN2X03Db0
	zfAuIAkLhZ6KwHtVB0zsetYgXUMRuyaaCfYp2JVcyI2/J0156wCsSOLzBp9AqMp9
	50fr9QhryOqhLZ8h565SkP8bk1Xs8Bh82y+3URxIH+DZVbpfz/VUD3F8V98LbFEj
	KdF8YqvLJo/KtK+AUXmIRUng3ioTBBWSuiJb49owm4hO5UlrXSsajdzzkYFBwayp
	5aKp8Uxe0/dUvJ1jEPdjOx4WqIfuUdDqHekH274WHyoQ1fOVqylH8w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021143.outbound.protection.outlook.com [40.93.194.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxp4pr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:29:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZ2qRejcuyHrftpL8DFwJd0WKGtEpRrasnOIpF0bQ3bKywVQp1ae7cetJbc6/fwh/cWPJWQ+owE6mFsulQp4uigvsDZCiDLFjARtr59ZqNNS4RgQWR0rg6m2tE72VxhgO00V0+auxvkxdJCwCodvNuxKMbFeNFvBS+t9nESk3qVORAYrEgo+UnkKaNBp0yVFEdvrezxnZjYVarzZjrbXAnb58Enb2uzOFD/fXExvu8S5CgGPEjn+yhqVWieWYujQBan1A+PF77wp2/aHbD1wMGllhepfkhDbglP1p1ShR6IIeboU/54DPGyAiqQfYhhuXckLa/OXdkpHsOY2tp5Gxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3StbB5oo4CvWFK7TuXCyC6zeWrZl71hFkpVhjGXuAs=;
 b=kWi6Yo8hC/+Z5ep/1YtIujq9h6o2V5/D883Xgsc17FVdQvll5jNKzJLSD13Z9WSLEgLeo1vqxwM3iOnsKfdE5SJ6cO+enZ7kkG6ZwEBN5YLU3FQdw+nHZ9g+XY6SBz87f1AOY81zXR3WCWcCesUFrg2G4Y3qTa4bpUDZwQNXnrX+1BDFxh9q23m0zoSlFFpAMwChmSSlUpxAHnGGvVwtmBAx/5nCgwXxE8KSZpCdBkBQ9txz+eOO7Lea4MaFtl+L6NuUX3E86Hkdy/9cCJwI2VJ0cA1oqp/BKnsSQpXn3m63M2hI5V5hqNgIxd9hTBLJ1kYWuR+gpbIj1smfrOoWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3StbB5oo4CvWFK7TuXCyC6zeWrZl71hFkpVhjGXuAs=;
 b=EJz3ipxJsAXC/M1RdBLtET+KGPx+zztwQCvux2LUcD7ixIb6e+91CzKgPy+X6UXGdYcQJh4vb+b6Q+Wkbmsa2hjqa8dJRtWU7K6HPw9+9zERjtKYvWdhKbauOy8epBs3+m9r7jZuA8P8XuvZkqdb0MiBZPP9wmE8AAqKqUrTs+o=
Received: from CH0PR03CA0066.namprd03.prod.outlook.com (2603:10b6:610:cc::11)
 by MN0PR19MB6143.namprd19.prod.outlook.com (2603:10b6:208:3cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 12:29:54 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::16) by CH0PR03CA0066.outlook.office365.com
 (2603:10b6:610:cc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 12:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:29:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 65309406541;
	Wed,  8 Jul 2026 12:29:52 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10CB382025A;
	Wed,  8 Jul 2026 12:29:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: intel_auxdevice: Add cs42l44 to wake_capable_list
Date: Wed,  8 Jul 2026 13:29:48 +0100
Message-ID: <20260708122948.1502227-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|MN0PR19MB6143:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 38545a18-e881-41d5-e2bd-08dedcec9cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|376014|5023799004|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	xJs4vTAgjn6yoSja8N3HJuOlB9K5C/MsSerN/S7ZAOM9hndhQqONdFR6yq74y0dQptnfhQDKbeMAdI1ZzkHW56Zcfioa64hpgoS+QDh9yubj0QUd8BIEPOGzJhokXQjOkGT/SdIBBGJng1oZj5wzhX/DI8Q6YNRviuggUq2V531t3bw3wygLVEO7LJ398pYep4PiBV1E9i2sTr9XeYt9TvX60F+7LGl2icRXIA3L29MVzqsm65FY1JY3UmxMq20FEZtUzG9unrrDE+CWN++p+ieCPC1+wQTXW6TE4fIxS229i7QYpdLfBBNlmfpFaP6vRqpcoY2r/tiW/2vdwy301QEINGEvp/rvjxCZ9ghchAaxXc8Ut6oEiSShD8GrXAf7T1Xnr286m4Xs+g8HxGh4O9RgyekoZ6vavMrW2V6Nz7Lj9ibAIcp1IM+B8vN0dB53QkPekSbVbQuv0dUhqEt2eJ/U+pIUe56DFsIqmZeKy0ikDrYBNFQXrKRotdDUt7k/ASVVNU3jePMKpqG48Kdq0N9iMEbnampL+k47PbVzxY3Gvzn788o9u7D/k33j9VkpynReNllw4g6VQOlSnEz/lNctpei/+yPRW7tekvgAh8mjN7pcotRh3dw+kuC7L4VdgVhioF84WY2SNITHR/Atm4Hi2uJgENkLRAh5BZ1WK4vI9a3gfw4qAqEjR/NuLW/bNuhM+ylwYNsJqmcLy0leGw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(376014)(5023799004)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wuLPlIwf83htzcWY6CQvy7QtqkwJ9hDvnhnwRK5EZfavo73zeGAFe1qytxgg6WSY30LkS6KIe4mRwhxAuF8YTNdW2hSSUTSoh6T32Aj46xTUNVeSnsB68AUKdfHoeJh+92QezqE9A6gZbrtv9FO+raonoxzHP0vz7pwzX8q26m2Tw2KLeQ8i1PR8mptQh8rFeBd0OR5jydELKPorpfAUFe65d96a9YSPult50BvuiDcv4ZC3tGjkcFUmOEd3vjvHqnEYrkjsJQoVkvH6aCO9Hf/ZixRuIoRY8IyYjgJ7+arCKe9KNsO1C775tzVQlhzVw6WZxII7AStFs8x+y1aTcG5nDej7W4Lws8zW5xUncks36HXZv6hIf2q1Bp8DRj/i4PyXbGXZpHe+Wn2Kxsto9eF/VHUrBfp73hg4qwcXSe9uB8ZQsncxaxNg7T9QeVMY
X-Exchange-RoutingPolicyChecked:
	tM0PJ5Jtw4QiwxhtjmXtdZePBzRLAgo4/x+AXFgUUDMxqZMM8ARbIXvBCPsWyYy8S9F9fQ06ttpPnBzQ4Sfaq4PZlKR+QqZVHTgIKEjcrp14HqUMeDxWP1rE5lk3PVxhWjyHjEKG56YhEV36H0GIeBaoqCd0MUIpIqus4OH7IHgq+aHYBnWwaXBy9u6v/uk1xWYBCGnzkXay1V3tSPfgqPx5WD/9ylPeXIEcgnzux37y+a7JgpNQrMKXWCwpCPiBSvs8D52BV9MTMSveY2N7ab1w9ce1IY8sjcnhrBCvbd9ZSQv0zAssv+9+33IZat/ubcCaVMuCPQgqOG69BIqz6w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:29:53.4255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38545a18-e881-41d5-e2bd-08dedcec9cf0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6143
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4e42c6 cx=c_pps
 a=kViImvuebRfNAtAc6SJfCg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=JWbS9DtX1Llh1lTNLLkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMSBTYWx0ZWRfXxHWn8x74WrYj
 DTmXpjwzQU81tl16pcmnKBOr93zjp9wlkLRKuvphjRgcdNJ0ZIXfj6UCyKNcC4FkAlUtaj53Or3
 j0cZt9hk+nUjju1Xd1hXVBY9WgnvqO4=
X-Proofpoint-GUID: rmJqH-9bRTrffY4skJSoK8p88ZRCYl40
X-Proofpoint-ORIG-GUID: rmJqH-9bRTrffY4skJSoK8p88ZRCYl40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMSBTYWx0ZWRfX2Bqhw064apJP
 +XwELomP0qwWXF0to9PeoQRit/ajz6Az7XfKE5bLQy3LaIKEmakupEnHV195ESf8k4nrI9SQss9
 0laMbagddErXMKUWg3th/LFyTFm9DpgshJEJp4aAW3cV76A7i4WA1ELVubi1u3EVDHVtsBDPS3R
 aJTFPY5GW+XQzBdymvfMAJY3Da7PTbbZ7EGaJPrczaHxMme3HvuvQz3I+yudfbtS8lePhZajddp
 jrhG51e6xA8BNLisnsqKYm0KkwFuertrq/MqVFsQ6n4tyrld4WUwRTbyRU8xPEwAOGlJMV37+a4
 KJ+Rzepv6IfPKeuhvBU57pqPRsBesZ8hwSGKkLQgoTacMfNXBGuZiGfKI+JLGtQnsYNpuURd9yz
 yRnjZ4OxOsDGPC8Dignsd1uvQweMsiZ9rLe4Hiv+1zEKOLrKG1gdFlcsXARJq4y/cwL5MasgusH
 0ZcBRLMpd0Hr+sA7sWw==
X-Proofpoint-Spam-Reason: safe

Add cs42l44 to the wake_capable_list because it can generate
jack events whilst the bus is stopped.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 0b8107bec9abe..a8407560bf4fd 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -54,6 +54,7 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x01fa, 0x2A30},
 	{0x01fa, 0x2A3B},
 	{0x01fa, 0x4243},
+	{0x01fa, 0x4244},
 	{0x01fa, 0x4245},
 	{0x01fa, 0x4249},
 	{0x01fa, 0x4747},
-- 
2.47.3

