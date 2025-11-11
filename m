Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD8F207A32
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821075; cv=fail; b=mP1MJ/JPxwg75pOwYbfuXOlTKsz1TwOUNctG0VgZ0vwKiao6fkEatFOZmtEZ0jguYWJJBUDRFARaH+Ry62jA91owIudS9aHEw1mVnxfj95fDT+So27YuMNSK5623cZ8DafyWH+d7Fx0qezrnclV7ckkFyJD9mzvJ/V4CYnE4eS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821075; c=relaxed/simple;
	bh=2i/1QvxSotgTZTlaCj2mDEecmgIqUkHgm+fhzh5G4SQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NO8eqAlIcXTIO6vS5MTEU5IhEaeiUi95D04YlQ90StgiqqMx3jz99Fy/HMfhb3UsLP8FwdLdjMQ65NQZY9iE0I6sg3Cbc34DxqCOF1gW64mVo40GjBDm06VZY8MWWs002FfGrLXL2KrtkpFlQVil1COivol/WOD57vfPgZR11zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MI+ugkrI; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MI+ugkrI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLzEe6JcfB/QmJ2tfnKIakWW5M22hyif6A0aMwZAiThJPbdij+EvCCOUYGGE6GIHt37GQbY4QQSGJQIJuyXrZqp0AbhqzJeaz+z1XRj44fcOFg++qCPQfE0R5kAeVTk0SPvD4MMxkG4EvtOlGpQ21ZOYJM6l0jqfllU0YA7+E+mnsb6geKYeHPTQzUKyLAOE/1F4VRhuUdLDDNc5cgHQ+ao6HcTaojKqNyrmb3lKGgazNkoHH0B5JBBOb3QiwiQya5+JfVQLjhdOKqKf7wfdE61FYTugfLSMQ1IlXmPdOypApuBc5L4bL0VJfYw9cve2e/01xXb7padzkLh7h+8L+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfFFHtp87PEOt4C8ap9Pi6g8yfzakf3bw3zUc3KeMc0=;
 b=EB+DotKCvq1ioiIWpL/eOZyaj+07e7wQcbfydVVZAzOvj+cbgXIMm6w7Rk8nesxpHPrMvmpdaOFdhK2nkQ0EicHx+XechE+zbsWqWR514ZjvbxFbKmiLLIbgzGyqSIKehaEbQAHEHB1g1a7Kkoz58Du1JFY3/SWK4KecL3Vcx2gndBB4wvtLZtK6LL2juSHGrhlE4fmGtameI9b/UDyctEeilfSYfGSTCJzrTzL/yaW4eUMfBCncB2rb1aWkbqiK4TXN5dzVQnaVCTVaT0Fn/ekEl2ef5pWSIS78LuQe1N8Gf0Ke6UkKY4Z97SaZ5lLxSv6t8qszZGZplc6HxQuP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfFFHtp87PEOt4C8ap9Pi6g8yfzakf3bw3zUc3KeMc0=;
 b=MI+ugkrIFcowdDTYv0damLpiKyvqRSAlRi2IwkxSv2VuXEroGNpVoEb6Qxb886pHZpNNDLMx5rQU7XIpytpLZ5hyN/i+dvTCaBLN5A4P/NA9J8ilSsG4JJhbCJ2V5zxRayCaU50jZeJV2x9lZ+iZzQTnUBq05+XdLGUyzr7iCDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:07 +0000
