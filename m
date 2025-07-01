Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDDC79EA
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328668; cv=fail; b=WnMc0AqN0ONKnv6dxaklPQxu8FF1mkjLxozYt7KUzNaPb+8tbyj53HXuoy+58aiKdesf1x/MyzGf2WjkVxj+78ZEFIwz2u7fvpRTyeD6ZcgLRK5UWyWueSR/xCXjopT9dslKenlK18nnwtbyDOoaEQHMg73D8+SEzPFGvlceFU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328668; c=relaxed/simple;
	bh=b6cORdAaVtaatfBM1UuI9L0ZG1ZbjYj1G51m8XZODLQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JG37riJWARdu9Pl9VqsBrKvmc8EafvwtHr2SfkGzCy50KIdufmtTN5Zr2TbbEgIxS3V34Fyk6InaIsIsy/N9twvUKdgQlymO/xNUGA5wzIrNeUdA7PmEXIuvn8dLkEkJ5d4rGwL4YRt+/0hXitfreFtq24nwAodxLeqSMjOX33U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gz+kJq1K; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gz+kJq1K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqfMQC4pQge/bpj8MTc3woYqxDW+sR5OpOIfoCu/MtVNhIhCa2Wl56ePP5bL8iRG2mqB152TLzqq6Cc7QsSMOwCN28vU47m25+Q4q6DSdGBgw6ei+yUT7kwK2+vFDZ5spZnVDiLaazg3alSiyVmywNe9l1ZYuvEGyONo5bm6JtC6Iorlbn+2XGnLTSWu08C6GrQOhRCvSZ1jzdxIoeT6OLS6TIprm7CPZtJs9tGoo2UFME7urEnAWLNEe9bMLj8RW5gsrz0r669myWG+ZAsogoQW4eJoBFpDS8EhuMpn4h51kkPYRfzC5jH1FpSRDv7eh1zKEJbGCVc59xwINUI8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBl3gXU1rP8SNupFS5KHQn17+l/pnEn39JT0Ac6KQuc=;
 b=lHjIu1zPz1TFktxZ8IONysGjy+L68HitKnfHSsUO9WDnvdM1kUFxhr14ZM8CIWxZ/5ANKQf//1gYNVgYB5LTXbTH47cNDZ04kGclZiQmLHGfGI4P0haccDDA8JFgJDcHaY9oMC+Mf7NgQdTqjvcTmobyVUe+JmI35qSXeXwWWPbQKVSa4inagk04YNADN1SXiM9cIa7Wpjs5ObL7nU/cf/1Lk4xP/sJ/f/NLRSrdBufKeCsLljxNWCIVp9R+ovLp2AslMiqJETdD2k8a/sieVjwv2sZ6QRhkofT7eFmaEp+kSnf5olx7UL20kyASvnBEWumHh4EHRlrCLeTLZH1IDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBl3gXU1rP8SNupFS5KHQn17+l/pnEn39JT0Ac6KQuc=;
 b=gz+kJq1KLHZuhfixhRoQnU+/0Ylw4hLUHinpu0ZHgji8L+576aA7OQqbQ32OxvyLimUYrXoJEZtlEi3Nx2zLDWDlTxQlKh/zjsxwydSCO8XRY+J2EzwujuXMX1Tri9aK3b2atWJlZkO1oNIRXpGio5H7FZgbREzBiHSeEUDhPsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:11:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:11:03 +0000
