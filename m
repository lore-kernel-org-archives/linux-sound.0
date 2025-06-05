Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AFD1EF1D
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088897; cv=fail; b=tx6UYyrlkpWskyZ8vYbBUO/WjHLwC1HkEFMSlBTOB3ACq4ZsntcQnH7ObfYtRNji0OCW8wy6Tu8dJEGa4WxOS7Ho6TqCxqebikmXBYKj+1tBAwQdwPcDWpv68scAi7JhctA/rnMrWLFTeL2SlXlZqL19+MeIfzLVdqf7r8Lk6YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088897; c=relaxed/simple;
	bh=n84aBeMwygwh6Eg7k7kOFUqC1gz11876s0ekTwkR5N0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MgvOGwdG+Il4HVyPOUbR5WgCN9s+TONyCUAJB7cNJ8EEo11ROUS7vNGkR5rcCbHqAYYg5vdX1VeIhJSGc4AzbDCytUcb9uDKpdhHbRHq98vgrU/ZEzr/J1CPvBaF7ieEGBrnwZG0BDV3tWh8yE7/ZxG4Jye7hRhAWSKUrewVC5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DUcYzzZD; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DUcYzzZD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKIztX38mjSKjdqjW5XIGo98kRFkllO5awHcER3XWIK08v6t9Ub1yGOOlIH8xr0w+6DYTcMCWI9IGEaAGZDkkNgnQPFEPfzILDfNQ58CPSg0xLIDg+D+eUEL+kuKLJY8VHdeAsz317AM2DLBojBE7woRffszR7HH6MQJ8jPb0mryi6kaVeBsKkreaiuqQ1TqY4POCSPZ+Mhfl9jvzimfz0HTFZyy/IO+yXlGzxfcSCpgUJ92HP8MH7Wh6gzpeQ6FnrGFuRiDrFViTpf/UD0XdK+Rn0HUhaYssD8E7F/wPXZWdCilIGZR+QCG8X32kJdiW0OX2kKUrM3rN+Usm2cXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILFNdNpu2cndrMIqPQR3eb+QO5oiKpnpzsvucTokGZA=;
 b=vpT/tiRw9pyBBfkyaf/PlusYs+AcqmV9wrawNAOW5ndS+n3tvUpheRKOutPeE0cYkfVTlkFRCkD7qSUXVZ9Wnw7elorNA6lMFNGUExVdCu05Ua6F/xA99Lxy0FCr9pLjSvgJ1zj2Dg1crDHwASq3lfXyiBrGuXflJ7C7S9daeKwHDh8zWBwvZeqkSkV4jnCtg8RTSJULPPejppWIKmDMk5zFEV83r0luE46N/cxNpYz8JQv4R3Y02lIQwiTNTotIrfcSg633gyld6kbw+mVcWVpIHciaoOI3kk6Y5qZGo2kywdOaUbvnDd8dpCcZ5s5fPVgxc/lO0oODLLFofUeo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILFNdNpu2cndrMIqPQR3eb+QO5oiKpnpzsvucTokGZA=;
 b=DUcYzzZDe6tlpbgiv0uWrfME6fbbKZb+yIuXd75Ghv3z90Io7bLvylJMTtcrJBekfqyH5zxZtwO41UA0985NnEZwa72YgE3iRkyCHlIDnbZr9NXUYUFBFsQY/T0KWXj9EYPdY+RUBuCRDTUn6IwsMiE5Hv7flXiDAN7JiBGNbV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB14279.jpnprd01.prod.outlook.com
 (2603:1096:405:213::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 02:01:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 02:01:31 +0000
Message-ID: <87msanj69x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Giedrius =?ISO-8859-2?Q?Trainavi=E8iu?=
 =?ISO-8859-2?Q?s?= <giedrius@blokas.io>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
In-Reply-To: <87qzzzj7t1.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzzzj7t1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jun 2025 02:01:30 +0000
X-ClientProxiedBy: TY2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:404:56::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB14279:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbf0d5c-dc0a-452c-cccf-08dda3d4e3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?ooX5VeBiPX8sC3u4Y0UhBw6a5dO94jMxtT7cSi91pT3b0l4G/LMiGANfQF?=
 =?iso-8859-2?Q?ft/hPG1Mrchz0ZXL7iVa6yEsdLszo0sKmyiVcFw2+G3JAE2m4HfHzjog6q?=
 =?iso-8859-2?Q?UitmJVjYozGQ6pL1vYLyI2QB6ks3ajlO0jth494i+NQd4zjQqxnuzIqhjK?=
 =?iso-8859-2?Q?NkMJVagAMpHC4PvtNE9jsL8Etq6U/iVhMCuSfZKRLARUNt9jKunwvUvKf2?=
 =?iso-8859-2?Q?tdyEEfDGuGdWSHlRj2si3MLWcyLnLIW5b9YzxAfPWuc+05AL9IRvt9WsBo?=
 =?iso-8859-2?Q?F7E5EK51BowlVGp6IbxbRF/8D0pKVjTSLhH2i08zCLhJjz2MkQVFneQQI1?=
 =?iso-8859-2?Q?FvXp6qTfoTgptLiv05gupx17iHnYm0kyFWJ2jK66uwHB5MdVGSfSwbP2UO?=
 =?iso-8859-2?Q?3kWFIiybs0uDBGurmTkLFXAIu47K1Tugcap+yTpARjcfZ/9ztCN0TQVDLg?=
 =?iso-8859-2?Q?p2neU9tAcJH5v1S3bCsIr7eEp17Iz1NxYY3dsTJ6zLGnzma7G0FpfdDip8?=
 =?iso-8859-2?Q?W5jwGbnuAw6rRXU6LAiWpQO1D1IM8nKO04jcPiBvgikch1DnVou1Su5uZc?=
 =?iso-8859-2?Q?uc4pCD+6Lp2/LkB7Y230BT6dgJzpDJHFUbjHFPocgzQIaCdKSVBurW+IK0?=
 =?iso-8859-2?Q?fEOMGVER4aYebJPMUPXK8f6EA40J5EAfIh3+NAW/vzurunI9XFGoDZEA3l?=
 =?iso-8859-2?Q?uUR0NcGKg30sm176/JdOwSV4zmyqMPc9mue8ejhyv4PvnIHjmRUTX+m5cS?=
 =?iso-8859-2?Q?CtyykO6o9GAMi+mMXkNpte/2plFWoaEjbEWLBJ00jt4QjKQIBhsly0jo/h?=
 =?iso-8859-2?Q?OQrG8jZW/J1sP86nqeMpQrmom1QclQyvut7ha2t9laBYCQG2gqaoSwDEtb?=
 =?iso-8859-2?Q?RHV0myN905oPD74/DwI4rmp0cXqKws+04nW5NqQSMsVHr2icqmgV1hzrya?=
 =?iso-8859-2?Q?vGK0J0Z8WLOiNs4KmWLR64hEgZ9A+mvQJ1wa4bKBbyxodKIlwDXRNcWMis?=
 =?iso-8859-2?Q?Ej3NP3LQoN+TeNmBzCxWh284oW27NKSZtXGh96A1BcewzWoaepO5u4SglR?=
 =?iso-8859-2?Q?SjOWRQkomQJJT+i9WLbnCLUdBtSaQnAcidaPbePwX6QujGuFSI0g77uETt?=
 =?iso-8859-2?Q?4zJKumB7ECW2grYduImMH2MEogvbx4nkJzSzdokSnEtnc6vnjzegUqgZCL?=
 =?iso-8859-2?Q?33/uQdaHzFBKh17jmMyppOUYCk8IUhnmKZYGtQq9Wm8Hd+UaQdUwKEhZ5n?=
 =?iso-8859-2?Q?AV06CrRpUARHMKIsGhngT1LQeZ5i4d+Hxg7UodOa7QrgU/ZghKBi/cv7Qt?=
 =?iso-8859-2?Q?RAy3jM5YE5A7VBTwHwavm3EP0pQHg2LmvAjWhvIVXdUPg4hvTUvUBrESta?=
 =?iso-8859-2?Q?5n+EmcmWIItou2Y0B4DZLLr8PC8Z/UOEKx5e4S/is2Sj+hNI/q3qFg5gv3?=
 =?iso-8859-2?Q?guRXFb6kM7a19TQoZAiN86TOapurNZxLt9uaiqmIbTRNi6gqUH27CsVkRD?=
 =?iso-8859-2?Q?E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?3a79yF117mR8kfvCHZtYUfcCbmEVugg+yzhX3G3zy+dVk6vrLAqLHzDCqc?=
 =?iso-8859-2?Q?mvU6RrDT5OiwKcsetzt+pkS7vVXLlo/OTM4XqR/cQG4gs8+qSMs9xm9KBB?=
 =?iso-8859-2?Q?QJ6e21Y3L+SSMMBRWTvzwPfuKvB504BCvout78C9cxbsBh/vF92WKvbPCI?=
 =?iso-8859-2?Q?qndhsB6irupz8S3aF5qpWd7GQAywQdWJl3BSitlg2ooPZ0CYVfc3lO5cpu?=
 =?iso-8859-2?Q?LR0WgIjh0+PapvLXVpAF8NFwTmCoNJOqnpPgiXr2p/2y4/wyVucf46+wQ7?=
 =?iso-8859-2?Q?vYsKiX8ze7XQUGMZhTnV6HD//JbpQNLOBVKQRhsYisVGrHhuyP2d8ajrki?=
 =?iso-8859-2?Q?OZx8oRYteKt5od1fza5jC4Hr71Sb6ZIdCy+aoJLJ5Rjj1jC0ywcrsXCpNh?=
 =?iso-8859-2?Q?i2qthxhIRWB88xHiMZKR8mLsFGdyMnnL1dQMtCOZZYOX/hGsUCKif7W2dM?=
 =?iso-8859-2?Q?VSS2Ceg++b3z3xu1lFzXBc/nNG+L8f58EWWEDu0rphWPgPq8fSIaXvm6aj?=
 =?iso-8859-2?Q?H05DkHWGDayOe01lj8YbKcaNDbjaxqe+VWjQ2fBoizsm11N0k5ArsmN6Ym?=
 =?iso-8859-2?Q?1rcCzEOaaG1OEm9iJSjW4pnxbxJYUFO5qXHSO6lCILZxv9AdW219JHuf50?=
 =?iso-8859-2?Q?FTLSoaviRbow+aTAW9zDD510/QX8KpG26tauWJ2bTrrf63cXp1o+LECny4?=
 =?iso-8859-2?Q?U2ZCXevzbFCWA4uqEHt9iT4bwM7Y6JfsNf67fSzT8Zi17rl2Vk5Mv2zFON?=
 =?iso-8859-2?Q?zetE0MG1do0kowM0skT9QhsVcUHOz56VnJGt5Wl2vaCONo9SObpxoBiZrj?=
 =?iso-8859-2?Q?gC0s21XWufa9h1L7sctqlxSKZeEzBLvFP4GJj1+mYE5/3V0/hp0Yyrhl9p?=
 =?iso-8859-2?Q?qt1NAH3qLq3ZERNu5b9DfUpuDCQxULQSYXeQ6q8Twir3zHSyrj1dIY2ay/?=
 =?iso-8859-2?Q?UJlu+eVHoN90P5kT1B+Bz3G+hYxfIShYAzqnU5+RPYTXFcj3IU/jdglLSB?=
 =?iso-8859-2?Q?xQgLbkk+ETAGWEU4SkM5/i4DEKS36hy2OWtGamUwnJ7hm+T1po9nsdoW+p?=
 =?iso-8859-2?Q?b+pDT5wQzz/MV5lDvFJbKkG7e704FymyGhjosrPsw58DEuo34ZFC4LXJ+Z?=
 =?iso-8859-2?Q?vD7q0NnWAucW8C+TsRm+T2GXIpj0VY8hyN66LleUIOUsaOQkNvcpDZVu9O?=
 =?iso-8859-2?Q?Rf18r0HKkq4mkexSW/zta2LS6iKBnNagnF3mdNPj4cVMZuvwjfY1MpsgV8?=
 =?iso-8859-2?Q?SV9VxobHEjPnCZQioc2FPX+1aEMuPZMWlatBmjISpZY0wEUMTvXxJ3dfPA?=
 =?iso-8859-2?Q?9nbKt3ffDnmIDcEhedxy0E/fvoUx2Z7qHFmnSWt/sZXtfBx3f+KuH48Zhh?=
 =?iso-8859-2?Q?JFgNQK97uQOC793Nqjtv3w1AyERBIANX/5qIowo0ji11TK1O15rbu22V/r?=
 =?iso-8859-2?Q?PStYUZ531V+7z84DSBiXrAOPEQqbxj9zcMtoMmfrjmppWzsoezuCh0wZ1o?=
 =?iso-8859-2?Q?vXRsd78J3XswYSHpaONvGva0Y+R620QlP9lNuDFAg17QWb2At5rEjHejmQ?=
 =?iso-8859-2?Q?4nD1HN64yYnVKRyj25FFFc2nTlPqxONAo/afvkW/fYJHq+v8txmKWdYRw+?=
 =?iso-8859-2?Q?9aVc2f1KPVsHqO3zCOuWtdMMQtaIeGO2Ug9B/yaVhMAXHA8A+D0GYxjQ?=
 =?iso-8859-2?Q?=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbf0d5c-dc0a-452c-cccf-08dda3d4e3ed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 02:01:31.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFuZMDGt0y3hpNbgCft4eqe+zbNmZPvgA4dbNuclRTO9BfWuIIGM+WEs/6hHspMxEL+GOkpXoAujIwN6Ltl4bRCgV0hkbKJ3F7OnjdGCZc5nlW0fxdAS5cF3oXBia/Qw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14279


Hi Mark

> commit 7f1186a8d738661 ("ASoC: soc-dai: check return value at
> snd_soc_dai_set_tdm_slot()") checks return value of
> snd_soc_xlate_tdm_slot_mask() (A).
>=20
> 	/*
> 	 * ...
> (Y)	 * TDM mode can be disabled by passing 0 for @slots. In this case @tx=
_mask,
> 	 * @rx_mask and @slot_width will be ignored.
> 	 * ...
> 	 */
> 	int snd_soc_dai_set_tdm_slot(...)
> 	{
> 		...
> 		if (...)
> 			ret =3D ...
> 		else
> (A)			ret =3D snd_soc_xlate_tdm_slot_mask(slots, ...);
> 		if (ret)
> 			goto err;
> 		...
> 	}
>=20
> snd_soc_xlate_tdm_slot_mask() will return -EINVAL if slots was 0 (X),
> but it should return 0 instead of -EINVAL, because snd_soc_dai_set_tdm_sl=
ot()
> allow to use slots 0 (Y).
>=20
> (A)	static int snd_soc_xlate_tdm_slot_mask(...)
> 	{
> 		...
> 		if (!slots)
> (X)			return -EINVAL;
> 		...
> 	}
>=20
> Fix up it.
>=20
> Link: https://lore.kernel.org/r/CAMONXLtSL7iKyvH6w=3DCzPTxQdBECf++hn8RKL6=
Y4=3DM_ou2YHow@mail.gmail.com
> Reported-by: Giedrius Trainavi=E8ius <giedrius@blokas.io>
> Fixes: 7f1186a8d738661 ("ASoC: soc-dai: check return value at snd_soc_dai=
_set_tdm_slot()")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Hmm... this patch fixes snd_soc_xlate_tdm_slot_mask() side behavior (a), bu=
t
it might call dai driver callback if it has (b)

(S)	int snd_soc_dai_set_tdm_slot(...)
	{
		...
		if (dai->driver->ops &&
		    dai->driver->ops->xlate_tdm_slot_mask)
(b)			ret =3D dai->driver->ops->xlate_tdm_slot_mask(...);
		else
(a)			ret =3D snd_soc_xlate_tdm_slot_mask(...);
		...
	}

snd_soc_dai_set_tdm_slot() allows to use slots 0 is not only for (a).

Should it be like below instead of fixing (a) ?

(S)	int snd_soc_dai_set_tdm_slot(... slots ...)
	{
		int ret =3D -ENOTSUPP;
		...

+		if (slots =3D=3D 0) {
+			ret =3D 0;
+			goto next;
+		}

		if (dai->driver->ops &&
		    dai->driver->ops->xlate_tdm_slot_mask)
(b)			ret =3D dai->driver->ops->xlate_tdm_slot_mask(...);
		else
(a)			ret =3D snd_soc_xlate_tdm_slot_mask(...);
+	next:
		...
	}


Thank you for your help !!

Best regards
---
Kuninori Morimoto
