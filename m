Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34590824A3
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820331; cv=fail; b=FPCBIb4s1waGC804E3uD/YkBpcpFH206T+BtpeWTAjly4W1GHqnDbrzm4qEOFsKE3PbFb51K6AT2ddvkQJyFc3rBlSYaCxzVXGgSMhTu3E3dNwZK9733rqVqsMcP98rpDwt1teDSv8ZZv4FC1wEutHsYbhDCKOmVdfiSoBGLiFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820331; c=relaxed/simple;
	bh=7A9tv2F5kSnnGsqxYiSrkP+m+S8TLGXcW86aP6Qn9yc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qlL7kM5g3o8a2PY3GpYnbh+HVELYkGfZcq9kmIJMVd8qRuiVfBuXC9SjpszJV2xQOxDV68hRAjwU6UCIar5wrdJWk++7gUF8xqiQ2LXrd3ae6RnkepoGMptfJz6nZ8i0+SCzKlttVSmNdIrBVM35QWAKMttvbgh5wRYwbJf24vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lDqMLoYJ; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lDqMLoYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/46wryKTgepSWq1R8kXdBhGEmVFmzkMnZR2pnhs2dtqjrYOtmRuul4pMDZiqHXX/6CPuzJENdtgZU2XfBc2bQNXh7rxXXrXgPajfrbAISVpYveWUC2FvhGTuo/K6ZF24YMCHizHTVww/9K4NoAG5huab4M+7XvnWHAJDqRJ5cJAEZTo4PzLDHyKtVFzZ8d7CrpD6US5pX9qoGqWrldMgSjhZu0Cr+aA8It5fOO+3K2P5zElfKkQQ/YToKfWCAP4WtresiQYMhEAmxoE6Nl/VtikinMYVjr0AJNq63yzi+fUPqOd3sK79oW0Taq4ZbRHJauVoCXbRTvI8EmxFaNI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/McJcoCzHIVsy4AwAGWlV4GX66wxHp6XHXRK48XnGM=;
 b=qzZSmJY/SCtXTOOyJ18XNwC/2C5pS3jIpeQTxwWStCGfbISSC5a4Y6WBPDFZFxQWqIpPZayixNi019zVt9eGPqpzGqFmWcMzKdtSVamyKzdCoAnvpG3AX/ZIVfmQOssGY0KQsZ+jVA3nFocKuQ2GNsnmo8g3rwT7MBuCFSE67g2N2WD6ek64tezp8UCMY/sgIh1yfB+/8nLHpT2UtsJfl7ipzDBQyRaaJFDb5QIirPPcm7QWs+p9wNq6oS7dyDaAAgi12dBBBQVdvwlmsFnmAyf/WHCne+PKBDc5XREMyODklwKNGDucSixytkILlFtk4GAy9uxRD9kmZh4srgRrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/McJcoCzHIVsy4AwAGWlV4GX66wxHp6XHXRK48XnGM=;
 b=lDqMLoYJ7+O5xQ3YQ2SBkLzc36gsDC9xZlamHwj8YDeyffCF1AATTZPkZzeagwcD3pcCEjZnhFTYy6aJCl+lwjnPucz8Xy8t3ojRIYJUEAHgk1a5PjlF235g/ubvo4ttjpPPJjLFKcXT2MkHrunnq9SAtWdxxrIc88nV/OUb+fM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:47 +0000
