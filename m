Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306C5370AC7
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179612; cv=fail; b=ScZckqjRF8nw7rs8yVQBFwyk8UKvhDUPUR4kl+dRg5ZQUh5URQ+6ggHbQApcHbWrr8Lc+EBvcCRYM6DzJF79u1ApTKuuEAqOAl5GvqnSAIBfv0k3uA7B+KV5F7cZ94QE++4ZPKOU5OPW3YVGKYep2zVBs8pVP8G1EnXRnzgZblI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179612; c=relaxed/simple;
	bh=I5uPrkfCVC/kd4EYDHVAS/p3YEtbbFlLAdv8248ts2Y=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Jv+v7wP1xjryaSD2MENexug6d5etwDn/0XdgBVQD0hoQutvUeaBj2PlIVXLxfZietqllxy5AzbA3uaXy4tg3NyxDmKVipO3ORzHHtJocCUioVLYVb+78yyrY4jfHvxMupcVuL3WfmyHOlBXQvoUVl8v+WPFeMdSfc6Ws9EDZ/Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B+Q6GtUr; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B+Q6GtUr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKVTcVCenycTtppceMdGlWWqmk9hfXwS+0gRDOqAoSGPPaENBzExavKNwzfPkRlLAf7AtJtyUsf+dgkkuvOxhnB+Ve66xyKiTl1s8U1F4ZIkVPlvx6FY4eqNLlb630qE3fykzpJuF5FiRfrhWgxgRggsLDCTPy1etE+UDgDnQU/6UfK+ffv9NNp9AWZHRlWSH2yfR8M1BnlouAwoXcdM+qYmr2kC/rAWpn/InKfCRlGBQtoizcFDjKY64XkHp0l0vo+Xas0lN8Lub16JrGzvtGbVJmbSYp4N1a+19EC2cWqzTgP3L3xVxYQF+56ArtKrqCWVwlte1exXM3Et4lw1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIejgRl9k/zloZQidxs1lAehnrY/KGXoRa8GI5/3iNo=;
 b=l4n7QXefIbnY0FJOdGYBH0hBwV6KQgzIgHM1+qQsZsjTrfU8uZKb0Ow9qXhLe8tsHWSl7HyiialGrbD46nX9TTOf9AJA3GaJVxeiI2DhZoP0Felw2QItNuDtG3dvE1COgpz300STvbnwCt4GnfwJqz20kCKwdG+Ubjotybz33Arl8ftaaUgk38wbtrUOQIKEUlmHvh2e7rmbKI9yZEctp+ZahPUZUqPceDH5lH2/elSwkYKjVZYTwS4BfMemCUCOuCRv55Wg4+Qv3sa3Nj9ckb95N4nKnc8lqKNn32De678FwYkin/txu7ZVuxw5F50uLV/BYeIzwX1H1WF69OEE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIejgRl9k/zloZQidxs1lAehnrY/KGXoRa8GI5/3iNo=;
 b=B+Q6GtUrQGqLjI17z2RQG53kJ3I04bH7E4QUdzj5MKSvstQPu74WDA71RDiTI1l5dRGjnEkzS4pmeW9qVkZCs1JSnRRCikSJbcWqvfMxXNRHjE8aZVMWUaGKGKRK30w9S14+2ZK/9P0FvqtSZP22O2V443ynpL06ibqTlJLp7Hk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17101.jpnprd01.prod.outlook.com (2603:1096:604:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 01:53:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 01:53:27 +0000
Message-ID: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] ASoC: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Kirill Marinushkin <k.marinushkin@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jun 2026 01:53:27 +0000
X-ClientProxiedBy: TY4P286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17101:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e007bd-0137-4496-ad86-08ded0ca37c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	askygTk2NwCE2O7T1Ir+pLrqD78DYi/vT8y8l0CAbnHjKPOwbcZzlApJ2KAkytPT2rQN8P8uH/zh8OQx/GV13o3521d3EHLFtNKDadZB9jPJ1129T3MX0HPvuk93w4r2RtaX+RgDIxuwabMX0XGdFHzBJctT8y8fZ+vK397HGo1AGW5C7mR2JnJVdpEOi4sALlSojOy6krOBEdfKmkaasply1AR7GXSlXe6ATqhEnsEiRxSasc11nE8q3f8dkqWIMCgH4qoMteiKy5Eo7sVdnZzzgANtkKVAcfjIW4TPQ3zTsPPethr3hg98SR2TxB22Fbz4viBX99VboD+LrJsdK3HLolDHx7kWPL4pTPNPCA7NR2IxkWfe5D2bBXMXlm5IEgNJP4B/W3yZ/JH9V40Zxh/ZkhQ+SwlDTjh1jjNEUXZ5LEWKKlryTihjuQqES6TSSQyd5TOfxg5qDYQOWUf85uX62Np3NVkzb9xJtd8b7dNrqq6QPGtbRKoi9IKyVCRG1c0jTY43uF43kkbz7Q4BgnvWsSoMhQ07q0IAtvqOjKhNFEOQjoOmt5lO46xq+m1lvDCk0fLX5DLC5ZcpLc/jNC5njxap8iO966+ci9Gz1m1XvjWHCsIR6MV20lAH+w6hx1q5vyH/DL0eaJxX3aWABXbVNVGhmXJzi3jvDKK6L9TUidbSiFNi8avhxMgElDUmU7XI2nKOsYvUTjQxYXIwezlNU+umzODB7b80kMGMLck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5AsOo95qkFBMx79M/iFu+suy1XooHluCwuQF3GhVS8+gZGc30dApi6K3Z1NK?=
 =?us-ascii?Q?kSxMqPYCVE2JlqUE7B3dguC6xeWtfhhffaam9Oo6tj+PqTPNbSnI6Sdq4efr?=
 =?us-ascii?Q?gmu3UrrAllU0YFiq1PFREINg1YQHuPqBFJb8DoXUbhus3aThqQQ5D7AuFFY4?=
 =?us-ascii?Q?T1+mH4NgKK+8wydGL3pK4yWLrtqsKKVfp7Y7C6+RBWgCX/3a5BP1LlZZWEGT?=
 =?us-ascii?Q?Nb0AUon3zESxo+LaUaJ4hwqJmglhQY3tdJJxAF5xyC0jL4JztGF+CnAj8I2m?=
 =?us-ascii?Q?moabefqEorvp7JSeWDnA72HXBxoke4t6g4ZjQMOVSNCPdX+mW/+rTyogAcab?=
 =?us-ascii?Q?2X7dCN2GdvEDPiAb374fcJsFC+Dc1Erk7agreSk6EElJChTunaoPczRzubxa?=
 =?us-ascii?Q?jGuF/GuyrGhdGBczvXrAS5+kP+o7By1JNWnbgzOk2lv3IP8pTU8f9kLO7lJk?=
 =?us-ascii?Q?KGTPoYH2z5DjrsNagwata2FQl+GLow5gW5d92iupN2V7WIjrh9DTapbnZzVO?=
 =?us-ascii?Q?/F7IedyJIQYsyBniTQSG5SATnTKSNrTWgRvKzB9Uo4KtjYpfPdn2KfBNY31v?=
 =?us-ascii?Q?RUaJAcdn8Bi8tHd6oBynyEC6DVNdYcRUOcbLUZ2Ijd4EuwNVS9z5H0X1IwQT?=
 =?us-ascii?Q?pORhRye2Vv7R98Uh7plWOBEfhzMsgGdimlngBnelrIK2fk2COZP0ue3SdSc5?=
 =?us-ascii?Q?pYevwQ/nP65ezIkMs4YxP5Y7JA5jx7zTbIE3gdsZPf3oaHSf0vtrdhrZ3W+G?=
 =?us-ascii?Q?alomJPAq5rVMCmrhVeiJsbVxsAvHvL01ys9pzGygBEki8+XdZbfe0gNPqGdK?=
 =?us-ascii?Q?Kp3S9QzRSNRHcvAeshSrhW2+jF1csAKoZmcWMJZbjYyFcAzLp9KdmBNFLGCy?=
 =?us-ascii?Q?F+1j3sJv8KvYJJvPFcu6SNScWoS3GehJF4L6uBPls7EO/aIfME/DDMRFNbFc?=
 =?us-ascii?Q?T/ZWSBUc93DKkyBDJWtRHMfpmivmGlZy3EqYUThQ7J4Z5Fw5TVpOdSnKznK0?=
 =?us-ascii?Q?0XJEMAbbsbkFHljrHDGsJg4FWQI63qpLAnq/Jv+lyh+M1auBJ87RwGD2LfA/?=
 =?us-ascii?Q?LJPi5ZzFHf8NDEMNIxf2fw4C4weCNn+/ukL/Bo+f8YWfq3hV5me1N3rHfrot?=
 =?us-ascii?Q?8GV+EdpLl+lZKD4Du4WvsvVF7aPRy8sbPjugaueSk5lk0GhWgZ8ErADau3lF?=
 =?us-ascii?Q?jy0RXKs4zZJJRxZ93Dk2GyU7UOd6v0RQtGeftohHL8ikx7lswE+0qm4lkes8?=
 =?us-ascii?Q?jUTVlyv8MFBC25sTUj51ojEsztUkYq+F4vkP05/bfsoVpc1WuOkESavwYoY9?=
 =?us-ascii?Q?gKNf8jjdz8VQxsqqAhykh1+UpgzRx1aplR2FD32T4S+k7xjE4sw2AA3i2FVx?=
 =?us-ascii?Q?Za7IOXBQUEqRxoulBGc0av0bLY3/E1r3FT+bMOg4VCnElqKt4yB45yk/edat?=
 =?us-ascii?Q?9szPwFMRnpHD6sdKdc49RSuXAcKgJJhx4zl0FwaJNIcQMmBz8TsejjcZGuiR?=
 =?us-ascii?Q?uMpzsAcSEUthD3TbS8mQJzxF7CDWp1wqVltq4CtMzqTxKhJfNvc3HBwGg1pm?=
 =?us-ascii?Q?j+u+bJv8NXs3RSEGc+Bu+hAnxqlPS6HNZJjUD30Zu294PxTAI7/WdszejpIl?=
 =?us-ascii?Q?OssvxmlyVz5n9KcK9l3KAtwLFieFnMo1EcyLI9J+A4UTdlXrGQRxrO65U2d9?=
 =?us-ascii?Q?DLMdWpc99jz8D8WJbVR/sc6xAjH+6vad7wmv1hbWR4oxz+lYEkB+q1Py3nDG?=
 =?us-ascii?Q?xXBCqbBKjsLqKjXZDm6gPuLIVuoT1jntqQRg5kK2d/iOu3BmRX2h?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e007bd-0137-4496-ad86-08ded0ca37c2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 01:53:27.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCIhTdwd6pkcbnF94S7RFuMwCmCZ3SclX7L5GX16g4Z1zO4O+IEY5G7GzgcfANzZ1yHgQqTMGhNg18s6jgEG+moqO/A4g7FuIK8EaZNtZvCyV5bOdckzcl0dYnAtsSel
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17101


