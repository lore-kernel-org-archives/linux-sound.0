Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24CC36E495
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193448; cv=fail; b=nlfJCU4/tog8ppT86t+Vkegoite7AZwpzdDUKF1XyrLNtE2+cLqxxnvuL4KXYrer14piBS2fs4UaLnp6ph3IkK3T/alusTorNTSeQCUeK25FbzBmZfDFrWau8Ozu1glEWioPFD8dX19RBd7Yp0HTTTgbvO9sPcvqotjhvpqmpS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193448; c=relaxed/simple;
	bh=HurWeUVrQ9h2uAYvFb+yyUXnUSUQopNy7uREYDIB4M8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Kpb1mOJv/5AgDNVanAIrpxwpgYPBsiqeDbr6YDvYCiY1LYsZ1Yd6+oQokDZQUdhrhcak0hnX95dKxCo3LuMLSPQDvPwbP3Kj2wvvIDW5TmxBg/+nG57KL0Lmatg6ePoMPhlVvGKEOokmTAbHlsHDr1WArBqfoVYLDRPwVxGnFek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=odd9FqxG; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="odd9FqxG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1ueTYOPuWwufAWWchBC3KsTwZRuesA1zwQZE/TK9M2M18zICQZnsy/Ge9yz5SKQCndlNKiRiipfExuInCxVrj86+0Nv54rkb/w4M6+fI33GPxCWSiVK3UZoVeOCG5I/7sngBqUdzRegndAdrSnNSQf6moNuPA+MHQOUAncTmD0lVIGt4/A+bxPZuZejz0t/6khV1aO3u1P84U6eL/ltq6Cu6Xu5sJpV3gFCHG4HUbskptJeZUnG1GVsbml2qvL/31O6G87LF36FACIc7BnvQNa+rz9V3Y2cLQetjKNM4a70j+LtVWKiqRPw/852HAJHrfG0GdnaUMDV1XSIkSROaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49ITgeGfCKK4oSxM52hrk3aCo6fj3NRF4Cz7uBhnA/E=;
 b=EeyxmhJcbaibHHuFwb4rz4B2HMCiSaV4o2O0xnoNVI61rtDPGmmQszz7MPU0BQrWBhXclx75x8Se2nEcla6V1efn4U2Sn3MdBo3yypqT9I+20TFgr5APR0xGT0jv586HW0Ty0SST8o/IrknGLTCZNCxuZVWB8IShfnwAlcvNugt7ESCheNEQv8dqqrZmfcXoq5HS8uQ9q926jjfm+OYSh/YKM/Nx9foIu9ycVUssn8FK5tx/YoVaDQhceuLxU2EBrxHK8hw/qkMmoHKzHSaxaD1iwje9x+90HoQ/x8+g0LmLbqh6ECfFu255LvuLyeKrX0zIw/X0RzMJgiU5Y2aXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49ITgeGfCKK4oSxM52hrk3aCo6fj3NRF4Cz7uBhnA/E=;
 b=odd9FqxGNhwD7/alGghAZATTGdArdQ3wiQa9I0D/mMNENMyFfof9ojQ6+PrKuHRpialSzad99ybe85e3KSSi/TxL7GAi2frcmJF9yTfWB2fDVcP2Ebfh+/AmG/kV0WnUK4qCQEiJe7nowNqydAs64qnbkSl/Txp5DvbdLuSpeBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYCPR01MB11354.jpnprd01.prod.outlook.com (2603:1096:400:3c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Wed, 11 Mar
 2026 01:44:03 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 01:44:03 +0000
Message-ID: <87qzprywbh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
In-Reply-To: <3582df07-8d1d-488e-b76b-b8c288d35ea4@intel.com>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
	<3582df07-8d1d-488e-b76b-b8c288d35ea4@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Mar 2026 01:44:02 +0000
X-ClientProxiedBy: TY4P301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::8) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYCPR01MB11354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4751b7f2-df39-46e3-c5b8-08de7f0faca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SnHXfu9KydZ1UZmYiJ0McuHaxcz+aSM+Ch7d4azIevQv+5ylFCtD3t+BZHjDUfPyTSuTh3Y9o88+UaHlSyUI8BJKD9iK+Z7ww4zg7ObJbyhqVMEwdPCi/Gh3nGjxMR6QqjuAdhXUW0o1qjqTWrfhKBc2RTeXnu8TjwcmFwdkYrMFbZ5ompd3FFCKVjDRJPMoycHizM05/RPbEsgxNNSenEButPpFzfY9dvzgrCUF6gsW78ojMkf0PPvA9lCHFJ/+jPs+a5RtzA8FXXFr63S36pFONPE1pXaY8JR3nOfbpuVR4HJI+e2eCFpA+fdI9vh11Wy5MfhaX1X9RKU1W9oqUKF2NwnB6UMva0s2H/OFGgzkmSHsDtAi2l4guArxRaPNXdi2otPkPoWB5uYqyyKlgu6hpxvFGmPRuQBHdB3/QnPoy9UqEKINXj0EWfAt2xtJRjNoBMW8BAyYlwwud2lrQ0wDVTjYlXyzbTg929VXLWsRizCDGGcxPc0/NB471WI4pk8+LnDfC9iItQn3pklYMgQlgR/uM7dPtsAU6cwgVh9B+p2GCZuhBG7TPajbGYKQc/KkvhypntAEPlumyhPF/wMa9oskIsxmKK49WhTNMHM1bxcOQB+xQMHEe+/3pFTTkFDfL/Gfi0KpSKp09A8uze7+BO1Uof93GXuDFfNbUt4sZ2wW8Xfw68Uu7Ssal6eIYx5SC/VxeF8FwFDcfop4Ghfv/zehHL2HAnACfVYRTBTmH65APZcBQlHbv+iNT73ud+mQFEfpfYyQVl6QwFud3byU1hY1PzxYL3M+5TYGmZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8xfNR/99EjTA4eH+UdpdjJOtlrwka2gzj5pb8c6pQFfWSHdXUJXxE9PA6g3Y?=
 =?us-ascii?Q?26SgKRboN5mBDkJyYD4/TZNu2CH1f0zHI6J9MxIBamDzIz0AG3qXBgtD2IDq?=
 =?us-ascii?Q?VokwbuxvYaGbzbt4YLNVnFiBDL+s64W/PIQduic5o76mmGjE6HzCI6J/Ia0x?=
 =?us-ascii?Q?+ftlVTmJqNrinQPdccdPIr15fgbMUfWyvZyIEgU/2M0iuF7yPne/oGrpy4MJ?=
 =?us-ascii?Q?V/G0eHWtZ9oxhCiB6WLmeMKO0VC4eCISesBLIK6RuHdiOp9FgEOyXG99z83l?=
 =?us-ascii?Q?UHYGS8kZDaNPFHbI5COtZj1OhG1bKlW51pf6EPo2zh59GOddyFP3oyKsiL8m?=
 =?us-ascii?Q?VbOLxukFxMx7JsJ96qFElxUzhjH1XxwOtLiBvhtsUVWEnUDYXnXAKwe3XBmm?=
 =?us-ascii?Q?rSHIj7zji7c0veiLHDkvT+Pur8eB2WsqePmn7vHSxxtUVf645M0raU2gjFPm?=
 =?us-ascii?Q?spRfM9nnXw67fmRjHULIDxenwPhaoj82ei0PszduW5v2TYlLUBsDj0VQ2K2A?=
 =?us-ascii?Q?hVVieWdUnLzsJXVEJnOssODxFnpREs44CdYvPKQaMpvPc4AIkZ657ved1E0q?=
 =?us-ascii?Q?972elCnA93lfjiqUxVE+k6+xa6xw52iqghbFVVBpOZXy2EJvPJYQ4ml6OppY?=
 =?us-ascii?Q?jTJdhQ+5G9Y3h8gdQYVwzA0AAIpRlMEQ43Ig6sxyIsDBIG1jW1IqQdRpwFGq?=
 =?us-ascii?Q?m3CaqxGbGhiegJG3mdI5Wyo9R2VQHBxLigU4Qhg0WMo4NpTYaeTjf0jkonVc?=
 =?us-ascii?Q?+3aOb/KJIHl1HnKWVFWFt15gIqUllyCwrwvMVb3ckwkrkXLVSU7B1wboLC0q?=
 =?us-ascii?Q?O05hQd97YYSStN/reMAYiQevgKPq5E4ItomsrCb1PH6qlhrrCRVsJ7xJs+MI?=
 =?us-ascii?Q?JF9OOQszr4/IF9y5lDuxJLxES3TAsCFSmc9lALH4z26JJqGkpUs+8PxTcP/W?=
 =?us-ascii?Q?CjVnaLlQ23wz+uIgeYp1Fkx7uM9H5da0kGnUpYjoWtiJJ2UUmUEUMV/txCDc?=
 =?us-ascii?Q?mGT3CLt5iH5f0m3LBJrE1/O/7VaRruLksSg14EqsdoGuSidng+98ECndMtLH?=
 =?us-ascii?Q?Pyc2KDt8zDh6kdcu+uP4lirwcNgVGRZKQvpp5QuRj0ZO2Rq1ArvT2k323r80?=
 =?us-ascii?Q?W+JfohcTCWItYN5jxXy0LkZodfHlGAuvMOsckIbsK8nG7s3GdN0qfne6ooeO?=
 =?us-ascii?Q?3YcYpFLdXMg3FaxnjxunLLHc+M46hp5o67LuUqxurUDA8QjA8eCoTqIVgxA6?=
 =?us-ascii?Q?pc71mJck0xg47CWdnRN6jLnBDAt/UuEkGIcbJqjZXH8fFvkv/1UQaHGJsYTY?=
 =?us-ascii?Q?s3LrAx0pL1IGhpqQYuO7YlKCh5Rq39Qyq5myCfof7Fld9CbQfjBTgERmO81G?=
 =?us-ascii?Q?DE9AJ0lHjP0VK/BDyxbNaA9loKIuib/nwoShFnkaqwjqXxvy1MQDiAUzDRfG?=
 =?us-ascii?Q?SZUKNiL539DP+kFowylbTsits42ZBhYfo4xh8og9TT+B+XygZYkll4Ow3WPl?=
 =?us-ascii?Q?QnkznLDh4Rc8lK2VEWExCrAaheVUXPekjmb5q0mg0ihrAn0i5L8HfeonpBWw?=
 =?us-ascii?Q?ry/f5fmP0z9bK2z/W4hSfvLX8a5ZqWS5/YTTcN8Lfx76kVAX+uKPZffXi2uR?=
 =?us-ascii?Q?fJoTWAzK+RSGHLq9M1IjARM+UnPvJn9Kz01yAwzmOjNyGtnZRGrLIAJhPXJV?=
 =?us-ascii?Q?C3TdvxLRuljojt9mb5YnYY62wjHuaJZGGX5/w5cl8oiGYHxD0/PWns+lY3Eo?=
 =?us-ascii?Q?aOWJUl7PFRgyJ+z8ZTAt4GY3xQ4p9qOhQu42hR0VA/HSc3MBja0g?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4751b7f2-df39-46e3-c5b8-08de7f0faca1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 01:44:03.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtOqC4asrdl9oVLr8s0IrYd4SI1K3b+QK+VYdwLIopXrSVBzckl/PfxFIQp7Mg0jDoGDfzr3ntUPWQ3fkm+0f9VMztFxpKCsWv4CSFcfG/Jz0ZRpxKa27+X0RxqNoiZa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11354


