Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1B42FCBE;
	Thu, 16 Jul 2026 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212025; cv=fail; b=Fd+BYbWfXabRfyIjAbaXdETCnESZmcNAwwvgA2A0Y1IHKLeL5bTqnFPwjw5b76kuEq6i18CmRUYd7dWfhtmAxUEQw22BXIORwVG8aO0HH70zVTYaJzFun6HSZmWdROl3vWCs08VAAsP7LtozJhVc6fefNu4fcYYuuFAiLOfiGAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212025; c=relaxed/simple;
	bh=+KfpPV7DTxKUBm3I224F4pepyQV2djz8rMWwD0ciOkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eNTBcR/m1jtLLmbj4SDKK27j4i7oRBYhiPzrtCs9KlvNbWHF/EPRAkcQhlXDfl3yZP0VdF+pniKycjKXdeKYkex/nQEMiKP331N+SsFGdqZpp1slK+ANkeV5zxEImDp/grN7nOJyHhs710PsQ4JJKX27UkBo8A+EJFYk5+yqXak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WKqYscKb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UfxTUe/G; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WKqYscKb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UfxTUe/G"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G4qUi3138268;
	Thu, 16 Jul 2026 09:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=xoI2ybSU+ILHGLbe
	YWulyKGEBoGAC6nCwkFyP3xesYw=; b=WKqYscKbxSvcgFcGX9WAHtrhs2j2Li1z
	FmuYfHR8Wkpi2ZhvloP+8/pW8isQCwbwJ+qhkWnsjn42ZlxAsHTdOQl3QwNORxBU
	mFdGfQ3v48K219lgbzwygFi+2dpL3YuTdskF1wSvSE4dBrEVZ7Y33MZuNbsAFRDM
	0Hqq87N9VvFL0+y/+esoYGbm8H9STbq6F2f9y5Xzl5s42sv+f8nCaPRG+46RtKfp
	Mm3hXUSjUOti5ucf7afn5CZ70xwr3nwsSH4wahfcyUFX/dKKy05fMlr67lEyWPAE
	x3NI6cunGe3kDHYUTVLPPOhz1qrSnlu9okvq5FZOqifFof5vazL5nQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021077.outbound.protection.outlook.com [52.101.62.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fq9ru-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:26:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdCoHMUbvOPs75cGxolLymGq7dr40bL8wJZAiDwKl5HkPmfyfLwVISwDy/lnoA+C8zfZzFX4cqt0CcpTf+MOGx1B4V37MfcjjQzbLPHQW45A9FF/cXss9uU/whg5wtNvZ6kR7PJtG1ZsK02nR/3UDBcVbHiP0DuM5K0MGCBZdt6taGaHfeZh0S2iMMG9k1hPcPQSocUMAVse/+OCX9MdwAOioHJJ44WSdS38mY815EUZT4xzj7h+JH+vsi52eYgPfqZiN4FmXl0IZEtxCrOfsaDT5Z0hhJ0yrFPX4WDrVZ+8lsbMNe9B8fGrOX9sgSGUtgDIft+yPzWzk/QQX7glKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoI2ybSU+ILHGLbeYWulyKGEBoGAC6nCwkFyP3xesYw=;
 b=DUh2luIBK0Nz0+Fz1Jpx9y/DcjaoMQUswOwjnJ0pgZTfQnyTKbmyaSAS33oH89E++w3hyaCcbQkwRKdbRXNnVdwlyl3iuiE6tZI2DtKnyftZYjzusBPmHVeHxHcGqcAWaU8+iOHQZr3QywOQ2sQIqmHdCd8U1LHSdNYCvcpYioYL3XCzTStaSwIsiWtax8NechXREUtdNB/ms1VHoc/v2CA6Bu/tu0+yTvLkgADjvOrWeEelvfhl8Z3pcqDNKRUIpBb39Qx225YdwFHdpMUHv2emY/cWLSSdXF29bZBx6RvLaDTWktpTJGHa0vq9MeoHhV4tmNZFZ5qPV64QAoYzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoI2ybSU+ILHGLbeYWulyKGEBoGAC6nCwkFyP3xesYw=;
 b=UfxTUe/G+fxtRTDWWgevm76BZIk/KUNEiW1jgs5ZAHLiFNFj3ZI3tOICyexJxIbs4VyEQJTN0AgX3paRZ3/lD93h50l8FebF55HuRyPbhlOcou/hqqgZ/6M7WQw6iYgR+N7wXo1/HXMP8Aw9eSJOnV4qbn7FyulJ/I6/YPm+s20=
Received: from CH0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::7)
 by BL1PPFAD49D6705.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 14:26:45 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::1c) by CH0P221CA0003.outlook.office365.com
 (2603:10b6:610:11c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 14:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 14:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F3FFD406541;
	Thu, 16 Jul 2026 14:26:42 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA02D820244;
	Thu, 16 Jul 2026 14:26:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 0/4] Fix races on creation of SDCA jack detection
