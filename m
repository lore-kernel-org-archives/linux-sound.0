Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C803E7158
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553222; cv=fail; b=ddQjHxakagwDdFca0OtEsdyjFaBsK2meEV/gcqUh8f7Fx9cCq2ctymkwxKNi+ZG0ZkJ/skkBeYZX4GAU5XGSHvlvDFXzWvEGhv/I+cvB2FkTiuUsPisE8ES+0sTkrZ3S5n2pIC0LZy+0It0wNaBhhc0WqwhVRcA3iG2Lj3eI5ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553222; c=relaxed/simple;
	bh=9hxxK2wQgnE8xB/ACuYTbfYD9AdSetbpKyQZCJAt4Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4l1xwKqs63/DF3NkfmMpxAWQbNzpJsv1E/SCOAZ6qT51+Ge4MmodbdnyZ5U5nMt7GIpXlVTQkjd5qBxiT/BKUSXSQlMVJsmKWsLJCiIIgdmvFztSo6Ohz+WdVho6zv5L3xXttEc95zeT2FuaA6MaWFVlF+L3uDmtB63V62eQ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e5UxxTw4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dzTC0mvS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e5UxxTw4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dzTC0mvS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237Fvu53406224;
	Tue, 3 Mar 2026 09:53:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=a1Wq/TSuvSh+4GUH+3s+RS8wTF0524SSKzNprzLYS9c=; b=
	e5UxxTw4/6gpMNl2tFxvpO8v07I7YVVfnDPezumeaJc00zXjBgypxc1rp1mT1nbH
	8g1oPz+iPEtSOrX1wKsqATxTdyxiCb+S8Rrh6jDMsK+vrgEiiDc/eIGeztQ8PS4z
	AYZDMuwq8AxWgh/2BbiSu28e/yw/csZFDjiiyieCiDsF9yAcUss8RTP+tRSCrh/i
	vyTISOk3Gubj5jYliimC+rcvjg5+ulhC0WxgRsz/clXquFUJgV8HEB9KUWKO5GEy
	jeg5tvngLSXLERFZSTEbw59yVZoWerKBAma5i2fABIPkj5GEfz0vrEJoZkF2wt2T
	bB9ZJldJHbo1qLe4tVP7iw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021130.outbound.protection.outlook.com [52.101.52.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn03gmb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 09:53:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w03kFkl2aFFYLPRPwi7yp3JsaK1uVMCW7T2ENRBnrUNpdfyN3RUb/EjFtBIGEZyJjZBKOyUrYljXJplh89jddRgMpiQ6fYu2Zj9TCM8mEtdNAunqu+nQbaLSbTcZkE0TLc/W8DwqARTPk2rh1IUZiyk8HGcPrqrXIILC0UTg1b3QCMbg+/64YL32WxnKtCABXfmPJlJCvhPQulfJNBVYzkIOKYV+2mEciiUZWp1fNbLsySLSCATiHaRJJesfDII9hKe38jcxNTyj8wks3XS4whMU99HpXTaRJgW/tmxali13PgfwIoMsXg1yiwcT5AM9spMBhgTi5pHJbRhtgrbK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1Wq/TSuvSh+4GUH+3s+RS8wTF0524SSKzNprzLYS9c=;
 b=FnI9ZzP4JD9x9HDu1M8PJcoAOIt5PzZEAe3OjWeVZBL98D/K9X2iTZp1183CcfXyV6yNotg0LVTJ03dX5P3fdbl7b1glxb1hLzsJnfkRkBxjx0aZGL8IFoDKJozDDnFU3p5QCMCctf/mZj7Q9qYp8qvuDPf3imIHV4fbz70MLMmBM/f9/P2H5ZhL0cHWLS6qdnjNABK5JGMI+ZqJo222nT4NwYBxYfRIN0aDmobizA1Tepl96yUmFOHpuAOIIQiUyV2PWehW0ebpRPmbngsCIFs7dgbYGB4p6fI/jPh9ASSIJu3l29GfrRHDydlktaleQvBQSRTZpr0HeyFn+xtzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1Wq/TSuvSh+4GUH+3s+RS8wTF0524SSKzNprzLYS9c=;
 b=dzTC0mvS8sokSJww2ySBWjnCLJUxEw6G7q9T3Icgdxqd02JYkiXmv1OeKguhIV6nsMyNc/8oIBk4mqzDXUwt6BKAm5eHJL3379OU4zgJ50Gn6QoiM/fdtDfg25cRQ7mN5vLuZn8bYb5qP865N02EkMK7RLVk96lARwMvVS87oco=
Received: from BN9PR03CA0145.namprd03.prod.outlook.com (2603:10b6:408:fe::30)
 by SJ4PPF8556607CD.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 3 Mar
 2026 15:53:16 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::59) by BN9PR03CA0145.outlook.office365.com
 (2603:10b6:408:fe::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.0
 via Frontend Transport; Tue, 3 Mar 2026 15:53:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 02DA240654E;
	Tue,  3 Mar 2026 15:53:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DEBBA82024B;
	Tue,  3 Mar 2026 15:53:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: SDCA: Use named control mux for GE/SU controls
Date: Tue,  3 Mar 2026 15:53:08 +0000
Message-ID: <20260303155308.138989-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
References: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SJ4PPF8556607CD:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ac5920a-47de-4415-1435-08de793cf9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	vl/7VkSr09LehOizVlNOQk8K5bH/LUT6gInZOJoITFNrCwyLR+fPfKU8Bm/7IaQjestj+7XLCMizTg4Mpn95a1PhdOwYbn5Mycp+AOYAykxSX2amv6t/G2vNx3So9eqcy7zZlechpDbejbpgA4XCggob3X1ihbwIVhjlpiktr+EUk6da2Lt4d/UrKaAgt/JR53q0UOw1LwccSnS/7mhmYWb8ZebKbr/MpOVCADqqi9vyhhsUHqZmo0BQXP5UyybP1DLkUSlqkBK9H7bBT7gh0OAdE2IbmEHrZm2FKSXwjEYj5dbYvlZaGrwA+9yPmpKagBwN1KMo7jbG03hgELE9sRjg2E6QuBujLGsuGX8ryfZqREx4kufcT1N3chRFx/PeOXdOiZtvzaY8j3AlkTGiA8oU7sLX4NrcX8mOcrVDj3TyAphuNbtKqB1zJLnmSLv/y7JIpi/4uEkoyZqgrTDcFOxYy+nUG5mhzZAGozQrVjiSU5uFbhnKQlZZ4gemWC9UdPQj4TErtRY/zk5vwxKk5cgsCNfxFtouvOjWiJQyutfmOxTY0RlS1qHvAEC7HpdhUkKQK9kPkmv8Je+MeFpnzJ3oIC67v/IFEzimJHpmrks6mwUOluFgj146USaCP9Rx0nlYNcFHYeMoAHk6QZuPOWvGHudgc3WWClrvfTTQrYYcIB+3VtE8mmHrWsya7Ow84tUaU+XIk374a0MafscrEN4HSyoJXS6gN+v30EKdoY7DXypADuNaIwVjF2VMvtkMPTlLS9Q//cBwH1qMfM2TAjgVA0LMBQecqukOP7nMvN6o7m0+O7fQdUvuEaSYzMh7JgcsTV+bWuxyLaJDhWcJPw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JbUMBzL/VaN9AnF454uU8jZD4NiyF75GHP+NUZDz61woixxn8v/4Q8zztuTwz7y4L0Q82kiGtUOkZVbCWemx9XUk7BFvA6bQFU/Bv887jikRs3y2npXHuaypDguhVYzvEurViSfWmwb2mbVoWMT7HJoybGpBbM7L9uzAHwORIJaE4WPJmdAwq5hneVD2UzIbiZDnrJC95lYdcwkE6dc33HiJq+My5m/r+pY05ygS1QwntkE+vDr9QJOSpmK0Ecs4ndazgQHNlYalDHZali5dPr55SOL7h6MNn5XStqJr3G5Y0ABllcuK5U2oSojtvJplgDcOa/E2/nw6gjlzzoEfruWmI2AG6F5Z5lro3RxAaNRiBv+Yfy8KUs6ApTEP7Nie/91Rjz21rxMlAzaUnDomzn7MC+YbyIqCg6ZonS6jEKykOWRDNy81EUy9gL4s2WRa
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:53:12.8139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac5920a-47de-4415-1435-08de793cf9de
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF8556607CD
X-Proofpoint-GUID: f9SePfgx-_HHFKFOGQl-hTRe59Pm2RN_
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a703f1 cx=c_pps
 a=0+nbxk2pwnolPG6y4jTXag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=8DAfDGI87n_6_TwOdxUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX2Nu6PPd8FUI9
 ydesz6spiA92UPzZx+oq0KmDiw/y6P3FkId3G5ocivRGfqhwBu5k+bYrhWQCuf+O0DboZNF9CKQ
 QyZ60Spdvj/ZRBfu0uPoS9OnpgM9LjIcDvybV8qyzmbm1NSQB2VtdY0R1Hhp0uGoBzLPJaLuJuX
 lV5/zzhK6DxFfy239enIv+M71ncFMxyuAmH6mCuRQD07EYL1S4AMmIm/vYqzCpGaQa5IdSNmGMY
 /2tbcIEUFb1hYgeQQ7srHeEBHjCCxZmmHDIA2q0ylN6R0TI6DR/a3zUhuB3yf+jXoXl7oukwKu2
 EYSA/R68ZxPXM2ic8KBbysZmxbEGLLrwdZ9KiuwXgEvbst3oQS3LVAXBWEfwp88FTTJMk01PjC1
 unOY53O4Old5Rm/T2Qa8Xuj0yLkb7zaGJazRX4K4s2TTcf2/1f5716P9INMv+vtu+KL7EnUf6AA
 wwSL2FXGNJUCAXYyYpg==
X-Proofpoint-ORIG-GUID: f9SePfgx-_HHFKFOGQl-hTRe59Pm2RN_
X-Proofpoint-Spam-Reason: safe

Most of the time a GE Entity will control many SU Entities and thus the
generated control will use the control name, since the control is
shared. However, in rare cases the GE Entity will only control a single
SU Entity. In this case the control is only linked to a single SU widget
and will thus inherit the name from that. This leads to the naming for
the Selected Mode control to be unpredictable. Update to use the new
named control muxes to always force the use of the control name.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a342a4e56717a..733c9808891a4 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -487,7 +487,7 @@ static int entity_parse_su_device(struct device *dev,
 	if (!range)
 		return -EINVAL;
 
-	(*widget)->id = snd_soc_dapm_mux;
+	(*widget)->id = snd_soc_dapm_mux_named_ctl;
 	(*widget)->kcontrol_news = entity->group->ge.kctl;
 	(*widget)->num_kcontrols = 1;
 	(*widget)++;
-- 
2.47.3

