Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538D349CD7;
	Tue, 12 May 2026 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580883; cv=fail; b=gUTS8hwBAKI7v2PMrH4bDZMapDYw06cpRWIeBpuzjo74FswOYJgJwdTli9FuLEuDxm+s7lEZSeJj5+4U80O61mew45X1IMUNALKDBI20CMkPb3tCc4caXVxSLyYoIruNPO4FHOIL7XaOUE/bbUtfvILbHWuBz9W+QFjYBq+kNP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580883; c=relaxed/simple;
	bh=5wUQ7kmQ49Cu3qgj2012jzsH1Gb1iKK5MhnXZqv3wDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u08yyUrpEy/QYb1aApReTN63qXYQ8uzGyy4SoJZPiJ1AFtAajjSez19dLuGrRmbrX/SNN3GoGnz47j30rdrWhgIjv3PmHhNdmxfHiZFz1drd1OmZnXGskmuv8LWYMuJ14GFkDMSCVb5qoOgsaq3ldn6vSxZLdZ6u+KErfSK+IkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LWceQWq8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CDKcs+L0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LWceQWq8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CDKcs+L0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4v9Af797268;
	Tue, 12 May 2026 05:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tt9hUuqBJLHgnbXSieqTHEVxoVEVlCG3rycQ/PLlOJk=; b=
	LWceQWq8mNDsqLDnEYk551DnQegPmnUYsDtLswiN3YcA7Ss+wH9jAF65JOdSGJ4b
	r1wULsYAbHdvfUeo5E8XnJfjxn0yBTTdlXROz88QtEneI/Wdr/QyVBhPV2VG2g52
	iXLej3hodaoPApLCXkaiAcNvYpqAlv7uVCYiPPETdLzUiZjUTy3nZNuV3My5ybui
	Uv5SeRYfnnpceJBVjPJtni7k2mqMyEXcsPXD+owbHl+HlLN43p9cUywSgDURGJCL
	M1L1MEncKkD5ggBy3SnEXkNfxHeH05T75QX8Ui6BNR5oqqw3dx+txpUsmsQMQb4w
	oNf5f2sQFLE6QnOL48MQBw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020110.outbound.protection.outlook.com [52.101.201.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWP9wkdLnyYpSoOmP8LLVqbtO75c98mqxSPApyMe2gl9DXSoAnosjsPLifvNuS+F4YtyYCzmDnX24bz7sVwPjjSphVKOZAszGJssTT0p0+OPxm5KxktH+bWkbwqucWytH034d0c2UE6td5JMUdedfn2TXhWK/YD233YFigk8aEjgmGq+MFR6iWXS74L4yBlSDUYQN43lWuXmghXkLgBtudDrmexXaY/6h1/X6qE0YgKDuS2ao7TzFKYDAZfRdJUGhDgD6nPtCaDgEWW2rWAs1GFdeCaEpN3iYIktq20Hm0LltqGuwY/1qS7M/7JcTq/lTMX7WuakEjTGPjl5bRqxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt9hUuqBJLHgnbXSieqTHEVxoVEVlCG3rycQ/PLlOJk=;
 b=YDiYVKUJEI+OACI6m9z0NsrrjImWSdO5Mca/Ys0K1s6UEWvYOUYmbdDFK+R15/OFEnz3Yt7ZQM5cziZKYBNQ4b15PGU3sSv3lk2i9Cpjw/TVzNKxzjpsIvJIPW/qwGgpxLF8q5FZL4JhuuYCMtrgGEFcQ8fydA+K0s3Arh+TNbbJBTSoLaFENRNLVjxl6WrWsNvmn7cwHYoN006Z1UrBHY/hKRACzwVvKQcfkC1uGaawBJ63K69EHOwCWIcX9p/i3ntsRUkIqYujduNDaufXOdkJvXENGXcWH5rH8/BfiZtr/Qq3Hb490BUq01q2ywrXvz5cJyg+qxfvw5bmQ2I94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt9hUuqBJLHgnbXSieqTHEVxoVEVlCG3rycQ/PLlOJk=;
 b=CDKcs+L01Itozizt5XUdMXXQC1nanlMvtPMqdcAk6eAK8wNXRVG8R33bT9P7gYM1Ysr3yY/fE6aQMy//zxuafP3IwhRw91wYL/3oYV6qrqIf9EpAIqSqEQij5n5K8BxWCpIwaPDYzGqv1ojvjV65SpWWys7eaE+HyuZ8lmNovbc=
Received: from MN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:52f::14)
 by PH7PR19MB7100.namprd19.prod.outlook.com (2603:10b6:510:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:13:57 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:52f:cafe::9d) by MN0PR03CA0009.outlook.office365.com
 (2603:10b6:208:52f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EBB88406568;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E1B3C82254E;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 18/18] ASoC: tas2783: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:48 +0100
