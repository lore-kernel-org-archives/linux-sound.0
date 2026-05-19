Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD259370AC0;
	Tue, 19 May 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190633; cv=fail; b=Y7Cmj2FEmzaV+XWHkpOeAPQkpvjl0OiW1WzW1KmURy9aLtNqiAHkEJvml3nhSrY38AEPtSdb7/pzqpwxCA/w6wuuF/fCNi2QEpwMbiPzJ4MSkyFbrboLf0SOAS7hgByRY1Yw+5eJb6Gtah6gl21pNzRyDMusr7E+PdEWvgUKTO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190633; c=relaxed/simple;
	bh=IBCqjeJr9fZhUp/bH/a+EfN/bX+KJJA7tnb7MZnobwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IT9yAy3Ce3QIE0fBeFU1jEr3cwrPiYjxItLLzi/5y3y0u4Dvl/XyeitXMmg1bSs4D5bRyDZWAesGI9GTIbSCqDDFFZFKqCbHwepdSYFH3reej4ILfuRvSAE3fRRmCYPtk4fw4qbhCt4UfL5y1VlGVjgnq49gETAbLdyXpP30wXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UyTQHXOo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AO/HXV+F; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UyTQHXOo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AO/HXV+F"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J3v6Am1164414;
	Tue, 19 May 2026 06:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=7Ytrbm2ORHTsicko
	fNiwlJkxLqY0PjuAik+Lx18kWGY=; b=UyTQHXOoovJ7fLtImuX4/UaWh6nJkvtu
	G2LNxZxXRPt42k2R4wrUfUDntsj2Z8o6NF1ZRVKK4QyfpmcgqmrqOLaoL5KXu+Cn
	OpxIjwJQZDNCyXr6At7yQO0Xv2zQ3oYIPiEWpybNfQSJeCJnW48h6uN3xpNHVPE1
	VbMJYh5UrUetaKCfqRfnNFRnu1wG9Ygafgtms0Jn1QT91KD3wT5BMUyD4uLUAhle
	WMADlzszzNoYtZS/7kAt/Fvf5wk7kVcmLiUk4NJfMWbs1R9xJu3jy0rAoCg9LIjM
	0pfGyIRmRQABrqIN8yyj03m7GR/vHwANhtmYrWcz7q+S01H4hb7u4g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020142.outbound.protection.outlook.com [40.93.198.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0hbftp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:37:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM8KPpsyL33bONlRQiArylMkabEPkbHqLLn53jfPy5N8UlJpB2e87GkOKz7X22wL52pxJqiR71SPOm8m+xJnHA2lsSwFi3TGPm5uXmp2uDj3NvRdmbhICA1VT5h4reZUeEvIS3UyYbuKwYGN2ULLzoJFxK+TPvvL8bf7KIbjANTvkU/80a6N5R7yMTv00UGmijcWY2LYA50pHl4+yJI6WLjfa3mij5yk/Eub/UB9Xa9d6kaDjVczBHyXawR31wwaiygQXbN38qTvom4RCGIeLcCNhOqQYQGTA4XBZLHDeC/CESx8QxRXib/CKALaT/VCfBN4E91licz0gmrzfULASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ytrbm2ORHTsickofNiwlJkxLqY0PjuAik+Lx18kWGY=;
 b=UkQdvcJr+9Vnro8ZYHkTLtgHUUAishNaUHWPe2M1bgn9R0SQIaIB+AUBFMx88PoFqcASZXf8O+Wc270z18PJmeaLfbGO9fb/VuzIQEmETB6hrysCnY3bt+jJ3Xwu92YmmodifoYPKqc5t8Pm7WXMJGiQ7reKq1HOttDOnVqNkQbvp7vdvYygbgVxH1un1kWtBlsmfvywF+b9itXDO8dsD0a5o/NV8WTF6zUc8NoKjpbALcgRRDwUwpMtePf/xfpBHdaUFbvIzFk3TQnn3NP1Ji5CHkTV0YXB8P5vcVSLgktK7wh5Shc1NLfpsTu+bbY3TfhsfqRFB57JrqFljQkjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ytrbm2ORHTsickofNiwlJkxLqY0PjuAik+Lx18kWGY=;
 b=AO/HXV+FldecuAegFQrdA4XhEG+TddR3L3vfufc8PuM2uimcmHyXr05/d7KMYbmX1LyH5G7YUntQhsfF298a35aXJhvvhw6u2KDdJ+o5sGCJM1JLHrVmMO6/cn/TNL86gkI2TvPEN7i7bXDhTyjofe5/QSd8jVnD5403syPT4+w=
Received: from SA0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:806:130::18)
 by SA0PR19MB4442.namprd19.prod.outlook.com (2603:10b6:806:c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 11:37:05 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::13) by SA0PR13CA0013.outlook.office365.com
 (2603:10b6:806:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Tue, 19
 May 2026 11:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 11:37:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8BFC9406540;
	Tue, 19 May 2026 11:37:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6D6D2820244;
	Tue, 19 May 2026 11:37:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] ASoC: cs35l56: Replace open-coded SoundWire regmap with generic regmap-sdw
