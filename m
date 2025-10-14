Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B230ACFF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415984; cv=fail; b=Oy2kb1bJ96hyvvL70vVNImhvSsItFJv+vLh+rIIw/nnt9Zlf682fSl7AatbTAAcjz8KuYSBQgpDQILkOJqcPtkdZSUXksSfCClRv9EY7Jf3Dz35FFyyUN2Tvm2fdzGbPlAK/JGMOftPDrzRBLnG+ABWdWAAY9G7JlnLGa9MdX4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415984; c=relaxed/simple;
	bh=TdAUl/HSsUbLxLGiYUMbfwdcIMTNl+4BvBsEUclo50s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NexWN28FR7tjCiogdJYEU26PF7Tk+NGQ/PM9oGx4VLlJ4GE03eb+4j2A8JJAF9A60o4QaD46vzN1503tyF2ywPuYRyvyWNC8A6B19yTxBn4+0Wn/JohClDYFF2zbHQwGnS15CiENq8zfZ4IHpCWMw5Qrt1D33cxqhEgYUBp1f6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iTpwE3JF; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iTpwE3JF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtgUHkaDbvUF0nL9NQGvsWLxddAaK056aroSk9eti1JGNwrUtSY05ycpY4qYlxN5QnnEyJjTsrLWvMu6Pa9fvtVWqbj1tviv1IfJQC1pPRkqJ2yUMrlW3PptYUmptpXwA5kQ5rW8/7lCw3PdDpx1hhBN7QnjuVnJ4kIh2nuoKJk/uoX8bkCI9KoSbeNk+Bt2GpZpTA4nzRr9hjlwIWF5nLxPo7fIS0iPfWgz99rSqfw6b5YWXgAiyRBcL9bv7WOYV2/WDllCcCiPV2BH35mZjgU4Gk3+brdyqEMbRB32Se45HvCg/XaoAw2TMxEGtbjWItZHjqVfwepflXdw0Qq5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evHBcL24kx0mHAktPyJqw69F02k6dnpMzpYXiQPxiV8=;
 b=Exthq2MeZAhe8jzcD3ZS4rQVmpGI7WS0T7DxGqlCuA3P3MZiDrApeXXAP6eUKis6XeWsYAzYB5VNZOAMN0jrZg1GrIO1AkczyyaJj/j9nXMdE52YxF3/XyIRRa66XqmI6Npdv56GFsszshSAiXSuIw1csk6qrC/gGUTw/HVkygXqOxSdGJlvHQbllF57icR+FsTrBks0UIXF9HBvDaBi17HsoTQxQY0Kx7duK3GoyGHGbD1Wj5ZtL7ak0Nh7lw+nxLxEczlRFrQeeF0mRmkPvOU4KhoULZcwjxK1UUtzP27g2+Thgh3jYpYjI/cOqY79qkEd3SB+X1acHs6cUFqBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evHBcL24kx0mHAktPyJqw69F02k6dnpMzpYXiQPxiV8=;
 b=iTpwE3JFGv2UDmJ8SNlrYsw/X1ka7ToFAOZ2eWfqfmt26YiHFm3m6y/oi+wXghsZI1eZ2hjD+lYS7IVVBWUa2wHoUIZh+bmXID77XEC/nRZW5DL1K31swuPaUL/M7bOU4qSFCDqq7JZqTOtpz8nsguXWU0LjyI17SUmLjai6oYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:21 +0000