Message-ID: <87h5v18lqx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 022/292] ASoC: codecs: adav80x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:47 +0000
X-ClientProxiedBy: TYCP286CA0260.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: ced3aab6-ac71-4c46-5fd9-08de20b7e1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zVEoFmaJu6VuYreDm/KQ27+tS1ZHt2Jbf+u4X9rB01SiBFP01z4uP/Jzv9NF?=
 =?us-ascii?Q?xgNHMwdLshTysVp62P60J7ZwTF5iCidXc/UflW2a+XggI0iND/9NcI6DwV/5?=
 =?us-ascii?Q?682/SqxAj0M00AVve28HrerZY+V56ix4RMk5KgmpYZnc4unUKf4rQSRtqS5H?=
 =?us-ascii?Q?Sy6IFGd1NOvZycb3N1lqxAzqtwlwaqNoXLByfMbM9MT7zCZevG8MRGoUcICp?=
 =?us-ascii?Q?cduCLrr5yThqB8LvBuYtonHLy6DZwW03y5x2kOkoSIPCiMTuPRt5LenKsl03?=
 =?us-ascii?Q?T6WOYzgstGc/QmiIQJdsTdl+zzrwWfRZej9NkM0Vqqtcjsok88rpVUMsbDKO?=
 =?us-ascii?Q?DTuY/81NsuyU4Sh/D20oHrbf5vlKlP/Q0Z164iN/axIwK65G6Ww55atQSB8t?=
 =?us-ascii?Q?4NAASWwV8U9Es4iaauadZcu69wRffYra0SDQWSYcKX2iu25fenhw7oOxUUHA?=
 =?us-ascii?Q?DS87zGROamn9MQC8Nq9lq41DidO7THtQLdYERXa9PY8p1DgkEHWZVyqQ6ovx?=
 =?us-ascii?Q?8mWpQPkbv7/Es2Gb7bvCUQyQRbKXY2k6/BGZJ11EqkSVD9V/ZMYNSIIhMslz?=
 =?us-ascii?Q?QotcyehZAffMprAV5HfhyiStNiN0Rfa+PIlmn8Z2ARBy1p53KK7Mvbh7GdDX?=
 =?us-ascii?Q?FZqukNRJjTA65U8+nA2AokhG68rOUs2+WArjZTReKD7Oj4wUIO8OU1bwVL3R?=
 =?us-ascii?Q?fSqrh9KvQr+F7jFrKXf98CnOVLrkP09R2tFOEL0EhpfAWuuSZo7ljDdc1x+R?=
 =?us-ascii?Q?/tvQuJcuLvqazCnVjO0dPaDmhmd0UPhCJpl4ooKnFI6VMSkq5n1dZGIEqLAX?=
 =?us-ascii?Q?YnUfjlndHQomzQTaakyaQro8I9OI/2gQ40ardXs4PopI7SqNzehVgEIvhuHi?=
 =?us-ascii?Q?HZFhVYKyzt47oV+vOQMuXDPklJzMgVU2n1Z8ksW3uxtqrU4rp/1Ef09l6nkC?=
 =?us-ascii?Q?0HjY0hHD6ktRbIS3mC8Zabfpfu6SbuF7ohWsKsK6oUwmlNbzT8kJDotOO3mk?=
 =?us-ascii?Q?K1814FjZkn+qBI7UkQ29wPsN3abOp+sLdlU5GmnbTOVLIvMPFsTxaXH9yxXd?=
 =?us-ascii?Q?HYqeNJgTYrmEAFnh+ySmzcdBnbt/MK0QAFG8/ontcNz+iGCvfgjmbRAj9cC3?=
 =?us-ascii?Q?+YuSEaJ5G5mziacUZ9JQ4y6yVJnhBxGSA7yy5hq6baKp9jBsvxOLeINi777g?=
 =?us-ascii?Q?F0zz0DRgUHmqA6gpgkzSIF6QdUJE9YOwpaeeOKOS4L2pU9ujyQOFwj62Bgqm?=
 =?us-ascii?Q?xlMuodO3VwItsrhz8H2T9L8YmQHEYdXbDtxz2R0zXV2FHiEH+x7OXyHj+3ft?=
 =?us-ascii?Q?c1IP4LAg7C1lj8mhrLhQE/BDrXykVXBfYJY9a+1xUhkLUA9JHvt8qYEVqy52?=
 =?us-ascii?Q?Z0zIbHLyvIeu7+IzZyXFvrerfCUd0yvF8so/n4v1bbVIiCIZaArzqXAXSkTm?=
 =?us-ascii?Q?kdhFF7Hdf7oTg0ztWS6lH2MILOtT9sB84sIWVlRVGuZbaNYQ1Gh+3zxQ9SRG?=
 =?us-ascii?Q?+KwNI53n6fGJMCjD/LrpY82zCo3JaHZ+T1FB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?urx3zOsA27EcYSB01mluglZKvGQVBm59rsqX8lvLd/zzsyzeDoFAmxa9odYi?=
 =?us-ascii?Q?E7L9gjMkKx4BFX9235qCSPl7+Aa0RX3rHe8fxmGHzyje56GQP+47HrjXLaok?=
 =?us-ascii?Q?lZIgQQablhefK3wEwS/eK1ibf57YyQcl7N50MkPgH9fN+2rTk56f+FGPnQVO?=
 =?us-ascii?Q?6KCmU1yMrNoPXH4Tfgdez/54QnJY1EvV2wBmMcrfLdk7f89t4JYpNvoT7/FB?=
 =?us-ascii?Q?icglRGv0V9Mqw7xzSI1Gw892cIT4AkggQZ84e/Q3TAQGT2VWu7pQ72utZdF3?=
 =?us-ascii?Q?G2x4wRN+r5agx5tJu8UYX/Cr/lbOHdSjuf5+9qCHRHd6Cof4GscOCWP2hCPq?=
 =?us-ascii?Q?JfvpZXtF3k9gxLu0k3S9pexDn5vyC/73yEyY1z3uAiS6UGH2NwOprGwmQT3R?=
 =?us-ascii?Q?dsND2ql8N0rJ5KlSxzDtmX+c46brejc8Gp6/sXQf2EnAr+R4aO/JmCay6svx?=
 =?us-ascii?Q?iuu6JtSken9HKdu9MZvWyYTwKAyo6w4YYtI5jnYQ9Tfz6/F5LY9KbBVqAUZf?=
 =?us-ascii?Q?5yFdOUQtpkyTUE62x3AB13N66PhEgFrN6v2N4kzIOqUsSEGwO0ciwMrUtgOG?=
 =?us-ascii?Q?L5aojnF2N5ImBCAIHMUZszpr4ACtZCK7db8Bazy4PlYE6NdBUVf1rJVnVD0L?=
 =?us-ascii?Q?2qFzq7S1FkC1sqVELwl6KI24b/0+eTGAJmbWwXPPOP9DcbmlEXR5TOuoKmN4?=
 =?us-ascii?Q?80lBexKAZEoqCQymzJx4rp1mwXNDLjRTdDxHyl439kdfNE8jeT6/OkPs7K7f?=
 =?us-ascii?Q?wtUClK087fbEUdTKkyV8FXoNXGHVoIuAkZP0VA8HL6MSTM172K6+VDf0U/If?=
 =?us-ascii?Q?BCfKdead7hYwg5x/Ld4pCuSDs5qVNnvmDPSerft8UHAD3FDXEP96/YRuNMAg?=
 =?us-ascii?Q?oOc8Hgr2QeaaBl0m2tC7D58/gS+X5ss7aO6A+EcUKIWMa1pfwAhqe89CNNsG?=
 =?us-ascii?Q?v6+gPzya0cPltlvS3olvMdkvmM64lQiUyDfHqZ6MP53mNBFeRZZCKniAJeAw?=
 =?us-ascii?Q?n/8ljBbescBw6J77tXyaFOkVrkI4iG00mb6lKQW4yLTlKVTVxmzZEpjuNxo4?=
 =?us-ascii?Q?NI2KV+RDYGeiavDU6KM2+cu4Q7EWLZNryvzikDIInNlRl1HQ1NxHwlGb9RLg?=
 =?us-ascii?Q?jg/ytE5E1rtKXpPgFTt0W7sQBdqgEingmNAGbaKHrrPEW1souA4iEli/ixz+?=
 =?us-ascii?Q?Q8q0gjRl+exaUUVcx2Kjir6Rlhqjf6eA8t6pRpARQe2IPzMExhQYKzkmieX1?=
 =?us-ascii?Q?0L/NsZJS0JgIYFajoirJwinOxpxg+Wj5lqfZ+eDaKajaO8D8F/F+zwUiIR3l?=
 =?us-ascii?Q?rJzP1fXTqWRnysrYKG88CkKpgIdhTXIybs+EZUELhW+FMIGgkSYedMNMuWb4?=
 =?us-ascii?Q?pA9xzkcl1l7/DAHrqWka1R7LBKlTsBOdYdj1yeOjJbRqUQpYurG2xwkpHr6d?=
 =?us-ascii?Q?OjHwG86rpbO1y3EDgoEI0YWBW3+txjMkitxa28dhzBs7IEAj4uabionizPZQ?=
 =?us-ascii?Q?rogNRNhOn/HMk3pXShQ3tFpdAPDtAXIaXZaN1deZSzIgIsW702BeTe4f2BPq?=
 =?us-ascii?Q?gbkqj2SEey/1RyPygYLGF3djMKweem1imBQ7mv/lbX23i4pRQ8ltQM9qDwRF?=
 =?us-ascii?Q?LVlFfoEF7ohyZmtK36OBJV0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced3aab6-ac71-4c46-5fd9-08de20b7e1ce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:47.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoTk4YNOuKMj/kRxhYfMEknQhgHbxQZWDaeL2B6OoiWbRc4AqmqU1iJY9RHQYVCB2VfhYNRveiwbJZ3SYLvibDVMQg5vvK1NIHJqp244XeeRBMx/lI/ERPVkJOgNzfJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adav80x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index c9c41496c17dd..8a89187f9c782 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -539,7 +539,7 @@ static int adav80x_set_sysclk(struct snd_soc_component *component,
 			      unsigned int freq, int dir)
 {
 	struct adav80x *adav80x = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (dir == SND_SOC_CLOCK_IN) {
 		switch (clk_id) {
@@ -622,7 +622,7 @@ static int adav80x_set_sysclk(struct snd_soc_component *component,
 static int adav80x_set_pll(struct snd_soc_component *component, int pll_id,
 		int source, unsigned int freq_in, unsigned int freq_out)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adav80x *adav80x = snd_soc_component_get_drvdata(component);
 	unsigned int pll_ctrl1 = 0;
 	unsigned int pll_ctrl2 = 0;
@@ -802,7 +802,7 @@ static struct snd_soc_dai_driver adav80x_dais[] = {
 
 static int adav80x_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adav80x *adav80x = snd_soc_component_get_drvdata(component);
 
 	/* Force PLLs on for SYSCLK output */
-- 
2.43.0

