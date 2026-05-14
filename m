Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF0125B0B7;
	Thu, 14 May 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771946; cv=fail; b=KXnb3cXAVY0CrtE2Msnt6rhU3p6O502TIzGsZQIsTzykZr5B509nSitBDtH3Al5l61CxX27BdoS//cUs3ZY+MfTuEwOvJzUpNHkTttjuf8jEVsSSibySmEsBJaN3WeyhEYTOHuWBkljYLxAGipY4Pv6voQZYk0TFZubfAUHp1ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771946; c=relaxed/simple;
	bh=rr4EoGbNHujVoW9kORzg++9eEXblecUAPDNv9JJhFfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VtERSJLSG/um9N+4CgrJi+Lc7CF96cR8b7a1k511PMCBvUuELHiRpLbH/8rhc6nMzcKU/GIzz1SIfkL5y7frfiyIk/pW87DbJYAwQEztn1YNH8x2V/lV43rBxv2ztCRwLOkO1W3KIkm/V3yGnxiElBzWsCzpz0xK1K9nZzH9Q+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mf2V4Ol9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=c6AgwVbw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mf2V4Ol9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="c6AgwVbw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EEwxx53326871;
	Thu, 14 May 2026 10:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=JbyFTRHh7OfwpDwg
	LlA8mCUkLfMEELzTQOwm78chVz8=; b=Mf2V4Ol9YYD73tRUIL5w85saOHCLkJf6
	lb23hA1+FbACD9Oe5OCNl24q4TftGc/J2pB7nPvJ1KPbNjYi5BDmXHtz3GKG3BJW
	p4xi3QTgmLapmR/JE2dAJSyBLLU+D7YjU0oE8ecLL3GdtkausSWx2FvsYrYU6W5U
	YbIa9XLyxL5zu3DydDA+8uHXITJn0NVxjdYBSnkK5LHVS9/uPHXOx3L73jhFe2p8
	c19Eur0296qJuc/u+BbzA56dAEOobxeJwHLyzdIvbK/GYgaSD++3Mvfyv7clHsgI
	LcnGxm1d1+sXf2e82q7rgRdKbFfg9+57wfywXznzD4attb7NXSOgcw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020142.outbound.protection.outlook.com [52.101.46.142])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e4c7q2m0k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 10:19:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkfmkY2rjFroNSqE4rxI1DPPMHyJVbK4gc762yPUjpjk7z0qGz6wqoVSevCL6I6ntPVPeV2wqstst7N/pGhravo7pjc/0RJk94jo0ndgA9UwrMBLo18flOS0Tpf6yAQjP+QV72nvQRezwXqo/znTq1toCh0VdqLnsLqDrXWPs7k+MvKJA9BRXQjnqR+stSC45wGwVSONUURbVKqgAuktrnf7PF2MacYJJBZfnGia0cW2vYvk9/7TUvpXOhr5TRDjO0oC213pOOzsIWKoHnnvOX3z8YGPsmkOLs6nu+EzXIAkUgvOLD6TqWtrbg1HVg3I39bbyzlLNp1s1KNOrIyXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbyFTRHh7OfwpDwgLlA8mCUkLfMEELzTQOwm78chVz8=;
 b=plXDxk7BtNvqKN0zdaCLsG+BLhDaKdemqp+smjNE12IHl6U9E8gyAcEyxGAiWsx46AKdyA+gnVymgNwkV0bYAstMfAsflpWGEV7OwU52FdAorfN20SFtskzbsOK/Uy9gPXZ7TMcU1I6ceEF6vm41jYxGpcrnca42nmH5RedFIrpAJsd8k3SUMFN5njfSS5t+xzJplEjKRLuuvJfNNlVULWRlG/ZQL93Z75eBxiZc0IW3jdxQnNukPJqex1IzpKNyO3E4eiSVyFUpwjSkS76kJq/YpbJ13G6xQK+5fqwJGdjT4I3QLJxF4+kEWGrDXaSI9Z5fwj0xVTByzN3YBHpgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbyFTRHh7OfwpDwgLlA8mCUkLfMEELzTQOwm78chVz8=;
 b=c6AgwVbwvFD4Rv3ZTLgCnseRfB6JbYK9+r+3mRSOaBXeizkhFsR8MKthZb+wb5aS6bxsRMUmjk1MRrz85ARIVnXkzGJJVphxUUA059KdmFOK+p8loB2gmPFUyT24EDh9WA8vmlEk2V2rQWvLJC4fJ3Q8XbQc9qacfBvWko2E4Gg=
