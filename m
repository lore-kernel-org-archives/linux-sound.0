Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42474309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415829; cv=fail; b=HNkBJxlUHqW4tO7RDAhqc+/yCsI3gOtHVu6Of97zN9mbIEj1Ul/T79qwKHn3eavg+XbPRd3q+8y6YxQHAjYa3T9AM5qFotUJsVSo+eimKhbylTpn9cvyRNH3seaitRLV7ZWqWbdLg2/VbAkQj4iqpTFeoFhmauYjWwMXg9yBXKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415829; c=relaxed/simple;
	bh=G+6p7p+Jh9P6u/a7SBM+VXaaUCi4dB8nikEKQcYm8/M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eudaLRq76eFJtkQb+V44E1XPf9KQp01hE3jG9lwNqybO6UuVQ4/V2pB/LuukvXtmckOi+2sCH2cwBDL90obVjZL8Z7u0EEMBFWiA2MBD0MrjYdUH2VavAFO2sr8tIc90wQF22Oc4FGf6KjRmYtA7PnD77x96tk+WH5I2CiBYno4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G0cj37sn; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G0cj37sn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxsXwZMfpAyd7uHgjskgnVeJ7m9r2qGSnjn8wRrhqDT1Ai53Ur5yXHFdsTnf8/kJWnj8S829Iae+KNqMwWn8iZm+GrEzjtVkepmHGij7nbiUFrySF1Krr+LdbHqBQHTxIHupI1ZAU5lAIKFHRxEldEblocaxvPGv6gvs81iHq1l1PvnuskdNV3mDAqhIWqKmz+f+7xb0T7mjJ4TFlcLuLfm+O1AszdhILLJlidoyYkSKeejG2UiVz18dAwEkAmke9yQkJ06VTJukHNQYZOn7cBi8fuyZEKc2xuwkzIRpcJaWP8v5YaJkWME5CuS3czrRIbMdkZ5oy+3eLg6h14wpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N43rlfKtMBIXAIq6UsWSou2lLL96cjl2q4rFQyCSb4=;
 b=us4dk8e3n92Kt3ooZsxIyq8weZUNWOnEE3FkQJnkOERSDxOWA5cjrGWfY9xPzljCnKqbS324uX5L2ArXtxg1AiIZcIPZqBOIrrPhpTuvwzCLX1XGNfRQzKIO3aMBflMz5BkLkuRr/965Dnt46M7FCy4yQFF/y+dnlUPO5FSB/8OZfBKyiENRfgD/Fz5bMSMnaWaGIGrZZoxCVbo6bOiRNHb9tYjtbauXr0nwSxTaRZwcvUJERbVUZav9jDtQcgU580dbFBU2ioyNeBBDf3HCGPhhuiqE9+S6IOGCbznE9ZbNm2XPgtO4bjtpGQcqgMqVN+ig98PH/1UM3Klg2wHNpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N43rlfKtMBIXAIq6UsWSou2lLL96cjl2q4rFQyCSb4=;
 b=G0cj37snSNLQYc0apl247ryi89jMgUaaONsHzxTLUOaUyKoIb6CYZkpVn5c6K8XcK3ecTWtQkuE6t1Q8ii1xejfQgZQc/FjEMad0AoyiI1xe+AbRRfz5ZlPbW2zX4zj6pZr1l8Lrr6LkmYM/rRBiufw/dze1xoQKxsKjSmwTMZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:44 +0000
