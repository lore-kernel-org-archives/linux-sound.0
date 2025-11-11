Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D278F26
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820285; cv=fail; b=M3sCpBLJ1ua9GmUl96ch6tyvJDEOSruoQPPfGifjYOA90eFssaqwUMBMR48Z8BlJx+u6KNh6oODVuMThZhemd5D79h+Qs4uEswaK62udLsdEg3QA5ljI4V5eqx6cO6CnR0NiPHhhHvZeivRPs3OgxLG12bOp3uHQMQX+aqunsjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820285; c=relaxed/simple;
	bh=t42kmegdaRxueHXwDyvKuh11D0C40ls7eruARi2oR84=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y2t4VMCsiWl+jrEG9dupOyVzxQVN075uMW+6RvB+L3sAF8e++ijNW6fAdofCxRf9Cw7ovp4JegfA4tIbFU9u2UqKGiGY6ac+NM/zbNm5Z+Q8w+0Xp7TEYTHoHTSyB0nQGKz6tgyIwRI1V+iKtFJzVHHJzy/wCvcV3BXCYVtV4r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HGQzDAmX; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HGQzDAmX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGexMLSM/mySKSrGDlhvQA6uIOQZOCvz9zCq3qVeYQpZrXrB6UZw2DlBl/g7josB7PiLGKWVUmRcVX/LYzdyMuWITNHM45RUIsPJxS01OQqLqFQ2TxBRd/C9hcSFvYUnyfzBh160SrboNxTYhjaOnh2jRYuj7ICIzYiYZm+0sbaAMelqjFxhnywrg1wLN5s/MtC0Z4Nfb/4lA6hBlzN35y+mF0zUFh0UWty8dHTd1XOtRrnFCDL6aD+xHf3D/4xiyKCWiC2bjZCFmWPTFbn7xjSkSIQtVDwk0DEJLdDuZtDaeDAfE9YzBPOLkKqTmFxOerhQt0hKlwGeQY21NBCfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyyODFeDjVW8VmarPmHED8VnCDUpTzkso1PXkDqS4to=;
 b=k56Ns1Do3PAoT33k/8v30DkAzgLr/MBN/8wOV6H3K37dEYMZtVLz2ZKy5L3tF+NsxO4zP0yf3BVUpGIc5S7Lcca+QOAUUlMp/hxQS9vg/hFQL6jzBOwgIPa0F8Y+Wg+QxPx/5L6liOgfZfGznuAK5kRccO3Fs0zVcxHFvCfvaV+GiOTfp4UMCLWeYZydhIMdhgkZiqX/ZoZZCUaWtUBE4Cwu4jli7EfjkfFAcx0cTNqDnPH2WX9yyv40zgZOZ6akmzFsML4Z+q6QsCA3Xp1FTQC7jJ4X2Wad7fgV+z9EqiQRYbE0l9rktTB6i7qfW1uODFq3owx26oYeNck7hCZ7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyyODFeDjVW8VmarPmHED8VnCDUpTzkso1PXkDqS4to=;
 b=HGQzDAmXO/b4w7BmDMF2pxhoVEBxOSsbSmX9k1Ir7Q8hOiIhRfuGLb9EYYlNTRX63U+qHnx4p2g606IU0KSGuh81RotANlqXD3/tSX1IA5tarmeLH4o6ZpjTWQZUvV1f0zVjxBCi/Vkr8ssGvEcvQGsJTFZEz8QpRNjRBjfZu6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:00 +0000
