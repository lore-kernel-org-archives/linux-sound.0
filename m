Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC18346E4A;
	Thu, 26 Mar 2026 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519744; cv=fail; b=M4bZKkmoJvcL8J48sPsPVlQJMhLXVPYEy9KnYmGPujtHMVWonexCw0y3VQ5L/giIzXKemthKqZaQYXkTdZEG4wkNBb9uQ+kK3m2tDJ243fgV02cpIasmz0mG7p3hYvvgRzAj2kRspVKWRPF4mbyAsfue9Wn3lS4zBFagHoGmX60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519744; c=relaxed/simple;
	bh=is3gNIcfSVAimqNKfB7RpZygd+utOOvuCy9XJLshGvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XOw6IX/sn2+mkLRhyKXX79Ro7Hein6dBcqy8OjE01WCigv6+XzJ3XtKP5zkENQnaIghdDYGR3iZLJcWdK/ME7Stf8oUIq/2HQPlF1F8kGFB+aoOmcCqoUy/ulPXAlryhnaqlSYjh8VJ16qDf8vX3w4RzJLEmKvBLX9weZPhTuhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lUEMBjHn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=svkD2fPa; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lUEMBjHn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="svkD2fPa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q4qPok3456290;
	Thu, 26 Mar 2026 05:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TS7PD34Qhqpl50Gy
	i6E8TjQ8uNODdOqqw136qE77ME8=; b=lUEMBjHnSm1EQccZEcqpC4R5pf86besn
	G0Ksp2jpFHvqyrHHJQc+au2WbUldQeoPxnEbwc6xQR6MyCGxB2a8hj72Ct3gjR+7
	iSbWRK6aWyNsntW92zfw7f252h+sfyTmt2JOkKJXHzL5N6PfA8wHN12eZykEy+e9
	GC7UciNskbZCNejpRNxYwXkxy7/ChSyTe3MrrMPLMjl3TYnAXY3uCFUkvzrV+hEq
	TA6ixUsDmsS+6hpCn4spLLXVX2X47YSPeB1LgwF+ioulU8bkcsKNhDFu2oGtzOAz
	5zgqPaeCQpSpnnA+lTmrlJFF7vB1ku89OOx1tNWk5yBFXoc5JGtf/w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021137.outbound.protection.outlook.com [40.107.208.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxx9h4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 05:09:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7kqD6x60DFExRhBI00iM839pOx4R5g58SB4qf16PIx80EeSd4o5f0jtN+O/AWMG5fwsicChqJEiSn27OGGQ8qusAlr3CU4PtszE1KCJWdxyS1cKiPi59EbLaEdqwiLzeK1PdxHyqtnci0xrbF5X51QI4tTeznjbBOcZ4Ch4Vp/dIXnAwZgknIDLED5gVGyDHF+/bb3LSZDBtMRbDl682Sf6qnTzI5ppeLc97BbN9x1Aopzkx0qNKivYKsZc62j1jzrRsctUuKet5rm4NsfFeRq5CkZHDPybil7QxUYlzYK0NRWycCwycxpka3hmb68bNLt00ZRjn4gA8vgl3jbqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS7PD34Qhqpl50Gyi6E8TjQ8uNODdOqqw136qE77ME8=;
 b=ZG0+EkpNtzUDYkAzPaKbSgKe/cpcgk6sQW09Vxt2FS1m5kBLlaxRj8xFWgAG1ff7xwmQyoxKq4N+cgScbq8Nn6XjsHugDI/ZZsLuyr4qS51ZH2fHO5cA7x0YhpbLO7Afs1o79LeKj7Gvejy14D+E1D71eEhXbD6N6iCiarutynFeaCfC8P+OAg6x2dPqL6KTemOaHCk+7bkjV6GREC89dNmEggnYXZI90CQp63gZsmsffCwrypvDGVa0qe3/p9cfz6on7MCwI60DVPezV7t8BTfnN0t2VXxPF8S7dAqHrdYEDYBTeW6rJ0tb6/QA7/Y3VZvTrQK9ue07GeSmhwkihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS7PD34Qhqpl50Gyi6E8TjQ8uNODdOqqw136qE77ME8=;
 b=svkD2fPaJFQZdi2jtkXsun62KY9aaorLWeAY46yaclmt0uE+1w2UpDdt1Q5jjiotH8bNZzG+HfiwymtFLQmvUCWCmkpNuYRvYrMW838idReiv9VESinBcjRxF+RNzVq59PL0dJij4TqqzZT0lq8KAftaAJoCEbDtn2sZ8MYFDRQ=
Received: from DS2PEPF00004554.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::516) by BL3PR19MB6490.namprd19.prod.outlook.com
 (2603:10b6:208:3b5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 10:08:55 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:f:fc00::209) by DS2PEPF00004554.outlook.office365.com
 (2603:10b6:f:fc00::516) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.8 via Frontend Transport; Thu,
 26 Mar 2026 10:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via
 Frontend Transport; Thu, 26 Mar 2026 10:08:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5984140654A;
	Thu, 26 Mar 2026 10:08:53 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4869A82024A;
	Thu, 26 Mar 2026 10:08:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp_fw_find_test: Fix missing NULL terminator on file name list
