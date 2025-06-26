Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3398419F421
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903959; cv=fail; b=bnq5rFgijwZ3HAq4nPEjufZGqYCRM7YibPOlnWjeWV6r0KF+SdHqnunsNL01LgukHxwP+96+8Udtyqzi7twDPqxXTX1QXR5N6/oFljYwRXCWbXmeyE7EkBQUCyVvtb3IzWvjPXNlBKIXqjyr2hQ3n4JiktrDZIUTqjqB5aKpAWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903959; c=relaxed/simple;
	bh=J9E8FIlC5wbQ8E9IPuiAwtRQdZQNjr9uKRvM1mx2h+E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ImCheLzmzRho+PnhKZo+LHxsR49p8eTGiVxHKOfTxtx33vhuHCfzUmXJjvV5kVrRvM0Yx4i9K/jgHV8RbY6paxqUrD2mj6TN4OjbAaQQNYQwMlb7MtMtQ4Xc7/+9/WTxkYkTtkVLVotbfa3rvQjzAwifwb6RTPwCn8sgWScvajc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CmpIZRxi; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CmpIZRxi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/DrpmF1iMfcddpUoN3KJdspqq2Jk/MuoxK7djh18Aec8+ifbCTf/Hi7mz+eJu2tkUJwScxjGdGL390+CnG2JsyJiGVuMb+UO/YZY4IXtgNIOi8EXMA3BXm3DyrONcoNlwoRrFpYzE4wtJaMrARSIteQzBO3JBRncg0hIfr5M6YXQB3VqeQEipdg3hPgFiJpiVginl8BrLSiMsfhN/7zmIvuwWoxwmmxMiFpBU4iSTBUMwbtLnwjss1CHtHfPHlYB3ukdMESXKLx3XSMJWhpvlSkz/aRfXdDtqajw3iwzVU0OlCqU/YgqnRv5X/J1Vo135ZYmjypENlSgYE2bh0pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwYlOLMUnLVzjZFYdoy3F3bkdrF9KnbMYaFEqzo0gU4=;
 b=kF9zQ9iX2pCn0qhv7CFWWi8KYARJfc9ohWhAdtTcJyQfcBboaR94RJdFiTJIjiBojAbNZHd4svHIXouxlOp2mQsvv2aDrJJhL5D+SDPchuNJ17xEeYTX6i9Aqm0AjwWqaajPxZcoAc+/dllqUHVmxPb4k/S+3ene2BQJylLslgI4ccgIZ3U3Zi7f7BLk/Gb+FLX29ScDEQvOlIvY+8qrEfkWgVsZaQVrKvPssh5IBlafNBuOsPVDQ3ocBtjokKmnmq9QOX2w8ypxbNT5yr5EOTe8GXI6Y9mgfmaBZ/i921cpxgZUKI3jD3bctocV5GcnuV2MK3XDPdOhA3W+ziVcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwYlOLMUnLVzjZFYdoy3F3bkdrF9KnbMYaFEqzo0gU4=;
 b=CmpIZRxidZOMX/VWb5pm3f203Q5RgXRD8/a6fJb01AZaZXdLg8zjJQnVnyWLWsXKVYv8102PX7JcCMTF4DtCDzUCXXe8LzCV+yMGNbaEkxVd4KfUH87qoHzDprVjK2i18PVeSqvgNrOSpedZanIeM0A0D68zv84xmCRq3pC5XnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB6754.jpnprd01.prod.outlook.com
 (2603:1096:400:b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 02:12:34 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:34 +0000
Message-ID: <87qzz71ca5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/11] ASoC: soc-dapm: reordering function definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:34 +0000
X-ClientProxiedBy: TYCP286CA0194.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::8) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7e5fee-9aa4-4d96-b39f-08ddb456ea36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9/I9ENI3nwqM5EOxIoOPDPFzd6Cl0gY+HLLB02ZVDPSP9U+woiqW50yGQI9w?=
 =?us-ascii?Q?EJhZlQkTbMBqOSDGhH5ko1/i0UbJJLdXE0I7bUdEeTVTrEvHpxvYB8hR3muH?=
 =?us-ascii?Q?fyWJGRJBmix3nV7goQ6PE9aYqCQW8XmdFHRtvUB3L7ZpNvVb3J8FwaTBqDY2?=
 =?us-ascii?Q?dki2LaNvrb7FeQ63BEQpJVl01qAYuCS5uhaU+ZG1tvY4bIlgAZ0SvjAtLRkH?=
 =?us-ascii?Q?Ao+QdboUPh/tBSwUKCkfF/VudYtLQRtZCFV/aJta6kSvOXu/8aiRDyTKDEXX?=
 =?us-ascii?Q?3VEuARGeIQTGyGKWpnPp2lhiTpF5iFKk4KPM8r8dEFuyMkRkwAkrh8L3tpZo?=
 =?us-ascii?Q?uFMCZuV3whtDlcEwqcESTVrMs252Zs3GmayUNwwl51nhtfkXV6gEMUUcgiG6?=
 =?us-ascii?Q?/q4UDJPSn9vVmeyV2JHiw4ezpuMxiwQWNwxYjDmXHGUAprm98s2nsUM2/7/v?=
 =?us-ascii?Q?aZLW3NYUmMY8wmzzoRD1wgZ4KwjQfSAHozgKWaTF4TguPXShgu4Y9eMuX1IG?=
 =?us-ascii?Q?n9NGgiuKpE1DxYXncjua6+amMx6PbY7f5vhFOBGkR1DkZG0KrC/6aTmvCx8i?=
 =?us-ascii?Q?2owjYhYS+4fhiKuyW1+ZDU1o3shlDt8CnfP3aLyB0MJBalI6CETEpQR6Tbyg?=
 =?us-ascii?Q?8INBYEfoAO6U3FKv4FL6DrEFW4KsQo9or+O1cHHaNs7AVGrxzDpEwd34Ppxf?=
 =?us-ascii?Q?pTUlv8qROqG9cRmZZfcDb9y0YckD1vchGcMfHzXSVCfvWcswRb6TYthVItmK?=
 =?us-ascii?Q?kfhkBUIc6VCRycpZCTzBNr0uJMJoJmz7A7i4XZCKczRbYQuDTKxtVT2sZrdu?=
 =?us-ascii?Q?zQiy7vpoyy4zYw2Kpeyeil4jy6rpZ9oShUWqDhInuZSKOL/ikdMmQvncqP55?=
 =?us-ascii?Q?tTg6GAt/YyyS4ITpQ1izB9yZJOrLeUbMFgKyeQaEo6v3bL5Yxq6Xxrw2Ooqm?=
 =?us-ascii?Q?5P6TprhNgO7zgVkRo06szgCZ/skV4CJvvZHXW5OCEcy+hKEgJyOJkUcpTRRL?=
 =?us-ascii?Q?SnQLpe6b1/Mw3Bu7Dl/yZS74BtXxgOJJpW9mILbsCJYFcR1rS1pbag0J7SLu?=
 =?us-ascii?Q?V2G/yXAuGVTMwzEkeI+sKAoRv5s0ZLT1T6hy5XdPkgJRLzfBQQJ0QnVzPB3y?=
 =?us-ascii?Q?0qHAQ5Mq72FA45HIFfiDODiuDF6r2D0dRrDchxnFLln6NO659H/I1BnoDVvt?=
 =?us-ascii?Q?duCwFs533/iv/SqRLFDo7Uf5mulCanU3+nJhnf1JC1N1xV1Ya+qhXyI8h/mu?=
 =?us-ascii?Q?mWF5PR5xBTJMRVBxCWdw7lq9MqeDLxyhTz3QTjTwV4xPBwC13xFPDPX2NZdE?=
 =?us-ascii?Q?tujRBHdtOr2bLcSz1oYFKwFteiMnFd+NPNUMDukRAB/zs+/uye/0+8MsCBSA?=
 =?us-ascii?Q?mav1MQS80culEuqBQ/tv0xKysH9HZH+yPhMTFVd8JAl6D+r/nmX4Nl0InRmQ?=
 =?us-ascii?Q?oVe+sLgL5FcYUJzmoL+Dn/CSnNO/uCaVfZtyt8Qp2ueJIIG3xV2CWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f9xtJaeMHdlXaMWxu5zFVQc5dE55y1GHxBiF2ckgponHE7AR91Gk4HRpVXul?=
 =?us-ascii?Q?okDfCZp2agVWslEcsbO9YigTA0ahbYMbW54rUpfvpYs3/j7BP99f2D9Tq+Hs?=
 =?us-ascii?Q?6ahgy70K70BzDKaOh3XV/jze2n9CxO/ymwMLbCmEQ0NG8rX8ZoodhLLiEm33?=
 =?us-ascii?Q?w0F7TB/wOjq6FhE+BtZgUDqBSokiZ9UZtVE+Ykwe7yC+yj9KTc8RWEFd/yXP?=
 =?us-ascii?Q?fpCJCGSf4CxEAdtZd0KSA3KCRRN+KkKC71222KATJhcqkuVnjdlsEArgjWq3?=
 =?us-ascii?Q?SORrDK3xMByjZfxBSiVG70oCNt+3MMqQQI7p6lbiaejRVf0vRvRyi9ry2JFl?=
 =?us-ascii?Q?z/ZFjBwn7GkukFl3ldNFwl1mnBgyDwBHraeFmOC7ec246Fbtl1+qo4Nzb2Hs?=
 =?us-ascii?Q?kiGuXgodBCr04dIhZ81qlVXjsl2PuinXewec0g/zr7zvuGz+KrunQWL8Pjx9?=
 =?us-ascii?Q?7D6fsAwnMqfV9WxebbkgPfWEAvKcei0bIa6W3sNUnO55KVrPDghyFEJgX6nF?=
 =?us-ascii?Q?hamdqe8/3/uMz0jNIsFYrTSzylXr+Gnyt9fc7wjDNrWayXWH83RSbcF1D6bF?=
 =?us-ascii?Q?ohAGUFEtWcKg1/7dGG+KhG2Sbn6gAnFUCiXOikiUzMQsRUpWdbhZYwO5OmY9?=
 =?us-ascii?Q?OWUUtLpAn2R/A2vJytPFCk5OfDQxhLpQCjtesyuaDlhb06dHiY3fTjP/dGE8?=
 =?us-ascii?Q?JSPoRuobxwQE4kXwKVVizmSuglZ8+N4nm0YCjcPLpJjJUw/Sj/klVjrEcV9c?=
 =?us-ascii?Q?0MJwlHM8z3+ZdZN8faZ0iQeYgrae+DoqpzZy5IckT5p0xXXqYu7P8eltoTUd?=
 =?us-ascii?Q?iO8Ly2S40ffimfHVUxQm68Roc8mMze9RSlzTwi+TW0c6nmQBHeA/aT2eyqBp?=
 =?us-ascii?Q?IlApLNCfc9kydXigKTyEZDrm7WmxfoC1pN1VApPnu1z/VWEmdHb9YM0yI6jk?=
 =?us-ascii?Q?edaR8KNMqXrmEIHx9yDalfuqPUuWacjPX45d5z8+P3TNbjR65q1y9UlCieeS?=
 =?us-ascii?Q?SWll35RIevHKc2kMjEOwhS1Er60Ih5jGZRViVpP8c4IjMC/iP+HGnHKGb3q3?=
 =?us-ascii?Q?Ec+7NNu8Gm8poQQL8Lv5naZ86hZ4nk98OLEfg79cdyuK/ciucFWrPX7gFrRG?=
 =?us-ascii?Q?rlBy2iPcX3E6tNl0D042AHzu2Q9owIj+ND4UkBimKJzhP9mszWCEPXUKCnSC?=
 =?us-ascii?Q?/QVhnpBKcVElFWIlZigA9biYejiV4ONywcP6zC30UfC6cF2WWVhP6OSdi6UI?=
 =?us-ascii?Q?17D+W801XazRhPhMQjwxqW64Q9VhyotzTWPQgOiZ3sSIj7lpCV4I/NhnDP+k?=
 =?us-ascii?Q?5Y2KJaSBuIAs/+QgVbalhyGgb3KUGGpu1jegBUbJq8u77AESjoh+ziEPHdrI?=
 =?us-ascii?Q?cd0HqeZZ1FM3VFs+dhKBVvEdcYwtrcJK6Klhsj5+IBqqjKvtaxgRxbUhREA6?=
 =?us-ascii?Q?ux7TGVtvxGrdCROrNz9GpngOpSxojfh3NdWLrPxEasO1DFSbCLMMb7SnLzcR?=
 =?us-ascii?Q?zL7qcqkmOu0CKuw+W3kClprlm2WB8Z5UQzY+m4CxzdboHf94G078YnkHIN6+?=
 =?us-ascii?Q?r0I+ZydZOHKRxfd2qcTtPViqCSMRV4Vp7YFmKzQdhMXQN8he40JPR+hew9oB?=
 =?us-ascii?Q?Qnkf1SCGVq07qMj3zgxr3xg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7e5fee-9aa4-4d96-b39f-08ddb456ea36
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:34.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cEfeRlaewbMU6Ho5ZJ4G3ucaTrJwm3EHUSljAyBFRfCz+Nyrs+7M2DkktB3b4+4WH2LWZ1K611JOSI/WbsfZrsGZfhksfzKzK5aVJkO9bkNmMENv0LdOmdJUpHly4sA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6754

