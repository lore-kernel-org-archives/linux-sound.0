Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141E3081CE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415653; cv=fail; b=T5CnLNqD54AXSCGSoFG5xNqSvuWvJyXpf5mYvUS6nPPvo3pVUjeimzUJV9U/2qtZVDUyflHIpUWnRwpBLLY33WJKkCIzjxnWcPtD8nREun4XtTWs0WKmADRk+hKubUw0hsrvX9kMdBiqIUSbdKVDpboIGAeSJaG/QW7B12EEfOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415653; c=relaxed/simple;
	bh=hg+CGTNMv7vF/nmO0VoSGfwaaqBeb6lGf6uVSJDoVro=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WQZ8fpt0cxtQhwSefgOiMqm48v50x4oj6s0uSo2C3Kol7dDUEzyV0/Reyq16ynrHfPKKplCQDy1b854Shx45AZfldQTuVnpDP0DWVPN5MgEG808OnF2NEhwXkDbGXfHuUr+6QQg1PnQqiif37iFP2v6DBuBerMhFm2IayYFibtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z++tlCyO; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z++tlCyO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7hZJRexqXAr/T57YdCsYzuCLtnfUm2T5v5HP8yeYvWMTtmvebDdA0ivi4PQCKdNGdnYcc8md3MkKTr2o9keTxHNuwn/GeY7QQeWUbQxVScBqoLI6oUKonMbuWdX3xoFwsANAG2Hfnxw0tHL31xuTLTf8WGNZJKNgs7FkRyyiDsy2fJNFarDOxQ23fHu8OGM0hwB8/jMW26JvmWBE01sizmXx/+mDHfBe7FeHLE03lxS3zIqnP/XfQ/xrvfi7Mjmsgk0z5PJ/qmZDS1VLSlDJSPUbUTwxV7XyU2bIEDroMJVE+xLpgDr55FYeBsHBiuppumDAt1yf4r/tJXmGtwyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZqgBGWiBP7g10T9Pm3WfuXVi0gVjVT041CGpcvS1LY=;
 b=io21oyCa6Y70UWhimRV6kKtOlqVGMck9QkrnNRXuZ3kjtI2TrwgwtnGsmtf4m7KhmmmvWvLP/2IX1JvtPMn1SHYKnbcsVA8pyoJ+/blovfZu8b7k4z2vOQcq1aKKTi7RASjep9900VSvQP9FKM0HXRwyQBnG+j1R+pittyPx06IubTzLf5X9IlMjYALw8DCSn3r4bTXd/kkrT8gVQuOFaMTk/xVVrgrVQ4r2NVMQGKvy8zoRRUuMVdk3+hCcMXnWx1VIlvQVeWNN9IA8hJiUd2mT17FQ7AeslwAeE0guhs7t3TJg18WIiJQDIPbtdkvQkOC5D9stOzcXyQiyd+ACcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZqgBGWiBP7g10T9Pm3WfuXVi0gVjVT041CGpcvS1LY=;
 b=Z++tlCyOafJqk6FVaozzuuikYXIvKZJ5GRafsrLflkJSb8VuOCj/tm6TAJX/YX58h5yJFfz9UxJQXNTvTDQ0Aw4+1naI0AptVFEp9OPDGnd36AtmWwdkfPDitxtY7Ik8Gm09BKbiPaAqNYhBHPnLSQKJVl3JH6Q7+QDSx6ZcpkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:50 +0000
