Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4B37AA79;
	Tue, 23 Jun 2026 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209933; cv=fail; b=fEhWJMZ7iYniRZwA+9GWGI9ptXCc+pntf8i56lWdxGScv8gvGlj19IlJqBJxCYkDMpEZ5ej3nnyPv2X8t/zC6xbJ94NU3cLuLpQD7lJuUIOXiAvh1C690IPe51H8JZ3ybPcldP7IF2cNnh1I8XqdaL3wQ9ifzLEzpBQU0Y48nBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209933; c=relaxed/simple;
	bh=/CWlKQrQI3qtUeg237jg9bbpMNkMkEcPaDsciE0hjVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZI1ZlRMGyi1v5vHKoZCVN64abL8tArrGQHU2z0rDgH8HaECUtVFdLiVsEnpoD63fgercAMLiGuBXBOy417ppXIcLd+sja3IFlshWLSlg58BhyXfTlrgkJdbXkeou7FDk4lmeEvmLSmRjnPYrX9fv6YGop0euNNUJ1s2kRGiLuck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OwDCbseN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sQIJVi4E; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OwDCbseN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sQIJVi4E"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N4shcU3534997;
	Tue, 23 Jun 2026 05:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lONPU+viXz5LJDtKvSrw6mxlZ42BIJM2kDAMtq/iyaA=; b=
	OwDCbseNKk/2Wq9oPwWeCj/35etj1GdAkV/gjMBjNxMXxoLLSvzRdm5jwQD8+TaF
	o+3Yyy3rFQFnDawiDMNobF98S/ZhUUWSKbobXqORDxJp2viVNgZMF2UXh9IURTQ8
	uhG4rEzog7F7PBzeSfOHstL2Zj49gCp2AZE2aCIgk3hpsue5GN75+8RA8uUiYFQj
	E+sXkuLF5DfGxJBTHmz7q8KRdkeuruCuqtB0HbTBKcHoemQjGlZfRUkSUbeBcm5A
	aHbnM1TESN9zb398yPG7cHPo+8XZly86MH/8NfLL7zQJt+kbUutKpqSTJ+8X3ZNm
	AdqarohnGzlokvOpqJqH6w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022114.outbound.protection.outlook.com [40.107.209.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x35c5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:18:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXbPnL0pJLAaZp8uRuXYAmoYvV4zZDuTwL2UOrL2EAIeuQiG9Mmwt/WgBV9ki/RDl7pWHd9bNaaj1WE5hqUyuPVzJXkycc+kHgehgRAsY9sLYOMsbeRKK4j8GgEYesbmXh7LV6krCMg5TCINP5JsSKMWP4/8dKBD2CpBnjWI7+4InwEtPQJqIHwe7uVFRmymWX4q8wmJAvo8sgphxEvnzv9VwtJ/VGY64GLW+bQvhJuICerULyZf4VOlYuntUZwOXYT0eXySS98to2hOd4NtXdZZYhrWSCqkxHAsBM/jJsLz1J/s7hno6tDuk4xfAlpFVJy2sBEwFhmqEJxz2F3SIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lONPU+viXz5LJDtKvSrw6mxlZ42BIJM2kDAMtq/iyaA=;
 b=IGUkWHNplKBgG8ZRJqWFDbncMt70WkPeWekrTKCvfx/1wRN2lXSkuMnT50tMhDRNp9VhB/CibUbsNm+RURxFt072lHC0SbzyP6Sa+mpPRKsoPvDvxE+puA57nnXCnntPYvZRZFazlSr0uh0WQBfjrxK3cU3CuGQUbjjAsk57Gc+s1mADiEe0lxSKRP8R9ASProwk1ritY2dcWsC/0kiPcTgaPrcgEd/0jyDYQmdhDf3VHHMHeDvg1iX2tMVUjkFQFkMOvjMz6JEq8WzlGtXprNFGT7np4ZA+9UikT4EYBWa1qB9/RnwueT0BWGt6jLiGxW4cEFI4gMR9k9GuTXGgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lONPU+viXz5LJDtKvSrw6mxlZ42BIJM2kDAMtq/iyaA=;
 b=sQIJVi4Eww5OJNBZRvsthFZTmQuINNfobC/5JY+Tyxc59NnDWOUO2MME+jYpICmm7YAL2yyyzA//wYyJdEuXiaw8K7yuGi+6Xh1fQc1J0fdFkvOAjBohTpqjeVAWxCRf43CNhgeCcpcbF5jedb/m4TK/jH8cbuJCK5MyMG5p5Cc=
Received: from BY3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:254::14)
 by CH9PR19MB9443.namprd19.prod.outlook.com (2603:10b6:610:2e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 10:18:22 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::94) by BY3PR05CA0009.outlook.office365.com
 (2603:10b6:a03:254::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 23 Jun 2026 10:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0
 via Frontend Transport; Tue, 23 Jun 2026 10:18:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 48A1E40654E;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 27058822542;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
        shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
        zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 2/5] ASoC: es9356: Add back local call to sdw_show_ping_status()