Message-ID: <87zf8t8ls8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 009/292] ASoC: amd: acp3x-es83xx: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:59 +0000
X-ClientProxiedBy: TY4P301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 20daf11c-ed43-494b-d3c1-08de20b7c586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yVFXm3HHkgEo+VU/6CV4scC6sE3GNm2+mqKbXh5YIkoKcnwvBJyd2yB1RHLe?=
 =?us-ascii?Q?oAzt0SIklGEh4VGvkwsRs+Pd/+Vjtu6bqudOooUM+z0RdGWYO0DybeIVeB48?=
 =?us-ascii?Q?mFTvuUswgZGLDVgWI6I4hNekmd21bVIR9NViueZ5wsE80tEuzB/KOIYLoW/k?=
 =?us-ascii?Q?7K8zPZOfCrdP9LTcgZSX/nx23IH8klScudTWnBUXpSr0PsYZi2QZckNpdc7S?=
 =?us-ascii?Q?B1ZENT8lK5KgEjCHe9NjWFflb2qTILUhIFN9R/8gVIoqux7bx8kjKOuXPmvf?=
 =?us-ascii?Q?8Xkho7ddZamJtWaOublSLUpYla++uQtrf03Xcl84IUiEpWFeHagsrTspOQR9?=
 =?us-ascii?Q?eYq9cJwN3mDg8MfsxDj2uewd1zK+xgvJUsSaacJzFviHPV0P4faJi9UxQDe4?=
 =?us-ascii?Q?X/JajlWvByBITn/UUUjQlxk9NwbAxOmGak/fvlHJctdI/CEkBmsUyAQUsHy9?=
 =?us-ascii?Q?4Jh1WqHAe4DAU3xcz0i1mmHf8Cdo2XDAq3vqk4PlmCp7xfPnhWWse3bDPL5i?=
 =?us-ascii?Q?1stkgKhfpKDsT66kVpWJ0h+4fj6zpzD2Ras4WP3MRxn5nqlVQLm6l4benT6o?=
 =?us-ascii?Q?nzm30ZlmwiivaR6IswwZJsV83bvZp1Q98i6SPeuwb2dfZHByrxpLQ0wdavT1?=
 =?us-ascii?Q?lAu6zKyPJm8AOF1EgaSW5u0LzNsuL1MVtiMcmVOKoCQq6uOEN9sQ0Mg7caVS?=
 =?us-ascii?Q?d9PswuCqPGulU8EOnCXftZ9kIdc+DoYUk5nQ+30u7yVSSlJ5Gy3bdzksAS1s?=
 =?us-ascii?Q?1dltly7bScttXHUbz2ZRAPfBbPMWrSPfZVCHcEA6Kg2lg9cOQk44rcbQ4him?=
 =?us-ascii?Q?Z+NCyTILWTD7jRrMQQT1Lvp2G/6YTIq/zXMrf/24wEo7zFBYfRNrjiFJKzmt?=
 =?us-ascii?Q?2OpCUaGStNxjp4gTM8ZS5oo8WsnrBtuCF4N/ofVh8MmTJIfREVdnszr9i1wh?=
 =?us-ascii?Q?b4A5CGb7oPTndH/8bdFc+tgvWxLr9WZ7/pixxbf9vaf3C5PgAH7CxJkwXPRL?=
 =?us-ascii?Q?bXZK8KwL2gxNmmRG1LOBCc71iYOKfI7w5uxTf+inHEr9ItF5xlVgUxFyqnAE?=
 =?us-ascii?Q?yxAfqu1lFPAE97NpL3CpvCusoE/lA/D7ZV+omfooq0XYyGQMrWhNxbNecSs4?=
 =?us-ascii?Q?NWw+1wLJbx8RAV90zq1zlPSjIkrdHTiKbdj3uTbG5Ke0e4skLPYCZCtrDZ33?=
 =?us-ascii?Q?3v9ay8orXkQAhtLOg3WZZ87TR8IMWlmrIzzJDB0DZ3WlPcq1Nyi4ZiUhahst?=
 =?us-ascii?Q?PBukAvp+lnmIxNzE/jMo15pdBIT8DVZIIoTRrG1XHVAyNMuDok6Der7J1IS1?=
 =?us-ascii?Q?tkVRAcngl9jTG7AYNZ+2OobGSECFrohqkhdGP2ghb8hEzl2mpOESlciky9a8?=
 =?us-ascii?Q?ZgtS522vl4QmO7/plcNH5TUeHSuXsvp3nidgBf+uWXS0T7q1XzwizAjpduf+?=
 =?us-ascii?Q?B8jdRXbf6VQ/likNnErAS1r83+u7Fct7K7L46nKhFEiysIrJctAm0U9av2IF?=
 =?us-ascii?Q?TLRmEoQhFr4/hu4uVFnfuVV5DcByYItqOCa7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iuhOf1X/6dMvAkXbLKqEomqrCpVCgeN6MipHWRhIj0WiFNzCXMBze8/XF0Mt?=
 =?us-ascii?Q?xH2nwXjFA92XJJACMFYo9agNFI1jE9hnCRwImtUv6Yb6doPRQ76zTyN6j452?=
 =?us-ascii?Q?vC0gXySACMKGMyT2lBc1ILq1OD2gNUkQOCU+tcdSatosQ6sahIfIIjKVItKE?=
 =?us-ascii?Q?9WOODyBeI+jatOP+HtE7OuYivjW2E6uDflq16syBGN5OwYwXa0JEXX8rrdKQ?=
 =?us-ascii?Q?MPQ+aRtqTwTM4E3oOXpLWRbj8S+VpS10SmPeRhXL/GTao8VqmDvvfbo0rxVn?=
 =?us-ascii?Q?+tVml+vWBp2Mmg/7CfRHg8SsRhttjNYNf5YhIN36lKCSSbSNLCG4BSD37f/q?=
 =?us-ascii?Q?XAa5ln0A/ZjLB5YtI/2CF1wrhsNWw2a5nNEB55QUlo4Vloqb3woB99jrpady?=
 =?us-ascii?Q?oQ6KAoI3fVosLsiR6V59a9WbRXn7g8to5xWmEfPGBCAfSyPXAxzMw3CqHUfE?=
 =?us-ascii?Q?ETEupqpqLHzp95vdDgF5EzOikqcTxzu+j4oXzc8IyhO1+ejFpEgpAzn5ZnOi?=
 =?us-ascii?Q?Hy5ilH/MvwYMhPRbuAixaLscGpdmb9FxNfQkYcQikljEtRjbWo0b72M5syEz?=
 =?us-ascii?Q?sfyplU9mDGnC3B+xV9EFLBD+fJU0BUPd3Es4Rm55+VYWrFL4IHq3ZJzkJoB6?=
 =?us-ascii?Q?TZ/lER8zjPBVEpGBfuOkclwdRHgUfZPg7yDrUpc40vAtCzWvmCTU1pKalzP7?=
 =?us-ascii?Q?ULSioRy/YO48bVj6zvroAJkSD2SUAzXkGK84ENO/OCHblW/6Rk4jZnGb0P3B?=
 =?us-ascii?Q?n4fi0wmvft9kKeZN69ByghS0rWG4YRmw+emcnS9bXLTVIFG5QFznsUiz/2DA?=
 =?us-ascii?Q?R5FTSWXI2W6DWlmC/hhdhMccpZqITo3OLHxRAOoIrTd2EUhrv1bfZ+JTzSNc?=
 =?us-ascii?Q?S7S/iVqIcDY954dOqqCOMms10940patBKo3n6JrTzCb+5bjxRVb/HEVtC/fS?=
 =?us-ascii?Q?7j3Sbht+jhPfvv8TW6M313xxQ45MuLEagT9fF+pymXnd3fQYMgY4zsX5GSDR?=
 =?us-ascii?Q?zX/0nVcBouU5acVrnclB30NyoCe4eysBy+xh1aEXMAJL0pEIga4nD+2Bv0p1?=
 =?us-ascii?Q?BHHQYjA8smdCXSh4IYRV3xQ7NRQrdiGrFq+cbicumHvW0IO5Y6RJCUfxOS5E?=
 =?us-ascii?Q?kqe9s/dbjS/SqoTnMPn5lGVKsYy55hmp1j8Gzk4ROJIG9QyackJmSppUnmx2?=
 =?us-ascii?Q?XT3k1XRyaKEQY7u7s60qtsiybgWxl7HnNVaA7RaznOTclgK/UDCfszx6ExQC?=
 =?us-ascii?Q?6nC9Pi06x2QluuJ+1qnp5oMHx8gKW7Ox/BZ0BuhwSgqdjqz03EJQgGzmt3xx?=
 =?us-ascii?Q?FN4RP+P+3/n17hOslJoFpBtq8LTYdQJqh4ckaQ8r7h2i2j94tNN1ms9Nm1Um?=
 =?us-ascii?Q?JeuDzjZcy0g4pFzxc+RcGF6WIJSq9K3KJ+XMnZg2QlXJ3718t5mrI9X9Aqzs?=
 =?us-ascii?Q?JZa9jhI4o6PdM55Wjdacqf4slKMMvfQT1yVasOmBxvWVmlBb/MUYe67Zk/Sa?=
 =?us-ascii?Q?tJMMWnO9jogppPlNKvWIoPRltAMm1XSf6HM5/NsdcjyQ3MDVpWtNT+OFk4Tl?=
 =?us-ascii?Q?TXo8jenkZVgdSEjRFtbvSd/J3YiOblGW0jWxNsKgmCDrADvx/SlMk/eWYjlz?=
 =?us-ascii?Q?sUbBLbwHsypLSfdXuS6prhE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20daf11c-ed43-494b-d3c1-08de20b7c586
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:00.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTP1ThfySJsW3D3XBGgTa7iF0uJF1Fr290yHLk0+1I0AJnewe7eA5P2a+6bKk/9rGYrw0OUbyrqXOXKMpulZTBGHZ2rKfssVO3CNXm5P2wCitNx/Dw6jNIzthnwImIyc
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
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index eb5d4a5baef24..141ea4787d999 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -159,7 +159,8 @@ static int acp3x_es83xx_configure_widgets(struct snd_soc_card *card)
 static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
 					      struct snd_kcontrol *kcontrol, int event)
 {
-	struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "headphone power event = %d\n", event);
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -176,7 +177,8 @@ static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
 static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
 					    struct snd_kcontrol *kcontrol, int event)
 {
-	struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -314,7 +316,9 @@ static int acp3x_es83xx_init(struct snd_soc_pcm_runtime *runtime)
 
 	num_routes = acp3x_es83xx_configure_mics(priv);
 	if (num_routes > 0) {
-		ret = snd_soc_dapm_add_routes(&card->dapm, priv->mic_map, num_routes);
+		struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+
+		ret = snd_soc_dapm_add_routes(dapm, priv->mic_map, num_routes);
 		if (ret != 0)
 			device_remove_software_node(priv->codec_dev);
 	}
-- 
2.43.0

