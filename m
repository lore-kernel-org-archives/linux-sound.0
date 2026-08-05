Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285222AD2E;
	Wed,  5 Aug 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927165; cv=fail; b=sfm1VgOnV8V5SrKo6cYONRj9aIZT8XDMyH3D7+bMBrpsEYzhHSU464gv41Ig/6WpJMBra+A17qBYYKq/f3zYegxbXfBpUdC/4a9iFDKxUCDjAPc7mPby+EdTKGaz+57PI1Ef0iLNb0xhRW1NXtlUdQut2m/HhAvhbiPydbiOGjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927165; c=relaxed/simple;
	bh=ABxI+4Qzbuo/w2/f8ATCl9wktIaIXZejz1/Rayabejo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kt21oEuc6+BHn0NiFu5Oe/4aU3mhvvfhUWKXY1eGjbpP+26UhtWKY4XkCW8W0MOXZfNH/os9oOfPpAxr+msaNHHPMwP2McGtT9idBMr1Oyfcu+n4CTPhSaoMQnkVkCXoi4tyOlDPHHDZqSPYyuHTHHhym2afwArAzUOyT5uOhkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XLGfjY8Z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UCMrcgMJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XLGfjY8Z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UCMrcgMJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674HY91n2306777;
	Wed, 5 Aug 2026 05:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ODzKsueBadZDJoe1
	D9PVCKC6a3PDsDMRepX8IADxWlY=; b=XLGfjY8Z7muhHjcacl8iTl3KsARh1FbQ
	OSLDy4RtyzYBJm8y7+5dFsEPskYc9lVJ1/YrWeuOXdIg9+s0REnDbSbwqY0VHLVo
	80K+stcwTfWbHmPgQMelvQidVN+A70vaIJIFyVhjfAR38Gyuv++kpXmliNiLADtQ
	AfwXbqo9mjVf2GvWbrxVqDrDjrqMkawdYsI0n4T2CA4y3nkZ7I17SlEGMXa+FIpE
	+BRiNQBIBGUp7rspK7LifaowrZshXQ3aaqAfArgAkIh2gBZBKdFfjRpWcEwHzU/1
	CJX5Kyixs2V9zpwehcdt2vClgw2wiLPk4kHx50lIi7il4zQyARyHHw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023079.outbound.protection.outlook.com [40.93.196.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vngx3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 05:52:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR4X/ENjLgwSoOLX3oVSfXeyJLGdIwqiXHuv4m6P+uRQJud2GLSbzPMVJsuM7/lc1ifUtX45yVcShkkDS9Qc6a7JQj+W1iYDyp3ZgKhIIw/Kf+EOl/gWJK/K9P6NnjPUQG0iMLdqjJaygR3ITP3o/gZZptX4IWdL9EEi/D/zUKE6cpnlwZQqvZ/leHFiiQf4e850b0nuOsiHsCFK/bjhfU0hJq0byi1S/vwd26wxuLfv2vZQV34UriOVUYBfbWE2lo798ZjXErTQoXJGOzB851D/zhZzSMN2c0f5RnIlBr33aS+1X0DCpjHKnCH/BixGM+zt+CX5K+a+f86YZFARuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODzKsueBadZDJoe1D9PVCKC6a3PDsDMRepX8IADxWlY=;
 b=PTc32aOdC1ESxnJxSVheu/9olyn7m9vpP/BGyt1a4TEc0jV8fWsFhga/LUfGJj5H1CINMMxCfNz8zTMHf/44xoxfoKhLaV4KE5aJNAe6pom+EXkrSw+HLcRkvjsWCleOvQz46n8kw437WOoJy9+YJ/SLadeRxQ1GXW8RMi1rS5AK7r3mGu/I2lAPAJmxeebV3FNgOl9ARdPEzg0syyIsoiu5Hlqz8NyuFCmD9kUnMdkE3nMbLpnzIHNtROrQcDlmxV4yh/N7cUTKoaQFWBVgZR39hZk6udoyfG2El14gTLEJBy21T3afs89e0Rj/aoqEBuZWeFY8Y9/tJfw+pFScUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODzKsueBadZDJoe1D9PVCKC6a3PDsDMRepX8IADxWlY=;
 b=UCMrcgMJNnx7qGxJn528yb7/1CYtzAy0N6AtrDRGXatS3LP0oalkeekOSZhQHoB2yGoq9OMWF02T0GFvxlaTWyWgYw3burzmo8HfRAytdI9qAT5hLNfq1+69lWwOlM9dy1G1Lu9yi4jrpikp8eVeznjgRgo0r/gpiPdqi+K5rrE=
Received: from PH8P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::23)
 by CH4PR19MB8709.namprd19.prod.outlook.com (2603:10b6:610:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 10:52:26 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::68) by PH8P220CA0015.outlook.office365.com
 (2603:10b6:510:345::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 10:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.0
 via Frontend Transport; Wed, 5 Aug 2026 10:52:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A0DCA406544;
	Wed,  5 Aug 2026 10:52:23 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 92E1582025A;
	Wed,  5 Aug 2026 10:52:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Fix mock register default typo in KUnit test
Date: Wed,  5 Aug 2026 11:52:23 +0100
Message-ID: <20260805105223.956785-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|CH4PR19MB8709:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b19f2e0a-5139-43dd-061c-08def2dfa29b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|23010399003|16102099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	HatqFECBsOnNez3TTrf52qHymWZly01fiWGx+kiLuxqtWrzC6sUeXPb3nlS1VfX6ZZQGYY1WM6PK8jML62hze47agJP3gteYxlPQvuzU13dzj6LQLm9bp++UvdKiGiZZtR62yMVQtoiezC1/YfcO86LfP+rrtwBX8Mre+dM9TQlWrL8YF+zwFICPs4YJpMZVrySvNotW8jrXGBd8Qq6gMyV58co1Z56rJYKvr1a38UQX6DVlFzg9h6/N9v6Rp8sJ809hR0RRkSMoVy0mmec1Y/BduVdp76ZZTM8MA9pLwu/7I7ekkDzpl9h+O/V3gE5DzgPj+jGpSuU5ijR2baTsdjj6GW3P99ikDaXpPCiWlkIF4lY95dqzM6OLbaqu2W/Y5DIvasrXWwlbkI4kjlFCtkFD6FMZvALNzJ7qA2Lj2bj089Ryq2Uwp32yhjiw/KDQI7+3uG8g13nJoHWPXBKtwWaIPcHWLxcti94jNtgHepfVotwZT+yB5is85YNoUxgjiMVgAdwVVmqrze37z5OdgwwAj3yA8PKCST17pL+45R/JHh1aryLuIzbWf0AcWb1va1uqBGicN3ss82Y62RF/CgoGwhAEsk7oACE11SYcC84TM+xc+AF61fd5nn10PM+A/wqifJy4WI1UFYM9ADj+oC22oUccMFqIj5kX/jHVVskTaLzHybXm6QSrMmDz5XHBDXvNAwDtJsZ899RjDOWwVA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(16102099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h0/kunfER+QNkGZBHuNDxnXkbZuMiiKENEiT7KkLl3AQEnEC89xdSt0d0ZKE6QW2UGFrlH33D2mkC1DvkLBPbtt6N5sMjQaRrHcANn/FdTbbbioyOEy9Ld+EWC2gqGA6e1IowFvRQO7DE+V+tWXxY47hD2XMo9oRUCnfFBQO4pBvJubE/mr90M41sXgGzbCPYsb707eGYBGU6/7KptSSW7l0PNjLSC6xIzbmr+xX249pzwYRn0VPqllgbgC6Ytq7SBwnjtrUDJ9+tjami9arDVUw2GUHtCk+f+53n0MACVSoOf5Pv+4ElfP5hJh0T0RgWrj97irGhdPwG6vcRsAtNIEPQlrBjJYzvRPFhR8K6OMV+a9Od7WwnaWJg7PJ/ZXBXlQCnpWVeqEvRtYqB8sLYnjaJSLYPTywfHxZvWIZzC14LBLWgN9JNaAJ3NXp4JWz
X-Exchange-RoutingPolicyChecked:
	gcyNLb2MkJPDAT7FCWev/eKx2LPbfUkKd+bOA96ccg8kfUA5l81tBURWxChA+XC5//V8vG8+UpDSeJxxv8LdR344yqHcm1WyMut4kaZG9O834n2fnEGpUm5EHOqQeASFWDachQA40VUq0V7TtEXSf/aLr0n1Q8JEeh2zOC+3jz9xGNqMSMxungkMk82OuScOP6UF83v59IlhzMkH3WatzC6f2O4gkwFv6buPyfsf25Rw5ZGH7lkfI5BFZydqF1jGn/k4JHI0AiSSH7cy13ItD/5kGQCMlR05uhit1/pDnmeDzLwLUPq3nvvT3UpHdsEmIa8TsETR137ivQiXUnzYVA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:52:24.9708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19f2e0a-5139-43dd-061c-08def2dfa29b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8709
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX1/GZ2YS4JNhc
 iHs7qCBTwSD4tklrLDQCQRgweIvwkciaM1Tmoo4svG3KQsDWP8YrCzS8P5pwfZP1xk2kgHGzM++
 gok92BpygpgMRRgXopLeZ++epFOysVQ=
X-Proofpoint-GUID: K_EEfTvhMAwXg15ybb2k4mgl_2eQkDdd
X-Proofpoint-ORIG-GUID: K_EEfTvhMAwXg15ybb2k4mgl_2eQkDdd
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a7315ee cx=c_pps
 a=5P+eN9gLjwhLWG6aGfyBiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=cPeXgRuIrnG8VPENSakA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX94brlZIUda11
 4OHMBGg+tdOXqoZNjEWUEKN2Qukfob6BwQKZxsVdmN7wcvnej1mXICeASvA44OWLJqqHXjqy0+/
 IXwbN7N8t3dkZliM8p35oHdVm5YYwGCtr/V4Y7Zcoi5HZMg2oHPykUXV3OiNojpML9tQ4/bkJIu
 gDADz/WfyZTPFg49VHObkXy/5OfLj6OT5z12S1rbaBbg5T76pXebTu6TNKWJVxWLIRG07xm2GrO
 8MVHnpYprkGvuUQBd09UqrgjjuGodc2WgVanzbLsgcfLMzXdID44hYNxRFXTeFsjMW2mxV+/Hod
 hNmwkame2RioeW6/mE7N/zUHGJxKwpAWb0jWIATObA8mvQySepuaLGfS8QMLwz3YCMhSy3cFX5F
 rcUfNDROrnheL3du+tUcdJlS1AeLva010ZwvczVJQQSiOqiK28TmYdpxliS73XPPNdCvOJ+9caV
 SPSXnY70YEQ1r84K6gw==
X-Proofpoint-Spam-Reason: safe

Correct the address of the HALO_SCRATCH4 entry in halo_register_defaults[].

This doesn't affect the validity of the KUnit testing because none of the
tests rely on this value. It's only defaulted because cs_dsp will read it
when the DSP state changes from running to stopped - this would only have
logged a warning about failure to read the register but it doesn't cause
anything to fail.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c b/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
index 5167305521cd3..c966b30e10823 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
@@ -147,7 +147,7 @@ static const struct reg_default halo_register_defaults[] = {
 	{ 0x2b805c0, 0 },	/* HALO_SCRATCH1 */
 	{ 0x2b805c8, 0 },	/* HALO_SCRATCH2 */
 	{ 0x2b805d0, 0 },	/* HALO_SCRATCH3 */
-	{ 0x2b805c8, 0 },	/* HALO_SCRATCH4 */
+	{ 0x2b805d8, 0 },	/* HALO_SCRATCH4 */
 	{ 0x2bc1000, 0 },	/* HALO_CCM_CORE_CONTROL */
 	{ 0x2bc7000, 0 },	/* HALO_WDT_CONTROL */
 
-- 
2.47.3

