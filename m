Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262E442B37;
	Fri, 31 Jul 2026 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511885; cv=fail; b=qTaBWu9zrtuB+7LpjBt9AlYZ5v5dUB3E22CYGuKLW4cL32UGxVzbnBEP0a9azD3y+prJ5NU62if6In33OT3gtHBsFdm+ILbsKWKKKJhpYJ0fv9KRipvfNcUal0oT+uIY5eyVnDWeuIRIkgUxxEP99IuY5UXKagLpGCKBnMYVHXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511885; c=relaxed/simple;
	bh=a1C6klF2uWhvO4Bhw5PHEzEcwQoXrBdPhUH1itiEuWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lkvwwwFFnhwIuZ7LaKVq6MbFc7bTCO1yEC3McpfKbrUzG5z2oh7NlTqTh1RnrzfIPuFrOGdMCsV+/N+KJcUMZNqmGzWdXfqMSeoxrTbJkW4D4rUKYj2CIkXzUzsRXdNkijFWV87un5Zo4UIQPbItPHKtcqvbxytJ5mxX4bc50nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dX9XBfXk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JwTg7xy6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dX9XBfXk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JwTg7xy6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VDGqWZ928466;
	Fri, 31 Jul 2026 10:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=QVBHiHUy4C8IORjm
	2HPuFnJvYVSpm6Ljn1D19GRRwqE=; b=dX9XBfXk3JLgPoMe2jfJWzOBvrVTI3X6
	eQaoH1pPVvBjqTBe0jmEK7SCs+YsdInphl5/0G45vHxXBcZW0W5VQNIXCjqzZdDu
	1DC6dVeXvK+pLdR53ZcjGqVtjSVsPnC0wHnKltP+6KOCO0RR7NZHL3MRpHh+EIwt
	lwfGNJb4NBRBIZJz2kA8QVpN9IF0VuGQXTi7xPVHjyGqBkVoYgueUfafXGkZM+kD
	P9UKVh4LjOASNp2mK/YoRMkb/iBZTLvjFUjGEtvD0ZqqckzCP+XfM7W9w1Lk0Zz+
	Nn12IvkiolQxol2/12FnuM74IIjnz9/l6qd/kSq7m/TlnJXSOppFNw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022081.outbound.protection.outlook.com [40.107.200.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4frtrd8a54-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 10:18:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRCkvYxzlXUTP2JzyfNhR0SocA0tlSdRRXn5dA/5T0RQAJD5/ZP7yTSH0Rb/XoKe8sLEfzfCEPQspNyHc9Ls5oNmmVzrIDZfYMSsq6xIN+WSLEmD+kI5C9jGH2dIogY7DhgOPUsP4Qgx5ArJq0xndZzbxRv+y3eVyl/2x4JcxGXTHCDoED4rc112NHVE8prCbDZFQfAlnEUINy0K3K4HeTpVWXMMVbOQJF3FJNcxHGhY8TuSc4s08p+vekF3izNGMd8wpw/3WHRoi/9pUx/kYu52pvvRH1ks6kiyrgnkPCE750sF3H/JPIcYO0zbOqER+LaNxvQJZdwwVTBBHy5c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVBHiHUy4C8IORjm2HPuFnJvYVSpm6Ljn1D19GRRwqE=;
 b=k1idZcLc+dpLnA9pdLXzG28x/RcWaxd5eNu8TT3VrTxa+CaIHyyE97DKP7trG6ucpAKUlwTI4y+Hpguyl6JS7JQqNAu9JVrBTbCe/+sBvC2Knu7cmCPAXl4GdX2tt6wPaeEg9sW+sWp3a9ETQuyAD9EE2CjNTdfdZWEo/Fiy+mnEl6icP0qik59Uct0MYjVQN/74K8bRUi/JNdSq5F7FF9M1XLo3Srl42cxxFbnifa44gPsbxJsAQGT3D/Q0s51ux1XjyBT+nJlYmHDkAV/xfO4FeifFBi1UVdPLrpG2xfVD5hMB6sZMiUwBWp1jzmpXw8tTfZZDtBnsjBiuY+NMYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVBHiHUy4C8IORjm2HPuFnJvYVSpm6Ljn1D19GRRwqE=;
 b=JwTg7xy6mjYLwlLSfGoOUKvkkWgAK1dL6+ChGZTXrGaRrmvVkKkRtH8bD8ge2l+jRxpLKDxXlRHgVYqVyIss8LyGxIA+8DGYSLJmIzWW2vmgsjHgPjkxukcypfBRt/4KyydPFtKmndG8s4JLyfXlYRSdD0yrFveJso5o85aiCsU=
Received: from BN9PR03CA0512.namprd03.prod.outlook.com (2603:10b6:408:131::7)
 by PH7PR19MB6589.namprd19.prod.outlook.com (2603:10b6:510:1b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 15:18:34 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::c) by BN9PR03CA0512.outlook.office365.com
 (2603:10b6:408:131::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 15:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 15:18:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8D8BF406541;
	Fri, 31 Jul 2026 15:18:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7130882024C;
	Fri, 31 Jul 2026 15:18:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: es9356: Remove unused headers
Date: Fri, 31 Jul 2026 16:18:26 +0100
Message-ID: <20260731151826.961912-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|PH7PR19MB6589:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9baa9ba4-03b2-4298-ca1c-08deef16fb7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|23010399003|56012099006|11063799006|10067099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Dyla8NhGV0f4TR4dvQSSG5WbR4Y10Qdv/oeyyOTvq+FBzJx82GBUeIaK48jFyWaonnmJ1fvlFxjSq7UndHGz1gjlLB5CJ1pD8xU6DAYNCqv2ztGhhZ5zMvMIcar5/y5K/Sm2GJBIJs8vaIdD54An+hoXbdSI4PNgoP5nXg7g3R29Ycn4xloTdU0/xUPmgSt6fI+fEKe7K2uCgU13beAADTjP9bW6G98cSsRUREiLxjDVFWq3cGzUY9+mp1Pc0yYrNQpvPVE+zxrmoW2Rmxs8PO63ybMRmAlcQxY6te+BqAFyIu7G8kp6+c5JvaHily1gun9N3PSgqD9Dc4tRooai5mJyKZfauhbzdEVrGkSxDZbASfAQf8MqieA/WFQo0dKqMCAHAXuG6NMGThnDowHwSLSWLgxB3Nz+Ap/PESOYzJbPJF+O7qcb5ASoMJFJkU8hzBOhcPqbvSHk51OSYwhLzpMsDPNqrZlbAg8jIQz/PR9yts73YOYoZ4o6KpcdC34B/Dl8Is9bh/5437zByykS1CUdyiSPe6vx7gJ6V6h+/GQkhkELSRwlF7tYEnC5M1VNWZY3nMyZIFDv/fyGepm4IElVgp+j5UdrGkEZeA3NPsobCNdsM9wWubIqfDM5HaDmmn6fO8+syS09EZH6ee+TZLxTL2t+2cDc3uw3Chnd48iCflUVNfrzq+DkzlgQxP3joDyecjLYJ7PANGhwYqVCQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(23010399003)(56012099006)(11063799006)(10067099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	suKTPjOfI9R0/ylYW5D6o45rCj7VQthke9VBxnoNE2KUQ4/nL9TbNxMJW46XYnUiY27E4ncnEb0t2wOLgSG9iqKQveDhgRz5Qz6PI4fBoRpG38KtKeomn+nFZN/hDOqiF62+wZU9Gs1p+Tybk/uPaqc+0EIYlkd55ZSKLeq+yYEGWfCAWJEUdywwQnSELPHPc3BN3UABfpFf0wECNOFST9pkPHQsVzPsblqtFMT0hZytgT5FuNzib2xHjJDV19juRduX8fDc058Gkwog7m/LEQDKzKcdYbea2JLHEW3iM7qLlufhb2Fc0hUCIRtw57k4jyOBvnpF6VSIFfbzAHZ0WMKdlkSbSnC8nzsR2S+rmNl8PqlJp2k4youN6JxW1C+yEuesmDD49xUyW2lhXIYLGBCd/gyIin6JAVSyTbW/6QFMNidK7rgyT1khWrUAnQKj
X-Exchange-RoutingPolicyChecked:
	bgKY7d/DmEeUKg0gkoh6AovOalE3WK5h24yItL9TAQI6dzOvlgPWMn0iUT85Q6taOtrImpe+u2QI2tD6pXYEL9Wlry1F3WL1k5cwzfBOTaZNVWtX0/nwuMLTJXlh+21EEJa1iygOLrwXn8Si/9N5BWIaSH94/fRo2LXdHp3SNkzl3UAUfIKEGscjdJQvsaTVO9mbkP03xPeb5Y+zJn6fJGrpEKu857OosFyMvISRCqaYTMpMdTDiMXtxsh9Ic073uP01YTo5V53YpCElTkFRIWHpzW+IOqhxttLryyWrKPHY6rYJJKlQ4+x1z5p09D/F/y9EKcsDIqubmqlkjwCNKg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 15:18:31.8745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9baa9ba4-03b2-4298-ca1c-08deef16fb7f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6589
X-Proofpoint-GUID: dOTGsygp3TSILsgJJOdIhRWI_202oeC7
X-Proofpoint-ORIG-GUID: dOTGsygp3TSILsgJJOdIhRWI_202oeC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExNiBTYWx0ZWRfX4l1wiCRHsHiG
 NZL4DAU3JyIX2pDwAFBF19oGY9TxfxeCu/lrPEzVHfbMcg7EW4hf/u8N7Aw8ov7uc1mgDUXQ3EQ
 bB9Me82/OLDWGmPPlRoFYZSh0G32rwNtwWlYm6t4ukOKa8F4jFu797eU5t2cJN0ZLtHM2DsNrpD
 jf6IE6CRBVGflhu1gqwghj++F2Q7/Vd/fbLW7IWs5c1Kb6NF48UYHF48GfVN2g8JsCkJl/8MRr7
 bXBTtvFJ2JFsvBdsjQXkmZ7Eb/CX+yqYDn2sQmW0Svepfv6LGr/3w8trHdx2KSB46g6Ano/qox7
 VHHH+5b+Plvl+uaRObNGZFtdrOwMsmqwrxn9wF1idV0GJttMC5R1tMUEOKOJ6+c1HSNNthohCiB
 sJioS7Bi1z4bFOAUOqSspvKOObA6Fu8uS+CCpEiXfxl0jCR21KPxqDZLswH2Kph4RaIg3048n+K
 bngecm4Ep43JqxwT+8g==
X-Authority-Analysis: v=2.4 cv=L8gtheT8 c=1 sm=1 tr=0 ts=6a6cbcd2 cx=c_pps
 a=W2lJqvwlxpc/IP2FXjrMFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=CISzfjA6dSaRY3pUP-YA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExNiBTYWx0ZWRfX4pVnNTlKtcLo
 NqNJvx0siGRS788QaI0dibfOmmwen1S+kxQ71RE4b2kabCbTB4eFmcfxD6rUBh/EeUdtgtw4wAx
 8f55Kp2Z18rwUdf+oQnROY1Viak1PMk=
X-Proofpoint-Spam-Reason: safe

es9356 doesn't use any SDCA function/regmap features, remove
the redundant included headers.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/es9356.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index a9863900bf709..80db0f2f4aef6 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -20,8 +20,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
-#include <sound/sdca_function.h>
-#include <sound/sdca_regmap.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <sound/jack.h>
-- 
2.47.3

