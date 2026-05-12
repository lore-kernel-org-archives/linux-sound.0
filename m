Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526F44BCADE;
	Tue, 12 May 2026 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584407; cv=fail; b=eR0VDW7rGfrhT6uO8aeeCw/HkMoi+HDy7ai0duHQjwiwm5M3o9hGqwDOBzRuQXgE5QNEI+Xx7/H+YPzQVKQQ/kI0QFUnK4RAv7RDdoZKXjieJwCsiWDAjlUM/LHV4U1ukt4RBlK6giYAZ8iTTvw1BKQ2KPoZDI3dhN/+9dLsO5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584407; c=relaxed/simple;
	bh=HlES79ZI5yy/DMH6WeQDmsWFexrer65cdWXAmmaY87w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NzqyEetaktBr3imGu4uCaxqbVzXoEV2UGiBDK1+lYYq0NGhYjYDNMOBF5w2BW+KWWsGGMPFLlNeDQylPtgQ4ZN7y3rBLqvqL8IxoSGx5CDRunIVNTp60QnEyoat9vaMMYoDgTkv9KBVRXLx1f0POTs1H/QGRRMafIWrM3LEQnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Fu0hLzgo; arc=fail smtp.client-ip=40.107.209.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fu0hLzgo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+Me0rljjNRefFBjTHtW0FZzhuwR67kbAIFfvc3kovyJeR3lqt2li2W73ERLbh4RZ8VKoz4IhlAZ5I/pWV+geqLc0Qdxhuw6+o8j9HEKRUrfE/xb628VRWFPfuvLAJsPmBOWnD9Swt7138dYb3hsfYd1h2r1m04pJjiAU8xdpXFr17yYh4ePxQhLP9Mv6QdlurTSkk1cfYhgRqOf+Yr8xitRqXHnbwNhAodMgd0MWOygOcaFGi8qRJ3AaYYxNV64XD7aZL1BtlK9mHof3wcJDTEhuG9xvXn10p9goHJCRgJMZBh1PJEm2EtMte32zR6JH/0Ekmdwe+mak3bylxDcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlES79ZI5yy/DMH6WeQDmsWFexrer65cdWXAmmaY87w=;
 b=RmkG9Ws2b44y5sJ9D+X48ISbPQOj9+HeScg9ButtkHUyPrRG/M4eIPqetathMDXK4MOXH/q9fdbUG9N0yj6mqnhGrHLyJVoRqxUwz9+HYilxnOoVshcwluPE3pqtgegDqAGvGSfQ4ec5OMFcuy4Ep2cWdxSLWj3YdthEZYOx88dkHTL6fp4zn3+A3f7dvNhHbFEjkDMNrfYvG/Kzc7WqvCYQtv97aA/didsbEV1BzoUlZl/79WI02EImky3ZG+nAU8y8KGPrMhctIDooZSASwCUvU6mAGcxpHUS+lUTY2P3sQ+a5/5wkvS8llyfqSLlDJY0OeHE+cWHXtRzT3xcVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlES79ZI5yy/DMH6WeQDmsWFexrer65cdWXAmmaY87w=;
 b=Fu0hLzgoEXy6c46uO/3CZW0ZOrbrqkw2uTrKuaWVtKe0iNXwy2QzJe2DjE9pMbnPo0qZZqvXoMQa6zdkParDcTKH7hzx69zdhPXChpSBybLh6iyK0A8OpEBZHzkuJIKwX6SPa18kcSixdT+6OgxEC3xHTwOgFDlVmJE1a7uDbUM=
