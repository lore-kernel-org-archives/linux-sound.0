Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DFD3F9A1C;
	Wed,  5 Aug 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933752; cv=fail; b=hE/xyUT39pRjR+h0O6Sxs6b8DTJY3CDfOBkwHSbcBOMnTinAJvwKHBwjk1y0S/8p+1pAz32OlaNOU9KjcVdhMpM+suz1c65I0AbZtToyWy9yt+3iI33wEYw01/lncNfF5DPblr+BBTPAFtpH4d0O7M60kSvAthkjWc4jV5GHeUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933752; c=relaxed/simple;
	bh=mJp2mCzU1vQ6/9EbcmbQu7r/5EFWf19zKy6tY6DFBkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZqyHDuZJ3IK63pNR1PDAMd+BYrZqxwwqlVsCQsJ2tdNoUo0XJ2dtpRrDp2XKzEB1e3dri6+sug+rzDoeVCisuAKAwHfd7gFnBCFmWWFaZHoK4n53xskySRmgi3IX3gjtnrbJZYoXKsUOLhg5zHQoHljlKvv8bclnIFWAOpgAsEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pf3SVma0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IowkTxEH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pf3SVma0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IowkTxEH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6754uRgQ3419307;
	Wed, 5 Aug 2026 07:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DahVpk5W8opF3xCQ40pkoYKDv5K7DK5eOXfYJurhEl0=; b=
	pf3SVma0oNlDmYNGk0olVmBlJQxEvtV08PU2HyRv1jokhsLA4lwVO3UASmEo9lHf
	shDYpCOjEL8f8zW1iQxMkmOAlXlS6MOsaCd+jNywzul0S2m57YzRFwHn09dHneqZ
	cAsDr4FL3ibVcQJKElqDhmngP3hy7K4DBmUMKZUNVpMOgxIt7wn/AKiuqX6LLPN6
	LjPe3n5k8WRMXuP63WZC72nkbYBOgv/Ml0x7x2J2+M8/8fKdIK6jy6s0e+U3xQ0s
	K40mYQwzuPvlahf2h3d453UaDbENcEi+OJKDzdWQ7CJ1yBi/cVqN5AFgquIjXu4f
	9RBH8tuEmhYVIP6nWJaJTQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023105.outbound.protection.outlook.com [40.93.201.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vnmdp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqIKOvOsUIzna+xcALRA74f+rJ87hu6hXdKfniw+4M8R+PZ+88tWIIsTomzfmZo/ZSxEUw/3TNfR2xfg7OAFHNDk5vaPj0gabebmHPY6S6/k2j+/KtaL7Wf/Y7m9huAywEENDNwecUKE7JuTjW/fSnFo+4N9PdHDTKMTRDDXWJZ5Hkpemp5fQqTUPS6hzJE/zDYRcjzdETMLC0TFWaxllMMzA2sNT98MYHZz4NkQOeQxAAofakJxov9aAJqYh9tOqssA97zjounUZtOMpPVkTUxZQFz+kFeaQplhRoBvrbDfw87JQUHco4fXBn7BGM5BOJDV9olBb8I3bqYkaqXC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DahVpk5W8opF3xCQ40pkoYKDv5K7DK5eOXfYJurhEl0=;
 b=NXSWlzQMHinioH+9kynLidirpSYZsXZuqtSXi/gKOo2dVhC2NA8fiBJphwcdGynBuE21wZCPzqYKSCbXO2hQX+WsD1Cf3+l8LsqhX/w1GGJAX0apNqmX4+v4UcWSLVgunWcFA6m1S7bLpa391i8kHD+plYozezPXfjJVvODXJjskQTIuEhACv8FufF/D6ZqGimAg4BVMXty4RtiEKmFapCD5uoizu8zWKC/KQt0ah/mxaRcCyN28dTmxb/C3qEJ+O3RC9MY5oQ98dxEgWraGxmU30YjdDprTVPoazHCICTrLYXlow/WV7tCiL4tIsL2zpmO7Kj8DnRHGLJY6dKeVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DahVpk5W8opF3xCQ40pkoYKDv5K7DK5eOXfYJurhEl0=;
 b=IowkTxEHLOLNs6eGbNjpgX2i8/RbxiNZZ4LVh7M9oCSzUkF/JRBoBWhcXYm5O20/Ow+wb5zeaMw5iC+h0kaN8DUKjAokT99c5EMuKAC4WPUk6VFe/8twGZ/+0ZY9usCWHIgOQXTtfoAJbfLKha6XgQDNNFCXck5BN2wY/471ve0=
Received: from CY8PR19CA0038.namprd19.prod.outlook.com (2603:10b6:930:6::26)
 by MN0PR19MB6044.namprd19.prod.outlook.com (2603:10b6:208:383::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Wed, 5 Aug
 2026 12:42:13 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:6:cafe::18) by CY8PR19CA0038.outlook.office365.com
 (2603:10b6:930:6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 12:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:42:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AA2F040655B;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F65682025A;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 8/8] ASoC: SDCA: Pass swft table through sdca_dev_register()
Date: Wed,  5 Aug 2026 13:42:05 +0100
Message-ID: <20260805124205.4152543-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MN0PR19MB6044:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e39520d4-fae7-48d0-ee18-08def2eef965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|61400799027|7416014|376014|56012099006|10067099003|11063799006|6133799003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hZ7GbDazpSDsFfBmsPfPkn0mWNDJyxXg16laE3PuAxkB/glvhzhfdvu784jo6ROZmlEjNvNEK6hQUbd0cJ9BmSL8EApE/oIgM0kRvICThmnQZuWPF4bcz9OFDY5RbVwszjqOlG1Uz1OJr4XYUpIyqrihtG6/oBkoYrrcGjPpyTXrjfWlNL9e/+sHwEe84RnEahWUzRuhNTyAjOtddff/I2uGtmE+hqbGYqzjL9Wx1rNDTJQZz0C1KNK4umo94/6fDV4O3m/MCdlwT89+dik3646/TVd/VSZmbhRicKl9syZClLGwIHKdza8VvUw5SV6zqekQfoj86Bk7HNv9xEcYUiBX+1Lm7W0LQ1/z+4j2PKO3kE6EJeKrBYUh9mCOmxXMCgDGjNI6LNRTLCQjD4wIX5k8H6DaQPYTMNYEq5hadd0NWD/XLNKxT5cjPxzhVU/xWMKOcWAcAqJerTxBrwjbq5jUUJa0SSl+2F3T3uxYjl38fdAHBFPbcH0hMTVXV+j08ywt6q5Oj+5sUGQbsdtW1AEdQZ8r5IXTgiCXJNlB3RcrKkecs0rR2lj4ij6ryNur6VNHNEIg5ECd9a+mwdXJxG5grE9oh+E4iMQNyqokAFVSxkntbBjorTdR++YU1YEes2ISCtqNFPYtMczHgpOqD1b5nInKX2IBYg0QDnI+HWnTSVfdRcBnsHmLPo0Nq3f18rax/v8CZDsXCtYrg/bSGQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(61400799027)(7416014)(376014)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X0h4xv23TytcXGt5yFheJEKKrvQuD4w9kUU2bCztw/+y3O440X9h/c0+LOfeIsOydCBA6DKwuUOwF1jsXZCcFTPVlxdoxdMGGrJ9kCxZxWc0a5pORWWwy0tdmhvPSvVRIQKeYn6PwxQxrL3WTn0kFR5cg99VaQlAqbiLY03kqx3ddjU4mUj1yBpsjLkv/PwvPOb6cwGJWZaBs2WN9UYlmcy6u+Mklb1HpSLM3Wm8S54pPJC5jD7gPYVDVInUc7/xvgyizLDIz9KHRnMQPtQeEMo8zng7paQvX2pknnTZk3L3+1eUG3If+xYqOrPH1Fypu1hOTLLaTCB91Zc3kEsE69lYdttJ4041gJeFUxjFH8TaJ2K3FbGQgwOp6VvIDOVkFQ9/+tZ7TL4yUSxsDfRNMkfKywQAsHVFXfVzhSP8sMO804U5jRPWjuBcEZtDGjpy
X-Exchange-RoutingPolicyChecked:
	N9agvFveYW6GeLjC/sfK/IWBARK/0W+iUPWtbqSBD9reD8qgUPEp/rUcUCTvLLYZeJJ1SQFD+fvMv9VwUvgsyPV0dTyGkq9AkgdNwTqaeJ+OnSF9HSS2UCzb1nTTsuWWuqq3Cj0WzmSEZIuZ6BHjbni05cx61p9/lf6xRNG4vdRE/a6kC8lE6SVjK3B8HO1RtKaFhpOeY9zI76gl6S8/A2Ju9qTywrJtEVyQ4IiOrqg4UdOqS1rM3NS7RlX4DYwk1sCQDLnk91/w5F/New9bYHcKDCOYDw0buSVaGRMc5BynUadkBB4xWJzzM1NRsq+7eq592Mv7sOqZIWlsfr3lfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:13.0636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39520d4-fae7-48d0-ee18-08def2eef965
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6044
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX/nT+UVXe1eKR
 vcgAydlV0QxdhpqAOB/MMNHTcOhNR6E7NY4RdAhLNk960Dj4eZ7BUiD/JAvQCtEg9AiYevpD6Cd
 y/p6mdEROkzR/Z5UoIj84kSgDB6Xs2s=
X-Proofpoint-GUID: pZ6aVzH2bzRxxbxD1fXXwM_tHousuuLM
X-Proofpoint-ORIG-GUID: pZ6aVzH2bzRxxbxD1fXXwM_tHousuuLM
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a732fac cx=c_pps
 a=hloNlEDlI3+XEZKeHTbqpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=FVNOuC7a9JbZzHRqJzUA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfXwFVj5kQCgO0R
 yAncQXqaXqVk362d57yIufrXwg8TB57nz8FDMgkKrPFkFvFSQYebFqAu2DT9K3OwnmO0k+vqlV2
 JrVgqThPYE2jZUk49n0IeOAKH+9bROFrfMj8ceTs6ytzCCM9cGFgE1vyERsbnVQbdmlgN9o9Ohf
 OibQKiDqtHNGWFeqRTg87vPfx3l2WY45VeUTO/tJOrDyT7e58KPxkKPV+i7bDICZRpOWcNR/LeP
 d6sLk+aVbN/OPzvQFx1An94IpxqdAnJy+IB94N3cRS14wSgvu8wCO69i/dsctjjMEWjmHQ8gYd6
 Qkdr4aGp+OJXpPJGWRrQHrP+J/OBlK48X00tMUViA4FDJqF1PEGZO6IZ/bRihbU1yBFvg27cQk3
 Yf6IkrAWxqQ0qpF8DeaeF57q/Gkgpe6j5T22cGDxMJll7s510Nxf5q7psGGqIuJbl6WkvFyGITZ
 cKw6jY/MCal8gD3kHzw==
X-Proofpoint-Spam-Reason: safe

Rather than passing the SoundWire slave into find_sdca_filesets(),
stash the swift table whilst processing sdca_dev_register(). This
allows us to completely remove the passing of the sdw_slave into
the ACPI parsing code.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h         |  3 +--
 sound/soc/codecs/rt766-sdca.c         |  2 +-
 sound/soc/codecs/tac5xx2-sdw.c        |  2 +-
 sound/soc/codecs/tas2783-sdw.c        |  2 +-
 sound/soc/sdca/sdca_class_function.c  |  2 +-
 sound/soc/sdca/sdca_function_device.c |  7 +++++--
 sound/soc/sdca/sdca_functions.c       | 10 +++-------
 7 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 72441ed5eba49..f65a1d6784e81 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1460,8 +1460,7 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 	return 0;
 }
 
