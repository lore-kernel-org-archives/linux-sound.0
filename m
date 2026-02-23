Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6EB262808;
	Mon, 23 Feb 2026 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862815; cv=fail; b=RO8n/3SU8U2aq6ao3rus0d/o0ivxUZ1lRTG4CC1OORNbqECkWPnMgJ6C4rSN8iWhN+xS1wNFv46eoHY0uIrrGbngCl6NbRKCUZbE3zXEMDYgeNTdCGYYSRXsQtH2I2sqZSOh1JzUjM727OqY1NtdMvcn5ihikkofZnq2CGZcT0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862815; c=relaxed/simple;
	bh=MApMvZdv7BW6xQK7/ckZbpiQx0CZcQQiM97EEwFSdLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=He6t/Gc5In+rBOYN/PuxpSAYtuqd0/J+IX+vwCRZuEhlNKd7IVw05mEI5VNq+Wg6vLOLVracUMo+14KrpbrCbmtAPJfgAbd9E82kDpVBvCLjtrFet04gtD1i1Aqno83gfm4UAp9j9zbDbA8P/0MJbHtoSUoe575iF71EQ+ifIq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ojIaSqyX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IhNk1n1n; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ojIaSqyX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IhNk1n1n"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFCX8Z2143434;
	Mon, 23 Feb 2026 10:06:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ram+dUApqM/Ry+U2+AkNqKqMQ+8R0aC6Wek9IWPvb64=; b=
	ojIaSqyXGdid4UGxxnVUnMafmsH20XZdwBsZhDpzs9UQSVNe/1/PlN/IfJjn81AL
	lelicHVUkC4GMza8spPky79HiNkMCcxn/JvcP5PCGQvC4eZV7w42imW2wuxXKFFz
	APfRFRYg50iOPqLkIgz6QJHhG1gf3jBfD9+8HGYCQ+hrI/wtln84Na/x30qQZfkx
	EbhJ5yoF5SdcWGmslXVT8/meFXkbMzX2uViBj3vavyh5RFgb3pvvZFJwIpnPovmy
	0Fgkw+BVpQx60kPYpUsk7fKyv1KOzrF+HH9OOqXeUaBITUf3TI7Q6aPkA8UDh7Zd
	7Q2dbxInqNeq+E7ehoDfAw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021079.outbound.protection.outlook.com [52.101.62.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1rs6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlsVaSjkQALg71rtKi7gnF1MbbUHC68ZB3NkUWMT5+ug96vD+1OL+yShfDCRmzKkHzf2WEGeCry53MpJHMIX5qTnTeexiid/LuC1BtePyqgvyV5TWb4Sy3XHWHu7mMyX6sm8X7MGlAYscr24PqeruRDJabKfUAjWR6SwvLPKr2pjKmdxj+o+AOL4eFNGN5xH7tv3QYDQYXUNhQT+9Y6hqHQDwjQobrxWgDOFQge6t2ulYgx+s/+iYBI0Xqf5YzFBKA8+0aGDCnqEInEa5ilF0w7NEQ0AuERZn1Cjpn2UJbKz2tyoGOAMY3PqISDnihYx7fMI354WWwfDlMmyEcK+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ram+dUApqM/Ry+U2+AkNqKqMQ+8R0aC6Wek9IWPvb64=;
 b=wGxnYLc77oiKdLdlJsw9O0+0k89Ai7mxeloRKZm9f1bP5COUdalieUAuDiqVP/j9q6+99xaB21kWKd2Yd8Fl6XvJ0Inka05t57NSxji9CV81uhKTA8umj92iZlNhDSxbUY1FkSJXvK+bfj97HEHSJQ0pHiPNWWsMMtkCjiXNogAeY+nbLL4XznHSSjorTWio6vWzwCSPcF7W3RdejaKdF5py+6zo3ejLnCub7a1dRYn8/6C06jA0jEvu7vzq43a0FI/IkC6q2LG+7WDoXUPu6Kpcjj5XlJBRyuHfuGvCL2VfCaCCPY/ABq7y3uqO9r0BhQjjoK35TMBUmq7P1L8E9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ram+dUApqM/Ry+U2+AkNqKqMQ+8R0aC6Wek9IWPvb64=;
 b=IhNk1n1nrvo6czntCNOYlOvicLohSUFS5ROIW18k1zX8oOOKIUuclbdDbq4CZaw8y/th6FjwlJxkK30TINVA/wph80Sl/a9Y62GvOJnO9UWkPjahBaVcGIvOSgVybFF0Ndz838r6Sx9xGsGspC1s7DrLuGa0ERrMYR8IZ9Xzizc=
Received: from SA1P222CA0190.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::27)
 by BL1PPF0770E4D24.namprd19.prod.outlook.com (2603:10b6:20f:fc04::e86) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:38 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::39) by SA1P222CA0190.outlook.office365.com
 (2603:10b6:806:3c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 16:06:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DBB2A406542;
	Mon, 23 Feb 2026 16:06:34 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B4E9782024B;
	Mon, 23 Feb 2026 16:06:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/3] firmware: cs_dsp: Add API to hibernate the DSP
