Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD022256F
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179653; cv=fail; b=UaQsef8e5hTnTv6q9P0vxTifoy2RaSq9Axa4OH86ylAq+XlhUnxV3f1FwIbRKxPofmFRlwtCxyUrgFBKVBr/qhglKOLKRWEkaFSivl/wVYh1HEC6pzkipfBhqUlf+GAuxbr6dmbstvOKZIU60rjz+3LaXgDYTw/NsCDJJwhWxNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179653; c=relaxed/simple;
	bh=n6GPIQ44EGeTeNsThbr+01URDBRwS4v71PIriDFluxk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hE25Stf8vLyrKfpz+Qsqwz88DQDqw/8F4Fxh4U1qK+/k5+UtiRBQEzj05OwBH9MMaUmuSE5oGxbMIEbTcfKcp1sVc7UX5vg28Wrnl/ggL3jNTXkE3JOSf4WSEVFVgAtxdAjAx84yzn/cilbg9N6IF7cNh7YV5v5CtvjCRXsAWoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iyvC0NcM; arc=fail smtp.client-ip=52.101.125.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iyvC0NcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaVIUyQg/Yzl3/OTM3atmKyNgx9SqnWoY21o4gvbIYu3zTW/5O8PReEZUmQpeFW4lfjCv2YuTO5wKGjsBWJvtMM5ENA6IGGyon2iJYaQ6NG55Eowi0I1X9Uo5Ns1EA6PyFomdJ8DZLRm2+hbOVbPO+g3M4fP2g5iS5PxDYIMib+wfqKc4FvVR/hByWZIM5T3ZjSDl8RIoa1JDMh5fnuojrsjhApUyvazay7S8eLyQNsTlePAH553xHZnj9yQ7t5K5aE6hfrVLghjZ1yGkcgA3wN4EJ9GGTsOxGK3/zuoie1bI6zJL4k45i+PDAkJ6zJm+r/yhbaSFgTw5ulHXTAn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh85RdHxr7t/B5e1b73hIGH9Yo+KoUdCKxjZeUflRGs=;
 b=P1QkYE5+PI50eZdiFXKPXTJRc846Eq3QLuU3+050jDTQcC6k5zTI8Qk2RRg3sptuF1gB1mR/nrjtmHwpET9Ba0eN2AcjYTuyCJql/YJ6JiMCagydg1EldQ8cPgsfgtAFsG5dOlMjC/Jau9l6l/LKoTi66eT5x/rVDl0x9tdeDCyqj8r8qYsJ16C5pXgXNhUc6S+pGt9yPMuH9bu5Quc4E7FCIgGUSkKcKKXOSPyG8CDfHyRThRjiGLKzm08y8JORC3C4tLOYzJtYhoicxjWz0YsWwszEqQfbyZkcF0swfy+hnPzA5wZvzquHmkvFV27vNX0jHeNLdaUXUGaWHC/AYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh85RdHxr7t/B5e1b73hIGH9Yo+KoUdCKxjZeUflRGs=;
 b=iyvC0NcMWUYsDcZFEA57HtMlB4qLbbDzDnDpxIthRCMbLhbxq1i0YG6jLpFrIuc4hFfMtRoEzzY5+2UHRF+ZUGyn0SB/jZvANnLsPyRq00SJc10WALnD/7FzDM5bbRKNLUw8F17romKCPXxmwKd4Da7YVBV1euht+pkVFALPf9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB8702.jpnprd01.prod.outlook.com (2603:1096:604:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 23 Jun
 2026 01:54:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 01:54:10 +0000
Message-ID: <87h5muhvi6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] ASoC: spacemit: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jun 2026 01:54:10 +0000
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e85767-8093-4554-78ed-08ded0ca516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|11063799006|56012099006|6133799003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gBJLJW+bOwZA/HO24nd6CCvMGbyOM3PeL4BLY62HWas1DwKhv30YGBzqwvxjoAylLm0BW+w24WnO1ZmwyQaCIDO9zm/iP7qodnp63l3r/G2cJVo8fRPyOaRILj8ADxI2JunzXxDIWSjxq2YzTFFo/duVg4uLwjj+47LMUCcdPVUOYI6+e963IKMinfweJFw+hpFZQsmhxuOL4wcLanYHauJDiQktmdZg8n0RiZvvnDA67h1TMz7BmhJiqhfhJ6r+WvC2DbBQYCgiJLbBMfRDHekc+QErqwYYp2DeD+zwUqzV91NaWQa3+zVnX3I9NN8SE9ICOkpllPkp7zHu8OinW7cPvXhYw/v+JmTi72WIsXYwT6RD4cb4+k3iPgvec97dLujUW6JbRYC/OYlL3MuTE7c6uHXYNoX77JnYVnxA7gWELAxO9seItFmpfHmAZsDfPqDOnXA65XD+cAH1zN62vb58cesicBSa5Z2I1zMVxSYXdWhVer1Nr/u13dSvL32MmacfGV9A/mgbJ0EzvS/h8OvCXuc0dy1Ytc/T9XqaJAeaz7JtcrFQsFr6RmuSYvVpsvj51RZRxwuLC21Ake0O68uMKHABX/eF+DBrRO0OckVDyLfWQIjicYGOlYjavI3lM43bynRh0JTiDvYHnNf5uRzyas4ouLY4YCJ196ZFu1fugZHC3SFlCXmpws76UxxlQP3vRAyCT2o1LBD/c2YhMoYGlz02c103V5fxL3YhhyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(11063799006)(56012099006)(6133799003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?geocdj1eLz+xZBa/u/jE9CBY7DNVZZauc9uwVgBGZKNTiqz/ybMNSpfsdxaO?=
 =?us-ascii?Q?1deWeRnlU+WHB1Fktt9qZNrwYsMNOy1BL5MKYQ5Y40k5IBdNow/yAITJsJN0?=
 =?us-ascii?Q?LjIePLm5CmQFzxmpyIpIfw4cKw1sZm7r6EDKZmP4NMm4QjxB6j5cygg85myH?=
 =?us-ascii?Q?C/IajiPJVCmICfx59rvGFRhhiPcmwrUKjrYuCIRBwxEb4wtkSGXAXINuQf2v?=
 =?us-ascii?Q?tKVBl2NgTvk059S+Ld56O+eUoGjpRzJ8wXH3mOnLuVlxD8ZbIW2dL2IA4/Kh?=
 =?us-ascii?Q?RmGDpQ7TP4H1dU+zSZZhzDggF9qpdB1VGW9lvY9ZlbgYNyHcot/s5Jh4sxr4?=
 =?us-ascii?Q?+BlPYXemS2qlLdIu7S+aHBl/mBPLxMc967YoPbJ8qXd49yRlBVmKwqBRch0s?=
 =?us-ascii?Q?bFTnzsCE11AU29Qj5SkfA//qn2Z/9kzTP4Mf8ISWAx5vOlXWTDbc9Qb1+uk5?=
 =?us-ascii?Q?CEwUrPfj+HIskfCf2QlVZ9DyWDEBxcTz1m/CGtk5CyOZ/ZSeGYu3XLRHhE5g?=
 =?us-ascii?Q?CRYtZCm2zk9WdYku7GC/ghlgyPRWuDVcfm172OgB5bsRLWT+NTqBDXBkGhR8?=
 =?us-ascii?Q?FVU/9XlTPAuOURz3AXMxf/C0k/XvXfLeJAi1RqGVgd6BvMJG1+X2to9p0z7g?=
 =?us-ascii?Q?BNCC4xf7MIiSS2Wt0wqYt3D3gWr6WqVs4F0wtnkalCoZPaQbiC4rs95xxPPS?=
 =?us-ascii?Q?AeEvk30NjZkKODTg8R9Emj39W7oMus1EYhFowO0kFiL+hOVKx1h9M7+aOoWe?=
 =?us-ascii?Q?DIxilvxtG+vly/e70jEcdbMWLsrgS3tlfGKJbkddqbSuyTcyS4cnZSizvUuY?=
 =?us-ascii?Q?T42PP4P1eF5NqB4ySHrCEVB9nBRExQx03tKF999CrT2KzLHBp4Qx+dJ/XoCE?=
 =?us-ascii?Q?4oopb3vP2SFOIZxFnQI/gTh3DH6HXeDBk0nWiiq0N6khoOe5eidKe2mxEp93?=
 =?us-ascii?Q?M1XIAAA1WM8eov/HBkyGwM/yWdOEg0OTZ5tsGTt+cbCJLqllAYKsWhZlnI06?=
 =?us-ascii?Q?rtKEAW9WIgUc/F0YjFdZr19mGKwrnrXBNrAgyAyzrfJY8d2jJLK9rffE8iZk?=
 =?us-ascii?Q?JOfQ/xrgJGDtl/rtxJ2VF1StAa155TMgrS0Y8UbDgbA70Fewi69rYZ9jA31T?=
 =?us-ascii?Q?JbdQQQC82AV56e7jxs+W1rCYmzFvYu6fHKv7Nz6p/N49eFvKYm7G3oghiY7M?=
 =?us-ascii?Q?GroetGDncsvOtA/6SDfS1P05UCwpQc0fNwl002/35J9FyesIiyxsxZKKrzMO?=
 =?us-ascii?Q?HpMAgGxAVEdVF65qrpmu6EF1JymeLg0bRPT2c2dwYbojYlf9/khjZqfGKiX8?=
 =?us-ascii?Q?QPBmEzO7xrXupoJAK5cPFlk59NG2HBRIm/4E9mz0va74RdnwDUm+r8saSoql?=
 =?us-ascii?Q?7swzFZahmubF4/0olBGnsBJ8YvGT0g9J/P5CFiNl4/1mKaxwgU61d9iCnQWS?=
 =?us-ascii?Q?lEKX+VSrorPizLl08zgLyjs9oaJnPfzmqyaijcVPpPjAr0auGXNn5redUJYQ?=
 =?us-ascii?Q?F93X5jqVDxR6GgFbmlHnNULLbDO1vjyeYt7oZvsiX3EDVx5D+yYY7ky7lWyn?=
 =?us-ascii?Q?H9dXTumtkVZ6BYwrSKBuvqAM6h6nzUsdM5Ood87A8K2pj6CbDmZQpLrGYihw?=
 =?us-ascii?Q?xHVA+ufo584jbcC7lL9ww/nzdWymoWI996ahkzf6lvNi7pHVsLgIh0G0Ph7G?=
 =?us-ascii?Q?XSv+AxOVd2BlX9wx6DTSbIbh2TYxsgVYGF3uZ38Q56pjr2+bl2NjkWi2iPRM?=
 =?us-ascii?Q?O0JWztiEc/g0aJYRLUFpawG0sURRiU+bwbk+y5orRyf29TGhx7/2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e85767-8093-4554-78ed-08ded0ca516b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 01:54:10.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqPmpuqugLbZxZUDXWdY8VEwByL0nXdaQ9Nx5cdSW4gHX86cK3w3TfMYRwclKDzp3Y+Q82RmFxYzgki+lEC14nVXUrO6//vkxEV647FUSaxNEUsJR2VfhyGBfkq00nry
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8702

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 8871fc15b29cc..cd461f2aa7567 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -335,6 +335,11 @@ static int spacemit_i2s_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 spacemit_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.probe = spacemit_i2s_dai_probe,
 	.remove = spacemit_i2s_dai_remove,
@@ -343,6 +348,8 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.set_sysclk = spacemit_i2s_set_sysclk,
 	.set_fmt = spacemit_i2s_set_fmt,
 	.trigger = spacemit_i2s_trigger,
+	.auto_selectable_formats = &spacemit_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
-- 
2.53.0

