Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6F34F7971;
	Tue, 12 May 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580880; cv=fail; b=pDOaOSi6K2p6bK5ba/i0kcHu06xz/poLUTJBbPeHVBEl1+nQGdd42U7ZL9pIf33jQ1pBOLcwF3/8YTXf1YZfI/r3mXuc2TIzSOXEC6IonoTHyjcLFLMv1541xgLea2CXqncV4QfreXqLlxUP9cAA++RhTKZRP2tOmvXpfFlzYEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580880; c=relaxed/simple;
	bh=gbOKDMgFz3uU3vl92xCjSgItVA3APJSBvTwEVSihrqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqCVeGxZhHPCDbYRQNY4btAbsiFDI84fVOY8/lx87rnJ1SS20FHCU6T3zZPPQX4iLVVVjz1ZnZFILwIZHLvaNt6PAeX0h7E4LjT5nsbZ//rfjWni9XfQ5PpG22gAcBiZnGyr9FmxL9y7jnqGCyXRe0YoOefUxKgpdDxKg4LJ2cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZpNmXvK6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=D9326sPC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZpNmXvK6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="D9326sPC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C12QuM1137580;
	Tue, 12 May 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WCUCXCSaqBRB5V3GyWv5GuQfdEu7lUShpzWoC5gPcjo=; b=
	ZpNmXvK6kqVhz28Z1xmDgNup2D7vna8ByKkZRWZ4n+KSdO6gx3JHaqVEx/SNcEMO
	+RsNGQUTjPfYr/mAO+uWZ1HFjEgPqjWdxTV+DSe5OGjFI4zeZwkyIcfIBQWZ/yli
	6tHTeBpPN6naXG2aaOW5R92oeJC57YrW8giZNTe7mnaVNyZ41CLOTW+KqPifcPJv
	PawWAzeKi21sn/Z0duHVY+IHQpRJR+G76N7NLTImLEN6Mi0Ex1a1JUcwlj00D4FP
	Zd1DeDFu2Lk1VWKoumWQI7+3pTUaCTrsBWtEmmFNCc/+zkogtCT9k6vFMaJWqr/7
	Hrf22gVxuxP7GflSRE9rsA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020072.outbound.protection.outlook.com [52.101.56.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6t1gZQQ1fqBGJNt037HoCSi3BHnqlieXJ0GF/k2TIt2GwUM6vILqi1iM8UQieo4lvNWzw087MC4efjzV39o74kX/dlUWTo7azC1GzzEVgvZenDnQuqgQjGTtTZ2SV2VKUzlcLV0ZEisp3QjEtb1FajqGDZh4Zx6usdNSPNCrCa2/go0c0KiFW8EfvZZ2+BYVu+vxHuZJdJ5/bCtCmiTXL/P66z28FggeLrjyzhc4lU2+HOpmcbESTjjAAYLiymujP3upTZtGvC6yPpHOhBj4xGyTm/F91Gs86cen7ukdfIqyN46tTRyCksZX+1kUfsCKseMg5w63vIAEnqWbnwhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCUCXCSaqBRB5V3GyWv5GuQfdEu7lUShpzWoC5gPcjo=;
 b=Lrxvv+MkCrXAArpNfggdT2RFjP9MWtoltdBwIzz1K6Rbr26dgjrpEv78kjt/hcbBm7cVY5Bo5IueNohlWzrBSN3RFhis9MqoQSIEYk31h3CaktW0FzStGPGNEfLkT9l4Z7/+0qi6Vd+PWW9wLl75yKnJ7JW+wgl579nqzZJad+4xZfl4dKt9BT50SyXxr6F7FzMm7KJhUSIZefpfGG8b+aE1gl2OnusnnyPBYlnL/vSN9j+9Lppzj4OD31Er+NPE7ubn9cobOCs7PjS8jXHXJ+RQkDxjwfg/KrGocs5vUYlo9xlHolQLR0wjC+fAIINdSoP0nQ4ncXwIhUpVwmWZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCUCXCSaqBRB5V3GyWv5GuQfdEu7lUShpzWoC5gPcjo=;
 b=D9326sPCKN6rjQBRDGMlgcd44wvCry2nLn4QzYriRLIskQ5belo8U8vkZXbsst10Kuy7fpccnpnNBPybWMUPIJXz0TiDTz4NYwPnlfjSt9NDZiJZRwjhsOCUI8CbputDwQT03AnP73/1ro/Ju2d8EaScKFYmIvVVxLjgjrN884c=
Received: from SA9PR13CA0002.namprd13.prod.outlook.com (2603:10b6:806:21::7)
 by LV2PR19MB5935.namprd19.prod.outlook.com (2603:10b6:408:170::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:55 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::4e) by SA9PR13CA0002.outlook.office365.com
 (2603:10b6:806:21::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 10:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0732406559;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9B34882254D;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 03/18] ASoC: cs42l42: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:33 +0100
Message-ID: <20260512101348.1138044-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|LV2PR19MB5935:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 843f5386-3b19-4d91-c8c6-08deb00f2b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mYPerWPMp/fEEhuIW06DW537SmoCT/Vw80WVwvaEcZtdUPumqeabmvhh5v2gOjfIR+jbZKfvFgJzVQ1XrEqBRnSe7KQN2WTOO9eWbOZLVkEawt9qFproV0F0IiDqQF7cYHRb3oosy7ZqU36p3uDSwkkOoaL0lNXwxbHKIs+GlE0GfTRNDoehSB/SeZOyrAzICpuAJ+PL/HWM3Ic3NDwzUCugMylfGtuNHASfG4V2DTdiidEaC3jXrc4iBChEO8OH0HUTq91g7LZTZhh0yMQDaGOw59qGD5M9tBfiMm8nOOIskA8k86Lj8Im9EzOABPiD73KaL7tVZq9dlHJq57q5MWMbuBQfhDky60y9NAOXP49c+2oIGEsTKfP3Lxjl1CulxK60hMWtaATzQkmFoc8yV98y00rVFN1z69AV0H3xuzHVNZTxap/sU4GnSYj0jJ0fcs6PGA4IadHdifnFRiz/fUexs5rklYmacQElACRvjWG4bKJJkqoHJOHBYQX1y8MT2XV8dqakQKeFvPrgSDrR/uVqwxm5vRJc1absqMvbJQ0hR8tp0l181EycDDthVyYL8IDuXRhGOjZApXoR2b0EgO6Ateh4bbiTk63lHUlWeE9OVLkoUQuiBs+UnRToaZ3CSqiu44TYSsmcjm/giyO1cM01TwFtoGXTq6ma1RnK5ltXeVb3PU35jRrDemRCJyPLno7VvP7cawwbpr3GowSsiW7JQgNvvukpXIYRWoyo55s=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AIs6n9ZJSzPBQeR0oSM6usOSFErbct1Ommj0li4wfvQWpH3PwNkHYvP2Oe7FqumRufEVdIB7WGYD0iw30dyTQ2wZwNSxbmmQk47WYXWrY6ou5RHA1GMkbuE1jGx1sOvvr76PPIGxpfaYq8YijUflCsCWPI9S9aLmT9Cuvq9Pf2fyVfUX46In9tsPTYs7dez04EcL/A7AMlMZlf3V1gyxPKyHpd98hJK5CJcraSu4x5sd5jaUtRF265OpuWpGXTsK/WYwJO+E0CqrbnbnKYe88z7IrBt14x4JFvxBM+zEAL77hvVYXi4dUOqMyXg7/5OB3puA1rjXokyG4mN2Qc91tMytYfn2sUPMl/F8xBQtTkyBkY6dj5TAqGvVqykayYbZ5aZ45jVFdJ/VWCec/obL0d5SqDJupMOYi3oLV4NIyh+kBKxm2LTcYetvGHHNd9rK
X-Exchange-RoutingPolicyChecked:
	eQ1Zsh5bD3+hYwV1kFDbGdWCoQb8Vvpp0gKKxv2QSzI/WTkQSU9i+LHPA+chg7l/6E4tUgDDDuJXHi0k5XX6HJC0nf1ldcwwRn3IWlGHa0zgwUHbMq2ekgFzVHlmAJbpxl4ua0GcE1oSVsteMK6VUfek7uBVY9SBFyFj2Z36RZ0CIYuSC8fZmu7Sx+UqqWCcyxfkWRM7BC03aAOwU05NPNLQ0t77HRbt2W378DP758BhpVdCf6as+vXHlvgPV4x1CvfqwjXHEpNWMEiIjLsJBTuVv1vkbqa+dNHX71hXjwcKDbWz0h3GrD0yuyAoG+CixIT4Z5JU75nX5gGtd3q5JA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:53.2242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843f5386-3b19-4d91-c8c6-08deb00f2b8f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5935
X-Proofpoint-GUID: EzUC1oYWLZK1rTepCr8r--2LOlbtdtgI
X-Proofpoint-ORIG-GUID: EzUC1oYWLZK1rTepCr8r--2LOlbtdtgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX54y7RCTsx3Ha
 kMfLE1XEqf5INdoGPuRgC5bCn0s3elxHBXlmOgVIlJpc1JzLLou63mWphuhZMJsHEOhp6tAVgvT
 YbCwqYlwhKnrzUb/JpkpLb1DCSsoopoJdR/Inbrs2QEkQBo4voahDGNQ+qdjObIW07/Bk7PMLHu
 edG+p7HTIuicbCHaDe3Kzv+zfefn1v1mLyWMPGA79SQxgT5MYZ/nrsxzxccu1nNgdKbdUTVjpse
 vEu6u6z3SkVpV4lmI0hW9EMb5Eqz1N2vT7U4oO+7v05fcdWY+93iGajKT9jsNsUjRfEnRUDSYHL
 fwrk4mDsqFwlOpARepbTwdHACWEpj4BRzCUDmnPB+Uhwa+WTrl0/7S86o3wjWAKErSN5+71M7lo
 5k/jv+5UXjsJTKN+QZdZw85lAn0il/cwWKXi45DeENklgxZHP4QdeP1kL4Q4YDIos26WvqpvwEk
 f7t7jfiK1+0fyaQHjVw==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd67 cx=c_pps
 a=EuzLu2ZwJ/NCzAOim5xawA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/cs42l42-sdw.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index d5999ad9ff9b4..b8256ce0b8fbe 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -433,19 +433,16 @@ static const struct reg_sequence cs42l42_soft_reboot_seq[] = {
 static int cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
 {
 	struct sdw_slave *peripheral = cs42l42->sdw_peripheral;
+	int ret;
 
 	if (!peripheral->unattach_request)
 		return 0;
 
 	/* Cannot access registers until master re-attaches. */
 	dev_dbg(&peripheral->dev, "Wait for initialization_complete\n");
-	if (!wait_for_completion_timeout(&peripheral->initialization_complete,
-					 msecs_to_jiffies(5000))) {
-		dev_err(&peripheral->dev, "initialization_complete timed out\n");
-		return -ETIMEDOUT;
-	}
-
-	peripheral->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(peripheral, 5000);
+	if (ret)
+		return ret;
 
 	/*
 	 * After a bus reset there must be a reconfiguration reset to
-- 
2.47.3

