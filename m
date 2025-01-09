Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3D36D
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 00:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381685; cv=fail; b=VQ4Vstehnfbp2BOnKbG1PftS1Nh+p5wDLczbtULgNs8qiSHAzbbxFisRZcluS0H5yuoOj1Ykp4pSAI9msPUWCHjwAMV4U0d+9T9WZ3wt8ND3OvRat9CvGb0PEpUjPvpgCo4ynvBQIf75tSZbtfcT4d317E6sQ+oQ6bxI3Dkd794=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381685; c=relaxed/simple;
	bh=BGG9h6McBeBU4XVl2Gbw66vkF/YdpJ6Qms+0YBxF0n4=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=h1pXefibiAXUn5JAf5apTh3lbFlpk5e9VeA1LoerPwnqbVlNbSDLVQgXajhHKQo/RwfswMclbBrnqJ4PjzQsCxKWfFl3/zO7/0DOZxzVuOcnUx7hsYCwjQR+1dLt50BQT9ON3n/oswwUd6eN3rwFJ7/Kms6JN91VDPwzqP49agk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B/GMI0KV; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B/GMI0KV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7DSeSKrSHqlSY4pesb48Ml0g4Osp3FiNZKm4zmaego3MwC7nJ4rZ2/ZnUDaSYzguKB2U2Qcb+9qEYmlLL0Dq+ci7LlepclcECfTFfHDwcmeb4DWbs1s63EGa0uL+7mtqnx3XxMVE8mNW23K1bQ6eWs6foJdnauZdmSxDFQlcDLazGZyV8ovFnqMN6AFdpgnhokf2vMRsfxCxRr9UbcqtUOlwk+HLLlK85mmU70onKEJPTLbbYskAJf+fsg5g/AMHFfYwY3Af5KrNqIJ0glcvGUtuFhgR1RzGWMtHVoZpimMzjXSe5XBe/HpQ4Xn7ndr9hb6AlalKdYoVvPh/2qaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TbsHzoJpLGVRzIih2GM2tU542uP2HRZPIXNwgdbw5M=;
 b=I/x7I09gOMFMBd5X/hoAt4KSNV3lFgdwfTMfEboKW/lknUHI63jdgA7wcdP9GvfOFn0sM103RRw+933v9EIOy/bM2DrwjSqVRudIdPg89VbJdlAyyzdCvW0edY6SoaW7y/Vebq19xL1+HnOyomzfotM+MOFBVFFuYck97cbsr2ftWz3z17d1GhL07P6yWkmjGa7tpDS855dgC4+PidvH3N0Kn9FmjatIWASEgZYtDxgQSrA39bK4gVQNwf8jqYwFlAHnYJpidumO7VmxKSHANta9PJXqxURkBIL26evxGmjnhhMLSSTBDyoOXWkq00C4PwBMQcqflOl/Rp8smo4udQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TbsHzoJpLGVRzIih2GM2tU542uP2HRZPIXNwgdbw5M=;
 b=B/GMI0KVDtez1HmgDPHlrZorVQD17w0euA8D2YSira12WEhiV7oBPOYJaH9ORJqRmo2MoZN86KBRb2KyqOJIpFBZW9m27SqSQtb36SdAAPUoZEDG5ZwfBMohHvuLrADvybDnpcjcUuzqvGeCaEG95IqVSZdyhPDe40SZSjk2jPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7143.jpnprd01.prod.outlook.com
 (2603:1096:604:125::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 00:14:41 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 00:14:41 +0000
Message-ID: <87tta8268e.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent Lu
 <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: remove disable_route_checks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Jan 2025 00:14:41 +0000
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb6cbf9-e826-4bdd-7fea-08dd30429ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?r6pNZulapy2aLV4YJX1K2OF/nzJ043XuqZsgGr2asLpmVv57lHscnoY8PQ?=
 =?iso-8859-2?Q?ZMbjXoBNRuzXjEUY4I7qzI5PjfyOrR4j7PJFzOJZLaMVrKN6a/9aWPzY7S?=
 =?iso-8859-2?Q?sEMOLD4WJOt2Ng/sUuwpjxdNz/wdh0GzXj+KLqONBldbPnmLxTF2gVFXEg?=
 =?iso-8859-2?Q?jn6JkA/Qs2Bo9BrLXgvpTWPVzIemtMIA6Zwew4rEtsJYd0vDwDdLsCuxpK?=
 =?iso-8859-2?Q?QGpVisozbjnyhvq6zCfSt8tKIL3dAgJFiZDn8aJMxbPsl1x5TTM+1gApgY?=
 =?iso-8859-2?Q?TUnHxuH41pEiNkA07MFB369ZZ5/SxOESVZop3srF4f+emFx20AQAc3sTtZ?=
 =?iso-8859-2?Q?xtmd42KoG49Kn7oZs8geDVGJgelxCv6YE+fapGYXDxdsObYrdxFQSludKL?=
 =?iso-8859-2?Q?CO+4tIWEiLuhlbL7Z2yqAcbULjDsiGIv4lxJq2qjlERYjidPRNYMirtHqG?=
 =?iso-8859-2?Q?2hUlvP2SaUvjec3gT84yIKRGpzlgfLZx7WgUz9kuiCu0KAsDXngm6xqlmW?=
 =?iso-8859-2?Q?XUGiCBXSCf28yv2l8/gnNItHDlYmWUazrEV5cxUbM8LISM+oQayJYtCuou?=
 =?iso-8859-2?Q?mNc733fcnhN5q+2Kh6EmacSRyEjVEk4movryU7KrF+yvQUziJovLnXtDMz?=
 =?iso-8859-2?Q?7+BoB/m8zpCSS80MEOYaFs1KOWrIl4trDRzr7ZrpYZleopUGSJs9MnFdTM?=
 =?iso-8859-2?Q?33BhuLVYj/bjPp3ju24B3xuBW3jr6++d6o5n4CS/qjyEPLyAHqIQNK9YT6?=
 =?iso-8859-2?Q?+O4pE3aCQ32F62k6MrCCMf8RQOIdGv4sbIzJwn/9+zCKLduU0t03kRwVvZ?=
 =?iso-8859-2?Q?gpxtaBAMZuCB7JIgINMpLfNLsELN7gkgxv3XaHEAVxGh2zmeQYp2KhvtTP?=
 =?iso-8859-2?Q?WpfUPIOdqgrEa5uYfiJI6yP7W+HHIAjXAIBXegEcNzgxiv4jQX5WO0rw7q?=
 =?iso-8859-2?Q?kQQWnCtw0503v9Ez9p3AuW69n831qAManyTR5OsuCT1qJZVhWt2kJs7/sf?=
 =?iso-8859-2?Q?F3jVgGcjsnonVXyAcbm2KdbjwB+raYGaof/0zoRNTGyWgJYk887c1bViUc?=
 =?iso-8859-2?Q?MqZqCt0wW1vTQc9/ngS5bTNg/HrKbQCwLHCTFtLrUpFriK2P7tL+Q/iejp?=
 =?iso-8859-2?Q?MeTLBIDj4jePxwm5TAHT6UE6zJGU5cYRVlneWBdUnazSasCCAjZ7JlsS+I?=
 =?iso-8859-2?Q?SBvBbFQTzDEdAAldEbTBm4Hv5Z+RsNoaYfCxODBDvbSJRW6IEwztqt7LQp?=
 =?iso-8859-2?Q?JF1iU6myn8zegMDb9Z+AH+QjOmYmPhadBIHTWgGeVTHmdhHiCg8p8nrmIT?=
 =?iso-8859-2?Q?+Z/LfDxghewX1q3IVyd24ikBgSxK92Ei2TKbbnUBRkMqPPI1lwiHvG/0l3?=
 =?iso-8859-2?Q?zy1R66XwD6GLD3/SJhwBPEyUGbJXHX3YBY5/D543Ln/dIMORwb5ZFfxJe1?=
 =?iso-8859-2?Q?Q+MgecLb+VLf57onC87aYRROuSXveXiLgeytgVeFNWWJMhVQc+XbycqRVn?=
 =?iso-8859-2?Q?Mb2yLnAbyAw8CopGHmnFVzFBSHMNcuYz1Of5SXJD0Lyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?WyXjam3lJ9syMIJZI5ZiE8lWmXOELuBxSFMaR8gSl/F/80AVeChtY0AW3l?=
 =?iso-8859-2?Q?GD0IJ4SFbhxE4OpkBr8hqc0lkXiF89Yc+X0d+JFp5R8ERqFyN+jLGwxsPO?=
 =?iso-8859-2?Q?8ptDWuvsa/efjk1atAmuexYASXR17m+r0/J+U6kmx8DbcN330OeYKOz2zd?=
 =?iso-8859-2?Q?exRuQ/dyGAz2bRM4lmYtvL/iVefaiqNchblrUF3sI1opqDPMy96hJ63921?=
 =?iso-8859-2?Q?fwCrsx2r6/43A+SYL4Tdb9WZwPv/3Hp8bTrh1+U4yWoi6lgedWlR3jd6E8?=
 =?iso-8859-2?Q?nwwsc3uKvULAFRh2oHo/nyDoHDdBkNUiqzyYO9zq6wbTiM4qMDHXfOOsJJ?=
 =?iso-8859-2?Q?tA9SO4oNbiMGi0iXx9d0kQpLwNmIFfDUmDMPSjKj1xQJs2woEeDZDEoX90?=
 =?iso-8859-2?Q?XzPrQy+5USXc5RmjI+p8PSok6Xa4daoEF69XLxSBMEsB0y+JrSZyqjUAfH?=
 =?iso-8859-2?Q?sV4X0T7q0+/5t31KnOPvzO0gcsST+2scDpaJ8aVQNRFngXD+S6NB5qbkrT?=
 =?iso-8859-2?Q?ElgekcC7AGC+oi8QRl46RGyYU6FOOambmGG/MjApEboZyioM61hsfsTfb9?=
 =?iso-8859-2?Q?gq4wpljq9Uv659Yz5NBBIPKGZTWY5f8wEwNzLqxtJXo3eQy38KUU8zkfOg?=
 =?iso-8859-2?Q?g+OP+ycVSFTIuOl44rby8uP4YtI4kdbMaavPp69m6IzGNFrmT+pIgZyimS?=
 =?iso-8859-2?Q?NLpyWnbXcp4vIqyUhmavl9JTRCRvNZiFdQZV10yVqueKN9676E25T4IBO7?=
 =?iso-8859-2?Q?3W7WHSZQE0P3u2kZTm+eWphSvBSqH6/PF3MghhM54FDIcdEc21H5R/zLaW?=
 =?iso-8859-2?Q?/GbNX2Hwjx9harTBqO9SAgZYAXu8nV8bF2vowyPC/1BX78geJAnkE1h3b1?=
 =?iso-8859-2?Q?cTt8KhBUtEEl56dT6n3eDoKe24aENBqW7EjBXI4duc5gYPtCI5goq3ZIJJ?=
 =?iso-8859-2?Q?mTNhKKDq+1irpKMoX05wZbOQhnXtOJ175CTxm6+7JO9G71LHWMsVetjOth?=
 =?iso-8859-2?Q?IdhzZoAHTFd2PZx9DWOsBiw3tLmk919Fpcw9cZ7DgOWav8DgHKDzvkRkgM?=
 =?iso-8859-2?Q?GIeCKE0+E0rNffhUehhGd49j1k3uTtAycVxVNv3GZkgaSqARFE5LWB+DWE?=
 =?iso-8859-2?Q?C2Q9WpqRZhGnrAFYpkeu2ZxbRbSBpFb7mRbArS9PTIJdOBROuZfDlQaesQ?=
 =?iso-8859-2?Q?p5cDJSh/t+9EWIZNM0otzI/OxdRlg8diXdHgDyb+rwOPNS/5hQdGxNhArX?=
 =?iso-8859-2?Q?92O623kz2x1nHncwKbNUd3RqITt/bFlhp25ORVgBgdjHol8Xfgq2roCgFJ?=
 =?iso-8859-2?Q?ZQtKn+d8HLgY8QJbN19CnTFKn28jltunLvsRQlY1hDZtlKjYPvHswODYM0?=
 =?iso-8859-2?Q?T2vInHN7xiX4btx0NWHMicdAZwAVSqoVxu8+Zd8XFd7QYHQMpXErSMWYCF?=
 =?iso-8859-2?Q?aTGdTZfYrUpIuNDmUGR4Cei3KiCDWa1wsAo2vRA1z+Hdw++Mh6ysazIi3f?=
 =?iso-8859-2?Q?OJYluY7nslHuNy6/XOsFmtJPZrb1Wowa6AAmP8AoGma4CMUmMS3Q8ygVvU?=
 =?iso-8859-2?Q?zaFEobLvqVBV5RBeSQYx1ZzioIA3uGSSQnCZuo8/3EZRvxvX4/7jiDvyxr?=
 =?iso-8859-2?Q?1zSMI4mcaWTCZIn3Jp5C7SP24lIppLHD9vyxvY3Lcnm8I1lLKsnr04RgHj?=
 =?iso-8859-2?Q?k2fk5dkWjvKg3ys9jgw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb6cbf9-e826-4bdd-7fea-08dd30429ce4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 00:14:41.5718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HNFom777/jCDRF/xc3KhcKzT6rJ9lvpUAhHo2T1kmxUKd/CGrHizmBpq6c5UXKyrcm4r4hBLGzpYj40diEhEtoZtwgasG1bhwtZetzWDRyxyk0rY7Bt+JQL3edWkDqR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7143

No driver is using disable_route_checks, let's remove it.

Because snd_soc_dapm_add_routes() itself will indicate detail error
when failed, this patch removes duplicate dev_err() not only
dev_warn() in error case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc.h      |  1 -
 sound/soc/soc-core.c     | 29 ++++-------------------------
 sound/soc/soc-topology.c | 12 ++----------
 3 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4f5d411e3823f..1e09ff0842478 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1118,7 +1118,6 @@ struct snd_soc_card {
 	unsigned int instantiated:1;
 	unsigned int topology_shortname_created:1;
 	unsigned int fully_routed:1;
-	unsigned int disable_route_checks:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
=20
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 710c278e4f36b..ca1db71740510 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1644,19 +1644,8 @@ static int soc_probe_component(struct snd_soc_card *=
card,
 	ret =3D snd_soc_dapm_add_routes(dapm,
 				      component->driver->dapm_routes,
 				      component->driver->num_dapm_routes);
-	if (ret < 0) {
-		if (card->disable_route_checks) {
-			ret =3D 0;
-			dev_info(card->dev,
-				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
-				 __func__);
-		} else {
-			dev_err(card->dev,
-				"%s: snd_soc_dapm_add_routes failed: %d\n",
-				__func__, ret);
-			goto err_probe;
-		}
-	}
+	if (ret < 0)
+		goto err_probe;
=20
 	/* see for_each_card_components */
 	list_add(&component->card_list, &card->component_dev_list);
@@ -2235,18 +2224,8 @@ static int snd_soc_bind_card(struct snd_soc_card *ca=
rd)
=20
 	ret =3D snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
 				      card->num_dapm_routes);
-	if (ret < 0) {
-		if (card->disable_route_checks) {
-			dev_info(card->dev,
-				 "%s: disable_route_checks set, ignoring errors on add_routes\n",
-				 __func__);
-		} else {
-			dev_err(card->dev,
-				 "%s: snd_soc_dapm_add_routes failed: %d\n",
-				 __func__, ret);
-			goto probe_end;
-		}
-	}
+	if (ret < 0)
+		goto probe_end;
=20
 	ret =3D snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
 				      card->num_of_dapm_routes);
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index ae2d6802cce05..9f4da061eff9e 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1101,16 +1101,8 @@ static int soc_tplg_dapm_graph_elems_load(struct soc=
_tplg *tplg,
 		}
=20
 		ret =3D snd_soc_dapm_add_routes(dapm, route, 1);
-		if (ret) {
-			if (dapm->card->disable_route_checks) {
-				ret =3D 0;
-				dev_info(tplg->dev,
-					 "ASoC: disable_route_checks set, ignoring dapm_add_routes errors\n")=
;
-			} else {
-				dev_err(tplg->dev, "ASoC: dapm_add_routes failed: %d\n", ret);
-				break;
-			}
-		}
+		if (ret)
+			break;
 	}
=20
 	return ret;
--=20
2.43.0

