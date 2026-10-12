Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012D2D7DCF
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 23:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848361; cv=fail; b=qA1pU0EuFoMGNfwcFhtgFDFdLE8Yy4SaI3+u3BrUxq2GETIrTzuaCIj9kTXWTZ8Yhofc04wNMHJkXdQzYKaYeKwh7FQbLYDGuuV3dR8YV2KM6sukZPX5/8/V3nNLI2WcAXwbCSrojFoGdKtZ8H7NWRMMojeVABs6HX5r8E02YgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848361; c=relaxed/simple;
	bh=rcP9LghmicKhnAY4U+pLuLCckGuKIammMi8bHw6a3q0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R+vbfcr0Cmdw4+K4PSDIRL9N8JNc7Pw15w0ZKqu4hXU3mvD37SfKK7xEi+QSLku54khS5CiSDuvpTCnjWcbadyIIfh6EaPpsbssTw6Bc3osjfhVNfB2tjYlGVItAO1GWMPtxmG3mtTzUkAqxa+EKo/fxNGB0Ep9/X7KzRadepTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I2stKG7s; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I2stKG7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxvuuvWl9HXdpyfUhslEWAbBBVD8BQhGZbyf/Qu0W0PkDgVdM9+EhQN8w23hAyGjWK0vY3LgOpog6ev1J4V2WUB2E003/fWc7oJu0EDM5h/Pj3Xw3zPy7Fm8BxE0Uq7dtHVrCLKKaqu2zWJH3G7DKUbC2wBZR83E86RxLv9E0B8J+ISdAxp5NO6QkEIuTAv8g9/FX3J6ZH3Ttvmccmivh0IAK9AdpsAAwNNMJ2ahQLsLBTQY7nst1k2ja1hoBm5fxnB2rSVStfTtcJGtoZHhqQpvcspOEhXAkrOFOIisHj5dqRLnEMdKAW7+GxMP32pWIju8cCXt9AL94oRBqEERTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFnS93bVyc5BsKJQPQcXlxK8i6jRk4CajDSHLwjQZv4=;
 b=WVxcWbytDrvUn9/CZ6uVKsZ3OwqrCPtcdzxQrGlUrLXQDSkA5bBnd0+cNzzH8RnVDfmlLwv/fnyBD4/NfBsNWlcYuH30kp37sh4wFe1eWO2L1LuGG/OGZ2elAhSPQ9eT9Yzoc5EsDqF+pg+u3K3LcS0yuBkQQGtd33L8qSUn6iZS3A1AgckS7feDup6d8xoeRcEiq3ciZPdaj7RihPSQlHBrqO/Hnud+H9E+8mDNy/H2cdk1A10JSG9qw0qGUSRVP0SNKzxhVI+CVONmIauHzcRDBtvsdG4AX/feyNF9zHS1c3FU6tZrPNvJW1UVRImiE7uahQsgQo/Vw0dqJbRJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFnS93bVyc5BsKJQPQcXlxK8i6jRk4CajDSHLwjQZv4=;
 b=I2stKG7spBXho9/8xFANopZ4qv7hy0PCwYzv0pQ6RzUCgnXFu2jbsHwm+j8hJ3/p55oQmGUG0NdhcYxl162lQQIKm5WtYVDbvYEcxL2Z6vIOwdTTPwO0EbJzylYxRBNkgetZ7s/isfOyEp9FubgWZF9IgTF1m9WQ4fUDf2ZKnF0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TYWPR01MB10035.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 23:39:14 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 23:39:14 +0000
Message-ID: <87se2axzdq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/13] ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
In-Reply-To: <asLKqMzZpRhloNXq@sirena.org.uk>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
	<87cxts6cha.wl-kuninori.morimoto.gx@renesas.com>
	<asLKqMzZpRhloNXq@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 Oct 2026 23:39:14 +0000
