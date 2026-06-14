Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6243D2882BE
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 23:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781478899; cv=fail; b=dJC2tivdYA8ZuO07TUprpwadKuLfttHgSfYGxicfkiGVdA5Z1HgVDcERl2odXHm2xRlsj8mTwVj7nMnaufk/p2nbGOQOuO/nwBqbGaAWlZfaEL0Nz5mUeL2ol6TYzumc2I0C7o+BMQR8tbcWaQ1whvIM+njPgl6CbFf//FyDSAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781478899; c=relaxed/simple;
	bh=kjVu79ot8y//LyDcjd3td979dA/09xwEbz+bOcJui/s=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ewRgMD8zaXd2feh1IWtIjY3WJyY4WaE6k0wvvwLVx60kV4pwUWFiXltWjznmW1kU6U9/5jSt3zYC1QSKfBqY6/GiHaJJaQ8fYkbfmevCDi4WvGjn/s1N8YbFspJdp8riPPqTx4aYmHwuacydABxpA5jxDFMKrlHjrA6hmoXPBAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T+rqGrYh; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T+rqGrYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYUNt61+nwvISIo6kqEEE4Yw7KUHJU4m202oGmvoRGjF8nmd7eboC6UWqKtcNJLp2yfJPZjXikfdSz1+aa9WxKPLEnd7FvRye9nMb7MaIBpAtItULC8cEoJ/JMmg29s7SIEGG2q0Ahx66SvGur8wDJfHSLBlSTwvMQ7azcPEc0uuGM9OUNCxnLMUBaM2Elg8vigPQZxjupa/S0ZxLg3k0+RJnc6NQkx2B1eV1Pt8fCeGUXODumg0jS0FS578/dkjKlAg9IqloYeJGidAWMdWSaQ+Uh1DlCIlnc0FiSjSybu/BV1G0nisHPtoNMrDjn7iwwJhHXK4yD7Kr7LzvVpbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv0u2M6Rm1ygD4MxEwIK7iB6jYXGu6t7Rqt1rITK68o=;
 b=zUTPu0+IbwAQJiSB9hGPX3KHc/3SgdLVR22ncGZv0A79hYZVGY6joKMp80MYha8pIeTJJkLZ3+ubTPdh/uBnzmfIQDasor2pubZYXr9Equp3psB8U2ulFMpGmXTk2YW5V013+7Qv4c5UKoDSBhXQ6EeWSK6IYXJVAzOoRo+4qzbC0cVO4u3xDwPo/2rEDqhLGHF0lMlV4VpxgGSEGe5q2CczClNerorCvuOB7oeGoTLOU0VQsR67F8DTypV1E6xtkrsufeTHvNHyJFsW7Gdq3g9ZvjgnKFte6LABSaOVv9W/soFb7T+X54FmrC2+AKySU4iy7Gp87KRCVTNoe5T+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv0u2M6Rm1ygD4MxEwIK7iB6jYXGu6t7Rqt1rITK68o=;
 b=T+rqGrYh+2Fd6s5sZkiSlETt1LeBptAB8iQRRQ5QtXyIl7F4fBK+r28gKaRmAVtJrLJlHa04FdB9pa/a4ooWt3XG34/bAzoBnLwTTf1IKrrfZZUFMvF1RE9fRi78a+Mp80KhpqeIEA6G1w2g7Pm2W13IMZL8FEPKOYbId7fs7T0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15824.jpnprd01.prod.outlook.com (2603:1096:604:3d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Sun, 14 Jun
 2026 23:14:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0113.015; Sun, 14 Jun 2026
 23:14:54 +0000
Message-ID: <87pl1syas2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH] ASoC: soc-ops-test: remove component from soc_ops_test_priv
In-Reply-To: <aisSJw1RJTXmC3jl@sirena.co.uk>
References: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
	<ailKjsngVh4q91C0@sirena.co.uk>
	<87wlw5mufz.wl-kuninori.morimoto.gx@renesas.com>
	<aisSJw1RJTXmC3jl@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 14 Jun 2026 23:14:53 +0000
