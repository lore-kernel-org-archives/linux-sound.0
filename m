Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E844402430;
	Mon, 11 May 2026 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508707; cv=fail; b=bhF3hvEOeMYI/nSwkE1n47zfNwukZkPMejGRoBP3xsHU/TOAxDMeQWHyUbp55qZ9qxZTi8LIj1LoI0n/RniPRIjkaivhZ9LpmBX+/6RnU+NX4VnW80HIBwAUk6dlLNe9uO/dpEj0S/PnAUd3iqmbIuiLdyVzHkzfKscM6SAigSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508707; c=relaxed/simple;
	bh=ZKkQAaJnf7XXccNSIgkdukAGTWTNE5xe646aNx2AJOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKFE0FulobuZ8+EFAwxbYmOxq54mOjyyiMLhQW2u5VF9K1k53QUHZ5ytqUDqLkzjy+fJpmFxptY5mqRXuV4cUweVxzMDaLcnJRsMHRAciZUlSLYispC+zKPDiFxrQxiPwREHYAsgRcxXBXfofc4TduUMF9oYOR4t5o9FFhyybUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mn6jvrpw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=phvFe9As; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mn6jvrpw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="phvFe9As"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5kk3L2665554;
	Mon, 11 May 2026 09:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BdcHh1uh5VVUP/NFOHucx/P2SjVxij4BXAjrlbY1Rhs=; b=
	Mn6jvrpwWNqwNJi2bbcSDddZ3c9MABj7rhx6Jo8eVt5FeWcUavOQitO2PoZM2uRe
	WTS8IuxrlPEzgs8SbVUQVaBGyh8s7KhFKKsz1KIRTjuG8lzVho3iP0vFoOs5127G
	i9ptsuR8lv7qj2bJRafUQVJ2vL7XwPISIDt4DO/q8EWEX8+7xmkvw80dsJNcsp58
	d/TFqBULzyGsbHlGyr9qyOfgphC6vvgXFshemV230bqGDNsRsLqlYPJq+4TfUEbE
	JJVjNXb+Lr1+TceERuzZ3/otjnMC7qTrNB9P1uUP21PbmW+DjfH9DJ+RTAbPpnS5
	OX2UtpJqb69oy/hjrh03kA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022104.outbound.protection.outlook.com [40.93.195.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8fg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvXRXMMmp/8+bjIKaYFVccs/zVEfPPNxxMtLI0GFpJ3Etg3DR0LIYsyX1UCQWFPN8H00U8NGYUqWP3pk9Ca8uz81oaxc+wpTTut2reWrFUuntUazubt/L5FbCkOSQQWBKWtPMolygUN2WkMCIY2gHNlJgpoTIKpmkJVEXQXuRBmHNpNCm+al/JSd4HqWeB1TDXh1JL2gmyGHRKa+Ur/sHIYoCaF1tlDHKmCMK6VrBiXdxijIu05kKzNIVMs/Ha6L2yj8jSCJmH3yGpPAKh1g6RKJwnEdyoXbGXzGsm2bKBZW0Dctm2qaQauvwlBiSXeT3IbdNTVkklF8S+TpKdHTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdcHh1uh5VVUP/NFOHucx/P2SjVxij4BXAjrlbY1Rhs=;
 b=BvTb+U9urcEGS1VvJ2gHSdiJKdDaLWmhfSVkPjpK/mxt6SKVkHRdbWO9nxQ95fr+8QJAfbnFO5o5Y8DCq+ovlkgswuYoV2XaxjkVM207O5BiqWWPZjeyzU/DtioyvRwKw1dOfpdDa71vKahkLY9z+rOq6PBsIbXZ9FDpqHSPuYKLpWBY28VdpVuyCudzWXaUCjEXq7YYss9Uh6p8wjIj/iwCB1rgQhGXK0vp/pXVuf1w3rc3Qkd6H64gERDPOX5rvA87ehMr4WigtyTrxrkI+bdS3RWlX9RVEdg52S0lTD6aD4/eIkTH6F8oloLEWiRiX2pYwEvHgkiQcox2JyiXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdcHh1uh5VVUP/NFOHucx/P2SjVxij4BXAjrlbY1Rhs=;
 b=phvFe9AsUUYe0c8S83QElmF6yzWsu1mGZZ25rQ4+PrUkM/HLv+3K/qGa6OL1PF2MaUNrlX667IhsKCMW5mWCjIsnIsMUSysLShtp5G8JEPYFd/zj10iA574q2NppBp/L+8wzE8UTnq/ZlIDYJSjJKCPcQlE0rWi/O6pTnyOrOa0=
Received: from SJ0PR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:332::7)
 by SA3PR19MB8196.namprd19.prod.outlook.com (2603:10b6:806:37d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 11 May
 2026 14:10:36 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::2b) by SJ0PR05CA0062.outlook.office365.com
 (2603:10b6:a03:332::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 14:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 812E0406557;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 47380822542;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 03/18] ASoC: cs42l42: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:14 +0100
