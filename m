Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3063DC860;
	Thu, 11 Jun 2026 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176150; cv=fail; b=ZDbzjH4LS2D+t+cqpop6v7bjJrogZf+MAcCzaoI55XTAapiNyA65RIRjaWexqp9Ig5/lQ17cELvw4DOq9aiS3Hz0FliO6tpW9lBtsrEN7FNYiVL8trhv4h8Wwuw0EgZrpf0I6t8JCQ0Ov126vks/AdEGUJd8vB7vUz3fUgfLbyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176150; c=relaxed/simple;
	bh=bFAJ3SsyWXShRBmHQt+ZeV8kzhZUYGbqMfZEoeOgGmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nbC2fgp/I08kz0mBkUJiZ04SsyMpW3t+hzXJe3JvERzhCHknucMyKRAiDuczy1NiDpn3lMFF62G+0vMp4lQ5DiTKNmvA8Eak9O6QxfeyrfYgjorut0YcO5Zt6NmDNdyTCYtFhlEbFpYuzzt45wldpRh26hXSOcEZs1GZuNkUg8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pU4rRzuA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tx1sCEGq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pU4rRzuA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tx1sCEGq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B3mLb0691656;
	Thu, 11 Jun 2026 06:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=3juQSo2SAk1H7/xf
	Fkr0i8D6otdUAhLPd8QBQDpoLfM=; b=pU4rRzuA08mGneBLcslP2IKr4vmeAG0Y
	M34C1uOhyfNOqeko2mwHONVdP5Uw4fir0OQlfWBd0furUYOtHcc2wuckTBbHOHhG
	Mk68gHh6itGBehimnu5s4EdTRlfYIr5Lzgq+n/RDcU1v53dPlXamuQLRJPj4m0Nm
	0XO7o2bWg/yBoL1rhBWqe5NKflo87y/796s9FPvQc3/a9Zgk4gznCAiWf005mSQq
	5SichXcZohYK4Ltj+mms8ky/vJvcFtv+5etjSzxGiRNZg4GaNAn3G6P3Cl0xceiX
	VglDJ0H8Omd3wUOxAEmg+x4ObvDaggcvAYQVWv6X6Kf95EFmYm8uuA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020087.outbound.protection.outlook.com [52.101.46.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4eqe6e0yer-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 06:09:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icYY8kY0ON0+Y6e09KwoFA+XvUvUAhL2KZ5yuC4rNs02jKS3ug5m1VujG5DmqvvhhRCXN8lgpc8os+/3CuK+eGVNzTeA6reBKVuwNHoTRLSsY1kH6PhI6U25vHkAohtJoXP7jWNRF66x7qMP/l3DUyPcknHj7CVAeAxjmrQukRMQiJKBDANbzA4qMHgyrwEG45Tb7bu83NaaudXxUu/Q7WUj6ZWssZDgQlAzhk6868hhq1Nx/Xyf6RTiForF0zVmSB9mZV8klqVTWTeLycV0coMG8yvnVIDbWVJcJ2+sBfKKLB+pbqJBL/g5NZ6O+/qHo14uf4RMzpQ0cOcsqKompw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3juQSo2SAk1H7/xfFkr0i8D6otdUAhLPd8QBQDpoLfM=;
 b=hEYcEeICTbG/KVObpopjLOA4yaPS1bp0GK7WmACLiRlUo4uKf7jyJj7pLP/79Qop7Iw+ahriPXuZIN2FUvl0iyQM7MQBVir0XsFEKtK9UqsVwuyIIJjsb/kcWZhwEwoMgCNl8HOK2jKs8E4RAjymaYOUNFZTjpxLr2M6PhG3P78wC9vqHDlbNZCXlr0kTSJxj0WFSSsmWEXFX5HwCfQIqji54lN3d29wMWL5R+SyiNYz1JJyL2WJRN9pjAaGltMQaYldLIq75jr2a3XnNbsraVQ5DStJZ4IAzm+nWNxyGNgQ35RDQLvbbjKuuw4wNUlAH4u0lQqYXEQkwkekiO7TJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3juQSo2SAk1H7/xfFkr0i8D6otdUAhLPd8QBQDpoLfM=;
 b=tx1sCEGqnP6Kwk4S3ni3CMP7s1MeXV3R7kqS3varpYYo9Qd9VxSfQMD439Dua1oZofUOujaVcnijEa4aiK5Svg6IdMq/dXgwvzzFWBL98+1lGtgq7wr6WCvvFEXvi7ttBoYaqUli37mTz0Vn7VHzcIfWJfDAlCMpADlYTTyDXOY=
Received: from BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::10)
 by SN7PR19MB7404.namprd19.prod.outlook.com (2603:10b6:806:343::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 11:08:59 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::19) by BLAP220CA0005.outlook.office365.com
 (2603:10b6:208:32c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 11:08:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 11:08:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0C64E406544;
	Thu, 11 Jun 2026 11:08:57 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E5BC182024A;
	Thu, 11 Jun 2026 11:08:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct suspend order
Date: Thu, 11 Jun 2026 12:08:56 +0100
Message-ID: <20260611110856.1088110-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SN7PR19MB7404:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5598c410-73f3-4ebc-6825-08dec7a9d5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|30052699003|376014|36860700016|23010399003|82310400026|16102099003|18002099003|6133799003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	Af2dKxuRROfKoRSYC2Ek7jHGcBFQFH8zOlLF6hlIAg2AWOxxAWvaboUfgL6nNM2XkO+aTLeiC39znHsFhA5cCK9nNLmvOztvFu/qKGKaNFALxzlBmV/NRlUomsNQ2uQanVjGyQUKo7OCsEGrgY1egvBHtQYzbCPE1tuWI5HmXWDHCBkOYT5VA/8MyUAWD3XqNsYFRk8tVHyikIWbh8LQAZmFKNKswvyku6FmQkL6/PdQTHqpBqwe6utL+Lr85wIZkvDZb6+ovtfHX3pr3shpcmZ4JSsbDBnWszzkUlAMQXnkS2SpJJQQpWacUenf6VYRRC/p27OnFF+jXAeCg8uMojVGUtXR9bypqGA0qoP9vXwpTWNSfWSnTZR/NJgu76EjkkJoUS1gPrqJ3xDe3ZnIlAKMBXKM39VaLLziT1WKINr7Y5WGKdsAacsq4MjvAcvWhRZYrD8Lug4RzswA1D5PkiQelrEJjOhriJgm/1wOHs5uay8EWFbhJbrPWPRT/5qJchosIeWK7ADHK9B/71elS55bio7tjassehIzpQm9Npv65THMtwV9MqDjCcWWqiQGOCeKPk8+/0D4EKu6+DgeHneP+QT0M2npzOaTvSVHaqlRa6VxuUCg+AmrHhoMFDYCGcR3lZRxMEd9GrjZIbPSw/etS/NMKLsX4qr07VLK3BMGAsQ76xW5obgldRxqkw05Y6E+EtHdEFZi6vbtlNzJEkD988MAjXuQem2+s+rnJZw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(30052699003)(376014)(36860700016)(23010399003)(82310400026)(16102099003)(18002099003)(6133799003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9gP5AFP/m4qVueFj/eYJA8xX8uqUR313qdqjbhcxs76Q9cRMc3Y7qGLuPtH1Ym9nnBanh1RhAB2cq/JmzRI8OZoSrBmwdrJBw/3AWFAuSA0sCUugmP64qtlNfH6XBzhoVl4voajrIREkvf/15LKApA7+V0snlqk5AXKiRqwEi8IsHhrCHwDGiGemYnN90qy00pzTLwJFZI37oUjT+hiltsrH6ie28CUQBex3CJYKsC2/VTaxqeMqRLJZxfGTj89MWkifQZPYCtQSo5Of6LnH8qThXlgtxYT7ALxI0BMXL7seUxFHPAYnsTizqw8YIhmlQl+/g8/63s54BhiS3KojZcxtaaORILY5hCFVycghzjJ2F1sdfFbF1UZkN69UtzQEOfD1ZkYrJAKvmFaXsBoTCy7+2Wujx2731mQ/qmyh7CrFUSmRtfDvuFPKPFQIlG2y
X-Exchange-RoutingPolicyChecked:
	HwecO0+w9ivhxHWUHOxw2j/XJuJiMSmoGJbq7soua98As4aJ3W5va8f02/vRe4mRSnw7YeriGYVEYHUf4OMxDjmV6yMkOP97viZbe/17KyJwqyEl2LQqVZvYsLvReKpFsx0KOJXlxj5hb53AIIoyaqiniNEbgWXNh1z6X3fLWRs4FCqP1jjXveh6FRl98QOW3mjlp6sqy0coLzCx5UwOp1w8Gaxp7REQc72+cXB9SPwY3RtCclRMS8jXTMVRPripH9PBt5UF8R/A38AVYjjcFgFv2za93Y7nlUk9ZtKeCjtkRqTxLOIHVSeKJaO5ApBWv+04rawG+SyIat+o7LxDwQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:08:57.9833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5598c410-73f3-4ebc-6825-08dec7a9d5b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7404
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX5YUPZ7SOWIZs
 KUoZ4nxIEqseEN7LBr75sOXbh55au7v+fRtZZjIK0ujGixnnbSjjQDhCpNVWWOOom5tzlkbulom
 2XSQz0yEM/6EW4blYJKfhSNDxyqETtA=
X-Authority-Analysis: v=2.4 cv=UL7t2ify c=1 sm=1 tr=0 ts=6a2a9751 cx=c_pps
 a=JhSJYUolln7UJVv2rG4jYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=1Et63QZfPkZzcLC2aLkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX8IDRZ+3gRITn
 PW4UBx0GrAA+uqlFgs8ApGl+aGrf4N9JY5mWihTgYb7MKS7ET0kiN83JKSaSGCdIE2nKoW2YXpl
 lXxQP/cxlwoZjGsNbUthe7SBLZi/gqrsQrlijf6puyQ+QoLn7g+J62y8n+U2bqnJn3/81+8iNQr
 inpXxmZAQ0wmxP21Ty21E2rNqgYhIyn+4YlAF/gnofY/BShXWGSd5LDRSvIcA9a0WVFx1r2FiKO
 8nGFCgt5fbOshFoFd3qkdW+gl6oHDhsVXsKXiHk+3cklh/XoCl5/IdceEWqhEhJ55VmzwmN36ot
 Nia3borXskksWp0lnm3XvwF9395LhV8evc9awUdKhuj4i1qNNm83FYQvAMeJhj8jPaAIaohODt+
 xIgqCuXg1sf4V801c8Ybg+2NP1qpqe8dhDzZK+oFPlrNoVepY2FGCcIqbhji4hp4CW/UHUeFXG+
 nC+ZV5SrMDm7OmpoPow==
X-Proofpoint-GUID: mPd9-cBeQbaomOTyplzphcjOJpzZUG1p
X-Proofpoint-ORIG-GUID: mPd9-cBeQbaomOTyplzphcjOJpzZUG1p
X-Proofpoint-Spam-Reason: safe

In snd_soc_bind_card() create a device_link from card to all components
to ensure correct order of system_suspend. The card is the consumer and
the components are the supplier, so that the card will system_suspend
before any of the components.

The PM core will normally system_suspend drivers in the opposite order
that they registered. This ensures children are suspended before their
parents, for example users of a bus driver should suspend before the bus
driver suspends.

For ASoC, snd_soc_suspend() shuts down any active audio, which requires
that the components are still able to communicate with their hardware.
Previously there was nothing to ensure this ordering, because there is
(usually) no relationship between a machine driver and component drivers.
If the machine driver registered before the codec drivers, the codec
drivers would be suspended before the machine driver snd_soc_suspend()
runs, so that ASoC is attempting to stop audio on a driver that has
already suspended.

Creating a device_link is safe if there is already a device_link between
those devices because of multiple components sharing the same dev.
device_link_add() kernel doc says:

 "if a device link between the given @consumer and @supplier pair
  exists already when this function is called for them, the existing link
  will be returned regardless of its current type and status ...
  The caller of this function is then expected to treat
  the link as though it has just been created, so (in particular) if
  DL_FLAG_STATELESS was passed in @flags, the link needs to be released
  explicitly when not needed any more"

For the same reason it is safe if the codec driver or machine driver
later call device_link_add() to create a link between the same two
devices.

(I have tested creating multiple links between the card->dev and a
component->dev and did not encounter any problems with suspend/resume or
module unloading.)

The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
the probe() function of that device. This isn't guaranteed in ASoC card
binding because of deferred binding. The exact behavior and consequences
of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
So DL_FLAG_STATELESS is used for safety, and the links are removed
explicitly when the card unbinds or if the bind fails.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
for-next

Changes in V2:
- Use DL_FLAG_STATELESS to avoid unclear/unstated behavior of the
  DL_FLAG_AUTOREMOVE_* flags.

- Skip creating a device link for a component that is the same device
  as the card.

 sound/soc/soc-core.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b8c9ddfc4490..ac9b2269c26e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2138,10 +2138,29 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	}
 }
 
