Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA7A39989D
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 05:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783487461; cv=fail; b=d/jeDmsBcNyGFRxnLnUOgTmoEJM9txOsG42H7QTQyJlo/JtlvPpSn/XgpSgRs7Cud1u4/ZLQXtV7DoK9GmMIZCzjn3dfwPEAahJTWTuexBSrEnG887vs1ZI8gUo/CByX7CTrg5CzvrqVwcjOrGGKARQ8C7h2/G29xZbp4a5k1h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783487461; c=relaxed/simple;
	bh=N/C1u0DITn7mIO3illd9gbvRVfnPNtOnR2OTQk36mRE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ALZ8s3kk+YI5rVpKt+HP9i5MUka4wX3vWGoS3j32KStbPr1Gfn9NlBiwwSziBS6XxA9jIes3AT0LQhvnVgqDEQqNJIpYPxSznyNLDbOxgk6XO348RTbMDBDzp3lw3w8xp2L4Sc2o1hlux7ZE3ndpeqizLy7C+SlNc6rXWJhfeAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A1N5xwJ7; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A1N5xwJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryPlE+B6xND0zCN68E4dXdFgASoZBzRaMAwv5g/TRUKqio2ylfzRjiNp9nREVL5uC7zwupX+70SKpamYWR449nFJ14YGM5wxiHciOXeLDhVJ5aLRFix3v2xIaFgWOcpZsrWUXREX1+v53+NcU59C0aS+8wMMvlw/fdiQXTvmvxz9S4r134vV1DZB3stQI2GDXLHibqeMWzlDd34qGi6/U7FhNmyUE4LHf4+RCv8bS+U29Qjw5rhBnS4g0TULusm1yZygfIJXH0pWE743th3RX8nUC8U0F0h+eBZO1bhlxJa3TYQ19o+LYvv6CkRyyYTZhxjBGuyaPorGC9zbS6qCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP4abGmelZJ21df/w4c3Xtgn9BhfsDYn2C1ct3pWmYM=;
 b=l5ntjoFMakqnYJCtKxgxfO2imK0vygegsooexX5nm1GwwN12KMEybaqa2sXTE1hlrdCNEMtrtcehiZsienvYLqaq+n6xo1ip3Rztn0GnuPbSsCZWDi0Z2Z/CYdlaFFyMRFF67hI9bUiSMhYDopXfzZ9sBCDAebUO5/1pgFPPDPRnCIHZlfthpWEDICOIZPbOpUKuhRRv6+p65cV55L0vw88smLohrV2UqSZvaMjLB6kKQgRrBVomv6pvJC8JvWdgMLktWTGzvupmdaPskxug4Ikwn8iBCz3V4a4yGOsHQg6yWQo0BfOCg6nkKoY+hC4MnPrS2o2V3f6omlVv8G0Qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP4abGmelZJ21df/w4c3Xtgn9BhfsDYn2C1ct3pWmYM=;
 b=A1N5xwJ7TZlYVX00QUb62J6fosI2ViGOJU3LH2GHIz6agOFgeqN4GebVz0RatoTgoT10bOSOVc4TYo0P0ugAnauL3OxSV8Cacu06Va2iaJ6SgoDUIsZwhYMkq5JhVLEf7ao+Dm+Rc+zAxIhsXbeO529wTf2PdtV3JrUJmMeYITc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6696.jpnprd01.prod.outlook.com (2603:1096:604:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 05:10:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 05:10:57 +0000
Message-ID: <875x2qgj6n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 06/12] ASoC: simple-card: tidyup simple_util_parse_card_name()
In-Reply-To: <87a4saxiz0.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
	<87a4saxiz0.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jul 2026 05:10:56 +0000
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 542740ca-b18c-4e5f-4615-08dedcaf4b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|22082099003|38350700014|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6aox7iCdMjrxB7k/oyfyWemNSCjVVNkfSrtwUTB+ilf2WQw/0C89KMG7wnkkutYxhDY7/BGitGjtNJtBdPwxwH1NJGa6GolerqorR1EVHB67kwhPsfBMdzhfopRfOE3mOVRmYmyeRgF5wmw7947NJ5pccySm4QmPc0LNNFrBDlHnGzXynoJLzR6DB+T2iv7PeFQpN1zGiwUEy7E/TNvFeia/xioE221Wb+aVKb8Rl/hIXcHT8XSEnekUwExpSuezk62MTjgahLXQWXkDMfUpIlOmAlqpLZZ3/WogIo5FrS3Wr3oijAm+mKAkEPdX2/mQ0xpEAVDqTg4nsO0uHvPFhIdfQB6nXyIbFcwZ4iMeTDn0TaRQmODhJ4UShLM9UDuRf747jx6DyRFV+U0Y5AbPG/pEO4RpFqgVhvQx5/0T5EVdKVucamku8k2ClI+8rAC0iJGqIw202nNysCclZlQ3/pWTzMRlzIyb85a6VzPzq6EfnRZU66B0vmJrbvXpeW87A3DMjkVI7rIRG1+xP7aiOcIZtmp8ky2edro2q3Br5/WT0jPsxi5Gs/HvUJ/7bw4ybi0TayXx6HtUSBNQA3kllOGwAq9UQXAE6npv4Or8q216P2rJr/pUnSPfJLo3DjC7vP2oil6Yy6I3vnGGcFIB6S6pzV/MOQumTd4jRlBk4OIKkaViON9rKQQcxlA8mZxX/XO0En5VW1/1SL2PAM+dMSowD8edW35phRTos2WhiPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(22082099003)(38350700014)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i9evfQmdVXq8NlkqLYg0uPuxGixeV31+jOGIXKKAdeJnTNpnZ1o4nQIaUOgq?=
 =?us-ascii?Q?ZOlbQZBPveIV2lPnteB1+tKMVAubHHyMEGuk70f35Mg8ndZzeMf9jBh343FO?=
 =?us-ascii?Q?aGa6ePzHlo+FRqcIz+OZ4TSAi20C92Nw9fM1rbDtQbdrO6e10UHabGBd4yXr?=
 =?us-ascii?Q?/W+4TiSlF5R5QuY2NyYPVO6ED8rbFLXgmK95tp+4WXDKSCKzyroq/LGNYF8X?=
 =?us-ascii?Q?EqCQWpDcj3Qrnw5GZubzaLo1KUWVPFX54aW2BZTSc39vcO4W0wizENE5kJNw?=
 =?us-ascii?Q?AKdB69S6HRi+NyVmjKUmseuEU1GPaExeMkuG8pz/Up/D9FfLo9vnQwJDjUPh?=
 =?us-ascii?Q?xAfCbGw8caTUXsO3eXoEHs9a6m56qN14SYvpyUA+VX3HHZfTxTNi+IMw8Un0?=
 =?us-ascii?Q?0UysDwTRGIzVEwhQZCjJ3XhOsOboOi/SMnk1hkefy4v+Z5sKuLNTUop7ayzQ?=
 =?us-ascii?Q?LMArymWLZWtq8to44IsCNdA8gUt9xJKvYjrqNtSr31eP7RL5lmFW9/kfsUde?=
 =?us-ascii?Q?0hwRBZRL18nz/2xaeNuejDBssq5iwzaznZNvLO3NsySEu9JORPfPvfMm7dXr?=
 =?us-ascii?Q?dda70Yb5FHfvXZSrjiUbaGuWZqrD7de55ocavTKcJVRkW8Y5OalEtWbjAUSc?=
 =?us-ascii?Q?bY1CRuWZvp3eoJxPXsveyobB2KN2TN1uQQ8MPmhU9Mz+V8WSDhU5palbbmPl?=
 =?us-ascii?Q?kXJ9Ql9SgDOQvXGObyj1yunbEh+w5OnfFfRAx13dEo0MSrdHf64tgcAIWVyp?=
 =?us-ascii?Q?TITz99BUfWdkLnug0nqfdUhoYHqHQs3H5zv2Ujm4D62TPqsa0ezXzuRpkHnc?=
 =?us-ascii?Q?j0g9P2ynfKeXnutCNiSaKHkKiZYKlL5THoLeVEweyubQMNsYyThlNxkA89Ql?=
 =?us-ascii?Q?cMRSnRJIbp8kf1bJAxeGh8S4KzNoRTWqCNUFceWvJepSb+I+papRaABeaOZN?=
 =?us-ascii?Q?WzZSHp3gtq8IYsuygBm0uyPM1Gl/cjgjHGGI/Y8OZqigH1V9SwTZfu4cuKXn?=
 =?us-ascii?Q?OPOBxDIOh+AbKZpbqFbXfu5NskeuN4CqEbnjM18bRE7hK6Kp6rjXlxFR/MJj?=
 =?us-ascii?Q?OvIqVpFRMBPhDNcWTX4rMPOkvBFdFPlu0eCwd8UpqdbTmxGQGqAFO6X8IGNs?=
 =?us-ascii?Q?vpX6KmdUljT3nzPhlp/y/H1Zezsk+ZLsHV923r10rXQ+GMWTW6pWOUX+1nZV?=
 =?us-ascii?Q?DDz3mMqsdss3tMVvQmXXhOeSpazG4eEWR81zwDloXOv5fPk+5bDHmkAhizFO?=
 =?us-ascii?Q?y3JYwZhw1RQsDdVfoSO7S+VKYMQaavjqOXZNAN3fUin2PKrnP+l5cMP7ruPD?=
 =?us-ascii?Q?qcntE6GyxpNQEM8qIE4pAVI9tnMSQ6eQ5aXg241RIX5Z6HiFykZyU5PZdhDt?=
 =?us-ascii?Q?c1OeeZcyA/nl70evrG665KcR9+T/Y3v8Rlr98QUaRZtbR9gZ8cQSCyA5Jl7J?=
 =?us-ascii?Q?ig3GvpeTsFqKHbhEXxD1Sce+dGSAo8UQJOu/D6EvmpFO12qnkn3HOO7ZDi7e?=
 =?us-ascii?Q?iqeC/SuSZhJ30HKIzxnGj5F1L6qbJdWn8U//I1ht6WkP/YiFbYrPfFNtpFbT?=
 =?us-ascii?Q?35aBZ8vKGQg+HiBzE/qV38aL/oIZ453Pbd32FhOahY8dsIcEZxHo5hVH0Qle?=
 =?us-ascii?Q?dLFJfKWojUi88tQ1EAGu4IZZ6AfI5SBTQmXtC3CDsJ2OayhguXmfb0BVUnCq?=
 =?us-ascii?Q?1WG8VHkiOrSQcyWMp0tQ5lvrU6MwjsKPb9febE7T6m20BB7TvShPGSID6j29?=
 =?us-ascii?Q?keWn88X9VuOtp34o+1hxLlNhZCBX0tw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542740ca-b18c-4e5f-4615-08dedcaf4b11
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 05:10:57.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DX7FunnQLXi51fC4Q/HnC6Mp4zZiR7pMOKry8SFdMzSza4g1quEFVp3ylJjs+Lvmo9+NwkrggIJvsn3lRINEYBcJ1CSb4jMC5Yp43onWq0fhEf7Rm2P1dOMXGJDej8Wz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6696


Hi Mark

> We can re-use simple_util_parse_property() in
> simple_util_parse_card_name(). Do it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry to bother you, but colud you please ignore [06/12] from this
patch-set ? It has been determined that this patch will become unnecessary
in the future.

Please let me know if you need v3 patch-set, instead.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
