Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A324A078
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761874616; cv=fail; b=Rnd+73wj6GQ1TfEbCmdfQAgbiLojJURO0MaGL3WLwzwIoJMMsoJUcWHshin21lUAYsFFOrOXCtM6YoUtzGGka4hihaCM7AdDGdeMSBXmlIFNJHFAiW15LI4mg97eCv92kWCZimpRNqKcBRdng0ZthLsu34qSc0KvkT78mhWUeLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761874616; c=relaxed/simple;
	bh=INFbU/5bWYRfqNxT0cZ86NULYRM36Lcf6w1CQznUCJE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CVUfT51yIYTb1rLFyFlp9p9tAln9gbAs6RhDJ7bqmq4DSxumPNYOOuDsDypUy9oR1o92chRO7x8yOO3ZsM0VQw8NjVRGxQJDzQLrB6o+H9ThYYR9G53s5gn78pTLKjJZtW4QcYJ6KUOCoR0njR0rMlScvDLTMoZWwSMC0KuPCkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iCExtZvS; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iCExtZvS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac1Ynw7BtzEU3faHng5VClVfpA/qBObezWC2aNpMMIuvYmcW5Z5LwvCHTh8aBhvv7ObJewrHOUE7PCLp4uYIuMm3qGJcg1gEU4d1iEws4HY68oX3Qdgck8KrtSQ7RlZIubUm0FYgMx0447TVSUf2KUMmBATurGqRNe7rTCgBaqYjJyhV3iRIXes3vLALQmm65j5T48uAhjGSF80VCrzTK6+JWoSoVu64Nx7VsDXQK6dEVfPETFUEBBpauMXRYy7ze9RJ9ndO/07GFlcqVnAbvHBaFfbiJnRgnYsaCupbAiCfvFRq1UvQc/g0+Z/St6ZX7QqbNFCVdJs129itdyRa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iLC6Y0W/VfBPm9iX04FuR9A6mg4xYPtcFgxorvhwbo=;
 b=vyPSFIj1qy+1ngL1PPyyamyxycXFxmP32gyHJTuQLzaiF0OOmhub2RGNmMQmsQeCkY5sSd26qGJeTqF7LYw/TZKMX0u5qhIk2x7VrPYUa1yA4iHyNObQepkaXFwY62kG0J3XWaAj9IcIQi9eyjngtX2QKe1/jfDjGKgHIp9qWwOOtOSEeBZ8gHigxSI2EJvvp7f7pP6wnyoqlYDiZWyHAIs875QoyOTDzJloTuvLPQcG4Mrsav8WZT1gEm32xkReLCsPJZxiacGHvwQVt+OOvTnzXajP54YofbVeokm41x7Lm1jg65RJsTJ/AgSV9TUj3L0ZMPJ20TaYXWan54kM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iLC6Y0W/VfBPm9iX04FuR9A6mg4xYPtcFgxorvhwbo=;
 b=iCExtZvS4D5AfKz+nou1PH7DSIw7UNgM8Jqgs9esDmgBfeed4PgPs/5d7bjh0SqDAn/BAzxNcrP4kEqLmdPOj3lPlZDaqnpKCzMObRd8MR1fVjSG50ZLznPkkhSg/k7yLjE7+Bw/d+HIeN9Nb22NCb/kXcqWmkLj6xFV0Ttx5Rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB17066.jpnprd01.prod.outlook.com
 (2603:1096:405:337::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 01:36:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 01:36:49 +0000
Message-ID: <87qzuj3l8v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH x/x] ASoC: convert to snd_soc_dapm_xxx()
In-Reply-To: <87bjlqv9ug.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
	<6358b4f5-88a1-4bd2-b15a-20f090dddbb4@sirena.org.uk>
	<87bjlqv9ug.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Oct 2025 01:36:49 +0000
