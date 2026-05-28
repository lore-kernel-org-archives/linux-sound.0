Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0B2F745C;
	Thu, 28 May 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979606; cv=fail; b=UZs4Smpxa7PL0VvZNAUSNbW+uv4nz41JWv5EtB4nrVSgagZO2/SJcdrk0ru1wL2oncCGOE5KcI3Keb91ZCPbFXQQOPYcqeLgJbTqopQg4VvbFdUF4sCyfmsVkHI+8aTRVGMFvV+V19GzxCjqRenLTQTq/UEQiZabmad5dJKredg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979606; c=relaxed/simple;
	bh=RksbLWTeHCkz9Iq8q/t7D0TeNEHd8/WzPnk92uluSPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dVNpHLNyo8I+SpKMeqXgTavr7T/Pzya+d4K436MH6h7+5Tb8rI56j02dm9piiQKMF2ViOJpQ1Hkkr73Vt++EYigO2IXUHgb1cocr4fA3ZosxhYixu9tKOzkOE27GF4Ix5xqXhwEucLMvwJs9XZItHz9uG/hPIZnFmJ7SA/Gzuos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oYDLLMA3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RBagScES; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oYDLLMA3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RBagScES"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SDcaJm3549718;
	Thu, 28 May 2026 09:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=EqjChiERY5igZJkq
	Hjs6rDhmP5UB5XoQ8UM/FhDHMYM=; b=oYDLLMA3sD+8pMxA1cY04X7I3ic3ZiFS
	gg2L7Zn5YguctA5J+b1inqAh9ZHKbhLvV8EGGM13LE18yeFaKSCGRW5B1wsCGwye
	t/dqERScwZSQWAB5coWr0+6CWGrwsPncbui70Tj0hu/7xYeB7q/a9Y2iYQLjp1nC
	vO6qtYuV1W8nti7SyOs2JJcX2sv0vpi46rwxT8gAgW6sgGt3jCMpzikfkI2GA1vk
	U1N8ugWGlhfe0cCMDz8eG02KnS2oh1Np7BnOXjmUiLIZRPOMAFmSNVUaNsyWV1LL
	Q5m5VaRmJBS2aqa4sVrNFwGQtvw1x37r07q0Vp1SYpU9nDqf7P8YOQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020086.outbound.protection.outlook.com [52.101.61.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ee7x210nj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 09:46:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRNZfpC8E8W+OJQTEHCOVjjzvR52rBDbi2huj74qfUhDs/d1FxayioxcFTXcEJjFP20M4sAEFCe8V6nfqgCCGUGltUmmnwnwWkXuXcoKfqGOfW3AZ2g+0KOD+TmDxo8RLS2mU7uRWCKRhlGu9qOKlQxekOMyoX3rlK3NwS51PnIy/YEYgRdBbEHDg38dh/F4KOTHl+xdXTZgDCEA0ShEG0Dwm9dq6QZnn37D7ftsw+D+JMF0NHEatMDeWx4jxP+/XsRnmMaLNTOefiP+9l1dyOv8HMD7BnU00AcfRb3ZJleGQ45puus5W5qc9KEfqbdnWVN6sSzTbFiYnqjatoBQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqjChiERY5igZJkqHjs6rDhmP5UB5XoQ8UM/FhDHMYM=;
 b=mtsYPExsjOtYrU1xefmSblEblTzkHLFlnTa/1X1DJSYfqW2jPbqu2Aay75wXK9xv52IVzGdNqEbSmMyXvK1ODLIOcQjQeBqloyLNCwGTOK7qNhoaXqetKki0GqfFYwoR3zGLRJlhlcpk2vbDs/oRJgrMAkSJzfc03MCsybVceyJQVr9xZ7AR0LAsP7VqKOKDtQwJsrZGYGetTEEhX0LBSfqGPul7KiPcur5j/+Ki8A5jfqGVmjYDLVgQHWO8A2CuWucvAHB9cSTQXWjl+1NeSLo1HaIaBIwr5KR+3Rzl8mYoXET9LqCyk4/DFY+Nreg02q2yZMTxFJlxyGJtHQQmDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqjChiERY5igZJkqHjs6rDhmP5UB5XoQ8UM/FhDHMYM=;
 b=RBagScES1GLoZVrwxLMTS4TTbU+8yTBz53zDkZywzTK5nYufTP1fFNC7oNyWS0wuBBGQSKYmXu+nnhhvcal+61wteUG83g7FcFDZVqO6H/dWiBCFRQWarOIyWT81TfxM7tT6o5pK60gtq3zPUnO+T2gI5YpcWMnO8UkwrbUytkg=
Received: from PH7PR13CA0001.namprd13.prod.outlook.com (2603:10b6:510:174::7)
 by DS6PR19MB997459.namprd19.prod.outlook.com (2603:10b6:8:462::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 14:46:35 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::59) by PH7PR13CA0001.outlook.office365.com
 (2603:10b6:510:174::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Thu, 28
 May 2026 14:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 14:46:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D8243406540;
	Thu, 28 May 2026 14:46:32 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7E08820244;
	Thu, 28 May 2026 14:46:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib: Simplify overcomplicated error return
Date: Thu, 28 May 2026 15:46:32 +0100
Message-ID: <20260528144632.130197-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS6PR19MB997459:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac5818aa-0a3c-4125-801e-08debcc7e9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HnOrA4H+aGYOdj3A121J0/ryeBRlwrt26B/eBLyFXusinD2NrV9MAlWvBHeDuNkTl85l8plK7oDnfnXxq7LOKr01+oRKCMZfCPupUEtr2Zq3qZiUPG7AKD9kHifmjSypVCpBFWuKbaGdUAKTIhkFFr7yf5/+S8x1MALjgHOJrkBT2y/tSoPaEwLq8UW+AP50GlqiVCkBm6A0xuHflwL44JfbBjibSPFJezxv7aTXRQnaQ8Bv9neVDIgGXu77yEyKA/YoBvIoOWKEDNHFiRZyMfFcbyXDr+eSAh6II4/RKOTn8rux3mHWeWJK2Vhb84kqvebUbQUqtqDRRkpwhyJSHhH9vfDOBmoxznhyvskrjsKA3tAVRUNqkYHwcBAr9YrCZLPu3H+eNrtaAElO2Fs7qBUOoDElPR1RmgieSVx2AJcaVYl+DMYDz7mMd0oVY0xLKi0FMNkilkyHDBDTNH2iPoJFb6YkwfV4Qzkkb7Dfpi5Zgq5iVn5SFVwrYqarZeM68kVMc0gEdBfvI5c5NNRhcpWNRhgGONBNB/pJhoyst5ecmBg/ik2TOVOs9TWoRbAtxlpVRQ8G5pfCr2FasdNJmuHClsIwogIb1pjDdwppp30g/7jO9CQjm+RIwx9W8wII9MUYvNSCx8Ep3FJF7p+c1mHAb8UqaF+TfH1kzArTqEKMp5DjCcFBi7UEemM5yB38XCz9cc5ay4Mn7ol96nfgDPcIQh8thl8u36WC+sEeUI4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GwGqE+RluQEzpL/Z77IDs8OIOQRv0XItl+kYTJHYBLTLa+7g2z4F30Hw9+4LumAuKwVgf6GkT3fBQ4P1GLLC7QhT+tk3yBeTxiUzILyHJpWL5e1pXSiP2P2MY1Agyob4B32i9KEDGTTuLi0zoFme0m6IWHOP2Nw2KRuTIg0i8jaOudFuWbDF0njn47kxOgiFlvMEpafkdEjf7E85GKMm3vOJaoMK2YVQo4TJmLzYqlOKX98QjPqAO8++1qxd+7uHFDGZRLdGFGz1hkebDeOEKgUGdOtTq+C4vMrvtoSw4Z329m77GuH1Ps79yfqOq3eLs76Np5hkYxVJ/qiR0sZoSEoset49DbFdoCU00n3IR92sP6btkCzC1aC9CzoMc/LKmN1+vJqEI10WJEpWK+lzqWJGwceaEkqzsExtwvZ2/Px4dAu8wS92eU/E+GnaXcNR
X-Exchange-RoutingPolicyChecked:
	Tjb6TVw2eNrr3PcdTtuRunj5ORWiEDiHRopxDRiJ1yTEIm3yFSHwwyeSXL+KeB2YCzh+kesHOo1TBVMQ2zbJcl8fRKA8HiMrOt6KK2il8tvpoFOVf1uSwJ6ZGj+Zzu5Wy7ujWXwSGI0GeOs8nsK+PdhK/rZueZD4nDmv940XG3u8kIBPAr3ftLCqlOV+X8WZRk2v5BqSdAcLW8nLnE4YRn5Undf/D3OejbBInmFwh3QM+lYZaa3aLqVFW0OJEGG+gaEOXtiAKHoM4wiF4sEnfWFP+JOx7Lyriszcw7LCqXuUj1N56/wbok5dg7D0P/nY0yuGGHmHueBBWIP5HRoljA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 14:46:34.0320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5818aa-0a3c-4125-801e-08debcc7e9fb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR19MB997459
X-Proofpoint-ORIG-GUID: llu35yA7nebEMaPLoQwbFoF2nJVc2fRh
X-Authority-Analysis: v=2.4 cv=H/frBeYi c=1 sm=1 tr=0 ts=6a18554d cx=c_pps
 a=fkGqgt/Sb7wiNX8ALWkXKA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RRJtKBxbB4EndMp-QY8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE0OSBTYWx0ZWRfX3SsD9NLr8wOa
 AclX/Xo/SCM48Btcehi/0v0BL/xROE0oclsI/wT/iSvsOI5wZ9SedwknvHEO+7TVhoN4GefgdD5
 aRHvr2bVLRRKPqgs51KWJ6RTtktRXnXMs5iiwA8pDi6RNSYnfBBRWcHfOoWZeS9C8PnVNyVvTc8
 bpBfp41mEH8VLWvqBUpyJ5RVak0rkMDQ0+lUrQilrd0QmYW2uDw86wPZb9X1EvEZxfoAFQsNHZT
 K1oqDD5YcRZDfHgmSwz6tFqbtQBQygPkvHOPfR9B01B9skhzQwytX6HdMfHJ5degD9C4bSNlVro
 2I3lZqdvjS9ytFxDaPEG9fuEKZyRALG3iFyYMV1ivYkIcK7tP5q08O8Q5oZdqWwWZoEltfuTrv1
 EV8UnmoZEEWcJfFoWbxbO2tATTwUqNjch2IobusKBkDHMnyfJwRyp0oEs0LU2RlZY73GwbsYVjv
 KXTzj5WlnPmvbQqATYg==
X-Proofpoint-GUID: llu35yA7nebEMaPLoQwbFoF2nJVc2fRh
X-Proofpoint-Spam-Reason: safe

In cs_amp_devm_get_dell_ssidex() remove an unnecessary special case check
on -ENOENT that just returned -ENOENT. The other branch of the if()
statement returned the error, which would of course return -ENOENT if the
error was -ENOENT and so do exactly the same as the first branch.

The whole if statement is identical to just returning the original pointer
if it is an error value.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index fb5b950e584c8..371e99205b58e 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -748,10 +748,7 @@ static const char *cs_amp_devm_get_dell_ssidex(struct device *dev,
 	char *ssidex_buf __free(kfree) = cs_amp_alloc_get_efi_variable(DELL_SSIDEXV2_EFI_NAME,
 								       &DELL_SSIDEXV2_EFI_GUID,
 								       NULL);
-	ret = PTR_ERR_OR_ZERO(ssidex_buf);
-	if (ret == -ENOENT)
-		return ERR_PTR(-ENOENT);
-	else if (ret < 0)
+	if (IS_ERR(ssidex_buf))
 		return ssidex_buf;
 
 	/*
-- 
2.47.3

