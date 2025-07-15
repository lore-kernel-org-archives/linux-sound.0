Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932DD26CE31
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752581468; cv=fail; b=nyHCpK3gkCWzzu7zhRq0G6LFbrc+VJCvNdulWP+V+hXm1bJOt9NDBekK9tYUFPWkdyATtm+E0SMVMA2EwIarxJNWWg9HIBXTpD9765AKg832CCUFvUphJUVKEHME8AW2jv8iMI1NuPGeQPonqDnkdLXMYuYNX00C7a4D/NJ8ngc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752581468; c=relaxed/simple;
	bh=X6dBue7SonChY5mcT5FmtNgejD97VEJwbvgK/7ahX2s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n6naCSm4HeiigGiCE1N3UMnoewukwQ98mgKtL4SbyO340PKqnuX94vjq9Mpvuo6m+ELb60Kk2xOJZ4tS1dHNj+77+ddAoSl+rp1RPycY0CWfoMPnR97TmKc1UaAnSnIKf7ubPqPwoGK1QROq5MRkN/NBvoznuJ5j2ZZ6xShNPZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=itiDW8p9; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="itiDW8p9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amReYPMMvZmfmI6B9KZCj08eH+Xa24RCI0Z/fzMr0+f2iGkLBxpTnCwYeGHCwOUsnPVmOF3v1pi6d6MSuBAw64XdU9Bo7jw/L/1RCRNmfdKeIcc7W6dv5BMSfOIfQux+XZR+t4eTUR940SUDPky0NE68Q3f6DuX8fzvryfWOi9XOnOqFRVbGEtSvPuMu+DwgN+v/6cUklpezfF/jhHpjGo8NaIMwwOIuqG3uS3uGxXZgIGiiFNhtpxF9aHh4Yh3TCwXHXSoJlru5iyweCA8DenmJTkyee/qTLYZ9dDBggGUw4KprXluytaPQntw9VtKT47jGs5wuHi8Ktisb0desGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/g9XVoo2fcjH+9OVjtWW/Ew7Q8SAhrIDz4Eva+kcEc=;
 b=Iuv6ofoX3GMVUz8hwMh1CBIH2+xBtfWCqgKmYf1RmQKw8MUGFYsQRBFShrpHLXTuQoCEvpkKnhp+R+2QDU2uelp5t4Wdk4HqdYJZmQkChtuaOTsJrPbkbR6+VJS+q8oIv6LC77lPSVo+AgzlGc81Xd71O4gYurl+wYSUk8divJ2FyHQSBk8mLM2PwXyskvD99D7Beh3JV23gLrFmYKbE00XCVWpwQvo7/tojksiYq9D3KCUEIvzCkJvpz2gqc3YCzC6dIRjTWUzgZgu9O7FXrswUPfqneMuFg9I3W/qClmdJYPNkTWlyOPjvP7PpRfnvma4x7CBkdcuXRZ59GFZ0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/g9XVoo2fcjH+9OVjtWW/Ew7Q8SAhrIDz4Eva+kcEc=;
 b=itiDW8p9hVXUkinmTaXxocAe0oGt5ZmI6NTl5RaDs9TwuwmKvP7h4cuxKBrJLKzIyJ03QbhPYZhexBxUsTZNl1ozaesXDIebiDaTo+nyLzNI88DwznXKGSDQVAund+iibgPDtQ+ys3oVzd01iVZT7iE6c1ZBq2wweH3Q2Ua46nw=
