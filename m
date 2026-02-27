Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9ED33B6C3
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175043; cv=fail; b=KNR6sN3DnZU9q1ELMiNgp6DAXrKgWc2WjfCFzTsMzWSI+uufxjVtmqu6aDjb5nqJaWQEvtOvdyh0ZVcwEe/+S9Fa5392o4nl3ZHPZIlYF9w4RESyFbF5MJDwLjaFep8RJVvKJyYWdbApxsDRXKrHyulZVZJ0WDahgv75ieZcBDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175043; c=relaxed/simple;
	bh=UuvCf300xWUoeegLBKZ7AxZKZferSxsKLm3lcmC6peA=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=Z71TeG1nzZNk8+mU2GouhquCr3ijCK2BZjSDT+xSiSVTxs0VFQfR2Q97XKYyYrFnxm/K0Zu4oNbL07+AXw7iQPL9UZp2uNYfyv1p2TAO/F2Y1XTl651pD4htfzKYZFB18mC0Qs4kZl9gUSWyi+WT0E0nncrPPP8ulbGTMRUmZ+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iPNqOjY1; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iPNqOjY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BngI6WXJniPNn3NZ+KzB14Ghsudxb5zhmpzNQOCFql71ouaSSU6C8uf3ZcV0vve2fu9FY3il3OqVrs4F5fs/ZNDzlJu1TpTwoe6cvJOwzFnB67/h9Zgz9YVp3gH3dPZioD2c4Bm5s/yZJSFNfS3O4wyR74QmE/tF866blW8ER5OTzE+u8NUWTHCRBXAanAnaxCjlLyo88QQxngnW4MLFgZ6jXGGrDqbWsynhAwgzI0XescrteW/99iQWNVG3HStbgLX3WJvIpSyCR3ZDW1U/i/IlmUyOEEQtoKwMIhx7PddJoeezg7sWBHlWhlgjm3irZo6TeLDKv8h66B/cBKz+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuSsYl+Cj/FIbF7UcnSDkvj9p3tj5cIZu5yJaoKghU0=;
 b=NOp/iBv+P/njJN/wqZgw46msFwUPPtmyZRkEWWlzHleCIXTeeBINnaMuC8COqk2vwFNClmfvZW9lG48GuV/aoDTG9+srS1rXaeAVTAH1cIiAsJXNZz8Y2X9I2qFEb9ztjuMUWM6sca+v0Vni2+WDmk4RWy6UGnwNHQl3r/e+hg47FoKFVhOjh7CttQqQXHoSO9jstsMlRy2YNRtS08MM5rJIEC9xJH0jCKukxSPd580e3qrRIHYtUnC9e18NFCFX+FM5hYGtOLAFtEZF8ge+TrUJEpLL8ukmY2IbD0r47EZMnO9B7moQH9Puz+LjybnSxzrTTQzV2hZrNUrfWju+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuSsYl+Cj/FIbF7UcnSDkvj9p3tj5cIZu5yJaoKghU0=;
 b=iPNqOjY1LuYyqdLE0PmLql7U7iSHrPHEBtWugt90UEdvFX/zhJqxxuiFjPQmaLr8XFVSlV/KGwvHK00vYAAzN4Z9qwKuxHriBFh64jTPyIkTEZNJkCzmb7LyEp7QA0+Jvysyy7SLVNjuzxozTXjTVf290CTjCLK2lBgLmKs8SO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB9901.jpnprd01.prod.outlook.com (2603:1096:400:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 06:50:38 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 06:50:34 +0000
Message-ID: <877bryznly.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, Amadeusz =?ISO-8859-2?Q?S?=
 =?ISO-8859-2?Q?=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: Question about Card rebinding
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Feb 2026 06:50:33 +0000
X-ClientProxiedBy: OS7P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::12) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: bb54a3c3-9775-4a19-9043-08de75cc8177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Z25ek5Fjvv1XUDIBQtCrjQaATwwBLG+ANI9bqZLAob/+BKVgoezqa+BQUwHDWDGoQRgZke2BuozPljFc3pBJL2bAUbkPOEFrAPxsOIoe7FewfofM0XwE+vZHrw5ZPgkL7DQY3bNz2qd9iu8nwLvCOxkrFri4Tyk3PcKmRd30ZWxgnjuQ3avEDW8EEy6Gs5utBJpdYJDmmhkxOnKtmwk/+i/fQy40+wPwuPFOx/qZdH19LpKr8S+6jS5FkXNc4kopbDJ6wSO9Z4TA1eGuJlCqgDx/ew8CFti1u/207adFls1DNiK9HJT5b+pAqKMIl2A/K0JpS6b5DhlU25ZaAPEJ9JYN9hC20hWrV6rpkAnwRMsyjpdveAlJpYdtVgSs0ITV132sW8uqioyuch6Nh7cilcyO1nKiJY+Jbd7HBTDlciYmPC29/gvwBv4hOb8iP82na6xRROzZMALqiqKTIe7y9jC3cq+ERAZHi0NgsLjcN7ydtm6nlODXjlrZGJkwUi7fM8DNnsNiMiv+l2VVblcSedBJiL6bdHyfstdDetC2xW1kRi6gcPo32StqvFD0KfMp6hypZNQrvLiRmyy0RpjB28tYH8RnxKa6JFeEiRrvFYCXxJ7w/ciavwy37n6MqDkKeF5qyE/w5g+aheg5jUiQ0rl9oJX9KcWffkytnXpGjGhEfDhJhqlRZ95Uj5CKbUPX+c/NCPCKSDc96jQI9HCHkh9cdBhDKd4H2Q0ajvIALwXTG9mOpBcvAW47+N0yVtuRoZ1FU7FpPE7AVGSCA3kg2TclCHmTm8ZIn9yTa4bg2BE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phj2ucU19ACZpcU8cRd3aMTZntf45VmSiyfCvRPjO73qjqmfmxXedl/Ejqqn?=
 =?us-ascii?Q?PjLLH2t1pcQLmE+VNtJugf/dmAyTAiVNrqLcZ9H3zgPCgWLZKziEGtjdOL0l?=
 =?us-ascii?Q?VgKFHEU4VYSjzcE4cao1eZ1HDxy0pgkPK3E3Zi4v7ACZe0YXa0ftTq6dVtck?=
 =?us-ascii?Q?8TSTUptAcb13+zgb3PONE5PB2/PmubwEO4aTVnKmhQgsiLv7Z83FAlQNpNMe?=
 =?us-ascii?Q?TYePnqV6o7vH4b8xzpi0sHL/sDl5bGBFKp1EoFZqYSLSdtfTDSE19HAgayAu?=
 =?us-ascii?Q?rmc/zqOL+vKYVfT7vGHYs2sxITeiag1w8kmy1lLUbeBJ1Cf0PJj9CuihZps1?=
 =?us-ascii?Q?elu1CS0QAnifdGd+jMFNU4EYS4gCZDj01Krnp5tBkChVmLXYl/MmKK3UYPQO?=
 =?us-ascii?Q?mZCu5gVMnwGbzyLujKAj/4pfiC6Al5my+PZhosapK7dMmJ43Q+tiA7A9BzwM?=
 =?us-ascii?Q?27C5PY2C5dYTnNJM4wB7ROuh6xVGhoxGwckuSdloCq44uy7gzOWn1tHlOSJh?=
 =?us-ascii?Q?wt+xgQe09ilI4iYuvJJP/1yCGUQkhtqk3MwsdIGNog7mEHy8UonmACGsKmkL?=
 =?us-ascii?Q?lDgNQ7DUEZ0oyzQ729YY2411ZTrHrg/E50+47oFcqGECbdGKoEA4knGZJB4v?=
 =?us-ascii?Q?xyZwD5DVicORoeFst8EGsrWPMcHOC7ezcPtLPUna2x//9KTJfDqSjB2Telst?=
 =?us-ascii?Q?jRpXjAP0lJ6YfOsnh29OuDRVjefomcbavwhWFXmRszVKcod92BohgCozlv5+?=
 =?us-ascii?Q?EYYJO0fN3N4z1Gtc4K5gSrSBaIPsQCUfCT3L39Dh0QDqYN+73mI2b8LjZ6gJ?=
 =?us-ascii?Q?a8tGj/1CbrNl1AmMfdP9WVGXgP01OKHHPjN3aQ7M+GaUcmzFoLeAp8uMij8J?=
 =?us-ascii?Q?kVOskGn+2gk54Bh9Y339yjB3LPvRFT91RbVHolRguQb7Uxelv/0q25uLh9nU?=
 =?us-ascii?Q?uEMdwwsjUrBs3q7DTFCIGcxVDdCxb8JFNeuFaUaIMd9BzSjWknl4NzEBOBSn?=
 =?us-ascii?Q?e1f1hfza0Bm5+EmG+rDkp55okcSMcrrUDPV9+YTQ415EbxGOPx1ijaP6vcHX?=
 =?us-ascii?Q?t8da7ElNQx8X9yS4Wt8ppPA4gcMvmtTQCElKPDuXT5oHUnKXKmRbkAo7Q+BE?=
 =?us-ascii?Q?hxU4nn4r/1RXd3oAGL8ZW4RKM9fqn1p6ovPuzIEFbAGehh6tL2yjJQsKmaMg?=
 =?us-ascii?Q?dwOZI8TVk2i7iLvG16ek5DVgln4AH65gq8y1YlT0bZV8wZlXLKJ0f98bZ9Ad?=
 =?us-ascii?Q?aolEocfPl/yIxc2cSzE0eL5jJRuoEYWrhPhvl2RQJv88bidNX6xWNhpe/pNK?=
 =?us-ascii?Q?33V9kzdb5btoRQcpGsT9h7iBOfQiotGgt9FDlU7KUz2w/x0Ta/YvIrc7sstM?=
 =?us-ascii?Q?9/mShgAAMAUjm4AaAFgwiLD9B6DOKwEH8MxK4Vm1oAvrppNMpZtS3ZDmawXF?=
 =?us-ascii?Q?+R5/7NMCdk/eLbr6ZeKG5fvAueY0QMENYmbOYt54WnO/8UVp6Nfyg8cJKfxP?=
 =?us-ascii?Q?SF2MX3zB9ulzf6oiB4aUhfaRla6z5XJEjxfoHM3tt9w/35IREpYcauTQc03t?=
 =?us-ascii?Q?phIqhKEGXlO4/Ihr2XH+HFIIWcGQxvcVeTfwPSx/N6pjYN67fPbwXjxj5iQg?=
 =?us-ascii?Q?3Pc+GsJ2Da0vA38svtqOA8xYnddSBEJ/WJrUIqwcikatzo/j9/dWcNJe2AsN?=
 =?us-ascii?Q?Or9MH+Tr37o0v+FC15PBhzmh62iTEM5QDAQ84Z56p3BiZiwA+2e0COtV0a7X?=
 =?us-ascii?Q?B4xixL7qPVVsUW9Cqr9dYgRst4arAAn6mcLE1tDPBUkwhmgzy8W7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb54a3c3-9775-4a19-9043-08de75cc8177
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 06:50:34.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdvIqvaJUSnzxmXJIOSlkgSlA7Z1ir44dwA7StvZmeBZSAZ25Z6W4wi09mp5XJ4fEgZnr/Ou862pqO9igCxJ1j32MLTsV4GG6BMFAopcLSSSNkDCqbGrUTAAm/WtVJK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9901


Hi Cezary, Amadeusz
Cc Mark

I'm now trying to clean-up soc-core.c and noticed that this commit.

	a3375522bb5e28285cb1845ad5601bf4a581da04
	("ASoC: core: Complete support for card rebinding")

I think it enhanced card rebind functionality.

But the code looks very unbalance for me. For example, in general,
we have paired functions, like bind/unbind, lock/unlock, etc, etc,
but devm_snd_soc_register_deferrable_card() isn't.
For example it added new devm_snd_soc_bind_card() inside, but it calls
*unregister* instead of *unbind*, eventhough it is *bind* function,
etc, etc...

I think the behavior is correct, but unbalanced code makes people confuse
and makes code cleanup difficult. So I would like to cleanup it to balanced
functions.

Then, I would like to ask something about it.
I think this feature itself is very nice, but need to use new
devm_snd_soc_register_deferrable_card(), and the user is only Intel today.

I guess all snd_soc_register_card() user can use this feature.
But does it have some kind of limitation or concerns ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
