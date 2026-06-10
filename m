Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA480298991;
	Wed, 10 Jun 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084082; cv=fail; b=FKMgLjV2WfOrlmC5kVOW3woJ/dMHPScmgi2hICFShsLAS6jqRbo6PasGXDAO1ul3GeeYf3JCd/bAun5rXFttS7JprW7Ae0Nb63IB/AOb312nAxnHkjvEf2XgQdFqCz9InCNMIMuH7iuY/W8SWI1imxZfzWN5zhxK8j2ss7vO/0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084082; c=relaxed/simple;
	bh=Epil3U2rvgKmJCJmBXlf7mTymdG8vlYwLzq3H4b3hug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cLcj6/zHyFVwVSO+/jwReLs5CrBU0eb3OnA9G1eLRopF7tMcZL5+fCDOVuCh/+iCKQIwO63d98C7KiEOv9Lc9d6IgAF6QKX5IZq0qqiLybfrS9fE1TgTF/NEHgVzFrscHkgPbZ3+2QJ8nhAr7KawOKDalBsjOzAcQnPJzd/QftE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RAAsr3wt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vnVYFqsY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RAAsr3wt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vnVYFqsY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A3ls1L2444315;
	Wed, 10 Jun 2026 04:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qP8HkojltSQuZZnZ
	/vVG62F94ixI+0GVhallF3IRKzQ=; b=RAAsr3wt2+8oy5ytZtO/qhYIr5KWGhTl
	jUtD+VNcZni2zTlhW3fsJnb2xxPSwTp2w7PbREURqNskOF1QZsWr8/jZmpEQoKhb
	GlH+G6v2K+GiiCZNpxqMztCG7aiD871sGOYiuNjb43zXQjG31mvsfkTN//RlsznQ
	MQ6IPsOCDCbo1K9hIMCCp4NGNN/eoAQu8vHtP0WXEaK1D7or9XvdiX+XKbEBgsXE
	O0hO0JON63o47zjU14+ZL4a8pzJQUaKwqD/G2hoeXOHBuvLUPtJhTVDYwSezQ5Xa
	Zu42baZ8YOYYGerq28cSW+53wj01DntcOoi0arDWN6+++qkQfPU0TQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022095.outbound.protection.outlook.com [40.107.200.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyge1vh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 04:34:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWt2ZU7fwI8sKRPkl9/Ytk9H500/dQneyF8VEvIiVqBAKl2sq2sdkpZHbACF0X5eaCajE7ryTSdPo6e0MZ4CjAo8zyZ+As1vRcPS2foYyFzN94vnXAPc/Fjmd6Zn18thlfN5gIbVhTwPcGM2+Hu4gn1oMAg2kBhr2/Ojqh0z71fC8H7kvm+23Sp4eCS6I9vTpKDG1HFWWylsJodgcLGQ9vZQ7tusmJZnT5YgU5r+qu/OBN37X/BN8zfZtSE9STSKjOyR6WNSQKlWlFV+Hm0IqxfaJFnMgzIloW13EW+t9JbcPh5PCK4NyMl4VR5YajWmdxM2L3z0/4zlgDpynYZi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP8HkojltSQuZZnZ/vVG62F94ixI+0GVhallF3IRKzQ=;
 b=Y+ucc20DpcQA6TDH4Ci4ydHPcVkU3wX6oDvN8kcDjoD9dgNy50Nwiqf+B4OXtnYAgXCTq1owthFc6pSxdlqCneEhpKM0nnDgkAsmoIz8L8sWvOe71AxKdNqrChUXjfJevVerNHvle3Q2oIwZYbJpX3R2zXC2sxDNd0avF2mh+GmZt31eV3A3R4zrfGlfujRsLYsIqkxG85ICzx5E0f8g6j/9qtzJ25DZwhgr6MoDzLg4GjpV706iyrJyo4xa2br+rQIFkJNW7jvJifd8dtV8McShfYmqLGIOd9bo+ZrO3w0/uzDsaFMketlUrVj1lwE3QTSXnMrseKh/jCtWOft57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP8HkojltSQuZZnZ/vVG62F94ixI+0GVhallF3IRKzQ=;
 b=vnVYFqsY4UzBu1lsa6GiVXN7LSNxBPBowlL8/JnQqphFX29+d+6kupseJ+j+NXdZgjqohGTKL/QLLVuRCPEPC2Dg+/GTUm0awbcXIl6npZzBNgqO/4rQ8o1yU2NxPbtcvjTKlLfmFpY0l0J+qY1t7jZkdveE8m4Wagt3QbNcyCA=
Received: from BN9PR03CA0806.namprd03.prod.outlook.com (2603:10b6:408:13f::31)
 by BLAPR19MB4419.namprd19.prod.outlook.com (2603:10b6:208:292::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 09:34:34 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::50) by BN9PR03CA0806.outlook.office365.com
 (2603:10b6:408:13f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 09:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.1
 via Frontend Transport; Wed, 10 Jun 2026 09:34:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CCABA406544;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BF68F82024A;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] ASoC: cs35l56: Fix some cleanup memory leaks
Date: Wed, 10 Jun 2026 10:34:29 +0100
Message-ID: <20260610093432.557375-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|BLAPR19MB4419:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 715e3fe2-a787-46f3-68c6-08dec6d37b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|36860700016|61400799027|376014|82310400026|11063799006|56012099006|6133799003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	NF3+1TWgbft8yRSnNENWOAQvg/I0ZrssnCXzXYTekP6Dg9+DdFAYPXEOTQRSp6R1eFOFLISZDZ1331tJLN7St/XNWJtxeWPa1mIw8ZK0PImHGXBovWp6hZJ+Q+byNuKZ6mqyyddxvRIwEYH1Dq3cSnAuiLWqwHawbt9s+6jhoyd6R/x2L+j7Et7LJOcS1196Cplyqz7+kY/gk3P652FMU99V3STUcyyt5t7Ng8HyYA4WfOR+r4QBITgQwt2vAD+/JNv88BiqX9/16kAuyRLqBo8UC0MWlk4Lo92nJXdle7OLxi9CgD59vCZs2vFDudWoX1YgY08dj8BNyzMwTv3Wt0310P3ver+COMkDbtZYajR994Kz+13jOF+GkIwKYPyE0rQU7g6NyOjJcnvo7QBoUpI7V8TKG/EYeITN+DawcYe91IpU3LWv2Pft3yef+xxbiMxfVv1XfHG3l8c/FcBhW3583GVohTm8VIggBPNB7VhBFjtMKFEThBIebH/nal47EOoUNtQwBjyGu74sldFO4Zeq46VJNAwuJ8T9LiiSsGGVmQ5HrO7XT4R4Lw12Z3j6DlXgi/LG5r+wzhc1T7c84yJkTOB3Myk1hRAp1YvEXvaZQbbowSoQDI6vFlX1YmSHIuSo5Bc31wbNSW/67iogRQ4ZvbAD6lZHsSeXY82cl0FgzZmk9PN3mbLH40e5ghKfz7/aJOlIUprkSYKom7+RnCQLglq3kDAAlV8TlL7Bmos=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(36860700016)(61400799027)(376014)(82310400026)(11063799006)(56012099006)(6133799003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sBsNCg05sfosH/N/h+EFidgyUugSC5YLq0Qu9heiW9wIgkvzO1YKfnpMByh+mWQ9uw61H8PyB9oIfcG5/qvE5FMo34vQUXmuAvlSw4Axrs0NZFVxWZp2C/0MWqbnh9JpKLrKqOqP1si0jDWHnfmmKzNek/ZVvOgu86rRIaLXcImHed1jXOGw4cONYzydb10tn3psqXiRbiQRyKPUx+A+rvxXPjhN4/3McLmvdLWovWxXwBGmFt2XcMxWhp3U7RHCkG52lWf51cJdm7cn/loOhUHJ6RLsBxWuVyU/OxImt0TFFYOoHdEx3vFUYZ2Oz7uzryCeQk9DFF0jLERjwaziKTZCiACc8fRecGR2hrlULE3wPy4yyKrV0P1X9XqOCbonGTGkMl5Zz4Rm26f+A7XAXergalVwo9ZSQPVUHtUl+JLEa4ZBa/AQF9pRTstphFtH
X-Exchange-RoutingPolicyChecked:
	gRiv7eg1h90XCeeBa8wO32UFxK7974zqpnPKsHR9MdjU2Fr+a9CXegAKhrs9eDKmUnQ/kxepYl8/DJ9BWjaMo4BzajKXfkwACH62u7q6SToEnygUsx6dKd06G0CU8U0faAk8PaD04WstZ+9AZnpLsv8XkbM0cljHDGOoCgs+yCRUjcC3Vd9EIwdr4C7tGVWvLOsXzLBedrjxhZ/UP4w9Zk/8445I7ijqG8gCiwR5W3Obn7fCDCIH7eC/C0eU5kB4SQWZ6E8xnPcFhy4YW89FptdJPjEzBBv50ZandB9dTwezmyYKxo+erotBFFN2TO8owgpHY6oNHETZFpOHtMxpdA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:34:34.2954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715e3fe2-a787-46f3-68c6-08dec6d37b78
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4419
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a292fad cx=c_pps
 a=jEVDRQfOmVlFoCNyrWPCQg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=QXesRyM55opo9CYXExAA:9
X-Proofpoint-GUID: h6hS-0cX-EiZvuX9B1LGS397QHseGdu6
X-Proofpoint-ORIG-GUID: h6hS-0cX-EiZvuX9B1LGS397QHseGdu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MCBTYWx0ZWRfXwELxZt3CvIDD
 2Czu7zwrOQkO5ri19NXuwSYQt6sY/pgEZIzqrHDuePP7aY2VJ10XlLpdVA/SzIPkjL7CpEPzLnD
 Mslde77rHe3h23hGvsWdie/4TO8O3jzTCMy2oOOpuvLPE2oHY6snwatWFjJy6wKs0PZAb7sKf/h
 ekVZuRRQThIm+NPXmXThFL3GKK/zSN2Ckv5sHLMeXIegnxz8TjgRHjCB1X2Sa/tmKkJvAkibjjc
 X2VqHzJozYKyFPQW0neBX5fL8BUyRivDlHCYUZA2xy9LNGVLiD5ttzgNYXBkZzpZHKyN0/nOXvn
 j0dLcUr/cKamLeZeIb+EzRygYa4Kx0FqaT5cPSwJ5GW2bqO8lL2TeGf4adAZPAtoXEK9l+9qRfK
 WMmVONFxaqL7YpRBSkFz09Wo/hlaUPspx2cBEWyzc/tbys23PjvhiKZG1PS8pZh/nf5NeUQjtHm
 UYaxGPa1TmqQWCEXgGw==
X-Proofpoint-Spam-Reason: safe

These are for-next.

They are not urgent because it only leaks memory if the driver failed to
component_probe or is removed, which wouldn't happen in normal use.

This series fixes some memory leaks:
- The memory allocated by wm_adsp/cs_dsp was not freed.
- If component_probe() failed it didn't clean up.

The addition of this cleanup in patch #3 exposes an existing possible
double-free of the debugfs, which is fixed in patch #2.

Changes in V2:
- Added patch to prevent the double-free of debugfs

Richard Fitzgerald (3):
  ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
  ASoC: cs35l56: Prevent double-free of debugfs
  ASoC: cs35l56: Cleanup if component_probe fails

 sound/soc/codecs/cs35l56-shared.c |  1 +
 sound/soc/codecs/cs35l56.c        | 20 ++++++++++++++++++--
 sound/soc/codecs/wm_adsp.c        |  7 +++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.47.3

