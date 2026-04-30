Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC562F6184;
	Thu, 30 Apr 2026 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561826; cv=fail; b=SMpkkE/3g5M6XqpKNodJs+K9HTYesqCljWhnMZ1TGfvtuLcf6eoJx/Wmrg+hEYq/MLnWpHI9QS0lGrHvuijhc7ZYabKMFsbc9UritPDXklkUq7SXnXasoDtM/uAEIRG2iCNkDJRdj3QRJhWkfy94f7G7v4Exsp2EdRlV+6hiAnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561826; c=relaxed/simple;
	bh=7q0LTTqI044sOpG4ReQF9zpqTdXNIDVncZzON84Ubtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyzX6K0CK9zRtjVqRidRWspo9iKwdQHHt/J5h3wXPzbtEZ5FcYJ9irm5qEgoOZC6j6OuLFSkPCl38U6DPJFGlBB5tEpCkbQs9W9kdM64e2wuquLePCZvl7v+7uR7h94bgezBocZQvfMuISPqM0+hx9fWdVNvZ/zxrgbFf0bq5EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SldHInK0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dkQkKWyW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SldHInK0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dkQkKWyW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDXSTv1588093;
	Thu, 30 Apr 2026 10:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GTMNRi5tLwAD4Bc4EakJWwkLCmIAaf/EPBuzrUYRGc8=; b=
	SldHInK0jOOmgi9TVn19fyW2nHpbjISFbM7KfszIzfDjYRJYMxVZNunBlEi8mlF0
	FBXR43+APdw4258LLMsa5axhZVSc0ImPKwVNOQeR2ru2ThZ8JNaVFLHCB/OftfsA
	kXp6EkjwD/JZsnR+ujnsRL/tYKwa2zIrKKPqAsFHqdwWCuwXuFy7/XnZJXWCVw56
	2AKij/Usjs4CoUrISZ3zLL+t/BwclUErVo7iU3DEu4jKuarMjqSXqM5SiMSZcjTw
	SveBE+A1pM9F0ez/PmCTOuP4I/tOUP6PJtL8nsdx5nFIOcn72iF7HK1Ugkru1RK2
	ChX87DedFsNS8Wb7bNZa+Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020137.outbound.protection.outlook.com [52.101.201.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dv82e84ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:09:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZzGrotRhsXzSFbjbon7z8lzcOhDpFtevFjPfDwgPr+8ru8jWKTlwyU9PN4C9nIdEzl23tWNwEanUj1+VT+2JIcgd4VKzh/kM0c9pR37qqW7s8UGDmiMoUBre9WqJNpwHy5m7aq8Pm9l60lqmfpuS6mmu7OZ9SS1fhMy5+b5pIXrfmhhQDLvnjo2ZpH9vBSo6t++TvazxkPd1HbT7pRubDNcvp+tPmBsbIP6OIxDU/U3QVylsK45uEirKGRjphrUA+kpyPDVB7oAPNOuVHR4RXXzDMjdZto+JcWdimZt1vtTH1klXs6MfLjLk2D2hQWRFFyNnjOVhcRFwIW8RRQ4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTMNRi5tLwAD4Bc4EakJWwkLCmIAaf/EPBuzrUYRGc8=;
 b=jpaomGD+ey/pkAwmgEjRd+GPKudGp6qGE4UcgMTSwNp22f59ly2uLYMYoPnhVKKmcu9qsZoeztCDyRe9l4CEQXACxqAkCICYEe3OKV3y7+9MVA3fyNpboaJ8KnX880RV+asZP21orMx2Un7i2Bd4+2vkQ/GvVinpLyvg1O0IZrw8AtjCRKvtcMh3c5sXGbt8DoMmTeRfLsbsobYybI4XoLrbVzkF851mP+uS1WXDKypAwOVdTSCe9TeuaYQkqsEHtkcRyOWmU43TpG8xH+QaX2saoZX+CwPjl3HPRnusOAADfhyu4uuv+v04zsf0eN3wsAIMv10x61gaFrFGLUN5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTMNRi5tLwAD4Bc4EakJWwkLCmIAaf/EPBuzrUYRGc8=;
 b=dkQkKWyW5jnp7sr4zzoT1j/uPvY5PFwhC3bhtnmnG6E6Jv8j325cVT0vHB5W7tZOkWyF9KnhdDaPFEYH/2jMPW9L0mnjG45Qt1KK+SYUaKcQSSsZT0JVhRMmTR2dg/YWcTofYhzCGO62QSqKVYf3q927Tp0YPoUAxFszamJwDNg=
Received: from SJ0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:2c0::9)
 by DSVPR19MB997261.namprd19.prod.outlook.com (2603:10b6:8:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:09:37 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::e9) by SJ0PR13CA0004.outlook.office365.com
 (2603:10b6:a03:2c0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Thu,
 30 Apr 2026 15:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.0
 via Frontend Transport; Thu, 30 Apr 2026 15:09:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7D5FF406554;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5A97982026C;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 2/3] ASoC: SDCA: Remove sdca_function_data duplication
