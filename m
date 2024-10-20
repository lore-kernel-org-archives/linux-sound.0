Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90436197A67
	for <linux-sound@vger.kernel.org>; Sun, 20 Oct 2024 23:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729468770; cv=fail; b=UPUuH5i5vnl4FHoTx1xS7tF1BgmMGJGvBOrUxEnuQSaF+Qjr5p1SLLUF8cn7cE5Rh/qFstIfmWwTP5E9u8q7istMWvMJtbR1+qp67lY9ubdG/u7Dv4lQyaZfJeL77rh7fVVU4IaZOjO4WhjyIvi2Ox5RVarIv1nQKfTRrhF9bSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729468770; c=relaxed/simple;
	bh=jL5hztbRGI1Tm1tovWSX7TbyVHtxGpxZwsK/lZd5mBs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lhWxQZlqLtOeF790CpEA/gWGgnqvQK7mRJMdwn9IFIqFnxtVO+hUvY7giZnIeAHS3XSjgyXamzNtx+r8yMicTNUm/jsF6Vxw2A0abHw6BRgxwrZuCPs+5OpxSat7Vs2S7GTFxRc8yHkMDBEVPd/SCDL1jPG7gk8XN1D/hgJQlWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FGs5MwN5; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FGs5MwN5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbhhiGW2w0eMf01i0XcLfv+g1YSRXJT3fgcYqpEWXFZSjms6NhLs631tSKayJrqI5anjm+lgHPyefPD7Stv+2T+DzP7mrJcZSfFzsfsiFww05jEuLIVoNoTFBlfi8kGo0OvHK1ZsKmVgCQWcqJB5ss63hLhkK63G7klry/7xSUhIXPFJYF0mFgkUsRwNLWV/LuDkNTO2zu6hX4EjYeMPHSWY0ur5Nfpd9RJbV6dEtLfAqDua53lMoP6MzJnXG0fkYFj7kdWKylBnhFrYzdcjvyguIHJ8yJUO3U4jjc5O+M5yhWIYqJ4emZX2szkrxUO4LfNOLdGAs6bn1a5lTSrp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7YdZX1l6hpmIHvo28d4Vx8ad4WMxH5X72cmvyifWCA=;
 b=saqaBt781VgqObRN4bTAg5tA9LEHsqfbl+0SXDydyTsRdoXBzxoa4apAbKAEulqOAEtdgdGOHiUsaQXjOUPnqTqIerlfJLzUW0GmeuBsSxaqszDt6xrtBuaXuZRa9ZirywZINyPmaVfJWruUedaRttyDLMHf73bN7ORg4vtbsLJV9ZBx28KO9QZtJEhuei7mEb/O6Y+F0zHIpC5FxM6bRHKTmYZT8glzfZ0jg7wPmpjGDRJWTDT571DO/fOrqSoDDQXbRtCh6zCj9t5+bCTftbxAItCx3+FkyLUsl8PJ/JWf+BeZUN37GCqPA0Gp6a7JASyUxyRzHgkOfs/EPG3nOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7YdZX1l6hpmIHvo28d4Vx8ad4WMxH5X72cmvyifWCA=;
 b=FGs5MwN5iNf0zmiYwgSMhLDVGNULzdbNr7DG0pP5a6VNoFcwbaYZ/Yk8zw23bq+EsArPutvtGkqz+iK5CkkKeNtAFUqbfEMmN+f/RNSEdT67hWAPY/lcu2l7lp4bLhM8OCKB9UeYDj1tJkh3Q1nyVu/CgR6Dy+vWqiO42a6EebM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:25 +0000
