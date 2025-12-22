Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050112FDC53;
	Mon, 22 Dec 2025 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389759; cv=fail; b=bAv2y3nQ/vfoVg7WA3zunI2np/Bi6nJFDqpWLVj0hnhuO5+SJvlmYGfl2bZaUGW/uNW5aJ3u5OilhnRtVTZJyJxZUPLtTjgabrGGRdKzgyoOHr2jfnx9TI26RBzi21TbzzaCTuz+cutOet0T18KFaGXX77dosJ0Dyb/rNgCZsF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389759; c=relaxed/simple;
	bh=r9FRCCJIA3lEnICoAQ1l3zVBvacEZ1ldrfC5Ftchwws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B6vlva4dW8ojlR7wwFs3vySE1xVInzbwisTsbLiNDqAZ3zVj4TSwH2ttdFIVQKr+W9gIDXCHv/u+UX/j9FG7DBsuuzkHT4s3lBZBWFpc0ZDN68qMhDgk6565w5+7T67MoSKxdtYbsxJwDanszJIRSkDNWOBjbW8iBAKQltUHA0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W9zhA4F5; arc=fail smtp.client-ip=40.93.196.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W9zhA4F5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbxedKVLOj40INOv3dfyeS3nJMR3iN3LKFpQb2bCFhXXO98v8GOxuHHImRwRLasMlVWf8IXgF8OxNuD4rEfSIuZdcI0fu/vUNWIZ3JjajIHigyjVNHgcOPIDtlyRKT7OWEIlK9plYlXWUXREnvearvb89uqzCXdqMfjX5sMdirnrx6PPR/KK9gQCL6PROcGXHJWbl3h8Ur9qoM0vJI4AZc+K2Tn7aiFukPOCuCyhqmut+/+ZHR8bSEl3WJiIjrAoy1wZp0rRUAksY1hyeTCykzz+9e/fzQ4aZTgMwr3oSzD/zviVSO8F3aOF7oOowvuvPFx1aCMwf0LkhKIIXy1kXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eYcr8OsMGMdBn+ZufH0bXbAI9Za9zwHJgQnOWe7y8Q=;
 b=IhB1iimQBaC8yfG/m95LsiTNlgolZ1WgZKUhSYTOUYjfqhAYbVFYc3/YaOR7ByO+jxMypdfEO3Hw0zKQ5q3rc3IYxS46ONKnmVdD+O/AuQGAGiMy3HjiSsiTo2Apy6ocJLZFDhqvbSN4djbml92gUDJ0ltQl4KyO6iGOFA5Iq8GZqgSpsD5D57LFAolzJs1VNy5npf1N6Nu/qC75i7EeIW0aOL0E/jB+ILFWpK+URq0urI2FFSYe5c8OmnQ/drrlQP2fcK8Ah3HtgfdA0j+7him01zNpn9kHi91gbO6szhK6AjgsOA7/qfFozfZRWQEWUv5XdYrBvLl2w1HRpLbaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eYcr8OsMGMdBn+ZufH0bXbAI9Za9zwHJgQnOWe7y8Q=;
 b=W9zhA4F5ZZ/XPhAxVADeqzDMvpJMQpbFNunF42jXRq4p8uZRHrYYkCVD4KhlctIVL7RDwvQ5qx3Wiw1LgjXiEoQp3DYcJXnKznFkflHgIqxTddQ8ODCBHWM95StxOIuIrrsK6qdHA3/pIHnUDRL4ul7bCDzwiak0umdD+BqAv3U=
Received: from DS7PR03CA0078.namprd03.prod.outlook.com (2603:10b6:5:3bb::23)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 07:49:14 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::ef) by DS7PR03CA0078.outlook.office365.com
 (2603:10b6:5:3bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 07:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 07:49:13 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Dec
 2025 01:49:04 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/2] soundwire: amd: refactor clock init sequence and
