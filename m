Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038448BD29;
	Tue,  5 May 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999730; cv=fail; b=Sd8qXZyD5n7fA/NYH9Li+d3JqBNcso/A1/6BcyWo3/wjETlrBA1vcUJCGn5GEDlql628/RYSkm3Q2tCppPY24T5XhDgSPg/4hdS3elQlou812EsvE8pLLzk3LER0TI9uKOGpcnyVrEbANcfl6razLETGnJGJBkkWnLKYitWDaZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999730; c=relaxed/simple;
	bh=nP5s2S6a72S6xVfydmw4QH9T2vWzKFL1qjfOjbMneTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hPLTAP/DYXvk/GANXg7dx6aL3sFBRTh/m4OvACh07NHcTITqi7oOEztuduIsQWXRpa1rGVHusH3/Ewjoap88WxIBQj012EDTdLJzTIYlDtDOV6objn6l9io6n7htL+pxuoIySiZjd+wqlMGJm5oPbSLpBeI9kkxchQBDesMP47w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NMfY9Uv3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d5a97jMQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NMfY9Uv3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d5a97jMQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455nR3i1839970;
	Tue, 5 May 2026 11:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oYcUNH2t0izpf+HgexVnLPoSAJIEWmkNtKfSNZAOs8c=; b=
	NMfY9Uv37cQkBNebd/5+06o+iBTrSFsl8tu1FyDx6yYTMq4f7CdRTSLiwLUmZceQ
	85XlV63Bo0zt/7CajN32sMFfoZh5NKtvjId18yqtwkZpqOKifFtgH3rVRQuxYQBZ
	Xev3n/hR4Mngs/t89/WAtW+acdYZH4i3bW/3qdfqtRWVcPtAcl5Ebq1L2NjnGHk2
	Y0BC6GaVD6x4NvDjv5AQKxkv5Xk9fbLqZd+QN0T6GVZ6kaZSkyc2TK/wPbZimDtN
	/J0HqV96ylc86qnxy3wum3UBVGGkWjGVwSDqRUxOL+9w8RsLCi+ttaelAHRsywMG
	4FSzaBK9lzJImNzpJgAu8g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022078.outbound.protection.outlook.com [52.101.43.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5mKP0winuSJ57z/8YlWKwEfu9/K8JxDnV3S/W3fY9N9o8NyMekotxq3GECdcGd2BSoCyUw1X2PGdsJ9mAPp2dihnGbO3KC4b1EcgV2mc9+gqnfFIrFeptUXfv8iz1g+veBd4c7gCUDd/gn6+Ov6OYKT7Fri4oWXr5p9axopB7mEin2dgPtMcEtQEs6MeHhH2H1LyHwJJKUhOPIAMBeCfXTE9X8LHxTeNcqp4EYSJYa1CDu6AjThHrk0ers1UI/m6akuNmd2W+rew+kJWSFtQvdZtpz1BZyNupBSeFWdsOzoDraV2yxXMkGlIn0ecb37VjP9FC+ID7F+F8yNbbLlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYcUNH2t0izpf+HgexVnLPoSAJIEWmkNtKfSNZAOs8c=;
 b=tgzKb3NaQWzJpGiXlI7hGMD/VVD8lGhmv6XVUPOIlTHKuHxy5zoFrw9ffzSt2OSud201mfc1SkhzKhp1vw3Oirg2/9/HW0TBCGsGb7jMYgJ3VyeX7q3inYCP4nFf4Sp0wxSCBnfpnswClT6/ewDFejcmlTy4Vk6sJsqAr9rgOs+RT/Kmwd3G22xih7clF3Q+247XF3m+DBSYO0rt5Vi4X1DzrwQsKWiFc628XeSTEJeE4b/54c943B5xkxvUiu6T4Rtu+hpw9nXaNSwssKD1gwp7f783Cryk1i5wd2hFAA98gIZAPBEYpFop49ciYEFqQqLk6HFPlK+p1HwvT60PUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYcUNH2t0izpf+HgexVnLPoSAJIEWmkNtKfSNZAOs8c=;
 b=d5a97jMQ5rYQeHLL39s1pWUU9+U9ySfQMCb8TIjue+0ciwhIe0Tb4gFnX7T5cGGYOx19pkLCDrNGwZRbhUcqD/Ya15May64Pg7/FDi2015FJq3e9TgSdw1G+/mmvozE0VbnF4w7WNdCZDarHXLiaeaYoNCiCSCVaGZu47tzhLeU=
Received: from DM6PR08CA0057.namprd08.prod.outlook.com (2603:10b6:5:1e0::31)
 by LV8PR19MB8174.namprd19.prod.outlook.com (2603:10b6:408:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:48:15 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::f5) by DM6PR08CA0057.outlook.office365.com
 (2603:10b6:5:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 48DE840655E;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C0FF82254A;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 09/17] ASoc: rt721: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:59 +0100
Message-ID: <20260505164807.4108684-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|LV8PR19MB8174:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fb5caac2-7df9-4016-6f0d-08deaac61a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700016|18002099003|56012099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	y2pP3m3l1BfRqm1ybjEPc9u0ltIJ1HRJfdES+PAS/MrSE4rwfhyavvkiomJ6edILkpiw0+WZZpgKsKptV59wWDTzRKI8UZ48e8QNoGw9dSQ6wrb07NlvRlpzzfJL83lIOHjVpoii6HYEi8jmie8KRqSX3FmAB1TkXhzRyOqQka54G8mCJSv9A6jOHoE2wqUIcaEKP4Mgpb+3h2ISE2m6w046cc19H7OKzF8UXAdk8qrr/sFsC6QiPpIvsdoGjPg8UBsNXQneoadC1cprndCXlIwnD5HhTzGSNs7i0TqY14++uB143yr0pxAyFutVNIpQrKFP7LCRsjkEon4wTJyb7rLwfgacP1a4KwIDcGbYpN3g+/FHOp+XOe3TU6+uoxQ0yO72uZ1RQGrpYhLpW6FRmYxJYkGtY859VCE/Ka+j09S8g7+mAT3K0bdPEnGsYJG1cl3MDY5YjJjqPi2Yj1VfjJFhx89dEvMNJp3KSvvN3EmgzfFS3V3TaS4jJCMv+WtRnNQ6QyOHBlMs/YEwI5IS1L17EuIvpFaQvcJTd0ueuZjnICYmLnl6rLCuWSnOTpyJFmdPawpo13UivClEAO7ZvqOYJ5w/IO4P9h2Jh7wenJnymP+lc3TH4xY2ucemXfiXJ1XP+mKeWmW69jMG/9oPoeAyaaHmMYMUnZR/tAtplKfRiyHWsd57EXvv/5vD6EFRdpgxFgWBNJ5wZhiQhcZ8WKSI694nffN7TWiohmbq+Wc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700016)(18002099003)(56012099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PsA7o3t/vy40cxDsmK+L77yw6MvmNT9U5HHiqAp0KxJCejk+s2o65MHEwjcOKHv5N9p0X7WxYfRIPhBdOsjz84mCGYgQWddJidBQKLuyDPO7j1fHys7Q872DRFPYxjXq32vQEtxFHKjLGjOUn1V2l+GSpP1QedWg5vhYMICoCjDBOcJEtafHY5e3780qRRudBFJ7Mu+tE5qARLCCQ8+XDDGv0oZ5X0fbtRmHiDkm8vouBC8Y3B4ktJos5xNrTcbpi5JauL2es1gbSzDsXvFf86eI7tJL0MXNsSvlTbxw5+QaQ9lld0iopz9/gy3gHnplkFB1IsSve4UMIKf1Qb5FsJAqKXvKX/KU0zoVbPQG53q0Sk9nZ+y7Dnr5r0nm/InaT7HX1xCmVBKk8bWymCkhoYB62q86pbcRS+qQGU0qKvTqHL9R16mxh977VDFTJoHh
X-Exchange-RoutingPolicyChecked:
	PELyDdh8LFIArRWiCZeB+kehnGmXPguMqA5FqVNlvJTx+lBCGw3b2GBPYENTH7XUmKW3ZcZ6OwcsXcVZViaXProzsJyHyIkMBSiO+2DWjG/Bx7YkofxcdEJU7JKMrnwU5Zlke+fO3EoXYXWAW0bE0TMxqKvEFvcrQBb5oNSqod9atCDTIPKBoegsu4YZyN5qd2JZ9PfHBySCJQEUyZ15WxRIgf55KjIr1ZhxppEhMfetYZQ2OWqxGrFtfLaFao9GxDoNIxDyf8WbIddDdqKGJ97ezi/tpN9CeiRrgYOFTqQIVIhuAtL2H00IHiNwiBoFMN5LCSbcYiT8sLWU32sOdw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:14.9584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5caac2-7df9-4016-6f0d-08deaac61a29
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8174
X-Proofpoint-ORIG-GUID: x6EdPU91MJPhmME5kmw6IkQ3ozmpPFKx
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f53 cx=c_pps
 a=hJoePaVs+Aefu24hhViaWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX7AV5gaBywp5+
 IZtFfqA2ymfgn7nagFm07kUG+plXneW3ymZfvD1HN4XqA+2j0yPdikAlHEIK3cvJCkK1pkyHExt
 FaPDjP9AmxKegnwg5v0CJa+S0Fm8e/7zV3xX9AiHHFHkR5oK7PWb08TGG5kyM/94OgQKdqCtfJ1
 51j9p/8lY/hSI9mXuQ0mACsYMBHvhG+q4lVkjuoXghVgIHH7qouCGTmMH0D21A5oAVugXUbl8UX
 Dk/ucg+3aIG6NW83RrUGp0sqIYV8hZaO9jOn53FSRL5vy4KLuwVu1j8bo+brzi2ajMqsHMtaJ2w
 fs6YDwC08FzJgtnQ2arPQ0mXFg5Du1IAt8i7PztljhNsbeFgYTbGCRBWdFfkNxOjV8fwZztY7ll
 0Zw0DrzlH5YmZjuY17ABLso4MqH/sXVXZs37Ajs120yMPRau8H1oX1XeaoLwD8LcK/m1w4KwLYE
 NPPCRgGZG5A/oNT+tpQ==
X-Proofpoint-GUID: x6EdPU91MJPhmME5kmw6IkQ3ozmpPFKx
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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

