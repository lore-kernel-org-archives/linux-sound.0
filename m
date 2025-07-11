Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC363FC7
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 02:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200829; cv=fail; b=jAfDOBtrl/UVJwx0tAM3aKtWwfACwPPb/qNidp/SbdlgwhMnQAIA+CcbHAev4YCHJerIPHnLjLNlSl+wZqkVxYjEEDSAO3cU93e2/Tvwu9FAEvTvxKLZmGfldtZyMclKL0nA+hEz7GR8Rr5K6hy1UrmGn6vp2d42ClyyvEd+MsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200829; c=relaxed/simple;
	bh=3hq/SDbkMDqYFF4DceXpMjBiqts+jdn47XFsKfOmORI=;
	h=Message-ID:To:From:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=Kf3Ud8o+84/nLUGowvorIZCVFZnracukbMqpyvdWDeT+eBX/He3e4SaaX2aYygV6u4z5zkbxHQ6OwKtybFCILBB6mvjAbrpp9GSWt59yN4bJ5EHHcT0nrHnV158Q4O1d0S0iN/D9/KHO/eGZb5VfxNEc0SpKW0spKQLA5klUb+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GZ4lkX5c; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GZ4lkX5c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVyBQecVm+V6srHv4FHOX6f1QmgFRE/C6bhDmLYr8uwyl2PY70iKQfqfrt0YgdKHZ56bYOu/nsUOPrv7IHo57US6WsKs68+k8XyUPr7vXOOfaHfodMGQUBgZfg4zqj8hHe0XYHIaK0Pm2b2xoQvHzvEO3KWaXHVAzgDBZRKO3dPp8JepHHLxEGCazdHh3mfQW+wxz0ZPgtPlkReTE0UjG4Hxzwy/Qo+SGFrIHO7256vaMQqCTcWQAd4BGRGWCN2h7M0LI+YoDgQXPyc+rkUef4L3xGLxSLsVFOPsxudVpuc0OkQFqRbY0kM+wymLOeiv6aOHt5s98UDI0cNIJ4zY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty4TqhvqRp3kvUWZPpPmJK6/XCnf8F0xckd+0RxuoQQ=;
 b=VHfFUENaDqXCqoLQVJr15TWO3Sb31N5A7pAWgOoJwoEk9PyzXEmxLew0RsO5L84PerqDz2uHBFqXOAP8FoG9FrsthK4lXjWatubjoLR3KyPi+BMibEgLLUbASjEAf4+INCRP9S65UbiP1pIix/fld6x31fde9rAaP68ekq6VnMe9lZ0CS/HERuRcAlJuqe5N5KSN3JlxNXNCS7YQTrwbY8Hk7Nx7GurQAWWTXGvGUZlTn05GX5ZGQCE+B76HLCak0lCsRAwAQofMrx+LCki/d5DT/2HK4vBUV89hHhy60CZXxEedC88OlxiK/kHwR1pN33CgKpGGl0woLhKZJ8Btjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty4TqhvqRp3kvUWZPpPmJK6/XCnf8F0xckd+0RxuoQQ=;
 b=GZ4lkX5cch241DruidAXnz9n6DpHRukbdoKFDJYYCm8KWyWdJMAhn4ZKiu1rmoGtUnOM/NPQW0rzsI+88k8lkdsOCQjN+xJcPw35emrTeupTrR+J16Gb4hr8tyyoCnYHpy+w1W3ZkU2O9kDwAvMZ+z0vkqiYNuNMEKv2T++QIM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13586.jpnprd01.prod.outlook.com
 (2603:1096:604:359::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 02:27:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 02:27:04 +0000
Message-ID: <87o6tr4g3r.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 3/5] ASoC: samsung: speyside: don't set dapm->bias_level directly
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Jul 2025 02:27:04 +0000
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13586:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b39710-d016-41ad-a2ef-08ddc0226ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wCP+v8eaUxdxYwJwB6RgIAk62SqeKJ6aSuaGNioc9AciV0myPr4cIKsVVPZ7?=
 =?us-ascii?Q?2Mg44W24B5mUyQE1Jl/QWZgAJsLESs4GnVoAa7bjDSp0uIAmlC7QgE3ss7xm?=
 =?us-ascii?Q?CZ7Cyipspy4IrbMCCFgFo++0GJj1GUSRpBeC266k8lEXC9Ea0GB+8bRVasu2?=
 =?us-ascii?Q?t4WUTvoTwV7yXC5sVPcfeTdAnmWUdnTBkVk+lIAFNdA0Td9SJnhgAHS6x/Xm?=
 =?us-ascii?Q?9uu508qXcTNixLEkeklNtzVU4hb1Dppxs2CkvPUPU+yLg6u/pd9btEYNVsOV?=
 =?us-ascii?Q?zYCc3DnCWxaNdUBFsyZxK9QGbW2EIPrZwkyupMufGv561pvXfKDDmwgGhiWY?=
 =?us-ascii?Q?M0+iyJAVLb7wGpOYVIns0Dj/9W04GfEGRYqyKOCJSMP9MeDkteI+rdZnuRKZ?=
 =?us-ascii?Q?4ThZfBM+LWq2J9WmlK41dfDvIZ9L0cWwIC2VdXadn34mhD7+fraYc5UGHXQV?=
 =?us-ascii?Q?hOkTWjbaWhJKeGeDhRddNeVWmSk95QI4UrreZQkYCdzWEoXLiRX9YSstlmLk?=
 =?us-ascii?Q?zCP0QXOi4Y/zaT0g5G9Fg6PPoOrZ6I7Bbe2cYc4BS7Th+rAL+YPqTuqdNx/I?=
 =?us-ascii?Q?HE4GK2hCNw2msx8T6dXNSKKMRkkbrK+MRQWwnVz8hCU1EdYkexPAfw1J+Haf?=
 =?us-ascii?Q?dfmPbyGWRn8Nkq9epJx3MAiPnVnuBlNoeUcl0v+K8ehNhkkHhsgqqLq8ZWJJ?=
 =?us-ascii?Q?WIhaSAFeftDa8LbgTgeO/DrKEJnvhu63OYtLf44+K2sVuwo1Khh7xFi+4uHo?=
 =?us-ascii?Q?RJyMBqDzYvO410x36GDLfj8DXrlLIkHlccGt+JiNcqn1V1A3/QhUbEGjhce0?=
 =?us-ascii?Q?JpQVaKKSgJOMFNCRhn5J3uI6QHHwc9/QG1XINk76+03P5dMl3E2VTU5oFf2A?=
 =?us-ascii?Q?AbOXSfjrrn7cNsnRduG5rVsGebMSdJ0kTM7YRhQGpZD56yYIRJ8KQ/tDA+VV?=
 =?us-ascii?Q?gdfwKx0JwNrvWJJ9R7HZ2V73PQzhMwYZDWOru58+VKbZ5N+z42uJzRiNT7LS?=
 =?us-ascii?Q?zyfDJraGediwW4Q/xN19kDRvQ+kJ1j+RnFJ7QfJMRO9VW0rzWI/YrvSgkrTo?=
 =?us-ascii?Q?TnuaCyIPcDzBWANvbg1x/bKR/UvXbQlocAYP/slPAemy6auwrX9SWf3zuYaP?=
 =?us-ascii?Q?y6M6hi+V8g9ZIkpF9syj7s8WJ5SiXoip8Mxq6LhCyTYIRUvXY8dCOPekYTlK?=
 =?us-ascii?Q?mzvVllcxHKjGNCWXRsd+YovA3T8feJoCAw2/nW5yvEiFapWP/5d7uSTdyj15?=
 =?us-ascii?Q?BgvRwU0PdgX89Tr+emMgvnbDQjUqR3i6SnJIHyTfLLT7mpEDBXa1ROQm6mqw?=
 =?us-ascii?Q?YSOfaMy7N9zWqk7qMvoozGWQVh9QvYWbclsK3amufpjnkEapgKrFDlTlI9ZS?=
 =?us-ascii?Q?sEJ+nT47ggvfaHQ+8l3Ffoa2q04zOkE+W/ZXHle+DnSXjlbY17OpEtuWL5Tx?=
 =?us-ascii?Q?NYYP0huTfUF7rTeVNkn2ExsNH7K6aamK1dVsakNGy/TphpY8KYS9f4h6lPFV?=
 =?us-ascii?Q?nYuB9eTAvaN1J04=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WFVQyc7QqF9OJoVKAUDa3qfbpJ/KuIUBt0hVLPlFmh9fqUaa2ERNnMzH5od8?=
 =?us-ascii?Q?jGlhgRMpCg7yWXvZPOO2Bmjr+PhU6nv2p2o8PMH0mydpk/Vsph6Qv8+TiG/l?=
 =?us-ascii?Q?9ZkqIYVM9QP7npHxYZktZdM1bG2rJ+9qGrIf60b2wwwGZzVCq9tPa8e4HtBv?=
 =?us-ascii?Q?4A5inkMNLXRaaLvmy+5CMmomNIQxO7iXLgVmwhn20BM6VRCY7Phgcluv2DpX?=
 =?us-ascii?Q?yKkggS6l1GCdZeGNjpieFSb7lMm8q0bsEbHWF55r3obT7ojwTkhpGr7GVHAj?=
 =?us-ascii?Q?6ZuN+Sp1+og9GvIdx4m58/LHNxRi9RgmSCxby8LAeo1qPDhNe8HDV2ZoKppK?=
 =?us-ascii?Q?BSjtFKF9wopTFJSdziU5dntUd6WZcbZN7LGNhwHn0n8+4uMP5SENegOz6sQU?=
 =?us-ascii?Q?1nc2f26zoVbCoROANd4Tl4GD3e44VT+9mJAjVM6I7HJDMnfsHPZiRFt4nK2L?=
 =?us-ascii?Q?t4P6mz1rymdzdDc3SpV99m6JDJB/vis+jjhVouJTErROls2ELBQNkpBp7FmP?=
 =?us-ascii?Q?FSvyLYaKU/5AAtjrcf5redB/cq/3u7AkYewsdxP/hEIMkEyUm+E4eSZbiXS/?=
 =?us-ascii?Q?EsswSNDnlWoDiyfBJU+cpBQu8otxmZ0lrgt46bDMXIALBbpj2wWQvGunsuxU?=
 =?us-ascii?Q?pJnrGVRP9g4CHSsXcgpRxL0rVtnpdUvn8SWTQ/AkyGTSqg42EtQiHWhuwq3s?=
 =?us-ascii?Q?o2Y+lDPxtdgfJQIwIhg3ZqxeogUk/jyYYc6qTVOUPbcxEGpsMcxjMYoaYba2?=
 =?us-ascii?Q?R55K3qNp3kKIV2zsCWbWGJdRJxctLIJLPJF2FhMLT9p6Vy0QDraCam3obUP0?=
 =?us-ascii?Q?7lSaOvvgs82b0PLJFWTVq/QmCTShbgCg0Je56psZTKP6JaZZq1mlEAHfiTVB?=
 =?us-ascii?Q?yFdwyUSUR5CvyhZqUagRQgbeeMvrrwnQCVd9NEdhIkIWi9xZoO+N+xvn96U8?=
 =?us-ascii?Q?VjTj/VHsbFEZLpnLyMHpM5Wqd9ayV49qVT3Vw9Obpoy2j9P5uUa+L/MgWZ/P?=
 =?us-ascii?Q?dOrxBlJ2b6YmmHyas7RS3gFy+k3OF+3i7hYiKAXLbtxZ9ME93IHplvPOHj/g?=
 =?us-ascii?Q?OY8fU6/84PkPPfzOB5LR6SMUZ98g/WgdsiI6h4iMeyZAeIin8cUaNxP8zxWz?=
 =?us-ascii?Q?Fa+6ldAeD73QIQ5oW2UKpVwIf420YWxWwkhSs6BtN0oJRCxZRNyTj1FN+AzB?=
 =?us-ascii?Q?bgWn1Lj7+N8uZGbNryg7Mz0bPIjXU2AyDXcOo9xKp6l80ju5DyaGRVD4kR5N?=
 =?us-ascii?Q?5dbqdmDFD9hbUs6lFrTFQObN+gbWYKFjEpXvZITAGswkrcZvqUhz0k9JUv9u?=
 =?us-ascii?Q?vmOpPfAUuhm7z9aWYz/MTVwpwJ1tVLnsY3970eLs7wL18XxZfWJO2JnN3hxe?=
 =?us-ascii?Q?wkLhSQfe7RjgdaDvq9X0qhTCU/e6li2Ngl1x572DB7WmPsxKSNtWrKLk0uYI?=
 =?us-ascii?Q?BQ61U1eNnAPyGnzVKeySPDzGniIjvbqdABtnCEpiB4x2BElL1ZLK900EBS6E?=
 =?us-ascii?Q?sAn/tIbpdcu6yKDgQkEkmcKdC1mMcHirKEa78mts2ohAk16BRmaSarz1aK+I?=
 =?us-ascii?Q?qyMhH0jLZItjFiaGojzuWuNNAvVYUm6iiK6Ns0zSayeFrxdutb+tCfIbHco+?=
 =?us-ascii?Q?5rRPKNC1eLfaw+ObdM/WJDI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b39710-d016-41ad-a2ef-08ddc0226ce4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 02:27:04.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGoYYkb0Wl/FdGSsv+sx9Uau4UNYJyib5yIMu8egZdKX4IIwxWiWIE8Il8JmP1jnP9YsnIKym301RcabeGB7PVKsRIDv6MrG/XwgUEVKVZyWNJiXeDArENrDBEW9M2mI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13586

snd_soc_dapm_set_bias_level() (A) will set dapm->bias_level (a) inside.
No need to set it by each callback function. Remove it.

(A)	static int snd_soc_dapm_set_bias_level(...)
	{
		...
		/* success */
		if (ret == 0)
(a)			snd_soc_dapm_init_bias_level(dapm, level);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/speyside.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 9262e5626584..f4cc5684ef0a 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -90,8 +90,6 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 		break;
 	}
 
-	card->dapm.bias_level = level;
-
 	return 0;
 }
 
-- 
2.43.0

