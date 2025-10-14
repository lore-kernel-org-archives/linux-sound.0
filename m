Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A2D309EF8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415856; cv=fail; b=g3L/Umd6drUB1s13Pnjr4kiyG1O/V8Ku+eycJFJBa01RzQVaT7wa5n2ngWCagOG7h686dwk57gVbShrV/iP015Fx/ck6+j29t4DM2B6hPMmlguJDth7fyBvndPRKv5fmUjWmMWNBIsCyiN3m/4avLam4ZDmUG8t8Giu5g9Qh+88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415856; c=relaxed/simple;
	bh=BV4c8J2Yd/jffXqxunGqgRLF0q1iQM03M52y3DxyyJk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Nk0Fq3n8+0IZvIBoQpIS7ibsUFGIm7HeMiU0e/XRclWtCC7ljTHWDBz21J9SttYlTwwClamSA4p6jYvOexTz33vFS4RsWndvRc+1C4ODz8xcVaQQzL8wCnHJlPQGeGjyBU0g16taLx5GfTbtpjveNbx84R1j6WK1W8m59yaLEjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DU931zlS; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DU931zlS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBIqzNlVNfg59qnk3jZWnfy5JvaWFQar7e0sypwb3c2r1/iuKsLwkiNlbbOQUCRkb+fsAIv9pw00fu+4nb08cuAR536pnev34w/EwLOofNayM/XYud1kOJnrrJmofqr81gLI8Ik2Jd9l8HMrOt8eqyToW89E06jasCdmGNr2ZrzS0EwfcWoxfVFKX1dmMsPg592+fuwxzdNWofgs+XkvalUu226ZbSo4jhJSwzQXwgSdnLzBS6pD8AKl2qK4RBVzdU/uezlPG2Nk/7kNBO3ukbFyU+ZTaa9wWy3tZ8n7+4n7yZ9RRkTFWmrnMWRX+BgSx19CqgIbEHjbtSwaPP3l6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezE4DSSJwYyN2fK5J+lvfYJ90VuMzXbsKn4j4uiFAls=;
 b=yCSbM5HMDkbyCGuTBJa9lKuUabzWmcwp2/yKOiIYv5RVD/SLiYldWMwNpyVBRpu8TwXYGkYqh9F00/ho9EJUwY9yk+kLPiRD3gVtU0yzWxyER5lHc92tv8vII2Nt3HBqf485T7jNCkwiTK19cE7f8cjnM2sOptoK/PvnhBx4VyNAedcBNW8bLtId9Dyf4ucdlqVjzodBMyB8ql50SCRQ3Vwh1Yl5yo2C56U7YpZwY8NLiGYjHdiX4nvVEEZ1zuH5mXKuRf+uJP9KZ1Ol53vGIEcfZ2muloF8ABIl06KzBhlpBEWzv2HGUMVUDJmzg1EqyjxsiK9JiSsRO498ql/bbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezE4DSSJwYyN2fK5J+lvfYJ90VuMzXbsKn4j4uiFAls=;
 b=DU931zlSdDZDStxDARICbI2i6LF4Y/1KJc3hHgVHoIDWGriO5i5Jys6W+6bCPnEBzEz1pvNE4EDTRji3B17mnsIZkDWVlGa2GY1n7cOkFGcleR14Qr9iRcrzESBcnpXYuIBDBnBLTH3ZFUYqRZ6Q68fGJtJgpjtLH32WLIqkJhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:11 +0000
