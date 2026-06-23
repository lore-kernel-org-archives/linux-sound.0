Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1436F90C;
	Tue, 23 Jun 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209926; cv=fail; b=HkLFie5Y0qT8lHDCCMT2oYs47eLqKB8Rt9FpkOoXN8y7tFWyODSWPcABPEppYLD6zLxOrGDa/VXfaowH8lmWBBD5sxidJMd63oOj4Etgnpe+hHsdZXxg+KWt8WWWPmkhWiWbSJi4GMwCk7b0ed1tgsp2jr/9+Zl61wsvCwHcASc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209926; c=relaxed/simple;
	bh=VPvtQjpUFJgBSV9oNxH42UwVp6gCoMkIVKeBsEZLlvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qF1WfefYeC8hMqY5TIOTXX70WlwbDbnKaEIT4jyNjKL5xiEQDnDe+X/OdXDezLt3osPZDhFnJTLhdXO17l1vXpSPR+jLVZQf6ujYLpga+YCEuaJsMlmiaA2gHAH0JCUrOQycZLO9WVxFWqU0w4S/gHolKCrq0cJka824fAim698=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fyChjNdF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BJfGru5E; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fyChjNdF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BJfGru5E"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N4m0Bq1105576;
	Tue, 23 Jun 2026 05:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nQC8Ro+d8ICipGxyj5uirUQfY7tr3MNSf3rVbCXZDfI=; b=
	fyChjNdFJS7I1I+AVUURrXUD3QkmBvz9ycUnXf/pTuSQ6hJ+i4xrS53l3cnBKXoP
	J8wNVFLT1NlLk0Gohwm7stw/eiclEFDvsVxdXfK417qcYXZzHmhM4drwUKOiZISE
	dEOUrX19kYtX0QAEK7Nx+31fOxAZiGFzljxMWdad/CKILTqEcSEdCLK+wqeLCAv0
	kUJes33MzeSsSI/Z7L8y9hrdyiw1esVsMGeNmDvToU1DQ4HQjyRsQ4TFwwt0Fnjx
	OdYqIsa59svr0nMhejEUhTjnprskCve1NwndXu22l+CuFLsfUcHNMNKFAAHBZxcd
	kU2cFKEu1fC1cofuEYxFvg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022122.outbound.protection.outlook.com [52.101.53.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jk5wb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:18:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzPpAu+/yLTHBZQ2YgfeFmmTxEXZz4AS4z9p9YAPlHk6UljXwU/MZZNAsHxKFyppYBMpJM7G+pS5nJ/rZYmxJHcPhOkVttvHWkwl+HDIBWuUXW4ar6q/uCfw0BIThMKQ1AXcL7d1AuZm8KrqQumTGjVBh+kpG08sm6DKFsuOX05u2M7zJDM9eOxH34OHa1AjY4daet4WD7OFDKHu243SJcgL/mr0T8NnMIXU7NmgyOxkRIZUXvAAa/k65PTo5lzs5gi9T3qzWxde/EPaUL/A/z0cz1aVdVC5fXfe4N6pyQWdNGTjr6X21/yc5Ihe9C+vm+aH0jtLhRLTl69Kstpqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQC8Ro+d8ICipGxyj5uirUQfY7tr3MNSf3rVbCXZDfI=;
 b=RAHKbBTVLPiOsumoU3/kJTabHO5QYh9ed73g/UO6shOZK21WAXxFcVqDFZkIJImTvwKcLNq2iKlpB264qL9JmFtB9LFFlpM9QK65VZnp/ckkt2JRgLVfJvYbIXY1LJocjyqR40eCtci+lqi7PuH+IW5tY0qUM54308EFPIBY5yqm/XYMHAkjDxPUWrOFGTxWbRTbSzE7KXfI897lRgH88PBLgHjWUsqtA/VONA3hPeWnzQjl74bSuMGb3SJ2JQqPertGtK023QzxYwg786jkfEIeG9QRI7X59TL1LNKgH9g7/lMxbrDUSNlGX58hfTxWUQ32VIKlhFyw3eF8dUdzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQC8Ro+d8ICipGxyj5uirUQfY7tr3MNSf3rVbCXZDfI=;
 b=BJfGru5En64choPJ3n3YJra0fJ2mTwoY1b+Mce0TF4ioP9yx5BAL3DtyK1M62Ug2oVhrr5FPNG4pLmjhE60WmTn6ei3IxyPEKqk2MLTzpOpSO5WdVXXUJ8uMqa0MzYSrRf4N6InX0J0lALQ5WJ5dj9KcsU9CvzklVioxZh/wBLc=
Received: from CYXPR02CA0061.namprd02.prod.outlook.com (2603:10b6:930:cd::21)
 by LV2PR19MB5718.namprd19.prod.outlook.com (2603:10b6:408:17d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Tue, 23 Jun
 2026 10:18:21 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:930:cd:cafe::2) by CYXPR02CA0061.outlook.office365.com
 (2603:10b6:930:cd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 10:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 10:18:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4CF4F406552;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BF37822544;
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
Subject: [PATCH v2 3/5] ASoC: max98373: Add back local call to sdw_show_ping_status()
Date: Tue, 23 Jun 2026 11:18:12 +0100
Message-ID: <20260623101814.24044-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|LV2PR19MB5718:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 55d55d46-a2ff-494f-2d48-08ded110c010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|23010399003|7416014|22082099003|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	mzXJguQzhbDocBNYZ7wfkEZPUN6GjvCmwa/o4Tfwo4w51/E9N/sygNix3PH2jLS+MTGqAPyifh0bgXuK8sQpy5NFBzUe3uqgy5GH+F2eyH7kvj5bHp+vyr/RiPADq8Dx/WwP9qXa0NwQG7E1mL+ZDdO0XbHoWcmCZvUch1AG9uiTnNyKazbS+BYbe89i3UJILfT+79Z/8lgM1jGByUC5zMyCDglVxEeMImzBaYKf0Vi1ARwCaaD06qCGXTPyIUOG5KWvQBU2tZhFhpaCylAaQSX/UINeLL3crQvWyN+DvFNA9qs+SEUpfFqDtYq44nU6vq2imQsJS2TsvNQnBxI17Ojpt0qw2LMmk/XDJS7XhaTNO1bbhk6JfPxg/PPZ5zDAQcRlPJDszlxyTkiC8K+kMFgDQqW1/3QZzebcXmdRN9wFIFcv8iFYet94OSsQbpVg4RpFJTG39Ha9oeITiu8VVIadUzy4P0nVD7+kRNKjoUd7U8kGPK4pXvj4S984ZK0u1FCT+98zA3g/YFotyvk7tig/myFUzn95wdr+rHjDkaTP9SPumV7qqWNrXc9SFlYTPsu632q4atRhTxDXcI5BkclTxLrDikt11Jc+IC3LjkWM+yEbiNaQ1tB9NdZFcP03HuCji6Pd3O9unoBuvkeMsmEF7w9Tn+yeirAv2lk7/hsPY7MouABn6xQoEU/rEs+ZxxdaRFB84nzQlN0k928qUQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(23010399003)(7416014)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r9IktfgQgwGv6GWg84+FlACxyc3HyAxbdMv1w8EjfKg+LWz5S861g9CwIfC99iqg+9Np8RXOaamsqii04CCC1vzcYrNTYh/5qs/0a123/dnUpRMVJhYnpULHXekHUq5PdyuEDSJdfhFaDgJdeqhwYdVJSnwlzagDNM1uyoEhJ8cPwcLFW7YuaoGRVwnwKoNrGPqTD+Mr3mKxJXb2jEsGhE8Pi40VPelSTSYbJ5UKrcVPioxz6vpAKb22ltF2CpECjsNv3DJmwBXfqNnVoUuSP3GR8obAxfpM+0wHRBKZOOU0nHSgIgTfuHsOeJ9dGuGRxFozndVKqsz/b5HvcGmx2ZbysXX++gnQqIkHdjyRxBLQsMwL3jdteSYuqYHTgI6jKA0MAx/Qt4Id/ZL8rp3wT5wOSeEZKqPQK9DwWnIDSNDxjf+POHpm4r8o8KhLag0z
X-Exchange-RoutingPolicyChecked:
	Wk25BVk++dtV3ZafgQDt98RpKqalFSFuNwwUzKElrVju/rAMcRMb2+bWdBnTQ0Y26ooIx2+BDiHDqk8/eQKl0na/uyLSyhzHRg0RbZ3qfpSy90SuAm6MRheWZlfju1Hi39av9nHU9+df0VUMKHXvywfktaW5GxYlhsQUzx3xbO9MMRJC8RFvJLBaEl8YQOzucV8mMc9BUHWX/hf3X5vWzi/kjiP3OPUE83iGBcQf97ccl0SYjkB8rQuZbwr2xPuMXF0sGQV6POyAOVL2U6OKYHZVfmuNBB2wxlhHo2hMW7uyyBUG1MlEmw/5k0+v1A4VyTIYrJ5zmBxsK5xLyXlxjQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:18:20.2800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d55d46-a2ff-494f-2d48-08ded110c010
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5718
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX5YILqlXTgv1a
 vy/Qy1r/8YfAXdjkCyII7XuDz+cIvH0wrdiVFigAj4GFfEY3kPkSWYlH8LglRdtwwIA8UcoSIPT
 m4yEahHqcHS3Whrvf1RMcmU7aF0e/s1Ar7soLLzcKkaEoJf8WBiLGfays1LlroxqG4yhBheyM8B
 EjF0SbFQt91zXp+ok2tCCfpGeHh6Z4saSyafZArq1vDZavBlnXP8/ta86qqYd20bT1sNOtFzCbr
 uIdF1e5MmJDUIfjoaVOY49vrDzevXK/SVtB1cO4dLcylkYyv/6rnuT3d++Zo+FmKUxarX/gf9Cu
 ASIOyCdG/AncJO+JANAPoANW3SE6MTZ3ifZgxQYS9R8m4UlRDGGrOd2qe93asx28WjKLViBkMVK
 aQyKCFV7qxHozCtQEwCTG4drTlfchJJR16vf9qAgAa7jZRxD0PWJnIE6X1RQRGKsbAn/OmmpV4R
 NViHAxOtxA6mdeZS6Mg==
X-Proofpoint-ORIG-GUID: Kr8By9-p2yHyIPYIDarCw-YadA4hSppX
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a3a5d70 cx=c_pps
 a=qP3TU6UF/Ksz6PC1wz4cYQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=ewec-Weh1CeDKDJnTlIA:9
X-Proofpoint-GUID: Kr8By9-p2yHyIPYIDarCw-YadA4hSppX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX3Oe5YJlQpyLC
 ebpdlY+EsppyjVm4QpCNn/P6aqF5qUh0o2TIldAD5e6OA9s8rFSxtvckGbP4e//2GK9B8pLbHYF
 TOHsiwc5JMUee0u3aOw6SbfrR3RSG8c=
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/max98373-sdw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 6829fa07c9ecb..7a42052dc0516 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -272,8 +272,10 @@ static int max98373_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, MAX98373_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(max98373->regmap, false);
 	regcache_sync(max98373->regmap);
-- 
2.47.3

