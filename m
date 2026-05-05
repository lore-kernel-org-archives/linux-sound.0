Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533D492529;
	Tue,  5 May 2026 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999731; cv=fail; b=MDbdPt4bNdgoMbr8GnBtzu2IQCCzYvfZkASy/ijQqtHPssh5GnvBsZ1gj1ZB+o+A+av8YVJ1sTWlEessM/+s4rF+aUMeZEUE7VoeNoMQvWVR2fk37V5FFcCkDpNKFnnoHkJQ/VaTGPdnRyIYvEqNMXdSjMlX4roTrsGgpUSQaXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999731; c=relaxed/simple;
	bh=krDJ2orhgBH+pmIA6gOtBcJcKNf5Y1YKlJfxZzefgzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sPy4mAbAF/K7MvdDNqLZUzzbwe9njkEpbFN97THNF6q/x5VjImjRHs2AuQW3sf3XsBMnM7dR44FHY6INH2kFO3P+V3rsD78JSGywbRuxMiNP6YYogKv3b9WxkmzcoeFa2pZZLu2fWyPddhb/OmnP4ThxslRcZ6gmIpHOIB1M8M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o+zfs76x; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=edokLBok; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o+zfs76x";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="edokLBok"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rANt1749407;
	Tue, 5 May 2026 11:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wR/4T5sonLEVlGiUCdzH0vsdbkDsaSfe1X0OyauVDug=; b=
	o+zfs76xWkZS1qh92g3QwBN7d6PSN29XUWMJoJgHxuOo6xIDTnJ/V8494AY3bgcu
	vwf3j/QJEn6SQ8DfwLlUml+MOxCQ0wt5JUI0QfgM5N1Hkyr6fHun2cnIqnUZqgIx
	l0XgVEYj4RA3GT+KJQfpp6BA3eFA4uyByl8RsXx63lUaDedPFvKWTot87NYioCW2
	W65AdjfnucmjDQWseplfMuW2z/t9795ijfB54h57GwwXIdobnzCYAqxgzDPu83yT
	tc+U4CtVSjUsQnc2N+K42UXLJXQ8QW5G+uMxEiEgOnbpy/TG/EAzqLSrXicAyjGH
	NY8NdeMdvirN0gR/Z6zrbQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020130.outbound.protection.outlook.com [52.101.46.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id6lXo0pjVODwPEOCDpt+M48Qqu2U1A9tdG0tJvnznmR87kPmb0BCn7b2I23I1UFycaBvVfpSG9uXxyXflsgGkzX6PR+qMkfA4qUoPHIwn0X8GQZromO/BczPd3c3524Xn7Mc8IYChvM/rewTdgUFGZOxt0haPRtRN1NZOcKcHbSoplGEXaFxOsz2nSrGzAEO23S17q7NkVQnOIA5RAYqnbIC704pIeLgx2giadC1GNPPcvECqYen5TbYwQUXOldt4+GWmnrHvTirDbH4cxXAy5m3ZAneanLDWES0QuD9eG+fIixIfBNDlWSF1rrC/cOTZhWsxJr6hyxincTu34X1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wR/4T5sonLEVlGiUCdzH0vsdbkDsaSfe1X0OyauVDug=;
 b=mzcXy3lrxRw4kfEWTHznyNvOiWY/6u3Due0Fon2GcRAhZQHv6dQHpOeXlvSN13sKTrsMoVyjZuNWS2JAEoq52U3EumsqKkEbCgTZgxrcyNeuPdUPP91xBEKZ96TzVdsYOvkR3O6JiDvl/dNjAhchvRZZIr1kNw5HV+sBvCl0dSPyiFit5k00Wn9CTn5x3GLBS+pUPDkgwLDgd0NFOP3H8NAWFwffe5mJlRMMHLJ/lJGLhRnKelsxoSlCwrUUFkTzUNxbXsfUQFuYC/+tNUhjMXGax8ykawBFsq+KMFYzprDUPSVbtMPjKJskldVOHwQI7bpRDHyrIqin0yb7D9YZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR/4T5sonLEVlGiUCdzH0vsdbkDsaSfe1X0OyauVDug=;
 b=edokLBokLkCO990SvpYYbTQGx5VGH/Z0Oa2FAAnuKAJQlko0/SjRZIkfiWVEYfgArQ0N9b978b/kxhQbg8zcbWC1nnEY1Ts3Ndh9XvzcsYNEYcX83I7kDB8l9yph7efHes46aJyXy+1AJpxpQsYU8UfFl8QKhSnqZ8ovzaq7Q1A=
Received: from CY8PR19CA0014.namprd19.prod.outlook.com (2603:10b6:930:44::19)
 by SA0PR19MB4411.namprd19.prod.outlook.com (2603:10b6:806:b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:14 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:930:44:cafe::23) by CY8PR19CA0014.outlook.office365.com
 (2603:10b6:930:44::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Tue, 5 May 2026 16:48:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3DB4940655A;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F0276822544;
	Tue,  5 May 2026 16:48:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 04/17] ASoC: max98373: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:54 +0100
Message-ID: <20260505164807.4108684-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|SA0PR19MB4411:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80672b6b-cb92-49bc-aa1e-08deaac61915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|61400799027|56012099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	9WEk4Kzf/KqQXUTvKMHjS0XzK9FB8PNG6CIidyihDjwhWzoRi4kjOrZLVEOo0GF/xOmB1VaTlT66C65h1qn1JV4g21jCU/4YAAlusyB4JTlvSdXF2uChHiGmO0tCyraEcuk5QrbOb6BAfzGgdLj7vf/qeuerkDhnj5zVlQxMJoc8ulZRpjDvi4HVFtkDf3F7WefV7od9cStA6yzmnAh8gwC+vJRp1THT3Y/Z0SU7p6Zgw1lkLjOwtdFP8Cjy4V47yKYbv2E1n9eKjrh3xLfoSRO2zmiaOa0/n70Qa8rp6CikfiHVNsNXe6OH6ZvupUotJkxF7EycPB/zlQKWqr1R+Q1DHp7m3CO8uaLVEuXqahvvgm5krU1icG4SEKvd68+Sg7WOJEjRTR2UEZhCchGCl9Nzdosb+XQ4TE4OS8F4xACtr7d2WzuuXA7G+gkcTj41SKqedIwXIIKKe/TYlNbXlJ6/XwvjrqSdBbxoW+w1JgfssGSMmesLtYfbYYpngvi8XUto3taA4MmdnUk3yq2Z985Byvltu6MZGbmCTBh7hatiBJqa+m1p7kD31LNctrpNaNC2UrJMmd95WZlw7C+4tcT9dtMDzkscAgA+W32Sc6p0sXZ2maYf8N9kdFS/9/ExCH9tqXBLfREIif8d0oZfOftfe0GvLalfNi6i3WzlGQyxkCqtjeUSpNzJxmNsR2DlWMsdrYCBRv6BIkUFY8aiLtfMjyxaJynJFCY9Nk1aeMM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(61400799027)(56012099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QUgY7ZBObTxAYK4Ltnc6Q/6sfAkTj0Qah1MU4KRoZxIg4meLP1ngETYDQyUSARmbhp66F0E6d1tLiF+yrBuLzT1BA7CZ7rfZu1sNih4Y/lHR2RlnPymMatuv4V1Ti2rRVD0YeaiA0JjUF37E0O5KwKc/e2p+SMenCM56eOs43kCI3r958QErdV0KY4QDmMiSD0q8iIhsom3Yo4Elxvh7rZYMySeIcrXKZKl0T1amfyTut2qk/6iTQuUkY+MulqIU9ElCtiSRMuycdFqegt3q5ThoBm1P39dFvBnyYQgvbQuJQy3hbPYZL/rcWfJPum69k4CUS0HMmCz/4pqM/G8MOaFSha2b/LK9t4IXtgb89i0NSv3Pud4SmdgEsZIuXyP2RTr7rfmq9l82J1JZD8wK7xypckDC/IESqFcMLxa9kLZrUscGChTYrJ72FhhzPU3Z
X-Exchange-RoutingPolicyChecked:
	LHKjdC6oqa/ouHtKSwAPCh84F98a/zYIpvzTGQ4IP9qldl8Q0wOrIYNOURAjqW3w5oerBnP/mALJDZL71wNVeOh25rLk4EdfXJmttdHn7974939SaYP0kL7d7xc4GqnwXieHcWh8MDEx8JBbc01nq0q7ci9LpPFfp1B0WLuzY0nODXuRe6Fuq6WwqYyE+537+DXt0qlLw57agjrFYMbh8pm13G1zKLfg/M5NQxID03vXk1gVdwY1pHXrZcaYPAQTy+m8Bq4G3xFlXitYJHe3tNFihx9k07yCmJCuxPt8Z0MKE5Ue699zCL/08SfytkaWzWAv4n4GNdWq8aZtvNMDiA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:13.0127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80672b6b-cb92-49bc-aa1e-08deaac61915
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4411
X-Proofpoint-ORIG-GUID: LEq4pgvhWmUYbrawYuGD7QKNnEsjQlp-
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f53 cx=c_pps
 a=9hhwatWKa7/vLw/BZzsOGQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=b3l-KXf1wl6CWbw1ZukA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX8e1q7iq+9qFb
 TqsB1iYXPMM9HYVcnRgoUvCvXFp8jEoqcM2OvCkTldAoZ62tuLHLtQAakQq43UyW5A5L32kW8ja
 JGw8yTtYRwQW+OMF87U2diAYFSKL1SgzAb0LizAfpm1D51JR6oDqVNFcw7rpooeiTAkHxgqgWR0
 IJ2KsASrXjAdRH3YS8LnnP1fBujI28G+Dg936I3VldqWbrdbERtcmdbhd86cFwoWa05i3cG5P+u
 BoIVKrRGAwkqaHoGepqdYn9kDLk9x8LHV1zQFuJ3zmY2gbRaB/hosyElxqrUm8V1Rd2c1WcVUM5
 q4PcErr2rGcYERmAOw9daUl+pWwab5xisnp5vFlJQ2r4G6yvSs/YC74NK95e0hVIWTB1q4ecouL
 p9qGRawwtJJn4HZCM4eMf72m8OItkXoF4FumN40KVWDBOBknjOhMtdGXrTOlCUf7KTvRC+7KkOG
 TTLMBVIlOLpTuUpUWBg==
X-Proofpoint-GUID: LEq4pgvhWmUYbrawYuGD7QKNnEsjQlp-
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/max98373-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 16673440218cb..6829fa07c9ecb 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -266,25 +266,15 @@ static int max98373_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!max98373->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(MAX98373_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, MAX98373_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(max98373->regmap, false);
 	regcache_sync(max98373->regmap);
 
-- 
2.47.3

