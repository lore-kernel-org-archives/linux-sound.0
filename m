Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692132;
	b=hrlAC5gcO9c+ijOqbDheHy6JpOZoXUwuCUwqmPMi+FbWYsIpxAuy3IqRSydkxJcI5I7u
	 8N9csn2x+7rvptpjk8Ela3yWGweannd3yWu2NQxclIvPP1m0JSypFAH3RNTDi+fYz+0h8
	 zwYtGkhNJjYlqnXSARyYS/sRkn0ijyH6HJHYwkuQt4xfGxvRZ8ouXvgCOQwY235astpwB
	 32kPJxmHvZhvd5p3tHQI3CqZTmMWqY2WIJg39bHpYcC5+lE0Fa8BuWudioUSDp/RF3XZN
	 IuLOrLopgzlTgaBDHeok53/U63DimnaEqNAPnzuCzed2yPA/HnedzGfNa3oHV3F8PLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJifhJIei3UTJ8f0/7WiQm8Fkid1IihUkYbDjuCEVbQ=;
	b=cuuz9D0wKonq3sVEGG/DS2npRVAgKNs1O7+t+Rl4nlhBax8RtnapBkxzo9wUXrnpcSTx
	 2IPxmkiRI+6HzuSF4AC3h3L2BcIt+pIpjbh6RONVcjIb+INjvP82fwNopPEeY4YjWmouy
	 nVDe4TBZebiKpP/ZAmFekWULQjSUzO+EZYkXL41ZTnMNFMBKcwGL954QMAHdYa8jkSgpz
	 s5wDWPCoOv+fffaO2DczPQvYzMJ9O1nqLcl4Hzjq8HZMdd/HCILLchKO1yIAHa8uy+hOL
	 NpoJ5K1sNCSghxe1ynpofn7yzU7yNdbUrcHOg+tjNQf1zTgiZAHyfRMRyVp219KrqqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=TMANDJnA;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=DFFrzfPo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DB606A32C;
	Thu, 26 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B23DB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=TMANDJnA;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=DFFrzfPo
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAZgAl3001943;
	Thu, 26 Nov 2026 05:21:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OJifhJIei3UTJ8f0/7WiQm8Fkid1IihUkYbDjuCEV
	bQ=; b=TMANDJnAdC/I8Sv+/wvxqZ0oNWwZomCzPMVye57HRf7eeNfv+P4SgYLCK
	f9Eaj2q3s1bs5NLmv+rwrtmvY0TX0ybsCUo1Rr4HP9FOQmCF96SSIJj7uMdwo5OJ
	cTRDfhL/dcr+x9dxxboWSokbuYlRCLreOR5ZKIz3FI0QYbc9q1m7x4Rl18I2XiS2
	tQ9qC/6YzFtF5KotE6Xr7xxkOCfzt//hJVuQHTS5bsaAqfMwKSFa3JdDG8pumefR
	uXnHHkLkscti/46LXVDOwFV+WmOIiS5E5CEuIwFdV8mBbMZOMvjjIjFgru5Kx/SE
	+fyXrfr6UWiYl9zTY+PqMMTFWNTWQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j6eq9sp1w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 05:21:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZXa6f6/hsMoyo+s9ynyCZs597E6v5oD1qeZP9vatL+ihatyChYNw3HaGuq4/DCDBYcMeZZAynpNyGTWclHP38e0VTlyXDxCHrJyekxUlB4ynqdCnCbIIAz4GzP8kH3gn237qnEuC+rUmHV8FTztkyzflmK4WNUdgObiLbu7mkK1lke+9J/MzsEARxlnFU7y+TPaSA8gkV4gGhmoGQMUnlXmWvh6Uv6CSTRIJp+44zb4ju/ghuBfbPamOVQQCBaK7lyMbXIgnVMzLolNdhds43y6mGUy8P4l1TcEV+lMrYyDCM3HU9JdkxKRO41hZTfbV9avNflRvAG9vNA12nbDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJifhJIei3UTJ8f0/7WiQm8Fkid1IihUkYbDjuCEVbQ=;
 b=N2N/RFnVziEMmcs7bf5L12U9RHmkOnSzg1rMcIIOPEqXWeCG6+x2hEEj1wMaPNtng/+dsB498buQN0OkZLtdx9TXZ8kLSYkPUYa0K2sK0PdY8u9YkdhmPSaNk1one8z+Y59J9V3eD26icYLgP/k3rKJcjsIS+dZoCWooFy6vmo4oPPd88omXRBaJp0fzHo71vlfPAtQnbcHe5uydv+vAMPyLTMNIe9XSAOXuaSbbisOiJuj9Tpa8TUCT7e+UbU99maew0We21H7rhj5vyvghggSQgACONr54t7Q6H5F7KhUplMeqTSpX1OOCDUJ2kJsqgXQ0/GljaXv35JAsgffc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJifhJIei3UTJ8f0/7WiQm8Fkid1IihUkYbDjuCEVbQ=;
 b=DFFrzfPoVdtL9azHwR8bfPt8d+2+5l7vLLdxXrcWGO4mF7yfkj0cyiSyIHPNvEr9pNjIx3+KU32Geq9jb89pWFGDtbe7hi2Dbi6tmK7f3ncEm8karVPLoxB/mrrpc8zpzYG2FrmMl6JC8Y6g5lJcBcGwjrdt7f7fKGHt6R/n25A=