Received: from MW4PR03CA0075.namprd03.prod.outlook.com (2603:10b6:303:b6::20)
 by MW4PR12MB6874.namprd12.prod.outlook.com (2603:10b6:303:20b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 12:10:58 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::3a) by MW4PR03CA0075.outlook.office365.com
 (2603:10b6:303:b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 12:10:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 12:10:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 07:10:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 07:10:56 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Jul 2025 07:10:54 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <vkoul@kernel.org>
CC: <linux-sound@vger.kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>
Subject: [PATCH] soundwire: amd: Add support for acp7.2 platform
Date: Tue, 15 Jul 2025 17:40:41 +0530
Message-ID: <20250715121048.1795607-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|MW4PR12MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: bb575885-7eb4-4f0f-e1b3-08ddc398a82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dw3cZMjgCsipDbo/MvjJ6pY7Dd3qSuCB0sVbOHOA8719dShs6vbBtvCeb3ak?=
 =?us-ascii?Q?C2nHIR55L9FseWPR/DUu5U86eAa8N1OoM7G8YOSzzr09tnFs4SYKnbmNkWfV?=
 =?us-ascii?Q?qzbDzayf3Er6LYclnJBw6yFpllRJCyds1MCrN7B7UHZRzMBY5JuSjFgImnwd?=
 =?us-ascii?Q?cBxpoIeaahCMAnk0GIG5aBsLdIfF3z3T1WdOqMIo0NtQDnxPDShMXSowHMwV?=
 =?us-ascii?Q?fp4XfMIE8EUiEa7sjYvv8Gg5FUtJf3tcu6tUn7n15LEr8hQS5laZcCwaboww?=
 =?us-ascii?Q?vbE+iBM8vcwHh9CWNOQtUGAqXcNNNkEdZB8hha0SCOZKf1BnGMQCXhBRoNy+?=
 =?us-ascii?Q?Vvb/GZAsi0VkqPFVr61zv0XEBU0B0zfCh+nHqrLWM5eJDAqfsW2I19FuMCxF?=
 =?us-ascii?Q?fiLwgkXHdXz78+28P9jmj8dE7wlI172M4ss93iQXY+BWNhqfa0qIR0AtY3JG?=
 =?us-ascii?Q?tW7SUW20wNgh4BnnU4Ue6+ZQY8bBJjLL2YnuMnpYtm7gYFu399RX5xFK/yTy?=
 =?us-ascii?Q?apAinC/y3fkjITV2EhW43w+7p2Mq5i6aVxUZ+Fp27mkcpI6YxBKr0KHrcz4Y?=
 =?us-ascii?Q?u8PwD0xcc/kIA29cTjKekAOL5W8Y0N1+sAR8rLnDuKv25Tt0W5xcxF5jxgY2?=
 =?us-ascii?Q?IQ7WDnzn1ZNG5+omZaGkmCxUT6natMmBxSAiALFCmtySR30vLasYC9hCKJqv?=
 =?us-ascii?Q?unfcSr0G6ijTmD+U/G6iiaGijs9HrAqk2RknLFOXH2a2QOB1M0QL7PoBOSt7?=
 =?us-ascii?Q?6FjhJ8zaagLlwgcfiwgIPJuzNZ4XtcBGQj4yreCwIWG2AmZR/DL1fCRty1wF?=
 =?us-ascii?Q?jtUFM7jRvwcs454MTfFlI1s6rZCEJqCVSip8sxxRoGJFhhQRvrP1FReIiZ+k?=
 =?us-ascii?Q?sT9HRgl0PwB2+nAyqti+wSONbOFlLPvEWANH+TX+aJ502RLAd6WJo5qzx80F?=
 =?us-ascii?Q?IHid3IxreHu+JMD+mjNFBsvHC1ye0KSmIpbsOwPQVhPnBmYbUi/ZfI7eV/A8?=
 =?us-ascii?Q?dpiOhu+5rl0/V6HyAAcYN/ufTiHkoeteyyflanlYc/RMiX5tGHOqZ4/Mx6qw?=
 =?us-ascii?Q?1vB0/ZhY9H6XsdEl9XsZY5VZ9qDeF2HYZAg4kE20c0QQ/2rH9OOWD/d0Hnbg?=
 =?us-ascii?Q?2BQRvqeDPC5grlRvKIa1z1G7n6d5/oy+qH2pTEDoP+yzvYbDRy0/zetI6GMn?=
 =?us-ascii?Q?B/cto/jCPUI+VqWYNmN5v6e0k2Ipyvhoq9FV5jnaTIN3KpPNfhWgEWLvCb/f?=
 =?us-ascii?Q?RIH2jrRgRdHgM0kPq/0jX0Uy+GPmM4osuwbYIxzKD/zgIG4ZY73J1IiEDdfm?=
 =?us-ascii?Q?jKucLvH3eIfes7u+h0w9d9XLc180zpEuNB3f/8tZNSbE2Vo/a/qdMffYTcgw?=
 =?us-ascii?Q?g1K9CVPSrgMQIy4RGnk9npcqw8sMj/uLnydZoN0EbS5qfjKKBF95/kBcCzYw?=
 =?us-ascii?Q?sjiwDvfiiPJtyCZ4hRXwLER3OXBFrEPepTJqDksXCATwnWY15Y0BFJKEdKRn?=
 =?us-ascii?Q?EsbnAo13oR96o1xQN7GAio0wECQ5Js0mzN7x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:10:57.9109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb575885-7eb4-4f0f-e1b3-08ddc398a82d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874

Add soundwire support for acp7.2 platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 drivers/soundwire/amd_manager.c   | 4 ++++
 include/linux/soundwire/sdw_amd.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a12c68b93b1c..b07ccada0c7d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -499,6 +499,7 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
 		break;
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		frame_fmt_reg = acp70_sdw_dp_reg[p_params->num].frame_fmt_reg;
 		break;
 	default:
@@ -551,6 +552,7 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
 		break;
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		frame_fmt_reg = acp70_sdw_dp_reg[params->port_num].frame_fmt_reg;
 		sample_int_reg = acp70_sdw_dp_reg[params->port_num].sample_int_reg;
 		hctrl_dp0_reg = acp70_sdw_dp_reg[params->port_num].hctrl_dp0_reg;
@@ -614,6 +616,7 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
 		break;
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
 		break;
 	default:
@@ -1035,6 +1038,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		break;
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
 		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
 		break;
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 6b839987f14c..fe31773d5210 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -30,6 +30,7 @@
 #define ACP63_PCI_REV_ID		0x63
 #define ACP70_PCI_REV_ID		0x70
 #define ACP71_PCI_REV_ID		0x71
+#define ACP72_PCI_REV_ID		0x72
 
 struct acp_sdw_pdata {
 	u16 instance;
-- 
2.43.0

