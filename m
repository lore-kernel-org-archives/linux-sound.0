Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58070230D35
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761634323; cv=fail; b=BwUwx4/F81FRzmYnVEEL5VUhcNEm2g8LTDJcVqTI8ZR0f7p3CJLq+AVggr0fmj04tvQr8jbvlYRPU3x3QL9d6D8GsJKw0qU5qFafvQ4GibybfKMjz5iA62b+tMgUWfmYz8ibZbG9r/5sf1V7TVPXxZY6RNDi4CI1cIex5BUWuBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761634323; c=relaxed/simple;
	bh=tFmFhrVJvaQ6YR0vTlz4ZIvAeV3lE25F4KdjDxLNZnw=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=GFlcjnn9BCOAEDZblxKMcZ+9m0zM/IwV5LGoK2cI/u2OddCmeMBLPGiGQeMyD+TDElUQcnl5CF+Dw3hPhtsG4nB8/2JYUdQYmDnNDtzgwmftgESqZvnBLNQ9AkpqREhEyajF61kyoK38pZPl0Gaaj8Tt53mHAU15YEcVAfLWip4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FhvX0Apa; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FhvX0Apa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHJi9+Ik/WW8pBSQICPLJMYSrNjDldB2xEJphZcz8vciqn8AmpodDh2qJ5SMdZoliZfSBzOqTmj1meqL28HemlTXSaJ+dv6E5arCBuFSpKNlDfCAKTPM4GLk4ssihVLNuwLjRsREqooP6nDZ+ruMkg+gUPtWyL82rI7X43UsH5ZZb0C8LNNDNMETx4yNeIGO58eMueMvK9ILuF9xwHGSVO9ixuuG+cKi5yWWQO3cjfC0Ud0yRZYKVnE8jumQHK+cz+6Awqk/+8skHj4EL/EGwaYx7QtnXz7oW+LBbqFJj69JxujJWRRDeGjkaOB6XnGB8AMUCJ81XChMu01WOjEppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGuVY0yRzB+A7XQUFhMbkU6KgvXNKZKtTcYrWnUjogY=;
 b=LIKXeSdguTQWLLQIB0iW5574q5haoWUvzk8tqq7bduXTtfu1CYvMejwdQe9Cni/0WjVUqfYO+yhRkvpZDgaJYXwkXJM851zJu5X+9sMUKRoYi3FMn4Q1uuDb+tznLGQtnU5oTm4IFq1D1U8d26RC5tEOLO2zm86t8PQvxAB9iznyZkOAR4ksC7UVcWCSC6FFpZ4DhdJgY9Za13jvWPuZEXkEs1Zp5hYRfMumc4QuUz/aN5wmwPKCjLRmCPijoEmS86o1iHCzaVGhT/MV0cIDOA/7p8HfHioHl8OqVQdMu+Tj3pAIlfni3H5W1J2mqQD8y0V/bHk6bfTHWGyO70gTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGuVY0yRzB+A7XQUFhMbkU6KgvXNKZKtTcYrWnUjogY=;
 b=FhvX0ApaWPLvXmHr7r0PD+eXehb3hwTs8HX/ZJyNvOtNVDbExJuChqGszVr9BG6B1XNtscp+WQb28mrBXmya25nrJqtebypRI17kQ9kdx7ys9oEW97DAGUgEM/ngeb+PzjiNz+4VL/dFovCKNXF1TouBHVyzWAZkeim+AHxYFxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14224.jpnprd01.prod.outlook.com
 (2603:1096:405:21f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 06:51:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 06:51:55 +0000
Message-ID: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC][PATCH x/x] ASoC: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 06:51:55 +0000
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14224:EE_
X-MS-Office365-Filtering-Correlation-Id: def73f29-7024-45d8-0b25-08de15ee7ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6y+t6dpj8AYHhbJ6sm/KBN8Cd4g+C/hHVVfH+TsyE/dZoNoz6MLPpCGpKl2L?=
 =?us-ascii?Q?lZJh3wvFmSV6k4qOLfACpkZ7KcUY/IMSrJKUfQwr3x4ksAiCkQX+FNUeppZ2?=
 =?us-ascii?Q?q8p8Q6bnrET1J8F06TFcwR4QSgoC5BWWc2zDxX1Nbf9lRC9W5bwme+RTbSBi?=
 =?us-ascii?Q?G/k2P8KqWUzLcpQ0WuSdGcteK8yuwGhVPDXnBgnhUB/LO9231xGOfFDK96FD?=
 =?us-ascii?Q?kCRLbPnhrIWE3gnOj+UNTWLLdZu3tv00cWdnvrYK0qY0XRzyGvpJeZl6XCe6?=
 =?us-ascii?Q?I2ymwteGKjpuVShJ2xFfH7EgtLOMh2hxuZLmpFPN/a07+W2HIapmvrSlxQ/U?=
 =?us-ascii?Q?S5m2HuL194yUYkRFeUZzZA3FRFoLLUAWJhH5J9RSKhrhgAzgOhiQXAYygTBq?=
 =?us-ascii?Q?beAU7RQ1/wBEiX82k4siuYlYMKiuw6+MaQKe0LnVWfwtAsOoKXoUT9/mc/WK?=
 =?us-ascii?Q?DzKjyfHmeoSPy7/BDzHqE8T7bj2V+mhLS22BElgI5YlqOKroK0zVOYzJZbFJ?=
 =?us-ascii?Q?S4QHLfOvSRMpV82RUgS2UKrqq5rq73zodiBayW/FkhUZayaS4HrimknYYkYZ?=
 =?us-ascii?Q?MtzZy97WbR7aShw0pFrMScWjs+Td3ASsEntBX51mphQVohvYfRYHT4zG0ZHF?=
 =?us-ascii?Q?UcnUnktpCKSNV34BU3esvs2KWSRmueg74HH6OfF9J2T7QVL8cYxscFzHVlYj?=
 =?us-ascii?Q?DKEK7JuXgcqqrG4cXjfl/sLJ8cDR4/l5CiQTTj3pKBlATBYu2If8Qwbaq6ld?=
 =?us-ascii?Q?sSZsPg8uHEXcCpRQZ4v+iNG+B+wRkWnXTrbU69Q41rf+GdOdvQOBjUrEyl89?=
 =?us-ascii?Q?+JiBcqkw0ktBlfg7oRqINo/FcpjAJRnOJ8nWMEU6jSIuPhN6xDCJepxTi/7T?=
 =?us-ascii?Q?rIzsqJsu2nXfhADgqiPlDMCQUk3daylLOTCWaRbxuO59dPGGjXWX9+J6HrLR?=
 =?us-ascii?Q?Scpa+be/FW4M/tlrOHmZUuPWkpHZPZtxxMSz1sScTcBer9+w3YxrCqTHZuX4?=
 =?us-ascii?Q?GCnn6NGGRgU7ylO2MCMEk2Tw9vK3X5k1Fa8Vm/ZoswdBtitj5oOGRC7AIRco?=
 =?us-ascii?Q?eQ4WZreg/dEDmTQpHqReWRR1sbL3OVmv3T67AL9qerbD9rY9VVMWWVS9FGKP?=
 =?us-ascii?Q?dX/wauDYskuv8iNd4IroSpQwsF4YCOI2sEr0pLbGon0Tnf5bg3lwON2QjTZq?=
 =?us-ascii?Q?JQfNwitnbc+IFJZsJOhTf0KH5yND2igs6nXkWSqBu6lQFMdDCSq/XOxtMilR?=
 =?us-ascii?Q?pA9nH0lXrrEs/GxiPd8rKDf6EZcR+Z/bTYAJwwu2O43e1o7OJK5ho2ECpWqC?=
 =?us-ascii?Q?Lmyz5GV4591PPPuB8R2b+idumVC5BHnRcj3NjPNRxRhGLTSEODxTFKK49ZGV?=
 =?us-ascii?Q?T8ZfcSUssNKh+g9I5vEcnIR0vKXnEVkrGU4yJf3oBLL412JJ+oVKL/vj7Hmv?=
 =?us-ascii?Q?Tgg3TNLOVDfxMP7zi5O2xLFfRZ2hE4013P9SsKcpQTNAlLdFMc0kwQT2qxg7?=
 =?us-ascii?Q?/fSYIav0JdndwUvcIBKomiKtJBkg7A76g/PI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dTAZZN+PhGHDlvXXwndd2aJ7OURwALsqE7NZ4OoV4CLLt+k+qO3rsIwUsgHK?=
 =?us-ascii?Q?1ATjB23fuZM3P58qVbyb3+/HMoawiEwbY4V+YFvMVXeHcHR7s0TE1kyhAJzl?=
 =?us-ascii?Q?WzZqIcSNE4lFZcuK7DoKQZhxWqODUMr67kNBb1xtobtdINSI9dZ5ISnpAJx/?=
 =?us-ascii?Q?w4xs/+lQm/nEFm+fwIbvpmG6PZf58wN9lvcduJjgOOQ2scKUpBgQgO3Xb44G?=
 =?us-ascii?Q?1aT9T8bOFPc+yrbU3h8toxAspmTF7cOmvvLBDLdZpl2ljRhoxd1e8+lFsqkD?=
 =?us-ascii?Q?JE6HYnaRbXyQ2PdTnUl3TZajFXoxi8ha2ZpyPvyo5XfsK3jGNg7QUUENPgte?=
 =?us-ascii?Q?s0T25iYjVPqy3ctVBZIOSo43V0ekNXjJRpcGxEXPFYOVfupurC6LyLdL0b7P?=
 =?us-ascii?Q?t8pnWc6u3J5WOzDAarre7Sp+S6ZyS+19y5ZhvIYZIk6uX2y8v3PKSrSWPQGJ?=
 =?us-ascii?Q?OW0okY6I+tj8xkhU6kl0vuUAN64jXu6gaG/9WsWBFyYRu+SAzG98CPjKFgYd?=
 =?us-ascii?Q?0tTb30GF11YuJQHOPntarm5JLZdDdhkUz5sqB3fMmcQlBKeJuavHu0kZMkVt?=
 =?us-ascii?Q?bncaVkaWIhiBlqvpYa2U2I7fUX0CAF76EtDLsA7r10ZapIpA0b6WKa72mv8X?=
 =?us-ascii?Q?RyHHDApbvfZXExK9B8LaSiHH/20Wmtx2dskrWC6oLR7vNXhYctESWjlY6/D5?=
 =?us-ascii?Q?pQi9xU21kzkzhRTNzkKEH+/pY5CeZ0byQTTowC0m5EqDmlDidLkEf7QbwKoH?=
 =?us-ascii?Q?+C0Bbkg5pPeV0CJm9SxzkIgjKYYYICPMcfJh8NwjhTuC6y2DzEgzswQu7B4T?=
 =?us-ascii?Q?NzqtcqEXDJ0KFXEzHvkTBcXVdX8Ie30TKionNGB2A61pbgRyM0HMEb9M59zC?=
 =?us-ascii?Q?sMLNaq1DNMyvxB+2ILlXXDdV6mTBiBrzfyrlEVYy2kaMJdJbFKF/ChIPmfgX?=
 =?us-ascii?Q?/Y2yLVOVG6i49eVUo8WMmA7S1oatI5pgkdnIzAbqWsSxopM+Kyvf/smGM//P?=
 =?us-ascii?Q?2NLIIO2KKkRxUEmZvRHvQo0BjsfM9w1+35fGZTrnnGtKgbSsxJruEde4bfpw?=
 =?us-ascii?Q?jmgE/MdHgCBvbbrq2L6jTyRvGYf9tlDoEUaZIkVtguUPlG2dwBdAoFHP4cG3?=
 =?us-ascii?Q?0pcXKjmIEJO4KjubOrX9ULypLa445rPNn6QLOAis7bYMETwcZVL0DHCyZEvs?=
 =?us-ascii?Q?1UGpfu8VnpmN6KKyzRt3yrtzZwWuRnjHMLf3pUPVhd8aK4UKW1k2xVD6ZJ0L?=
 =?us-ascii?Q?RvOP8lAsfcHYa9CDFP4tEFhSmUZtceK3Wmt6rMnP5EJuM8bv9gZtquGBkSdR?=
 =?us-ascii?Q?zlx7RV8UlbkDyiRSkQ0qTOoWoMcStLyOL0P93YU1MZ9sLr+59VELkDPkq5gT?=
 =?us-ascii?Q?6YwaijSbeEZohneleyQyiptyGM8+OQetG3DALFMtFH+15ZUlV11biKmubP9j?=
 =?us-ascii?Q?xfJFbS/fDJ8W5nxx4QNXvxazSfF8yc8m55MGUa535xor+zAsduYfwIF/JyZ7?=
 =?us-ascii?Q?G6WoW/i2wpTnhK8Cu0m/ugRNJXaUf4ilvazrzahqNOvzHyepF4keKwyW0B4Z?=
 =?us-ascii?Q?pLhE28Jl6Ck5lT0SDrbo1LQwinT9ttfKxH0QukPWiyXYH4icMHhJgvGY2NOt?=
 =?us-ascii?Q?HuxU9kGtQ+10BbZv4PKHpX4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def73f29-7024-45d8-0b25-08de15ee7ba4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:51:55.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVCdULfVHvcq5cdbHQT196uHCU05r1xUlGdsDcdtPo7XrddscBPt6gIfk0R3qSn7bj38ZzGQfnYjQLZq8gsmXuS+llh+d7JJihojGUPg7NW5gZyjBHyqYQjONo9IkkaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14224


Hi Mark

We would like to hide struct snd_soc_dapm_context from driver. Then, we
need to convert each functions from old one to new one.
Because it will be too many patches, to avoid patch bomb, I would like to
post sample patch as 1st step. I will post full-patch-set f it was OK.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Thank you for your help !!

Best regards
---
Kuninori Morimoto
