Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4D36CE0D;
	Tue, 20 Jan 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890773; cv=fail; b=tRctpU/vQqYX69m/6qb7OtDtCcc95ZiivkTtLfcIEpcX/7qduNquQUznQfgVh+M8Z/KYwyIqSTE0LGJGHmaO2VYz3u96qZF3LWZuwONt8n0SG9jc1uakkduIhlK6h7zQJUIA2xHstYmc+cYUxAuxsDPzHKAe1IELO9KwSFgzxAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890773; c=relaxed/simple;
	bh=XiBSBOvAH0cDrHuP1Vs6aoy4h0n0a2deyo7OkV4OuTM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DKwtq0gEef7wMEIm8kcgwMUZQN8jHXLPT2WWnweCE5rWjOBBtG6Y564kNkV45yc0/g/UsXx/6dkAOdzkQGuPmjQZbJK2g9LDCcePsjh5tyZ+Tf6N+dk1pW6rcF4IV4pZms6pDOg8pfwoZo/vQ9M9SxGVutzIbytP4KJnW5NGLT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AueTt4SX; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AueTt4SX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGoq6O+OtRQ7B1WsmwCw2BmdPdoDoHYPSsM43dCV1oiCU451aDOxO8m8chzd7MofTTiTsTjA7gNnOrsQsocwJ+NQ5owvn/DjmnQa9SQkHqivvqkXWol3I8m7RnZaOyGfaY+Uj8NqX9RgznX15ulWrFGNZSambTAyQfTJiris9WQUAPZNFGTvk9rh32dxTu9se+Q75ZQUJtuGmFXd1+4kz7DjMALLE1roE5G4enoTYoxg340anwvd1Dt+zfXSZ6dKWQk6EZ0MVKA1tBj+QnurN6xz/6/Ch2oQde9WnYXSmeyynakFwvkhmT/SJ1VDatt8HDakcn4m8WDcCpstwN2hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q76qRIhCsBHzDJTKjqj+Lp/LdUqO0A2iiFlpIMEBOeU=;
 b=iN2bs1MdioVfrfdyLFlLlCgPFyC834PJuSgMGoyPjz5Lm8H8OtflmYAkJA1c8S7wvpD1m7I2brlNnzFtbSj+c0eVHs6ccXUvuq406R5xVOEcWQLbFYRFTB5VberOKzTUkfWtXmFSljpvrc5ibRg5HOrCeCu0SBbqu39rImYi+NytA8WzRGWv3T7k0yGSlQgNEXA7+JsVzdISrt8Frz5qhdFGkSQO6d1nnKQQAKThf8bNb+aRoallz5FSoA0sYtUC3NNW5DZCC+Y9Ca3HyuydDWddgJdqNmnsjBiQN9FpF3D2Y0Nbgl7vHfKPkje6+AVy2Ce2jnUQe9bCigMteQRRow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q76qRIhCsBHzDJTKjqj+Lp/LdUqO0A2iiFlpIMEBOeU=;
 b=AueTt4SXD0IE6YIRysXenH57Y+dtU+VP2BjcLY8uDsmNxjUw9IBaDz4b5bvifHb5CrU1cOy9GMYUq6bmZdljzZPu4QbGdZYYJVIfTAzHnuMQVmmQuN0Tzp8vJQT7iZJ30goEi19UeuUoN/cv2qK9wbS0oiRqIfGe/+ICXkp6/4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB9778.jpnprd01.prod.outlook.com (2603:1096:400:22f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:32:46 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:32:46 +0000
Message-ID: <87a4y8rdyp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Fabio <fabio@redaril.me>
Cc: Fabio Forni <development@redaril.me>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 3/3] ASoC: simple-card: Split alloc and init logics in probe function
In-Reply-To: <0a2a46e6-f1b2-4820-8d75-60b8f51cae66@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>
	<20260112231855.193030-4-development@redaril.me>
	<87tswqp7gl.wl-kuninori.morimoto.gx@renesas.com>
	<0a2a46e6-f1b2-4820-8d75-60b8f51cae66@redaril.me>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 06:32:46 +0000
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c386c7-5d8c-4c18-13bb-08de57edb998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWaGJ2iHCAjs8l9F6zjBkMp/HGk1QMRunxHTaH/kFm5Us8qp0z5a/8h5arXr?=
 =?us-ascii?Q?KFTPzH1BLnxLgJTNeCKWMEgxPxDF9Dz5e4EYa/b6iLBlsEwz/ElWOzL9rkWd?=
 =?us-ascii?Q?Hk9L2SKJ1Fp1TJ9sYsYvKAcHFk8+I3miRUj55nBUyHWm8WSmMioSmj0gREp8?=
 =?us-ascii?Q?mw7JV1ApA1OVf3AaDbJjHBEzjQ7OaCwXmVNAKm1PqkObeMqjKXpVaH2xyKrQ?=
 =?us-ascii?Q?ZztPcekmzqdZelbE7HILpFvKi28NJn/wAX4+HPD35fhWZpmzLOjaYHXQf5dY?=
 =?us-ascii?Q?GtnS+NzH12ltvcVJIznwA6EO07XxBvJdEZLKnkwM0rSAaF1sr6vJWmKGuHs6?=
 =?us-ascii?Q?/bMYnFzPBN4NSti1T3c4C2lDFlDV6An5OdWtJbl/H43rw+m8VMaJ1La9S/Xy?=
 =?us-ascii?Q?7DIu6iUn50692WiImZPyyQnWT2Ol8493xyzUIMEWbRPps3fH5//BjyemuM1M?=
 =?us-ascii?Q?4gw1m8YNIALS68u44q5D8TRDmGZZDClni3oUiO9hpsM7sE+BSrBhdhWVGA0I?=
 =?us-ascii?Q?91EARKbehkpOCG2JglMA2mV13LOQ/5gEGTfA2zbJI7olhIRlvm/HpZLXjEyJ?=
 =?us-ascii?Q?h9USBe3xj1wVz7htPwKMHaa9LHJtnEeOrFGUo9R5zYKcs6H6k5KjqanDK9Dh?=
 =?us-ascii?Q?m/rclTFvC3dTarRhNwF8kFJc6BLWp7o5U+DXL55QIfZ4AWgSW4nDDMIFMkN9?=
 =?us-ascii?Q?xb8tu4m8LHOE+LCHbxmzEr6509mE/BLjsgDROA41WTxElcF+JryWVcsjB+mB?=
 =?us-ascii?Q?m9TSj7zSghtUXU9XTyV1DXzxLs0fmU90HQuRNkhdj6jtHoZeba8S6bkqz5HI?=
 =?us-ascii?Q?ygnQwZJzRnAOmy3yFRly8q0ne6M7LKNUAVGj+vyoL7Ekpcb/4k2tPfIIuqBO?=
 =?us-ascii?Q?bLVIbUvMENlwbdOimTZ7YZuIZGs84y2XIk7A/SIBynBVp+QxLDpxaaHs6a92?=
 =?us-ascii?Q?bNYpENJvyBMmBnEANMq8tyod2hHVc39Q0Dc1boMM2bCMYeQPeOllJpBpgGM8?=
 =?us-ascii?Q?4YXIubaxOMqgBH+Th1TwStfoCkVjCrV3Qw84jWQXrLYpt9UEAjADZUWqp45G?=
 =?us-ascii?Q?3ILjDKpWqxTpwJKFd+T4TBN7I9Ugn5ArQXuNm89zHRXv0vkrsW8/wknEEUIJ?=
 =?us-ascii?Q?ZyVGtJODQvrpj3e3kHhAYOZywibd6UDuErh4SsCej896VBHqXsu9ZNjQamWU?=
 =?us-ascii?Q?8JbTn3buWNvNgF/sJLalNXESzWBRzTX2qdYztSLZK6IDR+z2G35dB6skpyOE?=
 =?us-ascii?Q?phMhw20Ed5MiO0a4oCcp/EXo8botpV3/6Tgmla3xL4I4AL2ToLQ60vl/6O7d?=
 =?us-ascii?Q?0rtIz/SxFlQhvvGmGinZhBL9rFThPq1IbWPbJiCyz0oeVfRZ7NPXIAsDwKi5?=
 =?us-ascii?Q?mhEbz3AoLwnhyi395wmBAysYRka6OdqaHUi5DYGDh6pV1cSuvUwCj/iBj5GR?=
 =?us-ascii?Q?b6aGdF752PfGCOX2dpl8JZhiJwE//QQWZAj4RbOENSID+SBwdGbIDgjyyfBT?=
 =?us-ascii?Q?HmBxyNolrDoE4OCDWc5UzS9kkyjn/KleFWvIb2NFK/oXxvvB05ZTfx7nyGzT?=
 =?us-ascii?Q?Uan5keesD5OQJVSUwIDeouNfJGGdhtVCZtjvv3K3xkgZBaKomk/JDRSOFcJc?=
 =?us-ascii?Q?n3GhKgjr4rncv6QMNA2MWJA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?THUaI5Lhubg6HEYSbW5dP/Gt2MR0yDXcGb4IQ5/JCmZFpdNf2PEkwtK6bfEv?=
 =?us-ascii?Q?vSl+UEKw16gx5YxwVtBnbUI9PJXHNkNQX3F1j8blcKy48nQt3S4qiB7TqSQo?=
 =?us-ascii?Q?lTJZ0nzv3ok6oJ6E28RVX+B7vEoe53Ac/AeFxpd34UU3vP+313EAzcRrAwTZ?=
 =?us-ascii?Q?B5FsgBsPQcGosp5ouTMylV0qEQaLzgKq23+kT1ANEgp6jsknnnH1OYYO6RSA?=
 =?us-ascii?Q?pNH4agU6/3dWyuhufViNEu0eVo9Nicr5CAKDjMKAZYVcwwxu882nTz0EPSGP?=
 =?us-ascii?Q?0uAXBEWRm3pYcRXKDd/hxFPLh4NU8qzCE90QZPnKSl5L2u4KnGzRqJz5Ruyw?=
 =?us-ascii?Q?ssbfn4bucrAay6hHPk9GmtKEbh6iVKGPmCTpYu9/IN7wBtCShY/no4xdCAKq?=
 =?us-ascii?Q?UvoLZupROVhLhjTjrwu6emcLHHwJoG/XFOmXesXzIYepnekJdQVVqlhFjB8C?=
 =?us-ascii?Q?PzP3/o2NFj7w/BbzA4gwuI+tvs+ZjgiOuLHLMEvRgBFiAWyXb8XnAUlj2WZn?=
 =?us-ascii?Q?AvYiGzc5xtES5sJC9n7/eweu/A8GOXmZJ0ZGxektnP82NC7hseUjxvqH+329?=
 =?us-ascii?Q?KfvIRuJFGpoYqgd2FaOBy3AKgQmdcIXakQE39MbDw/qCrmq1GgXHldJuSMMS?=
 =?us-ascii?Q?zG31jO0Ul1S67XR02X3cj5E4nRWNQ+RyeUpQMo06xhAf7LScX+uTzQsdqmpX?=
 =?us-ascii?Q?b3EM5/mHmw7VB+qVQdi6hEGXoFA8JtQtAyvWLzP5cpGfnqcqEtlXRyFeVgjH?=
 =?us-ascii?Q?Q7HpDkRKeK5nNUSGYMAvySQOvJI9Xjsyp9ma2M7gLk9fOSiA0nmVQdpIB5mO?=
 =?us-ascii?Q?nMQa68OCEoWNfWN3VSlZtccHO7af+rdiESoiiCksOW63B7DhZAZOpYL029SE?=
 =?us-ascii?Q?ZvixdKbgKTMLhEzLr2WwfYW/tBCbWmIgnLTJWO8NwYLr1g/DKZSEQVJ3Vc6w?=
 =?us-ascii?Q?1QjO+6qhB8rufkwAPAjsAm2L/c/WVohflygFOOdGMkCWGd/Qd67Gjffw1u3S?=
 =?us-ascii?Q?d6Z6xtp2ucnH1OCCEe+IYmBY0i1yAgAzP/tuqBUoEQR09QtJgdj9hIb8Q/cP?=
 =?us-ascii?Q?i73FBujokNhHtoJ0PvAUWCcBeGIIhGusWZCVmoEp1RuPPQi5UUdiQz9TL+qN?=
 =?us-ascii?Q?Mp0WqcTZUFqyZZD6BoU/dFzJkuEP/RYhnokoCjBrqEVFG6NP/2k7DB3mbnjH?=
 =?us-ascii?Q?swTlHC9DfBWuaL/qXdsOIG2WCQ4vZcsqf3Tv4tRM61akxOE5WZnJgAGoe1gd?=
 =?us-ascii?Q?9Nv1CpFDVToZFyXg6IYgsx/+VptjdPd61oJAOR5tCarix0i3fK1zTBpx/TNF?=
 =?us-ascii?Q?0hosys9qJfew3aQY/Hmo5080iw9VJnyRje5pTRJA082xmf54nXHLiT06qic+?=
 =?us-ascii?Q?uefNUybOTPvaCtFqX25EGcC2EISVGRjupiE4Hhl5NuQJLrPSNZbXBWkQk4bH?=
 =?us-ascii?Q?zZ6/cO4vOdvwznX5DLz2g8eAJATZ7Fq5OXfTRpzP4vF8jfzsxCmN6GS3+yS6?=
 =?us-ascii?Q?giJ0IDSxI46gJYOgklCwXPQkHlG+NCn5rCcqYtt9GwMM6abO9jhvCIgQfSpP?=
 =?us-ascii?Q?mDV5WrlLSs8Nin8M2QFcTBkSrf+KsOjWbJ08Iv/f7my58psLYugzUOe0AD7o?=
 =?us-ascii?Q?QgNRl0a/4mg2z2ggQqJxHDUVPOuR0IUMKI/2NXY5bkE5pz57pnAeLmt+M6og?=
 =?us-ascii?Q?QwinF0yCmKqZULLZQuVX5WarUHo2OecTtrhCSNxvyK+ykvbSQiglTG1ZXcja?=
 =?us-ascii?Q?SJM3E4M/tAHWZUEHtJ++mYOHQ4RyAmxP6+KIupIP86G2txz9g7jD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c386c7-5d8c-4c18-13bb-08de57edb998
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:32:46.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ifCb36roWBTFPemUfDpKHfo9/t7Eg39TzikrF/60qLlpPNVM0PhR1qf4FYS7PesD18K2vgXdcZ/EcxVpOBPQaED2Yh4J4TlisHFIVXBWryuINhVsm5hxz3xGoRfs8Y2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9778


