Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956E3E172E;
	Tue, 21 Jul 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644629; cv=fail; b=KbomycTLF7tPlLHw1hGwK1zVGf//nz3x9STpI02JuezAnM6nDccuRjfs710om2TzCrvUUeH/oBUVdlsfMGu0WDIMFnQvVSjhs6wsrtSbeBdd7DNyQ1cOX1kGVSsZGhnI7TsiDrztBDUwqRwBLcu6inICoiCqHM26FhL+4ekkppY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644629; c=relaxed/simple;
	bh=QB1leRXuZ+JM6AVJ53T6JeW9AF2RGuGW+fIrcnvFvDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MYMTauY8m2rcmogzuaJ3+963TpaSB7Ofu5q2lkHNnTkHnnWn2EdMjUonr6RZQQzOCHjAgPbm1bWRdm2xt0xlP3cTfNwWzyXdQVHzzScL1yjPy8VeWW8CFi/3U2OArijkGou2/0Pgwo1Q/OiJPq/DVpCETjpPD6OrK9WUO+mGFO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fTuStp/X; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OzTE2OdO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fTuStp/X";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OzTE2OdO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4kmsk1776439;
	Tue, 21 Jul 2026 09:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=1XAL7ZIo0LJKUI/w
	pJ+nLTRjmpf3AkKIF3ARtb3z3Cc=; b=fTuStp/XPfoEtUcfL+8MlG28nYM5MKI3
	SIXwFHB2/jmU9ylm9OTZqZoP0h4TOhLGWupZvFiFMALN7te02VvKNOkS/ZUBsRju
	+VvugTyBti3Z5/x9/UOmEPkpUId9BqS6GL//NQ8R/8zNUETrshsFbFS3XERPyDzh
	chus9JKBNUKK/6/N0yRYkO6IOn9ZjUAbewt1Sl4RCDWv9jDR8bptwBFcIps1pGon
	Q1wDuYdXI5Tqnn1GBGnC1qMvky4JgOP72ruDPBrQeNCOV/VdXy6X+NNV+ErvRD4M
	tOQR4r3KOci/O3NAH3C1NQxo0y9zynG6ZP5XJ2r44EYyhDQyhcb6MQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020125.outbound.protection.outlook.com [52.101.201.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vym7mx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:36:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxAcMW+JjuHTsdt1pELaNudyy784vV996If9Ad1dW3d0GbpUKynbdHtop+snOa27lCDZc+EAd4yiRPq+roKw5hJfvp2Ki7qDJc2fuFn0/qAiUyYMVNXlKOIXJ8PRSsKq/guHrB2MT5+Iswfx2kVJ1YX/+3XBHE1vo333lfRhlG3Fnna+uVxxeWlVBgXeK5Zc1UGpGG/opdNAImUToth3kel1kL0UCgGv5xNPbT7DNBW6citB3VbcHfjUaRTk8k1wAh+U/GRgeu49McamtEdu9xeGxtSMouYhgacWIHoE25YTlRcwykiIx8fSoQfi+fAlR0ME8ruziaTJQuTOn7shhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XAL7ZIo0LJKUI/wpJ+nLTRjmpf3AkKIF3ARtb3z3Cc=;
 b=HqDV4p1Sf1FnMPHun/uoVKOpCNvH7u16x9/Pjfzz/2ZfVv5vVutHhdofaT4sCZaKOLViGyTjfWOCdvVql1VbeQndisOcmg897uW2tLUXUdpL+ogrEBo2xx7RuoGTBr1Ogmm9TyExYQqqXgO+43VOLAvvp5sca4h1pO8HPanxSWznRfk61yv0Kx8tO27hJNOBW444s+0dEV6GEId7atKkYYFvqLLviahnabxeNCA6zIVKKY1D9QQwtw9I2LNYDLWclV1OSPnT8u5gmBNSXam6sx8vjDI/mCkQKdqRt1Mw7Z9NISt0FnhBdgurETXKw4PLmditEG/ossQgKVhjBeV3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XAL7ZIo0LJKUI/wpJ+nLTRjmpf3AkKIF3ARtb3z3Cc=;
 b=OzTE2OdOMYNLHFOWZGxqnl2uAYKQiUk/hPBMUSN8ziKwbuqv2C6PHrH5wARBXz7lKl9Gqpgwllaj8fNmyQpMbQmm6nGwUliNaD8Mlj6XF2/vpkTXCpwEmzOmd6GlWf0qnFx5KP7BI6y/HXUMsCE/BgGqN8XPu4LYtvZcQ/f3KRw=
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by PH0PR19MB5227.namprd19.prod.outlook.com (2603:10b6:510:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:36:42 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::1c) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D46AD406541;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AB7D5820244;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 0/7] Fix races on creation of SDCA jack detection
Date: Tue, 21 Jul 2026 15:36:29 +0100
Message-ID: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|PH0PR19MB5227:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e33ffa34-180a-4363-c7a7-08dee7357b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|16102099003|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ifLEAT0GbQ1ZjSj82c5fQkpkGcwPu2Eii4+FfSzoKXqOLxioIv296cPQIQ0Xxcc15z3jhMStx7GcmFxiEhRgmlhoS80lxTrmnjufbNM9+iTjpzHwK/o+/OTyatk/dbRPBj6y+41ecUOscquyph16Gf1YaaQwaQNUxTf0TQBQ0pC8V6kYzr/w7naRqUgQcBruTofIG3WW280O8kgQKV7JyryvnDUf1UR+IHWE4Y6ja0tRtya4SAha+lu8uBuY4itK3hs4xSwV9f8EWwmt0rBdCvjALCLIlP3CDC6asuZsy9Z9rVzoTID1VH/AX+t5CLxy7mIZFQ32bWmJbcOIT+okRShWvirR2XN53Rt6lQMFgOaM0rhYG+lsYhF/AjAisb2vC2ZsGLIOqtRrci/01fI9qPjFmiuIYK2JuOKzow3he0Kks75omcKrgjRsOsZT6R/GCZADVtoLuUsIfOkXyXoBSr8yzzGRimgCE9TgMw0LerQbWQfnL+gewQdgd3U+jCddrVExN42/tFSLj9YFRoycnBJUKRnewidJodimIWKp8CVWzlJ25pD5r9lrhhKNTbDpxngpf0OM/85UT1xnGBeN5hjmzUwOzcMM7wX+rGG67juyV5YMvk7VH+nYwIy1Irf35fOlFuIiDO0gggE40KyIDL9a6Y4nYHbGs2PR7G5pkbEkqR8cIc3G8L3zWiuSyWyhzIMWE38xhv49IAzOlNGxqQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(16102099003)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+PEMnRXM9T84jOirf6EOQFqoli+c3bv3n2HDLiRIZoKsXO5CoQgYgwMv5RaaJaNSXptrxXD2t9rIK5oNszwz9Yd6JYxr5idHnTvOObORsQM2/MZ1Y8Qas/PMuEFoxI9E10WUm+muzdexACBmW27SZ27EeO4mCyvdwXstIOuyJtP1xYiEmWyEd3CjzBOtQGlt+3OwIzeKyxrLKuG+YKwFAPVd8SDYSA5Mq3SQ83HnIBZ8YaLbzR5pHFw0qoUwrloUZ7tBFsxnohB07oGCuOnxeDwu85zX4RmTsK2DNL/CSnFyJqbPb59+79sJITZHSSdKgrnmLLeEb8aUE55h/Xx6F0kYCr2cg2HPsBR4esmHw4o2PxT0XvSwxi9T/YOOk/SRUh8MSnY/n3AgcAdjR0SSH9xDcuC9Qxz592uzv69knwxv1ugRgOoJ4VLxgiDHT8ae
X-Exchange-RoutingPolicyChecked:
	XgnQ6GD8f29odf/LpgIMU2r/2Px7Pcp6P8d2ztYoFwHH7CWi3u4PpdvjsRFvNvGZ4gjkIG4wfynFcUFru3jJ5r5mACWypJdiQ3Jrd2NAgED7DGpJItc/vYtWXvg8nKDHxHLce/zKQlpEiWqWo1vSmCr3Vr/uc1DuLr8LV/r8klChcE0VNI8p+L/03YoRnplaziObpH6KdisEtFgPdE2pBgrURr0jJ+8fiZRtyhAC9DODra2CL9w71zpaFggdmNDy4LUz2nIIqpJvQReoKo/BglTztQZ8DJzTQ2vMGw9nWDPvia1WS5eg4vBcFA3Onl3Q/WSM8B5fHlYT+M0iy3pxzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:41.2965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e33ffa34-180a-4363-c7a7-08dee7357b01
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5227
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX1P2CURZN73UW
 ULU1gUupIbPxazwMvDbcNsZaFacj/7x6NdynW1dJYlXMHGfGjOJQjvmKataSahXjmIb9a89UBHq
 6dlgQOS9qcFojZgHnKRtBSNibhJBSIA=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5f83fd cx=c_pps
 a=kB/eTyLYv2HckPafvHZuPw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=UZTCBt8kBtTiLchhnoMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX97pAk8yVRuzr
 VoMbs6s6/ixuwb2IatG4MK3Er9aB4y09WUtmL3YtixmljpZcvf5bHho78A0hyw6NdXpGflwg9Av
 LIvKVl827vYJDoU2DpIK6jZgY7up8VFU9gVPY7AQi4Pm2mLcFoN5P0AJM8mlqQhdpHrRNEiKIH9
 KRS3HKysFqhe/EXQdt2IoDdZeL7I1q7YqHEmlh3Odlzb21gQ6zlDLP0LGSZKjIbdLO6FT4DtlVg
 y+Ndtw7KiP9Y8RrvIHpsAv8OHPiXp2lJAw1lfMJm7CRF02a76DigjSw/pzMlFndn8dwaIANIe2q
 l6loO9hy3vnS0Wr2q7YnQQkEBQ2JsRahH60kxkCOPIuw/QDm4RbcXcuxa2og4UwdA6IEIovWfCk
 0pbN1DGAf5Rlc776PmJGc1b5rtG2OUALaJQPqKHWd9l9tzwsjU/hTf6e/oehNpHKSlaOu9LsgNs
 L0jRWDsUTLYYxi6fsQg==
