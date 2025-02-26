Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A531624C3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533376; cv=fail; b=nesXYaWzNsOvOvOZH/pqG9D5xurmbiQvweHiTFP3ynFxat2RuKuh3/Q+i16EI5cQelgl3vJI1vgGc3kMZvegZQFc6Q6mktEaW5viOpt+Z69Fpnqe0rDqOIluShKk65UcZVVAMm57cgYYBfeAG2dzCIbvszuGdWd4wwZ2DF/IwmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533376; c=relaxed/simple;
	bh=FCBnwpWnz7PbQLZrPYNJ8sxvr+xbeuiyTuv2nEuD5rY=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=lgLKEg56KNZrJjVlmM1IRUGieLJjMB7xszVjDzUf29gkTW3d869aYMZk7naJhuLMJlNPpvBgb88bIcmfbiafnEcv3lACnVQj9DLT1SWBrU1qbknvBzdi58qfOpaTc52yM/4HHnXijf02iQZOsy0zFb2tbkhh4UkgZFwFZzvPMoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MdJBvLVw; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MdJBvLVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIjLBfxSaxdTExl3DPwu3FFTGrPCxLG2w96JJQ0OKglMKVIg0h8co1ShFZPcjjaypF3pIRs3Q3fSmiPpU5viOExK06bS0KOO0wXGes5X4aZ94Rw3qCC7Nr5yL35c+BAbaw2aXYFvScBfQqmLwmqmcTJfuIHbwVNXzieo8USqjWXkIP4WyNfDJ9YV0m+AYKz/cKOK/11u4edVkfJyI58WzdmuZDXRKlv6/OzmR8oSVfB1avdhYV2NVSoPcxhbsQm1N3nuiv/HoThZwkaTyjV3aqRL8hTAkeN/0yaGOLMOljyy2JS6xduR9Q7BtPxetcChQcy7T60XwLPeVEjkxq6Fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LX3+AN219ZxhhNDKGUcxeksS8MKa9t6BefDJpeihDQ=;
 b=J3PgM41HBKlybhAI8s9k1OfhCJk0NytROI+KmQXH+ndHaw3HLlttXmKSJjz6rDNsjBSQ7Q9LOj1RciPFfWNcbT7e5qlhS7+4jj2xGydMUnvMMQc54J7wvsDgLtkjhpmmpT2oKJBfWEWjLhs3sFRcMiGzOGL1FplX1+nhZoiZ1GEqiLwUQYlN/mxyLuEu3GRRzvrtPyNS/T0tURvJfOHTYRY8FjjIAGfuTvt4GXrzNBT8GmM0nXtdECojPgO8SmJsGPCahmGKTF/GaTc2c4d7nPLuhijTpv2cRDpACiRM6EUbvt+xJ4nVV4j1nq/w8kSJRwXZOx2h+j4eJd4RooUx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LX3+AN219ZxhhNDKGUcxeksS8MKa9t6BefDJpeihDQ=;
 b=MdJBvLVwZl915WWuT6aTlLcgUK82j/Wwc/ZhTeEiCKq1Sgj3oRqjFSkV/Zu2LU+xdBXBC7mRFvNs7KaymDZXlhR5xvQj3QQYuoxtNJqwHjixBTY/mkAfp9DMjDo03BBLJBJY/s3LoEuTY9NNElU2OGdiln7SrQ2fMYwOHyO0V2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:29:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:29:29 +0000
