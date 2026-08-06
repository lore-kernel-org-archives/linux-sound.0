Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011060.outbound.protection.outlook.com [52.103.14.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821992E06EF;
	Thu,  6 Aug 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039452; cv=fail; b=jfU5B/yuzbM/UL2x9wR5rvLm1MajqhSE7VjxK2qH4C+UVXZ/9YDmY1RF+GccFsNIWVHJmAkgABhvnzX97Y8fwXO79WGHoVqR7Jqivgg1aUIxayegh7f9Jdma8WxZe3RnuByTEWAlcN6jGbaLE1PIR2plhUlRKvoNhR5jbU6fSss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039452; c=relaxed/simple;
	bh=u8d6tEj4aTWi+ZVFVFJKUd214YtITqpmGHl86aRHWjE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N5VStAxHsONCc2jNAVbGJaIeocSeou4e69lTatZWrYW7bZcko75whxs/LpUWXG3GEPd4TBxfdGyIsvdMFi088ulTu8Wy5e+0i3CGL+G4A9dk9pQHHc7NBVnHjvU9KXHn0rVEK8x73qHUp6c0dtkuojujxV/etZ6guiKEdWCinJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=oy50HHBz; arc=fail smtp.client-ip=52.103.14.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="oy50HHBz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB3Ytbwlon1cImfiELEkVp8k74PWyCcWx6WdqwgyURZ+mxjwOwC3U7mku/NjFNDD9UXmZcRCyzxoHFbs0IYb0L0Du0ILsKPuqD+aI9zE9rZ9s5nAv7DXHGP7y8FNcOGvCjVqlH8HB2AFbM9OpvBQ8KM6Z7di5j5NkNrf956eAGTLhLJyj75V7sk0+5UVA13H8WKc5g7pWZ8czyDmibZDSTGGHZ7D5BKGM+uVDa+eAut6w8ez3IJ5j1Txx5E8mK6PVV2WagJhsW1xRHgr0/D2GiSgvCuma4HMrweXhTeGybReJVssrXxNs37k1wM6LG+4ex2csHxE5me0ZjdcNcnnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsRvXHjXtDh46wKg5+kuFzJRdgp2ecY1cgNwrSsQ3+4=;
 b=yXqs2W1eggt2PSkJy9oSyFwLlHc59LKPgjqGtmOCPGvnOwYPY0EZa9dJtnpDEbGOYokBdJTmUnzvD/a6KFgcStlfIMoKpBmKdVWbw6AX+DbRzRqONd9OJ4yFKWgkCdgs6SJH8GsN6PT5AgpJM6+ivyUw3tn/tzHalh7IprSdF8jmEfm3iHAHnTN5FoHohwcjAcOhZOGq+LhzQA1W7qOxmgU8YfvpDVCPTEW9mA6u/jg2mzOiLSXFO17AS+zaCgAY3qBZ+9SkLXIoSs5tGi3Iu0ta0BTDNSgcESyb7tP9yRMIDTj+b9cgbOV4AAwaTBkYUrcXL0bRUQGkrg1L3FdWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsRvXHjXtDh46wKg5+kuFzJRdgp2ecY1cgNwrSsQ3+4=;
 b=oy50HHBzBFrh/qfWpPNr8yyyfe5ghmxpbMfDXkYiqltLVRluVzkkbv4CS6Bp10ByWrogY3oWJ0kBfIbApp6o3Lr4MO9shDMXHMAAXDrElSN8HTESjnLB7R4MW66occpWLJoIK3pP9K97qAb6e8bSc2Z23+vTFXJFZkoAD/Y8/xRPG7Rsjv9PAoVDEz3W8+SuY4UnnI71WWwL8xdvbPndYo9SKXIK59vyWZ5BBh85T9u7vRK1/MCAVOnPt0wUqWRJODdjyF36+hVAX0iX+qkSxfaJka0PlhWHQOBgRPgb9iQtwUKPoszdiEwjGmQ0XzlwJu9L0zhask0ViIcV4gHKxg==
Received: from IA1PR19MB7712.namprd19.prod.outlook.com (2603:10b6:208:3db::7)
 by SA1PR19MB7110.namprd19.prod.outlook.com (2603:10b6:806:2b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 18:04:05 +0000
Received: from IA1PR19MB7712.namprd19.prod.outlook.com
 ([fe80::3e3c:51e1:5e00:be4b]) by IA1PR19MB7712.namprd19.prod.outlook.com
 ([fe80::3e3c:51e1:5e00:be4b%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 18:04:05 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] ALSA: hda/realtek: enable headset buttons on Lenovo Yoga Pro 7 14ASP10
Date: Thu,  6 Aug 2026 20:03:52 +0200
Message-ID:
 <IA1PR19MB77127DE4BC25300BAD284E30FCD22@IA1PR19MB7712.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To IA1PR19MB7712.namprd19.prod.outlook.com
 (2603:10b6:208:3db::7)
X-Microsoft-Original-Message-ID:
 <20260806180352.6013-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR19MB7712:EE_|SA1PR19MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: f46711a7-c3e3-408f-85f1-08def3e51a06
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|25010399006|5072599009|51005399006|24021099003|55001999006|8060799015|5062599005|19110799012|440099028|3412199025|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iPRJ4rw46BNR6vQE/rlY7KjXN6WXoHDRZHXDv2LDYaabFbZESS8DeRi1S3FF?=
 =?us-ascii?Q?T9e4SQHcd6glblypzRbWuN0ifCAhLCySi0GM50Ru2BCDI8Btq6/5Vj6x4oVR?=
 =?us-ascii?Q?IKWZWEhXf/pEByGUB7qVTV9PxIoPbbcp12e3GEDt2RDyTGCdIke+Iimhx8OU?=
 =?us-ascii?Q?6tcl78l3S/qTfSIIiGplt0xppLBGWP9J+uuG2W5JLCXj7HDX6eoOM2WHhjsU?=
 =?us-ascii?Q?SNDTTsImfpFhuer0XPkHoIlksdPQJrhEhzLpteiQoBcr2jquLiJzSTng+VyY?=
 =?us-ascii?Q?voaCkq+Ae55swfAmFvtf/t/gJrC8jpmq1u4ROuV5x7IYrnuRu+gaEOjmMdRg?=
 =?us-ascii?Q?NmNSSk9JOBBjiBYhn+fKjHgIxGzknsVU2+iEq8bgGke7UcqHWKa/53uP+8jz?=
 =?us-ascii?Q?VmoHjV42KLowCNLbW2AUgSveE+vRW19Ce+S5ZEZloAZ843NuRK3J82PbYLxo?=
 =?us-ascii?Q?3ycRh+RgnRwYj+5jjhhzQiTD1Okkn6MGPPafeIz2yTU1S+9oJg2f9DEUVW/A?=
 =?us-ascii?Q?niV2u6N85iGxMORhF8o1rxODh6rZi8S8t6/FGaQPBkI/RQ12jQPqpcslwnRk?=
 =?us-ascii?Q?IDDJa8cyeTu5SohoHRwApIol0fpOgUusaf3j9hrc7WjckpnybDL3FfZlFtrN?=
 =?us-ascii?Q?5bjRan4A+eS9VeqPiUR6tZi97uiNkRR9ASGfEK8UXEnIE6bqlu6aNEPHUNH+?=
 =?us-ascii?Q?QWssEDrqHf1J4KHQY1ryxQ0emp/KRygEilz6J5iF/j4udyhkdmJfKBaBY3a0?=
 =?us-ascii?Q?bVRgebuKBRRSwHl1LsgWWEJmH2Fp0caLpZkXYGgKGqpl58ziu9y+hRlSYerx?=
 =?us-ascii?Q?Cvd4eBSzlwvxNCv/9/2Xfo4miTN3ZcYw/lsgJ0+pVIDWOPLBO7M29RY/7bSI?=
 =?us-ascii?Q?4ju3soWMFQx2daZEABiIqtEKmsMwQDPxMByrMvQwZeq9bgOA+HHHb41cv+c5?=
 =?us-ascii?Q?sBqUoEcUHt67F200e+kSoFoNYltRd+eidtYPaOhTO/Mcdwq0bkC13NRupKQt?=
 =?us-ascii?Q?ImVeTgUvt9iDZvM0uDDFV1hEHA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a8l7e1ElnmTN42CtRd3QmQsdLESrNlhc1slB1za7ZmnjBj0OS+5+8wwU8yG7?=
 =?us-ascii?Q?j4QyGPejMrw26OcAiKN5DPQs5l50DP8YOY88JuhD3xKx9f4wU8uRJNpfxFXk?=
 =?us-ascii?Q?N5zMDIskYYooOKCNNODJe8RT0E3y/1Cy2lKgmv4gREzGse3ezowXd0+UtVPS?=
 =?us-ascii?Q?MQl95U7E3x2rWo4cHmRWLMpdbSqKniB8w/NTUG4InGu8I1kPKt3dfgFtdWVS?=
 =?us-ascii?Q?ycmm+VRheSKjdTb6fUF7L6OGDbEb/iikdXgKe1Hn+rTQPDQtpXIyUTxkaOGJ?=
 =?us-ascii?Q?/1MB68Bk6c5+tnSVjIlnSX+yJHvxsMYXPyg7Djx8gnQihC+UI3WvQd+a+39Q?=
 =?us-ascii?Q?M2/tXa1qtoGTxSM/0CYtBjdagLMDxkHtRpUdYZ3OBrSQbfJgkwyRiA7BpG2m?=
 =?us-ascii?Q?TvhbVj4UionxrhAxcbFBgbMzB1q9emQS1yUn81JjmjxbETrn2U5MqZcQzmPH?=
 =?us-ascii?Q?UylSU1SXVc8IcUPGa71lvOSchJ4eellWvUlN4aH/Is3d8MHlllSwiVlLh9OR?=
 =?us-ascii?Q?xwwR026/XFfOvr0V8t72DzrwRAr2MLBMMthc5CgHyjvJ8ehZMJwSd1h41ZkP?=
 =?us-ascii?Q?gszMUskkGm3RGLlAqgI7Duz5kh4um7wyPMWxFdYaUtGRbLEYIlk9n3w416nR?=
 =?us-ascii?Q?Gio8BYrd/QB5rJ2BaxdsdlL+7uJReXOQ9a3xVmF+oFqHXtWtlFRQiRgMojDY?=
 =?us-ascii?Q?UR58nWTee3hxP6yflfPMlYutr46SeyKAIv1rErjgnk+Xnx9s/ZN+PWvTIZUw?=
 =?us-ascii?Q?workq9MqLea8GIVpIlQK0w4cq9pAWYl0MA/UQxuTaZ2GiOIScH/qgC+obctt?=
 =?us-ascii?Q?9M6GobekxUlwVFjFqxdB4PZrPZsnfFjFehXbT/W2BNEgtdZxFw0MPaNpPvtl?=
 =?us-ascii?Q?ZA3C8wWym210FoKi7v38mQhd1a7vqQ8BMw/3feB2CxnHPfQw4+tk82if/C2G?=
 =?us-ascii?Q?C3eOU0jUC2/gG3gn47p0b+DzUvPQwhhcAtZONeR6AcHp7LSTiqPcTE+pcYXY?=
 =?us-ascii?Q?7pTucnUVD2pMWqQHeK4sTXGmCjj4ccGJhjPjQhNU8BpONiBHQKqglH1LrPMh?=
 =?us-ascii?Q?psFsXKG5CYCymXDIgPerlD5w2/JH165MgRsAzmH6OrAobKsarRNMmFJLcJ8o?=
 =?us-ascii?Q?c+r/ETkVhZlAe6VK6tnrDbc6R9seYQETL0BSBJoQ/G6eTIHvOxtH4k4Q8rHJ?=
 =?us-ascii?Q?ac4akHWFYPOKRWi4OUCEK/MRjybOb097Jvt0ybVO6IoampeeWP49vxaDZfMH?=
 =?us-ascii?Q?MnR3wx5715FngKD0nzGdbOZQOnkU8DeQF4mERRjyfwZJrDfqBmOT7eJhIGzp?=
 =?us-ascii?Q?KSCZSWgBchB0friLG0bvu/md2iA3vSgbcGaoCtHlslBRTnu3mqZdBF+3SitT?=
 =?us-ascii?Q?Co2l+Qq/6ZDu2SLaNGXU1FcqL9CaUC6GgyrF9y9HHfwB5khulKhZy3ksNqZr?=
 =?us-ascii?Q?snXxgg0yS30=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f46711a7-c3e3-408f-85f1-08def3e51a06
X-MS-Exchange-CrossTenant-AuthSource: IA1PR19MB7712.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 18:04:05.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB7110

Inline headset buttons (play/pause, volume up/down) are unresponsive on
the Lenovo Yoga Pro 7 14ASP10. Enable headset jack handling by chaining
alc_fixup_headset_jack to the existing bass speaker fixup for this model.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/hda/codecs/realtek/alc269.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6cfea43d88d..c4982d5fa42b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4288,6 +4288,7 @@ enum {
 	ALC274_FIXUP_HP_VERBS,
 	ALC287_FIXUP_AW88399_I2C_2,
 	ALC287_FIXUP_LENOVO_LEGION_AW88399,
+	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6991,6 +6992,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_AW88399_I2C_2,
 	},
+	[ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_headset_jack,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -8086,7 +8093,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	HDA_CODEC_QUIRK(0x17aa, 0x3906, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3907, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
-	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET),
 	SND_PCI_QUIRK(0x17aa, 0x3911, "Lenovo Yoga Pro 7 14IAH10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),

base-commit: 872c7960832b6a620b62b9fa127635c714c7a356
-- 
2.55.0

