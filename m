Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0DB18872A;
	Tue, 14 Apr 2026 01:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776131751; cv=fail; b=ryKIaAOWFICf4CdMrrIv0+Y6qWyYzGlPv0TAOpt0PiOoyHa0NxQhgp6h6Ldu1YpBRRm5e/7LSx/tf6JJZoURdxHDJTrkJ/s2emFOK/X0FkOK3SQUuwcTDQdQIJK3bS7hwdlFf8vpEktvcLXgsoQu9IGcZl8skByAtaKoVIj1LRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776131751; c=relaxed/simple;
	bh=z2wBp1k6quW69/MhwFc9kJmmCQVNyCyDfXZF8JTBMXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfBzEWMNpdGzMP666mKGT6yIvDe5ex/3uofRrdJkl1/ZwQrklq9Te5djNrIR5L4cWhadsws6r0LJ63RN923vscVXajm+HLWAce5iqtTKBaSljDoYjzPm7y/4UJzKo+9/xHqRnM7tgdMHiFDATS1sO8XTGmcyIX55CkWJaz/mCak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=izZq5qls; arc=fail smtp.client-ip=40.107.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="izZq5qls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n88XPQ8nAUCSmbCpmfJ1ryweGh82FAr/3cCgjX30x7MK8aV03mKrre3fjqfFTEWjj8aRcWmxCyF9f1UrF88obFMvz/3Ph5lfuTlbCJUo0MAXIgJNj+2hgYxMF6Jr/vif1k+qoF0IOA6dHMLIOoZLpxOesDE/iVOMeK/x37XW+g6etxWF+Ht4KbYTDIb1Zbj9+TlLGzZbzS/0ea4zL0PaNHITR0AcMuoTmMOv/n/bsLcggHGQKQdGfA1vR1HCkkW2L9E4EkfGEe8hc+7+48CB4vQSWMWGqy/POXLilHNQEw0gAOFPnt365fyWpkiIH0FMA42KA8VdqeZPbAlaRDdPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUEwaUvBhhYuecKRtQ9a5lsZO8kvrpX3x8UUD5KwrWw=;
 b=c7hBoblOqTjudqqhDGoS7ducMPn/tkBNh8K9rSKCXisYI6G/w8rprX8uk1RNeUqDbeuE8zbKmejDMcxP+bpQ2Ksmmstn5KvfV9cTZhgl7Jgd5VNeBzdFXyxvhJ9JzbFe8ojqP6jXmDBuGKs43Er+tDmARFPUHEqfLF7kBUUGawwS56qhrcNB1nrCwrY+n6JgzYuc7NkRQFa+7uQTn7zcVUwHoOo/v5I4XIRtePdkrDxich7B93eL3xAE6hV5sQBqukNDKAOTRGPt3PC820NPJmu2Sb/+AqJlWzVC8iSPRYCFEEIXwoEWFgqh2XyF5FWs4KQzP8OfbSDnYLXKqn6kUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUEwaUvBhhYuecKRtQ9a5lsZO8kvrpX3x8UUD5KwrWw=;
 b=izZq5qlsZzWjonpsc8cSnqa3J/D4/RgcziOfmfGHRccH7d5MUTS7arwd4vlkjVjRXEKPiWCFlPoFDRguVttad0iQXBIQCTbnwu3uLA0Rfvxg7CuqpNsz+j0Cz24ovSUicjVzsO2Uow+rXBGtsM6DzG+ZylPUxRRiMom9EYBSyPE=
Received: from BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43)
 by CH3PR10MB7459.namprd10.prod.outlook.com (2603:10b6:610:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 01:55:47 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::a8) by BYAPR02CA0030.outlook.office365.com
 (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 01:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 01:55:44 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 20:55:17 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 20:55:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Apr 2026 20:55:17 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63E1t2hd1944973;
	Mon, 13 Apr 2026 20:55:10 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v2 2/2] ASoC: tas2781: Add tas5832 support