Message-ID: <878qui9vhe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 09/13] ASoC: soc-topology: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:25 +0000
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f077b00-7f77-4d2a-801f-08dcf16339e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zGTq4AyvLhpSX/HmWA3ZRaGR2ynCOw1dMrvrrnPeefaJjUm0IsMsX5GYMrYZ?=
 =?us-ascii?Q?UgrNXJ6yiZA8vf2IgRcY6zh83BCjEe430AWpCp+tub2tkIBOUavna2NsIKhA?=
 =?us-ascii?Q?A3qFkYJKlSKJgtYD6FHcGQFJyOoP7s8Mae4glRWo/FysGthcPo2svLhnKR48?=
 =?us-ascii?Q?MEZwRcpXzi5qSTUOiog1dF5rvM4wo+Tlk4ub1d1VtSsobOrEdU7A3/vPUYRx?=
 =?us-ascii?Q?UhPyN0TMW006lcAgRVBFCi+f7p9h070WVdobEIcItmShrhDj69nry5WvE0aU?=
 =?us-ascii?Q?IqDQrJAdVPRsgDTrMQmjX2yUAW5LHTpQIPuV4r7JLfdPet9OHc9RfKQPyc6B?=
 =?us-ascii?Q?QuKD0GPo1cmuJChpaJvVTdG06ys/Djshxpi7fXpPcCSwL4CNcg1U1Jpjgqr8?=
 =?us-ascii?Q?8t6UMYJXv/kMyTqRxZERrblPXHUoxYytpV4uTtWGEUww+x188RE4liTdMtB2?=
 =?us-ascii?Q?k3ObHNvl/zM7BRgafpheTkFBFwZfW1tNLKytBf+3UIptmsztkoOWNcJgFLIQ?=
 =?us-ascii?Q?b4JO8LSnbySL6zsGAtP8K72Ye5NP0JHWs4nKU3MRWmy0j4ZbQ8QBvVxgZem8?=
 =?us-ascii?Q?jLQkDn62FkkmUctj3DCnOO1mOS3sQZMGmUB//UtDu6za6ej8eGmbxWoiJQ9k?=
 =?us-ascii?Q?hZQCGO6Rqh8sq4MizmluoBhdkh5VEw1ml+gRFMrXOxeF7j5WDECnjq0x+jLI?=
 =?us-ascii?Q?SeirT9Uq0QxL3rHzOd4Hde0iXfZ3LDf7MJrK7qw5YHGCaw8zHM5GAOU1OlxJ?=
 =?us-ascii?Q?gV54/BB1k/WwwGFcqXSR2SEYc/a9bccCkBrK2a66fmv7mUDD6HgFhPga3qGl?=
 =?us-ascii?Q?gDpDDtKMuEqBHMixUtijriw25TJF4scx//GCiV/Y7evaOP1FkNq9eoEN1RL6?=
 =?us-ascii?Q?3Ln7pPN8+MD9mbPOGscxkA3Wrsh7GV7l+lE222V/Yb6xapdqXfso94u7zlRp?=
 =?us-ascii?Q?rYATOz50CrexKe/xe7VAFYuG01Bq2jmkPbWqnPX8V1LF6j3jZ0lTdVmi5fgx?=
 =?us-ascii?Q?BcWr9ojMmxQ2kbka78ikrkPxFEbUofNCSb4CpODm3Vvwl9LCJA270V3zNFq8?=
 =?us-ascii?Q?A/eL8H1v9ivG6a2Y/EpudshWzinfNm77+Hi2hb6RcaN/VfQfmslzAtJpotRs?=
 =?us-ascii?Q?ppNPZXp+d075t0YQsALJslDdYVJpiUnbe+PTT2JZTQt03GNxESFdrTzmpjhh?=
 =?us-ascii?Q?0TmnzLVeHuoAFu4N3g9T7akeG9UqTkJSEztdS9ldJ9XhKJV+yYuog7Rq30MQ?=
 =?us-ascii?Q?v6Ia1lNpdRNb/T50LIDKL4wMk/R9SEhaDK214Ag10YiIPmVwMZ//Lyhizaeo?=
 =?us-ascii?Q?/1AYhsCYHjp+bS02pjAc+m09kVDvhZHg2RNK9IMMZpwL+Zf7b6fMnnlEalvR?=
 =?us-ascii?Q?2WV1hoY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xfW+svSEhiftvrw/+o6hygpUcraRMdOQ+0VNLbF6+hrXvlo+IBwKiZm2nSal?=
 =?us-ascii?Q?yATVEE1RbVRXeIqsbFg1KzP3ll6+VIrIyRhhC7YdiJHkhigaIE5uYv4JKI5h?=
 =?us-ascii?Q?gYtCchzfeA4tzba/wLH0rU0uscXaT0uwq0fteUdO78gus13soMJ558LbRVK3?=
 =?us-ascii?Q?Od2tam+BbbVTyrVqiSHi0HktqH+fk235JUzvexLFqu5szX8eTlcgr1LTUo3b?=
 =?us-ascii?Q?d2K9DP93YucaeyRW1apCDukFhtMvr+SrthUUlFOy+vll/U4h48s7lqWQCDtN?=
 =?us-ascii?Q?Ga72Rk5aj+5OEcnAnnM3yOyBHJNXSRH4x/d+KMSZ4S3G+/g/TIOu/JgqWqqX?=
 =?us-ascii?Q?LXWzF1xWMYcoXjCY34Dibz/e+GzPFjZ8J9Hl4FrijR11OWixbgfk9ONa1mhz?=
 =?us-ascii?Q?g8K9sFr+Uw46bSEUp2jmbdqIzjTbg+Xk4sKafTVlz+jfJsWljXvsTU8wXHDa?=
 =?us-ascii?Q?Ll1KvJbA2gX3nbvgPXfnglbN/5AwVG8ymLZ5m1azWa6QACIoR4tT8S8ZZVZM?=
 =?us-ascii?Q?KApA6UBBM47qH181MkO2dhGjyfNCBtNOU5DbojTcMyP0kJq0yQD/6Yyor6iO?=
 =?us-ascii?Q?hSwM3lsZlhKTRPb94n7pDVlYi7KRkDyM0y5bDGL4c6c6Ct1WHBtQGoV09FWB?=
 =?us-ascii?Q?3W4VvChH8Hfcp5vxD6+T1Vte41EbtDkFmnIIiErSrH6Je1lefNkionwHLhCg?=
 =?us-ascii?Q?UVjgiGT0CCL8g7R1SsshmN0ynk7TcmgEvGldbvKmMTRGkVp2djjCG5/9S+Kt?=
 =?us-ascii?Q?1rshHYLlG+lMSzwyJ79/a/8EzTcMiNNqJNE6ApS7husL2fmmRQdEUZutryHv?=
 =?us-ascii?Q?YvjA3B7aj0EtVEl/Csj2pA7uSE3Po/ICPvawPBeshOkd3xG8SSAkIKMRbJrH?=
 =?us-ascii?Q?+0vURt2G8+9DnTirtiRDQJogy4SiU4CwGJPm60Iws+w+PyFdrXmWfvqXwnim?=
 =?us-ascii?Q?N4rbZq1K5AlAc2vgoybNiF56WUQY+Ey7puFrS1z4Jbjqmfm/UBMfv3PlUCf1?=
 =?us-ascii?Q?QRya8DLdez5tyMYK5H9T8oHkUvLakVNeZu6B7IX4RcXgy3c8YSgByOVdu1eB?=
 =?us-ascii?Q?VDbEHoN+8RL3iWkFMxc5Gfpcv2EseV1d1XbVzWJJK8ihK6RWjDScgpp8ZDmL?=
 =?us-ascii?Q?vgCz+uPaahHnxQM3RW9DWtPfZ8k+3ghBSHGsLq7zApoe3hynqHT1BcBV9YAC?=
 =?us-ascii?Q?t907v33dh9pwvNTGCkMHdxh3SsDAbsuE3I4iSEpG10jX3n0FFLN3+Rb8XJwM?=
 =?us-ascii?Q?YsOwE31kNcTjdPYVsMnLQQv88u5X4fF4AI72WqXX1lJh47s/ZM2bRizVfQFx?=
 =?us-ascii?Q?K5KfIdQo14rvnmCDdBffVg/5XecNZNiwyt6nWFZqaT4N6YAiZfMJKbBw7baH?=
 =?us-ascii?Q?gE5f7xwXdksb3UUgoX7O/97P1H4brj8L776P83LyHRI7UtemerBuvOIHzxbs?=
 =?us-ascii?Q?CvKyf6EuOMhr63snl5JTCa7x+ijhIYQKP4Q6SAeAyUFGHVJhTNd4TVIMvGpu?=
 =?us-ascii?Q?iMbfeIXvjzaPp/24RDNILmLsL1/cre1zUyRtARTiWzHQVellWBlGMaZPYoIa?=
 =?us-ascii?Q?z7p8qYbLBJmTUwC/ei8DjAwDAj0cAQsyDsqo/L4jOW//TwuM/BvuVKFd9ymL?=
 =?us-ascii?Q?Pb58OxB8wRgCtZW6rXLDB7c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f077b00-7f77-4d2a-801f-08dcf16339e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:25.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzOuaVbQC8Omt03CjSObN3jLYeyclnEJxPERTVKiOenBKS7YTag3H1KjbNeHQcjfRrWoajcFY/PDtUQ53jZ6U1UsMscDczBNUINZKxX36FUx1A/SVdv7/LRPN9YyJbRk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index a2b08568f4e89..c8f2ec29e9703 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 97517423d1f0b..43003d2d36667 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1544,8 +1544,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only =  le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback) &&  le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.43.0

