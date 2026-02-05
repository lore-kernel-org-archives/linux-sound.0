Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C6422339;
	Thu,  5 Feb 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309959; cv=fail; b=Ehnmi0hvZ2FQqJSodZT2PVlvhIg2pqHsVC7P1Dggn9G8ghoobGHdmyWVyCxPiXpUd0w3g61iUu8hNx2mNnioDAETnVCu6s19vel6Y/DFH9OFLGOkVot/1WBUBCwgKuKHEKbsV24KZDeXPz/fzZBZVRbVBQS6byudcquNcLrSA5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309959; c=relaxed/simple;
	bh=bVkUnhLC1SmzvAn3PjWHzNvP32+0rQRHtTD7okM7Ssc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vfbi2PDjI7fk2iwOs9Gci5Pjo0/n+VJ9cRGdG7C61jT4JNoyT5qyPUcbDne2uB8vj4DyYtevgVnaQUn2u4J4oXntRoNlVAYqmDucRXLMUSB9n77/LcXdTgbMW9h58oXTy4NdxhCUEgn2epOqCjq0ySyjNOuQk3PTyl2w48kEDlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hGSPiUNS; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hGSPiUNS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTx2YT9njEo2Rx4aJU7/Itatj/UsdHHitMQaaVqPVExla4LHQtjiM/IHHdVyqnzHUzEqwqMPceIV+chj2glSA3Oht7gJ059oSxcUy5tqvbl3j24E+IkgqLwefn7ySuntSDAnjg9zh5/uESwsZY/FheF6pUwCbxM2kaVo+hlPm4V0iPLbe3YONdNRxjvIbuOwsfDfULC3J2c5+nTeCIbvUdVqNnczJOEFzz4YzZIkmiKAacCK5A89qhbiH025/OULyhQv7ImsP20cCc9rtTB/r+DB692SAF5nm/TabtwWBEWkLVZCFTwUC440p1iBP3l6XM9KZfpRmAJlmu4aEejPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn/rTeu3A2JPMoyzDJ2TSF7Pj1G56Z81dRcriREjYjM=;
 b=J7U8NXie1h7YtY25at2FLKm1k073GW7ooJGfweYoM026Gq4gbEiAQUsqEju4TKKEyjgsr67cRhAupESbbvLVmMx2JloxYM8pZQc7nqmvvpfUvRV0S0472Cw0DHt6w7/Q30HHUpuSJ9I2C5GlpV4l/9e25CJ8IW3zhlIKN/Jta+uETT07Hz98L3IXEINcSssrAVDsuL7HaFZsZbxX2QwPi9E3md7rr7rF7A4fC92vvhMLDgH2/gXfV6+0aRXBQgXSbVZtjxx0+nWgHB4FiB3lpAaKkS2WT6pjSnrzYF6QEKIkSWHgqQdO4iTnCzMT0SD0EqpOmK+ag0c2Mq0Pg91MJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn/rTeu3A2JPMoyzDJ2TSF7Pj1G56Z81dRcriREjYjM=;
 b=hGSPiUNSuXb5aj+0hURpFMc4DNrXZUoQA7zce9jiInbakNYIwf3pVgBkMQH0Ku4gjsIWFl7lGUeWFihvfvjPyCDAPRx7NJkX/zGOzbx6/eZSE86LmHqdqVXTSu7CDfmDv5aJngSvNQz8b7Hl6jga1K/lEJpp7a4tPoIl/2oy41E=
Received: from DS7PR03CA0301.namprd03.prod.outlook.com (2603:10b6:8:2b::8) by
 CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Thu, 5 Feb 2026 16:45:57 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::24) by DS7PR03CA0301.outlook.office365.com
 (2603:10b6:8:2b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 16:45:57 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 10:45:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V5 0/2] soundwire: amd: clock related changes