Message-ID: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 000/157] ASoC: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:29:29 +0000
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: a99f70a9-d73c-4c1a-eabc-08dd5605039b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FdDtRSIWWizTKgc18juoiaavvLAh4nDS9n9VuamhH8gdcqh+5yceIml5MU8N?=
 =?us-ascii?Q?Fx9m/C4DMKpnRrN6dkY9n8ia13O+2a2nRAieCs27Z1Wt2zc8HPJFEubWjk4/?=
 =?us-ascii?Q?uBqpqkR1cjk/Z4mYzxTVTpYslCg/tgURAK2Zlez0ZdYaOgJPEtedR/6cuf23?=
 =?us-ascii?Q?6ZQ4mN+IDPZdRzfwi/BNQFVrxw+sfeOv2gQTBRSw2wL8LBtNxaFDWbOWN4Qd?=
 =?us-ascii?Q?uzHQr+eUwBm1ok2yOtMWtWjxbeae/AF6e+2TfVOQvDZ/g+pcnUtH0Pz/X8cp?=
 =?us-ascii?Q?ExPNaTVBIyV/VqRjMHnZxN+x52k2Bf1HHY5FFYTdm9Ia4p5K5jDTkeGcNbyX?=
 =?us-ascii?Q?IPGrxox66lDyAAyE6nVuaUR3ES9jolBHpehtkT1FPnam+ty41BHN+3QsLcCP?=
 =?us-ascii?Q?Kfhz4is/t2jjOSv6b99mRODk20SQmWQAm/96B3BRrIkcHypEMkwdmzcP5K6X?=
 =?us-ascii?Q?dm4HDo4pBMYJnzpxMh6OJmhSSPt3PUErWhJqLhnkFpurU0QhZq2k8o4HVdjR?=
 =?us-ascii?Q?ZOUj64D2RWbcMmPZaM1niLIqNbBUsG7BY4+fuoJthZ/BeJC3ywUFsOFkWFsG?=
 =?us-ascii?Q?5aOijAW7G4EIG2agE8FlL5IswFZkQhFbzZkKKfs8lfkggRvCmKU61+1WmCMr?=
 =?us-ascii?Q?r2J8vaFeBHtwe/J0Aal1MaP3nvqCfQpnbOjCCS/JmSQdITCyKN9KqIQGUQd1?=
 =?us-ascii?Q?gz12rExSwcIw7cJ4mjFs29SvSdajcotiIiXz/8lwU1xFyPgP74p4SrpVSywy?=
 =?us-ascii?Q?EJ5DSfFNiQSOy5hY2lLtA6U4X7YghDphDtFNtCxLZD5CP0Xc4IJ6oD6cP8oL?=
 =?us-ascii?Q?wp5zrnK3BT2DXbCxt3BnhV3/OGn5NAqFOAX7SUslgTiRFWzmMHFvdoU6CjsJ?=
 =?us-ascii?Q?fzwrJbpo//iek/EGACB3YIAY9bpUC+IzjaOM5fWQezJ5rtunCRcrbFWnmKRu?=
 =?us-ascii?Q?ik66uDPW0cPaK2YffZ2GmuNiRtUq0+33ah6kHxWZ9aBQef2rHWyvv6AZMssi?=
 =?us-ascii?Q?Ot5W77KuYy0MWU5EifrHPnV2SjFne/047yBQli9Bku0dKRkZCI6qQavE5EI1?=
 =?us-ascii?Q?vxlHQjXe9bYD+aEXHHMzfNyVSI2NKKuxceirQ64o4qL0MXnwfsotx56oseUN?=
 =?us-ascii?Q?I3s3r11VAHTRh7ojiieWmoKKSpk4pxYN3NvTnvTl/coZxAUkMujYHmy1VJQT?=
 =?us-ascii?Q?+13xHgRkZeolv1c2qfyEABQVdWG/YFNZpGrWXXS3my+onDzOOs5XTVmsMdGE?=
 =?us-ascii?Q?tSr3CyR/MLE0asj+LDds45/00dKLH2OsxfVV26XDCaJD3eRzkRsloB8tBTRW?=
 =?us-ascii?Q?2G4mlqHM9aaWdUaJ7128vcUxrMDmXtkN0zDkvRI9/+6gSTHs0ykc6UHxNSA+?=
 =?us-ascii?Q?/EFZmQHjiGgN2XGWd7sps3jmPL9Z+lM0HFg2qrOx9zmdaepqJgUTOYldhZg4?=
 =?us-ascii?Q?+/4mDHft0l2akkflZV6WUBmwb5LUefDP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JDG2aOyHRa32atvFAQC2kamwISJwNqbnbbgirGCqseRZIc8fpk94MZnEUMvt?=
 =?us-ascii?Q?AufpWMXQ4qAuMdm/zMUroIkL36GpWEQO4QbOMthuVENtAG5+MiLpU/FjLDFs?=
 =?us-ascii?Q?VTyg+Lk2lZXQY4QWQF26/knxtV0rVEjLsrgNG+js2z8K4m/nw8abN53owJvX?=
 =?us-ascii?Q?uh4V3ncQzqukmW8O2ulJwCcDtXc62s8kTH4qZywsyMa5XpsetwLmq4XSO6Ou?=
 =?us-ascii?Q?VL6fOIyisBTBT9XN5TtUyerqi9rBnpy78Y3qTgAqvgqFr/My5++CtI8IGo91?=
 =?us-ascii?Q?ZU+HgyDgtjfC8+pBBWoBSPdY7p/WNfLkkqX5AFQMdVo/2jdkX5GPXJNHr4uf?=
 =?us-ascii?Q?0y0e1oRiDpiiAQZp9WFAvm2AcxFnKDNItEa/6irPOEzTdqcL2C2qlfZaYAi1?=
 =?us-ascii?Q?95x+a4NSrIDEJB0LjMEO1EqtoclOi5DghbsvkHA8GoDUVvP+JM0ou4TpBt5O?=
 =?us-ascii?Q?b7emlzSqGgR8PLkUk7T7G5FdJJgWIRI+SBjsVOxF6Alx4pYv+RkXZCKof9wH?=
 =?us-ascii?Q?kD3RjLQi4tmu2Q125GAl3KjoppSNaLMFtibBHrE22BtqOgV65SYrdwG5VWYW?=
 =?us-ascii?Q?E3or7mKK6kGOIqg8lYBqoKKSmJFujMpZqX9lXhy4UlRRc5KLJ+31BfvJGDBZ?=
 =?us-ascii?Q?YIkfhwmJJdN3Hbg03cgpEG0nVX7628Zbdyw3k7KVgpPn+bSEf9IaRpqCVC0x?=
 =?us-ascii?Q?eID9Z3TyNCo2GVNYOE88zvxQijtmeU9lIDkUd0X8bGvZ9cjlR8h5Cx6nszSi?=
 =?us-ascii?Q?t5r6+ZvbjWWdqOtM3kZCOwjQ6JJacu1dTuvLf6LzjZ6zXZY0gwQGnbgSMLsx?=
 =?us-ascii?Q?Zok5Sgi6baBR+8K4h6ZNOch3ab+25lbMtEgSRmBh8CI+6TS56ZtSaoNBF3Y4?=
 =?us-ascii?Q?P/hfSMOPCdViGJsw3km9qmcNbMRQ96P39av0T8ZNtU+ciGGlI03PBDuYhOMY?=
 =?us-ascii?Q?wWLBzGtXzqsZKw0C/VdfrxHo0lfRr6Ar6saRHpsKBf3iPNEwboy50zl21yez?=
 =?us-ascii?Q?rNNFG4KfE7PBOJAS85JNnwXczB0o2NzuAk00BsoVaVVSnI9A/5tqMkcDIHe7?=
 =?us-ascii?Q?THw6XzE/qjBlPMNvfO/oW8eezYwMCWCbGUvacx5EdOPeH5ky+OU2Rs1ZWSBd?=
 =?us-ascii?Q?NCt/RXsalPjsLj3iNLdbUNrbuA/U+4I2CLIcksG7MrzQBi2bGYxqtzgf3av3?=
 =?us-ascii?Q?4OR8NQC0HK6YLO+j+blyVyfENbBt+TzOxbE7wGNt4ET1HsU84ei8OFgPX1cV?=
 =?us-ascii?Q?Wj3kXoWoZGNV6PsAcggm8zTbIn0Jlhqiy9ckLa+69tienFdySOJX4zbpv9Q5?=
 =?us-ascii?Q?s+LtYilSYIS1z8AGCbuIoLG2zcvk3j5h6ZI5zOPkfuRlHYuGaCH2pWvDC1n1?=
 =?us-ascii?Q?4N/pgqZ3aPEeVrJC+scIo2Nvw6GEeo5V8vFhmGdt7XwWvd1rR5o1sPbNPzFq?=
 =?us-ascii?Q?uejoZwaBQayvIRs7KgLJUnON4XrP0baUVbBgwiQmLw8uw2l2UQsiAlqg667n?=
 =?us-ascii?Q?jrBQkYWbMAaQxh6jMEtd7bGe2nul8DbdYVVlV6fajcVMFYY2mlHtqPmTnr+r?=
 =?us-ascii?Q?WP2MXR6wQhtdtiiiEDH2bZoZE8Y15DiH5Lob+qIymEnZ2CaJN3qEK07BX7ps?=
 =?us-ascii?Q?z0eKHW1CT8UuVcey7MJCtEY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99f70a9-d73c-4c1a-eabc-08dd5605039b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:29:29.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVU/CD2Ebrke1lreVeNlLoAqdGVmAHUOj3aKl5t0Jdde6BY19PJIXPE3OcD6fAnhGxd1e0+/REtO9jkv2ArjUgx+3KhSubqp0sXFuG5QHhf5Z8Y1L1Ct7a5TKFxDhA59
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

