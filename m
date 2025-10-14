Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EED30ACF4
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415964; cv=fail; b=g7Yx2hlv89uU1EF1yvSI0teB7vX8v7+fYwEmAs2LyisvfRpfCkQcitzLVcxzKpLa9tE5Ej+VL557ZeskvXbNa2neuU9S5VteVFkEbvxDIk4T2T90cbqoNpOgTb5R41zBWcF+02g1OD2Wkwkmfvkvvacofe2K3NoqmVQ/KfXLVBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415964; c=relaxed/simple;
	bh=IpiZo1QnARrYN9r1HYz2pmQ9u2kny71PBnhdv2fCD30=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=axMdcJLg0/7ruq/J7LiZ7MLfR2gpUNOqgWWcoWceHyBCP9qjRuLxhvzIEE3rMTNaCXjhbxrbqOpa/d8O82003nf4imIZhRdIhoWuNfQGWSjRGvBKcjvImD0xZlcsxY2KL4E9spBKbF4hXY5SJZL69pgCl96ViNuDh1GU72FKya0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=g9iKRylQ; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="g9iKRylQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahOgkiqAjjrvlsbEz9qz1OGCfllSyLQswErOn5wEdpc4R6QVeygNLG2MWOdBAAK5B3d42soLLyanwgV+erBsMr9KKst9Y1yTJP1LwWnt6WFYp5BOeKf22kkqlk8dVHK0UfShBBUigiLaWClDxlnh0kSpW/iX8GaJh7ZUwMg8XBbO9yLoadPLt5Jh0O4t2ZsrwapqeVty2WAP71g202QW+UGV7SWfh4mi43zEsnvuVLEca/PhDu2lF7UhBbE/taSjpiI+9UtJJCsFVnpXwCb/PcjXmqWXVDMR/+eVYnUghyPb2+ie/fRo3aDBezSFiT2crVpQmJNWHeTJTAWpopuWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/UE7ZPhGR60VAjX/9qM/yJ5CM3XPcJQmkERzF95CuM=;
 b=uUef637ThcjQIf8NVEfsWfvVxyAYqUzFEtVs5cMQqqQwNJe2dnyI6hTgHSL7AdFybQOq8w6oFJ0wYNfCagBOnhH9iu5MFgIkPwp3LyL04jbB3VuXoNYbQSL+ChLYp2+N10+EpTiQz6dfIvSBo9kFKdGW8h2F9cY1mjAbIB6YrsvycStP6CkVdon9qwLYae9etAPKwIr8M6hjIzsanN7auHXd2aENuCC+ECkzwMJ6ym9kZ6qC0+yvwRL1PTNOXbHNPDfn9Z/cQTixT+4kPL5W5zzptnY14Cag635eIXaByl5clwzI0kZC/iFqPWtgXSURD3JS9Dzm3Cu0vpsFqbC6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/UE7ZPhGR60VAjX/9qM/yJ5CM3XPcJQmkERzF95CuM=;
 b=g9iKRylQZDNx3MS+3t6KYYXIqJvQ35GHqaiq1EkddG4nmdkwrf6RSG6BFFW77RonW/PoeGAsaDB9FZB21R+aF0lY5dleBl2ylmwcVIQAHwctoyxaOHyWUmS/PVVwfw7p+Oe8pdyGiJXS//QFK89ja/ApyAsYPThcQAUI3K5U9Cs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:59 +0000