Received: from PH7PR10CA0005.namprd10.prod.outlook.com (2603:10b6:510:23d::11)
 by CY8PR10MB7122.namprd10.prod.outlook.com (2603:10b6:930:70::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 11:13:16 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::94) by PH7PR10CA0005.outlook.office365.com
 (2603:10b6:510:23d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 11:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 11:13:16 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 06:13:15 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 06:13:15 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.037; Tue, 12 May 2026 06:13:15 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>, "oder_chiou@realtek.com"
	<oder_chiou@realtek.com>, "jack.yu@realtek.com" <jack.yu@realtek.com>,
	"shumingf@realtek.com" <shumingf@realtek.com>, "Ding, Shenghao"
	<shenghao-ding@ti.com>, "vkoul@kernel.org" <vkoul@kernel.org>, "Lu, Kevin"
	<kevin-lu@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: RE: [PATCH v3 00/18] Add a new SoundWire enumeration helper
Thread-Topic: [PATCH v3 00/18] Add a new SoundWire enumeration helper
Thread-Index: AQHc4fgkLGLNTse/RkafMXj67dWYqLYKObNg
Date: Tue, 12 May 2026 11:13:15 +0000
Message-ID: <03d209d9d1014c0c927e971d47e32dd3@ti.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|CY8PR10MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 249e5bb5-814f-4def-8657-08deb0177708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	va0ZsVM0Rl0dk2E3FnyUusKk4/fyLLbeYLxFIPoJcT6/a0Ele/ugiU7f9iaYkX1vBMXCYeqWjJwGLNvu4LteCWSYq49yJ9V51vlig75fBUrj4915e+KL9B8wsKVhg0kprn10FxHSxjYRjgt+ERKmh1AP8uRhno/7LOny9exlClWDgp+qcWe5IaKlM+5+YxIhCJAq+NQby6MmiRRHb9w3El56cMixY0hexfGRZulK4Gmug1VcbZJeeVaAKDLWRDmGEBCIiSJQuMCNp2GgoZktCTHmhcfpBmiBcm75rD9GPxCnrS63JJWpC/AcF4dW7yr++386PKDprJE8s35z01wze3jjViSjLfMGhk7hljQvmSn3hcp1eivcCFF6hAzl0yNw/S/ISvTBwPbD3O6ek2jUbbKQXWZ2hlHaXtIIr3Pil9A93xGB+q4tPnqfINM2cVaCpCSnPWUaTFIZFc16cI1LK37L3zbhe1yxCEG4qYRFTaZMH2Ubq4xlxQHj5WCc0wAFZLt0dN7IzooOIspdFKXxdm0e30WD0jPxNShK9+QW7gFr8yuiUCZKO17iE+GYiEMMktM0qgjzCg4cqLl6oD031z7CU0h41SLyeiikO3TG6TcbzTNvBgsD83hHD1EjVjtjpPwkL1Cuu+Ey2l3/M/yjVAADt5con4TtCJV5+cAGCCHPSyyl9MuoGyCPt5kBH9iDySGqgJprwftQxyD6g9R/cSbO8eq/HGARIxoSd+9Jf6g=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5r5rpdGgbQRKe9SJwRWyVs1cnbv8jOoTuaqaDCoQGN15/EnGo6GEcWhWSVs5RuDf/f//G77QraMmt4NR6010ID8f7JdGOFE9HYgQnVnyOEWX6N3OvYL8/yB7QrjC4MTQzkOMvhXtoHo0D1e4jhGskPYHbj/nHXiQO/7Jm5IgvP2HybQ2WdMGOB9SGgSLBO8yjYX5ojOPzGAI1YlADVuCGb6OL4uKg8+gx79IG8B9ykMCTJwWQ+6DeFmH+4LT5rRzHqd9+oFE9GEfH41hy63/6F9ieo5ZbjUmEvFaJjUvVGaSavCciMkz/xy1GDwB9hWKPOSCACozVxTFPv2zfRndxWvvsxpkxvCcffmI6vX/Mf2sxKaQ0RYeK0txBQSjdgIEcPfX65xsl5SRzS1dnlsu7cziWI7t6W3Xeu7YacDUIMspk9dQza1L2nQ2aIcZezYi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:13:16.0085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 249e5bb5-814f-4def-8657-08deb0177708
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7122

> On 15:44-20260512, Charles Keepax wrote:
> Subject: [PATCH v3 00/18] Add a new SoundWire enumeration helper
>=20
> Add a new SoundWire enumeration helper function, many drivers have
> almost identical code in runtime resume so it makes sense to move this
> to the core.
>
Last week we merged new driver tac5xx2-sdw.c=20
Should this series include the change as well ? If not, I can add a new pat=
ch once this series is merged.=20

Regards,
Niranjan
