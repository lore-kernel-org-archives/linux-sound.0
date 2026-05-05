Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05B48BD3A;
	Tue,  5 May 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997507; cv=fail; b=n8D6nobeLMptkl8ME3jsH+5VLhmuFJ0feyqJyqzo3q5piY5bPEt8v8yiRPrA4zaHTsEjE3okaEtu6uriHMrJBBB57Md/jEs5OHXWIhL0Ioo2bF3LJDUuas55viJtZGxGfjf/baqR8Y6T9Bsfs+0WnJEasOgf/JW7JPuc5ZHxLlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997507; c=relaxed/simple;
	bh=njXNgOqaYlsPqFsKeMIu8kmWBcxv9G6JrNqe2yO/KFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fsbsdXr75wiLpjQ1OljzwOhlDIUW/eaz6+bxn8pYilZFC10o83oFtaQcg6/CMUo4TGV55JUkc3Vb9+qOW/yuj1c3iT2evSuoSr2x8fjkJWo8afA/XycMg4Bjexn44Uju1sk5nDNn9oAH2B2HtyQNutSbatb9CI3EdvMqmqXn1jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Gb8564vP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vNX6qri9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Gb8564vP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vNX6qri9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455nR0q1839970;
	Tue, 5 May 2026 11:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=GmtC9/wFlQPpzIdZ
	7uyqVxJnnO1I13Nyk4nhhq7IoLQ=; b=Gb8564vP1PuNnyhRKKWn7PpFDeums3r3
	nCY+T9tauWJbNgfewsk2tIAyJpBjfp9I2/bg3YeiAZJ8tKRSbGhuSRwGx2oue46p
	nBrKIA17qdMqw7t/LOstyWsGu1m+PAKTZxKLwBQ1+FHqRf0sKzzIBuKVm6furFcv
	eOaa3YNDlxKUTxBEycR79/x3IXjJjG9btq608N7CHUsbpuMCXQj8S+61NK1mGwMc
	/comi3bNTTNsZ78/63Zq57M75HtEPI6EbztXRr96i6X4N4n3adkN4UM6v35Z6dyT
	zh8LOqooS9EpVGMoPDfOQV2txa61fv7JFITrahFjNqQBWYqG559jqg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022132.outbound.protection.outlook.com [40.93.195.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0utg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:11:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGbgeFV9gOC3kOfAHf3l6e1LHm1BRkxvldzbqidVjA6fRiCFzVEWM5LlpwstHPLJMxCJmf9qiXiLJ8nID0Fzz4/bk2qxnHYQUg71PqhUZEjRENnpqkBjcw3ML5crhSe3ak1fml8tturaaAKWZq5P/eZzz5kiq+5uRznx3aLz42IY3pBjoE9hJDGMQTW+NQv+ZUtihRwUIpcfuJSnGdWugT6nyeHnP9vC79oIhwAcvCX7/7JrWFt/XWgzNTiqDiFMAuigzi24J6PRxUqYcIHGTTnl4HXShzM58/LBittba6Acwwcb6QoUBb8yySbu/tR0EjdyeQaZKRpyA4sH+oDksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmtC9/wFlQPpzIdZ7uyqVxJnnO1I13Nyk4nhhq7IoLQ=;
 b=n1oa2z+7bLDHaXSBJuccZNMhSn2CMbTyM+Sz+3d64TmPVVuxLTYyZgQ8EkVG36GjAaZCRtuKrXX9kgrDXS6IWnJ9Egl8gkK4XUlVNx+QPDJFAZpDnr4AwP6ZilhmFXKc80Jgwf4wMmyYnIjeM24LxQCilFX05HGaIo4lM6HBfvhPdQeYKKucVMohPeUAqzTUo4gDKWUUkOUELzteMoOoDPxOyCueIkp1Fb7oZWvayX0nkjBSIFthZUEcrTG6xfQHSqAbKZM/+5cSd4u8ZfS8xoYYf4j7K5lDbrVuldfSaWwG5FVpqxfpWr6osUBMVBshvxmPlk0FYJSEVBi+vkmQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmtC9/wFlQPpzIdZ7uyqVxJnnO1I13Nyk4nhhq7IoLQ=;
 b=vNX6qri9QcrKfgUBfseD5BhJODTtvxgPpA2x9FPW7/gTPWS92fVD86Si4MKIJdWHtZ/11oWJZAfRRoBooTpVlgXdXiRZE4q7/RtNvVoCZcA4eJZoSL39mr3aA2IDI00h/iJq3doe0Nv8GGwfb736daFPXCScH2C0mNpyH3NWGv0=
Received: from BN9PR03CA0656.namprd03.prod.outlook.com (2603:10b6:408:13b::31)
 by MN0PR19MB5924.namprd19.prod.outlook.com (2603:10b6:208:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:11:26 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::8c) by BN9PR03CA0656.outlook.office365.com
 (2603:10b6:408:13b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:11:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ED98B40654A;
	Tue,  5 May 2026 16:11:24 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D43E482024A;
	Tue,  5 May 2026 16:11:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] ASoC: cs35l56: Fixes for driver cleanup
Date: Tue,  5 May 2026 17:11:22 +0100
Message-ID: <20260505161124.3621000-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|MN0PR19MB5924:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6e2623b-bf8f-4b55-0078-08deaac0f5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vUftSJV1kS4GQ6GJvVeWegYdbkOSW7Z3aByi7EC8x0b2Pa7KLPCQS2t9gxA7olAlP8z3NO7phQAC1INUyo68xaGzulE69joSp3sjKkvfGauhyB8m90MhNuq/8IkcVxtPJamPT5LCbdCyFQtLJVrEskA+t5AR3gQQ0IVI7HKmMmH+0e5psFNrt9MpZDcnPI61Tty+cqMzksg0ApDoez3bOKCcLc5LS8kaI3uyT7NdIR+6LcN05eUWWK86pcLSud4ny5yujhJQy3URHxFk6jb/chs2ELUFj63Xe1GVbUbnW4ZAs+UmLGy/fO1L583NvR/WPW7uNnEiVKcTehXijQi3GhuQ4WK4mq3opcYxHNx7TOqoOXAeLOnyqIXAyDnXr7zxB10m9vazAnvBHqGe2ipbJKFDDTLYQzIUgOjls5cMv39EJ/eOzX7ca/Xi9Ur7HHMIsRV3pdqDkMUai/HennHo6EI1ok9Rm9PQ3+8koF1q1msK6TgLqs8TPHZKJfKQzg6I6wEe+1LAcPogkHAENUVHNH/N5sWQm6ZlVNt9Tgoq22afQKcKBUqLUdNfACeKf8b8JkVJopYSHn+XT6K+rSCcNy0PjAyW+cqWVroBAENfKi6ZzmrYl3VxKI2p+Vk+aXavwFRGvXCdszMMewbsVtMBtmuUbwJJzOdwmEaeQ/jUjqGzuAHPaOv6BiI6hYExlStjuRqg52KptpL7qCPoczJZ8gUknAbOsgIomUy1fuhJEUA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YVFSL85SZMFRk7HfvmQIKec9M7AqRiRoTZO1dLYUvBDOSEJEZPlE6bcjykCmcv9kThJu7oaoRR5Yak3F+8PFU7ssUpTjuiQLNyB9ZyNUuifzdXYw+EJFAP3JooXXJKGypC1cJ0CUXF1C6RT/BD9zhphxDWCl9pw6A/QBKkrrlUxdHCzEaRMAWQunCIQQJG6KH1zLNb3tEmWOJ0ocy+t20a10VLtWwuhrBfuXoKEOEO9hOFXQvmZdjB7EaMqVXxPR83eF8O6eoL+8QJ36/26wPTP86iPCviWo6V2z5//u4LSMCYoW3ifL6ts0IvjeUBhrinMgtZdMhsuZ6sp3DXbKdWd/aS1kkE7NWkjlRQ4UEeUAfYVzAQ1fOqSnQxoYd23cJUkjnRxsh+di08ZkUcLOSTbZ3P2C92QvhMg9gYbiz2v7hMuwt5RuphT2SqFSmMeD
X-Exchange-RoutingPolicyChecked:
	UCVrlq3J4kmp9Nwvds5ozlO7YsxDOCaA/8Ym8fU9sZBv86eLbd0WDdm5pWYD3fyIyg7JmBG9tlYDEkgDAF+JHyQdEpyL/L2hF9Xcze9q5g+pNRLMVE5p7MfnQR9E7wTWgsWoA/JIicjIT9elh5yGE96zeYtJ31oMGXMr9/wcWVxadaagq1FgunIbqyEZ+oSvfKRMab8ocZ5bFgjL0069BHCuvImnJPtWSfaJTANswwIaejsUiDGOGkBkHXqyS3mnDst9OMF0uXjFZH023XvVporI7YQGgspU+zdplXokgIcFVelGXz9tYW8XFRHfj9Qs2NJEdzTVESnaK8i9qmnHmg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:11:26.4439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e2623b-bf8f-4b55-0078-08deaac0f5bf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5924
X-Proofpoint-ORIG-GUID: _ei5Bjmes93gc31_vZMlU5arTvOw-vRh
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa16b5 cx=c_pps
 a=oh9iHeRiPYGBlS8CzTurag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=z6tBMWnnoU6RJ7Y8pMMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1NiBTYWx0ZWRfX+6uTPppgHafB
 oPp6Cbnp7HP4o5muHlkD3Nc5O/E30k6bmEeFXLQT0lmHTV4awQClIEM1FmaEtb1UN2/eOnSBBWy
 PVzWx6Lk+vOV/eYyZmlm9KUIMxDrXLfOz1RSx94yshDptMQxOsEhxdRH43ebeckd47VvI+oYalJ
 DIs3bdUYcZrdKC/ocDq0+Cbayattu/ChaMruxazr5PumB0bDhKDVmypY7Er7Wgaok/xr2dcoO1Q
 dJU/YftDBjffn2w2TI/UgRr7Z5S4bX0lKbd6Tn2OlB1EVjj2GcXm7aOis+8QGrcMWN4M+N53+gB
 1f5bcfqkr6Yu+KOUrD3hkO5+t3AXOCHHL02hFqjVPK/nzF7Bt+tZvkBCajMEaCl/PnlswVrlZHc
 q8wJHD0R9i4jTmXPC3ORfd7LDlXgLKaVOE2aKZfJl67I31DT8eI+vHx+j6rOVFUkgD+v+MWG1nF
 ntK+Flz/ovoBwNk9Odw==
X-Proofpoint-GUID: _ei5Bjmes93gc31_vZMlU5arTvOw-vRh
X-Proofpoint-Spam-Reason: safe

Two patches to fix cleanup during driver remove() and the error path
of probe().

The main purpose is to fix cleanup of the workqueue.

Richard Fitzgerald (2):
  ASoC: cs35l56: Don't use devres to unregister component
  ASoC: cs35l56: Destroy workqueue in probe error path

 sound/soc/codecs/cs35l56.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.47.3