Because functions are defined randomly, it needs function name
definitions on top of soc-dapm.c. it is not needed if functions
are implemented in correct order.

This patch has big change from change-line point of view, but is
just reordering, nothing changed in meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 733 +++++++++++++++++++++----------------------
 1 file changed, 364 insertions(+), 369 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d6b09be15377..a3180d4c1676 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -49,14 +49,6 @@
 	for ((dir) = SND_SOC_DAPM_DIR_IN; (dir) <= SND_SOC_DAPM_DIR_OUT; \
 		(dir)++)
 
-static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
-	const char *control,
-	int (*connected)(struct snd_soc_dapm_widget *source,
-			 struct snd_soc_dapm_widget *sink));
-
-static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg);
-
 /* dapm power sequences - make this per codec in the future */
 static int dapm_up_seq[] = {
 	[snd_soc_dapm_pre] = 1,
@@ -346,6 +338,320 @@ struct dapm_kcontrol_data {
 	struct snd_soc_dapm_widget_list *wlist;
 };
 
+static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
+{
+	if (!dapm->component)
+		return -EIO;
+	return  snd_soc_component_read(dapm->component, reg);
+}
+
+/* set up initial codec paths */
+static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
+				       int nth_path)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)
+		p->sink->kcontrol_news[i].private_value;
+	unsigned int reg = mc->reg;
+	unsigned int invert = mc->invert;
+
+	if (reg != SND_SOC_NOPM) {
+		unsigned int shift = mc->shift;
+		unsigned int max = mc->max;
+		unsigned int mask = (1 << fls(max)) - 1;
+		unsigned int val = soc_dapm_read(p->sink->dapm, reg);
+
+		/*
+		 * The nth_path argument allows this function to know
+		 * which path of a kcontrol it is setting the initial
+		 * status for. Ideally this would support any number
+		 * of paths and channels. But since kcontrols only come
+		 * in mono and stereo variants, we are limited to 2
+		 * channels.
+		 *
+		 * The following code assumes for stereo controls the
+		 * first path is the left channel, and all remaining
+		 * paths are the right channel.
+		 */
+		if (snd_soc_volsw_is_stereo(mc) && nth_path > 0) {
+			if (reg != mc->rreg)
+				val = soc_dapm_read(p->sink->dapm, mc->rreg);
+			val = (val >> mc->rshift) & mask;
+		} else {
+			val = (val >> shift) & mask;
+		}
+		if (invert)
+			val = max - val;
+		p->connect = !!val;
+	} else {
+		/* since a virtual mixer has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with initial state.  This is to ensure
+		 * that the default mixer choice will be
+		 * correctly powered up during initialization.
+		 */
+		p->connect = invert;
+	}
+}
+
+/* connect mux widget to its interconnecting audio paths */
+static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
+			    struct snd_soc_dapm_path *path, const char *control_name,
+			    struct snd_soc_dapm_widget *w)
+{
+	const struct snd_kcontrol_new *kcontrol = &w->kcontrol_news[0];
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int item;
+	int i;
+
+	if (e->reg != SND_SOC_NOPM) {
+		unsigned int val;
+
+		val = soc_dapm_read(dapm, e->reg);
+		val = (val >> e->shift_l) & e->mask;
+		item = snd_soc_enum_val_to_item(e, val);
+	} else {
+		/* since a virtual mux has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with the first enumeration.  This is to ensure
+		 * that the default mux choice (the first) will be
+		 * correctly powered up during initialization.
+		 */
+		item = 0;
+	}
+
+	i = match_string(e->texts, e->items, control_name);
+	if (i < 0)
+		return -ENODEV;
+
+	path->name = e->texts[i];
+	path->connect = (i == item);
+	return 0;
+
+}
+
+/* connect mixer widget to its interconnecting audio paths */
+static int dapm_connect_mixer(struct snd_soc_dapm_context *dapm,
+			      struct snd_soc_dapm_path *path, const char *control_name)
+{
+	int i, nth_path = 0;
+
+	/* search for mixer kcontrol */
+	for (i = 0; i < path->sink->num_kcontrols; i++) {
+		if (!strcmp(control_name, path->sink->kcontrol_news[i].name)) {
+			path->name = path->sink->kcontrol_news[i].name;
+			dapm_set_mixer_path_status(path, i, nth_path++);
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
+/*
+ * dapm_update_widget_flags() - Re-compute widget sink and source flags
+ * @w: The widget for which to update the flags
+ *
+ * Some widgets have a dynamic category which depends on which neighbors they
+ * are connected to. This function update the category for these widgets.
+ *
+ * This function must be called whenever a path is added or removed to a widget.
+ */
+static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
+{
+	enum snd_soc_dapm_direction dir;
+	struct snd_soc_dapm_path *p;
+	unsigned int ep;
+
+	switch (w->id) {
+	case snd_soc_dapm_input:
+		/* On a fully routed card an input is never a source */
+		if (w->dapm->card->fully_routed)
+			return;
+		ep = SND_SOC_DAPM_EP_SOURCE;
+		snd_soc_dapm_widget_for_each_source_path(w, p) {
+			if (p->source->id == snd_soc_dapm_micbias ||
+			    p->source->id == snd_soc_dapm_mic ||
+			    p->source->id == snd_soc_dapm_line ||
+			    p->source->id == snd_soc_dapm_output) {
+				ep = 0;
+				break;
+			}
+		}
+		break;
+	case snd_soc_dapm_output:
+		/* On a fully routed card a output is never a sink */
+		if (w->dapm->card->fully_routed)
+			return;
+		ep = SND_SOC_DAPM_EP_SINK;
+		snd_soc_dapm_widget_for_each_sink_path(w, p) {
+			if (p->sink->id == snd_soc_dapm_spk ||
+			    p->sink->id == snd_soc_dapm_hp ||
+			    p->sink->id == snd_soc_dapm_line ||
+			    p->sink->id == snd_soc_dapm_input) {
+				ep = 0;
+				break;
+			}
+		}
+		break;
+	case snd_soc_dapm_line:
+		ep = 0;
+		snd_soc_dapm_for_each_direction(dir) {
+			if (!list_empty(&w->edges[dir]))
+				ep |= SND_SOC_DAPM_DIR_TO_EP(dir);
+		}
+		break;
+	default:
+		return;
+	}
+
+	w->is_ep = ep;
+}
+
+static int snd_soc_dapm_check_dynamic_path(
+	struct snd_soc_dapm_context *dapm,
+	struct snd_soc_dapm_widget *source, struct snd_soc_dapm_widget *sink,
+	const char *control)
+{
+	bool dynamic_source = false;
+	bool dynamic_sink = false;
+
+	if (!control)
+		return 0;
+
+	switch (source->id) {
+	case snd_soc_dapm_demux:
+		dynamic_source = true;
+		break;
+	default:
+		break;
+	}
+
+	switch (sink->id) {
+	case snd_soc_dapm_mux:
+	case snd_soc_dapm_switch:
+	case snd_soc_dapm_mixer:
+	case snd_soc_dapm_mixer_named_ctl:
+		dynamic_sink = true;
+		break;
+	default:
+		break;
+	}
+
+	if (dynamic_source && dynamic_sink) {
+		dev_err(dapm->dev,
+			"Direct connection between demux and mixer/mux not supported for path %s -> [%s] -> %s\n",
+			source->name, control, sink->name);
+		return -EINVAL;
+	} else if (!dynamic_source && !dynamic_sink) {
+		dev_err(dapm->dev,
+			"Control not supported for path %s -> [%s] -> %s\n",
+			source->name, control, sink->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int snd_soc_dapm_add_path(
+	struct snd_soc_dapm_context *dapm,
+	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
+	const char *control,
+	int (*connected)(struct snd_soc_dapm_widget *source,
+			 struct snd_soc_dapm_widget *sink))
+{
+	enum snd_soc_dapm_direction dir;
+	struct snd_soc_dapm_path *path;
+	int ret;
+
+	if (wsink->is_supply && !wsource->is_supply) {
+		dev_err(dapm->dev,
+			"Connecting non-supply widget to supply widget is not supported (%s -> %s)\n",
+			wsource->name, wsink->name);
+		return -EINVAL;
+	}
+
+	if (connected && !wsource->is_supply) {
+		dev_err(dapm->dev,
+			"connected() callback only supported for supply widgets (%s -> %s)\n",
+			wsource->name, wsink->name);
+		return -EINVAL;
+	}
+
+	if (wsource->is_supply && control) {
+		dev_err(dapm->dev,
+			"Conditional paths are not supported for supply widgets (%s -> [%s] -> %s)\n",
+			wsource->name, control, wsink->name);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_dapm_check_dynamic_path(dapm, wsource, wsink, control);
+	if (ret)
+		return ret;
+
+	path = kzalloc(sizeof(struct snd_soc_dapm_path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
+	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
+
+	path->connected = connected;
+	INIT_LIST_HEAD(&path->list);
+	INIT_LIST_HEAD(&path->list_kcontrol);
+
+	if (wsource->is_supply || wsink->is_supply)
+		path->is_supply = 1;
+
+	/* connect static paths */
+	if (control == NULL) {
+		path->connect = 1;
+	} else {
+		switch (wsource->id) {
+		case snd_soc_dapm_demux:
+			ret = dapm_connect_mux(dapm, path, control, wsource);
+			if (ret)
+				goto err;
+			break;
+		default:
+			break;
+		}
+
+		switch (wsink->id) {
+		case snd_soc_dapm_mux:
+			ret = dapm_connect_mux(dapm, path, control, wsink);
+			if (ret != 0)
+				goto err;
+			break;
+		case snd_soc_dapm_switch:
+		case snd_soc_dapm_mixer:
+		case snd_soc_dapm_mixer_named_ctl:
+			ret = dapm_connect_mixer(dapm, path, control);
+			if (ret != 0)
+				goto err;
+			break;
+		default:
+			break;
+		}
+	}
+
+	list_add(&path->list, &dapm->card->paths);
+
+	snd_soc_dapm_for_each_direction(dir)
+		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
+
+	snd_soc_dapm_for_each_direction(dir) {
+		dapm_update_widget_flags(path->node[dir]);
+		dapm_mark_dirty(path->node[dir], "Route added");
+	}
+
+	if (snd_soc_card_is_instantiated(dapm->card) && path->connect)
+		dapm_path_invalidate(path);
+
+	return 0;
+err:
+	kfree(path);
+	return ret;
+}
+
 static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 	struct snd_kcontrol *kcontrol, const char *ctrl_name)
 {
@@ -618,13 +924,6 @@ static const char *soc_dapm_prefix(struct snd_soc_dapm_context *dapm)
 	return dapm->component->name_prefix;
 }
 
-static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
-{
-	if (!dapm->component)
-		return -EIO;
-	return  snd_soc_component_read(dapm->component, reg);
-}
-
 static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
@@ -678,160 +977,60 @@ dapm_wcache_lookup(struct snd_soc_dapm_widget *w, const char *name)
  * the context is already at the same level. Furthermore it will not go through
  * the normal bias level sequencing, meaning any intermediate states between the
  * current and the target state will not be entered.
- *
- * Note that the change in bias level is only temporary and the next time
- * snd_soc_dapm_sync() is called the state will be set to the level as
- * determined by the DAPM core. The function is mainly intended to be used to
- * used during probe or resume from suspend to power up the device so
- * initialization can be done, before the DAPM core takes over.
- */
-int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
-	enum snd_soc_bias_level level)
-{
-	int ret = 0;
-
-	if (dapm->component)
-		ret = snd_soc_component_set_bias_level(dapm->component, level);
-
-	if (ret == 0)
-		dapm->bias_level = level;
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_force_bias_level);
-
-/**
- * snd_soc_dapm_set_bias_level - set the bias level for the system
- * @dapm: DAPM context
- * @level: level to configure
- *
- * Configure the bias (power) levels for the SoC audio device.
- *
- * Returns 0 for success else error.
- */
-static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
-				       enum snd_soc_bias_level level)
-{
-	struct snd_soc_card *card = dapm->card;
-	int ret = 0;
-
-	trace_snd_soc_bias_level_start(dapm, level);
-
-	ret = snd_soc_card_set_bias_level(card, dapm, level);
-	if (ret != 0)
-		goto out;
-
-	if (dapm != &card->dapm)
-		ret = snd_soc_dapm_force_bias_level(dapm, level);
-
-	if (ret != 0)
-		goto out;
-
-	ret = snd_soc_card_set_bias_level_post(card, dapm, level);
-out:
-	trace_snd_soc_bias_level_done(dapm, level);
-
-	return ret;
-}
-
-/* connect mux widget to its interconnecting audio paths */
-static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_path *path, const char *control_name,
-	struct snd_soc_dapm_widget *w)
-{
-	const struct snd_kcontrol_new *kcontrol = &w->kcontrol_news[0];
-	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int item;
-	int i;
-
-	if (e->reg != SND_SOC_NOPM) {
-		unsigned int val;
-		val = soc_dapm_read(dapm, e->reg);
-		val = (val >> e->shift_l) & e->mask;
-		item = snd_soc_enum_val_to_item(e, val);
-	} else {
-		/* since a virtual mux has no backing registers to
-		 * decide which path to connect, it will try to match
-		 * with the first enumeration.  This is to ensure
-		 * that the default mux choice (the first) will be
-		 * correctly powered up during initialization.
-		 */
-		item = 0;
-	}
-
-	i = match_string(e->texts, e->items, control_name);
-	if (i < 0)
-		return -ENODEV;
-
-	path->name = e->texts[i];
-	path->connect = (i == item);
-	return 0;
-
-}
-
-/* set up initial codec paths */
-static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
-				       int nth_path)
-{
-	struct soc_mixer_control *mc = (struct soc_mixer_control *)
-		p->sink->kcontrol_news[i].private_value;
-	unsigned int reg = mc->reg;
-	unsigned int invert = mc->invert;
-
-	if (reg != SND_SOC_NOPM) {
-		unsigned int shift = mc->shift;
-		unsigned int max = mc->max;
-		unsigned int mask = (1 << fls(max)) - 1;
-		unsigned int val = soc_dapm_read(p->sink->dapm, reg);
-
-		/*
-		 * The nth_path argument allows this function to know
-		 * which path of a kcontrol it is setting the initial
-		 * status for. Ideally this would support any number
-		 * of paths and channels. But since kcontrols only come
-		 * in mono and stereo variants, we are limited to 2
-		 * channels.
-		 *
-		 * The following code assumes for stereo controls the
-		 * first path is the left channel, and all remaining
-		 * paths are the right channel.
-		 */
-		if (snd_soc_volsw_is_stereo(mc) && nth_path > 0) {
-			if (reg != mc->rreg)
-				val = soc_dapm_read(p->sink->dapm, mc->rreg);
-			val = (val >> mc->rshift) & mask;
-		} else {
-			val = (val >> shift) & mask;
-		}
-		if (invert)
-			val = max - val;
-		p->connect = !!val;
-	} else {
-		/* since a virtual mixer has no backing registers to
-		 * decide which path to connect, it will try to match
-		 * with initial state.  This is to ensure
-		 * that the default mixer choice will be
-		 * correctly powered up during initialization.
-		 */
-		p->connect = invert;
-	}
+ *
+ * Note that the change in bias level is only temporary and the next time
+ * snd_soc_dapm_sync() is called the state will be set to the level as
+ * determined by the DAPM core. The function is mainly intended to be used to
+ * used during probe or resume from suspend to power up the device so
+ * initialization can be done, before the DAPM core takes over.
+ */
+int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
+	enum snd_soc_bias_level level)
+{
+	int ret = 0;
+
+	if (dapm->component)
+		ret = snd_soc_component_set_bias_level(dapm->component, level);
+
+	if (ret == 0)
+		dapm->bias_level = level;
+
+	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_force_bias_level);
 
-/* connect mixer widget to its interconnecting audio paths */
-static int dapm_connect_mixer(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_path *path, const char *control_name)
+/**
+ * snd_soc_dapm_set_bias_level - set the bias level for the system
+ * @dapm: DAPM context
+ * @level: level to configure
+ *
+ * Configure the bias (power) levels for the SoC audio device.
+ *
+ * Returns 0 for success else error.
+ */
+static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
+				       enum snd_soc_bias_level level)
 {
-	int i, nth_path = 0;
+	struct snd_soc_card *card = dapm->card;
+	int ret = 0;
 
-	/* search for mixer kcontrol */
-	for (i = 0; i < path->sink->num_kcontrols; i++) {
-		if (!strcmp(control_name, path->sink->kcontrol_news[i].name)) {
-			path->name = path->sink->kcontrol_news[i].name;
-			dapm_set_mixer_path_status(path, i, nth_path++);
-			return 0;
-		}
-	}
-	return -ENODEV;
+	trace_snd_soc_bias_level_start(dapm, level);
+
+	ret = snd_soc_card_set_bias_level(card, dapm, level);
+	if (ret != 0)
+		goto out;
+
+	if (dapm != &card->dapm)
+		ret = snd_soc_dapm_force_bias_level(dapm, level);
+
+	if (ret != 0)
+		goto out;
+
+	ret = snd_soc_card_set_bias_level_post(card, dapm, level);
+out:
+	trace_snd_soc_bias_level_done(dapm, level);
+
+	return ret;
 }
 
 static int dapm_is_shared_kcontrol(struct snd_soc_dapm_context *dapm,
@@ -2786,210 +2985,6 @@ int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_widget_name_cmp);
 
-/*
- * dapm_update_widget_flags() - Re-compute widget sink and source flags
- * @w: The widget for which to update the flags
- *
- * Some widgets have a dynamic category which depends on which neighbors they
- * are connected to. This function update the category for these widgets.
- *
- * This function must be called whenever a path is added or removed to a widget.
- */
-static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
-{
-	enum snd_soc_dapm_direction dir;
-	struct snd_soc_dapm_path *p;
-	unsigned int ep;
-
-	switch (w->id) {
-	case snd_soc_dapm_input:
-		/* On a fully routed card an input is never a source */
-		if (w->dapm->card->fully_routed)
-			return;
-		ep = SND_SOC_DAPM_EP_SOURCE;
-		snd_soc_dapm_widget_for_each_source_path(w, p) {
-			if (p->source->id == snd_soc_dapm_micbias ||
-				p->source->id == snd_soc_dapm_mic ||
-				p->source->id == snd_soc_dapm_line ||
-				p->source->id == snd_soc_dapm_output) {
-					ep = 0;
-					break;
-			}
-		}
-		break;
-	case snd_soc_dapm_output:
-		/* On a fully routed card a output is never a sink */
-		if (w->dapm->card->fully_routed)
-			return;
-		ep = SND_SOC_DAPM_EP_SINK;
-		snd_soc_dapm_widget_for_each_sink_path(w, p) {
-			if (p->sink->id == snd_soc_dapm_spk ||
-				p->sink->id == snd_soc_dapm_hp ||
-				p->sink->id == snd_soc_dapm_line ||
-				p->sink->id == snd_soc_dapm_input) {
-					ep = 0;
-					break;
-			}
-		}
-		break;
-	case snd_soc_dapm_line:
-		ep = 0;
-		snd_soc_dapm_for_each_direction(dir) {
-			if (!list_empty(&w->edges[dir]))
-				ep |= SND_SOC_DAPM_DIR_TO_EP(dir);
-		}
-		break;
-	default:
-		return;
-	}
-
-	w->is_ep = ep;
-}
-
-static int snd_soc_dapm_check_dynamic_path(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_widget *source, struct snd_soc_dapm_widget *sink,
-	const char *control)
-{
-	bool dynamic_source = false;
-	bool dynamic_sink = false;
-
-	if (!control)
-		return 0;
-
-	switch (source->id) {
-	case snd_soc_dapm_demux:
-		dynamic_source = true;
-		break;
-	default:
-		break;
-	}
-
-	switch (sink->id) {
-	case snd_soc_dapm_mux:
-	case snd_soc_dapm_switch:
-	case snd_soc_dapm_mixer:
-	case snd_soc_dapm_mixer_named_ctl:
-		dynamic_sink = true;
-		break;
-	default:
-		break;
-	}
-
-	if (dynamic_source && dynamic_sink) {
-		dev_err(dapm->dev,
-			"Direct connection between demux and mixer/mux not supported for path %s -> [%s] -> %s\n",
-			source->name, control, sink->name);
-		return -EINVAL;
-	} else if (!dynamic_source && !dynamic_sink) {
-		dev_err(dapm->dev,
-			"Control not supported for path %s -> [%s] -> %s\n",
-			source->name, control, sink->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
-	const char *control,
-	int (*connected)(struct snd_soc_dapm_widget *source,
-			 struct snd_soc_dapm_widget *sink))
-{
-	enum snd_soc_dapm_direction dir;
-	struct snd_soc_dapm_path *path;
-	int ret;
-
-	if (wsink->is_supply && !wsource->is_supply) {
-		dev_err(dapm->dev,
-			"Connecting non-supply widget to supply widget is not supported (%s -> %s)\n",
-			wsource->name, wsink->name);
-		return -EINVAL;
-	}
-
-	if (connected && !wsource->is_supply) {
-		dev_err(dapm->dev,
-			"connected() callback only supported for supply widgets (%s -> %s)\n",
-			wsource->name, wsink->name);
-		return -EINVAL;
-	}
-
-	if (wsource->is_supply && control) {
-		dev_err(dapm->dev,
-			"Conditional paths are not supported for supply widgets (%s -> [%s] -> %s)\n",
-			wsource->name, control, wsink->name);
-		return -EINVAL;
-	}
-
-	ret = snd_soc_dapm_check_dynamic_path(dapm, wsource, wsink, control);
-	if (ret)
-		return ret;
-
-	path = kzalloc(sizeof(struct snd_soc_dapm_path), GFP_KERNEL);
-	if (!path)
-		return -ENOMEM;
-
-	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
-	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
-
-	path->connected = connected;
-	INIT_LIST_HEAD(&path->list);
-	INIT_LIST_HEAD(&path->list_kcontrol);
-
-	if (wsource->is_supply || wsink->is_supply)
-		path->is_supply = 1;
-
-	/* connect static paths */
-	if (control == NULL) {
-		path->connect = 1;
-	} else {
-		switch (wsource->id) {
-		case snd_soc_dapm_demux:
-			ret = dapm_connect_mux(dapm, path, control, wsource);
-			if (ret)
-				goto err;
-			break;
-		default:
-			break;
-		}
-
-		switch (wsink->id) {
-		case snd_soc_dapm_mux:
-			ret = dapm_connect_mux(dapm, path, control, wsink);
-			if (ret != 0)
-				goto err;
-			break;
-		case snd_soc_dapm_switch:
-		case snd_soc_dapm_mixer:
-		case snd_soc_dapm_mixer_named_ctl:
-			ret = dapm_connect_mixer(dapm, path, control);
-			if (ret != 0)
-				goto err;
-			break;
-		default:
-			break;
-		}
-	}
-
-	list_add(&path->list, &dapm->card->paths);
-
-	snd_soc_dapm_for_each_direction(dir)
-		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
-
-	snd_soc_dapm_for_each_direction(dir) {
-		dapm_update_widget_flags(path->node[dir]);
-		dapm_mark_dirty(path->node[dir], "Route added");
-	}
-
-	if (snd_soc_card_is_instantiated(dapm->card) && path->connect)
-		dapm_path_invalidate(path);
-
-	return 0;
-err:
-	kfree(path);
-	return ret;
-}
-
 static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 				  const struct snd_soc_dapm_route *route)
 {
-- 
2.43.0

