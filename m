Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB64E4F5E12
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896100; cv=fail; b=lyxqcUVsHJRBWpeARR56POrgBPDzbZwKleQtcMeDUibAiaO+y2OVtz0OMMjcOvhJOCnAwL156uBTs1XJQgfLH71sCJRuQfQhwMzv0mkY1GfuAWCPeNS1wbz0zsMyX20/IKJx+ptuQ59hM/MBwrAbNll0u5+mU7WuIcDLWyWmXEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896100; c=relaxed/simple;
	bh=V72luBVyNlF9wX11Y1/+0xWVv/UMOFtaq4i4DFkvb2Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H+Z4Lvn8e1Czlb2LVoVd93XYY/3W+o1ucHM+LHNMNJ30y2TWQyhNXCYJGaASkfmcWM2zhHrS+e0lGDMAdxGEnA8bK/bJVY6C10NbHgiAP51HZd5PFQVgbZivEBNQ+D6i7wJbueiwvEg6xwXm1Ug0DVkdrbrlxUBPfISQ9+Ne7GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GOocZpCY; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GOocZpCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fw+vex19mIULNiuKrHG2oQSGOh6oW0lC0scyeqDxk3udcLhHh2HoBfVihJ4JMConezRb9XBQ8fNWbgRcFMpGRMetL2Lub6vWgwYtMxd/uTqFDSE3XpudaQ0i6+2G5xD5Ve8Rza914ST92wV5jAz4ZbVyxn23t7d6smJmhDHnWp2xgV0ePBw8SlyhHyRnQ0JlTwHqUWYSJD0CNebJbkLDNslB4GHGtW8z1kqBGlrhNb3x/9EqGDSj86VEmMAsAPfZSNgOanb/qEA2VUAdLT9IwNNdRCTdWChSi0sxZrDn1b4drAtWFcYZkWGkI/CEWMJRmy1SRi5MbCvcCAkppIK83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNdAfXcMig+O/CTuGT7r65sBCQpMHUYrypZJXQZhQqY=;
 b=vJ/rKhlTYyTGyMYrLH+t3kC2hb0ChXJUofsG7VdUbX/HzMBxb/KKgHpUgAPNPWMhnnyvqqB8d0I1JnMiOGXRGs4A1PDxG/wUJrCwQlQ8upJlezgOTs8yHQHGPMXF4V3iGWWBT05ZV/DkYhPEjuTd+7tEWWGaR2yLAJo+j9rDkJp+Fzub0qrOggtJt4s4P/gHPiX0HU4S29H1PJYKMRYk1ewdhNReciP6plP3nvjKYDK6qN9GAUa51Qc51vrhcPkbIik89hgQJSy3DY+nDCyB6HHUZpkKuUlQokO79HvjUY2XMI2l5VeMvpB9UJrumVk7C6+FyjwPnnlHwNhe+oFNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNdAfXcMig+O/CTuGT7r65sBCQpMHUYrypZJXQZhQqY=;
 b=GOocZpCYSajr0qxBKjubOWoIJpNNEpIqPJ0KiosmrPpDKtae5kMqK/AroZLwK9n5jm+jPge7PVzASnpC6GQMm4i4/CtNw4Jnem2vyyYh5Pkl7qgjiBaW6aVIHDL9Cd7bI+PAXNzhlts9bUEvi2sYJwSmTS0tYOK1tX+dTXG/YxM=
