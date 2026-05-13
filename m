Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EFB179A3
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 00:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631147; cv=fail; b=eY9WFUQULZID78m7zbP+fG3bcOGje+yHgDTIvEwViY1urY6ATEMMWY8djx5nLDnsjd8W6bhV9CFgR5YYHj92cfXD5d5B/UenoC05lJO7Qsda1eimhr3rjKyEPGVUjxO1wbGxlbLfGoWmUwBnqGYoXftLEewIAhWIhlPZp3dtNB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631147; c=relaxed/simple;
	bh=3kkX9M5NneR/uSaG1IgisKJCS5oCaWO4w9anlcKKOb8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c3ZvxHLcXetCCjgZn8Brbqjhs1MRYY5Fi+tT7VTYGveL8X7eZGhnJQusqeXjZdeOCONDmhf2XO4yYj5Lpx5IDXqhIV8vGl+7E8FpQPmL+RIQeTjBEy06rjtoQrC7CSouJJTcyhx13grfIRV4BapBVBdOMgC4V77lvmhGg1d1XXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=myg0xiXq; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="myg0xiXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfs+lu3FBl1OPTwOeyBhUiHE8duuXV8R6Y9wD1ggAspAfEUB4IfYrt/dAc1+KzIGXHsbSg39RUkxy2ljavs4VpQymnvH0x+HLJYmVaIqMOux5uAlom7ArLpe+GlLopmAI3c6cb2+J9Bk19yCh/+0G4eeIRqvcB+z30ei7rAsen1yH6iuL79DPC9/pLpMUaDwBpi/UuXAYCk5SrJDECeaTZqD+eG2nslENNwFZvPLgfBGABov92V/4lfYaY9nCXODJBgW8BPZCuZVS+WUazWvmQWjJvjQBrTd5RvDmXGg4AqwyP3ElCI+RiQ+T/uzrZ4tbhWmin7b626LvITA4KvBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwGioTEySfmqyOqa47+5/Wo8Mwi03+uz1K13NXtZ7YY=;
 b=eMWJr0fp+ugo9cJtHgsKV9hStKUSHHL6kAqsq5rXl+o9+r/XiwPsYzt0qtsje1Fu6gMGNjPMPpN1InUJukUplG3NQohuDnMHcFg8cjnnjdD+e/60NYflrh/QR8qE+SmSOC9t0ltJ0JF8nCmZyKu/Q9US6fUPJZVXKrmzxTHhsw33Feh0UJ2b6L0uwIVL0O8vkE2lx16p+gTOjhS/17wHmgQo0rZpSutbTVk8JKkoVBa8w7qgKzJhfpmwV5i0G7kEsT60DnK10r3T8W0ZOv4gU4O6sq2l8nM8eqP8AuY5PWB0MV/kgbmLGlmYO+DDqidWCGoDswTuHvq3mIqFpsbKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwGioTEySfmqyOqa47+5/Wo8Mwi03+uz1K13NXtZ7YY=;
 b=myg0xiXqpQ8GafUpORam2aa076zAceSsFE/UzmwFTNNTz5YtHqTySV0gjMVzxXVTZPvFNk8db0oNLOkaej/hDdJ6dHaC5DkpnnO208FR2WZdSBEFSKaZdHEL+994ymned8nrloktDMx2/L0aMpceQO5x6R1k6Vx1au1E+HX/OF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB13832.jpnprd01.prod.outlook.com (2603:1096:604:368::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 00:12:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 00:12:20 +0000
Message-ID: <878q9o6ucc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: codecs: ak4619: update auto select format
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 00:12:19 +0000
X-ClientProxiedBy: TYCP301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB13832:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a32cfb0-d9fa-4ddc-9b8d-08deb0844c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	vp/e277ggg26O3meWo3Jo7PSuyFiIyAe4tTlMpGJ2bh38GcChMDnAMqXya0VRfNziEZuyZpwHzSrC/AgNne0M554/K69zV+m4M6kxWADcC/92jV1eVfmrQ2/0cSNdJE+gEtWSBaVm3FL00U3uxOkM/ufEewLKvN2Rzt3Dn/biNFrpCkQF58qkt08PhS7s8tXq2Sjyg+CUCWLZVowppnRZfTXcN3dzmDedlgdiBFA0KOpfa68JrUXRYIi0jMyPod48I9uG4RKRqRcX9mW+ajxrHaYPMTn983BeB7ScOi18A+XkMKYtcBFlWqr910hTyddTMlU0ZT7sGEW4Jqave7IGg6cEyOINVp3+IN4dTFe9Bbha9bFdv2O1mJOWzRFNAhNrjHlIrnP2De0PQZWQ+fP/Jvlua0oJyMj+QvcYxX5tuju1OLUztaPXbHEW6V7mzzUGj60iyBszWcuSkM3rsHenh10D2213pIo/bUR8/gOnvyDXRA5LKTEZ2MKu3USZWwrCRqXnkkQHr2WQF1/0HfrGFPVb94sTA0N6C2O7KNRKkwb58oHFchINy0RAKuYL6ZApS/Io8Bwdlqv6t/4Uz8kjuQkgUkx+40ppupM5DVTfDy7B5t6d3TxpbwuEAiYUsbXSU+/33dX2c1eCEzEoedDiYOcsR+QWpXeMPgjzjZRVwOpD5GHMTpjl19ZUvvIXIOADeS+gyQSfDSpdYlS0b/JeOgexstb6rRowJhW7SJ2k6fqnjj1nB0IDKa25vzeHFQ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ym3coKBCfk9WOAm9aKAmdXwMEcgAaH5q1Stq0cQSF+aj9ECioKJxvE+VNjAr?=
 =?us-ascii?Q?fi0paM516TdF+mDY5CJNlQ7CONdeUvTgtaiEBQ3ZJzFvvW2dAKljik9SY/D6?=
 =?us-ascii?Q?zz98kZBo/vLPEMKZA/SpNLy0wUtuEkLNhJBIxN6aAcuwAvwP1nTV3EGy8N9Z?=
 =?us-ascii?Q?mu4TTobbvWriwhv6PBiluFyOBSsYI5iWBUjxsvYXxnP7nZYvTpDK7wLxaRQI?=
 =?us-ascii?Q?xUEC3PruhFr6FjZ1cb2pf/NPeFLVVi6dxwemdI1n1jx4FPaZAgse9rCefebk?=
 =?us-ascii?Q?b35sC+Y1t277m9FPslp7kplfjQJdWfcV/SfyeiYRLEhQ2dlwJ6jCKoi6eJa8?=
 =?us-ascii?Q?mrLGcnPKHzf1NBka4V971lq4TwzwpwE+RzavqgYC9yNid+1g3fFvdLrtMHps?=
 =?us-ascii?Q?9UuJYr/utNaNwjOYu5V5lbofpX2Aqb0vbyYxU0U74b38i09WdPGUFVZSpuDs?=
 =?us-ascii?Q?1rjIe2XyDAtvGMniHntao7wTqpgFsbVpkm2kom2YzO4JdjIvVfJHDFkp6dCa?=
 =?us-ascii?Q?bpGEBACQlX6K2zMMTWnNSNhbWyoBqjpQv+LQ1hp6m7HyzeP8iawO075jSOq+?=
 =?us-ascii?Q?qyCsR0MxArzHYIaJ5OPRVcE4rHINSI/yvlmlBXII6kps2yxnTsh/T+6ojXy9?=
 =?us-ascii?Q?i4wVb25fAUBhegvQMf7voIQazGqhLvRyG4dhcCf1nmHMxFz4OI8S3GTCWkDX?=
 =?us-ascii?Q?qCFD6LzBRYZsWNkqpgcVrUWFHhET5KBxXEOK2wI2Z7EzZdjkfR6xMqgoEMn0?=
 =?us-ascii?Q?UbqiPSQ/XAgd0wsHHSqsfS6tbjNlxcb7tZO0kew9zLqNbnko9ODzW3TNZTAV?=
 =?us-ascii?Q?T0gKQM42TQjQi/XcePyqZ3vJI25BEf3c4hMjZnGldh7GEZJae3dsHipXEbEw?=
 =?us-ascii?Q?vn0+T7h4n3rCwmYmR8jiF76O4/wfUP3fXU3K85Ejt6VjYOdnlZ/6osxwXIqG?=
 =?us-ascii?Q?+NtrvI2YLFs6uad6G84zXh3SDxZJT0DNafiEUwoAbuXbC+0YhAFomuOCc4Ey?=
 =?us-ascii?Q?SbM+nnDDnCEPvGqhZAs8szvph8xIQ/SgMKxCKJxWal2+dozPcjRqGuYa6rTx?=
 =?us-ascii?Q?s0IkMC6T7Ctac453DHsl2A/u8/J/PWDb3mbXAzNuPvGuiy0wVmL9XnfVA864?=
 =?us-ascii?Q?4exeob+EtaCJvce5D1TBxC84RpcUhsSZpq3sd2tkU0vY5BE2N8OVjoi5WPdM?=
 =?us-ascii?Q?0nLl6TWhvfQsogGKPqPYj2NPg+xXNmzCSd4tqBcI77A3dsWgLoZ1aEz2rQYF?=
 =?us-ascii?Q?gJf4mO0uOytLzbaFRPjELcqJ0x4+EEJYfn2gNU0NYV2PloilXjHyGDD2QbtD?=
 =?us-ascii?Q?zInTM3E/mkZf+IHC0Lh7SmgyKPM6umv3WL8rpOurideg8PVGMrkRd3sMjCP1?=
 =?us-ascii?Q?6401rAlS6vbJzeCeV6QsS/P0im6sOMeA5vJKTc2dcEteSqEbfMd6CrPrVgby?=
 =?us-ascii?Q?vjSmkZV9/4UBfipM5hX3b2ajTjQwgPefYShRDxqUTCT3XPv2fJ46laa6BsKO?=
 =?us-ascii?Q?O54/4n7YR4jiN0bPB9I8VHc1qLsyjIguSHr9b8eWcsQ571EJ6HxtvNERVPcr?=
 =?us-ascii?Q?WlNBEqHzO0VP7g6puqofCPoI7PUnUPxOWsk7tKA5rsYuX3/ZvmQo9LthfadJ?=
 =?us-ascii?Q?9H27QarXAsB9o7OSFSqatbxyBSdgQUrbbHN//ckltC6L1TTTH+tCjuqUB82d?=
 =?us-ascii?Q?w2ZoZPitfrj0hLF26wI25J91kPxFJNs/X3a0MfC6ep/GLUJsDQju96C+qVBR?=
 =?us-ascii?Q?jNhORpPc4NxOQCv+E8orhMXDxoC327ylkMKuFXTJoKruZwznysH7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a32cfb0-d9fa-4ddc-9b8d-08deb0844c77
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:12:19.9599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw6VgK4ppO+eq4GNrae9g8nMLtJee4q5JjoFwl/ytwTAY8iHXDgkLiIeixjTYfm2qXgR3pigG575HyLPg/lOizy96obE4GQRUS3aBqctWIqtattHMGHeTAYdKp1BBIHX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13832

Current auto select format try to find from specified highest priority
format, and increment next priority format on to it.

ex)	A,B,C,... : combination of SND_SOC_POSSIBLE_DAIFMT_xxx

	CPU:    A, B, ...
	Codec:  X, Y

	Step1:  A      &  X
	Step2: (A | B) &  X
	Step3: (A | B) & (X | Y)
	...

But in this method, we can't handle format if HW need to handle some
patterns. For example in above case, if A and B were independedt,
current method can't find good format.

To solve this issue, the method will be updated to be like below

	a,b,c,... : combination of SND_SOC_POSSIBLE_DAIFMT_xxx

	CPU:    a, b, ...
	Codec:  x, y

	Step1:  a & x
	Step2:  a & y
	Step3:  b & x
	Step4:  b & y
	...

Fortunately, current auto select user doesn't have such limitations.
We can keep compatibility both method if we updated format like

	a = A
	b = A | B
	...

	x = X
	y = X | Y

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4619.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 57dcbd1461ed9..58d5b2994fa0c 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -783,6 +783,8 @@ static u64 ak4619_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
 
 	/* Second Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
-- 
2.43.0