Date: Thu, 30 Apr 2026 16:09:30 +0100
Message-ID: <20260430150931.2025953-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
References: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|DSVPR19MB997261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a8d43e1-9608-4b9f-e71d-08dea6ca7e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|7416014|18002099003|56012099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	j3lqIx2eKZAta0JC2aIUYKgBKgzN1pPc4ZCQYONGNGDHZkiKxmZuG6eONxhj/eRIEEnP2n7t/ibvvcdl154PKlPDUPnfuAPOAK+Ek2dibZ4W+uT/5nIZyV/FJ2cYhh32Q8kyUu4aqw2QMDXAnvWtWkccjhe6DH2iD9Sb+GdUW3aSuoVqh/mYcMx5qSSq0lrY9x+cDqiIfVuutSvmuHG2zevNp6kTq5UP5bSENywZew8PrW6z0MgCuU+1R23iEwHcy2ME4IhwpAanUiRVnMhFLvmBv55C1kjUfDAN2Vc38CPBiw9FqHtLXTFBrVMGFymithXUY0SMoJguBr3wSiEJAGTDbJJEYkUDNuoBBuVUx2il+TeAtCCWj4BwAvab7w9cYWD1p8nfMoAax4Q9I4UTZmCfE+HLbf/6zv4x87fBqb0Ir68eMinFH5CMYDmlOWiyGe2uHlIMwawP23vm9le8M+OvsjdiytV6no49k0zCpqn+WS+yirfmTGiXrC+jxfoP1hvqe2vEQK2LOk2XMUDApg/CQeXr0d2rR8cvzZcSYaH+MSLy0TY1UBSTBBst19/1OzKr2fefH7QDNmAWTGUE2rX/oZZbD82rREdqJ2KD517IgMwLfx+TGkWU7MCwTEv+HvAZwdAl+BR/OP8wdXxnBOg47mQupGAD7CXCKWXrp7y2q2VTxoCLWuSTfirzQGMLcf3D/TC2cBBKzkh3rBnKk4tycWmhcwCDriMCWMtQvpe1kXf1lFCeQRLz5/T5kWvSp86U4jB4rtFOo4r7YtS4yA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(7416014)(18002099003)(56012099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZZp4OQEYKlEuZn7648P1JxnN9GyC5KXLHyDhRcSRFJ/vWdjkHO+0WoPynFFOKQctMHTtj6s2rQUg6i62rC6og8eHU0Nfgq0vrZcjs4CzGfE2hVHcjy7UVI0iZDHIyCYspVYHa7jC0TuabLPApXd4C2PgD0zQyB6yXUp1W6RHpIn2OT4imN72RyKv3Z+9gMln8HLUxCPutaaFwQzbdTHrE3n3imP2QoTMjqWQMvApQCo0vHFUDHamHGMKrb81VvZhHK3AguOnoaO9lBSGy8yVqKRxLcLIhG59twW18dzT+VtxJTbv7DIIe6a00uMb/4uLN9jpkXx6Q1c1Qt7bWUpkSBLjVbdHMixZN/4bXR0F523gR9Z8jp8fdy4Ke2cvr+oHfIrWaQ43jR8nr5ANEnDZLO0Vl1OGj3+3UO9TbxwvW6whAjh35AAo1KmkjWMvKXKY
X-Exchange-RoutingPolicyChecked:
	ZGubCAWh3bfbXqE2bPx5TExgeOxo+vtcNVgp9JVEV+nip+MBDNgNGKRM/azvaiHvCT53h0NaEDtHHd1+wHsZF21gGlGkxmvNguYIX8CWQKWd8boVXziPjNNH1RHwlHacJ2EnMKRpDW4YAiXLcCyzw1RC46gT3hVx3pvx+Ughtqqr9tSzApQ9DHVZFOktJCVSxSLjn4K8V/ZWa3TdKWFUgmA8kmmC8PebMTKhW7nSd5ufCR+kJPqgB/x45qnqrVf7JPgFDdDQ/9cF/VUVwvLUjCbg5kb8xCP6P7Ts4/+my6hEPrfrsW2NUHpUIpz37c3JRYfHeGD2uY6aJhnrCqRchQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:09:36.4083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d43e1-9608-4b9f-e71d-08dea6ca7e64
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB997261
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NiBTYWx0ZWRfX2E/d0JXG9FIn
 EAMC+Pp5RYNxol5n7jobpt4VJz1mCokP8JMi5GGol+rm5gV6kDRVMQLAXATX6/MyI4wnGNQuyGi
 y3Rxy6pkm+4BOJjiO1jj0utXR91p//RrTZHVXPWg0d+7HhBVzyeqOFb8digxWDt8jat8Q9aeD5i
 KrVEdQJE+HNZ3krPrxzW3MBvJRPVDljeOSSiHWGeYkd2VItT9vadFQ/vjmp1ghlEpJmKCTGfi+w
 EnurQ86hBBOELqIK6go1aKcoTBfl9qKSJ2fI0I/Fw7etWIG3rrvzsaFfU3AhZXrwzby4TyqqBtK
 u39+T63pA5EhS7UACHbDug52esVwB5I0pS07dod/8Bykwyo0703qcnf7VwnPUS98Mp4bnDR4TGb
 aZSjcdrRY5MC3D+zQqF9qg+n+JUVKO5FqbRrGET3PfMe9nWBZLG4XyXxlF1gSIS6Cjc1fmNeWVK
 RxCMkoLMuh01RpAAJGw==
X-Authority-Analysis: v=2.4 cv=P64KQCAu c=1 sm=1 tr=0 ts=69f370b4 cx=c_pps
 a=m7gYBUTXKXNlxA7KPONIMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=YCwCtIK0V8ENfNN9dB4A:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: ZVcJ71ECUi_CoH-YC9CBOWvovxXqo0ZC
X-Proofpoint-ORIG-GUID: ZVcJ71ECUi_CoH-YC9CBOWvovxXqo0ZC
X-Proofpoint-Spam-Reason: safe

The class driver internally has an array of sdca_function_data pointers
that it uses to store the parsed DisCo data. However, there is already
an sdca_function_data attached to the auxdev device. It makes more sense
to use the one already provided in the auxdev device, as it could also
be used by custom drivers for parts that require those.

Using the auxdev copy also prevents the need for the class function
drivers to search through the array for the correct data, which
currently is based off matching the function type. This has problems
when two functions have the same type as the current code will find the
same data for both drivers, using the auxdev copy of the data avoids
this problem.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add missing set of function_data->desc in tas2783

 include/sound/sdca_function.h        |  1 -
 sound/soc/codecs/tas2783-sdw.c       |  6 +++---
 sound/soc/sdca/sdca_class.c          |  7 -------
 sound/soc/sdca/sdca_class.h          |  1 -
 sound/soc/sdca/sdca_class_function.c | 23 +++++------------------
 sound/soc/sdca/sdca_functions.c      | 25 ++++++++++---------------
 6 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 0e871c786513f..b1489178b0ef8 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1452,7 +1452,6 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 }
 
 int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 90008d2d06e2c..38009168c5a11 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1310,10 +1310,10 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 			return dev_err_probe(dev, -ENOMEM,
 					     "failed to parse sdca functions");
 
