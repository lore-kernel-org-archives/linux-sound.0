Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A82E9EAE;
	Thu, 29 Jan 2026 06:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769667343; cv=fail; b=dFLSx5gHPNXruORci8CcvlyLa+FmsvAl2QF7mAsIHTeZWR//8JGWEKmN+krBWBh94qGQQVjcLcyjN3E1EhPKTLo7eSA2+WaTni13VOd9Ns1O/zlVy9buBLDSwgsZxPLdji/XgWkk+78TkP+Dcz0fRNpcRt1GCIHNuYQcUAWxCuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769667343; c=relaxed/simple;
	bh=+PCZa7y71ww3ikJ35kc11JeiUhClpbV+Q6JImQfi/+A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bdmWiJ8mJUJrVENqb0+5UDy0Bp+PD4yR/ky3C7Gj2njLr1wkLcrV9vvxUa0NhTjdFBsQO1jMw9C3c5B1D/E647/fH+wP0ly6viaS9Mhcj/hRsMBONRbOB6Yy+dTSpCTCwJVhgm2wf5Xc/PLT8Z3wONw3jXF2KW3f+/KeXoenpa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X25JT0Fi; arc=fail smtp.client-ip=52.101.62.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X25JT0Fi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UK466jGNN2FsAMVEgimh+jfDscjpJ08aTc/HTP/oOyhjruXeNuJIgS0MKd6txP49s0P6e4/nCen1on7yG18IFcDWaPOoCwtUBYRWtgFU2neERiyq+kpWYt+cCQ9GiNDxFrdvyMsEap4wzx7f0FvMxKpVEfckFFrQEZigC5g2IAEwIcXm2XmNRLDHIRQoUIJ9xnP/PKLKZbyCZnXIYsSW5yxpLZfwZt3PzRkL20U0hUdlrITitMx97MIC9xfjOu12FRVL7BOkaOMZO38xiHqZEO8Ln2Xw1JCYsFygSfCct4/CQZJ8b89OkJx/17bvvilb+Hunvw7h7EEDDr1brVq7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNTQHvAztc6VVzaSUzSi8QDe0m/rfGzcm0IGyyDW6yQ=;
 b=scE9oJwk5m9u4UV3kNgy4HEcy548ITHidj0qs0u0O62TUQuOOXKHs8EOiC+2wD8iWZEOIeGxcNpG/TSklknKSOqrnu3Mq94nMpmXZM1vEGTdB+asytzQbpK2hBF3y9o7yxNnNDrTaroifHB/fNtXuXkY6F1BshchqY3c8JQ4WcOmDEHZGu9QyOG4ragkUlfqpcm6Ty1Q+mBLmIA6E7ZPS/xB+eSlzsWk1M88MuaAC0jbkc3kpEoj3EIzmRtosvLzhWPfdGxyN3B1VWEoPl3P5MzUTXcjIa5J4kIwTo7j78xOK6vENINULb7Jva5+GQ6b8lniGAiBl6ry60nDEwqJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNTQHvAztc6VVzaSUzSi8QDe0m/rfGzcm0IGyyDW6yQ=;
 b=X25JT0FiZlHwYRkbw1b6hzCKhU7r/PHMLc243gAN2kn/41j/tG4I62y95GaGmkSpoXRgGAEN+iMkoJwV4piKjyvRVrmPiOcYp+TXXID0Ts/V2USuPmrMmNQy5ECnJe4AGpIf1+xL9lrwft/kY8uA5AnOz8pEH2RA7lBd9pZhuDk=
Received: from BN9PR03CA0911.namprd03.prod.outlook.com (2603:10b6:408:107::16)
 by DS5PPFDB3A23D1A.namprd12.prod.outlook.com (2603:10b6:f:fc00::663) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 06:15:34 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::cc) by BN9PR03CA0911.outlook.office365.com
 (2603:10b6:408:107::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 06:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 06:15:33 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 00:15:29 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 0/2] soundwire: amd: clock related changes