X-ClientProxiedBy: OS3PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:604:db::7) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TYWPR01MB10035:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2106ae-6742-44bc-75b7-08df28ba0624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	QN2ekXFA7SJRKfKt5RrPocBEJcMgiHmj2lMyVJiZ7yVl/LkIKeSMm6H5lHVAgJuw1PdmZaRAujwjMwlUDv1AHV9BcSfX2iV52fONAftQRPhBBBYtHmgAlCF23NKysMoUd/n/8L06K6PWBVegHGkd5xK9LIzA1biMIHDyvPoKWtWowyzXyO1OWhp3b8yDgforVodnZbaCfdmVXcRd/5HmgXyYKfggJyPVTC5/jhBLE61rAUzuMyp34Qj3yfoa2DXAc7BzuVfEOhwfecChWp8JHnBHjA5Bzu6kqhYq8a63nVNG8IbDOgRg9idxxXoiZmG7xB1M+bJBWYtSdqBHS7tWGlvb5r/+aLuxtyh0h/qtSw1ydFa+Wc0GEhPXqg0ZqQGvIcsgl8nOSAakfqsLYSeUKKuu371EMhjb5Eb5WwZm8Vl9IdN+lSK2dntKevzpVGXOdFbrNSwN/7HsuohnFNiAaztZV6zR7y4+FhVaoNYIeTs2pvYswnAvbKbhIeL+3xC8xyNCJkY8rcUmPUnvL95xuezFDKfgTW4VBG67JI0qvvktTpGQ6uLrSILisx44nKzgYxzEifGZ9hoTbasr5TnuXrnpctahpnuRsMuPynSj/tJd2M6kR0/T6bynCL7NG85S7l5+wdWQTjKUlHDNx9NpKuGlXxd5dNesfYFQ+MtSNxJf2+OWK7t1i5wmMubcxXSBW5gH0cLkhewNC3hZoiWwLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9CVprazO181VnkmOhUwhEdneJiSeCqwsCBD5TrRxpkIMx0nCLYWflqxhhnDA?=
 =?us-ascii?Q?P5ghxCIBFq2rEgIkyAp64K7qRfrifKrYeNhZqNhC0qQmlSemvF2AOvAwEFX8?=
 =?us-ascii?Q?MSQVH7LQdNEsaBOmPsiJRY8KmHmd4UENj1AgGG39tBPh9Nt9YFayzpd/avS/?=
 =?us-ascii?Q?1A/pfCeCQrae6UxN9yb0LTQ9SG2sPXoTu0QgcUmHIgaBp6ph8K9r710Nwgfk?=
 =?us-ascii?Q?9BGr5GHLHJpBUuZM3xLPApDWRmWP/R0j67UN5y4LC8WSulbh0ObwwFMtkZ0S?=
 =?us-ascii?Q?69oMuHf7IFjhSCib9GJiCpF04ov82C5bzvMoBTemM68gzOt/JHUMtrh6ClBk?=
 =?us-ascii?Q?a3EPLf9+7191vomgHkoMpzKQUCTWAOqxJh3RvJpGHnF/rMws7SpGZUn8IuxS?=
 =?us-ascii?Q?iYsF1oTow7heNtuA7JrPgXzAa1NWLKl2O5FgMfVaSZGLyxGvK1b+iBsXZHlI?=
 =?us-ascii?Q?tYRRBGh3BDHEJxA44wegT7Gcy8S97j3NzoLg+H++98h3Gu1fbLUqsOYkH/u6?=
 =?us-ascii?Q?VJ9ZHr194tBgMfpEK4ddvnRBe3gtol53rE3Sc6tQNKAvT05ZyQjXf+mIPzZg?=
 =?us-ascii?Q?WmHO7cJCjgCsda0bGop6ajB+lma5RzpBOuBXC7hhoV/h9U9Uti2dT7rfrKOt?=
 =?us-ascii?Q?1pxrWmRLZjEkVLQt8AycHg1iEUZduQp0RDQeH0D96aPy1k6Vv3OSiSGDvmmT?=
 =?us-ascii?Q?4C8Ya1EwssKyDTBuEKzSGb+IQOvWc2dBTF9qf9RJ1DU4jAlhr51OAJ/I/1C6?=
 =?us-ascii?Q?LZcqSwzN/vYdN9FvPNAvPwdIjwfcnT3+6xeQiSr7I0ykUK+YRQ0hRTjCZTps?=
 =?us-ascii?Q?Lr/voGubwsfcjMRmo6HCJTAqq0nrQGE+p6kHsN2LnwQF/7GMXL9T2K1ca7++?=
 =?us-ascii?Q?TQD4CW/2d51VwaVhix0DQFfQd/weBiU3t66z5RQFOdBcvHzAvnL1Z64a8xau?=
 =?us-ascii?Q?cjwM/H+LrsspXtV/bhd6X6pOIwaO4N9SdOd9WCPW703rMha9tibMloStWWRn?=
 =?us-ascii?Q?kFEucoK3oYOqDYR21gb7oelQPGFOR6ArSzGGcR1u5vF5SA9nhlPUB1F7z2i6?=
 =?us-ascii?Q?OuAabzXvKXZvN6yKJOKlJ+TnD/dlTWLm49KAB5ec4Hw3FTDvSmfSt+9nD1+V?=
 =?us-ascii?Q?/1RMILOGueTSqaRFXiuLr/fLeEPnyc4kqBVlXWWCRqJKFo2L88a+euRNyJgW?=
 =?us-ascii?Q?PMbXKE8iOReOpwV/e4urIjkYRjFaBEz2RPukOdJ+w2duksnNeJX9qWcEoBQ/?=
 =?us-ascii?Q?RaVWc4tAI+PjJcomR/YBKlBGHoPE3grVnsQmVTt/J/nhneLuH7OUCQdRRPxj?=
 =?us-ascii?Q?+yB0vVvEWF4hzzO7QNUIxmeg0JEKbYtg8KP2WN/EsC7etGeefOIQ5BP7xH/S?=
 =?us-ascii?Q?YNK5ks+BMw3McAWenGCWCmu9WZy877y3DesRdOevSaPNtLrLbSNnJXzPjgDD?=
 =?us-ascii?Q?TDChmTQtGLe3XptZZBBit3dmOh5mzdsC5EwTkWgc9Valn/TQgUY7TVavB99S?=
 =?us-ascii?Q?JNrfr/EDb4t4AsHWU4OKxnVMQhzzQo3hJc1BHaaC6L+PQETgEs9ieAaT+GQ+?=
 =?us-ascii?Q?5uXiWhrVzv/Y3IAoDAAmytpSvWLQwb5ohP1/H60FEXYOxHB/JzU0/NuN67VZ?=
 =?us-ascii?Q?HQ0rdNMeMSVzGgtym2MiUKrGiVF58CtZpYp+eXof4gXhWz53khhVbDh4SdF9?=
 =?us-ascii?Q?vZ2JziytycDD+dWCyhFetHNG5Ovt/1U9/+Ou7aBWQ3BpjVAzsxlK8yxBNfmU?=
 =?us-ascii?Q?FHXvq6trl9QJPMX7iKzu4lXRfqCFSMQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2106ae-6742-44bc-75b7-08df28ba0624
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 23:39:14.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iimu0EjK9tmiXpqnpDd+NSoPsWSe8Rujl6wHseYpkC7BoxGxPf4gomKkCNPSSCfxcIBNpnwu26rg72vElUbvKYyARqhDQssPKSQugDCXChZTVGoZUgu4xpn1xkGZMlVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10035


