Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362013;
	b=rLDg/mvgNyY5BHY1F7IF+PDZ8cQWnnesMpqIXE4UoVX4LU5lYn7r5Ip+sVhqhgR2jT/U
	 jCFAj/TQm5SVsYp9SvOfal1Ydhg3MaUuAMjA9RJNT8lt8yVLRFBUCAPxCPfguuoLUbqP4
	 UZtkjP1EvKrMTGBfBtDnl89kveHSFcnh3boObWosAjI2mO1BtWOSz+GyUKGG1zGm9TA+E
	 2H0p8gNOiN612xMQeVWZYGCackv/6VKDbVNuAjv3IHRI/i+RqOhR6RynlSFpNQBSsFP9X
	 T4ilirmtaSxVVR7ZSgbL03sNXQXrjGpd0FK+axRdEIoG2do4NrEEjUAb/OdQZX0Jx3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hgaGmZzHWnYxSlWnx5ivJGd84guFgqYqv++oGXlt+wU=;
	b=AfIfzJasyRBxv+C/ITq6D8bWlYWvyVRS5nuc3+Wf1SRXnQPTvlfxmO9mdTt48aYf2iNv
	 p5Xnr3pAG8WMAmaX0hQJGXtdgv2e4o1ImU+EZ2HLATuHZEVZ0bn3Mw67zUif0OUamQQP6
	 9t4EtcrPlnUp8s9bq6f+18l5EfEW/XompxJerGC4+Tak8dBXTDySwMwocVoQwdIrZTJ1M
	 7b7zjVfz/c3+lchDBl+h+Kf2X7WqhC4noTHh8p8PHPo+IHCFua1+AL45A9ZqtFQJ2zKTT
	 zPTU2+myhjn5spSdhC4Cib45i7ujWQeVOpDbrCCft1N5mXfUmbV48uZqKruEv+aBwOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=h15TGZ2J;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pV0FyrqB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A82606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=h15TGZ2J;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pV0FyrqB
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB1icms309600;
	Tue, 10 Nov 2026 19:53:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=hgaGmZzHWnYxS
	lWnx5ivJGd84guFgqYqv++oGXlt+wU=; b=h15TGZ2JnwwsV4V9rxJQAotODTd90
	ZhvDAh2konqXcxMlMyNWgTHRo6z2+TSRk3u9IatauDs/LdEfOnE7zRpJhKJd7aHC
	bqY4zhGI+Dn8ym73LpyVy2HqDYdYKrN6KWRU4D3iJhjlSFKxk7IRa+qn59dcEy9G
	X7RGuYcNXyqtObgyGemGasyF5/jGCyDNWBETmKkundrvjJgPDwqMIj7tZuf+Kags
	BXFwiJkwx2J9QgkE1PijSZl3drU7Ee1a/03DU3j7062OC9U0NbistumVwKMtV8wF
	egZJiAAEnvqfsFvMttwBs62WAVG8ea7Css6noMfotfagJa+ciw+xEQo7w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygr1ed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 19:53:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7CHzXJxOaBzZEvQFZkF5ZnMmvOMHgSUGF1Wn5LFtJ3xGPHLf7By+x+KkZ3ZtHDakONcZeg/QxycMHEOIPIaE6zFcRSK1HKdvRY/8bVQEtzMjgpmiiAbTloeG8PhB9TB8on4bc6BVEHc9MRfLGmwekKafkmOQtBbq09BJyvUwBtQWMnBP2dh5SqIsnPTRf3pKZbovB9FqgMbko2DpiQXzExoI1nWYOICSXBC69mewWbUCoROAN4gMVe7VKcIgnGOIIMNfGk1tL5Yb9tmoP3YsPPUPwVfHZEzgbGKaiqFEBmFLmeXSE4EVxhYYjEN0BVQjrTN7QzHi+nGHmatO2PbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgaGmZzHWnYxSlWnx5ivJGd84guFgqYqv++oGXlt+wU=;
 b=eLeEe/ia+Jo+biuoTrSHNZ3dXzYC8k/A8yymLyD9N2CL5Ci7uKR/M0lWVE3j1qOJ9Ml+H4sDvO9ABq9HqAMSsHib27AQzmBly+AUTU+Ui0Bbc1mepGVDDrJ6ZSkD5wBgOevMCfbq8PmQ1RRSVHgVbhUL/mmWmz9LTkPwqk5x+J+Y3PxGX1bdnLa7k0YC8ZSq1lGvSB/mMNspMG6vLCdqKqWdvdU7x2cabeXHO0JUhFLFDGNGpJ8Hz/dN41klzejMtixdbDXKVrygilgz4n/c4Fy3cYacOakkwkXLjHyZ2WDMuJxjjzqgmZQFQmCJAuLhBw3uOx75TDwYzHlhRLbZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgaGmZzHWnYxSlWnx5ivJGd84guFgqYqv++oGXlt+wU=;
 b=pV0FyrqBvLarylhm/UtSDujQOPmSypXkHK7STo9L/2pAGQ1qacoTH1gsVGtNmmNkFl6hF3Uq5V3y855Zi56A97IUud5MAalmvcF7NC0Xi7lHl0Jd8Aq2a2tYePkXeUy+wrCrVzxusMQbjN/lqZQJhJSHn8OM8Sy+kq0i6PXMbJ4=
