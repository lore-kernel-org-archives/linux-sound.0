Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C71216E24;
	Thu, 12 Feb 2026 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770862647; cv=fail; b=MVtnmAHSD8loBBXxdFhAQ32nHWkwUcO+EGOksCr3hn6PuIv9vg58zsYJaa9BEQqpiUhwyD19eorxPUUHKYXJRHXfJoam3QJTi9dG2JN1wRCgxVQnbuy8cCkRo/cmj8/Z7pvnjqPQtM8JItSgvsKg5sWZYz6k4gDn4G7G91jrP3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770862647; c=relaxed/simple;
	bh=xq54IZLKT2kZleR3GF19I9SclooqTa1qtzAAoklULec=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TPJCV22FOj6M4uiD+4OIAtXUQfYFKQMUE+dAct2vm73LgpQZqt+hsp7EUgwgnpMMdhqam8o/nustQgOSzIDtvq5hWnKFoEzPzP4Tnfx06BvK7SOH6o5YaNQV6WIEfpRuOm+Rb+EV0RNLrwg/3hdwpougMQYrmMjm+jkKBh7Mn1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UgPxt40v; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UgPxt40v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwKP1Y3k8JlDCDcqm6bYJIlaxVIfXFUvKnIb/6ASJtSY0TMZs595MOxMgI2LL/QPrKjrJDnWMt4Kl0NmMuecJTR7wEN544OCbMaTQfzv+uT39iWp4M8Zs29uc3clv7IL9K7yTT7mgT75Fq+9VJ4N7X4YGnAMw+uS6QREU3ZNeJW9XZ/O/DcMiRaG05cqp1OwrsL/mfNVGlafV6y8TmAIp4OSmYy3sk/JgKDufTEQlWBLWiD2cSUrj8wlHLRW2CDwj/McL9PcwStCLdkeKB7/6OyDZaJbC8XVqyvmdFaQt2CmUXgHzYMvcTbf8/eZt61liAufUmO5y/1BAhdecxoT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txXVZbCu9JkHfi5+CPJWx3PF3Reqadx37Id+qsFqg8s=;
 b=xjAj6Gt13c8GsxX1SfZ9mQSZQNTWtEkaRQY58Adb6ILjCGeU7qYJx+XMBLtpzvkCXMENF/cfjWrqdlxgniN6zm9l1PoK574DKeoi3/DciuxIGe330jYdXtsqvZgdYWSVTGDlYJoHirKtMFsV1+w9gAF11+nmw3pa+zpSOchHdPd92T0Pp7PwzsbcHqzfZVuk9eousnFHLCZ+qjxS5Xp/BuFhaEBKh03irlvfYHUN6lBeRQPu/gu4K9TE1co2sPnK0wpLzXAoEOG85ktx4DDzPFFtp7DRmkB/njZyq6mxmaVza5gvKCRTmRZe6nK+QiVwNEjaLFAvG3n+maStITiCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txXVZbCu9JkHfi5+CPJWx3PF3Reqadx37Id+qsFqg8s=;
 b=UgPxt40vBU6rZnke69cxGxOXkPsQSrFiSbwaSuuyNLcmht2wlmj91f1LjLkX/h4gMRd0c9lyibbR1bu2x8nngMwTxYjVDQQmIKb4WRfXAqQvw1erRLMBsHAzSVcCudJEqxTJzHOBdJSz2jfsB2ybKJ5VniZnXuG09ZdHOYC76kJJVLN83p8+FqsDrq9W+wDdF059Ii8tXQ2J+pFFJ3EUrOO38s/bMnpI68RbrllUNdwy3HWz7ScPKuJX011dTeNEBL/vbJxWC7d8SR5dOskIdbywnbzy+elO9H/97objCQcCjIWPbk+UVOcYGlpt/+f/wIYW3Dl+zMU+gBVEwGXF4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 02:17:23 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 02:17:23 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH v2 3/3] ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names