Message-ID: <87plaqnm7c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 104/139] ASoC: codecs: wm8400: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:59 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: a279253a-1af7-4a58-9321-08de0ad9c6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?izdOnCWa1j6T85+HawTgbFW1kh8wb1qA1J9F+QKNyrtaS9YVRbYFtrTjTbUx?=
 =?us-ascii?Q?gI/BJMbgU53gxZepN8kasXnbUY+vue0cWQkApcITjp92mOwPBzkRtJ91Qkui?=
 =?us-ascii?Q?Uj0hRQzZS6GNmdNjI6y9pAQ0fk8xGV4p4u8goExa7kRUvYTsy5OPU6kVvzc0?=
 =?us-ascii?Q?5YEF6GYImzqMLbZhLVWxAUXyi/Uj9EmxZ8q1m6idJpTM7fYwx+UVtIrlHiy7?=
 =?us-ascii?Q?Og/MPyHSk1n6Hk5x0Sf+qZPF/VeT9nQ3IDQH3gDMDrfqF16iexhXUGHrFuDP?=
 =?us-ascii?Q?z9PklfPZLiv0lworR+hzVdCzkWQ6yehUG/nuv6NcMR4aNYY1m1ZU7C30JMAs?=
 =?us-ascii?Q?YAGJjW1Sf7v+Wprfccfm3Szc0ROBCu/UClS4ta8qOcGhc2lw3+sfZOwQfYXG?=
 =?us-ascii?Q?03zMiCEm3lPpdSH8hTEa1qK/gLsWCvN07rsJi5M99GSCoNxwtF8HANts5Gwk?=
 =?us-ascii?Q?oq4/PWl4GjZtd3bc+JyDIO77mHIGG5TWSzs+HsnsEIkIO9b/BiyBdAYjIR/s?=
 =?us-ascii?Q?fqKzVKE+2Nq+I5ywHLiFRO5lTzQQFZdaWmNAfflqIZhVD+gDm5XrP78xz9Bx?=
 =?us-ascii?Q?1ZOBI0Bjbk5zCoFQTu4kt8vp6ohJJ52+WmVxhfRNNdjahs36rYfnu3ZU160Q?=
 =?us-ascii?Q?y/rBecAgaC8jmPeVrMTUzGhsVc9idpIgZgDEn/EHDZExXfouD4QRLzxxkoyD?=
 =?us-ascii?Q?AywgiA/NtgM79dtQWSsRZAltKm4UnDu/wqBPKz8PPf1bcC1xjhTWpvE+WUyg?=
 =?us-ascii?Q?vFrqI5ohUFzqTE2cVPI8CTPFweAOxzZYrvEzT0RiYfuU/2LMGOtQT5tyDeV+?=
 =?us-ascii?Q?5svzSnIsxzjfGqW+5WZ+DQNExtEYmARBzBRZk3+julIs9DI2UoQpBcyVKWCj?=
 =?us-ascii?Q?Y+lFOAB01+iwqGZGj3dM0kvo0ES072FGNNM1X5o/zBM14+3Utz+hwnM/YBPM?=
 =?us-ascii?Q?EvxJgtH3xVje56yM6dl5XpQp7s8cGDNxq+wAuZXOxpx2prCRyBVFyLE8G6ZD?=
 =?us-ascii?Q?sBvP37Q85jJM6FwlNwoYaa+g9JmX5WSb99A5pPUd8BK/oa6sZk4ftvzyWDxt?=
 =?us-ascii?Q?e19BzIHqWw46sOGTFxNtZfNC6OvqJil16VrxJD5uin/4D+9Q8GCSxHjm3Um2?=
 =?us-ascii?Q?spy+hy5A7lKekaaWNaddQhJGViNIxla/D7078zWPCcUzMg3KAlUEHvQPP9p2?=
 =?us-ascii?Q?Mt14RqU+2Gp3X4BNuAyRUZtiMWjhNhfznHB1NWqkQjbyoEEXu1ywTYGCqohC?=
 =?us-ascii?Q?BVxEwP/jdLNF5cJcSGh8ecmgMDB+QKaF36zALaPGtIQdyQO+p8B645vSvEsi?=
 =?us-ascii?Q?mkk8heRiX6L46n5Ex8uowlm3Oou6yl4p+sRzVYjPawfOwcf5F+ZPlHnDoFZR?=
 =?us-ascii?Q?C0qBsBJaUre+CPQVZY6e4nvM4RMMLdq+bkruX7sKvFe1cSDJRFnDz5x+vEyB?=
 =?us-ascii?Q?J3kv9D9+YRBTUIZbCT+f1cEliJU46t323rybo1aBDCoQlhV9Lzgnhw7uuhtQ?=
 =?us-ascii?Q?8zOrFMFNWm6nw8Wmhxg7fCe7UiYP7J8+Vl5X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FCFUyepbq1RFxxu5ncWR6REMiYly85Wqs+6A1adTTP0jr8GvytR+D5KtetRQ?=
 =?us-ascii?Q?kRAC7xZXZYSDb1wW6025GWh6YQwQnmRV11p9MlltwcF1JvtGYj0wGn01vkrD?=
 =?us-ascii?Q?Y3hsbYr8gJ2rgJ7jqXVGvYYtBpHju6GNwn/kokTPoE6n+xF1wkF4ponKR2tT?=
 =?us-ascii?Q?7Jq7JWi2CCWPf0nb3HHWzJJPvVKZuJ4XMd/6nZ4uBDHYWdOROTUGBmniPDMa?=
 =?us-ascii?Q?OIWYKAQ7ytRWyAS0LaWgHgO17tMxzycxkNtoOgj13U6HCTSOG1o40qAEaWcQ?=
 =?us-ascii?Q?wsZxVEOxOoD1zuzZ5dmHF9VOd0rrsz/NvjPCsWejJi5KojmnquK4mcwiPV9u?=
 =?us-ascii?Q?9Mw+CtEuqurPGSUMgpbedBpdSYjDpifQQP0QD/mBwmEm7o5LRhZ+fExaBF0y?=
 =?us-ascii?Q?eNsOWqlhP3jSiX2F7w2fPcE3N00qmoJv3u77k4zZALseDzsr/ObO2Ipxoi03?=
 =?us-ascii?Q?oS92rz7czAvzLWlcxJVj4jiJ5CjHkLp9umnuXDOwq3SNgqq+itXgE620uCnS?=
 =?us-ascii?Q?vPJ+TEibHAiinCr2R5SSwwGeEnCInixP4XqTuUDpn5ZNP1XJQEBg/YVkBMzp?=
 =?us-ascii?Q?Hlhs+wl92attlgCS6Xo9762CS+ykLfPTzRNSyo2fpx2+rFLYZzmhRS3cuCL8?=
 =?us-ascii?Q?4OoDqAUNWo5wxGKs/OBP6S4vZT+9iAzMpA5aN+OoluG1V3C2sdiq4P3MFiqk?=
 =?us-ascii?Q?mgxsn6sxjV6IBOsREYyL3PYVb5BonZnWrmS0ivDFfOOpQto5fZQzUleu2EyT?=
 =?us-ascii?Q?ofiJiC2fVVoiAWCkoVOgqtw59DGciYiWdDdpSobJN04yF1DBMqKlfQW0Xrnx?=
 =?us-ascii?Q?R6/wZJPKDR/pRV4M58w1OwLB6X4bQiz4Y1LsDBeqn//vhuCmJYq45Mvh/asP?=
 =?us-ascii?Q?ihDEDzkJbhesyVcMNWcpKevA1TjKigZV9VgYZImznnY8Rqpe9EcRVncz0Oaa?=
 =?us-ascii?Q?JCA4ZCbcOplACNnKVwR3OSUz7+FDi7U3NNhhUMTqBNIHQQPovTKnEhwh0l5N?=
 =?us-ascii?Q?EtKIZWC6sFzAu7A3clVRZXp77r0QaVnrTrdFcPEK3N9KEGJI80TXmiElPwiX?=
 =?us-ascii?Q?0EZAE70eVbNeXPJgbanxBjJI+zg4WIXuQZBVZu8engkyrx97nnIs02iEYRSQ?=
 =?us-ascii?Q?ihW33dO/eVGTTQ3xANCxmFi16qPOmGUfADzq15ZAQqjDIv9EaKqpbhfVjGdI?=
 =?us-ascii?Q?l0BdS32BJCnxWgCaQOxW4bssnhlwInirc8Exh5zP7oD5NnCwvW/F0wpZWMJQ?=
 =?us-ascii?Q?ApQ2XYeKQNSKoSDprFeZGFqBbAWs7oNabd6+C6Hi9n22skhOt83vr2q+f/v6?=
 =?us-ascii?Q?JIxKk+J3xR1Zt7ds2Rb40gOxd9cf/SRWS+KiXPucn28uce/CrWX+yh12rM2D?=
 =?us-ascii?Q?QZBjycJdTD0Nrc4U+shBIYrRkLc+ShIxBJCR3ZPCzHrUJl+G08wdibmZnKAD?=
 =?us-ascii?Q?vZdiRpX7nfOmFX1KA34FrHTcMnlq9waCSsVALWWYCk96z4R6bQoVKcs2V1wT?=
 =?us-ascii?Q?XzscSgnTdiTPWJKDARapB1xPusWX2Jh6n1Dlati5nMGaGIjsyPK5Jec7pAUu?=
 =?us-ascii?Q?Bc4Xd/s64uKV+teJfF0/qgqfwdovgBblf6DuadC5k4SIIzfPcFwIYk0swvk/?=
 =?us-ascii?Q?g1qgmWEZKJgfJqek+0sqVMs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a279253a-1af7-4a58-9321-08de0ad9c6f9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:59.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLbr4ch3IIHHdxRzQ24oHUf5yFXewwUULoU5pONtVVG+n2f+RrH91XfzsI+TNwjraTjgsUDMNM2km5xlC7b+E8UMAicFCPtzxYalktFr6YU8i1l0PDQCBDF/MRnamDtI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 5ad6d5b63ffc4..4f5a4de60e3b7 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -82,7 +82,7 @@ static const DECLARE_TLV_DB_SCALE(out_sidetone_tlv, -3600, 0, 0);
 static int wm8400_outpga_put_volsw_vu(struct snd_kcontrol *kcontrol,
         struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	int reg = mc->reg;
-- 
2.43.0