Date: Mon, 23 Feb 2026 16:05:30 +0000
Message-ID: <20260223160614.754934-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
References: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BL1PPF0770E4D24:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a327f0d-f0e8-4961-fd07-08de72f58592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SE7hB+FodMXx2VsIbjwIR1V8t+MZ8SZSGXdCGGo0GD1jDsviP4LqwACHOPzj?=
 =?us-ascii?Q?nEb8bARe2VYTeAuurYkBE3PVkpAPRf7XlIOtUs7nWCzsEXfNKVrvCWLQHt6C?=
 =?us-ascii?Q?rL4ueswqoZlQ8YTtm8Ux0ZoI400ls5EM7HCa41AMgDyIN2fDAoz8rF2FrukX?=
 =?us-ascii?Q?0uQ0IICJ+6sm3RU1YVd+NsF9uDcG+9tNLZL9gZbd3eS4uoywb3Ca9ymsQbF4?=
 =?us-ascii?Q?LtfbzQnyjVjsJPks0IOD4Vg57udHpKHHCR279/5g9FAd44vpYZbJAKEb7xia?=
 =?us-ascii?Q?tPw10cSDxHA3nTbriQb6/pDQfcFVNDMH8PTlD/Svmj9+Seb2fZRD+XfqUHLc?=
 =?us-ascii?Q?4AH30CQgoQCU8MP4ZvTxnRh79RsuZ7gynRGJhkYvTsX9EBZbvE1OhlIgYBtZ?=
 =?us-ascii?Q?E8ao73oqribpM8lgKNLrcb6G9OMoOzFpGuhMwjrF4+LLUqebrgMeObTJahWI?=
 =?us-ascii?Q?qnyJPsQLe7LqyKNMBVYltOQkVKLGSPiVE2A+/0WOLC3DUhhtadPEfACb1DKT?=
 =?us-ascii?Q?SemYlel0jlVxZJpuE7Oh4jx0zmCHJUkzdJlAx210vbuarJkV/qruKiDg3IHl?=
 =?us-ascii?Q?SGVtMg7gJDuAaKWquYrrb/QzzffM9UM143D1QoV8ucoIcwTY2tkn2Q3dvL7j?=
 =?us-ascii?Q?kNixwyTQQoiZ19QR+zTxyTD/uVRVAJnhRvUeFv+FPiRwyelVz4m0+uWjA+GY?=
 =?us-ascii?Q?ybW4gvKNrSaGrD4QmSIa71zkYjvqekc8e/v2Axli4BQZaG5rgHEnGWCWteag?=
 =?us-ascii?Q?OrZnA3P1lnR6F2Qp2I7FN2/XkIvjgpNaBKhsJDUoQ15F8IsV3LmXVYdcXZKb?=
 =?us-ascii?Q?7Wp8r/QVG39cYeAHGS1/UNaARkJ1odG9Gr37lJ1ABxSbfYnumhWgBNUUmGkf?=
 =?us-ascii?Q?LRhqZceJzyIFk7nkzt2seb/X0SripWiIa70hV0Bcov0TzUuL5DQIcm3futQ8?=
 =?us-ascii?Q?ZnUAIozcqY6NYWHcC2bPQKt+TQ/TfNjP7yKquHYEGH1fttqp+JU01OzahpbO?=
 =?us-ascii?Q?bEJmJeUYjgVvD7dF+OyBfir6ZP5+AMuWvZrv6WAQ821OlOyoiS8e7RXji7jI?=
 =?us-ascii?Q?yntm6Jye0Xay7kRr5klCNm0EzcVvVeH71+1YIba78HDVCT934zWLhNjg1WNH?=
 =?us-ascii?Q?P7qe6vsJHdP3Qn0TLXqFhzxxIQ3zx2Da6l/RrR0rdtNIypBG2rSvSYJIfOtR?=
 =?us-ascii?Q?+k94xxgPI09nhl6t9KPyNDp5+18lXohLNXw11VqxKC8DsAPBlUDw6+MWJSyJ?=
 =?us-ascii?Q?djGpWiTvj2r/hWhaAnvCvEIWJfyP8FxKhnOy8aGXNOsqzacqlPpMxViehwnu?=
 =?us-ascii?Q?nRx0Jz5w8T6XcHK9e09S7E1feEwH/Hd/L5DWUledcwAcG/pVd3NNXMpz7axk?=
 =?us-ascii?Q?q1RZ2uAnJ2iXfoM4ADUF8lNnVz/5lFjVopzx5XouzkVajq+0hpRvy+o+0o96?=
 =?us-ascii?Q?cbC35ccTAT95xiaOmJEfuZDj7+YKdq4PJCEeHX9pfwan3TPzoahcBRlNZlUb?=
 =?us-ascii?Q?FGyPT98pGZsrQutJSJQa2osIpuOlScj6IsSLp1d1X+z/+GEp7zeougzr3urB?=
 =?us-ascii?Q?JRyhHXvWkFhxDWhVxisxOJRV2IDJ4KAkKcNIgTho6UZ5pyBiES7YzmOed7I1?=
 =?us-ascii?Q?sny4XNyPjZP97/jG+1kE9rH8rhniUqCJA7zIsC9mlvrCAH1aW1F5uNrIlTlh?=
 =?us-ascii?Q?kXHxcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wfQK6VcxOKZjvvCaa7715kbE3rhhSe8l8pRtY1diPMtHK+EUUYAEXVuvri02GwbdUI86pQ36pDalP68nkhit71zMIb0vvoIMMeGJf6OuCdD4pjqPsbTN7p9k7Woy/CmE0xy0XLLDv54Nj3caQmcun1mlphRXEtJr9EoIXZ16RP4ExJxkXX+uVpsNR/qRpo7JNpzpQc3Hc25Jr8HHQwO8rrEHKYp9c94EGcUloRMfNjme4/W6Ks5VwnROV3AsN36+TRHNgzN2QrneffMIZ2EU5FwYnAcGpvanHJZS8hvAUOjv2bFNXEClCvnuGOdgaPxNizUyCFuiri2thk7ugnafpnb38p6rhWXMsqO2g4oVHzyeB+RkA2obiVaOefDUZysZNWjScroSM9Lq1KT8G0lXld5l6tWmfBmToLK5CIBCaV2dTG6kg+JoO5L6VrXWmLk1
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:06:36.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a327f0d-f0e8-4961-fd07-08de72f58592
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF0770E4D24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzOCBTYWx0ZWRfX8Cf3gSYaELd7
 ffBrV41HEgOrtX5PJ7wY0NydGmbJcOWgTLogCffq/oxntDmu/Ixv7ZhD+sQOhdgDIit8G257RNs
 MpEMNWP8iSCu2rFwFmCSTK3H2QJP32KVYwaRahXkg+XbMIPFGE/8AeIq7weIe45u0Ibyd4qqaUV
 zwQGolkK3ur6ujTHkNWsXMGe/d/pQvsbvp7dL4Qq1FtZMhleBbSJjntqYjP/AAN7GGQKz9n0yAQ
 Z4L95PTifEBfbsRU+So/eYDJb9Bd8EZURNywDi43jKqf9u2+N6FTkA+kp6muUbPRRqUc/0Fjnq3
 pLDnzPGy5kooSJh72rsvgRGIGn65nUlYHPfTu3wYIpRykPa9eB6ztaLeEA3ZtjQXgE1dcAwsgD5
 JVKRzctD75+4xemLhF0xFyga+dmfe7J8yrD4kciQNvQ+opACSixVC4GdCV815547WMqlHk5/0Mw
 fV0zbe28DKOr+nN9oxg==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c7b1a cx=c_pps
 a=pfd1m+JhmiCErHYdEUHeAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=OYxLIzEmPA8roSr139EA:9
X-Proofpoint-GUID: mwb6lOVFiqKZ1maQJGMj7KZj32O59-R4
X-Proofpoint-ORIG-GUID: mwb6lOVFiqKZ1maQJGMj7KZj32O59-R4
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
index b4f1c01e3b5b..aed1b4214621 100644
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
+ * @hibernating: whether to set controls to cache only mode
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

