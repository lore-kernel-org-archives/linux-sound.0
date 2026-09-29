Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4D2F7EE9
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659785; cv=fail; b=WQUdVHcQDQpSlGRW4LtH/bbreAHOz1zCWRPjI3aMFJHfXyI8jyOfJfX5/RjDBpjvEL8epwZC6Ejp+byiakKxRb+6rsNLTOVQv/nObXJC9NKyhln8WkwmDdHA1ZZ+3mTE+zgVuq7zPk3y3YGS2631JbtXBA6p0CoB1Wwo/tED7AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659785; c=relaxed/simple;
	bh=ZTOQ7Z1EMB9AnWK8EcCRFNRzzcMA9K9NzbYy8axf7iU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VSBz2fcef5ZJT6GN5x7ofUiLAip+Lst7m4/+MuB4GZHsmneaGYkdg1npCAvGghambD3+Y2SXbvGXu/RMGQHg0WeH6x7AM5MBSIu/6S52lyUlC8jRk9I0pPUjcUzy3IUbb4D1tVoKCSRUjEZ5XuXMy4Z3tbPMB0z9FJxMlGZkvik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jPYOkz7y; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jPYOkz7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlou0yGFKdpU5NZs9tbNy/rRTOcLJLKgU4/Tx+G4NNZ2UhtcBR1yi//5x5VZDmY4HQ8YACyB2/f79zIEw6kTHa9d/jMUoAHOLXY8s0PBES+P2gIOIqypq4BeL+1lH/buH6Xw/34e10510AFMgTQoZggOEot64HFDBJGMsH0FGDq5BZQZqruWHReYqrhxEiuH0Vw5hJkgCcCjrgSJJDgbfpSAmZKVnKMqgUOuNwcTwYMel6kGuASjij/4tSmUg2aZCFyuInhhvGAVlHFmLHNFbQlWSi1Rga2vxv1V5eVrJkXpMtpf00TX66Sf0dyZYUpN3NVBlDjItKcY8KeuVRtanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc6RSftzWRO39WNLBq5s9TVQdlvFjN0nVySuITmepkk=;
 b=xnbbj1bU6smy6OUPH/+sDGvI9eYdMDrffF6q44RbUxUUYqWhvB24AZmsBP9pMiWjpY2JSTGFIM0SKXs5XcCJuGQ2N5zh1oHI9XlfG871rvxOZ8DE7WGroKzkk6RcdKO0J+RdB9TBDfYZtIrKWU6B0e64BKUkuqqvlHrDEJhsLfuDcb8juyHWSHRYhTk2WgtP9nJvOsRQnA97mgG6oS9WXGrfuJ66ZQNhiyBZhjAfZv1SjmEi8Iqk0EXK4pQzcX0mGDDBWujGctmxKBP9UNr+O5IG5CUxt+m37mBgSCfVXa8aeqJmkWSy+U5zYu8u6dEVJlMuuM3VMbEHAT8zlQFPqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc6RSftzWRO39WNLBq5s9TVQdlvFjN0nVySuITmepkk=;
 b=jPYOkz7yqxLzqTSJIRIkgxFycAUQVAXmyFzjPbKtG+0edjojp0dekUDgvfoFnaLDYJPsLdBBMvVYjHfCIJQ7X4ipfnxFumLTXrePCe46AhAIQXG9zzB/MJHkFdoFPoJsCRdn7AOtVdXizyWXC7886Z3VkIze5hkAhXeUtwniGhY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:39 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:39 +0000
