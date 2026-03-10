Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF22C11CB;
	Tue, 10 Mar 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152323; cv=fail; b=aeUDdJOvmBgGtx+bUVVPYVj2QSwuEuOJG2nezJbFCk4Sw5gLwhhLmX5keWOQmo1Px4IWrEAiY7T4dXI+A5p+F0E5PGHzr8RzzpfqmNvyB8v6E7xJtfvNymuAPKgVIEW27eS9KYYzEso4v0oq2F9UKZwzLiDh5fjpZdhnHIJdbCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152323; c=relaxed/simple;
	bh=3lRlforBFXwt3QYc3cj53B47OQBtyGhQJC5OrkyhQDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YLVbjUBQREKnAa8ZjFj4W/wimH7dONnmbEXAU1H0nCvrBeV5Q7IrRjSQFD/2WGFGctnEC6P6ss5O1D5qGJI0BuxG5+M9vs8170dr26wnef7R9AgpQ4FqMkPQV9xbntpQOQvSjppG9emx3B4C5TES0GPV55r5hSgeehrbyrG0nTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TOuBF/CJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rYfIWz9R; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TOuBF/CJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rYfIWz9R"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A4jxWZ3035773;
	Tue, 10 Mar 2026 09:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uQS4lFpyuW0O9hFBXNJ434cIWdsPbw83P+yJVTEOakM=; b=
	TOuBF/CJnGfiCdVzTKxeu38sfSVW1sNc3luMsM5UjPp40vsUZoSIXRHfGkC36Sgf
	EmmTNykNVh0jB6vpXwXGoTdALBHk4uqe4q+MHyCsRpuGCe2ljz3DrMNfiQsLU0fk
	fjYJELrxGlo71WivObS7aSPolCeYiOglQ3//9RtcS9VlihdBFZkxeI6KriObMKrN
	ZhEO2+sTXSErT50ZM0MaUsYUdqwiqVRQSvNTDrfGWzFu5DKLxyys9cAuHs8M7Cv0
	vDrfe+R0ua3uknBZ9cdovGhdGYaJmUM4t7bvPD569Mi28dxqaPYF4G6+Pu4z0ORO
	MYwD5oupXuW1z5+sAYKGoA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023084.outbound.protection.outlook.com [40.93.196.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk2e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5LR9ywtlcyxQaD1GVpaKzrV9G66oJevSkOTYWgwGAs0VA463di6Acy5zJDYKAVZZLtqQ4uAsU0WW+M1ndn6+qTvuyJ+ialRZtGFSGj6s5W7c5l/mNP7lrz2lJkBLEgaOI9O01tcjjY2MGr1COPgo4LC062+P54vOoya52ddzAJnFgTfPt9QWBkxWfPgQ9963np7pWXeWtVrivstuJPJRt3ctoyIJXhiTLCfIJGm4dSwrTJfjP5PwsFdbNDGY2mLagkU/sW7pI/G8GWTs7OB6M19tfJeH6nI1lvE/quCYhNxp8JjOfh6lA5Ijhmlli79PofW81ZMFRe4Ur7Y4yw2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQS4lFpyuW0O9hFBXNJ434cIWdsPbw83P+yJVTEOakM=;
 b=ZHeElDf4/4AZMjKFWp4hra8Y5EJ2AKPxivci+pLL0qgKX/esky+hrXLAVQVLmnEQCnMB6oygieCS9js9N+v6GUf6TWmfefDomn50LTqhunbOVnkB3PLPmmUG4X3kgljtx2naIfh8NOAF3MwGj3ywcgqCoQreRD0BS05lBL/ABU65cN5wxQC8hNioEmwJT22rs0erDlSJ+5EbCQONqx5NLsZ2IQNc1tEt9UosmAJi/d2HfMHPc/pecW3fDvu/kzwWgG5/6d0qvb+IQNi+QDCEQLKhURBG/mXnMc5XiD0SOgR+26OjCJX2KCZr7jQs/IPLnum2W6p6q88+iEu+pVcu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQS4lFpyuW0O9hFBXNJ434cIWdsPbw83P+yJVTEOakM=;
 b=rYfIWz9RTiRqYgOKrD8nwWGcyxLBCuODb62/gxmb8UosunLlh2tSb6OzsoFBjYwkigbf4dYLTEPwo7LLjJ5aN4/uCG0xTyBrxosOEH9HEofCVZbpt0D/XwcpDy6iIhz3OpWcEryuzIOUAbd60MnsudSNdkUHHK60FlkF+Ac2gNk=
Received: from SJ0PR13CA0130.namprd13.prod.outlook.com (2603:10b6:a03:2c6::15)
 by LV0PR19MB9518.namprd19.prod.outlook.com (2603:10b6:408:326::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:21 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::15) by SJ0PR13CA0130.outlook.office365.com
 (2603:10b6:a03:2c6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1
 via Frontend Transport; Tue, 10 Mar 2026 14:18:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BA5BE406550;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 895B8822543;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 04/10] ASoC: wm_adsp: Add kunit test for firmware file search
Date: Tue, 10 Mar 2026 14:18:11 +0000
Message-ID: <20260310141817.1871794-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|LV0PR19MB9518:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a6ca9ba3-778e-4913-abeb-08de7eafe11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	z4iwqqVENbNEpAXyAubvTQxejZYDZYxoVeqN7XE67Q112fAgmafiWFo4v6a+yinbvKQKlkcaB2FskrbY6UGNQ5NH8gzP+wB+ppV7wXelzYAGv3Y3fgM1x3x68Rwa7JpBUMcKNn3EBOoESTb6RwQC7+VyP4s5DvzEAX58qFXS0H1rJdVC8+/YtyFIje/hbNwwrOhWIXn3A+doueOQIqeVNqQHAe3nS7ubRMRHvG9LHNBKtjeCXhjRIeORNADZp+RsjYaotqAnMjiZxcxyPVmG1nh7nzi/y2HetSCED0ilJBp0bZJda8kJTFIrDpCrJSWyqwtZIlkH3dXtBaVPIVLgSJXIBS6H4164wZzTQYZQIYOZ4SLjp6Z4E41mJ7TsVge9zUDn43OLHvnzb4cebJ28e615zMW/UwVs5LnFkUEaM0o5B1QY7mlhYlXNEAMfM8cUB9bIBggX8GTEUX8PV/bObrKFO4d1Upjk9aVCbccfysEifEPBsMJUD1TpaWZ7o/9Yz+B5V1kICZQV3tUFPJx57LPXTkndfH+KhFrkwxvlutUvRHWV6tW+nEM7BS6ST4HFLBfZv953OH7mxTHRPaS0sBV+6zZiL979bncX4Og0F606TNlG20EIl8bQlEYVUP0oWYSoCzIxdHAaLn7fv0DivnW+DKqVlRDDuqZMo9x3flOlgWg6/FCemLvTBAtTs86S14BbalnQINNCsWSoYEGg6W7mC7FioeYlKvHQrVXmRf4Sg+h753u6tzWE9P1iLjfYfDy8cUugKi+zEMNpFqxxtQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WIw0vcUgLfN/Zc0Pan0Ntx+IO+hnmnqNzkpzUnec8MFdoem5gvlGXVDtqB7XhbwoVigO8mUaEnj9t5vKQJaY04TCOQNCSh+RYYTUT4MXbXBQiUKgQwiEbv9/YXQ7f27JUN6Q2z4jNaPRkkj6RBTc2OGrQNbxN5lQ27ld6vbViwMdqE+QiPg+3eEk603rrlzI9HF5BMqdcy5SJF1dQL/Ne7m5zr44Yz3fP0O+tzY6829iNTErlTNXgKHM4UvtUsRHCbcF/jOjntRSb3Yn+9rmf6E4aPuW8dnfSLzXNJ71nePyifkIZ9iaWAWJujL+jucnsXkhnYXfTkEn/ZjCSLC8wHEtEZJdbV/8cfkgfNCvvV8hrpP+R4GK4IeOFnjX80539NtDzeeZ5cnoslF96ZgHxAu3sQDKKwLq6PNZfKyzoO5hjMEHkWjsxc77VyAt6VLz
X-Exchange-RoutingPolicyChecked:
	MUlUiEMa9Jp2ZY3rAQBG9qX8FyI38Ybwp3JPSBAz5G5lfmvG6i1+R0xONskK4GKemOU4MhPs7yjuRs+6SPkQo0/i2zHeTzmYse5hFfGxF7xgKf7y6i1YPtWPQydPSvuUyk7eZJRSSIS/0XfgkMUFLS6HKmGHs0QKM7t/zSHyJdO5VEALdoKtjDi1Afpv6Fm7KvFrNgwvtHWCMKNMKOoBr7+jTMbP/fbCwifTZpnxCGDtMLLiSW5WYjcNvWYvG8PzARrdwiRKPtn0IaX0dhtePoSM16gOWaMG77V23WDG2bCrHA50Ehb1FRParCkhswZDPuLNXilOtVuSmS2VYW4aiQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:19.1024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ca9ba3-778e-4913-abeb-08de7eafe11c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9518
X-Proofpoint-ORIG-GUID: C1z8gnk0xIwfoRQ-Es4rYDkzx-BpB1LO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX/dPKVjFpZjuk
 5XCfd1FAkn49++bOCTFEJ2C1DNWWUJF6JxV6VktRz+ryobPDWNiGLUyv2ghWq4Ea8ZJGP5Qbtor
 IystN4oUte91yaNjTniGXpO/nYlaYZ4iQudCHHMn8NhfMjcKYhqyTyyrW9Bj3BOeNtGg4Fywcm9
 KeQj5xAR6TKXPEdTw/qJJhuiI4JI081meyd+ZVF3f4O2xJWXoCvmFSVzvq5XYqI46DexJ3WsGWq
 e9Iuo2NDmy4JGIBHUF+/euQSrGj8qN90J/x8qvcVZXMr6zSI0EkXAQMATNz1jo8V7YqsDeAYzcx
 lIBXbSaLPzB8SbxkYPsqAAgnXfHgpZpxL+/Uej2JzobFSyZpl7K99hOoPDVxVAA1zdhcYI6v+oC
 wUC77fi6ZTR9nuabZSPZjMjghEgGW+f+LP3jePoaADnQHPYdSas3hOXiSB93qEmY728luj4eXgN
 f40QTO5LaUxVMu5KEsw==
X-Proofpoint-GUID: C1z8gnk0xIwfoRQ-Es4rYDkzx-BpB1LO
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02833 cx=c_pps
 a=V/GvUwJ+4XAyQQCxxnOR+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=OYndPN-Gni85kv8JpMMA:9
X-Proofpoint-Spam-Reason: safe

Add KUnit testing of the wm_adsp code that searches for firmware files.
Also make the SND_SOC_WM_ADSP Kconfig symbol visible if KUNIT is enabled
so that wm_adsp can be manually included for KUnit testing.

The firmware filename is composed of several fields, some of which are
optional, and there is a search algorithm to fallback from specific to
generic versions of firmware for a device. This KUnit test verifies that
wm_adsp is searching for the correct sequence of filenames.

The are two ways of testing this, and both are used in this KUnit test.

1. Trap the calls to firmware_request_nowarn() and test that the sequence
   of filenames request is correct.

   This is the most thorough test because it proves that exactly the
   expected filenames are requested, in the correct order.

   But it doesn't fully cover regression testing. If a change to the search
   algorithm changes the expected sequence of requested files, the test
   must also be changed to expect that new sequence. If the expectation is
   wrong, the tests can pass (because the search order is as expected)
   while picking a different file in some cases from what it did before the
   change.

2. Test which file is picked from a simulated directory of files.

   This is better for regression testing because it is independent of the
   search algorithm. It does not need to change if the search algorithm
   changes. It is not testing exactly which files the algorithm searches
   for, only which file it eventually picks from a given set of available
   files.

   In other words, the regression test is: does it still pick the same file
   from the same directory of files?

   But it is impractical for thorough testing. It doesn't prove that
   exactly the correct files were searched for, unless it was to test with
   every possible combination of file names and directory content that
   could ever exist. Clearly this is impossible to implement, since the
   number of combations of possible valid filenames in a directory and
   number of files in a directory is astronomically large.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig                |   14 +-
 sound/soc/codecs/Makefile               |    2 +
 sound/soc/codecs/wm_adsp_fw_find_test.c | 1223 +++++++++++++++++++++++
 3 files changed, 1238 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/wm_adsp_fw_find_test.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index adb3fb923be3..f9e6a83e55c6 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -398,7 +398,7 @@ config SND_SOC_WM_HUBS
 	default m if SND_SOC_WM8993=m || SND_SOC_WM8994=m
 
 config SND_SOC_WM_ADSP
-	tristate
+	tristate "Cirrus Logic wm_adsp driver" if KUNIT
 	select FW_CS_DSP
 	select SND_SOC_COMPRESS
 	default y if SND_SOC_MADERA=y
@@ -424,6 +424,18 @@ config SND_SOC_WM_ADSP
 	default m if SND_SOC_CS35L56=m
 	default m if SND_SOC_CS48L32=m
 
+config SND_SOC_WM_ADSP_TEST
+	tristate "KUnit tests for Cirrus Logic wm_adsp" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on SND_SOC_WM_ADSP
+	default KUNIT_ALL_TESTS
+	help
+	  This builds KUnit tests for the Cirrus Logic wm_adsp library.
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+	  If in doubt, say "N".
+
 config SND_SOC_AB8500_CODEC
 	tristate
 	depends on ABX500_CORE
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 3ddee5298721..172861d17cfd 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -361,6 +361,7 @@ snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
 snd-soc-wcd939x-sdw-y := wcd939x-sdw.o
 snd-soc-wm-adsp-y := wm_adsp.o
+snd-soc-wm-adsp-test-y := wm_adsp_fw_find_test.o
 snd-soc-wm0010-y := wm0010.o
 snd-soc-wm1250-ev1-y := wm1250-ev1.o
 snd-soc-wm2000-y := wm2000.o
@@ -862,6 +863,7 @@ obj-$(CONFIG_SND_SOC_WM9705)	+= snd-soc-wm9705.o
 obj-$(CONFIG_SND_SOC_WM9712)	+= snd-soc-wm9712.o
 obj-$(CONFIG_SND_SOC_WM9713)	+= snd-soc-wm9713.o
 obj-$(CONFIG_SND_SOC_WM_ADSP)	+= snd-soc-wm-adsp.o
+obj-$(CONFIG_SND_SOC_WM_ADSP_TEST)	+= snd-soc-wm-adsp-test.o
 obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
 obj-$(CONFIG_SND_SOC_WSA881X)	+= snd-soc-wsa881x.o
 obj-$(CONFIG_SND_SOC_WSA883X)	+= snd-soc-wsa883x.o
diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
new file mode 100644
index 000000000000..556221d38a50
--- /dev/null
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -0,0 +1,1223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Test cases for wm_adsp library.
+//
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <kunit/device.h>
+#include <kunit/static_stub.h>
+#include <kunit/test.h>
+#include <linux/slab.h>
+#include "wm_adsp.h"
+
+KUNIT_DEFINE_ACTION_WRAPPER(_put_device_wrapper, put_device, struct device *);
+
+struct wm_adsp_fw_find_test {
+	struct wm_adsp dsp;
+
+	const struct firmware *found_wmfw_firmware;
+	const struct firmware *found_bin_firmware;
+	char *found_wmfw_filename;
+	char *found_bin_filename;
+	char searched_fw_files[768];
+};
+
+struct wm_adsp_fw_find_test_params {
+	const char *part;
+	const char *dsp_name;
+	const char *fwf_name;
+	const char *system_name;
+	const char *alsa_name;
+	bool wmfw_optional;
+	bool bin_mandatory;
+
+	/* If non-NULL this file should be returned as "found" */
+	const char *expect_wmfw;
+
+	/* If non-NULL this file should be returned as "found" */
+	const char *expect_bin;
+
+	/* Space-separated list of filenames in expected order of searching */
+	const char *expected_searches;
+
+	/* NULL-terminated array of pointers to filenames to simulate directory content */
+	const char * const *dir_files;
+};
+
+/* Dummy struct firmware to return from wm_adsp_request_firmware_files */
+static const struct firmware wm_adsp_find_test_dummy_firmware;
+
+/* Simple lookup of a filename in a list of names */
+static int wm_adsp_fw_find_test_firmware_request_simple_stub(const struct firmware **firmware,
+							     const char *filename,
+							     struct device *dev)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct wm_adsp_fw_find_test_params *params = test->param_value;
+	int i;
+
+	/* Non-parameterized test? */
+	if (!params)
+		return -ENOENT;
+
+	if (!params->dir_files)
+		return -ENOENT;
+
+	for (i = 0; params->dir_files[i]; i++) {
+		if (strcmp(params->dir_files[i], filename) == 0) {
+			*firmware = &wm_adsp_find_test_dummy_firmware;
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+static void wm_adsp_fw_find_test_pick_file(struct kunit *test)
+{
+	struct wm_adsp_fw_find_test *priv = test->priv;
+	const struct wm_adsp_fw_find_test_params *params = test->param_value;
+	struct wm_adsp *dsp = &priv->dsp;
+	int i, ret;
+
+	/* Concatenate string of dir content for error messages */
+	for (i = 0; params->dir_files[i]; i++) {
+		strlcat(priv->searched_fw_files, params->dir_files[i],
+			sizeof(priv->searched_fw_files));
+		strlcat(priv->searched_fw_files, ";",
+			sizeof(priv->searched_fw_files));
+	}
+
+	dsp->cs_dsp.name = params->dsp_name;
+	dsp->part = params->part;
+	dsp->fwf_name = params->fwf_name;
+	dsp->system_name = params->system_name;
+	dsp->component->name_prefix = params->alsa_name;
+	dsp->wmfw_optional = params->wmfw_optional;
+	dsp->bin_mandatory = params->bin_mandatory;
+
+	kunit_activate_static_stub(test,
+				   wm_adsp_firmware_request,
+				   wm_adsp_fw_find_test_firmware_request_simple_stub);
+
+	ret = wm_adsp_request_firmware_files(dsp,
+					     &priv->found_wmfw_firmware,
+					     &priv->found_wmfw_filename,
+					     &priv->found_bin_firmware,
+					     &priv->found_bin_filename);
+	kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
+	KUNIT_EXPECT_EQ_MSG(test, ret,
+			    (params->expect_wmfw || params->expect_bin) ? 0 : -ENOENT,
+			    "%s\n", priv->searched_fw_files);
+
+	KUNIT_EXPECT_EQ_MSG(test, !!priv->found_wmfw_filename, !!params->expect_wmfw,
+			    "%s\n", priv->searched_fw_files);
+	KUNIT_EXPECT_EQ_MSG(test, !!priv->found_bin_filename, !!params->expect_bin,
+			    "%s\n", priv->searched_fw_files);
+
+	if (params->expect_wmfw) {
+		KUNIT_EXPECT_STREQ_MSG(test, priv->found_wmfw_filename, params->expect_wmfw,
+				       "%s\n", priv->searched_fw_files);
+	}
+
+	if (params->expect_bin) {
+		KUNIT_EXPECT_STREQ_MSG(test, priv->found_bin_filename, params->expect_bin,
+				       "%s\n", priv->searched_fw_files);
+	}
+}
+
+static int wm_adsp_fw_find_test_firmware_request_stub(const struct firmware **firmware,
+						      const char *filename,
+						      struct device *dev)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct wm_adsp_fw_find_test_params *params = test->param_value;
+	struct wm_adsp_fw_find_test *priv = test->priv;
+
+	/*
+	 * Searches are accumulated as a single string of space-separated names.
+	 * The list of expected searches are stored the same way in
+	 * struct wm_adsp_fw_find_test_params. This allows for comparision using
+	 * a simple KUNIT_EXPECT_STREQ(), which avoids the risk of bugs in a
+	 * more complex custom comparison.
+	 */
+	if (priv->searched_fw_files[0] != '\0')
+		strlcat(priv->searched_fw_files, " ", sizeof(priv->searched_fw_files));
+
+	strlcat(priv->searched_fw_files, filename, sizeof(priv->searched_fw_files));
+
+	/* Non-parameterized test? */
+	if (!params)
+		return -ENOENT;
+
+	if (params->expect_wmfw && (strcmp(filename, params->expect_wmfw) == 0)) {
+		*firmware = &wm_adsp_find_test_dummy_firmware;
+		return 0;
+	}
+
+	if (params->expect_bin && (strcmp(filename, params->expect_bin) == 0)) {
+		*firmware = &wm_adsp_find_test_dummy_firmware;
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+static void wm_adsp_fw_find_test_search_order(struct kunit *test)
+{
+	struct wm_adsp_fw_find_test *priv = test->priv;
+	const struct wm_adsp_fw_find_test_params *params = test->param_value;
+	struct wm_adsp *dsp = &priv->dsp;
+
+	dsp->cs_dsp.name = params->dsp_name;
+	dsp->part = params->part;
+	dsp->fwf_name = params->fwf_name;
+	dsp->system_name = params->system_name;
+	dsp->component->name_prefix = params->alsa_name;
+	dsp->wmfw_optional = params->wmfw_optional;
+
+	kunit_activate_static_stub(test,
+				   wm_adsp_firmware_request,
+				   wm_adsp_fw_find_test_firmware_request_stub);
+
+	wm_adsp_request_firmware_files(dsp,
+				       &priv->found_wmfw_firmware,
+				       &priv->found_wmfw_filename,
+				       &priv->found_bin_firmware,
+				       &priv->found_bin_filename);
+
+	kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
+
+	KUNIT_EXPECT_STREQ(test, priv->searched_fw_files, params->expected_searches);
+
+	KUNIT_EXPECT_EQ(test, !!priv->found_wmfw_filename, !!params->expect_wmfw);
+	if (params->expect_wmfw)
+		KUNIT_EXPECT_STREQ(test, priv->found_wmfw_filename, params->expect_wmfw);
+
+	KUNIT_EXPECT_EQ(test, !!priv->found_bin_filename, !!params->expect_bin);
+	if (params->expect_bin)
+		KUNIT_EXPECT_STREQ(test, priv->found_bin_filename, params->expect_bin);
+
+	/* Either we get a filename and firmware, or neither */
+	KUNIT_EXPECT_EQ(test, !!priv->found_wmfw_filename, !!priv->found_wmfw_firmware);
+	KUNIT_EXPECT_EQ(test, !!priv->found_bin_filename, !!priv->found_bin_firmware);
+}
+
+static void wm_adsp_fw_find_test_find_firmware_byindex(struct kunit *test)
+{
+	struct wm_adsp_fw_find_test *priv = test->priv;
+	struct wm_adsp *dsp = &priv->dsp;
+	const char *fw_name;
+
+	dsp->cs_dsp.name = "cs1234";
+	dsp->part = "dsp1";
+	for (dsp->fw = 0;; dsp->fw++) {
+		fw_name = wm_adsp_get_fwf_name_by_index(dsp->fw);
+		if (!fw_name)
+			break;
+
+		kunit_activate_static_stub(test,
+					   wm_adsp_firmware_request,
+					   wm_adsp_fw_find_test_firmware_request_stub);
+
+		wm_adsp_request_firmware_files(dsp,
+					       &priv->found_wmfw_firmware,
+					       &priv->found_wmfw_filename,
+					       &priv->found_bin_firmware,
+					       &priv->found_bin_filename);
+
+		kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
+
+		KUNIT_EXPECT_NOT_NULL_MSG(test,
+					  strstr(priv->searched_fw_files, fw_name),
+					  "fw#%d Did not find '%s' in '%s'\n",
+					  dsp->fw, fw_name, priv->searched_fw_files);
+	}
+}
+
+static int wm_adsp_fw_find_test_case_init(struct kunit *test)
+{
+	struct wm_adsp_fw_find_test *priv;
+	struct device *test_dev;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Require dummy struct snd_soc_component for the alsa name prefix string */
+	priv->dsp.component = kunit_kzalloc(test, sizeof(*priv->dsp.component), GFP_KERNEL);
+	if (!priv->dsp.component)
+		return -ENOMEM;
+
+	test->priv = priv;
+
+	/* Create dummy amp device */
+	test_dev = kunit_device_register(test, "wm_adsp_test_drv");
+	if (IS_ERR(test_dev))
+		return PTR_ERR(test_dev);
+
+	priv->dsp.cs_dsp.dev = get_device(test_dev);
+	if (!priv->dsp.cs_dsp.dev)
+		return -ENODEV;
+
+	ret = kunit_add_action_or_reset(test, _put_device_wrapper, priv->dsp.cs_dsp.dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void wm_adsp_fw_find_test_case_exit(struct kunit *test)
+{
+	struct wm_adsp_fw_find_test *priv = test->priv;
+
+	/*
+	 * priv->found_wmfw_firmware and priv->found_bin_firmware are
+	 * dummies not allocated by the real request_firmware() call they
+	 * must not be passed to release_firmware().
+	 */
+	wm_adsp_release_firmware_files(NULL, priv->found_wmfw_filename,
+				       NULL, priv->found_bin_filename);
+}
+
+static void wm_adsp_fw_find_test_param_desc(const struct wm_adsp_fw_find_test_params *param,
+					    char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
+		 "%s %s fwf_name:%s system:%s alsa_name:%s %s expects:(%s %s)",
+		  param->part, param->dsp_name,
+		  param->fwf_name ? param->fwf_name : "",
+		  param->system_name ? param->system_name : "",
+		  param->alsa_name ? param->alsa_name : "",
+		  param->wmfw_optional ? "wmfw_optional" : "",
+		  param->expect_wmfw ? param->expect_wmfw : "",
+		  param->expect_bin ? param->expect_bin : "");
+}
+
+/* Cases where firmware file not found. Tests full search sequence. */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_full_search_cases[] = {
+	{ /* system name and alsa prefix, wmfw mandatory. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw",
+	},
+	{ /* system name and alsa prefix, wmfw optional. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* system name only, wmfw mandatory. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw",
+	},
+	{ /* system name only, wmfw optional. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+
+	/*
+	 * TODO: Is this a bug? Device-specific bin is only allowed when there
+	 * is a system_name. But if there isn't any meaningful system name on
+	 * a product, why can't it load firmware files qualified by alsa prefix?
+	 */
+
+	{ /* Alsa prefix, wmfw mandatory. No system name so generic files only. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw",
+	},
+	{ /* Alsa prefix, wmfw optional. No system name so generic files only. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.wmfw_optional = true,
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+
+	{ /* fwf_name, system name and alsa prefix, wmfw mandatory. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .fwf_name = "ao",
+		.expected_searches =
+			"cirrus/cs1234-ao-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-ao-mbc-vss-abc123.wmfw "
+			"cs1234-ao-mbc-vss.wmfw "
+			"cirrus/cs1234-ao-mbc-vss.wmfw",
+	},
+	{ /* fwf_name, system name and alsa prefix, wmfw optional. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .fwf_name = "ao",
+		.wmfw_optional = true,
+		.expected_searches =
+			"cirrus/cs1234-ao-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-ao-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-ao-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-ao-mbc-vss-abc123.bin "
+			"cs1234-ao-mbc-vss.wmfw "
+			"cirrus/cs1234-ao-mbc-vss.wmfw "
+			"cirrus/cs1234-ao-mbc-vss.bin",
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_full_search,
+		  wm_adsp_fw_find_full_search_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+/* Cases with system name and alsa prefix both given. */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_system_alsaname_cases[] = {
+	{ /* Fully-qualified wmfw exists. No bin */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* Optional fully-qualified wmfw exists. No bin */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* Fully-qualified wmfw and bin exist. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* Optional fully-qualified wmfw and fully-qualified bin exist. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* wmfw matches system name only. No bin */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Optional wmfw matches system name only. No bin */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* wmfw matches system name only. Fully-qualified bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* Optional wmfw matches system name only. Fully-qualified bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* wmfw and bin match system name only. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Optional wmfw and bin match system name only. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Optional wmfw not found. bin matches fully-qualified name. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin",
+	},
+	{ /* Optional wmfw not found. bin matches system name only. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* No qualified wmfw. Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified optional wmfw. Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified wmfw. Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified optional wmfw. Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified or legacy wmfw. Generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No optional qualified or legacy wmfw. Generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified or legacy wmfw. Generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No optional qualified or legacy wmfw. Generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No optional qualified or generic wmfw. Generic bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123-amp1.bin "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_system_alsaname,
+		  wm_adsp_fw_find_system_alsaname_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+/* Cases with system name but without alsa name prefix. */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_system_cases[] = {
+	{ /* Qualified wmfw found. No bin */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Optional qualified wmfw found. No bin */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Qualified wmfw found. Qualified bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Optional qualified wmfw found. Qualified bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* Optional wmfw not found. Qualified bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin",
+	},
+	{ /* No qualified wmfw. Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified optional wmfw. Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified wmfw. Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified optional wmfw. Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified or legacy wmfw. Generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No optional qualified or legacy wmfw. Generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No qualified or legacy wmfw. Generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No optional qualified or legacy wmfw. Generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No optional qualified or generic wmfw. Generic bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "ABC123",
+		.wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc123.bin "
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_system,
+		  wm_adsp_fw_find_system_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+/* Cases without system name but with alsa name prefix. */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_alsaname_cases[] = {
+	{ /* Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* wmfw optional. Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* wmfw optional. Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Optional generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Optional generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy or generic wmfw. Generic bin found. */
+		.part = "cs1234", .dsp_name = "dsp1", .alsa_name = "amp1",
+		.wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_alsaname,
+		  wm_adsp_fw_find_alsaname_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+/* Cases without system name or alsa name prefix. */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_noqual_cases[] = {
+	{ /* Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* wmfw optional. Legacy generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* wmfw optional. Legacy generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Optional generic wmfw found. No bin. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy wmfw. Optional generic wmfw and bin found. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.wmfw_optional = true,
+		.expect_wmfw =  "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+	{ /* No legacy or generic wmfw. Generic bin found. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.wmfw_optional = true,
+		.expect_bin =  "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.expected_searches =
+			"cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss.bin",
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_noqual,
+		  wm_adsp_fw_find_noqual_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+/*
+ * Tests for filename normalization. The system name and alsa prefix strings
+ * should be converted to lower-case and delimiters are converted to '-', except
+ * for '.' which is preserved.
+ */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_normalization_cases[] = {
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "Vendor",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-vendor.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-vendor.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-vendor.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "Vendor Device",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "Vendor_Device",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "1234:56AB",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-1234-56ab.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-1234-56ab.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-1234-56ab.bin",
+	},
+
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "abc",
+		.alsa_name = "LEFT",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc-left.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc-left.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc-left.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "abc",
+		.alsa_name = "LEFT AMP",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "abc",
+		.alsa_name = "Left Amp",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc-left-amp.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "abc",
+		.alsa_name = "Amp_1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc-amp-1.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc-amp-1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc-amp-1.bin",
+	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "abc",
+		.alsa_name = "cs1234.1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc-cs1234.1.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc-cs1234.1.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc-cs1234.1.bin",
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_normalization,
+		  wm_adsp_fw_find_normalization_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+/*
+ * Dummy directory content for regression tests.
+ * DSP part name and system name are used to select different available
+ * files.
+ *
+ * System:
+ * WFBF1111 = wmfw and bin fully-qualified
+ * WSBF1111 = wmfw system-qualified, bin fully-qualified
+ * WSBS1111 = wmfw and bin system-qualified
+ * WFXX1111 = wmfw fully-qualified, bin not present
+ * XXBF1111 = wmfw not present, bin fully-qualified
+ *
+ * Part:
+ * cs1234	= for testing fully-qualified configurations
+ * cs1234nobin	= generic wmfw without a bin available
+ * wm1234	= legacy wmfw and bin
+ * wm1234nobin	= legacy wmfw without bin
+ */
+static const char * const wm_adsp_fw_find_test_dir_all_files[] = {
+	"cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss-wfbf1111-l1u2.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss-wfbf1111.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss-wsbs1111.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss-wfxx1111.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss.wmfw",
+	"cirrus/cs1234nobin-dsp1-mbc-vss.wmfw",
+	"cirrus/wm1234-dsp1-mbc-vss.wmfw",
+	"cirrus/wm1234nobin-dsp1-mbc-vss.wmfw",
+	"wm1234-dsp1-mbc-vss.wmfw",
+	"wm1234nobin-dsp1-mbc-vss.wmfw",
+	"cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.bin",
+	"cirrus/cs1234-dsp1-mbc-vss-wfbf1111-l1u2.bin",
+	"cirrus/cs1234-dsp1-mbc-vss-wsbf1111-amp1.bin",
+	"cirrus/cs1234-dsp1-mbc-vss-wsbf1111-l1u2.bin",
+	"cirrus/cs1234-dsp1-mbc-vss-wsbs1111.bin",
+	"cirrus/cs1234-dsp1-mbc-vss-xxbf1111-amp1.bin",
+	"cirrus/cs1234-dsp1-mbc-vss.bin",
+	"cirrus/wm1234-dsp1-mbc-vss.bin",
+	"wm1234-dsp1-mbc-vss.bin",
+};
+
+/*
+ * Regression testing that a change in the search algorithm doesn't change
+ * which file is picked. This doesn't cover every possible combination, only
+ * those that are already in use and typical cases.
+ *
+ * It wouldn't be efficent to fully prove the algorithm this way (too many
+ * directory content combinations would be needed, and it only infers what the
+ * algorithm searched for, it doesn't prove exactly what searches were made).
+ * So the main testing is done by checking for the expected file searches.
+ * This regression test is independent of the search algorithm.
+ *
+ * The main tests already prove that the algorithm only searches for files
+ * with the correct qualifiers so we can assume that files with the wrong
+ * qualifiers would not be picked and there's no need to test for that here.
+ */
+static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_pick_cases[] = {
+	/*
+	 * Amps
+	 */
+	{ /* Full info, wmfw and bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WFBF1111",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw and bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WFBF1111",
+		.alsa_name = "l1u2",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-l1u2.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-l1u2.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw only system-qualified, bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WSBF1111",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wsbf1111-amp1.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw only system-qualified, bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WSBF1111",
+		.alsa_name = "l1u2",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wsbf1111-l1u2.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw optional but present, and bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WFBF1111",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw and bin only system-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WSBS1111",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wsbs1111.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wsbs1111.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw optional but system-qualified wmfm present, bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WSBF1111",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wsbf1111.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wsbf1111-amp1.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw optional not present, and bin fully-qualified */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "XXBF1111",
+		.alsa_name = "amp1", .wmfw_optional = true,
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-xxbf1111-amp1.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw and bin fully-qualified, bin mandatory and present */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WFBF1111",
+		.alsa_name = "amp1", .bin_mandatory = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss-wfbf1111-amp1.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw and bin fully-qualified, bin mandatory but not present */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WFXX1111",
+		.alsa_name = "amp1", .bin_mandatory = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wfxx1111.wmfw",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw optional but present, bin mandatory but not present */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "WFXX1111",
+		.alsa_name = "amp1", .wmfw_optional = true, .bin_mandatory = true,
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-wfxx1111.wmfw",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw and bin not present, generic fallbacks are present */
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "XXXX1111",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* Full info, wmfw and bin not present, generic wmfw present */
+		.part = "cs1234nobin", .dsp_name = "dsp1", .system_name = "XXXX1111",
+		.alsa_name = "amp1",
+		.expect_wmfw = "cirrus/cs1234nobin-dsp1-mbc-vss.wmfw",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+
+	/*
+	 * Codecs
+	 */
+	{ /* No qualifiers. Generic wmfws exist, legacy should be chosen. */
+		.part = "wm1234nobin", .dsp_name = "dsp1",
+		.expect_wmfw = "wm1234nobin-dsp1-mbc-vss.wmfw",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* No qualifiers. Generic wmfw and bin exist, legacy should be chosen */
+		.part = "wm1234", .dsp_name = "dsp1",
+		.expect_wmfw = "wm1234-dsp1-mbc-vss.wmfw",
+		.expect_bin = "wm1234-dsp1-mbc-vss.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* No qualifiers. New generic wmfw exists, no legacy files. */
+		.part = "cs1234nobin", .dsp_name = "dsp1",
+		.expect_wmfw = "cirrus/cs1234nobin-dsp1-mbc-vss.wmfw",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+	{ /* No qualifiers. New generic wmfw and bin exist, no legacy files. */
+		.part = "cs1234", .dsp_name = "dsp1",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss.wmfw",
+		.expect_bin = "cirrus/cs1234-dsp1-mbc-vss.bin",
+		.dir_files = wm_adsp_fw_find_test_dir_all_files,
+	},
+};
+KUNIT_ARRAY_PARAM(wm_adsp_fw_find_pick,
+		  wm_adsp_fw_find_pick_cases,
+		  wm_adsp_fw_find_test_param_desc);
+
+static struct kunit_case wm_adsp_fw_find_test_cases[] = {
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_search_order,
+			 wm_adsp_fw_find_full_search_gen_params),
+
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_search_order,
+			 wm_adsp_fw_find_system_alsaname_gen_params),
+
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_search_order,
+			 wm_adsp_fw_find_system_gen_params),
+
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_search_order,
+			 wm_adsp_fw_find_alsaname_gen_params),
+
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_search_order,
+			 wm_adsp_fw_find_noqual_gen_params),
+
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_search_order,
+			 wm_adsp_fw_find_normalization_gen_params),
+
+	KUNIT_CASE_PARAM(wm_adsp_fw_find_test_pick_file,
+			 wm_adsp_fw_find_pick_gen_params),
+
+	KUNIT_CASE(wm_adsp_fw_find_test_find_firmware_byindex),
+
+	{ } /* terminator */
+};
+
+static struct kunit_suite wm_adsp_fw_find_test_suite = {
+	.name = "wm-adsp-fw-find",
+	.init = wm_adsp_fw_find_test_case_init,
+	.exit = wm_adsp_fw_find_test_case_exit,
+	.test_cases = wm_adsp_fw_find_test_cases,
+};
+
+kunit_test_suite(wm_adsp_fw_find_test_suite);
+
+MODULE_DESCRIPTION("KUnit test for Cirrus Logic wm_adsp driver");
+MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
-- 
2.47.3

