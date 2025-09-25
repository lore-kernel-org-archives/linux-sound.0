Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8189327FB34
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 01:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765331; cv=fail; b=dM4BvL/dcfok1x6/G4yzModS1ELZSfyP5gJTva7zSOHbU9653xqHAJU3gYRBS4WjXnq0unIBBdtYy5p4xNvidJgtvxHLdxVm3gxInkS6QzGpRKHAsAydqSgANoY+GB91n3v4sONSoCb1qyY1Oh2SYj+eiYLHlvQkWnLaiZdbUBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765331; c=relaxed/simple;
	bh=oQg2fu713K1DrhMLxzUZJvwEZC5le7IYnAowZ74BLS0=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=de5Apzp8w1dybz8AmKj+p5RFmlOveKNg26hBMjcCk2Tz5U8xhoLao0Dhd8QxqTVf9prtSzXZjXZ7RJTEgxAhmi0R/uzyKZ7uNFUyUPTg4P+ZVw8N16crtf029WOISKsIjT2nU5S4kCMMSABSgXhmFQJejCZZFwY9Kz7GLDEfNaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TOBb0XO8; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TOBb0XO8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A74siGcszmdvyJ4s6WrnRG8grI6d7sFXIDvggExb45o8E/CsAMbhHL+0XmBLMtHwhiqf6JlKsoShMgaucqbltUGwbeaqhuOj7MFOVCJYKt4vNSZgpKHmLlQ/XqH8NkfEXEGjMcE7su6hiU+BsWzAvRjKY5DuGQxOl2XTOVXyNhVOOTceC/wxuAUbYv5pFuc2l1GA9Y/XlGneJ04y2hrps/c1DFyjNNmBfCRfgiLXAn1nFZPCsW0nahvNTQoR532cqia0O/GGqKINbnmCAiVolcL0M44TaLVFvaoLMug84vMxZxpeuJhS9p+pkMqzmMTZv0U7DpWKDpA39gv+oEjjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVZFLKFNRJbpWFD8/0RpJrp0d5JZWGy1yR2MJH77pkM=;
 b=HPNlitNw5w9X9+/70PL6o/1eVsmg4KcSI6lm/Iy5IkFV1ifnlDBRcF4Z81orGUFbq3bN+2Q7RD/tr9Ecyfo/UTIp3k64GWZ0eoB97NRIIUlnlaM1w6TQXD1WWgzf7HHOWHTgORRPCfyS9EUeJ38Y2wg1gCG1xqWjPVUaH9QuGVXrW9+c6LNZHyPfKCILOwUejcS1An8yAq4NfovYxmkqyRNKdzWRArQLWYOXWrWNZH5wrxnd2xgUeEjLIN2lHj3tuXUI+L4xaO+wpnY6KJxF5x3EmS53j1oTyoBL44aswdhrSRyUGb/GB1A/8VtSq5NrmAYggDVul0x590xdNyXr9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVZFLKFNRJbpWFD8/0RpJrp0d5JZWGy1yR2MJH77pkM=;
 b=TOBb0XO8e9tW9aePewzIm2RflaZeHK/azN8z7iPjhWHgFUMVusTtVfOnxUVwuxbdpgtOuLgJd1hT0We/UmnRAajhivKSwJox5JxGdCEAEJz7JlYFdhIKYPzH0E0nPlRvc5NOglhhmjTHv8Zp/TLtchG2vQKR16403IFEYP6GtQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB16015.jpnprd01.prod.outlook.com
 (2603:1096:405:2d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 01:55:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:55:27 +0000
Message-ID: <87ikh7z46p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 3/3] ASoC: codecs: 88pm860x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 01:55:27 +0000
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB16015:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ee66ab-9fd6-41c6-afb9-08ddfbd69973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gh1JQbsulkfZdbnU1gfXgDNVMo4VRA1RQ/+uLVMhp3cMmJ9r0l/gwoGFp0r5?=
 =?us-ascii?Q?KIjnQp8WgHf7XYdPrd7Na5meaRZmWjunENW7fHpyH1Yxmpeov52n1N4CtD99?=
 =?us-ascii?Q?CzQrLxGugkq+cbgYtP+YXHB1Lsq80Mky917zTN5z6gYY5qGZlcChkMZxGWG5?=
 =?us-ascii?Q?9CKAmw/JlfQzwEUzalZ1lJanR4vRQ5R++amcaBD1WO5J19oMiFUQQQkVuPaH?=
 =?us-ascii?Q?JfmYBeyds9QDnPBQQKbM/9ZhMJqI3qT5Wj2VEihbnjnXIhDuxYGDw/BlB9vz?=
 =?us-ascii?Q?8pW47aQxvhcjtDNn0ov1SuaItHCs1gbTNibdRDVThbItzJVixyyapfj9Bs1x?=
 =?us-ascii?Q?u7ZT990xLMlu012Rzmqr9oZsAigBGrZmMJkrYlmJhV5B3sqjgYgUIYlD21V5?=
 =?us-ascii?Q?2zwbP45BvmJCItft+23bnzeNS4ExPz9ARWap/6SfyaJFC4nD4sSLES5emomv?=
 =?us-ascii?Q?/4qRwGxBPvyuY9kGbI+x0o+Gu4VzMCU5618MIN3U8ss7zT1OlV/M0+IbAlKF?=
 =?us-ascii?Q?37+mH/nRaKDjzUgkPXWMxK0spnH3z/DzrOAJ4BHeFvP06kaQ5iSSmfHPfBAP?=
 =?us-ascii?Q?/5VtnldrUx2a48Zs1nyFdrzMjNlq4x4r6sfX9oJlgGAJR1AY+AF9TO9Jtbao?=
 =?us-ascii?Q?FohVgCf8AL1i6HxWFejncv0TUnQpzmObkPov5LwFJ1m3SmEt/SIKLUyhRsnv?=
 =?us-ascii?Q?F3uDFzw5io/lIeUhlIihAs/My6XiEBzAXbZzSyn7tIl/eOA1eOPaJ11asxiZ?=
 =?us-ascii?Q?cOMfnsAwAmrq+tLaGm9SE3rgQpgj2v0/BWQrKJDw4DXVCxEQNCnsmk7nRLAm?=
 =?us-ascii?Q?P4e3f4KNLpGYWC8UC9zMGf8N/jz/+lbZ46YVqcF2dxs09+eNx0Aosd5vUWcX?=
 =?us-ascii?Q?AxusWCpZHL19zMAbHFDr2icXL8BtIbuK8Qq9FvyclxN1kmS8LmFSK/XohdNY?=
 =?us-ascii?Q?z8TzwjuuqXxQFghOXwsE6EZPD0XT6UUwwE7GtYG9xE7Mlu6O/K7dIVoJR5MA?=
 =?us-ascii?Q?/tMvbzg0r2BbjThXp1YgWSFDq1xi2/r91CTeEktj968B4Ew6WIWPeQUoyTU6?=
 =?us-ascii?Q?KUsOGQUt9O/vHDKiKkDI2XQYMee9hlbszRSWkjbh7JazVghjMz4yaLHOSFVd?=
 =?us-ascii?Q?cLBKSNNOvtRbUMaK5YQHl0Fpxt2ERQmSi6daJl+HF4reywPzopKULxmdzjxE?=
 =?us-ascii?Q?9A+1wtFjFc3FruefcnV8gONMhTexlsY/Ygb6X2nkmpfWVTag6QKkDfFmEQl/?=
 =?us-ascii?Q?SoDh3KJ5CVAjGFqlaAuDYV+RQsiuMncnzpRf5i0nGWHl/PVS8cZkXYw4X1ZF?=
 =?us-ascii?Q?OwsEsYFv49xU4Yi2YLnCMOw0YNyHILaurLjzqpumL36bPHRw0LDPCEYuUAst?=
 =?us-ascii?Q?aem4a1n0ylWq7mTLjMElFeauQlVdMzor1ONAgIShxqDB8KiOh/9Auph4OLtk?=
 =?us-ascii?Q?opqjG2Kqh6A1G+21KtiEhAALOckpjJ5l384JiBur22RdSrniUVmYk7iEN54e?=
 =?us-ascii?Q?U1St0URaXz307J0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hJimVMprSQNvzphKpJMmvJclH2kv6NCZCkzWEAMNf4cF3Y5cLygr4PRMnLos?=
 =?us-ascii?Q?avChdRO3ycIO+LFD50+h2AnnmH+DMYOLXDLYUJi3aJeDRSbMP6C68WtbJ4jJ?=
 =?us-ascii?Q?PTW3Rd72xKIWDZeKfhlRFFbcjt3O/pswsplo4zBPJZ2AhQ0z5J8UUTHMwpzU?=
 =?us-ascii?Q?jnyBBwVk+Kxwo1C9DPH4IZti8Pqc0JID3yqpaxcUTHjy/XRsiHiE/JGiShCQ?=
 =?us-ascii?Q?A/mFHJoNSsCWHt2SVwqLn0PIkm+MOB2iXL4cUDwqREtJGECLwX8kF1PNDvLN?=
 =?us-ascii?Q?PiWykoF6HldlMIkS81eGtvJ+yHzuZjRwuWakN9M8+je2AQ9djUZ+uaGOavR2?=
 =?us-ascii?Q?Ipw6KdF94bnQ9pvOqK5oI6f44xij3AeS44Zar243vRAwEvorIvRkJgX+V8Hy?=
 =?us-ascii?Q?zT5PJq7PCPKUBXMixCgh0L2T3hifxBKoda21FfYpWDGN2eAGkVKPm78EPRsg?=
 =?us-ascii?Q?32+Wz8Z7llw6ItWCL4TQ2Rw/Spc20di7vzBAIvSSXyEkj8ULVu1NeiCyIwin?=
 =?us-ascii?Q?h2MD5h3mx2PQyl0OR5PGD8kkKXrbXuBVLW12e/+bamDnMUTuOzgLzHyb/Qis?=
 =?us-ascii?Q?a+h1thUvNUsU/miqY/pNCGOJsi8GUtF5lmIo86CUVn/0nv9zAYQlN6Z9M6lc?=
 =?us-ascii?Q?kfKmLi9in/ovcP3QyRQBEgUX/eP0c2LZg07OBaImv7X6I/xoCys8U+V3JxCo?=
 =?us-ascii?Q?YVmnsYezj+7Ipk/3bNDNtB58CQM59OIgC9yNYI0pzcdkJwIiua7+u1+t2k7T?=
 =?us-ascii?Q?OtR9svxcKS1/s3YoOCFcWgXcr608VufYbOe3lQozM3OJ8o2hPGLbe9QPpaiI?=
 =?us-ascii?Q?X8FBZGVyLucAB6C2HVdbfd6/HOHrnN5PfNnSfLQuRBfYSLrszUCm6g4cmTje?=
 =?us-ascii?Q?x3NOyCtLF4QiLveVsqsPD5yCKb/dJGg+VhvuBYPOkiW7x77UFUOiX9Pi/E5p?=
 =?us-ascii?Q?bxr4amX4IEDptlzyNor7wXjI8/BFeAcFxPrUn4n8msbE/lYkAJmhTFHU07xf?=
 =?us-ascii?Q?cvZzwY1qX6CyQHyo93ZlzVQRjAldJ2XSN3DItiuCPCcy4O9L4YgNRuEcc+KS?=
 =?us-ascii?Q?VFaGLH7nw7HpldzQzVPQ4G3F8KheKt3UM63sfOs5oJ8+6GV+pDWqPqU1oJyA?=
 =?us-ascii?Q?F2qRd4/HdCsckpgAXDJMnuy7zAOrEL87jft2XZUhsHMSbtMBWPpRnZLtErUx?=
 =?us-ascii?Q?Wlp4npfOwj/oQ5cNGpjASkPz03AtaG62eF3XHQQfR6y55fFi1IkuVEvxV/41?=
 =?us-ascii?Q?L4zD22/zkdGsCOdv8otXnXH/h/9R8Y3n+tASs0tcTqkgiQu8tjV6DdHEowpk?=
 =?us-ascii?Q?geTS9rBxISDZj3Bg28aVIVqPipj61JijQtVzarPoxCAyaXxXvDKAzbgjGpJ/?=
 =?us-ascii?Q?TxzTLkxXLvJ3mrZPac4oO8a12I7pN09jatQrGNlRfpmccHRJKRWa2LgZHpyZ?=
 =?us-ascii?Q?ephc3kFrpMPf0nhtXsO+4qUhrKFbKE39lgkrcES4Ej6lmvuaRw47OvgIAO9A?=
 =?us-ascii?Q?o9bl+CxvUgSB2RhCfg4dssy796QrckDhkjlUTrys75ZlY1tO764l3yIzDJyP?=
 =?us-ascii?Q?OqrHRZbq8cLUHuTNl5sx+/BC4Fuxxw3HhUYY1DhFLf2VxfAvbDhDLIn1U7/D?=
 =?us-ascii?Q?HTKUj2LCt1L21Ld71lAakmo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ee66ab-9fd6-41c6-afb9-08ddfbd69973
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 01:55:27.4848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFcnm6B6WTUzn5xkjCXPMtjCex40WTp5+ucKgaw/wlL11VoT2+8zJyIw04MLS3097rtESgx+3vOkJX0UajRSjgpEyRpPqabyIWHL84lUcOh+y8gkCTToazfuEOon/e/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16015

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
 sound/soc/codecs/88pm860x-codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index be01f0928393..58e35da2f85e 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -269,7 +269,7 @@ static int snd_soc_get_volsw_2r_st(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	int val[2], val2[2], i;
@@ -293,7 +293,7 @@ static int snd_soc_put_volsw_2r_st(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	int err;
@@ -326,7 +326,7 @@ static int snd_soc_get_volsw_2r_out(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	unsigned int shift = mc->shift;
@@ -346,7 +346,7 @@ static int snd_soc_put_volsw_2r_out(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	unsigned int shift = mc->shift;
-- 
2.43.0