Date: Tue, 23 Jun 2026 11:18:11 +0100
Message-ID: <20260623101814.24044-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
References: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|CH9PR19MB9443:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1ceb70c2-b2c9-44c5-b1ea-08ded110c04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|36860700016|61400799027|22082099003|16102099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	J43iFABTzXZLJ60oPTRxbCkTRiJl7/zJYhe6UP/Ml/OiYEmw31zlw5Vbyq46hzK+wr9ORMR9M8YvNBFsoCXPSoXxH9h8RtTYl/uQOhxJWZ8FqO8wagg54EDHk3nOlBc3B3D4N0cYrwrOue5SGwCbA3c2F2bY5gVfgvxM76j77KfcEHddDbz7J1S2f02tXTMjPzXqu4qQru2DHqCyixgiOiE0iIk+hwKPE4hF0xxS/Xt4HdWmyfHBza3e6jXdD0+q7Tu9et+k4WIO8rUM+Xlp/8x/9fDb/jquA0L9/JafIRx2POriVTCnY96eeZ+KPb4ooEfu8e2Hav697Y5L77fCmMaGusMMEuQwpdqU7E40BldVYZhVOUNnRLM2IzGRocFMceKSRm8MyTDj6b4C7YHY3m2o84a9rfAsR5hXg1QwEx4c4/EdqdR3Xy6YLDPa93tgSfRh0dQDEiw4eFpM6rQW//aSOFyxtssdLGm9Nc+w0LRyLG4BeY6U/m45x1kjJemOMeQwKfga+9uW7rygoI+SM5tKEGyhrj8DyRi7ymct/wBc9W9rI/N0Ht1/UOaHx9HgdL+bE5/VJxpkmaYDQojKxryYTVzSDgzsZOSsbpg/3blD8oeBhlhQiLsK9gUk6f2/EUqgskX7NBIiiA7k5JQkuFcONyHpx9zvohtoqhnwmT8XBG6TNjc/omiXaXsZXcBUHlMOs0xIJO9obf400IKnwA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(36860700016)(61400799027)(22082099003)(16102099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/fBd8kGVqXMLX7mQ6tjYXvkKE8uRFjxWqNQfHD/GaSCk5YmHFjexrL9b/pdrVEq+KKvjYjU0covxPv1v/Hg1gfDafjBPyDypKo993FCHNlWvXBW1hn1TDReF9vJyzIQsclyb4y1SPcdSmxcewlUX9F5SHDi5p0mYy0xHpICqq+QcB6K0xNALmELRapOzNzA0yolQdubyk4aT0mEmvhnv/Bti72wAoDVD1mPF56BJcxD0J106wijqM7NJnY8Sb3VHDiqjsFFvevYwMaF71Lxa21iVgPqTeXXamfw3lq9SWzlW7a3b6ejtDwhiOrOBEwhOMinMhYfLsUX86S4eLPAJsI91UVo0pj7+59BtYqqcqRoW8gj8uDgXshYO7ueFu7R1H8esuhnnPPxp5mzezUuBRJu1N06BZdDoyrmLG4NbmqZKJkefsJKvlgWrkvWVcY8+
X-Exchange-RoutingPolicyChecked:
	TreUZi0hU8/QkaiRNgk9YJU8+LBP5mLom6A7ker+xvt+fojSjjCY9jRkGnkSyv37dmgeTWLWq+t/DqGGwDe9f2WQ4Enz2lLv8IivnCNdtds/+qoJAtTiQPBxtJNkgtdW9sYMItaCtshHf9Uo3FD5usCSLtADjYBPT5yXkH+AzhXIsp8zwTl0g1LT/2wu/0/C9rdxrhIbrXrVuuT0rqUK9GukVYpHy8wzjIcEbwbf9zjvXB2+q7YJ0EradsYgUNNEgCeU7RVBRMSBtEZ9aSjmXDoNVEd1sz3Rax2WhDhPr9hFPFPLGYRdQjUq5YI3iP419ElVgEML9xbu+0sEcnOAFA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:18:20.6099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceb70c2-b2c9-44c5-b1ea-08ded110c04f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9443
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3a5d72 cx=c_pps
 a=4EVvFC7fyiOjnGrcsbJlsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=CebecAEAWOMkVcYaXRAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX13nUDadivF++
 0BZaGZmULzrMsZKQPLW9AyypaPx580ko9FQF8s/QuZnU+iU2Pl4/JXoujueFTVe3C+huu//HkQz
 XhWqSHgFAOCq6yHhBDI09BkaHEPNG5KmVXPMyjFWIALgI2Y//SsuNf/FjTtpuCTwfc1bmj7vB4E
 YDhLSxZocl4UynZa5lsaHT5dJgpOR+2Koo5CF8+hCWx+P1M22B54a8YlzWM0BMgyzPf+J61KeK0
 8wm0B/QMYdnW5a/aAfry/8cZlU/faHHdnptN/3xArehIXBdQnMp9JahGZtnEk2ktNLYx0tmVBA/
 N+FfHhKH0MBMtjjntnB2IB4Rtsd1Gs3Y/rpoZQFP71+FS8lYvU8kOhmH0Cbp2ZITUK8Y+TWJdOP
 leWYl7Od3rWY6SK1fYHHrhn3DJSJhFn+hMuc0vjqkZcLB1JeeU32Khu4R325Wh7kKHRKcsZtsQT
 KCMCewegjTM7AGXXnHg==
X-Proofpoint-ORIG-GUID: oZQGlXjvx3KOXnfowMAiPLuyRzW0LWP1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX+6vSZ9rAyYMG
 NCaEzciFAaOB5BOzSRhUZvsjLbI46fa/u4ebvINmpMfYGWzJw+LUWiAMU4QMf78lWSnhXAxfCwq
 mLegvegxRN2TIRwvqUYvJ07OsqwAuv4=
X-Proofpoint-GUID: oZQGlXjvx3KOXnfowMAiPLuyRzW0LWP1
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/es9356.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 670e918b56a46..8db81d5746240 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -1111,8 +1111,10 @@ static int es9356_sdca_dev_resume(struct device *dev)
 		es9356->disable_irq = false;
 
 	ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(es9356->regmap, false);
 	regcache_sync(es9356->regmap);
-- 
2.47.3

