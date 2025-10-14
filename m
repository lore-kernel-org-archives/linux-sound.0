Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C03090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415687; cv=fail; b=BiJmavx1cuFn1DZaQmF/9huj+Z/7rptY9Qjq4oJpBCqr+kBZh1G4hM3qQVaQcZzfix6Fh5pxGpizY9OfdsDjVHYxdhTgp3MT7J5MWpwusADKsSPV7AYDBw3E8Bh2xaV84M4E1xTycJgEQzzTiZ9o3fQ0WxGR/vv77CLuPPF2sZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415687; c=relaxed/simple;
	bh=VDMg3tLe8sJo5nB7E1/t+Q1vxMlVDqjLdJBA/6l6EsA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=anRtxsfDo54w9R4SlEliY1RPBhHChPMNNLyJ+ufbPP7FPi5v3D9NY/svkvGfmn8toZwfScJAyxeXkcsjzoAa0YnKVnwedHqxi+59n8szswY+mOdhxLXPpNeMfCX7gN6d/P5/gzWonHjhfGWNtgFOm/txEV0pGU8/XhLQXyFvWRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UoWIxGL/; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UoWIxGL/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3ze+ljwJlVKF8cJ+ZyDW0Lg9EJEfSiik9AixVj1vjForKYMYkGymP+61LR97HTv+4h0AcXz/SmRfVOhEkZrGdAZk3xT8FGcpJxZxiv8CqkrryNDdSU54etWxFFF2aPlMO23uLGbGqJQLOGOU5OTGqLsXMxqW3pyV16hfiq3T7FifbUZfquYOt8+bkLtldjyx/7d7mgjHO068Rl/DDsBhDdmIigU5cA/Cdqmjefn6EoKuV/tzZgBYU5G/OfyxnhL/92qBTTgY0CkkYIsvE33ySW22nJR1yUgik0m/V7MtjTLpHBIMXjyAy8j80o0+T/7hcO8hGj7tyE9eLRClVtbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDS8tHh92TI4Qm4JfdtPc+ePJO89o9m8oDwWPVnvxLE=;
 b=zFtqP1lCdgKlHEqYfUjQwRPlH1TrAgNYlS7rjL+ODuULM/genttKMqHRYv2zBpasEyTtbuIlGmtvoa2iKOtfAoLOFn5wPiCDq9Aw/FBDc3S6WUtWt9G/glzFbe6EXISkjQyYuhjBBQCgg3Nh7PY+NN/nV/mVxRDgcnyy9OM+3qsd53a/Uskw2uaogaILFL/l6/ZtZpn3jnwuzCrRtq4o6e/UmKH+Ci4m3cVl+002WFhM8ihdEotOt1PILu44p2B6rao41vECBn5Iaait1u+xOoxD2P00ULfUUKwFRsL7noSlvJFDKmAJu1Xi54v8ZeH/XDAHNtDd8rmY0BH5FpjHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDS8tHh92TI4Qm4JfdtPc+ePJO89o9m8oDwWPVnvxLE=;
 b=UoWIxGL/s+4+o1TvHKX67VrZC0M3tdyWjze+t14ksaTSz7oWcc44fCYsQbSoOvlHmW3pBWZYEb+VmovDdDwWlwX87fefSWqU8Uinwj4m2KUpaV9uT/lbnYwK1V8nim6l2Tto/1bGBo9f2+FZK7uD9K9nOQ6HXQGg9m88b8cgAjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:23 +0000
