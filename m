Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDF1CBEB9
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963293; cv=fail; b=gTMPt5f/b/VHlU9tNO5TLMC6cZDMQRRr+e5jTkmA6B32qUclMdjdDGrZTbZtBOJb+4r97XzWDP6OWg7HvAxYLYV91NMCTH80JaZ0qZD1JmU55iQbDrBw1qyAQBwXBTGGFX69TEzvZuEbgyvkZYKjYIZUeMj4LUgJiOlz/qmKok0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963293; c=relaxed/simple;
	bh=isYeNbs3HKfuqsmlszPrCSPDvaCGjG26YhPGEsdyK5U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ANQuwUDc6QYCEoduFTQEAYufDOobjm0kcUSvFICbASVq+9T6WiI7XmVW+OY/Ux4c5EGGSEhHobunRGvAh2UukSUy3To/UhyLRYWJhCf4SERde8E2ubPzvBBOuzOUglcnLz1/TFvQq1y2PGpAXKXVHp6OGmgfk491VPCQ/YTz3w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vo952nDX; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vo952nDX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSoYbxHHPw6gLQDdD5VzOl/0hIDfyKii08d9Hh55JGw6opeRYfcqBAlkCYMjiajr1f0ZeR7t0C+ooIi7HXoa/rHI4HCTYxABIlywtC2MQCxyykXyGpJ+cqwDPmZ/cV9RKr4yyOXmaT9+0lcMbRIo0J745gcPZq4kpbQZraVWsyu/H2RVBW63SJh087Slg6u7+W6asV4heYaraA/r71juJDpPue5Fmcf8XRCaie2SsfEb6I8YewE/vLE7Qwjr+1+eCn2IXnEmLnRfkOs8AQM2T+FSjqQMgE/IUrKJBKu12UC3jE9W/XQfZwvOYaiuA9ZFJSpeekGMqNGeYQcg3McYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMiLlSUCIseu8oqbSssRmTqzRuz41LGPlmY2uQC0SLY=;
 b=WveG8VmUsqJ4HJuJBmQfSTQOdN5o2VfolL6JnKwuJlyqduOgc5xoJeGMLnuV8RecxBR1VIxqP++3v+7t6gZsu57/3s5327s4ElmdIV9T5hb5MI1HSQTkdf2USGkh0/RT2Z2Y4wFD6WJ2JPYyMlNBJoFA7jMw8sU1smkD0qsE3al9qe0Mdafa+Rei3pm1H/C7cThXPJDT6MlHS3eOqEyvdItj8/X5GvKUHOyAFw9mztkYohw6/B8Cytr0yEnHb7Q7DBhoeBUvlbgX6jb9PEsj2DeWxn6tr6uCh39QihgJa1u1VnOGSYuzSGKhFbq0wRwptzd03KJT9wPJwn1xCNgYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMiLlSUCIseu8oqbSssRmTqzRuz41LGPlmY2uQC0SLY=;
 b=Vo952nDXK5DVr4vCAfc9VuXK5cqDsQd5hsP0zl1HgnM1olv3MwtAzb0Dta9Itm3LijeqcqexEDzsNjUCZ1VpEU3C1A9hRFpC2ztbVL/VPSydE7qwnXDuiUsunof6/CPLVEu1DoqcBhHyrixcG1VWXOMoytupDPJlNJBkvk1AhZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:30 +0000
