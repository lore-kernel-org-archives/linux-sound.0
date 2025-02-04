Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633DF2040B5
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738713013; cv=fail; b=SVqL3JZPBVa+ryqhKS48XERCHK3eW3JOtmi2NBoIHgJ7pt+CAg61k9jLW1CVLESOKO071RTSK3/rfzOR70ki0rD+75OzK5AGfPZs21GebjguGeSV18cSQCbe7j0ATkXoDd3935MFyLBomlYP2JhT5x2dVbOfvX91XbrO43YIM3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738713013; c=relaxed/simple;
	bh=hdWDVxi3wTlwT2qID9b1y4CDdXA+yBYgpDyk39NIQoA=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=hLCwgF2C7fUA2KVDINSQ1d0E6v/Ro376SpC/uTFVgkVyuEeYGTTisWE+3opW52qTLcX1FHJjpwGiPF3OnabtWoz9vq/iuv4nc0x65fyLFjeSVIZ83t2TmUmUuyfSknU4Jag7Blu4HaVejz3GGcGZzgr+OSFOTy6FVAPmDjVuvGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I3dMIkMT; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I3dMIkMT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOV2mPtgI+zJr3FCRnxMvCYKBl5VOMFlm5pRHttFVooHd1PSHEMQkpJCKcHROfewK/5zWrFLDS7MQIMaVe9h3dEOHJ2T27Uonx+HxPLrdxE3zfpBTpIIil0RspZIpEmJLsWpDbsHr3SLQRGWdTmLmXU3o79HS2NJoV+lGkcRKotdVWfALUNHEJmbWXOFhRHts9Ba3cqoDzaE3SsVoCndkFSNV8Oh9t40C/BbxBEP6HiybYWl6RhaVTNKrZVz9/mfs7Pot8gZcu94Tn9OOuxeYB87vCxqG7knQ5DPLw7VhCp10NqRsjfhS++/buZXQp6jLQXdaHv6UhwS490isVyDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnWdt+I7aXESdl9jTF4eNH9+8QLwjr+bJBSULsSpi80=;
 b=IE4ySSRrsEHqRXe7lIO2ouYO6HR3JXSwh/DwcjKU7lFPvebPYjvSN90sJU8it4JVLYGV5ur5CBftbBHnmnbcWRIJMMbExX3BnxbOAU/XecZyEXocs0sOGbLfV9554mJYUZLkK4M21BpuJRnhpCmWdo1cKvRiLTiaEt8fh643eP7BgsyFEDL5bAd0tqojAprKzW5z9tXLwwHOhpIJU0Ok2gXDrMbYxV8SVvQCp9c1YlmlF74S0m/FVpu3YR7WLAhfKetDdNna3QRjw5LgGju2hc/Po1LxEXKDAipV2WoGWY1tjDp/CtV9n+LhaL9Ht0cH2j1C5vBS2wluCF4R2k4+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnWdt+I7aXESdl9jTF4eNH9+8QLwjr+bJBSULsSpi80=;
 b=I3dMIkMTPeJ7qzEZJfuikoQKFl0XQob2efVHxTovm93WGqiJHs/HP+jztWsj+NNT0ToJT+BpvOJ4PFkcpvKoMrVdnExjGLVt08sdfZwCIpY4vx5/XCt8ENiguPjhTX16ym8Q0AM5tSzmTzMu3nXUt6x2VGR84QI2GLUh3RdD1kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11709.jpnprd01.prod.outlook.com
 (2603:1096:400:38d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Feb
 2025 23:50:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Tue, 4 Feb 2025
 23:50:08 +0000
Message-ID: <87ikpp2rtb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: simple-card-utils.c: add missing dlc->of_node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 23:50:08 +0000
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11709:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ceb721-5bd4-43d8-e794-08dd4576a830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8PkM4Vg0cM761XB/SUyl7cF1F16oNmLAz37xzCly1hE86vc62SHcs0S/IBb4?=
 =?us-ascii?Q?jlBhdbvH+nM63sDTfdpZqGusgPUjNN84dhCIPcFguyps4AXF4Q6Uz8hJ2fG6?=
 =?us-ascii?Q?fWHyEFxJfjthh8EI2IGirpF+FcJ78ojB6Y6eiJmoHr8Cp2H75nzPe/6u0fHS?=
 =?us-ascii?Q?3R3xFjHmb/s6gnoYrWwq1Gu59cGVCdN0IoK2deE2SpL7tJd+9dXpRh9G4O9D?=
 =?us-ascii?Q?hXnm5XvpfYTUW2f1VYY/c6c7SEAubbebQsP1btbaeGPJgh/0rlnojWEPwbVl?=
 =?us-ascii?Q?34rwodi1PEXp+kuz+2KR/PxLmER+gXA0FvEpr5TDkUpkzBcPt2dJ3AmK566c?=
 =?us-ascii?Q?aQkqtdKQYdoO3xhnEIkgBc9e5ZyD/HrmCYcSuAjIKjqJgcgkDOuznEEJk7Jl?=
 =?us-ascii?Q?ioLgJtS5LFq3qB3CiIT5H5oyMVwX5TTV/rrcdJVcpi4Fmn0LSM3NdSY3dwPN?=
 =?us-ascii?Q?wbzBnLXQZttqEjehSBFh5kzXcLGHbFQBUB4mzZXNN0DOXmm2iwys0csyZKtQ?=
 =?us-ascii?Q?NxG57hun66RRglqE5EdVgEivA9XcJPDCnyNiPQjvaO26urKpRfcidFiK0iqD?=
 =?us-ascii?Q?Lu3dSwdXgk2ksGqa7m7J5bGhAFQJQUk0hR4ZiISaKQ+nmXzlE41z+f2g0yZt?=
 =?us-ascii?Q?x+RkoQjLCZaqDFHnsVuUFX93GoWU1TKqPcqP1j5m69AVfMzWGUa2o8lIQq+5?=
 =?us-ascii?Q?fYo4viDMyPNPzkQmDZh9dgy1jdN3t/O762NIbKSNZ9IJ2AVeHGYF1LKE6tgH?=
 =?us-ascii?Q?8RiFrRHxiIRkd4oJd/AejI5EHXIYKa/75RNjhlfAChNZeHrzF/KzQyDX2mFS?=
 =?us-ascii?Q?Jmkl3ZXihFlG+madX/bdDmVuE0Rmwl0bWMdDH7TVMrX8UcdrELK/0k5tV6Ob?=
 =?us-ascii?Q?Rd6KbJ9tYMsu3Ddfouh6uMatwCPB7gQ4kibSH3s+kK+tzuP6qenGgGgq512u?=
 =?us-ascii?Q?6g6zyRHu++VQkjXgGSGMoOW2pUzNXD91rC62f01O0e3q8ScXKYfy3BQm30iq?=
 =?us-ascii?Q?j4Zly7ATbm+vPkGdVCWjTFSvkwBmTaf+3bfuBs4npCuO8kxmyBR9EJjKf/DZ?=
 =?us-ascii?Q?XA7wINROvVHfEUV2EaOyc/6QqxmmoVjoUDoDL/TdQZAKTXYm1GxB1tbR4uEu?=
 =?us-ascii?Q?hiK2qqpERFzeTuIW/HJJNHys4EV3+B66Rn6djEfC9m5udf8Elk9E7iNkg03e?=
 =?us-ascii?Q?x3fFfsczLnPAzGoNPvAs0n332MZikjQEAml8vCl3XeHE2hBkXKI7nLuV9IrV?=
 =?us-ascii?Q?1kYb1IoBnjGMwb5mtR1v7lFuZdLsXDyLyUQz5ptvT8DAeemb95d2wE2zvL51?=
 =?us-ascii?Q?5OoZT4Lfi/bnr7LQV7XeFZaPW+SzfM5+dF3XyoydnPgSgaOmOjfdMzBygD7K?=
 =?us-ascii?Q?W+BHpkdgEXHfz6XBvDei6/5JNO4wVS/X3FJiX+IE4XO9X81y+2ggLwHGXAKV?=
 =?us-ascii?Q?RIJpS+Xc4i3S46+Qn0itlCJcbliutQrP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNeVDg9zJY/B2yjoVwdnA1jEpLbBPblBK7jFcGC5qH1tJAdrv2y5yZm2hzfC?=
 =?us-ascii?Q?ao0d2B6Y3AhNSVFG4GIkON7uQQXOeCTnOra4C5QkAriRZOj0jUfkgDfvQYkK?=
 =?us-ascii?Q?WaMgXvjDMkXtnqP78n96ojqu8V1FgHk6xF182LfTCcCsqaVUgSK+QONlyiHD?=
 =?us-ascii?Q?5OGqTf87wMPz49dRC0D4F/pk16XaUmsgaozee875cJZczXE5/BNZCGY0pOWx?=
 =?us-ascii?Q?S3g/wlBEe/sG7r3qCpfouJRncLkWZPyc4KljrZ7E1SYLRG3WJSiFOjz8ur2x?=
 =?us-ascii?Q?nQq5lhIGuBiIXmp6R7fptoiJCM/qEhhN9RbwmEeU0GG0TBO/A4qPjvfkLJCF?=
 =?us-ascii?Q?qW8EyhepHIC4UNsDlwuvhU814FryE44kGigWFIB4fYKAdG2maAif76K/zvb+?=
 =?us-ascii?Q?0cRWBR8rBhyHEB8I0xtFk2knF0JPzzbqXmYhJe3WcI6dnbiNJ3SkjnsoGter?=
 =?us-ascii?Q?Vdax3wazJdxXHkPW3wVEgVuRCH/LKN+QD9mzjaJ6Ywd6Av5c5h4H6xZAqg+y?=
 =?us-ascii?Q?NyA/pHaoBLa3ckU+QGgqMGSDZ/PgaLIVUVbUKtL8ja/0ybVJPFHrqyF1GHSy?=
 =?us-ascii?Q?89xDnRb7Bzo2GLGVzn6cfUHfijc9pGMmYnMkI/tIa8i0OhWXUrDGK3SDtiNg?=
 =?us-ascii?Q?5D6YyXh+aTBIKzWLrx/yht8eYy2h/8gqLahwkHbkNXTZxdDNQxwrsAq8+FFW?=
 =?us-ascii?Q?sEIeCadphKjDEYSoROjutHvr4165Jw76WnxbqUa5vLqFB1kIoR/tSM9Qa2et?=
 =?us-ascii?Q?hmT52oA8q0yZZFMKK9zJnf1wLJsGu8ZherK4oyKaHOglVvZajkGzvNy6LeeV?=
 =?us-ascii?Q?YthYCW0L6kTsKV7lT4H3KVzVYy6sW0Y4Oh7gv+xMOuYLbbxiZEGACgGNlkbb?=
 =?us-ascii?Q?692RMfp5Tv4y/oawiv5KFz/4V3UholsGB+aLZE0v9sffWDCSa+AEACtSCrsm?=
 =?us-ascii?Q?idh4pmQUObQ1MsnG4tGxh1WXILzwWOECNmTjzuyOSCasT5vF12jmuzW8ltUY?=
 =?us-ascii?Q?JFUc1pvoImzSg2p3MyohOPwSkgIYKzbgDEB8ffEhPyeWI5fjmV7NXi1JIILs?=
 =?us-ascii?Q?HeY+2Qd5I1Y3jatJkI8+x14hexwRR97AaNS62cqSmJaYYrytxSdW6YnrUy5E?=
 =?us-ascii?Q?dRIvTUnnG3OmttpPuvNaKjxvxyy6gWUCn1Xh6V21znNBZEssvx62vb2e0Z4J?=
 =?us-ascii?Q?mnPWC4cZ2hS1+AM3bOJuINXzvvatyLrH0nU/oV/aGCiOa0y0i4iBwPS/eVRr?=
 =?us-ascii?Q?gFVUZgrlTLtQ734jNuwKO6cuJMOGfLErvFubeDjW03MwMWFWKMeYEUaTepEq?=
 =?us-ascii?Q?Bdy53VTwlfTySsF+N5AeRpJAhqjN5ZrZcyrvOzSR7bh/dtyVbGjyaQdn5h5O?=
 =?us-ascii?Q?0zePv4t/LLeQD5iLz5FX9D4F3n06xBSGKBV4JnjsOD7yxHX1Fs2dF7tFDTnW?=
 =?us-ascii?Q?d6sx2fK3rX9R3zRTmnCvDQd5p66eA7/QK5yHA4Ez8hYtoNx0RilcRtHnX7C9?=
 =?us-ascii?Q?I85Ntle/RzlTqK2bsne4nPSXKWr2gmRgiw31ikIHWn/5vCfrW8V4Nc9uLkms?=
 =?us-ascii?Q?qCc7tOXoB0k6GKBjeajqHFncygiEChmz7lLFHCz6sUTh0o/EsxxjV9oAKL9O?=
 =?us-ascii?Q?NTHp4+tE8jVmbZX8GqhHQ5s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ceb721-5bd4-43d8-e794-08dd4576a830
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:50:08.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6J8wlIJBIEK+IyBNqFV7PHPMbahXzclfRpngBZRo2qr/4wEnLeXYmX7OyqcodZmwx4enK4JPge3Qm6e1KlPUheTpJTJLroDRng86MpJyaxZCmw353XgQte2rxFbZIFL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11709

commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
support") added muiti Component support, but was missing to add
dlc->of_node. Because of it, Sound device list will indicates strange
name if it was DPCM connection and driver supports dai->driver->dai_args,
like below

	> aplay -l
	card X: sndulcbmix [xxxx], device 0: fe.(null).rsnd-dai.0 (*) []
	...                                     ^^^^^^

It will be fixed by this patch

	> aplay -l
	card X: sndulcbmix [xxxx], device 0: fe.sound@ec500000.rsnd-dai.0 (*) []
	...                                     ^^^^^^^^^^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
v1 -> v2
	- add Reviewed-by
	- based on v6.14-rc1

 sound/soc/generic/simple-card-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index dd414634b4ac7..c2445c5ccd84c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1092,6 +1092,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		dlc->of_node  = node;
 		dlc->dai_name = snd_soc_dai_name_get(dai);
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
-- 
2.43.0