Message-ID: <87ms5uru4d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 031/139] ASoC: codecs: da7210: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:23 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 66effd95-ade9-44f9-f7e3-08de0ad9225b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PRy9i9B9n7eXN0SZJ/99T7U0dFVWKxhw+nZwvaMVeChrJDH2qEIblWvZoePu?=
 =?us-ascii?Q?Sg/JkaGeQmAXKIggI37QoB03xOlygNxumpUpD4jHL+X56gzH5A8OrEkf8wVS?=
 =?us-ascii?Q?vVVMdduNKv+j3tXEsAG5bfIiRWComaop6hkuKdd5gHLiJHADrCFccEQnxYps?=
 =?us-ascii?Q?6Ubm+wohAbFeBhzzpNBD49FwBH+P+Xhuzo688/Lv8SI0phdEEhc9XHKNrVTG?=
 =?us-ascii?Q?+DcG7AjgdAqyvxOvDE1aWqDwY8De4M0acqhmfWXWvuf3DXVSZkK1ALOk7BO7?=
 =?us-ascii?Q?nsw0ooe9mSIFo1fVzNFPoMFWGZadD0y5JPEG5mGKBikIE/qadbiNEy5KARw9?=
 =?us-ascii?Q?dCrRFFbD8G97+Wow1aSxdJsE9RpmkFN4JdMoZyO+LPqM9UbbcX/HLlE8LnZK?=
 =?us-ascii?Q?K4ueg9Vo5vUBCzrFjS/QHVYD/86qQNqLvHTN6KGNTBP82yxwzKBBlw5uwU9i?=
 =?us-ascii?Q?wbXH+lwujfzFoIxUQJbKjIGzJn26HRrXkIz/gyUYPQHVs5zsnIg6gvF0nEP9?=
 =?us-ascii?Q?94ehQnPWSWa1/UnCnYuTrA9/LzSmleiDhmrLk1UEE+brf9FPkIi8SRvxmvjv?=
 =?us-ascii?Q?jHO44oo4E3aYJ2FTFutkVJeO19BnmQlFJWcFnloIbk6j5eMr88bGGaUuJ1Nn?=
 =?us-ascii?Q?sTrprFnr1/1lBZeG8H/HK1Hze/WhglaMBYaKWc6t+kOHSMHkuIP9Tnc6U4PO?=
 =?us-ascii?Q?+2zlLrr31fXtN2RbIM0VB1CK7zNfXvxlh2VC3zIIRNPD/DUpHLyWWf3dPYwM?=
 =?us-ascii?Q?kCj/yp1lKQK+gab7t1gzLvX4lqSqkHhahdLaDeQz+ZVfnys15PQwQW2rKZxP?=
 =?us-ascii?Q?i0/PJkyi/Nqqul0F4AnVCMycigQyx97bOCtEkkSDB52Xprv79E2nwOKAo8Dq?=
 =?us-ascii?Q?ULQ3GQSBxjCp9/80kouJd0F9/KRd6S5dB9aWveNEZY/XkNvayFhw2P84OOKu?=
 =?us-ascii?Q?1POCZBSwV52U4GBz7ng5ka+5rVziFgFioj5j4Mu47nXHWTk7EcPZD0NdSjXu?=
 =?us-ascii?Q?ULpSbrgIbG413QHgP6ZFgBLDrI+Vba1NObfLtuanD4bqIh2clHuG/Dpm9gAp?=
 =?us-ascii?Q?GyRdKlEG/dYKdB3KJwTStnp5zJ3ptxHZt/JXJPxvX2PIe+ycYnMLmZQgbVDQ?=
 =?us-ascii?Q?eHrjVdxQ/4JoRjB59zP17QBlxRefecChcidCMkvIQg2qewtlic5fjWLf+55O?=
 =?us-ascii?Q?Kd8czk6eVxyyIdhywniNuEDDBEmDS5r5hbw/jH+Mj+cMNK27WaogCoIyq40p?=
 =?us-ascii?Q?aFDyNxvrIbXlE2SS4sKCnIpHWNKRBfEE7ZLDSl6Gjuf3PUNt39pxKYrVbfZ9?=
 =?us-ascii?Q?o02ZBlR7U19qsBZ36NghzhhIY53kLE3G5hiIpZtpfA0vX2TDI/IyBag5Xj/C?=
 =?us-ascii?Q?scVklzKUwnzoWrUNaVE2J3ZNowoIczHzxh3RVZhAdIVZElKl6wykDF8k5GBy?=
 =?us-ascii?Q?mZoOUnHsvB12rf9UFdxlHku++YDJqhCiWycq9suoFbiFIc1QqnTM1aYSNijs?=
 =?us-ascii?Q?ZAuWdJghx8zjlnlHHPwzAZBeI2VZCWkWu3J7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9IPIfRfi7w5Bn9yhALePmNuKNS/2ZqOoIM4gjRiLpUBWXKbScRmddHjOoNEj?=
 =?us-ascii?Q?n6WX9m7LbFUOUeklqI2KV8kPutJ8qeu41Gh4cPkrpdFBFwv/8xiuAa3cq/Z+?=
 =?us-ascii?Q?03efitnmqock28qZWUwDdFY9Rf4U1srrFe5VpMIsoP/Qh5ZCJD+lJ8u/s3m8?=
 =?us-ascii?Q?F7+WRcD9m95xXcMYVLd6jIiSfdfuNlymGEJvT7Jz1EwXNrzJidsX3a6ruLA2?=
 =?us-ascii?Q?WvTwM+1Me7DkhEXMR2jCrog05LVrLy3aNDkgSC98iw8oo/zj6WCLvJzAMAF9?=
 =?us-ascii?Q?Jn9CH+XKtEuGz8ONm1wm2ewgOAOkzzVSQdpb0+22XkO1QafRFGESgMSJouq/?=
 =?us-ascii?Q?6BPBCN5Ij/bJfTYVCqYHYf1DVLXxArKJJUCJM1NWlvmbY2LpS4U1AuItXswI?=
 =?us-ascii?Q?vhs7QdtH1V86JjgGv9HWyIwQnvsltnGjwf+5Ab9HD/mLuJiORumY9YjNyVUp?=
 =?us-ascii?Q?MFhjLViBRRPCrr75Yw/V8Wo4coNZDpVb0ezGSf7osqfjfZhdb025MmJQnVSq?=
 =?us-ascii?Q?qzObrBMEl+jHFCjfC5SZz5iNhTrZ3mNHzafTSswBLofbMMWMgnfJ1iW1ymzL?=
 =?us-ascii?Q?Dfp4LsWeMDE4THMb5WY+o+T7+xhC0dhLH7B3FeDuw9WceXumJZC0VIzeh2lX?=
 =?us-ascii?Q?ipkdsnd69hQcsiWqhnxPcMmyFS6uHLQegsg3bL7nDtOarPiPj7afNohWs+/a?=
 =?us-ascii?Q?hGhd4NEz8wXMbdyZ4bkOdTlI2m+Q85s/YQk9OQd737wjsfLgrAXiwaujDa1s?=
 =?us-ascii?Q?sbJo3dvBdlFwi022b5TYx7gqwuT0ly9NoSJKUw0ZWQvCHsEnFtphEC/N0HkL?=
 =?us-ascii?Q?BBzxTuLGmlZROUPP+2E28PZnAoPkUeGmbsp9abnIe/pQjNP3NbHV+rQUYQL7?=
 =?us-ascii?Q?2cGjRKcZGAJiqf1zS7qRDgfPNVHRZNKQKi+Dl/fMfld0NCpO/z+LXgHGt33N?=
 =?us-ascii?Q?B8CaSfuBtyYUAa48zUSg3lt9OsYoTx/S1e7fFLjMhVVTfEgC1WUlc9QWuQBd?=
 =?us-ascii?Q?dMVCvTvv/G+v6KQU9q0eG1UpAnJhwk44wme30b7Es8Dd6jK4HgXkPRSWBvnb?=
 =?us-ascii?Q?TkpzEn5hqUbH9rhoc8vggCZN42U+EkZSMtvlq1FOmzgG9e2l8bF5NAFOrT6u?=
 =?us-ascii?Q?BoqW/dbnoQi/ytbHs0VLZDEzJfjkxnNq0YQsmDkClV2Gy+Sliyi3+N1WvAQW?=
 =?us-ascii?Q?frRFBahBAhne7m5rpwyIBzw8FV8OyUD5oGOvbOz37dsa40grzq6IcFu2a1lo?=
 =?us-ascii?Q?dITbZWvyAkaG2eCue34yQ9mddM2xCUfzWDF2ZIvfH2qZIlzRj5wjKLyCKWNx?=
 =?us-ascii?Q?4V/m+dN/yjat/f1/DqZ3eJbW4qKCe2kPqj86ujS4tzPcOlg/BgUbS5qDzjSQ?=
 =?us-ascii?Q?ER+u9OpZuSExxbAK764rYvj7Im3jHPL6VTtsp8G5aqGy0jISqwAqz0xuM/9D?=
 =?us-ascii?Q?sqaU3yDy1jGp8QUujwN1mZU65BoDy0jsLZlZa0+aOgZ/Y6/GpvgjcgdYQCqK?=
 =?us-ascii?Q?wzIZiriwrQMFp531HhVIbz4N6MHE7NeBStWNYEOz8Rn94yCMq0XnFY7WiAEh?=
 =?us-ascii?Q?+nsCAUu3YrNhSKKpobfdxVdYBFC55V8+GwgtutbFqY9Ykk+Y4pOeYNrphdy2?=
 =?us-ascii?Q?c5RmM9eJVqX/2QnHW/Tu/EY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66effd95-ade9-44f9-f7e3-08de0ad9225b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:23.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWnePcRVN9+PtsVquqD6JYD9wYboj7RYQvDu8Yqe0Afzhk0LSOZ/dZ47qwZek1U5KREuIYzf+iLiUhruwMG4PVVR0y5JbDdvyFh+NNuK3XPWydRkbLlb1LH/awR7UpcC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

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
 sound/soc/codecs/da7210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index a889f05119f8e..94e59546c2fe2 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -326,7 +326,7 @@ static SOC_ENUM_SINGLE_DECL(da7210_hp_mode_sel,
 static int da7210_put_alc_sw(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 
 	if (ucontrol->value.integer.value[0]) {
 		/* Check if noise suppression is enabled */
@@ -349,7 +349,7 @@ static int da7210_put_alc_sw(struct snd_kcontrol *kcontrol,
 static int da7210_put_noise_sup_sw(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
 
 	if (ucontrol->value.integer.value[0]) {
-- 
2.43.0

