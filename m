Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110AA4C77B8;
	Tue, 12 May 2026 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580869; cv=fail; b=F3NWb+n3J2VtMBaf6rti4pZ/SUC6m2ENXm9MDXM5YyIYvTT5pLfFiBO5I1VqRA89INUvzrFfENnQPsRdF8JFqrYOZb/OJOuVoD1hxSrz/oI19NJIbKybsbO3vGOHarpBcDTZ81ULLr3XOHVUsUiz/d80m0FDjQKm7u9Zz+05tFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580869; c=relaxed/simple;
	bh=gG+/w6KAakT44tfW28JEYslfFYz25pMlb0RJ2gcLDsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDzdU9LQA6LT0HsGfdTD5ttkYNpPoj5KqnIve4crKgvbymjVFgOIow9544aXkXcGd0ij+3bXv3w/p6HLUVvh3v27CxV4KYGychf95brLbPUbMsYsfSkfXGDYBDj7HmnU4Oi3TVyLkMX11TdsgTxFlESWDd+l8oiOlDN5uSa6j6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p/LMrmAW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YQ8lqWNa; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p/LMrmAW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YQ8lqWNa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4v9Ag797268;
	Tue, 12 May 2026 05:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OO+1Unji5RuzwqIEMDA0C2Qc70zRAfX898wK/VIHcfM=; b=
	p/LMrmAWcuA+yXBqSWyV3LtcoD+Os06QJ5GwOPWUDvgdPOvA5XxrQDCbBl4x/aTs
	wGO0rAvEbiKE7pxGyY9a/vFJgUEBzjWBRBPLFc2JwyIaeUNec9Z/am++Wb9+ArV/
	jGGlQnQSmQTu/F3d1LrJ05KRZChq9QtEUVEdoECgy9cVmDZxoYMRxV6zdaK+7E39
	7g9R9XDSkAV+w3o+vHJIs98ytl/Cva0H1QlR7Au0VNHu/ANRKP1vMirQHe5+OmRW
	zTbmsvaqLIgnZzYN1ZgbkVg6qKEc8wAH7YjjrcdD5mdHBRQkAT1Z5r1xnY4xGu76
	m13u5DnScR0OW/rZ2lloJg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022090.outbound.protection.outlook.com [52.101.48.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMhQEWtD7nO9bPv9T8YnEftMCcLusqQ2lFnGbaWWzCq1LcWHIA8zqKXa5gca7RvvdCCTvnACNg7ayvw8cuU6bhRfWxJ2PAxYzrAg46eaXtsDpP+eqwxV8LMr5wKzcbBi5KcgO9RBDI/pDwWq9MnzrjcVqlP377kQB+VBIKJQ4uEN2K5enf33CrWLTcJHFQy4qU63iOzoygrfuKj9EpSfP5/Agc6Pn4t9oNXwFo3n2/is7fYAc6KkRf+u13Eq9XQezdLxj63qkS9ExECDJfPuHFF/mc+tAxkUEeiRT8VzDKf2VeV6+sr/H8zQnG3OTJFheyIGNgX9steyeUWKgBP4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO+1Unji5RuzwqIEMDA0C2Qc70zRAfX898wK/VIHcfM=;
 b=B96FQNZ3r3dzfXgsAudKTxSOt+hVnO8DzvbGvtZzqTDAE00j48kwGJj0GqOz23uJ4nHmAjKfNFvy+lLZZr0h4Ao04O2DOecXFfguHCn/I6jfJ/fNwtDQcAMsepTBh56yBWZtDfzVIcUbqP3z6OrVbpJpxeOoD7EdhzZsGzoI80NLVIfQj8nvCnzc8dvEuzZ5y0irHXmswiP1nXXfr9O6B457oL1gk3f8yYblwF8u2aMScz5B/sDJdoQJU+eFvUM8pjyKJO4SdpN28PdYwcpm92FX2IXrwrovBztbjQwZkYxt2M4o7RiS5KF9BMv3htSBeVuCqDW9vR6XtgvH/ZF0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO+1Unji5RuzwqIEMDA0C2Qc70zRAfX898wK/VIHcfM=;
 b=YQ8lqWNaUAwDig5eFuuG9yDJAEMpd31Wx34Z4uKroVpGUUY60qWi7wlXPY9q77Jv2h8drICAmSCwcGdsdBUNI/6YEUQLW3lO0oxhWHzN4W7uzOGXNjmvvbn98AVUkU0LH0NzI/IlBal0z/zVKs3LPTVz4DASlxHsoLVHrks+xQ0=
Received: from CH5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:1f1::8)
 by SJ4PPF92F35AF85.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:57 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::c0) by CH5PR03CA0022.outlook.office365.com
 (2603:10b6:610:1f1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2A6B406569;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DDE7782254A;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 17/18] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:47 +0100