Message-ID: <87cy5pxvec.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 199/292] ASoC: intel: avs: da7219: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:07 +0000
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 055d9fd6-23c8-46eb-0a01-08de20b99b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FDx0d+cdrCHTIT8K8xNwjL1vu/0bZrRme0u4/W6ZsvcCmQI4G4RB+DUCTANX?=
 =?us-ascii?Q?hPX3XgOK4MD/j8h1BwtoyKuod5D9MiAa9fTVDz9RiPtVOgYo0N5S2uVe8a5O?=
 =?us-ascii?Q?69TVdNWdLe0iRtmQ53SyGFdnJaD/dHV4V2L+25tRbXp+uMD943dlh9k2u+AH?=
 =?us-ascii?Q?wjOoFZ00MGL52NECv/hy9yGaUM0FX8Tg53AQsELHBGAESOwFwN362Qhro/VT?=
 =?us-ascii?Q?xmZUfu4tJ3uc8j7JYudkE0ZWaUGJODtlzYNj7dyVepbFGqWPgob5KzLHUZwJ?=
 =?us-ascii?Q?ts8iA4FGXrPNXnWPqK4VOaJPdVt2my8fOf15DjRCzdRQgvnkZtp3aM7BoAQs?=
 =?us-ascii?Q?3cKNR05Z4TtGrf1i21HWvPt2HyCylRpEMeSkiaaI6nRhEK8keYBLRXjvFEsq?=
 =?us-ascii?Q?55GYMT4+mHRBvyvgrrPpIXghZHV0XBpng+MsOl3aaCDAMPS03DICvoFdieIo?=
 =?us-ascii?Q?jp3KO/1A5+VByMrrv7FL9YULOqhW3zVCLWa40ASfJdNTy/YszRrStKc0zXqt?=
 =?us-ascii?Q?KiArE+/KdM7HokDkUGJfzrtZ2hZtC5fFoarSaRLqmhQsBPerDS77KjrHVcb1?=
 =?us-ascii?Q?o1UGnDByHWG4RiU+lRMpeh204t6CWjwtUo7NoC/mdB5ZggLmuLFcBhagj6JF?=
 =?us-ascii?Q?7CbuBoCmDCSdoyBbkaklcAd11c85RMAn16riuqu+oZCbSiP8fvQgvvt/+Dcv?=
 =?us-ascii?Q?LQE2XSpnIzAq3QXxS/p2D6jicetFGoOPdrOBVgVANMhJTsVxSBzOKWaU+duC?=
 =?us-ascii?Q?rOqDF/8anV21oYQ7P8jll6CI/6dRhljTqIUHnVHpSun+vpjtZHUp4aKPj7ze?=
 =?us-ascii?Q?QmT3UiOB4CGJo732X+q03Y/hr6UAiVPW5f4sSnBccWrVMuk/Q2tHNxNc7KFb?=
 =?us-ascii?Q?evofPCOx3XBVjVsd3lX2bBjz+8M+zZT5mZevqRMBcd3TgLs0OLi/zrMaa2xX?=
 =?us-ascii?Q?UT3922kWdm6kP0bs21z4SuW2dgI7j5nAykrG9Tfhft2/t/4cYu5Ga9sOtye7?=
 =?us-ascii?Q?JUh6Lqk06GC6IOsJS6x1xQAtwgw2XVqwm3awOomNUQwgo4DhVi/xyqBTY2wG?=
 =?us-ascii?Q?H31TGH+IMmZZ/xd6OdWXlnnX+Hoo+Gi460SdtlUBy1d16pN0hzjJeNoyu+kF?=
 =?us-ascii?Q?Hg4h5Ytl/UBZlQQRaygbW4pSXrII2nkvaiWvpkdP/jEE3u7ypbDdW5UqxUmD?=
 =?us-ascii?Q?1B7d8rA5hncrLS0b355lTv3VrHiiVjgz++Stidyo4MM17U0wAU9yIneRx6+i?=
 =?us-ascii?Q?nw5J0yj4xtKRzzU1LupLB+esRBp2fdbCyi5t+jHogsJq2hyfckHb2Lmpz27b?=
 =?us-ascii?Q?SpE35KbGggL8SA8H2BTzlUpdVYhF6QDVHC1svoHzQ+Pr8/NxgDSs+P7Tsq4u?=
 =?us-ascii?Q?VW+feb4/mf+++NR7KfmUqbPWAWwl36St4URWNzywKRnwvPayMfXOJEBn4X9I?=
 =?us-ascii?Q?VvVmeS1ZYGrFIVdwntwuSXMvhX9AhRZMdDGHfZ9kcr86YpZ4xiic2ICEl7Az?=
 =?us-ascii?Q?D8d4eccibarxkkZLNRRnfpz35XSS46lblb/6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h/dyBIhe12/NQVYLVNElCojnW389rMAefHcOXs1VnmTih17V2UQycSBUaSbJ?=
 =?us-ascii?Q?gcE6vvI1atuDkel5v5cQhYxAVo4LTGKa6YNY45CD7L89UtnfDSuFGrt1UfC9?=
 =?us-ascii?Q?mJJt8p0jm0Sg+wH59ZZgS+vkp0i5UugR7J8L1ZGs/D/Dc9EmsBrEgpXr5h5U?=
 =?us-ascii?Q?yfpfFiWLCdSlcIHmNImmUrUkE0nAK2cijSlUKveV5S0IQpoJj38y+AAKy9ob?=
 =?us-ascii?Q?EN639+u7OLLazQefHbgxwTLWGGQagcZ+IxQV9Ra8LrzzrA3tWHq6so4xuP31?=
 =?us-ascii?Q?PVOxRNLj4JW0FGjZLpcFFk/2wncEOzCbDaoPr7lCQHLV+dRhfmA1A0djauy1?=
 =?us-ascii?Q?4+tWgdMJP1z816yF0cQfLpe2/2RVIIErx82E5T2WXGk4Kon9nbzK1LvTWzrg?=
 =?us-ascii?Q?wyVdi6K6LlcKXxsSmg53bNlxkdNkwFDfs9OoG1i1jnu7wR/ao0Xn5h7JRHmf?=
 =?us-ascii?Q?ABHyrLJ4hTOAPnwwSFtOrwzdhlkKI6Dtmo0PQ1EWc26hyO6jP33vqutpN72P?=
 =?us-ascii?Q?XkNtvlRpaYJUdUIIpo5XaxVRG6gy3Sik4Scl9Ap/dLDxLSI3WsZNJiwcTVe1?=
 =?us-ascii?Q?xTStFIt0oPHZ5wzxCRG0KGiQsQGDN1eS7PwPWlhNG+StidNGEQzrY/ld1V40?=
 =?us-ascii?Q?NfEVziyMBm3lMMtL/MtbWcpZRYL5EIfS0kpXK4yXFqgvDNUaa4ez9r5MP+yE?=
 =?us-ascii?Q?Eb7esFDttKGM4qpWddSssHSSMSeAicnJOlolHJHjuRdXyhWyfXkTnex1+f5s?=
 =?us-ascii?Q?/xEdshCFQr886qK5PN228DXpHWkoxuXX/3JbKVeQ5LdVEvy5I4Unvm8Lo2bk?=
 =?us-ascii?Q?+KZt7A2JFLkEYqDfTgvYls8cXUTAX575x9yLkaGgTE8/VH7BiKjBxyqy31Sg?=
 =?us-ascii?Q?qIKOU9L/KUcvaY83lLjJa1GPnwUf0Sv+aJIC2uRT8G0XoQkSU55WHppbdinF?=
 =?us-ascii?Q?rNNtXcgI94Ybk8ggfmD91Mh4pK9GQ+ECfZ70sjEmSgcd1kc9zIThbqNLYPKQ?=
 =?us-ascii?Q?7tabJ54S5nLZcwQm5wJ2RIeY0wDdsn/vBZvm6KoMYhxNMiTAZavbFjf6j7UX?=
 =?us-ascii?Q?0D64ryP6gX/u6Zn+Cv6XNfUzERy/HARVoXAOtV091w4D8QsAtoL3SPCvs99O?=
 =?us-ascii?Q?GsT9PgWPuRXIFTCvcPJGbBiPPYwpiwZj30dcG/uOfuUGSZR7QRiTts6366vD?=
 =?us-ascii?Q?srcJ0WSU/bp9IUDgREKMzsoM/DJ7L8S8LZE/nrCsTgB6u+w667uOAihGZemT?=
 =?us-ascii?Q?mmqhPIeIqRP5O/vE7YBmhqfxH6Moi/ROqy3Zjs1n11JMzcQU6XeADl2xA3BB?=
 =?us-ascii?Q?7GToTNds1t6AZv7gvpaKnRQQXxyIaiTSd1ztKCwkDd5LyYpFnNxPh7fNrEST?=
 =?us-ascii?Q?FPC9FK0cUjAZe4fGc7hD2LlnaEPfp5X3fGVHz80LzWFHzn2phrfgOOczvy+7?=
 =?us-ascii?Q?+XqJVTvkXQlULPyXaZMds+0E6DeSbqfaR8KtDC0unFj36h3knMVF6F4/6NWt?=
 =?us-ascii?Q?sXVprwjKniKd6fHeCfSS3xYZlH1CSq/9IonxRTQGxXQKQ3SElHkxExlxABti?=
 =?us-ascii?Q?/f6cFiaopPZaIdPVweNoKCw7IunUOantQY/2iOp3gAnzKInEHX4GlFIbd4aJ?=
 =?us-ascii?Q?Ek86RxgAl2f7V5ewL49lwuM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055d9fd6-23c8-46eb-0a01-08de20b99b2f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:07.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDvg/4N0u98Ev+3k+OaokRiq+jXJyy+YTgUKcsTOP0OBpOzCqWAGW0ncABT4zaiNHC2NNKnmTlp5oq5Rbj2FVz8qssQB3xTieD/98hSUH+M5D3UctJ0Y3T4Hfnp9I5GX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/avs/boards/da7219.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 6782dc7efae31..2b17abcbd2bc0 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -29,8 +29,7 @@ static const struct snd_kcontrol_new card_controls[] = {
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int  event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0;
 
-- 
2.43.0

