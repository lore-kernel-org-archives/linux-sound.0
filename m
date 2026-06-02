Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44410366060;
	Tue,  2 Jun 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394805; cv=fail; b=SR9OT9N23DXAFtMijpUoKXEUUPEaiMBGTDios+IiH5wj+qF+goIgzsI/+o27nAM0F6ZArsNjAdat6lcWyUqRl1Bruj2TZHj4lEHfGEyf9Mm3dJP0W1kKVmRDRWOWrym0qCKu4lV3sMeg3/G+kUvikAaM9w7kLZPUuOeS8+1jABQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394805; c=relaxed/simple;
	bh=J2uJPfinvxNT5FIAvuROdTv4WUrYBtflSkSfKyqejyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEg0RNgZmOVpe7xuLWTsMs173eCzfUCeTeKeX2KP/45/7GwMb8Akt2K6a9inPRxLUAJJWB0ifTjUtERo0ml3VT22YC0tXS2fWCoFjoBIGVW9et/5PCy3HBCDLkaF6ZTU7fBLX0J+l0iaaAcI8HGgvtSXASVMU8fqU2ORqu9VTFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=he2Q8x+v; arc=fail smtp.client-ip=52.101.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="he2Q8x+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPEDO1hOM8KQWATZD5IO/NH80hQ7XO4eA7FmxlVyST3x1UT+2rPYBE1m2a6VgFRjLFiBoV/xOOkVqcVUqnEHuhDnE017T2LwJ/S+yJgznS6C3+xopRfRKhK6L/1JyFRM+ms2f0iRYDwwG+KBH4VBad2I2jeCNsbXw0cRM4vBRZedXma/SqnQ6khf3soJ86bcjqrbYZhN3imZmgVfhM95oDOCpTwBeejQsO2vyEyBemMzQoY3BTVmYHH0SwwF3aVc+WXpmv88PYQIlONnq3zOVJ1gFZ1p97MlISqfZsJqXwNlsw5fZIW1XK6kaNdKW5nVegB9AxErXNJMEc2TRYrkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMXgao/GU0XsqVWeLvBmZUYH8s0Jn+kbVQxM74w+7aw=;
 b=kBPIcEfQ1xthsnQqYD31ps/7JNNtx8TCXpDkfoPGodglu/VmqmF9G8hCQjrrSCS1cfjiZYFlEdNDga+RW+Mgkr5f5mmWoD3I1VFit+Hls/+eJhqs7EmLaJ+qXQiH5xMM24HFnBPIHPikukFXiyqKuXaZ4bDFEIm8fPr25MBNVZ4Sm2oVSwIGvVvafa9xm4nOsHVdaAjwpBTGbf45byHHUyEdyREIjn79f43hM7xc1hsHksBUxxzEFgiIz8+EUOB9U3hpa0sXWZRfST44W4jDDQzTGI0f3OO3a362hvpgbwi3+aOXsDmt9KqBOf5akhNCzWK3qKToPTsmREYoK2PY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMXgao/GU0XsqVWeLvBmZUYH8s0Jn+kbVQxM74w+7aw=;
 b=he2Q8x+vWGpvNpf0B1EB9V0/9JxbEs2XKzw/Xh872FtgkBONvTxKzeXX7lCd3upzOY/Pw7qS46823s0xEs4bKA8a62vFTuKqSgJjMMn8bKars/KimxW8Tpye4ezUJ8rAMU3DGj8zY5F4+rYrVUfI0gsxQqvjKQaTt2QL3LWQEa0=
