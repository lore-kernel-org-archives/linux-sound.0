Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A037F00C;
	Wed,  8 Jul 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505369; cv=fail; b=aWK/qNvDu9lSp1h0RxpHjqaLKZzvaBaBnHuNOaAZgbjR8rEG8mWiPNsP9N2lb+9riQJY5tM4KJ6hXU0km7xEDQ6w6xph7UjozFdQybV46uSCZKDOv0p07r2yoQ/wdzDF1NeOx1lhy04rPGaDh9Uur9L/603QtMEmdQ+EBP9CBsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505369; c=relaxed/simple;
	bh=i8QVHhIT8RBX2W9G9TkclrnMxnflFO6q2p4TLuMMdQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DCPfAXnPunqiBlFQ+kOK5i3v5o/G0WMJvX8TG0jA2EJYcIxUzqYYg3rwy9p5UhEUh+EBaBoThIfqRuv5yJva9XJeU3SHk2Tf7RRxAMu8pOOZzxVbPKmLHGTALqWRWHrzS27oeTT9d++8WLIf/WjOSr53gbbIgo+453yH3mopTug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=D5xV5f3o; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bt/WR80/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="D5xV5f3o";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bt/WR80/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684m70E1629049;
	Wed, 8 Jul 2026 05:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pZVHA8tsiaMklrz0
	dBur0zCUyasWtm/UMuZA/EB8fuk=; b=D5xV5f3oII1JUPcna7OoS/4Kw/kZzHQV
	VtCxGIcT84eDiS8FbTxAY5REda6/ta6gsj5h4uZJCDM6xysqYs8C8GKdK2lph0Ns
	Qik4tEqMMxpdaFm9Eepa+Yj/XqzYMdMprY8y0+815F4LrK6S2ldBIH+d9+1yb3Em
	gxnyEO61LVdR9JRgrpt71zGuJmDtUY3slvSfwiKXSl83vhxCPl5Jie9/M+Cb+3Az
	D7JQS60sv23fcCT9vUV3HGvILU8gRld/HGlmxuDt+7wdUMKsPpP3hF6NIPa5DTPM
	tOB1De+vYnpP22LeSmu5dQNUSdL/wW9tZbLPjSegid0Z/phhe43X/A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022075.outbound.protection.outlook.com [40.107.200.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjp260-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 05:09:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOMrCvVDAF4eiyOGAbcutef4rFzrM0IRfrzOpwDMk97sbRbbLtVUx0BGJLa8UpAIzWIjlXF8QjL9Xsu5O2VeTjO5arheGmOpRRCEfugnUm9ynFNjTqAGFsq/rAHVZ7hnJwb++f9+Pk8Cc06Ov1VZB+NvuzpL39BWtTjFuFa4YP0+Lhj+gZudQsoWzLl8qFKvE218xnuPqcPGw0Nc8KlvDOYKcYOs7e25Xl3n1iCOU3viikAzJcDA4WCdItGAvrCKmtpbZ5e34jQgtwKipshufpDLrwlOaSEDzzd363IykOrcFD8MpClVMgEhp0NKA2ZfZ/FGVyeBUsFIZv1ngVwk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZVHA8tsiaMklrz0dBur0zCUyasWtm/UMuZA/EB8fuk=;
 b=LuANbBcz4oIoXIrCjrW3kxcOjPCT8BxFZA0I421SXbbUXvS782vfu6qJZtFgp4+6Qa6Fy/lL8q5Dpv9CeWWXMg9PpqcPWpoUwZ1kGrY2Z9OsqCc6e0k3x9qauXBsRIBwuhBBvbavl9qyLVt46d6QBgFCDULVh5EHmnLDD0T/RWg5KbD49r/vNnUwHwoJy07K2m6s91gKH6m5og2DIHtUHIY/TI2ax6Djb4jsq+qg9mkfi1EjQyL1xlaVCVH0bsM9ektdBXy6f6yJUpf2Fw4EKQWhn4nu5avrxZlAgku4H2HDorzq+PCKDyxhkLE/7aopzwussEQ/P/IYE4n08z6SAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZVHA8tsiaMklrz0dBur0zCUyasWtm/UMuZA/EB8fuk=;
 b=bt/WR80/Wpy3j9BNao8KFhGyjnexJORlsicCZkDSQs0N7C4KDRkE/Zr0h8cJWOaB8FtMwf0hrC+D8gd8zY/eesb0WPYn5I5li2ZxC7LvmgvUqxhamAYAZ0aJxhyKysVkfBgIW+Na7Ws0WIsqu9hb8FQ3jYak4AlXVCGU5jNilCo=
Received: from CY8PR10CA0028.namprd10.prod.outlook.com (2603:10b6:930:4b::18)
 by IA1PR19MB6322.namprd19.prod.outlook.com (2603:10b6:208:3e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:09:20 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::3b) by CY8PR10CA0028.outlook.office365.com
 (2603:10b6:930:4b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 10:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 10:09:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 72FE6406542;
	Wed,  8 Jul 2026 10:09:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6656D822542;
	Wed,  8 Jul 2026 10:09:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, mfd@lists.linux.dev
Subject: [PATCH] mfd: cs42l43: Remove redundant NULL checks on SoundWire
Date: Wed,  8 Jul 2026 11:09:14 +0100
Message-ID: <20260708100914.1298080-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|IA1PR19MB6322:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e428ed7-bb78-49d7-fc14-08dedcd8fa0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|23010399003|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zuHFkezcwtOPpy8Up2X2UkRrQAlEnrcdq+dRIrEQlJxBXPU5/dqpKZBZzGtpWK9UbO6ltF2HFemQiInU6HEMIInjm5gnMnGm1Y5BsIN83aQvGc9c/8/E6YCaPLvzn4A66RbIv5gnD9JQnkL87e1NET/K3hfjxhJ+BbP/DtJs+fdJ+VDOfVtar684NgiKKmwZd1Vr8XsjqXPafe+vep1z99p+YuzMrZvJUfPkHrrwPqaO8S4BNiaby1Ho+O6s+7vT9p8K0zpPEs98p4PPirQMDXs2iNhGB1AXxETBnzTmWb+t3fNarGkVyzEM8WiKF04Hrsakc+jZrEVtJpse+JXxU0nLZXvyWgJAyK9Kiv2QF/DjoKRbjRVO+GTj6wGnsgIC5ejVZ2RoZyWMd9OKwVQ9HOXfea4cuJUhL0ji1Afw69QQ/hPn0/ihiRen3bjwBcQ9jRn4hJsVXslJiBYHWgiVM8Oba+XYajDUyF4lKksSunA0QNbWDeQpjJh3uI+QH7LJ3exn71fxxFv9KKcE02qPiAPzWtJ6DkYiKmRYlz+NX9VqSt88A5eEHZz/iP3FSDgtDAdQgKYKZMKnHYvx9tf5MmP96UTMg3J0ut0aeGxpt5QQz+3jaZmbsIu+WlFuRKP8flncD3sv3mNN2V4kVpIR30vow6KI/GiUaYP82Px4SrIs+p6bj+ZeCvEdCkpCCf/JARA3HXfGiidGub7qbvnPHA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(23010399003)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OIiEXMdR1EAnIhP6IumwZT+n4LeXcpiNyq9iDOwYVOY998f2w1+P/xVBbbCDUEzRcakU2q0YJsA+pBmFg+9uW7e5BkgeDux5O+B842zThFUjJYp2voJ6bsQfhkuuDWwqaTrMUXGECHX49uUtHJhTgPkLC/xtAZW5C6WRLedToKf4sX8598RwhNg2v1ObuEMQOm3TuThYr2NYH+5KlQmkHqd+6b6FUbEjJKPWailbonSjlzU29680YTzGZEUpqFxtjdR0Iwsejq8EJ8We+Wqwn/63yi9/kAhjK2BK1/wpkgXwh6j+CTsHg3Yk/vCBAh6E/zddpNTDq65bnRLi0Uq8t9hsHJXlaPg3NidlyZh07bZVsEZ8BLW+Vdn6Z1u2c8lLfOq3c9LDKzCeG+ZFM2o1BNoN8k+nJtnSm/b6M5deM3TyWiIE5s7QmbrFJxhnDPBC
X-Exchange-RoutingPolicyChecked:
	qztAh1myLCaeQA5dU7SUXsGTHn/jz2AMS0nilxz+NzBqPacVItyXPDoYeyUv9hLXupM8MJsP5dn6vWAi29D66ToRnTzmhAEYPK/SmHslAgO+jHQJt/e1yW604VpSUg+znFrg1c0sQl4A5+NhzxrIE6OI06zWsfm9kFUhGou4k+munmxv/deZdkKuL2b8KmvxBqad2ZZElEPyKsCO3HtyeTJ703O1FHbed6mgQTEOY40wJf6rQ2xKyWvDshxwjmu2SV62y0j60C770N82exX22xGlmvfMYiFbYJjatkv6tlPmQpaWpMxOQt/LxKQGg+2SNGxgJi+f6+VzGYoe1uPgVQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:09:19.6378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e428ed7-bb78-49d7-fc14-08dedcd8fa0b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6322
X-Proofpoint-ORIG-GUID: xzB-57ROv-JYKzktKc4z6H0c5tIDk4wj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5OCBTYWx0ZWRfX4ago7GvYtfio
 HBQhUEZ5WEUaBgojcaJUhkqtbyREE3bHnsad8mapV+GOLV5KV8fpWt8VRh4SmBWaWk0cd6f+OA0
 9cB3foLzSzaQj0cR/uPXC2rMo9V3hEs=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e21d5 cx=c_pps
 a=5czeKszRpWsvzRcawb/TzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Wl_7SCNbzsx64yELgXsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5OCBTYWx0ZWRfXxXXKwvEiNQoz
 D1l/Zrl8Hd6PlhmksV3qa8NoVjk4nU/ETnjWu60Mqyv6koAVQBaph3q4cQ/lmNGqm41CZoMFW8X
 /qZ8oQPxLz1Dc6DTLup3psne5RBbnzoyBPns7Bop4g5Dki7gsOHqm5OWDu8nhlKMJ92L5D+mEpW
 mZ2mGAfBdKMjeD8GBAaSYzZmcTv3vmmSFO5mXypZNwJKViCbYKYtKz6RK3EMq3prg0pcTsyrAsq
 ZDEdl1WRW/RQVmtrJ+tWVOyc/lb7y/yARXWdzHwpCAuG6yrVq0rLn1w9myyBiei1kIwYe6RQ8SJ
 lE7nIo5PS4aUf/WfQHQsKepPrGMZNeLxctsKIta2A0zys/bTmFNXF3bQasKacG7/YGcNOnCjbrJ
 SPGTLqGe44jcU4DMNeOQnJNr3pUTaA3Sb9sdSjeQjiSfj480rFq6wks6Vp/vI1LktuWjOhNQqZ+
 JVIR04tPXxfe+2J9Rqg==
X-Proofpoint-GUID: xzB-57ROv-JYKzktKc4z6H0c5tIDk4wj
X-Proofpoint-Spam-Reason: safe

The SoundWire core helpers now check for NULL on the SoundWire
peripheral so there is no need to do so locally, remove the
duplicate checks.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index d2bbd2f18af7d..33479ddd539a6 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -588,12 +588,9 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 {
 	int ret;
 
-	if (cs42l43->sdw) {
-		ret = sdw_slave_wait_for_init(cs42l43->sdw,
-					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
-		if (ret)
-			return ret;
-	}
+	ret = sdw_slave_wait_for_init(cs42l43->sdw, CS42L43_SDW_ATTACH_TIMEOUT_MS);
+	if (ret)
+		return ret;
 
 	regcache_cache_only(cs42l43->regmap, false);
 
-- 
2.47.3