X-ClientProxiedBy: TY4P301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15824:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ef44f5-5ae5-4b21-9882-08deca6abe1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|22082099003|18002099003|38350700014|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	lA8u2jizDGQdtBsbpiuIJHJhpyGAp2WRbAjSeYYW2v4iQVH/2xc5BTjmnq+O9n/vM6qwPg2xVErq21ImGTjHak9KGEiieyGffXaKCg9fS3VNnFAANLCT1enH71bdlaZKSnTz0SpZ5N735/tSkUbVBlMxhjy5LuWlc8Km276k9gg93nlplQx88HkWNCrOdBr44ZDEjvnke73vLnSWPWZO7waoK3CZTllgOzYCIiqVoNSRQZXD6rv5z3QyacUi6hMiXAT1NqrYNIs7cT5g1ygScHIZ4miaeBLF4Ho4wthC+Jww2uGy3BotrE5H0trKb7ZvIDdmccbzfXQ08K2KzbpeujSErUSQDcPZOG8Ru4zSkCNS0eVI0pwrfy5yzSTr68Qt27HsU+8c/stUPWGp2gvEzvLYUa/v/CMjwX6Wjgf7lhzH0EeWkqtpevMMpY446aYc4nA54ddV4mmwvI8mVsoR0jLWd1850HkLokfv9VyjDx05W+GKNHIC3V1D/pOBsg0RQKbd80I5ev9nietfkRzirJ2A7nUatXCEptjVGrGZbSK3Dnvuk0OelHTbu8LbLkU/7bUyNVTAAQjw6i9+hfgGXjFOD1Xz6y6ed/owDLX1Dwq1f/e+LQ/0Nt5KudwzohXaY+EZiBE5SsTBv4CuB78lwRVStZ8D3XoI81Oh3avzqnH/XeStzxRT2o38HkT0HCIZY0vYu4RlDld/Rm1amH5vSDfRLypiQf/wkWBxsAP4gmsIqSKbG4Lzi86NUezALLmj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(22082099003)(18002099003)(38350700014)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F6PUA7369r/ZpBoPvVRL5VeNVf24ZLhx8BONZr+m9VVrwoVdMhdKWcDr2dvw?=
 =?us-ascii?Q?U3sm762UjayrOW/jmrcUHj53aImzb7CNu2lUAo+0NLd3mSCEQNE1zjsYeqIM?=
 =?us-ascii?Q?CawX8wkYXwJuREe00+bmehlGoi0K7fbqwPFXSWFNDUx8KIhqd0jsPvIuTRDi?=
 =?us-ascii?Q?CCMhmAUju/0yWHz1vMR/EYcK3RF0xVMdDeo9d7uv9cq1oIzhUUU1NsoZ1y9C?=
 =?us-ascii?Q?5eLUWGksxHX81tyGVGLOp1xYPFzNItuT3RVdEVtN6TpaCX78W2LQDTBSADww?=
 =?us-ascii?Q?VYOU5fnsH6Sa4tNwoYgemYWRELNaboPsMiHNKY4LBEKfW/PaeXRSZka8blw1?=
 =?us-ascii?Q?+kor94QWYg4ofRoAUZPDGM8wZlvAsPvrYCn8lSrj0cKZBtkjUuldNNXXrt+z?=
 =?us-ascii?Q?Sgd6MWDiI8/e4zft1TKrknAiU70nnwuHUj/j08GSHKLmchColb/WI226iuLT?=
 =?us-ascii?Q?H7fyiT1XwyFfQX1GEoXFh9GBUv5vRFJvOB1HpOeluZI4xJEYE5qFwnovSM0D?=
 =?us-ascii?Q?ZqCdW+fnugCOYyh4EBGkSDszPtdLV6h5dlvZoDvO7ui7ttXBByp2+dASANBi?=
 =?us-ascii?Q?yCncw3cENUSo+Sa4biHzOfIjLxpj8ji1w2T9AQW6GhFvmJe1Kh0AwGcmLK97?=
 =?us-ascii?Q?lAYHyszedH18egiws6aKQgmEVnBgEVMdmw93M65KWR656IsHRcK4/2o2WpqR?=
 =?us-ascii?Q?UYs0PODoKQ0PKjor6IgtmJ4SLqFzLsWxNMGRzMnNCdPqVnWz2z8xaPlHXs6X?=
 =?us-ascii?Q?biPYYyzlzLtyE2cYeylA6H0zpfnFQ7P5E9iQhzV2KLlhmjqK0nRRNaz2t8oT?=
 =?us-ascii?Q?f1neNRdL19Nct4bhX5WqLf2lW7LM6AnLtNR5ZZEdo1FeT05QJLejawnUE+37?=
 =?us-ascii?Q?sryARQ/KV6Vp1BBiV/N3IxyvDV7PCtDCFr75n1pjRDO8X0vo3np56jjNPDWD?=
 =?us-ascii?Q?HBqUTlyWeMPUICPllJ7qHvihHSwh++sfQAxcNmyqUv5WcQMs2lJLeqTiD4+q?=
 =?us-ascii?Q?GdPqQMv5sgIBhIkkUycQc34ciXrZICMZFycZthbzy5tjRWwyOQf7TLGH0bxy?=
 =?us-ascii?Q?BtL5DeyjUxEiNg0+knE9RBudkarbsx5BTByu6JlXUPYQpOBHadwjngOGeqan?=
 =?us-ascii?Q?ZfoFmECTV6mI+EE7GPXvIER7RZffODNMrGUOo+OxsR/CYSQ0KBMjAWCE1KLE?=
 =?us-ascii?Q?vMlJ7d92eQzqPXqMpAszgw1kfesPcC8papljSqmbrIc5W1KzixA7Jkue8aDE?=
 =?us-ascii?Q?2+2xdXUM2hLgHZ7nfhb6v4Zm9q5fBIu131K6+eWYnjQUfUFB1W0Q8ytqzA8z?=
 =?us-ascii?Q?OBTAy3NS0C0OSd5hwpcfVoCFonuzUKKgokvZt+mQj2tiqHsI6M8VcCIANXbe?=
 =?us-ascii?Q?nS0UpHJgvRpzNd9+2T7fkXU9fAXPFYd9HQmkpeZj0QjQkwxESlAy6d7Nw6ul?=
 =?us-ascii?Q?6PxrBT7K9bCi5EA7uiYHViQsYVli0eu4su6jNelNp1LuZZrXLkKLi4sy0hen?=
 =?us-ascii?Q?152srXffR4ES3faXfIib4rqJgSEPug9TOVvNHBLfuPZJ2thPBoYlmAL5lB+i?=
 =?us-ascii?Q?fdPOO/Yye6msChtYkP7d1te7//8SwWCACZZiUu4Exq/Oj/iUAWiDX8NuKizQ?=
 =?us-ascii?Q?RmVkbdYQafGSCaE3eeZJhgiu39kADcVo1ir7pQkc4n2O0/OfJ4JBS5bBkJ0X?=
 =?us-ascii?Q?or23MnsHH0/PsLCDbDRuByiGlh1JgGnPS+MQSENvMVEC1LcI+570/YI1r5vT?=
 =?us-ascii?Q?xShbAASXkSdi7u7UJlApAM73OzEgDJw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ef44f5-5ae5-4b21-9882-08deca6abe1f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2026 23:14:53.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Krwawa3KJx6G7RCRH4rR750cPr2Hb/SRXyOpmgMrLLaAsOOiTReou+Gftpv3BYf0RFpBCuLOMbM4SBwsZkMr0975dfQzrcv5pc5b7DfKC8Xr9/Ypkokthrbo4pFJVlgg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15824


