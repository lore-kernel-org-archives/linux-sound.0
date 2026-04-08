Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC537C10F
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641144; cv=fail; b=YM+75G+cTCEPnwHImkqmlrpMiWFhTB7HZHFCfmJLAYFM8QnJBnq2o8cR+xBGcrS/vbkr9sr8u7r2cTk+0rINmJzb4fz5xgBT0Tks6pbFZwJ0JSitjWfvzJtTIg1yNUUkeU3e/8orSzctYcwv/xf8Uds2NBwzvMhfGTD2s8VWb8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641144; c=relaxed/simple;
	bh=zDExfwwRJHyI77KDmtIVugpwqQhflkRkHNaFcx8YDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+8H8JanQ/9mIC/FBG4mmFlULIm8hYZKYMJ5j5mfn1Jdvo1tmJogjBMbB//ohyifVwf1+hSk9Y8KlQ4KwFZWiVwexIgJVov5or9gzkz0P/lpkuoiGsVq+NUVNH08F/TB7p4P8dNgvgH+MYe9EnSLq1uj9I6EiUSSU12ii0FURBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FWGYpGH2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QkFKCSCf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FWGYpGH2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QkFKCSCf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637MaRQn101389;
	Wed, 8 Apr 2026 04:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5EAzGhgwtX/I3IfJIG3SXL641yqbJEhgiI1RSYqFzTo=; b=
	FWGYpGH26tjnw0ZrrT3iUEEMDF0HtI+UceoWhiaqKuDci7cE3qDsrRzZUh+yU8r0
	pVGGu84oyyGqKejJR0GTvNmdYwyUlJLWVNaiuS54+jeOWM1pqH/mm6hkzeEvR+Qi
	Y1h4PZ0y0qJ+BPyQBCvmJUQ1naRCS/8ANmvCqQ4iD79TsrM8H4m/bjleqFyAzqgW
	zjA9ScvO7VgyWFOofHdWVW0pf4TvhY7++XA/w8caMyFoP1R/JMNWm3vg6MufDTKM
	5JMg8XHw6rf9JqoS98Fagc0Q91ssZuK6h6uWoVqrUrGDBFQBGmDpUL5ugdELNHpo
	IJ8S23IN/MP2geb/HVfrkA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021109.outbound.protection.outlook.com [52.101.52.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7j1wn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:38:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6L6UmlJzgHTMWI/SAt0mv4gcZjKG6wPzT06BM0qNYGV5xb8meNuIM41GD6uAKX4j1HG7SX9J6LbawR8lLvftKfeWbYQ30Fuc5L+W6VgcQRldamtV3BLlJR/k7ScNslgKsxMcNWKnyvrR4N5dIGQVOtINjMrQrOJ0uI2C4fDeIT6gFwW4X67oBE4k6HzHwEcstkkY7Ugn5d14QHuu0ZkH2fiNBzLUitRVvcaTeKz8RzPm7VZRYGqCJCE8JyVgB8sQ+qpNC00QVSUj4oQYq4yAjxXGSTa/UQtrX1MilgMbaJr35mWFKgpVbqNokKdaJDHDeK+RwGygcbI1U0C0NjQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EAzGhgwtX/I3IfJIG3SXL641yqbJEhgiI1RSYqFzTo=;
 b=IoUkNjX0cOACFY45xHCLepxSSNlmOVhm1uiAW2jInW3icBLLGG2w5Z074bpATYnYzWAnE9hcbndad3PNz3L2QbdNCgfvaIFlHPb+uKzRox1ZWb23e0Yh733uBInq+uzwS5TQBX0jrkUlxNdGusgXOOBQ7bQlKJagtTwF9gSHp4UPqwXTbF46847j5stcsv7aFJBup26DicYEGs1fP22UQOEjRxNfsQ4ZJHp2iTdUrFhIq7tk42VKDvYJ2HQsV+BSJZjrewIlhm412PMsG7HHHs7nJUdGBmJeOSVDzFrjCyCKBUe7yQAuE4sXDRTgrr4Nqe29+aINVXpZvJ8Ye8Dj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EAzGhgwtX/I3IfJIG3SXL641yqbJEhgiI1RSYqFzTo=;
 b=QkFKCSCf62QLSS9K3zH8nFqQuBPlax2UP7nsURxK3hb1dCChEqecf6CHsiOxaCcGprg9fnelJchZ67X++k0/GPufXOU9h6arkQy/0cKLi5gCtY8RqzH7reWEgFYNQdtvZIi2WseIeGNpbW7qJvsyVZfWsFfbEuNNnfabGDyLEj4=
Received: from SA0PR11CA0202.namprd11.prod.outlook.com (2603:10b6:806:1bc::27)
 by BL1PR19MB6012.namprd19.prod.outlook.com (2603:10b6:208:39f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 09:38:41 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::80) by SA0PR11CA0202.outlook.office365.com
 (2603:10b6:806:1bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 09:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:38:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C148E406543;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A746C820273;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/5] ASoC: SDCA: mask Function_Status value
Date: Wed,  8 Apr 2026 10:38:32 +0100
Message-ID: <20260408093835.2881486-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|BL1PR19MB6012:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e4d44a4-8e42-4ed4-2144-08de95529e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fAC/mtWkmfJXQZf4E1KG9N14cvYFVZC9u//f1X3BKl2ZjtPwoWj2YTCRLTJFc7lFJHK1flKUPmjX3CAtFKCKBGSZLo9rdj4KMiT+Wv/PsSgym84f/thwYzkXO2eK/muUJawfX0yA5CUc/TaBCPdjfx7MJGjqfz1RBPaKNUNiFISF9N0IDmFoMUhMVPjbklxcr/111VKONsK1KasfcU5TLNJKK/eXszFbTDqPepspqLfLZVs8qeUQ+ZuNM6j/Czp9Ev05+QePAxdodrxl/aMSQf/IaJ06EuOBxFc0EazG7qsKIKlcOf76+T+GYE7MJF61boGUlJez8Gx0sFX+D38OavTrf94r3F9gYJsnb3ACqIHUipYwN4ra8cmKAri2igyoUIBkyCD7siRk1PxE0KBV4kLih+oXwnFNxfu0+cIDg1kkWHW40zsLAjfp1Ys0hyjJ//fLh7EDtzM/JtsRo9PqpRb/WPptN9O2wckkb8jjp9/y/pX3VmR6lQEE8fyqWQ+oDYLbkMYZwhVuXbIFQPc0JWNzgAQrqVeIZtgvCM/fa8qJwhBQCGscGzz2fsLAanDbPVXaDhyoeTzFgOL6GmPa546yYYErKXByivsN8ZxphNhprA4NngXyOhfOrK95RWamMJoP38Ta3z6RJ+P0HZbiCQj4Dr5/bkGQwG/TjtdtFOtYWEufHAcc0J2YpZpC1IaJTs0+KVBAejV8WLo5xYqO556A3+sdr4ZK9pl3tUOUiDis649Nl7AgrZH/aEc/XgzBxFrVXCpZkbdxWHwp9HeS9g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cK2btoWKGlnwDTn4/JhM1zikGS5sWm4KXB3U3AKkGe9+5IeVynMHgjqepSbUua1vm6C4hldkxY0pw7rS7kiX+6SU25aXt/dRSPYHrthN0xFlfmdRVUlTs5QNkAAuO24ytP983QcxxT9eR6SrQp8Czz+XQSHWKBYHAjrNWAVOd9bQJZT/xDUz3QuGC/Zrxb3xAeArh3Yu+G2346zdux6c0+ErLXQQ3FDeVV3RtSVgwgw7VI2qd6ZA01wUEhu6VxJs5+tZIBvmyxsK1SbUEH24bTWsue/Xi4/JEz6kZWBj71Z4UGc81OabyZynbHBs2tBjX9oQDvwBt1itLvwlUfOkQCjvlS6AA22OtfROVTGCT7MYbSiX7HVgoSjkz7bkWHS2D4YpGjNa6I3R39e5HCTy8PkLunLV6leyO20ap/0ZceCdSOMwZhDVliZHixkcFI//
X-Exchange-RoutingPolicyChecked:
	NM40Q8BhHLLXCNiXj7MLiR2oEQObl0zrHYirJBK4d3lgu1y35jKrCJjU7bgHPiJnwvcgIPw5ww40JHMXP9wit2BfmV+Fqs/Pd8aMMZq6tXBRuQgmWXsJ3fJdL/t1sGdz3rd8YyOLMjeMOPLYM1sipnAYt/4wDsz/4RadlCmuLLXBHuwxDinol3CCkxU4WAQGOJ9+IWF2ct1AhMYU5E3TKX6yxqKlJiDhPv1bBIo/R2JmY4eTuqg9mUF768SRk+diAMhLEoNcALzMXMAnF2P+XHAEwspVzQPu+dqY4BXbmfVcCF9YYQi3OdezP3+5NkGvKZ3h8clzSCUAnIzV4lD6ow==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:38:40.9105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4d44a4-8e42-4ed4-2144-08de95529e7c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB6012
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d62224 cx=c_pps
 a=eErdSk/Sa828lcK029XJ5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=hS7mE3VIGcSxJcC6dDUA:9
X-Proofpoint-GUID: TRIzyOZtxZgsM5ZoXdFqOap67Ijcw8K1
X-Proofpoint-ORIG-GUID: TRIzyOZtxZgsM5ZoXdFqOap67Ijcw8K1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfX/TSOmsbfqLza
 UzjrXi32TEMoG4PwHgj2ooLGPZDBQk+umSLHYDFWL+MglX4jMzXSPvMBye+UegEzhmIEW7BOYd8
 vaMVQGbj27FLxREuazTGpE2gOQE6l/PjVuDJ5BvZyJvJGRTYWbmOhX+ZR9bJQ9H0/fgVU2g2gVs
 yn5yjcFkBJUprpP+hEwc1/W4RXECULhxuNh2ZnMOYhHzdiTNROrq/LZsI4Ir1TV+1zUcpfZEcRQ
 Llqk4JfbFc4UEUcqzXWM2Ys1tfEEIjURfos0ccZZl5FZGoQ+PvQG84sPsfLaMf4M14duPq22aBb
 IU6JHKuxItdbtX9T6nEMOqs8lSLfIiQ92D++sIELjcljirPKLtCXxtAJ4V103LwXDROus8WKm9t
 r/btDkXz5RBodhjS/mP6YBFsIdVWOgnJ5mJW9fcj2L4ExGGV85AyeZuuGcLoi/pZrFVqAA8bA+I
 3FENv/+B/jHhNWTsYHQ==
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

According to the SDCA specification [1], when writing Function_Status during
handling this control, the value should mask off bit 7.

[1] MIPI Specification for SoundWire Device Class for Audio, version
    1.1, section 7.14.1.3 (Host Software Handling of Function_Status)

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 9acb0be84674c..0693209ffed1b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -138,7 +138,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 		}
 	}
 
-	ret = regmap_write(interrupt->function_regmap, reg, val);
+	ret = regmap_write(interrupt->function_regmap, reg, val & 0x7F);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
 		goto error;
-- 
2.47.3