Message-ID: <20260512101348.1138044-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|PH7PR19MB7100:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a477beac-8650-49b4-9dc1-08deb00f2d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|7416014|11063799003|56012099003|3023799003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	VGKnbK4a4qJJUnogmW6Csl0ClzrJmsX+V+LK+ZFKLwbsoKjnmmjgADoZizdYcragFPUrUQhhZEFXyR7aJCddKE20BgT8T4S6/9gnwRk5+V8K2nVSgxGgBOB2p/bowTmcMunRELptl6dt3NpfOzPHSdwJEmxd4WoeVearzqlLN/PsP52/gKeMJoyda3hz2qHQW/pYhTBrt2iMbeJWEcJEGqy4AUrtR8Sz5FQNPGlIldaUeI1Z7Jm+lnNctL+rZgNMtM3wG087GxAxGvnf3abmHYRHwW1xq8KCiIJtvFmqz+z2BG40BKHXhPCdROw16PQIjUnIhZPpkpGG3W0xvAgYd1CpCFpqQ8fRlF3MtUq0Lc1gkSAAxe3NS2ktepNx8e7loKHJfo/s1sleNDok1M/z2IeqfGEMIAzoGkaW5178sur1xmWdQp9n04rheXfylL/VoLjp+NYixsEFMS5oCc1yUzCGBMx9I38El7iv/C6mWQyFp0foAxiXwVtGxdKdYJfOSKS5b1vfrbsIxz4uoFA8RYQg7pSJRJD+U9qMueW+87qz7E9CkhG1icvcM9ugiSiPvxMfXPkg+DAhFcioitjCoBAJbvpNt+P3gdvEN5SdIBStK6ZpPqHJJDe0iF6Q83f0u+CU1nIIGgKeUaMExNrYHS19opTS956p6S3D019Ut/18LV9ohLczuAEY4+F+0iaLKNbrQF/gGuoubzKx6rpPbuyQie4o+nEv8x01LDiAgC8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(7416014)(11063799003)(56012099003)(3023799003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6eNsRFf/RdYGZCRQOmhoklOQ3nmUY3F5QHiKR92t2xAF5BRlyTXRstM53Am4X19Z0h4RRnDIjVjWiw4x5sSj9Ni8diAoDefJRRrzkEu0tBFwXUlNL4bCD+ND5HkT7bOSPh29fdKDjKNQ3K+ND9CUNH4KSzD0uyNgGv7/pG5tZKrWWiJJmJ5HfYFCCZrnfd8jAHsZ5LwRc/rt5jAVA8uHBaS3HdY2SkHS0+MjefSM2luGzJ0xzE6/w8OU+5+vLSPnSv86C+IYI047YLENiHCQEnitkhc0OX+ve7udNS47+zHtNGJWHJlBXwfaLe4UDPJb6+O8Pjp4Nw4g2CfjHOzcFD5MXiC3OVb+2kZOqbqYVtBzlwcpkCKnBU0WqSfXsZKKBBD0gvd/+rM7RynbyCjbJwh4jnRMqtc4ReIWDWgHtM/W4+k49jUZGtHjKvo00pCv
X-Exchange-RoutingPolicyChecked:
	p4N3L4cD9jqFp5VyUBZGUt8G1uRjHRe9lcmZqF7Uhq+KHBXvNui1YRRS+8hsL0m/CLr3myFj/0qZ/z2mHIJHJ6soZdhBumaaenMrSAmVi16ojI8mUjf1D16Qtzi1/7VjeL0rqjPn20BUMTuneshHdynPrTtdeo7x2aYK6EHawb9q9fej6hicmlDB9llXtFoveSr8K2nJAYPv8wgcA1QKLI3+cXeTxtdcRCsUyJ52xJsKVBF5YCDEyqPQaMNDECHaVZHQNoO/mLdhO5NgHpdPdNxNHLsh4RSeo42JRlnpPVCjCqBfL1q9C8mt/Ihkuz5iHCLTCUxsxq3DljO1NOywDA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:56.3832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a477beac-8650-49b4-9dc1-08deb00f2d67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7100
X-Proofpoint-ORIG-GUID: gq6Y9Qwx9PeZncRbbbznyyV1tGGW4qp8
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd68 cx=c_pps
 a=FaoZe42t3hJ4J9xi/30H+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: gq6Y9Qwx9PeZncRbbbznyyV1tGGW4qp8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX4luW4Dnb+W7L
 mYN/n0z2IS11UBmu2Hg4ZjSo0wmBrgAGkK3sEYkHS+D4XEsXg3CmtF+VpOfPrBZ59TVG/MaB/wi
 7z9EnuP0ty7iPIKUOZUhY+l/oWvC2+3karlSl+/7JLhtXr68V878ZIcUZvBZH77VVFW3tPg+CMf
 3pHWOejBF+o3trMLmx6oC+WY+PkuE76rnu6uEeSiyh/O6cWK/6q7CwcmL7qW/LOtBBVKgmV5cV+
 kVLKLbY8YrOB2KzeQJ2FaIpJBKuL3PUCUZGa1Uc4k0S9ZuBhsZ0kQplPzvsVO0PjKsp4t4XGv7h
 QP3Kz4ALIynd+dLOru1GJLfgtbeoecsz+bBXoQhJwyxz3q/iGBTYD+zWOrEVWg6B2z9Y1YESasB
 LRUdgs8CJl1gWNM69EggbhimH8MQxhAW3UNoXfAE4Wj603QG2ShYu5CrEy2mEPfClIJf16jjcwy
 RQQZeNW6n8yBCM3ShrA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/tas2783-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 38009168c5a11..69d03ddc7a0ba 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1082,22 +1082,12 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
-	unsigned long t;
-
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	t = wait_for_completion_timeout(&slave->initialization_complete,
-					msecs_to_jiffies(TAS2783_PROBE_TIMEOUT));
-	if (!t) {
-		dev_err(&slave->dev, "resume: initialization timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-		return -ETIMEDOUT;
-	}
+	int ret;
 
-	slave->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(slave, TAS2783_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
 	regcache_cache_only(tas_dev->regmap, false);
 	regcache_sync(tas_dev->regmap);
 	return 0;
-- 
2.47.3

