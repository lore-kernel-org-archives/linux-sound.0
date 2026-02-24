Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F13A785F;
	Tue, 24 Feb 2026 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949926; cv=fail; b=gYPGWMCoKFNIgSZNX3lzNC8M3l5/0+fNR8+2jMRGY2PtkRuUGTj8nyJ7oyhdRYNFrmuj8n27u+/GZrknqanh0PS1tmhTMvINtPAbveH8bDMv2gqI3lmTTotPF9vt49R/TLVmNvq+yBvsTmTTqdIy+DATCuNx6J5HZA3P+6hzXfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949926; c=relaxed/simple;
	bh=giJHboWUXRUOnV9kyJTjhjXt5vPIbUrw4JLVEex94YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxMJS3gylbpji5xLLmLvnZOdmPGQeveKwHYhih7yvi5lO5wzzYgSL37AVpUfjjzbd5890iaQnLJqqGW3PyLTABoaSYv8Xc6mU6U5orhs+TzXzfP+uS8qJtNsOWLWaU2sRJUIjoPLs4B3te2XRS65w9pnCu/RUenwlmU5xY4Ugy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Hp9nYCf+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hmKTQVvF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Hp9nYCf+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hmKTQVvF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OEGoZ2038012;
	Tue, 24 Feb 2026 10:18:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=V+MQlNjLVl9zh2UM17Au8c7xy0hX4/PPUvzB64gyRx8=; b=
	Hp9nYCf+ESZrNoRaNd/vDlkdaxuZIDq6+hwXeYuah1QjLs8l+PcWgCQh2WZgV3s/
	GC49O7zDEmrDkYa4XZVEX4ndlZNwN65auU08EfndHjQwd5yp3B0zLS0V4moItRK2
	yHyH5vwtuABBEgJxCNP/M7NNqsdiXWzcYT8JetSlzppmlsixewoTU1/X19KWhhy0
	ml4BeWfA3LJOzplLlTWjbFHEA3Aq7mdgT8B9Eiy6JrD8YRoHjp/0+ffKoMtP3GTO
	7JwWx3W/BglBwtrr3Hdp5Eqxd/MVj6oRIa9cAo7Q/17ouUDMNsD8px3IEc59EGHL
	p4bDBxjJ+LW9UeCNRAMDmw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022130.outbound.protection.outlook.com [52.101.43.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4chdku87vj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 10:18:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2GznTLZ2QWZFHlnXRPNVRYVRhAY2FvvUezl1LUdeP+cALsUc99KvCJJ77ApAGYXJ7Xc0kiLH6XODvgKoMPDNkl9aXiMdlp81gG+DgY48hIgq5U89SNsXsonwvNMdZl1VefJLJxtAcrfkWuR4wuTpaQILpzy5qYs5n0JH46QuU984Sm/BfmkCNZe73SKZe/YvqF2fD+1YPfb3Gxy7qxCu2ngv30796m+1dPPG3RT5O2FuH83Th2193jxSzX8zhefEDGzAMbCyeAUUBoiag/caejMg+WGHHBPLJjuf19Lpg0Oa8BztRTwwEAdRJ8KYHSc3rCpDKfVBDoYW2C1PNj/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+MQlNjLVl9zh2UM17Au8c7xy0hX4/PPUvzB64gyRx8=;
 b=czEsoirDMEoOVimqz/aak9sQ8lFyoNm7FaXDUMPDvJso+s6k+Jc95Wixr/MIHYfgRLsI4zN73VEmAN0d+ZHLr4fLRz03DQJ4eWWXtuJCxiWuL9MzsOlkm7ormzfsQhk7ww6JmZjtqZ3axkdVJIHGWYjouGc8u9rPSstk0BtxFj5DslpclhAkXqfpZL+aEs4loES9+aSyX1kz1rShF+GMUXXwZoIlZYOT/njaTLwOaV1/k4sJ+Xrwg/G/pPPv0BZBcMcTbchyJUOhiRpyeuA3rBTAUCvxefiha3tJnooewP3Ff7HNKO1geDfbSDtwC0YoaO+lYn7lAPizDjBxW2yUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+MQlNjLVl9zh2UM17Au8c7xy0hX4/PPUvzB64gyRx8=;
 b=hmKTQVvFTgMptC864ZNDz//mq1pJbY1DhofujQNPYCnufXrNCPNVqJnkMOstylcHO3mqOK9Z6BjOuNgcRn3P8axznkQxqADQmr4X/Ixf5a9/25OyGlSyheKLlhdHQ01LcVpWyP/O7cE2ElD56zHoNTTpnWEARjMazT+J9y9qIUE=
Received: from SA9PR10CA0026.namprd10.prod.outlook.com (2603:10b6:806:a7::31)
 by LV3PR19MB8345.namprd19.prod.outlook.com (2603:10b6:408:215::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:18:39 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::63) by SA9PR10CA0026.outlook.office365.com
 (2603:10b6:806:a7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 16:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 16:18:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E0EB2406541;
	Tue, 24 Feb 2026 16:18:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D63D3820257;
	Tue, 24 Feb 2026 16:18:35 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 1/4] firmware: cs_dsp: Add API to hibernate the DSP
Date: Tue, 24 Feb 2026 16:18:05 +0000
Message-ID: <20260224161821.93365-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|LV3PR19MB8345:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72af553c-a4e6-4d20-d13c-08de73c05d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gVJnADcrcV3VFMMmNmzDSFQedg56JUGWyOCItWz30sWUfR0UldrIyne+ukpP?=
 =?us-ascii?Q?igQKq2wxFyh/1tI0nksrLsI61Fh26O9vbdB5pg6O3NVmTQ6ONWb+lNtCclRZ?=
 =?us-ascii?Q?D7Vb6YpNHhzrw4tifeVnLMrQG396GhAhtjMXBait9CtinxS+CPzA7ZQGdLVL?=
 =?us-ascii?Q?hl32IBCqj0ecLFhDN9i8bBxfpBJQhPzQT9VklJmR93JBGhSU7j/SrhKK9FYx?=
 =?us-ascii?Q?XFBZZzrirbKf4U+P/eW2yCjfOJnYTrbm4qQ29H8nyDckPfzvBWucL3tuQpci?=
 =?us-ascii?Q?EvtQbVERhcQ9YU0VgvL6N2TmUgl4yeHq4zbn4hzr36hoeIxdhcXnPrhd3aQT?=
 =?us-ascii?Q?qjN0BR16oSlC7buGbaUjgge0MbunWKcWGzefXDCCssfHxJBTAWMD5eHcWbTm?=
 =?us-ascii?Q?VCOX02LPSLUkLC+jwNVYBhDCfnQUQvhY8oPUCriA3UcZ+YFBcFKmsDNJGHvZ?=
 =?us-ascii?Q?6vjMYzTdczfLx72xuEsIi3ntWQsZkCjElvwGe8o9asTEsXvtYkNXH+SyktsA?=
 =?us-ascii?Q?xjLS0owVa+nbLUvLyZBlse6w1CQhblxa43PIXpPI//rh+HooYLDg2388VKc6?=
 =?us-ascii?Q?+PGKlznS6jbJDIYpbRwE/lw/gA2y/P5R1b/TXzIaep/S3+Ic131OAFPHcK9b?=
 =?us-ascii?Q?Mf91T1BydzuAbdQk2YdyWi8jbb5QhQTE+jm9yJLREwY1u4lT7qqJWqaZ6y70?=
 =?us-ascii?Q?0PquraLuXe5Dx3/4J1VHd2IEBpcJlt2ohXxPcdUYl9LpNrJ6BPFRZgNq5KVO?=
 =?us-ascii?Q?6ssUvinsJxAyZfEj1ct46BgQJxnylXZhG/5Z9y+DqH2Pad8J1ghFTeW8oEAL?=
 =?us-ascii?Q?vnJjYnFpxdiKx8ntBVqlp43GQoJ2cE4ddlpICRruacV46vbLXCTa2oWlO6hX?=
 =?us-ascii?Q?CiQu64//jRC/jaRMwehsaz6H7RtTJszdVGLmGi+TaapgtV7G7MNvQqscLsVG?=
 =?us-ascii?Q?Tut39bJroFZ3JCpXjaObTvHbke13964mSx11TiXH1/5rJUBtU8vJ9KUq9y+h?=
 =?us-ascii?Q?gcmsEMPTuXc50eQlPXyZ4SSf0zkIDJrEGNtfle/AO58lqrgBFJA5w1VUZUzT?=
 =?us-ascii?Q?CkU5uVTOR4X6ydYooo6ECk38KasZd+mzcYAlmTdlRLPCDS3mbIHJf0YseyNx?=
 =?us-ascii?Q?obHFdd+t+T1TAIseeDOiz5h0Fn80m4wGVmKdM1LOLVt0vfrN7C6sScPqMAH/?=
 =?us-ascii?Q?PAtABVT2SiRRtqLkvZHvKwDRM0k+HCGJ20sbciRmvjqySdpRQ+v4AaGZAVH/?=
 =?us-ascii?Q?MPEsQXulsGhU6Qe4a+ibsANpg2CT3cnhUOHYTPug4QL5JvAN4PXmAIjWyQa9?=
 =?us-ascii?Q?YgWMIPPqXTbZXMJm20hKdfTUNKrg9YrpuWvThjcvf9RHcNOhSvALL4dGJhUo?=
 =?us-ascii?Q?9joDMjJz0K2laIn5Lh/IYfU4It4NQ+1/t/mN5Ob3BHdDcPXmg6tKm4sPbOgd?=
 =?us-ascii?Q?cHRn7sQsNGA37isi3qWRkn/BapKS7ih6jy1T9S8ijpW3zgyK8+h08PuKIhoq?=
 =?us-ascii?Q?ANw2paQ8tmi2c9WaySzkVuGqN+LkE+y4i0K3rCusRgjqMTlk9LDhMJ5YWKgu?=
 =?us-ascii?Q?OkSLoA2mbOZGpQDhyPK7GyZLwWWnDiHUdf/3ahfgRKtX9l7GXOELWUan9i6D?=
 =?us-ascii?Q?aGs1vRB5+8jbA8Iiart8nq8Swwml5P6705CHIRvcMM32X8fl1Q4U6rdLrnjB?=
 =?us-ascii?Q?9Vag6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sXOHGVXEJGcN0Kyknta7i6sK4g1U+oLzIQzjYzyYohqwvzj1X7Vnt9q3WqyY/Jg0JPfARjkwBZwmt1bcADRYDnFHzeZr2ARK5sy7huoRF8fjVtQ1l05HHoWK5EnAyWcda/aQAI6e/f2wwEcdWkhU5/yMtymPVOMjTtRlP5Ct8vNeP4QRIg1nrhc465ddb4PPNtG/oA7DfNROttizum6MPieLF3DOQkEDSbxKXT9jf25WSdGpj4QK48TcZoBZiycJpdl7a0Nzo0HoAU9TO0eJa39oPknyHEClgZ2bsgIehbSAvntclC72fFXknXh+fFLUnawBAOSxJnExc+EqKgfn7z9WKxSAmX0urHYSoXxcNKI4LIt24PrJN9YpMuJgwZRdeUFkE/mYV5DksBW1XBkATQQTaRjDB79M232aDkT3xSi0cSPqQFdEh/srO1Yq8+kt
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:18:37.1561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72af553c-a4e6-4d20-d13c-08de73c05d96
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8345
X-Authority-Analysis: v=2.4 cv=OZiVzxTY c=1 sm=1 tr=0 ts=699dcf62 cx=c_pps
 a=lRTg7vgTIBoiavhQ3167yQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=OYxLIzEmPA8roSr139EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzNSBTYWx0ZWRfX7cNhB0zD3c5p
 m3LaIaLUrz0WFFFAtoUUTsdifpNp4Rl4xOTjseKhK/NFQ5fks7Woox2HDDzBRxEkIEc/m/Zvuao
 kuX6vMecpzJG8upLUcV4UsUTnu2gCjoWp1H2WiNFdiVvHGRe90GGxP5ElED+P8HZ0VyT73/8JI6
 BR3YkK/YQ7JY7Xaw//cnyTBOpe82qxdxaAhS0gIuMAELk3EVsQ7u8mI8Wk2Sq5XF7bSVNyqWHWP
 tMMAvorMlVOB1b1i857Cls3gAkpoViCLEsqYjtESVsqDdASb8ifVsNSn/uzS7Xxd+KQz63nDl34
 BLURPPeQs79RaiCduhWloX5Oq6ydLVEoF0EODV6gxVPukWrLy1uu5uSb2mBLZQ/ncknShTWFJXJ
 XjmzNtkQFkg8TLGQ9nv1UMJIwDCw/XZI5UnMAyok4tdC2QS+HKvXH4mWHC0+LEesaOYL7P9WVpP
 Z94McG5yx1HwvNhuzNg==
X-Proofpoint-GUID: ykLPkjMU9QZAfA7jVB3rAhsD79KbaBBo
X-Proofpoint-ORIG-GUID: ykLPkjMU9QZAfA7jVB3rAhsD79KbaBBo
X-Proofpoint-Spam-Reason: safe

For some parts, the DSP is kept running when in low power mode
(hibernation), leaving the firmware ALSA controls enabled, but the
registers are inaccessible. Attempts to access volatile firmware
controls whilst in this state would produce errors in the kernel log
due to a regmap_raw_read() into DSP registers whilst the regmap is in
cache_only.

To remove this error log, add a hibernating flag to indicate that the
controls are inaccessible, so we no longer try to read or write to the
registers whilst the regmap is in cache_only.

This would still produce an error when trying to read or write to these
controls, but this would be a different error (-EPERM instead of
-EBUSY), and would not produce a spurious error log in the kernel.

Upon wake from hibernation, the control caches are re-synced to the
hardware, if the DSP is running.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 49 +++++++++++++++++++++++---
 include/linux/firmware/cirrus/cs_dsp.h |  3 ++
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index b4f1c01e3b5b..f9d8a883900d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -515,6 +515,7 @@ void cs_dsp_init_debugfs(struct cs_dsp *dsp, struct dentry *debugfs_root)
 
 	debugfs_create_bool("booted", 0444, root, &dsp->booted);
 	debugfs_create_bool("running", 0444, root, &dsp->running);
+	debugfs_create_bool("hibernating", 0444, root, &dsp->hibernating);
 	debugfs_create_x32("fw_id", 0444, root, &dsp->fw_id);
 	debugfs_create_x32("fw_version", 0444, root, &dsp->fw_id_version);
 
@@ -703,7 +704,7 @@ int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int
 
 	lockdep_assert_held(&dsp->pwr_lock);
 
-	if (!dsp->running)
+	if (!dsp->running || dsp->hibernating)
 		return -EPERM;
 
 	ret = cs_dsp_coeff_base_reg(ctl, &reg, 0);
@@ -827,7 +828,7 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 	}
 
 	ctl->set = 1;