Received: from PH7PR03CA0023.namprd03.prod.outlook.com (2603:10b6:510:339::23)
 by DS0PR12MB9399.namprd12.prod.outlook.com (2603:10b6:8:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 12:54:52 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:339:cafe::56) by PH7PR03CA0023.outlook.office365.com
 (2603:10b6:510:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 12:54:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 12:54:52 +0000
Received: from aus0006770c4n-lx01.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Tue, 13 Oct 2026 07:54:45 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Vijendar.Mukunda@amd.com>, <venkataprasad.potturu@amd.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: Mario Limonciello <mario.limonciello@amd.com>,
	=?UTF-8?q?Marek=20Bor=C5=AFvka?= <boruvka.marek@gmail.com>,
	<linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: amd: yc: disable MSI on resume
Date: Tue, 13 Oct 2026 07:54:23 -0500
Message-ID: <20261013125425.3541206-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|DS0PR12MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e446a5-2f2b-4ecf-70a2-08df29292c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|13003099007|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GvuTO28cUWuhdOAkouk/B9qG91+rwaW/8ahrxWRgj5ZVuYtyHuuz1h6FoYwaSZFSq25N+d7uSJL3ctO4TvITF1kHV4kQr51AwPvGdXaWqTo4MNcYa+aUVc3GGCQ1aHfcWZWdhYR3C7sCCGKIWGGk5HHXWhkMKf0azBHWZT5uhuJkLLR0zf/eRmDafyqwjrKnaDsfdKiijAN9V2Ik2H1yYQcam8HEMULk6/U3dHVVAsoONXSjMgVWVO6LrRn9+1hBik90Lr8RI0rLDkstmAykIwj6bcQik4jdsVU9WQ2pzLvihFDXO9P0wLp1uqFcjGJ4bCL7aW/3IycSiSyBo+g6NOYwJJcoP5opQUYbxiaT3E4X2MNu/dUg6V4S9zrH3Luzhp/gLW5Cf0KPAkMk2/FP/uA9/chC0cdKcoiyS9Sz1ctgcIqlSXVir3pnkCTPRtTa9aptP6oZ3F9fBTh7suZe4VdAlJ2k+JcFWEU2RaDZN8MurucVwunaQkQV4/iW9xmTQTEEiF1/3QxJQfclmA5HSTtWm8biscdZd3IKXhKxHejOoqQyMhK2yA+ZXHpArZXdYbfzCI2b4f52YYA37yuFOlEQGhGiZ4vVG57lfed/0ncNmYQoqUsFSKtghMjdvz7qLipypAoPtUTA57vrMxA7HQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(13003099007)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6fwT/CA4hTQhBs7rWAFg0LA5xV8I1UodKL9//vvdArt963lgXEah2oDMOBIUs2VvNHldsg4o748d7SCTpSOKVXxOyTFMkQNv9Efw/pTK0XbehVycHS6jQfvYFyU6VLdqk1MJlU92quXUeXBnaEq8iZD0Oje63bCFeeIaRT+L4iZmExDxtwnW5C6UirW5KCG423uBFsD4JEKT0CffMdbQ3HUbg98yp41Tb/pQoDqdF6rVQLPIhEbQe8+1Wpo1J8zDrcj3+DfrkcYvGkFchhLM4lRFHLsnd0R1mt3yMeWn5IInDC/BL7x3Vy8nPbXktetONxPYupopTq8A4ck+MLuyJdWiHUxSHQFPZuEHWa7qOpSt+zzAKlC0xrcG4JhZoawDzv15KVF59WtFaH2nk0ogrNkfC5ZXje/u40z2WYGYb2t+ECcKIfm/FHi3o93rN/I3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 12:54:52.0158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e446a5-2f2b-4ecf-70a2-08df29292c2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9399

BIOS/firmware may re-enable MSI in PCI config space during system
resume even though this driver only uses legacy INTx interrupts. If MSI
is left enabled with stale address and data registers, the device can
write interrupts to a bogus address and cause an IOMMU IO_PAGE_FAULT.

Clear the MSI Enable bit before reinitializing ACP hardware on system
resume. Keep runtime resume separate because firmware does not restore
PCI configuration on that path.

Fixes: c8212df7bc0f ("ASoC: amd: add acp6x pci driver pm ops")
Reported-by: Marek Borůvka <boruvka.marek@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222119
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/pci-acp6x.c | 38 ++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 671443204e046..bacbfc55c598b 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -301,7 +301,7 @@ static int snd_acp6x_suspend(struct device *dev)
 	return ret;
 }
 
-static int snd_acp6x_resume(struct device *dev)
+static int snd_acp6x_runtime_resume(struct device *dev)
 {
 	struct acp6x_dev_data *adata;
 	int ret;
@@ -313,8 +313,42 @@ static int snd_acp6x_resume(struct device *dev)
 	return ret;
 }
 
+static void acp6x_disable_msi_on_resume(struct pci_dev *pdev)
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
+static int snd_acp6x_resume(struct device *dev)
+{
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
+	acp6x_disable_msi_on_resume(pdev);
+	return snd_acp6x_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops acp6x_pm = {
-	RUNTIME_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume, NULL)
+	RUNTIME_PM_OPS(snd_acp6x_suspend, snd_acp6x_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume)
 };
 
-- 
2.43.0

