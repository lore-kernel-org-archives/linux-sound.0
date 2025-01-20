Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6419DF4A;
	Mon, 20 Jan 2025 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368028; cv=fail; b=G3lJxIpEQPycquRdn/B9+iU+B9W0KjKZ4wQnbnuXDzCmsrx/jw5Q/RLPT0mNEJxrfSoBJkr2EV+gEdQlT/+S0x9NgxZd8HXD1Cz4cUo5pJeKpzOJAnpO7N7GLTJHiAO0PYd7knwZDTG2P1hk1I6oLPci/eo4rV/Kbu4ybHbfQcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368028; c=relaxed/simple;
	bh=LZTVUKZrTBybqdKg4zRlhxrjHrKAR1iBuAOvEwgR2bU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SU+2ZJW7K7ba0rdCkKl6XaYyss+ND0lpFZzlBZgGIm5z1Mez1pMjdkXukJ7/xIAKm9HI1lLD6kZFGoy1bdzovvpHhXct+7v3OMh+aO5Dy6DnT2zXNmQxirw7gkHcja2jez8pLJ7gwE7AgV1dsDZDKlr3KqAYcEIbxF5l//QUsoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x63dQzF1; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x63dQzF1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXrTBBGg8QAgMPh1nW9PkIhVGzl4mGKSoZUuEeWpnCPBToLRY+Z6ACgCp3nV8TKHXfMyUyGGQUI2waRNPqZyKcCRNoH3pz45YmkeB1Xu3EDebzmLU+Nq8h+auJI89+koTAi039KBbWlxTIF6dwCZEtblfJ8oOqIomZo113l+plVbd7bwwS3yHUStu9atJYNawi0+M4B+2yxKMz5pUBejLMqPiug2/hV87Og9qaZ+8Lx4MgXiUKQ3bt9mX4qo3/rrlOfkQyD+gRrGoEct5tpgF7FyWVNDCcZpszHJmMsawbhpzkIQMeRMtjKD+P3mS718qfemgSUGk/VW6VwyDyaOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8o3o1hZ0SBArlEP+64OwtTnufi+DcTr39Xl26cHusU=;
 b=vqLs61p28YEJIUD8YXeEfZKgyeYAr+T/G1ZaUfkXS21lFDV8DxUBBd5uoKXeFqXqoXOMCfBcNoINno/2RzcEYoFHYEP28sMT+eFoii0OlSwep3eue7BieqKq2L4zcc917XN8AvX8H5kc6OUnfoLasMnElf0Vt8sSpIkafNVeZPN6LEpAWYEVGG1+eDj0TSHH8YjiKJPF7saq4eRZft58K51cDQjEHRdxIsl2nmethpIINbkjBVp/qqnIJH09db+uGBoepHzANO4IINPPn76GSh5o1D5MP91BE+IAKnR1tY9NeBz8FFvHAwzMk0/VWM6a8Z8v4D1LS7ZBxOJLLhQeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8o3o1hZ0SBArlEP+64OwtTnufi+DcTr39Xl26cHusU=;
 b=x63dQzF1sOPvmcSubDqE3ldjaovYqk99+QbB27t2Eld/gDI12RS4S+adtUc8YwxaXA5SllaerEXyiP0Zv2IWXBz8FYlE3BQZH82PAz/7rd36TmrDEvRocGRZo6eBtpKCVI5dpi1qaqx4vNUujwdI40GdV/boZdHkXyGCwNgFIus=
Received: from MN2PR04CA0014.namprd04.prod.outlook.com (2603:10b6:208:d4::27)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:13:44 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::a3) by MN2PR04CA0014.outlook.office365.com
 (2603:10b6:208:d4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:13:44 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:13:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 0/7] soundwire: amd: code improvements and new platform support
