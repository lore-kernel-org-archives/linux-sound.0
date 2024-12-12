Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556C13AA20
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733969599; cv=fail; b=golXxE4eQ5FtPeD34RYths2JxMyLKCyNumZ4bSG+ULSrYf4DweTV9fCBsnu1XiK5lIsKbHx+Mb4FHBqN/EG1vS5yWEawwHj5I4lNUUt45DJYT0lf+Vv2jBoorHDzkpOKm1Eo8XWosHTTP4USu6+x5VyC1PSxC1Yw25F9zS4Wsbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733969599; c=relaxed/simple;
	bh=tc7A/e4N4nke3rLDorXdXSEAH2jwSbNWOWOuQtq6iBk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=B5u953HA1rEN5MVF+TppGiVx6N9aM3qRNRIZpy/cT+WMC+7Coz3iQPhItpGi6FYzj6nRayXDlIxvcbtfLuqPpvN34IZgB1VRTTKDE1mg9I4mVoXZkP7giut25Nk28pljhRNzCj2KydVjSUXb1lfZtYMw0EYy0SOhIXQKRKzNbvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eMh2roUI; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eMh2roUI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPt1+uPTs9LtesKnDNSSkzPkRybbubEX5YAtMi1t9XMg8z8a2mFuXUXlh22+PiSUkS7kesKb+GQe0aN8DZqNIzhiE13hvr3ecO/mjmaVhcSom22/YeNoCLmHiEHXLZvsGo4Vqf1aSuQ94yQtu4PwwO4Bwn/C7fnkG6rwBGgSCdZ2B4g5bBjeh/qfiopzHZpCLaLzWrFxoEUBEKmeuKWexJM/elIUrYhQTtj8bPQzXES+InjiiSW9lteRkZLNCUy80ZpmotcuFffrfy9Ix4XJdCnwbQFeYyXU4ohXq8cry5CVBwsL4UcHjuLjl8PaRURUDJOUhYMlM45b0bkXFfR5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXYlIuC+1TOe1jxbKpcv4Un3BjhDL6hgg+5WP8TIfvk=;
 b=e2x774HS/5wRsv2yz4o75OfMB2jX2gDcblcpJBJclHwhDbfX56ZldUUrgLpt6DOenEWXctGQsIbol3ursu31ZSvwJEqx2ylKiP6QL21puuGtfqI32FT/aH049ZXtZNPwKKMqnOXYCf09HCbYW1qXoyy/59lqeNICJMX3HWN+yAHsw17AVbKIoC1YUaiPPf95Fu43BAk26AqguT21VHPN1d6A640iS5DtwK9TmUNUl+5I6RG8FP+zeDunInLpZYLf6KY6Iu+1BA5DUFpy+CFic+kW+LdnGkVZFWhXk68AY83d/MYTUxZus0ujK0YqIXNqr775iA2BH7xJKOVLMv7zeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXYlIuC+1TOe1jxbKpcv4Un3BjhDL6hgg+5WP8TIfvk=;
 b=eMh2roUI8ML2VAcZhB+6bbcg499umJ4fi3AppYwrFYyATEz90Q5DWa+OfeiMnx9wynbUitJiLWmiQS6Bbq9wIk/yUqFxKvALjn2iWQ9nFVat3qbRpxJCKIWvCshy5RGzBGQob8hfkbvbG+5/fHgLA5+hG04DiL2E1Gd/H5Rlj4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7986.jpnprd01.prod.outlook.com
 (2603:1096:604:1ba::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 02:13:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 02:13:13 +0000
Message-ID: <87wmg5tzra.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: tidyup ret handling for card->disable_route_checks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Dec 2024 02:13:13 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2ef127-c523-4c6e-0d8f-08dd1a528856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wID9Q3CA6fvhAPeDmvforfcyEs2ZF7Ef/TFeNldf2IiBxUTOD/RcnRt4XIAB?=
 =?us-ascii?Q?pCTbzcYicBus33FCOhWRcyucO2nGNumDCuCHyppIjh+fKdXRge2SMgvHRh5Q?=
 =?us-ascii?Q?D5IKhIlugnmoJ8nszSYZGo6K+kAsbTj/5hPcebwmsMXqtbbzYfu6NSqKHQs1?=
 =?us-ascii?Q?oo3mK0EiXnf+Stenq4p+6PYSF475W/OGi+VuyCPSJf6PxSgwwflDLCVkyyrz?=
 =?us-ascii?Q?VkBkQm/NTtDdRfzIuwKOOkalI7fAyLuAV5FXfZw/m9eZjPILxcQr/uoKD/C+?=
 =?us-ascii?Q?IQioNqLjDE+dVTz6JCLgzE6xrhaOHlY73wT1lZrYREpDVKzcrfTW7Rj5h/9i?=
 =?us-ascii?Q?GcJpLAj9PT24l+1uU5RDmTgiFjBZfps2/WT8uvGXURZ8iWCaFO/aAiwX3mjK?=
 =?us-ascii?Q?QD3c6t9MYiBluv73bSavfzo51WoX60O/YZN0+gcUvn2gS3k2aITkETCm33X0?=
 =?us-ascii?Q?vsHiJgZ7tiKRfuZng4KMs7LzwTb3LzNa37GPPuwIp3o0D88TcTeAZCOPngNh?=
 =?us-ascii?Q?d4CKv4Se0aTZ4jeoU9Fbk8cmuChLecUVhx2uRv+1d63c2a1bH0YJZkl2pDqo?=
 =?us-ascii?Q?lU/jHdhnH/R3K9FREBbHW3vZ1sSS+lwfmifE4KKgcAmbcF8CBU1LVDQnpRjO?=
 =?us-ascii?Q?TPyYfBGS8gaGoPR34ZHV1Ya+WGN2lInRo92Rc/dz8abEJ+huu8SBH8iWBn5l?=
 =?us-ascii?Q?EDKymExq9dkp5X3GJWqkvfMe/2Yddwd/LemXjDwd3uCzuiT+EmoUPo6/m/bV?=
 =?us-ascii?Q?lFXC2UQfWygy4uc/eNGabGJeJg76Qgb/fPx9zC+iheVlhdpA2oGc1ga5TE6S?=
 =?us-ascii?Q?2zK5q9WC2tBXZgveCYLoW1DIpEGM9PTeBs4PMRYMGyk4UL9ZOvEgjdvGw+OU?=
 =?us-ascii?Q?ehOyIHhiPKdVwkQ4Vw0pNuABIVPIUvF131GFtf29Qp8A/ui5NrDhqi13dfRn?=
 =?us-ascii?Q?eS/92+OpdEOMsiBzDj34b0wilTQ0DfJ3ZJrH1Y2M5O2vcF+RUEGTjN6Tp1tG?=
 =?us-ascii?Q?cUgbbUZN2TlqB87sPCugg0TRW/Pm3vvB++CdHMZT4gWkHSZ18lfxTG/1OyRW?=
 =?us-ascii?Q?rr4FZNdiQL3iw9QY5Gjb4AnoV1AOhzgH0OHmYLQKspcPkTGK9ShJKk2aeXbo?=
 =?us-ascii?Q?957DTLYgStaD6g6DhUtN9kP4HAEukeCnQk9mFfL/Nk/smQCgp8hPTCMWS72J?=
 =?us-ascii?Q?CECpmg+W43drek0XOxfvVbdmR7VvPRlR01qE4MOD2tVpNzJY0LgaxhACQs+w?=
 =?us-ascii?Q?sAPAWYkB993/XVo8hU+V5hModUXKUnb4DnX7sPZntTvfvkCbvVtOkxOzK5P7?=
 =?us-ascii?Q?Wd2JaW9wwle2d9yPNWFRDz/7cbmwJfbG5CKaFi8sqyOn5uywaVn1WOop7h+l?=
 =?us-ascii?Q?OcUVL2yxxU+ANZ4kFf9rsXOrKdW/8H+nqS9YzcTmhndfz+Ec3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JQo3iNjgR2LoT4x5h36PmIgdxObjm/RNba4yhR398Z5lgdQSu9FBCfy0gLXv?=
 =?us-ascii?Q?AjSyiu5hdXx3g/Tl7YYdaQKHTyA5ML2D2RwzIh5aKLD5piY/rQcyLM0KMc4j?=
 =?us-ascii?Q?hV+uP+dim6UtSk0+W6CDad96IcynFR7sMd6GSH0IkCQ2NQW2UkeVbEqytnby?=
 =?us-ascii?Q?aZgH6Ly4YgBIc3SUtscqth0DPGGANwsNIlpguXU9hZVAOePZVxguAiFzTUEm?=
 =?us-ascii?Q?TQbNBOoOIXU4/ckrgP8fpsVfVs6n3AKqNt0cg8Oi76HYuhxxIqMCBzidFgX8?=
 =?us-ascii?Q?D9f44GaaS6vqkQ/xvMwyd3bCMjcN/QwB0MG8QHTX3SeW2A8W9rVD5lt9RxV0?=
 =?us-ascii?Q?8X/iRXoxRYG7uR6a/k8H/a1ig4NxYaUDRXE7ny8rslCjs1R8qgK2jW+ogH9w?=
 =?us-ascii?Q?4qHrcsAgJCLqDxE215oasvcwhNd8aDTGgNT29+f9WWP5jcGRCdPnLxblTC7o?=
 =?us-ascii?Q?JQkFe044HqRWQIQFbz6e89m85jQi7KH06gHzN50H69lWAHXNTl6+WYFVHsse?=
 =?us-ascii?Q?3VdBrnseARV/wVeCxSC/pktk1wPJ7HpsrAErIHmwogXeHdlQn/b2tBYb3vj6?=
 =?us-ascii?Q?/0BR5lO3ziAmyAIJpWDjGf2wIpTH4UQOiKmk/6/NJn0cNDAvr47VoGF2aLC7?=
 =?us-ascii?Q?gTA9w1RAVQB/7bQJqqJdtw8vrp7Ui0z735heRcKMYeprtyYPfEOWa1J5n+QY?=
 =?us-ascii?Q?ru7HI3c0vzCXi8rDwY6dpeTA/fRUQRV0whnAm79mKV21uFNnLcdD/Ve2BAZ9?=
 =?us-ascii?Q?G23wukm3Ibw50K2BaCJO7Mktm7lUfPfAPHIHUeBPTvwJg+wAcNznOVLiSBLt?=
 =?us-ascii?Q?bemWDG3wl1Bnn97IqfLcfQXDhyK3NNZQautNqfPd3B4O37DAFOXLw/xkxR5b?=
 =?us-ascii?Q?ZURdCVSoTdUa91xLmyAuaSuU+eowh/q+QrPxiRrH6/j5/dZkAidM9bHEOAFW?=
 =?us-ascii?Q?Govv4r7D/ALo+qmGzEP4RBvXxMRA1QEO7iy/WWrf+wcQuYX/zzXcpauKAFfQ?=
 =?us-ascii?Q?Ot+iOaUGO680tffa7CHap8+N0NyzLxhm1J5KcnuwGw8X6oC0IxjCbJpL+kvO?=
 =?us-ascii?Q?WEVeCDahqd97/tCX1IzjEHR7CxyQ1bbUAIZoohfGzzf7MuI0d6cscDhDfAgR?=
 =?us-ascii?Q?gNtY+Ap5ceCRsSvPmt5Qnh97qwtTK6Lk75Q/AG+oGIRbpFKP8Af3Op9F1RPK?=
 =?us-ascii?Q?1VnN2MEMa28E9/90d8kAGJqyGBi/b7MlyfVSwILEp/NYCQ77my6BmqFMgy9h?=
 =?us-ascii?Q?mBdz+F0zoWQZxDod/PkiMbTVIMNQ+CcBIVz+qXL1x/RoPWtCzDj7V/gHb5hd?=
 =?us-ascii?Q?LgoxY6RhPGUQ/WMSiJpjElyyegj3BU/spsRqqpNvrHkyHw/rZTc2+3xnZGnE?=
 =?us-ascii?Q?tWPVlVN3vnN7rBzEXSdHdyM6468O7ZNmr8VWGhbd6Ck7dK8T2nrPSRV1f3M0?=
 =?us-ascii?Q?wDWEI3vFP4RjhD7Z/p/dKv68VuwivURQ9Oni+7+4SjnrvjTB0xWtDSja3HpP?=
 =?us-ascii?Q?YzRDZnSPxlmWvuNk4DJDhhE9fxzepL6BzlTkVZ2L0XXFBBMDzmpryyTVb5Ev?=
 =?us-ascii?Q?2jzP6UMHNF4pZGoJI7YPFxkSC1Fbk5r6SPFHJxAdiX/FKF3Mk4+Mco5MYMvW?=
 =?us-ascii?Q?htyc6eyukjwxR+toLnWPddY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2ef127-c523-4c6e-0d8f-08dd1a528856
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 02:13:13.4595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUx4pOPf80VLpMb8yGqPLShXF0B2V7eym8fkkUzPbYRX+lswgT8v1bwVVvAfSWWIF/hS90qPXMEoRseD+o6LKNezdJos2bngIrwNz6NPevxea4+VJUnJc7XfZENt10CS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7986

commit a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy
devices") added card->disable_route_checks to disable route checks
for legacy devices at soc_probe_component() and snd_soc_bind_card().

And commit 6974857c2b2c ("ASoC: topology: Do not ignore route checks
when parsing graphs") tidyup soc-topology for same reason.

In snd_soc_bind_card() case, if snd_soc_dapm_add_routes() (A) error,
but has card->disable_route_checks case (B), it will indicate
dev_info() only, and then, next function (C) will be called.
Thus, "ret" will be over written, and it is handled as non-error.

	static int snd_soc_bind_card(...)
	{
		...
(A)		ret = snd_soc_dapm_add_routes(...);
		if (ret < 0) {
(B)			if (card->disable_route_checks) {
				dev_info(...);
			} else {
				...
				goto probe_end;
			}
		}

(C)		ret = snd_soc_dapm_add_routes(...);
		...

In soc_probe_component() case, if snd_soc_dapm_add_routes() (a)
error, and has card->disable_route_checks case (b), it will indicate
dev_info(). But there is no next function after that, this means ret is
still indicating error, and will not be over written.
So error handline (c) will be handled, and will return error (d)

	static int soc_probe_component(...)
	{
		...
(a)		ret = snd_soc_dapm_add_routes(...);
		if (ret < 0) {
(b)			if (card->disable_route_checks) {
				dev_info(...);
			} else {
				...
				goto err_probe;
			}
		}

		/* see for_each_card_components */
		list_add(...);

	err_probe:
(c)		if (ret < 0)
			soc_remove_component(...);

(d)		return ret;
	}

In soc_tplg_dapm_graph_elems_load() case, snd_soc_dapm_add_routes()
is called in for loop (1). if it was error (2), and doesn't have
card->disable_route_checks case flag (3), it will break from loop.
If card has flag, it will indicate dev_info() and handled as non-error.
But ret is still indicating error in this case. If this error happen
in last of loop, if will return error (4).

	static int soc_tplg_dapm_graph_elems_load(...)
	{
		...
(1)		for (i = 0; i < count; i++) {
			...
(2)			ret = snd_soc_dapm_add_routes(...);
			if (ret) {
(3)				if (!dapm->card->disable_route_checks) {
					dev_err(...);
					break;
				}
				dev_info(...);
			}
		}

(4)		return ret;
	}

This patch set "ret = 0" for each case.

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c     | 2 ++
 sound/soc/soc-topology.c | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a1dace4bb6166..c8b7f78b02f0a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1646,6 +1646,7 @@ static int soc_probe_component(struct snd_soc_card *card,
 				      component->driver->num_dapm_routes);
 	if (ret < 0) {
 		if (card->disable_route_checks) {
+			ret = 0;
 			dev_info(card->dev,
 				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
 				 __func__);
@@ -2236,6 +2237,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 				      card->num_dapm_routes);
 	if (ret < 0) {
 		if (card->disable_route_checks) {
+			ret = 0;
 			dev_info(card->dev,
 				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
 				 __func__);
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 43003d2d36667..ae2d6802cce05 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1102,12 +1102,14 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 
 		ret = snd_soc_dapm_add_routes(dapm, route, 1);
 		if (ret) {
-			if (!dapm->card->disable_route_checks) {
+			if (dapm->card->disable_route_checks) {
+				ret = 0;
+				dev_info(tplg->dev,
+					 "ASoC: disable_route_checks set, ignoring dapm_add_routes errors\n");
+			} else {
 				dev_err(tplg->dev, "ASoC: dapm_add_routes failed: %d\n", ret);
 				break;
 			}
-			dev_info(tplg->dev,
-				 "ASoC: disable_route_checks set, ignoring dapm_add_routes errors\n");
 		}
 	}
 
-- 
2.43.0

