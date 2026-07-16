Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC41423E99;
	Thu, 16 Jul 2026 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208065; cv=fail; b=ubso0TSCECn+XWFKoboSfa+hZXwoSzRICdd1jD6M0ZA9QR6vJ7keOIa8ty/lTCIBmmYtW9SFtJHXuln/5mRIi4cZDCY9mRZdPTSMqKZysq7BK6xgkIwiZAMp7bHwe6tT6bf7rIKgC/d3zvNmgNsd/ihDjOTKYHU61P2A9Z9s0MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208065; c=relaxed/simple;
	bh=PVgHm6GKKvqu2dGx2sFGmvUfk6tNnOE7tKz2DrBJS0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k6ebivepIVZ3kieK3z+5yUoustj1LCMC0enL2eIQ4OB6C5L5hR8dGNijQamF/is7rrVjFWkVqEjWBzqJEmRKIyZqJxsJyEDYKp53a6VaADdswRvv5jbZNRIiI/T8dliFcLxKNJjERVsoMCwbbHEYfeABhOclupRkHOKQD+4ZGRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pfnyfj5P; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Qpct36BG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pfnyfj5P";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Qpct36BG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G6mTHO2864766;
	Thu, 16 Jul 2026 08:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=FBt+fU3jT615wRFJ
	V1qJ3xfl7jEhO/0eZK7eYlGZ9VE=; b=pfnyfj5PMWpeOh9BzGe/kXUsmzntOOCW
	Qj3F37caAZxTvhxId1D3qr5iq+iwsmvKwdQ6g+cv2qtEjNKfm8ZZ/8LSJfrKhHTj
	TGJ64gTnZuctCoo1Jbx9tPiHHpaspboHPKIxKZrUHUy7u71viYXJWKc50gXYeSec
	KOqd4ABEKvkqxdjesks+O7Vqd1CJnSwgCG+7TIU1Mutl9XuaRRuPMZUKN4jSIVab
	SBw8KvOHV1g2h/F0l2PSzfYE3CuJJREExGZbDXWro/0PKnJWARskL0T9pbKhx4Zy
	MOD5fTWa0zFyND67fRY9gv0EWl6wbuJvvNbCdO/1/4BWFGfm4cDPOw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021079.outbound.protection.outlook.com [52.101.52.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vy6ng-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 08:20:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R89pS8auqMjvebcNcPpM7x0hyz0Rh6A2gQc+nBMQBwLLXLQfHYsZ+SGCVwGVWuL2T5ZCz/VKRFqKExYwe2HDk7B51tmOyBHcViw396mp3RUK8LDeqQGLnAg58lfcKpbLK23dSFG0OdUWhH0EjHrsq78yl8DS1FRpSRvyg7F6xjsuUXtEAIbP+F06ArehjKGsGdizh9gxvMM4whkAKqUTYTKZDa2/caAdBZG5nlKCEf3x8VfKASbWeWExJRvUNZ/q6z0mbANkoAQhxPib5zSX3iaflonDDMa1GHbozwIvDQ9yRnmLzbEVSS85qgqN8zQKGH6kF6uB09JZxhwPerl0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBt+fU3jT615wRFJV1qJ3xfl7jEhO/0eZK7eYlGZ9VE=;
 b=v18Pzrb3H+aNc652wzfFAVMOordguTAWMJAE9gmC7PvvZuZn/hVnHwEa2BGTkjFxongxzu3FMXb6ymnwWcpKeL8qto671cL6sN9yX91/h4wTQJDbHAMeY/0QZCcUtPThbTCV5GAAqWNpapKOdRZJvVLIypXbKNskr0XZEm9au6Z9GReqnTv4Ndys5UxnkNHww9j+0lY/oiuFcKnk1v6fe8XukOJtaiZl0UCYmJ5zUGJgoOBZYhRd73vpCqUwVU59uXmcwKe3T6JmOujlq1lNMiD25g0D6es93JfUOQRAUvy6Yz7l3MNqql5BpEAS45vCXJ+mfYBMv5IKhmrhl6zzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBt+fU3jT615wRFJV1qJ3xfl7jEhO/0eZK7eYlGZ9VE=;
 b=Qpct36BGgDEhTN0Mp2oPPIxlhSKGQuHGHHNwT6iDJSTAsFUyIy8C7rsDJpGbGRsshEagvpfv2DxwG7dV1sVG+DFlXzg9aDUhZrAaFF5fzdrj1zgeukrvq5lzt4Mh0OTWjTRSgxRomMpHKkoURvEtyj3dNJUdhTAZ0KXCtO8kmVI=
Received: from SJ0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:a03:333::23)
 by SN7PR19MB6711.namprd19.prod.outlook.com (2603:10b6:806:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 13:20:48 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::5) by SJ0PR03CA0108.outlook.office365.com
 (2603:10b6:a03:333::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 13:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 13:20:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C7BE6406541;
	Thu, 16 Jul 2026 13:20:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B031E820244;
	Thu, 16 Jul 2026 13:20:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: salman.abusaad@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Fixes for deadlock/hang during component_probe()
Date: Thu, 16 Jul 2026 14:20:43 +0100
Message-ID: <20260716132045.1469156-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|SN7PR19MB6711:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 29ed68df-87b6-4059-a365-08dee33d0c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|61400799027|376014|56012099006|11063799006|10067099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h8WdLntt1VVK8mlx+xX0aWfpBVmE6RWSErz8zhGs0tUyuOo4mn32Ne/+prOP6B2UJSxO2HyoB2PZ2gArKRIZzvuqYrBZmplWSYDFqyRPLbN3V7LUduVvs8w3UaSAmc4Eh4kqwYjXPt6N8TpNK8Eam16ckUz6HpNm1cK4MC5luFOPo1UpmH74sZ1chVt76hLI7GX0aFgqKlgCikFLONYmVaECkQ/DDqkOdNlzenCP1R8NR4YRZIYG7OQx5t9f8B+odEZerNvfmxyMkETGQ+F04YTE5ItjvQ3LqP1Q/+aBSAn521XwTgPvP2caN45zSzg5oTgpsXu4kl6lJR4b7dYzyqS7n8VYQEsxltM6RDerLE/Dj03pIz2npF8pWx+AdYBFHDPZBT7h6ZH2BSpumzNM3BvmFOuUTaQAOMSXq426l40G4sP3M1Slg7zDKB00AIA2VfMdRk0nhuvLJsbaP+AebKCO83/nYPiB5igyVy/wCBKBDzTxmRGJuim77JpdocUCizpWMUJVkKpIW4HXvsC0kLXXWpishxcNxvBj10hLf7efPm6V9/54rdyYmwq1ZG5L7mDt8FKbQ5uJAKRiVawxAz26TH73iQPTI4gSJ2smnDZx+O0CSCPK5LcNe+BZdj+cqKvDT2GzyyhaQmKO4nS7KJK7aoxFXkkqJsRtndpWk15OwqdolMcAERzxhtkOFBEyUv9gvzfbTafELrs3hR8PcQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(61400799027)(376014)(56012099006)(11063799006)(10067099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ofAYI+rQ2MXodimt/4rysEjPrMO280V6kOEmhNpSH742C9wZR5i3K30Xzv8yYEpPkT1fQO0HqwM7nlk7NonwsZqN+zaFwqmOleMHSBJEbmTUu1EnHcgn8KJof218Gxkbn9/32OZ9I2LlcFO8/pOzssfQE4k1qaexX62OptTiuzaQtqxiJoU2k9uz/GwtSQ9JufTipgKPTdpjRnTXjTt6lYvS/bgP4IyYdus0658VG7N6ERNbthKcdnw1FFSul4uhQr+sLaOxW/QbiRxIj0Jl8DlO9uOWpl5OYq6ntO3+1Un8RO+xg4wJvjR6zfXhlmgME3j5UGEyfIKCH6dds2kiFZF1x9w8ZyjB1AQuiZGtHzxMTPzYe92vSqC7M2MAIM1X5FSAIQ5OckZvTkhrfEGC4+nXBP1nM/3WcM5g9IK7dp34CdfN2U8/p86UOsjJxB1m
X-Exchange-RoutingPolicyChecked:
	jWSgPdNs4jADhUcmjjYnYj5HlXGRHPs1wPyTrR2JHBCgsvqYulluITqZNbM9aBYeGlzDp2sPUuRyLmh8gc7aYMZuIKckLNWaIo9g6X1Uj1Xzz23jN7P6cC2g76aY/y4+F+rSqJ+Km5mbG7mi7ec2Wz9mwToEntWKzUeS3xTAKGWhnVrvuDgJ0h1i5tmKhc8eKevKk6uHn5KdzpoMtI3ovPDSjWWFk7PXlj0BAFs6ILEgaNJDo1c7T2TYaTcnAO4M8XRG07IqVlssTeMfQmW6CiYeUc2X1h21Ovf0HivNYx4GYo1hIhekWEObYi+HObLGsga/fgg1K2Uu9ud5p8IWLQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:20:47.2235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ed68df-87b6-4059-a365-08dee33d0c7f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6711
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58dab6 cx=c_pps
 a=Lzux+ftsp8NJ2nFuhgYiNA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=ghkwkf-wpIwtxfkPISsA:9
X-Proofpoint-ORIG-GUID: 5EYHTE6kbjg1kTucgSjFQunPb4VUB-nL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX4vN2GM4AcStA
 C8KQWo3qFPibj+XZTl205o3i3kShtwDXpVNQIERd/UZw7/5RPlYWBlEq1oH2APp+dJkCxrjJJfN
 reZpn7ulqomjzVSqxNEYw1MAIVj9LiY=
X-Proofpoint-GUID: 5EYHTE6kbjg1kTucgSjFQunPb4VUB-nL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX4BSvqvucfS4O
 3aeKbKT+V3VGdQENaS/ScnODxgoZv0qqZnxyB0zLufeYnBKSgkUhtSHgOBHA1S/PpkYb7pRRh6q
 ST8ViiS8+l3lcKTV5SatbeyQZQZWdUYQvKdarmQ/NeuAj7CZ3qDdVkmbg325hnvxUePQXaD1moX
 /ia28G67CZl9ynCMWtMzQXS8VKdzKXZ4xX6EEKvX1E1hK+d3kzkwRcLtogLnKFlZjqsY+pQxta6
 s9wF+SmISr5QwcPcd7pV2Yo167RC8a03jt1lfRgQ5R1dBrJ4tv7qhW9Loo8Qwju1/sjRgXu2+Sx
 jjT92Afcqlj50DeFpj+PRbX+N7sMrgb0ZjIWMxb+5XRMerJZ7uuddYSRjHYdBJ67rJdc2n4nOOf
 1iDzrXupXtRy4IbAeLdH/rJ6oCQbl4S/Ck7zPP4LyxlkPnhVY6LA1UsiFxeNh1kIFwODKDnQUUw
 AU39uKbPuyODIreCzXQ==
X-Proofpoint-Spam-Reason: safe

This series fixes two problems found in the probing process that
can cause a deadlock (patch #1) or a hang (patch #2) during
component_probe() until the wait for init_completion times out.

Richard Fitzgerald (2):
  ASoC: cs35l56: Fix potential probe() deadlock
  ASoC: cs35l56: Use complete_all() to signal init_completion

 sound/soc/codecs/cs35l56-i2c.c |  4 +---
 sound/soc/codecs/cs35l56-spi.c |  4 +---
 sound/soc/codecs/cs35l56.c     | 17 ++++++++++++++++-
 3 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.47.3