Date: Mon, 20 Jan 2025 15:43:22 +0530
Message-ID: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 643ac94d-2c34-4d71-6da4-08dd393b1ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q7/L64fzP74pJug4b4gO+Smb8tslpczqYp5B58gZ3K/MapPoSiyvHE+/Zjpo?=
 =?us-ascii?Q?V1JNJE/+vqzBhzaYvKTxREqzsS4va85pE1E9G9itGY7RcfzB1vOy5y7Kefd4?=
 =?us-ascii?Q?Pom9NGrAU7UxAARySmo9iwssOZde/pB4ObNYj0C0znVZCbr8PIM3BADX4/bl?=
 =?us-ascii?Q?aipYJ6wp5wHAr8ZDA6iw3k2Bk17xb6bZ/7E9u6McYTWLgbrhdTHoBYT6FI4x?=
 =?us-ascii?Q?cNq1/GzCBxPZYGV/fKOIesmd+jaYO+/06LbvVSHxJHvA06dbPeZsnId6BW+S?=
 =?us-ascii?Q?0wCu759xX9utK0+fqa7h7br/1iWZFWJmlOYqU1p2KRIHuEQCXdvh+HWF+36A?=
 =?us-ascii?Q?C7W2vpnEaNeOgUNNymA2aSzfSRpzjtbYbGuL21XVanR+T9kmNgmujA5OZ3w9?=
 =?us-ascii?Q?mncpF0TmJVbrsgtCdlLsivOiTnh6KXMPwV/E+YmdVuHicqP7qCm5vtLauDLO?=
 =?us-ascii?Q?mMswIQyX/m9hrd28gSiUZzPuTKm1iZs4Rvhh0HZTqrdpgF+XitotQL5xk8mp?=
 =?us-ascii?Q?ncRPnF/d/MfUey5IGiLs7mE8R72ypRmqHdn/aJfZU8Yf5huf7xzYvmz6tuY/?=
 =?us-ascii?Q?AxjK+LsIBbTWjNl6X6AQsneKyPX8dbgEUqdy2CeNnc1xWKo0CvhF6KKHeYmX?=
 =?us-ascii?Q?0enMfTrMWd/mZzoyJoNJLGv2s7HVgSWBrYeKNiHFuCgyFF+Qw3Q0fwHdXqJc?=
 =?us-ascii?Q?V96oeZbI1FBhxMLolvD/iiIWKSEP338ZyaPa8NsCC3G+LFmvY6y5fGxgBkAw?=
 =?us-ascii?Q?/ogD4MJpEO9nJgV74O8DbGks/nDPs7llJ3BeyM/GLn6VvCUAuPRX6EyoR482?=
 =?us-ascii?Q?LaCOXwnN4Kl4B+T4R70LxMG1hDhue/NFJ7hf2nT2d7gu/tR0hDTKlqCjIbgh?=
 =?us-ascii?Q?/V7Gzh3FlLf1ubCry4BRktQ4G50zn+6E7ylHZ20G7jhEdkAyUgfNkINKR4Kk?=
 =?us-ascii?Q?mXmXDogpMQISJu/zy6rz5Qbep/UXYOZThNCGnGWUAKEi3+5ZsHd1/M6/XgqA?=
 =?us-ascii?Q?I0eqTaXoO1RFdj4o30FYxAzlUcUvsoIoxgfFUHmlCamUQQ3p/V4hjpV5mrsJ?=
 =?us-ascii?Q?S/CSCIG9ikGyGhfA7uIJCnmq9PApDyrVQsMlint18PSVAH1N3faJzs4AjPmg?=
 =?us-ascii?Q?2KqL2s5Xc6sAIg+5m1eDDYzbE8PLdSp/g81zzViFVzn0ZCBuObMtAXP9NPKo?=
 =?us-ascii?Q?1lNmJlXReGaKfmwgRyv36FQsUhNCyEobmafymyANc/YS3GlHIzFeG1LecAZW?=
 =?us-ascii?Q?1wrCcmpRqMI2MiPyO/HVXW5hx50LJGAVKc7GNkHkaKtMpK+Ya8bnbqyB5cAX?=
 =?us-ascii?Q?JSS+zrqI81PJFdeFiiCsdDl7NKHMKYQqyXcPWGP/PwjOlpRDt2Jx28iFpNbz?=
 =?us-ascii?Q?fru2rWVwUdol4MEg2PtoQv5pXw2TQnHGqXGfjmOpAxpOXRXJldRjUyJu1eSU?=
 =?us-ascii?Q?oszOfcsGHVrj7EjdDGErzpYnmdKfg+KtChnu0Pg20k2d38qv/hX8PKUrdQwV?=
 =?us-ascii?Q?1djZ66PRjLWjrRI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:13:44.1213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643ac94d-2c34-4d71-6da4-08dd393b1ef9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464

This patch series consists of code improvements and new platform support
for ACP7.0 & ACP7.1 platforms.

Changes Since V1:
- Drop white line insertion in the code.
- Add a conditional check for SoundWire manager device resume when wake
  event is asserted.
- Add new patch to set ACP_PME_EN during runtime suspend sequence
- Split the existing implementation of host wake interrupt mask
  enablement and setting device power state in to two separate patches
  and refactor set device power state logic.
- Drop PME status clear logic.

Vijendar Mukunda (7):
  soundwire: amd: change the soundwire wake enable/disable sequence
  soundwire: amd: add debug log for soundwire wake event
  soundwire: amd: add conditional for check for device resume
  soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
  soundwire: amd: set device power state during suspend/resume sequence
  soundwire: amd: set ACP_PME_EN during runtime suspend sequence
  soundwire: amd: add soundwire host wake interrupt enable/disable
    sequence

 drivers/soundwire/amd_manager.c   | 155 ++++++++++++++++++++++++++++--
 drivers/soundwire/amd_manager.h   |  26 +++++
 include/linux/soundwire/sdw_amd.h |   2 +
 3 files changed, 177 insertions(+), 6 deletions(-)

-- 
2.34.1

