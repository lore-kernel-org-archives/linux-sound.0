Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872DF309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415811; cv=fail; b=eg6i3Rh5+RvRj8zA0emiAr3kSt/0/J9QnXaCrEe4QmxwkOQqHuGH6pqXR8dDDXkGmdbT8ndR26vN2sKHkDmsCXURLx2X4Zgkrfuimenzp78I4SkThqdfkdEbztqimqsLCx05pVpMkTeKNWv19HL/blsNsVvfhnf6qGi8pd49ixs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415811; c=relaxed/simple;
	bh=46vVmdcnIV0p2Md41DrBOSGGp8Ox40yZMU5cwwiALTI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TEmje2N54prrfjH8FD3taneG7fNqxlLaILj4X4TMj5eRqYvTHbALayxQzSDjmRtKeqUQItA/YlxRGD5Y26u57v7JXJb+nw4vg3f8vwoMF/6J9dPzKkzeb24bkibsM5ZxSg0d793GByMGu120ulOPPJs9yXulk2oS4U8PwmBvgKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VIVBjtTD; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VIVBjtTD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZUI1eqR8m1863D3NU41QyDfJUMba1g3IcwjzhQ8dDPRk51nzo3+WAF1UFKsq+2Ihwuy4TiXs12VhJSM0ddJrM0oMx2tz7EbXwvS8I14DMqg0hkRqOja3hbQhC4BG7pgQqGK3LeIyptMu9Zy19ja+Awu2S1nzYrgYgjL9OpznNxa9LpAhk2Fj5XzXb33fRO2ovHbgYZb2tVY5mfy3LochWM/PHfz6Oqi+tJcd37SKOesH2hr6HJE9gNHDYy3Oxa98sZQkw1Aad/UPrbOuwpwUl5LvkjM3+ya88nWzhHdr9SHuk9rQQPFqE4rS6/L0TcYDPj+xHlSQreqbDC2tpqBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQqtJNszjuF56ZZk7me1N9/biL3PtOOpmtN3TO1WtvI=;
 b=GdP0c22XhCtC+slG/4CowmtXrVEbY8N31fIfryGjQ77ttnZZYMK5qStWOkdbanGE+r82r/9HRHYmdcFI8e2zaUD/B4v5bpBlxrU5f4sYqucAocGPqhlWNHvqhIK4qPpeF2VMA2DqzgWoBnxu4rZHPk4hAeE03341dNbqNVY85C8Nnfg1VHNQ4DhJoE4St6fRaKpSbYk1cgMn9qGxMzyBDsBFKvltsu+OjyUSR3RX3oKnFLM94tTtUv80JvTX+JN+1s/5thomwwIzmf+XMh4qEXs9fIYl+tEgFHiO8oHGDyZOGafd97Pi/FciJF6DkcOSr1QkfFnV4FNR6pztdYAOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQqtJNszjuF56ZZk7me1N9/biL3PtOOpmtN3TO1WtvI=;
 b=VIVBjtTDBbg6S2Wh+ud+8J5jQuIhCCCCo7mf+YK6kZNMMV6hV77KrDTpzpUb+gKRKiTSdlOicpctcow+O7Dllet9gFAZMp2Gfxc32mZQNihiL/tDukXGN3KUn7+MYREgS1ase0+rh2aRX1Pd51GHxjeIRngmCZnx+gFkByHaWnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:27 +0000