Message-ID: <87v7kip0us.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 075/139] ASoC: codecs: sma1303: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:11 +0000
X-ClientProxiedBy: TYCP286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cae2505-894d-40c5-d5ea-08de0ad9868d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dw8kYAUrkB79aKPZyE9UUdGn3zQLjdPT0SuymfzFxJp9zG2hVjnV48GJYYBa?=
 =?us-ascii?Q?SkhlamZn/fVVi+A6GvQxHGr0sZjvLdrAcJ0umkDDIF4P+AFtoWAKpvJkjAhQ?=
 =?us-ascii?Q?0XmEOXdGegf4j6PAWV9dM86wB/8ASJjMLCM84RWAu6ypB4HdTZuqwnl1PJLo?=
 =?us-ascii?Q?3zbR2cnkfV+XJz4i3zXnDW/sYCxZn5RfyEheY7KxtxSc2572pp63fpsrG+Z4?=
 =?us-ascii?Q?ZfMsnpCS6MJn31v8TOoH1QKtWPdxKfBLavLqxxkaDDyegQEogOokwgB2iOxz?=
 =?us-ascii?Q?IfIx4FW6tR5uxUqgR9kmGTs2pS8SSj/Cmhwe/y6uzmKTRCRmQzy0R4fkk9FI?=
 =?us-ascii?Q?KlHjSRwIW/itbKaWv8q5WPobW5nuWLlzcxSVCpIPQBcHd6G2VwhBhUzCTusf?=
 =?us-ascii?Q?5SRC3V2g9xLbmK0tiXARWeQMBsUrmusOP0YdpEKp90lZT1nla6+Jq+BWbKjy?=
 =?us-ascii?Q?LpNRzz65IwXkls5fnd7VVlrmSAc3Oepf8lnUo4ZBg4w9app+6zakcpAziSoD?=
 =?us-ascii?Q?slq0dmxq4qmstgVfLZfzY7WBX1iQnWViKv2P6e+xkQyEpoKTxfTaIT7kUdk5?=
 =?us-ascii?Q?Llz7o/yofbBAILRzlBTaXUkMPn4G0YNTTGsnwuKyhLQG3z0N/4TfbrCYY55K?=
 =?us-ascii?Q?92ckmlFhKQUh8h0tnMHjYuTWnBGoe3iYxhdOPC0VhCoPKiu1nVt6EpSPi0d+?=
 =?us-ascii?Q?ID5yq96Q1K2G6iv8BSTtK4h/SDHlGRoObhQWqp/wk0D3Pt9vhV6DKdjh2Te3?=
 =?us-ascii?Q?mx987gT0amgUy7/nykUgVv/oXRnKy7QRAZvesgzAUeWLC8W+1yra1bMnBv69?=
 =?us-ascii?Q?ycgO/HmdO9sv27NJgxQ6qyngMwsuAWveBGz9OLksKaN/fFjun4gSApko9sfR?=
 =?us-ascii?Q?/3a0y8oAWMlnAiFBrRkWq0M0n5rJLJbaIUyUITm7hF7lc99mcvME2G2JoUSO?=
 =?us-ascii?Q?+pUWaDx/CcIBugGCq6fbesY7vTnG/8IgWkyctBAXRabixvAbkM1ruJckjyih?=
 =?us-ascii?Q?HUv37K4swkqY92nebIGAP6AKhhSsnX0fnCZRnEU4j3J9ATlln7C0RawgcB7e?=
 =?us-ascii?Q?hNDf3seOc0beo8IHa7DbgdZs2VRe8DrzAZPgALy+mcf+cB89fpGkg88ImQBM?=
 =?us-ascii?Q?tVoFQ0d4QJ4VDQ/4mIy1FrLT+Au19EK+Po6VCvSPMOz2BSgynOiKWEQi/YaY?=
 =?us-ascii?Q?uBZ25gSy/VPnyiKGtohBUHIWZeqZCE46fRtFW1PsdUtAxTYvHpi+lwcpntFd?=
 =?us-ascii?Q?E05nfZ6bAU9KbdXEwURWCH+6umw9d25P3WCHg0kDpy0lQt2PJjZXe2GwxWBA?=
 =?us-ascii?Q?kPfvOsEm+djwbRkYYh0CyddPbh4L82IW6+UzwED6hK6H0i/vv0Nhjms2hN+N?=
 =?us-ascii?Q?GRlGD8OIm1JLMTP1z7i//p+0xv7+Qw1uR5J48MvVOoc2Sfnw3AWVF6+7OdYm?=
 =?us-ascii?Q?OGrMAeKXt3KB8CYpng/bMaNzpoFxrz7haRRrGMgNSbgXIJIHonl5cLkNuLNv?=
 =?us-ascii?Q?StyJE8KTzjb/uhKrDts0RRLoVE+AX30kVSEI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9WjGHoGMEod2nEtV3Ma6vfEmlH2wxMupGj8WMNgzru6PVikM4liJQrZQJKLz?=
 =?us-ascii?Q?4+B/L7qKe1QrcjVIy3SiX65nABgSYAIY9MAcARBNj6Ahe1eoMb0rpggxUGrg?=
 =?us-ascii?Q?PeD3tQJ6u5TsR7QHeZVTkXGVgS6Qr4LN7a8DdnsPhAJvbiQDFt1hVQUlLzOH?=
 =?us-ascii?Q?GH+zBtW3riCL/AwJrovrR/PPfH48CI9BFd+Y7XGNrn3G1Oy3I2HapKBP3FXI?=
 =?us-ascii?Q?ogQfp5h3jVm6jxF430LtEWBNTrooSH3vwLik8ktuNFxOsMIPaq29EfW86mgP?=
 =?us-ascii?Q?3VFzFONcYzu3bwrq7o+aRJwvzfGGt61m+n8ZmkLDybwOndvoPS8iHF1cq1IV?=
 =?us-ascii?Q?LAUafx2vZd1n3xnpi4cq61//DehEQ+MZAB+mDdh9/uDjJfF2mlXtsU9Tcbk8?=
 =?us-ascii?Q?AeweFaFcFSbCIC4M1z9WRRITqu+BqAXUfRR/3Rhivlj//KhTlyBv+iuKRPGZ?=
 =?us-ascii?Q?pCcof9s5EOdsJ5DpiwjRvWFuwb81mJgFt9RtJwYbrAoWrSxxtcq6Lmi/SRcR?=
 =?us-ascii?Q?xbwMaP+bEDdXm8dGlDKXG3AWfXiJeV+0qVrYvx5ti2OCmr5Td6jdpfA7hhWQ?=
 =?us-ascii?Q?GcIpsQIASmDLv/ZP+/ClbS3tZHrmaAY3nK7dY3YrPppdgMN16EE+hVSwmvaD?=
 =?us-ascii?Q?yGhFlvmthgEtNg+hPtWeL82+YA3FaWu0HNm1fQ/UVScvJkkbUO5i1cf8nW4G?=
 =?us-ascii?Q?879q0xuqylGlBoruTdDyQHIVgkYRUWiAzxnkCyrdJtYTSts6RKQuhHndHFqT?=
 =?us-ascii?Q?Jx4GsKxt3/JRWnWua6hsqwhlHu0OJHseeKN0QkWoGSbe1dTTWIW8jUASWJ7t?=
 =?us-ascii?Q?K1TN4u6SvQhBE2Oah97XCGNUBSwg55JVQeDf2ICzm/EQq8vjuh9FN2PmVdd6?=
 =?us-ascii?Q?cNpR49oPl2eDjmlJK1SAs9XXgzYIcJdqWW+AgHV4Lr4rWekteV6wePFbrvEi?=
 =?us-ascii?Q?VWRLt6kftCCI27y3BsCQ3/pF9ymod6h4KyxNRDTN80QfKZe8pRlLMw85QrMP?=
 =?us-ascii?Q?5xCHOx/rWLQfOE/ec0lpgujNP7B9yiSoc+30YxU8Ipq96GBAo8YsbzUCEfCA?=
 =?us-ascii?Q?dJRoZ6kyEW9wDUYwbIqNXUNa6Uc36sq7hLtA4etD16va5yRZrNOGtmXNKFwg?=
 =?us-ascii?Q?xasgA2yf7+MT9SnRhXGaPVkYrmB2zHICC5eVnqwFn8VLgISFJyLkWjw+UWvT?=
 =?us-ascii?Q?bBa8D/XM1KUQl/YYZw29VEsrpJIIC03rXuoEDn8z7+1hVdND0qSWW9pqUB9R?=
 =?us-ascii?Q?8AAEcX9/6psZNjmUx88mVfThmx464eKgKr9W0lkFK6kzrRcaBzJ5jqOljKRw?=
 =?us-ascii?Q?4rmaI1n34ATQPUbeoPnc/vJYaCHa7R7xRn+o7bajDbX6NKTP35XUgsg07UUp?=
 =?us-ascii?Q?mxZ29R1FFviAUwWmqi8DHz7v0WEuFW+p34nYKMOR0QhnTaaDZOl2vz5+R+IP?=
 =?us-ascii?Q?I3A49/L9Agjj87vNx5KF/e2HjWM6ecv6ZNy0HSmtxibw853aCsoY7haSImlA?=
 =?us-ascii?Q?P05BWdJgdJJzh3I2dI9C2NSsbHTnUsXWI/rUh3209ajnuOM0P3QLwPmT9MxR?=
 =?us-ascii?Q?aPwacUKfG1TLHP1Rv2aEEzQsNI0flFsTW/ZyfKBYJyGtk49VkWnF1fkJYtqa?=
 =?us-ascii?Q?wt0qE0GdGeZisP7zXIt35Yg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cae2505-894d-40c5-d5ea-08de0ad9868d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:11.5932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDzLNmX7I7hKb4xs9UnZcf98lyIaLW3uOpqXfI871caKa+IggmINJ56H8EXcznEArNyllWBgJPeNF9OM8xUG9AfFt1PI7SUyACHX1sy1aWPtP4jbCfkCnPHQUxcHQEtp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/sma1303.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 980c48cbc3482..ebe22325fc57a 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -309,8 +309,7 @@ static const struct soc_enum sma1303_tdm_slot_enum =
 static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = (int)sma1303->force_mute_status;
