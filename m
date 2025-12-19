Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17531B82E;
	Fri, 19 Dec 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139351; cv=fail; b=TWSYTEkzsTouy58D9enh56eTFcFy61UcSvGLhyWgYvrNM4rQJr2dB4Tt6KeNCMWK2ZLmB4YMNkc4sXfjSOd+MB+huL3V6cQD6JhYIBqquMyxoM85Ab1gW5G0bn3Z+XiJbn46favbqI8tGf6s7RyWXWTzTXFz8afm37eu+IeJuoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139351; c=relaxed/simple;
	bh=CNUI+HCyEvCjW3KOe8VRBAac7N81W63OHuNbvpFKYr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pFNMUjkp/IerZ6lnmTMhrn6PLR3MJC/z00w5kbLWUvJLKHH5obxjnKVt6P5jIoSKS4J5jV8gcSBQNen0Osk24xbGeoXUs0eKaBobTXIcNOwLtC582dgpEEVXeqeDYLWKZtRRCka/pBUmsWdYUplH5I5D5k9O/oLyXn+O83No0LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PKMcK9Uh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kV3Qu/wt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PKMcK9Uh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kV3Qu/wt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ7WJ4s1571970;
	Fri, 19 Dec 2025 04:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=X4vBclWBCrOZ1e1+
	l25NbH6KJyaCLP1mwgWCtGVOJB0=; b=PKMcK9UhgU/qYwv9RjQzwY/JLo/mSh17
	q3fgD7jjjkzOI5pDPoJ1skWX5DSuWG2+/zFv9jAi/P6Q2Q8DGnvMqzx09DmZvnCX
	87W0AxPsn1FEzSydP23kx+ViI8jEApOmIcnZrKrcHiqFohCu9f/nIDRWWgV4mO9n
	tZhQCOw/kaNGVunA5yGyU8WdXaIVeTk/acCMWJ2CktkdYbBN5JcXbh2VlYd2mEl7
	RwgEW9/C+jT/4shD5iSI+zHlU26lRECFd2a0EG3JadJj2c3n/YfCqgBa5oIMozSO
	bUqDmMFw3rhR18uHM2VKnBx/65dDFZDabjdr4ZuwL2CSxXR2MsdQUw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022103.outbound.protection.outlook.com [52.101.48.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b4r40gp3j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:03:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgNrQLBYl1oqunqE6BOjmzkU0LB5YNF2QyW0MyTlJbbnuh8KgErj2XtSQmgzzyiQmtcyy4rikuwh5teuVJ0+Y57DmW3HpBpehS4sR59DDuChKbteq1DKKdKalLWUeFSn94JaoeBvygb6wSVotLxBoXMYOhaSR7Jv3sPIYsSv96jo3UOauk5mdHOP9Nbuz3cpytqjXcGloOTOFrwmX+ugX81/1U6w8+l93STppuCi06LU5vZF3TWtC27YLCqyuBl7chVNVUNaCVNmudbmyd5NnF+cQtvrTXppKx2d8VPbx66FUe8HsLBVVTghPACxeWxqxDYiEN5tOc97xeVzG9Yi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4vBclWBCrOZ1e1+l25NbH6KJyaCLP1mwgWCtGVOJB0=;
 b=mUYeZkKRkccKFiNnk5TxFjfPqzHjT1/sp53kHRcDMQ5gKRHcy4ZQaZY+7J6VTTYdO/FZFRWDhRswLU3O7vwfVNI7JRQQBOn7EeI4DNO7ccmkkmr8Qk4rFu5X5SXvZ0+QcZS8F5sNGm/a8H26sN8b1Xe3BSF+HtF4/yPhFJ393JKzRrBOmlEgYgMqXboZXic5PDRpOXtnJdvTq4cPvqOAOw/2k82mgiiB7XPBhDe2R8Nco5uXYkvGVD0b8BIx+abN2B5ofjr1TElup/vR6ZP2q3NPpfBTuR+StcqJIWwHfkWyLN9HF2MtKeUeid/IMrGJT5mZbodDQc6lTv7b/ydXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4vBclWBCrOZ1e1+l25NbH6KJyaCLP1mwgWCtGVOJB0=;
 b=kV3Qu/wth4QAWkWqHcctx4CHdU8dP5Y88uoykWLaKSFiFy9PLpAa9xrqUPeGbKVPzRvhvKphNb91cWHCg0WhHW/s7DArxB+4L0v1RkOmlLnEmDD4zwYzj+PGGsRHZwQ8dW75hy/qjXwQODsMwbjUVejNTw1w51+2cLKgH8NwebU=
Received: from SJ0PR05CA0112.namprd05.prod.outlook.com (2603:10b6:a03:334::27)
 by PH7PR19MB5871.namprd19.prod.outlook.com (2603:10b6:510:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 10:03:02 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::7a) by SJ0PR05CA0112.outlook.office365.com
 (2603:10b6:a03:334::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Fri,
 19 Dec 2025 10:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 10:03:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 056C1406540;
	Fri, 19 Dec 2025 10:03:00 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6AF7820247;
	Fri, 19 Dec 2025 10:02:59 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 0/3] Add support for CS42L43B codec to CS42L43 driver
Date: Fri, 19 Dec 2025 10:01:52 +0000
Message-ID: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|PH7PR19MB5871:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86ac99f7-0f7d-4ad5-f99a-08de3ee5cb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hf8SnW+SjtyJS3myuswumia1T8xGwmw/0U0zzXftwovvXFHRiMJujq0KcFmS?=
 =?us-ascii?Q?d52ONW3Ls9mhEsQAScVw3B2zZVAqSGYFNjmqrkcyesAvdX3pJw8vrp4AbGKa?=
 =?us-ascii?Q?3kFDsPpSI4rX7WyZSFOxdg/gVTb1fKzxsKrJfXFLXYMfgYTtlLOxgXOfVA7s?=
 =?us-ascii?Q?CuEsDFy/6d8NOKdTgYazWsjEKnLH9fBlOAnArfUop/CFXwTTdbVGiAPzpO/s?=
 =?us-ascii?Q?1pmMDYcaerWv/69NcUIQ4eYK8PWlR+7ylGyALTL3RU/mHuYNJ4wjbd77uSwI?=
 =?us-ascii?Q?I6VjNQsj3HMbR2QZBbdw2QvmJSiIW1U820YG+1dYQ1HgihUZiXZ1y6dWjrbP?=
 =?us-ascii?Q?3rwMICPlG9I8Pau7pgO+zFLgxuU1mmV73zn0oT4eu4JT2cHMGSwVnjqm95Tr?=
 =?us-ascii?Q?DtlLThAIwUFQ/6r/ulNoNXhWq39+f2gBCUZ/gtpVgE6WpxPoRDPGHAyF/P56?=
 =?us-ascii?Q?ppNRpG0kQH/mbicxkSP8Qz1kvYUMKy6BHG6T9MDTUNRAtY2q0tIt2jnr6y5S?=
 =?us-ascii?Q?20Em1cdrJEBHpAqGCUexk5d9M6NZGr9vIm0V3bGyGNLG2+RYBbWcYzjNzLbn?=
 =?us-ascii?Q?RSGDIQGTlZqLubX/79TpXTkEYKZakXbm2iHvME/hvQTGFW+NoDUE0C1GBypB?=
 =?us-ascii?Q?7d/mpWx+WdjBOK9pDNGOxVYRtwtO2wKeVnxC4ZXjpWxJcCLWi+Ehlnxvj90j?=
 =?us-ascii?Q?lkC0FrovHvyBHGhHxIbLfcMHhtf4l8yB/WGEpiTRZQGe36C/aPUCpUzz+GnH?=
 =?us-ascii?Q?8x9gN6e+RizAKhJAuwkaj2hSH24gi7Fm4fdHOQcEbzqbMBLs16W1RJ5lFyUv?=
 =?us-ascii?Q?3dH1exaM9/nsxIZhm0HWPsF0RYsw8YW7dRE6+ftha4brqydlfkuAZcIhGylI?=
 =?us-ascii?Q?48ccrD41TyAwh3PATRHeAbTNXHGSY9rLLs4pk1xpyejAkxBt74A6SjgkwliV?=
 =?us-ascii?Q?o78QmLB3TP1erie2lhmCPCPHA+JOotT9U5dhk2snJqz0bLBe9GrCs+gu+wTF?=
 =?us-ascii?Q?JHMGrwDMlQrbNjt8UMdmrH5NjD5BcrmP8nesN0C64HlsbnwMI05KeqCf+YOZ?=
 =?us-ascii?Q?+WalKZ3D/CFA+DEPGlptUEMUjMubBlH/n3FrM9bi5fkDdR908HkvzcvDMHje?=
 =?us-ascii?Q?fsgeuaK6SYTjjyonO0U8gQflxtVzyVvX5HiEliYhT71joAGO+6v0uKo7mmDK?=
 =?us-ascii?Q?O+GY/+wQ5Ub8f/6nQirZRFcZTdrBwsQz4BhK8JqFxsUR9vyxafrKVTVvCFbq?=
 =?us-ascii?Q?mG/pvhZNDIb55iLVC4WGMZKFIz47uuImEpIwh8caVacTfJccOcpmk/NXUog/?=
 =?us-ascii?Q?Qi/lQmFrJetMW5Wmm5LbPLOXYLHJoVUjjWjOWvGU5hdIfuDuMXT31tkkefF0?=
 =?us-ascii?Q?GW+UnaQAWKaAXAc3H/MhW7VGB57HK6cqi/3ry3VUSaBsvcDaI8u5SzLN0Q5J?=
 =?us-ascii?Q?vJ/pGw75efuZjRvEQkVX4iqmxkq6xfzYI+Ap1SXkfKdAZKRA65N8kGzr4K+P?=
 =?us-ascii?Q?8LQfn9gqwjz13JNDynxViET6SW6ZAhhhGei7FPj5YQesSCc0RWbhad0ZQwiR?=
 =?us-ascii?Q?+j9Vt1S8q/w49mVsJHM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:03:01.2872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ac99f7-0f7d-4ad5-f99a-08de3ee5cb84
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5871
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX06MWxaes5cth
 wPWifZP+pA2q1HrlrNOpC4PoTB+fVRuQ5opNelO5EBw3x05nSbRgkf3MWK3skfWqKfPKGz7q8mR
 2f2Fa4DP+18Y0FHQFytI9JrrF/nPkX5/5V1LJ2bFTA2zMblWcMX1zTI9kAyDBWvPe578+zD05fO
 IkUMLUjPh3c1O9QeV7xXizSpSplDKp6cbZFwb6Eckqch5c4vPQwdnRFiVBbXwiazy/2mG6Xq5iJ
 z3cS7tFpKToaKj4oO/+YfnfRk+zqJFITohdkESeCUmsf7dQfCbhPvSQde+28V9Ul8piM1q2HQsY
 9c8VBaXDXJSIa0iMOAk805dcNETq3ExqDL1QLNjo+TrtmDujfXkoLaqcxv/jPKeyH9nXDMFGqVG
 gpXgrrVI2hA3KQ9QQOkhVIuLVVcr3vTPbheTjOM+6WVl7HEnzZufiUN2m4M/unC68IzHDhd44ac
 98qugUipxh1uQ8LmMRA==
X-Authority-Analysis: v=2.4 cv=K7Mv3iWI c=1 sm=1 tr=0 ts=694522d9 cx=c_pps
 a=i8qEvMrBxaw5Z1xwZgH5pQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0okJLSpZAEU_WkOkwZQA:9
X-Proofpoint-GUID: OkOdFkKhO_qnWKXyKkiK3YtZjh543in2
X-Proofpoint-ORIG-GUID: OkOdFkKhO_qnWKXyKkiK3YtZjh543in2
X-Proofpoint-Spam-Reason: safe

Hello,

Introducing CS42L43B, a variant of the CS42L43 codec with changes to
PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
ports and ISRCs, and can be supported by the existing CS42L43 driver
with some modifications.
Support is split into three commits:
 1. Add CS42L43B codec info to SoundWire utils
 2. MFD driver part 1/2
 3. ASoC codec driver part 2/2

Regards,
Maciej

Maciej Strozek (3):
  ASoC: sdw_utils: Add CS42L43B codec info
  mfd: cs42l43: Add support for the B variant
  ASoC: cs42l43: Add support for the B variant

 drivers/mfd/cs42l43-sdw.c           |   2 +
 drivers/mfd/cs42l43.c               |  70 ++-
 drivers/mfd/cs42l43.h               |   2 +-
 include/linux/mfd/cs42l43-regs.h    |  76 +++
 include/linux/mfd/cs42l43.h         |   1 +
 sound/soc/codecs/cs42l43.c          | 745 +++++++++++++++++++++++-----
 sound/soc/codecs/cs42l43.h          |   4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c |  54 ++
 8 files changed, 805 insertions(+), 149 deletions(-)

--
2.47.3

