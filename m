Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9038C2D1;
	Tue,  5 May 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999729; cv=fail; b=TZloXDCct0lkHzhz/5+BX8qslw5d2DTolJuaBe/2rzMB6wqx2Py7NJ/nWtwFscUoD7Nc9/92poi/RKJZ64Hs99jBwLgL9DqOYJ8s0du+8Zi5msqrCjjyIMlIV2c62/5MpONmmgD/0+uHyekFL+5X+G4SPYp0Jx9dUbJ5cJ4pfI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999729; c=relaxed/simple;
	bh=COB4q3jVAKQvEwu5QaFz/pCs736wt37XY5M6jtULPzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fsgp8Um8JunIDBcjV37swE1Nh90fZmFuVAOsn3WGpcU4V/B+JCAJzHfGKs8uIEBxXkMQrAc0ya597QDWknDB+iiFRZZXsa5wWQfZnLCK8Z6r67mYF3hLdApFd5J1S3bvMykIIqGeqqrGuV1fJp9kIPKz6Mt88q63P/A8HYNzrOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FVMXQv+l; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pMAdkzLk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FVMXQv+l";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pMAdkzLk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rf3h1749983;
	Tue, 5 May 2026 11:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=YYBWDoqF9v+fWrhB
	6NfOAcIi0kY306LwrmHbl6Kr5w0=; b=FVMXQv+lRPM6wNnexZ59VztJ0AWbVVlY
	w+fIQ0fDOwzc+wHSXLjFs4YdeXk7SwhcYBwOCBc8Sx4Pg+qyWirW6zk15bt3q5UH
	ouVcwrMuT7S3cZb/juEfcg+mTppD37+8K2E6G6YAeMLyV5B6/+aj4Jb/AJGF3V3w
	4HYARoMnoUDRSDUvbqBOrZooBaxf2ITi961a5yht0zTLB4n6pgsHsgh2j7S29pCq
	NLR1bxOHOqD+M8G0yM2MwWInm0Wx4Hu69j98w7d8hg+O61KaBvbASeSOVUGYNdlJ
	7D7LJap4tianxxsmXOFy7ArC7OEk2J9+MGhUUl4gJAcOEmcUtjkYnw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023114.outbound.protection.outlook.com [40.93.201.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvp9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRExNgI4CxNpfWk/wI2aa17URzR0iWGcs79ndzeGdr4R4qlpXDl7bR2LTp/g3V5eE/WhjQ1D0tPUL8lcVSoMQb6HlcHQzsoEC9RgJg3q4KFfOZNiPG8/3PDsk2OWy43JHYGxxU2H1BT26nbwTSPshIX/n+w4WACPyzQLAguELFOmrxdZar4I9dTt22f/MKQ4T/PzyO+4Oqji9F2FUQhKdRtKAnUw0B8NVqKyuN0W5cwBqzwMCttsIWZc+kvZThSext6tEF0OM9jILHsfS9g150fiaHId/OheN5n3yjMdhkNtLpOOunlBnUiWw2bzkkwmuJFmxXBugm9JECHQrbHQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYBWDoqF9v+fWrhB6NfOAcIi0kY306LwrmHbl6Kr5w0=;
 b=RzidvuLdAB+5Jiajfi0VZi8QN7xn1xVLaC+udhlov/YJaly26V4H3iBf5kRzUkTMrwXRoBqOzjEZyN53IeUrCzgbikdlZKI7daKXoatQ+87j/n3e11tqmXsjjAc0PFNpGd+OKuqz/RBC2h2MJQW4As3+KVaJOywRKzdM4UMp5kNYFDuQEHCaEfWkY69B4vNcNuaqo0KLVNnFDk0R7tlpkLb8/167MTF2VziGd+0ZvVLpSiku2bZ8GKaVWIK0pqA7Wt5r9LPQ6DRWxp1N99H4r2Bu16ipDfMjO7Ois9mGZDv4AoLaFzPTJDyvF9fJXuOUJKa2C/fk9nt8QcOI6c8mSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYBWDoqF9v+fWrhB6NfOAcIi0kY306LwrmHbl6Kr5w0=;
 b=pMAdkzLk3jgfej25F2cEbwAKyIeSOw8vq0i/fVy6zF0PUyahCRXrS6nyHckQ2xs0qS1SsQVPBSEoGI0SxZLJPl0MHp6aNIo3GQI/CjEhyYJhBqjgSdW0at4tSz+962CAxxne5Zxs9bMkZBNWB0YvAYBVko9lWHUk1Ba7hpeVjI4=
Received: from CY5PR22CA0095.namprd22.prod.outlook.com (2603:10b6:930:65::13)
 by IA1PR19MB8938.namprd19.prod.outlook.com (2603:10b6:208:59a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:13 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:930:65:cafe::67) by CY5PR22CA0095.outlook.office365.com
 (2603:10b6:930:65::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 14DAE406550;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E0A3682024A;
	Tue,  5 May 2026 16:48:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 00/17] Add a new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:50 +0100
Message-ID: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|IA1PR19MB8938:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 740682a7-d49d-4264-1045-08deaac618c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|61400799027|82310400026|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BOkE4zjKazzUUOAlE+8PzQUSpMI45rBM4mAxO2ZQg94s6DZourcCyFA6F/DWkFprTWwTCX8pZVqU+XxEyFqHBhwkvPutCqtxsKvc4mI0M7+nRGHR4IMCz/qNhGBnSnlvDK9betoNRdLHqfu2zJeAWkqcNF9pB2Vlxol5I04dBLZXhNXwdnV4hv5VckhbR9AJNYzVth6xvEgzUBkI734+VhM42A2ct9+K/OFlsb+AIEH5abdRdQ87Qz4J3IMbOkH0B42YxKhulMZfsiwgbYuYCW+dxPWDM32ZvXXPD1cLukChjrNsbtIADp8Ab7YXC7S8UwY0ImyRuy/bQrNmzA3GG4neNA066sWvFOpVFfCDmGi4Hz5I7bebSIIadqdDcm+P5t3DYyXV4eB7HTFTe1B/PyWyc67K8C9IXfXqvl8S7oi7iM10d7SWK3i1UqqzayTpct3m9soB57ae+VhX76pys0i1B/03E8JOAVB4py0NnU7S6bgggMDwo2sgd8mkSxkRyDBQc8c6VjGlX4afMfp12ALpYvJtttvj4uWq0ZuJFf3e2r+wjA87wAfIb4RA2FuRC/tnHUGOIRffB3nyIsEmzdqIE1z1wcIEhMwdFF8lmljDSISpicsJRmsTE7spVEnLrBxDndBFiRT5iKIKhsNlxzMbDebx0Wu/QVHRLvyE/yI7Y5gt4M9UZOBj4WjlXT+F/CsUBRZ9lFhR/SN4jjRA72exn2x/tilwDb8rJYkVyF0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(61400799027)(82310400026)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JN29TjTjZU1cWgeIW8Z8Mm0cfrFpUKIh9A27gUzu6AOm7Zo7ODoQvglW1H1YiDbhucXHmSkI7qkBs1zb3U/80BWNZovqiQ+Z0oN7thiAhKIMg1WDuFGTWPEQGU7QyCv8l5+Vn6ERi93hdMMK6REXMXsINbdW4iGZR2XRBTsUt4Mu7BTF0Go0qkaM4ReXF6GXH9W1bdXb33/IFDTz2KcpReIecSM+6xSoJ5Z8aSgwcY2Cp2u1i3qNXsnm5YChfsGfU7guwIh4owltHS/08Dj6DWvFw6IcBm0gkZ5sMwWSJ1HIML2+6XMZHUMXlg98yfkrNSZbBZjLQ8Fc0do7ainoxbZgMCYBziBOpKxyZfCYPMZM0AV6Hxv2CyPIFYDfsyn/wTmC5ULTBwklddOJHMeBjlBB6VoA3GpqYBTd50lgjpgW8kVe/+hUp2DMZ8mX2T0O
X-Exchange-RoutingPolicyChecked:
	MaWVylakajFYkog/IIcHtHnZazWiZMfSJXb7+75ACSI7fp8q6O8R8yyEWzBiUHgo7ZxHt/DbOFVZtlhRiTi7PoYZW6sAQXt/sOTDtBr97dS1nsghjhs/rcdqGwYfCBXjLcWjRg79KlBe7owBPSGwD6wzQyXESFTKdctMdET4cgS/digHx/azXcVd39au0LW6N1jbS8+jeiePVsD30zkbD1kqKzEXrw9QLrlaDsLjdhldBtCVAIghjwza/9Nx2Aj9mjTVXawoWNLgcqV0F/hcv9TP1zcM8PJ0PfsYZPQn2IrhEZ9LKaqmR4DTM3WrwPprTtXVnNo54DEjpFKKZY3+QA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:12.5972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740682a7-d49d-4264-1045-08deaac618c1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8938
X-Proofpoint-ORIG-GUID: znPdBqCWzIMkXuJUpvAdSYSIMxe0D8lL
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f51 cx=c_pps
 a=1bfLZ9IPuZA5gEd22F+xnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=UOt3nYiVEwz-XHsqM48A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfXzb6KpkGJdsZ5
 tgolj/aBIgQHJWasz8ddVytKo/CJUpLBI+d1hvZ6DjHSRAygllIjbhxz+bYM1Z9nnDl0dNBAjil
 8Nay3SLclQYiNMnGHfs8ris6UtKMbJnbGQCmzAr6FVw8+OfVZOVuWhDSXdf20T6yyW5L17CLXhB
 PpEjTeOyi0ktX5khpeZVyuouMuLI3gQIEC0PNEGKpDIJb+bUIM13Cor3zUIRlCH25iVmfCnS+09
 bgQO8twDbUNwn2R+ZC3MZyecJ06Kz8TEstSZYZVAifcAy2VIY0Tg+E8Bl79vB4zcshRdxKh9EgV
 gNO+7QwwUiAUybFgZYtM6E1hJlXxjp7gdKlENnnqlRu7LsMxFU00pjyNS5jWJo3mhOUbaRQkPYs
 NQ1PeZGAXrglfGqUh5E1JoEpbncHHZYCRBAxw18U2PQxre2A6KcTA4XIluz2J+RjeOm3XP3v8S8
 e7g1gx1KL+tvrDe9soQ==
X-Proofpoint-GUID: znPdBqCWzIMkXuJUpvAdSYSIMxe0D8lL
X-Proofpoint-Spam-Reason: safe

Add a new SoundWire enumeration helper function, many drivers have
almost identical code in runtime resume so it makes sense to move this
to the core.

It is worth noting this is really step one of a larger process, there
are a few drivers that do more custom things and are not covered by this
series. But this series picks up the low hanging fruit and moves things
in a good direction.

The next step is to look at drivers that also wait at probe time, where
the unattached_request flag is not going to be valid.

Thanks,
Charles

Charles Keepax (17):
  soundwire: Add a helper function to wait for device initialisation
  ASoC: cs42l42: Use new SoundWire enumeration helper
  ASoC: max98363: Use new SoundWire enumeration helper
  ASoC: max98373: Use new SoundWire enumeration helper
  ASoC: rt700: Use new SoundWire enumeration helper
  ASoC: rt711: Use new SoundWire enumeration helper
  ASoC: rt712: Use new SoundWire enumeration helper
  ASoC: rt715: Use new SoundWire enumeration helper
  ASoc: rt721: Use new SoundWire enumeration helper
  ASoC: rt722: Use new SoundWire enumeration helper
  ASoC: rt1017: Use new SoundWire enumeration helper
  ASoC: rt1308: Use new SoundWire enumeration helper
  ASoC: rt1316: Use new SoundWire enumeration helper
  ASoC: rt1318: Use new SoundWire enumeration helper
  ASoC: rt1320: Use new SoundWire enumeration helper
  ASoC: rt5682: Use new SoundWire enumeration helper
  ASoC: tas2783: Use new SoundWire enumeration helper

 drivers/soundwire/bus.c            | 21 +++++++++++++++++++++
 include/linux/soundwire/sdw.h      |  2 ++
 sound/soc/codecs/cs42l42-sdw.c     | 15 ++++-----------
 sound/soc/codecs/max98363.c        | 17 ++++-------------
 sound/soc/codecs/max98373-sdw.c    | 18 ++++--------------
 sound/soc/codecs/rt1017-sdca-sdw.c | 18 ++++--------------
 sound/soc/codecs/rt1308-sdw.c      | 18 ++++--------------
 sound/soc/codecs/rt1316-sdw.c      | 18 ++++--------------
 sound/soc/codecs/rt1318-sdw.c      | 16 ++++------------
 sound/soc/codecs/rt1320-sdw.c      | 16 ++++------------
 sound/soc/codecs/rt5682-sdw.c      | 16 ++++------------
 sound/soc/codecs/rt700-sdw.c       | 18 ++++--------------
 sound/soc/codecs/rt711-sdca-sdw.c  | 16 ++++------------
 sound/soc/codecs/rt711-sdw.c       | 14 ++++----------
 sound/soc/codecs/rt712-sdca-dmic.c | 19 ++++---------------
 sound/soc/codecs/rt712-sdca-sdw.c  | 16 ++++------------
 sound/soc/codecs/rt715-sdca-sdw.c  | 18 ++++--------------
 sound/soc/codecs/rt715-sdw.c       | 18 ++++--------------
 sound/soc/codecs/rt721-sdca-sdw.c  | 16 ++++------------
 sound/soc/codecs/rt722-sdca-sdw.c  | 16 ++++------------
 sound/soc/codecs/tas2783-sdw.c     | 18 ++++--------------
 21 files changed, 99 insertions(+), 245 deletions(-)

-- 
2.47.3