@@ -323,8 +322,7 @@ static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
 static int sma1303_force_mute_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	bool change = false, val = (bool)ucontrol->value.integer.value[0];
 
@@ -343,8 +341,7 @@ static int sma1303_force_mute_put(struct snd_kcontrol *kcontrol,
 static int sma1303_postscaler_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int val, ret;
 
@@ -360,8 +357,7 @@ static int sma1303_postscaler_get(struct snd_kcontrol *kcontrol,
 static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int ret, val = (int)ucontrol->value.integer.value[0];
 	bool change;
@@ -377,8 +373,7 @@ static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
 static int sma1303_tdm_slot_rx_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int val, ret;
 
@@ -395,8 +390,7 @@ static int sma1303_tdm_slot_rx_get(struct snd_kcontrol *kcontrol,
 static int sma1303_tdm_slot_rx_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int ret, val = (int)ucontrol->value.integer.value[0];
 	bool change;
@@ -412,8 +406,7 @@ static int sma1303_tdm_slot_rx_put(struct snd_kcontrol *kcontrol,
 static int sma1303_tdm_slot_tx_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int val, ret;
 
@@ -430,8 +423,7 @@ static int sma1303_tdm_slot_tx_get(struct snd_kcontrol *kcontrol,
 static int sma1303_tdm_slot_tx_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int ret, val = (int)ucontrol->value.integer.value[0];
 	bool change;
-- 
2.43.0