X-Proofpoint-ORIG-GUID: QFCuNWQMXSUPOnUaEZxbg-OHtLT1RIVZ
X-Proofpoint-GUID: QFCuNWQMXSUPOnUaEZxbg-OHtLT1RIVZ
X-Proofpoint-Spam-Reason: safe

Currently there exists a couple races that can result in the DAPM graph
coming up in a state that doesn't match the hardware with respect to
SDCA jack detection. This series fixes these up by adding a component
level fixup_controls helper into the asoc core and shuffling around the
IRQ requests from the SDCA side.

The core creates DAPM widgets/routes quite a long time before
it creates the associated ALSA control, and the jack detection
IRQ is currently registered in component probe. At the time of
component probe, the DAPM widgets exist, shortly after this the
DAPM routes are added. At the time the DAPM routes are added the
register value for the control is checked and the appropriate path
is connected. The existing handling in the SDCA jack IRQ handles
the case the control doesn't exist and updates the registers
directly, which works until the DAPM routes are added.  After the
routes are added the DAPM graph has already set connected on a
particular DAPM path, which will not be updated until an IRQ is
received when the control is present. Thus those updates are
usually not reflected in the resulting DAPM graph which can lead
to the audio path being erroneously powered on/off.

Thanks,
Charles

Changes since v1:
 - Clean up freeing of the interrupt name, Sashiko astutely pointed out
   there was a memory leak there.
