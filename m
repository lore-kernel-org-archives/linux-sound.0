Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558D3FFAAE;
	Wed, 25 Mar 2026 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458539; cv=fail; b=R3JwQAoIUVzDZUr/Q7xgWytb4e3y2BUh5z0tm6VIzmAJrVSQ/IXsN951Q5JsnTNCxr3MW5Nb9Lm2Hi8xGcUAUaix95htOlqsAQcwEggVPpzr4ZkRTCJ+LTRNq/N58NJFmlILw93m5Fcm7Y9RDsX65/FslLIPMs0CU9wNeI+16qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458539; c=relaxed/simple;
	bh=QgCGOQRNFwTfItUy00vX8pm2LiIj8Sznc7OlnomnTVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AK9kdQEHqyJDmMZUD9m8bAZD1uj2bcoBbtPfYlhV+gpuZSTzo4JAF2WnD9GKu8oaSdvXDIMZ2/NdRoRGPqA+xanPdzG+xyHlWH4ChwIeeGHDt39Buy0wduI1Y3JagHubXcUoB15ZDjgZr3uckb/pfSqt4N9LEn0V55y3I1XOOYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=F99nAlX7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CHTkIonA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="F99nAlX7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CHTkIonA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P07YbT1249061;
	Wed, 25 Mar 2026 12:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wNM0ZqEO8MHL8K6/Mxq0NkV9s7XROUJDnhP3D26que4=; b=
	F99nAlX7ZwRWzOq7cW3koD2n7tYIKM3OGYPq6hfyC18H4r83C+FZ/jJ1td+Oc8Rj
	sKcY35cgHGBzhHO3wcSeQXpQsDnfB7fQa1NSXacxqCWuU+3dUuuLoKsm0D0kbCl3
	zlLhrT5MESAYDLfmCwXECZppGSwWpq+AmFQhg8IDkW6GRe6jJu4shbnc2kM/QBRH
	Cg5WNfNwBbQPqYXDPBC73LcaDbXLIeriDWZq9xC2+LrGrpLIAPw5If5u8iSAOv4x
	cIUhdnqb97pVFixQhDg6sO5LDlh0tVxFJYHUaJAtu6Mc67YHsuobDNyezJmPMEyh
	TI0pErh/DaLf7n20ObT5DA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022135.outbound.protection.outlook.com [40.93.195.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfd5d3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 12:08:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxY1E4aCV9UF/lWW7v6146IYRzf6JryEPwTz24897wjVH5+Eacjlb4VSYffIcOQ/uhD/il3+mev4r/f4D9bGV1nO0M1ej/ey6G0gBfiPm7DCMEekBM8E/EhcYv7TZ72RKJNNYpk3mXhnGXdt7LohknLElJ/jdroprHUTJ6LFqzK/TYoTQaQGzVhs+RQ9kRDzSgB/VZoYyqUvQkbMsR6GXYPORZOYVLzJA+tebO+0hB82U0k5bHhf5PeTor5tZmslBihlg1YwAZl74ti7E0kAknqV8KkRovbuinluhrXAVKlpQZww6NEnb5VFTQHld4wEB/EKKqrLXhX6tg/oxRR+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNM0ZqEO8MHL8K6/Mxq0NkV9s7XROUJDnhP3D26que4=;
 b=b4nWsWNgSBNHiyummobp4a61Ib0MYvANTl1DyB0P9xQPupByp3Ts5LfeLuCFuVn6fbje8c5SpnAt+Xog3+Cl/YdpNkvfZvhnAwMKwXJiOD/88y1pTRKK4yrLJ68hBW9QqvMPcbliQwCVzzJlurAeJM7GCpCAuOzVlnv9Q2R1GdoscDQD6huXbzQC0kV+9poH8+vqdKTOYXdaUaxHoHcyGMXynesUZjJEH7g3+UwDNI/kAF0yh6evyMxb5YG95/TW0wdl7+MqIBbMsrkgXco53ajg1nsnUoZfCpJIpXNtR4A65YGSPmI65LOBtDiGpX0TCQO23ZZ9RNq16BaIOsYUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNM0ZqEO8MHL8K6/Mxq0NkV9s7XROUJDnhP3D26que4=;
 b=CHTkIonAZXZtjh7y6lfTDnbTqv/if64hfuWxLsIklx9VRTRR4n5nMatfEnrXElfEjWR7YMV1pXDih6Zq/XF2SIZ4ubmRYiP5eGjaeVRo6Oj0/pelpYCSMbXf5mikKrhHAT3e0tExqDZ4PAakp39iyzrgvjo3BzTM7jly9klLMd0=
Received: from CH2PR15CA0024.namprd15.prod.outlook.com (2603:10b6:610:51::34)
 by MN2PR19MB3888.namprd19.prod.outlook.com (2603:10b6:208:1e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 17:08:43 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::d9) by CH2PR15CA0024.outlook.office365.com
 (2603:10b6:610:51::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 17:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 17:08:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 233C5406550;
	Wed, 25 Mar 2026 17:08:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0D4BB82024B;
	Wed, 25 Mar 2026 17:08:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: soc.h: Add SOC_SINGLE_BOOL_EXT_ACC() to allow setting access flags
Date: Wed, 25 Mar 2026 17:08:40 +0000
Message-ID: <20260325170841.1405368-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325170841.1405368-1-rf@opensource.cirrus.com>
References: <20260325170841.1405368-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MN2PR19MB3888:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 746e5363-6c26-498f-62c3-08de8a912b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|16102099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cKmLeOgoH8CUPyRv/DYCC+oLifivqnNXtTVMBKVRGQxax/cEcudZCP0dOkxcIBzXFNnx5owvt8UU6O0h3rgIvrOL1RUoYN8pcTCB37EPgFom8dxFJ7UZ8UBD/Pn8w/2e25ghZUYobvygfVU3T8BzmcOYRRdsWUf+oqbvBIv12wLsSPOVYCTAoUz0x6ey0qqRhYDcGhDb7WPIBqGyJ1ST+xD2qySpmT2fBZ2qa/A+9BnTK//dkCnjiw2lEobHa8VwpEMPoe/yDMFs2DDcDpH6GhsiH5qAgaxO7pPkvD1EXwyUQKyRYXtDjxWnnlFkwiqxFtHX3wbO/ox+2kfNv7Ld9+BtuG/DgpsgNK8oziSs11bJxrX5TK9BSSPySimTD6yaCsFOKp/FoQNBFyzovPTipS8EgkdZ/LgG2E0zsaShKcCj+6MgIHEgEj+iBxVksop+elCwPurIRrIJurUV7kPtmsdHp5vP45wh30rs+ynkuuAYkdCtKfuoKfS5ZSYpGWO5SMSaAeR55REiH9x/OuXnB1dwGy5f4rn9bL3ag7ko95wC6c08J2pgoNF86Kk4wI2l2aOTsnEoWcU0nQ4qYzZChZrtZoZl7QBYnmzENwjEl9k6N3Y4ccwBCCOv/Ct+xqOZ5+5GTV9UeZiidgT6luFATI4H58gWLERnAIycM8L331iQycJkROVp8F+QmoYpFkOCm0n2EMY+7RaVU+z6Zes5pC0P3BsrAM2UQ4iLAdsmkLhazbyIRC9kl5qkCZ04nG1FA/h2E6tvP+0otqmvDn9PHg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(16102099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	weXPfLrEi7P70Yiq4kR+7SxOXPYU/S3B5XZ9iI0nQmye6UYb0MS/LQkKvF3hq8/K4dAJa8YLhZCvt0+2GRyWHE0OGx0pLbzAJj1RS+RwwJA8Qovsa+mSXZixMk4F2To30rIOq2/rdAtzqPcr8DrBOlHWkEw6kqzMMc+akov3gTJeBG4MaPQBw5HP1ooMHhhEV3Yix/Ufdn+eAeo6nzU5cGnrQdWeOM7ZSUnL5rWvXntKfQXbiFKm7IOhZqayYgVJ9VtPUj9HpRC1Vg+/998jRSw4r4g6dEbV49pva9SofWHriAkinze3roYBckhmyOxrb+D2xqXFWn9dJMhz8ifGQ27PCjpSguIwwzFLKLACHQxwgouy7IcuBTVAUzNvh1ZxRlsJpD8Jq3Yd9CtQMOVVBwaWrpPwXc0ezMczZqhifShRP7Sd4Dh8vmAncylxOvtI
X-Exchange-RoutingPolicyChecked:
	Q7XWNHB2ePnISWsE56nAFOvVNxLj/SXF1tnRcAfUymaKok5fZptRLNXO/y6WBzVbW40WAUTxQ8NW7oGF7AS2f96duJiYfXG3535uFefFqczf/px/zqzBCxe1s+CWQHhzxdIgP7td3x4illdAme9j1BLqyFNRMXWVh7hWr/rybdqp22HQUOLWMxcE5+ERmTq4zLIvPXlyH+Z0fQIG5/uCKZEZXQA08+SK05KTzQInUkll6MgPoQPPeVIg2y7IeJ3j2dbeachBIkCyB3k5Qje1xaUZaNS+5AYowTLqKXdZBrjqHzvqFIkDr9MSzD4VWnyAYcNNwBw1EofdLVtk5trKBg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:08:43.1291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746e5363-6c26-498f-62c3-08de8a912b3f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3888
X-Proofpoint-GUID: c-gT6rS8lEXXiwbttFRzaREXnj1Xl-2D
X-Proofpoint-ORIG-GUID: c-gT6rS8lEXXiwbttFRzaREXnj1Xl-2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyMyBTYWx0ZWRfX/Z9a4g3aFCwN
 qcth1jTYLjuCYzvxXRoqyDU7VmkzKbIsO7Va5ddc9r7ZdyQkluq9F4FE24z4aG2cukQkx4G3mj0
 5xhKoy81KrS3lQvV6ZhyWK0b9rVjq+FaDBw0kAEif/4aGeDa1aQZZy9tUqx1h/A6o141BnWvbWg
 19dRVnq7iziOhRfnacuazZaBUf1EC/BtNbuJIkgADo3o3RW31Yq23Ceo4DWVEQhgh3EZcLi1Cv8
 Rg0nC6jEJSkyhWDYsb8PgQ0vfI7hOuo7bNkk6M2C++dlpyF7GuCgRaB8QffpAMcLwTJqQd3Ruca
 yqfdDFfz0JrQGMLOBIXTgNdGJHyFBOJlqmP0kmwzPfN5N4GTfxkUwuQTp58EJfrTZp8NGpq41cq
 9DNn4MBOdJWq8eUHE2bMnc+LAYRHWC/ig0uO22kCvtDzujR6DMxyUosrToNKgiIK0P7n0Ell763
 9UBhippHxxNM92dp5BQ==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c4169f cx=c_pps
 a=j8jEPmhjjLnYR6B6k97zMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QoAUexUnQl40UJG7N70A:9
X-Proofpoint-Spam-Reason: safe

Add a macro SOC_SINGLE_BOOL_EXT_ACC() to allow the access permission flags
to be set. This is the same as SOC_SINGLE_BOOL_EXT() but with an extra
argument for the access flags.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
New in V2

 include/sound/soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a30f95ff7d86..fd6c1c8055d2 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -311,6 +311,12 @@ struct platform_device;
 	.info = snd_soc_info_bool_ext, \
 	.get = xhandler_get, .put = xhandler_put, \
 	.private_value = xdata }
+#define SOC_SINGLE_BOOL_EXT_ACC(xname, xdata, xhandler_get, xhandler_put, xaccess) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.access = xaccess, \
+	.info = snd_soc_info_bool_ext, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = xdata }
 #define SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
 	.info = snd_soc_info_enum_double, \
-- 
2.47.3

