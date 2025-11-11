Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7B23371B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821259; cv=fail; b=JbPmEO0HxviiOWaEvi75rbzrPdSAFGRdhcK1RYyUq94Zk6e4ySgBugz0EsXKGz9+IV4WFnGxyaxpO/OIWzogXre5xY24AZVt74yBmpWJVFP4Pj6kuS5W+dluAf87OdYU9Qn1hk3vzTO3XP9X+S/wW99Oqqj6zBuIcdnKuvYIMF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821259; c=relaxed/simple;
	bh=3WdeJy+y2LrjSwD3od5b9j0UCqbdQnyybG8AuqC2dy8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FoxsPmBpAwQ7+E+mbpQPHqeECjLR9pxnqlknMCVneZvgdyuBPaYRpKmg88V0Fvz3HAVjR90blsY1L/ni382O+oAU3Q90Q4vIdlAMaekBck/b4idrtbtRnUi3meuroGIJNQ+ZPYybAHjwjKnKDMo3Nk7PXeuNO7ISJFAYxMFrecU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b/s3fidC; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b/s3fidC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im1/wmr80H74N+XHjsDvZSFgW3ReQjPbaeBXF0jQIDXqer6lXt1F8WV6825WzWWI/I8Y6L1T9yuvZ6FHK7EodhosA49eldjj84diDooW1fEAIGqS/m9qDsVB7+byP/sJoOxeDCs27wNueeIUkqAzmRwflsDsxvaRs11F4uCD3tna0Vr2qp5jERRfq9DIAamH9/0GI3HeqeXhrKOV/3PyrpB7xg8tAiS0lg8dXwxvPlm2SfubK2WHmzSjrhSJAG/kc6CvEiHjdv4qjvN2aUXgl/T/WmxF4ZmYkXRnhQAX72E9U7d0kBMQkTk7EK6994tXlRUbhMMrBGkgk3ekSoQqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPwtp6S2JazWrPj+G9Nw5VRSKuuiFzvEnhpWhIAX+zo=;
 b=Wx67aULn7hcVKInC7IjLww3FhFxm/I4w4ql7knBChVHJDSmiPIBxG1HEjLUOx4TItTs1PB5JucMlXESryfCOedBfNG9UgTMG9yH/kwaeEscV91Z0q2AalOYrgrsx/PpBeh6DHxBbPiKpgU6VWb3g5jgz4ne8GkBKcqmY1O9/TxWruwh/9PwmwOmyj0YSXKLLiXQgokKFe972Aa/wSzKU4VFCLtVlrubV6yy0j4BTUzERVqp6XoR3oYlEigj9SxdZj2bGG4qu/WJJ7OyI4AGB/YzdvtkpmUQkz/F+r+bZtU5dF6y1Cmff9fRtYT0Nhu0eHSbr9yo5cZQOFbkMsmIpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPwtp6S2JazWrPj+G9Nw5VRSKuuiFzvEnhpWhIAX+zo=;
 b=b/s3fidCRcoPksW65JWzl7GD2zGySEXKRCc5K+gz93NTTcCdPptcCBZ1/M52+XhOyGYAbHGql1tK19/ek2tR3GXC/qmMGLdERoaBum6iUbmRNH4d5PJU5nRbwAJQV5UWpM81iaVZHAfXr0Ufy4pw4mJM0DtE6dU3Xx8eKaFwPMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:14 +0000