Hi Fabio

Sorry for my late response

> >>   	if (np && of_device_is_available(np)) {
> >> -
> >>   		ret = simple_parse_of(priv, li);
> >>   		if (ret < 0)
> >> -			goto err;
> >> +			dev_err_probe(dev, ret,
> >> +				      "components missing or uninitialized");
> > 
> [snip]
> > 
> > Is it clear error message ? It failed parse DT or something ?
> 
> That's exactly the part that made me provide this patch. There's so much going
> on in simple_parse_of(). I think it may fail when a phandle of the wrong type
> is passed in any of the simple-card node.
> But I'm certain it can also fail when the DT is correct but kernel modules
> of the simple-card's components aren't loaded yet, since this very case happened
> to me. "components missing or uninitialized" basically sums it up, without saying
> "parse error" that suggests a purely syntactic error. If you don't agree with that
> message I can dive into the rabbit hole and learn what's going on inside simple_parse_of().

To be honest, I don't super mind about error message :P

But I have thought that the style like below can easy for people ?
(A) part checks something and return error, then indicate error reasons.
(B) part returns error because the called function returns error.

	func () {
		...
(A)		if (...)
			error("indicate error reason1")
(A)		if (...)
			error("indicate error reason2")
		...
	}


	main() {
		...
		ret = func();
(B)		if (ret < 0)
			error("func() error")
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
