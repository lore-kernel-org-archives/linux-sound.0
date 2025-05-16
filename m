Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94029242913
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401039; cv=fail; b=QbYmtUngePK6DMQvWQm6RNlA/qQVKsdJrZmFHQZDLlXEmqQywv/Fy4AL7GcdnRLzhb2lLYUfByLK4L1htSCTDJgL2qWd8NTl+2yVTCf7aJ1gHuu0WECh0Kg0PpWNu+qEBfhD37OT7Ba08GDAfhAFeCHlbKwA43CmjwfQehTONMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401039; c=relaxed/simple;
	bh=fr5Ex5ZkpbDwI6Oqe6FXpejWZsAaC/4TXYsWFGoswvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RVgyvyQzuNQC5nH8MfHJo4NQbeF5vIftLO1hmRZg35q+d5v3AXsyvtoxLkqIal7IQe1nerN6LmGWDM83pz32v2+1GYG5Ll3hP+GrgmIu8iMj0wSoOog/W66kyQFVCwIsMsjlJbMc+KCKLy1ipNgFqi3hYd1wPNk9RNRjv55J7sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qCB03LvF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k1vnKLbw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qCB03LvF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k1vnKLbw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3sNei019296;
	Fri, 16 May 2025 08:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VaVtUWXzLOeZR0IVX/3D7SKBzLHgz5v+Kbq7KagrXSc=; b=
	qCB03LvFHNVRRI+ncI88jkhHHdMTu7/uHqRO5hUofqJege/7rbp+QdxEBgvDVzDM
	96jlis8+hxEukJGTnPc8EWATz7Ap6uEbaa6drTZMar/TC0Xr8GX5qluzOY8WHmRU
	X4pr+rxZWneeypHOvFjQO7iQWa5nGD6H0V25vRITKMPEZDP5bvE776QqUGCNsxUi
	R87SY+KJtcCWCZNzWxewcXnVfsq5DLpQcZq3LqRHRTUkb676K/ZzMTVt9oTpqBN1
	gN3P4d1J0Y6lXnAgeaHPkPCvxUL2+jouLmSMfqYckOyWwngMflZbc9/zQ7ew44Lf
	ovDttLuirZMww2kB6+/FUw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe5cttj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayJ0iwqKJuhlP0Acjv19tJlV4SKC3wJQJbEGZzvfMdfXjsbrx9Gdw+TNU5wq7jF06//2kEF1jqrUsxy2yaPO9KXoQfO5lmyUE1b38d4xMDcM45a5T2lHhtOYf63x4LSIVxkyrSyQYMYYtrnhcXc22ki6rs0be/Wnk0pSyauauaxVGp58L27T5ZpxAgHy6GhzbJDNBooMsnFtSSrFXiGadagRgWk/ce4h5RB861MdLcMaqT4uWCY9PJVZjbe/bUC8ksEgeyS2HzNNm/plVlmIwt7QoVEt23Mc6DHPRpdiAhu/cjlqRi1iThe3Wq9toswbNL52FzyU8KYRxR/TILoG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaVtUWXzLOeZR0IVX/3D7SKBzLHgz5v+Kbq7KagrXSc=;
 b=ttGh9zJQr7QkKnPy0DRZSlQ4nQdM0XF41XMoq1F+m/znrprZgr5I1UKG5XqWkrQ1Z58Gkla8dUszdJDIZSVwEB3ZW3kCPCSnOadN+UTaITSc7gj8Hrds2FNFzfCQYjzdBbqwDmP7GLagyTlOcv3C73z3yv8oBjXQwh0/4l1KoMjquLqhBa4wnrfKR8/Pwg/2WDtXq8a8HlLBxPx2ocLKapeyhwmLmjs1Lw1sB2Q0+Mux1+3BjP9xx0un12PjEc6znCMCmm7qIPs30MUgpplTWxLg7OUI5LnVMxrJ4jTB1YE9SLoGxErFPz6AloChtNFmun6YbiKBMgbnHnYfYwK9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaVtUWXzLOeZR0IVX/3D7SKBzLHgz5v+Kbq7KagrXSc=;
 b=k1vnKLbw2y+2cM2zAkJICZfkqUHIyXdSgQHXBpmKPukBh8Hx5WAid3mqQ62eQXl5AbDS3oVrCJnnieqNyRJlKI9m8DVwveF+T3nmzzO1UhAyYEd0eHMZzMOQHxYjxTb0e1R+yGwHwn3sWEzaWwnVfZ3wOiswdDgURoY0fNIXiVc=