Hi Mark

Thank you for your review

> > +int snd_soc_component_probe(struct snd_soc_component *component, struct snd_soc_card *card)
> > +{
> 
> > +	if (component->card) {
> > +		if (component->card != card) {
> > +			dev_err(component->dev,
> > +				"Trying to bind component \"%s\" to card \"%s\" "
> > +				"but is already bound to card \"%s\"\n",
> > +				component->name, card->name, component->card->name);
> 
> Just have a long line - it's better not to split error messages to help
> grep.

OK, will fix in v3

> > -int snd_soc_component_probe(struct snd_soc_component *component)
> > -{
> > -	int ret = 0;
> > -
> > -	if (component->driver->probe)
> > -		ret = component->driver->probe(component);
> > -
> > -	return soc_component_ret(component, ret);
> 
> This has a soc_component_ret()...
(snip)
> > +	if (component->driver->probe) {
> > +		ret = component->driver->probe(component);
> > +		if (ret < 0)
> > +			goto err_probe;
> > +	}
> 
> ...this doesn't have an equivalent error log to what soc_component_ret()
> does which is probably not great for diagnostics, nor does the cleanup.

Actually, I have a patch to use soc_component_ret() here,
but it changes the behavior.
This patch just moves function file, and will use soc_component_ret()
on other patch. Is it OK ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