Date: Thu, 12 Feb 2026 10:18:29 +0800
Message-Id: <20260212021829.3244736-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
References: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6496b21d-a0de-4c5a-58b6-08de69dcdba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?//gsCGVv8A3z+WDpDKUP18CUh66CaxYkcP75sGcegXUMFhfG2jW0PsDmGIz0?=
 =?us-ascii?Q?SBYwBimBof62IvjTtKgvTCabLp8N7CUczX/6x9dVuXTRZys0QdMbEowzO0pt?=
 =?us-ascii?Q?OxVziApYY/PfaGAYxb4/3xEuK7lnY6TiuxrZAJ6iD7toaSyBHPyYDGMzWbtn?=
 =?us-ascii?Q?QuPhE6dmNc9TcQiSrA20Ci0jxdFa9kUOvPbLzic2leVY8L9jUm2Aq1bxCGK7?=
 =?us-ascii?Q?fj/uz6na6OH6THk66fR9sJ0YKTEYqxoEJ81GWw/0ZVM4MpXknEG6tDV8A2wI?=
 =?us-ascii?Q?VoqyukTXq6Z+9FiHJ3OFywHCLtvnNxy2sfLcKxWevepSvOKS6gYZhuONVk5I?=
 =?us-ascii?Q?baC/US94tf+xopW9AKbpR5EQdkp+DDyrCoyvW8v4TQIw38I9uKftQ+gbVcpW?=
 =?us-ascii?Q?VkBkTEdJbt/Kn4Af5yXnpKmpKuMCysCvdQhbv/1Sq/SJS/ORjj/UcNvjfv1W?=
 =?us-ascii?Q?r6L3xMRImgEN6ZN96JWZDu30JIGBYYgdF94b66MF+VSKEzzLi6K9/qXCFm3x?=
 =?us-ascii?Q?IbsxIJQpUb2W/EevmN6Ah4ty9VeqF5hDRYrcFg0ux0RywGYSexFK0jz67mS1?=
 =?us-ascii?Q?rngaEu1YyqKj2NREtfs6Jqi0U3jyFJtV3tGc6xFqGjzpSL5xLCk3Eye3z9Zt?=
 =?us-ascii?Q?qrOXZPC/oPSWmBXqvcY1/TFQagdVxLgjpbnWlKJKkiWrvqTgWJaFCIzV7VtX?=
 =?us-ascii?Q?mVPUxSW4Z87b4slD31UH9gfJDGjt7O/O9NdQt3RoL57w9sxGYfs0yPeQWjGS?=
 =?us-ascii?Q?gLp4fhCPFUIelqCSYQPax3EsYeQl7fABkvXOwwzxRBvxdug9wQELESKqia95?=
 =?us-ascii?Q?bj2RERfBXU9pXznfM/8NoO/5knhrvKKQOKSFf3NKHmb9vJYXoUbA87xpv5Hj?=
 =?us-ascii?Q?QT1EQLr/lsId5ScI8TgnX7sEj0uIR9qP2BCGbHJahXW9j60sFr70JDyplpb3?=
 =?us-ascii?Q?iAkNMfx2z9eC8RpauF3CuzvzHQeT/FeuXPl/XbSuMe4NuQhW9o9FQawBVaBS?=
 =?us-ascii?Q?JY4ZGdWvCwNY3jYv+5wWLtl1s+g8g7edMAiDs+52LJcXDW0NKcLwFxpKkBY1?=
 =?us-ascii?Q?UYfzqaGThDWfAUYr74vrM71tMk1o0J9w/obQAt1ogTzS/YCFRC+pyELb5xOp?=
 =?us-ascii?Q?TykM311CQkb+fP5FViUibsfgPm1USxV1bdTp/THk7v9+V8/dJHuecmdk9jI0?=
 =?us-ascii?Q?bjvlzrrQ7uKhrh9t8mJOBdlVvISdoYCcMNGSE3g0ZQaMm3X0xjD6emyXAZEr?=
 =?us-ascii?Q?O3/pTpmDZf9jAjd+xX6Tjbg1eCdHeLO9dAL+ic/EFVTzdFVs0ZHBxq0dLPjJ?=
 =?us-ascii?Q?Z+wXfpYU+cErU1dSv1xlA5y2PGTGKVhNvYTwcLbUJu0WGhltzfIvQKElBscg?=
 =?us-ascii?Q?RLYI4/ijWh7MxFPIWy39IZ54JVRSBHE10OjTrlczURDg9oLq0LxgNQUvWAhV?=
 =?us-ascii?Q?j05Fe5uScWe4/eRnzaKx4IJsm15P30UYdWEBt5dLHpYh8AeR7Gj9iMF4yx5l?=
 =?us-ascii?Q?0wxy4A784i6H9xxzI3W7tWZW2JiQyvFNbFEFXsvXmg1jFprTgeiJoJupVgQG?=
 =?us-ascii?Q?D6unB6EqcCHDuy1xrxuuYqbJ5xBYEppCF+F454tJvjGlcsuU3+exW+0UB5FY?=
 =?us-ascii?Q?Xpys8aTNR2ZqpTGF2TccWLNmjZoqB5M3KC+8BScRNVug?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZcNde44L5XXn6e0C23sGQ93HeFAP6NhxywE9AHigpvgVz/GvCUrWA7ZT16Cg?=
 =?us-ascii?Q?h+OSkQQrddlZ3lHGSyCVK4V6SinCjInp7E/Rzj+cQxhB8bsEpYs05Cp4xTFi?=
 =?us-ascii?Q?UV7EdRKPSGIsKYkXEG/djn9CretR/4rhP9PsveOENKmtItVgIvxe49D4pRBy?=
 =?us-ascii?Q?nUugM3aozmY/wqENHm/8fJCG7xl98YYv4AD9tJylm2/TiBTGJgqjoosGkWeF?=
 =?us-ascii?Q?tmMRAWgzauSqCnfZ9F5hXKExhrEhQWMw4TT5CV21k+ruc6Lr0muedK/9yXw1?=
 =?us-ascii?Q?6P3ZB59J+nl6ZDBVu9/TC7PDW0NoOL6orXTRfc9I6xYSG8XCK/siX9K6Esnh?=
 =?us-ascii?Q?r+nFvjMRvGbWuv0+QJRf0Vbw5BZAUXuc0eqZAnnGRP+mIgpaBpShrfGZBN2r?=
 =?us-ascii?Q?2dG9y3U025Lwp0nCy4B1LasXlhGsRRh9dZtpFkr9PEzjpb+gXAnOBNW2CKz6?=
 =?us-ascii?Q?Rk8SEG3r+ocafRYjoFelsn3XTjI/725uLRhqYNFTUdlcqtfhEbwOkR9MbabM?=
 =?us-ascii?Q?k9EITw4g1mfKmRVPy7Rb22oE87KPNkWrRSApUIhSiEn3N3A3iRgyZ9jOqn6k?=
 =?us-ascii?Q?vw58stNvWHDqW4+cdmugIjwPRta7Lt683k8qWjqfDyB4VHjLch3aGH0dZIt1?=
 =?us-ascii?Q?fytO/Blf0FzlQccm3gAC6Puhg7Is0M2yHuCXf8RisoJR0QDqxzT2Q04bE13L?=
 =?us-ascii?Q?kAzAAzbqWgZJt6+OJ9DLs7lIpE1XkIKmBs2KhR83z71AM9nc4/OOqX2B9K3f?=
 =?us-ascii?Q?fMKmdcxU79ZDievfqXynBuNoGzqwdK8pE4E9p7evngfjfg8zbfZnYfVrDV+1?=
 =?us-ascii?Q?UKIROZHy/NhxNxka9DrB0uauEDsiCT5nuAvkOxYFyYXr6HRFVitAeGuG+aVD?=
 =?us-ascii?Q?XepH/X3gF09cm5BOQVQQwn5JxeERFw0fZj4edDxGlPtGwHP45fnlGzYTv07O?=
 =?us-ascii?Q?fSuvW/fwQRy1WIq53KckNxXDpD3bzZ6Tasci1EfNwzSwTUX56d0z1yBmljEv?=
 =?us-ascii?Q?+9uvIFw2po3VgDDCNPXDkaBGAcwwUZqAt9TbJvlDjN/Phb3w0utl3Aa0NLU3?=
 =?us-ascii?Q?69Dt4npiqgQKA24boaBhhCLKelk6FBEbg9Y3gS3E0m4K8R2xHiXghU7q6BaS?=
 =?us-ascii?Q?6hgbrY8JRva9fLy5yFx+2lGh1keSfEgxuj1jH+sJOHn7DF1VyZZawB7raSd7?=
 =?us-ascii?Q?OEeCjHNW19u+vSzsMvpgm0W4pmIF5+UjhUOAWhbmXxvrB3Q5eaxPn30kBxjx?=
 =?us-ascii?Q?ShnkLTmjfS+DoE26OmEBFYUuqHKDUGf5Tw1am27CmYUHwhUCAAHZEoBeDwIJ?=
 =?us-ascii?Q?XTAbZrinaheNSTKzkrCOu6Gn4ZghW2/8wYY/i1S4xh4gG7LyW2QsxhECdr1/?=
 =?us-ascii?Q?Pp/zeye5RGRfWARoC9+1v5GS5gctnXQJIiL0gJFWbzj7UlfrizYzjz2Xn5P/?=
 =?us-ascii?Q?B9doMLPPMBgyApt5flE4DBuJIvAX53C2T/Be2z708Zt87PG7xE0iJJysXT/e?=
 =?us-ascii?Q?OP74W3QUGVb0Q5SIKtWNxa9ONrtMeoRM1Gt2zoa/tf/RUxuR3O9vzzfHxufA?=
 =?us-ascii?Q?BrwoJZq1j4JIX9Pw9hT6qPFwWXhJ7WAXUOgqDi9YlMFioJehD4JiuCdYy0PR?=
 =?us-ascii?Q?fQoEyav77bUmlfJcgzNWv4iL6tKJs61wERwvqgrZUi+FSPQptGStjr8mnYoo?=
 =?us-ascii?Q?9atn1uBd1CdUhtZWLFaqGgRybuXf2kl/xrEKRWDYvF0c4aEaokfXhtkzS+2L?=
 =?us-ascii?Q?F8UIw0y+2g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6496b21d-a0de-4c5a-58b6-08de69dcdba5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:17:23.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so2ePM8VFcmtGC6PamuNeYFUw+WXwO+Mx5xTsQQrLkRyH2G+tAWeLBj14bQb4Oq7NFw1gADPEpkAXckajD+bzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

In the original txt format binding document ak4458.txt, the supply names
are 'AVDD-supply', 'DVDD-supply', and they are also used in driver. But in
the commit converting to yaml format, they are changed to 'avdd-supply',
'dvdd-supply'. After search all the dts file, these names 'AVDD-supply',
'DVDD-supply', 'avdd-supply', 'dvdd-supply' are not used in any dts
file. So it is safe to fix the yaml binding document.

Fixes: 829d78e3ea32 ("ASoC: dt-bindings: ak5558: Convert to dtschema")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/asahi-kasei,ak5558.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
index 5c2f131c86c3..18919d9112a3 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5558.yaml
@@ -19,10 +19,10 @@ properties:
   reg:
     maxItems: 1
 
-  avdd-supply:
+  AVDD-supply:
     description: A 1.8V supply that powers up the AVDD pin.
 
-  dvdd-supply:
+  DVDD-supply:
     description: A 1.2V supply that powers up the DVDD pin.
 
   reset-gpios:
-- 
2.34.1