Received: from BN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:408:e4::25)
 by SJ2PR19MB7577.namprd19.prod.outlook.com (2603:10b6:a03:4d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 16 May
 2025 13:10:15 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::27) by BN0PR02CA0020.outlook.office365.com
 (2603:10b6:408:e4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 16 May 2025 13:10:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.1
 via Frontend Transport; Fri, 16 May 2025 13:10:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 18B1240654E;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 07EE7822563;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 3/7] ASoC: SDCA: Move allocation of PDE delays array
Date: Fri, 16 May 2025 14:10:07 +0100
Message-Id: <20250516131011.221310-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|SJ2PR19MB7577:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a8ef0607-ce0f-4505-18f4-08dd947afebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CceSw+tWma0aNfua4YDISscNVO6SEsCWZsOaC2EWgZvRGVfWA4ZsIh7TQmDW?=
 =?us-ascii?Q?loqGAQDbdMwC41rWzT9uZ8iKYtirCKoOSKpCJOnpUCBbpW+W196KhILLndfe?=
 =?us-ascii?Q?ak811vmt8etxYRgMYUFq7M8jF5uXvvnatPaoPESCop0TztlQ855jg6TULruD?=
 =?us-ascii?Q?nt+Lml3+M2KosPnethAPmwNx6WBvo/Y7B5oaecKyT9j2GP86f4FQBWS4Drb6?=
 =?us-ascii?Q?Pt9wcRpFsQtJuHznGe8VGdCqvfynWb0S9871bSCI9O+D7HuJ9IcjRpSRvqTa?=
 =?us-ascii?Q?sUDdOtO60zw/HoMKiLJWJILZxwGLqnn24zE5SLPClVXOjn8CUkW4qzBl1y1s?=
 =?us-ascii?Q?0zvuEyJumh3BFuUINJ+XteojMmPZfya2dO9HcM8OsvlEBA9KVYK1kn5rN4mm?=
 =?us-ascii?Q?HAYIcRtbWgwibTAk15DVHHvarVSoGWj2OXZRoBSFC1GCn5YaV9RV6HjJo3GG?=
 =?us-ascii?Q?P+ziiZYy07sgvRCCUd4A8ONdyjN+y/72o/spYeIpHuM0It8L7Em2IXvpFarJ?=
 =?us-ascii?Q?uz1erCZlGqaeTxij1B2Vb5uvNCf73D4mf6vr5kUHtzwObqPoHjX9XiCrOOmX?=
 =?us-ascii?Q?0La0FehtQ4OuWhDuooiZHurNsAdbjOTroPZIrUt0oPs0Sr7hgokgnikVlwsc?=
 =?us-ascii?Q?EIws5NqNxQti9UcaUBdxcOdgfx/qVpV7HbJxJ42ClS9bJY+UDZo7do6WWfAV?=
 =?us-ascii?Q?sklGBflJrNDfoRE4ws2ve0/hhz+ZcpmLWxubQYnBVtOlO8yPHwjaSKiOpNvy?=
 =?us-ascii?Q?iniqX9FGL+SRpSDS+g6dDpjJmRUCTO6fPE1++4O9pASczwEfZxhLOfYaJtbd?=
 =?us-ascii?Q?TcjmTOriHMIJs643J+k9z78qtwdSDWFAuZNBuBnNNhhzGfZ8JAp5M73UMPxT?=
 =?us-ascii?Q?eFEnpkeQXSexQfcJMRG4h4b5nWNav6s4Yo6k2tLtZrxkPK+wTAsmsBE6qJLJ?=
 =?us-ascii?Q?/zYmatrz+X8Iq6nZWTEuaQ3/L79TvW+N43QpKz0tXQzu1XoYuquOucIMJZyp?=
 =?us-ascii?Q?TzEWFOlkNbtL1lp11GdYlpasIj89f6twhjT9eIpgAOfQf1fTzkJu8iNxkPB3?=
 =?us-ascii?Q?EM+798i8noqqlNCycz+pItSc9obxuzRVfCMktcsRq5rNfcfo4P+0IfHLWWui?=
 =?us-ascii?Q?nc0CNO/zsfe2BINc0ENFHnC9ugzVFs1dgoN2FHvuL8h9beDO3uDtHxzW5W30?=
 =?us-ascii?Q?i58Qnd59OFGbYtcAuJMKYZLfnX+Ghgl5Kau+rs/YZE9h1AU5fPbnQX05nfJr?=
 =?us-ascii?Q?u8pJevfE+6eaC/FQsnwug9W4SC7G995H08Kkm73CuOjrs3DWaWmLqdt8H1WP?=
 =?us-ascii?Q?QPleM3Z+fU8+woCf+sYrKIjlxeJUQLzGRXuWx0+kNmRCC+qD3NtRYpbsV0bA?=
 =?us-ascii?Q?YHPVCJOILVTsIdD2GhNH/d2fHAMUvDf43oV4z4iBemRMUARu0N44mZCx9qFs?=
 =?us-ascii?Q?NUToGo6qSOBnSzR7k6ckw3JvXO96rOBRJuIi/1uKcVaTRJ6VK3Rl9zGZKU7u?=
 =?us-ascii?Q?Mh3G6pwqLftgzsM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:13.4996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ef0607-ce0f-4505-18f4-08dd947afebc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7577
