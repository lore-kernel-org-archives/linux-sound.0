Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63C3D6D
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328608; cv=fail; b=K1Pf7eKODrac5XVp3cwRkAYvOuYVWBRbqSzkspw7UuOoXKxv3sXh+hH69gmUGw92UYun6k7zFiG1jp835/RFbLxft8jFDUxaWlAjQHs4sN0opaCy0JK7h+jjqqXYZ4JgiyW1Z7eADBX9FYSQfICD1FiO78by4OUYeUKjJ2IVySk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328608; c=relaxed/simple;
	bh=+l9oorpquDafxc8ChaJZxAeDTXB2J9hwcx2HYn/ZoMI=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=C6GRUsDVeWQEkmGwcxIqX5iSZAjKD+Vm1Ahi9pykYn278Ro+16iiFbROcV9ta3D1y7nwiDmM5KqIY1glTFv9Zr2fe/5fEZcUlSpb64XdShv1DKRXZcyt8IEtAqYQwIQ2mfMrWbZoxzllq3Ffo8lQCCAvzBwmvhttXxDD6FmCuGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nUS5LJ+C; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nUS5LJ+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBe+MxeQAp+kxMoRI5mMt92lvQV4DrOxxYnHJoFhQDdzobSHauOmhWTbpRJh8TiDLNo2+q8FaWLPwSr22sI5Q47+IUQz46KZtNymjJZt6DXzAb6J2ZMi6BoEItHwQtwtGTajtknz3KcwDdn4iOlwum3P7K1oSXrab6qQZYWyr7Gp8QTDsx3SG26/kXULqNnXM+ynuGQLe3dxJpUOuV3KhkDhl58uu+qhd8FuIjBsPbi9WGUdWjHXX27amMI9x7bgNjinLujhXWVT6L5PTSEi06qdo8Ixnvvpxy8WCN874IGx7urNDuxuL0uJt12XP/qaISpwvMCwBFNQuo2sBYklGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5UMdoIQVmVwXQWqyUE9M5TzRc5TeUaWAu2c43yV9FY=;
 b=rDSnz9O1hc1Hi2bhoGIHPtUYgxUERueLL8LH40FYAgA8De+UEMsmlFDB2UCHWuv8DC/b5k+p3oEn+7gJQL2p7q9f6NiID2V8BszS6e51aYO83McTRlgBeSag7Oq/Z/5uaMW2IgZ+nRJty+FrWMD1wvMKpUJX7FZ4kJN79sJTN69DMHH0zYps7NVyOVVd9m0lbw0I1F0GL/f0FnkhncypcYrmkofFUrBkXf/onkcB6sZiJEXKT088f7B9yu5K5deVuQQ7P7o08xVUNYsDCcJlzM2O9F4nE/SPD2dI/hC2r/pigHsB5jllBezp/X7D95XbfkjnITg+Cqhc9CqdY9V99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5UMdoIQVmVwXQWqyUE9M5TzRc5TeUaWAu2c43yV9FY=;
 b=nUS5LJ+CHCdO1e0tF7aSvEFYnrM+9ax9KgYPE8KBFH0LnmaDhGIXPzU3BpZzdP0CIWQICii5gyBLgcQ3mTAK5pGYiGnd9A2TxXVQghiGBCel8mnGsZgevKwlKjzRZ6vIasHj3OS1kIILFeIIDp0/QtB6DLsBfR+VXMNCC4Ifdz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:02 +0000
