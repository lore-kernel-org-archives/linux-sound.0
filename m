Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010027.outbound.protection.outlook.com [52.103.23.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC44A3EE1DC;
	Wed,  5 Aug 2026 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917445; cv=fail; b=csqQ/itdwKYmuA48IAIxn0N1ZwrqHz6UTCL7nHtfpdMBUZPgY1ROax63IzeQhPK/BTzzJ07CdJasMt/ZsAL9IIdgo19eKdqrWQKMQuCK/CgbJRlX2MO930GKecTmHE24DB90akFWNUgk93MeDXGY3jPeJRBBJtGXyA+WxZDvq0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917445; c=relaxed/simple;
	bh=i9GDcS04PNc1Bebf8eL5l17mVVVH+qsAJSyfnhhE/XU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sDPcITE1qAGoLWCRA+vu7AjSmSzxT1PB7qCKNdcqUlBeoNZevOBAXvwTTakDISY/WAapkx1nJl7kdhV2ZPPSS638s8NpaTZljudv2TN0Rdy7Av4uhKDRrNIcCPWOm3QEOjy7nW8Ler+BeXl7axDfaPLZXRMFN61s4UE6l0CU620=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=ZuFUHXCw; arc=fail smtp.client-ip=52.103.23.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="ZuFUHXCw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0CGAzTTU1LDt3AkW85j+znETZsubTWMeggj68WUmEUEWX1YLAPY/9+q46OswbKXQnS/CZKlI5jhn5+DcTzmCMaGwbCfviBnLkdFtcKPtiCW9cW+yoEpdR5hN4bBZgIFp3N2XRW7c5RNobX0XjXp/rTU4B4i8+X5lbNjDNbXHapSvZVnkucmDnkkpVqstDUQ05IayWgJMzemfRFwcLOYssV4v7gCJdK6bTbcpOLirSLql8iCFXHJsm35mmkH1F/ZHgGbRPEHp1/i9+8SU7c/uDj947TBi2FTmrUvf02i0vXjypIl2/cY+M+N58i74QyOOctSSqtFkUl4kWtPrexvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8g3AbkNyDPg1CjG7p9DKxeGlNXrRZkHp66rT/A/pZk4=;
 b=CbWO/nyqX3AhJ6czgIj3UqjbL0xpRQ8BgpUJgHHLehFnywPKUlTMHwSLp9zce6rUIDS+EDW5Jx2LE4W7ZjbEI3YG2G1kEiNW/VaFFXweQIPzYJOyK8j95T2VDhbRFFDiwmjDfQLzyZ6sL8vcFeiNlwVnn8tTXx8SKUYE0N0dY2JmrDOtE9Gm/pZZr9Kvxu2iICimJLGUV0aA0MFe1WyJ/tWrbZU3IiNigvHfLUdSHhzF9+sc2RiCvS3xKo4oj+IKPY1TDlgxZsdEINf6Cmyr8Yi8MryXlcpoHX3G6HKYd1hhG67VNas084TY92efkNWyD85sIFJ4PdOztJUyRCCIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8g3AbkNyDPg1CjG7p9DKxeGlNXrRZkHp66rT/A/pZk4=;
 b=ZuFUHXCwLkwib2EdzEc4qvDZ8oYjm2533q+CCS9FipZ+1smeiN1WhsUMGi0t2KEUkADqzhBDCPn0wqSaOt43rNOC5Uu58nEJUeaPNUu/hJINMtcuDIIeqqSpOK8lGV/FLnkAFphfZoapLTMdIVfWJ9MB78P6Bl+lBB79OoWrbmI81AU0eljcnZtPz/HWefYrLe4zHWdA72wx0DWXqZuurHLb6XKRUTtO4MlzCE5nXNc9SQjGTV7VRNbtfYkTr/t4hmLcVcqnf7Z1pVJnS1Tz2Lh29a/NlaFE1wMgv9nWLsfViBpVTKGWPTMwQ1r66YCnY7ZOVDIkaKKxBpFVzWQAmA==
Received: from DS7PR19MB7724.namprd19.prod.outlook.com (2603:10b6:8:d9::20) by
 PH8PR19MB7760.namprd19.prod.outlook.com (2603:10b6:510:25c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.17; Wed, 5 Aug 2026 08:10:29 +0000
Received: from DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86]) by DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86%5]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 08:10:28 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P  ADR10H
Date: Wed,  5 Aug 2026 10:10:17 +0200
Message-ID:
 <DS7PR19MB7724EE8DED946545C55717C1FCD32@DS7PR19MB7724.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::17) To DS7PR19MB7724.namprd19.prod.outlook.com
 (2603:10b6:8:d9::20)