Received: from CY5PR20CA0006.namprd20.prod.outlook.com (2603:10b6:930:3::30)
 by DM3PPF54CD83861.namprd19.prod.outlook.com (2603:10b6:f:fc00::725) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 15:18:57 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::db) by CY5PR20CA0006.outlook.office365.com
 (2603:10b6:930:3::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Thu,
 14 May 2026 15:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 15:18:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E9C9A406540;
	Thu, 14 May 2026 15:18:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BB58782024A;
	Thu, 14 May 2026 15:18:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Log SoundWire status updates only on changes
Date: Thu, 14 May 2026 16:18:54 +0100
Message-ID: <20260514151854.695145-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DM3PPF54CD83861:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a0e64d2-642e-417a-68bc-08deb1cc1df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|18002099003|16102099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	lC5JGGVtQpxfgT76+uG3pfvUMgJci7Qdv6rJHIIe1DreQzJLXpNRm1t3QeyEsqyHC+0VfaE/QZmZPdF9QzVxIJovWg0/aGPiKxc7L4HD9EhasqrGWZbzkBYp45CQclPwle1Su/ovHknIoA+xlVDYp2fsqN33lDm77KS23dHR3FtVaGbkxw2Ua6r/OsnGQSQxj79bIebo9+G3jfP44z3qVRRImUiYjE25Sp+eD9FaHsQNdA/G209BNB4UmAyqR6lI6q75PFHFCYGF2JfiryK5OXXUXkdFe//OLoR4bBVnVH5MtpV5rRFGJGg/6WqCqscxtBqShZ9uNNQCn9GEGfguRHj/N8lHrDfG+hOEBWFVMinKbPF86r4lO4kANX6H4lhRNvc6qJPtccfXpLWtKxmns9gB7L75SbLc4ijG/4pSjkzv9Ocjm2MwTSSwG/EfRPrtGQeez7tCCZcou1j/ehxCaW6fOljORFmFlmzVJQSF6V4YGK34PACtv5gKEDTMCNSlt7zn2bqZex4wAQUhEXaXzBHDjiTV1ocEOjsnafFrsKZyHZiF0P/CavqOvyuuoKdiYNolDfEV8e1sj2HR9yIfC4KqMTDoXYHTC3h3YMCtXB2080T1Oa+sLtz+e+wFhglxiq/9GF9JeP0H1rNCYQ9OQj+h57ii3NyceWsw11xH0PW8A0uLl+h1mZcBbQrfAOgnacgQ4UXJO0b87sW4M/HMxtFdwfkNiuzsruWJdocCVcE=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(18002099003)(16102099003)(56012099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8pXUgZukC8/F/ds4A9pxK5fg/ReFtK2HasEZ1ipy6EoERX623MSnoZVElg+c8s5sNX7STe4LjMZJyqzZbSNn0wvpWWB2A3WfdSFd7FR9EdBQMa6QVMManC6FF3s8ABrl7Yd0SJleHXmNeu4jDFopc4a3G0b7/pIFaAyErhV60tNUWSLj6JJf+IRWXr1KqG9FikjKf4hPmc/k3tbP2pK2mJCeHOEe4jLqz9IqV0/BgeAP+vL8v15R8/DrFcb4azSN/PDYyL57CrkdMWDvRdsHoIHlQKo4dzG5/7RXln74nn4BU6PmLc2CUnmPuHMP7kyrwaAL7mAQdrB1FILc1ehRAKuBT5WGiA8nPnSGgBRWsm6JXdlnTV2DxC13b9WxOdVuW9rLvghL3vGEkgKvCaPIXWFSJjiwbd3o7Hem6EeMQyuiIOyKZyt4ty6Ft1zzk/gl
X-Exchange-RoutingPolicyChecked:
	ciySNqjtK23UqDSNgQPcNWQKUYDNPF3tB0GxqkXZD4RxdcQocGzjyMKDEzX582HnSd+K8Je1ruQWxo173k4BiDPwtRHnpEMOGd13VkJTX1yc8Aomihf/aIrC740WhcvoJV3ADi+lbN2yYyuhMKQbNXMzXCKYM8a1BiOU2q7VzKLEotgVfPHZ1AqTjMyyqHLfmKAjmg73SA6VvxB1RsDdDGorAbiA7BQ/ZWN0g31HMieC7bnmaPOqXzsg7Nb3uNNuCzO1BKYyYs72FQO+uIoO2MZdKt8oTUqlyKL1M10O4zBys3vxDkGSND0zyQzNXWCuuXdB6MFz5G8qXoVVaeo/KQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:18:56.4018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0e64d2-642e-417a-68bc-08deb1cc1df3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF54CD83861
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a05e7e6 cx=c_pps
 a=iw/g3Nm1s12GBgadF/0+Gw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=4JUanPkz7DFpK1KuenwA:9
X-Proofpoint-GUID: AF-XmXCReuqu9kdcwg6iticbimUe6HTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE1NCBTYWx0ZWRfX0lVrBo4/rGKv
 iOp2fWKGUmKxRbIZg5XAbxjeHBSamQvZhQBIcpUv0q4akoAC95Tzo8kyQLRBv/KkN2eb5Q08LX1
 pcP3eVKq5f97mkIxUyNMjviWRvSYJZiygD+BqqJ988haFJLu1q23NqFcS7jyue2jvGyKh9U9WzR
 ihpSrVn//3TgHZUJ5JxC7gPk10EbfMoREa85ESijp9TxlENKZuIEyiJrSKIaAojVHueElsoCSVI
 j0NHkmp8t45jKSWB1/59LgH47geUBeqPEAejMd8Jjh54g0dSyxjv0W5jYq5+daCw+X/lBO3syvL
 7+WPVrg/Te22Jgpl382NBP6pcJPnbNf44VPhRuzrxX8DA7XSzixXyUuZ0wV5eJR5NN87Gl0wNoC
 WisOf4ig75HpjLFxF0jlDBxPk2pB1GC6wlcbPQmsH9+uuSAx0uNbeW2OxsNlCTk7+jt8F47uWJc
 z8QqafuwAsX6Rj2DbkQ==
X-Proofpoint-ORIG-GUID: AF-XmXCReuqu9kdcwg6iticbimUe6HTG
X-Proofpoint-Spam-Reason: safe

From: Simon Trimmer <simont@opensource.cirrus.com>

The SoundWire slave update_status() callback can be invoked when the
status has not changed. To prevent large amounts of log noise with debug
enabled, log them only when the status changes. This also helps with
understanding them, because they now log an actual change in state.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 105d38b1c187..d5b9e5f71de2 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -385,18 +385,19 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 
 	switch (status) {
 	case SDW_SLAVE_ATTACHED:
-		dev_dbg(cs35l56->base.dev, "%s: ATTACHED\n", __func__);
 		cs35l56->sdw_in_clock_stop_1 = false;
 		if (cs35l56->sdw_attached)
 			break;
 
+		dev_dbg(cs35l56->base.dev, "%s: ATTACHED\n", __func__);
 		if (!cs35l56->base.init_done || cs35l56->soft_resetting)
 			cs35l56_sdw_init(peripheral);
 
 		cs35l56->sdw_attached = true;
 		break;
 	case SDW_SLAVE_UNATTACHED:
-		dev_dbg(cs35l56->base.dev, "%s: UNATTACHED\n", __func__);
+		if (cs35l56->sdw_attached)
+			dev_dbg(cs35l56->base.dev, "%s: UNATTACHED\n", __func__);
 		cs35l56->sdw_attached = false;
 		break;
 	default:
-- 
2.47.3

