Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E955344D85;
	Tue, 30 Jun 2026 18:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844316; cv=fail; b=SrxMbGIL8GjRyi2YWNBndZQu7X3Dsvsg9PSOidhu+eGLY/DbuEDPeLzDVcvLkfpVztaYVfljmo+bNKaZOoGC5r5kyJCQrhJ4/udC4x05rFmfzciz686zwwTKpx6uwz1dc2sEqwFufEMOkVZXyNbmvuoNsVRq5p9UCLDmxN1N7uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844316; c=relaxed/simple;
	bh=qLsKBkfTcmnD5PbUr8QNGup2fD2jYDDFiFwhUg8xnn4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Djbm0FaN0KpwYoRviIPJ45KTufW80U5VnO4ckB6BGOp3avL0xpbnzAzyCTyNwEmEzgIQ8rBlssAvOmuGx1F948pEpqrFvVFFUT7/HIM2R3UlPZFsgdFiehSzNuNeF4p12PQiVO0iS/k2sCDRMShz+z7Uv92KR7AFHHkdTMzWbgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Y7+/6Lqh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gaxj4tSB; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Y7+/6Lqh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gaxj4tSB"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UGkcap1053667;
	Tue, 30 Jun 2026 13:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=UxTp6zhXy4yUy
	1Aw2fpH1NclIQkIaONe/91cYXaEIcw=; b=Y7+/6LqhFkc/ZwsOHHmgGaNRSHy4i
	va6BZEO2Cg3uD/fsQveqpJ98rB+ueh7sCEEyu79OoBJa0Rre0yGP3hoKfbSKzrQB
	8jMp6D97ZDUnl1lT9CNyk8ao9vvU923mMpGECkV2jKG34LFR8CesCx71p9akAogr
	8Dnok3enxPISrQhhcG8AJO/cC/o5IyW6QqdKH8hzRDKDvhBVjC6SusqnxH7vdjgq
	HqMZR79j95TYQv/Jxx8jpw6I6USHuvWDwfmm+gjXYNrLye4ln3339giCNgsg21y8
	XVwhSwbMybaYyluQumi2NJRHwvH3HhZvPaIShhrNPBJZTj58YTVEZXYUA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqjaf5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 13:31:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQJDp0pvXpM78gZQk2SU1fP2EPLwR14+9WX/Svmfu26zCg23RUL0+R1ZOGFccNhem1j/jn318KBuZeazfxKThrzybfeyn1mNR+FX7KfDpLkhsTqeSabfQYkkuR6S/jczIH/VNGduE7o6GFVl3TW0H3GLGHDa1THPBkqxC/qXr/cjvtcTnt/KUoLFi+IWXaTFwVFSM5Q1L08wqtfAwWseHaNaLTbPICL0IuAWgp8iT/JFR36kpDFa7GPBsg6uoTchFtoAeAQqqhUAY0qjYyIs6X8nFZXiB7B0Zv0fLaF6B9v2sOHFLdXWuNRshtdq2t4f11ffxYO7UyIm1XkYL4mpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxTp6zhXy4yUy1Aw2fpH1NclIQkIaONe/91cYXaEIcw=;
 b=X/8UmqPCMmXROktcd80+6GZKWVgQpgStMNLFH2mlegEI8FROiwtJy/M0f4lGrUfyNUASY/ltjecYp3P4ZX+q6YjV5V+nU8G9C4j43DAXgt4XhHt/Gefp/glZXHUQ8vaxPahM8Mgfk8kVwAydTt6I9E37prbDy4PNnYmpkhDp10KzWC8H4Ky6+lho3h9gL0kdrBylfmSZNHAi2hXu1z3F2hduiNDSZV8POUCP9/uJ/XQUaF096fDsgZu2IqCFGjab+s/pCywYtcWz5/Rn+1FsFb7fxxu12CjFv/f42oJp+qVyQU3cte8nS8pCSQKbd+KQ0h8CPlGgK37YK2UBjSlbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxTp6zhXy4yUy1Aw2fpH1NclIQkIaONe/91cYXaEIcw=;
 b=gaxj4tSBGxL/n1IK66dPpi7fPhMxRMyZyz6xUroPkSAFDKTIE9XhIlpoylfhRv7yL+RcJ/wKm1Di1vJs9z3TZrvQ1XOcAvv8O8PxiAXEmGhjJ4VlpaKcEd9h6gN1fHgDNk0VzveO5hxZhi/TiTsGCXVMbwlcio+ZpLlT6ObWsfU=
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 DS7PR10MB4894.namprd10.prod.outlook.com (2603:10b6:5:3aa::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 18:31:39 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::39) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:31:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:31:39 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:37 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 13:31:37 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UIVb5C3131825;
	Tue, 30 Jun 2026 13:31:37 -0500
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sen Wang
	<sen@ti.com>