Message-ID: <875xdyx06e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/10] ASoC: soc-dapm: remove suspend_bias_off from snd_soc_dapm_context
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:29 +0000
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 60919283-5409-4247-bd76-08ddeb72e76b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5IJrvodvMKiyJCc9LXGwfIsnv2H71ywymXqle8QimolsbgRZIqhJFEP2qopp?=
 =?us-ascii?Q?xq33ltdtNsGzpiSpXb1sDHIyO4V9Ken46vWkMnlgyUYwbt3XyIkGSPw04TLr?=
 =?us-ascii?Q?cN7rPMfu7NnNc7tCpidJeutTaU/FjlV4/PukxuQ8iMBO7mHowduW4JekPjSW?=
 =?us-ascii?Q?DD4qn5vQQ7G/sGpzLoRdjZDHZZ927Ew4uDYRcA4+KOH38XkxCizHTvN+tPR+?=
 =?us-ascii?Q?PNwsUSRIZz3KSa7Gup3jZCLhfqMf3o+PcfapyB13kbVkVXKGm52XBVd9/i3g?=
 =?us-ascii?Q?gMTCbzCRU5jhPZGW/uM7P7YJ3DYWDu6NMP7M10CkEMPJeMH++YCx82l2SK8N?=
 =?us-ascii?Q?xpOxu19YpKlnk9Ykc41uu+8xah5Qr5rB8QlDCRr+eoXpFurLKjfWUyylnwfM?=
 =?us-ascii?Q?e33mXLh8UTeJGwlEMqLonXZ1/L0wO9bsuHe9jTscgfHr3tnjUjQVQRW5cure?=
 =?us-ascii?Q?zeQ6KZC853ShMKEptzloVcScVVnatt45GO9WNCgx0fRHFkmWWErtd3reYNJj?=
 =?us-ascii?Q?AAseGrB+5K3H8127/QCkkZ6i+b9QESdJKwjQOgY1acvPGNqlMUXSxzxUgcQa?=
 =?us-ascii?Q?0xyCFskEDs7apf6DLCiRYiLUjvTyIF56RImGYeb1TVe1kbKx4V4G05yBVcBd?=
 =?us-ascii?Q?LGU6Y9iAUvUYd5EzS0WM3OPU7CMP25cXxfWymdizq2NWhq/mgY8xNJ0odH5J?=
 =?us-ascii?Q?R6/XdYVSn9HPPUiRXAOJA7uMITn5Kdy6y8UcgMv5/0WT1ywFvMsUnuCjPegz?=
 =?us-ascii?Q?f/Dq+e40SvRfLumDqF5i0XKg+H8OYcvcw7k0NoNNnJirXKL8cxjAKj9hfr2p?=
 =?us-ascii?Q?StywWIBavT0aar6+RLKKt56qCgF9d0l93L6as7lEAoxBckTEO0oQBjdcy59B?=
 =?us-ascii?Q?26ssY3MFsR4oDowGjbCXT2oSmDLgsqRe5v7UIE3QL5+6kfC19G0GokYyvbry?=
 =?us-ascii?Q?Zpmf6yEsOsXUi7Ogcuu+/f4zzZPq+/CNbNRuIcI4YlWlkTfMksA4y8xie7hP?=
 =?us-ascii?Q?7dhivF3SnbhiZ4fpePQw5CXiWFnewEHx+suO3AAur35yk7IF8EESSF7Yr5Nv?=
 =?us-ascii?Q?74sHLxA9rKD0PhZjRwvbuXdA61e/hrfp68GhyxZfHLUnlkHDG7tCl2WUhw5s?=
 =?us-ascii?Q?TekXiqk3xA93ijnOiSybKX3Jc3M3q4y7UREejvTqn6cU5EZ1d4OXkqgNhkar?=
 =?us-ascii?Q?Uy1sIRXgaJTTMZb+cPq+Qi4WDQK1q+Bgy06z55gjVm9xhQaZZVL40PM2IOD4?=
 =?us-ascii?Q?HqpURy3SVfSlxNIEFCntjGkw+5uxk8k1mNvOH/Eg+FxeC9ij8sJ7K2W+j8om?=
 =?us-ascii?Q?gv3dfhqHL7R6zbu/HhhUh2efWsVV4fMw52JhJExgC7UtWd9uz31HrR8frydC?=
 =?us-ascii?Q?svAZa84SeuSPgzr/JP4qhCt/V+kjMsCgzffNkvTdXjnTonL1D1o3tXJEnfKL?=
 =?us-ascii?Q?lu5S6w34lk+Y6qOz0s7eF1ZDiSUs/79T49SPoKdXd9NFrmUFeLnCPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TYIkEyeRxR6gj/uAJYH0P27A6nOC1Qd+/r8hLf5ZidrGX3Imd7f4aer4vU/w?=
 =?us-ascii?Q?XZPovZVkxm6K6GB94eLg9o2jBrSVATEWjXOhQxmSvmH8I6zT6O43Pb+vRIbX?=
 =?us-ascii?Q?haY01Kr/Sqmn7zfiicsApIS/AOCx5SrPpegP46ltvZC0WobA+AQMQDDEU3ap?=
 =?us-ascii?Q?3DgaksWlmWcVhagOFbKj41u4QFlA2EiuOnh8fP3yZ8rV5A4tQtuC/cK26kwl?=
 =?us-ascii?Q?D6r7kF5+YEeC6RwlKCXRQwn1X2ZUk+BLVEKykGswPV9I9xvTPY0NDouQDBVD?=
 =?us-ascii?Q?A/D/PRnXK4WfBlWnE32w2hysrFmc452STkWLci7vhY8bulK6T5Xm6j0OxtRR?=
 =?us-ascii?Q?hP9eHJXXaqaX35kE/karNne0StZ6t6EGSJHybnTMkvs2AbSzUeI4WAMyTaq5?=
 =?us-ascii?Q?USZezJqPuY60SBA98fq3XaAp3ixshgzM9/UhqYk9gzXryAL+BT9sp80WK9+v?=
 =?us-ascii?Q?mNDjP24I4TuKN1bM47pF7wAMUN19rZp2m49oIz4jn3a05rXxnb9jOfIqROiG?=
 =?us-ascii?Q?q53m/HuxunvdZtt8JULPsHEYrNVnGnZrz1s6VXD3pAHPvV4mnSlq74pXq4IZ?=
 =?us-ascii?Q?jyRag7bMWkFmaUXBErfN1E4FWz6w2YZYpPxulcKJfo/4iRLwe6GRGjlCd/BY?=
 =?us-ascii?Q?2QWhjpbI8kjxe2LZMeNwQuDqpSnxuUTP65O8ZX9q2unl8X0OHWkr7oBXarZF?=
 =?us-ascii?Q?QqJh1zF/3dzDy+kMG4EKCTy5Q2k7//vKEu4X2IpgmB5384GHWZE61ecGX0lp?=
 =?us-ascii?Q?f8sNlpnvTF3xw9bwz2+a+GMSUQrExq+UXWxW0VHQXN8STovagqvIljuitr12?=
 =?us-ascii?Q?UW1eN+QBmwbDwXCbWX0nKoO4hM2qIzLr3k/O6c75tpeSOXoQDxhvkjX+l32O?=
 =?us-ascii?Q?TGCWMyBTKkZkRwBcNIc7NcQtvxDCjfS/IOPPal6e7kIren4q97o1kgmWatef?=
 =?us-ascii?Q?xx7KLZZdqGqSP31m834BD7P/N81pNM+AlVRDFvJAwGIbjH+f4T9KVKhJXGlM?=
 =?us-ascii?Q?cxxg6NNkP75W4m9z5og0YBI625/fA0fG7pToAhj4CGMDrrNosuZnyKqZOXCZ?=
 =?us-ascii?Q?zznqjWMkhb9LAtAy+Ao2EGEweJOH6OQm6CyFSHjmkQ6J2YXwe0aI21H/YCd4?=
 =?us-ascii?Q?+te4sZciHTIxV++yIBQLtESCZhkhEPu1a+m8XScITtQ/SpgEP7FtV7UQxvks?=
 =?us-ascii?Q?HTdwvqBcf94q/urJSep8LyMiSw1CQvTEKVSvYVkEBiUEXvZ347D7VGjiYJsX?=
 =?us-ascii?Q?hdzoQo+v2+8Cf/ZftJzkLVjvLy3VNSeMYtqz5m2/Y1dfrJp1ac45HVB2sbYO?=
 =?us-ascii?Q?Q6r413DkMPT8FLMZHUOVOV07XeaCPFNTsqQjN9CCHY8k39ZPcRvOGL5UUGSx?=
 =?us-ascii?Q?VtmxACn8ZNIUjBxNuAxmA+K7nGfZ6dVMvaayZxoCUIroLK/nqHwQEiloBQqi?=
 =?us-ascii?Q?/5w8zTuK6buymmoVMiLps2sri9EAXfMt0h0Q6wjbFdQ2dZuZSG/h+r1E4658?=
 =?us-ascii?Q?ecPP0b9Ze6H/+IjB0U6lPFEjvrd/WTMolmw7l5wybsesDUaERA4YErAAkHZ9?=
 =?us-ascii?Q?+rz+QIIdQ9e1z5QFh9uUjpEfOHzmky3aaJo+nbQSXyt9rskCSJL81BdgKUUI?=
 =?us-ascii?Q?rN6UBs5ZHWJcc6Dc82OztSU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60919283-5409-4247-bd76-08ddeb72e76b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:29.9672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlKBj64pnSV4BPdIK6+KEuiDhe/JfLEAUpBzLmPieByBKoN6OBHk9XGePTKjUR3/iwsbQODY5O40qJjBKtqgvw8hTG/YTznWyD2ll0tnkpdm2FHXDlJswYlfe86TJXQ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

