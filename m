Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475C1EB197;
	Tue, 13 May 2025 23:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179624; cv=fail; b=DGrqENpFDmNRxxZIfvubZEx3vaVOrBXtg85Ukb6NmTt/BIomRaUN4Fel4R72H2b2Ftg0g/h/fDe2qXZ4WLvI53jdhZKsErbFArNqITqRyQaZMEgj/6BuFEyrMZkINFP71hh5apmPjr8umpmjjZuILTX0vhy7b2xCsYsJ3KlABUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179624; c=relaxed/simple;
	bh=XB2ybtHjxPmJwK0BxovrF/x76866vpCbhlKUh2h00Ko=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ojUQrD+Az3EGgWRilSBDBkm/8fsQCMc0XmSlPtGmqtjrzQ6lWyQ46sgFep6Yl+kgJl8YpNUgolAEFYlL/2JL4+YIvh1MqufiG4AkGBLCyFx5iH1zqWxCqCiwGNwVxuEAGpLzJ0r2mGP/6SywKseDcl27CCNEao2U4JPpZSYUPew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UeSuT3lk; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UeSuT3lk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKrumCGrlMZrcxWesLIn+/Zk3qhYRZ0GiV9xIPex8h49dSVGvZDbwJMd5kv57fw1Hq6r+gVC7n44CxzFVrbrzskQvAl2rscGtIKMsaUB5OQT255l4e7ELv3JpQf4HazroWY1vpSlroCmK4vpYcYmpVxZMRXitPRaR6Xrn3Xxz6WMx6CcXtdoeHRr5VVVO9UAuUxjL0oU1zqEAAjfaYCFwW5uhtIrAvGwd+1WcaWXYHs0B60eUi74jV0r4n508RKfeoYMd55JwOIyQbpgvKnExZUEtzgjAaCjMY2SuJN7ESy7z61HWcyGA2cN/5baXVaPac0TYYzvqtQnqujNHmS7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTCVPEmt0oFwVTVf2zpoYtYbFz3Nn/rstz8ncvymIb4=;
 b=NR11vytPq8QUcnZ8uFa1yd/n3afK4Ut5dGTYteEGajDRySm1aW6ot5riMB/XNLxqFSi/ss2PBk9ovxwawGmVspLe/W8coJ/JAThaKzJZjzLZyHREJvurYHqVO2j2BDMFQVGIrKwMnVIpulmlUzivKR87TDrvq9c5j4y2UCfmQ9uE8gQLl2cTBblQdq0LfaS3nT4oel8wbwzjl3Qiq8a4KRdwcV9moFkolZQwPfwR05KCndgD7N9gjP7eba893Gy5vG4ZSqTlfrDdnGqMuh0GyXq8d3JrkvE7ewuk14NHo9j1OdTHOqCDzAhz0CzAl7re5gnVUig0nZj5rLN2jX3Qqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTCVPEmt0oFwVTVf2zpoYtYbFz3Nn/rstz8ncvymIb4=;
 b=UeSuT3lkZgBlpWUuHfFjOZIzrPNhOz3R4jH+4OF9Pqj+3vosEAhV3WK808FahA+0fnB1vwkoxFZRu805QMY96SjiG7PFsDSeZWnVwT65ie8C3qN4ywpIMt09XGiHmqXEh1IsH6lAzvCIEkjZe9CZQftjpZisU2PX/Z8Lrf1v2zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10204.jpnprd01.prod.outlook.com
 (2603:1096:400:1db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 23:40:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 23:40:20 +0000
Message-ID: <875xi4axln.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: dt-bindings: audio-graph-card2: reference audio-graph routing property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 May 2025 23:40:20 +0000
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 701b87a3-5db3-4e9a-61ce-08dd92778643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cWCnS1GPHum2ysNMK/ppSeiJdQGqJQIn4ZTi/K2MTxUcy78+TRhXepRIgMx+?=
 =?us-ascii?Q?kP3sUp3aK4qZHmE/qRAqyCZ3TGpqwg7Cy5RaNIOSzo8yQaOrJtJiQW1HshCp?=
 =?us-ascii?Q?xtg/cBnbiE8SvVb55UuXlb5D1p5/RxXkiHl6tGwldKIANua1/rj+8cRqw0yA?=
 =?us-ascii?Q?LPbjOXCZsc8ixDJ7bV9EdyfPCG00aXwd7opNcc2ghIeujz8oRa7Zd/RT6J/f?=
 =?us-ascii?Q?n6qB0iWj4pVlgDAolWBvptlMnfI86vTwKwWKPwgtmBmYN2bbrqXopwli4UC2?=
 =?us-ascii?Q?NCJQOo6lYt4x/RPDtmyQT+zG3WAUHq9HQBVjxGCjbBm0nNJnYea62eXYc48Z?=
 =?us-ascii?Q?gcd0oqjgQJCP5bNllXlp5Q9wxYJWapXrY61AZElli2T2LWVkBMUZbL7FLzzG?=
 =?us-ascii?Q?lig1nZ3R7XXZ7bTfsGWH2vZRS8t4RyinN7xNPl5bWYVdLuzKbGeM+3C1DKvL?=
 =?us-ascii?Q?d/p5ecLmXf2KtlB8dzqg10iAFmYokt7t+n/I/2y+Yxdm9SWPqO24MxSdpzeE?=
 =?us-ascii?Q?otEk64SV8kVR2QUPXEY9Jw9NmIeUKyAajHf3YyUFiPPgg5fSENRg/l1POubL?=
 =?us-ascii?Q?IX7nSvWKv61I3Lh9XT198e0TfHoLo5kU5focy+JC1qECSz6heDxujfqcESXA?=
 =?us-ascii?Q?hTtUpXUQo1ZV2rlaveJhQMzDO5hy0pBMxIzPdgjLv6IGmGZfRh5Zgz1VTP4r?=
 =?us-ascii?Q?gvUdbPF+c2XrROYQazl0iZgH7dnPQxbrk+1eQK7A66AstLjXAPt1PWBSXm7p?=
 =?us-ascii?Q?dtEcwAjTl7ClOucz1LKQg+Ogw8PCcC+SsWGdoYDzi59Mh6DgzI1E5Jv60FDp?=
 =?us-ascii?Q?yAT65GKixzG1jI+3X9qHpS7lbdLzdKJnVa6ZSLckuYG0lLM6qcPsUjTctsCt?=
 =?us-ascii?Q?bEq9I2oh9QcRPR/kT51JkDFvZu260QwDVFJqp8JWU5BKhIVFMvZj/yVYzZH8?=
 =?us-ascii?Q?YvN4O5ItrR4mrSQ0wmKSr8dqwifT85Ph5DrBQRIkkIGtXzIYcS+9iC/z5WVa?=
 =?us-ascii?Q?6/xVpKPM4KgBweztNollmddldnQJxnjUGOmB4gCyACWQ5X4V5YDTZignIHSk?=
 =?us-ascii?Q?LcrgjSjB1ziUnf1k4jzuNf+qj8z9jlA4HU+EXKUWOoXjAFtm1O4a+PkmPRvS?=
 =?us-ascii?Q?0rH1WBW4Te1WsJNz955Wp6AfAVHI6bSL0tjbGp9ypFe8w8n/+xhv3HYbbSkS?=
 =?us-ascii?Q?2vqOesiLIozOtT48kS9un8bif2GN/Bp7K9nYLv5SJJdNVWgQlwH+BoxMzcRV?=
 =?us-ascii?Q?F0157GgBGyUVzihfojWGvXDrQJc9t1mq1lTbY+qQk9yAvkpZ+ST1pUz+6Hmc?=
 =?us-ascii?Q?vnLuOa1Kf2hBResbhnRErRY/MiWckl0jFf0L/C4j4Lh5hw1oD1tKpcF/MiWL?=
 =?us-ascii?Q?4l8b6+iihy6XAl4xpMyPAQal0a0iudbI86Q6HP65O8yMXVaPurMk1Kk9V4LX?=
 =?us-ascii?Q?wuvb+/KxKB59SfKgFbof372d8X0EF86YU8KbILkjTJjWICEbSRU7XQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fE7cn99gQX49F+c2XHi62LxeZTwgZYzvY8jgEMFoJUks3jh+kHILVFf0omIB?=
 =?us-ascii?Q?UuDYln5Fl9KkSLB2ZDLLm6ta/n/t0TyfCpr6WpM8s9Fe/YHq725l86OvNp1V?=
 =?us-ascii?Q?ol0IJTFLgvOLeF7kiX2dyB8qpdprQ9fMhUNSe7WDec7vzhNuGvRc5Gn1ry0D?=
 =?us-ascii?Q?r0iDrNXH1uONfufIKpd9S8KZBYIBjg8PynchT08Ie3lIiZTISjE3ikZwKF3y?=
 =?us-ascii?Q?14MhyT6walorQSTtpcdcA9bJ4fASLEclfheUcm2xwktqlESXoPlHA0JavQmu?=
 =?us-ascii?Q?1f4TwtDZ5FkVKQ8/uyK8yli9lWjjtVPrNiHuPP60a25b36ePyYvXkd3rGuYX?=
 =?us-ascii?Q?swNIQt+uX0p3qbfnnI0D5Ks6EErf686Y97OXA7U5SGMOwtlrtNbdGK35EzXy?=
 =?us-ascii?Q?0mLspUJxo3F50zCxNdb+NTTNLsHJ6TsXkSik5JZ3i8L6DTe99HTfZBKmAUpM?=
 =?us-ascii?Q?l8c63VaCW1SE2bxwD+lzEaEVamA3R0TbVhTOw3+aYv1cLE0xX7chTkcvVeBr?=
 =?us-ascii?Q?4dndcPMwrrbKddl0fdC8T6dq7ew9HD6Kvu6sZb/oIsS+G5nqACRBVyMwppzs?=
 =?us-ascii?Q?As+TwYjjMPwhmKH793HB89zmV16CH42g13CrcpVSauVtSnh7kcmJcVzhjKkt?=
 =?us-ascii?Q?LPNDrgWY4ZjNX2Koe+9epnspY/a8RHf/1lA9kVUenfK52OxzZt2NLp3PPDKt?=
 =?us-ascii?Q?YPAMFG1qybu5VHv2CUK3qaCtWfnBJmePaaKI2SncShiNezZ3oMaorULukLKw?=
 =?us-ascii?Q?fLwuoyf+8uhzl7T+sXM5e8y4mZKVr8nTRt+qPJjyYfN00NeSg9l1uWmDtaLg?=
 =?us-ascii?Q?BRS6EE2KZ0Du1UgaRgpwiQ7jK3dMzgluQUr96tmXyfPTt9f3MTuoFhz5KXSW?=
 =?us-ascii?Q?zdVNayNy51HT6KvogGnQNixAU+Si77tsN2wsPKYFi4O3+e6WA4rWr8XANceF?=
 =?us-ascii?Q?TjL1yKs7/hv8soLofBVAET1H07l+3phpuXfyDa6ZyvXZdVFsTSS16yFXa6Kf?=
 =?us-ascii?Q?kVAXRMF9SyppA+NrZhGWVVJURKe3R0aJ00jXWcGaUv7Te68F780B3Q/ahQTd?=
 =?us-ascii?Q?La16YLi/IpowZeUmhphw/nVhcTCW6mtBE5VOKJ1sgO0OmWWIAXy06ZNYQv87?=
 =?us-ascii?Q?3+R1QV94FtRUi3Xoagj5q40C/qYKu+7vJ3bzdrvtFEJnQPbQHfsBRtjrlK2S?=
 =?us-ascii?Q?tyhKhE22A5BekgUbID84ZGbsZxxpvRMYH7IU+CHHe0hi2ucEmnLVoOJ5Qa98?=
 =?us-ascii?Q?u2hJxgiPVhe13VXEqujwdiccGutr9RIlQ6zhWowX1J06plvhW6eDLxLti8tC?=
 =?us-ascii?Q?KuYd9xVssDVIkzPm2BHuzDSZQkCv5d8o6FQMZGbVhWz023Cx+kJeifTVxIzM?=
 =?us-ascii?Q?FPjItH3Ca3di55mqyRmY4H/jijU8DJ0Xd+C7nzaWCEeFoVCo3kxdjmRp4mPE?=
 =?us-ascii?Q?yv5fTRf0pnsiT+9Y70W5ot7RIZCscTLzNHVEA+4aTiB/83Ic2PWquhGSm4jP?=
 =?us-ascii?Q?cuQJ9DFQ6t0e5eSzcU3ZDp0e+MLjaFSezDZgnBdidawdO8aPKKHmaxu37451?=
 =?us-ascii?Q?COC+5PXMD6MfD60haEkk5rWz6S5sfw/wBHkEfD6V0Hjae2LMunZ7I5dSxqJc?=
 =?us-ascii?Q?U0LummwibY7IaaRiExesFxQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701b87a3-5db3-4e9a-61ce-08dd92778643
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 23:40:20.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKwwL0T+YtFzRD5FCiwvEi//n292AAMs5gPR9wt/pFps8x6TxOCWPM4ScghFNacyDCv4h8mpbFIRK1lbM2Rg3S7aghepA6r4ypBxe1zeRYgt7aHZR1oj3bW+854iWnJd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10204

audio-graph.yaml already has "routing" property, let's reference it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- tidyup git-log
	- tidyup "routing" position

 .../devicetree/bindings/sound/audio-graph-card2.yaml        | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index bbc7513b3206..40eb1d7d6cf1 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -18,11 +18,7 @@ properties:
   label:
     maxItems: 1
   routing:
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the
-      connection's sink, the second being the connection's source.
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    $ref: audio-graph.yaml#/properties/routing
   aux-devs:
     description: |
       List of phandles pointing to auxiliary devices, such
-- 
2.43.0