Message-ID: <87cy6qqfgh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 063/139] ASoC: codecs: peb2466: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:26 +0000
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd94dab-e819-4212-58d1-08de0ad96c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4GuSyWQeSh1kA3qfw0m/g100H3VIFQLaxGU9V0sAjaQcGdU9QR+UzXBnKi6O?=
 =?us-ascii?Q?kvSP9+XkQDKT/rHOjZotmY/N2qtUh5IYwd3sl8gYUKKlbrr2dW9b3WE5j/sU?=
 =?us-ascii?Q?G9F+tnqWTrhl7+PvaHGslIt0SCFyexC0HnJ19fmUerchEmTYIOZFwWKK3D09?=
 =?us-ascii?Q?u0XKSZKgGF3Z2AqqMMQzJJuQ5YNRuefDPMXnB7h7x/JbE0WaHQOIje9ujnHa?=
 =?us-ascii?Q?EVQyX5/FfPR8TGkqLM2Pek9icj0GuMxLiiVd7PwZ3p3FeawAjOi0m5+1We5+?=
 =?us-ascii?Q?KUEqM3EgMXcKq3xWe2gN/HKtfGu168ihqkleL25wH9nzQ6mj3LPpLoXImwh+?=
 =?us-ascii?Q?bI5bTYvZfVl4kfFL2pqFHX4Ww8bY/LEAHh3Ycgl7bJZKeAAMse6axnSSzFT+?=
 =?us-ascii?Q?jKbj2VMCXVjU5k43lBpF+r6gZIeAADb1QRJhYLfzYNtPKA+Lxc4OHXDtsOEB?=
 =?us-ascii?Q?+EBU2iMd5H9bGZQnC9tVYR8JFwJeqTzY4H4mcDox0z4qopMA4uI55MkLBsNe?=
 =?us-ascii?Q?EpjQGfUHMs73y+Oawz2uT3qdJkp1nNIGo0pNpi4yV+kKS6c8WJFkB1T7a1pl?=
 =?us-ascii?Q?CYMNLEOaMw7d0Y7OkwTXDm5oRGwY4gNAf36tt3/C87vUjiWLMlpmKRoYgbrz?=
 =?us-ascii?Q?Klh7z3VUGkqSMIYU9FFxSnZ9JNooTJuVAcxaxsr+dPZYcJvF3Ay0f/w+3S9f?=
 =?us-ascii?Q?d46RY59xcUDbGx5jhwgj01EzyKXn9ohx1AzqSb5NC/3OlndkhQRCMvM8u/fB?=
 =?us-ascii?Q?vlZK/bTUK4m4j662hxHDo3xha0EriYhVk+SKJermUtt5/74K6uLAwQe+pnua?=
 =?us-ascii?Q?gQHmfTfwLCM2mzAwucCRfh0V0h5zAdbu7vJZ1AT7HlzhZgaIUh1++9HhNZNg?=
 =?us-ascii?Q?RoWkbtb2vCh2JHH0bU6Iy6qBrKXg49Qi0qmkE7MeLsexDzZIQjdwwhx76kO2?=
 =?us-ascii?Q?KKDmRKgkOICm+D1PeWKAkgiU4jzMoz7H/sKruJnw2U0yJHIb0S9IUeWGevye?=
 =?us-ascii?Q?JT1+w7pzbN5qrTefflGrAtCV4TYuxbJHoiskseFISDohYsSKojGqT9igyKe5?=
 =?us-ascii?Q?GRkM2CsVyX5o6ttesZRyOuFczh6dHMgLKQO4N/0q3718xcV541jHbYHD8ETf?=
 =?us-ascii?Q?MaxEHWzbW5wb5EPl5w0HyDrbCuNh7aVNoLMfUltDPLTQPy6w2NoGqVqQB9+n?=
 =?us-ascii?Q?jx0lInbhxxVFFc3GXmdXug0e5p3YLUO2x+1GKhVoIf/Up7cZsIpz0y6F7kDB?=
 =?us-ascii?Q?Ds+fRj5ryqMXmjCGoMd9pMTljuAGqTeOFRdzl0nLQMKC96Xdu9PXO+fkoxns?=
 =?us-ascii?Q?6uBUeebq9FxegNJdF4ZKWBzc494RP9Fnu+zyWkQu0EdBWT30mcpszrLPP0vN?=
 =?us-ascii?Q?HZa3TLEIqkTUtcRfqgCgvwFz8JCg2V1hefzOVJDJu9zM18y6QVxvVo++qmn2?=
 =?us-ascii?Q?V8w+icchH2UD1F9RfGhSJAHaecYxWjkWP+MF48Ke42EW9F6O3j1lG8QW82Dp?=
 =?us-ascii?Q?0CB/BG2sekXgPxuyJBcaVH/Kr2PSTTmsqlkq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zyyAawbgsOZmMOB6PbbWHvgBReU94x58c64pBTUfWnh7tZiJ77AxtL/j1NqR?=
 =?us-ascii?Q?W2uRBGGAePh1rrvYT9YOULzngulw005+VHrIYoD+bUwTQE/tePTBPV27OFWf?=
 =?us-ascii?Q?yf/LK1ip+QRxj7jrfRGIe+hcLbR8D91Q9Ksvro7QsJlUoS0DTpNVBrhS6/Fw?=
 =?us-ascii?Q?bF9+uKkwPzRIQ70itOB6HmNq3ehg9U5wj45PISbk/M/Y3oAQq+DK28icmLdH?=
 =?us-ascii?Q?tTnf1ouZZS93wEZ3pwiOSjzLBXV+RX4Jyq03A7uwZzAsc3BcdvopdQU2jfF7?=
 =?us-ascii?Q?C3ef9S7IEFFTyVvrvywuWlGuVswo2L8ZVhVRs9pvVkDo3BBAVaOJLM+zXQ3m?=
 =?us-ascii?Q?YSwuKFOQfuWeVaBatpIkVqQQffF31GCBZsxNT5C/iOXqT0qMy4IfU7NvrZuH?=
 =?us-ascii?Q?GQr6t7z+3hGDHfeDhLEZ7Yiq14OCiMOKBmvlbyvRuT7y/OIUKlwpnzf8CwPC?=
 =?us-ascii?Q?mgir6WwKHq6ztDlE9vTkrpP4k8rnyoS0ohaNeZJfZcRrn9VpdkmakzdhlaYh?=
 =?us-ascii?Q?NW7u4Wx9n+GSaaarStJaJer6uXpVdldGaIstxP3iu8nBH/oGlfxJOMjqLfiA?=
 =?us-ascii?Q?k1o+r6FB7VxQK1Gkm45/k7FkmYhjDjy/v2/l/9cv6yx02YGQQfGnY/V6krmJ?=
 =?us-ascii?Q?xfXwaKYn8y3WbIMQtZf2tdPF3P2mOY2zxTXLJt6nx1OTGQDiX90VJ7UbxM2A?=
 =?us-ascii?Q?EKN7hqDFW+zPgi6+NaiKKg29LJYa3otHSpqvJgSWbVxPaxIeax2Z8dW/MLvZ?=
 =?us-ascii?Q?4XVzGp9LaDZDkg0cMVEBSKN5LnNPgl8BhKTCuG6LeMFCpi5ScIYe2MLi6ZKo?=
 =?us-ascii?Q?O4LZDAaKqC4wqvVnCZ2l5c2qpFd9c8bIMY2SSkWACKACDpLFZk//OfZj/g13?=
 =?us-ascii?Q?L/dmZVKbOZcI/IiG4Jkt3UVAyldcM7mVx/hyr85wNdFJWjG6MJfO28MgcGOg?=
 =?us-ascii?Q?EwIaQhWbSXKrlbA0Bwk1iRaIT79aZl9hicz4kF621wCs2qnM2ldbss9gHjv/?=
 =?us-ascii?Q?tl8tdRhXpSCk+eNf/dfSKM1wRKtvCzO6S/KhzV8WzaFJNdjs+Jv0mKc6aOoA?=
 =?us-ascii?Q?TWfJuvDIo70v8M0FiH2TkpFxFsrm8Fvel5lx+IpVwBhrfcDvHG0JZ68m0+Kx?=
 =?us-ascii?Q?84PaKglucjd5+hraoEH/3yg4qmeqrCLU+hs0AV5epTOthg8SdbHptJNQDLaP?=
 =?us-ascii?Q?+dDob64li/jNVvLg2WvHhWuRdteJJJCb+hPf5wCiZMpChI29FuFHfDQXZOaE?=
 =?us-ascii?Q?TBWDXaaSszd0FJMDocsyOFDGGm2D1z71QJuw3QTAmgXapr69fcohyNOs9sSZ?=
 =?us-ascii?Q?NjUQnSOCkzGqsXM0Orm0Bc7dZl16a20IrAPIo/uSLClc+3qv8uRqN3UVU8Bd?=
 =?us-ascii?Q?HiihDtxAP3Tom1rD6bhb6GRn8zWJ1OaXs7M9YVM1CKx3uhcTRSBg9NvTp/XF?=
 =?us-ascii?Q?gNbBVxuoAA2QVfV/Tkg2DN3tjthf+it2RpR1WiRtUQDq6qKtT2T/iVZQwi1H?=
 =?us-ascii?Q?hkQ6IKCtapYe+DD8qUJGTeptcdnUIY8a8ojlVH12eFtzdlNrIKH0IGZiFJc9?=
 =?us-ascii?Q?593IqpIbfprek2JEHfhuV7Ww/iXUCq0KqV+mr3/IQEaflSZ+NbjBo+IPZy/V?=
 =?us-ascii?Q?+GmpEex1jTD0fDItUOAJ0U8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd94dab-e819-4212-58d1-08de0ad96c31
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:27.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD5I+aTns0352JhZDHqbfsGbDHO0V2Es1MPjKdf3IISPN2lahsGa6SHsJP2q2oInbiSiQLNpvwnZjDfc4JBQsqA6iv+A41vaGEetgKs2MVLIy233rSmvblMePRaF4KNV
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
 sound/soc/codecs/peb2466.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index c0c5b3c3e98b6..f1ee42af264bd 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -276,7 +276,7 @@ static int peb2466_lkup_ctrl_put(struct snd_kcontrol *kcontrol,
 {
 	struct peb2466_lkup_ctrl *lkup_ctrl =
 		(struct peb2466_lkup_ctrl *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct peb2466 *peb2466 = snd_soc_component_get_drvdata(component);
 	unsigned int index;
 	int ret;
@@ -377,7 +377,7 @@ static const struct soc_enum peb2466_tg_freq[][2] = {
 static int peb2466_tg_freq_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct peb2466 *peb2466 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 
@@ -415,7 +415,7 @@ static int peb2466_tg_freq_get(struct snd_kcontrol *kcontrol,
 static int peb2466_tg_freq_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct peb2466 *peb2466 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *tg_freq_item;
-- 
2.43.0

