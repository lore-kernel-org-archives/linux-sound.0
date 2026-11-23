Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456586;
	b=0qhtwUv2vPLA4sMwEl3WETGeI7VJkuwDhMcIjCHnA5sW/JqFRM+wp9p8L3iKSJZMlRME
	 2ObTIPgR2a2BpQO70EoU6CE8qCIYoleRq8HL0FQuQKbIKmiNURVlRo9LNw9hV17RreSA7
	 abkH2gqVTuWEbXuVudoMd874yig0oxR1SY1JuzKE7UPhW2eD8xGJYi+F9BPKn+rlJQsa9
	 0WWqbm1ej1iUhOgZQGTmIsO8Pp51gIEEpm8jmUShQSJjxyUXAq5aq/vQ/u4EdHYz8vn+v
	 ay1nMm1uuuBHQa5mo3CGtwB//5H7Nz0bU0PBvkq2DPAvOQWLHl4mUJtoYZxEeCNuKaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456586;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7lHDhTwKkpRYl/CKDlXeDjQLDA8ov2oYJE/EztVLt0Y=;
	b=5DvudOWUYlZpg4I2s4vG1kr6EZdT3LrWvfXY//27TYnm0JWwF5dF0ZgcsJk9Gs9Dib/7
	 hod43JKZ3TUULQYRHbYkLKsq8VbXWHIAc6EkGAiA+tREQc2WdHA+Oz8HSdDgy4wHv3M49
	 KfbNegFN64V1B42ZavKpDpBEa6GCeZsuHd9tAVPZr77EgGH1zeTEHzuhUu3SnTSo7h09x
	 NSNVlVoCzNizYaxHfzmI58tnZGr5UuyOo6aFvrBhmNsn9WxGDS+KopJoFIFEEk73QjQpR
	 cPK5EjGy462A2L24SV3J6KQmbSNJwFW8HCsXbnJFIKyJP1q1v6Cv2xA37oEsS/Xmlog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=pfVaY13t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.26
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010026.outbound.protection.outlook.com [52.103.23.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5084606A31A;
	Mon, 23 Nov 2026 17:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5084606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=pfVaY13t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kghofzb5bEsqHVYiXa+BUJUNfSE0vw4SeLwUmeQcKdABoAlG6gV57sA1N+MXiIJkLMaqXNT2UrbktrnQS6M8qsusC7Kz7zgjS2vbmFaMjMxO0MP64lMU5i7kqHIbCIsIPheRUXFB6jzPewxb4/JUAb3FDPk89ePiSAZoBHfs+af58F8pqqXvOesEI/WfLZBkbWIC+9Su0oe83OOWL/Yyy9kPh2Z8Q5U5tx81eoT3NvAXJ7wazM3jPEt55Hkj9PorjEG2Q9aqoOYueM9va8I3wNbvzFFbbD14RXpRxXh/UWwgMdfFiRuCyZ3seLkOFdmvjL10Y9gHORcOFcQvF3DgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lHDhTwKkpRYl/CKDlXeDjQLDA8ov2oYJE/EztVLt0Y=;
 b=BZQOuW6vFdJn/QYaC/RUYmhOLcEkV+9qwr5WQiR52B7z532CLevWwUSXXBjZR15gpiaks7qZ5MtXHkPRxIR5PglOm6n7blu7lFl1oOyogQ9G9onjLKH7UdsOPs96Gc+duAGrhaD7+KpAyn5zeOXoaonMT2Gc+AGNUBJvgWBEw/A4qMKa0puuhnX0h44jI0lRlpDflZBi/hprileHN99BFRNmNQ1llaKmpY+hOGU5vpYISzJPfCWKZIbQBWUS4+I5QOPh6aq02LhNETmf8J3+5za+DMgJlnnPqng1P3TjvnwmrSjcwDSDRroqNV8SVRnz+c3q2IU4yP5ICXWbJCVJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lHDhTwKkpRYl/CKDlXeDjQLDA8ov2oYJE/EztVLt0Y=;
 b=pfVaY13tRkD73QNxTmnRmXMwHlL5tuNV2Z18Jb5lG9sJRExA85tB9jbgj6G2k2ECqO0udVl5QrKkWnP0jtbj7TDQJg3zQSwWonMqU5uSg6vRm7Q5zE+fOxU5tcf7+AveAo531+VqF/oege9bXltIVauFE28szBSjAdJrkoC5rSUcIc94B0OR3F+HyZalrSVe6wuIXN9kpZwiFkbNlKp0ovpupuDEY/n7aJHx3YBjhicOE8RM+hxwu2HlZt7mUqbMbDAVQEpVrPTOJyHfy55CQAOHGSurK6Sm6PSDpU1e8aPtf4nRfxDkkOG4mrlbiHLqWA8bDd6bn5uQwbZ13vcicw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DS7PR19MB6352.namprd19.prod.outlook.com (2603:10b6:8:94::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 17:56:23 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:56:23 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] ASoC: aw88166: fix backup restoring the RE value instead of saving it
Date: Mon, 23 Nov 2026 18:56:10 +0100
Message-ID:
 <SN6PR19MB230389321D29F0C88582B4F6FC452@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261123175610.50245-1-marco_giunta@outlook.it>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DS7PR19MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 94346ebc-0b78-4be7-ae1f-08df498b1598
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGal41pYXMpvjOiGblw59wrFScdTV0TrJoHnOPUvrzcXooPRwCQWThO26elqWUPJvvFUwyjaL5uxHZYULUrZY2BbEmgDxQWRJViluwIixhN4fqXu/jKkFI6oRS5ec1/F8HBYZK8Aud98uJBsIUlLJxR7TD8H8WULcQppgyMUsjnaXJosNbId385DexAFhFdKOJHgHRvp9x9SIIOuI6oVOGnne2iGZBylzXWjsHKMscK45FYufv+E31p0+uWYwQQXe0iZQD+GPMmHAL6L9/C3oFItpTMn9hl5Cz1lshXonEy9FC8pmHRgIoH8Z60+vQuGVBayi78VzT6ncL6pqNfZhUN8IpPvHxhhSv1Mu+uLtLJ3j9+DwZHIcjGquSkL4EIHn2k5F6/wbIpI0lQbCLhcFgHKv2pghIpOmL6ec5R0DFA9rlTow9Uy2j1Vf3u45Tkl57sdTXtmJcFYp8urT0Hvuoi/LUv8C4XdFH+Z2GVTj5W+One1PLkSINNQxafVL+RKStFx/QgnALu+m+cy3JRgdObhKUSants54KXAsusk7zoKLJMy3VuMsDKUl9E7lImegwwqgmMQJ2KC4CTZKPNYXyWE22Xk0DxxH8kmTeoykRAVkEk/M2+/ouf7r2oRDtIosFNML5ECh6UgMBTeXmo2MBEJBb74vh48CwmeqdkFZRc7QCiyVsm9tG2IZiM1CKGjSPbotJKc7Y5tBmV12n6vr0Ou7tDXqcJC2s5JHFm6PdVFWpY1pe7/cBkMz5pzBi0ZCgz
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|5062599005|260925184616899003|15080799012|8060799015|55001999006|24021099003|19110799012|5072599009|25010399006|51005399006|3412199025|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FR5FSuWAckoWhm/q7MdmMnz/hX4AGjQlfuwLmMIJ5r49FbwuKPb5P2gff1kv?=
 =?us-ascii?Q?wuAXoM7bglPtTu5DTRE2hJFPbUY24AplZkg/fdEvvHM51JEd6ZvukY9By292?=
 =?us-ascii?Q?MdDDxYtF5JmcxdoknH4x7ZTpkNCii3sUd/jLrUWr/aeuzNwK/4g/yFUHn3p7?=
 =?us-ascii?Q?zGp3hTEY7WoKmZg/sxBMMJCJfOYYHxXV+SeSkpYpIJi/6A/TGZyB3MfQ0xvw?=
 =?us-ascii?Q?QMTyRCS1iUjdXTpFAwVh4kGgnDYBZ+X7lCn0veyJeQ9FZIH9FgUEWTT3T7vm?=
 =?us-ascii?Q?x4oei3dCVvllbrBF1ny6Rz0nFixplJ1Me6r8n6qduxIkvVsYFAxLIGSc1d9S?=
 =?us-ascii?Q?CrSttaZ9u2p73Yn21V9BsVoYOI53hVbT5JAbLk98iXFuSm7cIiUPAykYErrS?=
 =?us-ascii?Q?07jVD+q9xSKjTqrzmZnCJvosqPy6vo96j4qWza+j4O3UJyxZtlS6Zz0hd4fJ?=
 =?us-ascii?Q?2i/K6jYEJS0GscXXSTOJlZrOlf8TzJ9+hPO/Pox1xlXvMQsefVcmlSZ8FhQi?=
 =?us-ascii?Q?VpQgQfLkDmSEn/L+Pie+ahvbU0u1eGvRV225WXloCUgZvyGCZD8wPX8lT+jU?=
 =?us-ascii?Q?/DqL3FUSLo1GmvVWBJXSAPaRb25HcX0QGu49QjWkQWpqmiqoDAnd/rwFlZSo?=
 =?us-ascii?Q?dZn0E38mAr66ldYI3JFVVuHoDhZXn5lTb3hSNqYmTIOEsSjoYV1JeFIx4ree?=
 =?us-ascii?Q?pKJ6fBgrC8hSMpSwcuHTAhsLmkTzd79/3tRuzASMn32U23KzPn2DpP2GyuaG?=
 =?us-ascii?Q?/o5RnbaoCXkkONEHOavL5LDzSJ96gpyryHZmrOgKV0LOTjXU76L56ch10xQc?=
 =?us-ascii?Q?5ehsomF2YAsX79bN8PgwaHSs7PJwbmlTvTV9LsDPcdB6taxCckgP4UHAfwiw?=
 =?us-ascii?Q?J+ai/5v2rIhm3oKUKk9CcIac01OT4dmNxzkiKiINn815pdEEZkQHRxsmpfyd?=
 =?us-ascii?Q?zQ77B6pgL5HR+lDQn9PABw8owymEa5wu/VYJ1Wjp8PfpakzMYQHqFCmObR9a?=
 =?us-ascii?Q?Zo1uXABTTEtTX0wEwL0wUwD9lA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0hy1pwVDqBZ1Z86VjeSKN3tdNxOQ6JgM/m6nhacmAsGu475cH0B+XQqFYo/D?=
 =?us-ascii?Q?29tPxdwl9qOSwLAYfvKlXwxfyczF3BjeCQwlH9mfPlCJkPWXWcOGiUEEBw7d?=
 =?us-ascii?Q?7eW0NQ/Hb10SRq3pvT42MCdAJugZv/0x0HhQDkY2y4dB6q89OkNqoFhweXTY?=
 =?us-ascii?Q?Fo/rYRK2E7zWQAqRWqOQqxe0KJP0KGHIPcmki/X81RLE8gX+UPIVGDdATXM8?=
 =?us-ascii?Q?ObGDAKF2PMlpxYjjOzLYYAT1DobtMjm+W83dRsJzOG4gvIFjinaWGj4fPmPi?=
 =?us-ascii?Q?oeSmgHXGXrnyRcO0wfnKtXK0j5Vi99JmuCzG213nQJ1BwrzLAnTC3v2sYrQV?=
 =?us-ascii?Q?BugirBZizc/GDgu+RwkwZ+XoPoCE60/sEO06RHmSI/2HjuJlySjDCVlVKgSH?=
 =?us-ascii?Q?sB9Mydwc5bYNyvLN0DcMUgs2xPPF9RqWVLGtWgbiX85DwG/Q0W5TkCkJbxwH?=
 =?us-ascii?Q?VGUULUkfL85jkz11hym31nXgnReEKxZPVFkMbs4Cyp3fxvG8tSystcpoNo4m?=
 =?us-ascii?Q?Rp9uL92V3N4Wmk7ZxzyR2eSM5CeRPXTEQInlquyHfplzZdcpNSVihmE7nH2f?=
 =?us-ascii?Q?Ry11ABsBXrhh7wfBeC6R+RjFzpBOiPJRl4eHpvQsqPIaNLao9qKWka34B77G?=
 =?us-ascii?Q?M+vt7iz6hfvbidR5zF8qMsylPLpoJqVthxF5XndL4wu1wOpX7czSjB78sf5Q?=
 =?us-ascii?Q?ARP6Mx3Q8+qRB98byXsrjHwepnkd1msgW8tRYvlupJnfL49bkKXEjcni5c4m?=
 =?us-ascii?Q?0vQTrc0bMQgf+9YEDRTqqJsjOZLZSPRPyIMnxVkwEE6dGrWWzJdTGHXwqr24?=
 =?us-ascii?Q?TwHmDs0V8CghziPMaQ0El4a+PE4P8RZ0jQrKn8q1ZiZ6vbHPK2LVi7nsNmqh?=
 =?us-ascii?Q?FTPNV6U/Fz+lHNmIWiG/cIFgbJf5yOwMOQtiHNQKizunzu1K7G9rZDCzLbRx?=
 =?us-ascii?Q?w0uXbhQecP6qQ9LS3Ql/jODRR8suSRYrZgHEyrHMT5v7HK8kBDho3hM4LGbs?=
 =?us-ascii?Q?qjHPBK4ieyhnnUkSEpUjT/5L9fQmLBkK/JHfnICJj3R5dlykuuPxrXSYprJE?=
 =?us-ascii?Q?lbdmBre5lWiVleD/TGjqap/22H7CCJlbbLXz/W93p9PTkmtj1FXS6GhoIKsG?=
 =?us-ascii?Q?8uYsgwV7suVjFQEu9k8TPmsuK/BX3RKPhq0U+OjQjPpoH0VwPFRfcY2/bAF2?=
 =?us-ascii?Q?NR38GQovlzdzAgfihfM/aKq36j9TJfWs6V3uXCRDAeHguxgo5UnXR7z+bUnL?=
 =?us-ascii?Q?7v8CYrQru5M59YAI8t2n9JDJexXe44twtTgvMQICP4B/+38S377+fDMJGigK?=
 =?us-ascii?Q?Xtm+e85PBIskV4osas/3E443TQFpWCxC7vu+Xta+z3CePQUpRp9VZ6Jr510q?=
 =?us-ascii?Q?xATsxXJ1ciklf77iuxn3FAicvFxz?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 94346ebc-0b78-4be7-ae1f-08df498b1598
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:56:23.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6352

aw_dev_backup_sec_record() saves the VCALB and RE values so that
aw_dev_backup_sec_recovery() can restore them later. However, it passes
AW88166_RECOVERY_SEC_DATA for RE, so instead of reading ACR1/ACR2 it
writes the stored value back to them.

Pass AW88166_RECORD_SEC_DATA instead, as the vendor aw883xx driver does.

Fixes: 94e412c28e61 ("ASoC: codecs: Add aw88166 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88166.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index a520c9089425..19436c001a80 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -404,7 +404,7 @@ static int aw_dev_init_re_update(struct aw88166 *aw88166, int flag)
 static void aw_dev_backup_sec_record(struct aw88166 *aw88166)
 {
 	aw_dev_init_vcalb_update(aw88166, AW88166_RECORD_SEC_DATA);
-	aw_dev_init_re_update(aw88166, AW88166_RECOVERY_SEC_DATA);
+	aw_dev_init_re_update(aw88166, AW88166_RECORD_SEC_DATA);
 }
 
 static void aw_dev_backup_sec_recovery(struct aw88166 *aw88166)

base-commit: 42795082e2dd5691eda4bc1a27fcecff8ee623b7
-- 
2.56.1