Hi Cezary

Thank you for your review/feedback

> First, the general idea behind the patch is good, and I agree that 
> things can be simplified.  Plus, it takes some confidence to do moves 
> like this patch - and I'm a developer who favours the bold :)

Thanks

> Having said that, let's move to more grim comments.  The title shall not 
> be worded as "cleanup".  It modifies the behaviour of 
> card-registration-procedure for all ASoC users.  There is a reason my 
> team and I prepared the patch (mentioned in the first paragraph) the way 
> we did - provide incremental functionality rather than altering things 
> for everyone.
> 
> The last sentence of this commit message should be the first one.  The 
> title should be transparent e.g.:
> 
> "ASoC: core: Rebind cards by default for all users"

Ah, OK. Yes indeed.
Will fix in v3

> See my comments below - not a fan of unbind_card() manipulating 
> card->list directly.  In my opinion this dilutes the responsibility and 
> counters the main argument of the patch: "let's make code easy to 
> understand".
> 
> Removal of the manipulation here simplifies the implementation of the 
> function too - no need to double check for "if instantiated then".
(snip)
> I'm against modifying the list unconditionally here.  If the bind fails, 
> let the order of nodes on the list remain at status quo.
> Right now it acts as a "protection" against possible follow ups.  Either 
> there is a need to modify the list or there is none and don't touch it.

Is the list order so important ?
The code will be redundant, see blow pseudo code.

> In general, I believe it's best to treat bind_card() and unbind_card() 
> as workers.  Let them do their job but let the callers decide, based on 
> the return code, what to do next.  Phrase "next" includes 
> unbind_card_list manipulation.

If my understanding was correct, do you mean like this ?
This is just pseudo code

	snd_soc_register_card() {
		...
		ret = bind_card(...);
		if (ret == 0)
			unbind_list_disconnect();
		else if (reuse && card_is_not_connected_to_unbind_list())
			unbind_list_connect();
	}

	snd_soc_unregister_card() {
		...
		unbind_card(...);
		unbind_list_disconnect();
	}

	snd_soc_component_del() {
		...
		ret = unbind_card(...);
		if (ret == 0) || reuse)
			unbind_list_connect();
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
