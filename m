Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5F12D2496
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753065; cv=fail; b=qtUbwAUNWpDTUrq7DWfe19SHFpOMR+NY/l1M8CYeeF+EZotIy0LiC6KSnUaKeBOrm3uSZQdI0R6kcunN6nieTseV1yOATIEJBfQnh7LPQF3me+hyQ9dkN3cfFcokTPa4gyTpiuH0IG79NR+59o9ddZMD66rWZvBrhp3M49QFgKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753065; c=relaxed/simple;
	bh=/L61H9oaXRhyAenbdVzY6hG8FJAijKzniMmttu/7cTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=soyqmKnoOSfckHo1wT5ZxWhrch/N48z7ey5G2ch0cKKrquIRu142MpW34fl4a0L7QLCvQLI8kYdUOpdjlcbQ10slzsZlE/stoSqk5Qt3orPvIvDJVYP6Rj2EYtAlaMNvkET9HLg/0IuBnozMQ2xs6DiSlTfgYY1cvZKm+O1R52o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QIQrCkex; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=P2T0Bd8o; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QIQrCkex";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="P2T0Bd8o"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394mTEn3011756;
	Thu, 9 Apr 2026 11:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=miBztvKp8e0YyNMnkBmF86aTnqAHTOZhKCBQqRRyS0M=; b=
	QIQrCkexxpWy5KjfUk8Jlw4E14DchFX54XLbJQbCHh3n2Pc31laqNiCSgFHlTNJf
	ac3DMjZRtWp59XX4GM2Wo7we34ZpdHz3DEQc3InhAMLDUTqJumBo2Er/WR41fYtO
	fG5ETWQ9cz1W4IzcTtZ4uBTWo/PwULDsz5FaHci0BRvWWNwkWoIuKmi9Q3awRoP5
	sYyU/w972s36GDkNxXVK5quv1E+2h+yiZPZPBrhj6v3eoXU+PqE/GR1Nv5bnL4TI
	aJxFFSCRFCR3QQ0loN3iL3Lg6kHdCVEo3T7AjtBaO0c1jNErS+4AaejATJtH9gbc
	VTgwV8Nz5pGl54w/teIvUw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021133.outbound.protection.outlook.com [40.107.208.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7m0yg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:43:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCgvjvpn5efoXP6YO7iqVQtwRq7/ZScxmM3OfJi2ADrBCpf813btiMOUZFHuAk5xL6FbRscFyJJd7j2XrHOedmckz08kgheJ+ZPXSV9qFnahW8izJlvBVGZae8W3JDWyutzm45tjtNumOoUQpLz1MUEdjmgcUScPOLTg2YO/HbngXBx4YLCqWe2yowLJ7N6Eg/uhyjLOc+uPjbw2wDFlJQFSS9C7/y+A9OzsIj/mzdfk6t5atQBeaP/BZUAg/FM4A6C30D0mwgCR6U1Tu91ubuUk0JT01NBlbh6ZIADavZSf2feaX4RreBrtGccyBNYXUPge1hlL+PyMNGHmjRv5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miBztvKp8e0YyNMnkBmF86aTnqAHTOZhKCBQqRRyS0M=;
 b=jW8wIMkiz6zdC3VAYYbZCrq73iBBWMTWyVldBM89URk2Ib3c+ILqEHwfpA2MsqeK+9YG+yoLmlgwuBXzjBOor2rB3CuYn2jy164KHVomodYi7GCgY0bj7AqDzRlraxzihMez2+vncSCRnCro3b+F4+AkHuEgjylkO/pwHNQoufQq8/LogL1NUsUgVNIvBiG+GhKleXxiX4/4nfKATLbEnAH9zErED4inhigusAFsihTfXlBU2JjSTBOpVhmAi8P6kSAh8Y+tIrMbOW/JOUAchBJGh+Tno6TJh1pM5iRyOCx0iPEUzYEvE2p1X10CRfF1K9muT8nLmGVqPN/eayvqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miBztvKp8e0YyNMnkBmF86aTnqAHTOZhKCBQqRRyS0M=;
 b=P2T0Bd8ojZX6fwh52IWB5H5xj4J9F+1Sca/WZl+GP/EllKD2+zgx+r53UpMLWOYiRg0TiNvjhMEhHnoi8YyKM+JITz7juPAb4YpTMwzRF0nvhMFlUcn/OPrpTuwgIut8N94V0evREN7DmyD2mBEO3bLmK0lNbxJLlV5W5N4v7/c=
Received: from PH8P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::8)
 by LVUPR19MB997321.namprd19.prod.outlook.com (2603:10b6:408:3a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 16:43:34 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::da) by PH8P220CA0013.outlook.office365.com
 (2603:10b6:510:345::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Thu,
 9 Apr 2026 16:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:43:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5C79740654E;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 356A2822541;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: SDCA: Update text of FIXME
Date: Thu,  9 Apr 2026 17:43:28 +0100
Message-ID: <20260409164328.3999434-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|LVUPR19MB997321:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5718035b-6f87-41b9-a950-08de965723ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|13003099007|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jZv4MJDSQbNT2XeXlXeE9etO7MtJvgbOtW9ZFC4xpsImmC9aUuQcK83QNhOoPzWU38+CitC9DhVESF5MrNoXZpTMmUdWoQ6rOIMhoOue3JTrVjqy8NPkK4vBAM0JZpomN9BQqaA6sTHpzZnx/pAUebUfILEfyLerIu/9VW08iV/CSdUd1x9zX4i2CU3/9xkCDMzqE7Kau+g2MYaUZgYfnNhi/HkmfKId2i/hb4mQa30HXHSDFXOAPldUmMOKx8F7URz5zSB5tFDj/PMFZouB3FLNXwmZNIelm9ntz6JfPI2ovPn0Xr+dx3B8qWIJdvmJRcC5tZTopJrXP7V63PF6yh6CSDTEJTVvPoSSb7eLf0eEpZpi4Q26eGjHRqpAtFlWq2mFpz4r52NVxYaPo8nt/8Qm5BwKWNHq/HtG+eSP8IDmJYdaqTKNrVLTi1abFEV1yLaJ5ld3Fz8CkXmZr2DpsRZ/N7tuV8o/VLpjPCw+ZIhVCqA4nwuVuqPmBU1Ojh4QhueHyJ3IkGzxytgepbeLZf4dEm2UN8uBLtH500j9qFaf/vjBwbTJh3ziOBGCnZml3FfXlamK5rPHgfMcMgrX5JiYxMwQ6rxz3M0Jy3+N62XByjPqOADcmFdlHS9wYx2lrgRCWyYyZvtbwNWWrG80A1SlxIarLv4RxD5j25uafl5J9JHjttIiGIXaz5x57SqjM8nscYMzOC/NJtk2XJ9kQJy84vfFqpeP+NN2GQzaM6IdYz2bxgWtcwASuchLlH3IE0Lv0I5mnuihxtY3/zeAKA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(13003099007)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lgjFtxQsjI1Y9oegjelU5dT/u6PmH6b+hurn5gSIBBAhneHlyW4vO0OG1ytr35FARb4PDjj4KKRV2jdQqwiSYdo3FkMRQQub2myzJynMR8FyJwD60wAMgh2hyA2+53rRX8qPP3thNniW3DRqMVtFfAvMeS0zrACkQEbkNq/4/s9WAXKVNBGwoCVvlORSRxwhoiwdqbByINsZ4cLmiIck08AB2/7zPRG+A5TSL9eLKLvLaJuMPLobqeC1PmAgMBeQw0tfE3sNG1WbuyrpF7vVrlV5+hJA7Q7k4fXQvMSx1PKM+6slPlQ0y2NAzMySmcN6E6HrFQxrEEv1liUlsnpUQJKgGUhHyGjoBq/zIfwbDBw6QL4bUfjitlN8hpKDZBzOl1HGov5yiLkULz6dlm2CdQgWhAiqxKWvJ7QdrtpaFRhpfmo0IXojyegOYwvw1T22
X-Exchange-RoutingPolicyChecked:
	dk8BNWRlsfQrY9r4bT5J0cAAwLt3EZcWHQPx+R2kN7GSoiRTBQGYpfxNJf+JtUSli/Ch8zG0O13/0OvnrS7iOcr06+IHywlecAbVzvlM2zTjyp5BxUbwQrHL5on551SpAboi8YZj6Ycc6bgNCwk2qNi1UfI3naodn3RwM0KwP5q32HJ3xdzxkyKhK0jCxOTKMqCT4VGWbw/zqTJebkmGCEFWjiXWq6a/fC2roRbyXOJtqgn5XTxUQC941KWb/9MtvKc2gc9+vpqwa88hTHbALctAoVUps7YHFojDUoTeAnPtKwZgK82OtiGR7DdDjnN834o4eSEX64POQ0+adEP7Gw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:43:33.5136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5718035b-6f87-41b9-a950-08de965723ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR19MB997321
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d7d73b cx=c_pps
 a=oB12z6Vl+/cAOQgROE5n3g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8
 a=avN4fjI5vLKTu_Ys8sQA:9 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: Jn6cANqzHtMMdQ7nSnhtEn0VskL6NyT0
X-Proofpoint-ORIG-GUID: Jn6cANqzHtMMdQ7nSnhtEn0VskL6NyT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1MyBTYWx0ZWRfX/BF9XZTRbS42
 P2eAOnpL+aZ3Ke3/AU1mzD2etpR6ZwrRN+cu/lc82DpYC/DJwRTPBuD5JmMi1De8ltK+h0OrL3r
 vYZwKp8aSv4kYHFtjD+CS2cMeVeQxSiE7XB0WHDXKqRvj2NjR6TAy0Q5PfxEOFSu//OLxtszj1n
 wvgPmN2I1lsGMFn9BVbAPFuRd5XBgqnf4TZDu0S2k4gD7iSb+qv7uzXMn5PtIOEsDzpPPPNp3I/
 jqMfmz5W0R3KXhvnsmSJ9o9y6Z1YSIdzvYsIWeVkzj8rUJFwjNfysMh/2lYKWz+a+ecrgj9Why6
 LtgSaKs+grg81xciGfsmkmhXgmEK83xUJR93ulAVzBCvIGTRmOZttzfNNhanFJspqAlZ/PnQjiZ
 6D2apm7LXftD8w9neNywrannt+fXCrhKj+PpHWO1iauEQmm8HufP6WEavOkDmeNNh2G2ASBZd4N
 BHxIZqpZ34lQ7dzgqUQ==
X-Proofpoint-Spam-Reason: safe

A couple of attempts to correct this FIXME have been sent upstream but
the situation is not quite a simple as the FIXME implies. Update the
FIXME to include a better description of the situation.

Link: https://lore.kernel.org/linux-sound/20260408085607.3813488-1-shumingf@realtek.com/
Link: https://lore.kernel.org/linux-sound/20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_interrupts.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 3d7eb19967243..6e10b4e660d96 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -119,7 +119,17 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
 		switch (BIT(mask)) {
 		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
-			//FIXME: Add init writes
+/*
+ * FIXME: Should this do init writes?
+ *
+ * Currently init writes/cache sync are done from the suspend/resume
+ * infrastructure. It is unclear in what situations one would receive this
+ * IRQ outside of that flow. Presumably it would be something like the chip
+ * crashing. In that case however doing the init writes and a cache sync might
+ * not be sufficient, for example if the failure was during audio playback
+ * there could be ordering constraints on the register writes to restore the
+ * state that are not handled by a simple cache sync.
+ */
 			break;
 		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
 			dev_err(dev, "function fault\n");
-- 
2.47.3