X-ClientProxiedBy: TY4P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB17066:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cea17c9-582a-4ccf-bb55-08de181df5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VjKbrvhpNHpDCQMADBs1fTqS25U7bcgbpt6nKT3PQNj0Y5tXsTniQ9XouDJt?=
 =?us-ascii?Q?5qiZiqOj2wKV55VyXtYl8TXsPFdcJ9JVskj8potSG0J9pLZzWAaBkLHxmBH8?=
 =?us-ascii?Q?DyUPKi2EUojgQ7kllnU2TlBPwbsbJMgRsad5FoLOuyzm/9mW+0S5aIniyYI/?=
 =?us-ascii?Q?PpSqke1iTvb8dsL3qfsW9yMIk5NbPKGXoSL4Z9Q+t5RqNprXzvnMlhbG/tPJ?=
 =?us-ascii?Q?/kWBFwdw93kdQPOg6R5qpLdx6u2V4MBLsEYheRqEuow+XM+syCWQfRhtkNe/?=
 =?us-ascii?Q?IziA74Kf+z9yq7n/pbyUI4FcoNXCGM6JuHHVtsayVQLgQwsPblbSIGBEd1PE?=
 =?us-ascii?Q?8cL6x/ySlP+OcrmkARsT1dYTU386faScehMgE8fcpLZAqtdHbCQSGXlP+wvO?=
 =?us-ascii?Q?AgzJpsF3pyH+ISEVZI2/758Wm0yTsZ5JhkpzsGWlFdIwFx86++4LoFVkc5Gd?=
 =?us-ascii?Q?MpSrw5jTawPiJhJnuTLsoubMC/Pdf12lztjz9hBX0GDxx0j24uDUbsQoe1yw?=
 =?us-ascii?Q?7IBAR8XUbNFmJOQTYRPt5n9//nhd4QSHl1vbU6Ka4rJNEC47KW0c9rRn/YFg?=
 =?us-ascii?Q?GK6AfEkDUEHroeb4mBvKLnSKRu9srfZhTStYw/Ij+hPJwKxKgzZvYgc1ZRBF?=
 =?us-ascii?Q?dSGjVgvPQYFTzDwbJvrKimt2cJTfkWQ6bE+MOvg3NOAsvhYU/FARxwKCqYez?=
 =?us-ascii?Q?fx4co72KBQzBAYDr0wxIqVF27OSeELALDmoWPg48mO0vyaRqXNzxYRgzEd6I?=
 =?us-ascii?Q?73Xewu2x5q5xIGMqlvFxSJHTl957mEoBOdX25DntFU6+cs2Rf3KxCx0Rim5k?=
 =?us-ascii?Q?a/c+wsGfPAw+OtIIw/A+XQa2aWilcQDzQevX6lvimd9QrCa/HDDQf7Oyfge7?=
 =?us-ascii?Q?XhsPUDLMiX3+wgzLBMuDeMTqe8iJm8svbHRPufoS6R2LnlJ6oPN0g53Q4B5/?=
 =?us-ascii?Q?3kt+e2VIdsgos0WYBS0Xpih/WY550L9330ET3AAhbEYo+ErWK71YlvWIYshP?=
 =?us-ascii?Q?Mf/HB87w+XBdBuaIUiokbAlwIceRRzK8vc27eamfPrgOH0S2j7WVcypSQKia?=
 =?us-ascii?Q?nZIUjyAiDTG7Mh5vfq8ZXGpq935tWU2tQkZ18xc5toW1xbnN3Lp+NrqfSj+e?=
 =?us-ascii?Q?BvgCEBd2JW6AG/YZRcqtHZpaP5GuJr4ZwLLRN8H3V7q3wCO2AAEQxh+qoPgW?=
 =?us-ascii?Q?6+0bJguwOFfE/swNPaWh4gCQsUqCE66orzUHxo4FRLPKsp7GDvoUmwjFkM5l?=
 =?us-ascii?Q?VR5hRAqn+/VOavSIgdXSz5j5lDpiAAcJQrMfIb6YysPFPV8yZfpNfrJxPIv9?=
 =?us-ascii?Q?sH34kZHwikyg8/wu1klsKxYqAr8PGAFzNBrXTcz6rQ+2F3TzsolrurC7iits?=
 =?us-ascii?Q?A//CEu7z7kmvAgDlnIgllYOr2MYvHbcZ+wvab7hcodb/DdC0g5CKl8QeTKs1?=
 =?us-ascii?Q?0VM8NfV6dE+rS1A8Rj7TQgGi7IObNZMSZYSfXgX8l1kkBiHMOX6hqYU1YHTE?=
 =?us-ascii?Q?+PTcR/goWDM+OE2DLPCbrksEBui3+rYK3qK/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Beo4isYZ9iIXRlQbrVT4oFKrTShLjfuap01YZ64YBp2PBUAuBc8nvG0QQZD7?=
 =?us-ascii?Q?KPTNeED587MI/QyjZ4Lr1rARuGICrIdyzzFOG2594wxQAqWiujs1a8+bfvD2?=
 =?us-ascii?Q?xVCMIOFV/C9HYHEOIAPq95ZEpYSsCaLAirYEB4EAF4etDdpNqURKE1cBULjW?=
 =?us-ascii?Q?hV5SxpXOGj3oz658u49tu8+oYZ6YBTifBwutIliIoqwl7J2GzKhJV/e45BaX?=
 =?us-ascii?Q?Qlf9bBqTevHzksE0PJHmYbTCMjJSc8V8alvAr79ERqlsx9mxLjA/NahRD4aB?=
 =?us-ascii?Q?BFlIz5X4Anv4OAEOGgi0QpK0oDqWbsm8B7L39lI1Vw5FVFo1M1q0DACVMnuz?=
 =?us-ascii?Q?wcVeQa7x0OFh4/Q+ZpZx5DFaL/kL5cZ31iqU+jbFM87miWFUDd3tjrEhYGhZ?=
 =?us-ascii?Q?fx1CFJoKFcoULQu+mAuzSHYPC3GVmJT33XKfLhbXBG98Q6NJeSJfj+h41/bS?=
 =?us-ascii?Q?pvpSnpvYEq4TabhVdMU85wCiHlOnX6nAFlA9AL+pv0OptaoazmKLs9nR+Esi?=
 =?us-ascii?Q?4enkU/TbjoWVtJwlryvfDA3gBleAJ0WvA79qGN9vNdLig9P6qTYGKlEr+q1J?=
 =?us-ascii?Q?pcQ0yUMeNdRIAT0ZJ+Waz++97cTdGeCpkzpuEKR30CykVQybVjWIdJhvnkB2?=
 =?us-ascii?Q?C5pH9M6+hX9z2effsi3UVwd0ASvfOF7RAHvTZFxre7cxL+7DISWW32PT5vI2?=
 =?us-ascii?Q?QSjvXgGa6gRVMYZHRKlAoqL1HsXGKBo5K8DAULKZ+kLC6ubXy0dcRcXPFSHF?=
 =?us-ascii?Q?R8xCTgQvpq+s20bazoYDLPuEXF2R1CPkcdFhthQYDI3uC+e2hrFHrWyeTRjL?=
 =?us-ascii?Q?Qu/pwRXXvBPoq7Fwv9YVu6HQ9jFoxmeqypPjsmxOcfxx5xChT9ZxIIMT1nFo?=
 =?us-ascii?Q?8X8YhXwSuCVh4qH9dG8HfypNjG6+L9Ws6pEFMVu6+Aeyw3o/Nkf2k+5UIsWc?=
 =?us-ascii?Q?E26sU679xOcobMi6XmKQQ5pt75rHhVxssNKnM5zs1EJLKYbYUrduOQQR6FL/?=
 =?us-ascii?Q?kKn6bnzHTHk6/fvjL4GOYYinZfMNOiH4C7Rnc2LpwWIqxipG+Ie6Ow6nyA7e?=
 =?us-ascii?Q?wmgasEVLJK/PQRs63Y3z/WNSmRZnSEegCBEBVpkRlI5h61bRxaCC7Jog2V86?=
 =?us-ascii?Q?uv/O2zRfyTuUr7/jzNjFzenOlfjSDiBFdP37wV95thaUm/RUYoxrEeqmQjxv?=
 =?us-ascii?Q?5gsaReshbRK4zqNWC3f3dEE9SQRKCfgGznmM8BJTOCRMdpVabPoe+bgHDNB7?=
 =?us-ascii?Q?0Z+M8ap0DqVkTKLTq17gC+P8LkhQpNBju8ZZsLXPqPUnKaV6OtbR0S5gHzq0?=
 =?us-ascii?Q?TJpMmLDViUTFR2RksoPGxak0rKaEHITIQfMVfaqAt/nxMEaO6ZiGQS/lzEwD?=
 =?us-ascii?Q?09S/mr69LVmhu+czl/Kl3nvWUhpLnaX5/jyPjfux5TjfzRVz2gOciDvM0rlW?=
 =?us-ascii?Q?tdU8csDFKR4UC1cYa8TfjLbPyKvcirAE315UTyEP8rGTVuVm52DOdqliRf53?=
 =?us-ascii?Q?q5D7B/kWp+8nZ1Lcsgk8e3eFDtr8sD3PPYNTqQe7HmVfSdPWR5I+9q3dWt+b?=
 =?us-ascii?Q?RuCLcsWj3RmL/qKvxwE7EcCppiCZ4YGLQNIT4a4dd0Nm/oJxcv3wrKPON93H?=
 =?us-ascii?Q?nWequRYxmqTUDkb0p8T3xBU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cea17c9-582a-4ccf-bb55-08de181df5d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 01:36:49.3063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3Vj2kGQpP9GnhFHzYxqT8Qv/ptLUUYsJDHYqUier52OJkWs2XF+Q5buk5dvVKE6L+a16DzV/QAKGNBvK+NipSiFW2JpXT3gHATMRftd2fNs4ZL9mTqzdwl1t+uDDjB8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17066


Hi Mark

> > > snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
> > > snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
> > 
> > For these shouldn't the change just be within the implementation of the
> > helper?  So snd_soc_component_enable_pin() would be a wrapper that does
> > a component->dapm mapping itself like currently.
> 
> I'm thinking of removing the simple wrapper. This is good timing to do it,
> because there are a lot of such code, and this patch-set need to update all
> drivers anyway.

Is this (= replace function instead of fix-up wrapper) acceptable idea ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