Date: Thu, 16 Jul 2026 15:26:35 +0100
Message-ID: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|BL1PPFAD49D6705:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fc55ea1a-053a-495b-5021-08dee3464328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|23010399003|82310400026|11063799006|6133799003|56012099006|16102099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YairFs+LxTmQtdjpWrZVVZyNEa4uOcVrGN/ngOQstsDu80oVdudl76jKh0R1sSG5vV/p/fLW2cfDLiOUAhEGc00nMahbgrBiYBVtsff0DX5lsBEpgNWG7PVhnlRBEG2BtEPTklMV4AvXnSpU/AipFYOMn2VwCsKNMhx/BJgx6KGlppOr2VOTIWQ3GXY+nJN8x4yr5Cy5/sO1uihDdJEII6Ongp/PZweYiKgo1/SEz5w805kvigjv2ptHtq3gWl1DufGzv+6vfRodY8bUxyh98npJcrOqFQB5Tl5uoYyq5ryoCerXwoeKyne882c++OD0Az2pWS2npEc2AQgYBV3luccs2UdxnQu6EdkzZrVevJHXAQvO2nQPttrbXf9DEuybDrlO4eCSTwpfhRZ8VSOlyoS3zj1v7BymPZHaMyidS5p0Gj9u0RFXoZmSCVzQ+N7ovYIvDwZc2bZ8ZIj3AyyYa+tN/hy+V4vIlRqpaLw5SuiC51ky9sa1oXuFTXYTuf96s8ZB08eqoV5QM65nMnpD5onTla0vsbuGly3u5MR+uDEDYOn8TytLW/ZBDdsW1MaURkyJ0iC+/GSSZ7nTkRpFwQRUzp7fPLyp9ghyPgRLZAYv3GvNyUGvq8NctN2pyd44V6wlOH1Fe6QovRcdDLy+WdP/Io48zneeldZyBajYwnub1GiIT37XoIO8UclOGJya
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(23010399003)(82310400026)(11063799006)(6133799003)(56012099006)(16102099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CdQ/waY//OIxoUAFx3baccwRigwZNwsvp/wyTqAyRpJANp6yEKamjqF9C0oCwAm6OGoM6Uc70qqS2Hby6BCRmTIE6WO27G9zWjn/PiM+IJ3uTvrPkKiMew4x5y6Z5tFM+itnCi9zDZcaVZRtQc6+5QKKyOHnoiFjJffgjngRY4ckhHyvzH1dHeN5GGQdE05n7GqCKSruTfCMKDMiG94JeZXsVMHXlFzQ1IkNmR0gTNa0UOTQBujMvFZcSY0g5AHxA7C1EGaMg60k3vUDiGim3UJdBnGvPPwgLwn4Ov4Su4C/c9QwnR1OVtWloDZ+yvD5IwVwdv54YpLfrS6V/N7iiSbk3+H+cVJLV2NEMvqxV0t8mUmfO902INu4SDmstMyHrgB40vNdtUkRC/tTdwHAt3vGY++7kCVM81/oIKSsRoJ0maZeLuEnc08cEtRHnFLX
X-Exchange-RoutingPolicyChecked:
	mMgKOzl7QpfBs6fWN13Ud7Ron3sMOcJKo8vSWwjq3gprdjBw8IswKJuhfERcYLzAiY4SRCkL+pFpauX/O05OhMuHdLSSRDrU2k/2ysJbZWlg6SKKkvcdBYSZngIqTg8eTfDguxg5Rw1SRvnRa6Klp2eMLg/FrXBTKekFq+/j/H0D0sfGmvoYBYwLV768H6p1NeBtM56quz8JBoF6fBUlZl5goRqKC2ziwN8jxvm57IefDoMZiuy121RJUpKUni2MhzPCeh6E77XN6MejScbqiSZhCyKqVgnmADd4devEW2X5mnrBZaWoFIBhsZ3MpOEyjKMthpCf1baL/y0CKuoozA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:26:44.4762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc55ea1a-053a-495b-5021-08dee3464328
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFAD49D6705
X-Proofpoint-GUID: lvkvzLzJmM6hhJ4J_i7VYNcZkeI8wRGj
X-Proofpoint-ORIG-GUID: lvkvzLzJmM6hhJ4J_i7VYNcZkeI8wRGj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX6uTODfqvGHc2
 ewiCulVg68HrN54gPz3Kb4U1buCx4PX3UI9xO/7zNQuOcQv4gpzBg32Qyl+ETHPjzjJft07jfld
 fZ6dPZWI9JoVtvXroDH5LOsaScR0wPk=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a58ea2a cx=c_pps
 a=Qy130IFfx9qnCPISBCfGtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=jF3q6RoNfTq0I4k_mE4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX9QlH0ypLagQa
 /CjjuHoghS0HcLNbCL0RiJumR4bx2i2wpyksl3xsZPSM1nhnu52MTvm24UWu9qLhTRLnPn0CVrk
 ceYyoXOM5xC5EafO1+6VXjDjOK04gV1z07FX1Cqh1NqAJxvJTMgT7lKTuj/VyazglLCLA0uj6PN
 kGo0BIl5cXDtpPuJUMeE+Jd5LfcoQuseL6GX7YBt29/evbjZEB6aimYg+lNNKGaV39A/IEhLNSy
 +Nx8oNvAeDDJbbRCIlXVAUb5sTOBe3RWtPpTuBY9Pc/upK/WJ9l1DR8akBXpIcoX//mP8VR3+a4
 562gMvD8V2xZNQrOZSjaku+TveWIrySNnVxyFkET2aSY/7shpckN/UnuHclUsLEmwQ9MHDdzjCP
 wEOppcLEMp5XWQ642Av0wQrbn80gHSTVYgvmtsB4XPi9MYUWirC6frj/lejcnxB5RjD96Cov0bM
 9LB/GJ6JkVkRdZqRh3w==
X-Proofpoint-Spam-Reason: safe

Currently there exists a couple races that can result in the DAPM graph
coming up in a state that doesn't match the hardware with respect to
SDCA jack detection. This series fixes these up by adding a component
level fixup_controls helper into the asoc core and shuffling around the
IRQ requests from the SDCA side.

Thanks,
Charles

Changes since v1:
 - Clean up freeing of the interrupt name, Sashiko astutely pointed out
   there was a memory leak there.
Changes since v2:
 - Add back bus remove in the class driver, and split the IRQ free into
   two functions.

Charles Keepax (4):
  ASoC: Add a component fixup_controls callback
  ASoC: SDCA: Populate IRQ data earlier
  ASoC: SDCA: Add sdca_irq_cleanup_late()
  ASoC: SDCA: Switch to fixup_controls callback for IRQ registration

 include/sound/sdca_interrupts.h      |   5 +
 include/sound/soc-component.h        |   2 +
 sound/soc/sdca/sdca_class_function.c |   6 +-
 sound/soc/sdca/sdca_interrupts.c     | 157 ++++++++++++++-------------
 sound/soc/sdca/sdca_jack.c           |  44 ++++----
 sound/soc/soc-component.c            |  10 ++
 sound/soc/soc-core.c                 |   5 +
 7 files changed, 128 insertions(+), 101 deletions(-)

-- 
2.47.3

