Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF586347
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568696; cv=fail; b=uWwJrb+CP68nWY1kAG3VgEdnXyqKEhE/4vMOOwZxxxXn/wYB8J5IEMgjv/jbHqHFj7h5bOhJdflZCf1dYAb7fkLtCq0a/kTGTnOmp7VBK2PaanP0tYZLwXG/kCGIGJFH0i6dIkYP9nfBVgPtnO+Y68riRPlpdlCoJJpJNmmdC2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568696; c=relaxed/simple;
	bh=yfjMdszlYTJmeoE4iUn15hrJVChgkFF/z6z5INJ4wns=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=S+rkzdZz/l/aQid0DarvXhrvbhrSLUowUDWXqH6Bct4RwNX09RNwII6DdPByk7sugU6j3L5tdJpWRMIRYDBD4konVU3DeOEoLu9L+3hetrVmWSsJIE2XWXRtP84xSfAfJDYo1kIUQ/o0Jma0CsbKF1MTM7rL1389+q1qmCUsMpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fmkSt3Mv; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fmkSt3Mv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvAUVEzpD0xt1727i7HmJq/M2cgbqA3DBtK/MgwHMr7GyF8lVbyrsnCRscx1TIqG8Nqjl0XeTj7Jrg23BlHtm3yuJMj3gTK6Eihe8clUvaLt7U0TYnHzE4149gIFB5JQPCEdQctvj0l/J9NCO3vciO6ZeNxzX2UmG3Xk4Q7guyb7sjeW8Pq3Y5gpekkhAYmui+LPDNU2S4sNFRW/LcobQV3jLNLJigjWg23Uujs1MaYT+9yDZTgxE/qdMMpbaw0su1ZYDXbdRzN/J4javBPV2/2+u360PgkFeOyu+LrlTx/JU2iKCnBbLJFLTJMCPA9rKaMdo9k5L4GeaVTKnJGh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqaM6rGlNFdoUKEiZ46zYq3ufnfgIlGwVH0eAUTQ6YQ=;
 b=CSF6sXyvgx5Gg3GBZqSttP8OKwptqHHrH59XwPAEHuKpmLSSye7li8pwhr6PPkKqnOi57NX9BtFe4gdYvb0OAPjpC2L4i5GVGLt+q2+5ssmpLzM6xqB5sFNgaFViRDhxUmVg5nk6xqYbkppx6dY04CTp10GuAWcC2nIhHHHYrKIEcq/BtqyBlI4+cZX4nbxWjajrHIKKTGZZRexDqEunYoXXE2EkExJkEE02+H8N0XrkFK8u3gR8fToBzJfbIHJcxgANCl//M2g43gIIlNfJfR6AdG5maI9U1b7rraD9SXvWETQ41lPQbfqSmCZdWzUwef0dgb6l7rHv0pfVtfpe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqaM6rGlNFdoUKEiZ46zYq3ufnfgIlGwVH0eAUTQ6YQ=;
 b=fmkSt3MvEhdyrfXcPRCBcdQ8Zq0NGpgN2UkycU6rUQt8rJJHbMrd2jvcRceCb+T1JZ6tMAl1VOz91XB8c43+B5r6Y05loXumxWVH3C47+N3d1nVPeV78JETpbprkeQiCiK6/s6WrjqZNvJPYgpkHan5utJNZpz1XEv8mSOBdTUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13973.jpnprd01.prod.outlook.com
 (2603:1096:405:207::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 01:58:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 01:58:10 +0000
Message-ID: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: fixup snd_soc_lookup_component_nolocked()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, J. =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Aug 2025 01:58:09 +0000
X-ClientProxiedBy: TYAPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13973:EE_
X-MS-Office365-Filtering-Correlation-Id: 51aafc59-6fc7-4146-58c5-08dddec3d928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KnCmZ6pX7HWsBCHxPQGF42vOiWljjc9xyFxjhJkhnWGC8xVEQ/OTIMRSzWI1?=
 =?us-ascii?Q?Tj7P6PMUdkWq8DDCoVPgvPz1oGrNZm+nT0VNCzFCfl4QZIMIqv2p35N8KePP?=
 =?us-ascii?Q?vNdHOYkj+yxj9tdAgmnNXr62UDXf3z3VXJxQxn1pVyZGLHezpQqm8u0pIoCF?=
 =?us-ascii?Q?D+mkwiKQSg9YWwYd9fa+yvK6YLy9KwjFu1Tp6XrcKM14OAowPhQj6CedKJ0Y?=
 =?us-ascii?Q?foiFwob6fpfqGQjXAmYNt4TrLaI1rw1xJ1yhtMwJTgf7mzc0t22jDQOhHdT5?=
 =?us-ascii?Q?p/myS3g6nB0U5Y3LGWp/cO09738GEeqjiF5Y/72yCmQ7WdhQu41Al6JJ62Ui?=
 =?us-ascii?Q?WeF3J5ZJidO6co+euHoIzhKerH0w7Yn044gbn4nz/4UqBXWv7B4ofShx3mv2?=
 =?us-ascii?Q?FMFU3QOQMznAMVrU76x9P6qXqT9ikQwyK36Mokj/cjlL0VOsw40StXsun8gi?=
 =?us-ascii?Q?Sd4DIv15ki76MSNOsV3Og6mlaew9Cl9AJxF+MPfSz7zuotP85k+yv3q3DeNl?=
 =?us-ascii?Q?+S0T7tzpxfUCJWlJrpZvnTDJHzo2ysyzYg0XEeosLakVoMaDHc8f8r1mi1UV?=
 =?us-ascii?Q?jI/l5iCsD/J16seFk6FiGtlyjrfS8m+OJ4khSKuBvW0AcO9hv1ZgcwYOmOcJ?=
 =?us-ascii?Q?M3ZEP3WBQoaGgiPdSbIqDkYV/bcJ6rgQvuadSf3ryIuSQCN7mfibK2qnzQ2V?=
 =?us-ascii?Q?loLot7uNsRUdHhrfiuQ/0g1tD/EE8xM0qy1GrGLr+ke+PtwNctvIZowTyw1f?=
 =?us-ascii?Q?/IIwuCUaeJmF2OhCdSpvJwzCp1JuYWFs2/UmmgnuTiaW9e47gmsoKvDtqMNT?=
 =?us-ascii?Q?V58SqM9oAg+wZvMJNCgWrrfFJHuqOmzYp4pglOKA7c1/KcG9+GFh8EkarP58?=
 =?us-ascii?Q?juJUU3gsw72p4oz697p+8E/Zynde15vAG9gcNg3HD+LYvCIQQH30tFJlBsVv?=
 =?us-ascii?Q?NbxzatsXSy0iy7WP6qS2HD+qm/EHiRih6uXVm3VhdJ0E92ftqarLf85fpZJV?=
 =?us-ascii?Q?OsRuF6X9IcyQoDjMHtLkqpQ/l249ZgYXQ/1ACMUzPwEcK/scYN30yt0GvDi4?=
 =?us-ascii?Q?KEJRQUXYQhUgWtGD7MgnuhUJq8NCrxDLJHKhrltBCElpeMXYpM0syBCDtFdS?=
 =?us-ascii?Q?XYHN1/7VjLJo+rP/NTph9DZXoFlz3xeDPEU3T71hhQzq3aYLNZcjhkhE9nnW?=
 =?us-ascii?Q?T0FoSw7X+CyrDc0LBchQ9o+LUrpw9gMh1W5o/cR0yNXBC5VjeycXq/S5Ky7W?=
 =?us-ascii?Q?IL8DsZZc6YCg2T4HTWhnH4kpfHDhvU4ul7FT63KGLicR8huNJ5ED03iAG+lD?=
 =?us-ascii?Q?pI5XnMJNBaRtm/6R21kkdvAHfbeHYMaK2dEvKaHSYdzIe0DpVoT0dyzfW2ze?=
 =?us-ascii?Q?soo8AyfeDJ41bcWEGiEoJc4No4sxoFiON4osS7ITFKO2kqIEjhE5Hsh53hUs?=
 =?us-ascii?Q?+cesOHizBO5eGVwsb7sJ+ps2/kcUDZwR5N7vVLAbnrCrTlzCm6U7ZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MihiFU7snb3GuTJ1c4M1KZ85quq4awZV35+iW2bKBIyvEIlbeG/ILgbbe9j2?=
 =?us-ascii?Q?U6OxF9PTl+CzF8n/7IpGbQxblA34vZSznEstqIzvBabJf2XanqLqVrZqXoT0?=
 =?us-ascii?Q?hwtW20S1K3PV/uKY2G3btYJWVXLQpx4+pHepDysW2wey6E+2AwMFGSjWEeB0?=
 =?us-ascii?Q?zZ312twUab1j3zDQAJDqInlHtxA/37qRuc3fMT/2doWXeNMcWrASI7rUWum+?=
 =?us-ascii?Q?qZjsYm21lV+MVcSxwziaDX7IwO1kL/vgVHNu2wfMOvrNs7I9Z0vmXXuDsm26?=
 =?us-ascii?Q?xH2WZK4zGuK1jiECYKbqnD9e2BjpAtUjxFCub/6R13EVMBdq+1Ur8dIesFKQ?=
 =?us-ascii?Q?p5wi886iGiErEup1JahxdYrmjhp8PADLN1bMVXDebO5rXt7Aqm+VUp2Z3JNY?=
 =?us-ascii?Q?A44eSqBgyJlkojDjAAYjcWQvqwZQilCRyp6wioHfn5w5Ql72aD4YVeIbHCK+?=
 =?us-ascii?Q?8E19W/+EbYZUx7/tAS/ilQ02u6zre/9+qAj8K/TJ+p9mNPdY9ld5XEYxXHS5?=
 =?us-ascii?Q?cjVrxFij4DF1RFTXZ+zKVf1eRlQomviHXWNFBxKKq/snY+ApqgxCQgbsb7nf?=
 =?us-ascii?Q?VsuP2CBdNWrd5xOPv9i6B1aD0/I5z9CgiD2Wj0GqiOJ3cny8VbXmaV1yiu77?=
 =?us-ascii?Q?7X7ycJUc+luvgOQRhLTt8VlG9VG+ByuupN0xklaccy/Gx6dJ2injhFmf85lD?=
 =?us-ascii?Q?+g1kAiaks2WFW+HKkAFNakjVunwqtGjoNJ97RvKvydrON5TevN0spjowAsnf?=
 =?us-ascii?Q?6ARbBeKRGxStsbdaPb1GQvdFdwG3L3Dg4Yqnn2kS3xNWVy2AlTYJwcvIsFE/?=
 =?us-ascii?Q?3UgUYNd89P9zLvNVhAxL0QwGNATXuWFhr+YSn+h+ns8k4RO7LZvQeqcI8xpZ?=
 =?us-ascii?Q?FrAMm4qG3PWwOWJG4RcAK4Ao3dKi2wdv8ZSRO0y/msmczsOUQs1/DzqAoNTj?=
 =?us-ascii?Q?cegNtSke4F4afGXlu1NJbyTKDL8XcLr6W6DQVH0pWiwiIum2O3R4GBBzmnQ4?=
 =?us-ascii?Q?3NrVfl5csbn8OaRrMy+YYJNcKUPp0px7hOhkLAxzATtVUxS3ztNOIdxG0R7H?=
 =?us-ascii?Q?//HqV+3DuorJvvci/dyCB1xH/d2Iwxue1CH+OF40kSYqS59DCmQ/TSaTT4on?=
 =?us-ascii?Q?hFAKx2Km+01yGbCtJHCvSM4+E7inUGVY1g/21gIRenXMi+9VFW2IZlwjIRSv?=
 =?us-ascii?Q?J+nfTp3jahmCpGnNXYXe2iXnTWGBM9KLAf/XhDCE8L8TLorEuHDo7lIpwzzx?=
 =?us-ascii?Q?Z+H8hdpGZJ/RjWTjNKf1bZOfDIaBC/xOjSR0yIy8MwDhr/3hHqFBp01qGJ3h?=
 =?us-ascii?Q?ro1CI+YygZYYKPv100/ueXWDJ3Fnp10KShe66izItOdtxwbV0pniDFY7Xhtf?=
 =?us-ascii?Q?lQ4SIg7zkp3AsoDcpDcVn14fHs2gjPil3YfjYiVW9IHr22eS++KFvB7DfetM?=
 =?us-ascii?Q?Ufdv9zWfn16duyqlskF14SNkRf3RphYjxDmTNVRUfbU+4aF2Qq6k8eNi6UdT?=
 =?us-ascii?Q?VgVibwEDBE+dqjbwo7zmbpVipKnNC6gvahbcjTLC/Mnhgj+ZkNVaPMEbaINz?=
 =?us-ascii?Q?t0N7TcR2Bq/jCiMf4FxqDBl6DPu6cceO270vVClQlWWz6mgjT9udFuZRVZt6?=
 =?us-ascii?Q?wj1nKLwZBjhN9lMXwpWIxvY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aafc59-6fc7-4146-58c5-08dddec3d928
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 01:58:10.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwyfV5PCD86Nq4XoCGcGMcis6JUNc8/ZE2Qy2bl5RXzKC60JHY3FVzDCgD9W4gGLkSvXqgevD4KuMOiuQgOb0ruHMiaYI8wItLp4RUPDabJzk8LAfLRU0nBsphbAvgP3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13973


Hi Mark, Neuschafer

Because snd_dmaengine_pcm is sharing same dev with CPU and Platform,
snd_soc_lookup_component_nolocked() might be call with NULL driver name
(= CPU). This patch fixup and cleanup it.

Kuninori Morimoto (2):
  ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
  ASoC: soc-core: tidyup snd_soc_lookup_component_nolocked()

 sound/soc/soc-core.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.43.0

