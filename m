Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4B364028;
	Fri, 30 Jan 2026 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794453; cv=fail; b=ar4rdQwLOIbDGQkQrXoDvpEVZmhKZUToHji3+wvK+2/UuOg1YneZgDbBX9/KODMutz24beIG07p4ZcVVTVw4y51lW/wMV8aGszmBHls1N2qTmE+Nr3WscysWFOulBD0K0GnKZ5yszpN/nkxMdRu5sxBF7xabZ8Cyb238eur/F4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794453; c=relaxed/simple;
	bh=y25zeRtIGHbVAf9S92AGUPz6XCmb2buqppEywzq/9eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uh1H4wJ8kejPqMQGj3YeZkF50qjeqia1IQLRlsBIVjH/2n0O3auiegiA578NnUSYinVRskQSNe4VNAXihHtYo28yaLravZiWRfwSMho/AXGOX/6AyBGu6cY/yYmhUehb9b1BHbl0GeqS/Wi5LU6Exdkeg0uI7vvJrXk5ZDlTwBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KMEPEjVY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KCzGqSz/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KMEPEjVY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KCzGqSz/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7F7Ls1138250;
	Fri, 30 Jan 2026 11:13:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=xOKZIVnFWTj0h+zk
	+ceU1Qd3yZ5H2G4IkAgC6MjOK9A=; b=KMEPEjVY08uAdDNwBs5cWcl42feW29uM
	5cwE7RdUibhP9msAsfx3erGA+qoJ1AA5xSTvt3COVsz0A+lhz6HHtawC871DEIhF
	VTCB+MPPpN7P/m2a2H+0GCzrHN9Bc9DmeuvIR4rTX+IVMloHEZNziHp9ayf3Eg2q
	sN/LV5w7NV74k11ce0T/l5+EG7sM75660PnNsVqEZaQPNwEDIKRM6XI0REnYlTPV
	9Z+NovW9UbJK8hvXodTowN4mPD8tJ4BH+fdVfR7rXssjiZnpJH1VsTUW3dxHY693
	msQ3MgVH7InNRALpt0H35oVYxsv4V/QKrv+XrUaC4zgNa4kWueFGIg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020139.outbound.protection.outlook.com [52.101.201.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c09us9d8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 11:13:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTI8QG20P1LaHyuInA6dKCqG11HzaGMtMPdGeayIY/6HFqr6JskeoNygOXOvEzZLOkIkg+EWFZgtWb+NrowU7z8HQFqD8SMYp6pJ44o+zn/49ZzQhyhS93EmSjFz0fIvqeMSSqu0rgxZZFE+NomHkH+V6kHHRiEC8QwXtv4Nxp7MUoM7WJB4NX6CZ0X9oQ2FcHtE9dE4kTAD+JgeokDEZgHA4smiXkmuvOewfwMN22KnwPU6Qsrd0T4pKAV9d/Dp4DzrYCQale84c+smbz4brS9PBMsYuJ0xY5W/Yv+23C0+H10UmtGEqzGeDNwv5F+X/kXEQqEiWJLs2N8tctHSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOKZIVnFWTj0h+zk+ceU1Qd3yZ5H2G4IkAgC6MjOK9A=;
 b=E6khSC2/J3kQWmPeLiCxEDYUKMdMLYIx0Z7i1m+9+kxlNYu7FdcYvC0rCogQYUCbR/8+iORMC+SB0Sk9/QlVUm1bwyzMutx53u3Az/edympicbScYr5VSH4XmtvFR1KICPOC/GU/4zFvlLpJlQXph3fV7nnWG96+kJOqdF7s0URz+X8lABV6hafIw2YGkF0Z6kXQZ2bCfs6uLvXP/IdkrLyPAXtyx2IwGoYvU7ke4wbGgVBGDCjo062vrVjYxJFDNspNrwYbNjoVHTCKV0hAXoC7Qz1g+krgjJBmrc5Twx4Iqnlq3d47sy7T7pJYt4BGW1iYD49OjChS6qr2RoJ0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOKZIVnFWTj0h+zk+ceU1Qd3yZ5H2G4IkAgC6MjOK9A=;
 b=KCzGqSz/vnPssQnceDHg4ffglJ2fGsSbjVJKYywTYbRY1cBYTLOUlQimOKfLIMbC6fyhegvXWS6gvDefHM8i5upK1mzx8kbUoAha0Fpy7EtVM+929qOYos5RXrVIv3KXK+fp2oGLKcFvH8TWdJ9ZXu7S6JmDZEnIk2H4S2uACUE=
Received: from BYAPR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:c0::46)
 by CH2PR19MB8996.namprd19.prod.outlook.com (2603:10b6:610:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Fri, 30 Jan
 2026 17:12:59 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::db) by BYAPR05CA0033.outlook.office365.com
 (2603:10b6:a03:c0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.4 via Frontend Transport; Fri,
 30 Jan 2026 17:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 30 Jan 2026 17:12:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A201C406542;
	Fri, 30 Jan 2026 17:12:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 86597820259;
	Fri, 30 Jan 2026 17:12:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: rate-limit log messages in KUnit builds
Date: Fri, 30 Jan 2026 17:12:56 +0000
Message-ID: <20260130171256.863152-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|CH2PR19MB8996:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e96392e-93fd-4f13-1aaf-08de6022d0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013|13003099007|54012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qtMpnMrmvzScT40TTdyF8EsAZ5hgyEvJUInH6s6gU1twZ9FpTyn2TEeLFbX4?=
 =?us-ascii?Q?O/no1T1EdjOTQkwUGv1jGZxhcAGPooqmKx+DQZNbgSYWfu7uw+OEln9U25IC?=
 =?us-ascii?Q?HkUmceeTJTfBrcPoUCrPUncAg42LzhUQdBO7q77DJzMd+fcVEuqKFtLld60v?=
 =?us-ascii?Q?hbPLcr9AKj816wE07aTgUJL/VYlphHXKga82Gew+bDFTTYBqjXHQrmmuFn/E?=
 =?us-ascii?Q?26sriWKtLvMIPEyUIX1syCLDQDP11RCHzRoo+eWZvugSEUExrgXsMGtOtBWQ?=
 =?us-ascii?Q?TSTAF1S3b294OS3HrAQQKDQ0bWya6y+nHQxbvssNT1CQr1UDg/8pGe/lsy0z?=
 =?us-ascii?Q?iklH1vVJSRCMoibNaRKy8Sn38uzKN9wrSLzVfjKiv72pW0/gbF+TMG96uvyy?=
 =?us-ascii?Q?5Ztrn7ckiYqSOyR5BU33x4XEHeIehO2U+4PBYiDixFn6yYRE8/0oQ7ATLemx?=
 =?us-ascii?Q?wlOGtEn1qx5gvPViArqXN+4sCwsgqb7DeEv5qoyIrCfEKHHZqAn/I0oRYeCI?=
 =?us-ascii?Q?TkcKPqSug03FhOY26T8LnkFisIu51Ctp0SOjQBQOV26Fn9DhITu2UgUL7v/+?=
 =?us-ascii?Q?29/3KcxuSJvh14i8wnWnJjwZs0WgY9oDR511r74phhptI7ySVw85INYfvA04?=
 =?us-ascii?Q?CNodo6GFnB9XFC/6m/1q4mNdtQCYSljJBmzHYZ9zUQCKqqWwFEe6USMF1tq+?=
 =?us-ascii?Q?UAWjl4b2q83+kVIEZFyU2u2G+a5fhru5PgmgRSrV2ajCf8bf0iXde187EBus?=
 =?us-ascii?Q?9tO4OWt0GfEBmw+QMN0lYU+MQOjE5nn1xfgLNPz4mzvf1qB4T3Gr5U+ynREA?=
 =?us-ascii?Q?2kruq8jUEAxPbBIAEpafzMQvUXsvy2CuQeqkIuBa6qlZd9DkdBurpVRT0eUG?=
 =?us-ascii?Q?AnUeaWLf1oqo0rafwbZYaOVh29G9EMP3LzW8IaLBsM9TIgE1h3LPwHKaoZ6+?=
 =?us-ascii?Q?yeQmHWjWg/FsdVVPHEqz9+amj40ZweIdkEBrEkUBF/mnBX+mj/+BOcb4h86Z?=
 =?us-ascii?Q?IGESdwUa2ptgWfbkiZOLj0GfjM0vHqzPBbfCtAsyXw6ToJ3dC/7w+VXcVYOk?=
 =?us-ascii?Q?Wo8B9+4o8s0MMhnwatVKaheByP8zzb3qu5ek7cv0yr2virHezmeibhTe2leJ?=
 =?us-ascii?Q?Nnqnmq7MJAOdoBVMhjaKR/GJYXf4JC14uzC8+rURX3hmGnoRdzWrN61SIlbG?=
 =?us-ascii?Q?Ci4gAYf3JyNyI3aS2ZDx9+5klggiFlcrf00vKBXx0WvHT8ceJKglRR730epn?=
 =?us-ascii?Q?5kJTLAz04w/Ug4US9On2QQjjDMmTuBvNwKXDtUBpTBpObTScre3wilA7FtI1?=
 =?us-ascii?Q?EjhEg88F5MDJMpPreJMb7O90VbD2zvTe7lJE/p5KP+4Ermk14vGq+xGVnAVw?=
 =?us-ascii?Q?NIyI+UZSiO2LWydbKGWPacKVg5R2/trqNxP5OtaVMgWb73WbqcHBbg/6oWFU?=
 =?us-ascii?Q?4fVjv1bpjh3Z7HQvztRkjUJqQvmRdJNmV+2J/5y9ckJDXfRYsKpQEbUBZeFF?=
 =?us-ascii?Q?OB1yw1ouIz1+iT7mE/9eskI+ii+toHx+PtBYXJHhvh6V/jHyPOMYm5LPhj5n?=
 =?us-ascii?Q?S5vYE42Vk8ikrTVvS4WCQzifFTL/R4MRiWnnmySI5wZyIQH2EmPq1rfCPLv7?=
 =?us-ascii?Q?AMIldTMxWUn/Y+xG2aVrTWTwH3W+VNWXnugdapcQfUQ4D9iLlmi85sK8rXUX?=
 =?us-ascii?Q?ZILuuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013)(13003099007)(54012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lzw2dkXYznBM+5yEHe7bhbkWfvhsA7scxAxv7b8iQyJodwcWBvFrs5fVboYcGTTokOp9tSQRN+Jk/3jVu2f1vZYZKlR9Jg0EkSXNt54wogmLuyMv9E3noxryc/zC6uvG+vuKt5fDvjxdAJUovBi9h/UTmVvSLKA6IlGXruv0dn/s2gNQtEA5mdXGncPAVK0uX+T21OPJ2xsNGWQXJFqfP1foXRjk9UD+PAcMj4KfV+OM3+74ne0NZRGTJyUpg3bz0LJMyGS67r9ij+toS7jr1XwDuof1y7C9iNrstVi0QECZQ39XF4dERXTZH2UksftuZm4tbXMDa5NORWTvLaRvEsQIp3LTT9B+SkRiHJOkx/SoSxsI2f/Ps+DDEwhLyPiNy7G9afQbbDOxQ6z0nqdm/yni0IK9aF711Kvspd7AaMLP1bpz30fvL6lY/O95XfUW
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:12:57.9884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e96392e-93fd-4f13-1aaf-08de6022d0e7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8996
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=697ce6a2 cx=c_pps
 a=m5u7UkoT2y3MSdrnBkr6Vg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=Y1tawWs7rD32VVj3kSUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE0MSBTYWx0ZWRfX+VcmZEtNzlzf
 OZQdcTLldy/qsjlyWXwztCE7UtnzTwPaTy0tj595cN3f/DtTDRFwtYwIjBo+HHveB7VyLB2pUGR
 U8xBQgueVvqpBvHFs0+rqbYUmu/hwGvViT0OV0wQwohnE9NeKsgweT6mhcgdCR1Bw0Hh8eGOKlt
 kZ9BwdLICVDmNovamKpxmjTUkwt1MetFbDhI+e/GzIUiFwOlL9wNVe6sONyo6FVIz26cjj1iyj/
 GfszE1mAo9YhmXh32DZDpkaUM0qIf06t9KNUl8cVYqV693zPg42EKo5RfzAj1lgq57kME7PRdNz
 mPRdVRkLk3aFxET8eo7jT0x1cBQFmQ+whs0Vz8nlQxIOaTJ60MOb+6RHYkDilSt8If1FBYBZELJ
 8jcx21zz2jY7Xvyhs1CB/oMoYK0sIXO1nEou5CfxkA0lhyu/MW1wjg9WZyQD3Yb8DCu9O5R8r4Z
 3I83+NPPSKcbcKOdCEg==
X-Proofpoint-ORIG-GUID: V00l3_UWyOuf1Uj6nMCgaEL6sxG4_PLQ
X-Proofpoint-GUID: V00l3_UWyOuf1Uj6nMCgaEL6sxG4_PLQ
X-Proofpoint-Spam-Reason: safe

Use the dev_*_ratelimit() macros if the cs_dsp KUnit tests are enabled
in the build, and allow the KUnit tests to disable message output.

Some of the KUnit tests cause a very large number of log messages from
cs_dsp, because the tests perform many different test cases. This could
cause some lines to be dropped from the kernel log. Dropped lines can
prevent the KUnit wrappers from parsing the ktap output in the dmesg log.

The KUnit builds of cs_dsp export three bools that the KUnit tests can
use to entirely disable log output of err, warn and info messages. Some
tests have been updated to use this, replacing the previous fudge of a
usleep() in the exit handler of each test. We don't necessarily want to
disable all log messages if they aren't expected to be excessive,
so the rate-limiting allows leaving some logging enabled.

The rate-limited macros are not used in normal builds because it is not
appropriate to rate-limit every message. That could cause important
messages to be dropped, and there wouldn't be such a high rate of
messages in normal operation.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-sound/af393f08-facb-4c44-a054-1f61254803ec@opensource.cirrus.com/T/#t
Fixes: cd8c058499b6 ("firmware: cs_dsp: Add KUnit testing of bin error cases")
---
 drivers/firmware/cirrus/cs_dsp.c              | 37 +++++++++++++++++++
 drivers/firmware/cirrus/cs_dsp.h              | 18 +++++++++
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 22 ++++++++++-
 .../cirrus/test/cs_dsp_test_bin_error.c       | 24 +++++++++---
 .../firmware/cirrus/test/cs_dsp_test_wmfw.c   | 26 ++++++++++++-
 .../cirrus/test/cs_dsp_test_wmfw_error.c      | 24 +++++++++---
 drivers/firmware/cirrus/test/cs_dsp_tests.c   |  1 +
 7 files changed, 138 insertions(+), 14 deletions(-)
 create mode 100644 drivers/firmware/cirrus/cs_dsp.h

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index aa6e740f9cd7..9fdb50f3fec6 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -9,6 +9,7 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <kunit/visibility.h>
 #include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
@@ -24,6 +25,41 @@
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/firmware/cirrus/wmfw.h>
 
+#include "cs_dsp.h"
+
+/*
+ * When the KUnit test is running the error-case tests will cause a lot
+ * of messages. Rate-limit to prevent overflowing the kernel log buffer
+ * during KUnit test runs.
+ */
+#if IS_ENABLED(CONFIG_FW_CS_DSP_KUNIT_TEST)
+bool cs_dsp_suppress_err_messages;
+EXPORT_SYMBOL_IF_KUNIT(cs_dsp_suppress_err_messages);
+
+bool cs_dsp_suppress_warn_messages;
+EXPORT_SYMBOL_IF_KUNIT(cs_dsp_suppress_warn_messages);
+
+bool cs_dsp_suppress_info_messages;
+EXPORT_SYMBOL_IF_KUNIT(cs_dsp_suppress_info_messages);
+
+#define cs_dsp_err(_dsp, fmt, ...) \
+	do { \
+		if (!cs_dsp_suppress_err_messages) \
+			dev_err_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+	} while (false)
+#define cs_dsp_warn(_dsp, fmt, ...) \
+	do { \
+		if (!cs_dsp_suppress_warn_messages) \
+			dev_warn_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+	} while (false)
+#define cs_dsp_info(_dsp, fmt, ...) \
+	do { \
+		if (!cs_dsp_suppress_info_messages) \
+			dev_info_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+	} while (false)
+#define cs_dsp_dbg(_dsp, fmt, ...) \
+	dev_dbg_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
+#else
 #define cs_dsp_err(_dsp, fmt, ...) \
 	dev_err(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
 #define cs_dsp_warn(_dsp, fmt, ...) \
@@ -32,6 +68,7 @@
 	dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
 #define cs_dsp_dbg(_dsp, fmt, ...) \
 	dev_dbg(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
+#endif
 
 #define ADSP1_CONTROL_1                   0x00
 #define ADSP1_CONTROL_2                   0x02
diff --git a/drivers/firmware/cirrus/cs_dsp.h b/drivers/firmware/cirrus/cs_dsp.h
new file mode 100644
index 000000000000..adf543004aea
--- /dev/null
+++ b/drivers/firmware/cirrus/cs_dsp.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * cs_dsp.h  --  Private header for cs_dsp driver.
+ *
+ * Copyright (C) 2026 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef FW_CS_DSP_H
+#define FW_CS_DSP_H
+
+#if IS_ENABLED(CONFIG_KUNIT)
+extern bool cs_dsp_suppress_err_messages;
+extern bool cs_dsp_suppress_warn_messages;
+extern bool cs_dsp_suppress_info_messages;
+#endif
+
+#endif /* ifndef FW_CS_DSP_H */
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 99148ea22df3..66140caeebb5 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -17,6 +17,8 @@
 #include <linux/random.h>
 #include <linux/regmap.h>
 
+#include "../cs_dsp.h"
+
 /*
  * Test method is:
  *
@@ -2229,7 +2231,22 @@ static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp,
 		return ret;
 
 	/* Automatically call cs_dsp_remove() when test case ends */
-	return kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	ret = kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	if (ret)
+		return ret;
+
+	/*
+	 * The large number of test cases will cause an unusually large amount
+	 * of dev_info() messages from cs_dsp, so suppress these.
+	 */
+	cs_dsp_suppress_info_messages = true;
+
+	return 0;
+}
+
+static void cs_dsp_bin_test_exit(struct kunit *test)
+{
+	cs_dsp_suppress_info_messages = false;
 }
 
 static int cs_dsp_bin_test_halo_init_common(struct kunit *test, int wmdr_ver)
@@ -2816,6 +2833,7 @@ static struct kunit_case cs_dsp_bin_test_cases_adsp2[] = {
 static struct kunit_suite cs_dsp_bin_test_halo = {
 	.name = "cs_dsp_bin_halo",
 	.init = cs_dsp_bin_test_halo_init,
+	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_halo,
 };
 
@@ -2828,12 +2846,14 @@ static struct kunit_suite cs_dsp_bin_test_halo_wmdr3 = {
 static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
 	.name = "cs_dsp_bin_adsp2_32bit",
 	.init = cs_dsp_bin_test_adsp2_32bit_init,
+	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_adsp2,
 };
 
 static struct kunit_suite cs_dsp_bin_test_adsp2_16bit = {
 	.name = "cs_dsp_bin_adsp2_16bit",
 	.init = cs_dsp_bin_test_adsp2_16bit_init,
+	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_adsp2,
 };
 
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
index fe0112dc3077..9b2763b36970 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
@@ -18,6 +18,8 @@
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 
+#include "../cs_dsp.h"
+
 KUNIT_DEFINE_ACTION_WRAPPER(_put_device_wrapper, put_device, struct device *);
 KUNIT_DEFINE_ACTION_WRAPPER(_cs_dsp_remove_wrapper, cs_dsp_remove, struct cs_dsp *);
 
@@ -380,11 +382,9 @@ static void bin_block_payload_len_garbage(struct kunit *test)
 
 static void cs_dsp_bin_err_test_exit(struct kunit *test)
 {
-	/*
-	 * Testing error conditions can produce a lot of log output
-	 * from cs_dsp error messages, so rate limit the test cases.
-	 */
-	usleep_range(200, 500);
+	cs_dsp_suppress_err_messages = false;
+	cs_dsp_suppress_warn_messages = false;
+	cs_dsp_suppress_info_messages = false;
 }
 
 static int cs_dsp_bin_err_test_common_init(struct kunit *test, struct cs_dsp *dsp,
@@ -474,7 +474,19 @@ static int cs_dsp_bin_err_test_common_init(struct kunit *test, struct cs_dsp *ds
 		return ret;
 
 	/* Automatically call cs_dsp_remove() when test case ends */
-	return kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	ret = kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	if (ret)
+		return ret;
+
+	/*
+	 * Testing error conditions can produce a lot of log output
+	 * from cs_dsp error messages, so suppress messages.
+	 */
+	cs_dsp_suppress_err_messages = true;
+	cs_dsp_suppress_warn_messages = true;
+	cs_dsp_suppress_info_messages = true;
+
+	return 0;
 }
 
 static int cs_dsp_bin_err_test_halo_init(struct kunit *test)
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
index 9e997c4ee2d6..f02cb6cf7638 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
@@ -18,6 +18,8 @@
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 
+#include "../cs_dsp.h"
+
 /*
  * Test method is:
  *
@@ -1853,7 +1855,22 @@ static int cs_dsp_wmfw_test_common_init(struct kunit *test, struct cs_dsp *dsp,
 		return ret;
 
 	/* Automatically call cs_dsp_remove() when test case ends */
-	return kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	ret = kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	if (ret)
+		return ret;
+
+	/*
+	 * The large number of test cases will cause an unusually large amount
+	 * of dev_info() messages from cs_dsp, so suppress these.
+	 */
+	cs_dsp_suppress_info_messages = true;
+
+	return 0;
+}
+
+static void cs_dsp_wmfw_test_exit(struct kunit *test)
+{
+	cs_dsp_suppress_info_messages = false;
 }
 
 static int cs_dsp_wmfw_test_halo_init(struct kunit *test)
@@ -2163,42 +2180,49 @@ static struct kunit_case cs_dsp_wmfw_test_cases_adsp2[] = {
 static struct kunit_suite cs_dsp_wmfw_test_halo = {
 	.name = "cs_dsp_wmfwV3_halo",
 	.init = cs_dsp_wmfw_test_halo_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_halo,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw0 = {
 	.name = "cs_dsp_wmfwV0_adsp2_32bit",
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw0_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw1 = {
 	.name = "cs_dsp_wmfwV1_adsp2_32bit",
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw1_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw2 = {
 	.name = "cs_dsp_wmfwV2_adsp2_32bit",
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw2_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw0 = {
 	.name = "cs_dsp_wmfwV0_adsp2_16bit",
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw0_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw1 = {
 	.name = "cs_dsp_wmfwV1_adsp2_16bit",
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw1_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw2 = {
 	.name = "cs_dsp_wmfwV2_adsp2_16bit",
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw2_init,
+	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 };
 
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
index c309843261d7..37162d12e2fa 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
@@ -18,6 +18,8 @@
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 
+#include "../cs_dsp.h"
+
 KUNIT_DEFINE_ACTION_WRAPPER(_put_device_wrapper, put_device, struct device *);
 KUNIT_DEFINE_ACTION_WRAPPER(_cs_dsp_remove_wrapper, cs_dsp_remove, struct cs_dsp *);
 
@@ -989,11 +991,9 @@ static void wmfw_v2_coeff_description_exceeds_block(struct kunit *test)
 
 static void cs_dsp_wmfw_err_test_exit(struct kunit *test)
 {
-	/*
-	 * Testing error conditions can produce a lot of log output
-	 * from cs_dsp error messages, so rate limit the test cases.
-	 */
-	usleep_range(200, 500);
+	cs_dsp_suppress_err_messages = false;
+	cs_dsp_suppress_warn_messages = false;
+	cs_dsp_suppress_info_messages = false;
 }
 
 static int cs_dsp_wmfw_err_test_common_init(struct kunit *test, struct cs_dsp *dsp,
@@ -1072,7 +1072,19 @@ static int cs_dsp_wmfw_err_test_common_init(struct kunit *test, struct cs_dsp *d
 		return ret;
 
 	/* Automatically call cs_dsp_remove() when test case ends */
-	return kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	ret = kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
+	if (ret)
+		return ret;
+
+	/*
+	 * Testing error conditions can produce a lot of log output
+	 * from cs_dsp error messages, so suppress messages.
+	 */
+	cs_dsp_suppress_err_messages = true;
+	cs_dsp_suppress_warn_messages = true;
+	cs_dsp_suppress_info_messages = true;
+
+	return 0;
 }
 
 static int cs_dsp_wmfw_err_test_halo_init(struct kunit *test)
diff --git a/drivers/firmware/cirrus/test/cs_dsp_tests.c b/drivers/firmware/cirrus/test/cs_dsp_tests.c
index 7b829a03ca52..288675fdbdc5 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_tests.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_tests.c
@@ -12,3 +12,4 @@ MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("FW_CS_DSP");
 MODULE_IMPORT_NS("FW_CS_DSP_KUNIT_TEST_UTILS");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
-- 
2.47.3

