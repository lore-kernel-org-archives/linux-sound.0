Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0370238C0B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821355; cv=fail; b=cnaQqmbvg6jLYJdWhfLwlCJ7L+irnpKLuDxNUKShJAWaY9X8tFnfo42zbIdEPodszt+n9ASyO0+MSHQ6G7WA/uUG6c9R0ib6M4Cheq9rPVECGTncVJMFOU94iS8l10sV6H3Rl5OIdMfrZPdCG35yUq6RojGqMeTQ5VWCBVT6bBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821355; c=relaxed/simple;
	bh=t4AdWjuLVqKXmWgp+Zd6A9iZ+TsFqGEdKpeKkmGMLjc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WrzegjPr6cDOaWVUWFKMzh3/d7kgU/EvKbWG+W1ZTp34QnY6z4LezqGfXvQHtWMp978mkfFanwGnJ8tYqBS66epqZIm7feR7TktSPEf9kdiBoXy8aaRpBTU75Yzw58xZBn/0GeYGAXqIkgf2Xj7yE+BjAU6+7QEZxvRMSqkj6PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PgXEjnDK; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PgXEjnDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHUswjgqz2yRDtUAhIOEglM81EDwBUHzmMyhZH7Yq18D0O5xju7v2UGrSDv8vHmxrmaVVUhyaAyrR4nn7PQ+rsUC9YAFsiMaFItEoRtxOJa9RN26Yoi8pvv4jM0nWc/0dD5uHPF2jjGyOWSLbB1haxjV+pvxUImgwC2uMm5MLSOFsiGjba7m0NMpr4D6ArF13IuXT1QtgDLetmn2cjP4QPQMKlWIoHZZ4neyIi5mTVZf5mwoynZKWagGX3CngoWsDTDKompdRVHyi+Et/9xXqGzoF0rWr7rqkLW7I07/D9VNOARkRimf8Y3fqFFySWjrGzug8KkCR38V0H/lbSy4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzBynCJXrOkxk/lHJTYkwWmWy/L4xUqfKss+L17V0LM=;
 b=JTYb0g5KYG8LKjtex3MP0Oplc6cNDPbf4w3j1BxYufK8vsUcuIbb7s4RFh3+YwpsCLITFr7ovO/SVOZTyN0VRt0dde1fS+EkhrkBb4SeqVhOq3tM7pproZaDS40seYo+VQ9Q+XcEY6rHe41nONylKrkUOP9Sx9qUsLAxigBjnzxSEhQwHJQMez2kpnSWaBydQpnFMhyXDey+o4ZBwBK5UoK3F+qHdo51hDcoZawBOLnqttqyxFB5xQS9bewrW8NebVT4FOyfnvlO3Q11BgVFpGuB3ZUPfWSydo+R//UjYcOPO2rNEyIzgYAexsEE2IwxE6K6tkQ+k4qIGID8qGsIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzBynCJXrOkxk/lHJTYkwWmWy/L4xUqfKss+L17V0LM=;
 b=PgXEjnDKp2WHWTye+IZ9suc7MC4pjbR9K0RyW1VAIdw9okVG2Xg9PJVt8/pkihZ53x6YXsrihjPKFas9Qx/03FrUKK4WlxhzusEa+X2FXtx6fswDC4NlPiSPSWWaGjQT6wrC75nkHGDWPgpj8DLckd5sWkbKo/PyygQvwlifKd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:52 +0000