Message-ID: <877bwyqfg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 067/139] ASoC: codecs: rt1318: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:43 +0000
X-ClientProxiedBy: TYCP286CA0311.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: e54c1e8b-a103-4212-6fb4-08de0ad97633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+GIg0J/aPym7eFzfoW4OlhJ2vhsUYwHT88+BO1quMDIs0XRei0N1ekJeXru?=
 =?us-ascii?Q?U6GQmDeEHu0CA+jn5aAWnwuKln2HVT9Md+pVHBmazEsz1h/9sgldMc/lnw/o?=
 =?us-ascii?Q?yQQXWpmH6YBKD7Rz7K/3Mw73BPAHjayldxsnsNqvlrUDdWUisdkK0uLL5CrQ?=
 =?us-ascii?Q?SejKDdrpqaH4KFkev6o+h/DPXgEO4mZBBjMYAu+NpytxAoJyPtzL8eXR+TFC?=
 =?us-ascii?Q?lzXLQd+095YXGJqz9a5wSim+k70jumiwWrjMy/Aj6oRe1zbL4xLTe4YBH56m?=
 =?us-ascii?Q?H3ifA/Q6QRy/7NI3dm6dx5kNN58AII4xR3z+72iBT8RCwMnG8tWW48kUBsJp?=
 =?us-ascii?Q?UI1oOKjhbV42wDIlJYJxUFk1wtqDZJsKRIz+hvBejjO09cBRC5C/4gUWzRHz?=
 =?us-ascii?Q?nYJZ02rOTfP+OQc/tJ9A7dbTZeUW/M5MbKG/HZVqxDFrAySMgkFMaLkpaXWG?=
 =?us-ascii?Q?E23wXHAvS9Xr2WZ3O2iDK72B2p9WqaGe8TqBfI3l1aiYvdmmHmoqVW+aPDn4?=
 =?us-ascii?Q?o98Ep+k5WBo/m9EtsGDFS2ol3hGf288XyUuWfBc6YRFMaXlIOnWAlIJ/JBQY?=
 =?us-ascii?Q?loJzHp1+iUjLdXGcOJSW/8y4QoLIyjwQcrAVZH2IdCABfj9qf4dVNNoIfn9b?=
 =?us-ascii?Q?vC01k5a9KGLYwgusgTrbAGaZgV+QpH5GsmprdBb+YteppGjBtLXmNO8jQY09?=
 =?us-ascii?Q?lgmJ/oNfYgdAkWLCAYNF46QGErpM/eahs2OriTmWOv91T69SFlFwP3zStr3p?=
 =?us-ascii?Q?xYfgPd+AVQOA3vzllvoMcRAVeFGy1uGjp+pyMoR71Wok2uIjAMG9hRLkMr7u?=
 =?us-ascii?Q?eUwXciYEQawYrDGEKWVg6RScPFebWADewPqi8nc+PVyeMQq86DNk14TdmyYM?=
 =?us-ascii?Q?uTNAt/cR6KGfXv8Cwl9OxKLr5HKEcSAen8/4T3hEHoyzmtW3afpsLNW6K4PT?=
 =?us-ascii?Q?yrICbZ1My+y+dlN736NV90DE/gzYXSxAcK1b2p/gCJH8xRRKeDK8X/byqjQE?=
 =?us-ascii?Q?yLcVjmUraYMg15ha4kCN5mOI+Cweqyi4L8TV3/StM+AqSZ9MliwTo+MRv1aL?=
 =?us-ascii?Q?NfSw74KsuJgrrKG3TbQ7hZSFdXGP/BJXbteR8f1YvvGUpnmvRpo0eZEKWGNi?=
 =?us-ascii?Q?AI08t2Q3Oeen/nir1h/PrcmkqaYo2RYHIhYfyvtP5fOdfhJ+pZXqhsJLXFU1?=
 =?us-ascii?Q?b30iX3vi/7+heT83R3pA37Iwl04I5DrD10MfDDhGsqz20YBG4UThbehc+YpH?=
 =?us-ascii?Q?Tbto4C1JEgpnLanIe6LZeyLXtzXLLAu/q5y6aBzuYzUJF48B/3/FBRgBvKRr?=
 =?us-ascii?Q?+4yaWjFx2cXdoedOtNoaRvlR/pLua3vMrsiYVUlEkSv06IkpvWecFbeHRbXJ?=
 =?us-ascii?Q?j0F0Uqev68lBdJxHD1saqaDlU8vDFdE/VNEpwdGBR+LmxaucIwUg+dOiE1sN?=
 =?us-ascii?Q?WMgd+z3kOYbyVKCrnZJNg3ttCGsyAxaX29ewjBGjNh3LDvtyScCJXPtR1bWS?=
 =?us-ascii?Q?9bVRFHWKbqYmS4y6XGvYm71YAwi8qc+Vc603?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JduPyhKFGbEx1ttdz09XVNtO7stveSh6rGnR/h5bixcBSmKxQDGSRBytz1qv?=
 =?us-ascii?Q?msS3hndkJXSLg/IiWiMZviWilEm4UQQyHo28d2WSnxdk3sw0DeIf53pFY2ww?=
 =?us-ascii?Q?U6y+wJicq6688K+ybi7H10mQwdWVTZMf3QZSuxkNvxNP2LcRVVA09Tt5OgaT?=
 =?us-ascii?Q?2SHfomrjk2FQdeXaXLTWaytimYj1MmAjTuDYcBXmpoqejdFy/htKlOika9x4?=
 =?us-ascii?Q?k9VB46cthMOd+gjQZLF39GVya5LbuaGprvEo14sO2LeAMHET6h29IU1wEOps?=
 =?us-ascii?Q?+LsV0E083pItE+jj28g86eIwknnP+8OrtzKiC4JCJrTQHRZC5u1v53SFcJjr?=
 =?us-ascii?Q?LalvToJq4od7SNoo/VYhE/JgIJPvR6UgPc4oRah7ZG1xpy+x4M4t+t9JEY4V?=
 =?us-ascii?Q?Du6SwoVGKVyPlOQko+/fMBF6EhyTag+PWAj4RRB5rmx6nbNQNlvLrBvX6coQ?=
 =?us-ascii?Q?vo3puOduEjN6Scb4nonEY5VwJnSRY5hDW4CV6K+PQZdT68R6ib3tyZEozm22?=
 =?us-ascii?Q?80aWp+NUJfyBh0uMl0jBU/1sBtVRV3hYejllCZ8s1txfE7vekZktLQMZRkgp?=
 =?us-ascii?Q?afawQZCB4ZodcF4H8BwmiPvAbZqSuo0+g4X4Tt5vOjbQJAbTcSHwybt9ddy5?=
 =?us-ascii?Q?gmmeMb/fB3YH2AEqf7fogelUICMMhMo02p1lbBEE8qEuD19Fv970Z1Kayke5?=
 =?us-ascii?Q?l6Ei7alCSDL2RKkbQykEReF4tvHNBVVGzYR/AUB77rhSJSWj8Crheju5gmis?=
 =?us-ascii?Q?X1QBLC1sdoqAefZdbZtEnMSJlyUaeN+UeL/vsseMdjF0PblTM9aexMe0hcuO?=
 =?us-ascii?Q?MwJ6gjkjwbwUxA3ZqOvp1elaPHtol2mhioTSL1Ks+VVNw/aseAYrlU185gxn?=
 =?us-ascii?Q?lLSz63wCxEvQ0wP/G5QwJKNJmcNbM+dl5APi9iKIveXsYg4jMNzllrIMHspf?=
 =?us-ascii?Q?WrgovxwTJBcB3fTsUx+UQUd/xn/DNTHygLl0bn/En0VssXES8p3511m3YiSh?=
 =?us-ascii?Q?BE8hLJDaZIATjfPNtoU+x/IOsX476zBSySnhfbLtN3+K700vDNwtRaxtRAOM?=
 =?us-ascii?Q?ZtuTE6I4ypQBkSfuvuGnpA2G5jwQNhSTQGCIpBF4zCHJqPpihtzfgQ9SbkEJ?=
 =?us-ascii?Q?nJz/f9IriSBnU0HR8zYCWQEOoOSvySrquqXk01qN1xSvNhXyBh2Ba4o4CQ6I?=
 =?us-ascii?Q?V0a2vo6EJP7nv27CYN9YBXwuslStn3X6q8u6G5y+43GridLW3Yx11l2FeGGU?=
 =?us-ascii?Q?YP/CGF5EipPzB8sh5xDm8HTZslZh8xIIA8DNG2V/92FgqZf3igCmP7azPYPX?=
 =?us-ascii?Q?VU1nHW8HFxkkx7fWs9LSn/KxjiAuxhuxzXy+0M4jvqcneQKYptz4vqvcKezZ?=
 =?us-ascii?Q?nkQUKHUjN2i5+hOvw37oA0trMWmA7myETPwLqam6fgA/6o43Dq2zNh8N4FgW?=
 =?us-ascii?Q?kPh5Jn4m4cjgQBN0MUO90/bJO5caLgKzinR3DiC/CZAfLjgtqLZOubtBH+zl?=
 =?us-ascii?Q?+rOtRdOx0P++lumZRZqBrdnu+NZJo0r1HnkI8PCOxlCjt2ZATEahqYushPAj?=
 =?us-ascii?Q?05x1Y3+LjJOjs39Wud3foQsoLEeowwGxxZvFjRmtQGH9V7nJ7FPf6v1X6N6J?=
 =?us-ascii?Q?4m5DI5fQ6kePXLRbvkCHBp8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54c1e8b-a103-4212-6fb4-08de0ad97633
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:44.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hn1nrdlM9/HouHBtiU9bfQoaWG28hDeW/kBcOTmaXQf8hErJtGxek+utUAHOnLvGnzljmGiaoBZchvrzbtVO4ZGXpTX90VutgZOW8izNBgxjWQa3rGuVTh5AB+NKMWOg
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
 sound/soc/codecs/rt1318.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index ae01b2ce630b2..01c58b15fd913 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -505,7 +505,7 @@ static int rt1318_dac_event(struct snd_soc_dapm_widget *w,
 static int rt1318_dvol_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1318_priv *rt1318 = snd_soc_component_get_drvdata(component);
 
 	rt1318->rt1318_dvol = ucontrol->value.integer.value[0];
@@ -528,7 +528,7 @@ static int rt1318_dvol_put(struct snd_kcontrol *kcontrol,
 static int rt1318_dvol_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1318_priv *rt1318 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rt1318->rt1318_dvol;
-- 
2.43.0

