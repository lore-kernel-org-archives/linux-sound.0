Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571047;
	b=ggioHPWKXQUIfXGiF1F6f4q9jN6o9ap9l/WkP3F+LYq5h6C5MbPHZ78B29zeYfXSDrGw
	 z8PdB2lqRDVxoMlgODwNZBzijba0y0nfJvj7Dypj/UiHowno0X3P6XDaDYxSI54RCm/RV
	 a59sss9IaswlGPSI3IrH7+ttxwIJIX18wKR1DlqWNWJwssTaqTfk7yeFvxwVHNeGrjkPT
	 p1bz3rsNceGwP8Ny+5vASggbCQDfYhjZ+Y67RrwEF+5oskDKNSZBPHj+8Pe2DkIMjQ2AU
	 zIx+iO+WvHmALwyqjTHiW8G4PptkRriw9qZ7zIjuV/p7dtCx+sAKTNCE0CnJivb0ISg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571047;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jV08kmqnKJ2Gvp8/9tweUZwsRqrOzbz4n7FmJ5EO99c=;
	b=WEsqpHls/xy335XeqUzWKZ3PVICJVtjDOqiHkIaZiKfPunM0NXIotDcGfk8wY5H+QOKy
	 w2MVXgYt1QL14LgmL/k9Tyomu4SJB8YmsBDWW37os3zdv1UWdDx5lOV6an0RKcWizYAVB
	 aVdUGZ6zs812wKpDRLOwlhLMJeJnehkePyhV/aBbc17VT4MRRJqtAHuogUPz/kE3d/f+W
	 UpEix0u7j+V9pUT18qP2ISoOO/i7VdhVgL6hVerL/I5qjeWNa/e6pKymm42IgoDloCCjF
	 gf5omRhSCywOudNR1+8J+zGKvQt3KmUfodWM9zFbRi3fGSptPxZ7etSDFGJaCs6V4fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DEqN7yqh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.36
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C29606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DEqN7yqh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvRWOreNCAKkJ+UDNXHxSMkxHrC0fDgivYrbbHpitoGBClGYk6mqtvrY5y8/0At+BLCghkkJ0LCBtcpOz5K1OmLxw5n1jQy7NcazAzyTdrrlYDBgSs/xsJFul1vAxKT4P+fIXGeOl9Byc9Mx/UaNQDVRa7pR8kqWrmRWFGhKXpiL4lRVCG7yC0Sh3kJ0weyHwYS4crJaF8sE1NnmtUjjoaqsXCrVBTPoxk+Jkt7kxOeKjbv8l7KzHtLR8OVujr3OgYJv5j5ztu1nJiAhRO6tKgETgqZhLVfy38mIfFFsVymm40YN8AzrsU8KgP3Rbasi5BfSWimlMqhab26Y16VXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jV08kmqnKJ2Gvp8/9tweUZwsRqrOzbz4n7FmJ5EO99c=;
 b=B22v3jYZS8rnDclwsaV2TZILEpRHaMZxFcoIRiRJCDcQL13LPy87CfPOP+MBSeavPwbH8EbzM7+WUxQUNpf6kiUTt6OjWa3qTLqUd/vLAzeLY6GLQ2zz+IFoWUH9kRNUVYedFRNFhnxWZEsogKA6ejDnvBfpuEhSOWZl+g9jpNk4sCuEK/ww84vTwEANUJJtwdjDIDzEqPQTFia/mWmwsB5uEZRwRNGh4u2odcn8UGatvEuLaYCEIn1wX/2buFLFCpxoKnF6LyeKzqiu/UqB6TQ/QUST3kEfKSTQjeWs7uZPFfB8QNzafXhFyYVkooYh8wLfPv82Rybkw3KRYmBlCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV08kmqnKJ2Gvp8/9tweUZwsRqrOzbz4n7FmJ5EO99c=;
 b=DEqN7yqh5O8sHH+b3ghUghAkREHEwj5xPbwg0digBe9V/jZrMeu/lsdQRCD3tqie9oLwEQa58uxmbjt7T6fuX1guOaMhd/VisT0kEcZqIHA+ZIhrvXb88NrKOTVjcpE5QTMuNBC7E9ZJUUf49Q2H0rNfLgttJ5Xo9N9YPDQePtU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by OS7PR01MB14506.jpnprd01.prod.outlook.com
 (2603:1096:604:388::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 01:44:04 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:04 +0000
Message-ID: <87ecc9elcs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 22/27] ASoC: soc-component: add snd_soc_component_regcache_cache_bypass()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:03 +0000
X-ClientProxiedBy: OS7PR01CA0301.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::20) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|OS7PR01MB14506:EE_
X-MS-Office365-Filtering-Correlation-Id: e2233d12-7676-48fc-9852-08df4a959612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|261021121427099003|261102123227099003|261102130727099003|261026121527099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	47kMknqi99ApBE9KIcSnvSDDhBanuWTeUpBmcfzJI/N/r1bSJcz3lwhYUqyS0LSK8Zz1VW5xSkEeS93N46FGefokjwOvxeCfOez9pULQTgxBeTmFjPvVt5G6BJdvAd+BOVtPZuP/7fnCon8DVU9DLz/kXKmKvRSKbmd/mldKerrPjIMkbGI2o7RqSGzsZNkpPgfaskxzgrS2Xn0m+Jnn1r1QnHFnIJmSmUkvx5NbNg7O0hge2iN7tRuXsPLvCgwP3ruOG62orqUhzKzaIxcM4nRmmcwy2yAyd7y7ifVyeIxdNYBKtJXqxU9QkCrbtfVe2gew5dHKai6T8E5sItp+K9FEojW/T1ULU/36eXEUK9S+WCZq/aOikWhuGeHg054qMBfQZAbo1eBebBR95iOwoAXcNCBm7lndvkBxRQDsu2KswmYOiufJPuiFtYduII/XTRtwzyFxdmuiC5r+ey+C1z48sTiqdcq2rXscAdD+q8t4WiaOdbBxG1RPm03ps2daXc3BHz8ishhqseZ5W2qQg9bkCwug4mZ2ujbuELoyTzOTbVYvbkEKXZYh98pvQ7yrcSCZSKJHV/0Wdt4GDrTdG/YPq2Jr4kilCzQDDQ4ghK8AOhGqRG+wMksl+cxt21ZBSesuIyxQa6340kh3cFXubojoAV19tCXJvKw7d0v2AfQHcLy3mzGSkI1j5rWaDolAZVL09gwUcIxvutqikQwQKzQktU+oyEXy8OnnJFbYH0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261102130727099003)(261026121527099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?4HTorfGu7KX6wSJxySzgVItubE2p/C8m6cG7GmeoHl4lYJ86cuRKJRp34W?=
 =?iso-8859-2?Q?xU35x5j6y9yuapgIRmNFbQxKetn5uw+awZV/aUs955kHQLZn4plp6voWuW?=
 =?iso-8859-2?Q?G5FWYnJ1MHPkdgqZPuE7hpttgYvzKJ0wQ69t4wtFThQML9SeL0Ib0uFiDt?=
 =?iso-8859-2?Q?SihgydECKBhAltorKPeFitAupVbaEkCrZk+4V/Is27FO9IHJsdPPthBJk6?=
 =?iso-8859-2?Q?k9MqZPiq4ZQ5R1I74iCV3uxFJKnR3LXQq1sc8RaDALGqCIFdDa/oiwhccL?=
 =?iso-8859-2?Q?mAqI2vlIWhbb+Xva4hhoCb72Aov9xgF8IWf+wsIP7UomDMMP+9bxHABVxe?=
 =?iso-8859-2?Q?3pBAyX8jt0dbNdNbAdbdV/kew4NSYZd/LeNjjYdgZIHacVMVdQvUsjO9Hm?=
 =?iso-8859-2?Q?viZIvg8G/MV+whD7YGLnAydXj7DJIdsgXq5T43Ijd4ot/c9VjBTD7m6Bci?=
 =?iso-8859-2?Q?7Ts5s+987eZdRXZ7ZKcFcOdsxUyz7vIRcS8W3Fu4MAUWKQM95TDgwEFXN7?=
 =?iso-8859-2?Q?u8J/Cq0dCUVkW4Zcn92pDm3sjzIIHgCPQ850llWNC0xAOv1uEqQ7Zuhv1P?=
 =?iso-8859-2?Q?FY+xSFMvGKak81OPfu10FyWFRQb0rp/AwPeh3xpzsJxdOZ1JXicLfbpWFu?=
 =?iso-8859-2?Q?ox+zPP8TR72j0VnocGLayqifE+pEMfDmMGUiqb/O4a/g9efezYwyO+s1VP?=
 =?iso-8859-2?Q?zQTxYTlbAfH1CaeCMWjzY0DgRqpxaCZ2h/94NeP+od8cCuKdIxdLdTjinN?=
 =?iso-8859-2?Q?LeDBxipU+eZIQdduL4xlYriCxxVQ7YosyX/jTqbU3pM0KZ0KFnunE92pyS?=
 =?iso-8859-2?Q?gOgNqPVNY/oiHiH+VVCxj2IGXbh/VjCrvd7FRwhaKYkrQOibARRzRYtvfD?=
 =?iso-8859-2?Q?vweww61P14aWEvtdvsibx2oeZPbO/cd6ei+E070rLVnwOvJrN2gAhmG7dx?=
 =?iso-8859-2?Q?l077cs1cbkC9LsbNhou7BKnUU3actFZ1EKkLEXjDE63uFC5PWlT2D4eh49?=
 =?iso-8859-2?Q?I+X8RbRQZ8UGFTUlIreltxeP+B2JIz1yuZMAWki/rZnYb4s+2iasxXZuLs?=
 =?iso-8859-2?Q?2ntuplJAmYbNq+zm+DUL0AP6186fyAoXL99S6j1MBDXi/uaDiywsXA2l0D?=
 =?iso-8859-2?Q?Nj9wMDBNy8jil/tMxslH4aMgb0WPY/vNJ/xVuGpIhqy8vl0rLrKwK6j6VA?=
 =?iso-8859-2?Q?yJ5T02HQbn/qH5qC1XnnHTV7LLWw7vJ68P8p8EGy6MefTLz841JQZrPStP?=
 =?iso-8859-2?Q?ML2AE6THCKU2ezmptOM15cI9vHstJ26LxGYRfFTlWIippNrPwHQQqz5R3A?=
 =?iso-8859-2?Q?q7f+UVK7s7dRPobZa5JTW1K5TJ8QwBNWDIMTzPZuLvvPBQXKvE3gF1eCZ3?=
 =?iso-8859-2?Q?nGW1J3PJxLFhlMaeuRfci37AxqfU+0YdkuDuwlcuA90iiwc26SlTlg1xTn?=
 =?iso-8859-2?Q?cx2oGYNh5srVGHvOJlhGCS2Ycx9KCpc24lMD2rwZSqmMhOWA7hEMW5LY9q?=
 =?iso-8859-2?Q?XFWZT45k+SkLwL9VVG5Gr/O0XBKr6NmZw1QVk1xTftf1d/keXldEii3q3T?=
 =?iso-8859-2?Q?rGunjgXg3OCMOA7OCO3beocM47OjijcdYuVrANCBrwk9gNVDQ267pc/faj?=
 =?iso-8859-2?Q?LZUf+pWXfOM4A5uBb4fulFFsxUj520oWSxLw7Xu/x5KNVf/bShF5WndPqS?=
 =?iso-8859-2?Q?/V7mJKBvt+geMZMThWFpd3IZV7aby4AShSk6En6r61jZhLgULPgD+YvkcC?=
 =?iso-8859-2?Q?b76Ocn9YLkn8dGeeIbWwkfimUbwEnjkyu1qLwuzw2+powA1kqiCJdap/ae?=
 =?iso-8859-2?Q?Z5X47bw6ftkEcdlj83An89eZal+0xsvtrBtCm8UC0zsQXUkBq8Nl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2233d12-7676-48fc-9852-08df4a959612
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:03.9165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tM0E5orWahnjA7//AK/c9yA9PjZstEZvMoK+zayClQd4uW4rHfqK9iALFblHEtLOnqVfaDKMetTPsJWqnFMOOFPFRMhUalkOj7aJaHyjkfUJ5APj+U47gdyui1LPQUuu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14506

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_cache_bypass().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 3427f2f094956..7b1d9775422c9 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -359,6 +359,7 @@ void snd_soc_component_regmap_async_complete(struct snd=
_soc_component *component
 int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *compo=
nent);
 void snd_soc_component_regcache_cache_only(struct snd_soc_component *compo=
nent, bool enable);
+void snd_soc_component_regcache_cache_bypass(struct snd_soc_component *com=
ponent, bool enable);
=20
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 3c9c22e8c282a..996b66188cec1 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -527,6 +527,15 @@ void snd_soc_component_regcache_cache_only(struct snd_=
soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regcache_cache_only);
=20
+void snd_soc_component_regcache_cache_bypass(struct snd_soc_component *com=
ponent, bool enable)
+{
+	struct regmap *regmap =3D component->regmap;
+
+	if (regmap)
+		regcache_cache_bypass(regmap, enable);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_cache_bypass);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
--=20
2.53.0

