Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB42288C6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415737; cv=fail; b=S3nq6GwdpJeWdCDdkp/CkQPRRDnL+JoJ2XdTTL3VYjeKq+zo+ACpFIODtf29MUWXq1EvKzF4TIMm9y+4bqWPXzfqN4vMwRl6+T16bJo5huEiu653n3nb5Gr+fJ0yN0cMCFY3YdxwgrsH5DqIRHEh5OnHdQla9VlbyQPhiad7aIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415737; c=relaxed/simple;
	bh=Lg3/PBmgx9nXjhfLt81+r+SxPEWS6m0TaLRithFlyOw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BluIWvBW2H3TsFWqamvD6h2nBa0OcVrjj2gMgoO+Xl9GeJ3v7G5PLJiBz9GHYcBWEBiuullZ20YTvJtS3n+5j6XAktRXb9B+wkEqcTSPJB3tLTrczbfUAnlB/ErGig5ouGbRlWG7w7OGSqE2xKKXK8ZbMED/VRyRS7S0iHYofiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eENVpasp; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eENVpasp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGXft8Qe+WhNQZ9t9448Mqe/dtC8AWlPWtN+SGAw0SH8UH1Q+859i/8hsErwjnHJjGvgNAOZwYLKxbUKGv7jIck3kOVtJ0tn5gGrFtqpo0ktKx7sAEC0MzyySoskH/czHufBWzNXy47cJOIEfd5YKCsCn/qQK8qS9MWLadMlSB0Xj9J4jQ5pidHo2VuTcukPlHuCn7JV2uNdIbd+iGSEwZ7e/MoxvNo0wGPnBLCq/e+4H+3YXXZgb1k4DaNA5+5NKL0i6+rhjP3bl4UKevg7+YX8tL1z+8jCWweT8JLgxUTrnwCaudnP1eyZ9y3uxliS6y9WAJJJ21+b7c/9nIwk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efK/7WnLRkGAfVZpOd0MF4BofI3HLd6ZCaUyBmdD/Xw=;
 b=vvwwRgdV0E6eKTsFvaxaPS1rW7XJKSUx3Cksz+jex8RFnq52nEWUVkAAwmQcezwdQJZ2Si1ZBGH2DMY9WzimVpd45Oj/TPkuZLhG+uBZbV4bVmY2Mio0mpOlZFhxzadJormwCGx6gNJ9bbil2RI+B5VOKuvYal1lhxg8m+5u0N0JzjGG6DgzOeDNUnybvOKn7p+NB/kcP6rsxCN7OdtbU10Ws5xj8MDvbi9wzPRcB60yauU3R2GF+Gw4Xit/4I1BC+dXzzEXOMpDl9erl+yKkH0D17izOXUKcTyR8WgBA/LVxrYc0kV83jvBkqiCKKj/7NV4+xNrA7pdiLPDijDPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efK/7WnLRkGAfVZpOd0MF4BofI3HLd6ZCaUyBmdD/Xw=;
 b=eENVpasp+E0xOXN20b9Gt8zthbnL1CTZySs0RjRyBvcGDX2q6MMipRoLwa2nTZPUaP5auIOFd+BfinDpEzwkZV3gU41iEO8S+Gb+X/0djImHpw3Ak72CUSqbvX/R4XWCTI1468xEOGlfkvacGvwyAaHs+1b3ayFggz29MrRgzMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:10 +0000
