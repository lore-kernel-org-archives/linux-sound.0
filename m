Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F004C77CB;
	Tue, 12 May 2026 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580874; cv=fail; b=bIXzBhcN9Elqtlq4+b7S5RnUKgFrjqZR+mtCuC70HIG5hJoddBTMzh75JqdU8XaN4RmnuQrJUI7PjUAaCbkv/o/wT4bsB2zBhpINuahVcGQFEvaKPVBQm8UAA8mTzQhPGKc7OAOYSXTIL+0d1LRHmfpmfN61HRHJC7pS5T4uYOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580874; c=relaxed/simple;
	bh=v581YHuFN4mooY7+0WCaP54VnxMF8gCvNl2VS695rRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GLnnPODJATTIvwPOUH53eo9Is6wMEcS6Ya143iC9gwX+jk4Th/j14cDrgmCtCv0/KnDvOrbVrJvejr0KUnjQX41vqdePMtjiTZlmoJo7EN0+6e3IHAsMFUggBntP4Nayssy6sGQtQyAZ7vjTO1Gd02BHLqK+r2QlYyjweSQh2gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZcdWVevs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ay1EhXXX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZcdWVevs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ay1EhXXX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpmk1493060;
	Tue, 12 May 2026 05:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=T9wU103BP9XE/X33
	sTxXc466aNTqCtMsqQfMflLyVYs=; b=ZcdWVevseejOg7Na9paSSuWUgR7tJstH
	6K2UJohI1hApUGxtu1lxAMhxNyscXXSXDNx11Lwu5UU8ScDYZR++EEUE4sCNUcCi
	cyQwFa/iFDMd+LcTBqLVqjGDVLUh3AaHkFIXUIMomHCqxAol98voYV1YK/OuDTZc
	mYy4RnwIIw8zOZiIVMoPTC3fT/sywPhw9hFmcxvb8fuOBdxHm4SN/mkkc57unjtv
	t0tsJ/K9ZDTCr8xM/IcJFkpDXOWH8g35/pmHXAx87Xw81YIwyfn/+JI7dSarWiMe
	luc6nnssp+4J5SVCBgdxvLUVe65pzQPQs7lHzEzuB6CKAj1Pol3x6A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022091.outbound.protection.outlook.com [52.101.48.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q88-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wogF/WlPIZDhxi+EvuvQn0TiFSX1EFADpJI4o2JTXnWwjNsDUJXO8ER1T6VFPRjYKM3agPxcONqBSdmPqyCiF10esic++zTO8LRmbXvGfatmSO+bzlCGoUjrUinUoD3AVT863N8WUakWY733RciVdJguuqCAIFz7OwsY+VJfDK1xTT2RB2Zj19BBdW8P5NwKTR/Qzr24jB5p5wDHXRn/AS74Ym6gPhhSDusREJuItX7ndTwjqVJwhJj+7LVvLBnvufRB3+PDucdz+LdIYOAFI3fmhqx7IKUcFivQ1unU1ggUyIwM0kcEUwC4JeBMar9oR1perdn1KjZXYjE+6hRC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9wU103BP9XE/X33sTxXc466aNTqCtMsqQfMflLyVYs=;
 b=owRp79SQ37tu0aqxOC8Jy1kUp7NwlZKbkSuoxJ2nbHs6qDN8/hTPS1cqTJKWnTK4G/zgiPbThHqgESI23WuChbMf7S0uFv3FXuK+ktyrghVcx1VJ23Cl6MIxC+3yXDZc+ulMio2znuTlxNYOw95AfQKy1/4VWcxlSrlB/iOP5+mXQk9JZsyISLk3CM1ckqEROVMz9Hem4Ub/bq8T+mPqnaTfcvN4Um8+hVQEUXo99lYZR0MNJ4XcTnbVp8Jel8LQgPcHcIsXfC09cO6pnz8+b7a3VtSVpg1lqEoFjUp959bxGFhtaC6nXQMZsCQM8tbbDyreZdca2UgpjJJO74sh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9wU103BP9XE/X33sTxXc466aNTqCtMsqQfMflLyVYs=;
 b=ay1EhXXX63hqkJ/fhdvJ7BhweNMXKlcou/TAC1YF/UdBwY8uXAquS/j/h86wS8Xs4Mt9aRftzqn+v0E6Vw9zFSv11JIyrtuUTlOvTkEGAeQmVopk3sFGV5Csb3/iwAAE0Z/l8oMz5+elE4+N3SftpCjOAMGI9IS/0j02T9JKeWM=
Received: from CH5PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:1f1::12)
 by MN2PR19MB3885.namprd19.prod.outlook.com (2603:10b6:208:1ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:53 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::12) by CH5PR03CA0017.outlook.office365.com
 (2603:10b6:610:1f1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 90F6940654F;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7FC27820244;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 00/18] Add a new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:30 +0100
