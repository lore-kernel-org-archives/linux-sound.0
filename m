Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811D3563EB;
	Sat, 20 Jun 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953405; cv=fail; b=cTslb+s5QdBWH7Rxh4YqCe9J/9MSVugQeqLPhcbHlcIIXqR8Ghs4VpoKjP/L2QZVnD+MhOLbn10V5JYpAlTcvNF5S4ixA3NyqtO/z01vT4lko/L/dn2ZY+7tvGsHy0bdZnr+l+Zy+6kZB8rtN+tkcAeXzV/OUqMyGqC0UaNtyD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953405; c=relaxed/simple;
	bh=4K85GI+ehaOqN7Udhakx0EBOCaOjK2XyiA29vbdI5nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhSTYb6+eN2OhDXwdp79cA7GPitkLyETitjiLpQiYOABuGX8Q2TC7SddmhSjckaPVYYJ6law++TfaHmOoP3tbbN09bGT4mkPx7daIiy0josbiEAMT8iYPwIrNxuz4/7FTkPWPn06O7jX26M1s+o9JGWUZAj87Frw2ZnItFGL7Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L4dqcAvK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WswKZKbs; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L4dqcAvK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WswKZKbs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KAlcNm1300718;
	Sat, 20 Jun 2026 06:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=CQ3hQfCDBW2GgmPHoWaa3hl/z4EmF0XlfTI70WBq7Rs=; b=
	L4dqcAvKOHEx/oi5R00HZcwDbI/2dfP7dtoZ/7wBjAtTHEggT0IYMAYIwnZHSOKS
	hn5FThchy2VuzwZQSq/LCw+hY35h2SiaGSXw0qK/sO6tRIik5PJ5utxvgJ+fV5OG
	y2KwsQlcuC7nca5+eDg629aXZ+dUf78wAsj8s2pyMzHpdSYRpbxX3EMwBz8DkvJh
	eubfyfkQ2TUYtwdo5rQQJscCTTQX3ZsoDxe0dBzTexppS8L3V6yC9n7+1nN6stkk
	g6fLtxt4Oi9jehefISOaamtQ0AgG8K4bn8MPvUH3nSCSxwIPQ9w9J5L08rjnDqWX
	NBr5oBRIxWZiMbz1wlxXkQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023104.outbound.protection.outlook.com [40.93.201.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x01ts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 06:02:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVkuMEm9/IsyBF6fI0OCTHAYx0mNtz68nyax9zqJXk02bwJ8ty/iCcVSF0TkfhgVJsUAimlxdJxzIYrx/KbDdGO+CNch/4eNsvRIrT+f3hNmXh5nbn8Ghc2vT4z/r2KtztN+Znh7gh4w4thyyhbyHN+U/8QRyNF/fbSfYI3ML7y7QhNzeLL7B8tDzi1oDTiVlRijnEUTzCSFkKzCAWU+oEbQFPM5rZciItYdtuoCpiMu5f1rJNdH8JU2VIVtN2NBUQTJlPLZk73Pveg1bpAbl8o11JwF0JO3b9wdXq58Zw6bpT66YZesjbEL+D6zRYf0JUM9aHZVDRAoHMynO+MFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ3hQfCDBW2GgmPHoWaa3hl/z4EmF0XlfTI70WBq7Rs=;
 b=sXfmevljwmRQZU6peBaIlbz0meFi68FZ78juYwiwCfZDfu0lLcIJRhjpx7/f+hONM+jRRZFCyDdaE2s9UHLihdj7G1mCy98yv4eiqWYCVteQmuf1+pmogxYOhcUaPPpP+BM37yZh4FKIsOy039hbuYF4AIjsld70N3ybdTnQsC3D+CyBLE7xgTQv6DWXCg9CpJTWjwQNUxDdTeNtdL7ziuGLQgDqP/8v0BJS9jY9v5qqRXRIBpdxeJ9WE1kQiFpt3+PsBnzNJvtyRy18/T7DpNvdBtguyZQmq26ES0TfOOEE1OOQxeU2bcaRv+EQEIcP1TyjXVSh0lzbRmRvL9/caA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ3hQfCDBW2GgmPHoWaa3hl/z4EmF0XlfTI70WBq7Rs=;
 b=WswKZKbs+oh1b/oaOGLqeNbqDviumuL49N3sGXo41LkEO+yp3YLn1GK6mKjBwEg+KMBl5UbaaatpcVC85opl7bpHRr5JooLMfalHk7f8XqgdNnpvI3yrwieoUsQJ0BviNQRXuHmJVV+246FNtnR35crAv+lxUP3r8aQ23Gd5bv4=
Received: from BL1PR13CA0136.namprd13.prod.outlook.com (2603:10b6:208:2bb::21)
 by PH7PR19MB7028.namprd19.prod.outlook.com (2603:10b6:510:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Sat, 20 Jun
 2026 11:02:43 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::35) by BL1PR13CA0136.outlook.office365.com
 (2603:10b6:208:2bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Sat,
 20 Jun 2026 11:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Sat, 20 Jun 2026 11:02:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 65AB9406552;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5B5CA82025A;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, arnd@arndb.de
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, zhangyi@everest-semi.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/5] ASoC: ti: Add back local call to sdw_show_ping_status()
Date: Sat, 20 Jun 2026 12:02:36 +0100
Message-ID: <20260620110237.2684234-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|PH7PR19MB7028:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4ff77d78-8522-4a3a-096d-08decebb73bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|376014|36860700016|7416014|18002099003|22082099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D98QW+fmdGua54LzMIOiLQlqP9iuKMtZDCA8W0alPIlteZRsLIYC/EyIYiX2U/3iLtskq21n3edxTkRZX/YPuvCr0a+XvJjVSxN3MYQ8JdE+1Tn50038t/Z/0BfI+FbF4Nl1rNbSi/vvlRr5lc3Mz9N/B36zV8c3K04XNd38GhWgR6cZDX7hcEU0zVPFd9MyKAi1VqaALRpLMvEkOWoiHJxjuHrfgi/R8cSJzRjF1IaGn28GQFv2xY2fr46r40lymd8fvmzdjKdUQKVctW3R3vSIp9kjB7mfHS4oOtYxVWrwLvpcuuDQS6CHXsn+NISi/oWvR8yEjGOi8VBv8G8ezAu3CoqQOnUehaJoZWpFkv2kM/S9nRSb8+7+1iBtAw2SfJCaKXD2yYB3rwAz5ySQ0hnQ/H4iEMFwnEnIZI4nmZuHTCzLAaFNwbTnbxVOPaSxzQZ1nKyq50NQDJol/EBvrWog8L2YJTtLdIMhUhnBmY1O7yM5XlRw29phkL/Iug2m3XVwiIbZciT9G5F00tRe9hucQCvujNNT1QOgBBdw/QTqVmhcVZEpJURt1X7tH5BlBM/VjG2d0NQJ9nGh2Yx3lNBQa1OLQBeuZ1nFqO2lkgAlHDLl2fCjpu78AmOr/hAxc4yD4GdV9uDMz4Xb5IpTLPwQEY124lQZhTmlZWvxEeMX7IyJvvPZx9dYAL8up2+0p8DK4+Gen7QXAY+i+UhhbQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(376014)(36860700016)(7416014)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o7oR6UsH6GqvS7iURnq9maDBx73AeU7MrF52CuBCaERNyGjZ0jmY1lSuxvVOiU6hpCAM6BTZnnUpjY5iyCNl9LUdrCYhAgCNFFGT3GcjZeq0HqDfGqX87EC6gSHZfpwlzwg8OPnSWG2zPKufZZCk/RKZJ8TcWc9nj0/7yyY1Dcwk8KpZlW69tJpFiOETXrj8TUoTmcpUHGVYRCNa3pYuIME8p071GSjbT1aj6/fuq1LP3bd5i7ItM6bdut+ONIuCY/P2up36eG1SxyitkVdc0cgXJcqnlkQ0cuNPvMESN2GcE1tj/1lT9STwRoxOLuzH3FfGakXu3KQnpFGWa/PgHJUM1KB3HEOFT/NalB8wAoQDQVuDmIHY8SSVYIY6nmUrrP6Q5SEOTL0NkKLVahca0dBHH9h0U41zE8UhlCmy6XbFC1QlXuLz33jTGMumIVVW
X-Exchange-RoutingPolicyChecked:
	E1ewd4Bs25KEOrNuST0lOk85CK+5rbijqPl7Dcae7Bp0m177fwcPdapFz5y3PW8qe3nvxo0Kc2SUNGfcAEEh+w5tUEktAcvxb32j8OS9php/ea5qs1Hxjfqzf2iKT2HFfGAiw5iBB0aNzVyYzy/00jH8vBslI6U3YA4rsQG8PHDGLb2Vqm+CCYrXEpwM7TBz1qqxXAl07dYiMdYhjKtqD/NzFZ9omBOprdoIsGzT0QwGbmXNj9aKrQ3of+Lu3Ej4iIxwRlmCFRLI/nNqzgY+k51cig7mjZKU7lYt36tleRIkYLhRV60pc8Zy7A2YE/sEALZr9LXtPspcVvOQ9yEM4A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 11:02:42.6967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff77d78-8522-4a3a-096d-08decebb73bc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7028
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a367358 cx=c_pps
 a=0zbhqlog1HYD7RdPDvTXcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=TbzWVHjKyxCIu6qPmWMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX3c39ArCoUvJF
 sUw5Ikr0RZ6euyqAPCAXWNvooJlATyRrNht1bmzPzZAo8GITDC4q9X63kC73BH68pLuSuf7cQgp
 TjjIiyf8wl84nPMjZRvSgzF+9OmqoRs0dWNdLfYKA8sGg+p+qsMYDC65JrgEQrmtmlDilKj8fvZ
 T7jk7oRsMhhWtrLTwtLHC7OA/gpAD3hnEcs2SVlpwtQirqBD9lpeQPJ3Q44VAnUl4A5i7NXfb6O
 fKgTRlaxrQTiGlwuG0zDVCNxk79NFWBE0bAhSMrZvmWinrxTHmkqC0KX+oxTr7oO+bim7vHP87B
 HjOQfEgncbkEKhtSlDqY7DXWvt/kEPcQELryEgdfMGgQR+IeV+hiKW3CXteqCGrwo8j/ojxOHJp
 yxZoNoE43ScywACylyaJHZM3pknl+KYMTcQT84CA5UBBv0rOJwx+TqdbcJk7Of06fDaupTvjfV/
 sUeJgdKP1KZGSUjRffA==
X-Proofpoint-ORIG-GUID: rfU6_2pYazNYXsABA0ILAEZaOfpymVsW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX8J02JYLxIx9B
 xeYtlup+qTohHD0GrfNYqzRg61T3p+8BV+0chORIk/yenLqocnX6XJ+A6LI1AZQvPp6sw1arux2
 gHHA5Wrho3Y7q0BNDucZ/jSaD+khszw=
X-Proofpoint-GUID: rfU6_2pYazNYXsABA0ILAEZaOfpymVsW
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/tac5xx2-sdw.c | 4 +++-
 sound/soc/codecs/tas2783-sdw.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index bb12cfb6da12b..ace06f5ab58c1 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1445,8 +1445,10 @@ static s32 tac5xx2_sdca_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, TAC5XX2_PROBE_TIMEOUT_MS);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(tac_dev->regmap, false);
 	regcache_mark_dirty(tac_dev->regmap);
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f4..1127ea59b5e4c 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1083,8 +1083,10 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 	int ret;
 
 	ret = sdw_slave_wait_for_init(slave, TAS2783_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(tas_dev->regmap, false);
 	regcache_sync(tas_dev->regmap);
-- 
2.47.3

