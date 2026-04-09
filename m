Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957333E37D
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753066; cv=fail; b=gVCPppL6ya2a3ovDOElrTz/ffoZ7IurcBuX1JuGHdjKGZmU5xzeAmXRrJerVl0D7XDNcr3bBRwYZNVY4GScOC9f5FOgPabwzG7mWmeXavGIofuFMhj0Uyr1Vr3L026VpjNH2E6OCW/s3kMhs3nTH9G45NqsebzjJ+EO0wgHpSwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753066; c=relaxed/simple;
	bh=Z0zO5+wEiMzGTano5shRb5VnIZXHOiJ6sqaoyspOR5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VG7bCj1yzImb8+PTgD4uc4n1VZyrJmXfAB9mQnWAa3DF/nQy+4jhPm66yT5IhaabiKZ50tGa9z4oeniLDrfjYK8TldKh0yj03vXlkgJF9ispF6/ARXpAlzz09t0zQFjVS6vW75THn49hkle1A9rfqxE4K5KShh9lubsB3zJTeiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W7bODSsB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ADHnsNCB; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W7bODSsB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ADHnsNCB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394xWJU3029315;
	Thu, 9 Apr 2026 11:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BYS6JhgtPjPNnSPH
	ZzrBq8zbuAqmko1DBph7IwbYTIE=; b=W7bODSsBAfeIzkRK2VNxOZ/QEMo76vAt
	3lR3FmYGvbdxufnyYc3iOrKNI45lUu+msSQXsrkiVBpqZafB5DVXbVZGqT9/4Ggm
	7TqjFm1RN79RLqQuWj4y866cyG+be8mTypXWhB9cSxKzCrEJ3me13WitqVFWn/ES
	r2luAhQvuBKedTWMuyas2fgIakOqBZ1hRdR2D5krMftCnamTvMi97Zc1jRoJ0r9k
	Ld7xn7A1zRWa4eSEXCDN0MwRnjxaUkqwJ/kEwxhY1X6vq6naIMB9wnWcO5iF8TaJ
	WHHeZAzv2NGBPd2NLmlBMhFRDrxwhWa5mAE2GiUTH3425NOjUkuTaw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021125.outbound.protection.outlook.com [40.107.208.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7m0yh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:43:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jgw3SUhto2s+u8DbIuXChM1/xKsByGfL4w9g/rTfr612sEhfm6mHV9cdk6nR4DMdsxIiJodFvNmoobEp4LQjwr/M4e6K7FQTQs17CdGmRwbsmYC8gVLTwYrg7TkUtzb8O4LKxdPqHcChT4TsprRkeRsMePfYc5DfgqdDz52UOIKozidoRWQOPOsICJRxee8oa3yD7ZArWcMDrPE2FgSvk5Jgg0GE79JPg92RoaA74d5REk38nM2ay0tQDTuMkgCEwMHhf/WpFx/KN92R1vNjaCt0E0JFJ58BUYOzc4O2n36xWjz8ekPbBqiSd0pMeUr+fulun1ETWs2Pzz8XWVTXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYS6JhgtPjPNnSPHZzrBq8zbuAqmko1DBph7IwbYTIE=;
 b=r9fRMbm2IkeMA2BmSR0U956n2ZrXDeb2OXgXbttrzY1TYsD+Dt8O2mlG9GWxAjTwbaL/eY1t8/eBWL9l7IcG0GaEdfl2OWjnYcvPuoSJI9GG7MtskRXAxnFu5ZKOQYd2roikU5axMEhrJV/g/qYS+cejvjRXLxXua+He6ga/ZVMO3VzmN9FddFKQycvivvO+ivk5i0mJuV/lCa+Og4K2bF9vrSRbrPZyCLpFNDlDBsQqETOQD/6WRVpKRc5c0nut6zLrME5xC6N5SidQrorNsQcdiMmZb3aX8v+t4SfsF9h31hXtEBUsATaqwIZJjrZYCULCMhj3cw7C7MEmrKV8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYS6JhgtPjPNnSPHZzrBq8zbuAqmko1DBph7IwbYTIE=;
 b=ADHnsNCB7KMVzS6ZIhVTZakwbEUZsIo3BHZk4vCcj3Jmrrmh+cIixLyjrEc0+o78d2Fl1Gfks9NuiXVzsyjF3AJ3O8BPc1mnvqFN94zoF+DODg4w5GFwNXhuSIPXkJi7QQgbusrEKjoszMlCNkYlSfwdO80kIzkx02xwsaXrsu0=
Received: from BN1PR13CA0023.namprd13.prod.outlook.com (2603:10b6:408:e2::28)
 by PH0PR19MB5162.namprd19.prod.outlook.com (2603:10b6:510:91::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 16:43:35 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::c5) by BN1PR13CA0023.outlook.office365.com
 (2603:10b6:408:e2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 16:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:43:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4ABBD406540;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E96582024A;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] Yet another round of SDCA fixes
Date: Thu,  9 Apr 2026 17:43:24 +0100
Message-ID: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH0PR19MB5162:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98688b40-f9db-4cd3-8eb6-08de96572370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LJ1fgKYZsjUwy3JTtXemlNfAgVfVAUB2QOupvOcCMO/fTmpHaLahRCfnUvtwA2LomyPuV8J4KBc1J2DDwtfQ/i2oexMXAsSCLbnOp4nwL1ENTnN939lXJN2zR7BO/UqOUg3te7loVbR2QPBJP0CVdf6iQFKBsk9jmLfXNyJYJNEbdWVMEfz8IvJcR+T01VMT298OtmPCPxsxcKa2ZvJ63fvIHxwfEdDMU+CCSl7ZONIrkh8pkPOyS/nM/UlYLZ2THwQcO3bifstt9FYj1yKZzq5X2Sj8t+VmXAP5AVKjmJ643nc0xsSeZkU8gR1lfWQvCemnxmo0m3dAG5vLJCL9yTK1vOFrbZFMiNertLTV5mbnxNAbZKJwnmP0LedtalHgr5GHhsftrNL3UaCJ8cmLduv+idp/zoYHsxGLiV6y41vNd1X7diXKpeioVl2fMUGP7hpsy9NryoPc3/letEpEUyiWxak4sUzDxYzEpQWJnkvljjLGxBSaDKeqEIhRbzVdyDiGSzmjLUTrr8xNmOQpar5ebTG8iHeg0XXNQVsLAhhK+hg9alcVYxncqeBozqEqoa17W6iycQGnlgCqZwp2iAJlUhZEBl0E2ulDRjRKLcnzqL4T32GoH1kCUYd7mqkb8RoqYX/c/2JCwTK7Z9t0id/eCiI2s1X38l3d/ogPplKs7thHXLnr6GYUWrQ56hCzqaS7tQZ9aymayO829pMFIb5B8r+JkzGEyuf6FXKtvoNCpvoJxlCMd3QGPNvb6HVUYbwXgbjvPeuARnFx2yHbjA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R43n4Y/z56vT4lUuotTZ87/1EcRrJee6Cmnh5cCMLbfgzcqbz41sBM7ngz69gm1vFaCzlr1RkeBlRVEFhJQyMfWW7IPv5iZ+6I1XWixZXxC/uGQb6GqYw52xlZNKCPqkgX3ghePn+pPilf4MXyz6L+HVTHnkt+tOThLFOLp8wONxyu9wAiFunD0Z1BUjDmvvBdFu0AGzO3JCjLTd5gi9krpQvT8BSyWc2gFz1/MQeAWX1eTg/MJ491cs/f8/khmIjcf2nNm3mIJNfQxC0oEAQBtvHoKWba+6UoGPibOxIWfYnvJfSkfNmidXPWDUI0iBhTVH43LqWf6POlZ8e6B4uHNtPAqdiNCLsAPso9YbPSgd8hV+m6yZsj94fuQ49OVLnUNN8IYdyjK3rwYSR/aMnyEVJlOOecJr7pamE2kus2rIeuJTJgToPlcfLMItKjYg
X-Exchange-RoutingPolicyChecked:
	XmmkxRtwbaRZ3C41iMo2cE8EYvk5/k7PhiXTpqpAL7gdbB9R/Ndqj/BH63xTrU235IutfZqUZCNSqMEOdCEcinNbqpEUh3+5Wd/01gSapeA6MB3ZxHaztXSUOPYZ/1t8oGfzym3p9Y+PA21d8KXBsEFNnFoA5T+fNdNEtUq5VoAQvzmY1iU4zXZC8duvyma4hVaoBbxo5UXZyiGWROduQeGlBa5oOB+doI3XX1G3kOJdQS9ypYrtt4YJE4a+7Zcb6CJUR0qUEpqp6cB5qOpZsBtS8Fk3DuwXXrZA9w+fP2SA7N5fo/brm8fIO+Coia+QggqRPeXWfvNJ4dsFp5IF/A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:43:33.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98688b40-f9db-4cd3-8eb6-08de96572370
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5162
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d7d73c cx=c_pps
 a=staW6poURGFup6Z6Kk1YsA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=qsABkgEYxd6fNIf-85UA:9
X-Proofpoint-GUID: hqF4e5ZK35FTOPhb9fHTT8WPTDsMlGlN
X-Proofpoint-ORIG-GUID: hqF4e5ZK35FTOPhb9fHTT8WPTDsMlGlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1MyBTYWx0ZWRfX1pxu4BWUHuQK
 zwNnnhHyyjJP/qEq5S4mW4v4pVlgmKFMvGtl6a/o1RWo3t99C9ewaB/94PCeqy/zxWg26UMg7K6
 ceaSSaaxOuY7+/IUTRGA9CR3ORA/c0GAF6KarNidl0/qbmHzLixyqX7x30dSQ2VBFfzicEBtxtP
 wwcmNZX1Tsv9gpXNJMxe6gX7O5Vl6lEJCYRxihjRVN8eAz4/P+mzuGsD3s81tVeA1p4nsSlTfDo
 bDVa5E2uBWRY7v9wdaY9wULgn/VcyxOkDJ/6bxJLhOR0do8qO1BF8DKzHIrQRC7gYeS9oqSQ3S9
 afeTf0Yrfag3k+fmyYvhw7cY8oJhC2z2kgtKyu5BvCah5wbmroVj5P5KFlQJ0G5xRAiVzbgjiml
 InwB2J5hLqbBc8yL/wJ2T8BnrF2ADWL1U0gtoU2EkLl03vAafZxrwsHDuD/VoOtjHmjtS5kT6a/
 op8A+41XVW5oGH+KsBg==
X-Proofpoint-Spam-Reason: safe

Another round of SDCA fixes a couple of fix to the IRQ cleanup
from Richard, and a minor tweak to the IRQ handling from me and
an update to the comment on a fixme.

Thanks,
Charles

Changes since v1:
 - Move cancel_work_sync() on boot_work to bus remove.
 - Add fix for kernel doc error
 - Add patch to update text of FIXME

Charles Keepax (3):
  ASoC: SDCA: Correct kernel doc for sdca_irq_cleanup()
  ASoC: SDCA: Tidy up irq_enable_flags()/sdca_irq_disable()
  ASoC: SDCA: Update text of FIXME

Richard Fitzgerald (1):
  ASoC: SDCA: Fix cleanup inversion in class driver

 sound/soc/sdca/sdca_class.c      | 34 ++++++++++++++++++++------------
 sound/soc/sdca/sdca_interrupts.c | 24 ++++++++++++++--------
 2 files changed, 37 insertions(+), 21 deletions(-)

-- 
2.47.3

