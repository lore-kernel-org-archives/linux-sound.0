Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AC2153FB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821131; cv=fail; b=iFzS+V2fY6BDFD/1cPBXO34LkUl0JMvU8hke2WbfuS17O2u74HqTL5lmdxkhXSg46u5PipReCBUPRP20N6ViMJd/33H8OlekIeG7USyrdL6WPFxpOmBq6+3HUCV5f+PDRb13NYY8QMQeVHmKVyNSnqJbDLH/c/xpqhp/PmqPIwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821131; c=relaxed/simple;
	bh=u2xKVGYX0rMjGWbeYvNomg20lK+myCt4GW/aVQFCM4g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jCH7oGhSBAVdMH6RDsGPAJTDQFa8Nl+R1jck9P6JtfjZzDelP+YtISm+RZOywzbqTP3dEQK4iH9eMh+v20XkAsR2ve169GtF5XECO1PKemkAa+XKhyFy4ILjIgddFcSkN6E7vgFuw335jIwyUxNlAUYIVfuTBIUgMcNr5YqB8zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gjoT26eP; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gjoT26eP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVQV+1R8yimzegp0mP950eZ84uoH0OZDtnvW3KluBnTckRsD2ceYJ5XSXyzg6xInKzWChZasKfSjA4w1m4jiUSn6ovYK3oSjt1hhjdM79BP0dm/y2lCM3ohqggGsVtSd9cBca2vty3TVwhlMC51qQGf4ylP/HcleLqeqgnf8q5yBLNHY/trub4qxNMLaR2GfnSYekA+2H/IJMUdxvdC4KCE2ga6CAWZgbAixUf+P7AEcJcmxxbh4DULot3CCotHdyq7n7DdRISt6YYp4QD3BBRdnE66Kzzt+4j5/rKcmN6wEvkXHCK9oPOOvLr28Qd++jq78KpycgA3xdZ211KF+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyBNwi9FB8jPAhpmEoF3j+506aShEZ0SIvQ5+x3bPF0=;
 b=fz34Jep7U9UxNugvh51BiIaXL8jcy1kVAfUwJ1+c5FRuU7/GoDJkEvVZIikyGQlpYcV7MDjToTtNf1998KARfVhKv+PgFUbyhw4lZxIsTeP+WSBdwJTAUWvfRim6qwGRewQmrFkfiqoTxI3QeYy27ew6myDOSMlQS3+zoXaOably7ee/l2Jb0+LqJ22TpbN57VPyCMf+Xmzq+1Tszm2nHlyXhIraCvWeWhD7Tfsta9PbOvaBig1rRJdbiVhTUPp7Y49EqfN/QT30DQ8jlsG36IyJh3FrkmgiACGE8D08i+YbFhwTmU+/ZI/7O2MqjoQV1s6j8K9UBPytlqeOnLQpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyBNwi9FB8jPAhpmEoF3j+506aShEZ0SIvQ5+x3bPF0=;
 b=gjoT26ePSZMz7BdHbfOXw11ma0jMbps4G6jv3sk/RrVoagjYoq335RRFxqor8AF/MRWXXLkwbx0jNkg8JnoX5GdYLZvKVnmCANqB7bXtk0Cz46wxl6ptmsG6ERULK7fSxfGTl3uQV84nHuJiJ3+FPyDBRwG1QAy+ga98umqZ4mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:07 +0000
