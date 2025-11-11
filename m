Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17740223DF0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821238; cv=fail; b=gdHGeuLzCGBrKHx2H55SPYKaZK1yslABkBgO6yRIMyoUW0zAIU4EoYx0YskyE3LfWc5i/doqht14X3ZVx0+suTYhaSVWhtwoVVbrdyqtpWsMcw+6VRV/TUeWs8jvfkLx0XP7AeClO/WepeMn8ZkPeZ4yRioQr8oPItMrkDWpHdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821238; c=relaxed/simple;
	bh=OB+MspLysprswEh85I1NnsQ9z62/z0/W82ppYv5Q5eE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ggwsoxo59tT9apkvdvG0b3+Yc5VMo32GmIkZpuzejliJ/PvkifZ+TaCQ594Yr4iQxILSvKLRWnuIx2ZSB/7gW5HFJZcW702WiHBZPclQHtO/I5GdcovXgu9WwDQekSsg4ANakvFPg9OE56OwdMkhTW69BCeiJ74FNKo/+9TrRMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NV3yOdg6; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NV3yOdg6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddmWR1ErieVH9ImtKJIoKFZSKUuIgPIla1kBYNnDeKX06Q1A3fLM8z7koflooK/y5ssNsox+JHDmm2bc04vChfZA8RNv25pvYMuH5qYa8Z+ItZ1A90zNVbHhnMmfGrtbWYTHZ5F191UU4h04d4VGJAQ+m8ll8yvaqbIznFOg/MnkTF10w1trNPcKxXISYD2pWBMolRzRMO31aIP2N4+YkRmZqe2/nwv0zR8F55JohP0xIDpWYJa/Mrx/kmHekl9kL77SYYFZoc0uOUjhJxojuvybS/QYL0dIE6zfdnylAYYwve8ww8XoYDLq3xwNtqcy3+yZxmftDBh+I8dGecrqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7XwDqUFk47rv18m4YqpGWZHNj8rAK5mE5b5VDsxyC4=;
 b=VlPeeJrgGwxh6pVq6TEA1zYJC9JFVKcX6kITCDI0xznViJGKDWUab9XmRnrjwizzZt7qDPmJW8Ge7RopWKahW32rQHuMjM15nNbPm9K5aaLA508nehx7bTDBNCo4I7uBBM/736cUsrQAERED538gyWPlQW6MIWyawx0sOPti3T9jyoUjTOBLWmTu9feYraR8dmOdNS9v/YXrrX7MCdTZNc38VFdQluBbf2ZLaY6N4IiXH0pxoFpTYf3BRZvM137cSlgCDsvk2GRGR+VSEHZ/7XvN0J6mHaf5eBhyVKx8lrmzM8hrSt5NbaLWBpOmL/0sSjknd/NOplkueeOKbnVNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7XwDqUFk47rv18m4YqpGWZHNj8rAK5mE5b5VDsxyC4=;
 b=NV3yOdg6UfAmeS+m+7taIdOIgS6n198kVRX3aZWhcZYzuqKnrl8sisJt094I0jhOGoHTutjlY+5BjvXk8ioCTlMjXepH0gZ3sAET4Boonlk5d8s2vx/FwJf4QbbqoCaXrbkO/2IUQZJtPLvVBD0vSIxqa/HrIpFtKZbxvrAxSoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:54 +0000