X-Microsoft-Original-Message-ID:
 <20260805081017.23199-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB7724:EE_|PH8PR19MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: c50335d9-f523-44b5-5393-08def2c902e4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|51005399006|8060799015|19110799012|5072599009|24021099003|15080799012|55001999006|23021999003|25010399006|40105399003|2607281247196008|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9jwGmF3xnjWIS0TKyw1gJ+5Wh0BhoXqx6HgcbbSr1aPzf2YenFvn4K7ouSv?=
 =?us-ascii?Q?OkexeiDQGyUCCPC0x5mTpIMen8Rv1hcdOiDA6Cio1Ecw10BQ1MWi0MvU+tf9?=
 =?us-ascii?Q?SX/XmdQKMk5Ga8d/KfymTltbB8e2HQ9CVWnpesEzCsQHnDpnAo4PmMcHTMBN?=
 =?us-ascii?Q?yCcsjmSpx3Y7canKEoXJmwY1eu72/kMjw8LCz63U1ctErszTTaUDBX0YfCvG?=
 =?us-ascii?Q?vMggqiph8DoNDoO0cZ4WGQVWv2evgvtmTgPUFCDISmOZvKgqWI9p0JC3cHb9?=
 =?us-ascii?Q?dlPuM0+QC53WC9GNJiezDudbR5bz9983mIXEfBoiKPi4c6jioUhKB93yGLKA?=
 =?us-ascii?Q?fjzET7h51jij7g/dWT1MQhmhAyFWqAZIC+fVbFikp8ptJfgqqafaz6piIcl1?=
 =?us-ascii?Q?hdB71km5VizXgHvgXn3z9TzdjjrD6DRaHD8rjPbz+q2Fmk5X14vT3zHwqBgl?=
 =?us-ascii?Q?w84q3k/Z5Veny9IgTsC/nyivdLO9RzQeraTelrMuxL/0J/UM3/VCGgviJk4d?=
 =?us-ascii?Q?/n3qGPfs+QyKcjbcnId57iKDGeebsA0w4hVdyHQVM/ORFL0/mXwS5YtatqWN?=
 =?us-ascii?Q?Y6gLcJ/SvGE/eCYriZq2pjZ4dQ/FFFWOiLH2cSsED5iGzzI/h9Gxgu2XIveD?=
 =?us-ascii?Q?d2XMUtn9R4O4Wki90vaGxwXjT5gDHarZCPxVfzUsYhhCybTD8GSxh0WNBMYx?=
 =?us-ascii?Q?f1oTw4uI4kB+4483C7q9xtEGbWpvvp6HNKM8Amu6m+ZrTi2AmTJv66rI7eVq?=
 =?us-ascii?Q?vZGqzZwO7A29fauG2gMHHtQhjIVVwuGV/bDhc+r7gUt9bqOSGaEpTTTQEqCq?=
 =?us-ascii?Q?VanaAPqKCgi/YYsCrGR+QzrbUTPDzWPsZGitv821DSXEDj39c8FYPvQShIr2?=
 =?us-ascii?Q?vlCCWOOe2aNuYnfpayCS9sibL/tvDGD92kKp7Q8bQok4e/UPP+tLy3rz4UCd?=
 =?us-ascii?Q?EEFW0luMtDmZ7EmrbdKX3zoe3zlwl3mo0Ohfj6hQe+yQuS389VyqBzDRZTpD?=
 =?us-ascii?Q?tIpD8K0g4zHRsThy7tDY+0wHrw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3mywGu59s/+J7TGKTgYb/iGdOM1iue342ArHKi+RBaDzsAr86mjt+tyhmjYf?=
 =?us-ascii?Q?rLL/gcvhZN87acEUqPd5Ut/8QEidzfpfhDK03jui6AoyGYb3nxPYJPHjTSHS?=
 =?us-ascii?Q?F0juDyU4rzVqeEWdjS5XX9mVUBG3pMMXYVpEsSbcQP6HilqbrKNKBPY5Eg/W?=
 =?us-ascii?Q?GduoohooFF7+rNN0TRjQBz/EgCCWkwv1Tb8vBfX7r6iBXz5fTtroQBYDbU9A?=
 =?us-ascii?Q?Dm4WAzMhhPadbHm32YBfk0c10Ex3tPZpOf0CzSe/1v6rCiKPaVOicRxVR1VC?=
 =?us-ascii?Q?G5dOpmriHDYeJmKUf+cAgGpBfSPDRkF3cyIZ8FNtDrBynTXCfzD+wuiMmhEm?=
 =?us-ascii?Q?pNMFN3WyMxBnTlZVNdGW6riY0dFM91ErHFBJbdTfvomX0W0qN8zGml5pym17?=
 =?us-ascii?Q?9Lm1pOY1nLkdXkWnzH0go7EN0PRcLZPD8sSObPFdAl82wrCdBiVHa0FXC+3F?=
 =?us-ascii?Q?Io9HFBhFFJfxnuxNkE181AhLXHZJzcTbhoBVKymkPVY7gHZiNswAN1R6z1z+?=
 =?us-ascii?Q?ROeLIBgp92cVQry2azIE58y+TTV5Xrakuj5H43V4kbS1rk5eV58QNZAXx8/H?=
 =?us-ascii?Q?pnuzpbC0D2wj7Q7HvS/GN2Y5UzPqsALEpzJfoqoHngvOty9TFM3H0gjYJqgK?=
 =?us-ascii?Q?ksoQ4wjKRwj+DHa+KfhmCmpaLlCsqS7n6xUuRQzarIcN10qONJAu8Gv/1jhi?=
 =?us-ascii?Q?KQVu+TwaPQFinLDX2+Md9IgzBhiePg7Jb4Mag5naw/I3itAbcJFwyKWn7UsI?=
 =?us-ascii?Q?LclLYYPWJog9g2VmXDoNgNKnBH3lvGcw1RGPFbp1BhnFt2VK8ihrXpqAeA4v?=
 =?us-ascii?Q?TPhPxJXLDCaG7QWDEgCC1Vb6T6lEQGiHhB5rq4M7tpnLfZrZIH/5w/rYuJw3?=
 =?us-ascii?Q?9/zCmV0Tgkh4HYrya+7rtkZwfrrRqdqMLKmmoFMLZLR1l+PJrbm2ZKWf2sxR?=
 =?us-ascii?Q?CIoOm9GkOxpWjXDPNF9KU8mDtW+QoOyhbBLXlGwUJ0nRDCxju85ZpE/x2xJE?=
 =?us-ascii?Q?eqcEAYsMkZ+83DyvFcCR7a7bWeapttaVZwoNQMPxESrKjVUpKVcKSI+NfqUD?=
 =?us-ascii?Q?mX2Rda7l9sb92vvFCz8NE9sub9wdnW7pVup1AFIWXqC+dBVVbQH9kQ9229Hp?=
 =?us-ascii?Q?xhpdvWGBMCkCv1QekxkUBXLqb70GnVjiMVkfs92kPDZWGBwUK4LGsZIiWgFo?=
 =?us-ascii?Q?GIc/r5Jul1EE0tFOnAeYEkU3SDpFg1owBtWUNEPtUvcHEtuTWgzalqWUGmZf?=
 =?us-ascii?Q?V04WuBwIfVXS5WioMBkKODmmfXAP6YNAFt3b280iYk1IEAp7F0J9HPrzC3op?=
 =?us-ascii?Q?D92r2QBocPmTJgLjTY54bs5TXOVG4d2KqcLdOx//3SjC004TEl0QPIX+iDNi?=
 =?us-ascii?Q?1sfJXj+xNTZJfuIWPmYY7INXlKMOvrlW7JevFNkaJOz9bPUDP7kZotcDQSu+?=
 =?us-ascii?Q?yxGSZhizw/0=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c50335d9-f523-44b5-5393-08def2c902e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB7724.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 08:10:28.7665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7760

