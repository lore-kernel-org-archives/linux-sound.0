Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5F8635C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820319; cv=fail; b=ECL7L3CWw+HdaxQ3Rf/G4GxpFTI2zxFHiaYO4b4qJaYROB1OEzqQjy9LEwx05VBO1CEKagyYuI3Fy5joMJuw9QQVsz2n8aydFlJVkye8noi1j7pOiGHZdGpah/ZqZ5+BZTSisPG1lbTHZIrpGGrkTHgxFGlrWHMQ+jMZfSiCRvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820319; c=relaxed/simple;
	bh=R2IW0zkIL5hSRpzgD3L0I5MFc1urlfKAz0CUgEL/Eu4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eAIsUzqSqcbI4OvMFgh9fcV0zR5+TlfUoIRACoBfjTgE1eO9cSdBd6moeYLFiUCxcx9RkxU+4OOZjc3VFKKSVBfhTBMZ1Y8J9c0UZEqj1mjJmXshqGVWg8C2TpIP2n1b18355xvq/wbwnzv8aWcH3JpXy3qof4iFZAZMuPmauL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KconA6ii; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KconA6ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9Ch/vYtayEE53sZLVO0L/kx0rGLe13FPMwgjHv04+znt9CBS9WEecEMafrq6hmfnK3l70ufqUnmXc8rk04D6r3jqft1ub1uhGS4XGNkSIQT/iumPZnfKCkiaT+BJV2dOwdVkUMklifT+UQbioYznMRhZ2+DTm2UD6zf/HSnR83cZs3Hg+OIuF7DsbSwWan/4ELX7ElYDfq53lCbATLB4X/aQ6FcmVHnJeMSwdmIKur3iRqxJym4pVct1aExu2lt3fgMFgpF6/ER+aJRPzkeDBuKTdbBcm3KuwPJBl6BS/Zxzq4LSNSBcG6+/kJpsKEKS6xBpl82ew5Bo618EwCLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH3O2pIeSzmZximKs3xOHCqYo9/MKsuHtWChillz+o8=;
 b=M6fge+QmE2ivfNWITHomCgoYiI7cAU5/LP9uo5iq970bQBM1EIj04f+P1eOcw+GSiwcPH7vHxFSDtnXxRKJws4CQ3XJ2bCEBp117GzWQ1JSCe4J9ziqoZK8CBAtKkIhfHq4IReU+/SPRR0fqmlwvFfTe0m14gvapXR18nohD6xGhdjZ5AzcY3sFPmGi35qxV7beK9WL1nQtpA445qef+SJYPX3T1fe5wbQAKP+YjlY/kuZGASGxuEQy6l8JiijtqdcYFloa8fFOuptjd8VhcZKz9v9fsL/BvE/WFgAz0ERDEohiTRY517/aaSwLpzjP6ogtJcXtjrFV5Mv8U6doU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH3O2pIeSzmZximKs3xOHCqYo9/MKsuHtWChillz+o8=;
 b=KconA6iid+D77irYy3lDHCe2ngd7zzWsy/OyJ/YaFCS4bB5guTQ5suKRSO0VTZC9Jeh66Rb8QOP9Ed54oYuWxhVw0arCl/tCFmYdw0UHY+vZNZxr9zanX1Bvq2li4ryDqg/dZjbtfUJWgi0IR+GtFOHSKu0MPM3IJcTWU70OAbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:35 +0000
