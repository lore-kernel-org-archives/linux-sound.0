Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542739341F;
	Tue, 13 Jan 2026 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313653; cv=fail; b=dmq+S1nmGsxGQVenC2XD/FFe+ZDB+zPxXW8xZBG5leYNj18JdDWEBwjeBDDsfFcrAy7sQ+Q1pYZftsk6GX5tKa4dCWNQ4+6uDlHWn4rH80pt5LKUv1PkxNGHaHtuq26n2wra4TZ2C1oJCEVEcFyr03bT/TFULcoLpEJlx+IaDA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313653; c=relaxed/simple;
	bh=wYiHb+oyMv+1tke9CHwV5fm+i8RBX+rC9EHTC76tQFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AyEXry85obVwY72Fur/2J//r/PwxsK3xw+oNASgTR/jdKMtKk+OSX3FwXFyWtXehYAn0dB0wJ0VXKZTnADeDsppnkvacQrym6/Z6g+GUV5RNYYRzW45NP9OZZZbVWvWdWBmQ1B6yKuGYYEbvtPWdwsUEKuArVafELa6UOaODdKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h3TpUJlg; arc=fail smtp.client-ip=52.101.52.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h3TpUJlg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQT7UTbZ/m66dEBq1N+Y9N/4Xi1feWhI7E3NrR/Ck+EwpEgBN8u/f2b7uiO3b6zut1MbsEfaWe2ZBhK4wiNP+LQTvlbe6VfXsncM6jNSrHQLBN7UhXhpRWcu1xRrEGirH+IBdWSkYvg3uYgW8k6hCVIRZDwbe16JorYgO9GNPj9OfK0THYSHD3682xPSIN7Jef1ldIWEPDfwu+ECX/Jdm2mHgQd5DAZaSVPry4MDm3x7JhaBtc8Z+Bul7vWXK9JzOBHd7anHDxGTKpvN9+Vemy2l1LTqa7T90bzQ/BvvT3V55skg3PCASfgafzMTMJryBScMoBP6QNpjfJJ50znIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZxK9dRiJt+SIlomN400M7PVQHLsZ0Cu1JnjAu1m1E0=;
 b=wvteR8SScJpZs5uoFrRoQfbfFdo+QFXQ2C8ffIrqW5UvW9PWQDJUaefx9alltPONS5u1ZaP5aHv+i9zYq5Can8heEbJx9xF26ySxnsAxo3gKCBtob4rmZ4/kZqUWXcc8coQlJRs6NCVNyUQ0ZnZ3MG3YaiRdqrFEXQDRJMnzK7EkqUFkVr0NlJMezj4W+sadMtrbedkmc+9F4Qr+d1JiuhKvgTntNlrJm6Sb/RO8MYJvkjSz9o7T/40O4Ge//kwraQz6mXtkqP0UWLaak2ZtrPeQ/N/VhMkJxWplq1uFXRs8HO8qGDZ57JObjrZbWDMdVe6iOtiXNDLZt1qMfNOZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZxK9dRiJt+SIlomN400M7PVQHLsZ0Cu1JnjAu1m1E0=;
 b=h3TpUJlgVjvDwFbrGlJtMR7fEs6PBvjhnvUhpR7ryIi5FM2EYXozM0JCGLlXKnM8LXBjFWOHroT3+leEbLrUIo9TBsjX5Wxzk/bCgYUV5Z8PR0cj29534sJv3PQ3HqtA6lS8Uu5fqZwaVHknZQF7n7dxh506VtueNo/vdeqW+9E=
Received: from PH7P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::16)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:14:08 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::bd) by PH7P222CA0014.outlook.office365.com
 (2603:10b6:510:33a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 14:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:14:08 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 08:14:05 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 0/2] soundwire: amd: clock related changes
