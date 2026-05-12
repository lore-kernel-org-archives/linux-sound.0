Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54884C77C9;
	Tue, 12 May 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580868; cv=fail; b=jk1TQYKPSL6dBadN0LuTAZBlYGAIuxUZWcphvwLrpgbFGu55if4hTBMduJFyWYqps9d6W1lQvQ0hqc096uck5rpjbCD+GZeI4Abx+V6OLlLs0jLB8Kt4INdkrWf7IqHPntOGyQC9qCPA1MONsvpfxuWswwl0K8coHxY0ufqpd5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580868; c=relaxed/simple;
	bh=IeQJGc5aEif5sXVJLyw8t+R3PROTngDBovcRUB3ZNns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWR2ACuwUYsYGUlRh5q1hEYjiuqDLvybpo9ukBkQShPUc+bql9NnAV179M/j23ny6UUMQef1QKAoZB9dvdbYeQKkITJt+2tHdRJBZdYIBwrJrw4H5KajPRcKWRzeI/zR6eNNO3E52rqeSgGxoTzGfazpc19nvZvkN2GUOsIz1BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R51EWnBa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XjJ1iIrw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R51EWnBa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XjJ1iIrw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C12QuL1137580;
	Tue, 12 May 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NDpqS64vqK/qRBgs/RYRdYNyCZXUvZBYj8gqPODdwTc=; b=
	R51EWnBajqQqiBnQFhlCstRoF8O3Of3qD0tB8/dXDKILpz/WhkoaJyzpwocpUQuY
	eqjYx/D1tU52suDC4Da4ONDzJP83IVm9TEtAzwrea2vh4ay3jz8UY3oHdDDPjXsc
	2H8ARc2Hnyk+N8GLMX8/p8axtT4EaKIzupbPELwXfIgStGLb4m+BVLrjtbz7tkaU
	2SXD+NyCFcZx39/PgVQAOaAz52qbggChe3Q86LOUjEJ9E3vnOuiKFfKk0OMe8kEd
	lk324aRcJWPfwv1oAUeEbSgeUsZW5Kxv0McsZ7fNaNpfRdIAOuFN2lm8O4dvqfZ4
	UvUp3cPqrAaTpaI1PdLirA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020127.outbound.protection.outlook.com [40.93.198.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bm+pXZBYuOzomvDfetyihhncMBh5Rx299ntUSqn2xhEMSNyhICMybie+vjw7XInhguQznnAIouVyChlbdq1bSB6o4r6Kao9h1uYhlg6SilYt8hjXtWuY83hlVPT8cNFXChet3qz9sWhCD8nvOdBgWuhEassQrj7Qt+f8cxWzBnVnEJSHjx8yaw7FEOu9g3/YL3snC/ovICaZc3kFMbKsHnk68cRhbGlJYzANE2VmtFdU+YMOQ4vIpdEIYQ6KbAUCkX5WdnQMyxoVLCCKejwEQllKQTCbNUDiYMvIhCuVIZdyk75lug7oI6ddNPLbIwLlnXfodIEoOsThHDGFyIUo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDpqS64vqK/qRBgs/RYRdYNyCZXUvZBYj8gqPODdwTc=;
 b=JySwWljAMj6sC2LdO/imsqSeEiZv7fH5Mr5ae5T1G2R/zGYbDrt8pbcgemvLwy04pD5R91SPVi0My7Mz0kDRTeFLDPZ/v07wMdhPtqDhYosmU2nYpLy+J+eOvSGyYnVA6Rv79MeXlpK+jr3vTzqfhCLV9toapnZGDGxfCIicdC527cKpVPXIG4YSFepTyrrJWhV09fQL/PIFvsxbwBrkbPxlcU48JfS8M90nK6bsrrpzx54xUihpuK5eO/Icrrieyk/aHIpwtPYgQGuEPqYQLz3QyTHYf/1PHuVgxiUKHe+79gSUd9q8lc0xP69Uje5YyYu4DXAX1e+n+ay12EyT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDpqS64vqK/qRBgs/RYRdYNyCZXUvZBYj8gqPODdwTc=;
 b=XjJ1iIrwt1Q7CgUY1tB0KZn3uJ89AZtEiXnYiSKu+CJ5ndZcW/wot2DoIl9TovK28TIuapHRbAvEDieC92ZCElg1C3fBvYz1sF7Jiy1YI67O2nOnUr7e44bgIaELGYadw5cSgPSXO/vOpTLQHGFJ0jQRCeRzqeTTAclHvsSJ6fA=
Received: from BN1PR14CA0001.namprd14.prod.outlook.com (2603:10b6:408:e3::6)
 by CH2PR19MB3991.namprd19.prod.outlook.com (2603:10b6:610:a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 10:13:54 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::2f) by BN1PR14CA0001.outlook.office365.com
 (2603:10b6:408:e3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B95BF40655B;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A397C82254A;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 05/18] ASoC: max98373: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:35 +0100
Message-ID: <20260512101348.1138044-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CH2PR19MB3991:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 57700055-fde8-43c4-e9cc-08deb00f2bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|61400799027|82310400026|3023799003|16102099003|18002099003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FZi+a/gUHBqj3OjfGTRxE/sd1KGh9tJSvLljWgHFHZFtyJJdae95OlFRWPez+Y/Vv44LlWBdjFXkS6N3lKL/W/sIqcguGwasJeksxID9kjlPI44DPNdTKJAfWKkTQkNSOYNmIW0fGcMPv2QqD8LgDN5RN/I/Y1C1mxUo0hGgJxeEEjTfZl2ZCYe+8cmpdNjjhtkpuvC4sj8OxA3h4HHBUYAG0Hgt4i9bOePiGCtMkbxPC8omtSfQUMKoUdYK9iihD+m1Ttr6Ija62gTeq/9S4CkEzfz4Kp3XA+uho1AdpCvj0WxbOesOnoabET1TCU6y5zhNT7Eoul3cX5TwoNhzv9j7cWOy4OK9UwIocc6cgBRiGdyjOeXF6ZYEXyOmdP69STXjm7U9ztpCrzkqRwkbH0fcRpA9U00yVwSVoFN5G0NHNTL052KuQHJ8kiweWJntUEvh9meoHj+Fa9X65C07sd6na1dAqDKdqThw9+u/yYWO5RzWlK5tMxCVPayqVMO2AavXbNvw0mt1yuZ3Q32tt394ItidTYIgDtrDtJwd/GdzHNhQrpGJMcogR3pErSVYAz619YcGpHomHoyLznyFJpkrh79NYR74A0wysBzkxhxnpPwlKzH4NOvE8R8DsveF2VMTmF3vzd/iOD8bKS16qznI6fYNJDcysS4jfwlZ+ifk+ZECpSXoVx9WH1hZG2EuRnQWKRVPLy6QccuBaPtoqVou5bYMOh3avftZfxLxZRQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(61400799027)(82310400026)(3023799003)(16102099003)(18002099003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cxSBA0+lbnYgKm9EwlQNDrVXgSBqEYUDyGvoIDzhh7+oa+4U0E+WpH1Amg9TF8Q167upytfJ/Hcgyh+vzWWFEHth3BdW0Yb+u/IjvFztpNFuP2UJAF8CxSLWN4zPYTJxTD+MRbFF4LjjN1eLRrs4nGAUI4RDb02iaiIpZm7kurcvMNWMNJv4Hsh/rXqstZyXUlpklQg1Dvqf6RkNHXqjhVe6aal7x6P3xUAGImVw2WOEoio3ucanThXlBd+KKEw7Dm4+CgQCLkjU77xZRt2mDlhXeutjyesMK8dA72XPd0ECjTWhMcMhsVRWg2+PEnITBpGHTTp2CTqcLQe0WVA+2MAfIW7kQWIpCAlbmLeGILUFYJqAbZxpj2XrKmU/7bbydl5hKikVMkkJSgfgdXwPkL66JwphjFFFoVNWma9jfRli4MoLvD8R1aCzW+8t+/st
X-Exchange-RoutingPolicyChecked:
	KgH2LA5agLR1jAE9+2ndCN4PGF6MGXfDOMlgOHkBMVzAqG4kNjbsc3aBFVI54SK44M+6C4b5kCKUqJ2HBt+L22ndBPpDSrrKUsSCIAaDBe37kYdUUFvdDArPxKCyiOvnt8KxfH1pH3mMjb+1y9JOCyy989Xz1pntIyIDzSqgjVXHoysMSRzO7Y6FTgv2pPS7dZZzbOCD9KdCxCLBhSIssdMYop3NWp6qfdAZ1X5cfanJs8iDDAaWkJUIUzybRhWornSEH4FsnzjhOhdq9jw0jQZ0BPvi4hCUtZa9M1QauqdEFtTqwP5W4s9Myb4uesnruM3oD/ds2YTAyUojL+BbKw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:53.5470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57700055-fde8-43c4-e9cc-08deb00f2bb7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3991
X-Proofpoint-GUID: MW1rldmWxfJjE3hv3zJceaGmhxNgUoSU
X-Proofpoint-ORIG-GUID: MW1rldmWxfJjE3hv3zJceaGmhxNgUoSU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfXxfOh6K3+sfEA
 GV6p4/DKP8rd3k0QYn9KH1ih5Hl+bkVuNh8GFS3JhbmRfyOcbWWm2p+m15KkVEMbSQ0yCkoIKtk
 /cgLUmHdmKyiulonQL28OcsLedsu7E1gzwNStpTBzKi8VCQGInOiju45O5467Wwe5kcZb4T+mYY
 hx5JhAT0IE0LFe+56FZV7xK53OWzt9CreUyyIH87l/P6axwtDUDjeir1wOSfYJttC2C4v/dK0Ux
 HOHGX9yzqSg7xlQPrhDIECBkyg4exSknuS0KNrpULy1dpzGX/uwhc/7EW+f/GzKPxdDYjoi+o41
 xqt08NyBMBk6zO9LHpMLeKW03SDINE+yOSwinS+zzb8OU093+y/h/KGYfUk56yHle9gmCX8gdiA
 mZu1UtkWfcAF2l65h7DRb0+QWemwBbiDrDrvkxfEik2STuMbUulwo18ij9MxTqmcMc4lWnsB+TU
 GGlpslSjKz+koAdpfRQ==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd66 cx=c_pps
 a=eXjbGYYLs/cxvPp3erIRkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=b3l-KXf1wl6CWbw1ZukA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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

