Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C74749550F;
	Tue,  5 May 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999733; cv=fail; b=azvayGObEpfKfWxPkj9xmDP3AHL/gXzstrgtiDwGYW1ucGnxHO7tcos0RWD3bxVHkXUC7NTLsUSs5XZ3LtiL/fK6NLQMe9ZpX46aV45MUZKZ3Ts2ZHg1b1NUcLjR0REI9L+5bH4OtG1edUxswakgK+WsNfkz3JY/H61IG/5N4Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999733; c=relaxed/simple;
	bh=53r+pyzAAuIZHxeb+HS/AojxtUyiEsbM8krp08n2jb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=osPLtUV7mF3Yl2f2GmuFTxdgpetvfIe5437gwhBwIeiJ/Z4QYC+zqx3pkIsWb6qQ9zOxzRog+mTbnEgkd+f7c6VEtXf7Wzg+ExpI8Ed9T1bHy4BaQnI3xyEZ1oaA/1PhaaJssVmCtRGUQXhv0RdvBcEz6IQ1rwrUQSZG8n41I2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jzfOAuxQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KY9nPOmG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jzfOAuxQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KY9nPOmG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455nR3h1839970;
	Tue, 5 May 2026 11:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AeKU5xeIsrGhSBtrV77u7vG7XPW0LXgISjSkImmfEiE=; b=
	jzfOAuxQgyuMbESzG04abBVDReu5gAWYPtjWoqcJlFvCqCJZsTJnz77BZm7zl1rf
	gblqXsBqcVM03/BtzzDPQ9Hv7JyUpNNb0heaF29imxV+jDJ5hTpAxBHj1TUYzgpT
	K1KdGcWiKbbvD+lxxo5ukm6rdSudx+0sZASEVS8R4s0yuyKO2gtafxzqssDrk4a3
	k9+nS7EytiOUED4OVtL916qyqO2d4Hiq6DEslIVcT+KFrKc05LoRhBoBSETrRAD5
	ZGS6pmCY/aFvuA3mE7aJvyEy+tKQUpMFTkWSOj7o1yW/ZyHhZ5EV+ZscGj6XhKTo
	dvjs3bGb1/hLJig1l+7+sA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022079.outbound.protection.outlook.com [40.93.195.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRKi8hpciIZ4ydyP5Ad7eRDLyEbaYGweLwSsAuVK2HmanrAbBmWETRgaclDjz9yU6Im/De80xzpYzNlLZNIswaTOSUM4EFm3XEW5lbPNDaE5upJWvjpNI0g/6IeOkiCjC1TDWjeQARVI9R9spbSRTyFCtJojxK4lTwhY5C+XN+6NEqawsLdtXy+FuIrLbafOsvfZ9LLScxTONx1XwbaqZ9AVrrr/rWTJOEpF6qAZTZBlZ7l38lraRgJhl9r0jFTCX2+5Ph2x4J48gogJVSuzvr1cc8C+Wznl4wE/XuUhBxco6H/Cde1e2mSf4ouxMAMNJzD+suuFimHa45DeUzNhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeKU5xeIsrGhSBtrV77u7vG7XPW0LXgISjSkImmfEiE=;
 b=QQhPvCFU3axFkmrFPDDnYf3eca6VTRR74EwksnyP8KaF5ABLjYFHkyCqRZMQtrgcvkkH0IflEIAeBsmUfOqxpKF2GX9Y/LCnJvF1a3cwoe/0doAlYTCMu/GAa0HFrgzUr5ruN8mVO5ToZV5yhq9RuaOOEO/OjPslZU58m5Njn6nLVd9uWiIflFwqMUTADH/BVc4ExUkDZNIC55+BB5Lx46++PeydYYvwHQkwCWp4sfCviUb2dZXH8GNdTXdg5rbgbnEKlGi7MdmtFOisz5QgxOQQZtrfC3GfS/eb7N5DF5ku7rCaX0LEhbPaJhLXYPMeiOZT+UT/PVvWuCRcqYYcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeKU5xeIsrGhSBtrV77u7vG7XPW0LXgISjSkImmfEiE=;
 b=KY9nPOmG8jD/3nHURs+YPAeaEh1SZqsYGBVWEYXL4et+PBK7ONjk6FrH+zUGVt6ivGI6yRsnCCaeGvqT5AYRJge3vwxJvASBjrTFO3LaKBoRvh5NEq4G7lcepVfwm3YbakLdHLjgBXv84qN4y5rk5+ZlnISki6k3JqY32XIXZcc=
Received: from DS7PR03CA0101.namprd03.prod.outlook.com (2603:10b6:5:3b7::16)
 by DS4PR19MB9074.namprd19.prod.outlook.com (2603:10b6:8:2a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:15 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::fe) by DS7PR03CA0101.outlook.office365.com
 (2603:10b6:5:3b7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4A877406560;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0FA0182254D;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 10/17] ASoC: rt722: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:00 +0100
Message-ID: <20260505164807.4108684-11-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DS4PR19MB9074:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 412e04fb-5c47-4364-2545-08deaac61a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|61400799027|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3uEmI2jfHdB8KzGs0Xs41x2dl+re9fTiIK+RUsXBjpk4apyjGL26hyokgl5EISzvk0uop8lu1a2UT31I/tph4jVNUwpoxnUkL1dswcfslZ32wdp7L50eqgSkfsU0F6Do/7dqlnhl+YZqWp8UCJJ80fWBY/Zfj4zhsOb9/3PPqeroHoFRnduyDDshuNmDC9XYgc/4ZHPM+qjnD8c7wXwmDQojOKPe/brxQp6YyVOrJBjCAOy6YY1+kxevlvbBLnOkJeujwiK77UgFQf97oN9Qd2LBHKqfkoze1a4rvVEODrnpxL7OB84qDJpLlvaymnx8aWAvyOX9yJDAei4XPm/9+i+ntG1IF3gH96gbj8V8YVoTj9BbgnYFgUDuUjNKuBM93NzIv53hVHyN/VZFiyYpTy7vkoXmp7Xq3LoQJeepds2/GmvbwZVr61lhwjEqmZPZrpS9ieTTZp4qfM03QOzgFR7pgCOZ/z0oGSIanhyEbIGONkcos+LOqsDPgTiYegJBIv/iYFO4yN3LMfXcgi/pXYkxgnjuP7Jh5sdMGFKcsT7XLyKPkL2YLQtw0b/k6ky2AXV+CfsDXTz0bcjx9dY4lKlrYRrHT4vmS5GyquRU5hf2UbEk+wDc10uxvYhHJYnuJOMMa+vmINWY2qYObhY1M5ch9bpml1zzeGCPOrgXt44qSP3BKxCsosSpYfMflz4rBbvdTdd3qruGHN154d0DTYf6YyArEVXFwRJesiUuUog=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(61400799027)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UEHbYrWyFXJtytvkFkEohVZXgMO8WruUpXrbndRonqGetH8UjgcomCBRQv0UtMaLmKZxH1da+AGul6R5WqgJT129JLF1Y4Kcuh5iyv+q9Je41D8MRqBK47OHdbk+ubfQH9EIFK2T8DO8t9FeAQKpv11P+1ckQZj8Vn7S7o/mNPHZwBgW/fUzrSkq+a61uth2OtsPI3/ijsKU1sR4ESwbuSRV0/SHrVTGpdAM7f65TJyUP5lQ0+/8JesRJngW7ZzHN/QNDy4pCo9F9e0sLAGtlY2LKdifvBlXWkG+2NbLOhS1SxJbxIOl+xvmkBt9iASVAiOsiid43E1ZA4xK6fE4Hf8xorjtsWreSH33MbKDFmZQNSPjpXE+F9ARZjqw2T4jLE5Q6ypufyAJZ5fWe3CoDMp3WpkPlWi0Le8B3GHwR/m7fh4xo8UP+td4ppTsRS6b
X-Exchange-RoutingPolicyChecked:
	KGkyECLO+Ke4w1YUgQ7Ijx375t4geTtY9oE2sKM4N0FUZqKM5TAPWi3CyTEE6StuN1686kldp3FYMYgszE5VkowEt72TBQQyEYP+pViA0SjGcvSfhUoEsnx5vuEt3+91U5gPF6Nwd2a7unlC1yKzzWht3ZzxJ40pFPOC9sgnTrO1x1T4bhYInDrItE8P3X91GFkg9eW6cppJbbQW+cbkVHOJ2HG6NRN45hFdVXQuNa/dHYWtsNJxrXBOLkje7+yGbwlpGBHjfSCF08ssU3FBFH40d2aLQBoC0jJp1FVd+CeriQyPXNIB1Fjp9ft9Svs3SrdSxAfBXeY5L7Ji/m8/xQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.1276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 412e04fb-5c47-4364-2545-08deaac61a43
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9074
X-Proofpoint-ORIG-GUID: DQe6LoPaLeOJ-phIO1mDw7CfSHotV2Gz
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f53 cx=c_pps
 a=ON2AtRasCbt5Ww1V1qMYlA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfXythYyH0O6U0+
 7A6wRaZoToEmi/B5qH0yM71N90YjAr7ys1zcTpK0DNi5kpuL2ORoYrry6rHzq1n1ZHioh/nwsmK
 otOfJt1epmQaAai/c3NGUXIZr5DVsTY7pVCKlb2KohAr/jVDK/QtqCUXmlNy7/J3UWeh2QxM5Bn
 eM/p+sBzZb71oW017n4R97XB1sGemVTCo5LtTfGDWt6EmdVFN5wbw0KqG12BFNUFoMHyXkc4QgI
 sU59mbLzYM8qFyDu2ITrQkSqlfSIVgoHyhFj+ItEIvVgNsGEdmWxTHQbQDyh7igeDpnOe7HW9w7
 hx9ZKdbvrjt7H+qzRYANscbckUjw26/exuexsjRKEsrCF/jzp9qusxPZ+utGv3SJDshve0jENcf
 te9LJiSSuzY1OrsDLZKy3jcaQdHmEg8+keRtJ89lxsJkXY/UkSr1jiBbTiJuXyYG8J8l7REnFbZ
 fqpM1mHTuqU+McwKB7w==
X-Proofpoint-GUID: DQe6LoPaLeOJ-phIO1mDw7CfSHotV2Gz
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0a5b3ffa90daf..a5feba3d0c182 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -501,7 +501,7 @@ static int rt722_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt722->first_hw_init)
 		return 0;
@@ -514,20 +514,12 @@ static int rt722_sdca_dev_resume(struct device *dev)
 			rt722->disable_irq = false;
 		}
 		mutex_unlock(&rt722->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT722_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt722->regmap, false);
 	regcache_sync(rt722->regmap);
 	return 0;
-- 
2.47.3

