Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED313A244;
	Mon, 26 Jan 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769389013; cv=fail; b=WY31X2f0sZdy/qmwZgsv857g5cRlNltFFJKr2FSRfKmkKZSKD82JjWcIgInX6I5KOL27pgqhWS6/lqiC5dkQO7oqWRcpq6/jiwc4rVrlHG+LeymGHD31zesVZYJlPnnCghWtnhE5lqNnvaDT+TDDwUNz7iqlkBIlfCrK6FqPD5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769389013; c=relaxed/simple;
	bh=93MeLB5100ZNh7Z4GgZSDCdmGcLMRUQHBjqjSNYZrH8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hy9adKN8UuZJHx5JeNcatKCElrvvIr96aRXkxAX4Htg8MowRN/GQphE4xirzQ0fi6vUkKxkhmxEY37eOTwpmENIBZkmLnNxU7mi22vr/7oXVbbI505sFyWck4FLncNvvVfllTzZXHGHtRWRetTSJ5dpsO6wKxZNc4rdekhPzWLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hl5fwmEd; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hl5fwmEd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oryv0ZEUI2Bfvow9QigrB8Wx+6hF/2oSAZHmWo+Ec7dQirp/baQedYI9e09xCq6J83hHljsnbw2zQHjTkicwRIlNx6OaQNx7NB6DjfeOeVoCYB9LsrLkfVNcRcaO5ERBNuvUGSK5BYRxmfsuW6ewoeS2h2tP4r8iNHmr6iXGq7yGH1S/SNuOsvTTXcPK8+hidZ27SK7eLXW6M853qZnqIoPG0op/PKFg+5YMD8EgAG9r5hD5sb603jIfytL88RFpyMfMu1pLq321vYUDikgUirGm3JOQ57uI7oHIOEIQeP4wLvzd+eQGN97xfnMI6irvOtMOw6PNZvUsIv2M+Sjqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT0Xem06HqM3+w6HndB4TpkkVpCpxRtT7dE7RjvuBtw=;
 b=kKY3c/VGG49S5ytaARxaRduHHIggLgkFlt6G2kWpYDTZB89vNK1oSbhjJI5YaJZea2gd9Zj3jy8/VyKSJ77+ygyoiElNBWp7fcqSythfwlvVjkET64jVc22cVXOx2moYQJdliTjEYGcnIORrXs6l/Gt5WYjoZGVoogwyKNTV5o2pwRGkRzDar8qPxdR2ZjmgxxLjpc06CEAa4vrd2bsRdofc6OtpeCS50jL3I0flU0smpezoSaNy+yQZezvAOD4fbEzyRXEI3WD5Xpw9dhZTjVf+K1d668cxW1o+guR/8JUiIOJIfRz3gqE46ZgpD8KkAqTkiYtwZdC8SvEX2Fc/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT0Xem06HqM3+w6HndB4TpkkVpCpxRtT7dE7RjvuBtw=;
 b=Hl5fwmEdQfY8VDTAi9XwFzmFE8vnu+rdjgLy/8FGRCQAjlIs4gE43azONaCq4/Zc4tjKES0NKYX4tjEgFfS37TDLAFr1BQE4KQtkBvmLk12gjDEQKeiNlajN4DTMDVz7SxPCf+iNQ+mEjKiy0siFvO/Ner1Z5i+nZKuHKrJYpJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY6PR01MB17408.jpnprd01.prod.outlook.com (2603:1096:405:361::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 00:56:48 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 00:56:48 +0000
Message-ID: <87tsw9tcmo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Fabio <fabio@redaril.me>
Cc: Fabio Forni <development@redaril.me>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC 3/3] ASoC: simple-card: Split alloc and init logics in probe function
In-Reply-To: <10a207cc-7a9b-4cb7-a76d-04dd0c5a55e1@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>	<20260112231855.193030-4-development@redaril.me>	<87tswqp7gl.wl-kuninori.morimoto.gx@renesas.com>	<0a2a46e6-f1b2-4820-8d75-60b8f51cae66@redaril.me>	<87a4y8rdyp.wl-kuninori.morimoto.gx@renesas.com>	<10a207cc-7a9b-4cb7-a76d-04dd0c5a55e1@redaril.me>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Jan 2026 00:56:48 +0000
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY6PR01MB17408:EE_
X-MS-Office365-Filtering-Correlation-Id: d4410021-4509-48e3-5bd6-08de5c75c8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Io369asCPloIvGgT6YodtOqFoXGjN5ysIFGiU+kH8TPNIsoly3ktQefYh7Qo?=
 =?us-ascii?Q?4GVyGtYmDO3sr6fMYUCsLH0vB0AdWqH8NwA2vR9SZAQaO8ZoKTY4gAaBaWbi?=
 =?us-ascii?Q?uKoginx2E98zqR4dQ0gcc27Y+OhlrE+VLOX+I20w6Tm0bW4WgfEgyVll+6KA?=
 =?us-ascii?Q?19YRVVN2lQAryrhw/pg3/V3eg/eVsvjWys3om65gGlvZUJSjiI/8GtXNAL2F?=
 =?us-ascii?Q?BjriIKhB3MZJ8HkWgLN/dzLQL8ODIKv55XL3n0Bg9BlJUozBQg5JoAmwAJuL?=
 =?us-ascii?Q?6xRh4qUAot8NygMPZ7htc8C1DrrXnnEvlM36HoA9jPKFCuhtrkx3YhjSlGjJ?=
 =?us-ascii?Q?1hQ4sDjAU8MdrI/bwmHCv3MMlDA0+DH8JmotlQJGyind5ftNGjpfsYh2EZvF?=
 =?us-ascii?Q?CDFvpq4JLbTPPaF8ada0DA64GqK2WBrGt8c3If/OspBWRESLYg8Y/71JXJiZ?=
 =?us-ascii?Q?X6Hj5dxvjdXoTuGmfbbp8xDtrXatoi+VmH4YxZcZnuZpiJw4YxRALr+QZxiy?=
 =?us-ascii?Q?IzpnnMZ1IcHTUPpNR6EflpffPiXv9bgxaYl/oj+TRp1TBYqP0elocrHkmJmo?=
 =?us-ascii?Q?H3pDsIXsJYmAdFyi/SgbwpB36cmEwyVXCkOCm4Yt5dil4TnW2S/k3QxfEzTv?=
 =?us-ascii?Q?vH9Al+6zc51Af35VFHoAW2sOOROrjBNSH6SopZR/D2ZfIZyAAbiCeKFeDvwP?=
 =?us-ascii?Q?+A2xhXfdcriCzl+hwP2SX/BtYnVaINMJUXICrxyXTn/pnLfcWPcB3mXBhczW?=
 =?us-ascii?Q?QTIXefSjK35yiSy5XZIMNF7tXG2gO0wsebvW6GtPMaUdOGSzDP9nCKFc/Qlc?=
 =?us-ascii?Q?Z34fF9WJv3+2puZBvR7RaHomPAFMlNcetEGy79VYLjIGjrRKRgvr0LsOjifU?=
 =?us-ascii?Q?wPBfd4w6Trd6kjAslM3zhtWWfmhY0NPPyjJlBJCFvzWSqyQXTpCDX1vZnguL?=
 =?us-ascii?Q?cRR3YUu5Pv2WBMGl3rTZo574cZKTI3Iwle1nwb2KLo6tILvNpi7e6u4ynqzq?=
 =?us-ascii?Q?krRKSqg58uPbZNEoLFRPexudn1Pk14XZDbQ+7v9ylMJizEfVj4GW9iMEhEbV?=
 =?us-ascii?Q?iy4Z4xJW+DA4VuxqmPSJFp+5JY2rYCpqVrT/McapDFAZ00P/qt/UHSlxr40S?=
 =?us-ascii?Q?7HfuMUEx30oAsIhvuxBoINP2HGJT74AZ2vO6jTwmeYWlyW26PKaPu0Rkem3r?=
 =?us-ascii?Q?ufrEgpD8gpzahGRYIkdtt15WCsnQS5gsztouJZLKbLGzAqxcx6ZZN60b0WbD?=
 =?us-ascii?Q?LE4NAOWtT9MfnZz+b4VgoKwAy6EhIKnARv46jL3nQcGGMUcu7l1HurC7oOIG?=
 =?us-ascii?Q?uI+TKzXn6tcyz7IK+uMAnFQnJ+GZUYlsI5wOqXFLF/pYE7PriJi00rDUs7lI?=
 =?us-ascii?Q?BROPJ/ZBtfez3EP2sC8UT0vBtTq3PtLimOagZQw3Z1FOjb+rW4QZ7C0ftiVJ?=
 =?us-ascii?Q?AtTiQBS4p9Ci4Zw/0xZhaxIxao65vtIgSvNfYb0pEwUvqL5DceRZSSi+OlLN?=
 =?us-ascii?Q?o7UfsqomlZfi+FzqTkykUVwSG2WCbuCeBg1LeeDeg3UPt0Pb9QU/c+DUg7h8?=
 =?us-ascii?Q?YlK3sxdsRLv9NoiiXB2ISGRf83pHrupPJRZBwYQv0BZj9Xoy9CDXlK+ltzYG?=
 =?us-ascii?Q?Ckm3qdoSrSRj+fKL/QKL66w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fe/xkaCRA7oCtix+uBghehsjwtOSV2HfqZUXmUs1B2G4S1r/ukBOPv3g1XQ1?=
 =?us-ascii?Q?OUgsromRoRxNwLLpEBo1WFFUFPomQR6FB5ZOzWp+IflycW7LuEKnopdy4Oq9?=
 =?us-ascii?Q?jfqcUJrMafph+TMBaDNgTmoBct5Xz3jr3XOcG+IitRb7EqGhyy4IpKB983sw?=
 =?us-ascii?Q?FMlB2GVNzUAQlTpSXxN2y/fQDxwIMzEj6bzNRoBltW/Ik8o2/Ta+gWN78GtU?=
 =?us-ascii?Q?EN5pXKvu/zOrp4DfyamYLimteQbBMoPLrtgTqSZrCfKTEclI1uSRNcLZLtky?=
 =?us-ascii?Q?fM4HvipHxegcG6MliphLNc+y+h99/oujOM45YgSfAxJMDSSlDsO/pfnw8EG5?=
 =?us-ascii?Q?7iclPwkHZp3y0Xzl4dgJySrKTm4hh+LS0UHa6EgN+l1bmTk0+/gTtXIKRBcR?=
 =?us-ascii?Q?AyqFvgx4MRjbiSdZQnGnV33E9GZc1qSunlLoOJZsBGajPh+7vDRx7EVMIskA?=
 =?us-ascii?Q?iXkjGgtm/qlQqn3/yJfRQ6oAW8+Uv5G5ShzFAsUwBffbd4rlEe5NYW5jZkFo?=
 =?us-ascii?Q?dtfLt308bU2Yd/6HJL8nef/16MIRhB2HnX/U/W+WcVVJ6knsoZfRpaJf/jQr?=
 =?us-ascii?Q?mHxneOoxS0jOLSI4h5pq79COltWB0HhXrs0Lv4U/uwyKZvsKDX+6TIirQXSX?=
 =?us-ascii?Q?379u+9jVWOJnwWwNs6yJ2rMjkPCkHpwkt/OGFuseg00faikvMmUTGM/L9EWL?=
 =?us-ascii?Q?ogJLtf5voTCKU31U3Y4t35LRBHOrTpQAHcK3JxmIL9u+7XLvqkQXn0xBt3A1?=
 =?us-ascii?Q?WT0DScUMSjsM88wQdWInBUy3FvvJWFh2Bw//8+iJklVD3LoMykO1QcQnG0Sv?=
 =?us-ascii?Q?6KjRILXnV0ZUBaNQy4Wib9z9+Ic7njsuC9MgAI3cG4eiwhyu/4rnYWfMmlN7?=
 =?us-ascii?Q?0htIYNEhpT3HSlH6BVjtK/afpnb3IRtwZPnwNtn+scsq3bxpRicaProCYfRi?=
 =?us-ascii?Q?xZgummUE/tjwAShgTl9kokT3+xReTILkAqF/oq80Jeh+IkUhYY/Q7IjC/PHX?=
 =?us-ascii?Q?N4lwFqsQdqmj6HqpisSOODpCRpWogsuC7P79xJQGzRpV06dLkk5RRjL8q0jj?=
 =?us-ascii?Q?lgHp2/vz3xwhxJZXWekmt4FD2wuAUDq23w9GrN4bGqgW/UvZ0+Y9Xqc+uHvs?=
 =?us-ascii?Q?9RCDzF2ep9tp+yO+kSk8pkOst1Rd7pJ/zcZj7kv8kD2rZ/ap+oucHoS9l9tC?=
 =?us-ascii?Q?NY8o4PFX4GUu/0JJM0zKlSGMPoHtQhH8iakhoptDK3nuI6h7yfOCjGNL2lTm?=
 =?us-ascii?Q?UgoSmPemiFfh7+BmBXZhxuY9rDV5pIB59Jy4pbFHZikc5y6TBThmW7n8YUCX?=
 =?us-ascii?Q?6XQuGck2ulEj3SGq8p+oDxStnbev03F+KtfvUCvv9zEHvLblwqzx+iTnFTD5?=
 =?us-ascii?Q?PS8Vb4zSHX4Md8tvUsmGpEnKRx2GKnoIewigrTQOjj3UrMHBntWJCvr8wfd8?=
 =?us-ascii?Q?e62gWf9cRF2KGksyDdqoVGnhnZ0MnNd+R0iOUx36e3V6URQV9AHwVjAY8KWF?=
 =?us-ascii?Q?SDSHRHes7ecUz/R4g1tVe+gooKpodpEUC7M55GkkRONvRtPq63c4yRw0L5+w?=
 =?us-ascii?Q?mFXhMPFMVF6psG8biSU56xZr7BYWpeaRq0tpx/lWSyfeLgnqkbCiKfC9QM6b?=
 =?us-ascii?Q?+rXPeN3Ga1tDlBRYC+K1HMyB4Fk9hDzX2FMw7OmzT3ofrG8U7i6kCBxNWAuT?=
 =?us-ascii?Q?Ohovz+uESOnkZit2y6mCNTfwZ4qXUUC/ULirOJXqFhr+pg7bh0tskpW8nx+0?=
 =?us-ascii?Q?eFMqZSGUuK/F1nTktgmPeG3WGIrJZrZES9+iorUcSQaT8f6YM+/X?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4410021-4509-48e3-5bd6-08de5c75c8ae
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 00:56:48.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpDYPE7NSaQp3nd3r/ilag+ufQLlpXFwvLDt73vR0HVjsorPtfqST+++Sq2flP0f1+iQxzlkpq85mRVb4lqMwV2F5xJ9YfTnU1KrN7EN1k8BjZ6SQNNicQqdf7sSrHuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17408