Hi Mark

We have both

	(A) SND_SOC_DAIFMT_CB{M/S}_CF{M/S} : Master/Slave.
	(B) SND_SOC_DAIFMT_CB{P/C}_CF{P/S} : Provider/Consumer

We should use (B), and want to remove (A). This patch-set do it.
It is based on latest asoc/for-6.15 branch.

Kuninori Morimoto (157):
  ASoC: Documentation: Codec to Codec: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: n810: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: osk5912: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: ams-delta: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: j721e-evm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: davinci-evm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: omap-twl4030: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ti: omap3pandora: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: amd: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: fsl: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mxs: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: pxa: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: qcom: sc7180: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: qcom: sc7280: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs4234: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs4265: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs4270: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs4271: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs4341: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs530x: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs35l32: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs35l33: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs35l34: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs42l42: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs42l51: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs42l52: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs42l56: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs42l73: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs42xx8: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs43130: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: cs53l30: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: da7210: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: da7218: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: da7219: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: da732x: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: da9055: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: nau8540: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: nau8810: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: nau8822: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: nau8824: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: nau8825: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rk817: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt274: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt286: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt298: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt1011: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt1015: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt1016: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt1305: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt1308: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5616: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5631: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5640: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5645: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5651: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5659: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5660: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5663: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5665: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5668: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5670: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5677: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5682: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: rt5682s: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm2200: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm5100: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8350: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8400: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8510: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8523: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8524: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8580: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8711: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8728: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8737: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8741: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8750: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8753: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8770: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8776: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8804: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8900: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8903: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8904: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8940: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8955: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8961: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8962: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8971: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8974: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8978: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8983: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8985: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8988: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8990: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8991: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8993: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8995: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm8996: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm9081: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: wm9713: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: arizona: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: twl4030: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: src4xxx: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: sgtl5000: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: codec: lochnagar-sc: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: ux500: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: meson: t9015: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: meson: meson-card-utils: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: tegra: tegra_asoc_machine: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: tegra: tegra_wm8903: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: rt274: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: rt286: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: rt298: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: rt5514: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: da7219: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: ssm4567: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: nau8825: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: max98927: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: intel: max98357a: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: snow: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: bells: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: odroid: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: arndale: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: lowland: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: speyside: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: tobermory: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: tm2_wm5110: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: littlemill: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: smdk_wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: aries_wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: midas_wm1811: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: samsung: smdk_wm8994pcm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt2701-wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt2701-cs42448: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt7986-wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt7986-dai-etdm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8173-rt5650: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8173-max98090: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8173-rt5650-rt5676: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8173-rt5650-rt5514: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8183-da7219-max98357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8186-mt6366: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8195-mt6359: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8365-mt6357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8365-dai-i2s: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: mediatek: mt8365-dai-pcm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: rockchip: rk3288_hdmi_analog: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: rockchip: rk3399_gru_sound: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: rockchip: rockchip_max98090: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: rockchip: rockchip_rt5645: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
  ASoC: soc-dai: remove SND_SOC_DAIFMT_CB{MS}_CF{MS}

 Documentation/sound/soc/codec-to-codec.rst    |  4 ++--
 include/sound/soc-dai.h                       |  6 -----
 sound/soc/amd/acp/acp-mach-common.c           |  2 +-
 sound/soc/codecs/arizona.c                    | 12 +++++-----
 sound/soc/codecs/cs35l32.c                    |  4 ++--
 sound/soc/codecs/cs35l33.c                    |  4 ++--
 sound/soc/codecs/cs35l34.c                    |  4 ++--
 sound/soc/codecs/cs4234.c                     |  4 ++--
 sound/soc/codecs/cs4265.c                     |  4 ++--
 sound/soc/codecs/cs4270.c                     |  4 ++--
 sound/soc/codecs/cs4271.c                     |  4 ++--
 sound/soc/codecs/cs42l42.c                    |  4 ++--
 sound/soc/codecs/cs42l51.c                    |  4 ++--
 sound/soc/codecs/cs42l52.c                    |  4 ++--
 sound/soc/codecs/cs42l56.c                    |  4 ++--
 sound/soc/codecs/cs42l73.c                    |  4 ++--
 sound/soc/codecs/cs42xx8.c                    |  4 ++--
 sound/soc/codecs/cs43130.c                    | 24 +++++++++----------
 sound/soc/codecs/cs4341.c                     |  2 +-
 sound/soc/codecs/cs530x.c                     |  4 ++--
 sound/soc/codecs/cs53l30.c                    |  4 ++--
 sound/soc/codecs/da7210.c                     |  4 ++--
 sound/soc/codecs/da7218.c                     |  4 ++--
 sound/soc/codecs/da7219.c                     |  4 ++--
 sound/soc/codecs/da732x.c                     |  4 ++--
 sound/soc/codecs/da9055.c                     |  4 ++--
 sound/soc/codecs/lochnagar-sc.c               |  4 ++--
 sound/soc/codecs/madera.c                     | 12 +++++-----
 sound/soc/codecs/nau8540.c                    |  4 ++--
 sound/soc/codecs/nau8810.c                    |  4 ++--
 sound/soc/codecs/nau8822.c                    |  4 ++--
 sound/soc/codecs/nau8824.c                    |  4 ++--
 sound/soc/codecs/nau8825.c                    |  4 ++--
 sound/soc/codecs/rk817_codec.c                |  4 ++--
 sound/soc/codecs/rt1011.c                     |  2 +-
 sound/soc/codecs/rt1015.c                     |  4 ++--
 sound/soc/codecs/rt1016.c                     |  4 ++--
 sound/soc/codecs/rt1305.c                     |  4 ++--
 sound/soc/codecs/rt1308.c                     |  2 +-
 sound/soc/codecs/rt274.c                      |  4 ++--
 sound/soc/codecs/rt286.c                      |  4 ++--
 sound/soc/codecs/rt298.c                      |  4 ++--
 sound/soc/codecs/rt5616.c                     |  4 ++--
 sound/soc/codecs/rt5631.c                     |  4 ++--
 sound/soc/codecs/rt5640.c                     |  4 ++--
 sound/soc/codecs/rt5645.c                     |  4 ++--
 sound/soc/codecs/rt5651.c                     |  4 ++--
 sound/soc/codecs/rt5659.c                     |  4 ++--
 sound/soc/codecs/rt5660.c                     |  4 ++--
 sound/soc/codecs/rt5663.c                     |  4 ++--
 sound/soc/codecs/rt5665.c                     |  4 ++--
 sound/soc/codecs/rt5668.c                     |  4 ++--
 sound/soc/codecs/rt5670.c                     |  4 ++--
 sound/soc/codecs/rt5677.c                     |  4 ++--
 sound/soc/codecs/rt5682.c                     |  4 ++--
 sound/soc/codecs/rt5682s.c                    |  4 ++--
 sound/soc/codecs/sgtl5000.c                   |  4 ++--
 sound/soc/codecs/src4xxx.c                    |  4 ++--
 sound/soc/codecs/twl4030.c                    |  2 +-
 sound/soc/codecs/wm2200.c                     |  8 +++----
 sound/soc/codecs/wm5100.c                     |  8 +++----
 sound/soc/codecs/wm8350.c                     |  4 ++--
 sound/soc/codecs/wm8400.c                     |  4 ++--
 sound/soc/codecs/wm8510.c                     |  4 ++--
 sound/soc/codecs/wm8523.c                     |  4 ++--
 sound/soc/codecs/wm8524.c                     |  2 +-
 sound/soc/codecs/wm8580.c                     |  4 ++--
 sound/soc/codecs/wm8711.c                     |  4 ++--
 sound/soc/codecs/wm8728.c                     |  2 +-
 sound/soc/codecs/wm8737.c                     |  4 ++--
 sound/soc/codecs/wm8741.c                     |  2 +-
 sound/soc/codecs/wm8750.c                     |  4 ++--
 sound/soc/codecs/wm8753.c                     | 12 +++++-----
 sound/soc/codecs/wm8770.c                     |  4 ++--
 sound/soc/codecs/wm8776.c                     |  4 ++--
 sound/soc/codecs/wm8804.c                     |  4 ++--
 sound/soc/codecs/wm8900.c                     |  8 +++----
 sound/soc/codecs/wm8903.c                     |  8 +++----
 sound/soc/codecs/wm8904.c                     |  8 +++----
 sound/soc/codecs/wm8940.c                     |  4 ++--
 sound/soc/codecs/wm8955.c                     |  4 ++--
 sound/soc/codecs/wm8960.c                     |  4 ++--
 sound/soc/codecs/wm8961.c                     |  4 ++--
 sound/soc/codecs/wm8962.c                     |  4 ++--
 sound/soc/codecs/wm8971.c                     |  4 ++--
 sound/soc/codecs/wm8974.c                     |  4 ++--
 sound/soc/codecs/wm8978.c                     |  4 ++--
 sound/soc/codecs/wm8983.c                     |  4 ++--
 sound/soc/codecs/wm8985.c                     |  4 ++--
 sound/soc/codecs/wm8988.c                     |  4 ++--
 sound/soc/codecs/wm8990.c                     |  4 ++--
 sound/soc/codecs/wm8991.c                     |  4 ++--
 sound/soc/codecs/wm8993.c                     |  8 +++----
 sound/soc/codecs/wm8994.c                     |  4 ++--
 sound/soc/codecs/wm8995.c                     |  4 ++--
 sound/soc/codecs/wm8996.c                     |  8 +++----
 sound/soc/codecs/wm9081.c                     |  8 +++----
 sound/soc/codecs/wm9713.c                     |  8 +++----
 sound/soc/fsl/fsl-asoc-card.c                 |  4 ++--
 sound/soc/intel/avs/boards/da7219.c           |  2 +-
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98927.c         |  2 +-
 sound/soc/intel/avs/boards/nau8825.c          |  2 +-
 sound/soc/intel/avs/boards/rt274.c            |  2 +-
 sound/soc/intel/avs/boards/rt286.c            |  2 +-
 sound/soc/intel/avs/boards/rt298.c            |  4 ++--
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/ssm4567.c          |  2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  8 +++----
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  2 +-
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c   |  4 ++--
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  2 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  2 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  2 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  4 ++--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  2 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     |  2 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 12 +++++-----
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c    | 12 +++++-----
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c    |  4 ++--
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     |  2 +-
 sound/soc/meson/meson-card-utils.c            |  4 ++--
 sound/soc/meson/t9015.c                       |  4 ++--
 sound/soc/mxs/mxs-sgtl5000.c                  |  2 +-
 sound/soc/pxa/spitz.c                         |  2 +-
 sound/soc/qcom/sc7180.c                       |  2 +-
 sound/soc/qcom/sc7280.c                       |  4 ++--
 sound/soc/rockchip/rk3288_hdmi_analog.c       |  2 +-
 sound/soc/rockchip/rk3399_gru_sound.c         | 10 ++++----
 sound/soc/rockchip/rockchip_max98090.c        |  8 +++----
 sound/soc/rockchip/rockchip_rt5645.c          |  2 +-
 sound/soc/samsung/aries_wm8994.c              |  6 ++---
 sound/soc/samsung/arndale.c                   |  4 ++--
 sound/soc/samsung/bells.c                     | 20 ++++++++--------
 sound/soc/samsung/littlemill.c                |  4 ++--
 sound/soc/samsung/lowland.c                   |  6 ++---
 sound/soc/samsung/midas_wm1811.c              |  2 +-
 sound/soc/samsung/odroid.c                    |  2 +-
 sound/soc/samsung/smdk_wm8994.c               |  4 ++--
 sound/soc/samsung/smdk_wm8994pcm.c            |  2 +-
 sound/soc/samsung/snow.c                      |  2 +-
 sound/soc/samsung/speyside.c                  |  6 ++---
 sound/soc/samsung/tm2_wm5110.c                |  8 +++----
 sound/soc/samsung/tobermory.c                 |  2 +-
 sound/soc/tegra/tegra_asoc_machine.c          | 18 +++++++-------
 sound/soc/tegra/tegra_wm8903.c                |  2 +-
 sound/soc/ti/ams-delta.c                      |  2 +-
 sound/soc/ti/davinci-evm.c                    |  2 +-
 sound/soc/ti/j721e-evm.c                      |  2 +-
 sound/soc/ti/n810.c                           |  2 +-
 sound/soc/ti/omap-twl4030.c                   |  6 ++---
 sound/soc/ti/omap3pandora.c                   |  4 ++--
 sound/soc/ti/osk5912.c                        |  2 +-
 sound/soc/ux500/mop500_ab8500.c               |  4 ++--
 157 files changed, 347 insertions(+), 353 deletions(-)

-- 
2.43.0

