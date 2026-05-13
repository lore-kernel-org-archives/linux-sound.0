Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55531A680A;
	Wed, 13 May 2026 01:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636746; cv=fail; b=nzf8IKHrIDWN7e9Mr7r2qziJcs9kNATTwvRPdyhZUWbyDCbbRZr9et9ExP2WEGZ7vpWBXAWNm/q948XYkw6TvkEGVLoHS7bxS4EOmrGgKTUyqIbRbpqp671stIXZADbAFoPlBL9DMIkXOAZ8+dYoHMloRkvej+DJXkOfnEcfgWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636746; c=relaxed/simple;
	bh=ta511nkAH57kkPj3zT8uQnS4BydmTcecv3wNQz2vUn8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ApmdpHxeloD5OQ1+kq4+teHo+0l7xHr4WXLEhviBAX2UW0rSMYd21rvGmjDgbIHhxNiJEzxo602kJV962MXydY11MXrOSuWywj9Y++SACs/onjgpuATPgaAiLr2Ag/YfyXCqbJN9l8SlUsgHyjzsefU2zosG+O1AGliviJLsHY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mCLNqJ+Q; arc=fail smtp.client-ip=52.101.57.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mCLNqJ+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aND04WdPXUNuMor1lVbbM9BIxj3q4WKxAruamowTttfQtKHYNwtRkLquxCyFgmHZ+1H3AGH6h8Uj3Sb4kwgiEuLAbA6yfTDRI7fnLSk1hQ00gnU1BSWsnudEaFHar7/JwwVzdNeR+isVyholDnSAyRfcJtmc4gY7elykRBam1BkhfoNVuYyzXzObKpGKVxoRKN8bz8PZBukpVS2ISlb0ZwdCNTtIDrr2l6TNIXiESrqErEz2Ye0BUczzdrN9gs800wZP/ZjdgEZIkjMBjyx4VZuIC69H+imMR/Z8iB7zwjd+OgRq0OfZC0QodgbC+OoX2kjNOiyoJz0odd8JQQHMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta511nkAH57kkPj3zT8uQnS4BydmTcecv3wNQz2vUn8=;
 b=e+GAKp6H9DC8DV0HZciY0sf4qyU/bWbC7YKZXxm2NKg56RpqtB5/vpXIRKo9J/sAjEuzJMcd3p8yAfZqWcP8OAxlNT4W6/6JMbP4wv0Ku6Hw3w2u42hyYKbB6rrU8iXKqF0iJUMwOsfXZ8HzsAE99cpnhibi5V33/uYDKpGasxUtaNfyjX10vrVm9vrlWDA5qgKzQ9Z4LwCS0zNgKCEsYiK1Du5ztFsqLB/otTIN4rubDsvSlPKeBJMUKfidonOBZKOGDH9T5ImIX5sklweo+u3btrJm/ONqjLcQCgb35/DNL2/pwoWA7kyr2NwnoP/EqRNL5VpIvjbBLkuRormN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta511nkAH57kkPj3zT8uQnS4BydmTcecv3wNQz2vUn8=;
 b=mCLNqJ+Qfq247iwYzZTLdKBwwOdE+de2xqEFyMi55RWSSWgchhY14KYiWVGf/OQHKzyJX2OTAx96kahamcXP4xL7pH9zaF6J4P6+xovauOTriupL9lXbIadPW1nSzuKr1ps3R0I8asacEQeou2bwRkHMIu5dJc57AcMTRMbvyoY=
