Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962B3D6CA4
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547454; cv=fail; b=XKFTJ6eGsrYvvJF0Fbt2j08pN66QgJ9QQ6S6G05ThX2Asoq3cRnMRIeZTG0TPNW3sZ4lFhOGOB1LTgFmt7ryob2UvuJ/1IP7Upmhplr05NiGPtaUx/mWV1Um3sB4BpiHAy+5MuWfCpnbC8qB/qX8AR018PUanXbzuiCEZZkNpIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547454; c=relaxed/simple;
	bh=QSQYZpCFB4WKpVJTl9pPFNsyTzx5EELJML/hT8YXmGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AYNvK/YA2XMg5NXtJhBNMd7KOiYVy9qJ1wFEo1tQ8AYbE6WYPIvaY39AZ0W9GhWgWYCJ90H2NTo9aGunE7EyTQ5jki4l0zeRZqb3jep4aZlM92UNqvYVuXRa6H9Z17LKPmX3ZAhXGE63YZI6C9zBP+KIfJTIoVQbN9z9Gmr5TB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=V1kWSGCH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bFMTUGlK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="V1kWSGCH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bFMTUGlK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623DNxAE725714;
	Tue, 3 Mar 2026 08:17:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qkr0zTdpA2BX30B6
	BHOkBBwXW1oS1WP1zNqceKnnyGA=; b=V1kWSGCHBdd6LguhrPkbUHgC3T89xmsa
	rw9CK7rxxLjGXUYg+DaXpWLgRwBCtU8wM5JsTJyXIksEg3p0YNxbotVcg91548Sh
	SDbqruwFQG7Ddozf0YUDpuwaj80ipahwXCOoARPHUHgC/ske3FcbxCTQP+XlCCBO
	Z7t7W/6Mw+12pem/TyNDLnBZ587vvK0JlxoQK33AxyJ7QT3AzDrUUYGQs05uLx9c
	k7TVGaMAoiaWi+9qczzgcsif2c7sZMT9RzPWM29zOUHg7n2JYsqelDk28CPQKX/Y
	qAuFpKUM/5YaHxpHUcgLathStrLWLl2B/CEahFIErE909ck4ZqwlTw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021120.outbound.protection.outlook.com [52.101.62.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn3d51-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 08:17:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrVKj6aZJ2phNDGgdI7jLKsRFCZGu/QbjPg+ZU45MOdUvzR8X/3iCLQGVIufJvTJ3v5YhgvBCBSZajfD8xj8zq8raM4P5G95EwlccKAzEUKIfJO1MuQZFa76x4sbbhvgSdpv4YS3Hua6CXeFULzo7lfzVjbvcR/AOZstP58roeazbfgXMZPSk6av2c2wripStuo7GpJlWQnXWaK26sOr03TO5YkRJBbRqY9TveozgzBfa2SpzA4L2zeujjnl0F3jtCsRnOF6vZ1WJ/or70TU1Xg5lsqYntsyiusfiBBJ4qJfQw9iTeDwfad2S5VqKwzv8yCxBRSmplWiD+Fb8eWq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkr0zTdpA2BX30B6BHOkBBwXW1oS1WP1zNqceKnnyGA=;
 b=Mr/nFm7PNZPsgcksnXe2MiFDNFVp4pJe2yV+Ta+MFKX3qMazLpbFJPRw8qXtsTUtRDNxaKiwiDekpJZqyTbqK23H6+QZc9A9BC9pvFYQnx1r8YJ8oGYGVneWEsSGW7lbDAPVMNCGqXvjxyDLa5xUonYagkMTwC3ffSb3Ot1TLTZ3a9hUKJFG770UlD+CtPeGvzXkGrFnSqMnqdFtaBl0S1x78DuaQKMBOzmdDAtPU22j3t68zkLG4c6VFBotwTOmHbOzrw2JSp9G6BjwQe6mje7OmhszDU8aNsHONJm2527SfliitZfOxy9UReA5wcElcxtj2Q2dpSbWVjzyMb/diw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkr0zTdpA2BX30B6BHOkBBwXW1oS1WP1zNqceKnnyGA=;
 b=bFMTUGlKorDCe7KGliPEysI+CYBNHV+mS0P24RGdGHx7tpNzc7NwPYFnhin6FPmJJdMgLkcCiMNPTHf1tRmNxP94kzkazIJNpm7VSxlzzn24dcbH7o//zh1J0UIWvu5AO/P2wwSTbMgHcf1mCiUs+U9aQNcyNRE27rEmLVubDDo=
Received: from DM6PR18CA0027.namprd18.prod.outlook.com (2603:10b6:5:15b::40)
 by SA1PR19MB8997.namprd19.prod.outlook.com (2603:10b6:806:45b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 14:17:14 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::67) by DM6PR18CA0027.outlook.office365.com
 (2603:10b6:5:15b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Tue,
 3 Mar 2026 14:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 14:17:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A18BB406540;
	Tue,  3 Mar 2026 14:17:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 94FC982024B;
	Tue,  3 Mar 2026 14:17:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Add allocation failure check for Entity name
Date: Tue,  3 Mar 2026 14:17:07 +0000
Message-ID: <20260303141707.3841635-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SA1PR19MB8997:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46720ba2-3a56-4e94-dd4c-08de792f90e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	ioSAoyFDD2Gqw6JtZ9zA40inwe3zvKR2cgwA6tHx3ULafX4zWLf9Cgzq3KMbGVBLY+9AhSrhft81VQx7ecLlJaVclA7wjQ4T1PV3lEAMJpV0A9jIwLCu1G/MQV0zYhdaZAdzsghE5zRfL53/YbCvyWWwLn+Th7yHNIRNbv7r2I1PsBvIkbvAPEVAZ7W64MFM1dBA8BeBYVnANwHACQT14h5LXfMCwrWHC95rwV/uqNm/XBniBlzBYPs7dTpx9TL/8NvA+LJryq1WFqj1D5+ZZm0zWqrja4SJjX31pscm+OrW+fvqUc5Zhrp9mLiSjCYoEmnegScjx2O4743SDmTALWmwt2Yy2RVaXeltB6Yl3dwBjJ9yDgWn6QyKNtHAfuR+2hpsbW00BZiL2qI7eXPRtPY2YcyFCrF/49wEfn2wJRvrBZju1giQPc7GuctvvZhn0QJ+6Zk49yEQdGalpssIQaifWFhIl41bmavclDKgDIwMyM0V8E2c+31nnEgrEsLMzHrADcg0UTtnIlN1itj+PxPU81tceOhiiS1K9qynd+w1pEdz1BferaSAQAVARb1sLfEMor/I/Yg9kg9PJlPpCtzkFehooZv/KwB173pf32/Vs5MYCTTlP6ThTn8D8W2nt8rHRTRGc6vxQVLnfgp/26tu1yvDNbAUogSe5QQ93D8O8hEHQrBRq+dGIwtHUiy5N9bx5abWaYEQUdWTVEAq35GaPc16r+ec42oeKzPlz9SM78m76P6qivYjgmpT7nyUMcmqzD60jLojCk37hEMn9ots+p8fPspVgFybeVTZKlATU7OMkZAn4ak7HemoT49BA6CQwz8NIkBQJlGllbBLPQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9as/OcKTqVI77ESIcEi77dUupKTDvfRXnFJAoOV/wIESDUKWBmXl4a40spGMt6o7mSStGmlhFj3j2dTZBBJGEVDYDOwmcvV83DXmdtWhzrbQntLlct2BogHVCQ4OUgYPos51CLaePuzSz1UyC6ThHVPGoVahM2yUuLoynBiFjekxquOJZh/uGaVZKxqFj+D5ERvqZAWTxdjvPczOZyi8EDrrjhCcT9m51azET9gs0Do1w4eQ++HmBd/3EOcOYdaMulSu4GL8FMMvJ48b03cvN/G/eN8B8QWkvnNFjR1VupE/2QdFI8NcKBkokJzfaKtkO1a7L/EMS+ztSRVu71+oy3Skqj0qvg+79O+1ntdWgjQBBRTMc6pgIBmUtBJC5oLVFQkw2O3a3YTJo15g6YoEG+zXj2WCpKw72CRHTEnZgiSHNIkNqj8mCdnM8UaB04nn
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:17:13.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46720ba2-3a56-4e94-dd4c-08de792f90e3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8997
X-Proofpoint-GUID: o78Ag43Ryn6sVSs3-LAkWS4kn1qb4LST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMyBTYWx0ZWRfX955puMMh+6Uc
 W8NOq3HYMk1wrDsoKMBqCAB0uFkiZ1pMitzobC1lr1h0owHRewVUAx4satl7oBGvQuFKcYNQYea
 dzk+xXDTlNwugJJOFxhwWIaGPn3aQc4EjPDAuaFY1rS+AvM/8um54RJMvhg2amHatRLSypLDh4U
 yq+LGu/CiLJjZEUO125RxJDq6LWhlOGEWiFALue25qhEngf7wBI3v0lWBZeZBbNu9aZpV+gPDmB
 1BddlvmxC4C9HpPjCmhSUoe+scOMy6HcD7k5AQK9o8A40fDFJI5qHt4wDxuswj7sIUF2PXZURll
 gno84lPJWyJ5193ZRTInhWWD4CH2gXueIXq+PF39vQiAQC7wVgqzQEV185/rR4XEBmQ+xAYQZf5
 gMlm9QrzqBcZddOCzoh0tmxYlt0uYss8Sacb/EZZs0Ak0CwnczA58omk1a9+lzOBCAxPxuxk524
 u3dQuljLq3ArkjeUniQ==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a6ed6d cx=c_pps
 a=mAqY+/86XVqNsXA081Qh+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=mkLne0nOidYhGs5LIcoA:9
X-Proofpoint-ORIG-GUID: o78Ag43Ryn6sVSs3-LAkWS4kn1qb4LST
X-Proofpoint-Spam-Reason: safe

Currently find_sdca_entity_iot() can allocate a string for the
Entity name but it doesn't check if that allocation succeeded.
Add the missing NULL check after the allocation.

Fixes: 48fa77af2f4a ("ASoC: SDCA: Add terminal type into input/output widget name")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index a0aed95c76345..257158bc67ea9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1156,9 +1156,12 @@ static int find_sdca_entity_iot(struct device *dev,
 	if (!terminal->is_dataport) {
 		const char *type_name = sdca_find_terminal_name(terminal->type);
 
-		if (type_name)
+		if (type_name) {
 			entity->label = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
 						       entity->label, type_name);
+			if (!entity->label)
+				return -ENOMEM;
+		}
 	}
 
 	ret = fwnode_property_read_u32(entity_node,
-- 
2.47.3

