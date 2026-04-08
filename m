Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3617E3ACA58
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641144; cv=fail; b=XVNbDXD7y55USJ9qQLAeuKo3+GYFyp/gVNGKBn7VHzj1JE8Fmh6W78WRemSb1bD0+6RGJvXsZj2Qo2qB+UXOvQspKPYC7JxI+bjm9oy7JiGH5iJedyqeygYSUf+ozlHnu6i2Gi98UHNA1PlayM2s7rKVNkb3o2i99Am/mjvF8o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641144; c=relaxed/simple;
	bh=riAjVs69HeaF7pI6Zs1WSdvT/BbQ2D9A6d6KCHT72X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ColvilPGXsmj18xeg2M+fZvK2A3hdNDa0zhydgsIrjuCLAB1xyEfuhyzlQyf6nVA1vjGifE5Uj51HfbG8D3ls9bu9UYPB1A0Kqmh29R+rFl8Izt9B+/Z+ngBRkXAAAWjCS3VoE3Xk2RXMX1RDIGQqcbXjTD2UMyfJ8aR4Yk4D+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LmSxXT1R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xja8Iu5/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LmSxXT1R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xja8Iu5/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384eULS683500;
	Wed, 8 Apr 2026 04:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=cNpFErSkaowrUISX
	GHENOzaHxVNaD2Wwf1C4utUubdI=; b=LmSxXT1RZ0JozwogVPnW1VuaMxU/kf7g
	aR/rjK/sTY9+xtnyxOMazBFoYPJ4CVBHfwwM3v6ogTn8NdFu9KW4NiY0Jk+IVKga
	UrZTNgR/kQhGWYv3+xS74oWS6XviboI6+D6rcZjNysOo+4QDOSU1/Q4N4eM1S3zH
	cqBd+SOOGjNOZYRuN2XTaoIH+AEFL26Kd/LwfoQqGGTsWz76xOtlf1WuZEFIz72o
	eoWs0HDDNUXt6XEy086K0qARzhQCWI1kR8wK1PGl7wWfd7yogMdx7G+gsymoD0/w
	CbDhD3Npn5fgvXeIX16S3/o5PflKT1+cYWvZZIbLNHItwaPo9mJdwQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022120.outbound.protection.outlook.com [40.93.195.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7j1wr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:38:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f74E2ICijrVMCizP/XG9W5bzxDfnuYRSDmVbHAkZJNIc3lKRM0b5hMHX9aTWWTQINSFOHjVq2xoDxHFqCksB2YArC5NBD+/06cuLfns1d+r6GB0WeA314UyvbFtij3yVSUvHWwwZmxb5qYQxCkKzoICvf7zytCjz0fwCMgMQqKH4nBlzChD8mgR/Z/KC1CUbmGGMcTCWZ/s0itOS6s86tDPg6PdO2fhpOvtZpFPpMvNrrLvnL/JDHjHVVvU58AxTtNmc4ksvcaIvjZqVq7i+0+q40bkbGtKjAZgGc6Pv9xMm69OaCqp51nORMDJHiHeOk5XbaRL3oJ8uXtg1pfjFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNpFErSkaowrUISXGHENOzaHxVNaD2Wwf1C4utUubdI=;
 b=YAViJE2NFVrDFjvFGzH6Iol+Paorho4jyUN33MU4UlX6g5ruKs4101hPJZYUItT6YP0C9ZDtBLInWuYBzbraltjIPYw3t9UMDZd/63QmhrZ2xiMADVX4ZqswKbUrajYxqMq7v6k7HSFUc+6jBYn+SxZese9Q5TXSQh4U/o1MIrXv4OIqhEDVwe5jWQdDhJG57v4HXYzpL5Ew7hPKfKfOitz35pLoxhNKKxxEjK53pNPGE+CVATVb7m0u4kyxNd22foDi7MkxrYItykdEwTaTYdESXD2IW2LDdUsdRQOaI0GYIE+r+cn7tDHEP9DDhxhABeZjoUJ1GTkvRoAkEVqImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNpFErSkaowrUISXGHENOzaHxVNaD2Wwf1C4utUubdI=;
 b=xja8Iu5/oem3Xz48kQVzaexQ7l058NXxugQOoa5NmTjyKaLyhXv71lqNotZQfq4xEYEUaneYE2rJEOOBiDrcYu67u5ZoqwRugmy+p5AL0gcfQYp5oAlGbI6Jekdgg89Eu1S0rHdIA64WPSWHJAhcli8FzAwszCyLSm3kHWr9Y2c=
Received: from SA0PR11CA0208.namprd11.prod.outlook.com (2603:10b6:806:1bc::33)
 by BY3PR19MB4849.namprd19.prod.outlook.com (2603:10b6:a03:355::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 09:38:41 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::ee) by SA0PR11CA0208.outlook.office365.com
 (2603:10b6:806:1bc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 09:38:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:38:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B8E61406540;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9A57882024A;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/5] Yet another round of SDCA fixes
Date: Wed,  8 Apr 2026 10:38:30 +0100
Message-ID: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|BY3PR19MB4849:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b222a707-4da6-467c-cf3a-08de95529e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lk+InWbQzth/bTPUNlbnegQu5Qe5TgBZP7oMX7sPlOzTzzQ7SzkZCnA8ICddb9zO7btoZK2T5Jqihrf3uyqVU+W+EwzFOTrUj6uPYKj/McQl0O9Wsbwsr9Gl2lyA2UQT/xobiRq1sCUpXmHIiudQJFTpyBkQxI9zgRGLzaBtvHShJSu6DQVJcItEZFO4rnUfch3U5sGajAzEWbtYoq6RhPDYhg6OQKLnIz9ejAOZgtFvD4aZOC548EqJIj5Bn+vmccYOEJtRapkalFMHDioFY2opmZvDAXKbSAWzrF1zo3IQa8/1ndBdrif45EN9uRIQlp7fSsa9ityYxuF5Um7EPwA5n95luYrZB0sY3b6Qa4JzU1fcacdJHAfVjFRSbEsmcZL/yR32sytn1Lhby64ImG/eqOcTnS4osKDwPY6Ym5xS03bN8aheSuG0fD6Xo74pTnw9jQ5zOCceRFvSLWrnJgYaNNb2w9DbOxyH7631sgdiXjaFOEguUO6bPcqGylCy3rmUmijCS/XSDFFZM9A/Pv2hTwbr6xGrwVSngDqbQ6Rpy1XjaT9QtFOi2HMtaMbyUXBQmGCf1UjuGv3als63hTqWnLx/LpvObGdBGMVn+zV/Ce50wm4mvcVqr3zfZUiixP9f3mVyuPvgeBsdYkddOIYxePDxrZiSYO+j55BW28rqANcwC4MVJM59xRWG0f5WCmVprZPPexH49YDDldIGGFjL1Q+LwQYYkcQns1IW3+krLfF7e4R2UU5xtulRBvFP0/fDTcn6i0YDXHlPJ77gQw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wWWwXsVb+VZkkM8mlYIIY17JzdXx9ResX3QPB8xz6o8yqocEchEjy+0T6xqgYfJLjeB+sI/K7MNEiQxyL2H5Te8z0eFEfwwN2aVnUpPZu2TPwz/j3EeCt1fOJ+oy0JlbBZ8rL027Ddo+Rv0LjJOpyD4L4KbhmSPUrn5l213T6T3KYzjqXt4jhIqWre6U/oEeZ0XPKhjq0o/MVBjNY3H4QQwcgJf4arMj3Zo8CglQWArNhL/gJnJLI+FCg3Hy0sDUDKTnZMBqaw9ElEg6htLsCNbUnyUyQAgMkeoEm+YU1rdwdkM1zKZXhwxZPRFEAOmNJa2+mipoQZkfKp+9JqlXmq61pv5KxMcy8GbcJ8i6B49plH1cqkUyJERh2Xwv5MfSXVM/fovXpRTm8+6mhULwlNVkajrq7/V+midqCAu5MlDMjT+3iH9VUUaawn0+yH8N
X-Exchange-RoutingPolicyChecked:
	v/E6v16QppSxnAd84nOwmoUr3q7U9JTJ5DWazQrop7D3XTOVTSOCtK1Wox29QaboU7VDDz/khSkgpKf/3BGkygSNdkEjHfxVcQ1MWOFxs6Hib4ZcGdeeNW1AQAAncY7+3r2tz3owbW46An91mn2sg5AjsyNVHZd9FN3YO59k38xkm4zUDrGqD7BXAVbRcu6IvqMeDpI7Oakn0LegzXpSQIfIye1eSO3cBvLxjjwoTMip3cG8XO1mpc1tzjJH8FwuSbrGkZFdn/lw0nV1ivKU5pZc6ZHo48QPmozm4dxLV1qfe6TQydaZZa7YTSAHd7Nzv/WxDDcWlckQACn/Mz55Sg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:38:40.9676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b222a707-4da6-467c-cf3a-08de95529e83
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4849
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d62225 cx=c_pps
 a=mafLo/wATi4HPiUbedi6XQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=7hPUKV1Bf1e_Cnm2ZJ4A:9
X-Proofpoint-GUID: U1LIwUyQja3mu_rTwzdxtBJtSCSUzQXx
X-Proofpoint-ORIG-GUID: U1LIwUyQja3mu_rTwzdxtBJtSCSUzQXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfX071SjdOB7YJt
 EcayCyFy7F+Rbrd0GlYOjhnR1P92KQuSJLsSWr1con3i0WLD1mNhZetWtB0AjxbNq0rK93NaLlZ
 k3oaW/M46BB4BRQ+LtpogqrNux6u66XRaBwIb8KmsDBSafXFVlWCzedxsmYTsHBaiL76KuBEA/k
 fWWeyDkAPTigVZFSCf2aHvRobPpnYAR3WPpHqYANSskbFAB9SWy9V7AAVMcfjbDJT56vpVn/Kbg
 apZ8S35UPNedTJYq5gQW3toOcRte7IQPPx185jy5jblrY4Ij7J6qdt0SQfsT6BggK61cFOzjFtb
 bo3WMhEZm7snJb848WePQgiQuOnzA93vNS1Rf6Hdl+NaCrKFG7gR/BQ0rwCCguVn7Wp0LJONPEh
 wcDCR2UFb+8ARG1WW3Q2uMNzcQNVH5cpAzZINZ+sIHTf5LyhQdPUQJr5Ct61bSYN9aUCu/XT+SR
 SKX8G+2na1B3dzGlA/g==
X-Proofpoint-Spam-Reason: safe

Another round of SDCA fixes, a couple of fixes to the IRQ handling from
Maciej, a couple of fixes to the IRQ cleanup from Richard, and a minor
tweak to the IRQ handling from me.

Thanks,
Charles

Charles Keepax (1):
  ASoC: SDCA: Tidy up irq_enable_flags()/sdca_irq_disable()

Maciej Strozek (2):
  ASoC: SDCA: Fix overwritten var within for loop
  ASoC: SDCA: mask Function_Status value

Richard Fitzgerald (2):
  ASoC: SDCA: Fix cleanup inversion in class driver
  ASoC: SDCA: Unregister IRQ handlers on module remove

 include/sound/sdca_interrupts.h      |  4 ++--
 sound/soc/sdca/sdca_class.c          | 27 ++++++++++++++-------------
 sound/soc/sdca/sdca_class_function.c | 10 +++++++++-
 sound/soc/sdca/sdca_interrupts.c     | 23 +++++++++--------------
 4 files changed, 34 insertions(+), 30 deletions(-)

-- 
2.47.3

