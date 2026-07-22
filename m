Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53BC35AC12;
	Wed, 22 Jul 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730978; cv=fail; b=WsobAbDINYrlVNxCBdEPdL9SQhZkh4MhQintKrvJiruODE2ZSEPov7fBpudm6ptpUoFrc3F8Jif0e/b3Qz6Gi1B8RWxJtC41FESlkqNOAg7qfqOZ/SpDdJIXnncTHVtKyre1mIVgqo11lkHWqFNBbCD27ku71EnazapZZfL5FjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730978; c=relaxed/simple;
	bh=SmSsKddlmzdpW7BE768orsNkou/+0sMV6OlPE73ke88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BGD5cX1sQ3sWfmW2SpbOX7rm2USjmbRfJ4mEJSkC2xVXg4aVbAzsB4t4LYSnK+nnQVINXCPvvwcKZ9krJxyN6LRXTRev/XsVO002FeTl+kLt4Pv+b2GgV9X0UyigWbkglO8Wzxo4uBPOeZtsSfIFCVOZ3XIEugpeKHkFhZH+NNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=blK8Jc0/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MKa4l6bq; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="blK8Jc0/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MKa4l6bq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDDAl3772910;
	Wed, 22 Jul 2026 09:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=EdqNQLFNbDvBRDWa
	XoNEVVTOINHPNA9jnCzW+Xbjw/U=; b=blK8Jc0/mzg5cv2crIO7xjoUw8FRiHIv
	/SIuRIErOIBkiGhonhwLZKfIMklKd0pndddTWAk/EfdgnVFMPiwVuh1sfKhW+qoD
	rp9oAn/1k6FTyDXdLwvnN0J6Q7+jNVXmymbdcWx7JS/kFDuLvUTUE5AMwYnWcYlY
	gJugRDhIMSZCoztlDfzUJoAEMVWwlFkZZR5sgIt4wzcHwUgZpjstEwh2bFhTJf/1
	b884m8gUDmBFU7Lfy+/dtKeAJwoCNcVNhH1lklw36uiOHDwb/iSC3EBO1PRZrN4e
	0XFw66J5NHPnPqTGaKI3wwDP0nmXRldLpLtISZwluaCLQYqCFGClmw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020099.outbound.protection.outlook.com [52.101.201.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vynx53-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 09:36:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmz3+onEI1MP5fyuBC1J/Guo6IypDzdiX937XIECdOvv3gqBosTUfQpWhH1QvfIf3QyISDj9XvxWRQmCTPBUtBDei6VbEzcxzRjbmzisH/2aPCc3nfObWDH++ergQVnTCneWF9fFw1i0q0WEIGGzCSz4eZBssfgU9nu+nzYVqYEqpsrU1SIiRmCZCyPyKuymPKHF5dBVUqFNTymiiTZkfBKFraV6iQkHd+blYliqMt2cS0bTTzIDgt9L9MWIMMYVy1ZH3SQOB6dqFhDIbr8OS5p3yGaY1FmBGTDRCwTK85jK50wJkctt7h5q9zQ49FjBVRtHfTLWvQB3jM/up5fxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdqNQLFNbDvBRDWaXoNEVVTOINHPNA9jnCzW+Xbjw/U=;
 b=vMvLYncE9T/IC9sd4plAS0Y8JgIBAfb4MB/rhIl5Q40dF0ssRQVdF53ryDt0lNeSPsaBMiM25vfbtXs0fpPrdakeoKzKu2/Ie6WlhsGNdycGCIh5inLp39a0EaMum3nKfe9FfxH7qyhrwLl2RUXRykd9kb1E/NDak9uCqFBMkS2NOmo22qQ27kcwuxdnBGHNSEwNccRArC53KXHxUJq5rhlBaT3L8BkWjqGK+HQ5slvy00sKhPnrSiVbY2B0KwSKUxy4DXDL68Dd7nsbzGcejoUx4xuBsTVV5UEWUBnADtjqJvj53jvQzT4womVaWqxpnWAdbq62ehi4HkyL9dg5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdqNQLFNbDvBRDWaXoNEVVTOINHPNA9jnCzW+Xbjw/U=;
 b=MKa4l6bqnV5LJhd30gzKwNL3NvYjo4sf1AQTwyowYWlfmRVUKlgGCJWaeNblQO9UuPSVWm0hnBmc6GF5d3Mo61Gi8z2igTKAMIVab669laysVlzyc9kPPmJRbGHh7Uf+L/kExsGbP8Awffepy66LrhciuWi/nK54cqeOWjrytKo=
Received: from BN9PR03CA0948.namprd03.prod.outlook.com (2603:10b6:408:108::23)
 by PH7PR19MB6955.namprd19.prod.outlook.com (2603:10b6:510:1ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:36:09 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::72) by BN9PR03CA0948.outlook.office365.com
 (2603:10b6:408:108::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 14:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 14:36:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D53E2406541;
	Wed, 22 Jul 2026 14:36:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C839A820244;
	Wed, 22 Jul 2026 14:36:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Sort table of sdw_device_id
Date: Wed, 22 Jul 2026 15:36:07 +0100
Message-ID: <20260722143607.1001473-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|PH7PR19MB6955:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f59051d-0703-4da6-5fce-08dee7fe9221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|61400799027|56012099006|5023799004|11063799006|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	c0zNJLstGn2sMVGf9XU9XIuWQ9gY8D5dgFK9N4q26HXt7YqHKfcEEVjziWXH6qkWV30lwBcK95M2wB4mKWKL2hTQRo4QQdVpmwIqIwifxSurWPgONNaGxicPW8L8gisF3DYq0RpqylXeNnmTY/paVv4toh8Z5foQZqvKENtQRzRKSjcgNhja0N7U4HFyqkKo8AQbeWCAbVPnRjtDPD0y95T3CPy0kyP2yuSqKZ3eC6uyV3DdD1ufkWkKE6S2TDx7zFKj9X8LTihjK8KxMOfcOP1MuLyzHMcOY9uGsueeRbiVtsUw8i2gabFnZMaP7l4IhkQSVpSVdROGq/1Pwv7P50RN/M9rf2SCvILE+toQhMHfgCHuP7Ipv70Wreit02cXlFdw1IrQcUmXg6udEiqCNSKxlAxSvp+nZwm4E47BwgWeR2Xjt5XKN+jpkDUooyUeSHc6JgEBOi9k8AcSucY6GoBeO34gZDHLAweKOVStqyRoL4B5oBUDEvTt2X4QZCtJGTPFxwIzSwny+ZOB3wf8P2LqKwpBWF/5/aP+70MJpXMscIIT17QeuYBOxrx4DSFUJdUoEW7NMK1kf4eVP+48x65ueW1i4u6JXweJ5rnThKUbZOQaJLKwfSuIQOyEDg6uFU6s85Mnm9bGUz7kVw/QHeYHuJ4UMKQ1v3E64tVn95KAxwA1mYcqkTeZpndoX38qdsptw/Yv2nBvBRAYDFo3AA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(61400799027)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wv5G7fy9WHiZKH3m+19S6mc8v9fA5EiuGPxGvjRG7vDu30MDX7XXGpXMhpA1h9CqcSqEyXw/T1G+3FxjqcGMCYDBg8vMSzk/y0FtGN2WdoWF5Cep4NkL0F66wo78eExcrQC0fcist440pZaDQA4KYhNLcZ0jpmofRY4C7PLxVKcbdh5ZAqxwCuJcm4FM5cWCdhR0YVLn8hL2OA3uKzfzXjrjz0W2+Co40EnDchm8QEIbxwRUqRkEu/JfJORV3S898GUgMg6Yfkm+XiZDkLdcVZqN7QgUsgr2jQzaWjBqeyK26zoSw0+s1cEN4mVbKndkQ/6wsXcPmiESwDX+fiM5mvpaHaRd19XdXJiYdVR+tiuBhFCesSqoAOWWRo5Qqa9TajHKGI4r37/3XUkapUwr4jw0aMMn90oh+JghGCIsH5sbTtZkp8evnkeyU7lcGez2
X-Exchange-RoutingPolicyChecked:
	DkqX61QtDP1qRhRjvtSF8k0be9xw38byuOGktIsHTeDwDNz1Sx72b3gQx4QANraVdVefZmKuSjfR8zcb3ozW/gSucnECDd1Zy1aAu4hfB9lp8CLHA2zXS8tFXeZkNrjUCKHzVZAA/1t8JY4nnNqFG+lViC5RLYfnuVdkn6461k253sVruDReFCxuYQc5m9oKRYFfJHj0KaXp+wcJDqCPAz4Ck3rVHxL+basSLTZU03zQTkc6yDkt/jXRy0nuv9LYiBuNREWsAraWFI5XclfG+0FzkH3dPfqaiTE6PvPSNaPCfqZzfYRJvyyeO+FM28ZB32lBJMpbqQVFHHTi8+lgRg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:36:09.0419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f59051d-0703-4da6-5fce-08dee7fe9221
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6955
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MyBTYWx0ZWRfX9q2SDJ5sfkTm
 8d0tiZfzsC9fQ0I0h+UMdbv9jbZSaS+8u8+ycql8EF1cxoddD5hYwXKVF1Z5T133d8t8D0sGctJ
 dJ+pJDs4OPc4NTj8g34GHYUoSOOoL2I=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a60d55e cx=c_pps
 a=kJh41/vVy0mmRivLipeQDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=QKsbQbz7oeLZQiVCAHIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MyBTYWx0ZWRfX/mUrrTHEuZxX
 XOtXW1aBPTWBiG9gUWxGQKDMLZSUwm79zrnmn+OBH8JnwBofDmeQUZWlEyZRFepfqHpz4Jkzo5O
 iANuKVUdiMVNZWK/hbpY/Ocvpttp4BrMM1waYXbEfcZRdM45AXn9q7zPcJTWUztg4ERwsP1Ys8S
 KKz9n+2vFE4B36QrLgDFPHcZneNtt0WPobRrwXS2goqEJC2go0y2DoKWAILLhoOPYJpQT930gWo
 fvm8YXBzCrjRftm51BVcCaoHvFVq+yxNqDtcdHCBzo1Q1ToedKOJQDpxj7rMyKPiUN3O98B3tPM
 ASg48/6YLXiUr8FniRTLF4+abCgmprOzCk457/U+5kTPdfu1MzLfwi+hAnhexyRp4LJoe+pJqe7
 GI7niq8sO67giUMXImnTaUzMNmQLD/uN/mQ7xbfQRdgb48d3CY2jaUrh5i3kpc1+EkNDHVFwHXK
 r4JK0CH4MYiyKgfEY/Q==
X-Proofpoint-ORIG-GUID: Fo64pCXdZG8H4GdZdBRhyWQecPNGJIFu
X-Proofpoint-GUID: Fo64pCXdZG8H4GdZdBRhyWQecPNGJIFu
X-Proofpoint-Spam-Reason: safe

Swap the entries for 3562 and 3563 to keep the table in order of
increasing part number.

There's nothing broken here, it's just cosmetic.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 1e442f43b306..303d37e7d0bf 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -510,8 +510,8 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
 static const struct sdw_device_id cs35l56_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
 	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
-	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
 	SDW_SLAVE_ENTRY(0x01FA, 0x3562, 0x3562),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
-- 
2.47.3