Message-ID: <20260512101348.1138044-18-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SJ4PPF92F35AF85:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6da61e8-9a9f-4056-8931-08deb00f2d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|61400799027|18002099003|16102099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	KL9P3pOEBAM1cSBZ3Sh3L/NZ4RpTOuRObWljXHdMRfQBxTAlCpSOeTg44u3j7cv+V9qVlVMwHxWGRoVhjjUhtF5helD0V24X9uS1qFTQ1BIt3m4MtMnbAtu4GKT2hld1wG6Wl80/DEyWKcCuxU+IneU9hicLSrrE2sg6UR2xNdJ5dKCxGqK7DhkL93Qn1jV2kWXWG51zpJdoXgxw8vV/U/QyZKDepxUs2k7CFeFG7G0HA0dXCuAZdYUZZN4jCmTXREMNovJs9vu8EGiEhwCjp41nsDJMRWAHlw+nssmCQcsn6c/Q2jniphxBaKsuJbyMEnmSqZNHgOtynuKKzPeTP+JADn+I//9Spay7thYldAqR0DvQfB7BLyAdsH8aP0AO35Was9cNaduSoW6wTWNKb9gF26C5rwZLa3Jb9U7M74TAecLJgi4Z1rjxNKXMC9nxOB8QhOFf+bUggSYGKvz3mT6cgr8d/YDG18pmhxxa+5QE9iWwsLn/kAsWXrmSvvxN1KDaYjZn9C608ZOFuHa28Dj9s45qRKFO3/h9YMAim5PoIIaEFEOEgfNJ9jHsedJomRm+HYMQYDSC0VXta4OWmgKYbioaMZCEm1rnfTixeQbCl+0EW87w72W5Ay6ANlbkFq4Bdk5w5k3/4Rjr9MmEhEbIC9OD9xgBXpnJvJFwpWM6CNYVimDnVHzr4gluIeIM7wDFDxbvZc/LJjLFbInKx90rcAHKLPQVRkJu4NcfaAs=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(61400799027)(18002099003)(16102099003)(22082099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8ga2EtNKR/A8eWnuflozdT4kCxmr4BNhCkkL+Mc4cEWp9nt9vyMZN+9K3/87VPs5frdDIxmNiG6rivYADN4G2Cj1OHGV1lu+g5FQbXrmx/0RqCs/aIp2RKDWtMP0LmOmsdIIAHBfEjQvHez2bh9lNv6PA7xjkplNboEaOxbPwdM95kKn9OsTMdMrIIhZ0BI1BrEe/US1OKFY4LWtITo9f1tKrXryL94zEOgirOMYIaIHeQaSBncXLOreo2VpQJclJ4TmRwXm07wkyIZWL+HdpJabS79QKwTsYsROpFp2JcTp34I2S2bM/0RrcgHEDJzcVg9TwmRJoyz1CiW59k4TAwQmkDyJpbEdcUABDcjJtuiYFLYH0yDXI5eTB5JIrmPIgvIJ39qRxeBB7+i9ca5D7idngt0N/MgYteK7M06lDACIfwGDpTgFr75Kb8TLe5/2
X-Exchange-RoutingPolicyChecked:
	iGcA09XqhNlY8hSoqh0YLdUiLkS/2TX/UhG4P1VTLTXECWIM5aaseicY0RBfTdyRKzdeX/QdFV9rycN4zbSf0sGPO4Vn9twsm44eo70/ADTwPsNOPbXi6BZVyOgl1+O0K0jA5kv5aSvVzQByHg3kvP7URqeES1drGkqOwmRNzkjWzj7yMuNF/wERaZE6jivNDHaIXWvpOz2L5D5EGcZxMwqYf/d1qCk6tUvIa9nYrLibRE0VDb5vCZ8ypSKWJYMJa1ieLwqJAT+piyEUyN2FUMmZhnqAZyem8gNRGNw0uNR8B+UmFEVsv2RxwYI653Zy1dPS7if2qLFU5PwcdUHErA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:56.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6da61e8-9a9f-4056-8931-08deb00f2d7e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF92F35AF85
X-Proofpoint-ORIG-GUID: xRw-z70g-bECiLLapomgmnG8bPcLAIlE
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd6a cx=c_pps
 a=Gbvvz3TddPyANoHKDDnYFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: xRw-z70g-bECiLLapomgmnG8bPcLAIlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX5R1PJu6emrjf
 YdUZ0UeQehhGacsq+jTe8xbijriMgRDqk+TXmyDjloTSOhRGT/mNGkU1G3FAOB0jb+R6EpFsX6C
 lXGXiIlaWKXGQNCF1RkIPkj/E0HedYZkr6qB1A115QtCdk5uyiniQZKN/WRDvfLHdYv7YsKPHef
 RLH75I4hxnvBsjYwhlLgBiQ5AMA/7Hkp6vgEcbU65ACM5Bijxg7aRB6N7e4gPSP7clURx31Upsl
 AelEHa+SrnfxnDKn+vDh1eWeuME+tCK86PJCbZOdtwcsP+Hj77XZv+wlGn1s/pXPVsEp02R4DC4
 O+Nu/lnIj9kFwekVafJKxHM7fGrwGmEXDH7ZFsfhvnOmtdHzwtkxVplfyHsXHT/jaw8XTqvQny1
 oBpKu93flR71dNvTNfMCHA0D6jB0yAvjyfa+O7Omp+pei6exvzIsB4v8j85W7OlYesubRhlmrfG
 Qrj9rLRZaV6C7CDg6bw==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt5682-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index fc464538ceffb..ec2a35a0cacde 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -754,7 +754,7 @@ static int rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt5682->first_hw_init)
 		return 0;
@@ -766,20 +766,12 @@ static int rt5682_dev_resume(struct device *dev)
 			rt5682->disable_irq = false;
 		}
 		mutex_unlock(&rt5682->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt5682->sdw_regmap, false);
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
-- 
2.47.3

