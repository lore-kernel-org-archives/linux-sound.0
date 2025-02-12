Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56611922F6
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327342; cv=fail; b=TUkIsQMFUmL8k0sh64OwCvJ+uW8+N2VIewrZZFbqTXfK/ugVTETKX2Pnj8PQEQXWrzUedAbmIgoumQOaOmHcwGFLlLt/qBVXhQZd6sQ8VEqwB8dPVV+ZZz/2tzjmPqTvaIfp15EyDHDaDTb1CJy89UDHWvKtp/VJ/0Dzcvw8AtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327342; c=relaxed/simple;
	bh=mbLGCqedYKil6O6+an82oDRHZt7qpiM06e6WcGwYb/k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZWLtzl8gpRe7GjeMmCDatOVTqx7Wpwcjh0AjeUMTub2GAHdxgbEqPU7MYUDIFl0eM6lch1uKnPsqQEDDjV48Xl7dRHnUuGO4SD61KbVmIygUiXlJDR3YXwJSjIiL4gDuf0+wWZdXtsOPg0qej4qTMSMS05AF3uTPlB/kUCOlhDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D7NhpD6Y; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D7NhpD6Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl/P/q5R/rVc/Ig0RoLpAhNgfkcMByY3KylWNquKvaS22GwRupCpsKa6Gev6QPxqXR72c1Yszyzx7PXBAdlIS8/WcCOfE+Gp1Mp8Y4rND4i3rmUY5iOcZBbGYXglo/ba9S84jNG9GTfJrk9VF1DIar4mEeinQGANqi295dereFSSenenTcINeZYA9mzy0yuGlaRVSkYxhxdPo7bCsTtAimX+0E1fV44iKBwm0+7BW1BVn8hsnc/FmjtnXJLym7jA3JV+qDGqmA6JuwK0J/TzA8by6rBkoM9CVZFyoWKOOD3aX2IiPuJDf7IBghHlGvxwZ3/65aQENNI24lWx0p46iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3O5yiDDl3sP54Q8041Gb31u19OYpAbfEK+URGGxsjS0=;
 b=JjwfleqGgqYb59XnDOl+sW7eVVv5WT/JsTde25j1espTOOHW91DyXSsm1kM34gj4QLf4/Z/7c1ZEOPfKFYRLtpiTPP6vXzmtj2Hn5XILKXKlKgmkPRSer/83O46MuO+Ba03JyrKNQ4evev+ieNwk5XxpiH1fEz6Y64kc99jZEffDrs7obajlv3LVBGA/yceszrvLi5H0dmHM7EEsXx3XBY46BJ+Kt+iRMXuwwTiq0u8VqXZ2s2DhR+zxL2Y9KgLItDpX6VOg8Ny8L1g8oWWRFj0XoYapU26xCsGDAH3r61QpwuakkZ8zC3BQP9e2Ot+i4eTN+0Baql+FhdxEh7qdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O5yiDDl3sP54Q8041Gb31u19OYpAbfEK+URGGxsjS0=;
 b=D7NhpD6YyNsCm9oVpkRdioXEqq4qLsiGaraiLTAtLmrLdSRzrbn1FgFs59hhOD1IC7EylJ/OAoBScNOYajeH/tO9zDtxDrlzzx0dsbp73quEHTogCdLj+DzjW/KFZik6q+5mtPhglFtgJy0ldxc1TECukJNv3JpRj6ZRw1UeVsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB12096.jpnprd01.prod.outlook.com
 (2603:1096:604:260::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:28:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:28:57 +0000
Message-ID: <87jz9vyjyu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/12] ASoC: remove dpcm_process_paths()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:28:57 +0000
X-ClientProxiedBy: TY2PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:404:a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB12096:EE_
X-MS-Office365-Filtering-Correlation-Id: d7878213-fd9a-400e-4f7c-08dd4b0d0099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6wL8hEdP9pChu7aG9M77ZEX6CgbxWk4ZQND8YrbcJjFQ1xP50XJeiVuHJyoU?=
 =?us-ascii?Q?7HeQqx7w7fjJz6HsOPMYy9kOZeKxOj4q9ifhigJimOQfYRsuTlCmTwutkE0v?=
 =?us-ascii?Q?ESh3Lp8AUdo5l/u79ZKJsu8po3InWv5+zt+xJStl5moje0a5Cj8IJtCXH7E/?=
 =?us-ascii?Q?tNfRHYmCRX3qops8R2qIt+10GZ3c9ztGdFjneqKaL0ESz2lZvxI8AuuWKEda?=
 =?us-ascii?Q?x5UOBPGLSjRvUqnS0PBjCVXJNlWq3gKUbzUdyTbiuPJd79ggm6INBsBGHjRq?=
 =?us-ascii?Q?d3mNXdRJ6hOkp3/VxP6osv5z7woC3K+pbYrNSLuaLtu6VxIfLr4XXdANNlRd?=
 =?us-ascii?Q?U8OwX0ddSyLw3VpE7Aj0gnjo5kVemTk1zma2ZDhkxEwlQ5mdYig63IsleII6?=
 =?us-ascii?Q?kcm/DLbhPx0mZaZTl/pqAm8Ma4T8tH7m7pTS0bpokIg9qdaYs7AvJVCuy+XB?=
 =?us-ascii?Q?9B0yfCwWGZUYitBvZW0JFUcfNRiyPBgpn/+g72BfrlrveYRpZQ6NTHiWEvih?=
 =?us-ascii?Q?B70FEsxaCLw/j441SWL4e9JukU/vJyflcZXVVSQx6AOBzdcU9TwTlRhxyi+S?=
 =?us-ascii?Q?G8F0/IkC9H14jneEqwI6w2hDMIr7J9R2R4MBnfnrFU97E76nvHcXbZPRg753?=
 =?us-ascii?Q?y414JsMjQ65ICsyHyYtNxme2hBae+xM9oZukN18J3SGXYUG0ZNFeTUxIXdX9?=
 =?us-ascii?Q?nJZS0vcbWsG/Pq8Vdh3rWlwIW8PLEHVvqBdprOK1+0z7LDNsC2AjMwGCXjmT?=
 =?us-ascii?Q?Ycsb7+t28c+zaGHL5aBvhUCTITTVJu1x+IMFjxM9F0HtK2YmeQJQLPjiLsDu?=
 =?us-ascii?Q?pfTwwISf9zyfOwhycXh2smFSq0CNjdgzBk53rrjIplkgygPcVDXhN8koP9Iv?=
 =?us-ascii?Q?MuRQVVRCxPma6lxeMWD2WGHxUW/asIQjXo/gpxERR/s3ibyt/zoVOC9wKtz2?=
 =?us-ascii?Q?Ntc/lFNEal7eBtqDc0vKILaDFqErzgBeBmUwJ0cel9ziUlXbJkxGBzbbEWyO?=
 =?us-ascii?Q?uLX47dKb16F1RITofNF2EnnOS/uJ+3UjxNE3XX+ZLDFjjdDv17lj8LnsSmUy?=
 =?us-ascii?Q?0sz30varLfdYntW/cbeoT7avL23ehuYHK0X/68WULQcqB366gVjgx2pBeeEW?=
 =?us-ascii?Q?oCF5WmENKQlfh46FJUfLOIqGRFF7WptoXubKcgJqwQ5/iInAdov+D4T0Jmx0?=
 =?us-ascii?Q?TDcAbx30u/YSul0LX71RtJeR1vwnrn+S+NXti3d3TUsNKUn8o31Xapz/0J/U?=
 =?us-ascii?Q?CQZcAZ9Xd9hpjpTPSwhoM2VFbE736qsiaVgMQFQgUKigPqgeEWL7zVtMXoEq?=
 =?us-ascii?Q?VLvfQYDP35STllu8mBvhVGpCR4q+tLISnPQUqtvEyLcQq/CsQEY8BAmFvM1Q?=
 =?us-ascii?Q?3smX0t07YDM6nkYkQNcpsB0JJfuJbEFt28EQfQbzUkus8YgEYcW8XPpz1+5M?=
 =?us-ascii?Q?m3kQzNWerULGqgxw1+5VUbypowhEx/tR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rZjOXNMFKTAQBRsJ3KI9lG9Y3gRoUwOBlT37qAOY5wIqmN4K5pydNcseGvAk?=
 =?us-ascii?Q?KxSY7dbpcngo6EQSqp5SM5AyWUS9NsMjkt6yBybCo7WarQgFQYRxAT9iRpbO?=
 =?us-ascii?Q?/f7qlS8eZbuxtTW62dosGgf5nk1CZKyc4MTJ2ANatCqx6zAoNuBKestdohZ+?=
 =?us-ascii?Q?fSbXnHFzTbKPsaZGGKmEnESWBMuvISE5Fozb+OQJkhYqJYlOJJNsq1SDxPCJ?=
 =?us-ascii?Q?ywfDCNh8TgNXUkgjYJpcylKgV+RoIiAeynJLTVDEIcryPelLJU7Fgm91DW9y?=
 =?us-ascii?Q?2WQHSwyTBY8rbf4c4KskonVh15ksmYi2pSFHvOU6b/ExsiNqgJuMju/jyETW?=
 =?us-ascii?Q?EHTeuQrAFhoobiNToRAJQ3AVNlVBMXiHyNR8REwkkyIg0Idh6+GB6cwIbj7i?=
 =?us-ascii?Q?TPTeYs22C4a+6iO/Et0i/Uar5/T8knxVf+DAzxF9COL4cAn2TlN99DmYYdWQ?=
 =?us-ascii?Q?/7q7TARrtEIOHdOr9fRgw0rFsq9wl8Ga0gdG29/WDv1eb9Ijql9tUknNNViI?=
 =?us-ascii?Q?wBLY/OAX14rErnZC7lLBb212LwzCAA39hdl3zcw30Mf+TIPE5N0Zv959oF5J?=
 =?us-ascii?Q?e71UXwd+fNY2T5hNXNdsTXY2PwWzgC8WyPnuTqOhxWqKBeeoStOj6Stf2pbm?=
 =?us-ascii?Q?qG/t36tGw7YIEmZsDtZwT0WX841w/zEGZ66wLzlwxkI2L9FUdwm6WP+8wslp?=
 =?us-ascii?Q?yiz13nomstMsEbDbZ4E5Xiq/d+q586/wgIeTjwwMFl9zVqvwaigX9rjZlcUP?=
 =?us-ascii?Q?JNi43mg6FCKrB8V/Wss1/XGmbvFAGnPaLZXLU9tLKuk0O/IIWgQ2XIRAuRTU?=
 =?us-ascii?Q?zjFqa7YOnYnj893hpG3OjgUEXQdnlyd5Hja1v6rUe0fSdMs4BLa7+Ww1SlQK?=
 =?us-ascii?Q?OuvCzpiVqW6lY4F0T2124N9VYhdktHvj3iMnCOfkbepf8vjNZm/p3XBJSq17?=
 =?us-ascii?Q?k95rXsjE9l4TuZO+CP8sCIH/TDizEEZSiAPyo05kanCrpxqltOCTMH8eAGsC?=
 =?us-ascii?Q?wB9hAwldQvI5X8NZA+T1LV5WL2gO0dZwCSG9v/gIa8t8Cn3wRzwP1BJBc7Sw?=
 =?us-ascii?Q?fjr9HMaImylaBDbC4G/NDFPRTlQztMyCnLl2bmBguvdTecDyGJF5NUItmw7f?=
 =?us-ascii?Q?BEtioiYad2TlsLgF61EZdcKVA8HKSgewHlay7tA/+4tAV/othI9UxQajEKZ7?=
 =?us-ascii?Q?+NC93YNHmWfzlLyyK1bgcgpFg4RQ7+HtnYptVDMhMz+wsYtr8hxUreOuc+IS?=
 =?us-ascii?Q?2xTRMOhuHbaRVtGzRSoXO4ZBwpaJDN9In4mB5aTSv0k/mt6gZBtFzrPekykK?=
 =?us-ascii?Q?iA6MmYVvzb4kpWL6goXLSRdn8MTUKoeMHjCyApVbCpNb6Or2XIUzMO13tVTG?=
 =?us-ascii?Q?gwKQUhJ/qv/NO8BJRT2RWOwYcIvHxuoOMEKvlLY45Us5iRiBDnkMT1nOw83v?=
 =?us-ascii?Q?JUucHcWYKsdtf2V9vPPpIVqdSApND/tAvDpoWvZ8lzkmGd9MeyyMbP6UJA10?=
 =?us-ascii?Q?ACuvezP2uKvj1QP+po5RlVyNx/l+mm/2OAP+5Vkfh8B6kIn8CUBA4SO8wf3+?=
 =?us-ascii?Q?uyoiv/reIn9n1HNUexRRwrLAw2fdXyEvKcC8IzIk87mXJhkdiBPGET6icUpX?=
 =?us-ascii?Q?sdScfk3BYxxhJB3z5yjnrB4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7878213-fd9a-400e-4f7c-08dd4b0d0099
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:28:57.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gVOcTUMALWBAWuQpggqcILL2/Hqh7DCu7TmnmrfU4IpHk51Rbni5P+ool4KJphw2ITc0H4mHQFwwEY/ittj2t97IULWvV/QMnTszr5wW3DYGZMT3nKBO1Xc3X+WlMoj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12096