Message-ID: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|MN2PR19MB3885:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9483bc57-51f3-45ed-335b-08deb00f2b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|16102099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PtWWWvJXJv3ROYumQhRLj+IpeG8dt+fGRSrTkCZ1QgWMMkPWk48GwzbfiMdHrTk/gb2sQxdUBCuqwDjpdnSzRW9vBlMlsTJ1KVASF/aNU57561PE9HYMTHiNuJmS1Ii+NTcNMq9ucPpsQsb2Nm12tQkRhXHULrvvotJjCbg5zcZb5X/ZzOzdodMD85nz6Q9aZqK8KsuJDWliXDF+e9xstT/aP2RIAJQakpdJ/bNAPqHJn5CwJ/eYMEbKqcC05in+e4tAzr9tZ9lF0yspeyDp/nJ2QcUwrp/xwWhWT8ZNXizlBcpBaxeAjGEniJnhPrW7S/VEQz+q+t2U2g9RvzwBUsJosLJ0S6Piy+MPRIAyFYpnRcGmuzmLLnVay2AxQbcEp2H5aKtfWGrC2y05h4dRkKjGsO+oWaLk2g9s06kSv3s/zOaY+hff8/cdw9ylqo0SPSnBS8aLnoAETLEwzFyboolLOLHmrKDdd5j0/3gLaNELpZEudbkqMcyzyAxu3jbSqp+xlsLwUiy32eH66kTayt0mCMbLTY0tH78Waq6DIzWv5RCRhHru5KjkHbcKJnPd3mEe/Er7bsApk6ubJBOCOcwVa4x+hdXabPLJHG7ktFyv3jrzCAip6A/OMS9yDtPZqFWtDpLlej+I6cYbhE6AsLig9AhuTiTGF0d4ywAwsM02lS1VEJYV9y9icwCE7Ocq1OxYx6XFaOM8hLXhHB9YKrJFqa25hsQ+jJwMGUvIcsI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(16102099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hudsQdxpYNkrOtpulI/xFpJrVhnvHV/AikgBFmVNYYU4kMnCeV7R5LCZ/FxgX090aBJKHOJMBZWszwm8yqS9z3NTkyS3ooqsQeKDOGUupnrYPYSRlDHlAqzCCWSNvFpJxtsWUXTTmsqI01bknmjxfvmI/jvrG4RtnyQzLPULnbd9YhLHUEN1QQGf+ZeDOaMVGblgNQF3aI5khKOKyN3dBihFWIecuP0KfsNjZrpQxT1FAMLtXHjowjlJuLc/n8ff6DWIWRalHO015Cgcm7sbjLPcivDHxG7lGHkr+CJ6Ghe+i1w7VBdzgQcRfqOl1TQS35Ocah4sOVVOYBxcTlEu8t3tL+6mlyAPnyteocxgZxHct/jXKuk1w/Ei3M//glpaw/cRr/kJjJP3h8jChbviggLfx+h5/vsdSEeDLh4LnltbI52q1qgV8ZdJ03I+bToa
X-Exchange-RoutingPolicyChecked:
	VOUZXjjvtBc9/j93rpT2pOvIhH0GGvqz10jOBM8lU98cu7M0G9wPc5RHQX9cKYHJx06JdyxzCkUD2E1rwSOVt7YyAdDH3P9xPtBoQXKh52ihqWC0pgs+0IVno/EQ3KEBXCZN2qG+sYgowQyR/qZAiFwp+1jgQXIvDWl9OGxZQrZaK1cU57h0hFYooxdnBWD4gAz8hAgknkS7xuGAJiiubvZW7Lcvt1OM8zhf1wUadYjobGUAYYsNZ9h6OVbTky5JsmI3HFSLAif0TqxcztzNlDWwEVAQuB1RdJyLCrlaq0oW6C3nhvEC1WkTNr339OUymPXZFeOLjIHezW8j73PQOA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:52.7363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9483bc57-51f3-45ed-335b-08deb00f2b3e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3885
X-Proofpoint-GUID: 0ZNqlngxuJ3JvT29tcu-6iImnkTBGuXb
X-Proofpoint-ORIG-GUID: 0ZNqlngxuJ3JvT29tcu-6iImnkTBGuXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX7XxANEU0RCXf
 edebn1yTxhp6AVu3O/wVxGNh2Mo/1S3JnMznAqatTsYHTiw9TEJeOKJGeQ2n7RNz/tykuUk3U8a
 ojJu7daPrN9BbIz+WcI1CQ6n5VfGOwbK+7oo7OIbaEYpZQjTzEYL6yy3w3ytVgq6rpI9pD1LuZM
 w8iJiS8OUmfu54wADON5iyC1UW9/xFaAvz5gMXw8EVsF7PwD5yF+OtsxLgntIrW2sLVzXi1kADB
 tgzmgrCCOXawE12NL2Q8uvXbTBImifFP8VUH56N4ojs8oyOwtQIhrsxCVQl1D4Bz5U4h0sg2PId
 T1gSO7rElQGl6t7rNX/SAsmDMfqz5ca6xmYSp0JlmikFFE1WXJz4I+vv9Y9t1D8gokxfcPLtUKJ
 Ym26+V2NqYBjk+wpo1YoTwneYyK60EUV/1/d8CFPav1FuECFq5vwXYyLVGt90PBljEdKIJqvlEf
 pA7bLxaEDTLsl33yuIg==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd65 cx=c_pps
 a=gqqRaR/JtIFMplGXl4YyTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