Message-ID: <875xciru31.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 043/139] ASoC: codecs: lpass-wsa-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:10 +0000
X-ClientProxiedBy: TYCP286CA0197.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d33872-54f9-463f-944a-08de0ad93e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jTytX67nhP7rZjJgYZ+vCENOnFKlgZJWZ5LU4esrYppFAmIjP4Pp6VWxpAE/?=
 =?us-ascii?Q?B4ggRquEITsMvvug6UHrKvXMke9xCxF60I2BaXwf7JQFMeLK/+Du2KTiiEKE?=
 =?us-ascii?Q?Jt97vj08VBvAYJqgq7a5u/xeRaZ2yFSxBmT55jZz9AopMdKALmLYMdG5Pow1?=
 =?us-ascii?Q?AGAKT+Kq1V2A5QljHO7Q5w8HdNMhS4ZY5oRp25LiFHvZh+41h/d+m0fQxp9A?=
 =?us-ascii?Q?0mex+cNdOfkWUdj5b5CTyaHPNgkdl7rfhiW+XdTrEy6MEcLyokSFPPl2lBkd?=
 =?us-ascii?Q?ZSDCmrIHyoYDcNXI1mvK0rzcMT9tRWTVk/bYVWC36CyBgWVqlXbsfIXQaZOw?=
 =?us-ascii?Q?qwxUoAVYlngH1SP3ro5RJxRUjCSFAgVsLENEEsIFY1eV8nwEiIkAliwvzUlf?=
 =?us-ascii?Q?ukFShthEFO1KOGxoO/f4Kve6A95q84ZGEL+hk6pU6RfIVNsdt7P+PsiI0tRQ?=
 =?us-ascii?Q?NBe2scpbjkDUKjjJav3ivJ/4mA45YkkeHhBhghoYsHTLG0QlYAmAu9eRHwen?=
 =?us-ascii?Q?562D5TEeKeJfOdynEtvY/qKFC2ASsKqrCnWO5j6yaavFa81AVNM1580veiuX?=
 =?us-ascii?Q?0FwJHT1wNRKrEQ/akNmA7KUqWnY8KL8d7yk/Lix4nfDzDMHGyYujbJCHjCSh?=
 =?us-ascii?Q?feemvq+KXZfLDBdMOwze99falfwjHmmID741ZXNvyyh3M+rMKuG6XbfYFT0P?=
 =?us-ascii?Q?7Z2tDsmJHWf6qKOa6s2rHMArDRr0Il8ZigweF/aTJ8+NIJowqoAKAX8G4FAL?=
 =?us-ascii?Q?Roth4J9qSdrQNSiSs4q7ly+O1siwKWHEAsG7KJGo0ub+s2H8huXeeSasPP4J?=
 =?us-ascii?Q?jWGkgtV7EKBoODrKYr7o4e5YAK68gBmmkwIJf8snX/QJLqGZsGJKD9jsN09c?=
 =?us-ascii?Q?H6XT7eHpdT6yxn1IkdbHCEReRQfZ5wST8jIiiRLywWHXNjfDxMskSQq7dFol?=
 =?us-ascii?Q?WXynZOfItpfpExm5WIcEp9+IsW3MjPXbBekap5aYDTOC8rCHlTim1aekVKuC?=
 =?us-ascii?Q?IiaNuexN6ABst8enA2kPQOR3Z+ti2xUmP7iyBhrhuxzeqGlPnYwmGlo7nkCV?=
 =?us-ascii?Q?uv8tpG6+PJz7tq6Mahzx2pTs86PMVczeWZX7W5VkmJWsVOUsLU/mSzOnUtV9?=
 =?us-ascii?Q?ViHX5mkj63ctLkgHOWiDSOe6Y2gnqtVvtvHZDVotaDH+4XTbSonaOIEUpsEv?=
 =?us-ascii?Q?Ago9mfsC6QnzYtSO5cB3IfgLD7NC+l73phwDQkH8R/EP5DaEu8azJupNmddx?=
 =?us-ascii?Q?JAjyFfyI9ZqXY1uG/gipW10txRDrKCaaMfg3ZFjMcN0ECd88JE3OAvm19QpF?=
 =?us-ascii?Q?G43DORz9fglc6oYIV+VKz4WlULyDPImRWzqQoo1jeOHpAtiLHX5Ue0oFQTwc?=
 =?us-ascii?Q?ZMl2lvlS9iMidRgAWs941w4IvQxlB6+SjP5IREzOuVVGg7qmuCcCQTZPlQ8p?=
 =?us-ascii?Q?2z6a5UJuDSGm/QGxm81joanPQJ2FDeMrfkkMjvF2st/2m+JVbJlxK7vTnI3X?=
 =?us-ascii?Q?tOWJjLXUQS/6tMFFAb0C1pM2t29DbVQxblEv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WnEYm4VhIYRVpsiKA76d3wsnDBnQxD87M8PpLKimDOpa7f2JPYMHT1KI+dWh?=
 =?us-ascii?Q?4xaJZU2kXzOffNgvY5wu06XWU8dRN8b0z1b8YM3hI5sVJ0uYSnRrKg80iqFz?=
 =?us-ascii?Q?dTDknSxlnJPeahiKPpuSJujCfvT+o03V+QQ86ynhrhW995aQLQ4uX1Yo0OeQ?=
 =?us-ascii?Q?JblIkaE/w/fcSNvgcEt+tJwFkaYZYz4z186JkwZdDUxG07knp4qVyiBMhyRw?=
 =?us-ascii?Q?VdH7h7xSPgH9RzQifiXvFbYa//3AAYRG3SYKXgGOmrnHT0zDxaph8EFpN4Mb?=
 =?us-ascii?Q?VzngrBsL06bKRCvKrv9iuQLXmiPXS+LkLdIARZK2FxaRFD+qUZn9Xu82CMb8?=
 =?us-ascii?Q?2dXZqcIoAy016Nrq02SLoSC4rcZk5JH5WRTeGy010iEPqXMUDe0fhWyQlvgF?=
 =?us-ascii?Q?HGKrDx9yGvrnK/inMF20BtgUjeI+wKb7FUbl1lR7IXz0VtBvSFgKVqQOcLfA?=
 =?us-ascii?Q?WRgOgu0IqN0VwJ1FbhjUo9J4Fl9WsT01Q+5batv27luOGP0JpC5ySEgT+zc/?=
 =?us-ascii?Q?J2biVc5VJPc6E6O4pmH4O2daQGkdYs4glVNiCBkZGvdIAfoRTTmuxXVQ1wp4?=
 =?us-ascii?Q?ZISYYN+1iggUx6RZF/p1M/jP+geU7w/d7io2HkSVJwVpJLZQEnsyR0xZ1xz7?=
 =?us-ascii?Q?zVWPl0lVQSs2lQ3A2cIRHb9OfOzf5mcbbcSerAvBSPqzuXtuvkFx0VVLIlgJ?=
 =?us-ascii?Q?eJNqhHJyF13ews5GTk2o0pnItPfZ+Si+d6mYb/hOdciCutK5DYhB733u2TP3?=
 =?us-ascii?Q?YaEccL/77Kj5SO+bd5SQlFJDQbiNiG352gYXB86e5hU625lyU8k1Yt9zUHVS?=
 =?us-ascii?Q?XBjfamPx7jxorC29tDi0mRct6z6Npl5lmBl4R6uHpzCLpN4HWJXBPeIkbmvn?=
 =?us-ascii?Q?AwuS6oUdg1CMxP3fuqxE3L5jKfOwGWubsLI7aFadHmg8365sp8awfblgAGM8?=
 =?us-ascii?Q?7QSxco1pLhO5dZ1TE8xIQKZqiUAFVlJPyUV8e2WA7dXnvTvB5VrO3PjB0pWF?=
 =?us-ascii?Q?qnXkWb9xGfEKkB1NtBY/AiPK02ZpnDRiZGUf3YAXEhcLlfsW1gn6g+jgdOe9?=
 =?us-ascii?Q?+Aj4+zdzkkfI0L3yZR+f4VO/nF9KZgKNE0bzag5sefBjadyQolTIu1tXfY2Y?=
 =?us-ascii?Q?QTDhVUqBwThdOId3P+ZHvoRggWH92wzt/uTM4kDN8oHD6h8oN4aa/u0D4/Lj?=
 =?us-ascii?Q?8HjvmoK5GF5wZ0Rjzib3PZlr6G51Uo4POXMTRoBSc5oLIhrQw51/fw0/9FKl?=
 =?us-ascii?Q?jyzXWHpD5A23Z6UXC28mnclidnGdEv5ul0GWRys4c/Zpe07SPZvIeBBE9xHV?=
 =?us-ascii?Q?XOQ94uR5UeyYC8uLq49TzUeHheTTBJ6rPKQm+sjF1YizD6GdcuXb4TBjv91f?=
 =?us-ascii?Q?HI8LSd5gVkYvKHVwAguB8YlOflCeyGTjUmipVBgtQgF10QWzSePnMkOMy+XJ?=
 =?us-ascii?Q?qnxf4Il6QecBnQ7qlGSDgERSrksxXUqAjnozm1SC+vh9oYxhVy20Jlrkop2S?=
 =?us-ascii?Q?hLDk0TtviWapqfto/qRtmmvFMHrc94AvIlg1ZZCLEgoHR0HDsAuemqDFD40Q?=
 =?us-ascii?Q?wLf/eyRsG1YQvvFpR2bYGwtVcpMHbVgjBaJ6+KbSTS2gsS59Cb7i9Ud3v4Gx?=
 =?us-ascii?Q?NEW1VwzagIede4wl5AgRJHE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d33872-54f9-463f-944a-08de0ad93e7d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:10.7138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3/OmfROlX7q5DX1mqkgx1rjOjsRjjBSQ5eye4Fh98FeKy9yJRePtnZ83BOugsJEZrHRlvzEaAlwWpRqxpsAMr+EGDZWvbu8/9orEZnF/OXVNECl7twZwHpfMcVq1bsC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 38faa9074ca3e..cc0488965654d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2114,7 +2114,7 @@ static int wsa_macro_get_ec_hq(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ec_tx = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
@@ -2126,7 +2126,7 @@ static int wsa_macro_get_ec_hq(struct snd_kcontrol *kcontrol,
 static int wsa_macro_set_ec_hq(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ec_tx = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
 	int value = ucontrol->value.integer.value[0];
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -2140,7 +2140,7 @@ static int wsa_macro_get_compander(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int comp = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
@@ -2151,7 +2151,7 @@ static int wsa_macro_get_compander(struct snd_kcontrol *kcontrol,
 static int wsa_macro_set_compander(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int comp = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
 	int value = ucontrol->value.integer.value[0];
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -2164,7 +2164,7 @@ static int wsa_macro_set_compander(struct snd_kcontrol *kcontrol,
 static int wsa_macro_ear_spkr_pa_gain_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wsa->ear_spkr_gain;
@@ -2175,7 +2175,7 @@ static int wsa_macro_ear_spkr_pa_gain_get(struct snd_kcontrol *kcontrol,
 static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
 	wsa->ear_spkr_gain =  ucontrol->value.integer.value[0];
@@ -2259,7 +2259,7 @@ static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 static int wsa_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int path = ((struct soc_mixer_control *)kcontrol->private_value)->shift;
 
@@ -2271,7 +2271,7 @@ static int wsa_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
 static int wsa_macro_soft_clip_enable_put(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int path = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
 
-- 
2.43.0