Message-ID: <87346lxvcp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 206/292] ASoC: intel: avs: pcm: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:06 +0000
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: a21c2a73-b3cc-41b3-a199-08de20b9be6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Mq7LCsI1qG3jWGJBDaXD6ni40+Qu9LgFUskTFRBz3Nyf9oDQ209RCkBHzrl?=
 =?us-ascii?Q?DlI3jIdZ58sWmsUBH4Ija0ntVm0/FuLRmje6xQAOfZSgsl8s/dUZMasTHqub?=
 =?us-ascii?Q?LJ19Yfi6vYHP+3tFuPnuOkkvII9F3F3oHEVBpH8Z1EBR0I40x7PEZS0KOGXK?=
 =?us-ascii?Q?+pcG2KLnK/2fqiW/6jqJ0J/Z5WqUy1lGHpklth/P1/gEo0SqL0kBQXmE4b4g?=
 =?us-ascii?Q?miQ0ctGyfnU8PJVHIJ6Ywj11h/lw7XwQYEgamyGxC2R8h1UAaGzAHWl73NXj?=
 =?us-ascii?Q?TLk74D3R9A2wDGIIcvpD1vrQtSFanpCdcnYVqEnmz2v0ezLHcFMb15a27zPD?=
 =?us-ascii?Q?Qd189OHs4R+DSNqXnwu5dhUXJTusigQWM5NsDy0llY0AdbrXFrDNXIbz6ifU?=
 =?us-ascii?Q?bhacL9Nh9VUiufugaFAzunjP2eXJg3Ho769fQuuFFlrK8CxQHCHJFncplvGA?=
 =?us-ascii?Q?3OCzTtvk3h6VDOiT+anZlDEntAJSMJqTmihuOxgqAv7rBu/jPijUyhXIvyYz?=
 =?us-ascii?Q?O/pDPhOPVJaLP5ylcsDlZm/YTJpZZ7TCwYBc8eqVlrmR4KIGkZPH1sKdldRj?=
 =?us-ascii?Q?4ghBpxPGCy5TuDfm7raMT161fIFKd1uHzY+8lQAG1DbFFCC8+PtZ2xRPioTw?=
 =?us-ascii?Q?0fuQ26KSgiUqVhWGVYL0JQaiVgdw3mdWodOxOD2G1QhS4n6M++QW2GnBLJiw?=
 =?us-ascii?Q?7noLyRjfzkf19HwPO7n/maYftVYlBbT7B7cogIfGczHuzBLQ3kCNobQIIhhF?=
 =?us-ascii?Q?Qu2aAB8OskYMXrehJ7TTY0g4UnewH5ZWoPrkR15jCLm+0c/p+NNnhBwA7T/C?=
 =?us-ascii?Q?Kkn7+7qV9b4lJ5CRbv/Ba+QxAUQCqP/QNnnO6e76CB7Mv89W19pUCm1t0ve4?=
 =?us-ascii?Q?o5vgE078eUOkSkj4PC2e8GMqq9buquOlNFAUac0v5vf/ySkn8KZdKOKOgkNC?=
 =?us-ascii?Q?RSkSwvfIlhAnR0KIXiksGKKfgS5PRo0aY3+fBChWXF/t+RTCFzpgK6Awg6Kb?=
 =?us-ascii?Q?0VsfWHsDmo9YWvOX4dGDPC7nIr9B/di8vod4yaSg54cvv7Ok7yg9GlfzGb+9?=
 =?us-ascii?Q?WahlYR1vWBeVHsMJkmIVoD5PgDpvuGCGDwONHY0T8MwjSHHpQE5730S0e6ij?=
 =?us-ascii?Q?ZKEsXRbhZM1E3L/PQ82qbGgRCMvvH46OS7jFk5c7Wo+rsSeYP/fEOFQWQIyU?=
 =?us-ascii?Q?Xcsi7xOhffMeLgncNPrxklRXxEF3tUyAUaSIv89MQMa01rFITTMDC0WdmWMn?=
 =?us-ascii?Q?/nBsmhorPU8lzPcpYDZAaApUJcJaAKQNPF3MRinXfjq9gGPQvkjkbd5oAXck?=
 =?us-ascii?Q?EsiHzOgWIKdz5I+3OfmDMBg0YTSZWAbXLrmIf7Gq94UWwMxJtjbMWI8OmoSy?=
 =?us-ascii?Q?BZF8HzE/uDIFGewJ8hX6AidIEmMv1JhV0E6a8Iox8KgyCWnsd+1T4RtHYNyF?=
 =?us-ascii?Q?22Rpnhed29p8umZ/QiVZse1R9tCPt5mURrUHwP4FUmVE1cUOmra66GTvlIgc?=
 =?us-ascii?Q?gmdPzccKaDDpn0kiNGpV2EoYQAfKjme3gIX/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vip0vU3DR+A109y4Ko7Tde7jIQOxWlScUBKzlCLlKvT6rLKLUebPG70gC+a?=
 =?us-ascii?Q?0bi2aVIkHCaCcmiq1JzFMsne1yQo1rQBGk7rJlDdwURGYIMoNomRF+rme3kv?=
 =?us-ascii?Q?cRyQLK6z/Z+eIXFkSgoEi/2vDY3KqGSnKPcvbPDIPiw+w+X7pa4po9sqex5m?=
 =?us-ascii?Q?EwTmT7gAN3mQUFv4Wy+ye004SXwONUpPJY9D4q+b8koQClYOCuQkQvLRMPiG?=
 =?us-ascii?Q?gIRl0YhUPR4wd607xTS9h4xs0nXHzKL5d6NcTa5vMVjtX1oFudteN3GulpWI?=
 =?us-ascii?Q?ZE+Q5cajWXYC3umgA3QeMgtjLpnurOIUIR5/0S140K/P3wS/OjiqjnICkyq6?=
 =?us-ascii?Q?9TCK5KlHE+5IH8az+sp573KtNGCqBOW/7JWMbxvAnnq3MKEOdySw3Izbz+G5?=
 =?us-ascii?Q?hbpRpsLikLU2odV1+OqXZtmC4fICNGuwif5o6lxkzef63MywZLCVxsj9C0DV?=
 =?us-ascii?Q?wgQAGrG15fpRShxDKRQS2MKZzUpBhne3w3S3nAgM2U0qJdO6luHIuwSgh83Y?=
 =?us-ascii?Q?P5Nw9CB0B755USU21b6eDVCwo7Wmqx+AvawUM3SutS/MSk8pbHgQLEN3ejHK?=
 =?us-ascii?Q?NSJDuXMwyFcZ5QwNAvFr5wdoBYIe6H377sIh5O4SDGh4VvapUYPDlRsay68J?=
 =?us-ascii?Q?h1CXawCSa3KG5jnJGyO6UGc+9kRnB6RoplFyYPV8YhKVCc6oJ+XsqEGwoLGQ?=
 =?us-ascii?Q?XTHw66fnQEV9Tfa9Q1BI6CYVhLYcS9nqIoMRESID8j0cu9SkHfSRrk1KhSF6?=
 =?us-ascii?Q?KAVZMEYLVyG/KQEqiK8N3yyHrxvif+MeUj/VKN3OCw63hbdLJwARCrx7fe7R?=
 =?us-ascii?Q?stYrpLiPL81TJm1cKCcX5O5MVRKq7LyygjLNy1u53/QoAdZTpoVZDLcjGusy?=
 =?us-ascii?Q?wuG0f7LT+Ya2LTSZZ4XqumC60C9Km2lTucZOkKqa9CgH+UHG0YJtUUdq+1jr?=
 =?us-ascii?Q?jQyIJwvJ4NJEkS3gxAiDQbQSxcsZyqQnFN8JM17R69s64UNGg5txh+EULFdf?=
 =?us-ascii?Q?LUunazqQAV2Dn2KmbXHs5UUqczEkTvLAAC3o4+3jtR0TNOQiIlqgXtzs1OO3?=
 =?us-ascii?Q?GZIuga1v71D+H2QDGHkwu3VUjfI3OcVVxjLai8LH6gtT8V21vapCa1JR62Dy?=
 =?us-ascii?Q?L9FAhjIm6ObHBLBUSC2RpgQSax2JLjo1HKncN9cj/YXYxbELqTxAtoFmRWAX?=
 =?us-ascii?Q?DWnyI+B4Aj2aTKOIlivgFsOyuyXxAvbBS9ofIf+TcX6j8GdGo1fLYS79kmbZ?=
 =?us-ascii?Q?zKkdD099miBZ0FKkemxsRnb6x7XcnKMy1u+mFrtDnTlOqa8hdME1+G3h+4bF?=
 =?us-ascii?Q?9K3bTDtCmjkYVXpIR2NmPYFIPy0lzvNaA+svf/Z347AV1y2w/cmhHBOzteJi?=
 =?us-ascii?Q?a7p/zjkVZgWDAZayndXJqqptnNuQeM+m8i3Pwma5DzvCAly/3vlaO0Bqu8Ow?=
 =?us-ascii?Q?w9qbrQQlt/AjFIICBvU7G+vKSUF7qzQvCOLAUUxQeaFrLqJKoWkNzl7TJN1q?=
 =?us-ascii?Q?pklBSR9oHw2GfwmhU8IhYKeCUkOsWP8CY1Tp0z7VT4ZDKyPFvi4lEI6X8B+A?=
 =?us-ascii?Q?6yDOiHZzSVxxALheAM2+k1OYvUs/wAkELPT5zgcZUTiWmqGDi6DKYk3nEuEL?=
 =?us-ascii?Q?t9FTPP10zUGSCIt/GhpDi/w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21c2a73-b3cc-41b3-a199-08de20b9be6d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:07.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OztAhp7LYN+HjZ/XnZbI0IGR+L8RLj8GQN0u0mi2d1UyU0jflicw4HhiaWHdZDvWLnA4axIZ6WJovO6bEI7B3/Pn830fo+g6WIqdHkZZv7DsA+A6csMpjlkVdPjye0DX
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
 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 80c001120cdd9..4a6deb599c880 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1624,7 +1624,7 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	cname = dev_name(&codec->core.dev);
-	dapm = snd_soc_component_get_dapm(component);
+	dapm = snd_soc_component_to_dapm(component);
 	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
 
 	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
-- 
2.43.0

