Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D1B48BD2F
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553221; cv=fail; b=gbMZ0KIEE9GzBGbHjHRL9IEwUYHHfxMjU1J8gjjkMTP0tJxr1kMrqgklcuDEJEifbRgNeHtytRKCqrqcxiXP47esP7SDw19ZGPTvbKq3GvFPmrsWf1Zc19xohRHYrKiYPN8VlKPfpVVbQdXM5i/VXSGAMXP7TNJ+pXiFhAjL428=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553221; c=relaxed/simple;
	bh=D2M6F0pzHzjn+2VMszdVift8L10d+B4bgeLkP1orvLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eFuBshtf8RbkrIWwnamj2OotRXCAxaMSSKugEhLRYzUKDBQaQcf0Th4kRH/b34/keHX7x/d46y1BeweHVMI5BnrDEumm/roXkm5o5L0ZiYsvhHdpauegu5efH24G8zWA/IcHE/DhkIg0JKFVXQlK5Qa0lzzZdwGzasS8J87LAC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=njBBBne7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iE6IU0Gn; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="njBBBne7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iE6IU0Gn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234uj7o3182821;
	Tue, 3 Mar 2026 09:53:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=PS2Pc4vlg6icr2yS
	AxxGTzm38bh1SyJ43NOj6GmeQfk=; b=njBBBne72Hq1fOldivTqBZLkLVQKiXxI
	KZ1TR730HXptxljdVlH+wnXhcCsYi/IBc6MegfNhe+TZkh5zJGYgbxYmc3X3/F+1
	ACeg5VkRrU7eq6X56/FHiHpxEi2ZsGBXz8yIVr4kN+IZaC0QllN7JJPFsYVdCiQJ
	IBiuQQAYG5ISLkV4FmSMmnxv2e8O4tFVtU4X62MobQWf2XAnJn1/ZnDIul9aDasz
	+YUY2jBoQWUE+0Xsj3+zWfUtJW+LzIhVrvbsdUrp3OW01KZyfANDxQ8bCoBKNJ5h
	FW/+4iLZ3uMsBbsID1YXoJsff6LzuS/BL0BYIQopq6XQGGO5TgCuJw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022109.outbound.protection.outlook.com [52.101.48.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn03gm9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 09:53:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8jgyf8/r7FqEF6CN/48vKd/WCiani1CsP30XaqG8bvTlLQW5HPjSlQSgai2UNtVz8jZo1Bx7OL6cUZcT6mYtHWV/WLFiNJ+UgwdU788uQs/NFxHcuHEd4WX/h1oIr2H+xFhaLNiOYz3flJBh4FanEeHhBYHr0MV/b8oPmNx8PdNh8TzbR8kqodHLlMb9zPaKbeazRY7MzdKrVzc0Bnez5djsxNyOb623oy5q3HZXVxUuUMXnjwpNCzaiceWOtDQgpQtsr35NNKSPjAXJa5lJBS1jj+NPzHFX7HjrhmN3pjzZir+BPYxqVdBukNEo6OEocOFeZsD6MLnzWwyatPJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS2Pc4vlg6icr2ySAxxGTzm38bh1SyJ43NOj6GmeQfk=;
 b=CIgW2UPl6iImGNE2Z9z/qN0gFCoC09C6uXGIzckLHwAD2pjcm5BaYcvogXPgue0gsRnBC5D2QztOIl+C8mEZKdhVY9p1vaVH6ij7BK31qatinAh8zfp9ip19RdaKdqbQzhWTUXg3vnzMRSj0HD/AR0/NB/5gDkQGWFf5Ikfynv/FXVbV7ftYBnfxhb7kOgLfZdA7sD5UMMI6QuXt3sDOUrPC4jA1ebupibWG40Zzr3C6rGPWvc/qo4emrov1z3l8nkFqA8q14Dkf5dARyN4q+Ty9QSonpazU1uoSzqWM3TkFIZrdtfQFliFKmD+x5K+PNC81c4HTw+JgAwHhMbsHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS2Pc4vlg6icr2ySAxxGTzm38bh1SyJ43NOj6GmeQfk=;
 b=iE6IU0Gn2Uq+7T2MXN6PNQEWOHg/d5oEjSY84gOrE3LYoVOPD42Q6t2ywZbvzz+w7a8drYirqN+hU6P1ZDfhKDGpcVzvGUXKqWAjm1kWu/aRX3HCVRd09sOOfCNwP2fUNVUXVNl/XsxKtzfyJm5SmKxhG2umO4xWXgdFA7ysME8=
Received: from SN1PR12CA0068.namprd12.prod.outlook.com (2603:10b6:802:20::39)
 by LV0PR19MB9541.namprd19.prod.outlook.com (2603:10b6:408:321::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 15:53:14 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::30) by SN1PR12CA0068.outlook.office365.com
 (2603:10b6:802:20::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 15:53:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DB820406540;
	Tue,  3 Mar 2026 15:53:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C3CD282024B;
	Tue,  3 Mar 2026 15:53:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] Handle edge case on SDCA jack control naming
Date: Tue,  3 Mar 2026 15:53:06 +0000
Message-ID: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|LV0PR19MB9541:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8aca942-cc7f-4077-c0f9-08de793cfa10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	F7nEgiDQ94InV/Pu456cgwF8h8cqC1Kr8kcaFGB8a69BSR6r45vjXcYlSTpYy6IlUhL0QgQSDVa0aoA9UKWGSuqUTDQnfe4WrWAx7HAPilMIcm5obhxrwvpxBtbr0j2+OHu/f3m1nDe+5cMa5tzuRT9gRFxjLkN/Ns+v3nLfWOI+Xc321sppSwcqQvWUGmSuUkHXZsVYQDs4V43ZVIeBEGDrjkdo3HvFQRensD4q7gx1PV2M6iujayvsCzZbCqRQN93G1perLOYgJ6C5Y5jb+Qd8cqPeF6BAIXQoI2fl4F/iLvBUK/IlqEyXFV2Xu6jezWxgP/AbVtwDtMnDWlrNJ1zv/2L+VoowPO+CdxI2dmGZRsVVUXkSdWB2y/ISC4/hrfgRMGi+xDWLN+hJqrL/ZUB71Ex+QzaNovvJlTzCpZz3PNpyMZ9OkggFeBDa2dLNVzJvyUzKa5IvvZ0Tg8fXXUCUhT5FB96DVEuwtzbL1Q1nfV5evXKuOtMOxZzagjRsSnB78abvIftps4bMsbF9Yz9hs/PNkn12AQNpDH47OQPWriyND6epgE4+N8jd+PhD2ZHSNKUigjIzFy7tfa5sizYg2W1jeOv7cvTAf8hMb0snBdDfjAAWK4DXeo13q7TiOJU7wQx9ZDF8EpKknEzgq2biFEaaFtzmYYsiqQEPSIBlkmUm9XikyVk0Mm606mTON9Cg3SWTPn5MrFETDvUY7XfVgJEL384ijLpBVyeT+3HjfjBl9KkjK28foQgHzpcs1Ixs4PKU0Ui9UZGOp5L8XDBRTHNh8bGZJslCZpMEmZhwsnjzXH8zI1fZrc5f69vSyGIAjFQRJqT+WAEjhxYCSA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4v4d1X9HRwnpssVrRNMkGQCqaK2flTcPM61eEPi0hjsizAqK4t0T4nNeVcQh0D1ehMJBCrjy7ktOM1Irf/dLocB2VKhgyjfow1JJYiikhNa69cE3nJS2sWsq0SnggYjDdCBoYDkfpTQaDr/xS4LpXGCafJeOTr9dG9I539PAlHszMQYGAJsiB7j+lL7EqB+Z4GnOo+WpJu2LYLkEQ892cJjvDCd+ocRVZMBEL/YFT+WcT8MY8tMnzV7aHYotmhIq7m93m0Q/R3VLEzfyLrpL9eOd1rFbwf3kJ73lPmFpfNP/o0mZZ4L2YnyaXqQTyQQ7qwvt1VmaphN+D3frRlyHxe52HUh8eADYcV83kAMGxD7CTL6HGnvXmWE6pspkDVZfQWYPJjDeq6igeotbsqzvZ1Ck96GSpPbP8dHNVhas+/eKwpW731Y5CYJBgx8fByie
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:53:13.0753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8aca942-cc7f-4077-c0f9-08de793cfa10
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9541
X-Proofpoint-GUID: TYgc0q-V96NKaI2ZapNMmmIytwB1YzlC
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a703f0 cx=c_pps
 a=d6SuDfCU3ZZz3a5uGz2bWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=FtBDZUKEKF0Uvn1v8iYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX1bRaDnfznOPl
 FfsIXDJAMmjtW5hchOyW1qQMbj6OQ+46bI4ahWwScxHRSvuS7L2+qmFKAKQVZrVgqtnt5nnUAXL
 WOYgIqzUhh3VypwbEJxbS+uLY/ka2FVDrEjI1+5BgFDKLla0zSRVBhLE371vFZUwLtbBBtrOTbQ
 Zxjfkdo+m0NZZUvtOD+EMNxnNN5oFcI9CSJBXM/S+3HfxukK6zaNmj5GpsSEHJU/E3umJS0z3Cf
 K7c7GJtEq7/YeB7PYB4chYac52ZWUUtCr2KhnaffcoXUURtXWmCvN4sTFN5euvM195cLMqclmH7
 W+2aDx0dJMoUdBPz/D5LVFmwlum8sHpjEY8z3T+y003ullllWreDVJF2m/PV+vVfc294UXIDSAJ
 W5y26HbWOCZPJFVzoobWrEMf4rEVwWUfZEaneU3nyO6e4/8z1WXk/9k9aEnmnppDIwRx24tDgDz
 ca3xapmlc4wB/MlHdcg==
X-Proofpoint-ORIG-GUID: TYgc0q-V96NKaI2ZapNMmmIytwB1YzlC
X-Proofpoint-Spam-Reason: safe

Normally the SDCA jack detection controls will be named after the GE
widget that represents the grouping of everything in the topology
controlled by the jack selection. However, in the case that the jack
selection only controls a single widget the control will be named after
the SU widget that implements that. It is rather confusing to have the
jack detection controls change naming scheme between devices. Add a new
widget type, similar to mixer widgets, to force use of the control name
rather than falling back to the widget names.

Thanks,
Charles

Charles Keepax (2):
  ASoC: dapm: Add a named controls variant of a mux widget
  ASoC: SDCA: Use named control mux for GE/SU controls

 include/sound/soc-dapm.h   |  1 +
 sound/soc/sdca/sdca_asoc.c |  2 +-
 sound/soc/soc-dapm.c       | 11 +++++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.47.3

