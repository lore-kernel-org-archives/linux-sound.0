Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F19BA34
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738562685; cv=fail; b=IEnW7SyQYj4NSYdo8ENctUyzLjcPspczb2QvRtChM2cKSwufb7L599bolU9iuC9VayFOzivwQ6cJgrrJsclmpfTRpFDVmKwzAAIE3tiZIiQtiRgK12/GCECjLGb/RbvchHCRP4o2sTFz2kpnenxo9T7XvQxJXuOKoUvUGuDZGCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738562685; c=relaxed/simple;
	bh=0p1Q37+rhYURQajjhqjW1Z2EVh4oy/z7fjMn+T6SF4w=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=OYl8zAAfU3V5v0zagDnOjD31gE5h/JfS0+TrPszmCOqDVtzPCErpzqCvUuEIuHfE526ammDp0Ou2pmVrJY0GVKX8vo+jkrIi96ijgmjfAB3ELUOqqwGXEjKNddlV1Go+Fxh/tSa/fA3n4uXjBDdCP1v/9M2koe0y34NNM01Mhl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O/T2WWJX; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O/T2WWJX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4Uc6YyF9s0B3L/A3mi6TThAZwDyVz4LfrR1e5QOkyQwWr8aw/ezRQ17A4YbVNzfwtFv6E+ZNSg84Ie3WzJEL15T7mcz+CkXEUUtO8GArm0P6a1Ztvxl4lkOdhh8xcJ+eMOV7Ab8ZTo79Xer8XuFa7KXmUpFfAtSK7WUVWaJmjeBUh+lbLuZxLirU3TscwUWrwXLB/C8CTnonvf1+uIp8E0O7atN3fVretbkJ8rWfsbbdMnCnUy94Tnf8CLfLg6uH/0zZ7NCMWNmjspPU4X5YQqwuz8d823shXq4q1pYb3NNnzLzzH2GJmWnhbUZGdsDG2ODbz0Rj9gowPk94oglBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykFYcDp36OX4rtu+oZ/etDcV8Pop1YLtC1pmO961Xnw=;
 b=KViRUEU779xd/AMiLmxefL8mV5RbxmLABZ3GquDTL4n2cEQPeW3yBW9rQYVGeL5FExygLhNpX0ID2bIWzmj2X7KYJL2i6mL31dLC6ypQk6+Ki1WCd6pt/tcYRCOTWc0O+ShYtKz+ab3OtQZ6D4IQDCXTPjIt5tpn7OM39lZSJW87CVvc5mE9v3HgtSyg0DUpvalwhPe1d8julLiTHn6Xyuv8xCmmKXrC6eeGqazJxULNNVgKFJlhfIThbBPPMyaHtLOGZPJoJiCfI+1l4oSQWHYC/bhNJmkacx/i2eLoQfJjGB68ArgbuBkAlUvNZFaARjKhNXMz/fcIQrMAEOo75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykFYcDp36OX4rtu+oZ/etDcV8Pop1YLtC1pmO961Xnw=;
 b=O/T2WWJXuSMQt3Vb0+lLIjcIvXZWhPOFp6MewKNZZfvoSbFuQ3x3r26BNd2YGr7wjFu6/kuSweTanG7/Bea9/R02y8TA+UZWRusH3pQ08x8Q6WzmHZkkHNxJe4icm2K2F7Ek4A9H1Ub6Xzdruz151/vpDiB7qUrWZMrXxVDFxLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12962.jpnprd01.prod.outlook.com
 (2603:1096:405:160::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 06:04:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:04:40 +0000
Message-ID: <874j1bsgw7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-ops: remove soc-dpcm.h
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:04:40 +0000
X-ClientProxiedBy: TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12962:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0e6434-f782-40bc-a06b-08dd4418a58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2ZvM3QLUb6NUa5KyYfaIHlVs5dJrtV5OPMgNYo+ktvd7CAv7/Jiuh8EZ5dYu?=
 =?us-ascii?Q?dh+r2EgUSe793r09BPkMnWw//DgogiFEeKEed5jJTlPrAgeBOtiiBRFJYPlv?=
 =?us-ascii?Q?beULvpPltJ8Rzglpkpfuuwedret1ILX2C3MQ6kRyVFFAFABXiwIkwr9F1ojv?=
 =?us-ascii?Q?NALVYRG+Yju0F1x0a0oA2+MsffzS6A3dbG8akiUx5KAj8xZcqspQln2ItmwQ?=
 =?us-ascii?Q?kecXMGu15SlZJKvV2HmY6JmxnXTh8GaKR+raqFoyjsMmVKZUhD/rysZCnWZN?=
 =?us-ascii?Q?HCvR/8nnu3pMmrwCVL6hWSBtRT5N9mj5c2nTarYaya8LB1E40Mee7hPzFRI1?=
 =?us-ascii?Q?qWrqEZ8S/GUURpOZk/An3KK147XFtzsPPb1A09h4sIk6BWAATa/TuiMy5NPw?=
 =?us-ascii?Q?pXqKyzX/hza56lRZ6rW8iIpMVF0Ax/e7bfJ5hcTS4YHIXzM+L4KA6W3EC+vR?=
 =?us-ascii?Q?SREq3RNAUd+pGe3IqN7WobKssPNPwqGIUaA29+PgW05FDW8yEZ0V5Cd0BGHK?=
 =?us-ascii?Q?GmlRQrXpxjdFfWCZV+1M78XA9wJwFJkZb6J6WpTVV/YJUVx9u2bOaKvJI0xA?=
 =?us-ascii?Q?/bI+rpsuMH7Ddq9XPQc1m+S/WvUTgiA/WYnx09t2Q7W1VrmnXhT2PEkRo79Q?=
 =?us-ascii?Q?XvVzLcfFTqhW6h90vo51WnHDlm5FCq/8lanM9T9GMw99AutFe7zFoqzh9oVi?=
 =?us-ascii?Q?5n8iP95dWDxdBXK1Qd0EyJiGrRUMsOZNWbKOpLY2qAWjj0YicqkKhGZHzi9Q?=
 =?us-ascii?Q?0JLXQkc1jawZRZuojeyo97BQRtzNt3QYFZZHkgwMe8ZbbvJl4pmfL7wVVmdE?=
 =?us-ascii?Q?M9q+RfHb5CLYD6okQfxCzgorA9AITYjlchICbk275BA0OUEdjgtmvlO2kcVM?=
 =?us-ascii?Q?+40Atm4v/GVm2C626VR8Ij/Ve6f+WfsokSzQbvI760QK+HELw51UXeRJ3aDr?=
 =?us-ascii?Q?X7jf/pS4R/YPCuSt2oKWwjWyRkmp5rn6N+CAXQEl/N6kND6rwdE4Rs9BpKDY?=
 =?us-ascii?Q?DbyDp8WZQC20CU/zygcfM+iIaujReI+r9aIUeask3dOXkOhm5bv7IRmRSoD1?=
 =?us-ascii?Q?oECvhT6QpMz+Y2SeE7hYVdOKMBuHRcKRj85Kar9Ii7t4Xd4307YBAfmR2O5z?=
 =?us-ascii?Q?BVAf/Wxm+7d506x0G6yRkp4V1E2lEA3ngKII4Nf4gp2EhSzZaDMn7usf/mrv?=
 =?us-ascii?Q?Hy0fBe3M4jMsk1MykUggm/k+gS4C6TZ/Zxt/PMURPsBqs3O37GTKnlfuq2UT?=
 =?us-ascii?Q?Amtb7089PMS7lM5HTzRjttUkmdbL2XcxpuL0HL8HbFXcLPZVDsVkbt+jHs+m?=
 =?us-ascii?Q?QlMCUNi71dWoFmTYMNiWVszMFlamJmIvIA+gT2qAJGQ30+OMbceUEPszDfNr?=
 =?us-ascii?Q?xdbHerpOWUltcAf8RjDMloFOUapUFBVs54+Em94JCAiVR0pHqy2zluhaPVJe?=
 =?us-ascii?Q?/cppc9Z7qXajwKjEAYP7jalJRvbzX5Ng?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?COkIOsIURgeZLc8N0nK0TWlnoUlmDlclKk2AGqoKkpF06HIq0uuX58N8jQtQ?=
 =?us-ascii?Q?Jubr1eN/1+abtU8jy3013P+tnIVP34JtuuA3fxbB8eMTC6oBRGpFoDlcq6GY?=
 =?us-ascii?Q?roN+8jteIx2S9fVW7D12x0diEoIVy1ERUHN5xGtf6fipjTLVfmlpjtAs0ppv?=
 =?us-ascii?Q?uPLTZ9AyP76zpJGpKUhSodtDvRmh+1Rp/y64SSVi+6lei4cgSfxb+hW01x/o?=
 =?us-ascii?Q?ziV3NdS1U7TpMsYQsa46BG2SwZXO51/zEvohQYHD6cO19Eg7Y0TzOlhCeF7b?=
 =?us-ascii?Q?fgP4heo0wpCW1RuOKu6K+KpJMsTmlmK4NhESvxNnLcCBoCwkHBbqOdB9WY0r?=
 =?us-ascii?Q?NOkiIJTYYBGec1zhjEJlf6D/zJi5mLS8DkV8iKnIFeM/hicBIL3ej/SxQiW1?=
 =?us-ascii?Q?cGF5vwdSVHBMKxwvNb6SnhS9c7VJsJbmSNthliayYK3jJkpyARpLSYsIDgcm?=
 =?us-ascii?Q?k2aGuWJusF9i80Wp49xck7RcqKNuMwQve7kVSH/FUwx5N8Rro+Y3sg8VWpwu?=
 =?us-ascii?Q?ZSb6F2Whi0UirBHoAk+1KNrxtMH7ch93OBRBNxXTRm1iio2F/pxyPP/neTe6?=
 =?us-ascii?Q?3nXT2Bm0eE9Jv8qURerRafuQ68S1Gnu0ViF8gDC8kp5sMOW/u7k3W5jXu5qO?=
 =?us-ascii?Q?yrJIP50mlJ1nCv6+mHWMUt+sCOx2Y1p/HbEJflRdcjx+SYJpsjPqe3PY91xu?=
 =?us-ascii?Q?S2ven0v94aS4PZ3LBG88p2Syg/12OwcZZPDVYfywIjTYC+qST+klgsssz4AS?=
 =?us-ascii?Q?DT77/2iAdv5awczt/rNv01Jfn3bN7wWJDTJf5GqrMd6J8W1/8ukLPWinRztf?=
 =?us-ascii?Q?VGddpArVyY8zd7pNc0SL+ib+ISnN09ryOJ16jMM98HVZu8canB07acmwC8Zv?=
 =?us-ascii?Q?b1S4Nx/XsZKlrBBQL1kwAXCMuOixGVcKgr7FJBx96bZkoddnQ8/LfL1BizmI?=
 =?us-ascii?Q?VvF2ZQQhC13yWls5OD3oXI24Noa25uIl02rne51ZCxT4yuqhyn6VRO53Gp6B?=
 =?us-ascii?Q?xUdA2u/1b2Ot8CO67Hr1PZCpnHv8rTwfzvWteDPBYR5IkzVsHW0UbISR3g4G?=
 =?us-ascii?Q?DknoqR1wlQsQf9cHLkTeCVnf7ndmJq7gRtxbxABvVFhhjapgngiUKg00Ko+S?=
 =?us-ascii?Q?6gJXW1ABXRk6o/8NpfQSlrbE8BQ0GHkrDeD1QB81rE2XkW6vBuhLZ85ps41+?=
 =?us-ascii?Q?FkaRDc1dFap/C4NNePwLfuMnYVbMfIUevxAzRcVY+luRAylqjJHkJbGL7LTc?=
 =?us-ascii?Q?2F0bD6Ew12QIFr6nfMgCEXrM/AOnm4nPgwqCFCu7masGF13zonmGDZf3CfS7?=
 =?us-ascii?Q?CY86HSEZ4isRvjOdYkinPXxBLCys2bWbGdZ8yslA0VqyZL3hQajnbhW4mx42?=
 =?us-ascii?Q?dCNEnEckJ4aQzzqnYmPo2RnLQUKkVSImdI9rNIwDPo25l2D4Ehrhr8xUp/2y?=
 =?us-ascii?Q?KXlf41VvWKyR9eWmwjBIpmzjYigdkMcc0BpBbNcXjKqQm9YK/xPsd0ISvOiK?=
 =?us-ascii?Q?N1D0GmXNO8AcY2BGoG3V0KJpYz8+KxugbAG0fb7jb9qTAXwAu4otsHpDAJi+?=
 =?us-ascii?Q?076/jMBiiIttoVNXVUp94EPjSZQGrCI6W9pUpu5Zs4tl2M1spQ0sdDoc+jwi?=
 =?us-ascii?Q?P71b6/idMMKYFON9dxCSNhg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0e6434-f782-40bc-a06b-08dd4418a58d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:04:40.5117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y/oowhY26sdmnJX5N6CrRldh8zvmOSQJtOohmqwm8CWK4XoylIWPUc1F+77cLTXjatwegx3X/RKqQBvT8lAlbnxg4sdulZhiLa4imHdAUETOugJN5PZzTsALaY2Yl4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12962

soc-ops is not using soc-dpcm.h. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-ops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 19928f098d8dc..c6601ef16f843 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -24,7 +24,6 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/soc-dpcm.h>
 #include <sound/initval.h>
 
 /**
-- 
2.43.0

