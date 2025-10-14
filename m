Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D73064A3
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415680; cv=fail; b=nkFvaTyd4+qfeTl0YV6K0NN3N4QJz5m+IhPC1uUdym8XxbzrHReuSauN4ui19KXazAmaHvBDtz/ZoxWFw3GNXSmXL5+EL5kWKMtEhSfntODLlovkvK73rvbBdjiNNY2W4wWM5v3cCnegGB/ReePRSUBFjC9vBIRjKL2N/OTK/Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415680; c=relaxed/simple;
	bh=8duSfI41v95Y3yh8i/9YuWIegEIGNouF/kjX/IygEd8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=krka3OR5NE0bpB1kY2YjUq+3KoO4Tas80t2dtvoPMvAvkrDBUs4IHDv9DlXVuQhtxniAsGISXveD7tX5llGKalWQAfTam4whcYPunzSGhrPM8/DjdrJmEfBNZMbTiEKMcs6KmCLC1qoSxeqlPltrBW/MKhJaIz0lnXoyxhXA0KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PDPBWLmL; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PDPBWLmL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGPg6NNBeEIRf7SLqrrhQr0ByeGEK422rcj1SBewz2EYojtRkXClR/1dqsQKe7kwQOv46yNvPJel6syw+pEKOeMLuYjp/A8LNBXU6JoLKArR9qadVk2Boz7dD3BJkCa1QqcuEFvMkJxYkeKFlIFvRaWO2joaTJeVU8fxLBYg0QAsfPKAyLdS4yI/fUT1LrVZJiP1tsslhSTJle9eShRZiYc2MmBcI5bA0r5YXedlO6S5MJlQp43tGrOFSI//SctcMlSFwEF5XC9PxUtyiB87BIb/XrKuvpoUkVL+PzAI10qlQDF1Knzg/71HHMzkfN/hTbnehPAQlT8usUW3Ye+aCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Njr0vdqqsew+nj3eVncKbnIFJmUbCCiDRLC4j5TRbo=;
 b=p94StLdmyE3B+vvF1wo5ZSgaLCYdXhr0/9bl7rqQc2UCfZpYD+7QordWOY4Nr5AxnomvCVzftKUdq86yrrUDuCdR7bWV2S9jvuHP9HP1OMUAHtkfRERraCRWXebGxyGGsXlIhjOv+nEvLdHjRY6TtA8BZCiW/nsfj7kQVgMvF9IWNsfbzzEOKHnuLNP6D8uzhB1NFmLDN6J+7cWzNsUMlUzdyEoeHpXsyt7sItfa3S9hLwIEoj6B+yAnEO2nIFfJolXNKmL/JcwRzk8uv47ocDYUhRJUU+Pa1hlNCLR36fF76xdH/3aj4/CSXnfTHGBYbAdPKzBrKQTgXMD4m81GVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Njr0vdqqsew+nj3eVncKbnIFJmUbCCiDRLC4j5TRbo=;
 b=PDPBWLmLcjVj4P5vafp/yJqFxlnzZi8nrA/1ciuYpZApQWJDkA6RKRfZcxjnfIqc03Ola03BbmaNQ6VtHXFzgjzbmk9vCIyYdGvZXD+RpB2MxngXx/xTUXssdTCOugq4/Zydx3leuif/XqcImHUNO4CD8MJE1AW0fuSb011tMQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:13 +0000
