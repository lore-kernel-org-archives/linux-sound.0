Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3064C85
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738544204; cv=fail; b=CmUc4uym8KIlJkcaYwMG5Jz1l/nxqUudqD/AR1UkLrluV7LVigW19k5m0QzEg8Ylu8k43Pbj8/BBLGAtqvu94JmEdUG7C7ppC5jK8tPT9zlV772YgXRm0x1nem119a+QUVv8krBhHTVXd3U6pcPyGroiRd9XEQAiqbHgys3Yi40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738544204; c=relaxed/simple;
	bh=hi9Gdy3ui6ev9Ok0XVYeOMKMEgszyoGR/0vTzd8PJ7Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qiLAYGgEqRwEOgKxRDXXCk0LK0oX5gDs8RnQgREylYck/lX0HaqMizd4A8qgf3Bsqt5YTqvTqqHVtqcO0gb0lhAjwSmc0J7tjeaLCx6mnA7PcG+jnbVzRoVo//06Q8O8/AOZHSLaV79UCIGJ9LBxjkQ8KaE7IXPh0DubQdFZS2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I5wfZZyL; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I5wfZZyL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSwtfG7Jlm/FWP8aKxU4pIIOwcmMhlYkCEcEb3n7lMMKOaq4UW3N+obAasuv9QkyRRowTN8/yQ6u/DBeGlggA2rcunyTNztdY4MWAfuRk4yE0sovTYu+2K6uHtvzcrtSizPAzy1MrZm+TTDzjViOMowMGtpk9jS7vUamKL8pBXZgxH2uFLW81IonWOgjvBRL63SPjIjDll44xkFyahd33uDjHTIoreX/Jmzv5271KXF1gZDmWHj0MAlXP9nnvEpAg/XowMF96d+XRa15CxcyyTpT6yfvSaUM1gl3/AN+GP6yZ1ckCNfUw7uIdV7MiL179BvdI8/6Arr8dg2Ul0hSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFvKY1fiwcEl8M+ldbNV3zJyNy8t6+5bbAMe1fr6mNg=;
 b=KSSUPMy0pbjbm34ENRfp+3cXo6fc9fo+lsjn7GNYS+gq2kmWfBgi/UaleYpf9cew7WcLtdjKkCUVAg9avx5o2uQa9EdDTJEtz966InxZNKiK8bmXq8df6aetMi4ooVYFyrutlwMKMtaEp1dxoJdDyXgE5Ufd+RZLbad4AR360En3ZbwxBYnHiq1fgJAc2CvNFLrBOcnmLTfYjcdx+I8E/dNjmNfeKBFybqgFi+pVnYUo0sHFZAhU310G3flCEa1Y1FTWyIisH//CEMibrSzM3CB9JkLze7HuVElSecrJXEnUnTTUNV6+Ci8NUiPKvV0TEEp/vzZ47wncqV+fQe1PXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFvKY1fiwcEl8M+ldbNV3zJyNy8t6+5bbAMe1fr6mNg=;
 b=I5wfZZyLuGXwYkEcaG8kmiWNkw1LtqQ/SwCH+w21EY++zJ8pMrQ4Q8liWJnCXSR+yh+PABsrWhtuio4G5aKpGbuHX954Ywq/Sgw37C4bE4LoZRXskVpsY0hMBg+LqUAYwc9nVW1zBwXWG8jTEQJVEAI5FNPgl0+/DSxhGllZucM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8903.jpnprd01.prod.outlook.com
 (2603:1096:400:168::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 00:56:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 00:56:38 +0000
Message-ID: <87a5b3sv5l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: add snd_soc_dapm_add_routes_with_card()
In-Reply-To: <729fe828-3048-4b61-b2bb-93aa9c8d14c6@sirena.org.uk>
References: <874j33nlvb.wl-kuninori.morimoto.gx@renesas.com>
	<729fe828-3048-4b61-b2bb-93aa9c8d14c6@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 00:56:38 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f5f116-d24b-46cc-f53d-08dd43ed9d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SJj+s5ymgll0ce7rR2wqsApcPG3WnANeBBgq4XT/gX6UU6s5Qxla9vrwna7x?=
 =?us-ascii?Q?cxO0MmAySVDrWNdWpW5yGb8fyNqkbl4ZkMJAjo+WlmHO+i2OQcHjt/HSjQOf?=
 =?us-ascii?Q?HK2OQWRKRCnpRWoYNPMLbe4PoklnxFx4ymXQuabPZgk/XdBAfn564/7EPOsx?=
 =?us-ascii?Q?A1iNY66SBE6B9qTOd061i0e1WsEz4L+alBPF5zUubCc1T4eLzAM4/YxMoHAq?=
 =?us-ascii?Q?CmJcVgAq/DO1Gd716K6lm710RGKdDhkKWOTE8KT+Fl6zRFpFQsucUUuaIq00?=
 =?us-ascii?Q?d09Jc2rVvPHxh3Zxafo6SZQave9ZthWPatefiEM6wZaCWfFk13D2EtGFUhyW?=
 =?us-ascii?Q?N76cVprS438YgYiIArKR6uJTKVHdzBv75JSl0Q/9MvKTXc/utgl78mLwFuPB?=
 =?us-ascii?Q?m8IJqPDVbIh4tyM9EQgbMIEwpyxecUjgO6H8SfhhLmpsuSd/D8LqtMfgRbfi?=
 =?us-ascii?Q?AMRYai+xQNINISD1v3F/veRulvS3k2tk1vqW/ZFtSvdSA1bKlBYGHgq6G2EH?=
 =?us-ascii?Q?Ki05ai1UZSxqO6hmb1huUSnTgm9wBewuuKPRSvdoFoL2LgkN1r6xw6hO+HSq?=
 =?us-ascii?Q?AfMaCQsAKRsBG+yhoI5otqoa+TbufxBJpCGNnb+PEiIoEd3iIEOfYckTZjjT?=
 =?us-ascii?Q?NLblg9WifK5N2baOTGsNqzFS+QZ0oMzYf6kV1F2PRE5Pjd62vZ0JRNN82WGb?=
 =?us-ascii?Q?Qhut6fEO+2RRCoYTxsAff5NQsFLHgNaaMq1wG1y/VoJxSfsU4I6GlpY718qk?=
 =?us-ascii?Q?twajGlaE4Ypot3IEghNSdr8dQ4quqms9GW4goBkElkA5Ue5y8TQSZ7JLVmMI?=
 =?us-ascii?Q?cwXPrrq4YZI/zCgGdHt4sJQ+lclHpfmHC+dJHzglNz3cukPtcspE+7Db4UEs?=
 =?us-ascii?Q?aOFPYnNnXf5dqKR65xxTkfEWTsXRCh1tM8fBRPb7ZCPpKcS8dnegrT706xeO?=
 =?us-ascii?Q?6uZSSKo80cZhKvvTTd6/+q/uFHPbS39sVsQr/O8N82T/uaQByQqEr0hqPN27?=
 =?us-ascii?Q?MSjgn5F9GxrTcnpjRRyl9703rQbtH1RMhKic1WAiUG1EJHZjVHAJGgLjey4q?=
 =?us-ascii?Q?9Yyd9nQFh5uPQHV9zmY2GbpZZUPbqau/fJ4SdGeUjB7m7JB6XGaP5n7iZMaJ?=
 =?us-ascii?Q?V570N6epzpJR2ivBa/2GFszSsGhlow45lQYTu+MQixGqPsaT3Rr8L9GNPiDJ?=
 =?us-ascii?Q?+gt+lrc4lX+q646894Knl2r04PYqDk1bPoJVcQed5nit3avnKwpCyKZZZHce?=
 =?us-ascii?Q?PLSszP4O0fjUkRbIsCuEl3EgTW/99odJ747BptPZ7LjeaVFgd4MniB465ERC?=
 =?us-ascii?Q?pkZ+ZWms65edVCWqXhAsWnCvz/VfJoGGFbUETsGXrw6UBYLQulpj0jxv8Iiu?=
 =?us-ascii?Q?wpmtV4hJU0WDfZRqUrrEZfTMvxFGqwuFy6kqZ7rA7xh5xC4fkZYsW9V4HcKC?=
 =?us-ascii?Q?xf0SmiFkC+PX186QnRjIIl2bNVzJXher?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pA0z8UG+4MEm3NnPiZrA1zAxh5H1do7/VmdeUKN1oJcFHmrg6SoVvH9GxCZS?=
 =?us-ascii?Q?EmPGlk3hDh5VjQ4ckoxu7LHcESSWH6VYriyoa5rYR/c0O9pCmXJKp0LFBDgD?=
 =?us-ascii?Q?J3bjfmf5QrKLTFhlTEkSgjRr5t+5WDEKIcnIgXNpsVBbHMBAv8YQR1lIEE5M?=
 =?us-ascii?Q?dRRFeb/XuIAZRR72ZFXOPD63zSx0Jywxip4TWTIqQ+c1mpOXh36LHOBh/1kg?=
 =?us-ascii?Q?gMSg9Ooqwf6Nxe251JvxjJem8pEQ+Cny5VeUdO1eTxo93Nqj7m+PgNGVVOgV?=
 =?us-ascii?Q?YnuaUg7gejIt+7fG68wnpKmnZvlp9a80d214aMbOWgxb7apDlciv2NLoAklf?=
 =?us-ascii?Q?QWQu1TbLKn3G15CTfXTx/gbTBcpf40qqXR6QxFYjokLgfxPc01SFuHoIkfkX?=
 =?us-ascii?Q?zMob/6ETmtvMg7n986oNK6ZZfN+abX+teukKnySTgshoedPKdfjVvTIgG5r7?=
 =?us-ascii?Q?AGukxTxHeI1WEpw4vktshGsmt0yric3E/ovLjYlTkR6dwjxhaj4jTRS7cOgc?=
 =?us-ascii?Q?w2YzN+kaqlCOeQ93sz0uLi8e5daviQ/+7reyzUivfZQFH7zpS0aYnbzkiepn?=
 =?us-ascii?Q?eHX/0gXaKcifcca2W6e8sGbKBOw+GvLRGPGXWYX6ic5HfTAC3LER7VFX1TXF?=
 =?us-ascii?Q?l29mRSgIk9Kt9OXHMXwORUF0EM3RRp9Ioe5GqeHtEjv2fX1Ng3PB3PR5D4ie?=
 =?us-ascii?Q?MUL5G4nH35fPva/zUUnht1X904t1P4nZLYLWdJq7r92MKWQEBBcGhCeoQJho?=
 =?us-ascii?Q?gqTfNO4979YRmK5kDUajdxz7Bq1C+j0oXQrmIb96bt4DslUz8oqk5P4KEsV2?=
 =?us-ascii?Q?JHVFman9PV6nJRvsZNYVdq3xejYVI0BZMogMJQ1xEhG36OvjvmmKwCxCac8N?=
 =?us-ascii?Q?ClJsJZitYbsuUHruQgCtnnA4y+zE3M6zlqaX4JxrmJDJqYcT/9sS478gzaQ7?=
 =?us-ascii?Q?FUnglK+MQgO4+ZIzqk/2bxTQ5T9ewPV4Z1CAk4TiauvOemOD7xZvD5edhxwd?=
 =?us-ascii?Q?Vh1ltmnH4KT/K78NNI7NlPLcGkxZt5Dowu5g4uXPD59uPVv3U0mdpMhKj0Kh?=
 =?us-ascii?Q?EC1fXrVUQ2FEi9W77vHHgmQjP0J3SipGs3s/mL1yr+XJXI/xrYUkDAOS0wgX?=
 =?us-ascii?Q?sP6+1a4VxsfY5JV0LQZdlOq4ISRHR9EDDTzU/i8nH/liFUkAimebwho5R8Kg?=
 =?us-ascii?Q?AcX9CJ9apuB9iNHMWpADZRSd+/Ld86ixLMIT0BhIUW6RUHCr9erkTww/5wZx?=
 =?us-ascii?Q?2+8RrDOE0/jOqtu5/5L/2MW60EkSDfVKWTS4mJqbwBuAjtcSkiCBN1Xsj7Fr?=
 =?us-ascii?Q?3z0DLlt3wWutG+XOBDPEzEaUbgXw7P91vmBH3+7yFLNW6XfZERIbtoRpibma?=
 =?us-ascii?Q?PRhCYvdbsgu4l183dxXxv8S4cqZUo3tJmDKIylXwYEQ4L9LriZ5b1Jza6FkH?=
 =?us-ascii?Q?ziK+3gaYHXyu5MTbr33g6hQANTjDmjjP/i9MpAdrH6yQb0U7dzwZnA539BFn?=
 =?us-ascii?Q?67lRr531MtLr1CQEVhGSPfjqNok1t8ZERWmNz8u8WdZNC7gvOio8HBIGFY4p?=
 =?us-ascii?Q?qx41yY+izpD2l4eBXEUl6VlaXiNcjou7nHPNhyJ2CdoefZJY/2AitPvWlWlT?=
 =?us-ascii?Q?3xVptC3Bbsf7XGv16SF1i7o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f5f116-d24b-46cc-f53d-08dd43ed9d5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 00:56:38.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STFBWuTzyskaaqGcJW0BAO0+DcKmb+sMuEEvHO2d2S/4lO9VMi/YYjartwdwbPiSSNdHvGXQ70HH1pMebiPYWRRWl5sB4xPKRGf5wM4rMbXHZp28RxLT6QgIFrHikQKT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8903


Hi Mark

> > Some device want to ignore snd_soc_dapm_add_routes() error, thus
> > card->disable_route_checks flags had been added for such purpose. Because
> > of this, ASoC has duplicate code for it. Let's adds new
> > snd_soc_dapm_add_routes_with_card(), and share the error message handling.
> > 
> > We don't need to indicate error message on this function, because it will
> > be indicated from snd_soc_dapm_add_route().
> 
> This doesn't apply against current code, please check and resend.

Thank you for your help, but this patch was replaced into below 2 patches.

	dd2395162c07e4102fc83878dc394ff63f2eaae8
	("ASoC: remove disable_route_checks")

	61aff2da3e63a43f22e60aa1bc57026ce07d189e
	("ASoC: intel: remove disable_route_checks")

Best regards
---
Kuninori Morimoto
