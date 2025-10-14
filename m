Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2B309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415794; cv=fail; b=hSTSFKBhWWCPO6nFP3/Bu/ScbLWoH8IoV/0VvDrOY/SIdZh7Wz34McSEeQY4RZAMyYalSt6Ybf7j87SSmdEL0WKVm4UAMZpPHKGCjFiqvco6QaQaJcHGrPJL/+G3jn7yWOTeKRPgtOquq4XEJjIJWwEKmFqJtYronURri4wAyYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415794; c=relaxed/simple;
	bh=toSXW36zYmkgOT1xDqnXYwzhcZjp/hAZ+cQYD8Qamz4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jeS5qrbt2COcD9Fuf4PnnVJ1RECkqdj27WoITr58iro6+nJyOMmRJHgyzUztexduL4oHc96JGwWHjHQiZ6Xevr8+ECQ8PDApm0eyB4SLSZv1hUZ7T3duYT5sfCcGYoM+eM9Qb2ZUp3K7Sz7a12IltN2RWV85HFd2OslphiKcxZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fXCwY1nP; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fXCwY1nP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkoMzRNCNnxjHcCzIZ44XZK829Fp1ZTJI5QGpkz7YyJ0DUmmusAhL3hgYbUpR5xkzxwhlHTXHR8KRCtR7SUH2JZl2HnuP2+gidI1HP+GR+XOu4Cs6ZA5SWcWDPy5xZVC38Ztn/xHkH2MhoDfdNfER5rdYFZfGSq2IVvPxWoXNMpWt2mx4k+u2B5W4Wr7Ds46GjMzeJQkXt1cMNIvo/UQUf9MElJ58Lcnm4rpL7b4r5VgNB2A/gJpGoALa+9aPIFEK9tr3bbYd7K8pO2+YSpaRXQ8k3aw2Yym3LxHjknMLurfsHfAw1qgKY1UI/58O1Cw21P9Wcuptb+1n+R4bqOjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lphetjmX9DyXKBgIOWnqWlxtmwKTEbeF096YmnoDMXU=;
 b=i98IdHau8JT/N5/zRokZgqZwno/co8/VUr3UF72Km6EbEY8tC24nQfMP+LXfBD6HVdTA1G6OD2N665f9eHaMLCOQHXIto/yEeI8H1reUBpnylzF1xYQ5BIUBkfsCUCbtMuiIVDijUTFeEsvmtZ/08O0Ewn5D5f219RRllv1gkZX+P4gRgY7hjNDFEjneZ1TltpTwsIwYf1VnhtSGnW8qNHghEKy1J4tLlKzpoZSrNX3Q6m2SnvF8Uz40Lz+EsgApHwY/8sUwlPqGt1kgKZszAS5uT4sDBuCKTRK0bA4Xguh1yx3roojRXVFgpKG4vTiC4fYTqCneGFAU0zZsiqilhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lphetjmX9DyXKBgIOWnqWlxtmwKTEbeF096YmnoDMXU=;
 b=fXCwY1nPVAyD5R5ttiDUwUY3yDwyoxfby05d2XBJ9KUEW2iPsreiIp5QOK/bJiwllgzfXrZoUm4dzvCg2IxrHk5nEdg91Z1AmZ4y5CnZvIbqK/MLs0hRNeanfkkTiC+UTbNymcMCuotgh0xH4KxqCpOyThXEikHVj3/INt8uqMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:09 +0000