Date: Thu, 26 Mar 2026 10:08:53 +0000
Message-ID: <20260326100853.1582886-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|BL3PR19MB6490:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1f5d6b7d-99a7-44f0-bcb1-08de8b1fb005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2vxxKL2Oy3zEroWJF9xpj5IUe9V5ciTn6W53TlTVE5rb41x7xORefYxOiBHHu2MsgFrZHJBl2RrD4enFjTefAJDNOu3i8/ydoM6NvOYGTQ+Ux7BmBUq7Nb0/xOdMa//fm+4ib42HkGcEeVw1AJitxWWePFgEHKW31/H9wt7e13R/eO34eXBaj5n/0h7bx9cL47GSp2qVoNueX19UUKAqcF6tKSt19jGyc857kf654nzGirBprYS2v9AxugYAi/b0b6GZeLRR9EzzdeID/VT2iA5d5iV5qxTggmJOGfpSbn+EXKdzsIhT9n5DtY0VWwTqatcD8fb/EEaIPLkl++NX57LxkVgxlBWpV8vdc92j3iNEwJhNjejVIgx1L+Ms8o013FANPedL9RYOviJtWq6F17M5L4NqIyx1y1rQ6SpFQUWViBNjRdAxBx1+VZzEF+JIEpDe/Aq76MBNxkjTy7n2bdRbYu0Iho399iCelVlClgZ2HtepueJorGpDsxKkoOfM51eZl/iJcLnraVsbDVsF+71Gftw5IiLmbiD++NlJjEZfrf0FyDtrOaFv6SCn9dTEXnhinMiDiGEji4M233tZ0fdv+4qZt0V9LHcJ1nUVDQ+8hNtOHK+ezOk069ucaKd6aIpTIc3HL19BuSrvqfOGu7g62C6/3qbH2R2sL2ExSdYziUD8yFOocLbMfq8I0W1dVhCauBhO4pds+gkbolmpNhEzzFt6fb6BF/hhmoOm0Zkjn/6pd9Vhomwlyrc/1FqsaNR6VVtqvJiQO6XV3XBicw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ufxE/u83sFLWaCbOODJyVyCSezy6qU4uj1Csq71XJsrxmVN4NRzaA5OWuXCqWu1skpLbPwdKKUpgHWBL6jq+chfkjALnIC9WTDRIMHjOgCA42/n0BCUTura/8Ggd92vM03B2u9b4GP963cntPQl7uB1CZrUtUahVaCOReOrMxCiVmVsdxg1Fsv+Zg6Mlob3iiKCZ7JSPmd6iv6DU1A47TzviEXoT26zxKvZzQB2OzffV8ENr84rBhhxFVy4OJ2uWgzFosaEUpUtsBP7FJKf1b4N5gzxLG+vbc9A2Ex5Eb85isUq41fKZfwkSyKiYq3nUs5mHT2gxr5kNsU3UCZmn9ASxxF27YIjSbA7kCjDFNwLgmwgwBrpIbOat/QtRL4/aXZbgRizSP/h3c+nwvlFMM1tFfJjhv5Jp45JGPvJTrz2aRU1z/pPF9IkJkgSchFg
X-Exchange-RoutingPolicyChecked:
	eHn2zjLzWxAb6ItBg2NaeSWI9VIa9bhk/n2eqnxymBiB15RRnRWw8P5MlrFXX5Rq0EuXl2jjdge36ucUkm4kXKW9OBI2HsHSNyIGGL+gcevoQt3PlwyhQAZwevHrl+vbDjRcA5wrzWSwyQdp69UcLSVRLl91IrDujUswHjAOeowwzioUO/hc86dMZFQzwloBAYYOdkaEmjw+Px4+wSu7/rKM5G2U3BuSZG3zNhcJofrSOZ8hZY1o3HqWFfHVMBgLAh7DIDHZTjQXEcxq3hGn0P+ZUEnytxIAIWbhDDFCivB3CF6sV8NiiX1vaGBAYIYsPcaj/1sPlJOe9i1kafQL8A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 10:08:54.4024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5d6b7d-99a7-44f0-bcb1-08de8b1fb005
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6490
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfXwKZNIuxf59h5
 GgYdaSl35DjD2SJYULWul5zH6IV9lGuc0Sc8wRW1yzd6Jk5WCvwvRladxyiuCdorgfBplBDEhub
 cnqggmhmNWL+IjoCkOnR5tF0rPtRl4S/utYsqfWkbnpRKvdyctd41vEP82KymSug0qtZssol6JY
 HtfJPrL1CGwbBdEyrPFmVwYFs4c5EyESXkk8YVD7ZnVlR0UwS5BjBWu37RjYkXvJynaBI3pX29Z
 4c9FdGhkYrerqmXbTEHwwZl/ra1Q3jotqUWwl3Ihk3Hk66wy1Lf5UXWo///XLAtKb6w1OrsQwjv
 4J0Z7Sw0CqPs23EHhk/1SNymgqyMFwR1i5MbglAIiPfnZ2jP3ERkVAM4EA3Pj/dZzqDS7LBsRcY
 WOGILVvnxv27LT7+b7EJmBtlZaCT9ukSw194WKrkWcQMcbV+J7rt1RMuqPimSt7gusU5+dlBEom
 TNkyCtTsNXxIjxGdEUA==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c505bc cx=c_pps
 a=hxVrj3tyWKw8/06b28h1JA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=ZxIa6BzyegUivqr63AcA:9
