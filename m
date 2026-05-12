Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A94383998;
	Tue, 12 May 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581900; cv=fail; b=GykZRAOybe376fztnmS1kZlaBpQF0CFwC1A3atNxixEZVJddhpOlW6dYZyLFN5/93eJm0Sg5osDRJbDTrOpab/CJSqxImEulILJgrogFrBIjp+8GLPQoycMWm5CI9+YWyh9WQ/UD/d826WNjS2PsBaoxLvce64epTxh8UtQzoSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581900; c=relaxed/simple;
	bh=oePDtM5ewlFzfcOJjyP/Ffh94xcuwUUDOgbL14B0CVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULeBgaARGsvyaqvT6HrJROSF8l37a+bEBVifsnJ3xs/NC5sfuuZemWzWBcpH6hvKI9VFjeWsbQsJu8qy/TVY1G5sVIOikwcaVr6It/XUWzpesIQLgp4S5Y0fzYPofVBo4MLMzbA0N9CI8ld+6DYTda1gkDxm9O8BKZWN9CAgxb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K4M0Jeze; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LH0XKbEb; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K4M0Jeze";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LH0XKbEb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C12Qva1137580;
	Tue, 12 May 2026 05:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dM/qZrODtgs1hA0MHUjw3GLu9/4mjfXNN0iS8kol0iI=; b=
	K4M0JezefcQQW15tqdJXT2zatosUKyottQkKLfGzlOxt5eaX2DpDG7xJbrgPHK0s
	LQF9zBjW6GA8W9jXgQXiR/wqkPw2k0C93eZjGYm5ks4TKzT2pHCIIi/LWa+wqBl7
	w2rczyOxXzHPHHwnaS6W3ursFaTjHez0R1NAhNTS4Lnfx+h6Sz5pjKN+cHJGRuTV
	XYxBxPB96HmckWH6SgLxl1Qf7ZNbr8BQTP4C18Reh2VylRetVZcQMEecz3bTIt8u
	uzxiU6w1oZCiKr9OFt2IFofHrhbc3BS6jEkgYL8Xcy7G5raAn3zS6Rp/h9bJE1CX
	U4ef0VLh/4vMRA4nIJ78xQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020102.outbound.protection.outlook.com [52.101.56.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r87-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig+n3azlNrzZelJtBI3t4gDmm4Qjx3Z2JRCV5OnCdS12VY9pC6sELZrVpGub3PLtboUO/An9iJdhXWuu6Wh8NlECdKCLdS8g9NyzBhJrz9SQV60V84D7wr36ZymNBIIVkBuhsnvE73P5/OijzDJ3X4yyrjbtUBDZq2IIEhvEqgeHegkUEeJ5mKNuXV83Zu0E/LqBXjPRMeCdp0JZowbO7cnCphmccmCfdxnBrccjS8vS6y+nNyCU00ry/X++oz0o/ou5zuB5FPBFZ90Wrg2sLp+gVvkJ9mtZ2ZBEOPhIIUuW13lFyU/wUB3mz15JwsquCoX5Sp8bcJ0PtFz0jmRIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM/qZrODtgs1hA0MHUjw3GLu9/4mjfXNN0iS8kol0iI=;
 b=eqjXnDCkF6dsb7r9fN8buz9mELyHgniptN5T7SWKm4G8qeIBSRUoBbugjfTGQbgpk9yxLYVjVQpVruErGBnHtESB1wy7ePQXuuVrBrbnZVODKkGJQxThrlzq/Y2jnNdzJ8GYooIMdmWtK56kYCC6ZgYTZQIrfnKG7LM+gUApx7A/C7ASM056K+e2Lx49xXhlhHBjFu3xSlSJl5mAMGY9eABpsrrAq6qc7PrgiiX9gaDuIwgyOmjt7JcwA8l7ItVFf4UoIGvnMwOL902+x//N3q/aJQowz2VkOlzF7I07FokFwuMF90q32696wd/8SiaJBoeEMTVa0RM+5nrp+hF/Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dM/qZrODtgs1hA0MHUjw3GLu9/4mjfXNN0iS8kol0iI=;
 b=LH0XKbEb7GLZ2fHLboJUCYpGRYGc5XRm6oR63sLz8msA4B1A+uXS0BvOtCVXW3+aMUOGXLyNUSFwbD2Fon9IeU6NzGKBEg23RjnHPkVbsMBXC83d/4YAmhh6NXPOyok4LODtdN+WW5b9J9tHaEXBx4SUyr2pqyqmEQHScOgjSzA=
Received: from BN1PR14CA0020.namprd14.prod.outlook.com (2603:10b6:408:e3::25)
 by SJ2PR19MB8094.namprd19.prod.outlook.com (2603:10b6:a03:536::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 10:31:07 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::11) by BN1PR14CA0020.outlook.office365.com
 (2603:10b6:408:e3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B3E840655F;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5E69582255A;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 10/18] ASoc: rt721: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:14 +0100
Message-ID: <20260512103022.1154645-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SJ2PR19MB8094:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01c4ad22-12a5-4201-2c9a-08deb011932c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|36860700016|56012099003|22082099003|16102099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	nHS5TN4phTJt0J6UIAJAEYQhAjQz6G1y6KADX8aPgRIOfym7Oa+1EDa6t8yR6c3wSWw4gTZBX2c5AEWbT0/gA23SEBCC/4QhwpnX6GK9RQj2poH3Yky7lHv+xFMtoi3wheYThnrYcH+sZ7LNqbmI2TXFEtJ5fPwCOL9ujiWw+ulBGj54ry1YOp40RoCZBJyChjrSj0DteLSexBbTzzKCkKd/wW8YW1grzXwmh/cCVirJnd85+ejpYmJNlO8q2Go8v0uKg3kL6UqD0YZQ2APrL9b6GRRhqsENaky0U59to50PQ6guvPwusWfAMfIMhAbMsg07Vz2CtArkbrA7dOjcuDsgjRkrxS6IjG0/6EXxiGu1lBIYfpjDUSAWxXOXgkQQCk4jLzTCK559wGGeKiHDoS5utQFdPoAT012lPkT1c8bFfBvtVQEmn3kRHmrYJwMiAw4LfIJakNlTvXfbaqDRKR9akL+7XPhFqEjnicdogwY1u4HQWBEI+SMdGyIFbuXCSVoWYxqMlYCuG9K4X+GIvZh+EGqA+JJBJZT8PsfO1KG7tnwjqS+oSK2MDkiQuBcx37e4nbVcocbSSNKaMAwojYdcjk35Qtby17taQmtdskY7YwSc3aYIbjE5yVxbUuX5i/iSk1Hgup0WqqNehiMPmSUt2qy3z/eQ0y3gJYeQk5+ZCbynprMdDGd78oiDbWetypOwOmAPdxFvji0y2C4gjTeS0r/8QfAiFF5cD4ixNdk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(36860700016)(56012099003)(22082099003)(16102099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Upydz547dzR3XWhH61+FMdy/m1kfEVd57WAGzJ9FGsVCuPFVvt7Lkzj58v6Y5KgjjJNhpSugSWBoa807Yq5cV8WaNAy5Z7Ua1WbyLaZZG6OeG182yQ39R9oFqdf5wop/28FOSMIeQVjW1len2VefLcKa6L0t7juCAiXkuQDOCqzQKCpBU0mOhSCkZ+eNEZdRkelZygkD29nnLA37hjuyLI6VAbLvNsvZz62ETxPARSsX1Yi6qtJNca+gqdsm9Ckmj+9DhIwNxmzjVYE1DlkWXQbAXTJkmf4BvQIQWGF59wHmFS2vTGKAbCsKIyi39QuLiM8WMD7F30/Djv+av1K6TnUVxhrk2Dzd6ZXqRB+LTnVjB5rKr/1TkMpS7BmOrpav03HNirs+1GU6B70gWk2/ftOSlI+btz5/75+pjZ/jYv6RRP2UJdhPg5NsToY2xkU+
X-Exchange-RoutingPolicyChecked:
	mVmFmhizXWTis0YLsIP5fArNrDQxejMikWkogRtjAlu1P5RDKPTXsP1YZ/TqgaWToEJNesd9PJ8Bxx2ZRoxPqCDHsPjK8xbDkTjiuhySR0NSY2r20W+NRz1bo0ohy2nqmiq7xdb0aVto9BU4wtNgkHPlzWx+t4RL1qCGJFaklnYdPQm/5DfYwaNvVjDIP2/o4w+OB9jHJyIrsWhUDIF8aMqGyMUlgZRz2+15ez0JsV4bfMMRHXQDLgw+v/iqnZcj1Oj2GDV0TeOZK/8v4wQWeUb96qMKVUCyRxfGE7jiJMOJSEyt+EoyuZ23WXzMMIlDPzCCKXMyWd6PSx9nzsnpkg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:06.1012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c4ad22-12a5-4201-2c9a-08deb011932c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8094
X-Proofpoint-GUID: RxXZA4XaalN-tAoSAOXMdbZyYEPHID08
X-Proofpoint-ORIG-GUID: RxXZA4XaalN-tAoSAOXMdbZyYEPHID08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX2jpw/iWAeUJ1
 pDIJ29n+SypI2RZYex2N7PGX7gWdpmWMeMiuEu/mjNOfVndQMYcmwmcJF7AnqWUMgBGiTzCG3EU
 QMMHUUsHgEzuh8yktF+PnJ2BK+eIheoVJyw7mHQ2wKBkXX0erP4jhz3CpAxdRV1ApPoomhpx9xM
 VyFSUSEImYRqsDVvWWtVOtGAL/reBt9w6c1m4OGgJSGS/2nGmCER/QsypGo1JvhEkFQpEA8VkMb
 gKSamd3fEi/F+JwFMb5Y/YEFK101s8T69znapOfcl0E7rq2PFBX8kllehM+LMZwAzaJ9DofVOPE
 I8F22saUWCU8bujb7WZNNmEWx+JSuKbja33urpssYZIeRHdNyzck+wl2D+gjfdfHFfvMcU+vdhE
 JfeHKAoor+koSs/tyNS7/s5q2S1o7WjPFZWWRmFyOExpf0Y9GhA2R76n8moCFPb5pMriYsaq3ZU
 32gGG+LnmW38oulEnCQ==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a030171 cx=c_pps
 a=jBIXr2/5y8QxNzQ+Iip0Pg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt721-sdca-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6eb8512975b85..58606209316a4 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -489,7 +489,7 @@ static int rt721_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt721->first_hw_init)
 		return 0;
@@ -502,20 +502,12 @@ static int rt721_sdca_dev_resume(struct device *dev)
 			rt721->disable_irq = false;
 		}
 		mutex_unlock(&rt721->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT721_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt721->regmap, false);
 	regcache_sync(rt721->regmap);
 	regcache_cache_only(rt721->mbq_regmap, false);
-- 
2.47.3