Message-ID: <87jz0yqfgz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 058/139] ASoC: codecs: nau8822: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:09 +0000
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2cfba0-7480-450c-e479-08de0ad96164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wdf+Mv279hdpkOnzPPXQYTYyP/nQf5GgV8uV3EA5ptCAR95GAJlXTHt5nOAi?=
 =?us-ascii?Q?BCNPzMFWnJDvbbg/9SMz5K06eFaJEcsuv3IVgQ1Hhcat1swC9Vzw0o5UYJYa?=
 =?us-ascii?Q?qEClGgv358COtek4Cjpt1Sk0qSm5z0/OnHsq3lZOXlQ+rwM9aLCi6G8U3iIv?=
 =?us-ascii?Q?Kqf+ph722y239JHu/fUGsBwCSJhVwLbBsf0wYSiWxiwWZXAxV4cTpp6drnbl?=
 =?us-ascii?Q?jgCVUcWQCuJ3SxvUhYbuoX+2PMy3fNQRwY2W6yAPxmBBHxkyM4TIg6sykTpK?=
 =?us-ascii?Q?330tNMD3BEL6DZnqujemwSrkkUrznBPibq5eNHXJANI+fS4a1FO3TWiG9Q1I?=
 =?us-ascii?Q?D1A1aPVMK9B1DDGIc6DtZrmob1dI9AdLD+XZ+7kmDWiHDFhbo8iGjEm5+E3U?=
 =?us-ascii?Q?4t8tYk2vRG8Vwu07tU/j/5fv1g0uRZ9DTt8NkHK9m9gyyia/FHi7ussSYnvj?=
 =?us-ascii?Q?7NKqkB9nmUmMshyPLJMXoXr5Kd96fLqwRDovzyZh44jJLEZIoduw+SkrOOWV?=
 =?us-ascii?Q?0wlrb+zQMBIPT1eyg6IIly1pv8y+X5wgyKb+xoLO5Cjmz43FIO74TqgbwH4F?=
 =?us-ascii?Q?L+HjKs8G/D83hcZ0koS0hhQ5zQ3M4JCwEVF1lf+HKsB8w5W/i//EtRpLHnls?=
 =?us-ascii?Q?HpPMSmmc0180BeI6iuF1VSTby/uqWTnNw+j/pp8t7MdDYCNqmozG3vZHqjUf?=
 =?us-ascii?Q?iXnhvAcC78AJ+5+nH8/VFCPmQaxEfmnUfHubSa0Oti1zMuAST3nubskQwPeM?=
 =?us-ascii?Q?BqW9ECUVHt9ODFsgRRculzvcm1mjOwvXUx8qrn0ipLe/5ULG907DNkXLrjUj?=
 =?us-ascii?Q?mihE/4pd37vagSdvpg5gtJsdRlDNBy0rzI8M+qRknlbFcR4B8cYFy2rENEBq?=
 =?us-ascii?Q?8py11ZgU9OftzOLjV4pknDDlcg2O7QYtpFkhY1gQoltwkoSmkWW80UcVS+u0?=
 =?us-ascii?Q?OuWF0aiGW15cm80yazgxyqg/aXzp18Vhj3C/6j2dqs8rAxcM5tRB/N0eHBgu?=
 =?us-ascii?Q?Mg+lvT5w5RnvMpDrRv8spSne5EWWuA3LObTJGqi3j2/qVeiOfkDuWymGSG+u?=
 =?us-ascii?Q?8qmfhJcHF6HgDKJcMakxC3YL6XiVn/kzUHhDmAkrswXauI/s1B3hTsysT0JK?=
 =?us-ascii?Q?cooVjW7e99H964AWo0AI/kMjhsgU8nVheUSfcRicDCwX+uhsz/Cc6XjSXaA8?=
 =?us-ascii?Q?ekwxhaqHb4vRcH7ycMVw6eN+/Buaqa33nrQ5AFQd/SjtoqID0bUMaPefuiWj?=
 =?us-ascii?Q?aWIhtjRW3ZO1EAtl6szqDvImeV31pW36EhZMZU9Ob0T4bNH+a5RbwKcYVu4W?=
 =?us-ascii?Q?Zu8w4RZCgl2Z29fhNjy9ron1tTfEKnMdceP1Lyo9zx9+DaFPeHR+eM63JdPJ?=
 =?us-ascii?Q?5LZqgS9dRnezQu0uLbKCdioYL0AzctN3yKtC/K6d1SnO8GVvVSau4cAvC/kK?=
 =?us-ascii?Q?FANzTWlm1tQNHIlFwgDqLXFanqCcYSvCurBDGoVAYwC5eZHpdDa2x3zWrDfu?=
 =?us-ascii?Q?DDUGFQKYRtI4/1ckDf8jfoWZVxFkZ6LbroJJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Edyx/JY+KuQ0WncjyLbHTEuISuMWFthjV1WHUCt5ZnLIONrj/NF8FpR70O7U?=
 =?us-ascii?Q?sis8SoAv01kQYZ/FPEQoKg6UMYkiAMJCGfjNAsBjB7nqjk4u2XRFFt1y21eE?=
 =?us-ascii?Q?kwNopqEC15Kg8/mI4K8VaHy98WMkrsUcp0JtmmF9NJHVRFyoz4J7WYLAU2aT?=
 =?us-ascii?Q?M/v4GIqPUnX3een9QXoxUi4kb99NSiEviWj2KYwITcdD8BbBJYYH4n7UDlBJ?=
 =?us-ascii?Q?6+CgUHc0y9engC/B0to9+wVk+5x7Djj2jHt7ErUbcfq4vHtjS+jvsDHQ/nSg?=
 =?us-ascii?Q?aYUNjNqAGM0ahGU5EYLZ2AsISVF20nPWg3TM1Q6itlO5/Od82g153dnqOPpJ?=
 =?us-ascii?Q?6lvShhqqLgjuIXMLQo8iGStiLjRkuyiaDsYI3j9SsMqZDHIMsw0NOfsTRUeI?=
 =?us-ascii?Q?8dyqYk5MusOG04rdfSSJ78LHWXNaOru5d4J+Wmbl7Hp5lvvGnPyuULePcGIl?=
 =?us-ascii?Q?eJmrrSkWLKCz06hN+Ra5E0rtxRq6RP4dAYcgXRleLgWqzI9ZP0ZryjoVLink?=
 =?us-ascii?Q?QaZ1LuEIyU++7ImQEVdxEXKwIJnxR9Ng9EEDPg4rS0iVwocF/B7IFfko+hJP?=
 =?us-ascii?Q?hBMTSAwOJL+kHLKobhzLEOt18T8TYrOz/rtAAemyQ0ZZ0cr3vGHs80+5P/ux?=
 =?us-ascii?Q?5uW/DFClVSNKxv5iHVMgyv1cxyS+ZGrG+Y3UwITGcBV9r2ao1VdL+e1eW1As?=
 =?us-ascii?Q?UvYQTWswdqL2jSXDa5IZJbYEz3UCcp//ZHE/VFzXW6ZVnJLIqcYAknADmDyb?=
 =?us-ascii?Q?FQstAn8XVZjntjOs4u3GSY3UDslh3w4NkO0YFhtRaTTXsMD88JGTG91FcUGr?=
 =?us-ascii?Q?OcTM9AjFnxCLOLVJQIlwGMPSXVy8vk0pD8Nikzbu84R+zUj4DKPmQ9i1opV6?=
 =?us-ascii?Q?w2B0baLDyzptYsQrUWyJeF3nb/Z8wwIADakVvoEadRMoHz2VIPh4bVx+US5P?=
 =?us-ascii?Q?YAsZv0+cvm/9VY1AgXSV/DZ3Nfz2zeRLT91bbXYjT8mu3eHZm10RFJ4Iw4rO?=
 =?us-ascii?Q?1O1dOVoPVUhhU8t7vFGXv3mWQTIGF3f0Rjf4n+YmAR6ZVdSwRJi+AWlYK6fC?=
 =?us-ascii?Q?mTevcggwfhv0PvD+YNnRYGda/Mquqjhu1XqhznbPhzSf+RVwakX04J7ghOOo?=
 =?us-ascii?Q?kle+I4ouctyhghRUPMBvE09yakbnZIzVKTByBU7curkzYWLo/J/Us4zA4L1h?=
 =?us-ascii?Q?lKm82wYXZzaWr1XX5RJY7SESqTpPiS3tk4WHAWOq5213bsJ38DmyIdf1lFAn?=
 =?us-ascii?Q?9RvpVYi/2Ar4hOc2hZ5WvX/28iP9bOUGA7sduKmwHhP3ch8Q5EySyDJEwkpB?=
 =?us-ascii?Q?APY3njegVaSGro1tgMPyWZXa1riZ6axPT6CKOjoPcvFwT0hvlNythc9ANqwK?=
 =?us-ascii?Q?rJE+cG+6oZvaOYhCl6sgV9/mkPKDLU5JO/HotMhQLuk9L6aQzHmqP5ufYvX4?=
 =?us-ascii?Q?ZptrTITg/18Aehyss3XyV/GN4yr2jx6ZoGLfM8rkyXkxJ7muodxPRMQ9TN92?=
 =?us-ascii?Q?hwS90ODstu/1wq62vfkL/hmHBpa5CqCr/315zeu7EHSCt1gGlOr1SOCEPfac?=
 =?us-ascii?Q?cPiyCq/fPF639TZZsm7dV0p1i/2IcuFPMpk0uoMMcVPBn2aDCyACs4VrIezM?=
 =?us-ascii?Q?V7n1uRIJUeEo26geQ5YYnOE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2cfba0-7480-450c-e479-08de0ad96164
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:09.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TOEe0pXNPlCe/RkruiLbEJ9uFdTBYerGNA7R3LeP+ny6DtVdoZqWMPs9YkdBS7hveMAEplxUsI/nZ73s4uJ8A016tmxrakekMcayQF62q9oUCT+POiwBDTuFYUZPNnr
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
 sound/soc/codecs/nau8822.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 15d6f8d01f782..0373167c25f44 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -180,8 +180,7 @@ static bool nau8822_volatile(struct device *dev, unsigned int reg)
 static int nau8822_eq_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	int i, reg;
 	u16 reg_val, *val;
@@ -212,8 +211,7 @@ static int nau8822_eq_get(struct snd_kcontrol *kcontrol,
 static int nau8822_eq_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	void *data;
 	u16 *val, value;
-- 
2.43.0

