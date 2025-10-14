Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3130B504
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416084; cv=fail; b=EErZUY6JKi8DIW1BSJL7I3yJrYKOV/ctFSjkTN/Jyv1a5dBHGJmCrOgiG04S1d6YJuNw91hc574ke1JwXKkFqGw/5A7JmCYzNJGUdKEtyRTlcyDIScjrAB270Ruz1gHf+tQcAKhNpZOKIcPTKuukONhxniNpyppfUR81cOFztMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416084; c=relaxed/simple;
	bh=eCbu9OmHK1NeKG0Z7xtNHFvlXj++PAnIx2yw2WsmhXU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jgMGr6Lh0MPD7eaRKna1/yDBucbKqpVjNMtJeULpFlfHPSekjUTJlUag+9sWO3XTqUPJ69royH5urvt13KvpKqosYagsapIwLI9BkB2AFJtXSTb5q0YwTUwqmDUcp1fy2z0tP6rZC+SUqJqwQXYvew3bZd5VsuJUCtYtUFoMKXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jEGLQrly; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jEGLQrly"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjBCbQBYenZtw80ZQirxu6+OWTiAlQEGQG4b4+331NDNAtisuURiXJtFEM5KXcrY/cvsw9pPTVd2s3chAxpSljUTiCKGc8dpi6l4Q4ofYqFd0oDp7qgcK488BKx8XDBvz9JDTydNaYZ9+veQ4SiiPfG113+opCTa0RQl4Y/M5eB6lAj8YGFv8B9zuC0wE/KGa/63Lwrv0BCRCFKqCV/179LkPYuFfU0wV2B4Vlf0rDgHgMxkcevOWmvNIo7N3mX5ix6Tl03/8BROlS6w7CILMMhyl+X/fqt9qZApHcFr+QzVjZyY2OC9Kp1jkl6OvV+6vVaMeGTUFBK7fSfGzN9W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKRclhYP6KVz9uGtxIY7ClpwN7Dm3DyaJfmGiVpWYwA=;
 b=O8qjQvnqlLad4vH+eQT4P4KqDi1zLcM6j6VKQ7Lc7SR6vwL8kGMjXJQkEiZYkLuV3psVzmOgd2OpygK3dmyJ4qEw6u5rtn565yY9qGoxpoDBA8GDlaqpD4h6ifpgY67zlQ2bddXjIzdr/qafEeQEjg2lThk6bBsozNCfwg7bEcY0WXtZyuY9lLBbDuFZaDQn+9vQYd8oORa+TSGNJbXsIdxWLdj3/DzjOH/KgGr6M0PpYnNe5I2SdM6o4OVJjwyPL/mRdVU6UGUTvCj0gL8QUaVKIRG+dpV9EHYQAo+Tcxe7PG2K7IXEhOsS3W1rfQQhmQwlgSnWpfv8iGiOOgeLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKRclhYP6KVz9uGtxIY7ClpwN7Dm3DyaJfmGiVpWYwA=;
 b=jEGLQrlyeDttzm9oSHm3b3CxTcIOuMWn//+aHXWR2fqjL37zg6tyomDFftTgzAE5tELWZFxwvthhlk4ul5bAB6ozrhJliTyiWgDJ/z0YuFUTA0EyRsdunZD3LU1ndjGEOLCgtrvjRWnxfozRiH4ne4jk0lHweyV5EuIPnOIejZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:28:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:59 +0000