Date: Tue, 19 May 2026 12:37:01 +0100
Message-ID: <20260519113703.393210-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SA0PR19MB4442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d1b7b1a-c94f-4df8-0dcd-08deb59af3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|18002099003|56012099003|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DRcmt6MhO3Lo6BZyleozl1eDMTwWB0ZpJe6v9MN5jyNhLUd1ULopFxnl3I0S1+SWeGYQIle0fnXEHeJfp+8E73JE/uMlmzHJTUMoqkUHW+ZIuh33D4KtWP17BS9X+nOCKh04zU+Zb5jskozsrIQKXhCNowziqzEnPGlSKJUFHiBtMQnlgHb20+AoEdahG+0C7X8jWFSmtnsTx5D+3t1qSfYhxvXAvynJpNDm8IvpuI3QZeBlC0FV3t8cn36/jjZ0PG+zEV+7DMxmaOxWXWx9PoyiDeo4D2xogsmz+3B4E1B05B/+Mp4ufqTHmMEtavqIQPwVcLf31PnV5Njwtrrd7RJK8gYl/oCluqx0IbTvr/rr8QazibFinP0iTI2n5EoLD3v+en8c4NkjCbAZU3HiwX1mxCFWfcYlxpw+beCS2B6qw0br4eMJwLv4q7HWuffBtVzCGLqBjnNKhNP6ZCiOII0oiXQlX4gvu3uqabHtQOUKNXVz9V0xssRKPjLqCPm0xqLqbHBgMZAVdq+3Wse4KErz1bxUYzlFyV4lnX8y1UpWlLmLBNceDdgbQ2TKli7Q7Ug3isBy/aidp2vfHJv8wmxNf3kddmtrT0K+SWCNx7j15oQsPK+gRif7JmVblo6aagIoUvYxcSlkdqIyp5WQC4KUuvZbKA9lwRlHGNT/YWRQehjNflzib15uHWxerMnG1ZYYaeCJc9lGa6g92gk8tgz+643I0LCTHPRgbQ6YRwo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(16102099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f3SwTF2t/iVdkRQK5yoE6jhX7+4RpS3ds7PWeTzeCVhYSYt+zhkiOzRI59uAx4W0ZkHJA9hG4yLz6mmqHKCYR97FgmNEBJk7S1pW3RPMyVMecKG2O8ZRESzXbRFeizzmxVXDlYYkJDCUGYOe9ZRpGW5OK0UEBZQ+6eRmLwMEOMpK7aDUCnRCQf2rUdggbebHS1jWZbfE9KDmhVZpUcPJ9uY8GZLkrlLE0+5Idd3a/MCpJyS8JMwe7QiFxQlmcZSAbr0ld1mgrz3+zyKHOPJXD0V8wWHleGEJjPX7lkVDC6uz7xs0SPUwm7pVkf3JuHXoDPSvCBVpznZqR3TXAEwThKCSdYby+d0Zwal2DPf/Iy2FSxuaJ0u7MnJ2I3ApZPoBOK1yKKz0EmMq2gfMVTCkJw+aNpr5h/BcFffmySZSJGlVYaHJ9+P1F+z6342ptVqu
X-Exchange-RoutingPolicyChecked:
	Vssipj9bKKkYrWssP1ImW1E251rWPHjnyHUH4Wn7D98QWZM4udgozMb7S9P/oN68fHBuIWMyjD6nydFeeFKLfSEh4NYfLbtOiPVpAf6sMPIWfHIknWNsCo6BS/TaPTDVEHuovLKwwPoLJdG3ALEEzz7YjhH27Vyr4AA/LvgIlhc4Ax3FBO575OmACLmMCMZTIDlGdVHq2e5+XS2i0KJexAIOU8cz+1IOs7qMUtv+EadyRSzuYUFi7FDbP9B5Je2RFEHNzIxNoGOuZ4NXS1qZt6Hg4l4XoVc55G9ahOx8/ovNahxXqC1Bt82W5hJqVzrlj9imHAHIuq+/NpvFfiXqAw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:37:04.7840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1b7b1a-c94f-4df8-0dcd-08deb59af3a7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4442
X-Proofpoint-ORIG-GUID: N0evpc53HP1EBA9u_I6xw22m6ZxaKN3E
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0c4b64 cx=c_pps
 a=YKyxAjA8OJIaBAhuBgmSdQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=aXIz5WGUO8OSZWwI1R4A:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: N0evpc53HP1EBA9u_I6xw22m6ZxaKN3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNSBTYWx0ZWRfX7OSbOB/8gXpM
 4QDMkfqhbSHZjjXB1zMKfn9xV07OCE8OkmQk+T1D4/E+/EpL+y/u+UR9rpTomyfCdrGPkporv9s
 f6ajbl1z97B6ZCyxBH3HtGEJG09Lz7D2hooCtj8AuzLvykUM0K7jON8hZdH4eVM2FwKIBmmd1eA
 rYTAuGpgzuwULk/Ye101qX6Z4XzGX2xposZguu3FOnH5fyAdtDLKu4u1fPfZLWI84Ood8HiPrL2
 5hVarNBu8QTlnM5Yaz++X7PN386+tugQsZpy8OX/HcRP+62pbiaxGEt/S+n59Xsie/pVsbF06K/
 8PLrRk9OJgI/MELc4PaxUnm6H8zbun0RQQ9WQCSg6asBuZqJRrCEPGRHsDbfjNMFvXOxyYn1Vu5
 qnt7EWJIIAjiDcH1pR3lv/cRNcbyYWV48h/Pu60Jv0gZ5EJ3X9Nnpg2ZSnrKOEd+n/E77exZE++
 Zb8g3m7ezQrbsv51w4Q==
X-Proofpoint-Spam-Reason: safe

This series replaces the entirely custom SoundWire regmap with the generic
regmap-sdw. The reasons for doing this are:

- Avoid code duplication
- Avoid effort of keeping custom implementation up-to-date
- Prepare for supporting BRA

Changes in V2:
- Select REGMAP_SOUNDWIRE

Richard Fitzgerald (2):
  ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
  ASoC: cs35l56: Use standard SoundWire regmap implementation

 sound/soc/codecs/Kconfig          |   2 +-
 sound/soc/codecs/cs35l56-sdw.c    | 137 +++++++++++-------------------
 sound/soc/codecs/cs35l56-shared.c |   2 +
 sound/soc/codecs/cs35l56.h        |   1 +
 4 files changed, 53 insertions(+), 89 deletions(-)

-- 
2.47.3

