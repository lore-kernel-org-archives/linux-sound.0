Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A54315F
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 01:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741226371; cv=fail; b=Eu7u7g0MnZbAfVKYCgTBEioDv9vYopDC5YgW2eunAqKEtr/3ykve5RbEYZNsboy0z7eZMc2nJlbL41OlGOsZhUxc2rRWTsrkci4SRd4uTwxeSHXKs6h46p26AIJHisYDf9g/MCQ4HzfidWDdnusUmpeGusvPxrT8HI8m7sK5YSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741226371; c=relaxed/simple;
	bh=OYQa4+0o8gHMIVpcvdwxh4r4F+HN+VeyyCoi8497rd4=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=OxNKXcpNep43EgatfT/ZQ8rr9Y2HM8WOidykAy5UBTgHvWzJ4QWYEPJVD7oyySxuJXH5DtR6AiCSJ6fOWFhLeje3sSrXrJOmupblhVmpk/qUFCP6xRwBgwkyMVnpIQT5L3KUyQkIH3i2UVT6XOjbDZ1XwEcZ8eIMuJhRCTFrJ8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=frYiFakt; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="frYiFakt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZmsU2OPKBhJTBWiAAne++I1ubJFNxLDLnymTqhzpExL1pETK7ojREYhFdW2RTfBqWnIXDR7HC7HnXAhOZiVofjVDdXunEtjad7V/Go1GGYmdp6dQH1rwhWZzXcAbG3qayLXRp5Y+LGGMmlK2PVlSY8jVlTAvvdZCS88OkRWFul00/ToPaQxbxE8g6rUvBdzU2vM4d4unXkP1SwOPLUpdyBagxrYyGs3U9gnqo7O45C0AoBj4OIpkeAyr2AWRvD1+MhFqMnZ3oMHzKmTtC1Crz+RsSd0OBuopsgbBm1A/IOrkcrJ62FaTYwG2EW9jvmnDtv26maE1D4I6ux4gjnEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoquxmRtMOXvTfXTqo8S52eQLO505ctF4WK2NK1MQ0M=;
 b=xRyIjLb72cYJAP3wV/RBBhrD5ftWCSV400twCKzfqYxWnlgfziebMj6UC978AXsI0SYqMfaXizJav9ZPIpymwERE6+xPsH/bhNPoFNFht63vW6+XS54/hJd9V2E9/1SatrQbnkT8seOqZy6u0Utb0tq7hXWC1pcs9LHO1rlQzwUWmxJnXSiXVYzLOre9+FDiFqqBV2x34rf/5GmQP9JDh6Eo0N+Kjtdij+HTFH5TSmCjZ4wTliiopwOqjG8jaMbqoRufxoCausEbXJjJq3PnL4EqVDASm7Tqe4aMuiU8Kc1h8tVfQFU9+Bz3dm6srvWgbee8W1Xs/FklPX/eb8a8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoquxmRtMOXvTfXTqo8S52eQLO505ctF4WK2NK1MQ0M=;
 b=frYiFaktue4aUH6YCw8DQRT02aHo+o0UMKMA+MRyQl+HCLaWjISerrs5+O/gh/gNuEER3DQVuwV3nEYIc0dJh3i6la1Mcyn3wI2CNfSEVUDns7/ZkMRKnx7ubwJNdwV8xDjugiCaNQQJULp8Ag8bVYufaLUVzpecqyaliiW9k7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11216.jpnprd01.prod.outlook.com
 (2603:1096:400:3f0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 01:59:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 01:59:25 +0000
Message-ID: <871pva6hs2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_mute_is_ctrled_at_trigger()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Mar 2025 01:59:25 +0000
X-ClientProxiedBy: TY2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:404:42::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11216:EE_
X-MS-Office365-Filtering-Correlation-Id: c24dfaad-6ddb-4f16-00d0-08dd5c52859a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h9AXQItEho5OvRXqVx/+nshpcEyqmbwVsYfPEOL/t6pxG5c0F+ydcKn/Y2gl?=
 =?us-ascii?Q?nmXFMsFFFhxLOvJHViagNRLJJL2r5iViMTMFuMuumn6SbhGZUM5J3dJDUIxz?=
 =?us-ascii?Q?fffHTatIyvsOSoMp4Yg8zqpYyLcd7Ia2Z/pD2YdMThWxT7mdZWeKgv6N/1zs?=
 =?us-ascii?Q?X1ManorCH/89XR/2MK6HHaOuhzlI/HNJ6yNknB75k6jYdw6NFtQhN3y8W2/g?=
 =?us-ascii?Q?qyQBv4qO+5dTsvOAOTVf51htXBM6lc7KAcTlthJFchnBHnVAhHbcrPWzBlO3?=
 =?us-ascii?Q?hTmtv+U3TVJoT3AbCiALxw9vDMRO3v7ULWUevJ9Ki8YUmolcRY3y4wnNTx1k?=
 =?us-ascii?Q?n1mrbYnApiUCcrL9ELPoRDbh5BZtwoM4vLdeMBTpkIg/dS2G6mdWyi6BmEhY?=
 =?us-ascii?Q?Z9BtEdORaWBh9A8KdvNixAGBI8nN/VMsLnU3uQGlzmN8f89nvwiHQ588LPQa?=
 =?us-ascii?Q?zOmQoHyHtNMoar29SuHWQH5mB+xwG9mceDHFRmm3gyTPTRs+y16PW26KLkgE?=
 =?us-ascii?Q?4d0ESdvHWbHmyN6lMT2v9jm8/eg+ymWgFGCu1FAB5RR/Fme1ALHzlCOzo76k?=
 =?us-ascii?Q?EpY55lF8l+4Kk0IG22ap6oiMWamI/zaOr15+Tl4NAj+Lb4gpayAnIu9wtgd3?=
 =?us-ascii?Q?qkGq8L5ww+1Eqrrz61j6dGEKbN/PpJao760v7vCUsgznn7q8s/LWhOzh6/C5?=
 =?us-ascii?Q?JabISAy5BppfY4NejNnanwOGOl7U390LeG0JVo1NAJX9VI8UK9aAxO/+GrX0?=
 =?us-ascii?Q?IK/TdllCvRtN9xWySCEmPmzNYD9GbN1lY18POT6qeQaQGa/qmRM/BjwYUVn2?=
 =?us-ascii?Q?z9c45RMQTXLsdHLPrRa1fzw/q/CRlGLjzBUervB8O2kqKmXqxOckm2U94YsE?=
 =?us-ascii?Q?jC+xCaQK4R0kxaGnUVB65wqj7YwD2+8qde1iinfXT+zn3Zh9aTf0eMKx1PN7?=
 =?us-ascii?Q?IQC9p9yQjJlWi7hyG9CljnQ9QZaFvvMRGgvjb1IvzkrJgYjtRmEtFkYGDPL0?=
 =?us-ascii?Q?VgM5v3hM90W13FFzAr16IRxJm9N2P6NfihaZLlymWThRyb6QwJcJo++Qm5E0?=
 =?us-ascii?Q?CKoTPPqA9ivX270YCE8HpXt4dmjZbgPqxMQNSSvFRNs/kRGAMbERx3I88Ukm?=
 =?us-ascii?Q?HtTniL2hatBhh4RMAmZVlV/0TUWUnX8+AyTiy+wEpkpG6a8BbQmjxCIMIyW3?=
 =?us-ascii?Q?46m/1wezdENEbYXZvT16da1ymyqHCUyBA7Ugk3BsPHHD7L/9l5DQY3/uRcop?=
 =?us-ascii?Q?Qyh6MdSlmxWTzexBscvs17Kd1tsJ4IcrVJNjRSyKXOdwKE5ZloP3Vtz0f4T6?=
 =?us-ascii?Q?zKQzxrpVq8Vcdn/zVfcPDewgxGAqHZRnaYRbD5Medh/khLPbXdD03lXK/eFH?=
 =?us-ascii?Q?TNw8n5TbfIrKy/hIU7EibRZ6sM1i6ZBAZM+JSq5c4xeJV/cFjrwXvhI9yR1Z?=
 =?us-ascii?Q?oJv2ZGDhfMIYi1AemxM0QoA+l02GCerO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i3uQc1Zq1N1r+p0vCV8BCnH6jIHi/hrC3opnnaAyG1OBxNxg64w/I4TykaaG?=
 =?us-ascii?Q?yvRZMBlwTJadnAUWOvf79vemRYmWD9QpsCZYW9IEBbyKd3DFHrM/THYuGJ+l?=
 =?us-ascii?Q?8oJ1QaN1wApHB/rqS74yjJyjwWcRP9icZl7fxdVVs72Ark75lKjTXm0MYFQR?=
 =?us-ascii?Q?TZeI5NQu7LN/lT9elRaFkEAm835l1TILHRrBUhPqQ0n7eX564+W72h98WTBI?=
 =?us-ascii?Q?C8iNTAIHMJNsLBoMxN+L4TXKH5fdwADYU33CqdEne/GB1Z6GWzkuKJ62kyVc?=
 =?us-ascii?Q?NRwDPg2RxGtbq/kGGpPQQ64t4ogBJeJGbys9LspXNxXERyiPQUo5vnUyojse?=
 =?us-ascii?Q?VtnwNVmcVrTjO9vLcH9qyQE/WbMxm8Z3jDIm6ZMTRCh85gOVtNFig7fU8uKQ?=
 =?us-ascii?Q?uNdTdFsh+iN6ZCZnie091MtMVaDWYiO5wiJhZuwcskgLlrHsV5qu9wB9eE5o?=
 =?us-ascii?Q?lBtlBs0BmjxFlMDnOYaXcE+rmfiYoSI/X8Jrv3q4FVe+h4OjorIaj9wst03F?=
 =?us-ascii?Q?Qn7LfOl3mKDDLmWW8oVejrzZa/AAT+J94LsdFBiTwzaEHIp+wEGT9ixn/Mre?=
 =?us-ascii?Q?kTZsaerMyI1kpFcSxDQzkk9tCUswGxTAZyPOzS84zPwM4TWNsYq5uuen5tgc?=
 =?us-ascii?Q?TdQeFhDQ3upCv0TeKzS/HKqeZU87W5jV9xgcKqrhhIVaWfLoNSC6+tJy3BhW?=
 =?us-ascii?Q?cFWJoITWfE23qOjoIVd7z43XhPVdV3O8PlmcCbqXenMiTshgUHIaaFINJJN+?=
 =?us-ascii?Q?atLzRqokh3qkUGWAeafJLVGiYzxqsHuDEgj4vkMowHNCooAH7mwUTEZ80c6C?=
 =?us-ascii?Q?DhRNBeK4g+H1j99fqMQD3gcDFr+fUOi/g8CeLR7J6JbxSr13xP77mUgwDgSu?=
 =?us-ascii?Q?eMyQeUsap1m8cQWpH9zcFCmMc/LwImAcXJ4ZEXlaU7HQngo0EaLsDiX6xEA9?=
 =?us-ascii?Q?P3Hr0qbyj/bROMXEeSh5rEmdimfcNYcD15zoEczlGQwVSQisrgdGou5Jba8Y?=
 =?us-ascii?Q?cbp7Omg5gDRfmwCfAZrtgb4bxVUTbNWsL0bjd/ioD/iu966+zdxGRsEDE+Yy?=
 =?us-ascii?Q?NTqXB7dbgnhPuDqS5+QD+5Z/bH+iRf3m66NUi63E10kYeNvPVcAxEs19y05d?=
 =?us-ascii?Q?2WAdmw7684dYanuBf3JC7AyX3mr6iY+777oeUmUoqkpF+W/LcGgDqbQI2qfw?=
 =?us-ascii?Q?MJwig7psHu2cEFvheuSZrGlfrX4iiwf9aaFvEgR6PHbAFp8NS4vSOrkWhPh2?=
 =?us-ascii?Q?QNlUdrQ7AijqWLf6ihLoU3Ah1U+9aOemEaG1tyKdwosIl/2Z2wkTbOuZa+2e?=
 =?us-ascii?Q?3krW7oZWALUOLPSFMKJMGxx/V5MMri8lLsOTTMja8MuIWxipnYQ5NVAUIRHm?=
 =?us-ascii?Q?BO39AcnrqH8qa8c6fOZEdAtjOWnt9lShJj3vE3QqTjgnQqBnE8jh30V5o9Bo?=
 =?us-ascii?Q?K8uCvRr1S3ENRP4dSIHKUc9dmdalLpeJ84PXfRjIcM9loYDycWuYBO9rdgef?=
 =?us-ascii?Q?lduDbVZK5xIS23i6lpN+qHHL8KsbeXHjTRqaEcsaqKQ+Nm6eDIm2Y0jNH8Gn?=
 =?us-ascii?Q?HJXIpNoSDMihpOe8abQOOZKf/KAQFqgLBIQdzw/YCt43JsTRJO6v75HBBwYR?=
 =?us-ascii?Q?KqatFomFYZth5Wqp3nRF7o4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24dfaad-6ddb-4f16-00d0-08dd5c52859a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 01:59:25.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXRCn69QPD+z7WW1c/KBpbzvPYVKk1p7wT6AvljMqut4g4gCcH++Qpd7gaTDSiiNqyQ5ORWuZXIkNUm8R2p6hJFhRUK3NkH0mVgWrld07QGzMBpPbDnSNHQcAIZpeI2q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11216

Adds snd_soc_dai_mute_is_ctrled_at_trigger() to judge
dai->driver->ops->mute_unmute_on_trigger flags

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  2 +-
 sound/soc/soc-dai.c     | 12 ++++++++++--
 sound/soc/soc-pcm.c     |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c3a3ba4b0bb7..d19ab5572d2b 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -193,7 +193,7 @@ int snd_soc_dai_prepare(struct snd_soc_dai *dai,
 /* Digital Audio Interface mute */
 int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
-
+int snd_soc_dai_mute_is_ctrled_at_trigger(struct snd_soc_dai *dai);
 
 int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 		unsigned int *tx_num, unsigned int *tx_slot,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 8f2b5b840bb0..a210089747d0 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -364,6 +364,14 @@ int snd_soc_dai_prepare(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_prepare);
 
+int snd_soc_dai_mute_is_ctrled_at_trigger(struct snd_soc_dai *dai)
+{
+	if (dai->driver->ops)
+		return dai->driver->ops->mute_unmute_on_trigger;
+
+	return 0;
+}
+
 /**
  * snd_soc_dai_digital_mute - configure DAI system or master clock.
  * @dai: DAI
@@ -620,7 +628,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			if (ret < 0)
 				break;
 
-			if (dai->driver->ops && dai->driver->ops->mute_unmute_on_trigger)
+			if (snd_soc_dai_mute_is_ctrled_at_trigger(dai))
 				snd_soc_dai_digital_mute(dai, 0, substream->stream);
 
 			soc_dai_mark_push(dai, substream, trigger);
@@ -633,7 +641,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			if (rollback && !soc_dai_mark_match(dai, substream, trigger))
 				continue;
 
-			if (dai->driver->ops && dai->driver->ops->mute_unmute_on_trigger)
+			if (snd_soc_dai_mute_is_ctrled_at_trigger(dai))
 				snd_soc_dai_digital_mute(dai, 1, substream->stream);
 
 			r = soc_dai_trigger(dai, substream, cmd);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c79c417b6cff..b31505af9382 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -949,7 +949,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 			SND_SOC_DAPM_STREAM_START);
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->ops && !dai->driver->ops->mute_unmute_on_trigger)
+		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
 			snd_soc_dai_digital_mute(dai, 0, substream->stream);
 	}
 
@@ -1007,7 +1007,7 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 			soc_pcm_set_dai_params(dai, NULL);
 
 		if (snd_soc_dai_stream_active(dai, substream->stream) == 1) {
-			if (dai->driver->ops && !dai->driver->ops->mute_unmute_on_trigger)
+			if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
 				snd_soc_dai_digital_mute(dai, 1, substream->stream);
 		}
 	}
-- 
2.43.0

