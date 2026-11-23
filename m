Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434768;
	b=GNAlZOedMxfOrMbEUBFLWLcgEnk9zfkaehenHq/HIDYOrX/fqFEMklYk1DMPSWzSHPuc
	 iHQr2n68rYaF39Z5lbs0jjzbLCa+UQZ3hNii8WJvtM5S6fsufkXJwmwLvaSLnEOrW0Fwk
	 axch9BFfa17IyUaQc/6ySZE7MSYVTnIJ+7SbTVsWrC1Z49DCudTtU1j9hszpFPXL562CB
	 oEQmGCw0nebAaO1DLZxbRV6oStnFjYxx6ZtrdQ57TuFk1Pf8oxeucniLI/NXM8o05rK1T
	 ONCaBPBwDeauNz5uTJIGjdZWlFHJ7nyLJaiY/hZnIQpd2h2pbhc0hq7Z9ifx/kRGufA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=/sWdom+NmQUK4na9mnYB7A8KFmkjQXdGmCX25+2yazk=;
	b=GP4ZmwDSmgQ5HWVSC9ojQ+lJPslCXOgJByVmACpNYryslgxaQ8Wte1GtVGeqzVukBGgJ
	 pY7hIdPpCQLzO7PLUJSC83lr7r8Z3tMca2EEkNI6b+iDYkbT3mekfI5coyXhB2rn3tPS/
	 LNiZKTkCk8OBQZk5zUZ89DX80E4gEuAmKAmApyxE45WdpXHZMjv/Lt6+8BkBNeK7tq92g
	 ysTzZAsBUhulb8aMn7otsxUA8PEwDC2fvfWgjb/FrFOhlyi0lRiYebau5ov2b0wo5QG2y
	 J2q9UjKvl3AY1+JYhLpX2ZaPyM4wctAHuEWNebuIGTC1fbKNfyBZAvJS7bT/t6z54Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=qpsr1jYl;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=wiN6MZ5c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92257606A31A;
	Mon, 23 Nov 2026 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92257606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=qpsr1jYl;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=wiN6MZ5c
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANB3MhE1198226;
	Mon, 23 Nov 2026 05:52:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/sWdom+NmQUK4na9
	mnYB7A8KFmkjQXdGmCX25+2yazk=; b=qpsr1jYlNYStQe9XkH23hdQDjcAaXIyo
	0+dLnvA1bSXwoKR7jjkJ9sXaFMuV8MVdDX6yPopf7vKE70jyf3sujWXQ/KAjKV2l
	jkXKB0Umoz76KZBTDHupZLFEXQBZMLktf9x2+LIkAJc3IZIfKrURmK0/DXZWROcM
	/M3fyUhtSIkWb5q7ARc0NXnIlozWouWK0HsjuNanjLNPYcl7erXPKx4RFpUuLDNd
	4vi/RF5A3hmlFpYJ3ZfxqCIMH0hI2fimt6Zm2Y+mLPk3vj+sVxjGcjXrvJH+8E8y
	1FtJjHDHjTeHPvC3+mKYcC2xt5nFOWxB3dC4/tE/2ojD9Qz4zZ3FmA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023083.outbound.protection.outlook.com [40.107.201.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j39kh2bkw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 05:52:14 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9hBGr+bSEz9cuaP6nG5fGR8UIYHCFVEctTCKlRpd4oUSXVwwx9AhmMZtmRK/GMoVh3aW/lGCn55VH5QMV5HhJJhv5TzWDUDmRgchYyyF/+S+93AjfPM0jHGaz4YP+Zq4YrocQ6qphS2VzZQ91wJ1V7JYo1hlZ8dvzEPddSCsknLq6aXFDvoKquthjOKcq1CwEhrnpPfeEO9Faazr0UTc83R+JayNGnZ2Owv0pcyv1vph902732pZvW9hymAwr/uP0Ked+EMLI3XG+rmIZPI1XmTo2+JbTlNMQpG7po+8Ij492MZMwkEuSOvIcYjPDwBx5fxA/fCKXO+rS/m7x2fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sWdom+NmQUK4na9mnYB7A8KFmkjQXdGmCX25+2yazk=;
 b=lsZImGMiQOYGO76+PQNUF52MfSEx9LrANFpTeL0dFpmgTskmaxfc+aErmvcn3uzpOF7YhUuTtm8SmfBaKS+mJYN3gP5jqqJU787p4jU+BVHB9Vfb0kifT07WYHZTjroU75o4edwMku3croxO4yE+DYlD2SOi30bWIWfI2RTVpYe48wkFjyy/1hy7YP9nmIgBtAqAHL4FsYAuv+hSdnJpRjYrCbaRfRi57WHx3C/fMKSghjkw6Cq2hLG/xZWJhlWSq+OvPHBKEvG91LXmpgaODHDcmmIs8VHmNu/p1qZn7+VfJhrdWDFu2nYyvG4zeSEWe5rBat68JgEksus856w4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sWdom+NmQUK4na9mnYB7A8KFmkjQXdGmCX25+2yazk=;
 b=wiN6MZ5cipeqr0XQNvvZ9RkysEhUrHRJxpavx/wopHg3Rqsp6n36nEfWaHK3xeC9iPKdODlrIWyMi523iPjqLf7GbO4GQS2NTBoVE8afawnK6jzASdIY6lROKo16SuIoe+ZOz4j5PR4b4M4BXsQ57GNlus2JlZZEYCQPMfCv49U=
Received: from BN9PR03CA0117.namprd03.prod.outlook.com (2603:10b6:408:fd::32)
 by SADPR19MB878900.namprd19.prod.outlook.com (2603:10b6:802:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 11:52:11 +0000
Received: from BN1PEPF00018073.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::33) by BN9PR03CA0117.outlook.office365.com
 (2603:10b6:408:fd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 23
 Nov 2026 11:52:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018073.mail.protection.outlook.com (10.167.245.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Mon, 23 Nov 2026 11:52:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2EFAF406545;
	Mon, 23 Nov 2026 11:52:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 16B6E822540;
	Mon, 23 Nov 2026 11:52:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Combine width_find_mask() and get_word_mask()
Date: Mon, 23 Nov 2026 11:52:05 +0000
Message-ID: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018073:EE_|SADPR19MB878900:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6cce453-bce9-4bad-6bdc-08df49583515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|23010399003|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|16102099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zS18SLawL1VVw9q1WV8pfqSQmYYjyW+B6TmrnrL26PtNGmgNeFgtnMrekqa1tyzC7gE3U+Oi2w5QwJG8kj25CRzHS9B0dfgD4qAB4GgvJOzoTXrPOdIr0ug8NY1jWbpVKcE44K0tusSvOEJa9RXPMwl1YLtsCMACaEa4Z00HWkHAPQPLz7njfLBnr7JFJzKxq/v2Di29ux8gfZ8Zc5sfbIormMmXsM8tsjE0Lz22mityZZl/ZpUYmayryKSidme/n6O5wZV1FQAJLNSNvCMrJ8Y9RwQJVBN0GEzS/Hf72UrQaSBoVlx/F349BHGtcoGilQGcb3ygT/CYyAaGWYg9dnZweylEiCaIXfQkeoq0WL05lI7Pmmw/107EPcgNuTXCCuQurzPiomlOONg6Ayjcy30MTN7rv3aniPN8WUfVLpBzQstppBR+E2lFXzYzT82eHc3MUFmW7QfeFuff4cDku3MrJxhPOVhCpJ4XjJ/0cy8qn8UiVs3DU5PZwkNCHCLLNkuB8mOlms2cQImSIMe6d7BOYDnxmDA/AUnIhidTxmb7LwNPFvX4+sVYA9ns9Cdq3R9gj/5OSnNtP2FpGv8vQl5xNkFqq0sof9kTOGkVr3Rd5xeFD/g1l1RMHPpDHYxtVHPoOACRZZ/K3491RZKW7uz2N8r7gy89KtEgyrKnzDJg2ByGyYgUE1w6njeDQc1F6X/HYvBiUW3MzwrF5MRILA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(16102099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xP38W+ik6dUQxSaZ0lB88nQnJGdsyxFESTVeBAv8Y9IiiwhBl6Ms7rfVpIOki6KwKBC+vk37bANlZIXYPevhLPEQZyXrFnRXZ3JG1wjrB3cTF/IKbnzZmTga4IZy7OwZ0UqyxMoRnrzYTyWb4D1ylNLNerIYH2i8FggHSetnC/LNkdMh5CSMqziwvItez8Xj+Eu4a83txotskdMSLfFC9z3u1rA9Z2bOBxVItOumeXmeizqi6V9RKGTJ9YYN8EqS91cl3GTbrr4r7Uhj6wNRwvw6PLem7KzUv5oO88sMl/TiL3L7B8PvCChwwkGfo3B3aM2MktsyRiNsXrVlXXuEgzlAXaGGfIRwlU0oggQjP2/GDbFMeymE8fNiaw0zuCW7gsfgDfc+aICQb76ErafZyCmR6A900ynZlvWNpBUXl+b55UFe1wx9R7iqq2arsKAv
X-Exchange-RoutingPolicyChecked:
	mQGZmwpx5Dx7N94uA9MgxiPFygQxsQXvoGMx2v6xUehEHOqLNkvadI6Nfl5yHLaHr/LUdpOzketKtDp7dFJBxSl2gt3HXlMaTfOwqFXgB3CUpNzVCQvoNIfcZuGhUEdR4xzNv6Ges+Nsd6DDkpqNnnY/0ipZwdVGXUrntAVtiC2gRYs8xudmxU8zS6Xr3SCia3MbK/RsAO15NlAhMbA3zE9RioygKyIC310styaS4DdYwJE1Qd7CHXRIbisfEJuEExmzjvaTnynTcxy5C/4ZJvN/Uiwo0EePYKkY3E1ohI4RTxYl3LTsEtRFdS9RjRncc95pi4YS4+jH9TsDrPcODA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:52:10.4312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cce453-bce9-4bad-6bdc-08df49583515
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SADPR19MB878900
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX2g8pVExjkUP4
 DzI5ZnXxN1OhbYya/qdOx0yhJV5szSnnz0JrBYmIvSKCMOMdsgiMrVwX2/PdAez1MHeSgBk43zx
 XJEQt3J1De+0KqxpojyfeWnq2T9CLOUMY35hVN0Zpt83dr/oMJRLekeRweu6c3GKBzzCgmf/W1N
 7DC+G147bYeRRf+KGVMElmsk0Adpn486CjeIoKPpCkZSoVHhugv7tih7GLkZgyLpOPhilQxNbVv
 1OPDYqjhMR4J9faPMVeroMG3+AP+bTKqmaQ6y0+6YuzR9nIjbsWRCZqj9XIhDCFKi3+4ipcbQYD
 2gxneBW65030oR+xRMvYykXETYgy9tsijD5qB5IbYXlWHEoG+BktBVVK6dBey0iOTTRz41Gl4Im
 YzpuJrD5tsKujYPLF1jCRie2o3NsZJjMRxE2xVOXV68/rSqZutLGZ3/On5N6PIY8yRnwpCcDoDl
 5PrRs6bkF69YbLY+u2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX1OZqRzOd7B9k
 m1+s+3M3flGCQ2zVSoBFKJ3a+3vE+io8K/PiClq1tEa8YBBid5ob1bomg0661AuodGQ9E90e7BJ
 5g+1HfElIE3m/Nhcb9ni78+i1ebizT8=
X-Proofpoint-ORIG-GUID: KYCn2SmBphS9Mqm2lMZua6V2OOistPBO
X-Proofpoint-GUID: KYCn2SmBphS9Mqm2lMZua6V2OOistPBO
X-Authority-Analysis: v=2.4 cv=Ze6IpcVA c=1 sm=1 tr=0 ts=6b0428ee cx=c_pps
 a=+R+biVznOuC0gx6e1UCQpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=7SvKvyaspKPp8k4-TicA:9
X-Proofpoint-Spam-Reason: safe

Both of these functions take a bit width and return the ALSA mask
bits for that width. Remove get_word_mask() and use width_find_mask()
in all cases.

As part of this the function is expanded with a few additional
formats. The big endian versions are added to the mask, for
the original dai driver users of width_find_mask() these would
be added by the ASoC core, however that isn't true when used for
ALSA constraint users of get_word_mask(). The 3LE versions are also
added as the memory size shouldn't be a factor once on the SoundWire
bus. Finally, support for the unsigned formats is removed relative
to get_word_mask(), these are not commonly used and the SoundWire
specification has no obvious mechanism to indicate if they are
supported. So better these are only added once a user comes forward.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 56 ++++++++++++--------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index aaa84156f20a8..d58be660ced7f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1214,19 +1214,28 @@ static u64 width_find_mask(unsigned int bits)
 {
 	switch (bits) {
 	case 0:
-		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
-		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
-		       SNDRV_PCM_FMTBIT_S32_LE;
+		return SNDRV_PCM_FMTBIT_S8 |
+		       SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
+		       SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE |
+		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S20_BE |
+		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE |
+		       SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
+		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |
+		       SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE;
 	case 8:
 		return SNDRV_PCM_FMTBIT_S8;
 	case 16:
-		return SNDRV_PCM_FMTBIT_S16_LE;
+		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE;
+	case 18:
+		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE;
 	case 20:
-		return SNDRV_PCM_FMTBIT_S20_LE;
+		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S20_BE |
+		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE;
 	case 24:
-		return SNDRV_PCM_FMTBIT_S24_LE;
+		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
+		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE;
 	case 32:
-		return SNDRV_PCM_FMTBIT_S32_LE;
+		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE;
 	default:
 		return 0;
 	}
@@ -1510,35 +1519,6 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
 	return 0;
 }
 
-static u64 get_word_mask(unsigned int width)
-{
-	switch (width) {
-	case 8:
-		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8;
-	case 16:
-		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
-		       SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE;
-	case 18:
-		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_U18_3LE |
-		       SNDRV_PCM_FMTBIT_S18_3BE | SNDRV_PCM_FMTBIT_U18_3BE;
-	case 20:
-		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_U20_LE |
-		       SNDRV_PCM_FMTBIT_S20_BE | SNDRV_PCM_FMTBIT_U20_BE |
-		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |
-		       SNDRV_PCM_FMTBIT_S20_3BE | SNDRV_PCM_FMTBIT_U20_3BE;
-	case 24:
-		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
-		       SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |
-		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |
-		       SNDRV_PCM_FMTBIT_S24_3BE | SNDRV_PCM_FMTBIT_U24_3BE;
-	case 32:
-		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
-		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE;
-	default:
-		return 0;
-	}
-}
-
 static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
 			  struct snd_pcm_substream *substream,
 			  u64 *word_mask, unsigned int *ch_mask)
@@ -1564,7 +1544,7 @@ static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
 
 		if (prop[i].num_words) {
 			for (j = 0; j < prop[i].num_words; j++)
-				*word_mask |= get_word_mask(prop[i].words[j]);
+				*word_mask |= width_find_mask(prop[i].words[j]);
 		} else {
 			unsigned int max = prop[i].max_word;
 
@@ -1572,7 +1552,7 @@ static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
 				max = 32;
 
 			for (j = MAX(1, prop[i].min_word); j <= max; j++)
-				*word_mask |= get_word_mask(j);
+				*word_mask |= width_find_mask(j);
 		}
 
 		/* Only handle the number of channels for constraints. */
-- 
2.47.3