Date: Tue, 13 Jan 2026 19:43:06 +0530
Message-ID: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 9543b958-7790-4618-6836-08de52ae0490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mnXthMJYTuZF2RCDUFWRqOdbrOmVPFB1T1KJnmndwf9uwn298apvJKxy2XKl?=
 =?us-ascii?Q?x0pk+7lQNqOIBt4n9tgqb8e3Uot6qSRduUQseMQNH0gkwUG9SYSxwDeb/oDX?=
 =?us-ascii?Q?ucfXNKhejzvSxdMJlMMOXXMvulB0RoApVo0hshj1DcosPhAhG8J+doVnKz2A?=
 =?us-ascii?Q?yDCj2T8PDEw1Fx+4qUu8wC/19fSoE5pkNfrGVUPBNSIoGOU/KX9HR0HTVeVM?=
 =?us-ascii?Q?sC9B3Y6ZH4en8cbLq9LEh1OFTqJhri6QWW9Kyr3Cizrbtn9AsEVkfnuUlS1C?=
 =?us-ascii?Q?kJSTaxtf8UB81a5hhCHMeef98iqh3z0Muiah/V4cEGTD1VlH4JNzViLCyuQ5?=
 =?us-ascii?Q?hoDqf3vNQvlsXUihf5b/kuBwXVr7hHShBJqN8RDAkKxHexn5Jr/cKOR+9CFq?=
 =?us-ascii?Q?nVULL8T+pkhTIe2jmMwj1ihP3twOaHtwKzRtTW5TWyTuEmEJXPaBT75B3Wle?=
 =?us-ascii?Q?bV/mwyPI6M2P0e7/fbpWTUwT65LSsA90y6h5K238oYbolGZn0gJVpwfhqOyb?=
 =?us-ascii?Q?o6Q1DYvsiXoJvZcHOvKVK9Kp4LOfJFDUjO+Ewpot/Ag9rqZY3kR+adQPDsn6?=
 =?us-ascii?Q?TR0W+UIP78AEF8oFN5KqpVG9kcZlP75ZXU3X37uxhg0MN129wk94GT8mS3sT?=
 =?us-ascii?Q?UKpi/UyGDjkPsc8Oen4qdr33zN0bkmioQYfTCNvSCF7TCNLYrG5vhUrI9cAA?=
 =?us-ascii?Q?/dvLHmpwQ22ut2ZuEwJ07qbbQ5PvuqstwQLrdQrzCIvIC6Gq8m7R+/fKQa9v?=
 =?us-ascii?Q?xyzj/HOsaFuWpxDtS685G35ii6qpAl/S5n7NfwElaqPKPIfRv+4t9ng57RRu?=
 =?us-ascii?Q?l9FC9/f2tyzpNRfs0sbxGZuKDIS05OdZNTm2y0zoH5SlK1W2Smu3iiXbB9J8?=
 =?us-ascii?Q?LcNmFY70QMPUEKBD4U8fivff65zFLOsrNTP2O4eVFf8RPEPm8KBMtJG3/VjN?=
 =?us-ascii?Q?xeeZCyx9HGMg1wEM3+2xin1DBMcElK5olkU8Dld2BxK8hoCWOiMj3HH2pdCe?=
 =?us-ascii?Q?owm0SWskE7kKZVEObXzVLyK+1GimWWJPfk+JVzecebIgOXwWEkBKRnaE14m4?=
 =?us-ascii?Q?mjYHI8cEwIuyC9wkpaBGX67MR4Mhhr8CxHo90EDp9EOqGbE20p9vXky7A1dp?=
 =?us-ascii?Q?8KVHtW7qJdUXYH8CFWvyOacKA6U947sUgBcbX0MF38qtwl2heMsu9QKzkPkZ?=
 =?us-ascii?Q?2CdAFjY8wrMsVGttgfefkbXEfzHp+lNGlBjkykoT0avHyciamz6rlVLVnnUZ?=
 =?us-ascii?Q?N/4VJcEPT/PX80MXho0asiwSpkOiYEhqRa8lJPFnLaY4fh6u1SUWKbhXOtcO?=
 =?us-ascii?Q?b4buZZmfGscPclD9vMwACGtMY3eQE1D6w6gKurT26bPclHxRjNk5UQzOv0A9?=
 =?us-ascii?Q?ul+4Zkkj2lZTlPDaWdz8tGfm03RqNRejayUIPHqMpnOEZboeiLYYcVwhRfCC?=
 =?us-ascii?Q?5476wt2vswZI/VE7y5wl8mc1SzXDMBzxcud2udkTF12M6tnOIfgT0md+c82f?=
 =?us-ascii?Q?+piH0CGdGiiik8FH7+6ccGNlGNbcf++NxucUJakB9nFxdSuSG/1jzFfJrxDq?=
 =?us-ascii?Q?x6KgM+rzHiDEPndrK/U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:14:08.6891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9543b958-7790-4618-6836-08de52ae0490
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

Refactor clock init sequence to support different bus clock frequencies
other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
6Mhz with different frame sizes.

Vijendar Mukunda (2):
  soundwire: amd: add clock init control function
  soundwire: amd: refactor bandwidth calculation logic

Changes since v1:
	- Update Cover letter title.
	- Fix typo error in commit message.
	- drop unnecessary condition check in compute params callback.

 drivers/soundwire/amd_manager.c   | 106 ++++++++++++++++++++++++++----
 drivers/soundwire/amd_manager.h   |   4 --
 include/linux/soundwire/sdw_amd.h |   4 ++
 3 files changed, 99 insertions(+), 15 deletions(-)

-- 
2.45.2

