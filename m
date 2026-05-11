Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22163FD147;
	Mon, 11 May 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508682; cv=fail; b=rgbBLOL873unZdEdNYzacxf+6716beL2g+lUwxxDSFMn0AmVS2pdNDqyg/Poz9Kiti12SrLEz5KewC6lCld7xDleZBiR5EeubNHOHVQN7F3Wnvxj6PQTmMku+fdCfOiUqGv5DnvzYfZRrdc5pSglgRWaAGOKvzxKw+n0/Bqdhe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508682; c=relaxed/simple;
	bh=M+2Bk9mNSqaXkzhAtEnNSw5F7Cgu4warb3rv+m9b4Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+I1cuM0u8iDs+kxdQ3koJWjo8q/BB908ziQPS0Z3rD1PKFjEHk76P96wpOKCdcpbjzmnmg4h0Oj1PgXqqGfWy2mef5nWzaHDUtdBSIe7Hty+XwBSjpLZjA9jzUDEBCYoXcIlwc1P96oV84fE/J7PdHBq9C6U0Gl55wrui/HnbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hMvuDkdr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iIIKGl8k; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hMvuDkdr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iIIKGl8k"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5uSGA3470159;
	Mon, 11 May 2026 09:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5cXkP0WKkbwNftX9jURrTa+N/MQv4LhSc4AmBj31Btg=; b=
	hMvuDkdrtJ5Xdnoqu4RpLjCqIwVJgBFRSG7kzmt90B80My4rzhcXje2xQKK7yJt1
	cxivLDGi5Sm2C9LfnlJQ2CKy5b7JYlsstxD579ES5bztLhpYfVr/iqmZZZvWGZLX
	0f8QC44KK5MDKFst1QBa9DbM4MHGpOcFkxpdMCXy4DNAVDsu8K4wo6SifQwRG5QF
	zqZCZMVVk4qd4WrDzbjYSw+XcvZVE0pV/PW5ztvja/OuFe7yQwkGZZ9VTEXvRIio
	eiSOuleR+moQ+G2H5lOKh76dCEClWq0XBRoJBraoztAe8PwqcC5wWcBZ4Ocp6Uur
	l/roMk3O8IJ+31o+UNAjwA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020142.outbound.protection.outlook.com [52.101.61.142])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3ty-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOLxYlsBY1Mk8bsLIClW2QPVBeANSaW4hEh+MIBDORLFnEzgUOeqFU8w2K2ChssJuUwY7ye28FswIN2Sr25mb0jT0F2qOQp0qvRY1Scd4+BHYZKoYtNG6r/X/Pvmy9rk3FFxLxRIw/Bqwmv7WGMGy9FnkomoBqVBI3Saw/1ruIt4l57hpwIfrU1ewk7Zz9CdoosDFGmAoV+9yDMmO1Q58m+O3WFfmdq5+b0QxxmyVLLIsO1no0a/Sbz4lOIt+36I25qqZfcAUe+xIX+mMak8ph3MbYgR2b7iAELPDoV5bRhIH3RmuaotSpky26ETqvBLQENAeylyXvD3f4geoTO/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cXkP0WKkbwNftX9jURrTa+N/MQv4LhSc4AmBj31Btg=;
 b=OLSoTL4JrVU21K/QuAoaOgtyzmTQ1IXaOcXYSO08Brw6e43iiSSC7ndqDhTu2uI6e16lIEeQXjYA7NqC62HFqT6o7bkZcZXQJtg4terD5DkQQmTawdsBYlDSQeF+W28NMYm0saUpqS3RRjyUcRDgrzMNCZwPXpDH6FswSyIK+PqHSNdCAMHKHQPFQ4cu5RVXgFZKBTvN/SB5D9itBymP7uoPw1ZeWOJz4ssjtSAgpkzOTfPdEX7eUDR6PLOExvLQF1GdS8zmJCjugzvJnKnsLK3qisMOYXmPCGJoMGF/ojRkoOb6uhNSGUpD4IFXe8AqLhEyzBw206WOaxztJSfzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cXkP0WKkbwNftX9jURrTa+N/MQv4LhSc4AmBj31Btg=;
 b=iIIKGl8kLYtJYw01otPagcE84pH4XtA4XFdM52Rs5oi9cgeXdFNRA8jioqxf8VSSEL+i0NlC8tS0lE4wnzU4Qnqj2ckldcEsR9H/xKl3BFdtDkdmdMhQou3iD/wLuw518mAaPzsa9n1FfjPUn6Q1iagr+jfd5GNMSBGHAFddiv0=
Received: from SJ0PR05CA0071.namprd05.prod.outlook.com (2603:10b6:a03:332::16)
 by DS0PR19MB6455.namprd19.prod.outlook.com (2603:10b6:8:cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:37 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::f) by SJ0PR05CA0071.outlook.office365.com
 (2603:10b6:a03:332::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Mon, 11
 May 2026 14:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 896E540655A;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4D401822545;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 05/18] ASoC: max98373: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:16 +0100
