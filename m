Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5230ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416009; cv=fail; b=WLFJBW2jdOXchyS0q+SN5A+cBRCIJTMs5TeByx+Taxhay4Rs7S7cdPxLVJCYwMWJ8Dw6vbG+K75iZvjlt7w05zZB7nFpN0GmX4MevzfjKxsJ+oNA1jLNwqDvnyWTKxkwXwioitks96JgfeJbt1iIcT4E2BTnW87+uWJcqrMDKvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416009; c=relaxed/simple;
	bh=VtMZ0O2XqwvsNr/H+rY4tbqwOOoAnVaOYodtT1IxM/0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g3X1Q2Qsn7oXG0ZqKHMqBvr9HbAjNYW2iYTqiPCySF/CEDutoJfnSh3UTsnBaMH7O2q1QeqpIuWC/+pnxwMVF3aOzRbuii6RepVy7hD0Iuy/gf5MFncoKztYN+fk42CWt2qKH8D+a8kwS20RQ3n0M9JW6D5uPgCgSe2MdKkWcB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LWiDhMtf; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LWiDhMtf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNqr8JgrrwKikjTOeG1eK7UvrsCs83ezrgqfl49aQNwlx+hiEV6byunrmv6J4zuVlcYnAHtf0FMUgXaKjoiDBaZ3Pu2Lx5s8hSQvjn/glT+toArlmYrfv9hz2ZJplsUko8j1g/BUflk95JOBG4+ghKTAYMsgD4bJjcli6nGMys3iQBK3E18mfnHEVdVc7qkLHU6Yv3/aKR2xw6TblksWClMGf6fWZhTnETlVK1Q56W4u/thVa5ozkukUYfOe02HNJ7cnxD2ZQakAVXNn+oiecx/5th+yOaoSgeuf2DtM4DJUEPXiEYavhCgg1thYJQiv8LGObLaxg06m2S90MubGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll7wS47CFrc/bG+eU8m1YGOPS9UQ5g3np1aadWFeq3g=;
 b=UqdV2u3I8utFUOCI9F3TMRm8/PyKoareCY4hRMMqmbS3F4Sqc/MUGbt3FJZgx0RoM+QMvsbPILyH1c1QVmsYUju3ZtcPLYIFjzazlC5ihm09imBHehqd9IL2M1YhOHNnNI63uF8Xnz1X0qR/Jd+tcpH4IhrwcnniNH5+4J3w0oyIKjqv+LtvuaYlqwHGlHbU7zDeptZIKwGdZ0O3CSZDK012L+zosh35MVahHevxRUcVdci/2ywnDu+n3a8hz8O+TDO733FcS2CMwep0E/vn0y2gvCFVT+sHORIkuYBHAvd8jvAEjja4AlBNkK0gfqK26R4eYFdD7sJsqqYmFZLNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ll7wS47CFrc/bG+eU8m1YGOPS9UQ5g3np1aadWFeq3g=;
 b=LWiDhMtfXrHFTGrbN4Rmvs8mujjRYjOgwDwplLQZTSAcg2xyyH1hXL7SGF8Xc3lfjZZXJTwbTx4Rof3OkW/0NCW4A8A0TcTuAMG1Q88rUA8ha3egrt+4jBBELfo9rP43ElT89znXKaSd1lpODXXbEVEoZLkkXQeOteegpdwDzs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:45 +0000
