Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B303B1EFE;
	Wed, 15 Jul 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132977; cv=fail; b=ia/hveT5c/QgBIP0w46erCbEMPd7OtT/B0GKlS4EKljBaCnqIiC8yRllqdEBRo8ts8vH1hZzLTbNs2uIC+b0mEZMKYx2tCFB919SVB8d4dH9GjzdDknXQwg3Hb0YViWYfB4Hf6xh/xmXWSeJc4vUr2CEEpOrL8hGKCZHj5ViXvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132977; c=relaxed/simple;
	bh=LTMD/5X0Rn/Rc3uhSBRHP38dh3bgDmd0ivUjpEmsQBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tWr5DdmxHDOpixApNsZCUc67Nc9k6vZkLnTxh6I7AB3ePM7wTxoIPyuix3YxWYgQgquWz86EoxVTZONwWmXYQ9InCvMoxc/i8gXqMt6W4Uoo4VNBjn54l29jURmY4Eie8Y4GO74y5p6Na/IYUvUY7hbyoZdhZsFS2MmQUi+huRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LCqxCd5u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rfDb7OYr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LCqxCd5u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rfDb7OYr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4PWcd275548;
	Wed, 15 Jul 2026 11:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=GrlrQvALoer3Hx1/
	9b9IL+TZN1QBdng/XeSokhCj3x4=; b=LCqxCd5uMUN0gSCjMHUgJUGClWeE4vGi
	qOyFCU65qDpHzwaQ7JX0wWdzVqZBfaOjR3vLXyuEwq83ohU3IiyEJND10BQTZTMA
	QGPJgOsH0dRC553I0GrP0IveMB8sjZznO1zBNCUWxy3hIhP6MwLUEkpFXeDhHNiF
	hYiIuMtu1miPcX0VY8jknTe4p9zY8JrlZgSdw4PQOWlIgHlmTBy3NoCGxIamZI93
	Gk5eb4PISTTrt+ZALZTeFnJ4s+AHk9BQQLcP6ZpXj+/g8kms5bbKDuJc0t9oDJre
	MS26Twp83jEiGa1dPQFAhIzmrkRosD00aKPVy/XToTlGuQ3ab8uk2w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020092.outbound.protection.outlook.com [52.101.193.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vwu1p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:29:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRwl8m12y5lETiyBcJ6RAs5wcW3gZZtbMzVL/jbtFKf0uLSp1iPBsiVxyEUiiHuvtH6kd44TRiXzb879inZmGARF/H7BGaST9dUYJzxeGBxdAG1rlomH8QxYBynkxP42shfu5pZqgoJcVrhxEo89+O5N7ztNKABmzHKh5MmJGsFMM1KwIi9mtScELqC8cwy/CgVXV6zx6SEgk98xMzI2GFlF5sypkDbptH3AY3wcWVXO/EsDX5jHL2WbctPqx6OwN1ORVqN2uSZU9QigdCiRYBfrgAWPPy7co0LhhhRrg4saMLRv0pHJgZmX7K/hAM2f7htVzwJfjKrhXYgj9J/67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrlrQvALoer3Hx1/9b9IL+TZN1QBdng/XeSokhCj3x4=;
 b=afQ+JlOvET+Hj6NCNUJ4nlF8ijyfvf3fGWYFY+3WW2tpGy+tvC1MMQmOq7wg4UcL/zJZ6cd5aYi4Bc8rkCtmPIQEN/xFQGOAvFrdhcCRvNHTipIyz9wO6czbwyp5aoq2AOFwsfQS5kweRaKHBNLD0rysG+2YQE0jZV7xoVjat76Of4bTrEJqoLlSxRmqsrSzz0M4OUx+/cqqMCjcWmt2GSP0QZ3A6XKN23Zw9nEtw71qQ5bpUpbUJqex6XnH7YCRwz8kAx+O0f3SHw8zWGVfWP8A0/j2Ey12Gr4cHekNXR8gnzUlsgduv1kiEpRaEqLa72Dg2CfkCTEkkVpO9t7m4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrlrQvALoer3Hx1/9b9IL+TZN1QBdng/XeSokhCj3x4=;
 b=rfDb7OYrPjoaWBzyeKXOZtv55oEs9eOZ98jtWUcgVTL9q8G8S+bRrkxvXugCjEfw5j1FAcmKE4flOuR83RNUm9BIG3x0NdpUrW94FsRYKpNP3UIf5m5tEtTZoaEV0qrCfy24oB7WCdStKRAFja+YHEsnffRE0xVLFnxJrh6G+rk=
Received: from BN9PR03CA0258.namprd03.prod.outlook.com (2603:10b6:408:ff::23)
 by DS2PR19MB9651.namprd19.prod.outlook.com (2603:10b6:8:2d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:29:24 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:408:ff:cafe::37) by BN9PR03CA0258.outlook.office365.com
 (2603:10b6:408:ff::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 16:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 16:29:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1A211406541;
	Wed, 15 Jul 2026 16:29:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EC30A820244;
	Wed, 15 Jul 2026 16:29:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] Fix races on creation of SDCA jack detection
Date: Wed, 15 Jul 2026 17:29:15 +0100
Message-ID: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DS2PR19MB9651:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0b12a3e-69f4-4680-c4c0-08dee28e3b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|10067099003|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	2BsyHBIAajMrbpj/QJA5C8PLbu5UtQA+NYp9t0xTPzzuBj4BBa1tGtMcCkV1E3SLwFun/F6JoOJYA4Lmq08/eKe0xRAkZswOHjE6BMHdoLMZJtxBX6BCBuf4rcsuylDloSdtGqWYfO2nQN00RXhg+rP8wkzGPAxz5r/RxocN7JZjOMw0jQza9B9baKYuzrEgbVRBbyZpJHt3GbkcIGWj5GjsI52/soiw6qW49uEdJK/baQiKLI+jRcYU6oZQrs17XZcyONF4uVETjs5iyNMxmSvrM9aziMscOFnQSPhnZK3H8cFU7RRqZQkQZCNtIv8NtxBnBQTHEMtDKcuOxCCPK23AgyWXvHHjJV7iheCeS0HWKQaWEXYZM6PtztHPSVwiNOIJ66qerUPeBdUt5pnd3HOGVZsU1KHPjVeL4lQDyiSJrBFeh5I7WkPihhofjrnwrIzAPOG2iYAMMttKkb86ga1hFJR3suNQPP76RD/C2s/1E7kSn4ikcKTThq707HHCacHA94LhNfDom3vUHKPXqbRKS9o/56q6t9Ohvc0bSGZjrAuL83R01bcqxh8n64W4S99lPvGA9EtaoaRCsli/iYgAcdQo6/zdfLMcHOMdAoCqiIe+vObrzSH0hA9xhDhw4L9JJrFyyaDN0zbfhySln4u6b7J8O2tucEwXCjSRM3ZGuqPBQmfrl0BckwTT1X7f
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aseFmJIPcfQIV0CWKJUWOa1kkCaMp8CXq0xvug8P14KTT6KhuRxTuOXo11rUFXPAsuN69aGbozXnEWmiHAYXaBYOpNuzTbU/hVKHPPT23KXO+vhd4g2Di03bldjEdsNGnpvziF4Np/6jAV4YWIQu2jMXQP8SAzArnPyWs9ygLT92vzaSPk7Fs5FszzQffWAhnNPmeOKiPlY9q1jJeHUVSlCnYElyzqPcMI05V9xJCRbC3yERyvBAB5YHHlwtR5y5gQW9wQVWkDdoDBPfy2aKcu864Syw4Fe3ewj3qbcYhMrBQBzG7fLDG3vTRPL7im0pSuGfvFhjqGz44mZFIxduiYJTu89U8e6gIpL5Rk1sYpE0kO88gYuA3qIeHBIjVpiPaqjVfj7UAdAJgWSGYsk3GvFx3mGJi6OEKo/L19Yw2NzmsRtDTYwEAWRsLdYx7Knk
X-Exchange-RoutingPolicyChecked:
	LOMhrCHHpygcAzWudZzFsC1m1Dkt2fmEj5ICw0kJnPTwN9nZtpsKtODETF9k/xVgET+hmlv2AUhb2hSnXnP3jXbzWDvq/pCmHR8QxeDfAypbwme6J5JKiQV6JsiWN39vmrw4cIgHn9iemolqDk/AZ2VMnulM9mOK5jpJ+PQUtUFx2OhIZJ1gzG+PMibPQUX6VHTapbA/pwx+kDkQBRABYrqmAkhdCcucEfvHXxclQpMAFfEhhP8oQ5gwZfNtB+mboQzaLE3c1VT+vaIoxu7pWwLN7eWTLGbpDqXhlGUfcdfzjgpNg4zB9Jc7zwCa36AsovqlUmdOaKtnh0d1soWYdg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:29:23.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b12a3e-69f4-4680-c4c0-08dee28e3b0b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9651
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a57b569 cx=c_pps
 a=xUkxIiuLuczgirDP/m2+WA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=lSlV7XCmUfVAxL1v0XMA:9
X-Proofpoint-ORIG-GUID: WiXbYcpvvBF6LqQsz3OUveDx3085Pp72
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfX3QMCbNhzEpES
 IQsKFKqzLAADvK5hjINYIM5EmUV6xPUlRCOLwRLH4/aJeDvbrTQ+CoxMfykaUjpG7j5pTF0ABuu
 iMkTMXhcJVVtPCxVA2NA6k8s9VKQaX8=
X-Proofpoint-GUID: WiXbYcpvvBF6LqQsz3OUveDx3085Pp72
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfXwJvzFtHxo1/a
 LaE1g2rDpg5hqQHDeEU9uB27F2ddHfgpUnVmYcQqrrhN0aC2RUALf5VBkKkGycFm2jONKE3Ett9
 KtINUGiPmn4PET8KfldNs7MvNx/lig0IutSTu+KrTZbsuhO6/5MZbILotD7HPVxpqvkyOw1neXC
 FniSbh7J/7ByERvt/3lVrFEtXit4cDxu7Z2v+c6D2adbhYt4FJFz7c9pdO16SHayqUlnitLz11k
 z4h/7+DauXSSOnVOE6LbgInV5Gr2AFJdhEXfeA7zMm2JTNVYMDa0FLcdrpBHcOqNO9R0RBmDVpk
 4HxpyYx1fLX1dA5OFqvRugMfB6PH31To603JXz5XxfPslwmTE+mu3bENHrd1vgdLapl7LsKli+z
 DRHZoaKKVxzd3aH7ITqvqoioqM4akGk+OW5DjLUqZA5zVk9TM2iNqKiVS1xZPFSG5qcwyGvs+YZ
 r0BXLvt95/1DUZmEAcg==
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

Charles Keepax (3):
  ASoC: Add a component fixup_controls callback
  ASoC: SDCA: Populate IRQ data earlier
  ASoC: SDCA: Switch to fixup_controls callback for IRQ registration

 include/sound/sdca_interrupts.h      |  2 +
 include/sound/soc-component.h        |  2 +
 sound/soc/sdca/sdca_class_function.c | 12 +---
 sound/soc/sdca/sdca_interrupts.c     | 98 ++++++++++------------------
 sound/soc/sdca/sdca_jack.c           | 44 ++++++-------
 sound/soc/soc-component.c            | 10 +++
 sound/soc/soc-core.c                 |  5 ++
 7 files changed, 76 insertions(+), 97 deletions(-)

-- 
2.47.3

