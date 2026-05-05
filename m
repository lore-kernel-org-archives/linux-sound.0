Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E6494A19;
	Tue,  5 May 2026 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999749; cv=fail; b=PBOK6Gn8vqWeC8Bcc6GHJ5Np6l0llbvFD8f6FzCsWIH0cxa2Vo0xIjYgSY0T01JfoZluE8ewuHa7N2UyLr/uagpL13Rmi0Q5KAdw0Li+7Xz1aHA1uCFCGeETIaMl8ru950jalIOawd53wqgYQCp1986F7Y5Zmc8i22meZaAPFuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999749; c=relaxed/simple;
	bh=0dV+LaNKskSw2LYUMDym95TiRgPgUWcpYJXy8avctrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6QukasTiqUM2LomeSYwlOcTLs1Kvtiu8nbxwnhC0Jhe+H/LsmBEiv0xMCFe5isPEo4pK+qeL+sBpQ0kpZH+j7v/MEWG1pER1/wEnlbInyT1AiwcVhTAsBJboIw8VbZMiOwIBRXyeyVxzJ2XQJ/uQ5/uduoWaLggGgzFkcdrdiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RDCtRW2O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x6CzTacL; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RDCtRW2O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x6CzTacL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454H2UL472333;
	Tue, 5 May 2026 11:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8HfvB2VZ8RFtbJGGgwvRcNTGVKiL+Wh2lStAQ1EjUnI=; b=
	RDCtRW2OXKMqXVbgbxAf2DDZqpcdIAJydQhQXEEK3eSUAa/hQDcR5YHLm0McuD6r
	JVlkeeZErX350tTxjCdU8vbCekEdxXQJEeSN5tPyJPMU8aGBDhQoqJzLIGYNVM3p
	jeTuyVQje7YxzAzr1Jga71GFMUI1TgV0B9u/Wn/7VIO5NSp9SM6/WSjONXrJ8Wnx
	rGoIv/crj+8B03SDhM42QrzhwbAvP1aTy1Fj/PH9U05Ha/e3S+ir4Y8UQVj56reB
	DlgjIUuOqubvna4rG5i/7545c+YWQ0kQfY97h2m+A4p7ynB4ZKHB4NCy/LNoBWdp
	B+mbGK7lOEX03pDjytH82g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020133.outbound.protection.outlook.com [52.101.61.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45vg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aP1xz0/yipiC1dmPvg4WE03/k5p7h62toPesRPiKkMYnS1X8TrUmHj3nt3XNRySrvdNdUQohhQRHrN7sSR3AkF9aGvsVHboVSd0fwxRVkpLO54sOczbA7shXn8z80vwU0A3x/s3HkDwl6PT7yK4x/4TDFTw4vA7pPcF6NIcgkjSEp2iWuQu/W7nPkl/YGCE2LfUz2hs+77LfQPdC3lFVF8kC208lKIIS7K3JNxZrb7e8nPl6a8KPJcuyDf2mo4cRv5nlyH3CPNfhaZg42mZTGQL6VgX0b4O+bGR/+j/2ZdD527vseHERK1MA5sDgZ5c6KaGTAHhL5Th1mmjHpozmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HfvB2VZ8RFtbJGGgwvRcNTGVKiL+Wh2lStAQ1EjUnI=;
 b=kcIDbfLF888RhI2Xjh5NTmCzJix9z0RBOtZARScUxKViyAZu3+0ovXL6onCCuDlN7JiruxiDTieZvMq39LSWUXKdyXcgkxi5s3WZyk0CWrnh9WvhaI1IxoSJBLZRvFf58CRZtHAYlxWrq8lN76YuBBu6OMLIMgK7sZTWlK49k94z2nix8MYFApZmIg7WHvbSnDs95ChOWARTUcQ//M+FxJ916QGhsVO7acRB22HS6hXBrMQDVk9ZqIvv5uLATf5RipPLIwvq/S2+ngu3jeOsydJT1Yf9ApRyDL23Vf4wVDUSvJhqhoju6dAIeZOhbXT0O0nhFczOg4kMXYgJfPsw+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HfvB2VZ8RFtbJGGgwvRcNTGVKiL+Wh2lStAQ1EjUnI=;
 b=x6CzTacLy9IjmdFUydrBLWd+h6+6rorlTdr/Dmh/7KWL89QyeQ6U6G+wZzvGkQSc430vrVtRDTZpBg3fYs4++47Oqjhb/oc8n/9T3d4sthsQvf6q1fN9qamVcOs7zt0EsZjwWNn4tErQG9w+MPqB2cinhZeC3BcdIc4FOy3hh5g=
Received: from DM6PR02CA0168.namprd02.prod.outlook.com (2603:10b6:5:332::35)
 by MW3PR19MB4348.namprd19.prod.outlook.com (2603:10b6:303:48::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:48:19 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::a7) by DM6PR02CA0168.outlook.office365.com
 (2603:10b6:5:332::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52646406564;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 133A082254E;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 11/17] ASoC: rt1017: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:01 +0100
Message-ID: <20260505164807.4108684-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|MW3PR19MB4348:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33ddad81-c368-47bc-edb0-08deaac61a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|61400799027|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6XyhfgZH54qpeVD7NvGm8ow5RvodnEBetAL5ToRvPvZfdJ106MzG7KUZU+Qf0kuJ+pBYBQGQNEIhwcmC9lmPHzRkTqjyovVufiAFcTUq5AKi0KErYapLGb+BVvYQWihwmyDuIuhBTWjzhLMXhiDik2p3iS+r1V5bFoQ0mK3RVXLx45U9q9fHcBxGoo+u1gC4mR8MIVxy/Y5Hxw5b4fhYIqzn+HjJu1aSC5ZcQsOF7o9EzDn8Jgw2BJ29sbmUitarIsTldcKO9CQQeDIkIHi2iav8oVfb2PKbQIsPdkpuoaBs/wT+bhVIqwvcVfjExxnS317+hdW1UuKKsqbQbDRzjNGscl+Z67ZOVv2ekPm7pPUCTygaSYm5VrOgWreWg4KILprMg502Pn9fhSdlNreTqBFdSaRyOPZMPpa3lnq+GLQ0knLwKVsKUeg3AIExHYYcqXxhqLcDAhgClK0jgf2q89kVgVHGjmJI0DZpM3j1OfrkZGKPIDLdYWTGj/zrfEUNUyv2Tw2upVuMdTy3W9E0tELIuk8yI1PQgB+pu00RJL7ItbBbhHdKCmjF77TXtA41isieTa/ZDBoGlt8aj+ivLVAyw9arlN92MJlemGTquz8D/UFiXN3/hNmEh9ImpI5IgFLD393053A63zmwsGyOdfTtcmj5Ec4Dd/25oaRJZQyXBBlo9FBf75fuiwLn9feTHNCJV1BdsmO7m+e1qQ38YM7Cg/DR0Xffjpg+21TtcZA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(61400799027)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+XTtJoqO4tzRAX1Cqb2QBG/5uEpLd/qJ3e1cpfqqkCh6aa2shuonqcE3VfO9dv4+OboqS1J/+RApjXlMuBLY2DdIzGklOUgjNTxASGNUG4fH7qvbVXOtMtc/aCTrDE1Eh4XIjEgbsI1amJBK96rdfb5ux3SNfAS9eVzWmlTP990qZXzb+xF9zSj3nJZOBgLt5Y/Thu6gMIKkXQ9mSL08mecxqdGN+Cs8lL1t+1CNRpPiMZ3qDdXTwe57qPFOjKJxkH004wI3RFgEfJwhFugE4WTMEcH1jE+TfSNJ5Wfqik1yBESq5TmZMFF8DCGhj9hg/mhh6ShUwze0WV0u6U2Ci4VJ50Q1tiUMEEh69vVZFBZ4KviPaOdr9sRBIYoYVNpN783ZYAJBUOUDzEHbrarGtpeerg1xigPT/jq2BHaw5FFfj9uhWKdVRls8yDYYNnQt
X-Exchange-RoutingPolicyChecked:
	rovRzOToGKwSHH5EMh0unxBdG3l5nsTUwAL/ke0obizJNhuSn55JOyVeuJgJVX7iZyvVv4Sn/llqMwfL7549JQJT6Y68PlgiKGzWA0fr6k9RyHspGAqfcvI8hk9e7H/XqZdY0mKWAlwHsktRLG/4f8Qv73TRu8t9DGxBB/uj4WMNEO1W9mGRDt42X4gIFjFMZF1JRiWufag81w3kYu2RwGMaWvz/BXuBPiAv+xaDr84P9QEGNt5W7uFH68/w1JUPWm79muoIqnMxODa4TVnAJuZ3HUhBidi52V2Pw7RCfsSB53OXj2hWI/cb6/MVakAqyMNkqBS4K8a6oSB4atEUKA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.4409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ddad81-c368-47bc-edb0-08deaac61a72
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4348
X-Proofpoint-GUID: 7tJwVUt3xBBArGg2j6vH7kAc338gwUZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfXxxbknRnBdKrt
 Zg03VEQT2NQLgxEmIIjlk2KqiP8cisRLpOeZwrRJsmwUAUa1XPclWKK847ThBeGxOFuYrEcNKJy
 HkQvXAtPh8Rz5lZJQqZgL6fNA9qz7FoNoxPQx+ttfQ/Q7povzg3u36h+VyHk9k4zmLSi7AT9PUr
 Ceagq2tdC22CD1RaNoC8EsK2PIVgDMQH0eYgU1h7kRQV4qnNQ8Tr3OPqAjg6sLyhQkOHk0+upTa
 pEHYxJkv6d9T2XxpeHLvJIhHxeoErmpgaNz9rXCUAQ5bwQ9XuaCQxvzEIhH+iR0qzNWuc6j3S+N
 xH5h5YafCSyqH7wNqEvdyhm9xC9lmFKAmb7v1OUD/mrw+S0yWbmd3WLv7szDsyK3KiremCNFEB9
 20Nclydf/6RnWPelZF09ZJV5+511BTjlTpJKs/kDD7y2ARVdDx5juKbMxn2iShMA73TjuIVlV+k
 9jSuweCPxgeB2KjAd+Q==
X-Proofpoint-ORIG-GUID: 7tJwVUt3xBBArGg2j6vH7kAc338gwUZL
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f57 cx=c_pps
 a=3l++41Tsbfu3Vy6U+n14cA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=IoCDlSAkw28XYy5mOB4A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1017-sdca-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 148b36173a257..d62e8a2536767 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -773,25 +773,15 @@ static int rt1017_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1017->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1017_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1017_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1017->regmap, false);
 	regcache_sync(rt1017->regmap);
 
-- 
2.47.3