dpcm_process_paths() will call dpcm_add_paths() (A) or
dpcm_prune_paths() (B)

	dpcm_process_paths(..., new)
	{
		if (new)
(A)			return dpcm_add_paths(...);
		else
(B)			return dpcm_prune_paths(...);
	}

but the user who need to call dpcm_prune_paths() (B) is only
soc_dpcm_fe_runtime_update(), all other user want to call is
dpcm_add_paths() (A). We don't need to have confusing
dpcm_process_paths(). Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h |  4 ++--
 sound/soc/soc-compress.c |  2 +-
 sound/soc/soc-pcm.c      | 28 +++++++++++-----------------
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index c1b88c3b78356..af24665e37e86 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -132,8 +132,8 @@ static inline void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list_);
 void dpcm_path_put(struct snd_soc_dapm_widget_list **list);
-int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list, int new);
+int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
+		   struct snd_soc_dapm_widget_list **list_);
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream);
 void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 		      int do_hw_free, struct snd_soc_dpcm *last);
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 563dc0767c177..01d1d6bee28cf 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -148,7 +148,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	snd_soc_dpcm_mutex_lock(fe);
 
 	/* calculate valid and active FE <-> BE dpcms */
-	dpcm_process_paths(fe, stream, &list, 1);
+	dpcm_add_paths(fe, stream, &list);
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 062e2cc467cdd..96776824d9daa 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1550,8 +1550,8 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	return prune;
 }
 
