Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7B335541;
	Fri, 16 Jan 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576888; cv=fail; b=kPl/j3Sac5hIDwamJ3EUclvk6pqkAZ3WQCwcaPRJPYJUgmxesI8ZVpJynbaNrnO8N9e/4Q7mBl58+ef1OuU/QQFxaVipNGSfwwf8b6gz9GiN6XoZfAVV5Q54nmCAeGjH9mSQiiTMAA88QcPkjJeTT8A3vw/KyrFlZ4xuJidAwec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576888; c=relaxed/simple;
	bh=AU2A92XTuj7wnaAoDewMePx4/B/XPGGtRvJYLrH/SqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=McEk0DvmqCjfUqSPH+atcxkw0ALcHEqez9dwuZb9cJuy14VmXytC8J2JVNSnjBxGdRJCG31FY3x/wxu5VqnxG3B/LtgSZl2TRJs4+pupDL4Cuo5bwEgaaS5sN4N2yQ0iOunI6W+OyryreDvhN25Pit5DYF5mbB6e14Ap3AjQov4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=omADIcVw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Sb4fU8hA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="omADIcVw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Sb4fU8hA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8SETR3769889;
	Fri, 16 Jan 2026 09:21:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=s5Dxku4mI5OIJ9/3
	hvfsKc7lXwca3J8hO/6pvCgGPuA=; b=omADIcVwy8fyrM1oU3whEiKH4gMZYwim
	4QWs/l2zqCnKros7MJ1sm57TP4dM2mJZe7vgvtOo6TUmnl49GoRR90LKm9h9qzk1
	RbllLM/CLOHsKJCOOdBh5H9EaBwC/zg/AqGrvaWEvdJMa7tzRiIEGz5exayE7m16
	SFaPyd2YWFKhfCy3SXX7YrXJODEpBB33Q/LKkLfjoaq151hLQssn2YZ3QlPVlesN
	rYKoJr2IvrM7owFLQvlH4F/6mmVqwjsH7fMcaeEcPCcubI/dq1XXuKa5tO5aAc4E
	DmuNAgVtFLtqfXGu3VrGshfi0JQvLLeC1V1BsIQfe4oWiIoFIb/yeA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022072.outbound.protection.outlook.com [52.101.48.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn207ba1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:21:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCl4a+7uShyGApzbN6C+xGSfb4kywGnNaXNVQ09yW6vUDHgaQrTp5PWkQVKtsaoaiTvBmc7C7fIxDyRkk6BOLn5pblDyHJLPNV0JfebAphSaFnzbahCMm5LYoyY1cm2YVVNweuN+qERqZ0tYqWCQMHO3v2Wo4uZdcfPaZuHX6/8609nwZhThj58auj2/pSDlKt/09B2v7xXF/PwFE13IM7tRjbSLV2xZ+e2A0pVJFoQ18zUHsLhbIbir4EuIB4Zz4YTjV8M2PV7AxSxXnJ7aIiyI6tW1kOfsN68J7I6h/0LhFx1+syZDJpVwZn18fs6iduWTXBROaXrke1wz7O8UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5Dxku4mI5OIJ9/3hvfsKc7lXwca3J8hO/6pvCgGPuA=;
 b=gpG4g1BqX7A2JRvGVYVIu/rAcQkOB1jbyWHmhj1dHn18PZHSCoE7CXGGwByBw8C9rpj2k2tuCIe2YuKQz527J4MgMPyr+birxic9M099F0KS0uoJXKJEeagOB7mb/JKpngJyy5SLxsEhleOoEyYUACv+SObJ3jlhjq1QRyTZ2+x8hWT+61dDCzMa6IZmTZqa/RvpAKnMyBNsVbfflWeCzgeV1jpfEIDBOh2tfbwfuIMSwh5OoHGmP0K9jQrw6xhLSBk5fD9Fo+qUNI2hRQ4VFMRZG5W2NdSvSzykSUFsFxLwymKXhfmk6DjxOIECcKguNc4GM49zIjCLRMX86nzHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5Dxku4mI5OIJ9/3hvfsKc7lXwca3J8hO/6pvCgGPuA=;
 b=Sb4fU8hA0nIk8zelyb3jVxHveAbJfSDeahjeW6UmRMp6G0MlwfpIcdGqwxM/A14GGJznaCqBtT/TNbgipoDy5udvXsGlgCNfprbF1PN3KiRM2QYWByNlifR1x55jjXBC0uutPi8MH+Us+o1nxzLrt1N4+4DLoISnrwVf9wDgQUM=
Received: from SA9PR13CA0009.namprd13.prod.outlook.com (2603:10b6:806:21::14)
 by CO1PR19MB4966.namprd19.prod.outlook.com (2603:10b6:303:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Fri, 16 Jan
 2026 15:21:06 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:21:cafe::45) by SA9PR13CA0009.outlook.office365.com
 (2603:10b6:806:21::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 15:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Fri, 16 Jan 2026 15:21:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4A18240654F;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BAAA820247;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2 0/4] Add support for CS42L43B codec to CS42L43 driver
Date: Fri, 16 Jan 2026 15:20:39 +0000
Message-ID: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|CO1PR19MB4966:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ebdea379-469d-490b-646d-08de5512ddb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|7416014|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TKT/aEkEKnX/gCqKRMWmB1rgf5rkCJMY/8mCLSc4mbVuWfXpuLjutqxx5UpO?=
 =?us-ascii?Q?qADsSHyQ9XarXWV4GKPU+OUfuToLDThaNo2RIjAwqNvJxB3VrPu+hsN6RT6B?=
 =?us-ascii?Q?/Fo3/asMETwqAbJ16Rc1JnB9It72vfvOFXeqBTmidUj78wbMK/dP9iHaXwGx?=
 =?us-ascii?Q?OSfruUlKMgUBkkLRCMqDGe3e3+IY47U21Z5LHcG0m4jOMdr+K//c3RjowOwg?=
 =?us-ascii?Q?u9VWN8qWwha1PUOUwhBatIGGGSvD4DY5mfsxVbiA6jdMCimNC5PSU2qfMU6P?=
 =?us-ascii?Q?HizDno6fLlCAzPHBRkuL8zvdiI0toIa76m/qPWqGOAa/m/YDtydsGUIsGJ7M?=
 =?us-ascii?Q?Hp3NVfg9KW5E0FW59+wfEZyVvODH1eOinFnXjAl3goq6Sozy7zjZv8Uad2zK?=
 =?us-ascii?Q?6Zvduy6faKnagWr62GR9d/hS0fLRU4MMwVsuHsibRquynqLgciYm39yxVHy8?=
 =?us-ascii?Q?GHOwHMcWSJvFsIJtU6tXg/+F5qiYCzKa1ReNTjkDoaVYSVX+nr8ZwcbZJypa?=
 =?us-ascii?Q?+pSCn9z+k7s1cYuFtEyrJJhxJAs9kgE3z6qwVHQa2wXavgiXxC4Er8y482t1?=
 =?us-ascii?Q?30ONez1t91IlC2H1QBHSbiLiYl/pBQDZzWgpMxRNvP3KoXC/CxciLoIiJxKS?=
 =?us-ascii?Q?YeDPDIITBe4D+rIYKfKzvpbxfieKfTpMapyicofnOREcp7AWUYBIHNF7nNU8?=
 =?us-ascii?Q?8gCTFNmOaVtD2QhVz+0ueCPHxDY3CKE51hWmZSTUTDU7dM0Ia2bVjFDsSkHa?=
 =?us-ascii?Q?sqby+2x7SVwMGqWECSXEKajT6fit7gxDfd9oH85E11lhLoyTYZ/z2WRk2UMf?=
 =?us-ascii?Q?XozfDACNGYCC4ZRpiWczwrgGjJeeTGOFOapfUrVEEFle1O1ZhcJkxlDSyygw?=
 =?us-ascii?Q?m4jwwVSRvlwF+pB0vLl1LRxUyjEEBgBswXicGdKsgFnSs+x9Fr5XsXvjSAnl?=
 =?us-ascii?Q?JM1BlJEexo/FCb7rl6Uje8LsvP7POyLPidf7DO1BuX04xHjtMD7qObmojx2y?=
 =?us-ascii?Q?hWSg12FAtPpSnGfjrZSq9DMRLhrdaQR1CNYEGs8x6z8L+5fb2XnxxJJzKUQR?=
 =?us-ascii?Q?L/hmffI8nYhT3Dj/nbw6z1uskWW6KET6gYOKfXvr5WCH4CswwlqBHj2nutFX?=
 =?us-ascii?Q?5YlKY9621cDjJw4CI/XdUuLtY6ioNKLGCATlyireMNIF7Ja6QsvtjYJXtpSD?=
 =?us-ascii?Q?RnJS9X6cvnsj/7nTgEracViXkfueSUQh1p2m/a0ZWmUgutP+vpEUN46WYiTY?=
 =?us-ascii?Q?y3qWsdUUdD7YrYEjrDA94z6jtCWCM3tQqY/t/DgT3aPC/h6B7ETYnGdaYpcv?=
 =?us-ascii?Q?fPFz8Ok8ItYA4he+7DBjbPQTT8tMkpC0Mg8Kf534PdWrTwK2j4jULm1bzjE6?=
 =?us-ascii?Q?2OmuszBY/YJky7F0pW4ieBDw60j6fqzndoBixJJanS9LzaJYH7FJBxcaCJoO?=
 =?us-ascii?Q?JZ+RL/ySaoY1r2qkVLvqgtxE/H5GJ2KZ8zOKdQxK7BU7lucVN7rYAg3oYMUY?=
 =?us-ascii?Q?TAEtDFL17OaAlzCKRSA3h++701Cq57I4oZQY5dXf2qYnANJINCcf5GngpteW?=
 =?us-ascii?Q?Rqr7RHoeM837iAYGQH2yzoao0brN+qpXDScWon0N5AgFTOoJ/nAs6AzCJncL?=
 =?us-ascii?Q?g+MAuDh55yZ050TPqiOhFyPWAwDSHo+LfeR6qWfMNPmcwCAHyHvD2Lu4QHln?=
 =?us-ascii?Q?pIz8/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(7416014)(376014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:21:04.7614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdea379-469d-490b-646d-08de5512ddb1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4966
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOSBTYWx0ZWRfX63oPROVhLwyA
 ZVv57z8eEDjgch+/AeW38yrG76YU1QUsP6jNb4/JndSEsSknS9S6v98OmBJVc6Le136v609RY4W
 q17qUwGJpshvMNvCbbNP23jkEbvJWIx7aYfqKWFufyBqEHZyPLW2EKrdWdbbMbVO3nWGSfGB5Pi
 KPjLjQb0Z9RKmFto/b5uX3pjItepSD81B0GEscq9dM0jzx57c7AutN6jgXg3CLLUyCs0c8z0mE3
 2w/2oq0hoMjnZQfDvfL4EpYUkqk+EitSyEV4LxWotnEx7L1CmS+1r4RiDLYAugOZ7ty0YrQZhgF
 DUrN7baPQl9OZya8Biy4vkJ4AgjfHnrFPO7pEJ0mmEdjLRSO8gr40GZTLlTGKFPC6QXw3mWzFSi
 JSepAMLKUkgLp97agAhbekxqmQchpwKxVKrkCzzcJ7e69k7Qp7qd6bfbaXJRM6EcXitoe2nEcv4
 LTLcQvmP+3pq9Gu1ofA==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=696a5765 cx=c_pps
 a=hro4gVXncoUBxB/Amc69HA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=3fcK6sipGkM-lnU_H0wA:9
X-Proofpoint-GUID: qNz50_o7HHX85NUMkHahWAkbaBUcPe-Y
X-Proofpoint-ORIG-GUID: qNz50_o7HHX85NUMkHahWAkbaBUcPe-Y
X-Proofpoint-Spam-Reason: safe

Hello,

Introducing CS42L43B, a variant of the CS42L43 codec with changes to
PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
ports and ISRCs, and can be supported by the existing CS42L43 driver
with some modifications.
Support is split into four commits:
 1. Add CS42L43B codec info to SoundWire utils
 2. Add dt binding for the new variant
 3. MFD driver part 1/2
 4. ASoC codec driver part 2/2

Regards,
Maciej

---
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
 - Add a dt binding for the new variant
---

Maciej Strozek (4):
  ASoC: sdw_utils: Add CS42L43B codec info
  ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
  mfd: cs42l43: Add support for the B variant
  ASoC: cs42l43: Add support for the B variant

 .../bindings/sound/cirrus,cs42l43.yaml        |   3 +
 drivers/mfd/cs42l43-i2c.c                     |   7 +-
 drivers/mfd/cs42l43-sdw.c                     |   4 +-
 drivers/mfd/cs42l43.c                         |  93 ++-
 drivers/mfd/cs42l43.h                         |   2 +-
 include/linux/mfd/cs42l43-regs.h              |  76 ++
 include/linux/mfd/cs42l43.h                   |   1 +
 sound/soc/codecs/cs42l43.c                    | 756 +++++++++++++++---
 sound/soc/codecs/cs42l43.h                    |   4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  54 ++
 10 files changed, 848 insertions(+), 152 deletions(-)

--
2.48.1

