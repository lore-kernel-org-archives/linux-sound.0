Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010005.outbound.protection.outlook.com [52.103.33.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE41A30EF92;
	Sat,  7 Mar 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772854179; cv=fail; b=DwiLRY+i+qE+aenRtdm3PyuVvKw6Cnau3J1M8ugmf1Zf0k5MDjtSSED9WTM/ZJc2CgsZkotDkGx9fswFUJS8lZQW8yDwMRkk5ABCNfjeqpd6a0UOd3lxy2YlAZAJT00XG1GzS5hroRqSVWPGe0/pf3PH4S9KPSfufmndNBHe3PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772854179; c=relaxed/simple;
	bh=LPsdSiup9gJ+vEMUU0CkJwfR1m84+zJqlmXbGIIrb1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hZuHaXwEpur8BV+k0baCFuQ6yylznArwkvngog4RuNbcSImm7Sr0Lm0tsEcYQ4UHU2YDbIr/VkWPx1cHf4ZK8DDG2315bIiFr9a3q9YEJee57LmZCh2iATU80N0bsuuwrYBsorUQEesRGJWpQDu4MBOJjsHAqlk0OmswCQBgTt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dSJFWbOW; arc=fail smtp.client-ip=52.103.33.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dSJFWbOW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNA0wGe9y4MBV8gR+4MgfPP+Q6lUmvEeCOUL/VrnZQKM68HZGxl9oYpO8C1LAOlpaWfUINUrKXXvma9ewV8FpB7oyp+sWkKinmgB99bBnoHq0i+Ga5TsKl08ysi/nk/zA5lQQerNvs6cejyEXYnKAjzQOnhP637ZkmyckIne1ptBm6MKrd+Wo16I7b+9FdQLxknW7mzsysdB5iVq5oM2Jx3/OLbg/D8aBDTP7KGXZNwXEf2n3h5SiUTLVjBQ9Gi2K/+sxjgjzizopYajTwW9FOdZOwIv3Q5jvepWGSTu0UAe8OXPHllGPm6P30acoVZrGFctFVeYTeqn7xeqR5CRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaihyC+GPhhbfZG5TvoPlMT31VB1OGatcBSLM3POZiI=;
 b=Doz3cMn3OVU59UzEoz9dTpQSev6EPfFldqzUNoE2r3hHa9JU4TnpMoAUS3Gf+mr4sFuNY3GUU91A0jrmuGuVaf9R8isaWDI8fkRXq9DoWG+1Hk0Rsv3YvJ1j5LIuqjjXFByea7GfumOsFoFchCe6bwWiBuB/eZi+fCLq1RPpWFNmyalBxxgXUyE7bhrD49ylDBGBB2PTUim0ELCY8dAyoi04WnBLVSSMkSrz+vsDy+b1VbunG5X/PerVqHWe2j5ljFx3rvdjY3E8NBrmNlWmFWZ+trpNCoZ65cmpi6oxl7ABHF66kRn9BlTZK28hbfoqwhcxUVvEQhDQ1cm1GxpbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaihyC+GPhhbfZG5TvoPlMT31VB1OGatcBSLM3POZiI=;
 b=dSJFWbOW4v/HycZkzoGvKannXM0MjcNTNWMUbZKDxRizWDhInKTBMc7IppouYO5iKf3H+bLsnn3tPgZ9/Ls4RVTbP+DzSSu68xvkq9YA9MqGm1TG8A1fLPpuxRwZlC7KfjX5NTDPIUXmES++2QG6Hi8YQ3pN2tw9kbsQ4pguFkpLzb2cOPSMXhwcKeAl7S7sW1tMRmhOQTI1mI8C2c1Ps0n1CkGMu87sUDZrY7bOk9stevcszkIA+5UPOKF27NUyig4buG6J4Je0JUrykwJQ9QRGoYVGKR9r50J3pZS3C1x5Iv+F8flA7MQQsm5Z79PPJx2M3NswQdiJSS0Z1K0ssQ==
Received: from PAVPR03MB9774.eurprd03.prod.outlook.com (2603:10a6:102:313::20)
 by AS8PR03MB7238.eurprd03.prod.outlook.com (2603:10a6:20b:2e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Sat, 7 Mar
 2026 03:29:35 +0000
Received: from PAVPR03MB9774.eurprd03.prod.outlook.com
 ([fe80::a0b5:51bf:1aa0:eae6]) by PAVPR03MB9774.eurprd03.prod.outlook.com
 ([fe80::a0b5:51bf:1aa0:eae6%5]) with mapi id 15.20.9654.022; Sat, 7 Mar 2026
 03:29:35 +0000
From: Liucheng Lu <luliucheng100@outlook.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liucheng Lu <luliucheng100@outlook.com>
Subject: [PATCH] ALSA: hda/realtek: add HP Laptop 14s-dr5xxx mute LED quirk
Date: Sat,  7 Mar 2026 11:27:27 +0800
Message-ID:
 <PAVPR03MB9774F3FCE9CCD181C585281AE37BA@PAVPR03MB9774.eurprd03.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAVPR03MB9774.eurprd03.prod.outlook.com
 (2603:10a6:102:313::20)
X-Microsoft-Original-Message-ID:
 <20260307032838.26201-1-luliucheng100@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB9774:EE_|AS8PR03MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4016bd-a487-4c1d-20a2-08de7bf9c03e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|39105399006|25031999004|461199028|5062599005|5072599009|23021999003|19110799012|15080799012|8060799015|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TIr/8zK0WSW/onjcckbgwZz1yrtTha3jvzkqlvUpQkcbQgdJC2x1sgLgNBaP?=
 =?us-ascii?Q?BMC+5MVCN4Mr6z+KHx03GmCENZSVvNkOW/WSVj2eUznfLgJ3SJfBU9U19WBg?=
 =?us-ascii?Q?pL2cL6qeK74dWaOzAybDCd2igsO+L2gziCOq3e1rsg2ZKZNbTKfpdzd79tPg?=
 =?us-ascii?Q?cIqhIeoZbMEqOI6fn13KLJ/TBc+RYn/WJVIZSOCTcEdWzDfvVEGZoMRgTKts?=
 =?us-ascii?Q?AuNhICUhxdmxYfEW+rmYoeoSrQz4Jzc9RfIm+qTtc9tZky4M0tRb4jLa9dMK?=
 =?us-ascii?Q?Zw3xEZmZJgloX0EQIZikoUKABKPjxHo1zaOpwdMAFKfrLxzkILLQV/d6Weta?=
 =?us-ascii?Q?SU2ka9CDI20AiV4l/pV3nLiKNCNwrGSLbee/YzDODoUMc4x0ZPxt2IFtrytY?=
 =?us-ascii?Q?SMXfZSk0Q+8ghFJ2/jiE7nXZcJhw63+f3DZE+S6CQ9oen+FWWotKJrIvFxJm?=
 =?us-ascii?Q?NnwjoSof9IdI8Og5ETyp5A2rzmv28R54p3ulwFvDCVzfNU0FtdPU8aY0XkPT?=
 =?us-ascii?Q?VYOMtvwj4o4Bm4yBWgqJfHmpxRIJb7ocNdmz6RvTiQ/h47b9j1G2u5juHg5U?=
 =?us-ascii?Q?9/9VnRKhwAMxuB1i+Z5lnoY+fJpxu/EhGz+k1Af+Q3Ihm/dGTFndPnWI5i0N?=
 =?us-ascii?Q?G98KkxBJfmz3Td4i4qAYaY9wZKCgIVEvtd0cRcQtHqiRT5dAq3JEMaiAf/YG?=
 =?us-ascii?Q?I2kZCPtl0OYo0C+39AVKqJ4DheAIBo0btqRvAtuI608QKJbKgavOM4DywxzP?=
 =?us-ascii?Q?oyAq/ILUrQYqZU8bvGvxXeG8ePvHItf9Lrt3m0cf8IXwKU4+Or8KPUbCUDNr?=
 =?us-ascii?Q?DjfLJ6+SQR/4nlHje8tMetvRA2c9u5SWl3plU+Ybe1dwC+xTGzSQusDcZ1ix?=
 =?us-ascii?Q?QtboWm3GzFA/z1dZcKB+vieIIn60hKRmyUXD0mSrbJG0kOc9p7DEl5uxjqDO?=
 =?us-ascii?Q?UDgAzIGutsMdKbpuW+SC1dy6aLkbVPpSdObTPGwUNk9zDhUgD6jkg0ZKpuLi?=
 =?us-ascii?Q?+EUD?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YVlgtTXLo+FAsqlFh1aHKgkaQPHmiJRFGZfzlIwqLf0/rWXez3Rn58hgf6mq?=
 =?us-ascii?Q?tSdATJfTZjkHHGJXMakknDnnjCMx3BCnd8S6t0dGkO9OxixTlszWX+wZCVr6?=
 =?us-ascii?Q?VxWVGo5Q2IH9g53cn3xiEb3Me8bAXAPbjTWdhA2WR6MFeHZ1CgZY4N87uuiI?=
 =?us-ascii?Q?Gk4jS+muzaYMeL3md/za6QJIftJ0dCP+Z7rwdQ/qVwTqtrS+nDItreocrmsK?=
 =?us-ascii?Q?/8WRf4DdcT6I+yeaUYK+SopBR9hQ8fSrHFUNzqhbc5s82TU+UC/MVIX04Unr?=
 =?us-ascii?Q?hjqXMobRi5Pl6Lqb+wJQSY83HnMbdjQeD2NGXX08rdRQ9BmBrcU9U0AWLG7s?=
 =?us-ascii?Q?q0Tyb9WlpFK3i9Cldjijvo+DoYGmMXbrzAXkk+9mBBnHOTwc5F++6dKWfIE+?=
 =?us-ascii?Q?5bVqr+EteAVemnJRrgFZ1T+iHyVDpP+d0eHnRUZKP+n6883HvZnJpNY2PXfC?=
 =?us-ascii?Q?VhPcb7b4k5qjvzztJyDCy+DVe1+S2rmcT98+W1aTNEcEUb9wjOsMoL3u5zoy?=
 =?us-ascii?Q?Ib4Bjt9Rtanx8h1QbgIxthq5LS90uUjEGNADVo3jcnmAhsa6SqlwqZgvY4+H?=
 =?us-ascii?Q?3nwcU+q8Kl7YrePDRAeoDt579pFZaOgRBvlLEf9e8IRxgkfAkAOlkc/UG5ql?=
 =?us-ascii?Q?YlZEZcENUwDgSXIs+hkxeUXYmUL+Hf/IbbybU9D5XOMbI0qmrLvHKPraPlMs?=
 =?us-ascii?Q?0Tikhyodb3lVYQy4i2iS96iJjQ53OTXcfHshdUlWouq7SG4pCTaT5QL8YW9r?=
 =?us-ascii?Q?P7ICZM/MjVdfcpxAchuL/P82FmDItbGsAow6jOmtzFh+LRT1W+OdwWKSiG8s?=
 =?us-ascii?Q?P4Egtvi/BfMxSBI5Sn1kUfUWA25DaQUpLyri7ZTAJB2YdIkyxEf++au/HBLv?=
 =?us-ascii?Q?bfPiCl1nXetbWA5xxGd0IMMAaY36kaj+/nEvait3mTioIDhpwCJ/kcPXv34H?=
 =?us-ascii?Q?Cexteo6ohL1nj2cZ2Dd/UQOchtXV/ub+49d7F+PgPEye5YqwgVITRnI+mdQt?=
 =?us-ascii?Q?ATm7Njohab5bZWBeM/oREldtU71S7Lm07NZ22HcBUyH0BqP2Vy+CGENSTR16?=
 =?us-ascii?Q?hLmilKnlFLNiDOBfiEMQ1TiIARjVkQ/id+mv70/JouUc+UF31FjsQImpOqn6?=
 =?us-ascii?Q?wziPdAxeOGpQeH7SXiws0cBvUZSvYnmJ5iZCKAlkyZGGRvXnTpJY6TeE+4TR?=
 =?us-ascii?Q?F6VPiS4ROByJXfu4QGiWskwUXW54GxDUK0r14DL0MCmXKWyavn/XoUpKKN1M?=
 =?us-ascii?Q?nPVlsNhkkL+UTblYjd72rKJwuIF8MPMC/SttJ3xtdpWNZuQyZh7gsQHlOzEO?=
 =?us-ascii?Q?1dsksROXxhF88iw24qqwsgjxCm3i7g8NjBwcG3ZMdmpKALTItE0Qn420BOKs?=
 =?us-ascii?Q?qP8aYOu1kTFz931GtSOo+5l1YS/hnSxuNroRcaOphZQ6LABFlcT1C3VwqGpA?=
 =?us-ascii?Q?QMMpykQlAX8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4016bd-a487-4c1d-20a2-08de7bf9c03e
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB9774.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 03:29:35.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7238

HP Laptop 14s-dr5xxx with ALC236 codec does not handle the toggling of
the mute LED.
This patch adds a quirk entry for subsystem ID 0x8a1f using
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup, enabling correct mute LED
behavior.

Signed-off-by: Liucheng Lu <luliucheng100@outlook.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 86bb22d19..c8b78989f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6939,6 +6939,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a26, "HP Victus 16-d1xxx (MB 8A26)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.43.0

