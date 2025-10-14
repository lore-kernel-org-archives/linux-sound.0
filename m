Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE33081CE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415663; cv=fail; b=Xjj4tLV7XNEJRPjQduRbD/iOuN7CkojUQmYJHCTEef3nM0lsEV8+R3E/90f8sLjb7Fwveuw5yqTwD/Rw+L2w1b9eURZHg4XIztAHJgMLEvA2gFpLu91OrklgNgAXcYxIA3fz4+Z7X3S4fhjMQ3p57lrmh9KJ+JzqbqlkUigX3sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415663; c=relaxed/simple;
	bh=T9Cx0KeMDoZ/MdHlHrzEH2znOiBMx7VmQjqNV4/DNDw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gPYpGcZDZea+7nBpDWKj3wF+Zd77xuymq6RnOBp0wyEZnMgS6nGBi9WuU2e+iJoI2yCHZyndaFq7umGWAb+BM3pYnNdyCy/lTiP/8HWFUIM6w7mxzNhLjirIaVYoVJCpc8tq0oQd55ffP8ZfwMjPwWPdvgZPpRhz3syetLW4r9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p3vms7JP; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p3vms7JP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/lMQ/SZF77O0eLj9IRJhbsY9A9IQcvVz5p102ex4pw3pYU9doRYLbRIgUnrR/mUPCzu1mBe4qqtLL7tb4VaCxsofygtzeBHCdfHyG+Wp9MYTyAiqMGKvYzaURCsFmNRAQWe9txc0UDl56mciROgK6CNT0jWkgRBeE22poDJAJXKd28Nb4ol/xC6XYRO+OjNUHyeVZEf3Xv2BdSKYICEs030/l4maRDacv1ZIYM9SH8MAVU4O6gddIn/Gy8RhnX1Ot3mlO3lj6n8aVxcfiffnm4Ch95ph8NvkJqcKst2crshtNzUP6EeHjPPDi+HrnAwzacyLhoeD4bLToRqGJ9M/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rztUJoTPhDTo+RWyvdfU3XiVlygqH4UPT+dP4xJq88E=;
 b=d7Sd+567ZgZ2UXneXyWFzmmpa9nND4u9z8WAcAfam7UstZLJWcA8rzAyNloKIUHnsSawrg7e9Yplb/qsgkmkxmow7dst0kPzs556HXoCIR1rWHZO9VRLyr2zdpsYillaea7cUwrY5/Wh6CRJPbjio2p9gKFtBbueFrDlDwWVLP2aQQdMBGGnswPDwsQnCZF40S2WvU5CrjtJYKLWp4nGK3Ou56BlXcdA9VxpY1M52mb8rl/U7KFvExdP4bTTKb9M8K4FPXPi2fL+DAhBcpD9E1QV2uHWhqr0Fc2adHFxZ7gsLw/tyY9R0q08SopwPrC9qO6KBX4051hUH+i4vuPK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rztUJoTPhDTo+RWyvdfU3XiVlygqH4UPT+dP4xJq88E=;
 b=p3vms7JPp7+mK3hCwjdxDg5qToxFwWVwKMzxJR2n/u9EFFPb9MReFrtkuGFm7lorf8japJFYMVEkGjQ0kw9UYx6SBgydIyY1xiHmsmNJwiKxwarmxl98un0GPlaai+mM5f6nDbhLU5n3YuzOfGzO/Nmn3SrYJHnuSDFOpL+UoQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:57 +0000
