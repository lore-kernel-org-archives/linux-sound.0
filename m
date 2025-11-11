Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B913959D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820433; cv=fail; b=rXT6LhYkGU7jIGVJBTnVeQ5Qo+yPnP2hkfSldegUkyIq4nAWT+qTslSZ18EcGjGTb5MGEYgm5oBQy5naPSk30vxpK+rbxOPfiZs/cT8VfIxw0rAb/z08uaD1cTPwjCNh3nbkkbOfCLB0muZrc0nwHb654CsY4zhA5BvyTtkT3Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820433; c=relaxed/simple;
	bh=cAbLMjqKn54TOutpBO5jk+v6kU3/VSDn7tC9ti8s95E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pBKEG/HFTLlUlPKLEDvC6+kl4Kt40YwagLNJ0K98JwcMCqgDyrTu0y7NVKIhXoJzZ+DvkRHe5uHbxh4XiAo7P+B0IwV+byReVP1MOhXMSEyZWIVzQnt7QpZXdpi8lCvpiGoi+0Keh9FFaYq6EqZFEeG8I2lqgqTKj0UW5tMybeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ppuVnKI8; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ppuVnKI8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmhg0hxK4ug1xGa0XIT9S3XbjEbiaOp82q9lj7BvtGjInAaOxaqO6SJjBVhwVRvTe3D2CaJoGWDVyPyGIaR2XwrpmZCf5giezKyOYhRlRkRZ/4TTRHthJ/ePcnRifendO5T/9uay0d8Ci6xHq9Q78T1hnH2bqRS/+xpEoSiRKCYE4jS6HRkvltHy46jjCc1hiH6gEHsQrKELp36a5dmyS2Dud6SQxT/e84egqtjM3SIHtfKBX7j7Ax0q46dS4UvHTqTCXipG1u+bR6NK/J4JhJ91bfed/mLo0R56T3cazqf149wjjldwlwgTSNGqTZGc7Ud5fbEwfRT/AwUo02/9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zfaIO2ljwPKFkq8CzwDhEFUuyQwsYA4PQAZap2ZN+E=;
 b=uj5BVXN1wOStJVNn6g6AqkGCxOYsnviKyMdeMk9mUeVzUlGzHdgBxaPPRRHSmm3HerVuAuM88+VF0HmloGbDxvXXXv6I/m/ztnV3PVNz2+GrsYMq31BTrGlg9dgGO3kSlUMwLg4GWWfqUhga3bGp2RBoQ7olMBMnwLglY7yv3IiTzL0Ft2aadV/rrIYztXHUNhxbuGeKMxSkqEYixsrkvevcCTiFZe53lr9H2rJW8VDJKc9cTW11Lsp43WZiiemtNZkS+nAyYx4+yAQHAwCuznDOgBgQ5WY/oIt8x8uuE2fOIyF0HLZjOni0vB4N2h5niSGXb0JDRYgrAdTjaMNyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zfaIO2ljwPKFkq8CzwDhEFUuyQwsYA4PQAZap2ZN+E=;
 b=ppuVnKI8U6fKPumCn9DNyHUQUie6FokDMY1nSrkgsEJOTU5dguRds9VnwK8fBzd4DzoEE6PPvBcrHudQm0u+JFVa6cevonnYVZEwK9VxMyh1E72hWZyRgpdoux307RupL95kGmID7yVjC2z2pk2VeegX98VSJuKLvEcKDQoLIQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:29 +0000