We can directly use suspend_bias_off via snd_soc_component, no need
to keep it on dapm. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 1 -
 sound/soc/soc-dapm.c     | 6 ++++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index c6470d391eeff..498f8af79cfa1 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -585,7 +585,6 @@ struct snd_soc_dapm_context {
 
 	/* bit field */
 	unsigned int idle_bias_off:1;		/* Use BIAS_OFF instead of STANDBY */
-	unsigned int suspend_bias_off:1;	/* Use BIAS_OFF in suspend if the DAPM is idle */
 
 	struct device *dev;			/* from parent - for debug */ /* REMOVE ME */
 	struct snd_soc_component *component;	/* parent component */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4550bf33add27..b90d0adb77132 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2182,13 +2182,16 @@ static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
 
 static bool dapm_idle_bias_off(struct snd_soc_dapm_context *dapm)
 {
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	if (dapm->idle_bias_off)
 		return true;
 
 	switch (snd_power_get_state(dapm->card->snd_card)) {
 	case SNDRV_CTL_POWER_D3hot:
 	case SNDRV_CTL_POWER_D3cold:
-		return dapm->suspend_bias_off;
+		if (component)
+			return component->driver->suspend_bias_off;
+		fallthrough;
 	default:
 		break;
 	}
@@ -4823,7 +4826,6 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	if (component) {
 		dapm->dev		= component->dev;
 		dapm->idle_bias_off	= !component->driver->idle_bias_on;
-		dapm->suspend_bias_off	= component->driver->suspend_bias_off;
 	} else {
 		dapm->dev		= card->dev;
 	}
-- 
2.43.0

