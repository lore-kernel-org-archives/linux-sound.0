Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2085.outbound.protection.outlook.com [40.107.113.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96915B3;
	Fri, 28 Jun 2024 00:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719534044; cv=fail; b=cRWlehUG2SqvpWFf8454HGL66R7/Ee2u4qVDrAeiOKLL0IiDEgEwT+ooeF1PigPqk7hpumTz854Lw9UQlYntrEAY4c22Xmyc2UvucBdOsVJWdlXncfGFuO88LHTxpBmnKuQ9yEn1GaaQ3phMvRVP8TuOfIMULUEmjFSKo6WRdpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719534044; c=relaxed/simple;
	bh=yIPzn4J/CG+KUIXDHQTn0sljUyhZC25vGGfsY9ltkNk=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=JP7UAn7ebaLkZNXZL519pYlj3Th0BUsb/nATSFF578Q6Nf11ru/u64vd05gHNGxi0j7a/GqGNReHjscaE+sNv4Ji1uMnRiMdpDPaLY8ejNoOJST5VeDvIb3t7ivKtgZ9+bNP98DJIAezzhnYW/9oDMPu1zh/s1T7MUauIvdPp9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FrmHUnFZ; arc=fail smtp.client-ip=40.107.113.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FrmHUnFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9gyHSqCnuZOaG+ZB1uhvhF5Mo/tievSXjntA+Nt2epHOOAtXO17aRy9dVH8Y+edbtLyxC88I8+HfwIRNUt3zTeZ+sDwIDGONNGy3ApNuwB76zhklSVYok+fZsrzppZE0iTugwXP6IyMSV8WOgtqjqvOtIQ1u8UUHYAwOT5yml2ld8YZ3I6iR1iopUAGjQKSVb/YN1GSKvrjBlU4fZsgVtrpdL3clPjVw0hZ3u0cxI5ukNUWZIeRu3bEO/4yebrxrF8HCyAtX3scdFnVgh2syVVzMBZcNDSyNonkW/M80NCKZhuHeWmGqYOkRrZxQ/8VGskGvj7ETl0r84w+JnFHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edj39E8SlgW/W2pDabOh12DOB+lkbgWUTFCkihXQTg4=;
 b=GRBhHpJ9beB9jogSr4QCCRSAta//oMkWpwn2uKvWLTihpzQTCzJFU2cIMutUxFMkp+bDzJqV1f1WNn+IzW6Xct2sgIeNC/ctStp/OE4J0IPUsRqtTGEzrBb0vAHEXyn+wpGvGNxhvjfscwTg/whWYimDJYfEo33FH2KgxjLrDI5S1xOiIlvOCRn2i7OCZahvwAmJaEocd7LHB/Em8nvDUioAm4l0+SV9SlGZktuHnFgYtHb/PZiGrrgoj5irPMzG6ae+z7DDu5GKrS5lFk+wDDQjDX9d+FUFq8rMd//BxwU+stRTVVpmthEx6UxjOF1Vu1CcUyDnn0ba5F1tigdflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edj39E8SlgW/W2pDabOh12DOB+lkbgWUTFCkihXQTg4=;
 b=FrmHUnFZVdff3j2UZiCgXiMLKdE//a3izZwzmttDguOJ24102Jt7S/bI7GGp44FpS+Cj7liEy4pBZOYJTlREUXKG1ReggM85Uc2CRJSJJK4bg5Aaf8B3GRUFWNUGGn0GwbKpHgLJz3x1Xb60Ih7pkLglFPB7AYK6PxlVKDx2hPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5718.jpnprd01.prod.outlook.com
 (2603:1096:604:c6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 00:20:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:20:38 +0000
Message-ID: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/2] ASoC: simple-audio-mux: add state-labels
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:20:38 +0000
X-ClientProxiedBy: TYXPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:403:a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: f53d8aca-b2c5-4b61-d1fd-08dc97082302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ngghU3IFBUIyIQRnDQ1UbQbjqzdjweOwoP7L7Ku8BtEdUswSnb8aZOq/vQWK?=
 =?us-ascii?Q?BjZgjomeJwi1fEHvCk683HvL2nMjIHTrsLq8V+i0ME8m9L6dJ7ImqDG93DLv?=
 =?us-ascii?Q?l6fvPNeQHv9It3tkFkQ95BEwJkNFGKqHDoCYsuI/nOfV59vfKx7jppGL6xcc?=
 =?us-ascii?Q?Yi1p1tWgRP85PuKiK8X/kF8gA8z/Ww4z7nyJrbMOGK9c2+AhbWQq0B3ObopA?=
 =?us-ascii?Q?crxwtDjrsmM28PKUv4NhjOMj6AAesINqTZ0arnVKCVUK7ZIddXzx/u6nTEPN?=
 =?us-ascii?Q?/fYrnPV3RilYcfdco3fW59p+vOfwypNdISFyfjAHAQtOMOk7JlFfqDjyqiM4?=
 =?us-ascii?Q?CgJekMg+HHmGHxGRDMxtiya5RNfVuXu5NV1YOUolmI9JghXk+S/hf82B0lpI?=
 =?us-ascii?Q?jXGZMg1SeW/nIU99oK+k8RTYZRU9qgCFwXCUXgMICkebqRVc9YiTk8GOfsbh?=
 =?us-ascii?Q?lQ+vSeasnvm/OwW9HIj2MPlH/Jd+z3Ao1LC7hE73c4TGg8nnimpYxHyLQDEZ?=
 =?us-ascii?Q?BQ+yD7dwpidCdEvSAaSywEa+Nb0vSCdr69ZUIVdT8tCo6PuC4HdhrWMrn17B?=
 =?us-ascii?Q?1A2okRKiYobHuOPmNFpN5YKhDzhj37Uv2EzTu/DsAoxRtioRlWhXupkEPJMM?=
 =?us-ascii?Q?XjmklU/gOOwikcgEiQEadh7/6kgayJ4QzdafRBO8SiRkkimyR6N4dhe4yCkm?=
 =?us-ascii?Q?PIIMKbrVoFd4d2N+9wLYknkQCBULc1NadsbZ+66XxOUkqvyIaOrqeDR3YJq2?=
 =?us-ascii?Q?SySbxw44bWOHjYozYtOt5UocbPe56SqiIdEgT7yKuN1Suu2aOlS2QtYByIZt?=
 =?us-ascii?Q?2g9vZbsYoLbj96eTOpOA9N7W4e5iBdlmD7ikw2I/PQzfDyLSamW0CyLtMKE8?=
 =?us-ascii?Q?mDsM9bLAXKIqrHV/0Qi0tG19SGpxRRrT6VeiD7z7O3gI73jsV6VycB8uGep4?=
 =?us-ascii?Q?gUwBCfdBmz5Pw5lU1WzIPw+QKsAzLtuxIyPiJ4APJfEzRbQKd3998qxvmggg?=
 =?us-ascii?Q?zFXLil4yrLH8JOEcNJbl6jgKM2WXxv6c6vX1QC3j2F5aWKVZfTOCx6mVTaaa?=
 =?us-ascii?Q?ZaK/N3If0XnNUFnvNzC596egIf5AeF3CfReaPvaEqbahir8goEOqNA1KC24c?=
 =?us-ascii?Q?t1a2+7j31DtdPUx3YbaAOcy2rQPxLS0RL5Sf0zpiucGCPANehCQz8JkIdA0y?=
 =?us-ascii?Q?48jnTv4ZPUEj+PX+eZ9g+03ULulQFmkdlNqp+4jDxNDMbu7nuqKqGdXN0ZLB?=
 =?us-ascii?Q?n4Z1vSMB+NQ+6oK/6HooHV0Yd0/Ny7k4h5XnFB57bmAwXdL0PTF4UgcwUiMc?=
 =?us-ascii?Q?fc9jzmkdosrKAVRVDumAcI+0bidiDU9cAN0/+7LucrwD/1zvI05Kqd2shGkX?=
 =?us-ascii?Q?XMswyyGgJSV24GEphNUkGzqjDeNv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3traiSUMt5rXJy/vPYEnAqzmkxzMr+3p2m+r6ZYWNnLGy+J+RyaZqAxTqbPX?=
 =?us-ascii?Q?FRmHbnuF5wnOLYzmsD426bAVJAjtxLkD/9JZGgu2VO9mskx0tu69ps8JbA0I?=
 =?us-ascii?Q?PF20oI8/zQIk4JLCQHHMylGQVz0QHybylZ1st/Hth4iY/FKT39vKcSY0hlVT?=
 =?us-ascii?Q?KfhXKXIZ7QNmkFxJflOP2f4c2q0nbwzaUQQnXGpJZSct1wOm/BXM1MsUdT5r?=
 =?us-ascii?Q?CzYs80xz9rkB08IGZByvgz7awxkgkSdEhLyV9uqJj/mymMIpoKCAHl1SNdHf?=
 =?us-ascii?Q?y1duPJFAMW7yQ+Xt3MmTonFrBk5QqIbIfgXfzEaJdCmkNPSNhyCu5+OyFhrA?=
 =?us-ascii?Q?AYKTWink2eijr6A3ugTYsZEUwS0uFX+eZBbkSuZpF6mxzAW3RTvesACPzjRJ?=
 =?us-ascii?Q?m20lnoCvhUT0AisIW2tFguOe6nF6TXTRvhVlNSNLz7g0QVgYq20nXa4TKUqs?=
 =?us-ascii?Q?HOeyDUbsslBX4pOZW6Opd1f8ZJfQ6oAbozIu+oMWotc5QSjCLsOSq003vzwB?=
 =?us-ascii?Q?I2SpKIAJhUhuvAIKV/bX5UyFue6MuBo0KrEFmOW05hVpe6mAthq6HUqrvSKu?=
 =?us-ascii?Q?NoZp+O9x1rIygSIjnMrNd8VvzvpV7XoqfYSmbuhaa08WpsQjP3q8ZFbiga4O?=
 =?us-ascii?Q?aeww4N6rhpqEs6GHfX4FGJj3goz/Gr2BavfLeKLSHmJOOYNW/HQQLSh7tZ/x?=
 =?us-ascii?Q?rgqvpHGUGlzN/VNRgmAXJx7kE2r/yxpCD/smuWmb4LREO0yE/OO+ydF78/Nj?=
 =?us-ascii?Q?NLxYkF2qfHVTDa+RmGcFSQMFvGqk+UeBHJ+gbCkJes4Y7vHJ8PNvtXTYCsFB?=
 =?us-ascii?Q?GVCFXll0uzj/Q4ZI5Vgab/9QTv3rKUfCGKDp0z6twKy5+pC4RH/3rzPTdLo/?=
 =?us-ascii?Q?VvgSUJF5ndSxXDKvT+VQ/iomFII+/N2cSkiarAN12tFm2ncOjSgtzKCeWaht?=
 =?us-ascii?Q?/8psOSjMUHvympakLPaWhGksZGwTs8yfeDpvEdJuHk0XWepA6WS6FDN7pRw9?=
 =?us-ascii?Q?FZlqjtGECd1KA62YbdjWkjGJN2PasWRoMbO7V+mKVyqx0rd3ZpyFjaJyhXkS?=
 =?us-ascii?Q?QPTTTcuTtuUrxamR7bIz/HaXEuMNx+z0mNbSBGn3V5kLQWm1qvqKNzfhj+Ke?=
 =?us-ascii?Q?nmG7u4r5DIa3UtsM9UnYa7yLWiWGOIwbkYbz4gPOQk56CNsap6eFEka0xjhB?=
 =?us-ascii?Q?Nu0ZNllBXPWZQuVfg/ipSrDmwqd85JsgHGdPdYyjJ3Stc1PlB53No4c6vDeQ?=
 =?us-ascii?Q?/Q1fAMjBu4iWEaNoqwbJr7UfhswJ0fFqf2Na8jJXF7sSlUgkf4SNx9fX0M7G?=
 =?us-ascii?Q?6ZB71eQ8cUjHUa1nED4ODt9XTS38c05PCn5tgp/7mbiAlexJBLOO9JufbWgP?=
 =?us-ascii?Q?n1wUCx2JLxQ4QjTWbRsnjMZfLlqX0Ol0AussSogBX7Z89iKs7kkiphGr+Na2?=
 =?us-ascii?Q?wDC68dvmiVLhJiveaxheYQyxAIAgP0E7mOunzGn5xLHatWfjVMbKAWZXKSDj?=
 =?us-ascii?Q?CzTtOPXZGBcH6sTuv8aYYEcF9NPFmIvyTEO+Rhi7wjII69b8ynFdR1sjyGOe?=
 =?us-ascii?Q?DbCWvhCZhhW/mqWntXgFgHoNJ/tT5fli0gaeTn+DqFrBbosksRUB6n4aDbkA?=
 =?us-ascii?Q?kzD3gna3oAcpQNCCLAsiJ7o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53d8aca-b2c5-4b61-d1fd-08dc97082302
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:20:38.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/bktWMAuSPzb2Z5M8hoim7lBJXmIGoamZJYCvsoOB8OFsDfPvE6fwnRqk0kh2ROe6iz+Qng+MHtH6VczBEaw7xabTnkf4dOM5zKLAtwTdIpmApsXi2XRZjZtA63MxX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5718


Hi Mark

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would work,
but might be not user friendly in some case, for example in case of system
hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state names.

Original
	> amixer set "MUX" "Input 1"
	> amixer set "MUX" "Input 2"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
=>		state-labels = "Label_A", "Label_B";
	};

	> amixer set "MUX" "Label_A"
	> amixer set "MUX" "Label_B"

v2 -> v3
	- expand example on Doc

v1 -> v2
	- update git-log explanation
	- update property description
	- change property name "mux-names" -> "state-labels"

Link: https://lore.kernel.org/r/87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87sewxapr5.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (2):
  ASoC: simple-audio-mux: enable to select MUX names
  ASoC: dt-bindings: simple-audio-mux: add mux-names property

 .../bindings/sound/simple-audio-mux.yaml      |  4 ++
 sound/soc/codecs/simple-mux.c                 | 55 ++++++++++++++-----
 2 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.43.0