Message-ID: <87wm4yru53.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 024/139] ASoC: codecs: cs42l43: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:57 +0000
X-ClientProxiedBy: TYCP301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3cf242-7360-401c-5b92-08de0ad912cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NpJRYKazGn36gK42DcxUtIQzCMmWIBeLiPpPg0QicZqPimyFLikQmvQB8C6B?=
 =?us-ascii?Q?R9Mv5eFUckl+XGlvEAAU7YRWgf82nd2Zeh+W23juNoueq+vPGWlKkLZyqI7K?=
 =?us-ascii?Q?WX1UM6U4VOvncc6bak1jlWfKnTOYEfe7wuoblvcT5D57IIPY1YGMjfQxp6Es?=
 =?us-ascii?Q?m3ba7/12Mk93xQxUSW3g6z5yfqdUgumLnksL+KHCnNf7nSIdbrhCMwbghWUo?=
 =?us-ascii?Q?MGwgsYAV9hUxjhFm67/j9wCQOipPOIxd3grj0OFVcymCREfxqqm78ysY/XnU?=
 =?us-ascii?Q?3zPaxDEav/ZeCU9FMWLL0uhsJ+19UrNVcuXPP815+JioIUAMxByJ9BCJAxxf?=
 =?us-ascii?Q?1RwTR5YoCy2WAT82+A7qmjoa1++w+Bd5zc0vZIbSVHc0lQeTdujelWvOk5cO?=
 =?us-ascii?Q?wne9wmFrRjtFuB1Vcs0Z8AejFtKWedWKc+/IGaFdw5T8t7AxDBS6P7eVGGyo?=
 =?us-ascii?Q?4wsB0ymJfb3Drj9goQjdEdieDLmRAU9TyusAXlapJ5+98nlweH88Fs7E/mqD?=
 =?us-ascii?Q?TJ2vDEuWXnEksQg4ojaO4P9e4bmGm+sWuuOF/Ys+iZ13tJWeewk51bC187dU?=
 =?us-ascii?Q?VKFysrrCT79u84IRnB+uJBXnr1CLIQ9Qcq1l+0KYAiv6GYx9WaXSiqgm3j7P?=
 =?us-ascii?Q?jhNBCNd1fDcfMGoKj+VimkUfWO5yR1UDPvM5xm39YmlDMHqgX8hKD+usbsCe?=
 =?us-ascii?Q?8emXQzzUUaAk/RVh1RU0Dpk9TsF+a0QyjWoSXvROr+Oxg0SQyt85hjmr5v8+?=
 =?us-ascii?Q?7srLNUBv7f4FavwM18uu28jgIrPEgBsEasX6P05CsnZWNF9h2cw7Wv6IxTYn?=
 =?us-ascii?Q?T5aLmogaoHoNFKD2mcf9l70w0aEeojzpQ5pg2d1HpsKXNa525eup5rx2iC6+?=
 =?us-ascii?Q?xHZlH8NRApKTVnGOT21YURPDjt3Ft0eoxHr7lcoBJQT8TRcZ5JP9if550LsU?=
 =?us-ascii?Q?5OjzUFNHnkEs9pS55U3DIBxmZsZBOtdMtVYvzfoSU326iYafR4aqUeRm3XxR?=
 =?us-ascii?Q?6/KeQa4a9L9BDYlVr3ktu12QWA8YXsb1OeUhOPoEuOS73ZBDIFegUmByn1zo?=
 =?us-ascii?Q?/LRL5C2gUwg8uKlnnyLNJB9QeRL93TCsTu94Ft9ObegxmxCt5ObYdLUziWHj?=
 =?us-ascii?Q?DNh2w5WGNl6D82na5Xzm7kiuFHORy/IxOLbT9HzFdGu95UpxMjOglLDq3zRt?=
 =?us-ascii?Q?//QhJbu0xLeQt0i4sbj2TRrNNk2i/bfzRH+Nz86FQ1lkbVlJjOIUsJA2I9Wd?=
 =?us-ascii?Q?HDYZQ3xOiw8yqzLbmIeSer99S+t44+qT5xWqHRrGlGgvrCQrkgqlEeV9/Lv7?=
 =?us-ascii?Q?u3StYKG4krqxUHqb3Z+K/7TMSL9egF0m7D2HzkvnijiDQf98YQdDYUt17i+p?=
 =?us-ascii?Q?tz/ESLGeiURnX0zTaG4visHtVCZ4ZNZCxicYL4I8kr7kveb6xZP4nYJwSazz?=
 =?us-ascii?Q?kKCx8lHyjt8c6+4A9lDRh7eQB3ciGTPzcJdKoAaA3/61thpSaVfegGSkxUOY?=
 =?us-ascii?Q?E6ublxeoAUrWiXXgASoUpBI611k0ZD2VNrK3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NexmUZsgqeGqSOqobtpc5vKQSn7nbqvqbBZtvtMhJiSCPoRjA5rACkKxY/HY?=
 =?us-ascii?Q?mJguTD9un/53uRUj5Tc3QAvoX6hsuF31t0uwUSUQL2KJcC2SRh+iYqzruvrT?=
 =?us-ascii?Q?IzEgD3aztMdgzzT/5RWbb3p6RlX9gQXZ3e6NO2mDDchM41z5MVIw1WSPSIFa?=
 =?us-ascii?Q?qxMYweJY4uwjbQPR8ogZfR+UpZG9sGQvQaqckEi72oqzu8V5dOjJct1v5bcW?=
 =?us-ascii?Q?SDP1DlQqEEHBu2Zx0yIx91pX0J5NYIDlomH3/OL8bxMne1ebF3I3mxmZNmgD?=
 =?us-ascii?Q?nwIu7SbIErvP6AM0QCuABzoyr6lUlZ3RZcr3HQkLAGOhRApBVYY3anYG6v/G?=
 =?us-ascii?Q?x4YYB+gOmNh9ZAoTCsa3mdENO6iWyyghwhajMrLBAQjxVuXyESd9VZYsk0gk?=
 =?us-ascii?Q?6Re/p/3nXMH6/V/aBdEED3GwraxKho8Pm/F7I6m6rhrceXSbZwmLRtTtrUmd?=
 =?us-ascii?Q?cia7nyGTO2hmdIZ52x3s6naRGgZBHvWeSAWfhTKlPVH5SM5UJAR/UfNrsBzs?=
 =?us-ascii?Q?H9qBq7prVALXG6KInPyob++HGhqtEqm6Z9KOTJRuRJbRE2k/RFLxdrH5MB5l?=
 =?us-ascii?Q?HTHRMJq/1WuFhy3XYkqcnUkw0ZxJCUlqjVbBiJ+b3WsuwcuIs6vilVoUn9vR?=
 =?us-ascii?Q?bUqnbAPfK5wT4z9XSoMsxi+8WNmLDtA5qiRZiS6IkZDp+Pg2TwAr5bcKIH2X?=
 =?us-ascii?Q?zXFy6s0/Aw9BV0n0Uo3szWSdWvFkx3V9u0Q9CzZ+8fU8LGyRW7wMed2A7+EM?=
 =?us-ascii?Q?9IaQiqXM4rdrkpKrVuWUFlgtCQUFGwmltUNs2OyjUMrCbKUw+BiQdee6569C?=
 =?us-ascii?Q?zbv/OaBolC4pFHxkaJTpxCZjMGNO4CMTMY/dg7abLLbZbSrtacmCHoPeWSs4?=
 =?us-ascii?Q?17KpB76mvTaFQmLnJ8TAzYKQD7EgKSpwiGKMvKdmSDVPRBzyDEjxMEWfDHFC?=
 =?us-ascii?Q?BMC59S3WMDvgmGO0G48vCWfrE8uA2LWesQ9+H4RLhywp0kkupIeMDOaPhMAe?=
 =?us-ascii?Q?83SE7H3OytH7Lf/VcMqnqQG/KPLHyXeqfsF5bnQE7bJhn1CchM8XEdUQz6of?=
 =?us-ascii?Q?AFH/nKMHZFUjz+C1/CaaEdLIEcL1BukbrtCx1Fgb0LxAJzgjsJW7XtJrVSHz?=
 =?us-ascii?Q?H2+wDskqOT/Q+QOgSszzeI6OtzQMXCJpZA1p29CCi7aoVRhF4KLRdoVTsOrP?=
 =?us-ascii?Q?Mj92UjiloUBos3FoTiG/1u+kOwY9ccNehRTxj2lj8nyaJkfvrgFrJBSjfrr6?=
 =?us-ascii?Q?jjfCIfr7uVZxoJazpVeo4gErwaMjnE2hy0I/SuQav2XXv2v39WvvB9k0BT/P?=
 =?us-ascii?Q?D+zz+XmgENwDNtdU9/DCHJjLjcCsxnhTZJlOj+X+i8kNlxLLPsIXtYbXup4i?=
 =?us-ascii?Q?FN2DmueUOX2kqP+QYTGwhSTdePlBMw5GurmP1cCpEsHhbS+pMa5vCK2ssr3Z?=
 =?us-ascii?Q?Wfdm3MzIjYB8ks+x1g9voVxEvrzGOyz4WQ0skxsfPhUHKABliTxaHzhNMV77?=
 =?us-ascii?Q?G864Zdd+Q0lCA9T1G60BvfpbFjV6B9tSK8I7uoDzNtbaOhFv1O0+QnTRPytx?=
 =?us-ascii?Q?Rattpedhn4alJzONarmNrYl/FI3k/fLF2DMUAj/KQJkCi2iPZpww3Wvf8NzA?=
 =?us-ascii?Q?l3vzV1d1dc55Ucre+Xwkpc4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3cf242-7360-401c-5b92-08de0ad912cb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:57.3826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E0tmABxXgwn5jBVsKKxyQYk8LJQAZJm/ZwbKQnmSp1+JP3KW72qe2PZrMGTDSoJb0Aa2+GNqKcM5IjDnP3r62U/HSSs6AGe2b/VNaX3fnIGw1mIK9ZPrtZzWvCCCIku
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l43-jack.c |  4 ++--
 sound/soc/codecs/cs42l43.c      | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 867e23d4fb8d8..ba6067664a42b 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -866,7 +866,7 @@ SOC_ENUM_SINGLE_VIRT_DECL(cs42l43_jack_enum, cs42l43_jack_text);
 
 int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
 	mutex_lock(&priv->jack_lock);
