Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C30339377;
	Wed, 22 Jul 2026 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716518; cv=fail; b=rDmrPOuFHf41tWIq/hrTbhBgC3LVznQwVRgf0rr0+IaxakZxxH3t8kT2DFVBoF4r+JwVZVVm0/zVa4j55W++s4ZqKgTPqR0J4/5LyTM8LAASIfXTGI/gcpSYwpm6PmsZps/FUPeKYHDQCeEHAS33DZyWUJaTJOlZrAqEvDPfnlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716518; c=relaxed/simple;
	bh=qbBPJhj5kZ8UJhk/vPmyQJjTV+olhnNR3t9cAvTjWE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbRRM+taBqy+5jnGQCHlHrf628e2aJ8Sslgb+EFOUQpiGHXQt/Ga0W6Jng2SBnfb5NOU4NQsXJcUVYOOf+/pTTzgULNU+HaBQYFD978PBHFClo15RRhaxx2uIBVHDemnLLeCNaCUiKp4SbM7w61UtPLUcXcK9JayqYGeqkWGqRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iAM/8qtD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fEpXK+Ul; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iAM/8qtD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fEpXK+Ul"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5NoiM004689;
	Wed, 22 Jul 2026 05:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1eg7I0hJGx9sY0p5u23DGN2povJ5Pd4LuKLV/45zv+E=; b=
	iAM/8qtDKczK9lS0GEt1xwZJijqr9tdaV/NIPvyHbHXoprculIDrbLORw1ug1Hs7
	sfBZWgfUMKeCeewfz+L+KG4Ts9ZSoFw5r8RkzPRw39kLgGAim5FtKxr5Dj2zCUtv
	8M94eK8wy+Vs9jTVd5BaXO+dWc+7+3S0lC9h9zdy7WCOwaYdpU1MAu++d1mHbjDI
	773YZlBZs+KEUbo8WjGclXKKqofwpBItWUqBC7pZD/8ZjmRjvdpkv0c5K7RlpJlq
	yz+VXGW1oXWjjQBN5LS0RC1jGLNL+TzrbDIWcd9sMqzdKG3tsp31WYC8OQfttl1T
	CCh1gT5qpGMFPTrbuKcDlQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023096.outbound.protection.outlook.com [40.93.201.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vynn2v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 05:35:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnuc7L42xCGXYz4t3pGXyEMNopXQHQBFaIJZPXeKD40Omj5w5Uhrq/k2WPwvX06ilmPVbZsJQ/iCduTIf/3bpC6/6GIQ4Cadk6mWu6eUNvkyjYPsHHnRfCnmbVl3vIAegPx8gXxrfDiQE2E+a7N0cEejRS5nlYPzfLIYXCrrvk4iglTVr/Knz5x2sbDO2ShRfFrS/rxhtHM7VFWXPthSCA0t8c2fkUR7TPNg8C+UBEeOGa2qX9DmCAODtX+PKNHxJGO3NDKR23AQSClhh4ATsNmKji37TNJ07oKQTaYiFSV/pBUIQlH0AE0MezEXxcd8uDcRkJGb3ShS82IerUcPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eg7I0hJGx9sY0p5u23DGN2povJ5Pd4LuKLV/45zv+E=;
 b=tFzvPXlx7veHCeUS4rD5+49LHmOlGPfqNnQqpj6Gl5kzCe5A9LUZRsiaLAVNnVzFrWYzyqNAZN8MzvFfdzUObTlvIycRJNWWNfBydYADjMPg498ve3jprRcBG53RMqVeYX0tvXHBsTX/soBEXF+6en2SsHAaJ5SKT8AOnRLwMVglxAK2AJr1M3eLDjydYs7cxNzNg9hE1Y+7tUw/4+i3nu7nC48vVF0vOJh8w9eMAsC60TgfjEfG/EF+3cBZWwN8fJf8FuA8MNJJpAn4IRsZ4R1KLgHweh8oALryrCvrlkDSPc60iaD9rnT4plzNFbHfNEEZUe4MOamT6FLGyx5hvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eg7I0hJGx9sY0p5u23DGN2povJ5Pd4LuKLV/45zv+E=;
 b=fEpXK+UlJbe+MiBRXk0lwijQuEnS1mSNP6W2bx7V8rFDTrmyU/1wNWLI3GXgA+I0dFTGbKDh28ZOrSA+8Ja+0zuZNsSul267wq/X3+9uTmFmTdWYe2cHq4tGxbv9sUtXpSh1Ns+cZIsXIh8FIIof5AFDCSR47QBGVIz/BarGohA=
Received: from PH7P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::27)
 by PH7PR19MB7607.namprd19.prod.outlook.com (2603:10b6:510:26b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:35:06 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::27) by PH7P220CA0025.outlook.office365.com
 (2603:10b6:510:326::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 10:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.0
 via Frontend Transport; Wed, 22 Jul 2026 10:35:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4E9E9406545;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2B2B182026C;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: SDCA: Correct pointer passed to devm_acpi_table_put
Date: Wed, 22 Jul 2026 11:34:57 +0100
Message-ID: <20260722103500.872714-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
References: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|PH7PR19MB7607:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 690a21e9-dc33-434d-9d62-08dee7dce558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|61400799027|36860700016|11063799006|56012099006|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	klDx/8iSjHpOYUkhJzFXAJquSs0WIUYbF3ZLMz65x4qLh01ATjaLjN1ZBDRCF/9DyqAlWK0rE12PhEIxlsH0lWuZUTbTOryCoO4Dho0F8vNle4ZltjC7yazqhDoQxLlkvWlHCN5XgEkQO4iaO0XricvzldJXBeDhZ2auBl5JOKy+DT96CUtnfQfI4eRVMa4sTAilQQ9/YczMnLzUCqsHsfD/xyjeDla4Xdy6TIZimbsYXRmzDE0M82hHr7AYmdZ5WaqbPkvYQ/LT4xoBiaU/zU9AEhDZ35c5zw059YgkWgHDLBAEDD7cKOsv36ig61ClrPywIToNxHXAxLuBj3G42rM4XX5HP5QfYG4KL67kUzsmO+/dv565hkp+NF6FOwQiJOIaQeuhgzPeHsuLRHWkxmwLQknHW62AVABGyksdY59xF/WCHebrj5+JuqdGohWeSRrBPTciFR/Ht+WgQaT5a9LN1d7R2kcIaa/yQRMwJTkh6J1XJnbsl2ZH0uOjfs2K5eflIGopxYPdkjNzlt5FMLAEUzgVDkzUCeFt6d5EsYa/2zBPOdyMkNg8i1fw82yZGu93eYXSOU8vqw12a0yYfjsD4M9kzjiOhtAGKQuN+Ft0SMUqQJ/LsWVlXg5abOJaHfZCpKTOL5kkAkQUFQwiVIsjCiwODhxNf0XLwJOzvWOzTAkuCbWp/bac8XJ2gkZqsQsy8muqBuMWm69Y8JimTw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(61400799027)(36860700016)(11063799006)(56012099006)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g/UJ3Dl5fwqdXvh2CIdgLa+wDJXJOxT9sz4Oyrkd6CveB0SzaO5GO1RsAXlKdepM/2WpZAFDJOjezOpvoiJhYWrjLMaPNwVsFWHOgqDI1dYnLTjiM+w4TCEZHIfrqCcV7lY6uTnjj5/O65draqNm69jLWvc2kUJb+CfSUGfUTHtOV8R9Gh2eZaPCSwJLKuRpyphNN6+1c4b9bX6E+U64a2y8x8cAOYcxNBGa36fHXkgW7XYudqAtGG2mUcAN2Z7WBY5jNGP5oKrzaSw6CaIEJk3KnurYPDUxy8ghk3a2vk8e55ZJ+tRjKFI/SdUwEycR2gyE370LoYTLbGzf9T2FbzhlgQK5JEelG/jBFZPLLWBXvYdkGk/TIE9Q7wGHGzR7JgPWL7yqCKvvQP1nqdTknM81KistvjNnNZCUJrqIhyYJ0rR/8yfW3dVFoaPlQEyD
X-Exchange-RoutingPolicyChecked:
	eL99lLCvz3rtkQs1HZFPIjyu3yTE6kuqTuWIXkdhRScUipW4QnBpw0glrI32/ojLmFAfvHIRFr9W0m+W97Kj9In6oW/Co27kRGizd0ukAla9gb1rdbjdiI4HMgHCuZXjhArjhSf5kF1kl0iAfRfTfJSGkK6v4MEr5Ir50eU/ymsHYJgK4w/nKyG1A/w7yHIgjEY7ACK08liBrx8Xb4mOXKQvhWIorQzSSthRFGY0R4mg9568ana47wYNX/alfYG8QRsAzZGQTIOE+BDT9/d8JZHeWpu3X7KnH3xb3FroQHUGVr9jdfkQwVeb950vfuFspFbjQwHaqBcVu35mqmofVg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:35:05.6607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690a21e9-dc33-434d-9d62-08dee7dce558
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7607
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfXxD0omoD1DSr3
 UmPnGyuAFXRoRNxA59EsS4GV7arKn7uY05LuOzg8E1PN/BgihF6Vp0bD+huUpW9r00JEDLn42PL
 5CcId4phn2rlkt1X5+5oV4CFvs9zy58=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a609cde cx=c_pps
 a=8ytssxGH5sXDYVMDm1fH2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=BkOAAOD83AWRy7kR8HYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX79vxOuenkHML
 LYx+Aif88p3xDjwQJZUEgv9MSrFNH/nFWONMTcBNalPmMx9Xshn2Kofs2iPaFHzbPXvZQv00Eeg
 7l1r9Mfhq6/9TTNKSuwN6PXoUq18OquNifltCHDNR6mihmjNfJLKpkbVSYntVd0bDLsjK07PVcv
 WsGQ1SuThIwuhfmpsfNbSo+uxrxAvmbSNkAOjy4rcOFP8w+YmSTQPPkXw4woOkN7NJpHi+Jcq4O
 8mKvZEYDXGJn97vYoPYyH7hUa6sriOuJBhF4EIHQOcd7g4L0BQLeg7H8czWX4jyH+qzTqSw4tEE
 KtDsi3NEPXtsOlguwl80KvQh0uEL76ANyRZ+AwRaepa9PUlZCx2FFZ5xKw1mHwZ1U/a/J4EfQrx
 o7x/wj6OY755tyLGtOVggJByz3cIQA6qU7d7jYmiZ3yJFhhJ/NtyRqx39jrKAfLp/LseoLvr7UB
 +g7CsgJG5A10GoWujHQ==
X-Proofpoint-ORIG-GUID: nbfeGca0Xw1UNmUm6Z35XOgvQDCXHHxi
X-Proofpoint-GUID: nbfeGca0Xw1UNmUm6Z35XOgvQDCXHHxi
X-Proofpoint-Spam-Reason: safe

devm_acpi_table_put() takes a struct acpi_table_header * but the value
passed in is struct acpi_table_header ** so the value passed to
acpi_put_table() is actually the pointer not the table itself.

Remove the extra reference to correct the passed value.

Fixes: c4d096c3ca42 ("ASoC: SDCA: Add SDCA FDL data parsing")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 405e80b979de8..4bcd8d1fdff82 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -43,7 +43,7 @@ void sdca_lookup_swft(struct sdw_slave *slave)
 		dev_info(&slave->dev, "SWFT not available\n");
 	else
 		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
-					 &slave->sdca_data.swft);
+					 slave->sdca_data.swft);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
 
-- 
2.47.3