Message-ID: <87y0od773m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 034/292] ASoC: codecs: cs35l56: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:29 +0000
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7ebc81-2afc-4054-22ff-08de20b81eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QQxBETHjt67o9SffGqwV3JpVQ1xZf8EorJopumLchEaZoyTdNr+5TLnD/oB2?=
 =?us-ascii?Q?peDwk8zNZhyKuBuPxxVGwA2zIDPhojAjiABrC0INQPj/2RQtuAMXBXaDT8d4?=
 =?us-ascii?Q?cyN1OdD5H0HJPN95m91XH/1ZLZKYdnlOQnpJB6vJAOqW36wEkOlnA9PWhuoC?=
 =?us-ascii?Q?STsZIRyNsoIRJrUkGCOtKbwDifEZmi1m6aBxU+s8J07+tgpJVJuFdrw+JGSx?=
 =?us-ascii?Q?4My4XgCPiGRDjy61WxFARu9ATRqibz5hjOu9uBrOx6CfIt9MxxDZmGay7erQ?=
 =?us-ascii?Q?ecVRlwJP0QWAlbgWrQdpFhtRx2cF+Ltmet7VMs0l36DDXKjYqFMbvr0AzgS0?=
 =?us-ascii?Q?WaaP5kyFWYw3adixEzOpUx8XxxMzHBCvrtcb6tGkzE0G+7/DQacHfqwYSTBG?=
 =?us-ascii?Q?+YRJR+P/HjsAUcK7dQFlG0C1wRx7xPwnx3aiPD3l7zS27ViW/szEagWRA7Fc?=
 =?us-ascii?Q?OIPblmID/xpS+LCLZpcUJa7cS1g5/Wxt15qgNX8Pa8nS1kIt3QbNqb6USr0p?=
 =?us-ascii?Q?4pRzYMbFkzjIyyk3+CJtaYsdy+aL+REtttxACIllGFI4cVw/8HnyONHAfew3?=
 =?us-ascii?Q?eYbN/TrmAzFY6tr/EJ2/U2kQXOwJtRg0r8ZE28N0Kokxu9KE5yngHFc0zHpP?=
 =?us-ascii?Q?1slAHEDn7u7uavZquock4ZwILtALXaZyyWrnQD6+JnnSzntJ2YJTbK2kVW8V?=
 =?us-ascii?Q?aXK/PPt6OEjhakibRr1tfDW6OV7RkiPpeolfDi48jv71DHqLY2Ag1O3def47?=
 =?us-ascii?Q?9v1zIrydO9w05sgPa8OoeMSbTgaeZ05D03seCQmiAcFYAm8c1k0EplKU6s6e?=
 =?us-ascii?Q?bTSkmbF0mhE7l7lPSaqZ54dnXNQPTH+Px6NOX7upqZEVqt2Zq7hb3v0zpPbe?=
 =?us-ascii?Q?bkBiVNoFX4YIAfqMANEj0hW3wGx7Zf8JxY35kUJyX9XV/sQUV6eg58uQI+uk?=
 =?us-ascii?Q?H22nTdpE+nk2hm22czI1NXDIxzam5VID0tF5kMGYI3vI4lVwuC1+pd+wbX4v?=
 =?us-ascii?Q?+IoCu0zG2T5oPc1a84RgFQlRbt9+PNnLWzDXB3k4SnOCULqLPAy7p3CmmMjL?=
 =?us-ascii?Q?9OYPju3TeGf0/hvLRnNV+KXV3+IGbEDL26LSBKM3wcDqq4NSePiaiwg+T8AH?=
 =?us-ascii?Q?h3lSrOcuIkomj+WSY1OE+fSOBHcRoHE0G/9njSvZ/O1g+epXbl1z7RU7os1H?=
 =?us-ascii?Q?jmbBSKe2RkKytHN34tUPBR2y2+/dMw22e75H01JqO+yjWL25DYj6ad6hKV8c?=
 =?us-ascii?Q?q18etwA7YpaBPcvsmL9n5KH0+Px8NJJuHS/SSw2x5RPUHthEEuhIBDig2S9p?=
 =?us-ascii?Q?wRKYZnmeIqjpEh6YU/v9k0BNZsxyNHMDq8RcV75s/isD/6HZF+WsFZl55bej?=
 =?us-ascii?Q?AltI4O3p3XBXCoMYeHB7JPIq9GBkpfNtm/VbLBQOFSfEd15owNU7N/xgxrXP?=
 =?us-ascii?Q?dgHzQCaDPeWhzYVD6Y3FetQQCI0AYiVWywCXu26FsTgi6Gr5kkGs8GhYWIWo?=
 =?us-ascii?Q?Hg8NW3dC+HbaZ4rB/pe/EsawSlPR1ZeRUMpr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HohQlsEoNTCKP7KiKUxgkybllVWytph91Oc90nXx7Q7sa88lnhuEuloM5am9?=
 =?us-ascii?Q?8p1FRJsKAUa9as5f5ymbhWuZLK4v6mMl8NfAAGZg7dZ3/0ii8Lf/Bd/lToXX?=
 =?us-ascii?Q?3/mJw5V96/yg+9PiLTC2bRQ/CIXt9S6wuxZqA0mECnv83IQBF/aiRcsgoJFj?=
 =?us-ascii?Q?ViqFmha4tYb66lCkGkOlHPwpnFKPiny5sdiJtaj7HKnjMixyyv7TXPPZjmQ1?=
 =?us-ascii?Q?/zdsPlAPLfsXupTpINQrpm7gD3Pt8B+cKFZ20R/2mSpwbCGn5RI6sOqeN2Jv?=
 =?us-ascii?Q?1FC7DkDMn7qyXhQaDBUVWyqIgtADjC8q9/kuYIpN9NCDDmhExjS3E7wv6Pnn?=
 =?us-ascii?Q?AJEmcEcf0yyxSXcgY8T58gq7dy5ZYUYxXmDeYNrk6dzj9fBicBXB8al6Zj+N?=
 =?us-ascii?Q?90gTuW8gEE4wRo7nro6IaZUl5SaGzLSa5Nr738ruCis81OaAn6wFNKSB5fGU?=
 =?us-ascii?Q?qrQAYa6lwhgDU2jxNyyzlYt/TTAc0BokkBG3/9KFr5DacwC2b/llzPbU8oGi?=
 =?us-ascii?Q?uNc2DBVN39zYF8wO8xsP3O4xy84It1S/g002qguAd9WdzEHtIxm5L9VigrhE?=
 =?us-ascii?Q?NisDM5js0IDiqEP83uaA+biRieRw2my3VHAaQaZiSQpLgX0Wc/vMXX3wWKQc?=
 =?us-ascii?Q?GjgnxZtXBGY82midLY9zJ27ImPz7kKN5YnDDkwafTiu9vb3VhjxPioWCUU9s?=
 =?us-ascii?Q?8hBfrs2MBB93FTnphdbf9w2hb/Vqx1Rk6g19FPJekXIUk3uPZAGOQOdq3ybZ?=
 =?us-ascii?Q?wg8U9E58YbTf1F3jkX6mqg/fzqcbWtWmBQqPuOz1J3a1JaxvaN6v1WHNJlD1?=
 =?us-ascii?Q?HUW6i72fRAW8vOpjstBgapk/TG8BWbiVpmzwEF+Uj7p0ww1ZuEUX+I9P2NT5?=
 =?us-ascii?Q?1KT9bZRd5xKpGXYc2J/oPi80kEAkz4nOE6geKYro32EVLgooA1zDH7rGlD3q?=
 =?us-ascii?Q?au3kLBudQy+9Ak8ZF34WsFz6yew0r9A3yjij8tj1fPU1PeQomZMFnq3CLxml?=
 =?us-ascii?Q?t64jPd3kOF28+N1jZFUY0tCzjqUCQGVFWrIey3Nrjbq66CHjUqic7lkU2yA/?=
 =?us-ascii?Q?HYrBL8IA7Sl9mSyYQYaanuoDHN8kGePyT3dEP/N88Hu5S6ZR5QNPuFfqg89x?=
 =?us-ascii?Q?AcEjKm5vQbgHFswcu42gu/SXMqOrIQPjqlqOEL2R8CZIru8M3gUO/GUllXcU?=
 =?us-ascii?Q?w77Ru1mlTRW7uRzhiO/SpX0IyMEVDZCdvAfpYVVpxM6YWKa37aU2/fK7bPYG?=
 =?us-ascii?Q?xtzrUsUGL3H0d4Lobnhe15v5zO59X10H41nEIoTZOBL/rjfMyakkc8C32kO+?=
 =?us-ascii?Q?9X1bUl+j8mZ9aIJhA7C3jl5ubcER3EJFheF+cjTlZG+C1/oF3UtRvAjgA9ru?=
 =?us-ascii?Q?9Fw4F+rQMPL9mzmBDu+o2CYCU1C0PNe8KrhK4j++Bgs48USbggdf2kUjdWUa?=
 =?us-ascii?Q?Ea+2Jj55+Ls7t++Nx+PLW4zs/BMdz3ACms5jE6aZVANrIS8i6HF1ngP7x25j?=
 =?us-ascii?Q?lfZ4uQVqK6abwotnAlfuwzxxe9MwzJyX2UddmSRXoc7alhhE2FQ+adxBkTA6?=
 =?us-ascii?Q?7mJmf4tISsaohX3sn//i/voKPMACOpzvqNbpYK9+j6dXZwsHlOBPzyRQLZQv?=
 =?us-ascii?Q?vrXfNC8LvRwyHR+hwGywxwo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7ebc81-2afc-4054-22ff-08de20b81eaa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:29.4884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/DysqyuUT+1qQo+8nqhOemIECPG+9kWlR81hUBzT35wp5wi6K3SOd/IwVMEsTh1FBubbFYvUe6qq54E8XEcAt/njM+a71EhLqmlvNSG7KVK3b7eaFCu60iQDagcJRPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs35l56.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 091a723255078..aa3170ddeb5a5 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -880,10 +880,10 @@ static void cs35l56_dsp_work(struct work_struct *work)
 
 static struct snd_soc_dapm_context *cs35l56_power_up_for_cal(struct cs35l56_private *cs35l56)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cs35l56->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cs35l56->component);
 	int ret;
 