Message-ID: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/11] ASoC: soc-dapm: cleanups
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:02 +0000
X-ClientProxiedBy: TY2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:404:a6::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 8548886c-c92e-48a4-d39f-08ddb8339ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EMH3EYnYNigJ+Ko/Z2Jc6xmDwuDUG0R8tcoP9Wm240bljDjaZGiidMvw1uGO?=
 =?us-ascii?Q?EPsMZsfSm6T6tZhO6UUr4ExbD6HSwCHeoNW9zl7y3mKmqbX9ycJYxWHE4DXl?=
 =?us-ascii?Q?CQj19lOjNCBL3ODLXCGPtE3PPZ5j0t30vbzery3pVEjZ3fTTa48db63uyblu?=
 =?us-ascii?Q?mp5kyezqE4jIyf3k95deuD7qqM/TVMF5sUJaLYdcEJPE5CwTw5a+yHw+6AUz?=
 =?us-ascii?Q?t5v/S/kbrLc5bJRz1IVpJa97XBN8s04RjH5CbhI0PQ98gGmVg0YWgTmqPJJo?=
 =?us-ascii?Q?omYk+jzuWTTJdlmNvXa003BJbXszWy3MvFTLzsrVcw+DjrL1MuSKDv5ZYLgN?=
 =?us-ascii?Q?F/W8RZjaDcelyLFDT0v7jnmwVhRU2ah6P4Q2O7vLny0KtIxFwjcM93mc0Ym1?=
 =?us-ascii?Q?X9O9KloO2+yPz6JgjUHLL0yOtTIumbSYyoJ+AQb2td4DaVMFEFjjrzMHcsrB?=
 =?us-ascii?Q?A4LLVi4szJuNKZ3EAbhq1dbtf8d2Ty85zmvmhdfsj6qm8Qr+/g8HJbjhB5Qh?=
 =?us-ascii?Q?dip2tJ5xc8w1IdsoeO+vRgeVXAgN3ooBeqm44cGVvrIRZt1Yn9jCxaZIHjUZ?=
 =?us-ascii?Q?+Nd/niJEWYeG2FBmc1ZDNgKqnGHFbwc/H3h0eUSBY5CwafmUUuBC0iNvkuqk?=
 =?us-ascii?Q?8qtLgCpOOdaDie9BgmK9yu/iMETouyQG1vfGH32fWJGCVPT2jSxa4rZBEdDW?=
 =?us-ascii?Q?w4zmTfkEVh36Ni6AYnh+0n80XUbhTuKoeJ+duGC2uzdEfbB+Xo0eAcV1zExt?=
 =?us-ascii?Q?9gpqr0FEdQF1JLgC88ve600Ck+Eu4h0uw8Ws18lNXx9mzSVmuqw0tro4sCbl?=
 =?us-ascii?Q?0DJf40e4t2xz+A/hbJGEsXHek+bPk8qtn/gX4Rfv/N5+7nJOopVFeEWlDCqO?=
 =?us-ascii?Q?WKhAMUbsOz3M/Jx0LKyBdKbUqM9HfOXfa+d6MJkl+loOJH5bN7osmSiK4153?=
 =?us-ascii?Q?0x90r52vnSj7OzGLh9wRg9zpFiawx5FIRaw58gBa6fx8HG4o7AwNd7bU9/mi?=
 =?us-ascii?Q?XpE3aKQtb354W2td3WxxP/P3AW5Mb4/6Xjm72GDIK9tHaLzylIOYUvd1c5gD?=
 =?us-ascii?Q?37KrJQq5LQA1jSxQBiQBUMDvSVzbN+hTBbETSkKhbe8bjGiBe9iwAIe2lQaC?=
 =?us-ascii?Q?zTcpJt5PrCLHF8bHKDiuFxORMXGw/VCqB8Oih01q4Uv7Kt4bxu0u3TM2sB24?=
 =?us-ascii?Q?TMTHJBnPewdAqcdULrQX/i7o4CixoejLQO2i/p1p0RcfPgDT+3uYdrYBXlIv?=
 =?us-ascii?Q?NENDNPgyN0RwlgiwQRYMRPFbmg+mG4AExAnXcU7glOKpyizC8ncsqrBqdCtU?=
 =?us-ascii?Q?dO0UiMG3dr3oCKwRt6FlOVP6tCaCOQtbyZ2Qe/xJIYtk1GZD4gJaV+OyiGI2?=
 =?us-ascii?Q?OgHphf6C6RUmfS0Gm8R8u8tGTft4/kihFFNe705A1P3WLSUcLe5zoQkRmrBq?=
 =?us-ascii?Q?UDofpBpPXSr6Jun8lIruisJVHHJ4DRoHjpJrqaydcGLUHleGmocCXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yca6silgc+ac4t/npfBCA0eOGV4Nw3ONjQJ83CGnHTFG30IGPJB9ilhZ3hCS?=
 =?us-ascii?Q?3ZHDrP2eMXUO3dVHv/9qs8XLzXvTu3kLdrGsRVbSAF1JsMAhLFNv4r/yNDf6?=
 =?us-ascii?Q?PXyYVa7SsZb+SuQBgg+cOk32aGxh4U5Oh+sllEDHas0s4ZHGXdu6vaV6foQa?=
 =?us-ascii?Q?p37pxNqByc+VGSEH6uHeRi0tdg+M+DIMYVLEpsx/IQ6mFaQWIcdZClRd+Ix1?=
 =?us-ascii?Q?t5VU100tOTybHYIK4L66oyEDnKDLTobahqzFM9HwUnpjrR7mpAW39lYoupMc?=
 =?us-ascii?Q?4hHrHqunNiGxuNrGxLyPIkl/Ev9FOtWDRfIAsEkGZpvSMwa6PwyyEHDXUF6O?=
 =?us-ascii?Q?SHR1ji+jml+H1bsXFSvsSl46/8hfA0Y2a4YLFlz45PV3G52hJV6I9euoLgVn?=
 =?us-ascii?Q?Naq/4lsmLKB6wUcVHYm485mxli6RLrUIcpwx3lQVmIbwVlbRyOESF5uk7NoY?=
 =?us-ascii?Q?jn9QnZ3PQc/A6z0Drzyzn2UCdGPB7mW6ibPPCnsEnXjvg6XK9pbZWjvQgCEr?=
 =?us-ascii?Q?a+0pi9wAEpnL4UK1KhaErWCbNaCWKXFmh4Mx2Fq2SJYCGyChbddW7VGWwQAi?=
 =?us-ascii?Q?EsQYaH69yt2PUY9pFymllGFqkFfm25UdQnWfsrt9LImwoYjXFDmxR7zSUS7X?=
 =?us-ascii?Q?6gst+YDL1pXNOs/4tUdboBXjUOlUwylZ3wakEWglYThLnSUDd6b5aYz0Hvu1?=
 =?us-ascii?Q?Uuk6Dl/15roTxMErBQ/4mQzFthRhQPNzzTMvVBtZWMkpkO/4aJo+c0mzpWV5?=
 =?us-ascii?Q?BIk0fnEumqNhLT98NwHpROL05vG+mk6oY3z73dnVmQYwE1SnMtrzoARy7q21?=
 =?us-ascii?Q?NYrT9EAt6YM5md31NUKPbatWfh44sZLzSpfl7a1EYtDQZDgy96ukxoacmpsK?=
 =?us-ascii?Q?jGe0rO63Ghw6MXkzhVm7sFQmjaOvL/06qKHmMjbW/viBO6YC8qLQOvUCIbht?=
 =?us-ascii?Q?GbySrC6EfFzKQlSfCWqon6V4FnvbFZ9gqivwQcM/3DfVyCVG70FaRyIsix5N?=
 =?us-ascii?Q?IIHoYAQN7JL2mHNwOwcyEMl040y+b/Vs1W2sTBPZT0oIcfU+APTSZnPUJskP?=
 =?us-ascii?Q?TmPa3LUZTH2VvJfbIw/1oW1ZDEo7u/T4gEXFcORERZ4PJmYohG070HXdg9zi?=
 =?us-ascii?Q?VwiXG8MuYMBNcGqT60KKEdSjdcpram7cr8czXjnBOZRb/vbmnrI5egVkUNKa?=
 =?us-ascii?Q?IwQaIaQSRcPOE/BcsHQTNlA18d/PUBQ6zE2VSOF5m8APCCejnSq15Nz9GQtw?=
 =?us-ascii?Q?90GANFNJq+Vl5a43x51v7DI7Tp3rui7GJv9SBs1JonbA4I/7CdtVzrhtI1hR?=
 =?us-ascii?Q?OPzCqDt4MUwOtdjrWMyLjZFtfsf45kcvnGN1AiA7UxZIhIuqYbJwUvznEbg5?=
 =?us-ascii?Q?wGdkNVUXTxSANQpk1PN0VZFfietPx/8MLa8gctBEbfbx1//uDkdxtlvZ9QQU?=
 =?us-ascii?Q?UxkIycZISqVrbfc+R2Z5L/m2/Ay732hkTC3PR6gmPR4/2jTt1x04ekJpAT5Z?=
 =?us-ascii?Q?X6upXV4nXZcjoCg+pxYDSyIELN8dKU/rl5DaCuN1HhiV83vlV4VpAlfqA+EO?=
 =?us-ascii?Q?xdagv7Rw84kv0pkoF+Nb5dICHuQXDMGF4YHSMcaRawi29asGrMnl2nwlSuA2?=
 =?us-ascii?Q?NQVMOocpzYWGQuBtyAUdtZA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8548886c-c92e-48a4-d39f-08ddb8339ff3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:02.4873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgOG/fB/KQmsXvNuaeJF3v0mfA5c5tjBcVxhUlwN2kX5DT9ZBPr2xHnVctyLYKratSw92UtAwoM6TDpg5jWwrRPBjcdbMCz9F4nb2QurkC3sfWtDIRwLsVY44vU4e5p9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421


