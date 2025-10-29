Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2CC22126C
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 00:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761697150; cv=fail; b=kGXGcKcjUYlbgDeLs2SjaltveCyfxYdDRp8Znc4gmrrXDK+fcZYSeGt4j0xNmFHJFWpLSjsRwIKG4ndCrfaUMw7/VJIpFpH/n5Ti8dtffXyXf6s+ybz4pvJb+pzGfNkGClNoIQbRHVIq/B/QmqIHwoJr2fb5I9Pe+1cdc6pucVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761697150; c=relaxed/simple;
	bh=IFoMLAtm89FvYn4aBpPD3UUB7+jP+gLG6h5+RWOFxKg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tWb5OTh4HJh/9JvXuhORnJupUWX9qdDu0F4SKiAsgl6eCaOtd0vcmnegXhJntwtvAo3QluSw7W1clhCBT1GFk3sLkS2wx5JaLTbmgP4o2PBgIh1YLSNsj/UF3tHCPslLKsmxTDi2DlUf9dEFtWa+LgkEmmhJu01crFOcM+PxZDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=il0AfV6/; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="il0AfV6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZf0mnncfCI+Z2Dk1mgD2VNVkG7bTALnC7WH6K64kFGUk5RJmdeh0Ql2PsX9xVU9DAL9HrPimjpYOAnmddm+ZWUryB69DXl9xgYuiAHDnBP0AFPZZ2dXp6Xpe7QDGyHj2nMezrvrx5RFoctNIcQrnUFYLG9iHMixmK7MZuTuTdeWMcfMqM9f+5seABLmCCtxnPvfdrwY/eC8ATXP1tJKy8b9ckpgB1CeGjWBZIUVE6Yv41LIaVzOiPFU8yYpUZJECG7C4ZLvX+rPNnZv5WxaZBKvSb3ha7jTa1aspUvPrLe4UlJ91rRQu2B/y2fg1l22Ms7Zybp32v1fWLmJGuFT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZbBk1FU8Q1ntgT79eYO73a07RFLJCZODG6P76Gu0QE=;
 b=WSSH50E0zVYnsNlqS0+5Dz6ShAvGY1Q+I0idd9RrtrNVJNSKm0qDkQ6puBs4rjVlidwSqrzBoJUDgCPeH19zCP1XTfOdtAfMobL1DMpAS/jKC5BSBTbNYUudqPGPym5Ri0c3VzOJr5FNLY9oV3UVKZN2FccOw79POtf1ikiBCNchpHcuatHVg3su7Au9D13ccvb95DfaDE9ubIRl2aCrqJlN8Vs8HADz6WDpEpOEeXU5xwawDM6bxuU1seK2DlrMLqLyakanthxwU3k9AhazyOxcarUBrEYCshF6fFXX0C1x8OJJ0qR4HNPICWITNHfBAL4J8Pk6lbwZRa7z8Wc56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZbBk1FU8Q1ntgT79eYO73a07RFLJCZODG6P76Gu0QE=;
 b=il0AfV6/4AwcTbC/VPbJUkOoU90Vcic0KbOpJaWBUDf6HXqVA9Pfwv5OH5XrqoWsZbEDV8DckNVqyQlh+QtVvr/A9r5gnFgmo1ps8lGbxmoSPS0l6jMFMtyooOpWJjKbIby8Sd7KFGo+3E/Iw5Pul2gjceOZp4o+HQBUd88THK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8794.jpnprd01.prod.outlook.com
 (2603:1096:604:150::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 00:19:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 00:18:51 +0000
Message-ID: <87bjlqv9ug.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH x/x] ASoC: convert to snd_soc_dapm_xxx()
In-Reply-To: <6358b4f5-88a1-4bd2-b15a-20f090dddbb4@sirena.org.uk>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
	<6358b4f5-88a1-4bd2-b15a-20f090dddbb4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Oct 2025 00:18:51 +0000
