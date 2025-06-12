Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F33213C9C4
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692536; cv=fail; b=oNzyQKVctCechEN3ev09yGs1JnPvLrlWtH+/heFQE5a76VDQOvufwZyJQt+n7hrxIwk7+SOkvjImZAeiw6OpEIGZDCckQPHCZnZ8Pbf0FrcBelvQIw0NikwFZY7D0eXQW+Ta7cWg2o3VKz1Ko7B3N6Kl1JJclUNbz4jfGaImfM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692536; c=relaxed/simple;
	bh=5ToofimPWTSwrU9hd342X0Vi/rREho1s1NWWEh5E0f0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c0ec7fq3M2MsiaXr/DWBG8rm8BnpxFrn9r8YdCsqumD6TmuMg3mEGeVJny9kn2J1cnu8cYEYNfJZbri2yvH9btB36BapEQhvIBM6LklcHrDugV1xUhP3BUf8auJup9t+JUEhmNY+Z8CREaMBOC/Hxvf+mxEIlUSAp0cZTljk0tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ibup0kwf; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ibup0kwf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+kAFHYHZNrEZYFzhDYmMkShfJi4VgX8TSKLSspna+rKWe/aie5uVNudtnmnpjtaC0mLvhYgzm/dmlNKeM+gdyu9kDM3T96hvra99tU6mRb5WiUtpcRjND+mohV+30mVgDnj/jyOUxlgyMCsSB38QbaZOncvn99eakwxPCJpkblMJ4+f0Bci1Be1YOmbgvhjzXKFSlW9K8YwzeVzpHoD+M+wHYiPf5tKeTydQ5GC496XHk6m81wgsf1/qvv/QVgGiLXicSN5zZAo0xboyJ7HFeM+z/rXjciE6lfPlykak74W12IpsaxbKC0D35imm031kZslVffiO2tKoaAvvpJTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCErjzHt8UV7rbOZV08LY05mE9U7Rw7XCKEwX4FOKig=;
 b=E7oO9vHAUL7bYVW6v+G+lVvsuQz930/AubibCHw82S85Hr8Bm/Xf4iv3C1Oi+yV0REXazzBJYKvpk+/iGPajzSx0Wu/0go4ipqDBJKDr3NictVVaox/UlqkqYblFt96uc3dxTWaO9ztONNliFqmlL9hYyOvH9/M6+Oio4ssEZ2CL6Z27//WtMkeg50SBHoT5s0VTTRE4WVlcoC/KufRlrfekLZw/rf8+8gnbJcxgjNJq1J0RYmy10dSKfBwUpJ8nhqYf0pWKO7WE9e3QuuIcDl+I3dUWMtzYoojiIUieEUZEN5JVOiONx2YGpkayTsWJy8T0B7UJFP0XEiPBGB6F8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCErjzHt8UV7rbOZV08LY05mE9U7Rw7XCKEwX4FOKig=;
 b=Ibup0kwfUYp0RSnHHiqagos+c9r21Reiwmw0qYjcujQNB2PDuNPiF5nCMvPSC7oP2uHtaaB6T4ZIjUpz8ohHP/VXUmLi2u/G3lBpfJQ2PZFE0MT2FTY1WZCXl7WbHwmn/KlFr238SS3M4dmG/IpZkq9JoZ6qi+VYJ1dhVlNUesE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9937.jpnprd01.prod.outlook.com
 (2603:1096:400:225::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 01:41:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:41:55 +0000
Message-ID: <8734c520t9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/39] ASoC: adi: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-2?Q?=22Martin?=
 =?ISO-8859-2?Q?_Povifff=B9er=22?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,	Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,	Shawn Guo
 <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,	Srinivas Kandagatla
 <srini@kernel.org>,	Heiko Stuebner <heiko@sntech.de>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,	Chen-Yu Tsai
 <wens@csie.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland
 <samuel@sholland.org>,	Thierry Reding <thierry.reding@gmail.com>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,	Michal Simek
 <michal.simek@amd.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Alexander Sverdlin
 <alexander.sverdlin@gmail.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jun 2025 01:41:54 +0000
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5a092e-3555-4ee3-b63e-08dda9525005
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kx3mMuX36BTwOtW4ps6jIcI1VwM5iLkNeDUO8G0MttHuhCVnDDRcSZQ4sxFW?=
 =?us-ascii?Q?NbkrueKz00iDbvVkiFvkjbHl9FxJw0kSLB26tTequr4yNdNbqm0iSZNhYRq5?=
 =?us-ascii?Q?KrsPT4Saj/CBNXFPraDZlnVN/wSuxnfZnsvRb3aOObmbjoCP8RtoxdI77JxC?=
 =?us-ascii?Q?0lPnpWAfGxJV+5y85H0aS3q4tYMYcbGzliwfAGzw2I9gOSlz+PAB8eIeXqfz?=
 =?us-ascii?Q?nkJ4xSvnuqEtrwt7WznFH3ORSXWKa3xIz5f9Si/fDW/1nXwXxgjWhRWmhGko?=
 =?us-ascii?Q?nm6CkixjUAy4M2v4WelwHwa9btKb64Vm30pTSlU1nBm1lXDRPV/fKC4jzCRU?=
 =?us-ascii?Q?hmdfXRXF+/oWYcAQ0DqUG1/49uZcqE1EUjqiXjPM9wAH1qq47oXvmbOuPQhD?=
 =?us-ascii?Q?ZAMCh+vJFdoJhaHKg855zyrZIl1zx/XEdWCs1XUxwC4A2QoJLqPAlHeukRZW?=
 =?us-ascii?Q?c0VQABBK9wA4Mn066kubwnuoNnyYICkgwQlRvPro/fajA3ebVu0qrGTBVvCA?=
 =?us-ascii?Q?NtfMsQINSMy4dw7nVsStc/kS+RpxBwoCNqBylKGDzmd3g35DAD4XbY1Rq9b/?=
 =?us-ascii?Q?nBjhNvCmoPwCh0r06/I8nArzznOYcnFCQrw4s4nZ2VP/9WsblHdJzTxn0KbG?=
 =?us-ascii?Q?2m1y21N7AS3CTtn+JXvt3YQE7vLatoz97NfgIhSr/2g+F0cZfyifufiYKEbO?=
 =?us-ascii?Q?HFUFdBpZT/2FEF9mxnp08tDigCE6CbIPkdP9VvinwD38DltPeNsnP0r/CgcQ?=
 =?us-ascii?Q?4axPGNC+lrdQmzY+X1/CAdJyboHlTfrRLjmpfj8d0+8CXqwNgmIluR3O8S10?=
 =?us-ascii?Q?ieFeB8poAfTDJUgkV3pWTrwFfYppSkntgQ7Bi3ozP0nNPtb2zdC/LsmrzHcs?=
 =?us-ascii?Q?bs43eieMQq/Zvem7NnJEPdyZ02L+kM4DRkn82sxZJbcTtIHB4N+59Otnqe22?=
 =?us-ascii?Q?7pUXOGb4NYCKfKHGyrY0DBy0xWAGc+r35VT4eXYsAx6XriGh97LKPFJCd+XE?=
 =?us-ascii?Q?QdTCRiPp6jsXCQoYZI9lSEKAwfmJUVN60FfwCB2WWTg1e64GZdnrJ3dmDeq4?=
 =?us-ascii?Q?S1xQ4+zkYEevOteAPvA62gs9uUmRtc5bH02g/6Ky30kYnomYKRyqdO9Rya1O?=
 =?us-ascii?Q?n3Q+t2IbhMLJ1Gf+nbHcUJimTxgpULy34QY2v1CnuzNq5pFTby9KIy3T+pOB?=
 =?us-ascii?Q?s0KlZe/skQUm7HTNhWDXYyumbPGIB16Uvyc7F3/sItkKqUGaxogh8lzIHftA?=
 =?us-ascii?Q?er3rUmHOfSSVt/JYKM8+dRWHljntZPl1pBrIEXw6zIamvX64GzkEifrXFfu/?=
 =?us-ascii?Q?xrJsVfU6uXMtvmqspwGsI+Uue4/kcgR4aqa63XMtQO6PAB+KbW3k4AQ209C0?=
 =?us-ascii?Q?2WEBGzXD+3MdPkeEURADho3hjzspvFwsJ2W8vpdD8F+choi8niKB+rvh39PB?=
 =?us-ascii?Q?GhJg8sNFnvpFJbiuIVp/GYks6SgsNnG2aTCRaHiLKApR/o1YeZRxoScFjayu?=
 =?us-ascii?Q?9u5nFijmZB9sYG006gPH6/H9nawxL09o91h5KN91e9QsUuIi/UgvZ0FDUA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L5w13PJnLNJgmnp7jDTyuVHE/MLnn+Va0zq4GY5PElH1TRouC73vUJp4Z7Gr?=
 =?us-ascii?Q?pk4Bzh7xBtYHZ5THGhjh1itGonxzTuHD0qxjb94UbxMrWrGSAnMVWKuSWvU1?=
 =?us-ascii?Q?Ik7mrKKkCMLsDudwrla+VVzJo+iXNSgEpBTO5d5TzpwU4bidKVB46iB0F7k2?=
 =?us-ascii?Q?9uD4TE7uGLpUISzbU+e5TSbizXm02I+vB7D5UjDqTANOmxrnHEY0bmLxTIaC?=
 =?us-ascii?Q?xctS39+ZllQQm7TtnKrossY/dYE+aOZ8CJWZEHlWtJk8+CBshePh6TEotX3V?=
 =?us-ascii?Q?ewFYBbcE3HEYUJ7LrosyIuFrawzI+RFk0OWcD1r67hCzcCSIQrj8kT2qTEvY?=
 =?us-ascii?Q?cxy9mRnvQsyd9gbwVSuyr3tUrx1Ua23UNMTTpJF3luRrmrJZLPvhy9tAjKXx?=
 =?us-ascii?Q?xUt4HHTAAL8BMeBXMdD6gAVRjE2TVkE0cRLh1E6FcmUPmRmZsb33XahrMlCy?=
 =?us-ascii?Q?mLjkBrww3HI/nLwOx6bbbuzc9dEGw4anQ3dimh4GQ2kJHoeHG4TFKQIKqjtY?=
 =?us-ascii?Q?ei8X1LhDjPmn+Mw8Bg6K6Llqz8FHMMKyGu8OrN5D1V/sZACoh1siwkN3rUR9?=
 =?us-ascii?Q?SsMv/vjoM0EGcxDxqUJcJ00e0P56GgpJYv/z/2bdMx+Y77gNShpnMNV452Hq?=
 =?us-ascii?Q?/yqKPGJp9+fUWxozw0w7VxjX4Q/N2FnYyaplpCreOzoRzgElDDvQfOlTil9Z?=
 =?us-ascii?Q?b2symJYhptfpND4l/XrrkPmzftVW0B7NT5/bfspe2pa5scbZDUqa6SIsQQAv?=
 =?us-ascii?Q?RybsxxxlQAgCMcUriyktXfb/E/PZHY66G3MzFx1mfbk3JjqQmBIq9DwcPXj5?=
 =?us-ascii?Q?8fxPxahQqzJgaThgZAmFo1dqU8MNCVY6xqk3a4of9TEy+M9NzpYZJgZHK4Bv?=
 =?us-ascii?Q?+sOrfXeC0OaT5HmaqUYJec9WAU6dgtFGgvggLB/VUFPGtNfM64PWFfXoOqZq?=
 =?us-ascii?Q?NewR1JqLlAJS2YIoG4cSDFsN8BUyr1cxsSNcN1XDVmqQMRExODOZhjGGrFlt?=
 =?us-ascii?Q?y6H+I6UnY0EBKYMue/RWPX840qJaRZ02+F86oub417eHur03hpvbvdl/vlbA?=
 =?us-ascii?Q?L6hlOokWt8AJT2lr+UQLFvAtCL5B/gGnJDEZaWy+n41B16oCP+Ho46Any8Tr?=
 =?us-ascii?Q?MMrrAmh3MtYEiPS1r5rKFUR8QQBIJinmQBiykpGN7X5HWKKdLVnCX91H0RAR?=
 =?us-ascii?Q?CwyNTOTL8nr2ey6edB5bcEq6aLrahp9jrNH0qZg0fsD6bIfIe7ZFCWvhgf9q?=
 =?us-ascii?Q?mcCOe7xRfxjFkFk1NBc03jNum4PjIinppEappiuyD/eb5EHTNuPUoc9mV0Fg?=
 =?us-ascii?Q?GxKELHTHK50aoysQb+aSjqvwI7On2ORrfiA/PDRDBnPoLfjDlg63os6BtiXh?=
 =?us-ascii?Q?364cjkBqIn186wiYv+1Nrh9T1nT2k0m8Ck4f3/Qdzw7VDU5xRBkgR+sDbliG?=
 =?us-ascii?Q?YECOB+5yHbxjdg4JJg/qMsZPV1Hd7HTQ6M8CbR9bObkVPqALAqWA3BZHPXE+?=
 =?us-ascii?Q?MZDaB1u/EXPUcckTHBsv5My6TEDpAR2Hcy7yFgl3S0kjWFCOF+bCCuWcDW2W?=
 =?us-ascii?Q?OEocLuEav+Xh5R3kODzp/i7IIoFtFNKT8ShFCSteqx/0Yyq+k4qi+wwZMhI/?=
 =?us-ascii?Q?G8+PgXftIosxmrQiw3AcohQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5a092e-3555-4ee3-b63e-08dda9525005
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:41:55.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5Tr5cD7MyBsQp9iVAP08v/ttXwkZKwnaSs+oKsGyT1yNs0TB4dHcOUGKtx9u3e2FfEWI40l70D0/YZupQhk7K5TFTDcXR1I76tXTj0jgGtc0/M2wphmo1tRr2lxPJIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/adi/Kconfig | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/adi/Kconfig b/sound/soc/adi/Kconfig
index 0236dc5b4e9f0..d47dffbf40d06 100644
--- a/sound/soc/adi/Kconfig
+++ b/sound/soc/adi/Kconfig
@@ -1,12 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_ADI
-	tristate "Audio support for Analog Devices reference designs"
-	help
-	  Audio support for various reference designs by Analog Devices.
+menu "Analog Devices"
 
 config SND_SOC_ADI_AXI_I2S
 	tristate "AXI-I2S support"
-	depends on SND_SOC_ADI
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select REGMAP_MMIO
 	help
@@ -14,8 +10,9 @@ config SND_SOC_ADI_AXI_I2S
 
 config SND_SOC_ADI_AXI_SPDIF
 	tristate "AXI-SPDIF support"
-	depends on SND_SOC_ADI
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select REGMAP_MMIO
 	help
 	  ASoC driver for the Analog Devices AXI-SPDIF softcore peripheral.
+
+endmenu
-- 
2.43.0