Hi Mark

These are v2 of cleanup patches for soc-dapm.
This is prepare to hiding snd_soc_dapm_context inside soc-dapm.c

v1 -> v2
	- remove EXPORT_SYMBOL_GPL() from snd_soc_dapm_free() only [02/11]
	- remove weak [04/11]

Link: https://lore.kernel.org/r/87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (11):
  ASoC: soc-dapm: remove unnecessary definition
  ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() for snd_soc_dapm_free()
  ASoC: soc-dapm: remove snd_soc_dapm_nc_pin[_unlocked]()
  ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
  ASoC: soc-dapm: reordering function definitions
  ASoC: soc-dapm: reordering header definitions
  ASoC: soc-dapm: use component instead of cmpnt
  ASoC: soc-dapm: use common name for dapm
  ASoC: soc-dapm: add prefix on dapm_mark_endpoints_dirty()
  ASoC: soc-dapm: add prefix on dapm_xxx_event()
  ASoC: soc-dapm: add prefix on soc_dapm_dev_attrs

 include/sound/soc-dapm.h                  |  236 +++--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |    4 +-
 sound/soc/soc-core.c                      |    8 +-
 sound/soc/soc-dapm.c                      | 1014 +++++++++------------
 4 files changed, 552 insertions(+), 710 deletions(-)

-- 
2.43.0

