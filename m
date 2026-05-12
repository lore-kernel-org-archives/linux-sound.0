Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D8383980;
	Tue, 12 May 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581915; cv=fail; b=boDCrxJ2JmeTaS/Op2RQlRXRBTQJU5PJCghJ/+g9goNp8Kx7GjMIcluy7JlAzawklyQrDRP7eYJN/0bKHVXnXfuMHzzgtwjexc0L4fhiwjV7YJhL1B1AN11gBDT+Zp8BCRJvQlWu1aAYoYu2/BKxtnSaTRq74xYPHkNPJKMdA0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581915; c=relaxed/simple;
	bh=3bCZHDoyU1wRzcZbzI9MEP5nWyR+JMTh45G0Il80E6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ux3C8wWTipMK7ZVg8AtkgaGangZb8CJhB8xSGVHASDIyzVxfA13+zR/YND5StAse/qwtVYRxZ/xU2POLWcXKO4j9dVxQa70M/xKLpQCIDMHh2ZfqAXhZqXtEHRLwzzNH3mPx+BiTyieTxMINYiNcP4kAOgI4TpGZ5pPmQaXzaYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dy1xTMdg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TboBUsg8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dy1xTMdg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TboBUsg8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4v9Bh797268;
	Tue, 12 May 2026 05:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=74ihewOyUFuZrJIpT3BXL38nRp9jLz0qd0dVUaI2I60=; b=
	dy1xTMdgbthyGs/TT5inafR2c9yVOnlyrAQgYD30/LB9R5kAQOF5omuwNw6wQR/Y
	QDCLGyLUFgnLr1xzeRRS6GCffCs7x7a1H53B4JpHTIhrhFJrfvWzUzDN9rHAGiXz
	JrN7+MrnSpQVzt2xhZaIfqTWus+A6FgMadqisXNh2CfetJELx4GdfpfN3sK0YZiJ
	HqRQDHVD1bPLvoVvzThOIvXc7sQDb3WCA29EmN7FWzJ0sEb4HtP3n+HHyfrePqXj
	aduMd6jkHbluZ/oTcHC8KYGHv5T5HHvlCT5QerSWTv3vL7OhDMOSeoFSvhVPtxd4
	742k+KwL8pjKBzj/b4ScDw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023128.outbound.protection.outlook.com [40.107.201.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRI9r2yNgpzvyAQOPicTE/CQuvPvOsZvPgzK1jgtYpjDWibpUKdFXEGEHqILL8l8lhwUB8MkRsU8kbkR8acgGJayMwFbQyEAPO1mZrd238QvSm9Vk/v7/JplykamnPgdK0keSBIAYqoiAVXQj77N3dLKPsug/wZhMfqGekThvPnNvauADxpsGH+VjzU5mHDizJ2e8j4A9uIpgMzVd7fne+V/MOZpjMTGjz/QG5jb259hq6aV3PABG7JjsS89yeLLXi2M1ms3vyxtCpKzYCqE4Lq1LQCoBZ2kag4OjTi0YrBSRpwWYqOmd5vpF3Xt1eWiaq7PgKXjfNpDvehOUo6LSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74ihewOyUFuZrJIpT3BXL38nRp9jLz0qd0dVUaI2I60=;
 b=Ni66bmioa1hFJhim71ErJnoQf1ehL5ovpWfkFHpEMlbkKcltevo5XucUCZyCBHQuGRG8uepkfYKxS+jxUqSwO7GqQtrmCJ3CXpglAP7ZxwFTn7L1Qb2aCk5SJxEs5qdPhqJT5uhhAtNbH1rjKlDohxOYj6TEC/j/WpMfOMIZq2yIErfIMplVtv951S9Z0bGQYuNhcoO6u4Za8H1C/PC9aMrdZCso8kualsg9dHqetb2dz6rNEqSot2Kujs1on5yZQdW78qv0LmkvXjSHNV6tMtuf3ciSwWGBLnzxXKN+Xn0Oot/S/Ylbyf20sxxK5kU1uQfBMOMSlyoNTGwxot9jwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74ihewOyUFuZrJIpT3BXL38nRp9jLz0qd0dVUaI2I60=;
 b=TboBUsg8qBPdpHxiVK1HNYR6qiXlL5gfl+NYY9fZ10W32EAryNJyuKm/3nd+aM5mg6PP/WWp7Mnir2+jXViO3a8odQpOuIMnqGBFqZv8Ah64cp772EbcZcWLeHUPPTVwjiUFENTQNJwEw75nDYpmdka2ujcJAOKaCOzpJVu9c6A=
Received: from MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::15)
 by CY8PR19MB6985.namprd19.prod.outlook.com (2603:10b6:930:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 10:31:07 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::7b) by MW4P220CA0010.outlook.office365.com
 (2603:10b6:303:115::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A4635406562;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6CBAC82255E;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 13/18] ASoC: rt1308: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:17 +0100