Message-ID: <87ms9ohisp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/11] ASoC: soc-dapm: use common name for dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:11:03 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b533137-f8ad-4e99-4419-08ddb833c43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SxHriCoaDCcAu2f86DrFq0ekcC6gzymFHLicTCsrM6EcmcKm1etc54a/qUS7?=
 =?us-ascii?Q?OCdl5B9KwlSEjQAGH1O8ttGyMQhFVm6cnvXCc0+zqx+e7VNJfMna7PPXF3Eg?=
 =?us-ascii?Q?75z1LA/WlQ6hXqj/S+o7rMJAU/8cSWYoqWcaKRnc1X4jp1yOhomIWzqCyC4z?=
 =?us-ascii?Q?Rf83A9GXmKqbNmbrJWYdwszmMvoHQ3S0oI2M/i6frI71yXSyOKlUa5poGrgJ?=
 =?us-ascii?Q?x41oLSLvQf32Q0k7ysir8bqhpUwTyF+4xEky0aUuL9s1yHKjjkCwzJvVLNli?=
 =?us-ascii?Q?BVZQQOIyf5R1GLX12cebZs0/vQTQd7+8SGLINj0pwNbFJzkXpY4UExg9MqeR?=
 =?us-ascii?Q?t/hUzZsv57HOmDOVPWkZEFWWLO1Mu3v65VoWVbWvVvZsWKomEcx71OLdaHpw?=
 =?us-ascii?Q?vqZmTcCIC6Dn0ZXeZoK8HHk8i2PoKIYPnP94U432l/srfHapmR6+3H2gbNKC?=
 =?us-ascii?Q?OjOAQlWHLTICoGyHRBifjWToQWX20PnPWxZhZG3h+2CurzX9oMrWI0ydqVlA?=
 =?us-ascii?Q?GU5fFUvajWu71DPiZoUi1KgJsKE18XEQsqT1lZJBrDFd5OJJwehgau1GjMEm?=
 =?us-ascii?Q?ZjRYM0ie7hbgtGuAeJGHJCCsaWwWPEXrsikZRYbAnzIgsNtkURNbSC6IfxES?=
 =?us-ascii?Q?eHkyUGpChofP7XlYo0rF/RkHDeIOSMKAIMswCKiTlLfZgG5b6LT6OOKZb/DK?=
 =?us-ascii?Q?iD9FZpyCxwc4aZg3jFOIByp9KcxuVpmqt8NSKgLbuRsr9hNWUVrkGu95Ptwd?=
 =?us-ascii?Q?vML/+I1uRAQYz5fKsII6Tj4AC3DuGtrfwF+45E7LWQ3yaFL38wFg1Ikul2HX?=
 =?us-ascii?Q?b0NbUc+6xfkNmv8dKdbbl3UHBik8ybTtP0PCjzkgnGpszXMUgZ/ABQ62erwU?=
 =?us-ascii?Q?C328p7b4VSvwLnS/Fc8Av02BPAV+tc95VmVNEuWNsrpLFRaDLDrYrEgOAuiV?=
 =?us-ascii?Q?2AaruMsuopkRaOwHbFKlj2ZlYRMuxuKfeAaLYLkbM6NKtLdU6cnh3OhMRyot?=
 =?us-ascii?Q?LNo6kyMidynrxc9ECyBq04VRD4RLn3BxGyI/iiAsrk9kcpujNSgEtKacdtFo?=
 =?us-ascii?Q?NI6GZxQFDRan9/v9CoItt9Nr653cYp5dnyNLn5we/RaU1VrjqUXVuvMxRyev?=
 =?us-ascii?Q?agFYIVwPHkbu1DvGFwkvrtu7Me4NK2bhuAFqNj+C1NWGsyaGM5Ph1Y3Matqp?=
 =?us-ascii?Q?A5Eqs5IejKfg0VyNiLlLgmc88zuc5+rkO5BDxOGmKiJtR70O8KsRX9ZN1Yc4?=
 =?us-ascii?Q?bAUDpU0117M2gFFllVyEpgdI3fKOp9xgjHlnWqYavN/oLVMDJ9S5S1vZjGfz?=
 =?us-ascii?Q?L/Qmv/HUyC4N/1QMYN2yND1+p/mKa0D5rPrMb05M6Nt8zuI3eVRXSR9hkmtO?=
 =?us-ascii?Q?ecFM0JiLBnVspyX8DHrZETXAw15+fFkKeZnOZWv0adBbAwqnov7A+7MDy7ug?=
 =?us-ascii?Q?7AXr3C2vKJMrNfaIpuK303ZVshJ4W6V64q9KDwlkM0egX/GUOhrxqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4GXiNUZEATecTAZmIhmymuVuHdpSObUM6WMEIspq74jaSq06VnrEIY9JDtxM?=
 =?us-ascii?Q?Zh6iyLPjZKzxABPSaF8m5zXsAcbRYkx4o90PcV3d45skJIOpu81SG4pWOc6M?=
 =?us-ascii?Q?iBwuPdYip9kCBUYnm6mkCF7r6BzI6sTHGFZyY0vm/A8cCqYVMoZo5AkD57Wk?=
 =?us-ascii?Q?GKU4L1vXJifQG69oo9sUQM9wM+tKVPXhtIhWdZsmT0PafEohBb7fQB9M5lFP?=
 =?us-ascii?Q?nAvRrsYpq+EV2oZrpIOy5rKVHQlzxA9fHYHQQsab05xGsfleCyNKbf+/rvId?=
 =?us-ascii?Q?78I/FXDtNA/hat6uXNP/UQqbkVZ2lYBaxhfmtrV3zUXznn65aOeZhmD64Svy?=
 =?us-ascii?Q?qR3jvX6ynDzT6xphw3iU2JiOxJ+euVR2IyS7cLSTKG0KsTn2UFHHi3L4+rw/?=
 =?us-ascii?Q?7BJ/+OlbFDTM8Ff1XDjuXbMe8shZwWCQaHBovTUhHfK0LtmQslTpbUbwb2Cr?=
 =?us-ascii?Q?BB3bGSp4vx1wMRSW02L2BxXr6usnRB5f1qZhKI5kbG7gvs3KSWQ2tCJpgZ72?=
 =?us-ascii?Q?bZhJby0fo1ZwUbKh3IqmEDtk3iFrE1MY+9d1zpU2Sr53u62PkyL9xCQe2Auk?=
 =?us-ascii?Q?fdQzwQX2UmjWFvCAyoVCHlfYpn5aLkTph8tafigkXxDsH16SPbPP93CZD+E8?=
 =?us-ascii?Q?w3KmvnSK8iOVGrjQzXrcpd01nd852tdCjDZEs/ZYSAHjObyF0RvJuolu4F5S?=
 =?us-ascii?Q?We4oDbabZP66KCxQOIwLU9xnpa/U7xgbFoOiCEysuWIiitkXHRPOAGZg0eZt?=
 =?us-ascii?Q?waE8On4AJU0y5uLwC3lyZX64xcIqc4mEV5MF4giiS+l5H5jZbpOWjlhyUBsP?=
 =?us-ascii?Q?UaF0oWX1NjUKs0X+BYptsozZw3U/thGVZm83I6oAKw5yI1r2vycq2n75RjFu?=
 =?us-ascii?Q?gACBguGyvz9aD+PW8V9AUEf+vZRBR1ZY6Z30OGO5Qtayaf+t9EnOM/7D0bpp?=
 =?us-ascii?Q?jSn6eybSM/gx5h78jfaRNzKpA1RzUgpIWraT7fUnKxFdfiVEvdGsB4blPDCc?=
 =?us-ascii?Q?YN9g5DZ+3nEcT48VXtiOzfYORQsLThgZqvtzd7BcVnlt+TL2YTU5k9QnU1o6?=
 =?us-ascii?Q?O5opIiNRwnYV4YVv+QtBlBHn5+xAzrGxF/4xQsZYjpqEVeiLO2IT1oiFoUIK?=
 =?us-ascii?Q?LQyxhHG/IU9Sr9sziJCfApaRcXDfbF7zSIkkxnmPBHZt66Z43XPkGiEl6e/n?=
 =?us-ascii?Q?+yMvFqe6vUhuQD93fWEV3VYosO1ECeMNK3vSBwyic/ycKaZj270G4GXDVWhB?=
 =?us-ascii?Q?YMMNbciRjFOk0Htl87c3HFnnL55b955PSr4ELQEPoBG+FFbc/ZRfwrb2Ad3N?=
 =?us-ascii?Q?/iRBg2st+AFFbQWCLcJxm72rx9C5EZhNUWFl//foD099cnktnGXn6BVqkuGP?=
 =?us-ascii?Q?BHGlvKNm0M2dTqsR6l8Fy2+lVbGy3PdJSEVes1HI5bTRO/Ius4oauzy/mY9P?=
 =?us-ascii?Q?N6XEM7Z2RmTAk1urzXFNhY1iiCpliK2Dw2Tm7vj9SIYNTKce/04J0K1wiiJ6?=
 =?us-ascii?Q?grbzIfugmlMMFL5ZmkkHvLVjshF/dAKsd3ZvuC8XxN6aYUu3Mesennt4rsMi?=
 =?us-ascii?Q?evWkTxl+FNfT6P9YWSQRlqlQRIzRe75XcYpFsNQ7c2yELMPhpFCtqgRK+78y?=
 =?us-ascii?Q?WAfjqae6JBtluPnc0bbPBUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b533137-f8ad-4e99-4419-08ddb833c43a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:11:03.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrXsSMZnS49YpwyAvhRLdHifM1sCOibV+5VS121Sp+0wwPL34eb+NBre2Gpm6myEm9WFHJ+OLoin2ydBuClUizNT5JkA9fAhUOpWRvxRDWUNi5Pt/wdf8BdDlFiVg8TU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

