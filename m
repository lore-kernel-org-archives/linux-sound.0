Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA918DF60
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533600; cv=fail; b=jxepKjayDUUlCB1pkN48489f+iYV+PC/DyAbz5e04xKJTl4p2VcmK9XjJs7Qmux6lkQAO4zfBl2e+IdTEuVZ75zmXtS6uOWSR3oZ7Srmrf54R1gxz/wv7X4MZZp4y6PjmAKJ05aq7qKH6ct0WeYEuRxUFEt4rXQO19WvGHNCz+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533600; c=relaxed/simple;
	bh=I8JdEvElS5NNPhqBLC2ukgV1HalpTWiE07h+lWN7JzQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Taw4SXFyJ62/NGNZEhbYMEbYjryq5Amv9xXRIfbOcWBH6wQgNaAoM7wIsXsgdcFt3FdPANHGn3eDwaY4finmnPXs52ZJoccTE2b7HhUkHicv8wfKsoGIkIaOxrC6FzLY2u9ebpMbozQ3tfgAykh9iiza9QuW/lfNoJvuHOLacmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JXLl+t/X; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JXLl+t/X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0EORlXbHf5SXArTjHRXrqIjq0Ds0olQKt6audRRnSwWppR7EQ94BRVb38RpZmCqCdV9L81qKowqIibA6Zp495Dw0qsYj84aQclzRv6CsEyOqwIUDfoSgSYbKZYdbYy9h6ZiVW55k/EL6mJFU8ZL0tk3vIJOiejfTeqMmakZteGVgYnEuJDp8qW0eI6Asjq6b59lE4NiWL0OKM5MhShUkX/r3enwmAvMMrU9V/L77oPNjL8s27jN/wzl48qcqMAdj+97uIVj0ubuhTbq/IeJMXseQuea8sU65AOLKJgNxll7kfcST6Fl24Y966FDGSD/WumrOactid31YQ+8vlLr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksvFrP2LvsR2F9FFYfMzTmu83ri3p5BoGWE7320M53k=;
 b=nltxLqQQLcqxuoaxvV7MkuJ6b+952km/jWrBTPddLYgOMG96cQzc7ZzslCRYk6Xb5czpRqDaOFPbCyCcyEZiCfilIbwmlRGt1VO2l5GTV2c2jMV+QA4xK8Nl+blk7lmvWbO+Srw4Zmhw2JGh+k4UZD2tADb6O4dc49UpV3C7O4CiSYqYSsj2bkvVGhA8VFoJ3qQWYLQPVOF4YrG7qWECAl7lQ7steyUZ3L1tklpIiRH/XmnfTH4cWiQl+86NzWWiILCfZ/xn1+/7sjStFo5qMMSStj7MYeAe5MkA+tWs7XbQVPRgDN7GII1CZixaTnzP+5inoFmfm1KoISwletubLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksvFrP2LvsR2F9FFYfMzTmu83ri3p5BoGWE7320M53k=;
 b=JXLl+t/XlEVQTKb48ry1S/+nvaMsGyYjJoqGseGSgRllCBaxtuL6cM1BAZ/fBEr6+VlW3P+3geCV85lQlbtpmI1KmfHixbb25gkKlUcChSTeqAwrCuAzIdCgsAzthpxm2fZ8GSW9ZMs+lS7S9Gi9petGt2l3mAZzODuTxRMV8I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:33:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:15 +0000