Message-ID: <87o6dgeibg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/14] ASoC: soc-component: tidyup be_hw_params_fixup() define position
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:39 +0000
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a28a93-ae6f-478e-e588-08df1deaa87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SNdhXK6/0liVhoVNvR5xm54nOt4PKD0+FEPAtWnJ1CUQFYgNSSh9u+YCV1rAAgx4awIhuVyXfqD7DoE+HRT6xP+95L9XbtbYjwowSuHFbyehv+A/6yEKHCXlW0IzhGmxZTWMvIed9NItziwMXJfdlsG8MxT42PWbDNc/iGFyWeiO7onwfis8/+A5gmw5xfFtUQc/7REZu5MHBKdvPj3zDFchERZOoLSAZCYoHPdBoBxulm1nLjWoBP3rWgidZhuoLtSNDHySjp8N7mdz65GWReovUs1dwI8zI3kT4cr3Xst33OsuoiXuWbMgrzwUM1zMLcEw7KEmejU6/dZ6a6+b8v48ghIEJDn6+izuvAtYIP1fzWDoDWN6jZACzMDoyIdtCuhOUbNi4cMrdKXgRbReflY6vAkT6BMs5QkjOEIQyn8hjILtSFrCeiE2ySZB4ghBuGNFRU/H6frMB4BbsBrUlaULaIEvtvhzIXCrec+Da9aC1nb6m972j1bJx8A5yvGWj+MymlVPYER7RzDcBFsNuDMbhuoUH8eUiw2FH7maBXfYq31XRpUGsADayu7HMU54rJrCLCbgsBU0xKMYTDOkYBN/7CjXHxrYe/Kh5owD33In7/zH6YdsMA1xXw/RJg25fDbnnpAIeD/DQt56WfNU8EUJPoFlBqoFK6hlUeXJr9GFguJccw6WWfxedk+iFDFFHwmNKDHaVxucf0gNH2oztuPu6eG6GJqH/jgebkuAtNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOzHYGLtCvEhSBm/kOYLFd0YmlPV750W36nQclBCcFKGR3Pv2UC+4DWaIco2?=
 =?us-ascii?Q?4JGjF6Qgw7MRylD/RL/ivcvNEtOCP/XYWdtx5B7a1vxW5bproPgjRUPyspMT?=
 =?us-ascii?Q?X+fiTDytVyfENUqLw06KVcMQpx8Suvh9tfRVBHOcWwtqQjF198irHZm9WM+h?=
 =?us-ascii?Q?aoAG7UdRn2HJE+tXqu8ioHweGkPGrTzE2DdDV/x25diYAe4nOnFpif/7a4Yy?=
 =?us-ascii?Q?bEdqDRLgUE0w+o5uGZmMgZZkb7Psxgj+1Y9Kymg5Ed7ozDHGGl214MxPzsIh?=
 =?us-ascii?Q?zeH0Gae0OgTwLF71ZkSrdUVjQwhJPU1tdjrjlKHtIHAyhMxAQ9FSCNWW0Ylf?=
 =?us-ascii?Q?t/aniY0oev+cMzu0uNtouPHPKBJ7usztCHrNue1QRNudEEKDYwQ/Ze1q+HlI?=
 =?us-ascii?Q?UYLspLDkyAykijbd/Soz44cqmn/MlqLduJZ3aWpB2hx455yMtepTGzA1RrVs?=
 =?us-ascii?Q?Qxrx4zXODnCq6CnUKUl0A8DrT0vZwXSnlKWGQTbheTc0c0TlnWJy+MTb7QC+?=
 =?us-ascii?Q?61+Sn7RMLIBY9w3p+9p/7aRyU1KuW/xLJPfnYaAwK+3Qi42h/FE8+AgeohgD?=
 =?us-ascii?Q?BNWfA3h6cah12CqaSwK+1q2M0jn70qY1FeklU2s6t9e3i5/ThXiHH94NWwSz?=
 =?us-ascii?Q?I3ny0r46Hgef62ypSQvMzWXckRJydeXvV8ersIHvVeZF5By+SmlMnN+eT63y?=
 =?us-ascii?Q?DY3gY1qxTkYYatl23lvH9k+1v6b2fTqfL80nbGUxMygccdbN+U+gEbs/bsd6?=
 =?us-ascii?Q?K6AgBWdi00qo3MwzGtuXZpxSrU8xVEHGT8IJIDHb0jf/iTsUT8qSIDkLtQ1/?=
 =?us-ascii?Q?PIcEcuThpH1tDNQjAV8JtvujTSXqGnAKaObE0pPwGSsi+VELJr/hWLw2w15/?=
 =?us-ascii?Q?T9dco3XGh0kcPGljer4fNzEWdpOGXV+V1a/SKsU5695vtDSqsyeNAajZEvb2?=
 =?us-ascii?Q?TcOgza5Yb6KMkc/Uw8Gpv6+hLoZqTFj0Wtq65M6qrOoOd0/H0mYqllR4NMr9?=
 =?us-ascii?Q?sgbqtLI60N2zc0m0N/cNMq6n0/3kZRU7eH+T/rX8kA6CTBCOaeREsquNAD9o?=
 =?us-ascii?Q?i5CdFw31m0ChxMkTaJ/cgISfnFT4Cu+81TmHtJn9Ey97A+uGPNtXlKTDdmwN?=
 =?us-ascii?Q?e7ToVdAPMJlwPMrTjZS9GCaam/LjrpBAfdi8R0AbkztO3HbUg8+L61p+fx9P?=
 =?us-ascii?Q?BO37qkDcBqBrxRJwyyqFzzmixOvsXbD8fsSKwPG3BshmAjZa7VGCL4OawIbN?=
 =?us-ascii?Q?hNNkfRwPtnmr4EudG7Q+9Yo48nXkaDB/7xhQpoHUV9TeCzLhwIDpvBgWEXsk?=
 =?us-ascii?Q?23kjChKijMsQkEa41f/bHJcWsy8PzZELTugkIYBp/0WTf7ZDgMfQfOXO17bu?=
 =?us-ascii?Q?AOXShHmVTGJlxGVDENeUPEd0nLJMJWKprg/1E00CP35CGU7B8aHM6c9N9EkK?=
 =?us-ascii?Q?uqfDqfCS4bWRgpOEjOrJMd2ab1dFDJO8CPCQLOVqYJ01YR/bO8arE0LdwMeS?=
 =?us-ascii?Q?MFUvEhFqKT+Dvo+JRXv9hPsBzCClYJd6wYDcG2UwkhKPRMAwun9MnVPXIKMu?=
 =?us-ascii?Q?ctVdwzMCdqZ0GbTGSE/15AG3SYzVE55EbRzt5zrTiSxOPNecb3cPaCiU4oWY?=
 =?us-ascii?Q?N1GNCcdMabhwNPMk865gs9xYnjiRtfiVUNdLhWlgZeH13fd1PjNrMKPN+bmx?=
 =?us-ascii?Q?U8lwtejkJp1uaDkbxBQ1+YbfTi5Xvg75rye5d00kPtklQ/DDQP0p4wj5rbrz?=
 =?us-ascii?Q?oPdmE4Z6IYoSxn8qkt6BVO+ndPWJhdMl8mb1tzwaBluibzfeiu7a?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a28a93-ae6f-478e-e588-08df1deaa87a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:39.7503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AEjm1Hvp+bpK7GFtKRHvVOU4T6Mz8n+lOqFvEDRv3mrdp+AKUQGiPzYUADGKjnXD8ezdHPW/1o4QnnrHTzp857BkAXyPcL3xc5Tc5GVz6NWF2wBmjfeBzMH+QSu7Sky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890

be_hw_params_fixup() is one of snd_soc_component_driver callback
function, but is defined as alone in a remote location.
Let's move it to the same place as other callbacks.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 6c1acc984ecb0..2da196de6b89c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -154,6 +154,8 @@ struct snd_soc_component_driver {
 		   struct snd_pcm_substream *substream);
 	snd_pcm_sframes_t (*delay)(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream);
+	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params);
 
 	const struct snd_compress_ops *compress_ops;
 
@@ -197,8 +199,7 @@ struct snd_soc_component_driver {
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
 	const char *topology_name_prefix;
-	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
-				  struct snd_pcm_hw_params *params);
+
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
 
-- 
2.53.0