Message-ID: <87y0odv24u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 234/292] ASoC: meson: aiu-codec-ctrl: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:53 +0000
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: e235d8ed-7082-4cfb-049b-08de20b9fe29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XgEq5R160NkTk65OX8ruSQ6UojlZ7gM2CFctdFxYx3X2DxxfiT5OsLOMARkU?=
 =?us-ascii?Q?tkw00+CgN4O6JQ8c7aegBcqCwAckStYExgU380sahWI+4tiDdtS9d8FuzfGK?=
 =?us-ascii?Q?dq7oUk3ZV6FNuQhDxBX7cjXB5IJu9ka24OczW84V/qV1WjOPkEJqgpo06182?=
 =?us-ascii?Q?bE05AgEmucuSxkZgl2GXROyGRyawxYA+toRxUrW9o4S+00vcOuslAlLK6P3R?=
 =?us-ascii?Q?3uCr4//q6Yglv6g3ulxxhIchfDtzukUj63FW4VSYAO+3K74Z4pPWPBr6vVho?=
 =?us-ascii?Q?JIQmeHTPGnBeF2h7lVka/KbqN4J1jpiKBC/dWJhpAn7UbV9y86pVWettsXee?=
 =?us-ascii?Q?XGswycAVccIllr2nW/FXepUywQQ7PtSj2ebWhhvFossJLrR+wchdQl5KyCXy?=
 =?us-ascii?Q?REbGMwTw/txs7StYZxExCfmCjvN6FhGWy7zmmtEGENrckNvAaTpD5X6AsNhM?=
 =?us-ascii?Q?zbb5fyr5DNFZ1CQI8O5XFWYFr8k9I7V2VCRE0JhsZ6OeOUaryAgLPXtrYruM?=
 =?us-ascii?Q?HuCAWavzLpE1vco0iwG1YZqg4sWAG1zysk16AB4Kw0AJprGjtwt5sIjpHdN8?=
 =?us-ascii?Q?jkJ0X28EoPPrq4VR/kFtkSfK4Z5ufZrt1FEEhAGIYrCnme8jKrSatlJqkbia?=
 =?us-ascii?Q?wB5ts8Qs3m3btnvA6tlBNvgq8X/j8Qy+qg7k7n49Zg8O7mwte/K3rAH3EKYD?=
 =?us-ascii?Q?q+Fxxo25d/M+iT/zycaIwZ+laW6SYQXY1aTmNTaIijUrtIrVeMDzoMXjj/++?=
 =?us-ascii?Q?FJlHSG9JQj+nIzp5/3mXihFb1/0kwL14pWuV3f9hwsyQsaiOgKFnQyvcoEK3?=
 =?us-ascii?Q?YaJzfWTnjVUc6rp5OiBuIx3+zLOjwddMr6aHnohXMejWtyTwGEvZRcBlJefq?=
 =?us-ascii?Q?uQ/XhbJ0b8wRSje0z073eiz0pXbnYjdnO+O6wtUqI2qYuHsnOqvreDtzPWkC?=
 =?us-ascii?Q?Dk+wbKv9qY2PHwdFhDvm/tY+mBwqe3Tgun30jJZzWJqfmJs9PKyqnTeyWGOp?=
 =?us-ascii?Q?UP8C2HKzkqtcWI07MenVTrraqb0UVG+krlefjKGBcygLuG3t65UzDHgGbd7a?=
 =?us-ascii?Q?ZZ4cfQSZUSE+n92mEe9y5xfhF9MNtwXUuS4TBOYkJUgzNAV5X6cfm9WQBr1n?=
 =?us-ascii?Q?vDyu6ykp990kFzuxlqcrMk2zpLhJPRYEUC2VQmJs6Js294RJK3SF8upXcL/o?=
 =?us-ascii?Q?KsYwnY/os60E/r4Utp5sJh/CoPl9XK3hhBL/BYd3s6iUatEyJKs+iMzgpMBp?=
 =?us-ascii?Q?ca56VWVXIRCHGYVOYoL8lDBIMUlxHBIExvIf+EB1QM2qwUDPPr8Ygbv6uL6W?=
 =?us-ascii?Q?yE5HUTg9azyWpzPXUhI4uSyRKt/XUGxD5J3cNrMBaLAsjOGlHqwPI11pNlPI?=
 =?us-ascii?Q?mV6hep05YEB694KyNxZpSNOahXK15I40sauwsLBBbfTfKzWMvrGCTov0CrYx?=
 =?us-ascii?Q?7ET0er59TqdHsJ128dxFMEi6ERV/PFgtkVxIeIlsxa98R7JPzvENcnrms/nq?=
 =?us-ascii?Q?RtS3OxF0fqhPMZEZzLx+h6549/C20dFw3nBV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0iAnlFKPHopVPB0iBTHcrjJwUk5KwwjNYusuvkpu5DzfxoJkFHlHabDKDUZ?=
 =?us-ascii?Q?ASn5lntZCcEHq5NYwPo28e2jyZjU75ednfVkoBbsynHHgfc1mRL7ZESVxkk2?=
 =?us-ascii?Q?ga9/BivTnj0Trl1bBLtBmVS5sLLQ/DuGea9NlSDXbf1RY7Qc/sWU2If2Bznf?=
 =?us-ascii?Q?l9FjJPIXVGEyCGorzn+O6xvTaq//3+W0jFXEsixswPvdkwsWYAY036iAq70t?=
 =?us-ascii?Q?R+qn6TvSPuCZEy22Pbm/UnQYgwqIby/kuh7O2Ioqq9vy1qt8+aZYmDBLTclt?=
 =?us-ascii?Q?ovjaOcyP/fUzev54XvmwGa8DsjVjj9oX8wrZewsmB4UzZMWiz+B0abdyfoe1?=
 =?us-ascii?Q?Pm2P+DkgEvBW96jx0+yDH6R/KvrrQ7rji0NVfkBBtJmhVwxoT5PWYFIqdht3?=
 =?us-ascii?Q?8fJZQxEEugBPH70mFy5hFdcHT9tHJrwYwZQ4viC7bmgxhcqRKdaR+26zPIz1?=
 =?us-ascii?Q?/jkb/CZ/6kYHRrCF2SneUWCmWhUPn5l018FPmmaEYRaX8GAmuVHplCat5OHR?=
 =?us-ascii?Q?QPVeDcfQYMMu9CHDrJCq0dbhsZ/zkQNYXbehoKfWMzC2Remw1DCHYKoFJFbT?=
 =?us-ascii?Q?otkDIw91hWfxUZhDm4VUWtgwindofwkXPB67wmi6g3Srlbfeqf5WdkBwv2nn?=
 =?us-ascii?Q?frgCrq+RH6Z7SOodHWSCV+x/feTAMIdp0G2whV/aFVMgRf5twhjeatAIu/IP?=
 =?us-ascii?Q?VrFnqDph8pSGpWuAeyz+BXRf8RZykhkHgCO8oNwtcypwYCNHarr9LXdtJ95I?=
 =?us-ascii?Q?s22T0JyvwdT41Ez5BSGrmnwcWrV60btJeLVMN+elTi49QKLD/qw1yD6t+OvX?=
 =?us-ascii?Q?TQXQP6E6Sou886PlsBIP49nQD0kdTyldlNJoEwIbBFDFSMomjLACDn9YUUxa?=
 =?us-ascii?Q?FRdRRFwHsGYvduALy7dCSBqo4hQzUzKKPtEkTpU5xEwRQ6ESF78NoSk3q7lk?=
 =?us-ascii?Q?RVbe2e7AG06FjTAd1veWKtGx1c8NJi3EteOqmzZwR2I0cKBSLkb0vi8uYQnH?=
 =?us-ascii?Q?ZzHJvLWAfUXGY77sgqO15JohDydUmvgpSz8Pt55adhpwanSwhPalfmCehQqv?=
 =?us-ascii?Q?tYhsWfe+8kdN1g5N1lVhAEGMqbyHr8W0hDlmdUksPLmZwizB9xsEDqLCXA2n?=
 =?us-ascii?Q?5iHAxiddCFCGdddxH48226Nv4/Vk0y4OFkmwwKE3uQxqoOHB7Y5O0AyU8prG?=
 =?us-ascii?Q?IekHJx4UKggK73/+MIHtaPtLDMmjh1CdhsYDKyRh52bvjx0DViol6Sa5lBRK?=
 =?us-ascii?Q?PAukJ2ivnGK13cmnxKKPiGFwrdHBmFhLW2eTOohZBWX1A+13TuySlSFFZtXq?=
 =?us-ascii?Q?akzipa2yG5+gXKXruCR4FcCGnP0+BU0RNqPf3ekvoK2KtFw4/PafpqFToqIZ?=
 =?us-ascii?Q?FZhFiJ1eRofZp4lxzDDo+MDPZbEElWbbR2cgQW0eydSzQyZWBc6JRXUcdlf5?=
 =?us-ascii?Q?k3zzJYjJBqRPTgyho4sLgcf6clXCSyl2cbvU01gsVkBFaSC4TkqwoDebZ+EU?=
 =?us-ascii?Q?rf0mxDEnCFsLDq6/oeNlfzfi4WCC81lOeMvN6aNKeJaa6NYlz4ewDzWpyT+i?=
 =?us-ascii?Q?S51sEys4TftA5g+ggHD9dUVYYMfqds0Ws8aWc6wk1tr9e1gKEL9DV4O51RtL?=
 =?us-ascii?Q?DYMQBT4EX5id4aCt5v9FqTc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e235d8ed-7082-4cfb-049b-08de20b9fe29
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:53.9843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL+Ng5nliioNsM8EnudUAYtwZ6uQ8ietVEwbRrblocjGQp3Y6vCPY1bBhxHdd0mF3A89kTfVcuPcbV6Z0l839v0zg+Ccs2UM05aB6svRQ9AdnoaDcRdHsKIrzYwSSA49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/meson/aiu-codec-ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index ee0ef6301010c..396f815077e29 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -23,10 +23,8 @@ static const char * const aiu_codec_ctrl_mux_texts[] = {
 static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
-- 
2.43.0

