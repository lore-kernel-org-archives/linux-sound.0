Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585143;
	b=5MI8cOioJ/qYIyRlcDheaNSy9qxNFPql+AWODD/ZPxEUgf9Ujg8ryf2XG7qdflAtr+Jz
	 xbEGyLm8PLm87TWXls8OOe0VUfXUwyGY7shllZiWPdU+a0nKN/t3pFHQYTift7aBl6RRY
	 yeYnef/bkvFwaEtPvq4yIY/jqmsVKzdmAt/oSw+fdTlY6zH4cQWXhW/tV0araQ0i/kOqs
	 +ZIQxppgfy6JF7Z/Tl2fYyymy6oAvimPEjeaG8ijqcmbLeQCk2LRpy6+L1SLNDzCMe/cQ
	 0zA/yUIlENtAw4a6MnPRyGHmG6hr2UWd7vDOOoye2FI8wkL65pNLYCP6pRBHRxbMvEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585143;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VfN/enoVL0p87JF+Em3y/WvwpYjY4zAPrPMM1mpZa3A=;
	b=NhPdI5cn4bRJoLWIbwJokPvqrMl+FmeXz/NmJARnLIvu6UrqQnh7rPr3DgyzgYymprG6
	 9D5V6r12FawvzD4znfiA+c6JWkqMa560IWLJ2Y2JV4zUQVHInJuws/fJ6IdnZz5Q24O0R
	 A1CphMQ6jO7G0uYoOpwF/DaquRQOPovi85kIXXLhL4P9P1khrQovrThE9g+bEvruHeoMP
	 3+9fnl11SRJNxlXLLbnZig1fK3gt3trLy1J7ustcRfz2JrYwYOTihUG9GCPiVaw5MjalG
	 bILFWTjK+LYSWhzrQ+LsaywV5epM2gTRRszSQcUrIaMHlZJr2pB+MK9lhFQHTpvZWUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KegPLZGi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61534606A321;
	Wed, 25 Nov 2026 05:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61534606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KegPLZGi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFIr0o8Lhk8ynHh5VcbLIRCyvqOI8+GKjFaL+Lqv71Ou0vAOIJ1/zCHTrfJ2biiSaTQuUU8QLukMt6h8J76bHcnUnUBjvmqJf81covxB6PDTLQf5a0NsY16h5Ep8PEfvkb8h1dfQljtNunh1tH5FD/GgAXyIA4m7hB9YjWpzEK2OcBMxd5obM2yHk+qw2Nx0rJhAfrrrERZHU5O2jXRaGqT7IneZrJ+RYmCxjmu0/kv0lGC3bMduNX/DQ1rnxkICedT3qJiRJXQChdBQByZg0t/YEBD1wzEq6txgrjVdt6h2CtbyXlwXJ/d+Z5PA0YpJ5FLpB4lXTO/syVz0lXu8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfN/enoVL0p87JF+Em3y/WvwpYjY4zAPrPMM1mpZa3A=;
 b=LivCYjcpF9cxfp3MF/GyKhH8aRVJ8mqfXxRIy1/sPkHKmJZY4LXFiz3xiCei9CFKcQtdtX3+bs499epxKhTlbpX6Q0lnyVyye/ZNLsvg1mEHWHBsNrlI6/gyCC2JaUGInD6SLNULrtw/s5YO6OGMhTxqbVXxHb11zu78QReRHUMpMJ9MOje51idBchOr0yVGP6yjq45ADhMmHp7eN9LtSTW3QPU6tFqml0ZtPqhuwf3HDyYNoHBj631y1NTGz/IEa6ilo9VSHOpOiCJR2a095aDq1qa55YfDtl8JNyVcoGV6c1XVWkD42/clVoBjyImEG/rg2MhpHRji+aGkKIPxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfN/enoVL0p87JF+Em3y/WvwpYjY4zAPrPMM1mpZa3A=;
 b=KegPLZGilPIZeIcT7Ppm45kwrJIsr2cyDTTunQGL2T8ZO21MP3hFjCAVAMbho905YddB4betUkqRy0SVjieAG86jVmXgJ+6DowtcKEjDOQoi7oZzxCOaLIta5Zt4zvCvDrSFCTedEPT49rPekNBSojC+SliaJrInGADOjPUp/vY=
