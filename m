Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9B3FE34D;
	Mon, 11 May 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508690; cv=fail; b=jj2Zy2JEdr3IKpi48MH+q0LNV4xBIJ/gINcYbfAgIW4sQN0LE9I89mx+xSVKNbYoPImXPeJv/JbH+aly/Gh9Dc9u6OCW7Wn90XJL9QndT2iiekU6lkRk0WTehWzbzC3Pz8RIAXJ8DwbQGhsR5DcpSi/KN8hgJ1jeQBVyteH47Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508690; c=relaxed/simple;
	bh=Vg5gQ25TcURRJLwBWCw6DKcDYCpolNFcv4YIwAXUT98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OtIDhy5N919a07De2bcm51Ug1SKBz2V/Di6zQUwP0pQH5QwcV0obevy7F/O6rdkssmthCBCksKxiHc0QbL12jPo1V0FNhPxRCvm70SgVHq0IlYlLNSxeZSotNxVdNId3ByDjJvr7mmkhLQavNopsEYxeckCoIrjqNyX1u4zxi8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TX75otue; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AYGWiIDi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TX75otue";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AYGWiIDi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5uSGC3470159;
	Mon, 11 May 2026 09:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oSCq2PIWKsXsVlsWpsXNNF/okFuwsAzrqGuS4y4w9mE=; b=
	TX75otueMQ/xTH9bedm90BPsfqaJzDXNh13pfMp/b2Ye8ODlTmU+6fZ7L+4+9PFJ
	jDwzQ9CKxWbZn6DsngKkTJd8E7Uqq0Dx12G51BS0C3ULq00QfOxk2K/S+95qewOv
	rJBBoOebjn14vU1AU+0B4zdokRPc9v49F+Xi3QPN5xUsZcwQH7f9x9rAI4+33feb
	AZUecza+Pl1jNJl8X0aKSxVMJR5pyxjkH918iiiBsUCJ0rzOF5vnPEAQkHcKJIPV
	l+g5CpDK1XieGxm3WrusatNgGO4DwIF/6pnbDZq8GG/VbYC85p3HnE8RjOeiBVYb
	/C6YSg9MnFtFF1/6pQqF8w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023075.outbound.protection.outlook.com [40.93.201.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3u9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZmofkBztpsby29Xqe9koNzD2b5phnN+M1ktnld5zmNpB3SOhwKgzBtvfhMq+gL+JkmOSBUJ9CFkw145kLlYtFGR967l94LLJ/WMUjkyjVRoEi5+XFUnrKY2LdkkjRaVbp8upjtpdQ2TlWu3cJv3x+8mxp315ur4M7Pi/ROVyicTk+pcdmHuRV/kJrNubBelUi1TSRrW3qwGRmiotqCiygBVqLMZXU3QQjKjavg9KWwrhCNhlpUYxsaL9LxPgOoSaVc1NxkXHg9utMvQtoS5ggHrdsd8LMPl5AIRlwilDaO3pFl3iBfdZv2pLznFoqRCUK65ugzzk4KH3R4ti4Snhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSCq2PIWKsXsVlsWpsXNNF/okFuwsAzrqGuS4y4w9mE=;
 b=oOfwuH3O3aQm8/uGtNvUkC8sE9INUXxFqi55S2uBZcmuuoz1XXpDZJMH2qECb3e18ZZpPKbIW8tWBrnZ+ib/9PDEM8+RFm9Q7EDkLPfljy8L5+34tUpKPP0MNKNopNDKXKA+TbmCRekWqJNY+VQBc3FsDkQwaEoMxl5Up+R9zDRstP8dF3Ewf9Ni0LPjA1ASHg+I2wOuJ5G5t3nfHGj4TlsBBZaUrpDZ78Cqhi+qk4NZuN+8tBdo3d3UqSWJ7rRpqAg9umCcDMoPofDotL5FjJKYxOU79QeGybKsFYfxYpfYFCslR020Hm3SLtUXknYysZk0vawXc4rBCOMsJbD99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSCq2PIWKsXsVlsWpsXNNF/okFuwsAzrqGuS4y4w9mE=;
 b=AYGWiIDi0SC7K6WPcqbXfTFbwc3E+x/Ggyo5UJHDxfHQNpBnofnF4T/jdH/FaVJF89l99DAXpz7zgCDv3dspCKLCBhWnuKt4oDp9IdXdUp1d4UJwfRXrIXS8GLpJ7hRBe4yjSDK0nQuEmQCn/Qh/3kV6WNy87bVUkduRZXJXGiY=
Received: from SJ0PR05CA0075.namprd05.prod.outlook.com (2603:10b6:a03:332::20)
 by DS7PR19MB6072.namprd19.prod.outlook.com (2603:10b6:8:83::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:41 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::5f) by SJ0PR05CA0075.outlook.office365.com
 (2603:10b6:a03:332::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Mon, 11
 May 2026 14:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A502C406568;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7955282025A;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 15/18] ASoC: rt1318: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:26 +0100
Message-ID: <20260511141029.851125-16-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|DS7PR19MB6072:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 072ffb40-42b8-46b6-5dfa-08deaf67154e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|18002099003|16102099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	v73tWbt2Vxu2+xNaFriq2Ns53/0zOTyMNFEIwHiBk/w7XiBcTs7Z9sAN9Zo6kAhaBbWvubJ1w/cdUR/TlfV0fgn9yCz2NmGHGLkFXASdfeDRcf+2+ne+Ai8ik+3ae59c/p9/3bhk48KDCOwf/36q3wXfLEzF/dXIcnExSkhX9hknuzEzq75XW6a+UORL7GWJpE5pNm9+ijqagqIAM2HmcPDEsXlTtozrh7JE20Gmq1BnAMSknfmH2iA329I5dJYEYJhWMtYht8kZ3Y2pqpJe9Ubq4HN0tnHl/PD4w7DKRQx0y7NRwG/aIpo6YZXpetIaANGpBKEaAgW07ReduW9L9ulqQfT92d8WhCmObFwsLflL1p8Kk/DLBUxxt/AIEFlpwfxmpsyVz4peD+4AUZzoME9yg6QUcj4U4oyppoXDUH8dSq41/9Pwhdc/KbR9fagOIvazbN5bKleBLvMZ1cSXbD0J1kU/vN7FX3qrKqy34nXWEJis/sP7S2kaPIx8LN+btqRYngr4ED/B9ao2MukDLpUo9dPw6vJ3ibPNJOWrAGtOJvCTrRkPY9dtqVp8dk6pJq4N/KtG8rkSeqRekkrIR5oVjDbjqgrbCi0LzIGwARW/rEDk5RiHorElkVok4u7AnmSJOa3Dtv8lvSPRmQ5fS1H9YWqZK+YLVm67Cj1cqRnrNp4qZp2OKvuP6JKYa/t6NjvidicJDW2+GKxzn6PT52qDq+YSzE36EK2D7BlW99s=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(18002099003)(16102099003)(22082099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OeGoH8KFEbZkpRYpz6yTIbfgktR4MLBYlYPvWMtdJVdP1lwRGtLwujqCrUkDuanjUu4kGI9/lj9fWBC2OVUgo8koKwyj8OsVTxPDhhKbZA7McP57Cw4GnvsnU+AwgByB8qjLJcgrXpB7y2SNgzjg9pKbAZsav1G05XhI/otQRhCC4wD+/Deu9LzRst5eQlRBUCliJ9c5PKXgZGJ+BFQVleT63DR7GWsBxdYY5qMaIv9Ktb9wKtYOLYBZXlWLwCbntmqyKkKSdA2buC06DgPyY62eNZ1OsgupRhikfo9GzpO6+gqNBMYKQ+xHbgPUadSCUZOp5G7qG/YTznE1MUFcXHadTguWgy3W7mnrkAO2ngqWLIv9QPMDrCAKBdj3hL7j7zXodpqexzU22mq/xtyyPbQ228B3yZjDX81FG59cCu1HUzfqUClMRpj6REQKZR17
X-Exchange-RoutingPolicyChecked:
	jhBNAHVsiYm1/rBVGqkgsNGa1RBzRq4m1M9ykXCZXK6GPdIqZF19cRMqEv3NE02joB1mBjWT3UqouhPdFnqAJ1jJXiPaRcy0eghhdtVDxzQr5UjOxxgbhb5MV4NqRAGOGbn63GuuPjksqHqALfTSQ7V4DYH0stELCMzmFm1ULJvDSQK8Edfa5JSk6EErxluJYzAaGXDcr3lAZZosBqTXnwyce7Ii7NyOLItww0Onz2ci/zXgxJdX6eOL4HuYrMq9nv1M9InDvERRx2FQAKZDgVQzoKfv0/bmUDlQ4PlEKhso+C+mi/UTIqowg2u5xpO3PG1enkFMNCnITRNYfw6Jpg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:40.3879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072ffb40-42b8-46b6-5dfa-08deaf67154e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6072
X-Proofpoint-GUID: IXeMJX5GbecD4JCt2tfDZeY41vqDmhpK
X-Proofpoint-ORIG-GUID: IXeMJX5GbecD4JCt2tfDZeY41vqDmhpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX042xhCubX6d3
 taBC0KJWy+gcpcM+wiqeL5Nw7wU3ZfW2oAOdYLIlrX9i/vMB5+EjdX1xZppyy/8okd9aMXWfsHm
 lK7GeLJioA/yxzEocQiZYnlPZCvSTPAwPq/5SUYzVM2mQ5cTHZYwovcOKqqTTUjI9aHV5oGWacZ
 Ll29bnf2SpwE7wSFZt7Aup1crAmPsOjXenVjpM0Zzr8FqdR+48W09muBt4YXnPiAiY9UxMCPK2h
 Bb5xdU2agM0vB4vXsi5NDtFGmds+cWEF7WjMhfqkd3kfrY7Za1OIIUSPsFWreJ0W+jbG/BTXG/M
 saUjCWvPqAzHIxIWuIW6ymR5lM5921UpUcw6g6lQK30h/4cU1hChQh1upgtBEn2By/HVrlQN9xe
 ErPynBnru6ubKw47j1AyOA7qHHOPUh9UjMIjv6iZh4tAg2ZLLWRzFuF2aRAs12OhIurHk/q9xd5
 LRPc1X5QKYoH9h+Ygrg==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e365 cx=c_pps
 a=bqsrm7XTco20ezpTcXdHqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/rt1318-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index d28f1afe68f18..51bd11b92a554 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -821,23 +821,15 @@ static int rt1318_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1318->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1318_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1318_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1318->regmap, false);
 	regcache_sync(rt1318->regmap);
 
-- 
2.47.3