X-ClientProxiedBy: TY4P286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: d44c68ca-77bc-4dc9-6316-08de1680bcda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zXT9thcm4uT73zZ747VObh9hb36FPiYCaEpLTY2si7JwKDlBNuyMVjEIknGW?=
 =?us-ascii?Q?Ci1TW8zloLADq2dczckNoRxpBLV1J50e/U7bJPM85EYQEsUTNeZqxch3MS2Y?=
 =?us-ascii?Q?AKA4M6av2RXhJfN/6ueMitbZ8VPoURL0Vd6HqdNqMpNcFrPHnN40uLoM6NgO?=
 =?us-ascii?Q?vbyWb0cQKWU3vKFOenYv3V9KVDQ1/wYxtXWQy1ex1A/FMW9txQH/ExFWeWeA?=
 =?us-ascii?Q?YRgbG3UViYwlS+iIaRfoWGMXo6BDHtCIddvgNpbOPjOPkrWT19LYEtHy3TxJ?=
 =?us-ascii?Q?hI9KCWv+MlGVIcYSXeGsRqk7vAvSJ60pfaNPMV96eHA702sTB9JtdMbdG1pk?=
 =?us-ascii?Q?SLVE059HPqsH3p8Ga8KzXarP24JZa44IJNu7J5KCjkCwb/NqHGYOTGL131jI?=
 =?us-ascii?Q?ZlCpAehhpN8XSC36AJ5kXR4o1JvCeFmxr9AXPQURRhBOR0IhrPhAS6A2Aty3?=
 =?us-ascii?Q?VorHui1206VBFSM8zpB8IZ+xyODPY3xZZEZks8uMjLkTg3FeNbEC+km6ZoUg?=
 =?us-ascii?Q?2eWU6Mm9ieTbTlN2KgwwzUf2PYRfobxpsVYh7N1UExJIAp0tTYaUg/YYBobS?=
 =?us-ascii?Q?PHUDnNIyYGhuorlc7sQfZH7LZ/FB7Afgs/mPWp0Rk26pw4rCVIZZw3Jd36wQ?=
 =?us-ascii?Q?eEmovFYE9KY7Xa5B6OtD/XgdXU5A+z2Lx1cMUvrIrGmk2TX8CAoUcRE8aa5p?=
 =?us-ascii?Q?Efy0SFu5p17NoTOvmZqrWty381A9xrLuStRF7/p67cuPsaY9t+3p14AZ8a+C?=
 =?us-ascii?Q?QpCEAS+ONOXa4QxlfnmKJ369W1O+9JRA+rsjEWUbHGDChhWKR/H0SyAu1GFa?=
 =?us-ascii?Q?sgqSyWZM+Z4thGOk6dd7qfvX1uNOHSRm+1j4A3uYCtsyLT8QfwiYvxmKVXn/?=
 =?us-ascii?Q?tHKIyQBOMwYjJ48aR9pFX3E1777V6CwVH0rC1/IzGpd5mlnoxScUml4B+Qom?=
 =?us-ascii?Q?M/GvsHW0r86Fjx8tJBd0pJD18X/ZhBmTyKTfCHQQdaEfuSIhKb1Upl8tmWdm?=
 =?us-ascii?Q?w5VEmq1xgG4FsC3Kg1J/PY6DKVwIkNcfrd/dBCY/uyHOHMzfsDR7VtUKob87?=
 =?us-ascii?Q?GCuzKcgIXGsKXv/t1Ww08j9lOIrqYermaNeF8nsAQ+gbE3k1T5ywWwJNIxFQ?=
 =?us-ascii?Q?H5PhMCCgQPSfh/gth7J82zUsK8izFPPcK7/zFsbJuyaMx3KiGkYWZCVC7K3+?=
 =?us-ascii?Q?7UWdSWZMFDBPQci2daUywulhS1nOUNwEeImlaH8gTTG5kiMG/dzRPF0yY4Ko?=
 =?us-ascii?Q?iT95hN7YWXK0ngIOCCO7Lx8krqY0zEr1O0aXn+3AAzxX+uVdxFARlI481v+0?=
 =?us-ascii?Q?Znxft07Idma//AZHMiYJSnkrdSLC5Dmt+RLDlm6EeCeudFj8XMJ+xHewZl9b?=
 =?us-ascii?Q?OefkHmpDi9f4XIu3wbcTlNHxrn0sEf0PMUXRDV4Dieb9/TFPdb1pf2R7Eq97?=
 =?us-ascii?Q?aaLVBhGcrEo7e6oJxQpElJmB3D9emb42AEl6fyq2+5O6XE86MrDWMRG1fkxk?=
 =?us-ascii?Q?0aO4HVuocrBfRTTFMSUl8gpALT7cPWi2G8dF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AFpj/loyPY5p6yItY/ReUW3GfPqHXZoUD9KbzeztJJLYQD+ZN9rtgtxKsJca?=
 =?us-ascii?Q?8A0dfGItj5ij8r0L9aT/DcXSDErV/LcIZWBgaRYNZZQ63V7hESdV2U/u5/4a?=
 =?us-ascii?Q?DMSJaEDK9Iq5TlSQ32G4dEMP03z2sCT5T1yj1d8g27veHtsL+XXfQNxw5IWe?=
 =?us-ascii?Q?j4sLIGpXOKyBFXCFquxLlqjk6hXcHxPSZfuTl6XBDwh9pYNTsP9oH5fkenNv?=
 =?us-ascii?Q?wSxLzoorxufrBI2OF5+ias5cN8XSPllISXCM6wO/jQhckCajDQcDlTqwKYyy?=
 =?us-ascii?Q?1KYKikmUu3GvlS+gD/Cuw9Aw6uefwK0pnCzJjGGCy4FCvrSxWSNcSd4qOMiC?=
 =?us-ascii?Q?1PHAxtL+BlqFyGJ4eJzlBxavlR/Y37WQQl7ZiFo8kwoJFY7XTBp4jaI46kU9?=
 =?us-ascii?Q?h+kyPkewIPx6PMzqrHjUNNK689O0ZVJoEcvJ2eHExdNx75BiPc/mGxA5cmJG?=
 =?us-ascii?Q?nxFR9/ZSH2yqOzQIinqUjFOkjB/5g4s1OYjTkQhTfQbqF8AReXbX0E9TVSTk?=
 =?us-ascii?Q?7rcXb2euwHhpO2soJEtr9zwBgGCw/SsTm/hzm9RsaOSVRWu47XsvEXNbBc1M?=
 =?us-ascii?Q?tVt+PrtYQgs9H2AMwtOVsyTAXLEsSHxhyy805C3T13HTNvQ/CTLEClia1RL+?=
 =?us-ascii?Q?WOo7kHYVcT0Lykz89CTJxZo5jThK9uzCHzAa+IavVcexHRAaYsCrWw/Lr/mT?=
 =?us-ascii?Q?kFhud1928xQnw2m5e7u4eK5+a6flOJyuVJyw/e+5dkR0gLO39V+mcMwIaERw?=
 =?us-ascii?Q?+4fZMdMk4D6Ad67aSumgwVlOfg8/12MG4dQR6UYTNinQoHnst0ts1j1nU9jF?=
 =?us-ascii?Q?qFkmRTJ2V3J3tx/OYdwWF97lihOYGBnwV1NjxjbWAdJm7i1YSxQ5qwYSS5Tx?=
 =?us-ascii?Q?JBo5Cg+9BZx0BHaZezevnvZ+X2gN7lP878rqUE2OXU/AKSARJlOSW39URz4F?=
 =?us-ascii?Q?2OYljVvDqCtzxGw8frAgNJUH7ZsNfhyOcUVmcFUQQOodEHCkJmNgMrvbmtDA?=
 =?us-ascii?Q?JNf7kBfsYNALYX57Vc7DjYIAHHGO7jFKH90inl9VjAEteCVZoQKHmSXQDVX4?=
 =?us-ascii?Q?aGPsz2kVg/ZbUV/az1AnKSkbPVYnWJDxOrF2jWpACOlSDfeXl0Cmx6E69YMV?=
 =?us-ascii?Q?437NzGdVd5Ojmg02tAt8Wl0DaqJKQt1yLC7ZTqYnNvVqI3xeVNHetmhuFcHj?=
 =?us-ascii?Q?hjC7qQ+r6x90Lf8klj3Ic7ittBHdS6tPLn/M6FZkaVDcO1rV4SDYzM/8tI//?=
 =?us-ascii?Q?SVbH7RJSTz5bOFNVNTxBM11jL/75kq3FHee+Yourhu8P0rEDLwweI75xh3Ah?=
 =?us-ascii?Q?M8oIRAglV1fHtd346CQdE/Dyx0yAnHGjs1sHHne1PoUOh+TdZZyB6yc8cqN5?=
 =?us-ascii?Q?ggzw82CKu5aAx/d1omZrEvNxikjUl4d751O5+VVRIU5Q1BrdO5y+iJwdNn6/?=
 =?us-ascii?Q?yEszfxgWMjXwOAZQfy/n/TJWT1LDJKJyOHfozZQ+dnTGIzRq/szv8HiOp3oN?=
 =?us-ascii?Q?QjFsFsNlAaqcjV1dgD3KY2vaoLyEd0VPkimRmWo3pW3d5CFvW6a/PX5ck8v6?=
 =?us-ascii?Q?DC2Rj24EKLrJVvR7Yqvwz8cOmIR7dph+J8bEWu/hfLCIkp21YPr7AKL93XKF?=
 =?us-ascii?Q?s5H0jCOeyy+2VtksJxCmhK4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44c68ca-77bc-4dc9-6316-08de1680bcda
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:18:51.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7X8jDqPygXl5VPSfIBHUXidbhT22BrXQ+A0+6KU7BlsfvWn3aeq7KVMFtm6/eFfdXjgwFuSQM9iSC+Rb4i1o+7js2jWWT/OaJ8xnQ/k/MPqf+AYznFhpiPxxFnePN+dd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8794


Hi Mark

Thank you for your review

> > snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
> > snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
> 
> For these shouldn't the change just be within the implementation of the
> helper?  So snd_soc_component_enable_pin() would be a wrapper that does
> a component->dapm mapping itself like currently.

I'm thinking of removing the simple wrapper. This is good timing to do it,
because there are a lot of such code, and this patch-set need to update all
drivers anyway.

There are many type of wrapper exists, but thus, what is happening is
that wrapper calls wrapper, and it calls other wrapper again...
As a result, call final function directly without wrapper is simple and
easy to understand, I think.

I have already cleanuped such code, but we can find this kind of code in
many place.

	// It has dapm
	struct snd_soc_dapm_context *dapm = xxxx->dapm;

	// But it gets "component" from "dapm", because of (a)
	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);

	// It uses snd_soc_dapm_xxx() function
	snd_soc_dapm_xxx(dapm);

	// It can use snd_soc_dapm_xxx(), but is using wrapper side.
	// "component" is used only here
(a)	snd_soc_component_enable_xxx(component);

Because we have many wrappers, user don't know what is the final function.
I have no objection to have wrapper if it needs too complex conversion, etc.

I know that there are many type of opinion around this topics.
I like wrapper, but it is case-by-case.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