Message-ID: <87ldkd8lr9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 019/292] ASoC: codecs: adau17x1: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:34 +0000
X-ClientProxiedBy: TY4P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8610cc-3df9-4229-8749-08de20b7da75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m2yXzRc8y+S+aIEET3kIQeBSr/A2M+JbV9Qy77M7irpuNNxL4mD8/3QOFSWE?=
 =?us-ascii?Q?rO4OVvLz1utFfnwOYTQpgqUxay4GljJpYw/SVdmfnfDyXTeZ7mjmsbO7FedG?=
 =?us-ascii?Q?TGCzm/7bxHtCRrm9mX2taiF0ykt8Kg4+fsI/lAoZMYCVjzcRC0vZKJ6pVbIH?=
 =?us-ascii?Q?q8er0U9jgmBC6T/h3mXxKN8zcjbMixIcinwU80XiTbN5Ko/QvkjNpUWOGNCh?=
 =?us-ascii?Q?RL648od9jun0XD+PKj/d8x77mtQdlZONW4J2zTzziMC3TdUXX8QziWeuAQHk?=
 =?us-ascii?Q?AQEoLz2+J3rP/LRXoKUJ8is7sXqFFVNUEJy/bIT/6bL18nMjJ13YDT78eowQ?=
 =?us-ascii?Q?TzmQuB/ictcFGSQOI/3cAB/QYw4vjWqTfauh9wC3DZATzjjuctiOfbcxe4sJ?=
 =?us-ascii?Q?szJF3sYGxySuJFPJZiPV//Eue/KBkKMFXmhJfMb6r/DC1mT5d5vylhE+ELK9?=
 =?us-ascii?Q?yN/kIz0OOXUwFKwmAfH/4Ixv22GM3sidw8UxyN3BjHUAac/Xzc00JyLIrqts?=
 =?us-ascii?Q?XzvW8/5Tx9OLBcpb3op/svfHpuAYO8OJDTsjDdDyGkQZ90etQ+hP4L/fw95l?=
 =?us-ascii?Q?gA0NhAe36Arbtxuis98DKYQQZsMKjQk+R2yTSX9UpqnTYlnHESRlQQIrh3QN?=
 =?us-ascii?Q?hFt4E6rJ5/qNvZVpRUPk+Y9i/1Huggqe5U6S3myI+MrEyu3yxYBdFw8pHS7L?=
 =?us-ascii?Q?PvrI/KNCYwPnZ5wW6fhVJG0S85WN7JoHzsgVc+ktw+NjhFlIZZCVsnWSMuDZ?=
 =?us-ascii?Q?1W/HEwmlRNplWp09Vf8SJM7kU7jqZNaBu2d1Lc/HUz5RJJRY0j4E8zBHnVGG?=
 =?us-ascii?Q?L6JCNVUYzlgZdsx8N6OEfDaT8hGOoTlCHrI7MlegG08RdSlGkxESW5pfbIyj?=
 =?us-ascii?Q?H9NGzdbTbFzzxCGfutkX7VOi45y3xX8wK63zFJADWPuL+gvY6wXRq2mg3EZU?=
 =?us-ascii?Q?ZBNbSs52aG2hk5ed0V26+gp5jRtFkdDXsj/0RLaYo8wsBurr4xhMWCcNOxKE?=
 =?us-ascii?Q?/Y3g+G//ENcyzBxXv7Rmf/MbZL4oP+dEXUGvnWEftalvqYLmk4N4JPNJeJNW?=
 =?us-ascii?Q?uW8z+2kxau/hGz/u9JSRNRpkPRWYR5b2A0Vo4BVCGC5vt3I61RSwyUuVIT0C?=
 =?us-ascii?Q?9kAYK26DK9PxPxuOhwFj3mCVl1uzMn1fsdbNKh8s5DRwLEdNd1Ogt2n6DnWd?=
 =?us-ascii?Q?xH167ST9UJF+kXM9rZPYBu/aOHeVoCBjI20dsb+LJvgJag+JRKaTfaPuoUWQ?=
 =?us-ascii?Q?GNrLuwu68KfEno75KECsqPP9iaRlo4O2L3RWZCylyUicUzA7VCvFtBU/rqTH?=
 =?us-ascii?Q?lmHU67pBz/BSSEHtOrgm0sIqBhAJR7TNxuMFzc4yTYe1J/YtasMny+W9RkZ8?=
 =?us-ascii?Q?LjMWJHbg1cC3ohC5O23XR6xf2tCWFX2zb5+tyy2krC7LNDaYWOcY3Br0cRHB?=
 =?us-ascii?Q?PdU3mPJdd3Jud1yDzD6p8k42SltxvlQvpO2hbmOZlAVteOeYgMgdAPFHDhHy?=
 =?us-ascii?Q?0ieNCSgGPYR9MS8kojoHgmXii3Su15SbvFCw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+4WVVHBP0ql5+kqIzbDdXM42cI3KgGB3dEGXeVFIW8sdwOCekWO4czIiotKN?=
 =?us-ascii?Q?H12Sj+hUJmvE6yUMDifoJZot/TzTxrCJi+4nVp4KoNWI6yINxxJEsIFtYj+D?=
 =?us-ascii?Q?De54o6I1WHN+9vgXHFnbXjh55yjpKox+jCSHGRcb0YY+zsAk4UbWd7vgjO3g?=
 =?us-ascii?Q?6RreM+yngicVhatBR9ekwxq6HaXiDVMMpuB1lDBae7ZpCiHKb7SAeT5eLsmZ?=
 =?us-ascii?Q?GV/AvAItOPmf/EqbdSZoAzRj7rNIqoYyd14Jih9p3zspLprNlj51HI3sAeIe?=
 =?us-ascii?Q?aYxK+kqlNQoMWivhI/C55Add3OcPk9X57EBM5Zx17mEFth0Z7oRsBsTwwu+R?=
 =?us-ascii?Q?zQw7nEtCLb/aDVC9RqpjKdLonpQyI28UWBg3T/cfgcjsGxM0T5gMZIGakvmb?=
 =?us-ascii?Q?2fxOWYzsQYTXOI/M7HFrNkRckjzoN803spYnvLz+Tu2XXyJld2wvM5jdfSzC?=
 =?us-ascii?Q?qxVJM3Inql77PbtfYkQm04qdHWJBEQrQimyxGz42oZEp2zfSjADT1bAEEJsW?=
 =?us-ascii?Q?nAv/MPYQ0kLGMTrZJVQwhJilvDUs4zKCWperDVYf2Ec/gA+Xl8okm3ruvKGw?=
 =?us-ascii?Q?SZbqnwzCOEE6beAL/M3jyP2zDZw+WAO8IHarikfEmpXqdJAU0bXn+QNn/GUS?=
 =?us-ascii?Q?X7E1dIh/b1JxOl7fqIXPA1B8y+7g/1BkDG/sMr3aAUFkpZylOQFiGFVFaF1o?=
 =?us-ascii?Q?e23aAnBDf9+BXmqh4ONFIq4yBpj5NqANG9WmAOr7Zc3yepBVblg+qYFev7AF?=
 =?us-ascii?Q?3yxzjlho9+c4OfhCKkSGflk8Goa9rLw2bjOqcVZPjotJAouevRN95BwCLq5q?=
 =?us-ascii?Q?ECJCyCxSY1JOsydAHHBJR0LZXD2Na7MzXZJxDtzhGbb3phk1gO9qTeiWhCLD?=
 =?us-ascii?Q?Tr0YAwCTVSUrAWyOxvrlFWsmXXtPh6/Xgn2nbD+flEk9p59b3uhv2EJSWBi/?=
 =?us-ascii?Q?UvjepPkJuVEgz4CX+NUwyGPmn1o093ffXNP8x5xnOQ61Q7mNcsJfS8Izhxzn?=
 =?us-ascii?Q?MZPP7paYc5a4WZa9SkP0eHZ9CN+igXVyVTzzbRMGOVC1dZpzZaXKLYqS0OGj?=
 =?us-ascii?Q?1ibkITXptVbS798AiivSkGSr/BjjBJu0jzjnaRilj69rtiWDIrM1d3QGysJA?=
 =?us-ascii?Q?Ev41okA8dTd0+MLcUby/pxTLe4peHF0h64rfB2MvvBOXKQTv8QNbDwJqulEM?=
 =?us-ascii?Q?1HFhsW7oRthYgV6o8b+UraVeH1bO3Mf4ySlGXgRGNLLI9amTJ3S3hXtmWjWp?=
 =?us-ascii?Q?S0Iti4HtE5t0P1pJNKvcmk0kWPcMO0h45FPIcNU8NPIz96gqS3oOtGf1E+TK?=
 =?us-ascii?Q?niMwUQPQ5rV9QP8pevZXLa6s0nEtk2WW7J5XOkH11lMp/BvvF+Qv7Yz8jwRZ?=
 =?us-ascii?Q?Q5Ymq1QstbLz/LOF2ADTmo/1Lb3CmSOD0cEpd0sSLuJHt8R1vfqGsHoRpTJp?=
 =?us-ascii?Q?6pPJhc/01hEV31msNt5rOFF/iiD1a/I7YgLy481152RkaGjmc4aj7lGr5LYQ?=
 =?us-ascii?Q?Ezhewdyo28eSBimt+mRgYSl7PKV/eEB42p+cdsrBlreTYv7/EcS6uJxrF2Y7?=
 =?us-ascii?Q?t5FOoRsWGg98EIMY6MOmCB4xwAjntVw3CWAtcTfboTAKSWBdLmNd6WAVdU3a?=
 =?us-ascii?Q?C5RhOex+cdUItC9rYoTTqpg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8610cc-3df9-4229-8749-08de20b7da75
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:35.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oY24NiNQ/8mrjE+GXwfH2HeE8SrnWEkJtabUY4uGdkrjZjN9DHLERdQLqcLrFmgvIaR2PEs/x3UaKvOSF5IANRUThh3F9sUgoAhuNY4k3mWrQOs5tNOZnTZerqeI6Vjq
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
 sound/soc/codecs/adau17x1.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 0b6b0d2115eb0..26d7eb437ad18 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -185,8 +185,8 @@ static const struct snd_soc_dapm_route adau17x1_dapm_pll_route = {
 static int adau17x1_dsp_mux_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_update update = {};
@@ -230,7 +230,7 @@ static int adau17x1_dsp_mux_enum_put(struct snd_kcontrol *kcontrol,
 static int adau17x1_dsp_mux_enum_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int stream = e->shift_l;
@@ -383,7 +383,7 @@ static int adau17x1_set_dai_pll(struct snd_soc_dai *dai, int pll_id,
 static int adau17x1_set_dai_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(dai->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(dai->component);
 	struct adau *adau = snd_soc_component_get_drvdata(dai->component);
 	bool is_pll;
 	bool was_pll;
@@ -881,7 +881,7 @@ static int adau17x1_setup_firmware(struct snd_soc_component *component,
 	int ret;
 	int dspsr, dsp_run;
 	struct adau *adau = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	/* Check if sample rate is the same as before. If it is there is no
 	 * point in performing the below steps as the call to
@@ -922,7 +922,7 @@ static int adau17x1_setup_firmware(struct snd_soc_component *component,
 
 int adau17x1_add_widgets(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -958,7 +958,7 @@ EXPORT_SYMBOL_GPL(adau17x1_add_widgets);
 
 int adau17x1_add_routes(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

