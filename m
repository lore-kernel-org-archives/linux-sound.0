Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5CF373C00;
	Tue,  2 Jun 2026 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372453; cv=fail; b=P0gg48h6kKBOuw4QC3nTUWH6Qco0KciQCIixpYO4fH2e735r6W6T/OwWqGh2a9fBHh7Fow/xbsON1tg0BlZIhekO5qYl5wyP4HseLxPWDkYbwgDYjArhMJpzbm+ZJfEjsnh3D0mMXP/b7fsMeQWQAJbemKyKx4n525e6mDGWT90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372453; c=relaxed/simple;
	bh=o/2f4kFssL8WcbmhbJG2rCI7AS2JsgwiLzDcN8+Bib0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xma4xSKE9R9YObVZd7pnAFK30lKmiuYmhhC8NHK69XCk1FMwuniEilrM1c7HQsClPJqW8Awq4QOCrb5CSQITZTDpWVqTmhaJ5nnsvj9regXQG6klBRT9TopgqWJ269S5oALKY2oa03dz1lXmekHKBUOWDmwpUOKU9s+x+NV33bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AiGozE1m; arc=fail smtp.client-ip=40.107.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AiGozE1m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6DAnQg+wduG+Iueraw86iS8XSA3UKeQpYeqNm6oGKQC+5SEYIBzFXLl8BFsPCtkRLRSo8pzsbHffhXMYb2do6rzUGA6F0AkX9l3ZmhBlAhxefHTOYaDk/N9TpZGiXfLAz/0r+P5YbJswEYBMBSrfiKfm92qL1qeIyARAzkxuju0epZIrC8MJyQVZQAZ7HAHXaBU0bS3mr+SrFadAfl2ccEDtTdIp2UK4M8qxppo7+DCL1N6OsMef8PSd+NWcP0YvlemczvdB0MeHDiZxdum0cPlNyLzqxk1mk/tCGJ5eqnbc1oXMS1nKshcYiClgPx3IhxPd3I2a0r+edzOaJo5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxINeRoZxNXZejAXLWNZiGpS5YDtVbOWfrI/Pur4Upg=;
 b=zMsMjrsN1vhAs2i6Fap7nneJoJYTFhIy71EdeOeoWCkW0lVtmpUKPSblR8QblSiCyijR/rLzGlsy6GYeDaSzNBFy+vPvUt+c0T2Ql0V7b/xW3iT+qfywMcZ5vkBuXVljlok38UfrB+PNS7eUMq1jIsReBZlEE5D/R2VkHVBlbvKUDDVjoleGYKhIZxrgC6tr2rNkdGkIod46Rsj/Qjb8PdKxKL6FlrnCaVjF3o83Vf7cWTFSu0ttOzVrCYFRTDwapivhD+vRhTNcxfrgEFhB3a54DMProrNowur4UX39RH99B1wiwQ7VuBnvOy3hiUi39W8Oa2/5cJu4RHac+MN00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxINeRoZxNXZejAXLWNZiGpS5YDtVbOWfrI/Pur4Upg=;
 b=AiGozE1mzA/hMnv3Jq4LcKhpwoca3qqr4rLrAUqb+/lCi2QIngVIn2PFpa79DroECJK4EI9Ebd2f0QJdnxqJWg27OqCyzQ+xdqLDl8IUla+SAE7tZ3nOO35ywcNwDfRt/8KkKVeVBxoFNQkGdFutqa2rCyx+7N2s0S0MlXWFl/o=
