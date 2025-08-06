Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8484431
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 04:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455291; cv=fail; b=VCDRYx8zyTA3z6G7uK5M6vm45SBdL6VA8L4UAlEocTLwoJlS+e9Cufr3OHjHgkKn6vyJtZ3DM+d+sMx8niqpvcPT/x67ItZgGQB6/+4KqTcxdOT7M7xhZViBOHIZN4jXCSfapkd/bdstocnJgJ/pizlwPGQeiS7PyMgyXk0fyXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455291; c=relaxed/simple;
	bh=Jx8dk4Dau7qHC/gK7qhoa/k0G4SB9eK9C6cenxcmZx8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=WqPlmxR3rWEKMU1BPb9DQ4i3/+PBTALYIiHP5KKNXiFc471Pl2DI9zYsUipfnp8vbNPRe3GUxNgx6FJnNHpgTlX47uG1NbMBnLk4UWzliiVGgXgoIpy1UQQBpZ8aXXSo2sS+OrGAeC+F1Tuvupe4TGnTMMlBy8ipoxqZdv4VNV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S+orJai8; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S+orJai8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPaEYT5Ng7rfCtI97Iij/6DX0i0bCmb5Z/Up9MipLw+8FoNaA0r6/1baXxA3Ew/uuOeifh2jxXiWMW427etbeNhj8b8Vp9v+n0uJSCcvYiKAFQk4fRuqbHA78SuIFAcgTf5DCVUl1d7pZunNK6s1o6Khm7IJIIOIljKcY2KBjTXjwqedYJ4i64neAOpBNKO0SIULEMNJiuSorKCum69XmEV6IiSulYb8NhETRuZ8kVBeM1eeqXKHS/PHszGfb7cYy9LiJow9rlA2fy8ySZtLQfDt4Z80ZNFT0T0dWs+8PbYUbqcEuSNPZzfqVtJHTzIFEm+QVprxmsUsRtAO2OEejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNnB2VpVwJCl5ZhE7VAsojhffspAlJUbjk5+JVeGB8A=;
 b=MG9c9ReWrE3+ZCIWkvh0xn7+6z8GtnAF8dim7E4ONhnaEQz1muvONgXwBWD4M2S6//r9Otmko/0abGWB8obtBR9pQVC0yD5sPRosHbcOEGg7srmBsQvfUv+bd8Qr97n17nbwUGJY7KLXx/uV+hhmCqKGwUzLhKj3U2X3Y0dssQ95EsYE7dqEoKIreb+cgeeEjZ7TafYNPCLor9QSrgUfHqt6ThzpCkEmYs9YbJiEAIKq9J0I0G52X0QHhWu0M/RNYWGEFknyNAN2/iErlh0+O7bDpk4gzKgk3IhtFeL7/q6lvk1l0s5bbxI2gEgh8S/u6FhQ0vJpyKV1Zo8G7bWclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNnB2VpVwJCl5ZhE7VAsojhffspAlJUbjk5+JVeGB8A=;
 b=S+orJai8C9qd/zsf4WBC+wddZ+QwQfKXon416gcvB7vO7ccuc3Y5lfwTQlDAQ1klhTX2ufUBXu4mNvzkJcCSiCkNOwilsyvACA7rfFC3wFL83MkfeuK9jInf87dOa/l5PBOKuVerak4r33s6/zElsb7AQLd+v387AiR0zfJxCxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15138.jpnprd01.prod.outlook.com
 (2603:1096:405:227::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:41:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:41:25 +0000
Message-ID: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: unpack snd_soc_component_xxx_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 04:41:25 +0000
X-ClientProxiedBy: TYCPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e626b4f-da2d-4f4f-9578-08ddd4a38067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yqGTcOaLwBOw91x4GnqdT9j+haUar/tOQxZOWG+bqIVpdgxJ+y9jKjnmiQqH?=
 =?us-ascii?Q?hDqlIluvpZr4oab8bhl7W5jgBGsZFPVhk+FJxLyktlHYxHx9RIK7/JZfBdfr?=
 =?us-ascii?Q?4PeygdzyQKlXhBR0UzWM5mydlBF3zJ5vnb4Eao8kOh3hEZwDgj10MYcN51Pl?=
 =?us-ascii?Q?kApRcgM61Cg6glUeqI9dYRdp0V8PLJTmuIMTJsTLGpHD2lBv/aWp0O89Xg5H?=
 =?us-ascii?Q?zVchVEMBOGMpKU5go5dh782wwClLN7vwfBm2u1Zw6U63Je3GapGh3w8PjVrA?=
 =?us-ascii?Q?x4zUG6bdgUOnhrIdpSKoIfQagol2hXOtZ5j8vFOyMdqcLnDWRamg1E2ojzy2?=
 =?us-ascii?Q?mPhz2wyG1KUN7dv7MZN8eAVdBhA7yHTAkIIhMFk2ZD6L6aHZ/qN1gKMl7d0R?=
 =?us-ascii?Q?U8qDgujSDatJDNE5555o8C7iCa9j/Av9IMlXMDn2rnB6TCFv2eEXS+8q9EUT?=
 =?us-ascii?Q?RRgMc/6IqDQy8/tivofsXEp4411QAma8p8QwKkDk2GjZN3yRWkDAtfJ8eVlJ?=
 =?us-ascii?Q?K9xGK9tgFjN9rasvpOfDrpAU31LT/YmudMeo7unZOy7ywllste25Z6w0FMkC?=
 =?us-ascii?Q?cLv9NJJkdJcAR4IGKzFlrxUUWTSyfILuFpdh01e8HMwMkIm+sWYWbltazKqF?=
 =?us-ascii?Q?0wmzlE6uJjWmu4YeFUzOMOfwmt2Qf2VNyz0w91sNPdzhpGhLOADV/Cz9Q4HR?=
 =?us-ascii?Q?h3clIKUPEMWg2A9g3+o/PYP9wq3lWLaehhvv6PuElkV+KoN6da3gtQzOe7og?=
 =?us-ascii?Q?J7fJBftD21fw01JmyYk46g4yD+K0Hoch3MLR+Qxt6dCTcGrD6Oj/tbb2OAXT?=
 =?us-ascii?Q?vnfKyaZZ94lJksIdoyhh9yL4KAnzr/b7ytkY8g32+FAUwijomhE8wLTai+PZ?=
 =?us-ascii?Q?pABfjwgQjrTv+Sj3VvLAFrzrU+mxeeuwPi4yoIomHnUsSLzSAB01Ey807A+w?=
 =?us-ascii?Q?ThQwM20sb4moE4UUsjI+JnOAixxi4J2/plKdrLvCJTdQDQdqWdYygXZzDXMQ?=
 =?us-ascii?Q?ziW3ocBlSlThYTQKXP+u/X0OUuSLvSRfJP5tvsKANLVqsQ8EKe1O+4fsa8KC?=
 =?us-ascii?Q?y78DBoNm75CTVhRfBg5W+nJuStXeVGob1dB0canI9MCg5mTbVA6ibfPNDU6i?=
 =?us-ascii?Q?n6oJ7LxKxxHiZKOu7xIKztq7pMt0al4DetMnfmcbFHyDCawHjC73sid63OHJ?=
 =?us-ascii?Q?GFmhhivf5kgmzhEAaGreUhWwbU9U72L3EUYz7TehbT7XErpYJ3HlPX4zWV4I?=
 =?us-ascii?Q?7Dr3MNCcbuWmurLhjDIfGga/b5hNs7rT3/hy3KdYAXCDuGMOKt7v4YXrEgH0?=
 =?us-ascii?Q?3Mg2Dhpzyc7Q3+aSV9jDvSX6PfYhn3hNJp+98G/8gIDlvfg0E40ho+hiw1bN?=
 =?us-ascii?Q?L7Pdx17F9eFUovlBKD8JA+jnNSfw31qMzsKWO7hy7yfBdX6SSsJ6Z5Z8+1xV?=
 =?us-ascii?Q?z5hYOkqZiJqWJU9rl6D0sKR5JSm31wsLVJ+IFpDHm00aMbjtuofr+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yAl4sSwPCHLmSFYDycfML59etHjVvKwkSJNg4J5C/lKyYxat4YnbXNjHwxdm?=
 =?us-ascii?Q?QDNOBmUBXU/NY38Ln/R3Tpz2cRpU8NYLJhKIAhdyokon+cNnT2RIpiebM0cM?=
 =?us-ascii?Q?1r/tEp0Quoe46RY+B00zu0UIhZc2fJ7aucgFGPzd15bhB2p2MUrtR5nrPEMc?=
 =?us-ascii?Q?vKjjOiDobAmymGbX3Do4YEZLnf0EyQYvbIcQLjlYWytpr+7n/yImbObfBWW6?=
 =?us-ascii?Q?DuxVNVdZaX4kolQ/tTvIJ4Ze9NUOVEMCp7qlxpA6Xm8zKNK7liJaKDgyKWxM?=
 =?us-ascii?Q?/RVbYsXg/1hwjROFG7GVuiTHUnV+aUpB7PrUBG6PCCJmOpbCG5Al8ZDuxNyb?=
 =?us-ascii?Q?gQnB95CYqXfRPPBT2y7e1OVzCsoroX764LUYXHzNryyN2K8MHH99c5N3hUzp?=
 =?us-ascii?Q?DnXI7L6ZAbzlXdtjkiexGFEUWn7D0mLXHHdH3bTmWrxLVJcS3AEKp00FJTzS?=
 =?us-ascii?Q?KTQi48d896GlWviN3SlVqEdozshGJLDKJtEty7SQZKI2p3AX+kPYalNPbmwr?=
 =?us-ascii?Q?vQYR6GV/+gTdaMx7Bo7rLY/Yn8QVQfbHWjNyDXFvAlZ47hNi81H8QXGhRW8B?=
 =?us-ascii?Q?thoWIjdPsYbcl7gdiS8soAuKkhzBygcs9rD54LHQrZDBzz3zAh2zPBG8jXKc?=
 =?us-ascii?Q?0XM2VYmvOxBMT0a7xdsQazuO8hQWRxK6u88Sp11dBOKqeZcG53HD5zOR8dG0?=
 =?us-ascii?Q?G/RafA/u4reQg2yP3jYYNfkQ703b4RddK6QUFUxiBpJYsaYgJpMw7OC6do9+?=
 =?us-ascii?Q?qJFKNsi60e+ZnaKHgyQrus9EnX37NcSGOU6S1F5WEBy36CvLXmbnYrICFHBq?=
 =?us-ascii?Q?RSykkHi6AnSUTrhd9gfMTSgPGBkie4C0B9ske9RbHQXKhCIEGB5VHwo4/r/j?=
 =?us-ascii?Q?6DKsl0aFqQlt5ItPFY5nnwSJy6SVdPhXNkQ7Pzfqk3TJz/X3UqLMnU5taSPL?=
 =?us-ascii?Q?ButEwqadmmI3OujABDiGWnU2RMHdq7uHHaWVF/5SVVkBZyU0IYsBtU3SxDHu?=
 =?us-ascii?Q?LPl+UlLJ4dNRSHQBdH804GK0XMUOvbB8rdox78BnzZUGYzKZWsCXcrkxQfh1?=
 =?us-ascii?Q?hmVnrnDir6VqpWM96kSDCQEufNFlb818DfJruEcaaS5EeVeYIenBgzq+Gn1C?=
 =?us-ascii?Q?Hlh4euFfLOJ8HToJhWD+mrt1nEEm3LjPwoetGY+IByZxEbNyd0ZBkH0lZgxG?=
 =?us-ascii?Q?3Wi4CEnBJh0t4Xm5cS3cKfgH8LBNfwHnBW1czMnPFYYpa0h6foPp+8ohQwFR?=
 =?us-ascii?Q?T4q/RoYk1jYXiLAkcf4wuby1mXjpmGYZ8bpzQ6yuVp+1XGgA0bNosOTN0aDJ?=
 =?us-ascii?Q?6NsV6xR0bYc8IH5mA4Pdu6hWYJ+X8QR9ua97Etj3hqlIAvifa2QoadOFHLSP?=
 =?us-ascii?Q?tjqBeKxH71TlQXtCzfqdeduiJMPotn2xVh0olBmiWlm1LlNwqwp1F8jksR6K?=
 =?us-ascii?Q?pn7Y6ArDGUVBCCoG9yRlLsA+hQdSlingdIQAwUnyD4Kis7PJnrvJvBPT1xqV?=
 =?us-ascii?Q?KH60f4hGbDOy2ksFS9OZzUJ0NNdWAfGj/5pkbBtrcae9TKdhFhAQbFeDKRYl?=
 =?us-ascii?Q?BisvTm3kbdG5WH7AGQiZCHlFFoLcE9dLJa3+YexWXcgY0CUcg3cB60dRiFZi?=
 =?us-ascii?Q?d+gOqJ+nplC8tcH9bkUc49k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e626b4f-da2d-4f4f-9578-08ddd4a38067
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:41:25.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/FznXi6ORcs1GHLYRQeW67L68DRLhsfOAUFTsovILVR5hpVTyZbPquYI05velWupyccjXmrt58QkfUBdPTKvhLTi/aRT5EY6csyGD7zk96qgRdJMmYhzZNzgKLmF7dT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15138


Hi Mark

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

This is prepare patch for it.

Kuninori Morimoto (5):
  ASoC: soc-dapm: move snd_soc_dapm_get_bias_level() to soc-dpcm
  ASoC: soc-dapm: move snd_soc_dapm_init_bias_level() to soc-dpcm
  ASoC: soc-component: unpack snd_soc_component_force_bias_level()
  ASoC: soc-component: unpack snd_soc_component_get_bias_level()
  ASoC: soc-component: unpack snd_soc_component_init_bias_level()

 include/sound/soc-component.h | 45 -----------------------------------
 include/sound/soc-dapm.h      | 38 ++++++-----------------------
 sound/soc/soc-dapm.c          | 31 ++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 76 deletions(-)

-- 
2.43.0

