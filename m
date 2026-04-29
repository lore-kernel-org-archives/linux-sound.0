Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFA533F595;
	Wed, 29 Apr 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777460009; cv=fail; b=gl27qpVEOxy4jaSeXH9q2dd309vzd+6mk4MK2D6qjqZTmzQ8DyHjUmcvwEjeCiN67YS/83D61IgB7RZ02S8hcXFAQXKr3zHnI1Oagl0at2PdyymdLSBoT70CQepP09cmhooVz84+JWEV+hOPw6ZmnW9z6hmBGxiCU49nWrc8aRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777460009; c=relaxed/simple;
	bh=FYbv9zb+vAxR9yZSpQuunIj0eE00KW4HQ6tfZMOQ7tY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lAEvTS1NilICepZziqwVOMrrI4rr8fCVfFaKS6PsM2+Kme3F6RI5EBaAIYxRpFHVTtTrJpCDqEZASyMklgnHElD76Sa4QOpLzaBTmm2505xTI1G4s/A9Mdh60593YhUTauxMfgrNmHipXULJQBUkzfJK/J+2YVRDHTBOdiaSfBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jOyc7lvi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WNQdcEcH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jOyc7lvi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WNQdcEcH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SLw0063678265;
	Wed, 29 Apr 2026 05:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=m0/6cHiTUpViS3DQ
	BnHCqSXZZG/k/jmWLSf5ih7iiVE=; b=jOyc7lviR2fJN8inGVIxOeldjF8aGnkj
	IxcfYqiLljNNoNoEejhwMgNsqw+2a0zseFBgH7LxHJXcFrR4SLek90VvdNJRRfNV
	+ZjNvxAezSh65qU0XmnGi5EI/PxsqKyn1JaPJMv3BqyRw4Ry9cfsa4HyjDau6ETk
	6jQcxLAOyiGryikHwPvtg5ltRNcRamVenRgUHKlobLJcHoqVf3z55WOouAFlKmg5
	37HJ3nTyyhUqnJQSI5iTRB9nj943Gk6UA7oAjrTHQ1yY6CuPuhY+4z0PAqYhFwR/
	r6J8NJjE2MgnKB5OeDfwsfXOBW4i8KtjQgWzq5PaWA/PawipCxk5KA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022123.outbound.protection.outlook.com [40.107.200.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10d0yv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 05:53:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr45Ccv/XQLuffq6baCCGHYfdepPoTr0i3Ur4RlyOpkgDT0ykSX/oZ5YuV5ZOAAbXEgmc20TDFwjZ+k1JXqFjlFdHzki8eUbPiX43m4AJ6ytVxTYYhOvbh1M+IStve+75XHmqz+P6wVx81UGfoGjYReiiCMm6/wAtKi0vopsvbjRDWxD3weWU7FCe4EgGJHaXHMlC0IARAX5rrsHtUfxsyeyGs5B2Flc2fEqLGm6xGXJFTKIfOH0CJqYgwZAVrT1336y/w+kDGbEDgd9ftCQb4ClqBF0ItSDsFhxj46+3VlQwvc2g0/wmOhOADpfEbTa9ERzy3YiqMZLfH0tuqnMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0/6cHiTUpViS3DQBnHCqSXZZG/k/jmWLSf5ih7iiVE=;
 b=LZ2Xk64WqnEQt7w1E0N4aVhrKlKG8sWDWiVaTckTRhQn289CUkorIM76to45B12DYGwMP9ld8RN3PmCYWKJqTFsNFTxgsqHTGyseUR90mHaqOFXIczzg2aLfJ8v/Ro1e/E6r/EQZyYQrYgDaHfsjIhZORrxVHQC/pBLM/u7rruGvZtxJAK9xEQrC+jOmMk1pY1jP5Lq+iGbGziNnM8WW2PwWQnYnk71voTc4oVgkzmtJdDXa05p4482DuZCC9yYsSkokxRr1LWJ5tf/gSiROaHfwh5g5AUzMQdb2FEqJwrGyfQnx5uyCghFJSCJPXWVyk+fYxbPbsjlI4QcbqVQnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0/6cHiTUpViS3DQBnHCqSXZZG/k/jmWLSf5ih7iiVE=;
 b=WNQdcEcHh3gJsBkUXIa3Sz3ityen/XmNwT8hQaHeKbHUwdAlcKMebWGZJ5ZwYMhGMzc0eJmU2+zajgX65/UmI6Xe++uY2sFxy3Yr9oc9AMzSXMOVoYauzdLBFcrhM3+HasBE1StIppQvKUDPlC7q0v1KheOgwHFnMqRUcRAZo7s=
Received: from BYAPR11CA0052.namprd11.prod.outlook.com (2603:10b6:a03:80::29)
 by IA1PR19MB8866.namprd19.prod.outlook.com (2603:10b6:208:59b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 10:53:19 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::59) by BYAPR11CA0052.outlook.office365.com
 (2603:10b6:a03:80::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 10:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 10:53:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D896240654A;
	Wed, 29 Apr 2026 10:53:15 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AD44A820247;
	Wed, 29 Apr 2026 10:53:15 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] ASoC: cs35l56: Fix hibernate write in runtime resume error path
Date: Wed, 29 Apr 2026 11:53:15 +0100
Message-ID: <20260429105315.2438298-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|IA1PR19MB8866:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d1ccfbf6-9b2c-4c0f-17d1-08dea5dd853e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GmlxTxRwxWCkzvDgkeqW3zi/Vw/tWoY386PZx5EJg0QIHRBAnss7CjtyeW98saMsZTaOBcAzM8JgCam2M1OAfVIMr6nWdwsi5USD6LfAeLAL0nFAtk/wv9KUyxkR1DKOPstkJe4jNMBVJQClZjToDpcX2TkzYh0Ijtgjx5MfETn536dTMEGWkbMspDQHaGT2U+c+aFZ4lZRuC3fSm6jlzPHqBgsZSeiWq/LiZWkD4YnKizbhJEt/OpDVDtR/gR9FZnTNnSJFlLYCkINCvh+wWAKxbXqFBIOak3ttF4jMIq9r+XERliFuvgtDTs7N+xV8/mEEKrWW06En7zxUOcYCK2UnmuvXtzCBQswCf2+yU5wBxGOFw1dx8WCN3cufETgDvT9Ylx1OuXMWkkJUkMWDKLE1dulKJfNQIIwIYW7Pbdkbn9MAbAT/SwX3vx4YlRBmoUx8DcDMOtvFKo7rumqXteLphlCJA6oM4vDhT7LG87hHd1wldAAnYvaQ2bvb0FWA34Guv00ILS3/5WL9SycGKQ+DYBCiG7o0gxb3CGFwfMrZWR03KFEcOwcg/kYdr6ropVFwc0UPJwYhXrHAPVs47tGA21HM5bRFAZGDJR9nTLBWXGYZniFk2KJ3HSaq/SAYLgQixsF6nK3zfdiEq2VlcdZLTv7PmFTaTySGeBpmkKqt8R1aaVflGHxmgbD8aV4xls3B7ma39uBegwQYxUqfro4/cvBlQFMxsh0pJPAE4mzSCSf3cW22OJTxpG52KwQ3AEHU4I+DxtWNLMcJEOqiag==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	THyILvjYkk04wdQq6ccQmaa3fKktJkEWGsfl6+NSyqwdp5QkF1phjFqPwqPFIhzcqPURgwHZCayH041MeFlivBuidGt4iooi98y6TNTH1vh1g0XaKxypdYgqzvY3b9XluBRDU4Vr26Jm2u3bJi1RyFaWh4Y7RaOPQjcuKrtA+Qh1hMZ/dqRWhQOyOW8HruI6B5X+q+qkfpwZjNWHisCdYkKAhGkAYweGilFC5un7OXdOM5Fobj1tzVMgzmQZNQqnJfl7q/kyP4483X3e2pLkS84l9B8FDFAd3Jt8x6p5DoyuEIChZQZmaDnefOwV6skaJErx3QhGeyLGwME1rLGaf1MOllUEQMW3FiSv8VYkcZdZgtz5VBTMHkjG78Mco5qlXGumSF/orlPBZJ+XTu02s2yfXcKUlPLRvniyt+eN+kj8yDPr+tTPszejNK8ifGe5
X-Exchange-RoutingPolicyChecked:
	TQvXB9TzmNwlWRgqS41mypHP/dN+NdU2a3vM+W7GrUkl8h3scTyc034GJwzeAdfOrNo6irNX0u/g0c0EvTf7/96bjJ9Jsd3/hZExeC9JShzNZtDJc00OdaFpuXGzCcgWVD8fM3Z8qxNPf9dGXIsTCjfL63mEv3FIw0TWcOyfEpNtwhYbN8uVXfrSi+6T9rvx9pDDYqanUbz9E7vLOQArgQGNAoZmltjRGgAUsk9bz2iQjBIeyhoGiGrRKgPM0icY8K7Y01h3xuMOTBPjc7gK2wU5C+l5fPXofwfQFqNLj90eIahF98ZLeuwv/hk5mYLuDOFdmYtVmckP11iD4R/0nQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:53:17.1831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ccfbf6-9b2c-4c0f-17d1-08dea5dd853e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8866
X-Proofpoint-ORIG-GUID: MNYL6OtkGoquI5iKzhzmgGUPevvb0ld_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExMCBTYWx0ZWRfXz+/oC7j3+x/M
 Fa8WikiElASWdTgXf1wceQCYzWYUuDIqSrblZRmOtIlbSYgE32IKpaSGVo66cmG5PSsyUa7FJaS
 iL947U6kcTGkiy9UaFc5HyzrPnPqKI6P/zl2cROxgCfTv8rrwAm82JfTGxwTU1F8SBi0YE1YVA7
 B92sX8dZyTCdp9WaAjpuxQO3Wyjz7xOXXpWF2MtC/qOcUwpoVp9mfSCHLS5FsOTMmCATDd5S0uF
 TbN0s4c8lbl2534a/QW/DAQgUvJRLc6LL6rlmXEJpNqiVdZirH81ka/MFTA7HHa+Y4QTvg8EbXH
 5kVL/1CGHPEa26MpDe0jo6mVtB16susfaiUDEPUAtdU3RmNXXVtHgQF312KZVsCiM2idFOA6P9a
 1HJHyCuvRHH0VB0R3oUPhkrPuCoREoL3HySeZUOW99IJGpcLecosAo2tDAtlaWxvRRg0WQtRTOm
 YAmaKBLPcvJgNdIDqwA==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f1e325 cx=c_pps
 a=jAW+G/n5Z3iw2FAGIuuyAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_Od_2dyeQ36utoUuY58A:9
X-Proofpoint-GUID: MNYL6OtkGoquI5iKzhzmgGUPevvb0ld_
X-Proofpoint-Spam-Reason: safe

The error path of cs35l56_runtime_resume_common() should only write
the hibernation sequence if can_hibernate is true.

Something has already gone badly wrong if we ever reach the error
path. But triggering hibernate on hardware that does not support it
is likely to make the situation unrecoverable without a full reboot
because there might not be any hardware signal to exit hibernate.

Fixes: a47cf4dac7dc ("ASoC: cs35l56: Change hibernate sequence to use allow auto hibernate")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Change in v2:
Fixed commit message typo "necause" -> "because".

 sound/soc/codecs/cs35l56-shared.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 033e56d5e9db..ea724101cdd1 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -851,9 +851,11 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 err:
 	regcache_cache_only(cs35l56_base->regmap, true);
 
-	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
-					cs35l56_hibernate_seq,
-					ARRAY_SIZE(cs35l56_hibernate_seq));
+	if (cs35l56_base->can_hibernate) {
+		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+						cs35l56_hibernate_seq,
+						ARRAY_SIZE(cs35l56_hibernate_seq));
+	}
 
 	return ret;
 }
-- 
2.47.3

