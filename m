Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD871CA84
	for <linux-sound@vger.kernel.org>; Fri, 11 Apr 2025 02:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744337074; cv=fail; b=U162vH0MxrEGWrYvYfs1yczSpiltyNyPisIrlbP3tWUThcbQ/sIgQES2vxPr0liST5JwkKDkzVO7F4B7LIexhk/MmccDQ3Kb6zweS+jpUE4zveArwFXFmBZ6u9zlA6F6gbujSEYpME3YxFQrjhS0XZwjBtVxtPt+F5Z4VIdw8Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744337074; c=relaxed/simple;
	bh=+te07xq42LBZYKTmpO/MJv88xGVg8fZX0hUQeFyHElg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RV+0tcr+qiGPQMbOmtNAaGUC1W0rfbGCXgFQ7G9Veh0kktct1n3Yo3nvRM5b3m1C9ABcuGFDIUCYUqX1AoX6t3/alKtK7f28yaDZV6i5NsRG/pIECfP96SUDBF04FvzKHTIwQpLUwYuZeShmCJ4ZyRNlde1H/3fd4S/5WrAbZMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HlqlG1+K; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HlqlG1+K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY/xg+re3yMSgYaJCWyS+nSRh7DzuidUckrUWGokhvOZ+dYLDJXzqsEZxq1BR9NczB5X56t3qHJnaFzs0hV4RIFmpe7tlAVUZ+tuwrmOFAy5jQIXWO8Leya8UKLF3V6U+I+rl3hNPPwGuB3YA/YVDrh3TYIDjJ/HNBULvzemj8QJYYvRWh2sVSvGUi5n/+e2bES5eh4r+g/4HW+LJyie/cr0pUSp7c0DAfDCqXbwbeCazQtuDcPnpP3O5nBhMVC8J+tdBYGhbotD/7Wue016WXNtYHFzO5ZshaqbQH/zZV9sT/BjlkbOESSezz7CKgUOta14EgvT1kmvRHeWVo7X4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00LIq34c8vpKh7n8vQAiTUuwIhExdewRB1AQKm+Aw24=;
 b=P734taZfWpwUBTYCWsnw1mY0fcGK3h7Dxt9GmnZtV04IBSoVl6fzz0VBjN7b3EMBqwe2SxiH+JSyfRTKbsCvXcoaF9kFjPu2N0gdtBbtICye2q3FeEjk3tWU9v5BtwWb05cvqdBYyZ0eMNKWjyShs8qnbiCV5AglayKI68+b9/5AjyQ2xQYUHgwp7vFOk59dzG8qtrtWtzoyBV2bK0Ib78N8GJKdRgPMA54+sxUtec5j+PpiHsyG3O6LwQXui6bjdXlm+gzOtzwTCwj7QVnOcmQpgGoAuRGfbImLLUnwmhvS2av8/UXDRyrucd490IVodLaMrJo5m9ds0WXSc0Pfew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00LIq34c8vpKh7n8vQAiTUuwIhExdewRB1AQKm+Aw24=;
 b=HlqlG1+Knh+b9NGVPEXDinNGh5ah00I2cRAY77l6hZa7ugUj3DgCcWxrzGeFbttMRFyYfZaC/prbpWNvCY1DxZ9cvNdO/GEwzm/QNCCMd9HNx67MOARUvNT690SvbHb1XLls/uH/gHRv4avGU9PYHuui7WA0UUNbaug3BMViWps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB16015.jpnprd01.prod.outlook.com
 (2603:1096:405:2d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 02:04:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 02:04:24 +0000
Message-ID: <8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
	Kiseok Jo
	<kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Peter\
 Ujfalusi" <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Vijendar\
 Mukunda" <Vijendar.Mukunda@amd.com>,
	Benjamin Bara
	<benjamin.bara@skidata.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of container_of()
In-Reply-To: <871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
	<87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
	<921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
	<871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Apr 2025 02:04:23 +0000
X-ClientProxiedBy: TYWP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB16015:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c2bc72-2236-4644-0b71-08dd789d2e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zb7qqfea6+ixdiSMby5ixd9EhFldNu9zI1dlyGfkX05Jd5Ka0jFTPJUO2E5?=
 =?us-ascii?Q?Mbqcz1mVRa9bM+a4nvBLT79yKrYqHrdy42oRdmF/1hCtN1zzTHOWEd6cDKqB?=
 =?us-ascii?Q?JqK/ExvVvL48QtuijTzzkAAqYPNRK3hsDJKVfOAP2Nvuu4bMjpKcKYAgUWGr?=
 =?us-ascii?Q?czYaGruH+hKg+7nd0s2ZptfYWH8EII2M/YXg1dErd6OFDT3OagnMXSON+fSD?=
 =?us-ascii?Q?NkxFQ6PMSRAzIGHKZv/gnEQGnNG2VjNrzSO9HMfb3BohN6jJxLsV9W9QMquz?=
 =?us-ascii?Q?ye8ekItZ1U7eMkTS8xdly+pxMtAiRcFz0J+3yy7WvlYSF0o8xfe/G2tcVtlu?=
 =?us-ascii?Q?Z20zCf6/5Qh+g8oWaIrv7WKtuTSh0peTC5JgZJerA4RvheNamcleWKsOJ7TB?=
 =?us-ascii?Q?mIiMay//tRBLYMN0X8UhyQ8oXIDHPySg8iPZmv19F5DMDYjhcfuTXP606jDY?=
 =?us-ascii?Q?14x2Zngm06Q0rIkbYOZgsWYvvNXxlOlP7/yJxULBmoBX4SoNAr8iw66HpkDs?=
 =?us-ascii?Q?BfrqZr+F/CQrPS6TQuF/2CqVrPu9pcW4h8vh8jQ5YsC/jrnwt0aKlqdQd79I?=
 =?us-ascii?Q?lb3U9evMnRZmx+s5HktaPL1b+Ao5aa0JlabYibtUH9yVBrFrljnTFciQRjbG?=
 =?us-ascii?Q?BUBvKCdOmZ2vafQO0kl2cGkMsszicMcDdkW6njGwBl/xej71RGSsJk0vKViH?=
 =?us-ascii?Q?6xJLJ4CPPMczf4A2E4lJci/+AYO3NxrDL2V0QMy+sE9+KT45V+0f/pivhbet?=
 =?us-ascii?Q?xCZNtFs37FvUq4BA16BdtuOuszJaKNsxO8wWC4Ytt9ODIDttWe96l4E4ZY4x?=
 =?us-ascii?Q?iSAjVqul4Qwm1TywIQrtpdQQ8rfz8I6D9SibfywCEviJGDpiNbIsr+h8AtNp?=
 =?us-ascii?Q?x22S3XyKt6rv12fpCsRQw8zlMYABJvd7WAmnBHVke2ighCXz9LdvYCcViNI0?=
 =?us-ascii?Q?BQJtm4gMWyth2IyJ1Ukmv4kfiKfKzShJgd3sKLo9Px+MnMUoLU/EjcmRCHZt?=
 =?us-ascii?Q?+1fEbkggVQzaCZkC3RYbCM8sYsy0POZdyNF5PXq9irSG/mvca7bXoQc6z+qn?=
 =?us-ascii?Q?Ho7ua0UxSCdsCz9gBzfkL/SWTDN8qsN8G+q/23F+I1+rjTfDRCHSGpfSVup3?=
 =?us-ascii?Q?Z6e2SujyM365+ABcP8U/oJEyzM2kkNEX5j/yF4shbvA6YOvG4E60MhrYiNDE?=
 =?us-ascii?Q?GbtnFm8B3Lt9QkUmkXJv8aQOn/w/GdwbRKF9yPkaoYwX9hoya37AEU24rb3P?=
 =?us-ascii?Q?AUhjE9j5mHhfd8x6vjD3wUEfnIzUWGzMVABAe3sXfZfEFvW2ZA83dNkSoQo1?=
 =?us-ascii?Q?OVEj1CH9UpjM1zYA1yktKnVd5OIQPG1ofm3EfcK3CE+cFhkbHihUg0I2F+/p?=
 =?us-ascii?Q?PXV/ow1fBqseVeZ7O3+SHbZEMhqVEIQsGzUDpAS7WDuaHqLGnZZ0QP29WSI3?=
 =?us-ascii?Q?vdu2Gqk2nXgH9/rOBMlNtiNVyN2xN6jyGoOYFFiEnoBd75s3lpQNYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3c9LwySS/D0N1oq5/9l2SX8O0GIC90icUcUCjfiPqQLfWyx3ZvesnhIubPNp?=
 =?us-ascii?Q?OZGSVNQFMeax862SHkyZNC2N7dDwnjya8+pZMtg5G0vRKYfW6PNsociBtn9i?=
 =?us-ascii?Q?EUnVkH6XVp+HRBiICvzudRfSuPHIzpnYUzed9CKUAuMewOw3V2V3g5IuRski?=
 =?us-ascii?Q?v87FO7BmbxOnitg33z7HI4XkicCl1RdutTQKCOl9J1306IhflLJSJ7YrvK/C?=
 =?us-ascii?Q?bRB5zMdZFyA8wK6rbuvEOlGgKKt6nUhYE0lVuGWkYD3YzhPOJisK3l/2zXeX?=
 =?us-ascii?Q?mHM9guMcR3qnNwBGV7fcgO3NkTSPBCuVda9oUhvQ3VvVFXWG+ItvdTUSC0PO?=
 =?us-ascii?Q?T46Q+/gzdHxNun6GwoZ6Zz32PpgMWkpskS2ClXuF2BRsRp7cujhLW68BwFBJ?=
 =?us-ascii?Q?CO3gL2YLuQVJqI2KEYuPDmGL6sLlh6WeLjZ97S8iND5DvEFqjK9TUzemEhhN?=
 =?us-ascii?Q?JdQxHGsHF8ht4+3ZPD9nxcirdfjgAq4dNdtoaqd1p3SYW24/cYMNoTGb0R6K?=
 =?us-ascii?Q?rJvKzaTP6IRfANXREZjGbbmIE71XdsCYhQSTOkQGE13GQ5fd43+hDutuqVjH?=
 =?us-ascii?Q?QyuthFKpMGAOboeuOkiOk+2+Jc0507DU4eBn59kzBIqebCV6rHSVENEgHCUK?=
 =?us-ascii?Q?2XHE89FPI4o2Dw1qcI92maNHv3hVHBCBC4oOaH0KCtjVDzhRib+qnpVygxB6?=
 =?us-ascii?Q?pdmh4HTG1YE9fdaspECRuJru5F2DmB756zPb90JooAv1JdxliD+npAITmwg4?=
 =?us-ascii?Q?LHieimeHVDOG4BHX7M4xXrUywCkLxAeZgRPqV1pQdS9jeyC9AiulcaAr+gCg?=
 =?us-ascii?Q?LztluMNE02A18qC0fQprY2nz55DOtFYyMbwgPDHN4kW2TcwwEd+TnkFkPpS7?=
 =?us-ascii?Q?b9Y3C1grKdiOtjN6m35+Cp3gyh/gztn9iVM0b7tuQ8C0hpd1vUi5nhIzJ7PU?=
 =?us-ascii?Q?RvFckw1/yGxn411XCMRPOp/41XAVm02BTIwu2Cv3yA77EbFoNTJuO9hn38rH?=
 =?us-ascii?Q?jwNAJZaEaPRqrGlYySNViYaoXEM/7rPULgG6UFVf8nJfeLZLw+B6vb/2CKFh?=
 =?us-ascii?Q?sHGnBGYkGz7qz0eXPk0tOq3KvZ14U1bERGVYuzqAO4nr5VUAiwOq1yidw/7c?=
 =?us-ascii?Q?vXJVyZMRMk3R/DPgXjg/nUAgzMzPWvqWbRkKjR+gGH+wGuFDMCszEQLlWzXT?=
 =?us-ascii?Q?vFM49t9Cv5apmpx/MRaqgeYx5yZmHrys8QSOwnjGnifZIXdA/M07hNcKEjZk?=
 =?us-ascii?Q?jjngr6s9kDFOthtEQxDIeSUpZnbAHmQ+mXUdMIzThr6hwmRFfj/OX3/2XP85?=
 =?us-ascii?Q?MvbgdHVYUHK8R0yOK1w5M2SK3IVqDznXw8HMnFK4xRdKNI6/cVGfj+XqU71p?=
 =?us-ascii?Q?sxYKfvzgFXW5jXUIjRo9c5NHqsygzQoxjLMAm41Z1tryMXqoB4LQyOXeOI8P?=
 =?us-ascii?Q?VtNbDYAJKHYJkX2BElnVENwoUGyDHoRnFe3+4p6YjLaXLU7PNStbsf2tiZjz?=
 =?us-ascii?Q?fkvaSRyv7oEpZk1YGkExzxJNcIjldp8/G1m9kWR1wWqO6lWLZQ71nf0aPq/J?=
 =?us-ascii?Q?f/mo3K7IZTp6W8QLDsVzvX3ec4zxqxrGsPmEZFVf8OdnpXotTcJlDxYqh2C9?=
 =?us-ascii?Q?ucHMxlLl/Ta/WIeAqtDIooA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c2bc72-2236-4644-0b71-08dd789d2e76
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 02:04:24.2940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6PDEnSPqNaZxpxD2wDlZM/VNZnqCBZPP0fg+sTlPkdrayxESYUu2AcvzAn+7EnRoCKdVSnqLtnjUFB8kh+BSwYNI4bJZPiBk6OMoEzy/OXvYL66ZigpmdxtmiDJHvMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16015


Hi Cezary, again

> > I'd rather focus on 'struct snd_soc_dapm_context' exclusively. A valid 
> > pointer to this type is required for many functions found in 
> > include/sound/ yet the struct is more of framework-internal entity. 
> > Strict separation between dapm-context "for the framework" from 
> > dapm-context "for the user" would grant better readability benefits.

I have checked each drivers which is using struct snd_soc_dapm_context.
It seems not only framework but many user drivers need to use/access to it.

So separation seems impossible, and dropping wrapper is maybe not good idea.
But I can understand that it will be very longer code :)

	x = dapm->component;
	x = snd_soc_dapm_to_component(dapm);

For me personally, wrapper function/macro is not so bad idea.
It is much safer to use function/macro rather than touching them directly.

Anyway, I will try to keep current patch-set style.
But any comment is very welcome.
Thank you for your help !!

Best regards
---
Kuninori Morimoto
