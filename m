Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9638757C;
	Tue,  7 Jul 2026 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404142; cv=fail; b=BHSudLjgMwlyuUzMWp0MtDHqqnHSDad/Ou7ZozJOz1h+1i4X/B8EcTuUs8a3YADbEeCYnammFO4L8mIE4FTUPHbe2HNb3KDj1anMvOaQI1R1FtQDIf1WVKSbht/nwiP9K5FAXTHZbiKOPJXEJQstWHYyVt44U3MyDCPZIU6SyPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404142; c=relaxed/simple;
	bh=KZ+ngyLP0K1YYyH9zxWbh1AHIVd+wCaeJM/FdCL37c8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fcujH2/IBXJXdf9Xzp0O+VJaJZ7IPgeOc0/q7z0ytSR3JhstiM+boMjlpvQJLjQp6kIkcq5oQy6qZZSmBsRWOLNiUYByHECru9GNSpiY1JL1SlWY5eXLgWgslqQd/8gC3QVmcMObXoj9coWgQ13Cue8/s7RI51+98gAUo0OQL1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rZnOw3JX; arc=fail smtp.client-ip=40.107.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rZnOw3JX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/GkK0XcQ8P5MR7zco0sBdq1B+IXqoFGTITTAcSDR30B0hWHy7lFetvrDniIM1hNVpy8G0FCReugxpcidKmaDPAD4LhX4fzrCVbxGkIR7avuHqzMZx20+9r1P3UrJBeshveSCWwXVcC5xBOLGSCL5D8wY0WC7rAiVusOBkFlsLSAT6rowDfAUXM0Il+qMBCC8HjHn9j0spAhZDOKwHB8wmWiMTKHgG5wgc0rmc2acoXNCVjM7SYKHjFbfl1/V0u32onh9+wMK/1BaKECwkTGeBYewOyr1s0vrMBMov2O8a/v/B7OqpQLGtJpwhajqHWsIjOoHHJdI+u8KIMAwcWIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daQ+rfolYFrMy2bevD89KeKdSeNFMJSw4j5OAE6T8fY=;
 b=G9gYejfC9DIjTGYSnA8ASm7r5d0ZZHw73vVlG0ljMMLeWkboUNxfvHOdYrCKqGqkJc1I+LCdjDX1Xqzx/b9D6pgGSJ5sFHuMwICKEIi8hJyP5QTo46dGkPwel1uiT2jsNl6OZ1q2LhsmyEocN7a6z06FMbQVxAIxCyhmrZUZGXgqR0DMm7rGA5EQ2HqODSXrZm9PvcWPT6E+SKXhjRI5plrw9dFOHSnNV9fObXKGZJvlp8HiPlS4haTP9CXvb7e2xTXVdWnma8i2+XrHn9LgC/nfiSnYUsEglXivG81mzzIRVH+JNVhqFbds+NKtP+JT9L2wD4m2m+oywJ6MghsiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daQ+rfolYFrMy2bevD89KeKdSeNFMJSw4j5OAE6T8fY=;
 b=rZnOw3JXSNcfl5N/dYE175eWJSPSDiwLgbRdRA3VDg0IVzyfGk9rwyX1UcQrUCnxMWrJzcbP4CQVGV62sQMyvIYPIbNPIXucRtW6wLYlt96NBrjsKBpEf1USYKtLv94EE7FkqJHCxzH8abCI0c1H2MKkwCXafy0t6jtKrbzuVtk=
Received: from BL1PR13CA0162.namprd13.prod.outlook.com (2603:10b6:208:2bd::17)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 06:02:16 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::86) by BL1PR13CA0162.outlook.office365.com
 (2603:10b6:208:2bd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 06:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 06:02:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 01:02:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 01:02:11 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 7 Jul 2026 01:02:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <mario.limonciello@amd.com>,
	<syed.sabakareem@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/3] ASoC: amd: ps: disable MSI on resume in ACP PCI driver