Changes since v2:
 - Add back bus remove in the class driver, and split the IRQ free into
   two functions.
Changes since v3:
 - Renamed sdca_irq_allocate to make more clear it uses devm.
 - Added description of the race onto this cover-letter as well.
 - Removed devm usage from all the primary IRQ requesting, although it
   is still used for the IRQ struct allocation.
 - Added one more fix to move the kcontrol search out of the IRQ.

Charles Keepax (7):
  ASoC: SDCA: Rename sdca_irq_allocate() to include devm
  ASoC: SDCA: Add sdca_irq_cleanup_late()
  ASoC: SDCA: Remove devm from primary IRQ cleanup
  ASoC: SDCA: Populate IRQ data earlier
  ASoC: Add a component fixup_controls callback
  ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
  ASoC: SDCA: Move kcontrol search out of IRQ

 include/sound/sdca_fdl.h             |   2 +
 include/sound/sdca_interrupts.h      |  14 ++-
 include/sound/sdca_jack.h            |   3 +
 include/sound/soc-component.h        |   2 +
 sound/soc/sdca/sdca_class.c          |   4 +-
 sound/soc/sdca/sdca_class_function.c |   6 +-
 sound/soc/sdca/sdca_fdl.c            |  13 +-
 sound/soc/sdca/sdca_interrupts.c     | 174 +++++++++++++++------------
 sound/soc/sdca/sdca_jack.c           |  88 ++++++++------
 sound/soc/soc-component.c            |  10 ++
 sound/soc/soc-core.c                 |   5 +
 11 files changed, 200 insertions(+), 121 deletions(-)

-- 
2.47.3