Message-ID: <20260511141029.851125-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|DS0PR19MB6455:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 29c9f0e4-7756-4513-829d-08deaf6712f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|61400799027|18002099003|22082099003|16102099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	2qaUv0/rmRDRWal4esPXDpo3cw+dsrtmzUy6dsqK45slQe/0e7svLNM7tcs+NXT36Gdvg6MgEW/G99fJ9o2qFPem3j/k8+daidGd5A98k3Oa+UmELjGwChfj3TbplbW4Odg8F+xG2oheB/L5l9Bud3pVnnrKC8sI9UMi1M8xJfURtpNpoSgm07LvxmUrozzkYNYLOYyC8a6Hhd1F2rM+qPg4HKo50G8UWBaL/sFNr143xIPqlKbXsyNJi1kjHg6RNDns0MzottrAh0KqxlYA+ew+o0UJGO4QXRRNyqiz6BpuwFiXhUfPTbE7kyX6G6yA2mkkPUnHWsklou4WNG1N0jOf7/8gqXhFrcFe5gFOp/NAf1WGHo3DT894XcGMAS5WFn2UZWkwlugv/WhYm+g6/FH6Xr9h3+JwHvLAOzHSJXLRdYakfQtdjW94+38POO9gFjCOi3VZ0rq6cIMmEddC+mW3i7G8twgDS2QyVKdS7R2112yn9nWWEV27w597mrGBvUqNaWJ00wqluRJBkKvWoe2Sk/MFRYbfxVZBFqYxXczOkl0DOjRCJF9OARmOfsb+XnOAupfNoOWNId6Lb0RPH8Ys6BIpG8ZqCzXsqblMYUESrA5w5UKO22ywcEU198AE5UKu9T22dFRv22ypEG3gIrlwLc0S2F7ytDpxDVG8KMfPwncT52mYrGJzeQG0gzn0RCMUXWGw0RkMqZ3baF9MYsqM+8NS/dwPXFfyFPI6q7A=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(22082099003)(16102099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zNfY+ISO7iBafWuZAmv6EdV/pjGuPH0jIjfQDxcSlMftMLGzrTBno7k5Z0nxWBupDvTYFtClYG4/YexYtMOnzF/YHrC2ZpNFZtpngyAFPBf/Pex1Kx7oDUU/r2fso4pPvmjeRPMjkjBYwRrPAi2jJJWdQ7SH1rRAqt9Rxu+UzDbYc6kSuUahJo7uqm0VDtmSrl1/owwAC5p6cv7ImR4X6Ocq/6yt3dLufNYo5fWo4SGkNVxm20psIKvClpMWH8MFW3FI95nTg+LqlHH2y3ONQeZy+3vvcopt2dqMxOUEyhFST61FNDkxLjOjenAcRQT6F9s+hRHf26X/vGvYASQ1ESnXUVJdncsEUuXlrGMlchhOTVeubSvObiPTXYftIUnXWOxQq9/Gd+qwf3PdP3MGhGS+YNvOWj14bEk6ElnPckMzN78eWpFBFMlI5uQXPRu0
X-Exchange-RoutingPolicyChecked:
	nadlYDwP7Jl3WNP/jTs1M3o4RW005lmvN8/zXbBe8pPfcbKGFi5zBusFtrBhVFPiOPFM/UaQYXgn+ttTe4dwmmADnndNLpLh5dIfU0Ck1AK5FQQdqM8SDpIHM0gpaI99vdBwHSbdLvi8KU0OtaKullIvd9IOvDp+VWYKuDMREpjA+9Z2OQwPPdhc5dHW1dLt7EeryGcSJOusT/9nWDrdFFklfxthilH7CjT2uY51XQPQbEnyZvJbnSO3jiw5kdYcN+likHDPzvLODb3BSLsSygdpqAmKIJRcft8NMzSjFpAjyBwTQNSyoQtu5AHCjWOzYP7Gip2TMPpqOId/tPaEpQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:36.4769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c9f0e4-7756-4513-829d-08deaf6712f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6455
X-Proofpoint-GUID: cSF60TvtQwE9cohlYdoHP6b2cSlhSDgi
X-Proofpoint-ORIG-GUID: cSF60TvtQwE9cohlYdoHP6b2cSlhSDgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX3zU2MEIoR4TH
 pUxGV9pX8ATxyB7CsZppHu2Rh6hagWdtObRnT78ek/AELoCqa62gUOcbY3qJEmQrwOkgMQVp1WA
 DhLkP7NS8CyCqW+tDK4p7lDoY5pntE5Nz6kniRLTmkfBixBBPkpNCKhwlTMv05S+nuR0zpwmmdp
 AE2w7OY/MONWprv0KlG7/gsT0mjvF1sl2hvXVudJRmw2UTbapLaEHi8Uoj4mt6C0r+WyoHJbSb+
 pFvTwyZ2M48TQchAr71IqqNtmi9JZ2IzXjZ1egshGRnpCmD6mZRDsqlMmWCuTUOTmlQ41E+Of87
 NuCNZbcCjMg06oYLIhNpfeHDxkbkNeM3XymsW1OQWpusJX67GEr+9fep47Mw9dvKakUjny6ER8g
 cagthHG50qmkCbwmS4pIoJNU1WvCNQ6GWogKyOgfvMobzYBApAvf9IAKaYzsVwpG3wdly4W+aU7
 ygZltxRbr6Qld8QjbSQ==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e363 cx=c_pps
 a=aEC+72U9RCav9gZ+GiM7dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=b3l-KXf1wl6CWbw1ZukA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