Add codec SSID entries for the Lenovo Legion R9000P ADR10H (83RV),
which uses the same ALC287 + AW88399 smart amplifier configuration
as the existing supported Legion models.

DSDT inspection confirms identical AWDZ8399 ACPI device layout with
reversed I2C addresses (0x35 before 0x34). Register dumps show the
same BSTS behavior as the other Legions. Both the channel swap and
BSTS bypass quirks apply.

Codec SSIDs (Lenovo vendor ID 0x17aa):

* 0x3936: Legion R9000P ADR10H (AMD)
* 0x3937: Legion R9000P ADR10H (AMD)

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/hda/codecs/realtek/alc269.c          | 2 ++
 sound/hda/codecs/side-codecs/aw88399_hda.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index bd1958bcf698..c6c72aa7af45 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8094,6 +8094,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x392b, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	HDA_CODEC_QUIRK(0x17aa, 0x3936, "Legion R9000P ADR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
+	HDA_CODEC_QUIRK(0x17aa, 0x3937, "Legion R9000P ADR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3938, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3939, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	SND_PCI_QUIRK(0x17aa, 0x393e, "Lenovo ThinkBook 14 G8+ IPH", ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK),
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 5175d341ecbe..11cef4923024 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -186,6 +186,8 @@ static const struct aw88399_prop_model aw88399_prop_model_table[] = {
 	{ "17AA3907", aw88399_apply_legion_quirks },
 	{ "17AA3927", aw88399_apply_legion_quirks },
 	{ "17AA3928", aw88399_apply_legion_quirks },
+	{ "17AA3936", aw88399_apply_legion_quirks },
+	{ "17AA3937", aw88399_apply_legion_quirks },
 	{ "17AA3938", aw88399_apply_legion_quirks },
 	{ "17AA3939", aw88399_apply_legion_quirks },
 	{ }

base-commit: a65204f76e8d30676c4199bfc6638ae1d217196f
-- 
2.55.0

