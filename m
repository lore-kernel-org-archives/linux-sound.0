Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B117C2;
	Fri, 28 Jun 2024 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719534136; cv=fail; b=ZQGcKEwuWZFqhqrQwL2WnoQ1mrYIm+VfQwRTT+2mF7IoRRjfCt6I5G5wt4iEXRV0QbYXhjuqDNzXMa/yPtHt+dgx5zLB5eErXbOHcE8i6QnHCCDNKCO5F1PW18LrixnPXg9gM4fxKYDpLTyu+VKFaTHhQ+4kx0JOcKEcCV8Crik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719534136; c=relaxed/simple;
	bh=2c6wH/CiLNjp5K/MAQUSPgCiheALXVbdYu3rrAIxayk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rHAG5ZEvGd81mz42Xd9QBb71VTs3LVAnNgW3dfEI0dktjFx62lNdiTHz3qhj+yga5Pbi2NITughXOOVN9E+0Og7pvNAyQCKkto8+kJCd4lKM0Pw6bpzmSx76GdGb/FOHroyksXUMmq4vr+Eu1TwgDlqz2rzRgO/KjDd8f8g4xKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ObM4wqUK; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ObM4wqUK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiJemG8ZdgH4hxGvUG7Jg8rRO4Ra+dF/ebi/05dvfzZvw19UbszeYKIE53zPP/ZPdujMP6cIrBq57ikOKxDbELI82Tp5AjeOZHDrWmzL3kFla2hdn61YCs7sPYa55LcEJCom9JB4rlBA//TEIJeOwNm3twYqClNF9++8C2twgqC5ax1MKRnuZb+pF1JsEydoGlO4tkjVoVvmg79kthfl1jQEplRrI9ZmMJdz5pe9aFUSzptPOWmG/6rg6eDmrPYR1E09SKQxurOb6ikwosSwuqfBdzxpMKMSE8URYGp6T70ehbGgnwtWQbpMBUi77OBdIWUi3XOsIUhNXI/ZWT5B4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iZ6X/RpabMMZWBLxZ0BqR5TQ8Aud51uEDDvICGio9A=;
 b=RQoAlS9TyU/eHZAUjEPqmwG5pAra6JQWEIl05cU86rZ9BWBmpGclnM7WZQ44VV8NapIXU3zY3qLfI+PaNtRrs3rZgSoyjcy8fJwfJ7oxzQdg6Jt7xxp81mJhuRHIOG/n9rdCEbvIqW0yWyh25qcLSGJ6K5gnl4s4KZcrC9lfsNggbO88VtkEfXdrfqPBOJQRhZuRFPQh+heNyyNBB3MFbI9ilfALfTxzhxH3a8Rw7F6XdKghGdYgI3JJvdHfDaAYUc1rI0dD7ZCTFbIbuAvQ2fkOaAKdLaJYKtu27bdkxeS7BEp1ww97CmZA9VkUDx47EYnFxolq6fMDheS4JrG3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iZ6X/RpabMMZWBLxZ0BqR5TQ8Aud51uEDDvICGio9A=;
 b=ObM4wqUKAZD73au1zzYXUhQWXz30WTOJas1btH5HJAXctPLCV8vxjeMFd1SYp6uQbanA14S+F7jI3W5TYiCnjx6PUwLejuOQHNp6MRtvuG8A+vtrTVpcrVOPgf01ekG4vbjN+OQBdukgdvZjx5xxBGiR0EdCtlrZcYnXiC7vsBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8848.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:22:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:22:10 +0000