X-Proofpoint-ORIG-GUID: T-GmF08CWH-EHYoEDwE35q5FbTNJgOly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfX3fTJanH6HLjD X+u+kHd58xVRO3WiOMgnZUutZ82cZKQyOvRusuIM6clhVq18y6lsmZlt06RwcDBOsX5WJWZ9uLt pW5POCat7rWdD+pmtjMTJU/0gP142KLpITNDGfOxFX5/pCcdNXhrGQzgKsxstuhResATC99/TcZ
 1qwlo+uWuPnB92YR06rcEOYSEho0uN+Pb3l6qyK4x3aUoWcgUvM+PLKgxl+8j2qJuBYIaRpyVOr sChZj48ooO9uF3M9CurUMpVbXnrJqsMoaH4MygCfm5ngnP6wu8cTyAxucLc1bP20eb7evo7aRTB G0VJuDHRm2jkpKvwSKET0bp5k1aeleSYcNAL4JWbKbJkHbStL3LU98Hbl3XQmUjY+JfJ07gowxU
 PIoid11As+E+p/Pr5yEljaGMKGbi6C1BmZr4tZZdcmdHkdaSL8ONSWmV3nxnqZ3HveMX3oYp
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=6827393c cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=lMW7R4D7PrprYJh-GsMA:9
X-Proofpoint-GUID: T-GmF08CWH-EHYoEDwE35q5FbTNJgOly
X-Proofpoint-Spam-Reason: safe

Move the allocation of the PDE delays array until after the size has
been adjusted, this saves an additional division and simplifies the
code slightly.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v5.

 sound/soc/sdca/sdca_functions.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 493f390f087ad..64ac264438907 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1105,12 +1105,6 @@ static int find_sdca_entity_pde(struct device *dev,
 		return -EINVAL;
 	}
 
-	/* There are 3 values per delay */
-	delays = devm_kcalloc(dev, num_delays / mult_delay,
-			      sizeof(*delays), GFP_KERNEL);
-	if (!delays)
-		return -ENOMEM;
-
 	delay_list = kcalloc(num_delays, sizeof(*delay_list), GFP_KERNEL);
 	if (!delay_list)
 		return -ENOMEM;
@@ -1121,6 +1115,10 @@ static int find_sdca_entity_pde(struct device *dev,
 
 	num_delays /= mult_delay;
 
+	delays = devm_kcalloc(dev, num_delays, sizeof(*delays), GFP_KERNEL);
+	if (!delays)
+		return -ENOMEM;
+
 	for (i = 0, j = 0; i < num_delays; i++) {
 		delays[i].from_ps = delay_list[j++];
 		delays[i].to_ps = delay_list[j++];
-- 
2.39.5

