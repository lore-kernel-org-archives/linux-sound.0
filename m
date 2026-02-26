Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010026.outbound.protection.outlook.com [52.101.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B80341ADF;
	Thu, 26 Feb 2026 06:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089017; cv=fail; b=FSE3lgM57Jj24qlw0+Kyk3cm6nog4UDJM2BJQ4fMPs+D46/2QNhLrwmX5ZxxAMV+EzeA+BxYePZg9ZCsL5oq6yAYp1JK/nvs2wEufKLKVdgo9FnTwyR2D/vWx5oMiMLP8jG3cRVYfRwsohTzoi7inqReqlU2pVC6q+Z0zpR1Ln4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089017; c=relaxed/simple;
	bh=geG0GHQEXZbL2phIp2DiVEDy25kQRJU+FyMz+YEIBPU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CBPfwnu4crYXtyWbNbBfJh7sR6QtuIwKi9UyyeQGZ26GhwCd9KJ+n4xmffnkNWXAQpIXjhikZ0qCTLWn/TExBPbAV3WfOawiZ3U2Gigz8DjLg5gnDimPTlWkNcf6Fm9L0UTvCMbjXwqQm97tPK84i5jiOT153oa7ul9ueVUs/JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xp/rWFH2; arc=fail smtp.client-ip=52.101.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xp/rWFH2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUZZOTVHzDu79t6jfp90E+z/ncze2HkZqYNmMOhsO5AUrKU4PE8UOtsJLgAF/BMYlp++5RKjKj9DDzVsrFLOd19doH4LJ+BhVbJH8x+NOtiCTwK87iIQsiRm4g6HZI2soC0l3OeIQ8CSxv9Mh2Ep7Xs1CdTnINh7FrwMQaFu5Vim39mrFXyvDUfF231DBR6eiNNbh8bPW1iu9tQYoH8mafc/p4ZhEFBKOgKfVjDcTbPcp4uhIeNhv/ngecqsTaV+wF6AdXuXZ1DeyLpHlKIJCRRiskh33tUNi4fOs3Hbtzuad/cSUp4ej31d55/FsCnr3MsjmZfqhEXtjW+zLew8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igF3GbXOWncFqGGUrydMwKKXHCRPnT3M2caI+Hphdic=;
 b=LlH0chyMJslM2+dxvWQahfdjhxbArXZTHjBf+Z1rh2j8aXUeu5yW3bQ9X1fkQhX4M0c1HGgJBB2Ciz+qoro1XkwVWC9+TDHNxw4dSLQ+XxZVe0u75B9JejzWqF9fOCSC09plNM00U0426LmvFA66l3m4ITGeOSBy9UF2skEnHCUa6HnXFFoawPsGEot4p8NQ0C1o+JY6h10PDNaXWDPnaXflPtApQUuZ6pQoZK9CMgzRu/p/hYQZMT6gE4u+DWDzvB7hl8B4n9LY/V8Dn4d3faH6aMWRpCVznB+396mklNLti2hMqygisOPyY8EReoQ9BCK65f2gNr9Sa+w+6W4GYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igF3GbXOWncFqGGUrydMwKKXHCRPnT3M2caI+Hphdic=;
 b=xp/rWFH2/Cgi2zCkzZgRHdMjXBW6K5d7ecwQgRu6SCS8qbuWvVHAoAXim8/qYB08Dgmn5i56v2fg4suWfC7WM4cfrBpUTn9DVweN1WaeRbuyTXm/e+CjVDvzbdt4Rlfs/IE6e020lOHO6o5OnLt+ngAAQr7MrKgc/btHT7TvlLc=
Received: from BN9P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::10)
 by SA5PPFB2BF91BC0.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8de) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 26 Feb
 2026 06:56:52 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::8e) by BN9P222CA0005.outlook.office365.com
 (2603:10b6:408:10c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 06:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Thu, 26 Feb 2026 06:56:52 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 00:56:49 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V6 0/2] soundwire: amd: clock related changes