Received: from CY8PR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:4d::11)
 by SN7PR10MB6593.namprd10.prod.outlook.com (2603:10b6:806:2a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 03:54:08 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:930:4d:cafe::a4) by CY8PR02CA0006.outlook.office365.com
 (2603:10b6:930:4d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 03:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 03:54:08 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 22:54:08 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 22:54:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 22:54:08 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6523ronD2951709;
	Mon, 1 Jun 2026 22:54:00 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>,
	<riyo@ti.com>, <a0393308@india.ti.com>
Subject: [PATCH v1 2/2] ASoC: tas2781: Add TAS2573 support
Date: Tue, 2 Jun 2026 11:53:22 +0800
Message-ID: <20260602035322.5029-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260602035322.5029-1-baojun.xu@ti.com>
References: <20260602035322.5029-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SN7PR10MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: e8be3b65-bcf8-49a9-cf28-08dec05a996d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xtUEZzwgFFO8RJh7/pie365/d0VOAjFDYU4qxPFa5PblAKx7AEQT7aJOf/U45Jw9H1T7vQNpEoVngK/FiGKIdSbLoYZVzCyLXZrqKRrWKx58b7OB32WJefTOklTrvIqaTZFfWrFaCL4dKGlzPuVHauwgaS32UdMn1TgFbAZ+nWSNUN1z5rqs71/x36cgSMm+nG/BYHo1kl8elu1gWm+EKsIIKqUb4OnDD+9Z1dW7He707Y4bempXehceGitsDsfQsxn/qFiujpEfsTMxUN0KpYSSai//tAFYljXU47dIHPSaz9AqE6zxNPil+PwvhxPQH1+TvM9ik5a+EaVv9phSRw+lSB6EaKsqbMoafL2/IvW6gmAQSABw17H7M7sXXvSVgpdFRCe9ABGAwboRZgQOt4ZcJBOwDpIgCf/lOnHiwdw4gfVH/fpUtS0DKCDeT5J1aJ/cnL8xfUndJUuUn//+QeKaCDEUBwqi9JX690d6nUjOeARk3MvNN4VyZ0FgDNFET+JiwQVYFzu04Am7t8nU9mjv1aE5v9III92pVg4/c2mgAmwGRqW1js/sDMejzxWUnGHXfCy84jNf5ebvOF/y8AlLDgaRnzSyDkDXLUHrMfx9Zayh+vlmPuEoHroxT3cR5d26+0O+LGoOmwx1xWOiEX+dzVjf2oAIWOvV9kJ+lv3lelWYRRuGx0VWde4FXiw7IMhVLcOVpj8CmupRY9UiU6adnUS2YvkwtY1YKp3zI/A=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ELApM7JrH+I4QR0E7TYcBUqFcFArJ4PnycDKDDUK1YebE0RhBnXTHzKmBFK221K2UJFMtYwdYqK2f//b9Am1gKz9NKcaefmauoiAlXkEdU80SrxhBCmpIUs6p8aVrX/xo0jB6MgatteH4zvwZg8DPfkQFBrwsIKxMuDTvx+NKwnetHTBvKYe04DGXL1r9uc3qX/kk1xSK/lg8qVz253ZjJwl5QqxhE4trfnmaMKOVFoHJghDTJ0t8S9SgcRMPWEjsSTdxIpvFrS3dF3Le8lTRz8S/hzHydm0AfNr5OiC9WB3v7DUTp1csoM4lXrEdeHXiNloo0Es0AtriwzbbqLmdCac6Yfn44JR9j5RIKAGFyaFx0WyDbJCSlvqGZeDodY9+xuQcLPwCyQ74ZLesigN7rZYp6vpTS77s+zyRIUghildE+wjq1/gQyiHDLkHdW06
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:54:08.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8be3b65-bcf8-49a9-cf28-08dec05a996d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6593

The TAS2573 belongs to the TAS257x device family, featuring an integrated
DSP and IV sensing capability.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2781.h        | 1 +
 sound/soc/codecs/tas2781-i2c.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 95296bb4a33a..d45f805b5d18 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -120,6 +120,7 @@ enum audio_device {
 	TAS2568,
 	TAS2570,
 	TAS2572,
+	TAS2573,
 	TAS2574,
 	TAS2781,
 	TAS5802,
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 620ed4ef577d..a400bf3e1085 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -108,6 +108,7 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{ .name = "tas2568", .driver_data = TAS2568 },
 	{ .name = "tas2570", .driver_data = TAS2570 },
 	{ .name = "tas2572", .driver_data = TAS2572 },
+	{ .name = "tas2573", .driver_data = TAS2573 },
 	{ .name = "tas2574", .driver_data = TAS2574 },
 	{ .name = "tas2781", .driver_data = TAS2781 },
 	{ .name = "tas5802", .driver_data = TAS5802 },
@@ -132,6 +133,7 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas2568", .data = &tasdevice_id[TAS2568] },
 	{ .compatible = "ti,tas2570", .data = &tasdevice_id[TAS2570] },
 	{ .compatible = "ti,tas2572", .data = &tasdevice_id[TAS2572] },
+	{ .compatible = "ti,tas2573", .data = &tasdevice_id[TAS2573] },
 	{ .compatible = "ti,tas2574", .data = &tasdevice_id[TAS2574] },
 	{ .compatible = "ti,tas2781", .data = &tasdevice_id[TAS2781] },
 	{ .compatible = "ti,tas5802", .data = &tasdevice_id[TAS5802] },
@@ -1736,6 +1738,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
 		switch (tas_priv->chip_id) {
 		case TAS2563:
+		case TAS2573:
 		case TAS2781:
 		case TAS5802:
 		case TAS5806M:
@@ -1900,6 +1903,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 	case TAS2568:
 	case TAS2570:
 	case TAS2572:
+	case TAS2573:
 	case TAS2574:
 		p = (struct snd_kcontrol_new *)tas2x20_snd_controls;
 		size = ARRAY_SIZE(tas2x20_snd_controls);
@@ -2094,6 +2098,7 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW2568", (kernel_ulong_t)&tasdevice_id[TAS2568] },
 	{ "TXNW2570", (kernel_ulong_t)&tasdevice_id[TAS2570] },
 	{ "TXNW2572", (kernel_ulong_t)&tasdevice_id[TAS2572] },
+	{ "TXNW2573", (kernel_ulong_t)&tasdevice_id[TAS2573] },
 	{ "TXNW2574", (kernel_ulong_t)&tasdevice_id[TAS2574] },
 	{ "TXNW2781", (kernel_ulong_t)&tasdevice_id[TAS2781] },
 	{ "TXNW5802", (kernel_ulong_t)&tasdevice_id[TAS5802] },
-- 
2.25.1

