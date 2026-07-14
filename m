Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C87369D51
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072527; cv=fail; b=mwealjKul0h6kZrJ6D8f36HAxgZgE30SNstbSuBSZTtpwXgOXhqBnTkARgCzl9KsvANULZtt4ezckutAPRky/feZNhL8fhp6d3h06emUNXXZPcUg5w8WHWtIK/Vq3wehdIknpJjQklTJw/EKWOIZh7QfmLGtvunrYewYoTDuO3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072527; c=relaxed/simple;
	bh=TBnDKeuqI7Ff3eqbCFClOePuuhHzgFbj2OVuautj1kM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JaTO4Y1ttfCmWNuMpRbdPB6lL9g3gWHAb4DHcExc0upvUh2iCb9iEcMqe7mC6hXbM+e6raCs0pEyIHJ4KGAEgBXsdUuZiAxwgpQdqiuRVF//c6s26HH24TGdOsArpS43d0KQZrF1skgrBbIgp0DFKVDFBhlW4bRImvYBpBDZUQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QkCcBnaG; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QkCcBnaG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk63LNig5k4CUxwsUKA39gT0K10D9KCermVueBNjeAPm81jN66bLjlsdp5jmtUu+qjQGDWUDbLdvw/URrx6C/cacUVBQYQr/+LMoIankNklTEQ7mZz5WCmbNZOSsLjmV5r+zLVi0IG7DeUH4m05lny+2tq24VKZ91Lc2S4VfGqEyMbqmBEKVEl7RaDnirv+nuWcFqFStQRM7keiSHbwql1maqKemo4JURMI+/3HWIlIyfg4c72Xwkw/XTpf7/pya4MfYxjJcy0piCawHvBZJEb3NkWKeCjVhiijoTX8+6XDitT6xBR0I+z2IxDtE8lXYkWHKAxJPyLBtgLzAs3FH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6Etqs2dwMvwv2Y5797Gqe9oQnJ8ARvvD/9AFT/hJ94=;
 b=Ky/b8p+FSar/tO8amvaOMzmiTKHnyjxQ3AwIq8jqExBlfzKCWAx32B4HTc7sv1PpshbB0Dm+Hmaj1+I4CbYrcTTvwuBMJs4x1rJzrpHXYLOU8d2mBnfRhSYEn1SIDl4jG9YF5C0edTFmck6DYeW1aJ2XuR1iuJyyIwrByKXP9Qgi3KYvVse3C18JeCexdLLtxD6MOmjRRXJWNn0eCAwwq7OpiySejczXxWCca8eCDs8Mga3WvCMZkKziJmOwP0eT4qPR1MnQ42U+PFZnggxiUMkiNjXYuyRzvuFkGsqtewCyn2yy6FfC5rDR/lDCdXeEtHBjlfswaysIx7SSK1TCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6Etqs2dwMvwv2Y5797Gqe9oQnJ8ARvvD/9AFT/hJ94=;
 b=QkCcBnaGk8kYW2rZqegaAWScAUffMyc+ZVQPMJHonfGlIQ8OlEmcfN2C0RhU/4N/ab+WoncSG5pYN/i09oTlijqQ3uTnmY1yca90LilVkQ57rNAxD2KcCrC/t0eXbdiAOZP8ZyzgLDUHku9YYvvx547JYLH1UraoDAFTSNeeego=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10774.jpnprd01.prod.outlook.com (2603:1096:400:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Tue, 14 Jul
 2026 23:42:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 23:42:01 +0000
Message-ID: <874ii12l6g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>, Takashi
 Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
In-Reply-To: <19ef5d68-f3b4-4cf2-85e9-cd433739c71e@sirena.org.uk>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>	<87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>	<9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>	<871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>	<e9263d74-5e2d-449f-9e37-9122bc924d60@sirena.org.uk>	<19ef5d68-f3b4-4cf2-85e9-cd433739c71e@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Jul 2026 23:42:01 +0000
X-ClientProxiedBy: TY4P286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: fed9da8f-473a-4406-eae3-08dee20180a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|56012099006|4143699003|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JneqLogXH8nV6lt495pKL4A8TjT/GFGffOz19qIfs3GbnfWGgVjIi6H1Pf2a0irVt6ujTozN76qLMRZ9InDzUsXmkwwjsmtljwBLLrS2z8SAxEnoZWLT6D17xBUcwCp6bByf+tYZIuzolw/BJTOKIr+s1Poh5eYTgtD3bcmHhcEjpLobfTdkSOW+L/J2ITWnSjV7sZw+C+h4+x1nb7XkPYn75UgHOsO8OwE015jUjjzxHRvGfDstfoHKOoOa9Hlosbl/2mzfJK/P9M+8YtQJ8FPSZ1Aef7JeHKZSuQ2KtlHEulPmfnzfs1FRO7goxvBImfu/Pwa423hZsQYvGGFg/wS7NCLBYEBNYzWWSpcZzUI09QOXsy0YYfYeHl7pU1cIhFrM7ZAPV2bZz3nV4uPrRWx6soOxWpiaNbTxqjeAvGf42NQnasUsKFTkTckzjqwjXXQjO1MNUH+0dixPxUaf9NJ+Kdo0O3F2zgLnTLWtzWkOgxRNpEYeWWPlnhcHYPFDApqXr+VyB1uIPz+3dbO9UXHsBscZzKNNG8Eb4imdnP0JAKSJOwruaCaquihr5xMFATukFJnIK40bGVnZVriEDN/VOcyvnW1bgRD+5fgYjG1UfGbtyxFJwEsO1xW7yweUD+s19qbKjSv/9fPxqMN7kW465oKyHsCLPaFGmbzLFfhsp2ekhVBStBE9ZYjLUqqNJPtnKP7WBzKqjX8loP+HkuE+HdQi5DAppHmqOkihRmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(56012099006)(4143699003)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOuoiUpBiVJvTvTgpZb+g1AfpCw7E076eemakmeX6uFkh9twceLetX9yWTmg?=
 =?us-ascii?Q?Mdqo2mtgs8hVSyQHR1RmsZtQf8UACtWWLUhtC4mSijN+MtNUFAapDVTnvPNj?=
 =?us-ascii?Q?g4IvCMrxT+AjR0VskQgkrj1Hgp30ROVAmNHQLfIbZUkfoAOZvI627EsxGccu?=
 =?us-ascii?Q?i2fMpwWNJp1YPSDtrDysN3rkTyUsCn8CYEAJA6FhKbEhNzuDO3rJm4JJ07wE?=
 =?us-ascii?Q?a+QnFrIQFNLj5TZoEinAqbX8xqEuz+o4coS2TqtYoGAR8f1Pth9ZDCJAfW/v?=
 =?us-ascii?Q?8SuwUGt5MJjI2XqdLSILE2xYnWdjxyqegXQu/Nm7RNBqYiRD9qXd41LmqUoL?=
 =?us-ascii?Q?3oFF9nchx7DaGZsIcArZH6Nar1/1VDTzjqemwQ3bGZlwUrFK665YOZ99yS+N?=
 =?us-ascii?Q?ueDNecIqfu/JVABhMwMnJGyUx1Y3tPm6/r8OlPVhS+agenbF5m6uL3xNKUnq?=
 =?us-ascii?Q?8/seX9QDoLa3Fer25xCSqoPDkdBgVYV6/C5JdJDTTxRNJ4lJkaVEegGr8D4G?=
 =?us-ascii?Q?gtCpic9g79fJtPKZmew7qyzJdmZC1yKgSB8zMx7aPgpFOWoKm9Ns4nF8UGah?=
 =?us-ascii?Q?8xE/LczLO5ZqbuuARMGmE6BspXr+rm2XQvkSQMjoACDBViuz/pNIZiskQPXF?=
 =?us-ascii?Q?j+gvTMuNojiQD9SgnhNFIHFw1Hz0NgGyMW4zyTu5gaXeLFldVyqRWrmO2dgl?=
 =?us-ascii?Q?KBkmQM1reibevWUpgfsKJuJhG8TLn7UyykTdCxJ2RdmfobJdB56XdFBKhACW?=
 =?us-ascii?Q?SHPi/vx/z4EQcV3d/vi5kuINdctqb0uu/bmGlFHFhrh6FxSUI1a2nbGdUOgW?=
 =?us-ascii?Q?gV4888m9yax/5ZJSkBIlJrwebz8XUQxk0H5BywOLz5iwz6I+qOmLL37e9X2+?=
 =?us-ascii?Q?cEx92c6l8XVyd4eS4kWwrGi58hL3u5phpJUlMcq84h9okU62hWF13Lzi2ZC8?=
 =?us-ascii?Q?Rs0QHSVrETTVhahlIosOGoOoNH9xOO8+2ftuq5JBFcqE2H2MaeWoGpA+StHA?=
 =?us-ascii?Q?h06EuXDTGlWepTGuQScFNLrtk1PY09dKkNl0p11bXJeP+T5rwhqoOO5mmP5G?=
 =?us-ascii?Q?39G6qEDv09tjyu9OGGcL7eK02lRE6TaF2zJF20mCMLE0Fl1msKJkUo4TG2Nq?=
 =?us-ascii?Q?IzMHSnXDRJraL9++GoenpER5XlO8rQaZCZZ5EZrnaX/pYklqKLbJv59fokj5?=
 =?us-ascii?Q?Ige2Fg6y4JXiYSgMxi1Bo1bMRFA0emVh3jDIKVOf/jRO7NJO1USE4H+TD0Fq?=
 =?us-ascii?Q?pYAZn9o3Xx97YNTEiK+JbJ7XDKhXFJYLC3LOs4X3SiHp/bgofLFnHzB2f7nB?=
 =?us-ascii?Q?6VFVcNX/bbcoczccHnw1vAClDcm+PESp7Uwjb6ZsBmDWYorxnG6xxKYap2gh?=
 =?us-ascii?Q?7ektNrWbeneD7yBvklqi39a6H6/vj3OLfasr3+iZpoNxxcgF0wTdIltYxdTS?=
 =?us-ascii?Q?wHAdz0NN2JdM8TGeuQsDujJUU8zM/Um6yXkjJIOuTfF4dtPnEzMhaWVmTB1L?=
 =?us-ascii?Q?JKJ4Q8p725bb68CeJrHMxXhUGPz9dzB9YUkcHiBTwfgFDcFnJExD4Hkq15Q4?=
 =?us-ascii?Q?iWf6w+wepGL71teFqYPbrGyufLD2WFPpM1f+2ebtay3R3eykFYY1s52Bzn8S?=
 =?us-ascii?Q?M6/ZsQ8WFWNF44oHfyOx7X9SKBquQ7nifhZti9VtIPvxc57Gn6Qw8N+jENph?=
 =?us-ascii?Q?7sIF7rIoKDTZ0JtvEsiBvF3r3qJX4ysculmIVP2yES4aK1cfqV3AuHYnM99X?=
 =?us-ascii?Q?M8qg+QOtgt1VqwnCy7YfKtcl/5GuCVI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed9da8f-473a-4406-eae3-08dee20180a0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:42:01.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrBpG26e3E1uv7plklMU+1RqWtD27prL926XAE0j/y5uZW4JrPHcwp1clPLoSr+2vsONx1ReY8lZp2vcijuIhu4Lhzualdjy+ztiayrojclGwy4fZK3vzjcgD4ACzt/C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10774


Hi Mark

> > > Do you mean some kind of limitation exist on this driver ?
> > > I couldn't find it.
(snip)
> Ah, no I didn't - the check is at the bottom.  If you look at the end of
> the function only formats that end up setting fpol_inv are valid, so I2S
> needs inverted fame clocks while left justified is invalid if the frame
> clock is inverted.  It's not the most obviously written.

Oh, yes indeed ! Thank you for your review.
I didn't notice about this.

So, I think it should be...

static const u64 mca_fe_selectable_formats[] =
{
	/* pattern 1 */
	SND_SOC_POSSIBLE_DAIFMT_I2S	|
	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
	SND_SOC_POSSIBLE_DAIFMT_IB_IF,

	/* pattern 2 */
	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
	SND_SOC_POSSIBLE_DAIFMT_IB_NF
};

If it is OK, I will post v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
