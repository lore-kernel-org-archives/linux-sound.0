Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED503630B1
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753041; cv=fail; b=k6P3g3aL7MdBwz/oLKV3bWS2u0org2bkgL6tQKeQ2MNhMOMLhL2MHFuqnR6aFUggwRQtQqx9XA3ci5tJfF37hUdgLzWKBUOCse6Gq/uPwfpy9ryWCz+QMXv4Y7hWki7nDXgUgwX69AsqfbejY7QRO5wlr1DA1se9nQ9aEIQ3u00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753041; c=relaxed/simple;
	bh=sIjxi/4nRE3jdu+Hrd1BHl21Zs14kned2iOcmfHj2VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pu8yG6fatH0vMb0hV1n3hpfFVclXKku2CrQ0Y55+f6LEi1zrrZZLhZkyD1bs3bvamXqPnDOeJxK3qFkcJ71PNOFRvWMsjPEISfk9Kt2GiLeCMc88i8czo+E0DYWByx8C7QptUdwnenguSTC32rhUzXgpm1lDZHMiaQgBr6GQZ9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=G6MiuQf0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yjsY6MoE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="G6MiuQf0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yjsY6MoE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639BAfwx3828196;
	Thu, 9 Apr 2026 11:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oucthMzMPfpQVRghZH747HgooD7rCzLVjPCatO8Ratg=; b=
	G6MiuQf0S5ltRogBiOSah/LUTUP8ZpefAT2xkWRwIvgAEvM8Hnzjklv/J/V5UMUl
	mF42XNAgc31Dv/atsrX2kn0m4Z0dPCDyEh9olntbF4GFCfq0VFWLLjpi/pZ1No6V
	8SKEc7t8c1dz1vPlQeveXvdZdaThHHrheipFTOUEgPPeSuJ+Cet8jwlZM4/7ctYX
	1pHEiTgwqD5tz2QP7w2Q+k5ZZd/G3OP4KcB2eg7gMHaRTiDdzXwiptzvfDzHYhpX
	JlZsVEpnULsjgczH8fDdXQpOljt/uDtRYtnPSqjHx4VXWKIapYtAXPq2ZVk4/TSE
	QMYhmj67gwnuFijodL+BJw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020127.outbound.protection.outlook.com [52.101.56.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr4v0tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:43:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rwis/tXfcxeIp7p8PM620M+CUGg1Vj3DZ7zdkxiPQWk7AT+QPI+XsrTmfKB3XTU4aghQ2vPYbUCF4xvBgNAzYqtYIm1lFOxO3JFc2eTlg7psHN/6f4hdNAnG3AJ+YgCuyZM1C3muUDWuaU795lTOwCCELRjdpxnbcooOffLDgj7kENs92dNXKoFXWA6f/oXDCEhBtHupBxNwHGLBgNSnmHyh8YENVH1as4WJN2DwYE37lsKrwTTkCron9QGh0K0rnrawJhXhLRE0Kw7gOowIuPevATgRgo6FXjDvENTAz9peOPRcUMXxsPNepl5KppRa9SNRamMQjQ08iLHQn1zn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oucthMzMPfpQVRghZH747HgooD7rCzLVjPCatO8Ratg=;
 b=H7CA4DjsYtVxRNSNyR0VE4TG2ekHcJDEqUjkwdKEKJRu4Z/sqcTOLuCT8mO2MqCOk6JumlGdLdyVMoq+pcSS5P/HhaIFHF9ok4vVtRspR9L72XpLTm5AKW8aLFdXsu+/Zk9GJGBWXytsx/kaGUVJ5MfU2063R8rcXs4wiJuWRx9JZWi1IiWxKV47BU2t85iegHcWjz2OSsg+j2uJ6vhi+Pe2tjvPs04AvVOtKGy0SmBhKmgTVsOJZSuwkPlvLnosHoROCjvpqLMimbJH6CGzjy+N50dJNaf3tSbFMvDLCd4LplukRZWcY3A8lQ6nacU2mzT2j57MOFA+mVh+vITUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oucthMzMPfpQVRghZH747HgooD7rCzLVjPCatO8Ratg=;
 b=yjsY6MoEP7gvbfz0pyOp+kDJbzs3IPyLhaFVmsQ8KX6fA8GFTHyfQ96D2EH/cP2R4tHpZ1FzK373NH3oATobo++7Xh9Rfp+T1GHXPpGXWwYvO2j07ZlChO/jFiYZl8h3gEpLrvDAYhofGXV6sPIAZtXcAgAqnylbiIxzLb2rdoA=
Received: from SJ0PR13CA0078.namprd13.prod.outlook.com (2603:10b6:a03:2c4::23)
 by DS0PR19MB8435.namprd19.prod.outlook.com (2603:10b6:8:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 16:43:35 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e3) by SJ0PR13CA0078.outlook.office365.com
 (2603:10b6:a03:2c4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 16:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:43:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4F652406542;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2D58C82024B;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/4] ASoC: SDCA: Correct kernel doc for sdca_irq_cleanup()
Date: Thu,  9 Apr 2026 17:43:25 +0100
Message-ID: <20260409164328.3999434-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|DS0PR19MB8435:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c6bc3712-487b-4179-6e96-08de96572425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	IiUnC3XBs5X6nb1CiGQ82hlBC4oBZC49RsS501rlv8oQb8wGe7MctBFA6cRMO8edam3sqaSlOtdXek4l7o0cS3UNmpOgyOV4VP4JfjMpVWOn1ruh2OxmB/XorfL7oSChUcMcwQHIuo9DPPYam6MKy7En5jx/Qc0cqpdgIoEdyr/1mARjvVwiP8L5RSXjM02AfUZQ1vlFmAgwc9AFUON1rLSqO+22Td3XvuomImtxDNYbr0a33Ob59sAT7o3AK7IidJRBkcIOq6hL8ytIISI9NBcTIFNIgJMYQKAdoL6dTMwvyXMrO75z/MZJ/sBWD2IuAKGXx5ItPx0ml5Kfo+/V135eMUyrsqjhqRUWlJmVJjFjZWvZWDjwhrNQjr1kExFWIZuE/BrHLetT4qzWCagEMXoT1eAwWFF9GTlpH8ihhkleS1cTko8jhDVIGMqett1qmZD5z9lh/K78IbzZ0uEdFPhWlD7rsbqE5WV+JpOFmmztW/U03ri7l0vdpXIX/uMzgiy1o5zkH97vrv0L2S52sOfyQKjDw+WNCYpAfbGM/w7f1rgmxG1S42iwpdxnSHqknwF5k9hvyBWiUPu3vvz2DhuDD4C1uE+QgDmaCW1zKyTcckw2FWVkqdmtZ6LGezjo/3SC4umLbnL+t3l2xc3ps8N5DIPW9XTfCG7/HTVPSw5Ns3gcwUaD5NnqaKHBWsqnyzqhT+d8AKjlZeCqAd4887UoKEPLXCNbIWiUTkhNNeWhCkKRzt72rWaDjTqqeC5A0p6pqUZnEDoHy0GtLrJ2VQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QLu9SaZadi9krOTvKn6MxpmTg9joRziJuaj4asncuRyai3HeZPIuVtt/j2T7ppJNqd5vjFzNr8I6MuiqIZimhNoXTwP/FSh87CayF+3t1vaBeTbV/CQHkgUO4ec6V55KypkBq5kvwdqD267yLn9r7A7HQxq6XNd+sk7J7k0NLN4Y4nE8XG0NfBXKFKqIiy/mslCUow72a9szMYeIcUirrvRQm5WK36+3RuPDBRHFlQMu41562VwAOf6U0DbW0LqulmfC5iExYbwktRHfrLTb6SVPMPYELZI4pL4TkyoLXjYp8x5/4geCzNe1uy8dklQAqT2fVTGUoPIxTi0PQTXjHZUKL8Rfk4VYL8GM8wpAZ1MDDuGI7mdOGV8Ml8VUhsF84y+77v3rdtBn+IkEwLyUXsvbzcbU09uxI8Nb1z0S6B5NfnZFjdnN7IlJNWGYHegM
X-Exchange-RoutingPolicyChecked:
	V5Y56mKbSSay+7lVEDAsNwQBTL6CW1DL9G6kSjOv7ivszO4paAVrkCKn3EjyF8e9J9F1Ss414deN+iC/F9lX7K7vecOyejo2ufwX7Ocs8rXEMirUsdt8SOZ1uHyIwoW02G2AsojiVvujS+ERcIE9dYgeOW9dCtoDu8+YRvxjaFzOnfVTilLSk30cngfOLTvP5G8kG2JU1rxiIm/V1v6+BZlhG8B24Fihxc/G17pu40ZVYqXBF/XH4jPv/g+nDYJDEz6ZdaEPdrkv4HgEiTNhwn2oinPgqc4mFAWvFffCwrW82BIsjI3NXEUtwjG3K/gkwNsenwO4cxLAyKZF66S4Bg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:43:34.2640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bc3712-487b-4179-6e96-08de96572425
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB8435
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=69d7d73b cx=c_pps
 a=I+QdrI45u/umTjhn/cS8vg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=jt7KwZv4RvLptmtufP0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1MyBTYWx0ZWRfX/+hQoDEm1GV6
 CXFlYwBkj1clkgYPt+a5WATILKIvDWYfhZVYSPpvO5LwWohs+u4N0iIGVA8fk6eQDUUuezwsHtx
 STzfH87STLta0cfJylSNAMgSl2K+4EFWqzPOmTa/vrtKvAgjVIInWmDqnB8PtRaJHKppHScgKzK
 IMQMrGsfIJsFaeD48CEkA72MN7xCVyzaIHJyHGt7WNobR1cIOC7+pxN7tHxR7clGUkJJqJyMgX5
 UkOAhVT7280rgiiOUlZpLoh54Df4LPG3eR1CvK16G/qDIzR0SQFKO6nG5VYd/4PKftVt07ZfYnw
 6wA0neeK3gEAdL7Pj2ZeBDY6/gzkHr6OLWLv/ub0OuiCToATIOIqbcBfIxnWMSdHGUhbrCjemm+
 AiX2RlvhHBS+ZbGhnvdZ2KQZMpWXZ/PczxDjXMsFVFOB2lcH9KIHZP4AVtPrabd+dXSa+1+h7TU
 Q5HgULqHazdmb1SQLBg==
X-Proofpoint-GUID: h2uCJvFA3kC8856brHOtqWerhT9_HhS2
X-Proofpoint-ORIG-GUID: h2uCJvFA3kC8856brHOtqWerhT9_HhS2
X-Proofpoint-Spam-Reason: safe

Fix typo of function argument name in the kernel doc.

Fixes: 0b8757b220f9 ("ASoC: SDCA: Unregister IRQ handlers on module remove")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604090800.koxM6j6O-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 5cdabf8ae9da3..475aebcafe3f1 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -555,7 +555,7 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_cleanup - Free all the individual IRQs for an SDCA Function
- * @sdev: Device pointer against which the sdca_interrupt_info was allocated.
+ * @dev: Device pointer against which the sdca_interrupt_info was allocated.
  * @function: Pointer to the SDCA Function.
  * @info: Pointer to the SDCA interrupt info for this device.
  *
-- 
2.47.3

