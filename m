Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A93FE365;
	Mon, 11 May 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508684; cv=fail; b=F4XCMvUl+k7TnspJM1ttBITWeHpSndOU8l5jdaevXu5kzhIts5WwBPEi3xoS2LLuQXaAlghVPUgUkNem8yKtmcpDv/+t1G+7lfMfxzpAt+o5YqQA98QTCzrYxaC8dMOLzEdKxXPPoht8squ5nxxl0HjNVMYl+cSQgy987Q4njPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508684; c=relaxed/simple;
	bh=0bTlvNiK1hPbAzF81UVZY+27VumW0l3zvcfgexbLZc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nsl+eoRgxHktm0K9kxtmOSz09jTCkqn3bpgj2B8VE324VBW7JoZr1CL4NgnbVDZz/noShyGyrbiu01/a95TJPwqXW5Cqn5ZfOObPaJouInFeDZcohHliChsjn4uLuUjXrZmkAid3UB83HM9Qr7RP7O0JoRprlSLeSVqpojZ1G1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qOiZGQrv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k4tnULUa; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qOiZGQrv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k4tnULUa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6FugW3500451;
	Mon, 11 May 2026 09:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=s3eMAYYTKEER0Q2W
	+C8ljE64uA8wcLn2YNEm2jvqEjs=; b=qOiZGQrvNdzigl+CpnkJO0ODhUowbmZp
	+snE2Jmj6KE5qt5eram8D8SEkxd2R0KiM+1APEgZnuvo71qW+tLReiMpSDZslkwf
	wvyAfDojIZEge4Ggw0Aph7r+jinFrF8V5NjoM2JKNIlPMejkry9rAd7YbggKflkI
	f2SX3i0mrZ69N8L7CWZjTXBUYTWdFxkkyKVWh2thQ16/RU2RaVALzgc/njQriLTD
	seOUFAY66jlgzzo7ATkb+WA5Fd1Htgrq+4HfYb2wQB7k5UY9RioJ1lSTRS+IQjUu
	C5z0+L9j81NUwiFTsv9ec/zMqmryaTmE5EO1HpKfeYqOkiKo+ZH+6A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022088.outbound.protection.outlook.com [52.101.48.88])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3tp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wapF9Li8L3qmsAFKmLYcWxXymGKreZwzpiqXgYp/se8bPyJw+6A1VG/GLFc1EshlL5/gRJntwQTbyHZE1PuilIRCGN4oIMZakV9MFHhtWeYRsHBhU/qPNsYayrbIQ4KO3eaHoHkpkKdJb7xZ7Jl44P0GXG+9fQXBtMDQxxBgoyl6f4LWAfLCB0kaM4og2yUaCkAHUp/+FA+WggEatb18i+7dRdlbh9fpEiIHu0NOe8n3jrf1ANVo0NfYijOvkPGsLVAONmYPAH/GjZAdnk7RVUwRvRPIMad2NGSCE9Bqc9n9AzcpCxDZH2pqSEBZ7HeQVUeEaAkVsx22aTRdTlulMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3eMAYYTKEER0Q2W+C8ljE64uA8wcLn2YNEm2jvqEjs=;
 b=e8uCk1arNnhS99sgk0k0408eTcL5UmJasDndPlt/fUAeNMukRxwGtWxvCjdxYbg6gxsVWu03R7s1qRI6qgAjOvJSP5b0HmvMCp4Kz8nRLPyhU5M6jV8UfgROe9oKu7/mlp7Nf/WIAu2En6QclrefZpvR9aANcaUCZpwgtY6aVk6FIV0Vzf1W+wwvjWh65+jCwmW+Yaq/CJwFktrx+FYUtmWSEZv3RLbIryTFpKOJxuKup4q6WPeSdGt45IBzKZwqHU0TxLgk9JcKBe/+S7D/fxDpxS284G7htJjpvNW0n7U+9Fg6LlejJNE7VBu0dBWl7cS4Ra7nDG9puh33EMhw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3eMAYYTKEER0Q2W+C8ljE64uA8wcLn2YNEm2jvqEjs=;
 b=k4tnULUappGaYPRaIEk9csI88wRpifOPXP7Z7wW/iRFp8L4zny8gdvXSNCjPrlG/zvALCRFWwzEqe0W+tEOoV+r9XO8Njec0vLRm7SDgX8cj2mmr7JRKfVETxkmiUUzisTleiygK3I39zYO/B/ATpFTpdbO0ulWELYzP4d0fwwA=