Received: from SJ0PR03CA0198.namprd03.prod.outlook.com (2603:10b6:a03:2ef::23)
 by SA2PR10MB4570.namprd10.prod.outlook.com (2603:10b6:806:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 11:21:29 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a9) by SJ0PR03CA0198.outlook.office365.com
 (2603:10b6:a03:2ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Thu,
 26 Nov 2026 11:21:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:21:28 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:12 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 05:21:12 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.250.64.62])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AQBKwHV1596498;
	Thu, 26 Nov 2026 05:21:08 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 3/5] ASoC: tac5xx2-sdw: correct default volume registers
Date: Thu, 26 Nov 2026 20:20:21 +0900
Message-ID: <20261126112023.29054-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20261126112023.29054-1-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SA2PR10MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb95b54-a9c9-4640-8496-08df4baf6a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|23010399003|261026121527099003|10067099003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eWA3lUVNWuy1lSyGoD721eJ5ryGdKBX1V03XjN1lEc5SIStYDHk9G7OYCJ34PxpEQIRk36hhhZ2/HbwCOjtrpJPd0b8+If0LaKbG579eIsBPWcaxXOom4JAGMtWtfedqa4pRTJSqJAz/KmOmOD9spRj/wDa55HNeA6QmUVrPb5hp6yVowsoYGsQyayCVkwM84n7TjNtUtmlj881rVZYpcrO8e99+Hni73XTLfOhuTWQ0+C76PjJxh1/1qQuhnWnnprsskvFR64uYNKpNqLo6Ny25VQR6rcH4xAQ8ENlC4h0Lc698Kuqpy3Y2kyqgV8Gb/uHMiiIExl6oeq9/5TaK2GXmc8PQ+SXeJNPMzsexKTVwsAHXDkT6VDpKYjySURjZnaKt91SU3RYFRFCUeha+IBfXpqwvjntEopJ2K5dzkS3OKj+8HM8qmbzle661MTgSdoWpGi50D3GDLQZ3CKUDc0B2aHd/JiYFQw+woeJA6dY/0oPS560C/17LrI9DzvchLsoZtsOwwhSXh5IgyvGcM6Gx5OxeCo82fswRWzTOPgb3BR8ztr2zvygn9+8RGHeQhg1rzHsX1EO5GpAIM3O9XIVOEkXOrwPoyhBhcUb6X4gL9xqHSC6Jc/fBzJ1TLzT5bMxFFZEyzRXtl1lQX01RS6R2XElDc/IFxUroJIVRf1d5Orww5rtoip9qRmmI2qI6ifZOUZeIpxNFDOft8W4hTw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(23010399003)(261026121527099003)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0XbJUUqdjzoUF7m0FiA62c4DnVhQ1nPKg8wb4c45YyHJlm+3+FWzri4T8+B5Xc2Cy1KY6lEHH0pk2hgXQ/AswrnYs/XOXSk7dXusJLQDcJPc6kievWOw1OBsPjz+FMDBUgCnMo+W2fT34350aYni2oHvgJUt9JLDDg2XsC/udTsIjc2tNq3qqe/+e0Oy9ILWLO+ZMiyTjFaZ9dXlTda+5b3eTv8le1PCf3cuGoDfPifEyo+jEcXgS5ZbIYHLF273FMF6fXr0XbcbiOiSwf2klR5gEqwpuWMZUMeacnTGL2PO+LkFXxhbtd+2VYMJ63bDHvEQnQxbNZzERB+HJ8wEAApuwiK6jZUdb0ilROauNFYIVnVZ8W/OOUHFdlIy7MWiokPCUCB4bukIsjf4/o9FrPms4WpDT7ML8P8NiR9LEZ6wDMBZ0+x2+g3uyNa6VRlk
X-Exchange-RoutingPolicyChecked:
	NhCROP9wxt0e6fcffXZEArWIg3Evxseq93G3YHSgwiaEjUtMguUL25ntiRCoMkl4/ALZI1G2KnMujkUdZUXZacvc+K8wgGN9wCFOMR2UZ3b2meTpyvPXjjWaHTyMkJNJZiXyjqsALREBHPpX0fsbszTvEvFwwJFOp1Bovuyqe9Sv2RnhChe/l43iIRxdMMrG28Yq+q5VPdYbVyBvwrTczjdw9U8j9BMOaFySG8yrlTbRzZLVXL0PPf+fTHUu62UAx66an2f2Iap87LjKxiB9aL/ZcuZ296vB96X6dSNms2gYmcl/P2RL1ML8gKa8JQ3m8AdaMmcYg/wPNExYJdi7zw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:21:28.1227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb95b54-a9c9-4640-8496-08df4baf6a2b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4570
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX1PD1FwkcsgPm
 QsXJ/sEj2aZxICIFrdWrSOy6N9GA1b+3EQHN2i/Jvc2R/6JzVPNxp6wFg+nvJZ8Pywl67iQU2Fk
 gauJS3y62YB3gY9uHvO1TPh8KzjnRIk=