Subject: [PATCH 0/3] ASoC: codecs: tas675x: misc bugfixes and minor changes
Date: Tue, 30 Jun 2026 13:31:19 -0500
Message-ID: <20260630183126.2588322-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DS7PR10MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c7c572-240e-4f06-fcd4-08ded6d5d319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	AhXG3FCYK0WX+GEbpHPvxTRo8gkMrG0iJrt1wo6PI4vT7M+0B6mhKzhfSmv5RfTF+Bpcts72vIyvfiUe9Mm2QnyVSqkM4RrKyu8gQLhoxFsTCoZBQ52IDXm/fo2sIUBMmItn9ayzjKpty1srE0mCXSbupDMrGk3MtZSGjW2ieJWuUBRDtpnsINC/wfyAmin9pdCfZyHyuOIPEvYXOhtFeHr7kKuMNBqgPi47qLwBmO/PGZQopDunwZeSoVMj65tSqegeHyi6EEGH6iSMlvT8TAnmeukwzcfu2PqLXDhLShtOKMXpwmWC7hWrd9o7ONqSP0py50AaZd4dmRaxgmmPjLj0p4WoqDroAznTjLtLpa4vb+fPZiuM6pVrXJ3uMpsMHjvxOH8Qk3mupvEsRdRfhT7JsahkO+J04JE+gsInqhSUke4cQN/bpeLjRCxaPrQShYyb5Zf1sVRT+CyZfDZIB+E7TTh7Qw7Z/qni5W/pMXmL1hhn3TKJIsIuJKIduvmyYR+drVdAqZXwLnIrIRr2ijFqwIq40KLTxstYHe00SfPBhV2smICohZRXiS1/92nRMRinesPrbWEUYFSgGj9oDC7N5b2YsC4L4wZbYZSr6IwCNg0MbLOQNF7vu0EueEad7iCrGAbQ/twa6BALWvNAQXOm5xNGz+jAeGi7Zf/48alaPkVT4FRidVYwrSfHQG+3zxOaCY917VvBy1nK8xWyXw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yrn//xIVcfLDbD//fFmdxA3N9/m9VklFcVBomI+XswaXOJZni7FoQ666GkCL2WwNKgdY+UT+hwVb7cSxMGbzAko8YVpnCcvskE5G/T6ZXicFxrHQ1/kZ1MYquMMsdmcg5qTlYcPiYKLC52LdxqBb7XUFZW0KmYATWRZG9ej+y3k2GBu7COtF44baYgJupz4TtNDlcwhpIUpd1JQL2H4uGJXIeJHJVpzUK/3lNdQj+ZqRSQ0PRBQR9n+3BgeqMWVgsR+K/+gV1QqG0e5OtxmHu6uL3Eib4szYSj5dtRWTfq2FBVOaHcfeEWSfvCYJt9nl6OdrfnYR5ahmNaiAvoqNTY0id8qgzKNFMRUmjdpaqVpnwNTz0wZ224ZnQXzdfGzNr0EfUt6w8VOtxbeOxvi96BIgcPjuIaJOIwxovGQ/OH8JV/dZCvmq3j8oU8wuGCxy
X-Exchange-RoutingPolicyChecked:
	m1h4R5ZawFsbsKOvfvMHqj+icNnTdb/bwOnXUJsaDN9nRUXgR1DjTfppqbtCFBNGjbqCMUCnRrV4qyOqGy520X82LC16e/3zlud/NcIgXCTrLWqHThKCHtBSn9ZqB6Ze+PqHXZXQdFl2D9sBTEnF7ToziXWyBsGtwEJCuWBNrFQL040iPn5eA6Ht81nlF+1HDWxyeMmIQVXhf8epr5VeU/a86W/of0+jkW5dFvKRZzmB602JJepT/YYvPG2TeyW0XzFHlcrhRvXlDgopaXw8Nl0WgZ34o+XJXRXVpNKAH0UZnLJGVuRqm/Su7Hm5RevFlnh3g2DmHdy1LySe0eLCSg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:31:39.0375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c7c572-240e-4f06-fcd4-08ded6d5d319
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4894
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX7/9xeaqImsYy
 48SlQWCgqpmnBxz/leVln+9igSLG3OY9uGmwqiI0PWLqdupyOBMZF5l8aIgL1+jdNloXCSbxCi4
 oPpZ9N2gWA2EoEKTRvqj1+FTFZQBhBG3sC3Xsa9L0pjk0aXCMM001OUyb3JA5eE0JkBw4jZhFGi
 wa82ezsnpfd52nbVILJJeDIoxitqUxarNz88XbGYa3Sd708VIn78QMA0qDO8jLSCce5h3gz1/iw
 HtHFET4M/dyD00M6yIWYqKn06yv6KAoMeP5jKwZp4vE0xt31b00OTNMyjXAA6dIQgsfcWcj0TA6
 xiqp3hKFq05HinykneZVKzszW1DVbzD/SsiRZ7aGZ3D8Xe/2vsG8bnKNLSwKlawSsT0Dyt78s3/
 BKDSn1gX/S8COAAL+O22h/KHgfgQrix+OvVHzLgyf+SmGuBO1jwy3w+huaKK8lVTV11lH+EGH7m
 qiCHMw4Ml29fbqcpgVA==
X-Proofpoint-GUID: LzUyrnBHj73pMtlgLCEuZXoLg6rVIypi
X-Proofpoint-ORIG-GUID: LzUyrnBHj73pMtlgLCEuZXoLg6rVIypi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfXzv3Co7zhCbAB
 wpn9/vFCPZHrsv2wWvYLOoMFA6/GwH2ezfHkSRFMCKKoQmoI517XfFePOPc+iNtI53ZyVepDq0I
 WQz6jTlULlUsQn6aWdD29H+mpmtvtRA=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a440b8e cx=c_pps
 a=xOrz19RqOvhMowGYDVTMqg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=qCRPy397ozzfCwpNPUoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300178

Few miscellaneous bug fixes after the initial merge of TAS675x driver, of
which includes:

- Adding READ_ONCE for all concurrent read params
- Corrected kcontrol bits for temperature range
- Corrected conversion notes in the driver documentation

Sen Wang (3):
  ASoC: codecs: tas675x: use READ_ONCE for params to be used
    concurrently
  ASoC: codecs: tas675x: Fix CHx temperature range register bit fields
  Documentation: sound: tas675x: Fix temperature range and impedance
    documentation

 Documentation/sound/codecs/tas675x.rst | 12 ++++++++----
 sound/soc/codecs/tas675x.c             |  8 ++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

--
2.43.0