-	if (ctl->enabled && ctl->dsp->running)
+	if (ctl->enabled && ctl->dsp->running && !ctl->dsp->hibernating)
 		ret = cs_dsp_coeff_write_ctrl_raw(ctl, off, buf, len);
 
 	if (ret < 0)
@@ -920,12 +921,12 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
 		return -EINVAL;
 
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
-		if (ctl->enabled && ctl->dsp->running)
+		if (ctl->enabled && ctl->dsp->running && !ctl->dsp->hibernating)
 			return cs_dsp_coeff_read_ctrl_raw(ctl, off, buf, len);
 		else
 			return -EPERM;
 	} else {
-		if (!ctl->flags && ctl->enabled && ctl->dsp->running)
+		if (!ctl->flags && ctl->enabled && ctl->dsp->running && !ctl->dsp->hibernating)
 			ret = cs_dsp_coeff_read_ctrl_raw(ctl, 0, ctl->cache, ctl->len);
 
 		if (buf != ctl->cache)
@@ -1108,6 +1109,44 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 	return ret;
 }
 
+
+/**
+ * cs_dsp_hibernate() - Disable or enable all controls for a DSP
+ * @dsp: pointer to DSP structure
+ * @hibernate: whether to set controls to cache only mode
+ *
+ * When @hibernate is true, the DSP is entering hibernation mode where the
+ * regmap is inaccessible, and all controls become cache only.
+ * When @hibernate is false, the DSP has exited hibernation mode. If the DSP
+ * is running, all controls are re-synced to the DSP.
+ *
+ */
+void cs_dsp_hibernate(struct cs_dsp *dsp, bool hibernate)
+{
+	mutex_lock(&dsp->pwr_lock);
+
+	if (!dsp->running) {
+		cs_dsp_dbg(dsp, "Cannot hibernate, DSP not running\n");
+		goto out;
+	}
+
+	if (dsp->hibernating == hibernate)
+		goto out;
+
+	cs_dsp_dbg(dsp, "Set hibernating to %d\n", hibernate);
+	dsp->hibernating = hibernate;
+
+	if (!dsp->hibernating && dsp->running) {
+		int ret = cs_dsp_coeff_sync_controls(dsp);
+
+		if (ret)
+			cs_dsp_err(dsp, "Error syncing controls: %d\n", ret);
+	}
+out:
+	mutex_unlock(&dsp->pwr_lock);
+}
+EXPORT_SYMBOL_NS_GPL(cs_dsp_hibernate, "FW_CS_DSP");
+
 struct cs_dsp_coeff_parsed_alg {
 	int id;
 	const u8 *name;
@@ -2498,6 +2537,7 @@ int cs_dsp_adsp1_power_up(struct cs_dsp *dsp,
 		goto err_ena;
 
 	dsp->booted = true;
+	dsp->hibernating = false;
 
 	/* Start the core running */
 	regmap_update_bits(dsp->regmap, dsp->base + ADSP1_CONTROL_30,
@@ -2776,6 +2816,7 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 		dsp->ops->disable_core(dsp);
 
 	dsp->booted = true;
+	dsp->hibernating = false;
 
 	mutex_unlock(&dsp->pwr_lock);
 
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 0ec1cdc5585d..4e3baa557068 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -179,6 +179,7 @@ struct cs_dsp {
 
 	bool booted;
 	bool running;
+	bool hibernating;
 
 	struct list_head ctl_list;
 
@@ -354,4 +355,6 @@ int cs_dsp_chunk_write(struct cs_dsp_chunk *ch, int nbits, u32 val);
 int cs_dsp_chunk_flush(struct cs_dsp_chunk *ch);
 int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits);
 
+void cs_dsp_hibernate(struct cs_dsp *dsp, bool hibernating);
+
 #endif
-- 
2.43.0

