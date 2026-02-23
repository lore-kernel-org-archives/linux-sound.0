Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418C1EFFA1;
	Mon, 23 Feb 2026 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862804; cv=fail; b=iOGbNvv/XA9mysoIJu8ghFh9K8ezOtvoYvtujkxfJRrqpunuJ/M837dglI7vQRflDpixBTQD3NYutb4aDj6HEvhM8FLvWTJkBdlLfJEs6I6FLqlMAiPN7s5elweGURZqbHDmrpLgVtmwj39fmM29d+N8A5dc8qr1Jmo2k7kBXWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862804; c=relaxed/simple;
	bh=2f6C9lHYyTKDnecqmV+nl1/HUTEzaDfCnLGgl7z08DY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DMdxvN2ikv5oGGSC8lreRhPpKrg1U8ozX5ps0F2OSUPa0t+uJqr69xkAnyhP86MLkyO0gQeVQh9uC4w75izyY9rr+sIzKTmFNNOyA70RgQpn9XMlmzQL/MTx8T9pgJ1Q4+8j81VX/VUwwOcDcag5t00Xtq+ugjQSq0QTovE1egY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gHqO0a/q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e+mWYteG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gHqO0a/q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e+mWYteG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NF9SjT1991958;
	Mon, 23 Feb 2026 10:06:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=NjeBJjxeTTnDkU2w
	xW6Wp7htulnxlqLEPBaxwoOGsHk=; b=gHqO0a/q6peQFkOe/DqTApB+A6j9jiYT
	GLNPctd+DTqWDta8EERWq7/uFUUUYM/pBtsoSx+hrJ/eMwyZwPAsOolmQ8maS2Ah
	fdVtpmElqqnSIm2XdavEmTXPBI09V/0zkBA0FmNKYCFk4HGW/BVJHPAIQuC1J+Kc
	6wMLhdppGNd6ZO1HUpe4Ou74nAlSvxUkr0Uk5hop9qkFmaz6ia/lfP2o4I9pHWa0
	893bGAyuhzfiaQ03bctphGwtnN3HsAOS7kWvJKhlBfvlHldHpqLR0P3slde49AN2
	VSqo7Z+mk8uRzESbsrEDUjZFY0P2JvRrZapdFA70CDVj/TaeqmmFFA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021073.outbound.protection.outlook.com [52.101.52.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019r00-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqtjSEek3WNqOYT7JGr+VUndPaQZ4I0tHg1ytmVAsiT7btSOyxAh9JEmldS2etOanjiUkXErkzWonMxZUPbaDGHHelJHtv9uTxaf2R+mLZO/xuvw1+xEiIfBahtnGHp8jvoWhuPk1ronca1GHSTSsFA4K2z8XdtivqdHQ0B/TuNoivlwDugmxwulopk0ucrLasaWZcXcS+q5BmpTdT/DO7XBz3eCcGZ//CZUNgVwLD3ZBRaEGgzEXdAmPGp3TRc6eqafROBAj1rpzDQfp2QI6P0CsZDvPD97+pKbFSVguJ/1WUglR73pTWcAbrSq+WZsx5ZiaqjYkm1eWnUJzlh9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjeBJjxeTTnDkU2wxW6Wp7htulnxlqLEPBaxwoOGsHk=;
 b=gD+/04IY9ZwPMU124nA+MTH1pSFq9jj+tmJidY8hJGi/9w2+qctO+3AJa931vjItmDRaNAc3WkNhUrjhRKdlyFnHHd4Mtm5Aqvd+4l0+2HvowM8SfHFRujDm387h1G03ySNvCg0q3pz919v16HYiAyX6449hu61cugt4GBDXUtL6LW92ztL8/m23frfSjqcxeYkAjf3VckbZTQ7YHeVKko7mY34J+6Mswiu+1iFiud/LxnnuJsa68EkpxKJng7odxU0KjOm3MuAv3FpvB+C8XcTDv0KnSVsRi9OwdiFeEXrdS0d3dDXzuf70rgAq89i1d1tx4IOrKW3upNFiIWdv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjeBJjxeTTnDkU2wxW6Wp7htulnxlqLEPBaxwoOGsHk=;
 b=e+mWYteG5JMw4Xbm8VD2TItF1txq18aWOkM9dE+z4LQLuVNGk9+y+cadgLcQE1hJ6kmke2uWrbVuu67BTwK3e8+k+h2/bGXDTmjrY9vYJXsdu/S/DV/KAxV7tFaL2F4iVJMS2OJfZSYATzqToH+iEg1xMehwResR9N1137hCMvI=
Received: from BYAPR11CA0081.namprd11.prod.outlook.com (2603:10b6:a03:f4::22)
 by PH8PR19MB7120.namprd19.prod.outlook.com (2603:10b6:510:217::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:37 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:f4:cafe::cc) by BYAPR11CA0081.outlook.office365.com
 (2603:10b6:a03:f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 16:06:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B8361406541;
	Mon, 23 Feb 2026 16:06:34 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88C3B820257;
	Mon, 23 Feb 2026 16:06:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/3] Support wm_adsp hibernation for runtime suspend
Date: Mon, 23 Feb 2026 16:05:29 +0000
Message-ID: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|PH8PR19MB7120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a775372-ebc7-4d99-c74d-08de72f58570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1bnQpGkxe/MuLePkHdHpSrsWEyR5DFQ7Q/TT1nxY3+un7lG/RwAT1a/jMVef?=
 =?us-ascii?Q?Nsfl+EIToiDwqfXdAuayvL1Tyya27jg4+Rw3tIR8E1U1bCFVKlMVPzU5qLk8?=
 =?us-ascii?Q?DGj62Z5p6MrDYxPoCWDNi3AnRgk9HqvGlIdJuzCKDzBcIsWrsHCCX8s0pvtq?=
 =?us-ascii?Q?HA91aOvSTdLaATY2IQMojysByJgK0FF3rgIDTCu0uB0TrUa2DlLneaKksCaO?=
 =?us-ascii?Q?voK65uxYfjmFSHUYZiIysOjjSJ6p1bAyhYr2UeWggc02ZJZUC0qUuMMrCJQv?=
 =?us-ascii?Q?9ZCG1r3hJoLcEM12+YhAeniHSBeujPoKqdi5SeMSVXXcH58RRqyEhpm1bmeO?=
 =?us-ascii?Q?0crqDKdHche7BLFFs0kuSsGbxofMdaQlJW19m3OC9JFlLJBdb776gmx6CQBL?=
 =?us-ascii?Q?DWiig8dVvxVwgbPzao3iTGIQz3Ad2Yn/3PXFZiMTJMG/WBGmP0/nWZFZfOE2?=
 =?us-ascii?Q?B/w1i5kblnr1WWAv0rcXI7fpT5Vniiz+vgJUjRE8BC2EI/s5OJ8jGrv8+bDe?=
 =?us-ascii?Q?QbsKP14QS1OFrbsknbrHc7BWvUK0kHcCaSr3yN9pj7NEsnQY91gSlLfTYMFA?=
 =?us-ascii?Q?Iuc9sKX0EM9+UXqbG+/ryovxHzoVyhghMY2AG6Z4IwEx8AWyBd81HykBR56u?=
 =?us-ascii?Q?hwQevaMwVXHWnmcF/7I5DNXq9AV1/I9lytn75uGHONuCYCxdilv7tT5m8IwK?=
 =?us-ascii?Q?uZrUcCU1DHk96xIBB4ULybqeg+z4CF+hp2APvgHI3M5IGziXWsDS1AI+Pt9K?=
 =?us-ascii?Q?aUkqOjlg3AtTNh6jWhahj2VrX2xyXfOz8pA47LCL42/vMFShA/8kQUk+F7G+?=
 =?us-ascii?Q?Fi+Ml2IkN4YUR3wjv7ZuccLOVtl0VIUkPNnPs5l2IxjydwY0sxTXvrWQqeSz?=
 =?us-ascii?Q?U1bcHPknijjJ0KudHZf1VGY7ZJEH5doR4wj0WNjP2kRyeksegeEdI+ACSWag?=
 =?us-ascii?Q?pWFk0VZ0TG69IkLd15u0tMKDLGcIkl13rCn7NYgCwSX+oNEY9I/ib6iyFbNQ?=
 =?us-ascii?Q?A51IkpErP/pEcVg/uNxln+CKDY1JEGhQ0A/nT3oXIhFoG1uI5l0Lel44+VNi?=
 =?us-ascii?Q?V1EIwmS5sHrMhSUuQpiZsQf1qmGzy3pi6MIkqCjm8iTs6Etrn/m70u0sl3IO?=
 =?us-ascii?Q?e+GfLHERfIpQO8ZBVa8dWV5tm0zmlDasN7J0c1MrbZRMGrnAwqU0DlDLm8gW?=
 =?us-ascii?Q?SLVyGeDSNNuvfDGFRwZlLRMe/FZxQIrANAuUKqakB4I3djp7qyECMIfrzr/D?=
 =?us-ascii?Q?FiqYa/9R4B/mqrNueMY3Sy2GKqyUGttv+ba5MDeugsOogI53YkONmV2DuzrR?=
 =?us-ascii?Q?zntTkwLNljbuDfdWc6gbldaAgnRXLSjB9LDmzFukTlxyVLY30ZjkIsxkI3Ul?=
 =?us-ascii?Q?fDYXFzAN0Egm21SlJXs3Jjl8DeY6eRcv0bWfScTqiwOlmXzaUpI97VpTP7+O?=
 =?us-ascii?Q?r4U+IlbZoRIFLV2L8HFrZH2NUOcj802IgCgNt0mnQHhhdS2sk/c+GJiog0PF?=
 =?us-ascii?Q?xmcO1badtY2+tJI2CWXp2a5PMUtUFMXSoHXSMKVCEzV5syO1iBFtLetB2RIR?=
 =?us-ascii?Q?fbiqMHGF741x1hSuKNhF8dwmkC8ibF+XVgJ75qTv8qKjR0Hu8IEyDyVnYgCc?=
 =?us-ascii?Q?x2OaXTS6r87iIYtqlthHbmCGOlk+mkupijQTFqCigCr3ZAeYnxZDvB3qtV+w?=
 =?us-ascii?Q?E2bxpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LoCOLwPs6XBZAEJ9r9j15CLGlUQSpBbfc380Zt8TWfcTlWnluDxup9RZe5J+80MUK0F0Y91WfvvZoiOFFEuvfu56b74SPMRn3U1H8MBHCkT8iYf2P4DcgAM0e27IGYs9X40j1RAIpaJyv0O4dhLmmwdVaUTzAhUyj3NMcqUJxmat16wGJrRjahoceo9CnPMhDVzq94l8R0MPSYIfYgTWM2WRRB1X+k+3qIQS0ru766w1HU7Ax6Tg3DRdwaTZCOvjcIfeHLYR5qLPzeKqUQ4Hj+/dXujFt7a84z/tqVJGrYWK/sTGK/8rJN1Er9f6nMM9YY0RRXctOzVr94paq1lWfFca2pL0qMzO0LpBKzNpn/+qi2kae9Wg4xtrxgC7QhXa0DdZm2sWYF/wgpXnZtsmIHeaQM2XSkvp052wnjibbgt5OUZthqEehJc65urwFbj9
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:06:36.1221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a775372-ebc7-4d99-c74d-08de72f58570
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7120
X-Proofpoint-ORIG-GUID: fjqT-8BIPiYzjHvUIHaBhnd6eFJ8sDpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzOCBTYWx0ZWRfX8gBAKXoJ2ufT
 pg2Xgt76H9zHfXi3i3YR+bRXcjsLvT417e1OjV/ULHBj9aNpcIzqQZ8xiHGW+VVu743+89yNFjJ
 bGPDkBjMQSkTnWJT8PzkxnLC3h+fBpTrgjtpz7whaRrlTEuMKwUbNIqbXCB/n3Q/tcTRmBPlx+o
 CCvyZK6elbTc61EjuQiKurDHdS3tnKJVp+BQdZ5H69QVg2yR2S34KkNdwOLu6r+oU2OkFgmN9/K
 nc5P60uvXc1KyEBFVFVkLpLyVYeGdHn5V9LyNIZkp3fh72xEGx0pS3hIyPF71DKTVZHM+XWC5Bv
 aBcyJF8Z+DSZxdNHDloLEQS3APfOhpLMfZyKaTKvyfOxMzFNN678zEHDMRn4vCytbwLMjNPw8nE
 UWGUNxP+5u+/lggP0iygixYE1AglXAkcUIqwHTYlcDs5EZrGgjpg6cnQMN7SvaSMj8JGD2107lx
 oY7RmOZ+rbS8HBWeSrg==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c7b10 cx=c_pps
 a=BX3zSU6Em1tkVDhR+nIdzw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=mmtDOMPXX2ZRX6g6iDEA:9
X-Proofpoint-GUID: fjqT-8BIPiYzjHvUIHaBhnd6eFJ8sDpK
X-Proofpoint-Spam-Reason: safe

When the CS35L41 driver suspends, it is put into hibernation, and
the regmap goes into cache_only, but the firmware is still running, and
wm_adsp is not stopped. If userspace attempts to read a firmware
control, it will perform a regmap_raw_read() and this will produce an
error in the kernel log.

To prevent these spurious errors, add an apis into cs_dsp and wm_adsp
to allow wm_adsp to hibernate. In this hibernation mode, reads or
writes to the dsp controls would be rejected with -EPERM rather than
-EBUSY, and no error will be printed to the kernel log.

Stefan Binding (3):
  firmware: cs_dsp: Add API to hibernate the DSP
  ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate without stopping DSP
  ASoC: cs35l41: Hibernate wm_adsp on runtime suspend

 drivers/firmware/cirrus/cs_dsp.c       | 49 +++++++++++++++++++++++---
 include/linux/firmware/cirrus/cs_dsp.h |  3 ++
 sound/soc/codecs/cs35l41.c             |  5 +++
 sound/soc/codecs/wm_adsp.c             |  6 ++++
 sound/soc/codecs/wm_adsp.h             |  1 +
 5 files changed, 60 insertions(+), 4 deletions(-)

-- 
2.43.0