-	ret = snd_soc_component_enable_pin(cs35l56->component, "Calibrate");
+	ret = snd_soc_dapm_enable_pin(dapm, "Calibrate");
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -894,9 +894,9 @@ static struct snd_soc_dapm_context *cs35l56_power_up_for_cal(struct cs35l56_priv
 
 static void cs35l56_power_down_after_cal(struct cs35l56_private *cs35l56)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cs35l56->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cs35l56->component);
 
-	snd_soc_component_disable_pin(cs35l56->component, "Calibrate");
+	snd_soc_dapm_disable_pin(dapm, "Calibrate");
 	snd_soc_dapm_sync(dapm);
 }
 
@@ -1054,6 +1054,7 @@ static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 
 static int cs35l56_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 	struct dentry *debugfs_root = component->debugfs_root;
 	unsigned short vendor, device;
@@ -1121,7 +1122,7 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return dev_err_probe(cs35l56->base.dev, ret, "unable to add controls\n");
 
-	ret = snd_soc_component_disable_pin(component, "Calibrate");
+	ret = snd_soc_dapm_disable_pin(dapm, "Calibrate");
 	if (ret)
 		return ret;
 
@@ -1159,6 +1160,7 @@ static int cs35l56_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
@@ -1166,7 +1168,7 @@ static int cs35l56_set_bias_level(struct snd_soc_component *component,
 		 * Wait for patching to complete when transitioning from
 		 * BIAS_OFF to BIAS_STANDBY
 		 */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			cs35l56_wait_dsp_ready(cs35l56);
 
 		break;
-- 
2.43.0

