Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA11D5146
	for <linux-sound@vger.kernel.org>; Wed, 24 Dec 2025 23:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766620343; cv=fail; b=fNypjd3nJtk2Z5LpbFirwRr1W9XH0Hkgc2m29/UgZlotSqUbVdG8E7FPhzEyPbvhFXbtF7E7oSYj6okgjy+ABN/hOJaMLlYuYPGeyNQ/bAVAC9KIgfRMXymUBxnRN7cNgzsavxA+MF7mukcfgPirnvI6TIYv6ABSTgRUX3g3JhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766620343; c=relaxed/simple;
	bh=gyIccNOzViPln/nRSOShTgoewg7VVjiAgdfLb2br9cw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Nu8f3mHO/WusPtFV1CT2vsnm5s35qEJW7TRst7qhrg3TbUJHDcZLgcX4iMRuQVGferDE6K8ZwoLjT9qD389hqw4nB7kiWmDQqneG1m2Vj3+FxBoG/s82NDH1vPa3UYxBKSdnp3bkbdcvFieLZTR41HJABBablhXCngi4+RsAlkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=meOSU4eG; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="meOSU4eG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8OTuRvJos+rRBYk+J4AgyjIVChX7vfj0KK2OemtaNU6w0O4sK5BuE98/8x4j73rVyjbAitYmVPLSwnMlrvo7u3evfhxXAa9uYXnleVWb8tRVtoxpArgXpySJr8bEjaXlG3xBInoRseKzUHVbkRuC7iwG1wSYEkCVMBTc7CuBBpmPqYXz0fpI8SeGdTwCZPTZDUXe2i+Bls/uFbxwiJm3yeLQ7KhTutkoeEgFA33Lp6mHCcrvdn8bJMsiFtwcBRv9x4gG4gbG6VW7dPmQt880NfV6w+PDakl+cEUbZqd1KqQm/W0Mzon0fRPv65iK8a+2GEvOSG7Yuzjt6b8AVNmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyIccNOzViPln/nRSOShTgoewg7VVjiAgdfLb2br9cw=;
 b=k8oZTRepDQpCafFOi9Y+i+sXKJ1a9xac+OhLo1uNLY3eewcyWtXzMuuYqCt28FmoHs8BlpxHSX6P9hC0n2N9C0EgWrdChG5bRnkd5ki0I5O5OdWbldvzdETTQb5jGNb28OqRNPhkNscdzvaz123e8u9xxi58t2E9UWkEHrsRZjo0aA2+Mz+RZdD+ZHo0iGBbKBbrvuXOc0zxdPq9RrVNv7U4nEIK2jO7iZf4rLJzdP9CqwLXpBKh4R6UN48WdltG8AGXB+vvBNtc99mSBCcq65jMkUSNQWbTRXEBQga6zFyo+NLQdXT7nDNvWzXbDOAabu0yjuvhfNdXIFX/5UpgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIccNOzViPln/nRSOShTgoewg7VVjiAgdfLb2br9cw=;
 b=meOSU4eGHO2BdNK/Rct++UZN9V/A9Tyaxfp00GSd5rAr3/XLo5csdTN9grIuBDWsQWb/kFVIUXplf/iG4XVlFG0JiF7NE6TSOKoA6Q0c8s2StlnGDn03XCRVP1EQYKttP4KnGwwCo5tOXeuqgzX6BDazjfflbEMwdxCsptBIhlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS7PR01MB15114.jpnprd01.prod.outlook.com (2603:1096:604:370::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 23:52:16 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 23:52:16 +0000
Message-ID: <87zf77tp3k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: alc5623: tidyup clock inversion in alc5623_set_dai_fmt()
In-Reply-To: <871pkjv49p.wl-kuninori.morimoto.gx@renesas.com>
References: <875x9wvgzi.wl-kuninori.morimoto.gx@renesas.com>
	<aUvPTUs2ESeZao_d@sirena.co.uk>
	<871pkjv49p.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Dec 2025 23:52:16 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS7PR01MB15114:EE_
X-MS-Office365-Filtering-Correlation-Id: 73245483-20e1-4229-1621-08de434777b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oFqz+iIklHqZtXSc2d8bFc+cck1iXHAc+VZTYhOmwEOMkLCz7z+XkBjkhxV5?=
 =?us-ascii?Q?cqARJMJOwPEOGOBf+6EWfyR6tsPwhASrCEODLO0n5wfJaxInfQgC40UzEnBg?=
 =?us-ascii?Q?2J0X4Lstlo/yMpOcTMFRjYgkle/ZKGlaNGsJxGS8fBfdHxfMupLcCIRXWKiy?=
 =?us-ascii?Q?VIfm3sTZdpBSGo5JptgF3M2Jz/jTBsbURjtzMP8/lUM4KU4w0q73mm3PQx/l?=
 =?us-ascii?Q?33DxyX/OJAhmnW+zW7bpqLFu883Ng2CCICFEVDcYhns4cDBUoUYfaJPc1ytz?=
 =?us-ascii?Q?qOrwqhFNU/eTPb4VshcCl4rIww9fV+FR0DksI4Hb2McobEK/RVctcHlOZMpx?=
 =?us-ascii?Q?nRGUPudxZU1qPYWLzc1mxgoTk2XY0sfipGb7mkfh1twkh46kq3L1/NQym4nQ?=
 =?us-ascii?Q?7WySs6nY0HzXvHDo2/9KvFVyJzvhuqxYtur2IyWbnYsKaJNB5zFUiZCG4JMw?=
 =?us-ascii?Q?TBoYWkn/32UlxwKr0rD2nSbhdfQIguQoeFdkVq3UJtTZMSWQdNqQhTWRBjK1?=
 =?us-ascii?Q?WOpiASkjSCVNlL04u84g0KyvUrquj64iT32xxvSdSVk6a0Rk0rb2oBaRWbki?=
 =?us-ascii?Q?VUnHkQGTTQXrVrRtEvR1oIgmEIVrJNn7H3+Z8AT1QRvrxZrU783QOAzia2ig?=
 =?us-ascii?Q?U3VkRe/q/TvgBWrgMSd0QtZ6biJ/SMTc3+Zb8/MZJcX8GplRLnEJoGAz4qyz?=
 =?us-ascii?Q?pZ/er4GxRrOGD5KD/wZwHlKM86/IWN6u7strjXEihCFeMAGjxCkK+s5eu2z9?=
 =?us-ascii?Q?5T7HcBmoTgEfUMbqtg8AXxsrjkayq/7RSaGueAmEIStLB8ZMI9ZaaRBmpkqk?=
 =?us-ascii?Q?WcEAR685wh0yG9CTmbu4VuwaUEwZEbJCihLQAk7c1sXb3V1trk9BdvTh+3S6?=
 =?us-ascii?Q?znEs4+R3kzg5dNlFpaNxPML1tJYPWzUJyikrod42ZlZGV+EH9ftgE2/eUYQh?=
 =?us-ascii?Q?6ME12+2FHmLuNPOJO+YNliKA2biygww3HuP9HKWImQrE7LNk1mdmbyBWNdYt?=
 =?us-ascii?Q?qtPs6V+uwbyGXX127FL45e+8CjvRUxQNjfUb+HDaAn6ib4ynJYBFT4axtPRY?=
 =?us-ascii?Q?vyRRMZqrC1Mu/Z6e7whqmBTQZR9gFPYXzTVoaRI3FbAo2mQyaw6TNgSPdSvP?=
 =?us-ascii?Q?Xsaas0zEun+actTaVj/AIXbTNh6QF8TiPTsk7jyINxEIBUoDHVoUStU62TIR?=
 =?us-ascii?Q?wrOpiO5MiVt/t/brEvFJ3Wu1aOojfXFPCHVfWQCCLz3wL06VYxcuVVK4+0Gb?=
 =?us-ascii?Q?AOy4B7Ap8Mab8se70bV2N4hKUfsETkVefxV9/z7ScQUSw3mZ3/JMghcI57qE?=
 =?us-ascii?Q?9j7ucGuiW4hvtVfiXVEXqmtJhtnKP6Ospu0jyjCjCpxfvgggo0tl9LK8lN1l?=
 =?us-ascii?Q?UawpUXe07Q+rpVIxVEZKNgKyKi6ta4HKy+yHX3uMMcfzCHMDQjVPylatR7ii?=
 =?us-ascii?Q?oEA58buUOnB28m/o8lIAdTN0MPepl2H1nQkAYQDqZYLy3WEFFBAJjUhzHto6?=
 =?us-ascii?Q?+VNBQbUrdhLSShtw5kiJ1OH3DqXpDW3vftqC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iv8HSheKgB6QygkF6qXBOtE0fKhHlMm4l6WWDQB+cMLdzlndj4oJET+antCb?=
 =?us-ascii?Q?QjLypNZmnD+VlOIYu5KXz/vramEWuLUWfjoxZ6+LNYloOsHYaWsQwRR6HZxt?=
 =?us-ascii?Q?/dP84W5w7GeT2oG5av1SNXCJV1yXoVNFJqu62kFXcL4ztI6Gg2WCW3613K8V?=
 =?us-ascii?Q?H0icfQxgA8Y60he2MuS0fB624I5097DvRhtF2GE+HD+ZXHxpKfRMOR3gvsCR?=
 =?us-ascii?Q?sFEzoDH190RWSvkSE5rO5brpu6rUC46URN/fyI9vBH2LadhxyzU4u28bmWwd?=
 =?us-ascii?Q?aXziFC2G0HdikAs39n0E7Ote5k0ZpqFtORzUFbH1qPkx0rcxMZKk4AjIPAJb?=
 =?us-ascii?Q?IYSI57R9LnnoOuoZEjY190rqZNR3sWrUNJvAUoXaBtM2oEpTAwWXXiwA6JO+?=
 =?us-ascii?Q?swbxc6lusiVOcPchKzuvNwzQG5QQQRUXWqPI50JF8JcMSgqyngQv94SZVKiH?=
 =?us-ascii?Q?c9IIfkOnI9gow5EkIw+njA0Rd9RdUtCtUNvNCQIsK95g743MUMp4JxSViaFz?=
 =?us-ascii?Q?Zy4ZdiropnhYUrPsOyXt2ed4OFx+AKy2sXwD8q07y7kmPYwKbuiLTh/3jf5T?=
 =?us-ascii?Q?9M5O3dLLkjiNcRDUPHeigZWnnHuzwXRkiqZ3s3qJBuQDDrHoP0Pcnd2NC1s2?=
 =?us-ascii?Q?Me7OPnWRT94aCcLT62pCes+fVG2t8RfC/A6uHTxXzhASwuxl8e78ooTBpsBj?=
 =?us-ascii?Q?T9+KObqY/YGECM2pV0LZwGytarwMyqByMnyKcJcFMadXofhsIc3kd6adBAlq?=
 =?us-ascii?Q?eeebBlpB98dWjqwhWFTqUKtv/lxe3Sk8R7ukui/5zzYErN79akJRyWQnwhSL?=
 =?us-ascii?Q?gNz8Y7agT3PhhkWz4cbke4kerHOa44BiKRw+7zWMz8ISdwYlVKiEnz74x+p5?=
 =?us-ascii?Q?z0mYg6DPy8VrMwxgT/Z7JJOyKLVxDqBaTwR7fP1vdvpBL8TuHhqA6uwbZW6l?=
 =?us-ascii?Q?TkbxmYjtwI1VLPYiBXvjEs0Z4EuQPOFJKwkoAT26sxQvsOoqISRTiGCyCJdz?=
 =?us-ascii?Q?LCqxLr4K1zyHICRoSgoIcCUQoGM999RKC+P5EQ+RBwCbxxCfqdQZ4JgkUeqz?=
 =?us-ascii?Q?i9yCf9xM4OLziolgcPrMr+aQpbFRXM5wUMzDhbLzJsySVsgQROdpjmwZ3FnX?=
 =?us-ascii?Q?iaca58XVI3jrKLWCNjgj1tc/96GX39fZA2T1rkNSK7Ik5m1BppBMgE8RX467?=
 =?us-ascii?Q?UKtrdhWKTQj7FrsDxjXlvEpY5z3uSOrUmHU665PH5l9CpYg8qLH56KmC7bPi?=
 =?us-ascii?Q?B7PREJ6gu08/XjnbNnELxM4taAPQ/lLySrCEIczV9dnIM62THpUboXOF4tlb?=
 =?us-ascii?Q?4PTDpSrY3W9DT99DMJV2FEPprCiZZSBpUKE5wsdZVyZ7cHcZqRixcCLNH6US?=
 =?us-ascii?Q?uC+vvSgZkvpedSqAAXI4qw1yJ1f2MfrKQQKvp9hhJJpqg2S/B8GmNdDcXej0?=
 =?us-ascii?Q?A5zUJAj3QcFAUFBqgHu3xy/wSMVaP60xNO9taQLTRyewqXqTOSKYDj5BDCfs?=
 =?us-ascii?Q?di9897raCnj6XAqPxQ2FeDAGORqs7as94cJC+/PmNxmqx7HBEJra8shf2QZV?=
 =?us-ascii?Q?fUR+cP3LsxVjRu9Figff+NSWoUZq/s4kSPunyka5Q1LPX4qH5HK7uWqArWXz?=
 =?us-ascii?Q?vzRhpyrjcQVFH3t3vqoFIFQaXDPbxPb4DDBCxkD5UEV+VVHe4BunvDWgkUqI?=
 =?us-ascii?Q?ncEIY415lPYyKB6NWjl/Qu8YJXD34Thyg9ZaKdpzzzlZovCBoPBLmiNMPi1/?=
 =?us-ascii?Q?d2ogInb3Mn85EBECSuAw49hf2fPp6ae29S6iPV+5Ry84oGNYiv1Y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73245483-20e1-4229-1621-08de434777b0
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 23:52:16.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ/E0B9Ln5WEcQiPKvzpWJsL32F3dGlgPjdZgEFS0w9EEzKYXlQqQRwX5RCZ2kWlCBpgzIS03F7mIun24hp6hU20trXGTZY8wWEuP7xjPn96XH4yCmj+VZDouyvyw+ma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15114


Hi Mark

> the _IF cases should just be removed.
(snip)
> Do you mean remove _NB_* ?

Oops, this is wrong. Ignore it.

> Looking at this I think the issue is that the device only supports
> inverted bitclock but has no control for the frame polarity
(snip)
> It will be hit to "default" (= return -EINVAL) if we remove the case,
> but am I misunderstanding ?

It will change the behavior, but maybe no problem in reality.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