Message-ID: <20260512103022.1154645-14-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|CY8PR19MB6985:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c18bc75-c9ed-4da3-3b9f-08deb01193a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|7416014|82310400026|11063799003|3023799003|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T81CVMsqJ2L+S3hp3fO54FKXSwWrEU2EFlVzJWG8GF9Ai7PRNNsooPUeIMdRzy5opBrMfwq9mIFwPjOYTPl1bPWxol8mfYqymH9GiIzH9enVGhk067KBCCOl0HuU8iXUBfdhk0s2mrHfYbI2bTMsHS265PWFdwFJVCGQ4TX9AS/YXz9/95K+jACItClQHJj2LltwoRERgIekoOfxNQZIpe91ROk6yyyu3M5nzC+kUNS8WU5feiEQee7rwuOycdd9miKsW2+Ve+kfo5T0KyI6FTC55fVHNQS6qiR+SQGObjlRvEQyqRFPrMZ88vyphZGczBU+q8RysFqSO68aSd9MLRzdHd+Q73QxNeTosNulNYLMOgfCdEoI4uiRlLso3HYRgVDDRZfFopy7nfLX5h+khr4swpcXRB7W9hyiyDdJ0XtaVOyUR/Mxy4oUT28a1uUhgpihJaBkJGQvN9r7VXTBjWpPJJSDS5WxG8p501klrUdmgFiVifWtaKuu+Ef7+cvQiPERMwb0X3Dltrtc0mSeCAW0LjrcAF0cfkFESd+ZIMVUE6bOLKH03MJhmyIysKXQ7tk+sXdQU7A3REDMI9Il4u/3JJP5QGTaRUkB2IC3JwJ2038iCqSsLvW2cL2pEfpqTJZoIFBGjJsDqiYSVgbAXMf8Yq4W6i4PAC6SIUmseo0PvE3+VubAyZrZmJQv/1thI0m7r+TbO3yQv6Imv+KMdD+ecWf4SMKpp6BXbgYSLgM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(7416014)(82310400026)(11063799003)(3023799003)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B4BEa+XeIqZFOpPNxawfCrtKLwsx0K1/fySzxpwDiyeOvguZau/MytWfa2fG/FDJE05wi00+K3r5jZXcMcb2gMa5cmnrgoKUzG0FL3jAiKnjjFavXabiCCIDoBa+VYB87kbBRSwIQpRC0Uq9uXvd/Oy3QtppIcgRMQZRBF9AAZy1vMjZrGRLzJ9aoNGYoB6Uq/L59AGBdhPg3Bm2mXkg9h4sfR36wbz5vtHief4p2r+RE0TKXvfxPJJh5t+l3Dcz59Sc0/WTGPxy+pEXs6HeoW+dPGf735h9mRXx9QA1FGg67NdXuFmBDDoVDSjRmv3GVtdefGBhJrzi5LeirT8ZxbicJncSqpuZQfyYQymZ3b4I2eSyiotR38cPxjk6e2DWcmF2tpvrqbO3Dyry8bIvz6+eGmV9HOUsqZ69d29IIyxZwt/Okq/ShlkH1TG2EXsx
X-Exchange-RoutingPolicyChecked:
	MyZUWUxvJA265ykLzBN2iuiHO6WEPelcx2kiKJxfLjhs3M14qUkNUFREGg3nhKCKZMyrjJ0bSE8eWxnfYCctSocw6PFhUZdr+qxsrN+P9YtkrB62sEelzIfX8vk6EvWilhzs8idY3nKuTFw/0yiZF5bYeNlAENKRv/PgR5T691U5HU8ETuS19CyEgCEZnJYirlZXDLRB4qDPup2gT4S3f/4QP7kPDkccx1h/KTIdDjATDpQXIZrZz3oJ0Rq/cvgAMefzYQs1ZH1rVHUuxfRGxmBreGISJCmInex8Rr5sQcGO6muuwWgrvfMloF23r1HHnQVRfCVAE0q4bBXdsLXefQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:06.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c18bc75-c9ed-4da3-3b9f-08deb01193a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB6985
X-Proofpoint-ORIG-GUID: F200chqVxIfCB66TuDeXqVH2Cy2PMTEz
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a03016f cx=c_pps
 a=oKUGrOEB3UyG4cVvJxNfUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: F200chqVxIfCB66TuDeXqVH2Cy2PMTEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX/RyK6XEsv+m3
 IU5CvW9km5ZHKq+Xbw/5AqrRFI5wXssqCvkR0hrJwbVlqqqF4jFGtRuBV7m7yrgzepUU/v8xNre
 JHXeWZSOTA2L4ZHmBcO3u6bxclKLp2oI7MaWjMigaQfkPr6+5nZJPGm7CzRtveycFC89+I3W7Np
 rTTCIgOQZUgDXK6dJrggXwe8DrKpfq7SsD71kfi/3/ZErAW2qurpiOhmA3pg94GUSluZNBVYuVi
 Mz+2FUrDELKLZx72Dz/ljQ8Hee1kasEKIKBCjxSgkJl/I2kpAg7NVWcI4knHTyaAb3ZM3BFoAC+
 e3BbHCCW8vOBCu4/qofvWKO97HkB7H3E1/9vtvj6TH9Q6FVvJ1vLBxAtwUlCkQYi8TuElZ/pgcV
 d75AB7YVdbNWs3XtmYftzk7GUzZYxKhgVDzpiGY0+PwGquIgoNhHEudnoA2Lt8NE+zlgAV4bWGu
 0Jx30jiq3/KQdsGtDhQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt1308-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index e077d096bc239..39e06a3a75609 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -768,25 +768,15 @@ static int rt1308_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1308->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1308_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1308->regmap, false);
 	regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
 
-- 
2.47.3

