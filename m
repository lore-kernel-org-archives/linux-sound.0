Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44093815C6
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 02:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625454; cv=fail; b=B48nT5hghJwi9RQTMUxOMKxv1mJ6vbyp0oreizR+ez8zJ7Co623xe3dgRhMQTAoiUtClxFBL5KK0icHu+DhHjE4c2kTRzhAtBsUDgyWXKud4EVqHSEBInSjR5Mg6ITL/MecSOZGzzOwdMd4FbMJYKkHccs4+qNBwdBWm8TZtqR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625454; c=relaxed/simple;
	bh=6zBCw8afWHlMU7s86B4/dHdQI3zFbYs3ZXmO7jlCBbU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R3HkrsHN2Sy/QOSH52o6QeLBY3RAifeDjieMpGuYzaYsa3ZcHoQNpSiiMFuheGaPjVx/1GzEWaX3uvwNPWIGOj0q6YGLB3NfrOh1nDPA6mhyVFLE3qXAJ6Sdyz8c5ixCW+BBQMMoV8vrm3A6ZhjnYc0fswsDxle4kylL503Egr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mAUSoYEr; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mAUSoYEr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evVsxlbMeoorCsUA2bulqGNNtGE3wYR/AVgvDfLQB0QNre0AIIwlm6Hk7CFuoSKNNNilnj8TP4/NAGiH7MMNOMFo+BKU6ETdeRqHcZyI80z6Nv2YpZkSqrdjRYTOVk2x686nVbhH5/1lw0Nr0Yfar52QqNP/UwAXafYg3R3Ga42UXdGGQeCmgHItZpIYMkHZuP1de4EY9q51/QULTAstK0s4zkzhMSUSXStrI6Z17/uFQwiP+TyWGiYhDPf0hUfe/F12nYUBXZRP9W3AZlVrHHZF6aliw05JhpxoyPiP2kxB6n3nFg1YznjiSnUSA+CptTSF1tTRtM0JQ/KvYyq79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGhLE5W6eIGbgNQnMpv2K3PQurcVt7TIyJQ29Z5fXCk=;
 b=eiXgKudacPLAX1fUzkCohW+eyEE/VHx8Z7pcb6CICENDaIDuLNKmegW+WF8fvmqdwZ2VDLjGZqGRlHVKFwpCC1/fNbPtApMnpr2UIOgXMFV34uYms5TddnZo2nUY+mDpEXK+noVUOgOSvWCzz1UDjUvUcdfA3g5gMlFj9iowRtznf3dI+wk9T0GgnVeEAWM5cMjP3xLLYUjRqYqNE1SF9pjC+kj/g2OUL9HwsCtt7DQVX94Z6MLA3JXgsSK/UlBPPyRAIF6iBm2yxU1TDH81zrXRvSoUyX0Jc8nE24L4oQD+f8ofEmryj39FLDagsyz8dXUBZaVRK9g7SpEogun9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGhLE5W6eIGbgNQnMpv2K3PQurcVt7TIyJQ29Z5fXCk=;
 b=mAUSoYErciyW7hNRIewcnp0UHXn4w23qc8x1ko40/SfhazjwAZha6shrFzmqSmN1nwzSr7WsTHZvE44M5BoG0X31nr2wMQ4QX7s97tmSRkZdeFtiefiHWAh9tuDYCdtSGS4mMPJFxP/bk59UOd3CE1tFEN9jBKND1LUsII34jRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY1PR01MB10899.jpnprd01.prod.outlook.com (2603:1096:400:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 02:10:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 02:10:41 +0000
Message-ID: <87ldctu47y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>
Subject: Re: Question about Intel skl_hda_dsp_generic.c
In-Reply-To: <c73fa4af-2b70-4798-8041-9237466e92e6@linux.intel.com>
References: <87qzmm4wxj.wl-kuninori.morimoto.gx@renesas.com>
	<c73fa4af-2b70-4798-8041-9237466e92e6@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Jun 2026 02:10:41 +0000
X-ClientProxiedBy: TYCP286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY1PR01MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2c8e66-2b6a-4740-320a-08dec2a7a4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|6133799003|18002099003|22082099003|38350700014|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lY/EoqwJ7SUhavi3o1OunDWZ6h2QchhNMOUCwlTXNWtyG92qS4F97H2sIbTzZi7AyRw4IJIvYUHmqJyaBtFbfbQDsc5VFJvMqH39bINSMolOB2q54dNhFHVMh+d5naLAmjZjVsIOIVESXy+vgSTslUPyHHE1MbxbnJbWM5676G9SlR8gEXw2rNnLVxtS7xpQ3IE5N2Mn4lRI1ukfn1AgRImep4eD2pIFNC9aeDK4ElYsw3hBxBG6ZYOWw1a1yc96vEx+3ZUHP/H4h70RKLHymbl8Ap108u2ZGlKGQdMu+1Hb0ZucOsimXI9ArWuiq3wDDnJ2TfkRg7RvffN53swGGcdgKEzY9qGm4tiTFDUrOqT4uH/G27FjFwoCpDcuoOsGCWDc4X7zdkgJ7XrBa3aEkSZT4yH4TZccTl3LPVagDnBGKA9+btnrLYv61lWDNNSfkxUhUjrja14aoxHo583dPP4SnElhwT/WZ1rL++5o6DNcJKTJLUTDhQW4qs95W9TyOCZlaORzLz7xRxwoEGet3dVWf/CVxcp4+SCZZkZNYS766v2qlhSCKdaVl3iWsUYFPcZ0woPD4AB8IIARk7umj0LB2fD8wI3h7/i5G93XO/IOEOMBtO2LuffiJ4U3+4lscy9tDUK4S/GNyWcDnj3LX0igBBE2LeDtJlP1UuU5PGKxpNVUGrFI09whZ8ZoXYSurLEEpmboEoTuuW8QOmXIplfPR/QDD6KA7Dz85xUWQ53XwZ7G2fn4UFA7YXCwJ8/W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(6133799003)(18002099003)(22082099003)(38350700014)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?NvUDl7fW4+154QFtB/OUPTFC5UahEK25zAFTr7BcSVylXvUafAwHyDDW1y?=
 =?iso-8859-1?Q?FRDcB5A9fXav6l77YNeXMPaRBuOVXfAB2KfAxAxfzeiL2fdhPJ/5JS+gCv?=
 =?iso-8859-1?Q?ndn3q6BccWEjaL/VsbNbvpwa3exAcqOIFgBR3OIOqTHFRaAmkQUZQS15gN?=
 =?iso-8859-1?Q?Uy5w0qcBMhcIVpWM6M4+VcQyL6Z4zE3BhQE9/6UYYKhEctX+0DWVlYe9rP?=
 =?iso-8859-1?Q?gRIUDP+ycotj4Z1j2mly0idEsXIOwl7xdwHFG8WVXlszBDnckC0MM2L1rW?=
 =?iso-8859-1?Q?+Wr9J7ArMW1ZHeInrpXinmLOTgeaMcXV8C95H2mclIDlGcRhJtLwRo/QvP?=
 =?iso-8859-1?Q?NNYRphM8Ju97Jf7JlU65fyVxD76Cxorh+iVyX7jM40zj9XJQzqBaN8bg1y?=
 =?iso-8859-1?Q?3zbkoaPMpEn0LrBOZq7q+hDbqiDy/ll2/35eSh639lxJVfdACvswF9xPbv?=
 =?iso-8859-1?Q?+6IuYgITX9ChSK+ROONSEGhT/0JqEgvq1cXbMXPJzBw1iVXa58c6c3EPHN?=
 =?iso-8859-1?Q?B/71HZbWY9nIKnRLoIuNd/okufCdrWdi4Y3IGGjEkkqnUV4vLfk4eKTR+s?=
 =?iso-8859-1?Q?6BGd4rWwb9ZvRDoQQlPVu/RsFktaGv5ocekvTVD8wx4rZcCLKpQRlLWCmC?=
 =?iso-8859-1?Q?3tNQunzbdhltGQAI+Lf33e3FpZX3c6+F6+l8PX/BsN+UAVOn9egStdjRFd?=
 =?iso-8859-1?Q?3YNfS9SbFa/RgSAokLmbw7vGItzA4U/hfQOtVaMs64zVXJ7pP4G2C7AGWI?=
 =?iso-8859-1?Q?12RGeZoje7CZSM/LAE+LdQt3q63MFfEHLIw3Y1bAhgH4oZ/SZJbvcm5u3R?=
 =?iso-8859-1?Q?vqV44dhhab7OPzjdQNO9D+IszkUSxKOpmtCMBV6vgrJpLynz6tnnEX8idy?=
 =?iso-8859-1?Q?AdTrdQ+u3L7aSe8U8SXyEGp+e5UMZUz8DyGkkrPpy4ruVDEINYCNCZA1Jo?=
 =?iso-8859-1?Q?40muA0hkEo0Lmjt8DmsydWh0zIgSrYtwYuiGivpUxmT1C443bCuXGsCTFj?=
 =?iso-8859-1?Q?RcpC3aEkWcWyWeT3/j9HRMZ9M0nWi2JeGHVmRkLIGWzwXv7yszdfyy1R3Q?=
 =?iso-8859-1?Q?k3CCAau0dn3YrYWWsKg1M96GhF42gQYBXJb3sN+m2J/RD2Ya01S7OySfuj?=
 =?iso-8859-1?Q?QSX0K2JqBIQo0TjDllEmKctBAPUrkgQ88Wi1TimMZ0Uccd5wdAXUuQeX/D?=
 =?iso-8859-1?Q?V/vidX6Wg20u26QjICNHXVshuKg4o574jSkb79twnBYuD3/2HnLBUoWBo5?=
 =?iso-8859-1?Q?CgqUJnQWxP+gqDNpl/seYLejTnKB8htfAC2sBnDDOvnz/LxW7xVw0Tda7V?=
 =?iso-8859-1?Q?40DvvoKy4iKb4ELPLIHY1Pi/9zB5I2PjAve0ieUQkiS2236ruoA2ulv+nQ?=
 =?iso-8859-1?Q?yzGPenXFBsOPIq1oZf/q1iJcuMuNr8L/HX96EnxIlSGNiLvx2/VZTNWgeU?=
 =?iso-8859-1?Q?zpT4gQSiyJX4M+kAMLXtwU6OhDY4DnM3zJ9uFQFAtZ8IX+utOc5ZMY9R5/?=
 =?iso-8859-1?Q?hZBuJ3Ks8GKEVwcJ0AAXvbED+mY3+aPdWZo6wBlpKRFaA5616Q8tNYmI3e?=
 =?iso-8859-1?Q?AoTHrYN2PswvX+7lAjrgmpaRYRyBxLJc8+viYjBOUej7SCmnDMyXTo3Km3?=
 =?iso-8859-1?Q?8TKIjxcoPbpVmtD5SWyu40dSX44mwuOU2ocNsZZvTy+SJOopC4+Zw+iob0?=
 =?iso-8859-1?Q?A9g4K+6NOGyVPKuaLjoZa0sSGwRfSNqp1lsaqNIkGp1JkL2kBlQckNyS7L?=
 =?iso-8859-1?Q?GIalRw1Z9JwBYVB+tTwhuF2V3DM5odf284dn+9OrHzyX57pKmzwmYv2JzK?=
 =?iso-8859-1?Q?4rRyzyfEbx3bv0C3oaTgFCRmDGaz81M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2c8e66-2b6a-4740-320a-08dec2a7a4d5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 02:10:41.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lk3RKKjKq+BY59XdZh7qyZZ1vD7aiU9teHEZxc23iZzBs55RtJ7vur+ziqn/3BQAXy5z1A5F01XvFvKZgmTkflVu9zefhy0bgz0+xcrXkBQnwLR7fY9mBmDYMcEzXS2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10899


Hi P=E9ter


> > 		if (!ret)
> > (B)			skl_set_hda_codec_autosuspend_delay(card);
(snip)
> > But, in case of Card register fails, I think Card doesn't have rtd.
> > Is this really needed operation ?
(snip)
> And actually it executes the skl_set_hda_codec_autosuspend_delay() if
> the devm_snd_soc_register_card() returned with success, so this is doing
> actually valid and correct thing, no?

Ooops, yes indeed.
Sorry for my noise, I was confused

Thank you for your help !!

Best regards
---
Kuninori Morimoto