+		function_data->desc = &peripheral->sdca_data.function[i];
+
 		/* Parse the function */
-		ret = sdca_parse_function(dev, peripheral,
-					  &peripheral->sdca_data.function[i],
-					  function_data);
+		ret = sdca_parse_function(dev, peripheral, function_data);
 		if (!ret)
 			tas_dev->sa_func_data = function_data;
 		else
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 6e9b66f718019..a6a3da8de4371 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -183,7 +183,6 @@ static void class_boot_work(struct work_struct *work)
 static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
 	struct device *dev = &sdw->dev;
-	struct sdca_device_data *data = &sdw->sdca_data;
 	struct regmap_config *dev_config;
 	struct sdca_class_drv *drv;
 	int ret;
@@ -199,12 +198,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	if (!dev_config)
 		return -ENOMEM;
 
-	drv->functions = devm_kcalloc(dev, data->num_functions,
-				      sizeof(*drv->functions),
-				      GFP_KERNEL);
-	if (!drv->functions)
-		return -ENOMEM;
-
 	drv->dev = dev;
 	drv->sdw = sdw;
 	mutex_init(&drv->regmap_lock);
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 6f24ea2bbd381..8b63e62485e64 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -24,7 +24,6 @@ struct sdca_class_drv {
 	struct regmap *dev_regmap;
 	struct sdw_slave *sdw;
 
-	struct sdca_function_data *functions;
 	struct sdca_interrupt_info *irq_info;
 
 	struct mutex regmap_lock;
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 31fc08d513077..1496a15f7d2ac 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -27,6 +27,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
 #include "sdca_class.h"
+#include "sdca_function_device.h"
 
 struct class_function_drv {
 	struct device *dev;
@@ -294,8 +295,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 {
 	struct device *dev = &auxdev->dev;
 	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
-	struct sdca_device_data *data = &core->sdw->sdca_data;
-	struct sdca_function_desc *desc;
+	struct sdca_dev *sdev = auxiliary_dev_to_sdca_dev(auxdev);
 	struct snd_soc_component_driver *cmp_drv;
 	struct snd_soc_dai_driver *dais;
 	struct class_function_drv *drv;
@@ -305,7 +305,6 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	int ndefaults;
 	int num_dais;
 	int ret;
-	int i;
 
 	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
@@ -328,21 +327,9 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 
 	drv->dev = dev;
 	drv->core = core;
+	drv->function = &sdev->function;
 
-	for (i = 0; i < data->num_functions; i++) {
-		desc = &data->function[i];
-
-		if (desc->type == aux_dev_id->driver_data)
-			break;
-	}
-	if (i == core->sdw->sdca_data.num_functions) {
-		dev_err(dev, "failed to locate function\n");
-		return -EINVAL;
-	}
-
-	drv->function = &core->functions[i];
-
-	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
+	ret = sdca_parse_function(dev, core->sdw, drv->function);
 	if (ret)
 		return ret;
 
@@ -377,7 +364,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 		return dev_err_probe(dev, PTR_ERR(drv->regmap),
 				     "failed to create regmap");
 
-	switch (desc->type) {
+	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
 		cmp_drv->set_jack = class_function_set_jack;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 196bade11ab5d..02abb7315b727 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2158,27 +2158,22 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
  * @sdw: SoundWire slave device to be processed.
- * @function_desc: Pointer to the Function short descriptor.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
 int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_desc *function_desc,
 			struct sdca_function_data *function)
 {
+	struct fwnode_handle *node = function->desc->node;
 	u32 tmp;
 	int ret;
 
-	function->desc = function_desc;
-
-	ret = fwnode_property_read_u32(function_desc->node,
-				       "mipi-sdca-function-busy-max-delay", &tmp);
+	ret = fwnode_property_read_u32(node, "mipi-sdca-function-busy-max-delay", &tmp);
 	if (!ret)
 		function->busy_max_delay = tmp;
 
-	ret = fwnode_property_read_u32(function_desc->node,
-				       "mipi-sdca-function-reset-max-delay", &tmp);
+	ret = fwnode_property_read_u32(node, "mipi-sdca-function-reset-max-delay", &tmp);
 	if (ret || tmp == 0) {
 		dev_dbg(dev, "reset delay missing, defaulting to 100mS\n");
 		function->reset_max_delay = 100000;
@@ -2187,26 +2182,26 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	}
 
 	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
-		function->desc->node, function->desc->name,
-		function->busy_max_delay, function->reset_max_delay);
+		node, function->desc->name, function->busy_max_delay,
+		function->reset_max_delay);
 
-	ret = find_sdca_init_table(dev, function_desc->node, function);
+	ret = find_sdca_init_table(dev, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, sdw, function_desc->node, function);
+	ret = find_sdca_entities(dev, sdw, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_connections(dev, function_desc->node, function);
+	ret = find_sdca_connections(dev, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_clusters(dev, function_desc->node, function);
+	ret = find_sdca_clusters(dev, node, function);
 	if (ret < 0)
 		return ret;
 
-	ret = find_sdca_filesets(dev, sdw, function_desc->node, function);
+	ret = find_sdca_filesets(dev, sdw, node, function);
 	if (ret)
 		return ret;
 
-- 
2.47.3

