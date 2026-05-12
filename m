Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9012E11C7;
	Tue, 12 May 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581896; cv=fail; b=NEqeKfKz5cK3g96tgw7rcLEZEpuqudkZx24lw3PUEwWGbKJ73RulkSECwrEL0fULpnE0XqBNsoCOep/89158Agj2IixEc+lmW3CsFEUvCG1Vs1fw/xjKJtJhK5UvsDcIQU1QFQlo9lxVoWMQ9AV6MTELFMkopJQiuWzuVcR4WlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581896; c=relaxed/simple;
	bh=P3srQoYfBigZldXPyFQhqfXEQLkkYQ2xOV+AZIDhKgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QK0dQmriPSJYoDiiNVtQxNWbWD7buoBd2E8boXGmNGu07FzkDbEepkRYGMGJxiqH9/FN3HiHChayXIARxMdqjWJ/wJjtDGuMJuu/cdR5LawqVsjqPbIV9WYfML17z3zngVTmbmKEFCjl7yzsAfdRJyOY54QsMh47kdP6mGuJuG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=azSlwKOp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NVTtS8rD; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="azSlwKOp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NVTtS8rD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4h1RR1491325;
	Tue, 12 May 2026 05:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=wiQeOoHZRFoH1Dvx
	kfS0W5lIzS7hwkiX9j7ZA0wn6Ug=; b=azSlwKOp1Fx31IbmpQ8KseKbOu+Qnh7n
	amzCSeKcHcM8JF0UpCNeGMcMJsRfyNkfQZwV+qz03LYiPbOaBoafNYruujJrmSDY
	vQXNVmYLDoYiXeO65HeBeyHH2LN1+RgCv9t0jPpFGlio8vG2j8dJIFlbPSkZ/OVv
	HZD9cPiy6LGXeqiRwJVY/WO+HV66hjEqrwCdNjT82uYQmyInTVxNAberYImc4IMV
	Rml1vpQoasOpoBjJLprp2cAbkbiDIgnrQcG6uFIvQRyRC0P7EDmhbsKltz+S15t9
	sHgrAXuha1yy/BItwLej7k7vbRREftVXHflzbx62a6gbu8IL9qfOQQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021079.outbound.protection.outlook.com [40.107.208.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r7m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWRZlhl8906CmS3ZXS3XESSUiHY+vOXRe2imyQDLkgR5I2v84mQY/boAHdY4uys+JlRXMVzf2ZhkwYhkslkMaDcEsRVQXysLN5SZk5PW+zdsPqXSX3DLCCHzvh4fwot2oQ5YaLxJRkebqJgfcfT2iDJrejAdiffdPXxdoWlojDfs3FT7ispqCh87dfWgbR0ONrYYjN5eJy4EEqDw0Nr443AHR558YsRnZ4dr4vuHXSvxEONOxkCBjBI04kn+Fz+OddlYZqSF8H+Z+GQlyIkZ5Vpp7HdtiMYg6zzzm2onzmhVZ3p+R/8RN9QP5KWVLdlNKhCFATC/6pdcmYS2IgGVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiQeOoHZRFoH1DvxkfS0W5lIzS7hwkiX9j7ZA0wn6Ug=;
 b=e5jLZhRG3pUhDWdch4x4yb59jehBlV5kUpqJsQlGi9kvt+zpOSj7TBGwVU6IA2h+zOD8iQUdLli5Er+eoUIKcFCzgttA5/JkeltVsi+zyfWfteJV1hn4tn+w/jr7ZMf/W9Ghh1zpq0s5YSJOwtAnLpOOP38erYV0+eaWyJql1mUTBdeJvz/RjGOs/8G/lrXMDl1bN2pH1BE8A9/cnJWbTS+dTMXCDOP/CTwiIPLSkmBc7dSHd7zxxyGZPA6OPycbsk/as36/xqBjxWppBVT+9ZCfZsl3Km/dyhJo2xFhlBrCm5rjc7/YvCW0iJqTW0UiqwW5p7xKyOW1Z+bnFVAD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiQeOoHZRFoH1DvxkfS0W5lIzS7hwkiX9j7ZA0wn6Ug=;
 b=NVTtS8rDjI3PGoaVZL1Rxb0F+ub6r+SKZH5fL531Y07CtG+AAiHoXdqQsB2PPl57gBb3/o0cvHcwS0ok7yK28o6BjLafyWGbhO+9foMgcZcpVqD23yjEB2eCwn73cocNY0MCCj6YITXvX6vnohtBVxUaoTsAJzYyFXcUN9gh2z4=
Received: from DS7PR03CA0357.namprd03.prod.outlook.com (2603:10b6:8:55::10) by
 SA1PR19MB6989.namprd19.prod.outlook.com (2603:10b6:806:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:31:04 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::6b) by DS7PR03CA0357.outlook.office365.com
 (2603:10b6:8:55::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 10:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:31:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3FB5B40654F;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 268C4820244;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 00/18] Add a new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:04 +0100
Message-ID: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SA1PR19MB6989:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 18fa518d-dd71-48b4-789d-08deb0119171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|16102099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Qp7jKaUNdH/xQXmYNio53nz2+/UuChDNtCEbVz5V/y1xMf4MVM+NZ1UgJSzo67iSdJUvWbCtJ4V6z7x7c1caPVhzE/dUpUsyuD2/JZW2Y8jnKP9k1ZpwffXGGHeW3e6gb9wGiQdyRBL7l375dAYrn+CDiYD5WC4FfiwiGlDZFDc0oUPGFB688pewCYR9HmZS5uj9TLOMGAePEqyRsVVyjj1aDm9T0OnrRWGLp2HWrWBDfknadBxP3oLn9eJPqLgFU41EghNCkXIUJL2grv7XwaKoTj7Ixo1UbahzHQ+vNnXGRiV+0Y6HJFzgz2Ax1o2byXps1cW+BxqexGL4k98em1LBKcUJF+DEXN8JggjCm0mCkJoDi/VU7gy9Fe6kQlv5vtyacNkfufUPA0mZm8U35PoQ34GNmLMiBpEiqDP4LGXdmEgZZu4I5VAmB2Dj0YzZR8/ebTirHpI+UB8MYIcQFjaJKsPqX7WuQ+DD1i/ZQC6Rc4dNleCiLm/BUKTrhC867s91qUORpKg6N6CQQStQXYFUH0QFv/jEqjqsMEKdhmbTyYwJY1doy+OL02Q+3/mkmihYvhrtzDh4Ghi4a1cmkDMZObRKVqRMK0HipTlKeJ/YvAPRvA1zPJ+FrDAfq+zKOojPgg2S/6oy4/D4+slJgxUAyhtULL74TeARMiRgUQSL7+0oZAkxIyseFfGiigoov/vtcw9vXoCvn9nclg+xZy4pMZD+E62uwizpmwD61jk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(16102099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	333FoOKROmcbG+iCIwibb+Yi2IIECrYvTE9Ks0XDMuGpEeFEXBVSwGCAa3hmv06wMpsFSsiYOBOspY8AIfIun7B1Ch2O8fhNxK5wnqYmBWC0SoI1aRwQynsnr6h/XTKhgyWbHBZqRW+9tGvwE2NwOUKBLFF25liGij9YoHZPkv7s6bYX75RtSyZPGrGUhW/JAkhpeFGfiC6xfSaRqmqbOpJRr4AVJfznFfVLi26/ULsGGXNcTYbKUZAKb+CvYApQUmFnWEbLD+PMKoq3I2MyEa7m8EG211xbHldGxtsb1BeP7SyjW/9/JfD4ibjS+ZwYUnZ5JHPEq8LgVzlWWzUAtHrEq0pmmZYPHHHd4w7pZNfLro//NfW1HRVCKe0mhl9SaYnQjrEaATt240S3WyY2/o6xpdn7MptiekYuAi0uD0hYIjiuDlC4QpHD10Aqa5U0
X-Exchange-RoutingPolicyChecked:
	cIlE1tGUT/y8mh5x1O47YLZqSl2FcfUo0FHZ2iVmJrG8aFZGFCWwH7mp3gXwS/5vyWuVe/A8gokZuWH36wJa0nrvdG0eQiI3RcAZIYbLCZ1jTSmWTQ45nFgyhzt0jAtTVsYwirkQbaeHdy8PGmuz9rPYrImsyMrgPpkdrHNIJOXrom70nbsvQYMPSF3u3yuF9I0f2jdfbz0fSYkBjJAFjVnXXG/2m5yvSORlOx7NV0BxZJ1qeOTG3xFG8RPx5yALO54E1GR8GsTS/9VdUKls7bk/qTxyS+IwSDIaH+xUgCW82kvg54DFEFcYJmC4KF9r0PG+BuZO9jiZ0X4DhQ3fUw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:03.1945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fa518d-dd71-48b4-789d-08deb0119171
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6989
X-Proofpoint-GUID: ocrqcGNctMmuvR7zzg_yQYWtJROvjv-Z
X-Proofpoint-ORIG-GUID: ocrqcGNctMmuvR7zzg_yQYWtJROvjv-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX0OsyHlF9n46w
 V0c9Mga2yqwChBolYViPCmyjPXlhh/FQhc1JtAF+7GBpwbwSywNrWb/Rtz4nFqtQHhWsuNzGbSJ
 BXu+tDjFCML3g7p5v6MaGrXCKPDE9EYfjk3XkXEipab+pNMShjolvtK2YLJSNZW/lm2Op4HQmuu
 Fc2t8YttjXRIotNC0GSYR+6q83fh36V9AJeIZQlKea3il99eXTf7jqi2Rkr3xijF0APEIb0QXu7
 WKcveKY9LOCfJUS1vfEvNLKJDmtC0u9odD0Qs+N2Xu9YxWYYbdIgFjcRAndkUFW9iunZwqWm2vY
 2328Kige/d1ZrKrKN7Z3VRX5/z1uD3XRK/0lrpcvInCF2+GX7I7MgvhxhusIriodOxxLDDQrYbo
 QB4tucnj1g+tLomT7r7LZO5kz7tqKxACqdzhoMjrDWZwuSCd4fnBtserxuyY2HL+o01FqJTgoe1
 XQTolewAQ+NgVz6pafw==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a03016c cx=c_pps
 a=OrhHz3+zTO+bBwkwaozMtA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=HNrqoTSzVZCeD2jvaq8A:9
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

Changes since v2:
 - Corrected timeout_us to timeout_ms

Changes since v3:
 - Actually fix kernel doc

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