X-Proofpoint-GUID: n_X3FT8BNXAzyC_qUdimbdsIMX6FbIO7
X-Proofpoint-ORIG-GUID: n_X3FT8BNXAzyC_qUdimbdsIMX6FbIO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX4Ys1p6WgzBUO
 Cc/FjNeboLlUq1RCeIQcz9besl9EIZsPJQPLoUMzdbjyCqCXkXNmTWPkqlOGYT1gf2A19d1RYq4
 ruEWYU4AVSgc3P0rlwKFC8KAbHc2DD2K8oo5bydUq32gXPoHLZdwl2z2TdBiZVXczAqGp/bFxP3
 o9C79nhFYHA1rpw0HQj+fDCrAJrvxWEC85/MeWP8Zvi3olVwdw82q/7gDAJpp4VJHR3jtQijJVT
 zYFgJZWxY8nsSsweCyUQWj2YVr+6Ybd0iGeKysp7EQ/s/6OVx+SxchAdAoVFDT7NvsJAd6Ub6dZ
 NakzvsDIDYHmHgW87NNz3k7mvy2mcGiv0Ejrx76Mj5NEtP4JDnXqx3jpSzf0xHN/wi7OYahfnhe
 Nsqfsnilxch8T7g5beVIlc/n1Mw2XDwK5hMd0+2JS3Jyxvg2nHzdeQBRw1/bDZaWdzUNGRomt7Z
 Wn8eLz5IKcbnK+9DfYQ==
X-Authority-Analysis: v=2.4 cv=d7JgWhjE c=1 sm=1 tr=0 ts=6b08163d cx=c_pps
 a=ZmKEHIpmlwdLtedhitE7eQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=Vf5avkMolfsAJgnvhggA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260044

  The volume doesn't get correctly updated when the
volume in the mixer controls are updated to their default
values as the regmap cache will not do HW write leading
to unexpected behaviour. So correct them with the hardware
defaults.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
changes since v1:
* newly added patch

 sound/soc/codecs/tac5xx2-sdw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index a541f95e4..1cea864a2 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -401,6 +401,8 @@ static const struct reg_default tac_reg_default[] = {
 	{TAC_USAGE_REG(SM, OT113), 0x0},
 	{TAC_MUTE_REG(SM, FU113, LEFT), 0x1},
 	{TAC_MUTE_REG(SM, FU113, RIGHT), 0x1},
+	{TAC_VOLUME_REG(SM, FU113, LEFT), 0x9c00},
+	{TAC_VOLUME_REG(SM, FU113, RIGHT), 0x9c00},
 	{TAC_GAIN_REG(SM, FU113, LEFT), 0x0},
 	{TAC_GAIN_REG(SM, FU113, RIGHT), 0x0},
 	{TAC_MUTE_REG(SM, FU11,  LEFT), 0x1},
@@ -417,11 +419,11 @@ static const struct reg_default tac_reg_default[] = {
 	{TAC_USAGE_REG(UAJ, OT45), 0x0},
 	{TAC_MUTE_REG(UAJ, FU41, LEFT), 0x1},
 	{TAC_MUTE_REG(UAJ, FU41, RIGHT), 0x1},
-	{TAC_VOLUME_REG(UAJ, FU41, LEFT), 0x0},
-	{TAC_VOLUME_REG(UAJ, FU41, RIGHT), 0x0},
+	{TAC_VOLUME_REG(UAJ, FU41, LEFT), 0x9c00},
+	{TAC_VOLUME_REG(UAJ, FU41, RIGHT), 0x9c00},
 	{TAC_MUTE_REG(UAJ, FU36, RIGHT), 0x1},
 	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
-		      TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS), 0x0},
+		      TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS), 0x9c00},
 	{TAC_XU_BYPASS_REG(UAJ, XU42), 0x0},
 	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_CS36,
 		      TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0), 0x0},
-- 
2.34.1