Message-ID: <87ms4ttnh4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 267/292] ASoC: sdw_utils: soc_sdw_rt_mf_sdca: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:52 +0000
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e74ab5-77a3-4d9e-3257-08de20ba44a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S0p8fURj4qciA0869ZP6pATKtN592KEmWtDNxM/PawRTK/9NSLLcyVTPYMyt?=
 =?us-ascii?Q?omWZDUvE1QlL4oOdcUEJBza/VStYJcFJ0hvjYLdl4qUAKCq52nZctuEsH9EC?=
 =?us-ascii?Q?Zui6hPA9mKbk013PCE1VTnyfklwo3T0JQvuWMDFuf8Q3mYBDdQjM0W56u6zb?=
 =?us-ascii?Q?5YmXSD+opINfMa/ea1rcAmIQ8i1X94aCup7eNSMER356hZQp6fuAtPoI8H9m?=
 =?us-ascii?Q?CauX1rBmcc7I589dB5oYkjeELyQIs+tTe2bnRc+ELg4U+zld1L2Bq8ITA8Bt?=
 =?us-ascii?Q?IuEuqZIDPqjEUlun+sjDCMB/BewJ/VIw1EY4JtZHg6gP6xujXG4wNyNLIAqt?=
 =?us-ascii?Q?SFxsnNDkWbGP6gPLkKKe0sH3Di85FfCvg9ciqqmVthbSPfoaPzoaMSJ0PSDF?=
 =?us-ascii?Q?t6gXgqVJXNJ5vcghSEhE2+nkgc4olupWuIssL6D0FjMoR79OEJfD9Ga6q821?=
 =?us-ascii?Q?P6wmqpr0ebp7/7bqUjph2uiSrBiYvESRWaJnrFddf91AF3TBStLcTtAU+SCv?=
 =?us-ascii?Q?EIoeZH2ctH9TLzH269c+gRbhbC9GQkTBTtncWEDJoAG1U8fxnorIvwgdg5hp?=
 =?us-ascii?Q?LszUtCmTyu+yEx/qRtPIiO75jqeuwVLwmrQrhcjqyiS501YBzyj8fdAEHHU0?=
 =?us-ascii?Q?2OtSBvBdcPGQAXUCCfLic/bTunymlQ4BTx7wBxCQ5dRygvkKhb65kRKACy9k?=
 =?us-ascii?Q?wgCNnfjzyxjx7/ePuRflnqgoV9wlqB9071f029vj1ttQenUvgb2zDPdZlson?=
 =?us-ascii?Q?bsdXbylzGsmuZY+PDkpe/QG0Q6jehoZYpNppgAraF1J/DseilKkVDnrQMp8H?=
 =?us-ascii?Q?mgnEb83CuR40eLlrgET8k4kvALBf7MBzGe2RreZVahOdCXa9tqp+y2VcVoZ9?=
 =?us-ascii?Q?7F6lCmD9ASdxpfjnpd5wwTXIKIw4lbo9DHQIJW7vzW3cYeq8yad04gaf5MbI?=
 =?us-ascii?Q?P1rB7fZpDkX1I/oHBuztNYY9dsDmaZP1Ds0s4SBXBoSxldepTOQtsirEKuIZ?=
 =?us-ascii?Q?xAFbSaOWK3LeqOYTK6DlYJSY3X0/KF2j41KKhayOtrm+urZ+kuUN1CjhZGXA?=
 =?us-ascii?Q?dgqhdyJ7zpK8kWVDGQZF24b5YcURg6FSIc1PhjO6QMs0295GKzlt7FADSMR2?=
 =?us-ascii?Q?T7ALbCm5X78BA6TWjt4hewLzMN5iEot/Axn1UJNOVKjMy1zqp11hxBn+aTa4?=
 =?us-ascii?Q?oZn9NV6vM44YUi9uU+aeg/SS0Cjd5HMv9YlLcsBncRi36CZ3gui7x8a6fCXk?=
 =?us-ascii?Q?TCI6rFmVmCuk/TT+HQxasFS2uzgu/gxmeSL4Co+jlZmFoFaWhBVuWQ7FSvm7?=
 =?us-ascii?Q?m3N2rUot3yw7pK7PNi/f9fxDvFvfYD+fjWBqa+rdKUPPiTaGxDIXQTDHBq4J?=
 =?us-ascii?Q?ZKpjAVMymXciQAkV7TcSsVu4rwt3BtJdfXCopdiekPJHepjr1UOESXbyFVB3?=
 =?us-ascii?Q?/QwQjseLeteX4WhW/5x09jMTkVOzfynBHEXU4GU0wsFwRwybxKHosgUo05TR?=
 =?us-ascii?Q?5TTLZwTLCs8wk2buTAvjlUJKK/nRW6akF4QZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DsM16mpJRtlpXBkMqePrg7T7MdBNBL1DKkPYwOqh2PtarP6kbRG2gM6Hp55z?=
 =?us-ascii?Q?obcXdG297NeOrdxAlMWQY6wPCbLjWsdMYcCErcP9vFKO65WpWUM4IfXe3zk2?=
 =?us-ascii?Q?sJPFgUeAOv9uYhxm4AtVWIVETgYWD11dWTaxvQjN1PCQ+mPl8TBfGb4M21z+?=
 =?us-ascii?Q?OswW7B7WnUxCTiFiuPb4tENhnkO2oBzrNI0bJSmavtzKBU+GJouo6Znp/5s5?=
 =?us-ascii?Q?lGZ9mYrZE0c5uQJQ9sr2nRKOB7XVwC1MolNDiDlyjJ0t8XcbRo9ina6UT/gO?=
 =?us-ascii?Q?xnuYLoCeLx5dm6bmxot19yncLKQ0HaIpBQsp/7XlE+cArhUY8FctExXs9mkY?=
 =?us-ascii?Q?S772q8Vbte/lmUmKWa7OFii+hgfBlpZOrcXAsi9BNfcu4GV13OUa1n75+6oC?=
 =?us-ascii?Q?gff+cFnH3ixpp9X6QlYrKCzjA1qeO7OjItNkor9g0T7vxTkk279ERDolqyD4?=
 =?us-ascii?Q?EdXBwfa/pXFg3RJNDG4kv8h6JW+9G4vWPd/OyJGbbxAyyWoxRg8fGgCj6psd?=
 =?us-ascii?Q?pd8ReSUrCuOoGzWMhhLM5rYWhHIzUc/gBdAKJDRnwBai+Ef1zXXZfWpzgou0?=
 =?us-ascii?Q?ETJxoUJEtk/Zpi5Db5Too0H0yJVpGOjraHmcDabVXzzBZcyT77u6lesRRY6H?=
 =?us-ascii?Q?PvWX5O56fWK5Kz7FSsx6DdV4zPirMlYWeGgl9WMWfxe6/MCqt90mNEN6h9mM?=
 =?us-ascii?Q?tZoznzEZXKgWw8SZlJARzJHlJx2ZlhJhYPvb26Sn0XAIuzzuCGD4XMWkPB4y?=
 =?us-ascii?Q?UVUZTmWhIjx2+WComBbXsEtbVUMiS5CfEnm3F4bDCBRSmMJfKjjQbvumeIOY?=
 =?us-ascii?Q?kyF6Ti/+i3bdZH/QajfV1kWXwxevkI9Vvl2f5cQTIS13Vt8azrVHGYCGOosC?=
 =?us-ascii?Q?vCXAav8mGhpf6SYsud1AojR4fiFgLVCvv0Y2xFEGj54uVbRjc8mzHg/AV8F/?=
 =?us-ascii?Q?7l47w+HZnt5kzvvMaJNvtvI786wZiaKtPHl247VUDwvVV+cRcQ96Bw/7ud8o?=
 =?us-ascii?Q?DaeUR73HUqYka+SEJvL9YJ4MpLzs3dyDeeIAmUoZisOUg5HlG3HuENAsbloe?=
 =?us-ascii?Q?qObigwVh0Ds+kDL381by/phK0RED2dju1YKEGT7loFfAFfSb6GMsI8pF0RJM?=
 =?us-ascii?Q?M7TK8T3f+A4B3OaraI72faV9m1hhF/VnZng95NrnRRQGrHjwG4s9jyUyJ3TB?=
 =?us-ascii?Q?7pqk67Ch1suZiNAh+s1xQ1b/rRfcHtO91eyfcfReDebeFAjh5gZZEWFTvSnx?=
 =?us-ascii?Q?qYxBocE7pmeC4oSyXwRIil+qNureAfJrSQqVKax89N3Fj83tEe0TUsFcLbNZ?=
 =?us-ascii?Q?SC8NWOJiDyL0HOZqeX0TAlby5lWLQuhMkqMvb4tZlH17TnmAHRNG9qhhsWo3?=
 =?us-ascii?Q?SNy/J7/FlJkpKIj8/3WgqFdtd2/htt9UB3bji2k6k0En9FsTwuxEqB8Nf81t?=
 =?us-ascii?Q?EQGBJ7fygf/u82pHBUiF6x+aQn3OhOfse17XK5jpdQLDPqvE05oBsh7kt4YL?=
 =?us-ascii?Q?musLh7NM6ql2jHCFGIGEUBK808KozupBdJvuD0yDSqdHVW+Su3diLmG6hm3e?=
 =?us-ascii?Q?nC1QAKJMUk078kDu6H0dUu/NO/MgUWjzSkJYNJkKprA5Xi3AVXrycPS4Z798?=
 =?us-ascii?Q?ZRsXQaw1GdglJfLmgDViodc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e74ab5-77a3-4d9e-3257-08de20ba44a1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:52.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLPgCYPjrrHatFN6GQmsSSEl5VjGmqsOI4sa8mso5k9iuyxkMg5MrA0QbQ6CFGoK2cikRFfZNFGyq674JOhgEnmPtkp0aGV/GAxEV89dzd372KGCEO3jsJz45i+MXTOA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
index 224b58de90849..5bf3627a97a00 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
@@ -59,6 +59,7 @@ static const struct codec_route_map *get_codec_route_map(const char *codec_name)
 int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	char codec_name[CODEC_NAME_SIZE];
 	int ret;
 
@@ -74,7 +75,7 @@ int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd
 	}
 
 	/* Add routes */
-	ret = snd_soc_dapm_add_routes(&card->dapm, route_map->route_map, route_map->route_size);
+	ret = snd_soc_dapm_add_routes(dapm, route_map->route_map, route_map->route_size);
 	if (ret)
 		dev_err(rtd->dev, "failed to add rt sdca spk map: %d\n", ret);
 
-- 
2.43.0