X-Proofpoint-ORIG-GUID: scNhv9FQl3jCd-HbOWvAAeyCgq8rZpO1
X-Proofpoint-GUID: scNhv9FQl3jCd-HbOWvAAeyCgq8rZpO1
X-Proofpoint-Spam-Reason: safe

The array wm_adsp_fw_find_test_dir_all_files[] needs a NULL terminator.

It was documented at line 41 that dir_files points to a NULL-terminated
array.

   /* NULL-terminated array of pointers to filenames ... <snip> */
   const char * const *dir_files;

This fixes the error reported by KASAN:

[17:46:43] BUG: KASAN: global-out-of-bounds in
  wm_adsp_fw_find_test_pick_file+0x8cc/0xc80
[17:46:43] Read of size 8 at addr ffff800081e5ffe8 by task
  kunit_try_catch/18349

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: bf2d44d07de7 ("ASoC: wm_adsp: Add kunit test for firmware file search")
---
 sound/soc/codecs/wm_adsp_fw_find_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index fb886dc61c27..d0c7fb30a95d 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -1041,6 +1041,7 @@ static const char * const wm_adsp_fw_find_test_dir_all_files[] = {
 	"cirrus/cs1234-dsp1-mbc-vss.bin",
 	"cirrus/wm1234-dsp1-mbc-vss.bin",
 	"wm1234-dsp1-mbc-vss.bin",
+	NULL /* terminator */
 };
 
 /*
-- 
2.47.3

