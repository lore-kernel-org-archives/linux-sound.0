Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00E519F135
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820658; cv=fail; b=fVqXHVj3wYN7PmDX7kczU3mjgx9S8z/3cL760Kx8eF9kShiD8FrblIl3mIGvYojsDA7EAhsbq+FMe0JBnPaiaGMlUjMOR0kF7YzgZqSS9fKMp8hwwWN/E/3Kq9znwiyh5qJfFaCCJ8uLbY+g2Z1HNaaiK2ekvQNEG5D1CjQeGBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820658; c=relaxed/simple;
	bh=w9JLdB0tuAMuJ+l0SaENmUYl+n0C0rXPkh0CVAT5960=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZLpb/J1Ri61tLBQhjsSNTU83ItFbUJp9KAFnvDKtMjw5a0io7FMdEgIPE5KKaIc0hkpEkhWKCmctaow5kh6m/57NJOgQQALZ6Ho6bGmFc/BY7LbzKqb+xlZPI14HESD1tUhgQ79mcHtm54VN4eU2eE1/fzCnHGVs7Wm6sq2t7rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eIyi9cyY; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eIyi9cyY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9I88Qv2lsswx8A6HSgYg4HDid/t37wKz/0RPHo65+2vgV4B6USJ59PP91qSrDZ9Fql8p5HlA/sZ6fRJ4h7uYkfTppQjKv4YMvM+gEfXGGQNmap2bvwT3fK+kSdR5GNgpkFtS8QmxMaVMcA9+MW+9cqT4mFbjko3FjujZO6zsPo/chBjZKMIgO3WSi+nwITa34t8SwW+wVZstEU7wmC9Mh7E/1uGhUpWmWAfmjptLun4bnnaO29REb/eUH4GUiDaoCvLRjxmSFdCkHEgjzGizWZSdZLIhlYxN6l3CpjMdtU6OXORPwI84qyNWt+pXucLECYAlwu9bsg8xJs/NHn/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9G4PcjwgZP4X8pmo6VAIuZ00vE6da+li2HazOf8uU0=;
 b=l/RuWOmNZbHyOfosRY0mYIUKBojH6gH9YjVoFAfqQ9497BKjkNpUmBy9j7hAMIEHADROzLjpEzD8/SYbSb6bV9BePg9+9kmhRLupihMTeqgqdWtDp7lJ1FK0a2uWK6DKCdXv+fLOu7fT5eaWev+Enmr/CsHIGOFNdsA1tGfcb6+1sYUy23j7Cfe19AEjm4TA8QpqV0FE3fLKqYe+oCd24c+0DwWFORBZxYpRykb3ZjjI6C/wtNaLkKgw09GpqCXKRHYq/OR3EVQGFqTJVyLEzbE2U0+u2g7rR/r6r2wZSRAp66oVfQmorL2rISObt0BBxmtifoByCxPzt9UcmOrmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9G4PcjwgZP4X8pmo6VAIuZ00vE6da+li2HazOf8uU0=;
 b=eIyi9cyYlzMM+slwKZ0ZrKWHwNYMwPXFPdTA+2IdAgwbOBbWovi8x1WwlLSFssooozdZemG9qJHa//1KwjeqYD8psbwfuY0lXSwFYvZZzRG4WCGtx6xgzWomTC9Ea/qxXypF8Wos7MSh2Ed7lYlmqOdGMiX4b8HoSsly5ZWN7yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:24:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:14 +0000