Message-ID: <87h5w2nm6q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 110/139] ASoC: codecs: wm8955: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:21 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: b709fcd2-9ca6-4095-e256-08de0ad9d403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hz6+8delET6SV0wb+XOVz7GVqo4gH2j1okDhWAWQN7+qCCC886GXuuNgXYG0?=
 =?us-ascii?Q?gljaEOSs8UHDJh6V6+32PYQ24Joph4SORMerZnjLCX8UaYm4VRJ+Wsg6uZZN?=
 =?us-ascii?Q?0rm0WtVzPYjoNkGPOm+jJHJbPI6zNMz4i966ObF8wBilb551V0Nw7il/OKKL?=
 =?us-ascii?Q?c560HxVJOXpWnydIDeaayFRzMK/BJAdkP6PbDTBMOjvITV7JJuOYxybiqaWi?=
 =?us-ascii?Q?fwnLV7/PxWJlXctqP84ZL8DXlI+kRWlzV+Op9wZg8jCDuE4i8PF9GwzlVamA?=
 =?us-ascii?Q?rdSH60BhhxT2t9KmGigdjZqNw+z3Jdp4cQme/dOabxYBx9U6kOGIuidHg2lT?=
 =?us-ascii?Q?2cwdti1OUKn1T2Nqcf6kB949YpLahQYZusGL3NAspH4BOt3srKEYF5MrqGBF?=
 =?us-ascii?Q?TTOm+UKJ5OuzCaKU4s5fC8xgbWHurfFxLgozxCro+aKn5Rkpr54AaW/992rz?=
 =?us-ascii?Q?HriUwijBst8DQirR3RmYEOCXGcoa8hFxVZ2YDeqBgKjeZi2F0wwS+5K89VjI?=
 =?us-ascii?Q?Wjpu5ceqs5Zqw8paVGsSw1iRt5bh2Yi2+b0ffYQ5Rb6BYMHy1UdscP0v1vMm?=
 =?us-ascii?Q?swAMjcQBYnPl6d/bhJQRVKbJMcfQ03gj26ZklZST97V1XHxqKyegY55FpF+N?=
 =?us-ascii?Q?PGeQcWJSkWHJBRTsfgt8x9EKHGVoq6cAPsGTVPWe+dNvphiV0pkILCYp/C2E?=
 =?us-ascii?Q?EyoWJlNixtRy0yIvg+a5RoJ9nYzPze/s+q28GzoE63lo+dpuTloQNTd800E7?=
 =?us-ascii?Q?MNlophe7FxTXptyka20Lza2L5Wwk6/jyyITuUhHdpXvQHUafLKmQx+B8PNPn?=
 =?us-ascii?Q?lz0P1A5qEpEcjZpNoLWFDzsFj8qd+BO1jkiokPXYqliNvP9NJxpSN/ozX7/L?=
 =?us-ascii?Q?biT9SvsB2mNGm2ghcjm4CX/uelKfHqyL0ZcSbnz9QskEu9khmsgYeARX5CBQ?=
 =?us-ascii?Q?jqXzxBB8c9Nh0DmXm3zVAC3DkvdFoSV5N06W0E/M9zPyjFrD4yUmeX+M2hmH?=
 =?us-ascii?Q?M8KrvOygHT4pDG7MfrTIZ6LLEcY52cq3Aw6sjNXuZOhOkkeYt7bqUdrX1w45?=
 =?us-ascii?Q?/+9ybsUEAFYV5m1cEHCMNvqkJtvycQsSMwrnG9i4AlCsDpnuzqjhRoMXGpp3?=
 =?us-ascii?Q?cxi4VN32BstgaPLp99Y9/DHloW0+T3ybnD/jWsE2/Sllj/k+2RnR+c2JSkYd?=
 =?us-ascii?Q?jhGRLAYkw2XaD+bGBzjZU+XnCPwZFhqx0gp9CSHF4CDkGskVVL3re6odvw8i?=
 =?us-ascii?Q?MpmkuJu5rHWVIo8pfXMj/Im1XTwWSMGbcPfJNsRhC5+BjWdc+zlDSIjE0YG5?=
 =?us-ascii?Q?1PI3UFJjPXabzEzaAhHwiUIv+9EOoCHx7tlyUm6M3iRxGfvi9WhQzSeXyVDh?=
 =?us-ascii?Q?L75s+6fUqXsmNIXZnxWEMZfPi8smCR5hDYf/knZ+fFxOKAA6KqnGI6pz4GBQ?=
 =?us-ascii?Q?IZyKnIOCGdO6PVFwGdMxNm5aME0sOhJnLn3dIepmoRST7/MmhdKnDLbfaA3+?=
 =?us-ascii?Q?9Q8H/DkjLcf347PayPLcc5ZZuvfAOncYaXRY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PHkcghYc/72pMwlzP2aw8IiA8L7VtN1qPzeQKoIDygKZ9I9ORGM0D3pk6lIx?=
 =?us-ascii?Q?dGRcUr/HdYoFpLIxdhzzkxbqdroHlMtZqfWg2IcycQ4G+AssgHQurqmpYc/Y?=
 =?us-ascii?Q?gcrzcP2jyOZWWbkfgFT3HhzPI6VjcaCA7LIgv/uZQxo0GkNfdvZMlOH+kOYF?=
 =?us-ascii?Q?HOlAlhB0xGTQMkAPFkIPLZbbFIu40as5hybcVW3NuH9zzgLOHHDE8UXXEO41?=
 =?us-ascii?Q?bgwafpJ4LnQAYJqIRBQBj7njVyA0+YgIwt/qb/H20/Umuvn/zSIX7KRM8I4B?=
 =?us-ascii?Q?xQs8No1rAqE9AvXZBeJDcoCTpBSJl+TUFC2ITILz0IEy+kgil42j45CIfZtI?=
 =?us-ascii?Q?fyhkqCa86te6iMSMXkH6uKkT5RkVU2Zqqdzev2Xhl9xKDENvGfSynCqcEtb6?=
 =?us-ascii?Q?8dPp3JVitl4G+blxFH/CeB6UZE9guISiaTu6JiY4aq5wMJD4Aql84s+li3nT?=
 =?us-ascii?Q?yn+GxS2++ODODMYbKR62Gya4UuShzlJ73Uu82LvwGrIkwpbcZa8dVWV+Xqxp?=
 =?us-ascii?Q?3DOREYYJn0Coztjr2mJ4gk0I58Z0vGkWrJbqpVHM2YSVLXyltcph9zxbGZqc?=
 =?us-ascii?Q?2hx6j014CKOUXHETUMthbjVUDafH9gZOlE7wRLu4UvbNwGWWZmthSUOHcF7w?=
 =?us-ascii?Q?UMyPRcy7dUwK1ahdhVz+KwhWIlG6pQlS558MRSqJ4DlA7h3ncZUKKzyydUbu?=
 =?us-ascii?Q?DFnfCTu/kAYdBT0bmyKNbJu7BfNL8xox2OUq0aVGOxRzMGajtpsnX4MtoLns?=
 =?us-ascii?Q?bvHbbvBH21C3koo3hFeh7xRiYw9UJsWq19luGS0bGeZPoilFeYgtE3GpqPoD?=
 =?us-ascii?Q?lZv6MGV+l/K5yCo8GZuui69w50uLOtHaf+SEioTmBzZdIZPIETSiD5kckb8D?=
 =?us-ascii?Q?57TEsdGRU4i3F68F1oQp4eudFfe/ZjmRwp2zBywIMIq9AFEwDQ8ebdwAuXTC?=
 =?us-ascii?Q?cFoM/GNM84K03YMfW8U7X1LkHXekeGBvg93HpflEYaDpgiiMiTphjch/1VQh?=
 =?us-ascii?Q?hGJia/FspByjNHuBcEKAz4sJUqeUHK/2S3BiY93MZFR6TM1OCgL51JMlox81?=
 =?us-ascii?Q?MICWCA1+DUEWSQB3qgUhMNL7FZbJGqaSb9L2WF6GNniHIjiR44vGHVcoYBXW?=
 =?us-ascii?Q?UoBHvmDjV5/PB9kel9o+HmWuOQmxPf0BgnFUBDR0h5oR7qLHY9iR4eUSg8xP?=
 =?us-ascii?Q?1tgSoHM9DpN6IdJTotnDv8i60AHzeb2XsiIozoxynxrS0rfZrPmxoOqT2yis?=
 =?us-ascii?Q?TGuZFMIlAVZpeG0xCAfAUwN9y/m4GQ9BzlBd9ZP53cYn2tNzhHNbYfHQheMh?=
 =?us-ascii?Q?0JQaYq4VnZi9uCMvcofuEfktLUXeQqRiC+RUOaoK+J+vz2nGdd6Qkead/sFH?=
 =?us-ascii?Q?Dw//A8VkHcfLtvYaoK6xl+NjxBTzcRRfaF0e+ePPa4+6iLiIpG7mRIGIM3EB?=
 =?us-ascii?Q?FAJLisX7TEHT0JVdZAR0DkcoiyNjnET2H0MX4atzWxHiSnXsSXqEu7iBKTKp?=
 =?us-ascii?Q?Acu28XbXH/wKYgPBQziA55FHcBZix3jo3SICHkVVHpu7BEHSwBP3WA9w5YR9?=
 =?us-ascii?Q?b8tT6uDMV9x8TQZk+WUroNLhvIEEseibTKy0VQ+DfxpRMxz53V5CbgYeGQPC?=
 =?us-ascii?Q?Oq18cNg+eVFzsijVReLt65Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b709fcd2-9ca6-4095-e256-08de0ad9d403
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:21.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/WxDoG5uP7tnMBgRJ8gNJjr70ueD+axmymyEiVmUmr1YPb5Xb2GTx/eFxhq2pyYjn18/0Yj6HeSiwRnmDYmfsytnmA0l5lrWFphcW9nxaFz0wVw+oeL9u1b1n/Kaj8E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

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
 sound/soc/codecs/wm8955.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index bca83410b4327..82944cf6e3cf0 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -387,7 +387,7 @@ static int wm8955_set_deemph(struct snd_soc_component *component)
 static int wm8955_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8955_priv *wm8955 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8955->deemph;
@@ -397,7 +397,7 @@ static int wm8955_get_deemph(struct snd_kcontrol *kcontrol,
 static int wm8955_put_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8955_priv *wm8955 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 
-- 
2.43.0