-static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
-	struct snd_soc_dapm_widget_list **list_)
+int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
+		   struct snd_soc_dapm_widget_list **list_)
 {
 	struct snd_soc_card *card = fe->card;
 	struct snd_soc_dapm_widget_list *list = *list_;
@@ -1616,19 +1616,6 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	return new;
 }
 
-/*
- * Find the corresponding BE DAIs that source or sink audio to this
- * FE substream.
- */
-int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list, int new)
-{
-	if (new)
-		return dpcm_add_paths(fe, stream, list);
-	else
-		return dpcm_prune_paths(fe, stream, list);
-}
-
 void dpcm_clear_pending_state(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm;
@@ -2706,7 +2693,14 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 			return paths;
 
 		/* update any playback/capture paths */
-		count = dpcm_process_paths(fe, stream, &list, new);
+		/*
+		 * Find the corresponding BE DAIs that source or sink audio to this
+		 * FE substream.
+		 */
+		if (new)
+			count = dpcm_add_paths(fe, stream, &list);
+		else
+			count = dpcm_prune_paths(fe, stream, &list);
 		if (count) {
 			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
 			if (new)
@@ -2798,7 +2792,7 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 		goto open_end;
 
 	/* calculate valid and active FE <-> BE dpcms */
-	dpcm_process_paths(fe, stream, &list, 1);
+	dpcm_add_paths(fe, stream, &list);
 
 	ret = dpcm_fe_dai_startup(fe_substream);
 	if (ret < 0)
-- 
2.43.0