Message-ID: <87h64hebhh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 049/157] ASoC: codec: rt1305: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:15 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c914eee-25f1-4631-7004-08dd56058a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mx6vKMjVy6PH4tBy0y2rY8PerNx0ngA2eCz78EEXvVvJztm20MTvEbP1+TEk?=
 =?us-ascii?Q?sQ12MV1Djjx/1lYb93THtIYrLJGLmBV8Sr/iBIFkvh5+qer3yshxYNr2bFkl?=
 =?us-ascii?Q?GrInNs9Dd4HwjGqKL2/BlTnL9MFHZbRO9WJ7LExmGGo3VDcWiZhUx9rr2sph?=
 =?us-ascii?Q?b2P7ZpVfMzdxOhNLOzR7Kt0RBUcUwYbJd39aQKCcm57UOeee4mjkntqjAnpq?=
 =?us-ascii?Q?3Wwf4Y9WQdhzaEp4rxytEUFxWAVoTGFMZEHh4k3XFXAg2EhZIVsksETHnIqr?=
 =?us-ascii?Q?PqneXLn0IzY4Wnub1Y6yT40TMhRrhoCR/hxD3AUxK6Moe5C6yEgmVN3k9pyz?=
 =?us-ascii?Q?Y85mm9r/yN23ApMC01OKV0Oh8QMOyfI0yKMokyJuCRXkg20LChh+5MQzQ8PW?=
 =?us-ascii?Q?e4RWNOdJ4BueqyQoTNb0h1VmtRCdx66cmqIuHvrTKTTygCuwvPl6Fg4VLTgS?=
 =?us-ascii?Q?X1teGAIzoPrcAfNebx33ReKZ21GBZvEcIuE8m/tXPPKlCH12gIGY94mUkoGX?=
 =?us-ascii?Q?L7oH5rBDmeA8PfJ/PcDNzhtvLPeWk735SkDMdu2sERguEeqhrB4t2nIYFvUP?=
 =?us-ascii?Q?/Gt8e5XFIgOHD84ES26Ix6SznszpatfuZWL1HpuOfYWUG2hAbTWdeokUm/At?=
 =?us-ascii?Q?vvA6eBD0JuJu/GDqyR+R7S+NhZIvGhhj/5Awt26HlcgU/07qErvR2vfFN4In?=
 =?us-ascii?Q?x78L2zPIswRFUTx1uLNMajbTMrud/E8AxTRKMoA7Ah6RkUOdkJvIZTLu7NRc?=
 =?us-ascii?Q?Fv1q0KLu03zscxhylY7xnZvOKkJpYzGg9cNR2CDjCd07CUVnWFKDJ8LbujZG?=
 =?us-ascii?Q?D8EKWsxQrE7vlWkXquRciPFB5em1EFHbcECAuD8lhNmzOOCkUqMla7ajrDxq?=
 =?us-ascii?Q?2woOUJs/Jh3Gp1pgIATef63WQedWyaLVB6gv+yDl2rfzU7IMTel/f1x11GqJ?=
 =?us-ascii?Q?vZkmbSPJNIgorYgRpeOnWnhtOBdQ7CVuRhrOdX7pqyKvPyIyauqWpa+b86n8?=
 =?us-ascii?Q?KkH7cziTDWk+nsthU1XbKampgHoxzo7jVfsojIFV+HowmmEUiz4jWGA4nLOM?=
 =?us-ascii?Q?948pKVjqQTxYbiUdDvqcAh7XXo8CImrktO5C1kXhPh10qoQ4+Rd15+i8U0iO?=
 =?us-ascii?Q?J0sMHYUKfSv3fpQBGERscLBbEl6bEk2LUGnz/k2SxY5i1j363n/M5VRBmC+0?=
 =?us-ascii?Q?jTxiQrjaEUK9P5EG2dnJga+c3649kX7Y58M1i2zngjHFlNk+l4Rur8kB6j8e?=
 =?us-ascii?Q?1HheFzEFyty4QcOEMPeLWjiy2KtlQCmPyIubNq66bBN/wpQaVqyQsBO+nwz/?=
 =?us-ascii?Q?yHqsh37Mw2ly0i6U5ZD4RNHGaKTNefY8bsI3zwK267l+5Je4fL7xcxSr2xzy?=
 =?us-ascii?Q?0K3a6oPqW+O5siD/hFhfDY2FqKHDXRaZb3ak8jwzPZ8wNdUXHO9mwJK1LexC?=
 =?us-ascii?Q?Md2S8934ANzEGHQpqjMKMUZPXlO3u4js?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9bqt8snpxSNsFQ0Hjdi0htdqMc4Fpk7Tj+ZU3wvLp4L94vSCRBX29w/dEUmK?=
 =?us-ascii?Q?JELgmboJztWv1xWznoHH17PpYdYn9RC78HtGpYAcGn5jqUh2EPyQP+9B3HZW?=
 =?us-ascii?Q?lp4DZTL+AqmiTdkFcuUUVVEjK5iv7pjPYjuaQCURvoBbMk0lhR8pAJUk97/O?=
 =?us-ascii?Q?+VXljhhhMaWCgUekQMBL5ZxRiZtS8BnA2CK4Ttnx8zYT7K/q92ah4wQ7VMrF?=
 =?us-ascii?Q?I3op6N8t6OIud2vwI4bMZHSH+aUHQHzO1VB46BZUrbIK+kcyVfSWdNhYCFo2?=
 =?us-ascii?Q?UoApKCgQmooa1GN4DcGAKCnjUsUre7fkkCvvKIBehATTX3Jd4ZQnUbEj+qRW?=
 =?us-ascii?Q?dlhtEsC52luovITYx7kL7sIMjZPKrd/fYMney4eqHNF8VMVR+y9AwzPK7AM0?=
 =?us-ascii?Q?VICt0snXXbN5FpAqLVyRGMRkPKD//hdgOC5L3Jp3S3JzKMirE0jiVqzy4HgA?=
 =?us-ascii?Q?6sysTiUANTK0KNORPXkOja0W/Ib+Li+Rn7NVap86ZK64k4S2JPBtt6WHRsXC?=
 =?us-ascii?Q?1UdZrpjKCiO3GJrlqhQWnN7HyzePDt5mNB6SnJXAPXjjufnGP6uYxTCFKGib?=
 =?us-ascii?Q?kgsUbz2upSLcwpUScjrS19awupJS9v2V6qZiThNn/Nnfx4dF6kQFf9pp+a3T?=
 =?us-ascii?Q?2wxawK1B/CM/3uk5PspvXUemz8JQgqitp3Qv/2qu23nA5Ezb5QcRQavzkd6+?=
 =?us-ascii?Q?rKslMXRxFWdoa4mHU2Lxzcl3z3dpIaP9TF1caJFAXIPAJGXQp+PsXrUbHnJq?=
 =?us-ascii?Q?vWe9A2Z9ImAoC0py9QQDZqS0TJMD43IK7SO++Xmykv76lyhoHfe3cgOAxCxa?=
 =?us-ascii?Q?LUDaSzwsauXsVCg5OnP+n6/Zx4BAC8n/pKUtPTDOkdueeM+jkdGpcXi/mLOz?=
 =?us-ascii?Q?1BhyW0tarEmKZj8gnEy/YTTZdMywyqBcm64Gz76k4B/zOjRiBbqh2z2wMiKM?=
 =?us-ascii?Q?MS+fwuC1deiVi6/UQl7KewDhVLVh03C78wofun3WgQ8jks2wl6At+3n5R5L8?=
 =?us-ascii?Q?LqvcW7RC07yQq8/cgaEdcZPX4z2k2L7rkpCOqme9R3yv0m2IjnV0C0aQQ+JC?=
 =?us-ascii?Q?qxRjayr6TvhdCSAKVsIan5IcyNUzV1kiw9mdaBs6IXuYSr/9W2CNHQhA3fya?=
 =?us-ascii?Q?HYGZSG7GaOctNb8/HtxuIKwezWacJCdAkUIsbHSQ+VnjmRD2JMmzPE+90cAA?=
 =?us-ascii?Q?BxE9V3BrU0I9VGe6EQIO4vcuRJW9GSvJjtjAxS2D4pZk+sVlRXTqTJgHEk3r?=
 =?us-ascii?Q?EdZvKQyX4kNZLUKEKAB2PU94E7dSTJBhe/GR8YJ2XNByN7IObh6zkgbPdO/h?=
 =?us-ascii?Q?D4XtvqOFmBei3wnMTe2xljee3NC/5GZAQpZqg0jj0ecGFDp4ymV/rcaXbEta?=
 =?us-ascii?Q?9pS4eeG2Zb+35XtIQLXmpAtkON3QbTyRlh9cPylDAJWf+gQ8IkxUSPkX4f6z?=
 =?us-ascii?Q?fuOxUHaitsM0/9LAn7Lra2H6i0T47A6IqlQuqqhbPbk+TNY3DlvA7zv0lpxX?=
 =?us-ascii?Q?alF6YOPE4vBnT4XI3WcXqsP7uEdME42j8Bi2rK8XZXBrnmlrSTw+le1qAVvJ?=
 =?us-ascii?Q?ii4a24wsdKzVYDLBt3YWSFLWisT44hyez5meFy5H6IR7DQ8JsVagUjmYUfai?=
 =?us-ascii?Q?S0rzb7ELNHjweR26xbfwHxw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c914eee-25f1-4631-7004-08dd56058a6e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:15.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZLz+XaFZ7Pp1QDFoT65moAshOWvFYSwFJL8lT1Y+yw6LMTPwA5kPtvLUkAYP70FEocuPzkFdDFHnO/8BNYkst/xdqViAigt3PxpbqT3QkvbArf1NH9RK8FyKM7lfULr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1305.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index c2b55be8d165..311a974654ff 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -697,11 +697,11 @@ static int rt1305_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0, reg1_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		reg_val |= RT1305_SEL_I2S_OUT_MODE_M;
 		rt1305->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT1305_SEL_I2S_OUT_MODE_S;
 		rt1305->master = 0;
 		break;
-- 
2.43.0

