Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB2436BEF;
	Wed, 15 Jul 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116915; cv=fail; b=UyEOSLLq3RU6L9kn4HAfocgkmUH4VkapDUGHUd9Y3QBTVqFXNba0jcVV4dnrpkolnGjCWu4URXxPtN2LnqP3rEuJYyUaA36X0YQedMIj+vOVUtkBemvhVl00oxGXArwIufICsh9MkF5/RIo8gACSAe9fQY+H/1ne6+S29EYrNLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116915; c=relaxed/simple;
	bh=1I1JQkK6xTR2QlnjjuOtSwU5d9Wmxt9wsH+dKC9uo9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h+/ltQFY392a3sQfvdoad0gZDZcPODSIEFfu+2Km9m8QuTXXzQNC5VZhNVkxGIIwfB4UXV7/9uBqnjAMhVQcvIWj+msAETmVqruRL2S1fFbyOZiHmVn3BziKXaXcbHjxMSNcaD75DFKaqqZjvTFZLrf24p3hVqf6xU/SbCl50oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EUdJLvif; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K/1FrWBo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EUdJLvif";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K/1FrWBo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4PWJm275548;
	Wed, 15 Jul 2026 07:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=T9dS3lRhtP+Yqvyi
	FqIAE5/0H/B2iwy5NVjQoS/VQQM=; b=EUdJLvif16VXxI+Rxja83PjimgPNEtih
	OBpYQaSu+e6P4npYHupNa0z7m3SZLrv5kuYzIAcgpjq29RVcD33DUGE5uK1cgouD
	VVKOWV7kR11VN3nxxNz2aJl4IviCVs1dGzDx8N4WfUwcqG+FHcXFIOxfp5WQuNeg
	StSQm/C3EqPfYg2UANxBAkC2Q/nucw7OwSTZHYAsrv2gT9WKhH9BsTZlVb7mxsS/
	tOO0L+E+KUcBYhJse3O3kO+6/Kw92ohmuDf05zyz2s2+Wb4A6aRRqm9G9JdJ/szc
	LayKCD4q8FYxtCC+WGLcVAHZfkjVLDgCPdHPne8JzEbbRUdbQQ4++A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021085.outbound.protection.outlook.com [52.101.62.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vw9sm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 07:01:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQap0mhGW/cvEIKkRPZNRCn5kJ2OwfzByOPZn75MgcDsZ5zz5AZx5+aV1MrL29r292AQWeJCvPthCvAnPe6+O0ih+muHJmccOj1H9dQ+DO3+xnYV7r6GlV8cpaP9k3xQgoLZNLb3Uo/WlaVYClITlhPxa5ej6haHVbCJ5YXb/uDDGG8J9HkqKp/cIrH5PybpOiYUI6y3r4i+eyJzlKaBdjNSzohDQwRDZKQ0gugQP+vALEgdPnBB5+q8TzTewzbAHiprLAazslzj29Ga6LfCKeV10GxfOZXGil5aT+FRypELmAW3Pp/FwU9ZzytCOV2oVpNtDlhPLZBJUmX+E9uNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9dS3lRhtP+YqvyiFqIAE5/0H/B2iwy5NVjQoS/VQQM=;
 b=kK6OVcsCc1jByOwAs6ArW1ruM92//9jcRBh0jbOoidzYZSXtXX/uwIwccPWRahfmQQDcSXdvvFlIlewCvZ6EuiAZTcPjsqNoU8DRnJex8GTa+/m49xYBUDeGBNvZnzGNvBW6kCUyoVrrSitDji7DE0hz2JQ/iMe1PaHS+otxgB8p6RhdvvdTaKsDfA6X6IV6dtxziQtBGGwEaozRxEv2OxbfcgxElc3dpZmJIDtk9Tu6J2HYKKsWTdc0Zu+lXvEIMddTH1hrAzmVDWTcyVaZSsVicNjE6t4VTYCsVEtZj978ARbQwS75wgOoGhavnLG7+hyNQl3YaJi7zvnqXmcIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9dS3lRhtP+YqvyiFqIAE5/0H/B2iwy5NVjQoS/VQQM=;
 b=K/1FrWBoJ4tMeKRBFNU2kkChCZQqM2RnWwa2UrbyVGKpSTPUn1xCLobNI8JI9yq5knr76QM+SFYPBV/3xVKqLnRSgSTYeGBdWQw3PG2GKerWA2qKAGhdGk8L+7Kv2Ux26Tv77Heckbd2C8MwX9lFKbZ8oQgIWsyAV6NX5HkUmK0=
Received: from BLAP220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::34)
 by DS4PR19MB9001.namprd19.prod.outlook.com (2603:10b6:8:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:01:37 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:32c:cafe::7c) by BLAP220CA0029.outlook.office365.com
 (2603:10b6:208:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Wed, 15
 Jul 2026 12:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.3
 via Frontend Transport; Wed, 15 Jul 2026 12:01:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52AC6406541;
	Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 35B7B820244;
	Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Add support for CS35L62
Date: Wed, 15 Jul 2026 13:01:32 +0100
Message-ID: <20260715120135.939280-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|DS4PR19MB9001:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89f5d804-c06c-4e5d-340b-08dee268d234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|61400799027|376014|10067099003|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WCtNcA8kh1GI26009NOB8nZk034nCpk0l6coAYfMEcy4EarxwAhjPWrzvOzl6TKRwzRJZfB/K+RABSWMzsUcOTLLWfdp2y9P7aDbaZHrmSKfctIy/e006iQEmAYiZBNmlXb8HBktdjEv1cxhzyNNEdfNfjSS5jc+tAqj7axoU5eTWJC7D+XN1IoY87mEvlbBGXs5eEmBu4bMaA87aVpybxtmSmvklQL4qJKAIl28uycjzaFWIHqdze/jw2TbxP8VaFyXC7LCs4mNFxlgsCOThvfGYMa/MTDodg7aTU1dCOTkxnXiHOs6DOg7lI2mMMw3tknFb94TSfG7zCsv6IRTGg7VqC7a86NhxTS8GEB5xbpJMTdXwlTauCAaNHkb9jDaMaGN9hro9ZZMWWeTf6w1rZvVcmGLgP1eaivjWU2FLYT702+ZjTNiKiMSh9Zfd8cOaMbA8/XlAQs2+MUl8go0saHb6GkWgY70cp9D5GgyeRUD0RmAOMaC0Azqu7vG0IhDFWp5pKePcUxAhOthoiC3PhYSHHqucXDCx3Lh59qdxeWZLpLHBA0KYYTavs0jp3BAg3HNU4fQC8eM7cxHEO4JEyLZYORJzq6OSK81hJ64K4jSy5llgX6txsVoNcUUduLJXjPx10nijTmdYMNZXumyX66SyP33chZAax0ndV5ouO4ZfEREOdmDzxc0WrHdHMjbZTjiAPvTuY4mxl4o3kSUbA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(61400799027)(376014)(10067099003)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D1xsanl4l+iKs0NOatcmeLUxm7oClPfmMJL0A/36rrDN65dg8EkbIqjQMg9nkvlRR6hpC4vGhTretGtPu5K8v8trAktLokRAbZyriO3APhTPtJDp3s4PDxeVH/ZiQO/VtmafclZpigtYBMUV9xcPCH8IQFDVAWm/QxqEZdQie6weYFh1ALD9xYz8OaVhzOOnv0rYoJb8g5Nq9sRPprbCXKQSaJKfjYqkIKmjUCGC46YdzJSuSDrAY37Pk0Ops1mEH0151xgMSLFsrf9lI0X8shmknqDDFQPxUbYm8BfaCI7cugB3dLOhTJoolFkHHF6jbfnDuOWnO81uJWvS5ThH47MLCEmOID3aR6UU5U/xaSf3msIBHpiwL7ChVz9QkGwep+hdDcLlMcM2BKbIaxk9dpIeDLvL8g6pmP7304eIccP3qVGqDorjveA/lkimG7rS
X-Exchange-RoutingPolicyChecked:
	jnh4IS0153Nr2PgbYtPoXjaR7IrcusubE+b+NemAldsDTOc6X+zf/ssRMMHP8f3TTjzVsLDg0wMYQn4kJyQeBR7OhN4IIsyU9ahe1Nm72IwPSbWcazhRtofO3gXE96sYoVMz4rwMW2pXnJ6dKd9lp7DRPmLgC/vn7p2ooxb+q06MIjY7E3Zz42CvXDQ9TXRmIseolxc2kTQNcj8mFMbgx6WILrOihYpQxlRRrhkvsBOgfa4atkFBbVn52Z0JGey8q+j9XhKA57pgduf0mJghwPjTMSaVBXGkde4ychVu+dFCvyQqr8/5AFlOLjF63xv4P3VvdXRo3DRTJkjRl9wX+Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:01:36.2171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f5d804-c06c-4e5d-340b-08dee268d234
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9001
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a5776a4 cx=c_pps
 a=1gZ91TOCrEl79GUrRCoc9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=D9UKXhr1Jt04MVbGNOcA:9
X-Proofpoint-ORIG-GUID: 8Z-0ROPYy0wtrYlr2jYHAwoHxCZfi_fG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX0fWZ9JCdBE2c
 c9DvX2CoK80YdFWZ+20KYqWxw3gOQVKSHq+BfLQe9HA3/FBeTYOhVgRTMnbvFc8l2RQ5JDEziWl
 1WtTUN9UXndW01EU18iIw4DuFcC5C30=
X-Proofpoint-GUID: 8Z-0ROPYy0wtrYlr2jYHAwoHxCZfi_fG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX38goPFITd8IJ
 ai/j1y2pSJWk6KwyDa7KeXb5P19cBTXF4Me6bnHCzJcdlbdROaZ4DClF/Wq9PtygZAeeiQVNL7G
 OtotsPBlqobn9c1TsTnqmJJDXK+JBLpjfdihbUckd110R6pRE1jprzAs3OWqM9AyY4K0DRGW1Hf
 +6nNV5ahp/S93mTaGSX70/ELznw3OGAfrZqIRS7weKpHYQ2fRyByt9rUk7+1y2RiYnvnpGdirmV
 4dVjgS99JRaCXUg6KcYL77qDmN39e9/hEOrtraHE9Smya02mH0h/KHPP7buFyNG7IhK5R2S8Ilr
 SssOGxmiUj6HBTc0oroMgtuXyD41XplihxgQmJt1cDEaF5SVAjVE/qgS2mxTp3uAYx4Vl04z4ME
 t8bmQR3xlqq78eCmzkJOU4CEv0HVD90HuTaAQX5amC+pSnwIROlvHTFY7GBwrnKMyPSzuoCA3hV
 LIYUy04RCQqt0+eUOaA==
X-Proofpoint-Spam-Reason: safe

The Cirrus Logic CS35L62 amp is similar to the CS35L63 and can be
supported by adding the chip IDs into the cs35l56 driver. It must
also be added to the codec table in sdw_utils.

Stefan Binding (2):
  ASoC: cs35l56: Add support for CS35L62 for SoundWire
  ASoC: sdw_utils: Add codec info for CS35L62

 sound/soc/codecs/cs35l56-sdw.c      |  2 ++
 sound/soc/codecs/cs35l56-shared.c   |  4 ++++
 sound/soc/codecs/cs35l56.c          |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 29 +++++++++++++++++++++++++++++
 4 files changed, 36 insertions(+)

-- 
2.47.3