Received: from SN7PR04CA0220.namprd04.prod.outlook.com (2603:10b6:806:127::15)
 by BY5PR10MB4148.namprd10.prod.outlook.com (2603:10b6:a03:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 01:45:38 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::ee) by SN7PR04CA0220.outlook.office365.com
 (2603:10b6:806:127::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Wed,
 13 May 2026 01:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 01:45:38 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 20:45:38 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 20:45:37 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.037; Tue, 12 May 2026 20:45:37 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "ckeepax@opensource.cirrus.com"
	<ckeepax@opensource.cirrus.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Xu,
 Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"Kasargod, Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: RE: [PATCH v1] ASoC: sdw_utils: Remove dead code in
 asoc_sdw_ti_add_tac5xx2_routes()
Thread-Topic: [PATCH v1] ASoC: sdw_utils: Remove dead code in
 asoc_sdw_ti_add_tac5xx2_routes()
Thread-Index: AQHc4gYY34iPUTPeSESbNpq7AoFxHbYLLa/g
Date: Wed, 13 May 2026 01:45:37 +0000
Message-ID: <86665ff79b244f6bb33008f822ea51eb@ti.com>
References: <20260512115423.2341-1-niranjan.hy@ti.com>
In-Reply-To: <20260512115423.2341-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|BY5PR10MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: 0671d114-9479-4986-372a-08deb091556b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8yemN/oYgNuacwy+xJacF/XzWnHhaoWEq5+F1v5V5uagH2yNQB0BRFVBlzaHM4hCLpTsIbtM1nyOUXiDdALWJGAH6IjhZTSwvm+tYel4WAM73yiluVFfM+QnHGQ8hFTCI0kH4UZsOg/JVFCTkKh2s1ZaAwHFOyXX85DnnBJWOW1OKCJu54r+WdCqDmEn4qiQHavjOeIGwqkTt2AJwBzJDkpahM++kzuUmwbkBHPt+DcWWs2fxRf1YzCUT+iyIAfFqEAdXD+Vd5V8iVVNB7rSG5edj7jVCJs/OLCV+YVRcahKAy6vE3trS5zKxGXSH5uKIq/wSuhtS5pYanhBKo2jKg2/PVsgb/ikZ67XGVZ5T6U6SQwKixK5nS8orCiLIw4MQRAo6hXPu/SaGNthZZ9z56cz9j31WWDub9NJX5bimO+qSTxgCZptwUkwgUvz7aqTAbB/ypkeIR66Pg/3C67/meUrqSgZUmJDmK8RzbZBopVa8ILl5W4mmm28QQYD8vi9zD3jZMfvueN5qslFYG74X6K+Hgdu0Z2yTR+jBwILGyVCWtCTgni6HCR+ImSYEJarzkqWUXm481uVbiNep2s478zKiI+j6wSbpDkNDfyof2kSAW9UKyzTozdSwNBgXj1vNrysiy41N6wwYOLtVVDEq8x6L7JmYIGnStgKxOZzMjP2LjsqT9CXzhxJbxvr4Oi+ZDv2kFTauKQj3sifI2r9tsxstmPEq2WeA/cUCNvbsi0=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hB5esjO/q10DsKcabphG/faa7luDKKfAHcnowc8NcnbYb3W1AotXgnZD6l8g22l5QLkIu1lXS6Vy40LOPHUB7iLGO6bg0bVWrtE0wUPW8V/te5cbCQ+QjKJKNvjgmRXemtnqyEcJndTE5IUD6Elgh5ZroJMpPyKlHWiPLerfckI5VA/9xrtJbQZjkJwZP8Knslo8ty8qavsxIsm1ZH2BK55pYHUwwSwInGfaLHbTEVAIl+5AuEoaBcjx0KkY39fm8J+AuSxvDe0I15WybAz+Vdnco7SK8fdm4nJL+abR0RIMYLgTMNUro4T+kua3nyiVkqNd0p1hKmToLirpnDhdnmw9JhQcPBqDTotBqPpE/zT30L4N7I9rDgrXTDLJiWughSyNec1v//nfhtTw2SjGhKkQ+HlZSBRhEMPheaMAQp/1VRXFRzgPjSIIqRLeGujt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 01:45:38.2344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0671d114-9479-4986-372a-08deb091556b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4148

> On 17:24-20260512, Holalu Yogendra, Niranjan wrote:
> Subject: [PATCH v1] ASoC: sdw_utils: Remove dead code in asoc_sdw_ti_add_=
tac5xx2_routes()

>=20
> Fixes: e812de61e9a0 ("ASoC: sdw_utils: TI amp utility for tac5xx2 family"=
)
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

The email id no longer works.
I will update the commit message send one more patch.

Regards
Niranjan