@@ -878,7 +878,7 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 
 int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index b61df09f20cf4..a6735a0fbdf12 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -949,7 +949,7 @@ CS42L43_DECL_MIXER(amp4, CS42L43_AMP4MIX_INPUT1);
 static int cs42l43_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
@@ -963,7 +963,7 @@ static int cs42l43_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 static int cs42l43_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
@@ -977,7 +977,7 @@ static int cs42l43_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 static int cs42l43_dapm_get_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
@@ -991,7 +991,7 @@ static int cs42l43_dapm_get_enum(struct snd_kcontrol *kcontrol,
 static int cs42l43_dapm_put_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
@@ -1005,7 +1005,7 @@ static int cs42l43_dapm_put_enum(struct snd_kcontrol *kcontrol,
 static int cs42l43_eq_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
 	memcpy(ucontrol->value.integer.value, priv->eq_coeffs, sizeof(priv->eq_coeffs));
@@ -1016,7 +1016,7 @@ static int cs42l43_eq_get(struct snd_kcontrol *kcontrol,
 static int cs42l43_eq_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
@@ -1088,7 +1088,7 @@ static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
 static int cs42l43_decim_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -1104,7 +1104,7 @@ static int cs42l43_decim_get(struct snd_kcontrol *kcontrol,
 static int cs42l43_spk_get(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -1120,7 +1120,7 @@ static int cs42l43_spk_get(struct snd_kcontrol *kcontrol,
 static int cs42l43_spk_put(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