Date: Thu, 5 Feb 2026 22:14:18 +0530
Message-ID: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|CH8PR12MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: ae916afd-0b5d-4d3e-2b8a-08de64d6091e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TzW1ESJz0KesGF2Jpf30oZ8hSEzoIdvJZfco3qpbKQmPlH+en9NKveVcbtT/?=
 =?us-ascii?Q?ABYIYJPkTOnOZIAhcrYWwUzuvhUF7NGSQXlYu9L+FVsSObCFF6p13U8FdA3Z?=
 =?us-ascii?Q?2QpwKJ7zoAtNGr30dpkS7rFWLKigziyvJvexw0EamUjWG8AgsrTxuz6Op/rx?=
 =?us-ascii?Q?VFz50UJxj/knuMZH3Y8qg5ZLEVtEdl0ojBaIyGIDN2pY5ourlWleA0kVXuxj?=
 =?us-ascii?Q?/AJqNzbzKoLMT8l6ssAgsbcshDQ1nzvyWnpvsE7CmPEvkDe2RVRPJ9ZWaGt5?=
 =?us-ascii?Q?XP7cPla+rhXcyGVrqgBEwS2qAK9mLxCGot74k6GU2+iEagC9C54OJXDH38n9?=
 =?us-ascii?Q?URqEW5apPKsMjvznHM+0eSIpDlcVqCbHzlXSTOSp8pN4jmge0U90nrTp42NQ?=
 =?us-ascii?Q?9i8yR7VIBjhLs/KyuXHzG9XM6dTB/AUIjk0zX9tsiMhjexOH1MBTgaNa0v3G?=
 =?us-ascii?Q?Yl0IcAKahOnRfKdVZha0Ij6azogxyHz5Emk3FNhkmHtZqbENncIdojCFIlUP?=
 =?us-ascii?Q?DFc7aT6PLOzk+GCRu2m1R06OxXvAzOiyD5xNGQXhleZ361KSWZAgAnv2xKKs?=
 =?us-ascii?Q?+iELh7QhyvjdjIELE8hvjd058L0ASO2ODZwixaluDuWv4D9yhrEf9laJeu3C?=
 =?us-ascii?Q?uG++hwez/JQL3ZJYMNkhgg7Mit5voOfKMiNGD+l8H8q/JEnYv7xRYh18vts2?=
 =?us-ascii?Q?WPSQ+0H+muOD7cmV+/wyQs1fu4BkgnLyGLNGuSn8/vwygTfhR+N3L/cJ9Equ?=
 =?us-ascii?Q?NF4fO94Mu4oUhHw6tU9iNKamLnt/n8M7721d3DU//0lOOEE89lvxIiLQk42G?=
 =?us-ascii?Q?5iyo4LCrKjE+WG+wvsK4hamkzZ7d2dEsydcF6HeL5Cg6tA1TQPgcKQAx3umV?=
 =?us-ascii?Q?Cefgs0mVp7fUHDgtL9BnQcIRf0x/hNUCh9lDGR0KHuUsT9hosKkMJD06zoW7?=
 =?us-ascii?Q?SB8+scAWn7TeAu37EcLfdAO6S3AYpUIdrq5DQtziBwyOFQQwe3oiQnRnVRvv?=
 =?us-ascii?Q?pj7BXjbAHPStCGCgiSFtv21sz1SHg7hVBF4YTdTyszsseecDdlts671RNsS+?=
 =?us-ascii?Q?z5iNFB9ANAZMnza8begME1qWmnElce7BAzHvC6kR64DCd0Lwc6B6tBwDrOR/?=
 =?us-ascii?Q?09yl+Y5yBlbqFtCVfuOB0wA1MaFefEorLiYhS/vuBRqSOTfqDNc0SidbYQ3l?=
 =?us-ascii?Q?P3LIzZ2k6DdZTBPdABscvMzY/Kq/1wS8GVihGjzgfpmbtTGgnYcCdhOjwpgz?=
 =?us-ascii?Q?uVwznrnYksIW2RPcErZ3ZmFmDGVR0FLdFWeXteqsrbwTe/tx0Q9JuBv+WmLQ?=
 =?us-ascii?Q?BPPgGJAr7IdKX1lPlb9fIVsO54a8lSk2wz12oviY+4xjvza45LqzUJ4ATFeL?=
 =?us-ascii?Q?HNZel+Lsc2R+M4+yPmNm2/UPcJaK6Zq26aBAwyJ2L2uEdPmTUqlY9rMSiHls?=
 =?us-ascii?Q?3zDl9eux6tFgt2r30O15Onyy1QbdTMqJozUVVAkkYouo89fHaiDSgRbDSjRy?=
 =?us-ascii?Q?ZngmLKUWaHuw/uzkrY85f974j28YaSxfFKcgjwhiyUVnfSdCHjuMth8+HTG5?=
 =?us-ascii?Q?d5M2IieMSTggbY83RhVV9v7NwloP7F+A2M7hm9+254oI2u2j/FFG+xaShQRu?=
 =?us-ascii?Q?lwCSUqiA15RO6pnaOyuWnDk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NQmh0R3HGe0dxHNMjGwyG8VLtLil+cbmAYWgSQj43VzVowxv6rK6tyjxdwcCGbJzBc7MK0gSoQxwU/3kuVrBpB6q9khsUHWL+LesItwzqsDfUZ0+6b9Yrs6/VWgIe0+OXZHW7yM4bR7ra7EkRp9CAVp9qw6vb5b2RwwYXK9yAE2NDWoBXrEI1JO3neI8RzVOSUw/xxtOi6HrPcL7km+FLJ7+LAqHG1B4MsZAuWi6UqWlnqaDYykz13joqP8Y9IcgtELfpYMgz+vc0ULagCvejN1yWIwYFjFd4YsoJ1tRJbYHqMecF9H/MLpcOYPAyRnRxUpJXcZc/kRn/upDWcDQ3dLESLvkJUncbhXSZMVA+v9szIQ3a8XhUS2OjOscehqnY9RXRW3Dhd8697ZPzKSwIAEEOlCBWactBpxYq+RPE9nte1YPfu+n3oYcNuN/KRya
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:45:57.1392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae916afd-0b5d-4d3e-2b8a-08de64d6091e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9768

Refactor clock init sequence to support different bus clock frequencies
other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
6Mhz with different frame sizes.

Vijendar Mukunda (2):
  soundwire: amd: add clock init control function
  soundwire: amd: refactor bandwidth calculation logic

Changes since v4:
	- update commit message

Changes since v3:
	- drop unnecessary debug logs.

Changes since v2:
	- Update commit message
	- add comments in the code.

Changes since v1:
	- Update Cover letter title.
	- Fix typo error in commit message.
	- drop unnecessary condition check in compute params callback.

 drivers/soundwire/amd_manager.c   | 109 +++++++++++++++++++++++++++---
 drivers/soundwire/amd_manager.h   |   4 --
 include/linux/soundwire/sdw_amd.h |   4 ++
 3 files changed, 102 insertions(+), 15 deletions(-)

-- 
2.45.2