-int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_data *function);
+int sdca_parse_function(struct device *dev, struct sdca_function_data *function);
 
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
 
diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 54ed0c42fba2f..64d763b96a061 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -1201,7 +1201,7 @@ int rt766_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave
 		}
 
 		func_data_ptr->desc = &slave->sdca_data.function[i];
-		ret = sdca_parse_function(dev, slave, func_data_ptr);
+		ret = sdca_parse_function(dev, func_data_ptr);
 		if (ret) {
 			devm_kfree(dev, func_data_ptr);
 			goto _free_dai_drv_;
diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index ea0408b71713b..fdb6213d13603 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1940,7 +1940,7 @@ static s32 tac_sdw_probe(struct sdw_slave *peripheral,
 						     "failed to allocate %s function data",
 						     func_name);
 			function_data->desc = &peripheral->sdca_data.function[i];
-			ret = sdca_parse_function(dev, peripheral, function_data);
+			ret = sdca_parse_function(dev, function_data);
 			if (!ret)
 				*func_ptr = function_data;
 			else
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 34f17e063fa3e..94f11e3b0c207 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1348,7 +1348,7 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 		function_data->desc = &peripheral->sdca_data.function[i];
 
 		/* Parse the function */
-		ret = sdca_parse_function(dev, peripheral, function_data);
+		ret = sdca_parse_function(dev, function_data);
 		if (!ret)
 			tas_dev->sa_func_data = function_data;
 		else
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 2fb2b043c979c..cc7045dc26e6b 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, core->sdw, drv->function);
+	ret = sdca_parse_function(dev, drv->function);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
index b5ca98283a889..54604872ae0d8 100644
--- a/sound/soc/sdca/sdca_function_device.c
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -32,7 +32,8 @@ static void sdca_dev_release(struct device *dev)
 
 /* alloc, init and add link devices */
 static struct sdca_dev *sdca_dev_register(struct device *parent,
-					  struct sdca_function_desc *function_desc)
+					  struct sdca_function_desc *function_desc,
+					  struct acpi_table_swft *swft)
 {
 	struct sdca_dev *sdev;
 	struct auxiliary_device *auxdev;
@@ -50,6 +51,7 @@ static struct sdca_dev *sdca_dev_register(struct device *parent,
 	auxdev->dev.release = sdca_dev_release;
 
 	sdev->function.desc = function_desc;
+	sdev->function.fdl_data.swft = swft;
 
 	rc = ida_alloc(&sdca_function_ida, GFP_KERNEL);
 	if (rc < 0) {
@@ -99,7 +101,8 @@ int sdca_dev_register_functions(struct sdw_slave *slave)
 		struct sdca_dev *func_dev;
 
 		func_dev = sdca_dev_register(&slave->dev,
-					     &sdca_data->function[i]);
+					     &sdca_data->function[i],
+					     sdca_data->swft);
 		if (IS_ERR(func_dev)) {
 			ret = PTR_ERR(func_dev);
 			/*
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 1196cc09389ae..e01d91eb3cc81 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2072,8 +2072,7 @@ static int find_sdca_clusters(struct device *dev,
 	return 0;
 }
 
-static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
-			      struct fwnode_handle *function_node,
+static int find_sdca_filesets(struct device *dev, struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
 	static const int mult_fileset = 3;
@@ -2155,7 +2154,6 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 		set->files = files;
 	}
 
-	function->fdl_data.swft = sdw->sdca_data.swft;
 	function->fdl_data.num_sets = num_sets;
 	function->fdl_data.sets = sets;
 
@@ -2210,13 +2208,11 @@ static int find_sdca_hid(struct device *dev, struct fwnode_handle *function_node
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
- * @sdw: SoundWire slave device to be processed.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
-int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_data *function)
+int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
 {
 	struct fwnode_handle *node = function->desc->node;
 	u32 tmp;
@@ -2254,7 +2250,7 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (ret < 0)
 		return ret;
 
-	ret = find_sdca_filesets(dev, sdw, node, function);
+	ret = find_sdca_filesets(dev, node, function);
 	if (ret)
 		return ret;
 
-- 
2.47.3