Hi Mark

Thank you for your feedback

> This is (or should be) a common problem, I'm fairly sure there's some
> stuff in KUnit to help with creating mock devices for it - I see there's
> include/kunit/device.h which looks like what I was thinking off?

If my understanding was correct, this header helps to create mock device
and/or device_driver. But the problem in ASoC xxx-test is they want to
directly access to the member, like this

	card->xxx = xxx;
	component->xxx = xxx;

But, there is no such direct settings functions in normal way, because it
will be set by using some method when it was registered by checking
other settings, etc.

xxx-test are one of the quick-hacks. So, maybe we need to allow this kind
of workaround?

----- soc-card.h ----
#ifdef SND_SOC_TEST_HACK /* naming is dummy */
void snd_soc_test_hack_set_param_directly(card, xxx, yyy, zzz)
{
	/* these should be set via official method */
	card->xxx = xxx;
	card->yyy = yyy;
	card->zzz = zzz;
}
#endif

----- xxx-test ----

	Kconfig
	select SND_SOC_TEST_HACK

-	card->xxx = xxx;
-	card->yyy = yyy;
-	card->zzz = zzz;
+	snd_soc_test_hack_set_param_directly(card, xxx, yyy, zzz);

Thank you for your help !!

Best regards
---
Kuninori Morimoto