Message-ID: <87ikfh4dsi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 095/292] ASoC: codecs: nau8825: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:13 +0000
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 469dc1c0-2809-439a-dafb-08de20b8a4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qrbxrvTvGVqmc+BzxcPYzM6de61DdefihtQDD/njCu65ABzE2xwSSgIH+vsj?=
 =?us-ascii?Q?BNbopDmIKkTo6zb/gtlgdedeh4SxayurrO44UiK5hTVlceDJ8lKbxAN/bsuu?=
 =?us-ascii?Q?7RzS6wabhat/7RKhsrps+YqFoh1nsaGbLQLdsYv6Rymzs33XQ1gqxxmwwR30?=
 =?us-ascii?Q?Vp/E38dbO8dopyQCb+//nwQnZLHV+E8oVkiJnUm3Bhs1Jt7SmnwEMfDyS82J?=
 =?us-ascii?Q?ZtpprCAbhgUY/xTx5sJpdxMJuwXhw7Vstrh4rxBkg3jWzU3jwyYdyEytEZiT?=
 =?us-ascii?Q?Nlj51p5b9zuQQQggrNQkbHzHltS6u2ErY/ALG//UBaQ01sLpeu51x2xxikVO?=
 =?us-ascii?Q?PSw5Hd7ZVmATCgZhuoIDz8mNBsPkEqvdggjphUxx+gsiKDfR4DcjQ4TEVARq?=
 =?us-ascii?Q?kNCe2ua1jQJOfc+cM8n5e0VJTC1dX81XaOdd2citqHX3Hxog13UDvFFDE54J?=
 =?us-ascii?Q?s32LFNW+K9auculkEsOm1taS0ZkKt9KXuFh/TBSpFplU1waCiYitwJHqJkaG?=
 =?us-ascii?Q?kpEibmW2iWRNskuabXJVEgA0/XxAKlOkqgGDIdVtkAndE9COZ8T7eMYRMBjz?=
 =?us-ascii?Q?9f6kBGI5stSbO/5DmS11osD+oysr1262AOBWAEu0n8s19PTcJm0eIRhd7qJP?=
 =?us-ascii?Q?Tt+0VsPIBt8NYnwbgRnF8WMpNv5Xebsxh8Cz3LI2X2Xb2KixSkx92GQRkwnj?=
 =?us-ascii?Q?19h5hDesp354hJy4TqCZ/7yUE3hkJiRroQpWo27Zy92oeB99m1wl3pVEG0Cy?=
 =?us-ascii?Q?YsC7JRj3Wg2mKzNnb2cf5S6sd1TSTqxqB50aGi6Z5JOQJVoJH5PBqfJx7afH?=
 =?us-ascii?Q?MihweXJ5FKyhCnppPhaU5AQYsg1+S2JQ6Va8uS6UhwN7aCl4xbuZMEaY/RxG?=
 =?us-ascii?Q?TMelRZMer4fmc9X4n6u6PRlgSTVoUTnTGtAv0UAgh/Ssu50f7BgFT8RvNtM5?=
 =?us-ascii?Q?blsoDzlL6laJuA8b9M5DPzScaFXwjStUfKLQLfzCj/8q5Dq3vwi6s8u0YY3+?=
 =?us-ascii?Q?Ymq5qgrylus6K+/UY4WKAkwSYHpJchCArYhtx/NyX11UkvK9m6CPhQt1aF0k?=
 =?us-ascii?Q?e43IG/Kfw/qdeqJFrtPslQVxZQz2yKTkTgALvMDAh5TykpCA3+JIQsVvdq2G?=
 =?us-ascii?Q?l+LP+sI/HHY5bq+ECAUH8MW2ZO+I0/uVkXCOMD6U0bvNYnMNWZ4nqMfoLEfn?=
 =?us-ascii?Q?g3iz7GU8T1Gehzyv9cV/CLyEbWIm7pat/u0UatfACiJ2widBC3sVfYqMP+OB?=
 =?us-ascii?Q?wpAZZKJqqrY7Jdso5lY8I8f98L1JwAokX6YYy10hAIRm8lVsgel25HVUmL3b?=
 =?us-ascii?Q?zK2zeq0EBum6B8ykaxT4bQg726t4iEl4tBxe8edzQsbVFmERpLV9WRM/Whf0?=
 =?us-ascii?Q?FGTpe/Ud+ee7+6tqWv1ZRmUvKQMb56TDS12Ag0S2nT16Tv4O2ieUegMPSsM9?=
 =?us-ascii?Q?W4pslrbi/B+GcmnmRNVI3seWibjQA3v5nne3qABT01x5ovs/m3Nodif/RqKA?=
 =?us-ascii?Q?rzFeT1+rS2rt8D8wOk8TJHG6f9oi/rUF6qIb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0ihyO8sb5p1cUDX4eCVtUnrDz+CYcBZJpwpXCGXo5wEZG4BoTTBTn64siBW?=
 =?us-ascii?Q?ptxZIAuQooOAetfJxnLUd/fgUb/CXHLpjt5Ne6CyFIba9t6AKZ8NY6siB49J?=
 =?us-ascii?Q?PJ/a+DPo8fz4N2HQ7J214IlrVC6Sa5da+Ghi0xcYgeDa20ujIzPlfMVnxPB4?=
 =?us-ascii?Q?nbkfKxlQ9MebuLc8O1cL4n7XCdfl4mkUbNUaRegemCqS40dyaGJRTyBt3ks9?=
 =?us-ascii?Q?+bLRyNrXRT6/wKOGLk4pyalodPo2nX3gvldUGCSK7UEESHUiRA0CC7/HhRdK?=
 =?us-ascii?Q?PoOyKJm+nl+w9TsQlSpca7ppkpVGSNg57Hd6QE2jiur9vgIuCBsCVMHBVrHR?=
 =?us-ascii?Q?mHe7trOo9KVD/za5BlxKS3o4kZv1bOldxw2hGfd7kvwIqzi95OdMBF+fEuX9?=
 =?us-ascii?Q?/MUSbwIugGaAYgZTDXIduN24ztG71OdvwAHUGjWyZP/h+32iRjpuo1Vqt8Sh?=
 =?us-ascii?Q?zboSqrbtJ0TZV4lH+DDObbHd9RzYiIX4LTrjMjwPw4h8ZxbVrsUT0v86rqh/?=
 =?us-ascii?Q?b13hdMBPnowFBRjge6SfQ2yLdRIKASFZWRpIf65/Z2q0nFCuSajq48FvFCWc?=
 =?us-ascii?Q?ajs1xBIgjRoCm6sTgWEAIIphqqEMbgcKwuL1IlZRvs9r33Sr97RUHTeDpgyV?=
 =?us-ascii?Q?R1Cy47wbfRZXQ1Ycn2xZG4ALkgGxwIBeb1jXsct0B6d3+mrXBXA/NcUWj5mL?=
 =?us-ascii?Q?ewv1Tt6xCQmJBOVUdSNYGtgXb0DxCMhzXr6YFXHrBJZPuKmjWsbD9WdkTASf?=
 =?us-ascii?Q?C6uNTfMNauMVp0VNbDvy8sHwc0eFnG7xUODnHE66cOV/JP7hdfdnPBcNxN3f?=
 =?us-ascii?Q?tWmFLFUQWZgNkMr2FS4JLFD58nRDmkbVtMZTSqQp+kWZXVadsgKBlbb/aAb2?=
 =?us-ascii?Q?0fG9zo/+6hZiomvg0S3CbMm8cPpa5AaEmA/cL1IvQp4pqb79EnzBIQTsfAZZ?=
 =?us-ascii?Q?7dqZUQugu7FDNqjRXK0vv30k7g9gJ0gUMhuPKOCyntyzoNUwC2jar7sqU0cV?=
 =?us-ascii?Q?LCVssPh9P6LNAf1G8fg4kVU30HLjnWeIGtsbDLAhVYTaJC++mulX7PIa4rQ2?=
 =?us-ascii?Q?GW5/6XsTCu+TKApOpvk4tswsokWi+E6CbnoR9SvlohEKRVOO28WJ0eCB5cbB?=
 =?us-ascii?Q?CdhL6oHYLvUfs/tQQumI03APoEinVOuCKHaga6twX3FjH/GU6w9CEI84OuG0?=
 =?us-ascii?Q?WDi5puSF9NWCP/tqvdys6zlcUnt3H0PWBAEJfpcf95eOKIt484Xb2iCcn56o?=
 =?us-ascii?Q?g63PWQ0btvN7ulP1lVWUv9a8kmCxBZ3uykBkUIPyAWd0G6Ln1+kQUmwloTu0?=
 =?us-ascii?Q?cmxfkg8YIFYmlUkYW3W2+7uBeBtd1xhyiz9J+UhoihzGHuIr73kD+kATyM0C?=
 =?us-ascii?Q?dHKMaQP7oxpOb3dW1rJcDWbz09mHQAmd5r0f32nrGftCi0zkkx8nRAS+fX7Z?=
 =?us-ascii?Q?f25qOpyRSKBUDFYr8hs1FDgS1duSgVF+RTrt0V5fjG6bL+Z62yQFDQf1OJhT?=
 =?us-ascii?Q?AeFFRUqEze2ewbQtNooWAtWXO68VFosbIvuoezHKARwL/u2kseGnmYDgOuUy?=
 =?us-ascii?Q?ZKdrjJhJlBhlWb6XbCMgV271jJAu11SAf1UQscvVrgKufdYkqEe1ay4QjGt3?=
 =?us-ascii?Q?gnKB/ZgHSGGnebeyhVXnE8E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469dc1c0-2809-439a-dafb-08de20b8a4a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:14.2339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu4frkLsEzd+xWwM2C75Q5g/dlmIvmHgQli5zJ83LS9y2fZHSeVcPdbeaEG36FXchQI8igm+Sv5/dpnCcFfTkyEsLo4QTYwqrIjViEaPmHiKnqHQZvXO34GKinTk0vs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/nau8825.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 25b8b19e27ecd..dd3528537ae42 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2226,7 +2226,7 @@ static const struct regmap_config nau8825_regmap_config = {
 static int nau8825_component_probe(struct snd_soc_component *component)
 {
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	nau8825->dapm = dapm;
 
@@ -2630,7 +2630,7 @@ static int nau8825_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(nau8825->dapm) == SND_SOC_BIAS_OFF) {
 			if (nau8825->mclk_freq) {
 				ret = clk_prepare_enable(nau8825->mclk);
 				if (ret) {
@@ -2673,7 +2673,7 @@ static int __maybe_unused nau8825_suspend(struct snd_soc_component *component)
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 
 	disable_irq(nau8825->irq);
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(nau8825->dapm, SND_SOC_BIAS_OFF);
 	/* Power down codec power; don't suppoet button wakeup */
 	snd_soc_dapm_disable_pin(nau8825->dapm, "SAR");
 	snd_soc_dapm_disable_pin(nau8825->dapm, "MICBIAS");
-- 
2.43.0

