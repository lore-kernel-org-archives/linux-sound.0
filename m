Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D54F33D6F7;
	Tue,  2 Jun 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396085; cv=fail; b=eMHs+2QkBrObGWgp2sAnqJfjLSLuCzNv9edWYPKytWsuxOVa0DPIVkUc02F6l/BMz97dlRM1mGbJvKLGyM9T13lRpftnDxIzWOB/a1d5wN2G+GxGKB4ferkL3syPbrvSsydmnvEv3mU5Bgy/RfRzWPHPZtPdN5Rm1XQoTIUceyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396085; c=relaxed/simple;
	bh=QDCZqZz7Cw4kck2f351da7brodj8xxnB+ZfVoP4tRSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qcRYW6azUiJeX9+pyLwXVItMPlXbKbvrk3lVxSTCQB1tZaEQse19RUu0rIRvRlTLXIo0M7sSbWLZyM0xlsenjdHYDAo0kyxOkx8RIqUj3u6if94qQL6LoITog4ZmFG0MZyC573CCXgz48HSIfyxcpHprI3OD8zLP/4N5kqJbXXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UE1dhKLa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TcUJ49OR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UE1dhKLa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TcUJ49OR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524A49a3541339;
	Tue, 2 Jun 2026 05:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=xg9uwfj0wnrPJLWG
	NjmsS1odgcU83gdpMwbxZ6Et27w=; b=UE1dhKLafCDLzsA+2mw10IwL38ecj63x
	qkkSv3uLOXRvOZDLuf+MgL4pdpDmNncWgEPaFWwGucLKRNY6a+VevBFYnXH10GBn
	xksBdGaN2dgoGxYn0X28Z44SK8vBa90bHClMT69BHAcEbfr7ETg72B8isBE2OgvJ
	R3arvXYG9REFlhikxjSbNUqtJQiWWciieBNVDmap73R12+lY02xBboYrDp7gHWZU
	fEhqdVD+410aIxYLB0pvc9YCChK7LVYcWXn5R/c0z7e5pPX3jGcmlNCBPBup7GLd
	O9mY0aaZk2kwgaoOB6H5AiZZk2YPjCcss7VL8dN0UHjsdvqs9/5y0g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020125.outbound.protection.outlook.com [52.101.56.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagc3mt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 05:27:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvFNtDFXuKJD+PEZHTwFG1bsg8mUJz9U8K6yc0DF2TcCyMTc142PVrsaGIF8jOSqceuRvMmef09ImkM4AEXCfkQB4EfsceX3tU/j27WrgmPOYPetAI4mrT2YFRhwhZkBIg0P+lEJh0U0kXTLS5J3PGc71ABnBeu43UqOhFjmdlWGieBocpPji9xNCGHRy2bAJ7t8sy5r2VxaGcXKF3sT+ORBKQi9EJAIAiOa/IhBFcwyPFnH7UoTHGDG4sKFcalOOhG4sWQM/iOpb0MBlOXVgbnCQec5eL/8RVgCIXTkr+BRKMETXFNTObZdK2Onf/tW5TkR5VkOn2U40pBCSvFefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg9uwfj0wnrPJLWGNjmsS1odgcU83gdpMwbxZ6Et27w=;
 b=Z36F1RhGIFtTVUq2jh1LBDct3oAbEZdqgCa0UNwp0AuDEyI4OVLvTBnZNAXvieP/TL905zDo4at+QDmYnYtiZu2Swv5H+EYno2YBEfd3WPA6y6xcOCPrHiC8PNp/8J6Zf56q0Xj+sCBqqiQJSBuUX7VZ9BJFg3Bwo/7A4BtIa+9NWVAn3TpepQWrwXYYfVwMgkX2xkp2gdNEbYTcacfw1MpmpDBIXMwphwiymT9jBNsMBCGZcO+nAk5zVARtc3euQEMSqFBjRg4SawFcgG8O871ZiRj975HIKZI7cw5s0cinCHlm6/o/6n4do7212RaUfAnhWNKegKpa3xNRLe1VEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg9uwfj0wnrPJLWGNjmsS1odgcU83gdpMwbxZ6Et27w=;
 b=TcUJ49ORD8Za+DBDGAnquQIxB/znBUe5w9ZHw0hHpJuIXoNS6w++rXy33Ba/CaKH7p+TyNdqkiaGNDp47R+813bvspzysce8PNGSP19ysyOVCkfdhUOq5eA+DRbcl6wzfH/DVXvLcO56JamMDwA57nx31tv8SMgIhVou2gZT3Wo=
Received: from DS7P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::24) by
 DS2PR19MB9126.namprd19.prod.outlook.com (2603:10b6:8:2b9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Tue, 2 Jun 2026 10:27:54 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::c) by DS7P220CA0036.outlook.office365.com
 (2603:10b6:8:223::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 10:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 10:27:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8758D406540;
	Tue,  2 Jun 2026 10:27:52 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 78240820244;
	Tue,  2 Jun 2026 10:27:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, zhangyi@everest-semi.com, nathan@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: es9356: Use new SoundWire enumeration helper
Date: Tue,  2 Jun 2026 11:27:49 +0100
Message-ID: <20260602102749.3962261-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|DS2PR19MB9126:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8aa1800d-b7dc-4b54-60e9-08dec0919b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|3023799007|6133799003|13003099007|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	F2H6U73503CcciZbNnautCama1n22G9HYGKEywOxSuk7iFFlsNLaf1jNtAk5tFYvwSNcJFrB5ckiSuhrCKCw3A7ZHO8toKJmqNf73JqkhFdkXniId/Q6Cif7yUSeJE/iSdyf5M7GuXpQ+uWlXvk7t5EDqMe9jgeWG6UyxQw4p4C3Si4zmoN7YCjlArPuE+Gx1IpBn3WaDiel79BfzfM8lIqNHfDn6bZqiPOrRe/3pQEwR10+vmpR2UuNPlMmhXf+jfpDp40fTqrNu1INLVhKG9DspG6PC96qzkb16Uwqo94wDDrwDLi00aZ/YVL96nQ2/ga1uAZHmteCdZPq7ooUxvZep2LbD+REpvBTsFh+IEY/SaE+3yndglTSmsm562QMhHP87J40FIVhfvEB4GcKcI02CT8OWsowZ1B9b5pzpjNLTn3uxYdXDQ7lpMPKjf8En9vYDyXEQzuTQ4WL0uqSBBC5gawn/DFUlJt2R0KqXJlzXe5x7jQ4xFW1yrCAdG0FMscNadsbNNKIbeXitncCDgNTFUCvaaJX9OMkBlIgvB2U9VkDG1pXv822y1Zm41va7W8gTXsemZRydFf+V+hGv9ZIWAwmL4dW6tuvEvrbJu46Ht8R5Cn7csqswfxs99ju9NtemN44HMwsXJ9lrS7l0Ae7GoAZIMzOSEDITcHFAVJtqLwCxSfxhm5f0so43/JQcTxaKvCyPan7WVL6Nmnhe8OnBr31Xf7m4rhqmZtE/BI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(3023799007)(6133799003)(13003099007)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NM2/DOjOk6QLrQMzJlHSelT3kLEc4JyN92KBxPn2JUwG02vnuMzVgFS06vKhWCdULZPzzpv8Y1w58e7ibJwRcLxMfSIfGyZsMGyEeKjOQIWI6n2l/Qoo/qwM7GRNHpyyE4amqnYHbmp9j/sPMqarYie/nkqw2Wl7PlwOx78uyL3UpwFVNfqy2KTkHtWcf/hMVSb6BcS6v2Tg3tBFJgohwiV8KDz4FNjlWKLXjanpxee+JJuXU6gQjC7RqZ7LlfdBR7KcIPvtCIUCwVYJHdU3O6xADyEFrVcyIp6z82n6EyhBs9SlNY3SsbXyvYispLOkUUXQp4c5IAy2eqTBiTkTjSsVcpiar9kMcRarBg4SxAUEaglBPyfMvGIKG1JOQXRmPyq+FgSN+h9uJ+HcQ5cmOuWKW/vrlfe99OrhJLDqpn08pkqFQNlecKeNsfo/NiUm
X-Exchange-RoutingPolicyChecked:
	EDhIJEab0Q4AwLxzAPttJPEMaQOpv3gXd6Mw/T4yaGOouyt9qXx+dirJFYjKtYNbiJWeFxCSO5Hqt8wU9u+N96urcB0xVOHW7uCxmBWDXNDt7YdD/9XunzPdU7pa/vO/Ze7jfGZ5yPdJ6VJNmY6xAI2L5uRN0udKz6pLd9vZzXKej/fkGIYFrS8s0PgAs2UgiDr85aidQx6lM0RlddKP09tAkpU/CSniZ9P0xz4FOlau2jweMn85sEow+gmOA5df4ICHFRmicPfJzzqq8+K0Mj2fiw4f6rmtKZ+LLzvhCReOWfXh2Jb9/5MZVbMYeVwTm7exijyAFlzS+UBVNA2J2A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:27:53.6633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa1800d-b7dc-4b54-60e9-08dec0919b2d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5OSBTYWx0ZWRfX6IVEw6yxfjkz
 6cSYhz6jrf8PYrO0tN5WRT/0zMmQ2F+8lDV8P3mJrTyyeG0IIyiowhbpXqZmSoUt1Xa4Cg0BMrr
 8pMeS3xE7AEeer6eSGahIzl7Hdn8zhoYcjfVwDBcLGVMqolMsQd5Pzqtc6m6fnxoRT+9jYliEgM
 IIYwc2YLSG7OuAYB9hWh6iHM0Q12pz8yfTj+LypfJ86qvZ/0J1r9D66IeQ0h0AnJ0GCR914gw3Z
 XEcJtcEDajVI5Ermt9prD4xcw0KvAArOOLe3OrmxGyssmYiQ5e4W2UozEM2MX0SNWPD2GuwLi1k
 MRVij0xzZlXpxJTNxrfH3jZ/jbbC/mTqaq1VnOGskEwT12ULqDj3ftL4pwZIi9vJTlIlpQHbq6H
 xS0wbgxP80u/fXHNMpx453wWzPkvq+cu6ZQS9kk5QGUvDUoxBbh39Wj+UiR8YV4657HfndLeG1I
 6WzFBWzkcPjJ5dzOQhw==
X-Proofpoint-GUID: uOIGOKW-tA_eLXzdUI8G2_RSiPxoTyFf
X-Proofpoint-ORIG-GUID: uOIGOKW-tA_eLXzdUI8G2_RSiPxoTyFf
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a1eb02c cx=c_pps
 a=qoAvcrxUHY3FHMzwJxUv3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=RSNFnDTKUff3PuC_oEkA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Link: https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/es9356.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 78fddd9d01711..670e918b56a46 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -1105,24 +1105,15 @@ static int es9356_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
-	if (!slave->unattach_request) {
+	if (!slave->unattach_request)
 		es9356->disable_irq = false;
-		goto regmap_sync;
-	}
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(es9356_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
 
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(es9356->regmap, false);
 	regcache_sync(es9356->regmap);
 	return 0;
-- 
2.47.3