Message-ID: <877bwynm63.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 117/139] ASoC: codecs: wm8991: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:45 +0000
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 894c8a04-d9ea-4bde-9a0a-08de0ad9e228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+V7BGzv4QvyhinUhi/SuWXXj+BoiWVYHpF+3fcYRAv4rtXqBuDZFrF9qBvEN?=
 =?us-ascii?Q?7WCikrA+ncsIWaexSFVSdsWnVqDkJskIrniUHhLB0PLQB57CQz2zPyH0JlHI?=
 =?us-ascii?Q?Imu0B9xaA2JZlOn70tGV8ltktmtffd/XLHkiGjBrxC50JatOHdoj5XCs987d?=
 =?us-ascii?Q?38Iz4uvX69B9P4Lq6MbZ7FHuYADEmNLfy5hd5ivyqambr/ewK8el9Y3OvDAI?=
 =?us-ascii?Q?k9hPBHBslTt0J8G8v6i+Nmy5HVtzyOR+IDF2yCjfoYb7Pfy4tI1JS0tduMvJ?=
 =?us-ascii?Q?Xf5NDN+Gl3vVAFTmKx/3Mxg/0Df/F3l6cYbUjgktlzY5WgHUcIizyOnNjQkk?=
 =?us-ascii?Q?zWSTa7bQcbQo17hXl16AfwdjuqlFA1tkhE1Z02nUN3p5j8yW3C/fz8tdVvwo?=
 =?us-ascii?Q?YHXsEe0OYlIVmPByryXGEft3zmEpRmihP4scatOsWSq7is197NrYnwGBcYgq?=
 =?us-ascii?Q?oB+XRReUdjF7xqqGxicKf2h9kCEWVC2vcR5SmQ8edMfjB33tARyRcU0J6bp/?=
 =?us-ascii?Q?eHcAAezYo2efANiPe5KKk1c/IUuxpGZAf36urnurVOZjorBs/3FmqPQTHLS6?=
 =?us-ascii?Q?LxI/xA08bupx9KIiOJTw+/21L8ts2P1kf0UK7T9M/hFUPI6iepiPaDP/eVsp?=
 =?us-ascii?Q?u0Ru2IT0fpBUF+uHJI83XhMoIsVV6a8djT4OV1ziyUdX0YM94PzILj/8cTHl?=
 =?us-ascii?Q?xjRzOWp1QhLBkN0IvYAC21nzABeF39kpSRYjykD+i0Um6HPDIRKapHERlPJT?=
 =?us-ascii?Q?cPMZMKMmuClbTyhqmJA4FH3kfHT8z4fMXT+JEgqJbWZ84lOYtDxG2tdVkVOa?=
 =?us-ascii?Q?cXqtFqvG3OR35mPRlX6caG/LbwHUtiMRmwmIE4Dy8womlxJN0Yoo9IPCSa9+?=
 =?us-ascii?Q?zZp+6Rg56f2g/uv1LDuNtKlw5oDfhh+dzz6s8vvDXA+8dsJc8OXWV1vGnSZg?=
 =?us-ascii?Q?/Gju8K93L6OeVunxF4M4PrTs700QyWICxiDL+wOIv1qPdGBed6w6dzTtB9kX?=
 =?us-ascii?Q?m0dwnbHBTCYqPR235472T9AyyN62wbne0pU8wlU+x22Fh4xlJ/amMEHvAZ22?=
 =?us-ascii?Q?U+BUtsbYRWkb41SYJbi8TTko7hTnmvAwrcI124AWu2sp0d1rVZisKqrvQQaU?=
 =?us-ascii?Q?PQ+9c4EztrbOIzVYPZYmc1r8mZFJac9ZloRunYvfWJFGc0JB3QTa4K8VrxhE?=
 =?us-ascii?Q?aok4hsjjO5rTUOHfYABfLp8HG6o2fUEuKqhWXNPU9q/T18auR98VlTbK2Hc4?=
 =?us-ascii?Q?dTxGbunZyF6Zot2v0JEmI+UZ4epVrUYLMXu8GgM6xxcfT5fCprpMjTfQsQ4Y?=
 =?us-ascii?Q?W0QleroLEXnQlP8abm0u++VARvT2QCoNns5cH4EKBX3OBv3/0o3pLLORKkPQ?=
 =?us-ascii?Q?cQ9rimzLYT6eVUQPfTcaDiQyvbb0jPYJSLySweXwNT0JiZPVtQL5o5qXxsMt?=
 =?us-ascii?Q?VznKN3ALH5GoUNKIfe2EZ6xcpmqdW+syvlT0SM01bNp+4elc+8FjOlR5Uz95?=
 =?us-ascii?Q?d8qh6O6JGk2boJSZZcu3zD8JnZGqKLXs6bPX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?665eNI2LOAtZMLDGnW1OSIiOmZftzelPkQQnFoXHbBPH2A6/iVgtpSnQDXLR?=
 =?us-ascii?Q?6IBNUONAR2Mh7/5I36eRBQSx7NNuDYqbQdj6h7ayIHvRV/zr3t7hX7H+30gH?=
 =?us-ascii?Q?Kg3bgl8wNOk1qg91LWQPxvxHaumcgY1y4ieh2s8R2Kw1aKKpyAhHd98xrBjZ?=
 =?us-ascii?Q?RJ3E6bvtq7GeW/mOZaC1NN309KW1ZKO/t+MNAzf63oy5njx64m/jXtM0Fu1c?=
 =?us-ascii?Q?/QyrlOnWMfsYOPKlRWsGa4aZ5485IPpbHLKDyzJKYQi28KpE+fpA0Xa9MBdb?=
 =?us-ascii?Q?VmPxACM7G6kkvEcc+Ha6m2TIjWwrM6BjxKPVk48po5hvaG9gNewDd4l10HIo?=
 =?us-ascii?Q?NoRsCYv32obneKlwoHvl68mnE9XKGbdAC34kD3PZWgZnezOB3LhG+kpR1JJz?=
 =?us-ascii?Q?zaHR9fSXOB/P3TFGsAufx79v36ragBKRNeDcL+or2gKyYbq9sms2riC1KR24?=
 =?us-ascii?Q?EnuyAcL8Q+imO4YSpQmism7jbMVA96MYclAnyeyn4p1Ek9/kDZh+tHGWQNcc?=
 =?us-ascii?Q?jdJEBNFBa/c2pdhdzzaweaonx7vfQbtQn1HYQw6C6y6XERxkLTdQ3E1WZUYA?=
 =?us-ascii?Q?P90mlcfEaVo/RUjcte2NbdP4Qc4CqqLYPc+gfh+bWOZrgDCDgkP6vCFHS/V6?=
 =?us-ascii?Q?S9egTWaKwNdktpENlvGZnB3fDrhzCpXyAyBArKPR95clJlAyyjaT/oJrCofQ?=
 =?us-ascii?Q?ypI6U1fpVZNQdClxq75vOIXPcQ6lRz5+g45+okiqfhurv4Z14Vm9cewgNKO2?=
 =?us-ascii?Q?DohDPKEeS20ulG1S3mAOl2zbm77D0SX+BXb5JPuHqBIvJQoPL/jaJyCjAqn9?=
 =?us-ascii?Q?HK2l2fefTtMGpxncicbLX1KrOE+7KttRomgOTQiPKMkgVVJwfjLnMXZok4E6?=
 =?us-ascii?Q?twZmAflcQ8H68f5fVI14G9yl6UUxA6iHhSzQiS83nD33pfafJCYPUJtvZ3FE?=
 =?us-ascii?Q?LT9kME8y2/ca7Wknt9mLr0YtZwtT5nvPmzk3SpK/YwI9xT3EirkQBLIeJVII?=
 =?us-ascii?Q?YDYTJV+J6n+Ont78FI5fzsyX7cVpGQyGeVmZY0q6fPUWZHjvoGVRFiup3mkD?=
 =?us-ascii?Q?DAAKPTV6CZ7SnZ4vwOaNS3JEPOIjrrD+oQEXcMcOWKLbu52Nr9VbXvy50MI4?=
 =?us-ascii?Q?3FMeJ2ITBWLJnVqhHqIk4wXXLZzoZqsaKQDC2xlfKm1/q9ZIokfsXQb+GeTk?=
 =?us-ascii?Q?S5yiZlPTrRtdSP672GflO00bm539DZU3EHLR/6h7AJ7LbJWtap3bAg/YOtN1?=
 =?us-ascii?Q?LDzDssHjwAc1MOnCnOk+xGm9FCjypSvCBkv00uhOFRfAaPO3SVn/+jGue82p?=
 =?us-ascii?Q?txM/2Usa4S3bdjIlggNlQabsc8AMZ3k2tO08QGVjCt4RgH2JmOpeAn6RVEiG?=
 =?us-ascii?Q?0NWbxQQijHXiXW9H8dh9g0AEzW/5eIX6Hpy6fTEMqFiZEHhuE/yCEuuQKI8x?=
 =?us-ascii?Q?g+HYfzcpxgpcb1cVab//Ej7uKPwgzsQR/I0pgwy21SAkw/K3ilSfFtk48kDj?=
 =?us-ascii?Q?IU9wJLW4FpFXwJ/aMLjaFiOh4krqNGUdFIttp5FVCTlDcec+zvCuy54Dg77x?=
 =?us-ascii?Q?TJAMnfdv2KPA+tTevOxdFahRHpGS+L7QQxjMPBm+Ps8Eka9Egu0y0+O6EdBQ?=
 =?us-ascii?Q?Va3vQnL21uDUJvmxq3L233E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894c8a04-d9ea-4bde-9a0a-08de0ad9e228
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:45.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ2h9RG2F/nTsCPZlkpo2hPlVKR0vCjnO3miWVGuEL/0C8IaylPnv+rJZkUQqXptvo/K/7RBCWWMtH1JPqLH+9b37odWvaD5jDXdlfh4H1Dxm3FsUneIj4gTr2HBdsnW
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
 sound/soc/codecs/wm8991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index c3dd44c1dd0c8..0ab0a50340b1d 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -129,7 +129,7 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(out_sidetone_tlv,
 static int wm899x_outpga_put_volsw_vu(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int reg = kcontrol->private_value & 0xff;
 	int ret;
 	u16 val;
-- 
2.43.0