Date: Tue, 7 Jul 2026 11:29:36 +0530
Message-ID: <20260707060130.2514138-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
References: <20260707060130.2514138-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 28305aad-daaf-450d-2ed9-08dedbed4c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tOfcDy93aGExMlMgt5DEd5KskWtr+zIhGdYKH4gOipVsc0jAOq882l7/Rk9B3UvjxevaROFgdZMMCfV49JDj/TyJsa7CcY+BpgYu422iQybE1J+a7u1liOhzPAyehge5tnZ4xa/4ZWZrui351jZOn6JfjMxjZx9+QuELsh/BeIhEiZA7ZxG5Dkgogawe4qPPwQSMPXfc5rOnh/nV/R+MfCOeS+FTbwhydx3GnJBU9EoImECoFqRLsEYPIw0M+PFoq/IYG72Vx2MwmRoaskmQfMTK4Y0Eb79xwp5wdtLJvyGUXX0Mr+Preaz+0jMj+qh4zjeuH6PNEyBp/oD2pLN6RcYX+DUsDGzi84/IhEGiG438ZeEMdaWHuCoPyv77dXa/3K3Csqra67HeTNGyU2wqUH7yf63l6P4st5d/jZN3akQdO8X3+4wb47JFwNytj8OlEwrhDtpXMPSP9SIV2kh4sfIIid4LD4Zke2nJDGeVPbSDN7Dbgmt+7PAQM8tw7UdK7FNJsw/uUojY8KN8yFLteYLiiJFN2HkiM21diZmnhfZQZIcFjdH1hjMegiaKx2WAW5Vx+LMyrxx7v1OiftXLczZCfQ/lE2i0Yfo1wGBkjFhahykOk126eS5CXPMPLq67jULpG816y9PzTq9J/3U1NDeK3hrycFBAc8ZBfWtO+S69joddnjwqv6MBWw5tBRB0PbqKog6Cu/kIC6whZbCbpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9RuN/MTlklG3/Z6RjX43K3hPvelC69/KHoAnjhUVujzFQyoba21Rn26lLS7e1eltA59qC3ZMK+7Ts0ICIOZLqj5kcutTYLQULGnAki3HRgjgbD75T7HhsPPOPiT7LjK4dhoLgEBp+jhp1EWtK13eZv5sBTxnL2WqrIaa3pdSVgMGqamhCdCzsL+CVsfBDmTvppkXyEpVDADDvRQYH62K3Xo1wHbBkHeW6sg0dydxYg4b/jnwtmSEUAclImfHLQMuI3XZfaTItWn6STnbGvzy7Mnhv9CWPJHhzAQv5C6B4vBdlCDl5Qez2I2ssw/J6+l+I0OeAkpF/sxuFeiPCFdGA2eeWsE5zt0YGdXPdy4W+J7PDSZD8j8/yeVIqCkReeLxEFPvgMZYb4BwTn7IGUf4gkpyVhye0gJCtlV61knqcnBNzbD33MtCyvEP05OlTRx6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:02:16.7221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28305aad-daaf-450d-2ed9-08dedbed4c55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694

BIOS/firmware may re-enable MSI in PCI config space during system
level resume even though this driver only uses legacy INTx interrupts.
If MSI is left enabled with stale address/data registers, the device
will write interrupts to a bogus address causing IOMMU IO_PAGE_FAULT
and interrupt delivery failure.

Clear the MSI Enable bit before reinitializing the ACP hardware on
system level resume.

Fixes: 491628388005 ("ASoC: amd: ps: add callback functions for acp pci driver pm ops")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 4ecda224157b..635832da45f9 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -693,8 +693,37 @@ static int snd_acp_runtime_resume(struct device *dev)
 	return acp_hw_runtime_resume(dev);
 }
 
+static void acp_disable_msi_on_resume(struct pci_dev *pdev)
+{
+	u16 control;
+
+	if (!pdev->msi_cap)
+		return;
+
+	pci_read_config_word(pdev, pdev->msi_cap + PCI_MSI_FLAGS, &control);
+	if (control & PCI_MSI_FLAGS_ENABLE) {
+		dev_warn(&pdev->dev,
+			 "ACP: MSI unexpectedly enabled after resume (flags=0x%04x), disabling\n",
+			 control);
+		control &= ~PCI_MSI_FLAGS_ENABLE;
+		pci_write_config_word(pdev, pdev->msi_cap + PCI_MSI_FLAGS, control);
+	}
+}
+
 static int snd_acp_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	/*
+	 * BIOS/firmware may re-enable MSI in PCI config space during
+	 * system resume even though this driver only uses legacy INTx
+	 * interrupts. If MSI is left enabled with stale address/data
+	 * registers, the device will write interrupts to a bogus address
+	 * causing IOMMU IO_PAGE_FAULT and interrupt delivery failure.
+	 * Explicitly clear the MSI Enable bit before reinitializing
+	 * the ACP hardware.
+	 */
+	acp_disable_msi_on_resume(pdev);
 	return acp_hw_resume(dev);
 }
 
-- 
2.48.1