Message-ID: <87zf9uru5a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 022/139] ASoC: codecs: cs4271: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:49 +0000
X-ClientProxiedBy: TYCP301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: 3803b405-6ad9-4d0c-4462-08de0ad90e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zh54QIbk6NOX1AFrC/+phcflQzUx464xcjYGgZhtMX8yeiB8pszbuc+ruCWg?=
 =?us-ascii?Q?pOTPfWktoFLTFc3aogvTzpWgEgSelW+3bm5kjBYuEM9BZSAYMBBfTPASi1/J?=
 =?us-ascii?Q?LjyxIQtTYeSyevMgMtod+PFZGZeLKPLhPyHsD4R25DvjDU3ratd6qrJYpvFd?=
 =?us-ascii?Q?PHRhhMHaCOq2GauNlgVV7rr1je45mAnf27xTm3ZecMZPNZF/jpMTXTZIVyrH?=
 =?us-ascii?Q?rkwcl87HttY9+kEAm48hWEtCnJockYx13SSAkr+2WmumhXUXuwBjnwJMrSZv?=
 =?us-ascii?Q?VgOPWtPRIQtlpjgxYTtS3PwyG8UFvf4eG8iXchE45AUzFBQa3liOscz/hPRi?=
 =?us-ascii?Q?fPm6t2SroJd6ai05/IP5KlvkQXrpLpH97V3p9Ea2oAolx6TR869FJUFMEIaB?=
 =?us-ascii?Q?JnMMxkfAh+eWssbUfqXu/+G8rpPDQrNJNsCHxIRAmFj/bYP83cGt1n9FNycF?=
 =?us-ascii?Q?R3t9WSQFIJhrW0DZ96bVxKWKMuDWNsFNvFQ5YLwm1njL/LqyK5wtDatSC0zF?=
 =?us-ascii?Q?R0yVRrzSsT1Vja0vckbR6UrWUIxlbK93yCNm4bhAZoA09gpkamp1vFRCkTnl?=
 =?us-ascii?Q?FaTadJuZC6qA/GuVocjOjywH9vxcbJbFuasNHTvLY91/ZuEN/pfWpnr/E3uN?=
 =?us-ascii?Q?pKqBDWiAW6LFcn3V6I+8esAZJwGzG3VaKwTKhIiqdw6sVYUBTJ2ZZHqr2T68?=
 =?us-ascii?Q?/ENEAgdDD/G9TL/2Jg9T4rBOe2U++64QQZaigH1uOQVrjDbu5/9YXKpxPI/r?=
 =?us-ascii?Q?AubbuUxAgp57bVTsb+qOIa9GVcdwc9kuwZaqtIhpqRxRSm4dJPoNr3W1FEHt?=
 =?us-ascii?Q?ADB6KkLDSd6Wp5wXFeoNNDoONwKyFNk42WH5kUdgPOrVLVUgmtkf3bmNKLWD?=
 =?us-ascii?Q?+9neRVkuEg+gxUGY2y0FuQoi3wFkLvBMwZxoGy9/bE/jT5v/UC2Y27FW+djm?=
 =?us-ascii?Q?EUfaSOzwP35OfKzvNjSlK7udDPpWR2Eu5H3/e9mwNmHkVjxGwpw3OFjzgNf6?=
 =?us-ascii?Q?b+xrZkFwIbUT5E7ftk/QkBhgDuWFVhAEDfedd3WxWJURpCVNG5QITCMb+50i?=
 =?us-ascii?Q?SeY4j1IzeurOgM8s0ikNlythZOxINFo+1R7/GD/2BTCUvWrybiy+1EXQ6vu2?=
 =?us-ascii?Q?y9I6JQDivXMi3uPoULxwiMs7vF3eoiFR7sH+cktq1u4Nbf20MCT9WiAJly0c?=
 =?us-ascii?Q?srWki1fG0tAK7GaVKMOfJNGoFbe8MEEehebljC8elQvJt9p91aW30NK25cTa?=
 =?us-ascii?Q?JPqCBS8MxWELkoHaaxObvwuDgOsM9T0itlyNS5EKTrLnChzXZQ8s64uR9YOq?=
 =?us-ascii?Q?rwS/ndY7r+gVS1uT76lpJi9fhBBIQXUwXf8cY2nwHd9bEqSiceM0YP1WM3Kx?=
 =?us-ascii?Q?RStPZTs682JqajQxdzinje6hXBSN/f4St+2DlBu9gxfZEJcBDy2/HycCAsIK?=
 =?us-ascii?Q?tt6JjyIyj76eHPmibq42S4lZebR6hs6vduS+b6+3H0CjNFXe5OJhxB8pqw6z?=
 =?us-ascii?Q?FDlnkzOVuaFbFpAslGyk5PrdLw4RmSPbwe9r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7UaF1IWWyP0nf4CMMQFBDT/7644A9EAScI2Z+toEZlcdZg9akTZ/E3AmvpGj?=
 =?us-ascii?Q?FcbV7gJdlNNmB5gUZXQ5+awEkp1TJ+EAK8pcrgo2XfY/E3ryiyKCOyu5OZe6?=
 =?us-ascii?Q?5DedJ+oiW+LCI3jNZc6pDNWoJ+b5nS9TULg8Kb8KJRbzoh+umhnhhRHUO8TF?=
 =?us-ascii?Q?1s+rTaRmO6F6sLs2Ykg0Kl9pJr7eHrdTIb+U/SVi8d6OiwxGe+TL0eb/SrDk?=
 =?us-ascii?Q?/aqd8nAD6k4+2mS6fZYvnP22ivQaiFqQI3Me+bt+i5CE9AZOY0Rf4mP1Txs6?=
 =?us-ascii?Q?w9r7AKpyBtOIEaThc5RKJOarZFjko/Kw0c4U9TZPwMky+kprsWNya+v7HCJp?=
 =?us-ascii?Q?WQ85+WwGC4WHLBPmG+0RciPhzJPPg44OM+UDJWUyQFJAAO+TtjiK8XNkjmVD?=
 =?us-ascii?Q?XDVza9F7y+K5oM6eCt/4AFpJSo3XB3i2YlLkXhqy9APYbV3GAttTVlM5SRwl?=
 =?us-ascii?Q?ipO+kP4EhAD4o2CHezEVViNZyfP4RIZrYtsJbHMDJYpiYfgnHU/f8fhg9X9y?=
 =?us-ascii?Q?RVxX5c+OwKektdSZnaAjbx8Cj81H7RBvdwf1Q4oFehA+PDMuEL6LTMYpCm7q?=
 =?us-ascii?Q?MCE2rNy4bcnpL29J2AacDx2Yo1Z53n3UjbjcglPTUgyR0zIBG0ENDKd1QLmx?=
 =?us-ascii?Q?Kp1GC/2Mh7I2U0nJ1iixMzZ7CF1slwvcr22P56kP+xsoNg62ECJwTTVTvCjJ?=
 =?us-ascii?Q?lusf9/hvwsGzjoImavYOJaVzQMksJ755QpCbK++BhXjeI4aAR6GO7FgVprqR?=
 =?us-ascii?Q?+QgJ0yPrRxrd76nDSDh2rJXgN4wS11FjcM+U1z0kJCuN9YdAf+32qtKZ9yaf?=
 =?us-ascii?Q?Dj1yFBoDtE+npZoFQFlfmoVJmtdj/7om8Oyaow3qS5rHlheUBvRKWzGzA7XZ?=
 =?us-ascii?Q?lIrNh43oxnB0y/q5n6dA/0hpc3xIQjh2echdpeRSDu0Vkq1WYdoJLjNR9J5H?=
 =?us-ascii?Q?tzX/M8m9FWoSdUQ/tYocvqty2rS/QK0yhMglpTonilL0faSTJ4TUdvgUUnVT?=
 =?us-ascii?Q?H68Oba0uBDbJWnHlO8EoQyNccYTM8JsWoMTW1GPDMeIHigqPQnHw4uFpd5Ai?=
 =?us-ascii?Q?6z66jr/dEkPtDQmnZ5OyV1gKHj0vHXAvVvPBUhdFtz5zMXIW7wfXBRxPVndY?=
 =?us-ascii?Q?bZBAp7Y3eQ0oaeFFXRn1hdO5r9zTcERptvDrcZIOAGpUIg0ZMXyq1TPCjgSH?=
 =?us-ascii?Q?exhEptpc14oMAjet2yXUk6Tm0yHelIfNo/QjFm4tOxCSVYW1n2TLP/ZcVi05?=
 =?us-ascii?Q?3MTkKUJ2+qpzqfhsHS2g5zjW1lJOctPoiNvO++EDpy1HWCD7eiPLx3Vgxrhh?=
 =?us-ascii?Q?Cw2+rcJVPIEiB5V1WENEh/DU/Eb3Y4TRGji+4z9p8PdJcaCrp8OjfFIr0BWv?=
 =?us-ascii?Q?JcwjUttEnljRTYiZm3y/EFdiSEon7A4vkP8gVkLrtkGD9yChdDymTeKlLxjU?=
 =?us-ascii?Q?StDMDCOCjKFxBwzilJIdD0oco42EDzXAjiEdDPbQufdyX2PHZ5TGHQSHnJzI?=
 =?us-ascii?Q?xiCRZqlWj3dPS6rbRv5Ge9Z7UyYesSfDjyxN/ScQRq47pusLmoWZWKqETCaj?=
 =?us-ascii?Q?OfOUI8PeAU+WmwAXKDVAFxCcqr3UelzGmT8i0H8ZcR9pReGwW8arbU05xL1x?=
 =?us-ascii?Q?/zXPsId4PQU33WsRbFJvsmg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3803b405-6ad9-4d0c-4462-08de0ad90e68
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:50.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG3flRY7lWTs1TbPIJkNduhqelsZK6oEZwZEIbwnGi8t7HTANHAWOwiW8YNL455v4SUlMb176vFeOuLnxqxca6vPFTQVIaC9zFv6PD6RoEntPWvfJX+gZ4UGAI0XOPCN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995

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
 sound/soc/codecs/cs4271.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 6a3cca3d26c7e..0ed73ba3625c9 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -276,7 +276,7 @@ static int cs4271_set_deemph(struct snd_soc_component *component)
 static int cs4271_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = cs4271->deemph;
@@ -286,7 +286,7 @@ static int cs4271_get_deemph(struct snd_kcontrol *kcontrol,
 static int cs4271_put_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 
 	cs4271->deemph = ucontrol->value.integer.value[0];
-- 
2.43.0