Message-ID: <87pl9pv249.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 240/292] ASoC: pxa: spitz: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:14 +0000
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c1dc19-7f73-4657-977b-08de20ba0a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bWwLGUnna4CjRUdXxvVk94vmIUCTeMvDRN+CEwDyoJVpninR3+0YXzpFp+nR?=
 =?us-ascii?Q?o6oNVxC7WieDj+Lkgds37cfMY5L80r/H6nMG/dEMHSZFHAk/4OblAhDZgup9?=
 =?us-ascii?Q?EiY/yWeXxBVBEHRxerrf87H38dk0zx7KNypdX7lzFTGER87FoFZviyO1bjaR?=
 =?us-ascii?Q?Qk74u6G2FJby0ExxxRnJvsVlrjAENbX+15G6dV+pqoWcqZ6u4TyJOPN23QQA?=
 =?us-ascii?Q?FZI0lD5GG72QOMIgm4DKmN29wbEhEgF5Ial0jgi3YIpaNCtsSRDEOYIQgda5?=
 =?us-ascii?Q?Ek7lylTg/n4Fh0ymoQNaiR+rt2YEHHwX+By1AF5OrM8Myu3fbKVMGm94iGJ4?=
 =?us-ascii?Q?VU6aberCdCoFKMEDHne4/G9jDwAGoh74SxWCu2/nvlAKOEVf3+Mmu7PNLhkg?=
 =?us-ascii?Q?R+y2iMjCQWJyTO20zTBZ3XEQMJqScmlOyyPYw63fE3+0b8zVbATfdEpuKQ1X?=
 =?us-ascii?Q?urkKwYe0dst/1UO6oZZbCJFnZw0CBJ04+sos4RdcAglZf/kgBE1AOoss8RRk?=
 =?us-ascii?Q?omR38sR4+gmU3iypBE+bzu/RjZBnyc9ulQtcmXp0dJyIQdR4KbKeC888r9i/?=
 =?us-ascii?Q?5EAW+rj+xalheWcpL4mPuNV9d6RO6CZ5keds0labnovZ1hG4l2Dr5JfTujZg?=
 =?us-ascii?Q?sEDPrr1TppEAKViZ5wmEHpdd3Epzl7fYI38dI34pIMcEJUcAjFdEM7r3Afqi?=
 =?us-ascii?Q?etsVhS6bkLenacMUP/hgFKDJ2btADRHoxEuEtqKtzrPU/aFIy4A/JRW8SwN6?=
 =?us-ascii?Q?ukcdr3YOh666T8b+fZcx3HtQBv3DlhMFY5Guve7FkMTdTK+SGZgh6R5cjlpK?=
 =?us-ascii?Q?YLcMO9xSHsizktSR6FjM4o3h00Dyqc0mxHsoO4se35PFkVPzMvtR23AQ23iz?=
 =?us-ascii?Q?8oazsy//u9MVG/nf2QS/4VldHsjrUcMMlEK9kjnvJV8JIBeAsmPXivIu4WD2?=
 =?us-ascii?Q?DJqcqG0kemFyXrC5DL8F1f8ykPnazarIePO8qc/sdwxnCE0sbMkd9fMeE3HO?=
 =?us-ascii?Q?1HhUrozAvZ3d4ZY08Ct9Sm1I4WNmK4xAuGah0Sfum9AyRwFuD8Ng5e3i0chP?=
 =?us-ascii?Q?6UuIehIsB0zNR0QxkDIbM6QG0rG8D9Tmxyw7FC6wsyaaedN48Af3GQDOufhz?=
 =?us-ascii?Q?tr3+xolFMiuAU1GJ7K5am4TfH/lDF5dDHyljmcMqrOhLY37JWqXl89S1IlG8?=
 =?us-ascii?Q?8tHhxG+AyepS8ut5QvCAdZUYcLSuAKvbd0N6H8BuxkCxBJbhECGyX6VMfgOh?=
 =?us-ascii?Q?c3tut7/8TkHtj24YCNToRYD1Zmv283Am91tQ3dMepmah2vk1yZkQPl+ZBJwH?=
 =?us-ascii?Q?5XKR4WSkYN4oW+PMh5pO7Fe6Rmdf9WFGOXsYuH2perXB1K7Dmr/cqU5VIUCK?=
 =?us-ascii?Q?j7LcJl+Amp5EbxE5C51Q07dQwRghWoVUVoKsC58RtmqmfsHqG9uloKbHmBs/?=
 =?us-ascii?Q?4px/nRqOWsYGm9ubhFeqZDF8+1zJtCABkUq0TZx7ACe5Ng4HE4ojXZDVZApU?=
 =?us-ascii?Q?sbGoR49e3v5Lv4SZw81MyJPsbPF2+2blfxv2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HAMW6TpbAJ62NcHe8dlIqKgwDoHyqE91BdBwOVggpmeE0vFWvnnKtYDDsKvS?=
 =?us-ascii?Q?ICoUvV1aCCL4w42gXqutFbtfph8nsS8VxXwUfjIpUWmNtKnUtSXcaU2SCg1S?=
 =?us-ascii?Q?F7UQvBnEjknjGS+iWAFT5BUy2ffB17qxraIzklmWoPAxNJQKV1+Pe2J2oxjs?=
 =?us-ascii?Q?VuR/i5+VTl1sdllF3ueOWxzHCvJhZv6GLoZmJsadwD/pLnCdgla8YlFUARm+?=
 =?us-ascii?Q?Psc3/Rz/zQtJgRNYFUeoAsjl5HVn98/I8AIdF937M94fDZliQnIlP+z/m83d?=
 =?us-ascii?Q?KX6AVFO+JCkcOqaPYWd9iHAudgrdiuWh83ozcN2BI/ZanQNnLHmavxlGPelU?=
 =?us-ascii?Q?oW3VYbk468BVak6vRavjrDEeov07rBAjPWOqhhJz9biX4rNEw/QMrrmbcSRO?=
 =?us-ascii?Q?kUyuOg3tJALxFgoTaB4I62q18fIoQWf6jZ4URjmlI9EhmFDjsgtdcTAZbhzj?=
 =?us-ascii?Q?HiT1Wgg6rB4HS21m0muWczB1YqZKTesXYROFH+2sPCE5ETJjKboNIgREKmf0?=
 =?us-ascii?Q?0fnFZR0DpiEZqr3RjlJYtQX/DBYhfGY5uobGWj9bHq8TBR6sqSYdU4NFehRH?=
 =?us-ascii?Q?oKc3dsPuuWzq57sbcxwGcFeyICXvGcGP9xQ23hiu55QiiBvZxsRR7nskdWVu?=
 =?us-ascii?Q?IqLYp3VAor4XFkoRpNezbZOYC7hKa9qWfTJiczKq0nts+nChun5MPYqL8xLV?=
 =?us-ascii?Q?sHTMJaR8TkksLlpOyLjDuQZjDDE7Z/bs+RL1eWMeHlAscT8QGl6KVLqbjSCe?=
 =?us-ascii?Q?m15IkUgwgNnytCVW8wW8L7g6YZRcilQLHv5e18UfHfPEFIW+j9IlZ8Sb00mL?=
 =?us-ascii?Q?K/41BpKStd8CXGs7DGTCq8Wk0z5wu9HfxQk3jShAGdQWNAbodyCls5c2FtG6?=
 =?us-ascii?Q?rbmy1CvM+FA8uwGJ3NEW72OiorevMYMaaAeiTfQQxKQkp9uojbgjlDu0i4P3?=
 =?us-ascii?Q?cx7WqGPVJ7qq9x7w/n8bRxOO2j7sKxGv2LXHDLxTYoUJvb57ovNfaVPqDYDB?=
 =?us-ascii?Q?KI3hvBZ9ICFEUn3164qX4FftOmA+tkNG+OCSFZIOI8K8q1QvRHzWRT8hFlxJ?=
 =?us-ascii?Q?prDds5325G3r+47bj9/XPAJYNIcvogmAN2Bxzzd60VNt38vUK1QhtE/1aGgg?=
 =?us-ascii?Q?eGmn1R07pMbQ2Jx9aciWq55TnoU0nZnF2JrTp56eVERgLegEykSQ7vSOcEFM?=
 =?us-ascii?Q?W4c9hXqtpUEkrA4Q0q3uhOfc4O702xRG7F1QLP/UNLXbSvRRCIK6MuqnwXLW?=
 =?us-ascii?Q?dquojmilGCjPEctbKvWvvEK3/pxgwzwrSK77W+3sHzg5xTm5N/MdQggummwO?=
 =?us-ascii?Q?J8dpo91r35WSn+gT8VccnlGuuHE7IzOlBMZpZADFDSRfMStU2SVGi819yNvL?=
 =?us-ascii?Q?ITyv8wmQ6zHeI36extHzLiMrU8QeZAZDSHwJIopWGy10hsKdY9UGbk43DdcU?=
 =?us-ascii?Q?LRoqEOKLZO7crse0jGN+MZq94RJMWjp7OzUmS+te85JSK8hNFSN4YNVqSZ0n?=
 =?us-ascii?Q?0xfKYVe4R5zj3xi3hJ02v9fWxSc2QzCCVmSr7/Wq9RrMK6IfYWNZCY3PyC6m?=
 =?us-ascii?Q?fJ00+uQ/AHbLlavaYTp/LmKOZysRdtX1HwYLAAu3pphCdLXnWygBacYvoaX7?=
 =?us-ascii?Q?lsh3uyAjIw3Au8/M/tpC/4A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c1dc19-7f73-4657-977b-08de20ba0a63
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:14.5377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+qRhXK15w6KC4MlMg6H0AXaw03c25iJn/xGyKSABC8+2qXYUIUfdQPaVx0THlJ1AZrdDMxG1aRfSrSYV34WFGMjKE2L4G0fFJeMZUQ9loTkzAItuTZX8BE5rV56e5N3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/spitz.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index 6ca0a6bcd34cd..2ea21a2091ee1 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -105,9 +105,10 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 static int spitz_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	/* check the jack status at stream startup */
-	spitz_ext_control(&rtd->card->dapm);
+	spitz_ext_control(dapm);
 
 	return 0;
 }
@@ -166,12 +167,13 @@ static int spitz_set_jack(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (spitz_jack_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	spitz_jack_func = ucontrol->value.enumerated.item[0];
-	spitz_ext_control(&card->dapm);
+	spitz_ext_control(dapm);
 	return 1;
 }
 
@@ -186,12 +188,13 @@ static int spitz_set_spk(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (spitz_spk_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	spitz_spk_func = ucontrol->value.enumerated.item[0];
-	spitz_ext_control(&card->dapm);
+	spitz_ext_control(dapm);
 	return 1;
 }
 
-- 
2.43.0