Date: Mon, 22 Dec 2025 13:18:11 +0530
Message-ID: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DM4PR12MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: b794fd20-d2af-40ad-0005-08de412e99e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/IFXV92cI54cLBZYm38JgcxO0P/1ZClQ+qDxTvo3BhDqgs2U/4kag9J9otm?=
 =?us-ascii?Q?n5iqtzk4hYj1+ylKm7yr4OGDXSPbNkC5ixJamfHnDcDdwoAnxbcLeWqihXYR?=
 =?us-ascii?Q?0iJPN50RXchOs23ETQwyrKnTf0d4MYxjYDzl35mPkxv4WZ/2TGZ6KRd7RwgG?=
 =?us-ascii?Q?bQRs4nqOBGDx0Vcku6sj/b66GENLUE6n1/kRo8OwNNrjXEy/COgGiMjyPVuy?=
 =?us-ascii?Q?C6Grr10VYa1CpRxvgjRMPYAEl8LB0m0fpYkrAFJX9q5i1VYxnQvaMoc/HlGK?=
 =?us-ascii?Q?KrQaxR8QWslleZt/yALHckPhpEYKzJK/ScbtEWgDWSLUOx6y+juyOIMCeKTS?=
 =?us-ascii?Q?Gay24YGF4amI7PPJyOkomLip21bTKe2fsRNi9Hj09TOYqntuTXI6cNzOeuuQ?=
 =?us-ascii?Q?0le19+io+0+y2ODcZmE1rJBYN/jKtnObCl+LHXHhPgc/9Vq9LDe6Z4bAEZ3N?=
 =?us-ascii?Q?JWBlmK38tAJvztmPnJD4CugX5bCu7amRcyy2Q3GkFcIZqRMKjRn0Zgej7ShX?=
 =?us-ascii?Q?j2Id0jArG6h9OTQgw1eYyF5w61bF9X3JUxJPXWUglDBhG/A2Q5dblx3oioDN?=
 =?us-ascii?Q?bGtQ/Wk5OoeH8sjFuSo0WQJd+nwkB8EZJh2NeTc/kzIZsPbdPEyR0zWkc3DQ?=
 =?us-ascii?Q?4Tes2R6i/hAO5k9IfNxIR/fr1LBEJ4MS/iZmMncFLCilUHnvRNOXoJVb98bP?=
 =?us-ascii?Q?ZuMuZtrz6k7q3/9kZ0aXNud68htVZEOKPtQtbsHFEbJ581J9J+WAHg6bedEH?=
 =?us-ascii?Q?tmsjF3n8WNWCoIO+n9tUwdpcqZCeumv9USZGj01bkEl0Dix3hZf256rSD0yu?=
 =?us-ascii?Q?Xw0ndfi9D1JfZ+2JZHgKvpRiXq8DEH0KDo7ubDeNkOGIUGq2AUqUoaqUuvON?=
 =?us-ascii?Q?/UgQ4XZ2cY0lr6wo7x0KU657PxnjEv8uyXqxrpQCTCiTWYFOGWbRvIR09RpC?=
 =?us-ascii?Q?WkUJt9ClvlUNspecs77X/urzykt5BFiUZagCfYNlMEQhm0GZT50BFrhMUK+H?=
 =?us-ascii?Q?xizcosWsaiei/zww5Ldla8cYxZzNUgEFpjhNKWSjHGWJeLl6hBf9obKeVGT/?=
 =?us-ascii?Q?O1FdTU+ezbmNQclckzr+kQ7okJR6Qo6Ack9RFs0mTRhMfZR5O119WNDiDmDT?=
 =?us-ascii?Q?wthcncn4eUQySQZ0JUX28gGXNfUH72kq7jAl+lRqYdlpOrMGGd7ubf+vkaJU?=
 =?us-ascii?Q?uV5dKyh5ZQY8dr/6ho8mLLtCRpPrgne07mya4uOfvmzKrFrbmBILGsOT7X2O?=
 =?us-ascii?Q?1Lc5+q54FwE/PxcKcJsT6XHzFvzSfQMNAckefpeREfKkoZ0rsPits4z80vt7?=
 =?us-ascii?Q?cxI4ihZC3ruOCngRVESRxiRz0hEKpWul7GLfLwq+80UX0/Q2aY8z/wVCifuQ?=
 =?us-ascii?Q?vagFOhD0xAxXP0bj5B4mqaCE7l5shxQTFma2kMhdW2j/WdMiASDHtoaT/kqk?=
 =?us-ascii?Q?DfZr1z2YM0xYkqJD4ZJKVSoFqn/nBMGO5i2RcKtBn4meqdgWMXHYgQbsbYv0?=
 =?us-ascii?Q?NXYB4D/mzTXTZlvo14gFBMQ8cMkiIq8FaNb/rUryBBeg9ET1u56Y872nLCR1?=
 =?us-ascii?Q?eEAWNN3dYECvNWSRk8Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 07:49:13.8533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b794fd20-d2af-40ad-0005-08de412e99e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279


Refactor clock init sequence to support different bus clock frequencies
other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
6Mhz with different frame sizes.

Vijendar Mukunda (2):
  soundwire: amd: add clock init control function
  soundwire: amd: refactor bandwidth calculaiton logic

 drivers/soundwire/amd_manager.c   | 108 +++++++++++++++++++++++++++---
 drivers/soundwire/amd_manager.h   |   4 --
 include/linux/soundwire/sdw_amd.h |   4 ++
 3 files changed, 101 insertions(+), 15 deletions(-)

-- 
2.45.2