Received: from DM6PR21CA0020.namprd21.prod.outlook.com (2603:10b6:5:174::30)
 by MW5PR10MB5828.namprd10.prod.outlook.com (2603:10b6:303:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 10:06:41 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::85) by DM6PR21CA0020.outlook.office365.com
 (2603:10b6:5:174::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 10:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 10:06:38 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:06:14 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:06:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 05:06:14 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652A5uYT3539205;
	Tue, 2 Jun 2026 05:06:06 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>,
	<riyo@ti.com>, <a0393308@india.ti.com>
Subject: [PATCH v2 2/2] ASoC: tas2781: Add TAS2573 support
Date: Tue, 2 Jun 2026 18:05:32 +0800
Message-ID: <20260602100532.6463-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260602100532.6463-1-baojun.xu@ti.com>
References: <20260602100532.6463-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|MW5PR10MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fa5048-4d30-4c98-709f-08dec08ea342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5X3AyBblM89wGvIa03pbQ+xvae/aNAKMIW4zd6Hnq2/E/7HoJ0posIy0aGaw+Z4ahheDp+UZ1p7Vnmc4bLHaKLyBDYf8se9Uj4pxqJECliSHO4AImNDleXR0OctQYxph/tu6t6ZuuAGfmcVNYkwQoRfEQX2iKPbvN9KMRRUFXQeOQae4e0FEAI5v8hpmgR/MIhNshtVZDLNQE0KTmlECipk5anJ7wMB7Kqk/y3jtsd+EUzfrF1R6e6Tg4/EAmQ3JnRafA2t4+Fav7fDY8UG98NnZWhyd+UMQ6/VSWAo28VWw0x1LxoU3ygZ1PatBSxpJlBw6NqCIF4bYcHaJbBV2PB8uKYQCsRjdy9id4DfBE636RC5IrIs2dvFyKLCQuId07zv29TwmrKclbHUyjVn66FzZEnZPDEwmncbLuGgeY2pezwLgA20L2/LxAH//FjRzjwF1NYvPrcMkDyzqO9U6Qp5cEFzrXO6Fmgu+nW0L9CHI9c0Sx4oVwuDurHgNFNEyqPnP4TAgbvRvEWrDAe/Ag+v1JQZwk+spcb15rkTQrqvYQRrDKNwLEjismT2lwbrwtRTfw86+3CA8Jcgq0QefGIat6e7gj+hxcogy0lQFwSclZBJvZ9DIOg8prkIVbldqx1LxzkHV78qm6LpowBMY5jJEspTrPXgd+IvU+O3Ofbc7OQkIsNAPDfPK0oxwkLxiN88g3wJ/OpLE0olokgTUJpYF9I+bIqUxDOkY+u0YsJ8=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q/B0Sa6jhT0gJ4UXol3Z1r44oeBZiQdDux8zqH72gMji7+M1sYn8EcyF7zBvcMOHQzdGPIABHWoThTfer5AexWzIHxFFduNOHm94M0p9cFVkWu4+yhuRBS6rJhtYMEEUxx/LnlFfNvdV/2vjCrE1Be8CSv0HklyNgSkrjZ12Hl1f83UUyS5r0pHzaGD2HDhvV2k53TH9EMObfyG/abCFrFWr/Z4qJo/kK3jar+vrC4Iv50O3S5OWqZKIIRH7yma2NhHNkLt8fb+daq6+CwgPolwAcUa7dIRYYpI4krzm1vMNXE3aFxE+SQdzoZRqmeG6w6o8EICsrFyOmsf7FqD3n2rYmCOqdjCoXndplOTqmK/krDtQcdTZcbt+1xpL9VWlQbIi8QaYYD4L95HBKumR7I2JOjIcBnpXNi+0x+zFbyuZzn07IIBur+QBYlTfEGO7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:06:38.9255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fa5048-4d30-4c98-709f-08dec08ea342
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5828

The TAS2573 belongs to the TAS257x device family, featuring an integrated
DSP and IV sensing capability.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - Skip TAS2573 calibration; assign calibration kcontrol to TAS2563 and
   TAS2781
---
 include/sound/tas2781.h        | 1 +
 sound/soc/codecs/tas2781-i2c.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index 620ed4ef577d..9e6f0ad5f05d 100644
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
@@ -1683,7 +1685,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 	/* There is no calibration required for TAS58XX. */
-	if (tas_priv->chip_id < TAS5802) {
+	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2781) {
 		ret = tasdevice_create_cali_ctrls(tas_priv);
 		if (ret) {
 			dev_err(tas_priv->dev, "cali controls error\n");
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

