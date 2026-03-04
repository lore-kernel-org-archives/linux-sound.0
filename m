Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ABC34DB56
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 23:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668663; cv=fail; b=nBpWpNS07zGWkB0nl59AZRo2/O1dUNbcz6+ZkLrcL1Dx9xkny2s79c9ExaPmg/fQnqLheNAmXHVUQWnTip7YB9Vom/L3NwB0/+ZB47UBRj7eL2K6fgK5o+cJZoZKvzFjr877LT6zsWDP4ypYAJSQpesi+g1KyYklaTjI4ZfQ5rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668663; c=relaxed/simple;
	bh=1p16rw+LHse6F5rbwOcp+UvN0gQ13M1WkGPCxcj/pDM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Q2M2V3CYZNx4PTU8OFdedynQrlH3uG310QhnvRfcr4w82dpTLhGXlYT25VgSauSJ4MOBqkLqapwdeA22+bRrK9v0n1u4DZL8kYP8obK9v6ooalbpBKxvSBHMO1jUmeIBdGdlxbpGHDTFAzTT8Q/a0AZ27vYarc3QyhfNrcjTmyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a8TyzHB8; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a8TyzHB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbeurW+ZitnNauQ3uM6b9CgMhu3mRkYkivaGBz+9CD4Q5XPY1m3n8uGpRaruBTxs83rVRozE4bPFmm+AIrSY/Nvd+SsvqMRKAuAojvndV+HCgAOUWXmmxYNLB7f5blyvqwjif+M8+jFGs1JKYC6msLdpC/zcNX3Oi3Gjo7K9AJr+qf9AIrj4uVdom2cVgm0mp34sAfYkolPvlP/2Km/NSG7vCcDkSoFLP0cjAXEEsDGGWHkSYvF6trIujrbx3DZlVRgv2A4p/Lg2MEYHJiIVE0DjqMiT1FTkiehxWUlTTC8Uvp4Q+4mVHF4Lqv8R2m/tmvt1rlIXVYUyHJDnhYkPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNT/efRSjTlondwNgJStHzhEG25pjf63A+aLBghIzbU=;
 b=rFsM3OyL8T2T7NoUAul2hxtUTHLnjc8TpR4HPRtWqjYfANKl161WvAp5LsHWHl09v8eKPshkR+Qq5hKCXKQc9bnyN4uwJOma3qoq/V8GoUS4StnCpBVBCSV4efo7Xhj+gdcgZuClx7RMP7oMJHXGTPn87pbdLM67aiSNVymaOpc4LNM6ZofDNWWb4sF5giimqIz7UCTJrI4rdjfZ6BUvpxZb9VUtps2ZW0dFC6pLDTUQsFWbKFVeqy++amZzxanj8U6y9yxhhKEoo5jdfkRLQVkdONO/OyqNLUHLjeRa4OwbgmHRSgtuk71VPhGUa99+00oJpzrmnvyGUdxzzNu+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNT/efRSjTlondwNgJStHzhEG25pjf63A+aLBghIzbU=;
 b=a8TyzHB8SKu5XXYSGywLsebvFaQgAum6u3PXdrFL5hQtco2X8lqHoDhuMNhva2m81am1opOh/XCiZK06uYJMDbICf8CEE4dj4ZaXB3MsyVju383R+sqJm1aOWnYQiVmdpUYn+ogWInVhN1U4ySGfQnq8dTVrzeuQEvu0aWFOdjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB12373.jpnprd01.prod.outlook.com (2603:1096:604:2e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 23:57:37 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 23:57:36 +0000
Message-ID: <87cy1j407r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
In-Reply-To: <678371c4-257d-43dc-8118-cbadb50527a1@intel.com>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
	<678371c4-257d-43dc-8118-cbadb50527a1@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Mar 2026 23:57:36 +0000
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 4532847b-c708-4622-41be-08de7a49cf85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	3s8cDtEZhENwL050kV+AfzWlT7Bt4k0Q6AFW87WcUnS9TLUj0DUmvKi2IS8/E7CZUmEjOdWpkdxcUt+DhqUzoUB9bm8hqnYAEs0bjXjHAFlG2wVE9tVFb/FlHWldMSAHWZJ/ragV1PR2t7zLMHTFTWVsRmJTE0NrXEsEpN7x9Qv/X0v+c/Q0FTq9MggQrdDf11BlFeVdAqMZ7L/57GJLApNNw//7HhkkJqGQ2S2au2/Ldf1Yh3DUUvlo3KSbBNhJmU2dqUhFahJL4gGMQSxOez93D2nP+BAuW4oAMX5wxmAYJTDET6ZRAfKvq4a20aWPDVjp9rEslP8rli8RcnT6UyH9gnRUSaLyiGPmdRRb5VIf6mSwaeF/e1xinw4sB8c5swoABLG+gO/YXy0AM4E72AGvBagAqy8baOH+lmE0rapmyDfWsuZgIKtX+S1nN3sLKakqmCBt3dAw1mUfV4Z+EWve9WdrE8fvemberf+PUH8OpO74aWjT3uZsaAiluaqgSn0mCjx9hu4CQNlDFX6LBhCakPCT0fhzUYYsE8g/1Qn+NVtmSw6QKTMHeEmIB9Uaq+VAekNnFGqBPuqZjSYHJrc6L0i2ZVVEWeGRMOSSsu4Tm8j91m3vEE7plifgDGHy5qVZsWFpusG/6jLuCZoR5Y7mlZsx18LhgnH5mn5cBApTP31WPdSaMRwAeXacJy7iIB7VXxU8FZl9GW/CiRicE5Ejs3rACmtOtjAAtUsy9+GTrRFYu8i3Cjh+ev4pyT5+kLFEUoSQRolotdvDK3CmO139QNLtfoeoCpxMH67O5ko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Yzgty8GqWbCLAiUSOsls7SLErpR9921Qg3HElCX4HvoSiG1W2UZjIeu9Bg?=
 =?iso-8859-2?Q?57D7gf2u1E7Gq/RzylbhzVVTmaXMV9yA0YUk00FtThgJ58O5a3JJCmAlCY?=
 =?iso-8859-2?Q?6scxnV0ECXSku1uOqBuwuvhc5HPvqfxBawWAb9LUOp6ILBCltr9J8cDOlo?=
 =?iso-8859-2?Q?fgj43nNN8PzdNAi3dI7M4HXgjzpKOB/VgIG/3T7SCuMIybVy1gUxLf6Vzf?=
 =?iso-8859-2?Q?7T9wgH8SQIE0eEb0bgzktY7t5WrxHl14J4gHQnXQd6+FOOIV7VoXsXeGNu?=
 =?iso-8859-2?Q?jWQolXVma4yKuwLrOZFIRb/I+pEnVphcfYV4RskdmDe3TREnSWY6Ek4vBC?=
 =?iso-8859-2?Q?WZsHVdSfm7smChR05NnIuypt9eFmtOTqGmYqVYmVGpRBOnoZOEXaPNUmI9?=
 =?iso-8859-2?Q?GpA6DyAJNihuMs8px32KFX8ChomPUJOXtlp28RoqYQq8F2NOip9I3skU/a?=
 =?iso-8859-2?Q?f4YpOvXVMFl8BKdCXAMOaMIg/tPsAMwM5MSMyZevR6KOFdltR/SuuF0d/c?=
 =?iso-8859-2?Q?6ZvgEuDnTWcCG2TD3VgyBUKyjlr/hzerJZVmwas/Yp4mdCd10EReiZ4mdO?=
 =?iso-8859-2?Q?vx3MoButSurr3DGa/uxxJqAVe7TqWJ6tbiqTmjef164kSm3gIEpTccpQh5?=
 =?iso-8859-2?Q?PauWHYSlGiJIX4JzNB92rdD0TWkKrwYf/SVJsBxCB5ai0KsichJ64N+8hA?=
 =?iso-8859-2?Q?+QKS7di2fA7teY34aWK5XqFw8l1FJUZGB0WcJQfRnWE7eYlZBbwNXSiP4S?=
 =?iso-8859-2?Q?RIltI7AIuVLk1Ta57CVrHDrkPndDSh1gwcZ0Jqy1xM3alVXjYQCqMYTRL4?=
 =?iso-8859-2?Q?bhLDSnlCjfcEo5Pf4dChlGh2fbU1PRY/RFGMmJhIxwVytV6DZOCG7OMO7G?=
 =?iso-8859-2?Q?kKXSqnDwCrXsGJOn9/T3QR5JD0Nd7lz8gw+3sc04b8UPTNvkGayiTCZXK8?=
 =?iso-8859-2?Q?7mzN7POmSm42XM8AceBMr8kzfPou3miA61S7yjBDNsTmSNkC3dyd+57/bY?=
 =?iso-8859-2?Q?RSEYM5F2ApLVKqSuBvCoYIwsjgrwRrn4/NGpPAx6aB2HhRbgzeIB/DI5SE?=
 =?iso-8859-2?Q?fhnN9BMTaSVp/4i0/n1b+divjKfoX95TIlDH9J0PF8mDJUNTDMQkwUIBp7?=
 =?iso-8859-2?Q?u07mdLlCoui7+2rxf2ueFNO25i7ko5/AF0Wi22UFwaeJAWkWQLkyGAwevw?=
 =?iso-8859-2?Q?keZqh2eVTx+vg41HsebCeNzmI6kBghWQXXPi/tfKVEhyKP4J6WZX7T/tp1?=
 =?iso-8859-2?Q?nBB9yf0cqPzdxyZqiDTMf9vYjLpmy0WiyTo7zdQuh2T+uOOGpKx0A1nHJH?=
 =?iso-8859-2?Q?iXLJmvsSikKoCeNuLcmUsFG/1rfAaik00i2PjiTHm4fZNobl2NTRBclRdI?=
 =?iso-8859-2?Q?mXeeRH8H4x44rMO41xbE1QUSOEqU4LgK2bJCpxZW+hzU4Clqr8Hfn+FY7l?=
 =?iso-8859-2?Q?JVvBS5GKcAHd5tFU8O4SY5FEyLRwj6dM2riahFZYHmj4KrrXxYaI1Rz7cU?=
 =?iso-8859-2?Q?Iz3T92jZwT/jv9CtY8pkGgEjEwDdcQeFKJ2DOZut9kDlLc7mBIFa6zrEl1?=
 =?iso-8859-2?Q?ICmTVDIIiaj9TRXviisrsTEqM8qKm3jbQmUh6fQL/v32ZqcvK21JP9EpXc?=
 =?iso-8859-2?Q?HeDdOp/s47kYCO6yNnnADj+6oREgnn4kzuTAWpnlcWIEzUCCsXOHaz6ROw?=
 =?iso-8859-2?Q?OExZj8UUH7oQo7HKdKWnj2aoha5mJfZkbBx73PxOJfJTjmEFJfj00dHvtE?=
 =?iso-8859-2?Q?fQFxqhD30XSRQD7GfZCtFN+Z5rtxtGZTK35xgwEQhuD4hL4btc9vIfDAzV?=
 =?iso-8859-2?Q?k0lhnQ72PYJcki5KWodEZ0fg/2a5Oe4zH6DEowwVQE4qQx38ZB7j?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4532847b-c708-4622-41be-08de7a49cf85
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 23:57:36.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cd7FZeJIab6Sb5EB8br7040ud4hfsfZHytd6tItGfcsYSc5FTuDn8har97VUzvF4E3Azu9Vfc48KpttA37MAAeXeFgedUFtUmde+JHfSgMQ7fWS56KFPKvho7nTJlGQ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373


Hi Cezary

> > commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding"=
)
> > supports complete card rebinding, but it uses unbalanced pair functions
> > It added devm_snd_soc_bind_card() (=3D bind), but its inverse function =
is
> > snd_soc_unregister_card() (=3D unregister), and it adds new
> > devm_snd_soc_register_deferrable_card() (=3D register), but it doesn't =
have
> > inverse function (=3D merged with above inverse of bind function).
> >=20
> > Thus, it is difficult to understand, and difficult to cleanup soc-core.=
c.
> > This patch cleanup the rebinding code.
> >=20
> > The rebind method to connecting to "unbind_card_list" is merged into
> > snd_soc_{bind/unbind}_card() which are used from all drivers.
> > This means no need to use special bind function
> > (=3D devm_snd_soc_register_deferrable_card()) to use complete card rebi=
nding.
> >=20
> > When it bind the card, and if it failed with -EPROBE_DEFER, the card wa=
s
> > added into unbind_card_list (=3D snd_soc_bind_card()).
> >=20
> > When it unbind the card, and if it it needs to be reused, the card was
> > added into unbind_card_list. If not reused, the card will be just remov=
ed.
> > (=3D snd_soc_unbind_card())
> >=20
> > Because snd_soc_card will be capsuled soon, separated from mutex_lock()
> > (=3D client_mutex is soc-core local).
> >=20
> > It renames function name. Will be moved to soc-card.c soon.
> > 	snd_soc_bind_card()	-> soc_card_bind()
> > 	snd_soc_unbind_card()	-> soc_card_unbind()
> >=20
> > All Card user will use complete card rebinding by this patch.
> >=20
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > This patch needs Tested-by from
> > 	Cezary Rojewski <cezary.rojewski@intel.com>
> > 	Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,
>=20
> Thank you for the patch. Letting you know that I've seen the message but=
=20
> cannot test and provide the feedback immediately. The change isn't a=20
> simple one and I'm don't want to ACK/NACK it blindly. Once I finish my=20
> existing tasks (couple of days), I'll integrate it into our image and=20
> run the cycle.

Thank you for your feedback. OK no problem.
The main point is that bind/unbind functions handles card connection
to unbind_card_list.

  "bind" will    connect the card in case of -EPROBE_DEFER.
"unbind" will re-connect the card if it is mark as "reuse".

When card      was unregistered, card is *not* reused.
When component was unregistered, card is       reused.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