Message-ID: <20260511141029.851125-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|SA3PR19MB8196:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c2a38b5-9d97-4490-c66a-08deaf67125c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|61400799027|36860700016|56012099003|22082099003|16102099003|11063799003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	02E8iHfoplk4NrCwFCrloAYYEGy5QK1BMhZpcp7YnzW/v/0vK/5P/swJQufLT23dL6kSg3vhFwEr6r0dL2vUmD/NHPW2w1AKa0bG28UV6gB3mkTZbc/Ca0acR+vNmJPjHXuPYz/nwsqBHom0mRigf2s+OOJcbAJPkz7/Fd4DQI2UV81cB5sDDXvYaYZ1bSOfo4N9S3aRBVCYZUplcqnHPjjDEhUBatuCem81PgYzaFBE0Q0Hvr19QE4iYNeIyNKsKB2vyB9qpY1Sd22kmPtaWZGlXalQS4+t7op0/dhjb4XChdOi/Wh8YRx7UdI2W7rjkEKCC1jhB5M50WGT9oDo5EUDUSwMK97ei2fKzCJDYcF5vkXqb7BqjwO5HuzISbjJ2NAdLENCxATSPEDhbsIxJ9a33pA1Sh9NAxneNaPCCYJc0tz5S80+Lx1ZGd3PEsg0UIz58LIl2yk5yzAgvHaNMMONtlqwPDjisQ+garYolUn48kZ+1DNYozD3szwCa/V0M9DkUJdUDdXy5GPsxrGP2e1UkJSWDyik/5OC4ZoGem5q/XN1ovstn/Dzh2jbGzrBrBXLOOmThPg8+Odh6M7xpSZ4ig930vCtZK31CCevWq+qQjt03C+aoSkpLOwqOwJMt2sRyYWiPKPRlZLdaX8py1qUq96fvHzp/hvTBV2Lwth1uzecOQh7VvS9Qb/bsDpudiFnK8anu4PJJqZP/MkLf8UXXDSL7/cr+nvMLg1ocGg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(61400799027)(36860700016)(56012099003)(22082099003)(16102099003)(11063799003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s9VwZk/Lj+oQHzDxhMfEE0rOPlaobZdPoGoA/AJiG+4o6gzfjejV7lBzxwCWTmPfMt617DHt7P1N1UlOAD4XY+6gSB9vFlhRbnr9HiO8hwWIqsmMVEs3ERh1tclxXIXPA9MtbiSxuTRv+mQhq8+rC+gHGIzKyCL3SpvG0z6dTNe37jInZ+oSwDAC2XtZW5lzHZNO0n2SxTaQWMAP2L+8GEEpVwFE3VxN53faTn/rLQFWB1IrA8LU/CG1+U80N+52uA969mSOMdR5AMq+2BK6qpLjPV/KMVZ6t0hSLWhJbNp8x8PP2CvhY1ACEMU1Ecemc3GzkTNKQba3QaZBeVembrxO52hVp8+1ZmwhfRBftG/FQAZN+vwG5U4wXbumIipXvgI2H+6wz0Qx9L+gocLSP68gzGp37sQFtaJbY2p6h6JgR8O2evitXTKOEU9ueP7b
X-Exchange-RoutingPolicyChecked:
	eN4vuZSLBEZLj34TGPuXT3jbSBcifsrxcecBywJlNtNhu6vHrL5rJ8jLLGyQS6KzAp6xGngLSrE75G9Ya80moe5XDypj7vHASdTodNCCSnVWQX+LD+I55m9Nfu8ZDN/ZxQ0z89XeZQGm+zuN5bo3tHGV9x2McKHTtjmlQFuJ9n35oCVqUUfqdPkctaX45vL/NDXdzTHznDFgPIx4xqmv7kHOOw7nhMrAmr0IEOAn4g2XP/BWeh9AfQk5aptBkN5CCYWKXuMY1UderAQp/V1OQ/gyTfLb+rdCPlCOZXxd3T9FQcviZYyVz3FLPGA538Hq9Pw0xezLK/N+88OVTTEtAA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:35.4605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2a38b5-9d97-4490-c66a-08deaf67125c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8196
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e360 cx=c_pps
 a=OWaD6zo0ipeCg1IvpDlXMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: KFRcAcVharX8uMrpqalOiGBWBY4cvkcd
X-Proofpoint-ORIG-GUID: KFRcAcVharX8uMrpqalOiGBWBY4cvkcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX9PIPovxzN1tF
 todmyamqzi7/mhucySMXwzecnVKyzYIR6MC7fdDJbwZ3vtaPsf+eK7RsAcKFclQ7PSKjV26wMXS
 vnYjkBfd6FPIFRkaaZPoeKVcdY6yQkWv/DNWX4dOJIdVVUZtlcp2dX9QyY8DdC9ogVAFK9Mr5Me
 xH8cjd5uqadILvqtxtdJOgaPnZwCkuQQqUv0vDgsXCfDtG86c8ygiTnWA6EhucFmLD8lPUg7OLn
 JyZlBYPBNzNchq3CwOQVf1FSaAOVDaEmL8sdiAOYfbhxtWfsYe36kGzCRYz84b+zGcEl99nXW84
 apFQ34wdwmLyQtASubGXH5f5NYktsgciGNtkGNwUhYZRFLB819PGsKZA5b+94w4dqT655v527qg
 UghU+xlPvOMbY1Gaq3IKmxApWreSiPZ/PLjkl5oTXAgKLPbHzoSTRMmd22p34huI2fUJuXzDym4
 +Tjj2kpaCUuRWpNHrDA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Leave in the if bailing on unattach_request so the code still skips
   the register transactions as the bottom of the function in that case.

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