Message-ID: <87cy6qm7jk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 138/139] ASoC: uniphier: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:59 +0000
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: a622f69e-b2fe-4fc3-18f9-08de0ada0ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o1tThgKhMeOyRAWXscTIErk8PFAtoDa1x8rYre0VApQb+kAN8J0JOnwoY7wT?=
 =?us-ascii?Q?YXkH73i1nsuUmkI3WhNqnPcfmVqmd9cA6n9bF5jf6qQB1/0VjI7/ViqzNxtZ?=
 =?us-ascii?Q?AG5/PydQ6vpgKzXHzpIAbG3xdkNKghzKpEeyHqOysJ4tZU6Tmj+LOdDPA7E1?=
 =?us-ascii?Q?1uDHszMenC1XnUabTobHgMP462Hw3MxigD70JZHZMWAaYgQxk6or7zAQSkcW?=
 =?us-ascii?Q?/6ypSZ67Z8kgV8dm+U8dOlyph0BI124iCls1uj7T60FPj/qy9Werz436UAFH?=
 =?us-ascii?Q?wzhGnytlxgAC3l3DOHDRnvmjL/AoRpQP7gV+f6f1w6T8d/2+FmySqWshwIO8?=
 =?us-ascii?Q?mdayeydcDXBUNMubLyT9kjavzjze7r+0j22G4Qtu0mmx2PS/vjNc6GZiG0Pa?=
 =?us-ascii?Q?olnr7M4dgDJ+CZxeWyVBr1RZL2SEtQulIVYYTil/Vo2Iv7apIEz1ILFqY2iu?=
 =?us-ascii?Q?hOHsBTfQPzxsBsyEM1PzhzNksOfVdGnjv+rkecSFvahO98zWYCwDtNo/TqaU?=
 =?us-ascii?Q?k17QNJUzX6gjfI5wTLgCZRZMWC5V939PEogghZcs9/FzoHFru4ClL07zQj7N?=
 =?us-ascii?Q?cohoa0QhBpp83BA6bkQGvY+sNhrsTVL7i2r8sZSbhHziCH0J4iaS6EdFctOk?=
 =?us-ascii?Q?UxvtNUUN5O01OBW8rZocwV1V0KBb/RDZjFC8Jca3hYOYeH5QVQSQSLHCdRw2?=
 =?us-ascii?Q?TjGgq81razupFSeiH4Iqsv49zXuhj3Dk5JMB7Xhcyb8uS6bQXxSo+TVRWbFB?=
 =?us-ascii?Q?XvzFI6EhUS5T44QmucegUKcJZcc/0uoT56Ad9iexv/agJBpE6U/gjx+aF/oO?=
 =?us-ascii?Q?9wpG/jl/1hstVXfxnWU8nK2v/tbJjvb7Q9Xpxh6CR/3vz322nAXkGgGf4aeI?=
 =?us-ascii?Q?DjcdTNI0DOuv7o+/PvZx9sOIq42Z7zc4JIieU0o96zLJEPIo0Ff8ronvnqDh?=
 =?us-ascii?Q?KN9XBYnZUA4+lvrIUpGMb++mzznR92dVdjDSxh4vFqhV2gwQk7uQuarlXhTU?=
 =?us-ascii?Q?066RgCfcX6doUvgHdbYfc9yc+8JnhfwxXcROWq67ok2VU7YbzRaxAAB3zLft?=
 =?us-ascii?Q?6oxDamWlZ330hu88Aam+WPwARQR4wMoNVrFlMWoltrNfNIzMEVFv6Wf0/M9c?=
 =?us-ascii?Q?9I7dz9Df/SCGiFPTGmbqQcDLCJa34vR3RYbXtRTe5XJ7KNIplmlQ+NmfuE6v?=
 =?us-ascii?Q?v0AcnNeRoGARsY61hqLUKhECFQ1Hy2MVLe6NBLwah43zUd3pygPXXePQzxho?=
 =?us-ascii?Q?bWwSbZRhFG0qVcqfwwRyWN0M2/ATKK68zZb4InsERPMRYuuo9ruMA0PvaSJf?=
 =?us-ascii?Q?+FjUFzL43vwAjNlJn2J5ty3JgtomcHKeHjsCm6sI3+OMV+L73aX9xWdrah/F?=
 =?us-ascii?Q?SE04ZJsRINOOR3tessFfjNtvkGZjs01CFSsFHDcq1EqejYrZx2JO8X6SHEFl?=
 =?us-ascii?Q?nfGzBkRB6UlRd0ZwiQquFGL3m+BdZKD9QN7bvOQTTuGXfr1Han8TSl4sFHAP?=
 =?us-ascii?Q?CmnNT488/bsYCnJ2SzBYhjpAbJ4WkTUt6XZs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/+DqFZL2L8ApZ1GbX+o6+sPe3MmSfpR1nZjqJILfU6fkn8MAym1VjKcrRxxB?=
 =?us-ascii?Q?quLR5kzRlaJNJQz29L5bA5wuWIbtp2NqTBBycrUH+9XHL4bcdRbumCJIahnE?=
 =?us-ascii?Q?aeiITrcLArqEOEzq3Js5XjKxocE6/mjzlyokYnGa1TFdAEMd1fSVDbkn8GR9?=
 =?us-ascii?Q?5qfqVF1xUmgCIww5Yc6cAJYMhXa75zueMvfE7VR1gUFPCwU7sQmdEbxJRf3A?=
 =?us-ascii?Q?YMHwttL93htDFupEKEoPYmOmBQvI4uDj+VhROAAmZJGWaLfM01SR+q5+7Fwu?=
 =?us-ascii?Q?8uQx6n+dW4Zgkpj1DyuYRsJaDyGPJwVDJ8MfJlWaRUMvKm10OE5F0g4+BRYO?=
 =?us-ascii?Q?FI/Mj6aZ13gapdPlYxCpS0Ddo3BHthL3B7ME91AJyg6beJH9NIHh/I8KEAsH?=
 =?us-ascii?Q?qt89qwk7sllk3FaIUy1HvD6TjxVI1mRNuHQkNtwI/p5BD0LASzxm3LSjWBKm?=
 =?us-ascii?Q?4IE1dUD+aGVtkB525ZDmkjvGRWYvU2pfH0MD2uPceei6uNB3LsitQsGtPisk?=
 =?us-ascii?Q?PhPglKft0WbQFhzW3/NApBsaQUQyIu0/LD6AmNWSVTvr+8XS85ULTE0Rx5fJ?=
 =?us-ascii?Q?Rui4OjGBiM9ymRp+xiDhvGH2OWZX/Up4bsqsMyFshFRXV9PyQgKkFCDh2msJ?=
 =?us-ascii?Q?abBBrcNCq/OuJUolC/FFEgdpcB4Hho/RtHlSg/kbGsJQXTX8a7s4fA39GCki?=
 =?us-ascii?Q?9XrFe9k7Wd+MjDPqVOubmgwd5+z0nH/0RP51dh9VdX2yIqj6rcQUbJejQY44?=
 =?us-ascii?Q?ED84aXC4DlT3C2o9LeFOioMKGqHH4AHpfYUCspCiYlqFkI5BZWPH3q3DV1+o?=
 =?us-ascii?Q?c2BX7gzTyzWzv1O+XRU5qJUcd+p3jniaEgSeDpn/nSkbBYzQVxEztEyevFHV?=
 =?us-ascii?Q?rRaWgrlhhc2PqY4Zs8ji7FbO6dw7EyZ6NRCRHdEzrdr0kE53EEYGR9WMRLT8?=
 =?us-ascii?Q?Vb2+XWfD7ZCWNLYJDt4bkY0UqaARPet3QKOQRNR47CRWfuONsOW22VUra0QA?=
 =?us-ascii?Q?QKvFYnT+3kwyBghlJ3W+HjoNIg3MtlqNagHgwAlBYES3kjSIKdfDrbKOgERd?=
 =?us-ascii?Q?EUpZznNVOrIVceqwEdZyM4HhBzQv0/L+DmiPPz/iMNAcnteYfWkeTf2vjd/T?=
 =?us-ascii?Q?hBgA/XV/7iBgNIcfjZymlPKN88Nvo5K2ed54Yf45i8olcln85nVRb66JY4YV?=
 =?us-ascii?Q?MsiI3RLPNsIWCyLuVkY8SfqAT8MytQ3zcamNciUXY/GgQB+1okPuJXcgTHr7?=
 =?us-ascii?Q?dJv7H2mXTpssLc29YzvgWvjy2jrHiwT2p7uxRVCLadwITvdUZe/0GokY7Wc8?=
 =?us-ascii?Q?bzTOEa7Av3aPEUrcGaWdgrSlD6l5qd3zDifTJa5xGe41xBiXKKhSS7hV/den?=
 =?us-ascii?Q?af9fSYa8kBiVCHI4YBRah+xxXyklDy5aXRRSIXqTOyZL5m7WKaTSiwGwzjM8?=
 =?us-ascii?Q?KD9GSy1yCtBkt03D2i7euSBWmS/nUcXxOZ3WoOgxT+MarPwAham4mrx3zuEz?=
 =?us-ascii?Q?8NaQYtYd/bz/VOdEMkju9MkEihlf7bqdSoMu/XI2OhsdR9a5zygWGwWcZ/tC?=
 =?us-ascii?Q?NIXlk5sou3FxlE9cXJnv9fjN8WPHmfYQX0RN8oJUxUlmNfl9Og/uHMSBEV7n?=
 =?us-ascii?Q?Ft0oFSQ7S68lMUrTJCqbibQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a622f69e-b2fe-4fc3-18f9-08de0ada0ea2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:59.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POYGL0ugb/s2KQ7cbiVd+SSh7rEAzllFjWF92+6YoIEd0dEMDvvZ8LZOBSfg6/VwY8kOwwHDzTlEryerO9gkrCMaV3UyiUcZa76c464Ke4eiXQ4VHjCWwP9NH0p8cTjg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

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
 sound/soc/uniphier/aio-cpu.c |  4 ++--
 sound/soc/uniphier/evea.c    | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 3224c11a527fd..d3dba21b2d049 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -623,7 +623,7 @@ static int uniphier_aio_vol_info(struct snd_kcontrol *kcontrol,
 static int uniphier_aio_vol_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct uniphier_aio_chip *chip = snd_soc_component_get_drvdata(comp);
 	struct uniphier_aio_sub *sub;
 	int oport_hw = kcontrol->private_value;
@@ -640,7 +640,7 @@ static int uniphier_aio_vol_get(struct snd_kcontrol *kcontrol,
 static int uniphier_aio_vol_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct uniphier_aio_chip *chip = snd_soc_component_get_drvdata(comp);
 	struct uniphier_aio_sub *sub;
 	int oport_hw = kcontrol->private_value;
diff --git a/sound/soc/uniphier/evea.c b/sound/soc/uniphier/evea.c
index f6c6eb95262a4..7def3e7e06194 100644
--- a/sound/soc/uniphier/evea.c
+++ b/sound/soc/uniphier/evea.c
@@ -228,7 +228,7 @@ static void evea_update_switch_all(struct evea_priv *evea)
 static int evea_get_switch_lin(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct evea_priv *evea = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = evea->switch_lin;
@@ -239,7 +239,7 @@ static int evea_get_switch_lin(struct snd_kcontrol *kcontrol,
 static int evea_set_switch_lin(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct evea_priv *evea = snd_soc_component_get_drvdata(component);
 
 	if (evea->switch_lin == ucontrol->value.integer.value[0])
@@ -253,7 +253,7 @@ static int evea_set_switch_lin(struct snd_kcontrol *kcontrol,
 static int evea_get_switch_lo(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct evea_priv *evea = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = evea->switch_lo;
@@ -264,7 +264,7 @@ static int evea_get_switch_lo(struct snd_kcontrol *kcontrol,
 static int evea_set_switch_lo(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct evea_priv *evea = snd_soc_component_get_drvdata(component);
 
 	if (evea->switch_lo == ucontrol->value.integer.value[0])
@@ -278,7 +278,7 @@ static int evea_set_switch_lo(struct snd_kcontrol *kcontrol,
 static int evea_get_switch_hp(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct evea_priv *evea = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = evea->switch_hp;
@@ -289,7 +289,7 @@ static int evea_get_switch_hp(struct snd_kcontrol *kcontrol,
 static int evea_set_switch_hp(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct evea_priv *evea = snd_soc_component_get_drvdata(component);
 
 	if (evea->switch_hp == ucontrol->value.integer.value[0])
-- 
2.43.0

