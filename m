Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96748C8B7;
	Wed, 21 Jan 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001779; cv=fail; b=kvZnSgHtqVr2NXT1LyuMY9M9pCQZtfkx8Hb366iC2SQoKtQnAzCcV87rgiGOaNzcD6ELmjUZBG2f5Dw2drHSHejiiJEwKQCT657xRyq5xe01chLcw1SbH545DogxWYPLx79WzIDFZHHpV+QqqgFMU8z+9KuItPKlfB+iWEPys7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001779; c=relaxed/simple;
	bh=HMN7+a3+3IJCnZgHyrA9jy1qoj3rsKW38HPiu0HHqiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SASQu1uDr/BzK6B1GDmCboHf6U2x/APAj8fFL73KP9sx/Vzz6xSYGzQt9em0zwlER2UIVS4JhksJSZCwhaSpS9hFc3hVJlW+IXbLYu3rvvUGVVCU02dWzmfw32lMQmb36Ht66Oo/fOHZqA+LXZBmKHgiodMWq8O3fcegILvd4yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=A0/gE/kX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PhqveQP0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="A0/gE/kX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PhqveQP0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L0mqFd3498261;
	Wed, 21 Jan 2026 07:22:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bpZY5PW4oOjD91JkZrXHJgFJYyZcKO6Ege5giL5sGyc=; b=
	A0/gE/kX2x/jBu/jQtP4BF9gkI3UlaqerNtulzOMqYZgbpAt0+QjbQgB6U2i1ZRA
	4Hm8GpwgOBfjupp1SReOd5lpugJ3mcBpyEiuD1brigVvNukrqCMUIQS/WvEijLuo
	LtMPyP9KQNX2LHPYw+yFiphCz5LKEIYNSWg6MAydQCWuPqN/qMyILvq3qequ+67G
	vKklsItQC2HbquCSzy0Z7HRZAZdoCr+ODnfPdmCyqrAnk7Do4jn9UEbng3yPxthO
	+IoOdYcP7B4Swu8ltcgedqyt5YhuMQIPgCRNG/yez5m0I8wS20wfqDhhgYfK0wDC
	g8AX2AflXc0k77tmz2kKJw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022112.outbound.protection.outlook.com [52.101.43.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjvtac-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 07:22:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QE07oM0Zqjbsp5gm9DGKZN03YSpFdbEt4EaZ8zNJQHue9xl3+1WmA1g/3w/HYxdZ9lo7Vh1mZvRgqSoTjFeaStrOW92ATFgw5fNwWmaiL8Npz5CA3OgclBPFFbvzoCG5nILhicjeQgRWUG1W4rewq0vJYXnYN0A4yat83bmJxnAa4JZs7WavX8Zid0H4gZIXmeMW+eUkpUg++DoPH2a+Edoc39JBqmmexSre/xLL02Ep0oknAeII0LDT/5qYiuuDgb3bakLWH1coqPXWdNKyDQhkiaOSA0PtbTckVsSO95nnJjXnRN4MqfwBASXFXH/w8rmfGcxNKpwJ2OCIZUrubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpZY5PW4oOjD91JkZrXHJgFJYyZcKO6Ege5giL5sGyc=;
 b=txro1PgymVekOAgCM3hGEIO6o2KruphQCzOT4kov7ElaLyDCE+C4zR0RDxdFvhddxVQdYlPsiGrfkABSq53J56ab3D5h3AcdozABzr8HxetZA9wYtHdlhZyWgFQjAe8ZlBEDwgoBb/0+uksj72/mj68ettbaXvwrgf/10YOUNbnbF18/EAOJvfo11CRFRob8JaRd2tmGxDereWKa2R83bnzuhU7+ULTwS4WLcJQiujZSVj0f3iU3180g+/EuKucoO89sKaG8q5Srd3ByQG+MpVmXJjHX75H7r9pLFBXiCt4OPWn6X+6PUui/xTSauIZkjBdh4gnresr8ZymMz7cCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpZY5PW4oOjD91JkZrXHJgFJYyZcKO6Ege5giL5sGyc=;
 b=PhqveQP0ZuIJOJI+rnqiyPSldAr2UYWBmU6c06WxxtPHgiwzA8LbBPIreqrrdYUJCbufbc7M8O8r2qCrkBkQ4CrGJa3Q80DsTYpHo28kInYzLqgrpBGdeG7nYrtZGtg2GxblfQasLZQAOIaeCsxgd6yt6GznPNYqorji0WU9QGM=
Received: from CH0PR03CA0232.namprd03.prod.outlook.com (2603:10b6:610:e7::27)
 by LV1PR19MB8872.namprd19.prod.outlook.com (2603:10b6:408:2b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:22:46 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::d9) by CH0PR03CA0232.outlook.office365.com
 (2603:10b6:610:e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 13:22:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DA9D7406542;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6840820249;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/5] ASoC: cs35l56: Use vendor-specific qualifier in firmware file search
Date: Wed, 21 Jan 2026 13:22:40 +0000
Message-ID: <20260121132243.1256019-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121132243.1256019-1-rf@opensource.cirrus.com>
References: <20260121132243.1256019-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|LV1PR19MB8872:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a6f5cf4-8906-41bd-5e1e-08de58f029f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bhKh7KIWhjVlVuPyonZJBKHvAVQLSHdwa2Wam1fME4uMxOL+ERCCQGBSBXXf?=
 =?us-ascii?Q?ntQZp50w2Obti17C8RndTfKCukoqt8L3fPu+nBYPUrO3XIOy0XPA5zWkbIwK?=
 =?us-ascii?Q?i3iWXyiDvumt3QavPW0ADux5aUsGkHamIbNhbpSn1yghO5tM9cVCWhD2NQas?=
 =?us-ascii?Q?c9rCb566w57cfP3mJsuo8h6zp4hCaKEpeoeEfj1i4Y0NiT3plxOXf0Bhd1OL?=
 =?us-ascii?Q?/I/BrWYbq/hvk5bz3BGRPjcWNsifHD4uHykLIl+SJyPiTqjGxfAwZBFYoEx4?=
 =?us-ascii?Q?ufcy88MjPJZLy4A4TX9zNbOjmhaorbXKVnO4qoln42fzBM+ixx4ixaBUeLWa?=
 =?us-ascii?Q?rWHE/Y2J0qsdAhW9P5J6tkf++qJIZovEShSR8/CfsEQ1juTN3A7W1GBBX8gm?=
 =?us-ascii?Q?6w9ZiMs5FJpkQ6Rwb+s/sXQHbcSTgGVdgkVdbgInTpbpJzHDMGgQsiFf4yVd?=
 =?us-ascii?Q?Zqa8G4GIpbd37fD5cY6lelXORpIfK277Opc7AB4GQRoETDmyjmHPnZwV0f0E?=
 =?us-ascii?Q?vaqCcFpdAUvTn0zILsn/6AVyp2TUZICs3N/orQ7Tf4E/ehipHcNrC1dVWDNF?=
 =?us-ascii?Q?xvOHqiYQpznltK8rAMv8pww4UrQHehaNrNQT+LuymtEv9HO1Y7iWU/QjSe2a?=
 =?us-ascii?Q?jAazay7KQbBY/eQ3N+ZVeyl1HEnWatPwVXbUuFQ+QoeOur0rxdQdwdAkpwW2?=
 =?us-ascii?Q?Aj2xf5GPVxB/IMVu1Dgveazfea2xGsakJ6ZJKLrstauXHJ5Ph51B0bcvxGtZ?=
 =?us-ascii?Q?N/3kmJ3QYbIdIDqR+3FctXHXfUg3jrS1mkfemisiE31pHSfjRqe0uXKmzudP?=
 =?us-ascii?Q?YPegLZ0T37okKazleFyXZjx6L8qa43LJo7f63PLS4bjGi6EoA6xCrkrVSJzJ?=
 =?us-ascii?Q?plteZA4PX/nvVGTNpCnpb8n4hPE2t8D41ef/JVernCJugRxDrbSzRWO8I1JV?=
 =?us-ascii?Q?AveS8t5fRD/bAR9L82hlZkcHPZcS6oiG0TSRsvlr1gfRtxUE+NYiiZVOwxCN?=
 =?us-ascii?Q?Ku3Uk+MptAb/RxLoLGn52diveLuGacv6mS2pn4QhEGAm4xB6cFQ6QC9fo7xd?=
 =?us-ascii?Q?gtGh9Rww8cAss01SZfMjXNpO91zFgK+Vuf1aB+pN3yjjGpK0PtovSTO+H6hG?=
 =?us-ascii?Q?q5YaYnf+A7qEwka0nKA2Ne1jFdBmlOfBeoFwh6GlAfFKIJsRYopEAXi+YcqF?=
 =?us-ascii?Q?FKQHJJfRmbw9Sud5g5+KftzKcI38kM+TxM13a3ZmIaeZrYKKPRY5iz2twjzd?=
 =?us-ascii?Q?azNUDNiNRdNT2SLUbv++XC2qJO+ECNlDYlAkC8xRN0JK1Z0mZCuYuB6yp/Ea?=
 =?us-ascii?Q?z8geeTnrsE8nIrSB2GeS7YAl1oelCu49r4Ug+1f0f6zEiCP3azvgneQDoCAm?=
 =?us-ascii?Q?4R2VnKJ0y1Kpsax1ymDMHRPZ9zeYK+sHm7rVXoPpoDjo18T5/ez2+P21vQAk?=
 =?us-ascii?Q?1pP6Cqw7pEq0SkIOYmVFSQT3Ct9Tq2MPgN8MSa/vUT9rPX0rKCUd8+HRnGDC?=
 =?us-ascii?Q?w9P2HscaDdLnq5XrqiMEFZQJA9bM2QucCW6oOVOMYbHrDxLqlke+Nv0DwKMF?=
 =?us-ascii?Q?oyksE16P62w3JTGJv/B8xvoDaTz5ugesJbKQJgv2ydwJv5z8vO/UmYDh+OTd?=
 =?us-ascii?Q?ClQN2bG3WvDd6SQU/qHec40zTjmI1VE/dS7hewojT2kimPyvFwdeP3KOUeFA?=
 =?us-ascii?Q?cZIfBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:22:44.9674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6f5cf4-8906-41bd-5e1e-08de58f029f3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8872
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMiBTYWx0ZWRfX0U1in2oRoaAn
 ss94WHFpR/oLW6LpNc2HYAA3Gelor0m4xgieWzX5NbnhM/yoxSZrhaK49T4aEaZ4s+Z2f7op3yL
 pNLN2zVNULr5HMcClyq4NUU7Cbe3cshbiGKABTnKhPm77MV/LhBugwbPmSs/cH71ZqP8SOnCrbB
 1Z7nRnBVLFGG7LKJ0JXlnvalf/BZjTomJf7M87xj8Cz+6Ov6E+PXAMtUgj4oKqmX0nkVU8d3YQ8
 oQ3zy6p4QvP/u3+UffEvyK8wLjRVxhW1vLkvrVyCxHqiCo5WuKDGBrgJ6oN7YNR0YWzKb6rRudG
 gHFwsqJB8jAJrp7ZJvlh0tCr/IcrPW8svcFexG75IhPBLR9D3WPco4J1V1U++Nd7fRi3f96tRiV
 71VtN0KlL59t6ZRgcRO0y0VAZMiZbHmunM5e6dw7omtBuATktq6v1OCzjp645tEsge34fguqYT2
 EbOvylrGiYhdVke+Z4w==
X-Proofpoint-GUID: K6iqJ1CQ5-wz5We9yQZNa3CFoIe1pvn6
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=6970d32e cx=c_pps
 a=p4c3Up3QyKVVMVBhHExQxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ecnmnmwIhqI2Q9cHpl0A:9
X-Proofpoint-ORIG-GUID: K6iqJ1CQ5-wz5We9yQZNa3CFoIe1pvn6
X-Proofpoint-Spam-Reason: safe

If cs_amp_devm_get_vendor_specific_variant_id() returns a string, use it
as part of the firmware filename. If this firmware isn't found, fall back
to the standard firmware name.

This re-uses the fwf_suffix fallback mechanism that was introduced in
commit e5d5b3aebdc8 ("ASoC: cs35l56: Use SoundWire address as alternate
firmware suffix on L56 B0").

This is for handling vendors that use the same PCI SSID on systems with
various audio hardware and have a custom vendor-specific way to identify
the hardware variant.

This is currently used on Dell laptops. Dell create a UEFI variable that
indicates varations to the base hardware. This variance can be any part
of the hardware (not necessarily affecting the audio). It would be
impractical to publish many aliases for the same firmware files to match
every possible variance to that base hardware. Hence the fallback to the
standard firmware name. This allows alternate firmware files to be
published only for variants that need it. For all other variants the
fallback will load the firmware for the base SSID.

This is not done for CS35L56 B0 because the fallback mechanism is already
used for a different purpose for these parts. None of the products with
the older L56 B0 silicon revision need the additional vendor-specific
descriptor.

For SoundWire the resulting firmware searches with a variant descriptor
will be:
1. cs35l??-dsp1-misc-SSID-VARIANT-l?u?.wmfw
2. cs35l??-dsp1-misc-SSID-VARIANT.wmfw
3. cs35l??-dsp1-misc-SSID-VARIANT-l?u?.bin
4. cs35l??-dsp1-misc-SSID-VARIANT.bin

If this doesn't find a wmfw and bin file it will then fallback to:
5. cs35l??-dsp1-misc-SSID-l?u?.wmfw
6. cs35l??-dsp1-misc-SSID.wmfw
7. cs35l??-dsp1-misc-SSID-l?u?.bin
8. cs35l??-dsp1-misc-SSID.bin

With the typical published firmware names and qualifiers (a single wmfw but
amp-specific bin file) this will load either:

 cs35l??-dsp1-misc-SSID-VARIANT.wmfw
   and cs35l??-dsp1-misc-SSID-VARIANT-l?u?.bin

or

 cs35l??-dsp1-misc-SSID.wmfw
   and cs35l??-dsp1-misc-SSID-l?u?.bin

For non-Soundwire (I2S/TDM) systems the searches and fallbacks are
as above except that the "l?u?" component of the name is instead the
ALSA name prefix, usually of the form "AMPn".

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 69 ++++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 55b4d0d55712..abea782bcd3f 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1109,27 +1109,68 @@ static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 
 static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 {
+	unsigned short vendor, device;
+	const char *vendor_id;
+	int ret;
+
 	if (cs35l56->dsp.fwf_suffix)
 		return 0;
 
-	if (!cs35l56->sdw_peripheral)
-		return 0;
+	if (cs35l56->sdw_peripheral) {
+		cs35l56->dsp.fwf_suffix = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
+							 "l%uu%u",
+							 cs35l56->sdw_link_num,
+							 cs35l56->sdw_unique_id);
+		if (!cs35l56->dsp.fwf_suffix)
+			return -ENOMEM;
 
-	cs35l56->dsp.fwf_suffix = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
-						 "l%uu%u",
-						 cs35l56->sdw_link_num,
-						 cs35l56->sdw_unique_id);
-	if (!cs35l56->dsp.fwf_suffix)
-		return -ENOMEM;
+		/*
+		 * There are published firmware files for L56 B0 silicon using
+		 * the ALSA prefix as the filename suffix. Default to trying these
+		 * first, with the new SoundWire suffix as a fallback.
+		 * None of these older systems use a vendor-specific ID.
+		 */
+		if ((cs35l56->base.type == 0x56) && (cs35l56->base.rev == 0xb0)) {
+			cs35l56->fallback_fw_suffix = cs35l56->dsp.fwf_suffix;
+			cs35l56->dsp.fwf_suffix = cs35l56->component->name_prefix;
+
+			return 0;
+		}
+	}
 
 	/*
-	 * There are published firmware files for L56 B0 silicon using
-	 * the ALSA prefix as the filename suffix. Default to trying these
-	 * first, with the new name as an alternate.
+	 * Some manufacturers use the same SSID on multiple products and have
+	 * a vendor-specific qualifier to distinguish different models.
+	 * Models with the same SSID but different qualifier might require
+	 * different audio firmware, or they might all have the same audio
+	 * firmware.
+	 * Try searching for a firmware with this qualifier first, else
+	 * fallback to standard naming.
 	 */
-	if ((cs35l56->base.type == 0x56) && (cs35l56->base.rev == 0xb0)) {
-		cs35l56->fallback_fw_suffix = cs35l56->dsp.fwf_suffix;
-		cs35l56->dsp.fwf_suffix = cs35l56->component->name_prefix;
+	if (snd_soc_card_get_pci_ssid(cs35l56->component->card, &vendor, &device) < 0) {
+		vendor_id = cs_amp_devm_get_vendor_specific_variant_id(cs35l56->base.dev, -1, -1);
+	} else {
+		vendor_id = cs_amp_devm_get_vendor_specific_variant_id(cs35l56->base.dev,
+								       vendor, device);
+	}
+	ret = PTR_ERR_OR_ZERO(vendor_id);
+	if (ret == -ENOENT)
+		return 0;
+	else if (ret)
+		return ret;
+
+	if (vendor_id) {
+		if (cs35l56->dsp.fwf_suffix)
+			cs35l56->fallback_fw_suffix = cs35l56->dsp.fwf_suffix;
+		else
+			cs35l56->fallback_fw_suffix = cs35l56->component->name_prefix;
+
+		cs35l56->dsp.fwf_suffix = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
+							 "%s-%s",
+							 vendor_id,
+							 cs35l56->fallback_fw_suffix);
+		if (!cs35l56->dsp.fwf_suffix)
+			return -ENOMEM;
 	}
 
 	return 0;
-- 
2.47.3