Received: from CH5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:1f4::12)
 by MN6PR10MB7443.namprd10.prod.outlook.com (2603:10b6:208:46f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 01:53:09 +0000
Received: from DS4PEPF000001BE.namprd21.prod.outlook.com
 (2603:10b6:610:1f4:cafe::4d) by CH5PR04CA0003.outlook.office365.com
 (2603:10b6:610:1f4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 01:53:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS4PEPF000001BE.mail.protection.outlook.com (10.167.23.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Wed, 11 Nov 2026 01:53:09 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 19:52:55 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 19:52:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 19:52:55 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.194])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AB1qpsM2956980;
	Tue, 10 Nov 2026 19:52:52 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: add TAS2573 register definitions header
Date: Wed, 11 Nov 2026 09:52:47 +0800
Message-ID: <20261111015247.139-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PEPF000001BE:EE_|MN6PR10MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: beb2ee20-f226-4eb8-afa1-08df3f96897b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|3023799007|13003099007|261021121427099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|261009223027099003|261022113327099003|261022105027099003|261021123027099003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	laJ7gtntyR8wI5FD/tAnegEz9iGxksw8eLzBzCxflJjTVSnk0FouGvbyLXTq413ho10SiyBP6tkKXLxlVTzuoWwoj6T57Z13BqXgz+REOv9qV3CXE8vnMpe7YesSf3gIb6XrGP/Ki/hiOMnwFzCOIdvw8K+G3x4CXrXQgBftrSVAShRsyG7wY2EXVHcpAJetLErnI6ZMsdoJNQqA1eq1rBqaxAh2XQzisEEQMuViaVqK8/8DEW9cvfNLkfnQqjeCXQAd3kaJ28RUjmaKieKzk4gJUIGW7FYDZxMA22WaZPNW35Y6OgajRoBqttFpuE8NWl904hULTGxoAH8eo8cV16kbjC2seo7R4/kEuvKgmshre+8e9TQEbONOzQKpSLKMHG3bXK5upY56SxMbFjLKm+YulINpJ4w8ylhRWX5O6na5sLbixi279n5TQiHg0RGAw7Qxy2DmCC9VUyKrg3F+Ss/6p5k7zv8442bD5VUslFeKeRewZj0p0nb71gzbHhqMaUbovy6ggZzw3XchRlqjSVXeOHE6CdedK1/1GcQLc7miwaAx/PxscQNtrs+swPXaerz29TOzhDabwOcyOVsvQad11nF3gLGnX4UhIuBqb9KAyXDNQfT9U0nTE7zUFnHG+JsOO6DV2S3mnVaeFUMTaA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(3023799007)(13003099007)(261021121427099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(261009223027099003)(261022113327099003)(261022105027099003)(261021123027099003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wQGcOe6E2smchiei0lmNXN4A1D+z5df3X/G9QhvDNj3EonSplPSivep8Z/h9EZXJuisv9g0S5zITWKskRRSmW/ljxzBdFN5AugRwMTL7X1SjpGWdAOvyLUjb1XegXzNnsYC8Mm27lmS3wpEVvpVa4u9yvvNF6XPl3Ct8b6qzB+DGRQ7p3rr9gat2oVZelJGe+0D5ohMxSzVPFo8L07u5B+OhMOEbAC7znC491vLNaRaVivlbxmrWB3382hKxSPQX4QJp1RGrsPtT9//0oLfDy8iXMHitjv+kePss+9YImP+CqD/YDXiezx48IBXRDDAtu/N/mTSoAjm5c0G/Ze9QE0smG860iYBz2QhJh6SISR1kpP4WOpScaBVLx003w5nucS+v6Ef2z0LeGyodXu1m38FYVPFEflTMQcukwi04xw7CA3rq5VA8nwvegQnvVcxt
X-Exchange-RoutingPolicyChecked:
	J5lGTuC5RTHHXrXN3L/ayNFuJ2orgSOpTcvLahWJlsn9KGAyuoPEBsB4lvx180+Tn94tv6dMsIRLUMX3SWVfLmV7ce0LC9F1yusGMFC4XnN0wEp3v76YYzAvjoLWBJQ2hKld2jbLlg5LmRxU0uZ50BSslYcg55RYIyelqKDoIuCGKvSOnviBdPO+uDuO1eDh2Rs+TuV6PjVFmjtzbbyGPdCAeKOD4H40QUi/y7+ccNLlEw1fu+k/eGni0C8QvpxUh6n4912NXPF5A2JzYqlbupPUl3ot/jnqcNLC6ocEl5fdrPN+B3Cx4Basf0o6an6738ZgF8ecOT1AjHSzYhljLw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:53:09.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb2ee20-f226-4eb8-afa1-08df3f96897b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS4PEPF000001BE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7443
X-Proofpoint-GUID: ZcT0GBfhDZrEW4CrX1yQf5yznz9hrCJj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwNyBTYWx0ZWRfX7ni7R8EN7FEN
 iuWCjmxL5vhAap9KH5FHM8dDWzmWNesADoK4vfcmngB5lQAJFBYXdC5vHbbiauV8+BRmhZnCkXi
 ZHsookpuaRTatVnEOEhFJUj97SEOHrg=
X-Proofpoint-ORIG-GUID: ZcT0GBfhDZrEW4CrX1yQf5yznz9hrCJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwNyBTYWx0ZWRfX34kBYBZ71eNU
 C82S1N5cvLURPsiW8Tl33jToap06KXY8Vz8NfkBGSRP+04Ih40B4dSPJVqjlx4TpA05YErhVcps
 m8lU7qfZSA1V9VRQCh9qsN9krALXvMtVlrEQNWKC/Srm+lpH2cs8fhrMUxqaB0gQe3mt9vxPkyo
 FvihIqo/TuDdQZ0/2tkY4dm/Dhl3IDZ5XQoekLOXMFrBdqXwKxOa7d5UxQnhcL2OXxC8RnFWmD+
 U1k1rrSeasYXOKIe/KZ/4MI9r9hH3WIjdYskWokZkOwVxsEALMO+f2/yAyk9eVVfjoYM/0rxvMc
 FKLq48WKgVF4uFspJorXQUBoOYqxhKGZP/GhA2cybx8Fn9UpgZUXZe+VPHQduWXx2EWNhMxPUPn
 rPaiUDTLyPYalMpEqGR5LFIMHCKq+gsYXkJ5koQnSVo8bTg6aN2P4h3wzbJ5I06ZsKDklEhRd2p
 XirzVFav8rMx9/fyfnQ==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af3ca88 cx=c_pps
 a=IF27h1RdCV0SK+IF5nJR9Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=ad0uDRrTnvQxy5z28i8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110007

The TAS2573 register definitions are currently mixed into
include/sound/tas2781.h together with the TAS2781 and TAS2563 definitions,
which makes it difficult to tell which amplifier a given register belongs
to and causes the header to grow with every new device.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
v1:
 - Move the TAS2573 specific registers into a dedicated
   include/sound/tas2573-reg.h
 - Add the registers required by speaker calibration (FCT) and real time
   speaker protection: TDM detection, coil temperature, excursion and
   thermal gain, and the A1/A2 output registers.
---
 include/sound/tas2573-reg.h    | 52 ++++++++++++++++++++++++++++++++++
 include/sound/tas2781.h        | 24 ----------------
 sound/soc/codecs/tas2781-i2c.c |  1 +
 3 files changed, 53 insertions(+), 24 deletions(-)
 create mode 100644 include/sound/tas2573-reg.h

diff --git a/include/sound/tas2573-reg.h b/include/sound/tas2573-reg.h
new file mode 100644
index 000000000..02c9a2fcc
--- /dev/null
+++ b/include/sound/tas2573-reg.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
+//
+// Copyright (C) 2026 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// Register definitions for the TAS2573 Audio Smart Amplifier, used by the
+// speaker calibration (FCT) and real-time speaker protection data.
+//
+// Author: Shenghao Ding <shenghao-ding@ti.com>
+//
+
+#ifndef __TAS2573_REG_H__
+#define __TAS2573_REG_H__
+
+#define TAS2573_TDM_DET_REG		TASDEVICE_REG(0x00, 0x00, 0x14)
+#define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
+/* YM57 */
+#define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
+/* YM58 */
+#define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
+/* YM59 */
+#define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
+/* YM61 */
+#define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
+/* YM64 */
+#define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
+/* YM147 */
+#define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
+/* YM148 */
+#define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
+/* YM510 */
+#define TAS2573_SPK_COIL_TEMPERATURE	TASDEVICE_REG(0x00, 0x75, 0x08)
+/* YM664 */
+#define TAS2573_RE_OUT			TASDEVICE_REG(0x00, 0x7A, 0x18)
+/* YM694 */
+#define TAS2573_A1_OUT			TASDEVICE_REG(0x00, 0x7B, 0x18)
+/* YM695 */
+#define TAS2573_A2_OUT			TASDEVICE_REG(0x00, 0x7B, 0x1C)
+/* YM793 */
+#define TAS2573_EXCURSION_GAIN		TASDEVICE_REG(0x00, 0x7E, 0x3C)
+/* YM800 */
+#define TAS2573_THERMAL_GAIN		TASDEVICE_REG(0x00, 0x7E, 0x58)
+/* YM952 */
+#define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
+/* YM954 */
+#define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
+/* YM955 */
+#define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
+
+#endif
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index f42752263..8d2621f9d 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -98,30 +98,6 @@
 /* prm_TE_1_Beta1 */
 #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 
-#define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
-/* YM57 */
-#define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
-/* YM58 */
-#define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
-/* YM59 */
-#define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
-/* YM61 */
-#define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
-/* YM64 */
-#define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
-/* YM147 */
-#define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
-/* YM148 */
-#define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
-/* YM664 */
-#define TAS2573_RE_OUT			TASDEVICE_REG(0x00, 0x7A, 0x18)
-/* YM952 */
-#define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
-/* YM954 */
-#define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
-/* YM955 */
-#define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
-
 #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
 #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
 #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 995bfd52f..2c8a03bb8 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -33,6 +33,7 @@
 #include <sound/tlv.h>
 #include <sound/tas2x20-tlv.h>
 #include <sound/tas2563-tlv.h>
+#include <sound/tas2573-reg.h>
 #include <sound/tas2781-tlv.h>
 #include <sound/tas5825-tlv.h>
 #include <linux/unaligned.h>
-- 
2.53.0