Hi Mark, all

This is v2 to add .auto_selectable_formats to each drivers.
I have posted it for all drivers in v1, but is separated into few parts in v2.

[x]: already applied
[o]: this patch-set
[ ]: will post later

	[x]: convert existing .auto_selectable_formats
	[o]: add .auto_selectable_formats on driver (already got Reviewed-by)
	[ ]: add .auto_selectable_formats on driver


v1: https://lore.kernel.org/r/8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (4):
  ASoC: amd: use .auto_selectable_formats
  ASoC: codecs: pcm*: use .auto_selectable_formats
  ASoC: meson: use .auto_selectable_formats
  ASoC: spacemit: use .auto_selectable_formats

 sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
 sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
 sound/soc/codecs/pcm1681.c        | 7 +++++++
 sound/soc/codecs/pcm1754.c        | 6 ++++++
 sound/soc/codecs/pcm1789.c        | 7 +++++++
 sound/soc/codecs/pcm179x.c        | 6 ++++++
 sound/soc/codecs/pcm186x.c        | 9 +++++++++
 sound/soc/codecs/pcm3060.c        | 8 ++++++++
 sound/soc/codecs/pcm512x.c        | 9 +++++++++
 sound/soc/meson/t9015.c           | 6 ++++++
 sound/soc/spacemit/k1_i2s.c       | 7 +++++++
 12 files changed, 83 insertions(+)

-- 
2.53.0