Date: Tue, 14 Apr 2026 09:54:41 +0800
Message-ID: <20260414015441.2439-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260414015441.2439-1-baojun.xu@ti.com>
References: <20260414015441.2439-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CH3PR10MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ca5e9d-902c-4b94-b112-08de99c8f0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ECbSkqflR4mKU4IBoxzJyHkYdlY77mXag3PGoYB3mp6r0urKtpnS1EKl1aXq5QLQoO0uPO1cE45CWEBKRBBHEvXoo+Z0EhTxock8YoU2v03DovQjsrMZ2FlfXGngOOBFnYQmvFnNNiXvkdbtyRCGZO/UjzoStnwseFvKMqZoCT8D2LKDv53L5RGjCDshWyibG72vrAhkkipFZx2o7PvH+nSPM7cT2VYQwxX/xcHUyyFNJb5FgpkfZVJVEurkBvwNrJSuV4he9VlSNELRVioDc5isLgksEu2NC/vo4xQg8UnFaZ1JysQRvS065b89bs6WHwkONKP714uwAgX5W/FoaqHLhnEpLSGuzVYtr/iB/VCi4sBRMyRZEIejoFtKIVcMYTlcHx0lBK5cv5+oXFAUQJ+Lxms/Hsv57HRPmfvxdSFOmA51fzmqTHCuzW3IOkSAG3o9EE+b+kGRgmQyijGkPz5N0ACSNwWIdOjRcSliSue9bUvtu5fiuj4Kas/RgHMDTL+nkxzukviTl3kiNQkjiitvPtbZ2x7Dk6wD2pBejwKYe5LlF+Q+wfyBYthtxhPq8Z90mVh0EILj5e3Z+N2jdM6rG1QGKX4/GAysw+LZP3SGjqQFJsV0zOj803uiZ7Jn3IqW5qrAcSBE1/iytWoc3xJX5bJWwTzVOy2NkWKhHirsmdV9JqnKc9PvZBnEZU+GUAmc3WunHStnKiObMhqmeiSQB2t/CizwimSfl+gJcc55VfjVaxTYnsjDsjxfkPyKqbDBbH/5iqAK8LdRTqN2iQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gQyVIqbjicyO9qjPadAtDKFIw2YzYWOPhEJjMfRRraGU4vEbhfd6My7oun4HWG4TX2NnLO9V7dBarfXAbEgGmqNkL95T2p/HB9sAuSvsWa2F5+NNn+YFqFsiy7DBFe7bM0x4BCtF4WZ6aXGM6AlaeZPMq2rL+dpIFqE6ska1t0l+7QM2HuZVQOW62lSYw6jFh6sEOrNIEMSCxYylaH0keyRC+xO6voSgYW+HGmjW+bh8VZ2gYkH6HZvUV4j/sTw+r1shM62MKj3VdDgjKHEkVhaL1Kfox3uevHLNIcf+XGpBZIAcK3frUOTqtwCTHR7vphNPzSXR3srsyYpfatbccKZNH3IiyZlUxQWh21+3/qGqpPE57HwfJiELTt5OQICCdvPCzD82r22WXSbY9dH2Efzddcc6nGax+7G6Oz7iByK1AzXyuNsKwTVBspQPHRoS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 01:55:44.6444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ca5e9d-902c-4b94-b112-08de99c8f0ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7459

TAS5832 is in same family with TAS5827/28/30.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - Follow the updated association protocol based on device name and id.
---
 include/sound/tas2781.h        | 1 +
 sound/soc/codecs/tas2781-i2c.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index e847cf51878c..95296bb4a33a 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -131,6 +131,7 @@ enum audio_device {
 	TAS5827,
 	TAS5828,
 	TAS5830,
+	TAS5832,
 	TAS_OTHERS,
 };
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index c593f9da0c5b..86b591c489c2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -119,6 +119,7 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas5827", TAS5827 },
 	{ "tas5828", TAS5828 },
 	{ "tas5830", TAS5830 },
+	{ "tas5832", TAS5832 },
 	{}
 };
 
@@ -143,6 +144,7 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas5827", .data = &tasdevice_id[TAS5827] },
 	{ .compatible = "ti,tas5828", .data = &tasdevice_id[TAS5828] },
 	{ .compatible = "ti,tas5830", .data = &tasdevice_id[TAS5830] },
+	{ .compatible = "ti,tas5832", .data = &tasdevice_id[TAS5832] },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
@@ -1746,6 +1748,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		case TAS5827:
 		case TAS5828:
 		case TAS5830:
+		case TAS5832:
 			/* If DSP FW fail, DSP kcontrol won't be created. */
 			tasdevice_dsp_remove(tas_priv);
 		}
@@ -1917,6 +1920,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 	case TAS5827:
 	case TAS5828:
 	case TAS5830:
+	case TAS5832:
 		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
 		size = ARRAY_SIZE(tas5825_snd_controls);
 		break;
@@ -2104,6 +2108,7 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW5827", (kernel_ulong_t)&tasdevice_id[TAS5827] },
 	{ "TXNW5828", (kernel_ulong_t)&tasdevice_id[TAS5828] },
 	{ "TXNW5830", (kernel_ulong_t)&tasdevice_id[TAS5830] },
+	{ "TXNW5832", (kernel_ulong_t)&tasdevice_id[TAS5832] },
 	{},
 };
 
-- 
2.25.1