Let's use "dapm", instead of "d". This is prepare for dapm cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 58 ++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d4cf047bc93e..16f8eff42835 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1985,29 +1985,29 @@ static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_up
  */
 static void dapm_pre_sequence_async(void *data, async_cookie_t cookie)
 {
-	struct snd_soc_dapm_context *d = data;
+	struct snd_soc_dapm_context *dapm = data;
 	int ret;
 
 	/* If we're off and we're not supposed to go into STANDBY */
-	if (d->bias_level == SND_SOC_BIAS_OFF &&
-	    d->target_bias_level != SND_SOC_BIAS_OFF) {
-		if (d->dev && cookie)
-			pm_runtime_get_sync(d->dev);
+	if (dapm->bias_level == SND_SOC_BIAS_OFF &&
+	    dapm->target_bias_level != SND_SOC_BIAS_OFF) {
+		if (dapm->dev && cookie)
+			pm_runtime_get_sync(dapm->dev);
 
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_STANDBY);
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 		if (ret != 0)
-			dev_err(d->dev,
+			dev_err(dapm->dev,
 				"ASoC: Failed to turn on bias: %d\n", ret);
 	}
 
 	/* Prepare for a transition to ON or away from ON */
-	if ((d->target_bias_level == SND_SOC_BIAS_ON &&
-	     d->bias_level != SND_SOC_BIAS_ON) ||
-	    (d->target_bias_level != SND_SOC_BIAS_ON &&
-	     d->bias_level == SND_SOC_BIAS_ON)) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_PREPARE);
+	if ((dapm->target_bias_level == SND_SOC_BIAS_ON &&
+	     dapm->bias_level != SND_SOC_BIAS_ON) ||
+	    (dapm->target_bias_level != SND_SOC_BIAS_ON &&
+	     dapm->bias_level == SND_SOC_BIAS_ON)) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_PREPARE);
 		if (ret != 0)