Date: Thu, 29 Jan 2026 11:44:10 +0530
Message-ID: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS5PPFDB3A23D1A:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a21f67b-8022-4ab5-b94d-08de5efdcfb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7HCbZOLVkhyRvHZPXk/rDCRZT3a9ImLDHqXbHJcFQlsk3DZjVDz0499jwAHL?=
 =?us-ascii?Q?J60hV0DssAJsGVG3AV5EeW/rxnS+g472VuzWYKG3CMA67v6I6BvTEVNjyI+N?=
 =?us-ascii?Q?8LHnASWsmAccOjiJJkrgtmEYhkojDOWphg+lxGdVfONWX2N8KKhBPXt8GerI?=
 =?us-ascii?Q?ZRXKSBDVkLLCnBrzPYvhhRBz5vvEhbgUZd9Uyq3ZxBneewk41jQLVY3gXlTG?=
 =?us-ascii?Q?UIylMlY8Dp1Bgt4Hga+5tspzHebmfYIzyl0kYgQEV+Wjwvck4bccao8AkF5o?=
 =?us-ascii?Q?GF52j2/3fbgWbqt9CLFYnQyUGUaQKV82/aL3TA20pAqaoQiNJWHQz2kXFjVa?=
 =?us-ascii?Q?oxMlX06CQZAChYfcAGv8VG0RnklhJkrcFC2TSkiyXEkq5UeEI8WiOfIfhShN?=
 =?us-ascii?Q?aFXk2vseQBKnDUuMz2mMOMl2pRRfsy6QuV67ojUtv7bH1c6uNTvMBoTpNZtc?=
 =?us-ascii?Q?5Jz5Gg4MRWr0B8zNf3tKiZ4JP3jMMVysZYYHLeU/CEEELmzvlxRink3nuzES?=
 =?us-ascii?Q?+6zwtUwZlL0UqhBYv7TQuS3XuNYcyM203r6ruFtSUlmhfTt/deskFCVDmpTn?=
 =?us-ascii?Q?Gq2XICVj1nhvw3G0zU7vo3e/FfUIO/0g1FHw10RHl5CY4h11HQi6RYyYlAX2?=
 =?us-ascii?Q?qOu+X1Yz4+eEFDzUn06Yxtkiv4w8Wt+7Wl3mjR8VspPH4ajuDVvIc+N+UcvI?=
 =?us-ascii?Q?7Ctz+zxzDCQs0P2oFHWbJfjwwiZx1x/E4UuoY8+cpfh2oUEOs/JiR0fOyJsC?=
 =?us-ascii?Q?hMKIxd9jlLBrS6GRtfBuiCi7lumb+2J5+DB3rYmj6BTvqi2WEXpubF+RUQsN?=
 =?us-ascii?Q?aUj+KPh16guJW7yZAFLnNRHg+lwKaizy/YzJ0geU5BagrDAmQOZI2pumEQVS?=
 =?us-ascii?Q?/N7UNHq3n2DqZwPH5xnLNchmAskVpetT6ZUPVMH6miScz042/kEVvfmyyTjh?=
 =?us-ascii?Q?4yCsJ95NLbA7JDL+0NJhE+mjJcbFYzuqQC/4zAktNfogLajRraFpwYj99WW3?=
 =?us-ascii?Q?FfXZn1T0aZZY+E+4aMpd7fi2AR/Dp6fiSv1nebaFjuFB4zvkm8dYR4Aev30l?=
 =?us-ascii?Q?7KhXYGcBPrUfQtwABRygalDkTyDCcR44279a3fPjFnIyevfPP41opvSfVQLh?=
 =?us-ascii?Q?7olEVQcGs0GS02QXUJ3AlCNnR9D75Hymgbrj3OC6XWZMu4SazjK3RyHAKswa?=
 =?us-ascii?Q?WFl94RwSATjzYEqavjJa0nQnjrnjlHCXQhkrpPrkWLhHsPPyfRtHousyJP33?=
 =?us-ascii?Q?2LLZxm4jRBgILrhVcg/UHsTQKvfMcRqbKB2/6iFRndws2kIiFg67fMZI3/Ec?=
 =?us-ascii?Q?RNY0Qs4KxMAVeGBeoOvD1rrdJlw+bMQdYReKO//u7MvqgqwXUKGKix60d4yl?=
 =?us-ascii?Q?vctbIXxBgaDmXyzR52Scm/BD4hHTshDYWQvD9KY1nzFidMfEkA/0kmYMyQhI?=
 =?us-ascii?Q?/t4Q0PH2R/P0iK18TWVF2GpCq3FkLuYG0+uCY7J26ii04tEc8zb5PVxbgsD0?=
 =?us-ascii?Q?7F27NGdfMb97jMbep4WWSaW/+EuH2HSPzUi9FO9iU8MOG0O3nUeWMKeJysv4?=
 =?us-ascii?Q?CUqJQEKQ41cZnU1mXjZsU293TTtNZOsLobqHxgsA0s9LXL8fiL2uOH22QfTh?=
 =?us-ascii?Q?cTdw7QmcTBtRAIG2LxRTZMLFV3Z83xsqyyllFAPGBYbMHpv1Fy23tWetyP+Z?=
 =?us-ascii?Q?pYmuLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 06:15:33.6187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a21f67b-8022-4ab5-b94d-08de5efdcfb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDB3A23D1A

Refactor clock init sequence to support different bus clock frequencies
other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
6Mhz with different frame sizes.

Vijendar Mukunda (2):
  soundwire: amd: add clock init control function
  soundwire: amd: refactor bandwidth calculation logic

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

