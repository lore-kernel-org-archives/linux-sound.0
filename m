Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE48299923;
	Tue, 10 Mar 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152310; cv=fail; b=Cya+SXN+2VYGmh+aZf/cjjlLyOgWEfCxOfpAVpWMpYPqpwzrE3t/qYGuPVYYMfw1zuWTlFOZK0/4BXuOOns0P3yRJh/WvyAroCMA8RyYIKJ4Ifrqn9fYYyj+cHIXkUWwG1YT/6qSUJscs+QrPYyFDIFKLd5qTOn2YfHBSjKcm1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152310; c=relaxed/simple;
	bh=n6V9h5fkwL/6DXTsB+lrnliU4Q3BWKhx0dy5xAmaYuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cJwOulPdfjprDTr9vE6LSEA5VoAl3xW6EBkT1XSEGJ4+/D9lWCVZnMA5k9ZCwuA16f08TYXm7DmFiJ8LLu0NcH/bkkQZ6NP2ZJVf+K85uG7q3Js7cLG1FS8OYQQ+29su2SuUvHLv02sWGn8+h4ks/+l+PGK4Ovo92NrQHbca+2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FKUqdRs/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=arrowOHP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FKUqdRs/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="arrowOHP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A4tHwt383696;
	Tue, 10 Mar 2026 09:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rSSC+gyaAh8lg1v6
	Xe+QFcZMvdbkNkGt7BHqgiTqKj4=; b=FKUqdRs/NDx7P9PDp1ygOQkX4Uy4xaJg
	NA0rnFteFMhfUIq2hHBvIo2DFY3+clKG8XpxYG5TTofieXYK4WygkemYtkgzkv3G
	LoftaVoM6upG5lvJR+vl8sfCozu7J8CQAdTWkmEkGGqZhfR6KWNbb4gjByzFwmn/
	JVknFLfvYPoCl6+GINQZ4Tg0BfF7aDyponrGvuft17ckGxTTnpNCQKqnOfLGQ653
	mPMlZGAgP5c6iva1/vOKFDRh29HZR3ZIX6frqv9g+w56PHeX1suKzbidnxcWlz3P
	NdQ9dMAdGcoEFEBb3iM5RbJVVEUl2UhovDmoni48rRsPLDbqIkXWRw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020077.outbound.protection.outlook.com [52.101.61.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4crhapbkfs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVS9qcGKdP9E3XQ8cuuAVv0Yq6k+YIKZ7njBk9q/wJIwiqdC5zt+c/fYzee1wxZAWJD/TfXz8VlMw/mtixgxiS3DzOrtD5IWzozndWfSUsPM4fc/MEt0hat32XYquWKiolliNck5M38bfzflaU4dAjEu/AcxI0J5ft6vKhtlMnayW0Bo/Lx9SOJCYYVfkM9oJnkUB4QuIcMhqk2V4YCuQJwsvKKx5paS7mOQtQAZR4jmsJrUUdsaTP3ZwQ0klOR1xwznAyUjwEz/+JaTqWev8JoV3lSu/p6feCS5fULKYwNrzoi+3h78Iiu6lAkR1+Mkop/1UodmdHuUjFsWZbQ2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSSC+gyaAh8lg1v6Xe+QFcZMvdbkNkGt7BHqgiTqKj4=;
 b=xcJyY+x2gajnVCkL2Tpd20Su8ZO8MWCzPp2vj8pcQWd7ejWWW6uZd7LsMR7PkfDGT2s6VIYvlx+MJ0LF3mYsQm+Lz6lGAxAEn2ZEBjilp9tNQ94TzRFZz9yCWDEckwfP9ZiBtNTltDNNSPwbDur3/ZMiee+jYvntr1hxmBk9dx2jGI+stk+KTyNwEqUyZ4hZnfcRsQ1EzIRbZlZDE1daKHecQ3fTyiSrqr9nFKOeSLezSeHqUHulfLzuuGptoHBDhy8tVZlzcOpy886YfWotixgw6Q2ueXNt76hra8cvXudDOxZB7Wnd2dFZrv9BPLk32bt/UGjYxjPGh8VJ38O2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSSC+gyaAh8lg1v6Xe+QFcZMvdbkNkGt7BHqgiTqKj4=;
 b=arrowOHPQbzTu9YwTcCq0fWR72YbWCGipIeEEUtvpOd53XT/Jvb1mIp9bjry+pomhGTNs26TBJAkTdStJ18k1iM+/lDgZ1lGwxlxgAB+jS+qOK7sP17mC8bhYudc4GivZCgHG9DBolZw7SDH0IUclDaNWE+FkinYJat23r/a53Y=
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by DS0PR19MB7669.namprd19.prod.outlook.com (2603:10b6:8:f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:20 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:330:cafe::ab) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Tue,
 10 Mar 2026 14:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1
 via Frontend Transport; Tue, 10 Mar 2026 14:18:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8DEFA406540;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 76358820249;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file search
Date: Tue, 10 Mar 2026 14:18:07 +0000
Message-ID: <20260310141817.1871794-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DS0PR19MB7669:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74f74660-1c45-4fda-6c10-08de7eafe167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|18002099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	npRFDAvaTRMo1rBM3hFT5lQxqDg/4lHQSLl2OYB2Or/fjzqADHIfZDcuDF3LRI+fZog19WY3vRV96s+pSt1o/0Unkz2uxJy5CDNRjflZhdxf1t+Ck6CL8piPUBDUW8FP0LBfQDcA8Hs8RDvvA0NGvcokJXLMrGhzdC5k9//IlotYGfgC4QP5UKYsTy7MR9SZUIULGnNI0g/OSQ/uYrGmlRycXjkwA94TRl2tuZzc3gvLDyej3v71bObeDf1YcphGcPCNJKb8qa/ciCU4v8ukUErlYuBngwW4Y+K1rrizk2VahJzLLXb0+lNRLgzM7CRguqezv5OsjhL7raYU5q4SY8igs/GvxP1/OJG9qUCitKALRVu/2CeykgoU0Wg2zsxApwuGOEPoZVBz3lRRphhNARJ1bCahWIkm0t7r1z7NAvaDPCImk1KoTBPey+vCVrxyKfL/QjPSWE6N3etQC+z9ZrBZCu+dx0hInRJTfcFMYZqFcy/Fru+tzjaVvxeEd5gGR+d5i3v8h7iJlSuq+pmTOP6dilUNxFjYm80T36xqO5RL1os8TnZIA/0h/NjGQ+e03+Xs0QZpnoM13wRuk8a+h+3K8axSxwjEwNCpl6/vp3ynJzUcNABtN7M8xq4yRNyf6ZCrjER40VIoPuCPo/ZXFJ2sHGIjTYSnXrwazxUSsm1bcc9d58Jn6mbBlQrlAX+SATI9u8It95I0yqqJ5TDXmBykjupAo3mhLAPqYYL1klil6Fm5t1tUtyrjVGU1418qe3/3JXYQkgx8AyJO9GPHWQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(18002099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z+LoO5epo9LA6AH+aUm2LOThOge+3kHJDTgsJpvFJKgjfMS6ob27Wq8u0xqKmzumVgdtsVHA7ML3gNWo5deS1n8UDS5IIVs/yOlheuht0VMXu+ltdBZ2gNVJEwPU1zgeqtBnGrLzMbp8YDNvbnIirEPlnNXt4UScCWS4bSeRSITL++tKqcc+QcdyX6nO6DTqid+XvtMdHFA1freQvVetKHds7QbvpKOUZok81uHTeU0QsE7nwUCCk4JSxVnRj1nRBRJgoerlXfVYwSlqQ2Bfdk8tFT44kOp8n82Wsfk0lapXoOwgUVYkIXIFNj+piokKYjPwb8cZZxv15XvdjqUUk+BKkLzEqGNaTb/4KJaXj7VvE29jtt635Y2WCPFCDzCAO+rNGil/bUyYK3bevd4BGXuhdLn+zRPFU9n/XMf/jZOh5y8g0Y95ZPcE2os3lE4U
X-Exchange-RoutingPolicyChecked:
	ij7EIbgML8701SXTtJdZU3NkYAGqmV8jV9BRwoMI2RDAN8Qxe7rRuVGgdejagvqFUMHphfJjkWhrK8Y/PSYPi1xuMnym6ghV3L74KTHohmJCeECUsikZqjGeUMXRK2byFNlVt9L/TtsHrYfGFSc0XO2y3fO93CSmUaNExGQRpXsp/oLp2Lfpy9fdvMYAntosFJnraelDdAUg+PpoxtPSdXiADgK+JVJMj9c3DEH5gM0NVDCQFTdWrG0KpHNbQCkly3kx0DThNA0RSAFgHeCqyTrwlo13xCYsi52PSqDvSmgKGep6wfkVGLxXhjmAI5ufAOPrBGUEpFbpKgafA2IWCg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:19.6016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f74660-1c45-4fda-6c10-08de7eafe167
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7669
X-Proofpoint-ORIG-GUID: uJK294hyPN2ECOo3Ie5Nn-Lw-_C5vdyi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX0+ZLb0H5gNfc
 9CamMWjdTKEx91YPuFX6VlSnDou9MP+IdyInA4uU0PSWNZnFOdXY5pIKhC4q1gZt6QBoLsKe3Mk
 Ejt2A4QMTUxEMFnPwudKfUK1rR0KFpw9kIHOoF8e19FK9ouh75DYQRtIAPQW3D1oDvpdRlzs9KU
 g67uFEyC8lisv/dz/8OYl6USswGkPAOflc3yC3I4a/B4MbbqIudKcmdY/d6bg/c8hffGHAHWEyG
 saIO+ogK5vHHxixfLiEMH9Low97yavBYwNTOt8wBF6g4uV/VTQgXv+6WpYDq5fd7iQZj/YILSuT
 eSrdi7XMDYV1cMBesZOva++LftzI6mDQ4oNrLQMDBxA/czR9TLqIHVkiK678N8dIhvw454owawH
 6461FEBTQx2j2m8LFNP891DamICKt1o/P8fUZ326FuijKclddeZLpJcBDgIg3MIRh3SZelFwcnm
 5oqqsF3ecWX/5JnXp5w==
X-Proofpoint-GUID: uJK294hyPN2ECOo3Ie5Nn-Lw-_C5vdyi
X-Authority-Analysis: v=2.4 cv=EbbFgfmC c=1 sm=1 tr=0 ts=69b02832 cx=c_pps
 a=7U4m4OLb/fLdbCINIKyQHg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=nIy3FiPaNfd1R73Gt5sA:9
X-Proofpoint-Spam-Reason: safe

This series makes some improvements to the code that searches for firmware
files.

Patch 1 is a trivial patch to remove an unused function argument, before
   adding any new code that uses this API.

Patches 2..4 add KUnit testing to prove that the subsequent changes don't
   break anything.

The remaining patches remove duplicated code and clean up some of the
implementation.

Richard Fitzgerald (10):
  ASoC: wm_adsp: Remove unused argument to
    wm_adsp_release_firmware_files()
  ASoC: wm_adsp: Add KUnit redirection stubs for firmware file search
  ASoC: wm_adsp: Export function for KUnit test to get firmware
    filenames
  ASoC: wm_adsp: Add kunit test for firmware file search
  ASoC: wm_adsp: Remove duplicated code to find firmware file
  ASoC: wm_adsp: Use consistent error checks in
    wm_adsp_request_firmware_files()
  ASoC: wm_adsp: Convert '/' to '-' when normalizing firmware filenames
  ASoC: wm_adsp: Add KUnit test cases for '/' in firmware filenames
  ASoC: wm_adsp: Use a struct to pass around firmware struct and
    filename
  ASoC: wm_adsp: Combine some similar code in firmware file search

 sound/soc/codecs/Kconfig                |   14 +-
 sound/soc/codecs/Makefile               |    2 +
 sound/soc/codecs/wm_adsp.c              |  234 +++--
 sound/soc/codecs/wm_adsp.h              |   19 +
 sound/soc/codecs/wm_adsp_fw_find_test.c | 1221 +++++++++++++++++++++++
 5 files changed, 1383 insertions(+), 107 deletions(-)
 create mode 100644 sound/soc/codecs/wm_adsp_fw_find_test.c

-- 
2.47.3