+static void snd_soc_remove_device_links(struct snd_soc_card *card,
+					struct snd_soc_component *stop_at)
+{
+	struct snd_soc_component *component;
+
+	for_each_card_components(card, component) {
+		if (card->dev == component->dev)
+			continue;
+
+		device_link_remove(card->dev, component->dev);
+
+		if (component == stop_at)
+			return;
+	}
+}
+
 static void snd_soc_unbind_card(struct snd_soc_card *card)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
+
+		snd_soc_remove_device_links(card, NULL);
+
 		soc_cleanup_card_resources(card);
 	}
 }
@@ -2151,6 +2170,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	struct snd_soc_component *last_devlinked_component = NULL;
 	int ret;
 
 	snd_soc_card_mutex_lock_root(card);
@@ -2275,6 +2295,25 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		}
 	}
 
+	/*
+	 * Add device_link from card to component so that system_suspend
+	 * will be done in the correct order. The card must suspend first
+	 * to stop audio activity before the components suspend.
+	 */
+	for_each_card_components(card, component) {
+		if (card->dev == component->dev)
+			continue;
+
+		if (!device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
+			dev_warn(card->dev, "Failed to create device link to %s\n",
+				 dev_name(component->dev));
+			ret = -EINVAL;
+			goto probe_end;
+		}
+
+		last_devlinked_component = component;
+	}
+
 	ret = snd_soc_card_late_probe(card);
 	if (ret < 0)
 		goto probe_end;
@@ -2303,8 +2342,13 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 			pinctrl_pm_select_sleep_state(component->dev);
 
 probe_end:
-	if (ret < 0)
+	if (ret < 0) {
+		if (last_devlinked_component)
+			snd_soc_remove_device_links(card, last_devlinked_component);
+
 		soc_cleanup_card_resources(card);
+	}
+
 	if (ret == -EPROBE_DEFER) {
 		list_add(&card->list, &unbind_card_list);
 		ret = 0;
-- 
2.47.3