-			dev_err(d->dev,
+			dev_err(dapm->dev,
 				"ASoC: Failed to prepare bias: %d\n", ret);
 	}
 }
@@ -2017,37 +2017,37 @@ static void dapm_pre_sequence_async(void *data, async_cookie_t cookie)
  */
 static void dapm_post_sequence_async(void *data, async_cookie_t cookie)
 {
-	struct snd_soc_dapm_context *d = data;
+	struct snd_soc_dapm_context *dapm = data;
 	int ret;
 
 	/* If we just powered the last thing off drop to standby bias */
-	if (d->bias_level == SND_SOC_BIAS_PREPARE &&
-	    (d->target_bias_level == SND_SOC_BIAS_STANDBY ||
-	     d->target_bias_level == SND_SOC_BIAS_OFF)) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_STANDBY);
+	if (dapm->bias_level == SND_SOC_BIAS_PREPARE &&
+	    (dapm->target_bias_level == SND_SOC_BIAS_STANDBY ||
+	     dapm->target_bias_level == SND_SOC_BIAS_OFF)) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 		if (ret != 0)
-			dev_err(d->dev, "ASoC: Failed to apply standby bias: %d\n",
+			dev_err(dapm->dev, "ASoC: Failed to apply standby bias: %d\n",
 				ret);
 	}
 
 	/* If we're in standby and can support bias off then do that */
-	if (d->bias_level == SND_SOC_BIAS_STANDBY &&
-	    d->target_bias_level == SND_SOC_BIAS_OFF) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_OFF);
+	if (dapm->bias_level == SND_SOC_BIAS_STANDBY &&
+	    dapm->target_bias_level == SND_SOC_BIAS_OFF) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_OFF);
 		if (ret != 0)
-			dev_err(d->dev, "ASoC: Failed to turn off bias: %d\n",
+			dev_err(dapm->dev, "ASoC: Failed to turn off bias: %d\n",
 				ret);
 
-		if (d->dev && cookie)
-			pm_runtime_put(d->dev);
+		if (dapm->dev && cookie)
+			pm_runtime_put(dapm->dev);
 	}
 
 	/* If we just powered up then move to active bias */
-	if (d->bias_level == SND_SOC_BIAS_PREPARE &&
-	    d->target_bias_level == SND_SOC_BIAS_ON) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_ON);
+	if (dapm->bias_level == SND_SOC_BIAS_PREPARE &&
+	    dapm->target_bias_level == SND_SOC_BIAS_ON) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_ON);
 		if (ret != 0)
-			dev_err(d->dev, "ASoC: Failed to apply active bias: %d\n",
+			dev_err(dapm->dev, "ASoC: Failed to apply active bias: %d\n",
 				ret);
 	}
 }
-- 
2.43.0