Date: Thu, 26 Feb 2026 12:25:52 +0530
Message-ID: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SA5PPFB2BF91BC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 147fd312-7b08-47ef-480c-08de750438ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	9UG8kqWi2vPH6T5yj+3cS/JPFnZDeDeOT2KFFIrgzSglAB/ZLG0Qu8kGHRT3xme32mlf13RU0y/MEsvYBvIsDqIFcjjXSj4B/W1Gx42SsAEClvSFeh6kGSTuOe3XzlxFQ9Dkml+fKIv6lLKNLMyetJEusBu5sI1GuqXT/HWpOZH8PfCLPOjj9AnRVX86D9RqJwwYzKrpE6Yo89PmSzj5IqoBPJUIJ3KdUque3rBcvOKuJ5Key2Lqp9Rm9j2t/bqk9CIuT5BLfJU+SM507HGBerF2sW6X4ze7h/TfjjTWXXb8BRz+lb2UPLTOTK4T2B/9I1oL1ilWsIrNhCX4LNqzgp8nXq0Th0Xd+JR348i7Y19RV0G7+YCgv1EYXdHl+iH4a344U7BCpvucWR4hs1m2NQsVNjqWfK1Uj238sI9OoUlZ0HDZbfaUYGt3JfopW7nhgiVHbJ0IuAEQGlC9aQuJPiJjRp/QJnW8SGSL4xf11XZv0t0sDpsUbuukXCeoahvTtsmp1mCvM91719XA+D7Cry+pzA8BJ3JhYnLs+LPHEg8N8YyQ6J8wBSkQeBy5tNFC6eS589RGwhyqEonX9QVQjfUcGc5MFxfh9ccAQcxpJ4uySUVIlimgCcNtBcxO/sswEr6+lrjEPTMT/0ui/seSuGynmaC1RAYsMsJIRVBpqDVdO2iyeWrxvlSRkjkYMJT0CPlP93NcFbEo03zVfJSSdO3mVe2m4BAyWHe/WCQ0mZac5Mrpuhhc8T/RMiv158dpiDrCVcHUDX4IrnH31QnonyH/pdQCIKvh/gN/O0BiU8BLJenDy2GZbb/OrcrCF89G4FCrAEdxmiJQ3diTromIiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9GcLzF5D7Vz67hfmvDAj1bIydsnT89K2po2QVjxf9MrVwihSpwqR3KsNAgLqqT+xxH7GsYdJAyhQtun4YnzgAKzyedOZCu8JrXTKqNTP/gqaikzgWmz8tNCryhDQPJrZWFRADXd+lUuOM3OoJI41M2h9EPdZrLBldlefEy6w/m6pfUtueeyqThn3MusChnHbm8lFNer0cUvwGWJxU15lWwADQKtVprDJqrbH8VZ6stXcQv17U3x7PxfygshNI7x1vDhLozd8LsiqHN+jw0KwqtE54ZcaQQfi4pWTniOZNqzKCTrm4z50XPOBFC+LwYi+uQHTDpY4jq3lAaqs48WZaA67sso86vRm9WIQeEtIVmJrwo/RQXykxXY3HEVsthifhtnqowqHEtVhWRzA52Uy7GU3SNpYAa6jqzmj1U9W5CGF0jmKn2jYlbqbQNNVPiK/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 06:56:52.3815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 147fd312-7b08-47ef-480c-08de750438ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB2BF91BC0

Refactor clock init sequence to support different bus clock frequencies
other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
6Mhz with different frame sizes.

Vijendar Mukunda (2):
  soundwire: amd: add clock init control function
  soundwire: amd: refactor bandwidth calculation logic

Changes since v5:
	- change the 'divider' variable from signed to unsigned
	- drop dev_dbg() logs in clock init control function
	- change few variables(stream_slot_size, max_slots, next_offset)
	  from signed to unsigned in compute port parameters callback.

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

 drivers/soundwire/amd_manager.c   | 100 ++++++++++++++++++++++++++----
 drivers/soundwire/amd_manager.h   |   4 --
 include/linux/soundwire/sdw_amd.h |   4 ++
 3 files changed, 93 insertions(+), 15 deletions(-)

-- 
2.45.2

