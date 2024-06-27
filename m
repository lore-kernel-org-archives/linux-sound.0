Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2077.outbound.protection.outlook.com [40.107.113.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D11758F;
	Thu, 27 Jun 2024 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719460284; cv=fail; b=CcErfOIT0mHo/h5+iEeZ3DhGkRfLilfAEpN/HMUrJAGkEYuFq8jgcPqjVKzX3SR0xWo60q5mHdozuA4W0CUTDpAf5k8moGW4tz6lV/Vy86UAHZpHgHRDpxegU7QwIaPvZP0NaB16SmN++f/YIsnwq7UJu2/pKLiNt4FgYqQ+o/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719460284; c=relaxed/simple;
	bh=axerOqYVvYcE5fX/zn+djY26bnKoBYL1CwD53uq+Gn4=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=WVWI8rpCLWsAU3wDOpKZ8USBDB7MPQJ9/oft1vx+uT6tyUMoKRRhtgApMqDILYOz8XLUrrMgh9Mpop8H1OlfYJhRGBIic9yj9fZCUbPsQYnoMSvB7RJZ8rUQgEgDdvTDfCE+Xnj+O+M6L70hqHxbuEcL5t8u6OCQAileS0kkh5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jg3kbeFf; arc=fail smtp.client-ip=40.107.113.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jg3kbeFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2OgOVMgtM1p22oIriyz61tALMu6ph88VeJtd3JC6TaZ0nEge8Oj4L54kYuqa2Kbq4/mU6tMeYQAipHUkQHXEwPbk3QbtXjhgiVHFqn/E7t8tuwG48t+6lv44TQzTLZ3Uquw867F1HE8t5v6mgzn4CjNgGG1pu/C5YNJbitkrxlg+Cc/RbwY2O9dePTOJdrbZ84eFRZYT/stM/9xLqzINKdTn1eFdccMJSLb+fT9l94NYF4mEKxFas5oe8ZC24ddtGJWUZJL2g2QoOZziv7M45im5duoak9EnfC0Y7N19QAhXGckEAM/o9oNaCeEY+iioFFvTZd934ni4LjmvqJUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ouBg7t/UK1Zowxm6pjkkOfm10v/RnEap4e8YTRBiIo=;
 b=Gb5Kxj5e1a6oTaX9xHu0Z4kwvmWSbwtA1II4UhZCk6DA2+HHtwh22zXIEZyNMlbVV6IVASWWQrmQIIijYGrHwEb2gU0yJ4buk+9koACUj2geCsjkM9jNZKzJ9u5LSnf0g2KM0elEuvMUvN72sgM5ecWQ02DAbCg0yuuH/mNHWrPpOJKCxBex/8LyOmzDVZQFXaidJkN4U0xEmpWn5ePy9kpoXn9xpEJiOZmPjxpg4hdJN5FR6oUFttsNCIjpMSEn1Z6KQqZKl2drC5OovPQBZKKDMPVHr/mcRAQcn/PfdsAjPUC4K+sE5QOgHrPb5iz3pWq2MvGOk+X81AxJfAskMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ouBg7t/UK1Zowxm6pjkkOfm10v/RnEap4e8YTRBiIo=;
 b=jg3kbeFfDGVONtfD/8NQIkFk63XJOrXD/uHYsx2Mysc0RoCvoEONB69Qcyw+2dMV9HTXLY8VUPAyesBiCm8DpEgSnv1J28zPXzvVQ319HpfVVfP0MEwB5WHtHc2NHSCFpSmC/dA+VQrdVN8JtEiKC/H8z9AicNIQsmtMnkW3FLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5914.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 03:51:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 03:51:18 +0000
Message-ID: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: simple-audio-mux: add mux-name
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 03:51:18 +0000
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc87df4-5af2-4068-c06f-08dc965c66d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kyIdzaHkFXnzsmMRPhhYOXZZtNEYE0mFQn7LEezmTUzVkOGSwvNMkJ1SxMXT?=
 =?us-ascii?Q?176/tRH3mUPLxb0H0Hv0z79JshLTdDGIUOA4wurp0WmtLnE3j7kMh0pUhYRl?=
 =?us-ascii?Q?FsOhccJ0DSASDZVPPJ1+nxAfeKkFZ0EAIK7UaJqxwFfbFMaF+mzR11sLB+X1?=
 =?us-ascii?Q?VwBiI7wsnS/hm0tel3WGGTLwFQKAerheWTBysFGJLKtIKc79J0pDWd2qbuYX?=
 =?us-ascii?Q?Tl9/cLsGLy+sTXJhG16G13GsCC70ZmjcfvFqeAJxsxtqsJlwkKISY3hsGd1n?=
 =?us-ascii?Q?X2vGmtjwUnK55CG5FXauJmviGJuRm4WB8K6MD26Uedsf9QYvXPB2VBwd2StB?=
 =?us-ascii?Q?zGBvyCXSMSTOtUMqyHFCjHbSEpSUvDV71nsgjG9Lu0FJM8DFCrqGB1ZtBQxu?=
 =?us-ascii?Q?iT/masAgemGfxTQh063AWNVOV2Hw1lNtJbSsxw5qCX5GBCTPqMAa1RFYC/NX?=
 =?us-ascii?Q?GWe7YP0BgnHTw0uLnmtnSZmxfF6vIW5nEHGNJqnN1Tj4afzMN6+xbPZDxB/1?=
 =?us-ascii?Q?MX6BntsXnmzcJcp2/CVhhvExfQgLJetUeUaHWXAHtYR+IYDOMNLlMKyZdGpB?=
 =?us-ascii?Q?Oq4XubPrX6ssTYrDM/MDxfE75QvtVYVR/H8tBdKIGOh+wVwqrCjRZnxMxNmd?=
 =?us-ascii?Q?GAtUZz3n9Jsl3bxXEQxFKQT7okOgRViCg1TGJcOn3DMIM8el7GkfQBHxn4Ef?=
 =?us-ascii?Q?X9u+O4fx93sQbQ4/xR4DBZdRI+h0PWYD2VQlFqFR+Jj7eHIbSKVnUVrExdyJ?=
 =?us-ascii?Q?yBX/At3D5p6xdM5XTgo9kC/DHp+jPzBytWOTYH2kDuE5LAnagGDb83QqHlOs?=
 =?us-ascii?Q?m8eXoVu/R27FHSeztlRvERJm9Otxd5TuOwLIvaRuVslYRMQvB/S0AyZLhcyv?=
 =?us-ascii?Q?S/eAdc+g0EqYTC/2SCUWrb0NHWp2OsxcdSehuSqMCVj1ZuOqRh6JL2D+HpRC?=
 =?us-ascii?Q?CnZrTR7TYrlWtwbFm1aCvKzFaQn4iXGaQBI1YOAWI3gKW0NLU+/3zBx3zkUX?=
 =?us-ascii?Q?q5pIregwKun/FFeKfy8jI4cvIf7bcjKhcgSCEItRJDbVC8d2LHANYDZevfLQ?=
 =?us-ascii?Q?Dr84pmVMA29XorTnaqBIZj87rQklhHHkI2codwLA7sYylD773gTGs11AJaJ6?=
 =?us-ascii?Q?+PjZoSWU4lMnVs7qoO9Sn/Se2e52q+ZT/19hHViKNMZ/+88/cBFWv6JAeOtk?=
 =?us-ascii?Q?aZHWkRgGHb4OBlOVJwdV9EM5yJdRlA2HuETQk9br5PXssoTiPR01+VO549/2?=
 =?us-ascii?Q?BRzJjQFpHwlZ6b8L+dEHnIjYBr1EBS48rj3chOwbtogtztC8hKw/SegZdzW7?=
 =?us-ascii?Q?V3VMghNTAp7F33hUjOTp7CGH/Dr4Y0sYzzz1d+rJzkQ/9kG93DFZKyfINL9N?=
 =?us-ascii?Q?sgPFV4jXDCQqi7TBg6jzFzzyh25XfmsIko1aEc6WaFZPrdkjCrU2fR2MMvqq?=
 =?us-ascii?Q?IyOJeC6ceE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dOzx4jc9QIXzbWAT6g3hoAS7NRfD/V751QqzsWDUi19Kx0/u19BYLQJhRqUu?=
 =?us-ascii?Q?6AELJ+9rq97HBA4jLL7LErHSoKFUhoUSTtwfoxhcfsibS16aA00YiA9GAbcj?=
 =?us-ascii?Q?jbXXaPQGqXwCed7nQdqrokZq+wQl+BUAY/1yiAgw9gDMk+HAiKaQZIMOp14X?=
 =?us-ascii?Q?GigMTiFdfHB38iDBVa/6rZwUUcbb5WyS9xmHcBDlp0vBM9lR33iTsVJGzB3P?=
 =?us-ascii?Q?bDzYA/8p5t5k2sdN4CHI+bM9cqXXlhlGySxfgHL+3jtDoLpOQPuxLKTxsidZ?=
 =?us-ascii?Q?DCba2uqQXNobY4QHcEC+PITBmS1WiGQp1ZXj9i+VFOgEIeyRN0Sxbx7SM59s?=
 =?us-ascii?Q?+xaZeVOxkGfE6FLZ/VllE0S00rJqWKvMrWEQx+brcwi7iV/8TiKv4y5YDnS4?=
 =?us-ascii?Q?OdxX7iuC5iifUEMfwPuhsvWrPpc2aC2Ia0rCSWD1i4M/8ppu6+snBFQOrmrU?=
 =?us-ascii?Q?N4fnjnBooNh5nw+UYGe+2ULjxQm8KSYVcIvhTeQZDndHQ0/tISeo9GqObm8T?=
 =?us-ascii?Q?cEzOv3wEs9lK6cK5db4SAREbRk+lif8FWBC1DdcVWjSnqNGkX9mChYhQ7BG+?=
 =?us-ascii?Q?2bp7cfGeXezg4l0UjACap1D9AVin7TerZ/YULllvFCA1iPNgBcTrONg+MulR?=
 =?us-ascii?Q?zaw58GUq7YBgWLCp3XukFJUxuYbqiTYljlfuTGzOG8MZ9WWTzzvyYhECXPLO?=
 =?us-ascii?Q?nNObtyUs3tDHxc950uxGdww/57PVhueA785rA06T4eWfdwIU5t8kW+y7K74S?=
 =?us-ascii?Q?GRwH2Fjc0fv/FZ+NlKmlScOE5ExBc0YQUPphcyTh9aHrrGX5rvL/U30CzR+c?=
 =?us-ascii?Q?vtr+0rpZJw81GlU0erqbkb2E0BR+nxU6FUzG8UHLjKO+BayDJ3grbvYqL0/X?=
 =?us-ascii?Q?ylhLecUvmN9K3uUvyh+e5WmFaCi5WBBL4HO8yZBiUs104cVJH7L80sy+CIE4?=
 =?us-ascii?Q?nfH3zoDMfoOb4cYsuIG3FFZUX9vMNYiZyOzzyDzzfDQeqQIV3De2L+bPgBmK?=
 =?us-ascii?Q?bHN6AfMKwlQz39NMt6rFGBRMDX21FVWoPUS1yJOhftKeCzY7x6kCaBsrLsvn?=
 =?us-ascii?Q?HxhcEM/GT+iJhXied5lTTh8TNGdNfRn7fN6awTp0B5ropYYJx2s1/PEuAakx?=
 =?us-ascii?Q?L3jSHjpC+MNUZ6WoucRT2ZJ6f/YQpBuDG0aIf3STPuBYSCe++OE+PxsYbZlm?=
 =?us-ascii?Q?TudrOUTBaJ4k2SdU9YCgLCPQEBeWo7zunDxQUhxGsW8eWEvWiU9i0xcq1BTN?=
 =?us-ascii?Q?EE69j+tAhrmfOMaDS2lP28szG2a+9+O8e4jhU+f0S626ma5phxjfQMMfVCyK?=
 =?us-ascii?Q?Vbs1bbpZmtYPWM2uFnK9KODNwuedsTQAX+SujGQkpuT7HauS8mEdEJzncoHK?=
 =?us-ascii?Q?bC2/w575xsluGzqJ2KyzZUYL3e/KUF/RBFBmBKkODdsXKrvFudVZPgwK83pN?=
 =?us-ascii?Q?c2BRvcYw4WNVImY+6fPH3Fj0EIGlezKhKgTz8xxqh/gzlKDhi+ZApqZGGEpS?=
 =?us-ascii?Q?KS6tyKdDRosSmu7B6xFdeKgQH6Rc87K8YUVghYwWIH/hfkV6n54/aRlNF4JT?=
 =?us-ascii?Q?b7jhCWDfi7GZRflEaYRBWPz6GX+q3YTpF6fDdKwa5EGVcxA3kzElxOOOemZ7?=
 =?us-ascii?Q?WrTJKXKDKNnQqzl6qsh4ygE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc87df4-5af2-4068-c06f-08dc965c66d5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 03:51:18.7422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUMBFiHHAShFGB6DceFiYlrrFnYOwN6vpDB0hr5wW49Xv7JKm0eOAMLbZj/5HE4Ag45h0BQnEo24l/uYzXMuIubwWU8QsBOLSFPjyD47OctsN5gkIO1qTIn+TgsAPQyc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5914


Hi Mark

Current simple-audio-mux selects MUX by "Input 1" or "Input 2",
but it is not user friendly. This patch adds new "mux-names" property
and enable to select MUX by own names, like below.

Original
	> amixer set "MUX" "Input 1"
	> amixer set "MUX" "Input 2"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
=>		mux-names = "Device_A", "Device_B";
	};

	> amixer set "MUX" "Device_A"
	> amixer set "MUX" "Device_B"

Kuninori Morimoto (2):
  ASoC: simple-audio-mux: enable to select MUX names
  ASoC: dt-bindings: simple-audio-mux: add mux-names property

 .../bindings/sound/simple-audio-mux.yaml      |  4 ++
 sound/soc/codecs/simple-mux.c                 | 55 ++++++++++++++-----
 2 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.43.0