Message-ID: <87jzi9apcd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
References: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:22:10 +0000
X-ClientProxiedBy: TYAPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:404:29::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7b41af-6ac0-4ad2-1602-08dc97085a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9aE0jULLZKdIjHAYIyljpsAAaqW7QqKX2IDffgJ5F2WRomI/YhIuSRcG2BaE?=
 =?us-ascii?Q?qyFlcCsZullDBNub+pfZxjgHajtP5l3sQgFb5xsBilECb2DfySmtJKHfHi3b?=
 =?us-ascii?Q?fMPaPzZGynDMXBJrZ1k0g8rU/y6R3ra0m0N2lvz4aBfrVnncIlaCZe1tXsZU?=
 =?us-ascii?Q?e6AlTPjMPZ2TI1S3IcUyHjNdwN3JtItixBqT3vgBlr62RtabSWf0hNNHy2//?=
 =?us-ascii?Q?Wamc9gTtGU499O6Cp5+e+uaNBbK+LBwAnP1tf0uoLnli18fEhZQfJgRYAGxT?=
 =?us-ascii?Q?4hu2lDGHs2OCcbncEBYwJ0rjKePMSKhoGhUInlBI6iOZPWMM1kuNWMhXi6B2?=
 =?us-ascii?Q?MYBP7RuWzjR6Ok6BSa1TUtkaE4jTL5pyRmur3HwCXB9Yv4aevHI50WPur+Jc?=
 =?us-ascii?Q?YApOMrEjgnEVijldkMIdYdKdtm3mGsMoQtTcxMfGu131BhZOQQrGMXhTbqau?=
 =?us-ascii?Q?+vuRC/xwSKSTR32UdrM9WSuEreoAEWNNKyDV38nSEwQkQ0N/KMsCQHfipAjL?=
 =?us-ascii?Q?tcitUtvsFpPd6MnCSkWwSoWjQdNH7xvgUUzH1RS0P/nbc640mdyxNY8VdSim?=
 =?us-ascii?Q?wl7tXILedU42qRUu6g2YCN8V3B+ap4TkPXG8wk4F/2Ql0dumDxciUw5oqMGH?=
 =?us-ascii?Q?vb8CgahNvS4gK85QgWsvTa6Ai/l2ivrLBbefU4bBBahVRET+fhNX9Tgd/gHN?=
 =?us-ascii?Q?FLOb6Cnw5FDGn618SA1WpS0fmTptOEIfWPmJxRixE8KWgXKyVQvdWXg4rrcz?=
 =?us-ascii?Q?Lbx+h6Cut7eG2Vov/p5LQkdzuzwCOqfUe/nRoqb5kukc9NGtkvGJxPumHWDC?=
 =?us-ascii?Q?jmaLr984LknL3SH359nHaepo729K3MlR8OMgxU964Ad+tdZNy3TX60Txq/3E?=
 =?us-ascii?Q?x5rndfXP4N8JL9teWllmXZlHgRNl8sK5kqXfZ5ok01MxpFIOmpOQ6G5RFCFb?=
 =?us-ascii?Q?pdF0cq0HQRiD7nvyjpLPATcB7wj0Z8Ry5qy6KzEYHIvB+eIFADU8sHjMh3uy?=
 =?us-ascii?Q?rOgg3WlECx0FSFYXh0uBAFdqWTVe0XQ3wGRXZOSm4xoqrzAskFHjGARABp6I?=
 =?us-ascii?Q?wJkX6n6U7I7Ksfnyd/c2iVIh1JufqDQS28CPpPCQxNnybnA35a7zhxEgJzPy?=
 =?us-ascii?Q?EFMFBwrMKYl9ShGj2CTV3CSBXke9pfvjLIpZGZBeVkkd0p5VDrY6R7pFQghH?=
 =?us-ascii?Q?UGnxeA6rF/ayZvi+3oHHlLnuU+jif+oBeh+VTIDISRWxoBSUMHfF4oWiYVA2?=
 =?us-ascii?Q?BdkUwTCSRfVrMLMEvGM1N/rk73V/XZXDviE6ExJpt+K4tuAxKa96s7O1MBX3?=
 =?us-ascii?Q?t5ikbrBIBGWk6cQb4ArcNp4Dp0wSEjVRmktYKl1oYX9/nhcK/350dQvU+3Y3?=
 =?us-ascii?Q?W2XLZUiEm4PnNtXtBiq6wJnsYILpLdAgbC+2ZuGBzDfkonzvip4ZnScJX1ei?=
 =?us-ascii?Q?aQ63oRIVG+s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IqdrK98KNROgHSBN9CrobWeNvvJr/KtwUn8emhDqONB9A2oKykBdYON+Xpry?=
 =?us-ascii?Q?JY5XA4OGyh+J0fa0HtzP7Coch3mCS8NgnPGDyBLOd5M2BMf/kHQRzGfalY/t?=
 =?us-ascii?Q?8jEtLuB1jkYHo77hAohUpuRag+4J9Ur2+H9sqrGTAHwmQApx/SEIBas999C2?=
 =?us-ascii?Q?eHceVHd20TFUw4bi2AKzFd2GLNDo8po1RJhuckws+4pYUMZuRhD+er6ngn5i?=
 =?us-ascii?Q?QoKrFgZ382xC/xznC4wc0/xrobwPzjGy9FKId6JAstTtfbSmhzfX2bMDAmYF?=
 =?us-ascii?Q?062FaUdLmTTi+Gg64V1vIXwJgMpP0vCJPgMRr3Sz+anY+4J6fHGZRnQL9MyO?=
 =?us-ascii?Q?+S/nf3GdLIi0MHNtg+U7dHy9+AYeUrsuXLbjp81ygk2NKO3pc43duMMykLkj?=
 =?us-ascii?Q?ZCd2f/9vV6W9r67oMW+XXYJLReS4P8aP1XrMYI6OxmV2teXnAJiXp2jrAkhj?=
 =?us-ascii?Q?pF68qvm+cf3QXvfOm+uxgIQ0k20Is0gMxZIfMhoD0Qfs/P3da4SIl3z7UrMy?=
 =?us-ascii?Q?fUNeYDRfdhc38t/oLhxM6EkrqTSN5ilKPHpCc6Q5DnRcXq1l43YmAyW/jUjL?=
 =?us-ascii?Q?j5Lt2Y3NoHYrW3sqr+T9vu85hTSpcuYIZ/inznecCyXw/d0Qg18zSiUEaRhu?=
 =?us-ascii?Q?mCoCNlHILDOJFXV7YDS8qO7xceYiOSoy7ve4NTQyvNmwosP/j0Z3E35gYQ3X?=
 =?us-ascii?Q?7IDA0VZgaWcyaEIri24LaJffxxou7AWuX6Pfx4/YbC5W3eh5A2rnieplNpRS?=
 =?us-ascii?Q?V3bDwxvCTpzHTGwOQqzp2ANWIeGAxmE76aF0bGVXsD2SS6EWbnq56/SZhHlv?=
 =?us-ascii?Q?QlALDR2mLIUh076ticxWZksMAmWE+kukEETu+1jAzb+oatI01JpkIAk3ZoVd?=
 =?us-ascii?Q?TX6fDqCUG1w5RZ57q48wStHRTKgTPpP1CkJXzwgm8beWh4yAYJ0G2NIvQlmN?=
 =?us-ascii?Q?VsLd5KU4IPtxbeU8FAUw8DSioRz122antWvd7dt/j98FfRQv7C7jSCJX/gQD?=
 =?us-ascii?Q?6EAKDg28byNm/mkU5Xvr7zeOEIeBWXRi1fkDZiaXAlHoZHRPsIgdCD0outJG?=
 =?us-ascii?Q?lolGgVumWVtEkHxHL3+JYtP8Q3/HMQAKJGGEJaBX+xbHfaPEpH/pZ4KaqAjM?=
 =?us-ascii?Q?aXyEZwX8Zt9t/jRQq2yD/nd2kHh20WBozmUrYcD430W+HZ2fDiDAId/eOIKE?=
 =?us-ascii?Q?1fVQ64IC2b8c3UQketkEy7Ox7PYdE2yyvrNAYLEzR6JnOujESGriKJ8K4/NA?=
 =?us-ascii?Q?UWGPW4BX172In8kRcGnv0IOxZNlHYHYmXq+4EznycRmQ4ZHxKP/vgMIRNeVM?=
 =?us-ascii?Q?1lf2xHfMuT4bCypLpNpO4hUFnw4fIdlzWRAT0HCgjYiEkUWdZwF2hI+k8RIe?=
 =?us-ascii?Q?kxku0N7LxOSCCxSnSIr4BdPGlJfVB4/XGli9ggL0opzt+AmDS/VqgTgBrSxe?=
 =?us-ascii?Q?46BxRqZHVSHJgOnMr223LjvXzOBcZqbwjU5AjZPGpSIZt+3Hj7MGHmgQJCG/?=
 =?us-ascii?Q?5uvcj7fDBlMIbU7xGrINbKrdj0Zrrtz5Z27EtmR/HPqIsxy4JCkHdI5x/77u?=
 =?us-ascii?Q?Lg4m5P/pmaxq4jqo0t7PjwRa7pLAl+s6jcTjUZaoinouqdJFEtR6jWi4qaN/?=
 =?us-ascii?Q?cD3EOAB83Vea//EdGO4Y+uA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7b41af-6ac0-4ad2-1602-08dc97085a03
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:22:10.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2cdZR8XvTGvzdXO62N5TnqS8rP2Zc5L70c57UUKQ57z8Nhw28QazJKZo0+KbRCaguFpj6f2cQvfWflpfW5rjbDBgQz0VnfY8YdnLlMF6vhdmAVV4uQsZL94hXsDiEAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8848

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would
work, but might be not user friendly in some case, for example in case
of system hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state
names.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/simple-audio-mux.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 9f319caf3db74..ce722babfe540 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -24,6 +24,10 @@ properties:
     description: |
       GPIOs used to select the input line.
 
+  state-labels:
+    description: |
+      State of input line. default is "Input 1", "Input 2"
+
   sound-name-prefix: true
 
 required:
@@ -37,4 +41,5 @@ examples:
     mux {
         compatible = "simple-audio-mux";
         mux-gpios = <&gpio 3 0>;
+        state-labels = "Label_A", "Label_B";
     };
-- 
2.43.0