Received: from PH2PEPF0000385F.namprd17.prod.outlook.com (2603:10b6:518:1::6d)
 by PH7PR12MB7259.namprd12.prod.outlook.com (2603:10b6:510:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 05:38:54 +0000
Received: from PH7PEPF0000000C.namprd04.prod.outlook.com
 (2a01:111:f403:c95d::5) by PH2PEPF0000385F.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 05:38:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH7PEPF0000000C.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 05:38:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 23:38:53 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 23:38:53 -0600
Received: from sof-build.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 23:38:49 -0600
From: <sravisar@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>, "Siva
 Subramanian Ravi Saravanan" <sravisar@amd.com>
Subject: [PATCH 1/2] ASoC: SOF: amd: acp7x: enable ACPI target power states
Date: Wed, 25 Nov 2026 11:08:04 +0530
Message-ID: <20261125053843.1611378-2-sravisar@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125053843.1611378-1-sravisar@amd.com>
References: <20261125053843.1611378-1-sravisar@amd.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000C:EE_|PH7PR12MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be18051-8b5c-4997-b979-08df4ab664af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|261009223027099003|22082099003|18002099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	7f/ky2OZYbyKVxJlBXgJTyUeF034eo3iGXhlkjfpJQy/UQZTU0fncLOoo/dpjafxZyq70Kg2UShuK9jAmkIM6QmLV2vZRVS/y3MUJbOSlcFkY3rKFn70kwerYnBYYZvW6vAoDr83Vtd2TKCRNEczBDMmrrDSlCQnfAQXdJ3PM/fbrPxZl0upiInsqgtvOlBityGaXWit14FeI0SZ7LLdHns5E+LPGi1Lu/GPrvGvQy6BD5pWi7NRFVkijhXVRzPQ7wybRT0V3hYJMFiervAjH1EMS9tnCK6NMU1tSTSswgqtBreN4HdS+PU6a8VNPvwEG231FtdK96sHTQO/OjI2+lnZ/zG4iJQXENGm41nmmsvbEGl8oIc1QUcXpsVi+UPISEShQeGKZbOVfoBy/kTUOJtB/OhzzBcr6aUi0QPpQCxB6vnQlrJDEqUxas1iufynC2oTyXGXFtG+lHh5KjyMTJwvR+y529d4rMQSi85oCEbdETn8wQZi9Hn+8+5kaQtvWJR6EnoKZRtGrIB5YJke4pCsSn+PwVqx/trXZvfr8rmtdqRV2Yv/sy7ITq4JLmWogknF58eKcJAB7E8VxUT45eRP2uAEFkVWezw4SxS+98NGDflEv1MFspyaNADZIG2xnET+RJAxjfH99uh5tc18R8zbgvKcjUKf7KrZRZOPlc1F7Wr6mfC8n7ZTk0b9X4qKQ6WRsm2g4mv9mm2BgXvRgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(261009223027099003)(22082099003)(18002099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wf7MxDTLliFFeDvja9iKR89hxcaJTLTfZLg6lvH5eSDpbs537EEZSSUkvH3HhWIoHuzdz0ivnsdATWh+s8zSu+EoKHx3Ttzi6w1jJxADNXaE4oZ7lAmNdjYcoXQWw9aIYqlnGswOwh1/+FlnKLMdpVkKWrv1Z8uPzeR0K8XEk3D8ftMYk9JW0DAV8kYhW7CNKm1H5SiO9GSbaAd4EC4XJidXhKiPT29C77UeaGS6g8D8IhltFeUGCOFI3caB6Iswp8vWThlVZBgiUj7SlZYTk+Q3GgeJPtjt+x+/WjuDlZqmbuM/egYvD1JINPGk6sMb8Ovp4/STv6CXPFDKGcG2tE8hA38int6RzeNurfwjPABC2ztv7ytxZbzPt+F10ZkrdZ6MbSTNHuOxRjPtE3hbag4MrNdz39iuoBPvaPXGu9xkG+4PeOEflu8ytGIRIbq+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 05:38:54.2513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be18051-8b5c-4997-b979-08df4ab664af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7259

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

The ACP7.x suspend and resume handlers need to tell S4 (hibernate)
apart from S3, because the ASP firmware carveout in DDR loses its
contents across S4 but not across S3. They rely on
sdev->system_suspend_target for this, but snd_sof_prepare() only
derives it from acpi_target_system_state() when the device descriptor
sets use_acpi_target_states. Otherwise system_suspend_target stays at
its SOF_SUSPEND_S3 default and the S4 path is never taken.

Set use_acpi_target_states in the ACP7.B and ACP7.F descriptors so that
system_suspend_target reflects the actual target state (S0ix, S3, S4 or
S5).

Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
---
 sound/soc/sof/amd/pci-acp7x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/amd/pci-acp7x.c b/sound/soc/sof/amd/pci-acp7x.c
index 5a21ab8ebb4b9..b27798f2007bc 100644
--- a/sound/soc/sof/amd/pci-acp7x.c
+++ b/sound/soc/sof/amd/pci-acp7x.c
@@ -66,6 +66,7 @@ static const struct sof_dev_desc acp7b_desc = {
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_acp7x_ops,
 	.ops_init		= sof_acp7x_ops_init,
+	.use_acpi_target_states = true,
 };
 
 static const struct sof_amd_acp_desc acp7f_chip_info = {
@@ -108,6 +109,7 @@ static const struct sof_dev_desc acp7f_desc = {
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_acp7x_ops,
 	.ops_init		= sof_acp7x_ops_init,
+	.use_acpi_target_states = true,
 };
 
 static const struct pci_device_id acp7b_pci_id = {
-- 
2.43.0