Hi Fabio

> > 	func () {
> > 		...
> > (A)		if (...)
> > 			error("indicate error reason1")
> > (A)		if (...)
> > 			error("indicate error reason2")
> > 		...
> > 	}
> > 
> > 
> > 	main() {
> > 		...
> > 		ret = func();
> > (B)		if (ret < 0)
> > 			error("func() error")
> > 		...
> > 	}
> 
> Hm, I think you're being too abstract for my comprehension, sorry about that.
> Let me assume main() is the probe function, and func() is whatever function
> that probe() calls. If my assumptions are correct, then:

Sorry for my not good explanation, indeed it is too abstract.
Above (A) and (B) exists in the same time, I meant.

> - In (A), are we letting child functions print the reason of their own error?

Yes. indicate why it become error in each function.
Because size is too small, memory alloc failed, etc, etc...

> - In (B), I think it's the approach already being used for
> simple_parse_of(), isn't it?

(B) indicates func() returns error. I think this can indicate error path,
like below

	xxx size failed (error reason)		// (A)
	funcB() error				// (B)
	funcA() error				// (B)

Developer can understand that funcA() calls funcB() and funcB() returns
error from this message.
But this is not mandatory, just an idea.

I think simple_ret() can help you, but I'm not sure whether you can use it
on probe function.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
