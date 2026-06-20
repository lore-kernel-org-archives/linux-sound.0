Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9809F31813A;
	Sat, 20 Jun 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953401; cv=fail; b=OmNHuSMQrF5//As1JmUJn8dq4jxudGP73p61DgVvXmt5Uf8cOL+6SBq9QpWZUjtI2Z0VfqS0kiDEI8Mc0VkP2Hm5uFMexvTBGzpfFU7Ey8hJIlbPKCNUVsZq/jpSjSb+JZVOXfmdtB687t/3aVMCm2scKXQA5tTHCk/gPvZkgQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953401; c=relaxed/simple;
	bh=QuzLhKWxF7VDDUoszCBPrQt/284Ow8nmd9XulbMkgUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cPgk72Kr7+njsLmtQFi4dS8uiH9PV/rSv9w0bfGbVkdO23Ei6zFETAl3JNH44gXUYIZeXAO7PjOzrBTfBCnc/cyutJzaqhIyyf5k5SYfEg59IktEaJcCSzUQFSdS5Rs3ttiQQLz1Ms3hnOp1AAGdo0SKExj2l9jr44lwLCrGjjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b0/imny3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=s9YtbmwA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b0/imny3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="s9YtbmwA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KAlcNl1300718;
	Sat, 20 Jun 2026 06:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=OwhF2KtZ4/x4qAzl
	2+nGjsw6tblfHxbihJyrd5hBJTs=; b=b0/imny3znR54ozWOlV1MTXaGW0jLyfj
	ELnzvdH14AMMJSns5B1RJ2X0UsjYdLq9oieXmbeUSt16p974Aog+mhSWN7tzYOce
	Xsx9C4ID1J0HRP5GynE6KciO/OlFOYiowXapUOCkTaH/ynAdNtw6Kvqofdb0Fh+G
	rd/kDxAB+T1Vghc0AYVTKYTmAsFx1r/tc3OY2r8YN9QtQKG5tEpeS2uSovr5QuYe
	Y+zgaLfIfezj868w35rkV5CkCowCWfFY7pYQh9OBEvNLOZgwrLdSD4h/MZGom/Mz
	B5ZhL9nXoZKCieMWP0uYwM/1+s5fWBPpJb5YfibMbGGkbeDmsuDE8g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020092.outbound.protection.outlook.com [40.93.198.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x01tn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 06:02:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRPvAUhRQoRQWD1KlJpKQDD+uwa7XTG7wsGBm4ZyceG8NaqL1JZhwJ7aIvDfrspmStH2nWn45BRsd8OhEgrW4KutEUyMr9lCzf2EzFz3n+HhNxOX2w3aWJX+lSspcX4gL5/UbPnTF8W1hgs1Etkhi8vXuXrtNNOflaHVwxMf3Exl8kDt+0Dp3pUPjeOcZXh40J4AawmqgcCPongtE0wJYeO+y+JSx7HrlSIcXH4E2wo+VilMi6lxRfXidivPn2azhZS7nL7EAWMfdGNjLbayURrIKHNaKBeGjd3r+dPo18oH1huG6MYTGWOCMHY7M9oUTzW4WepA7yXYAKMzYzVF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwhF2KtZ4/x4qAzl2+nGjsw6tblfHxbihJyrd5hBJTs=;
 b=S7NPl6ONvTj47yg4iyZKZEw3MoaJ7v95oqMeEjkxcHGKZbpQxOJd6FjE8XxCYNHkEUnL+g8qSi/Jr6wGQI+X1w+DNvxDlNxmgOpjJPmSaBclerQx4J9pmUFO/rc0euQFM91f+kb5iWpP5ML61UWXbhP/MuowCVfDYw6t0m/BEwcf5iezSz9lL/hUTAPqM0QdchUFz86wLlCc2lLp6IQ9seaTN00AdLxpAKUvGjb/5W51dVYIajEtaIYNYfsA6Qo2zHx927s0MiiP96CoHJSt60amCIOSXg3fKzmFj7caG4L1XWZCyL2FMi/ONqVvnGsEFKkMBaHytPtb1HX4kK1kFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwhF2KtZ4/x4qAzl2+nGjsw6tblfHxbihJyrd5hBJTs=;
 b=s9YtbmwAOOAW2LmkAsXCzlQwllMnbl+olz5R5gCy0HiiH285HbduF9j0zgx4nCQwwtKW3V4A5IQkCvP+zrGm/+S9Zi2cIgLx7XsV7ODUcUUsHoVQYliCl1ANvVP+l/+tM5mocmHMSfY0a6UbC85IsKvsy0cYil5am9vtE6hMmBY=
Received: from BLAP220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::23)
 by PH7PR19MB8265.namprd19.prod.outlook.com (2603:10b6:510:2e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Sat, 20 Jun
 2026 11:02:42 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:32c:cafe::19) by BLAP220CA0018.outlook.office365.com
 (2603:10b6:208:32c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Sat,
 20 Jun 2026 11:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Sat, 20 Jun 2026 11:02:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 50942406544;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3527582025A;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, arnd@arndb.de
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, zhangyi@everest-semi.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/5] Fix SoundWire randconfig issues
Date: Sat, 20 Jun 2026 12:02:32 +0100
Message-ID: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|PH7PR19MB8265:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e2291b9-fbe2-4251-1ef1-08decebb736c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|82310400026|36860700016|7416014|13003099007|11063799006|56012099006|16102099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	P1l6WPAKbegipTMTlzp41AJsZMuVz/Puj0H47NeyaD5W2qTaanFoim4nDVzeimTBbLvRBdImJgLSdKuy1VA+wLkdSG4THkl748HAFbYE2U1TyS7NKb+8UWE7PxMzkIF4AdvVYyl3bijGrA5HbjTPZgddIeqPQGi+6yVJ+/tjO69Cc1HVXBh+MJGPMZG/YAMTiBopMZb7I3Cb837Hx8AMPxXIcYYk8P93Q5/ufSZz817vFm7Obji0gMeZbNuy5g59AQgMBDZQ+hovK/3qMsKidILTNOCxx7vjYk/tcnb5YIhTu0MZM8uQ21udbUT0hSz8SPlwggftoxEfu7CUkRJenqAEYOFqVNj/ismEJcmuAJXNXPr9AWInjtxnP0Ek/FhKZ4ezCkSIaHrvKT0bHvUmgE3T91egzlONQz5iUM8WtnZTYzKjgnb+EwVEduG3Gtv9WRaTQqQD8FjjQekY3C2E4hwDUTpyMNtnwkNFVKeae3MB1GPCOs644sOdV8KC4VgYlsTpjjfcVct8G0u/1HTGlJwryEpkaCv8o/dr0ORAYhBlZsIv/gfpRcIeQtyrk+62GrHO1Jvx2l5zM0EhuhVmyTmnVXyffRABg3eGEm7XRgXXkRjdMgRhahUpxpa6lJuOUDoAN8Pv9YO0hLjt6ggpqPRgaxbhwevSk2T7NZdN/8oPkGBbzU6a2enIB2yWXMZYYx/rgy5p8g4WEXI4yekTqQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(82310400026)(36860700016)(7416014)(13003099007)(11063799006)(56012099006)(16102099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CGJIfXrhZpEv/pFGlXHSW+bfIKXP1F32DSgtj5xydGc6FWSTCdwHXHDxeAn5aLWBp7HG2KIuUK6kd/jbrLoVxMt4AH4iMnvVx/H8HHmDPq5eeDkenlII+xJ6Gb3efZ51dZr8pDNLzTAjInII7QZSqdLLPr/TIeijsYssm5WhD078yOwPWhW7TNvm91urDkAws2p7LRMCnAPXQwHIY8SDlMt2JtXZ7eUR1kGlvme+M/uPPGC0yFXc+UTfK521c6TS3GoaD3lQ7Bl9Oqj4Gs8ockSEjtp5DhzI3FVpvwdK+BGBtWnFbMRXqliWK0mfxQmu64yoy2VGfdGhbyYRi3hIyoCkGbcyfPAEw4hflsufDp5KFGbr5qHfuSTlAKPKHG38TbwyNxR7A3pYUkLNVRjA0iNLja5kcG/MYTA9lBTp2Qex1YhtnD+1FU/8aIQ7S+l8
X-Exchange-RoutingPolicyChecked:
	Bo6vXD4XOVv9KbGHTooLAXHUQu9uJNE8sdGPf/DEpninIjspbaEvk4U18tNNLGsY29GzbWmWKUdfz29QtbrCLurLxRay+QWuh44KZLQ3HxdMlyWZe1DmtZps8AZqx5zbZdZwCoa61U3iOUjb00U3hdJbNcVe6o2M18kzQpz+qUigSaAjuPvduqcj9Xu9pBcGzQA5YKNo7iqo/EdNvzg3DAtOKC94A0U1YC7oMZTrzmysbJLRyxcOvvc7Oqoz0/DY+yKZx1lgIb5SLRUn0xyWEvOtnzhQVwtIzb39OA/2ywTBCsm/ZL3kW+j0pcPl4iFhRbi8L3igLXo6+BLzZ4a8ww==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 11:02:42.1799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2291b9-fbe2-4251-1ef1-08decebb736c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8265
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a367357 cx=c_pps
 a=o952g1rkoyfyBKhMC2IAFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=mpVQnycTosqK4AZtcJwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfXxjmCKcGNLLNQ
 r+U/01KvcEO8O/P7WSzQZizfzfiuHfqQ5XiQmlQRxYXduZisdgBPYnuoiyfG2wyr+HBI4nZyKXK
 0Q7C+islGZh/UlBVsekJqaiBPiM0EgkeOZE5PdRhdmYXRVGGNx12cso1oKYUOv1/a8oWxveJBjP
 WBBRdfvdXExg+btagR1W8umdZo3koNogI767TusrEJuXn0XRjMqlAiYj4TNUgEfoSeLzTRVQsK5
 NSu8vlV+/PMvrl/+PfIPqPXMap5aocubmnGNYRhWoMjumlbdC2Bh3mnzp7OsLtxEwl8UX9N9QPE
 H2WCF118haRFAvOVec7b8l6nWf7mYPYz75Jk07D/pF9lU7WnHTC6Eg83w1WC02cr6SK5oxndHTD
 jtNKedvCeQoYm8wt2YlJRI51GIS5GRYlG7I+23wacgjMpZXvXb3ElVUr4ujv+z729ql1m20vQ6u
 /2FI3l6wN75KQUvRI/w==
X-Proofpoint-ORIG-GUID: 2wjfTfVXwW9CD9-7i-G5pNhT81aymmQL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfXyAH0hSFq9jp3
 P0jmZAEXz2Soc3dFUjOo/KMCjfctTCDxn+TUObwNH1kzwguMZyjwiUMM1ZIhd0F+LFHhxazY9lj
 odyIp6V2OrX502k4xBMyvwGD3JeDBwk=
X-Proofpoint-GUID: 2wjfTfVXwW9CD9-7i-G5pNhT81aymmQL
X-Proofpoint-Spam-Reason: safe

Moving all the waiting for soundwire devices to enumerate into the core
code [1] has caused some randconfig issues. This is the second attempt
to fix this after there were some short coming in [2].

Sorry for sending during the merge window, but people are keen to see
a solution posted.

Thanks,
Charles

[1] https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/
[2] https://lore.kernel.org/lkml/20260615150523.4006982-1-ckeepax@opensource.cirrus.com/

Charles Keepax (5):
  soundwire: Move wait for initialisation helper to header
  ASoC: es9356: Add back local call to sdw_show_ping_status()
  ASoC: max98373: Add back local call to sdw_show_ping_status()
  ASoC: ti: Add back local call to sdw_show_ping_status()
  ASoC: realtek: Add back local call to sdw_show_ping_status()

 drivers/soundwire/bus.c            | 28 ----------------------
 include/linux/soundwire/sdw.h      | 37 +++++++++++++++++++++++-------
 sound/soc/codecs/es9356.c          |  4 +++-
 sound/soc/codecs/max98373-sdw.c    |  4 +++-
 sound/soc/codecs/rt1017-sdca-sdw.c |  4 +++-
 sound/soc/codecs/rt1308-sdw.c      |  4 +++-
 sound/soc/codecs/rt1316-sdw.c      |  4 +++-
 sound/soc/codecs/rt5682-sdw.c      |  4 +++-
 sound/soc/codecs/rt700-sdw.c       |  4 +++-
 sound/soc/codecs/rt711-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt712-sdca-dmic.c |  4 +++-
 sound/soc/codecs/rt712-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt715-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt715-sdw.c       |  4 +++-
 sound/soc/codecs/rt721-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/rt722-sdca-sdw.c  |  4 +++-
 sound/soc/codecs/tac5xx2-sdw.c     |  4 +++-
 sound/soc/codecs/tas2783-sdw.c     |  4 +++-
 18 files changed, 77 insertions(+), 52 deletions(-)

-- 
2.47.3