Received: from BLAPR03CA0174.namprd03.prod.outlook.com (2603:10b6:208:32f::11)
 by PH7PR19MB5845.namprd19.prod.outlook.com (2603:10b6:510:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:35 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:32f:cafe::e6) by BLAPR03CA0174.outlook.office365.com
 (2603:10b6:208:32f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 614A340654F;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3A83482024A;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 00/18] Add a new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:11 +0100
Message-ID: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH7PR19MB5845:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b0cff312-2d42-4092-dc45-08deaf6711a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|11063799003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	swfGYaC2+KqtxZ2XsIhK3Xlo7QAasN2EUQh8tImnjoB1Szq4ACz08YwRAZZDAJj9bVPpmhBd9F308qUOMq53UAoMKOzYjF3kTAfEOuueabXjTGjKW9jnGWRMGZNiXJLK2gMIWzoQSNxgXdOKQjdn1Y1/Um18GiUzM4ZbmJ4iDJN+6W6PHDC0EQaD1FgHgKp+DnnKFWz4QUufU2tgNIyWckogmwnrJKqZxMBv1ZV1uhUZ/PBiek8KBMGQ6najX913epZuNq+G/OOdlMRjJUWvOSQEkl6mJ0fZeHaB+0OZIl+NlfJC2CRCH/9SU4kquhGr/nbmF64/a2vISQfe3I2/WyuDYZZw/XFm1rsNw5H7nxTPyZGhXk78+1udhV+UwxzOSJCZgSIRTGbev7YeFoJiYk2eNcC/QknqM2ecA3DtFumV5BwsfmwVoGUpgkMOdge9/Y43zyAWPPrOmlTDuOpZkBdyoobRiBqa2sJF4B0OVVxJ8RHG3hpsVIzTQIc9L8onDw2gbVNrkg64OxwOGTcQSb4g5r8sFQlx8B0P47mDTNZlnIufze04borjEgvuye8VtUmo45/2pKEPgQeaE5CDeULwOGp0YEKD87rhrpvWCU/lLl0n+RHl4P1xM1vjcxuLcNwbW5LN6LlSm4NoKve39V5GBCKSLpuiPeSt9V8Bd9WrnLgtgY7l3tAn16SFsLFRAD2LL5Lwfwyj1pmhx8H/IXe1o2G7dnxF3c5CNaGI1nU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(11063799003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xn/1UOE7BfIL48QUIWzdturOiNhL50M8Ed/9m17qiMEcisKXQJqMk+hUb7siJXp8iU4X9t8RBnZujtAmQsz7cTNzp/xBQFBx5+EaEz9yyXWUXhOLDfGKh2fZjTRPjWwZecNgrEdGEo1d4m0DOpsIptQ3j9zqKJ8asleBONeHLm01DnUFAFqMcX2S8xNW7JV9VXkMqx2nk8rZA49AYIAl20VHtzhQNPzU+Q2yX26HGVw5Y+4WX77EfQkiRHuBS1S6LlPPdkUv7UyqZVHM3j/Bl2yPgKDSjxvKxe3Sk3z/8BebYMGDXRMLkAuixCIF9yoOi0dyRvKbHU1ZGpUGr5LI2UuCyS2W6eOfdP3f0O67T7dfMlmIX5Vh5zQlTPxgZnemt8ArV+g+DVYMM4NBkp0WA/2Vvg9fmMl9q9sbHQs3bNPVXP8T/nwOX9w34dWDvkXJ
X-Exchange-RoutingPolicyChecked:
	n1WzheN6SFqhgZg2FShEej42jUOHD9EaJTHA4lgJNxQxqVJ1OY38BxOiTVjgUkcY4uS+7W7UcmLHV82YLK+RdbCejfJyAaLJnFNay+zuXWTqYLYPDPMhexqmJzpQZLo7Djtma8OEXlKpLcjnSyCdXHeCSoi7PaCMjWM2RZBlkoDl2Ywjdy261imdccX5zXLegHYXJ5HKOy3Lmu3AcI98lk8jVcraIuUd/k95Iy9vZlZe+UmbZ8Ex0yPbCC3Cj2Ae3bMN8EvJFZgyMxIo8kiD2YZA2JN1RfyUJ4wRetPweX3Mobll3wgK17IILYSSx/nYY0iLszdkt41gLQKKgG9y7A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:34.3706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cff312-2d42-4092-dc45-08deaf6711a6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5845
X-Proofpoint-GUID: Q0AmWB4zdluBi1Wfu-LdgulCbDzFR3j1
X-Proofpoint-ORIG-GUID: Q0AmWB4zdluBi1Wfu-LdgulCbDzFR3j1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX7QbJ3HOjv2yV
 w8XyLcwiq5x5CNf6QI/8gjnpKMUv5NvvZLrhdk2LWu/2DW7HeNcPiKXH2CNR3F+9mTKMmqBPDDi
 kLncNTvBcymZEZcw8Xg0+3V5Hv4HC8UbAHmIc0ZZFlpjeYk4r9KTM4wDGilv3O8Leij09HlKAc6
 9feD3WR9mYcpU4xLAiAXtZl6rVpSJvuQKBslo3g2Fr63WJGcsWaWsJNoAfa9WIh5RhBEohWsarx
 l7PqodU2m0mGiOGE/Iy/iNqzlZ5MjgKd8j8nwyShPQpdeYRGmyeHtVjD2mpp7uIady9BYGgw8oT
 BRQfef4VTIFAWPvs7dXRloLfOFKbhNUEGZVwgChfctXm/6duLjBp6F9Mk+CENsGqvuKpddL6Lqd
 a4qrN5PYEIxn3/KF8+pYsj3BV87kESVnBFnTn7r7/gYo93lnpE7Xau87nY6d+eGO0Om/xHsJI4J
 50Pt/VUh6nsJKHwl+7g==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e360 cx=c_pps
 a=ZGAc2tUwQiKATRTQ5PWD3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=AitDDkw-LS6fflpn1IkA:9
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

Changes since v1:
 - Add a stub for sdw_slave_wait_for_init()
 - Add kerneldoc for sdw_slave_wait_for_init()
 - Update cs35l56 as well
 - Correct bug in the update of cs42l42

Charles Keepax (18):
  soundwire: Add a helper function to wait for device initialisation
  ASoC: cs35l56: Use new SoundWire enumeration helper
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

 drivers/soundwire/bus.c            | 31 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h      |  8 ++++++++
 sound/soc/codecs/cs35l56-sdw.c     | 10 ++++------
 sound/soc/codecs/cs42l42-sdw.c     | 11 ++++-------
 sound/soc/codecs/max98363.c        | 17 ++++------------
 sound/soc/codecs/max98373-sdw.c    | 18 ++++-------------
 sound/soc/codecs/rt1017-sdca-sdw.c | 18 ++++-------------
 sound/soc/codecs/rt1308-sdw.c      | 18 ++++-------------
 sound/soc/codecs/rt1316-sdw.c      | 18 ++++-------------
 sound/soc/codecs/rt1318-sdw.c      | 16 ++++-----------
 sound/soc/codecs/rt1320-sdw.c      | 16 ++++-----------
 sound/soc/codecs/rt5682-sdw.c      | 16 ++++-----------
 sound/soc/codecs/rt700-sdw.c       | 18 ++++-------------
 sound/soc/codecs/rt711-sdca-sdw.c  | 16 ++++-----------
 sound/soc/codecs/rt711-sdw.c       | 14 ++++----------
 sound/soc/codecs/rt712-sdca-dmic.c | 19 ++++--------------
 sound/soc/codecs/rt712-sdca-sdw.c  | 16 ++++-----------
 sound/soc/codecs/rt715-sdca-sdw.c  | 18 ++++-------------
 sound/soc/codecs/rt715-sdw.c       | 18 ++++-------------
 sound/soc/codecs/rt721-sdca-sdw.c  | 16 ++++-----------
 sound/soc/codecs/rt722-sdca-sdw.c  | 16 ++++-----------
 sound/soc/codecs/tas2783-sdw.c     | 18 ++++-------------
 22 files changed, 119 insertions(+), 247 deletions(-)

-- 
2.47.3