Message-ID: <87qzv6ru4n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 028/139] ASoC: codecs: cs47l15: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:12 +0000
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7c70a9-d680-46ce-2122-08de0ad91c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LNk55Wo3f7kligC9expgtaSwxlYzsJxMmYuDRkUqU+XOBRMkGA+w1BK0XrJ5?=
 =?us-ascii?Q?c6OKxxH2Y5FUqVYETlpn24GRrBhJ+NxtLdtIFm2jC52yHLB3ORc8v5stliOH?=
 =?us-ascii?Q?reCLEBc6BBEJBt2mZLvi8gI3UZlVJjSpZsA/QZCXXrKkLTIcejTYxRffqjqj?=
 =?us-ascii?Q?pvIH1HhS9S0W3rr39YwYFElRbfhXmGHnKQmte/2THBQbQcdAU1chXecyqVlF?=
 =?us-ascii?Q?TI4NYmN6Kz5xb2I+63LqpGOu9dcsZLyagtccWqpyVT4oFJPcWVIH09WhVOC8?=
 =?us-ascii?Q?gdlWV9kQPeHGiXZucU3yfRQKaN/m7nzKx7tNc0kaGj+kS16SXataYBNnnQwk?=
 =?us-ascii?Q?lxolrM8ARkUQOI0/jH31Wk8fe/GnGNv0f38keYO5+cOA5Vuj0VL/b3d7n7BS?=
 =?us-ascii?Q?J/AszsdpN4+Og3eP72xXfweHN8K18zsqa61wBXy1eLS5G0fgG+1p1TjBZXmk?=
 =?us-ascii?Q?RQ4osh6qKsrAhP+qf0pfBPUDXo1b3i4pjZqYFqrJAxynxg4Noj8LMrJQY3ye?=
 =?us-ascii?Q?EVslNwd0AeEkyLqyqz9wxKDh7XbUykrJ7PdLX7ogxCVzeP7jLrZ+ayM8TmC9?=
 =?us-ascii?Q?xOUWyQY7KauyOfT7f+kd0qbiJDuiqccgKo7OFgkoeja+vuLxnPnOaqTZuTUc?=
 =?us-ascii?Q?5KZMsHA89s1P6R3lyrlIjSRyPT7OrQ5rnA0QYsBmGmvBfpHxJ5pUh1Q4tMIn?=
 =?us-ascii?Q?Wv5bwGv+l9ff8srVal4e75jcTsQbyhxDqZkazwILY0R5PsI+KEvinOq6OFZd?=
 =?us-ascii?Q?2XSEkGF5kKo188rGn+zmyQvATlpsMVZBaQdNUXMRU3AaymDs4DqvVrDVMPle?=
 =?us-ascii?Q?BcCY2Wv06G1dBoTHFl3iJOtPDN+osD3zUGlwT7k7GmAGeIgSluEvVbbugOfD?=
 =?us-ascii?Q?Asre/W7Co7yI/CufleY52FlHGOL946DmKgYQrHfqE4R0nd8T1ZdKgWPi0fBN?=
 =?us-ascii?Q?10yKd+SE8uGc1iFHxbKw/GWz+bd1wlJ6xeHTjkJ6WKhziveT5WK+rDlsVCyp?=
 =?us-ascii?Q?0KuZE/5XdlpNOl5T6fmiuuTxLLGFSy2RCEo+IXC2+D5bfl/7VhVRUo0Cac9J?=
 =?us-ascii?Q?ZXHl6gtgbpAB9IpJmLlYLGMRwfmsrcSCQeEZiYonE5Ph0UIxPh9rlyBj0WKo?=
 =?us-ascii?Q?1g9Ep77PHQVg2f1H967Fi5cwb3OD3D69G6B35bY7BFDhO/D3S43VAH3rzl5R?=
 =?us-ascii?Q?jk9mVkLAx35SZ0BbX0MsgA8nmlk2+Z8a2jfIo1jgdNr2feAqU0G6aNlymnzN?=
 =?us-ascii?Q?gCYUsZ1bFFhz1kXHeq+ZyNZf06jFTe6zFxZSEaK9E8O04+e4WlWxFMutb6Br?=
 =?us-ascii?Q?2Yo9XdolJWiPPBwjAKTdQkhGF9Oraozw/abEYWdnIKjKVO0IoHg/lyzgPVZk?=
 =?us-ascii?Q?L+wtVCWN9qDlcaEsxWASgRfxxykssSz2ikCis8TVWswr9H61h0o5B3GqR5vv?=
 =?us-ascii?Q?v/X5ZzRDuG6CfwwnrzZudt//Czlk2DfWaLc08ptb7aBQajjF2aCI2coBFMiX?=
 =?us-ascii?Q?NB8v3vcOK/BeftDYDqE40lEdQsECpxFix3OC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7IQuoAsMaQLNf6TBBlKTyt7Ho3CY2oVoKOtLaBZfABvFv2P4W7n77N8fhlc7?=
 =?us-ascii?Q?7CfmHYjF4YlVNLgXMN2D6cRN/j5paAql4YMAC11TNzD5TKGIF36WifpZfObm?=
 =?us-ascii?Q?K1ybveYn3rfNkIbaQkPwpSTqv9SAlo+9rB4w9NOzzURDOFK/FizhXK1f8G3j?=
 =?us-ascii?Q?3dZivjUTlVnQa3/rXMFU+fhL9V5k9eSfsHvswz9V6KKx9spgqSI3Mxz+8dDz?=
 =?us-ascii?Q?HmLbyKPlzlxjKJUmiYlI09sF+3wwWS60FVUgo5ZrpI1uJwrWFvdcPXaWrN6h?=
 =?us-ascii?Q?B0hxQJCudlWlDYT26TLpQou0enVyFrM7kaRRSKNxQLtALupxU5p+DS6JtbDJ?=
 =?us-ascii?Q?nMkh5LRWTMKbtKGJTf4cPvrhRz/BHvfh0WfYU8K6V52PYu12FzMWehMbXnBz?=
 =?us-ascii?Q?qwduQHqhqJubFXfipMkNMX3fkbuTAVrRS0NJgW97CumtXjQhgZfJIqhyyMrO?=
 =?us-ascii?Q?45/jF44Z4j0PEDYOb3rGL5JO2TBKLaSUhwAUx/Mdh9wu50Y2mevXCJnUny7x?=
 =?us-ascii?Q?8POC5VAFfFwtq8k9CQp/6Oxi0AfNxYxJVYxbcw0TKrvBAl6ctbVkkrsAdI1R?=
 =?us-ascii?Q?vXNB9WWOqsaA69rSFxc27aV0d6rhResVKQdqHCpV8Rcf5fscFvLwt+PdK2Um?=
 =?us-ascii?Q?4leZCmhK2sg9uJdMMYC2v7kV9Ni1639ifyIR/2hIYPLHGdOeXqdgMUjgra46?=
 =?us-ascii?Q?DgkRI5PPUkREZv9gebIsbor1DjK9I9ZIcZxyC6vinli6LAxxSs+vuHgObhhl?=
 =?us-ascii?Q?rojLdmqjq7NA5ssEQGOSj9hUKk+DYn10hGAWK8T0ybXVBpNQCh13xyVx0DY0?=
 =?us-ascii?Q?OS7TEeOIKyrDdlixbdhZeivbh0esAigZ30ReLPuPWm7cKOCorctuK6kddFDX?=
 =?us-ascii?Q?uCDPUXyMvXmZVHC1e1/fsJXaK2Rt8IlUXCG1c8rK4IotP5JrE7vtQttv8VWu?=
 =?us-ascii?Q?wGmPi8JyIyhYIMRzPcyyvoEzmmHO9SsIFrc5RwKW8Fmk4zKRxQXBcohsLcOC?=
 =?us-ascii?Q?aC/zoHhdb8SlzmCLF8k3TTNAppnEZbdsAi2VybBgPQ/8MTDLzV/9tF6zknN/?=
 =?us-ascii?Q?VgVoxFsg1GV33DadOk6ISOXLJqg77W/MXBceAXfDIvq13tW7vMJLGEsDoPwO?=
 =?us-ascii?Q?Y51mJNMqiQZTtQGyCwR+dt8+9HG2oXkhOrCvLBzcHRp2FpwrRqdTs7rj0EVF?=
 =?us-ascii?Q?EWzbii/WuvexoZN+H4PUrCWHI59ZTbCnBSSbaluO5KAxYt8KqIxA3HDDmKhz?=
 =?us-ascii?Q?TLVC+j39qCOIdM1Pg2Hc3+KFV1+jL6dRfE47QUfqKoc2YPK9lVLx5Fo7ZpVZ?=
 =?us-ascii?Q?0ryksBYe8mnT703ufCi+zyKdqIZIagLecHwOuseHqbxyqMgNk929aOhu79JS?=
 =?us-ascii?Q?bySOFHmnGJmvvxJKVyKV5NzE2s+jm06yUD5g8sCmv6BKqSY9vE5XNNl9qXPs?=
 =?us-ascii?Q?0uhVcJGHc77BntGWxZbWTHqTaKnFRzp+aRtnnbvPsH4I2aQPAmhPad1F2mfY?=
 =?us-ascii?Q?S0RaCBA+mMFQ24x7vrECLB4uU1L1hZuxple+Nqka4N1FzF13WFyAJkjbYS3I?=
 =?us-ascii?Q?nCz0iwB9hBOW9pZOX17DOdkU8m5w+v4TPla/vgPoxsHV1SDIymVLwngHKMEn?=
 =?us-ascii?Q?uj/vLOW9wp+5FpaieQjQ+eo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7c70a9-d680-46ce-2122-08de0ad91c1d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:13.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBBoU0ioB2HI5tabijMjf0oD2nQ0/25hf2e41G9l0rSByKWPDTzD0rTBcpRGG/u87sjI/BLdJM2tCox7ZKpEd1qQ0RzjofsJxcGC5tzjEzlnuig7iCHm80Pa1BgzZ+HI
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
 sound/soc/codecs/cs47l15.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index 29a2bcfb3048f..cc53ce552c2eb 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -106,8 +106,7 @@ static int cs47l15_adsp_power_ev(struct snd_soc_dapm_widget *w,
 static int cs47l15_in1_adc_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = !!cs47l15->in1_lp_mode;
@@ -118,8 +117,7 @@ static int cs47l15_in1_adc_get(struct snd_kcontrol *kcontrol,
 static int cs47l15_in1_adc_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 
 	if (!!ucontrol->value.integer.value[0] == cs47l15->in1_lp_mode)
-- 
2.43.0

