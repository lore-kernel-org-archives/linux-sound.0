Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75F2DEA99
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 01:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765322; cv=fail; b=u4KCHcFyImVsqMn1x+skEWHJJY/Bc0FcQ8o4WtXJMNqqxmfSHZRpM3+9u5xbAh4DGXz/0aZFLgZEPhPFfwAtlt9WdLxVxxVV3+3bILQZjuJb9HNSttUrRxOR9RyDtcOdKbwe9x9VKE5pf/awmUhJjqPpiDO6cdsj4/KjUwlk6xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765322; c=relaxed/simple;
	bh=dp4JgeaKqGZA8dupma5pc0r2OB5KviTnJxmQcBM0FpU=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=oEYqo4kK6Jxrj0GIcCdMyLFpL1sc/XDA4VloM5X2LVupDkFdPilUELZrG+1IFiPT38XzZ1IyysYv4XqnEi69P7YD+RhsiIycdUNThy1AjqiX3YNFxsnlfhy7WKetlDFD6hJa70hTJv3oyGxAE43wd0ey2IyXTkg9OmEaZY0gOmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B1TtUWPx; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B1TtUWPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyKtfipKveGMgww2+eCyVs+ABaQI84z6ndEeoDCS6pB1e5rRdSrlvtasnQ5yErJZhiGcqp35X105Sc8GB2/TbSfp1CPwc2tval3QmFU/G3NqtT3JaUaA0PJOJ6MD7UGV6jfaWwknZplUtqSuAvsSS4W3zquOOJzd92+sts5DqTgL0uQkbcd5xtBsNHC2d/tTjnubtWhLuLRN5VExVJ8V9OQLSmof34LU7yaBtUZGNScvO5iF2BzL0O3fc7UcZUZ9VoXxNEdeHRtS1kHTiyaB9GGxfXJv/H8hZJoB+rM96U97MuPfhYflHPyYXsHK7WzEzGc7EmIQLoKkaF6HqSWXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fo/lG/fBHO8O0MTZAtq/trJVQmUghKZCcwG+tYx6GdM=;
 b=gM+PlB51ZTqo1GN45EuER1lnWG6cMp4tcSXiqV8T1HUcnnrHkaJm5UecmSTZuh3CQjgvjHFuqpiGfrFkz7JZa1/LYyoSUZ74EtSMP3FeenLz2/2m1milgqNLfbsFD3xnRA0b/ALUgiSl1pCnnnCGOFGwbJ2tqs2oJ2ep1r3o9tB1prxLUTPfQHoKxBBaJHMk82qYOAQEKBNqIy4FqJMWPDovRhipnJEc+AUOoF6m25UaAOYAtQf+CZ9nH/yZ3l1cQjpC6G+pCVE4JLq8w67XpNR+8svyRgLLT8dHKbV0eomAF7eI/drFfLJPr0Ellg71TVfUyby20T8uSaJrjY5L7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fo/lG/fBHO8O0MTZAtq/trJVQmUghKZCcwG+tYx6GdM=;
 b=B1TtUWPxlZx/bulonAhiEX6Jzr4GhFQssyojxnsr1GEZRFBa8AdkKcdkcabcV0ryS466zJPbsd5Gh/CqsBpd3b6sv4iZ2KVlPgJdamIoyyAYFTbhIb4qRQrYtJpR47GNYsl618Oqv++iowldet+sOiA+YasAkn+n1gQnywn9mNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB16015.jpnprd01.prod.outlook.com
 (2603:1096:405:2d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 01:55:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:55:17 +0000
Message-ID: <87jz1nz46z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 2/3] ASoC: atmel: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 01:55:17 +0000
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB16015:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ae5e80-0e59-4ab5-fc5c-08ddfbd69361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6392xskRnrPzdLPIc9wE/nadSI95F/RqPQmFWhnS+K9PL+6b+NfQcvYateiR?=
 =?us-ascii?Q?SKA9IKsUm7tJj78X1nRzbdL7PPmidQUh0qGekLZT3bPK0QTx+Uc6SfLmS5YH?=
 =?us-ascii?Q?ivWL8206kvgRVdyaUNewjffSNvYUZNZQbFOhp7EJaewVobSWhkYhT35Y2ZRU?=
 =?us-ascii?Q?FLLHdeisHz2ValEXGJCM8Mn0/zIH7NceVPHFik01yV1Z1008Zm9uSKftAjUN?=
 =?us-ascii?Q?o7ZhAYkLI7F1Og5ZUt2v2mpwUdiSBH5HF5SA5JomnuANvTNpMQBf8Yy4xpLU?=
 =?us-ascii?Q?tJFmaAxVb/A0HHx3vERZ7nUWq98RjVp9s9GiJJ9KNaQ4ay8ZaRPdMSiLI5K3?=
 =?us-ascii?Q?HpIdmEr836YNbh2iL5wrGM47qCdRIzSU/g/Jy1+ygOQp28PUfu2hmfOcRRyn?=
 =?us-ascii?Q?ciCPNXnhsjs9TFh3luroZWyInX56nRVnAEdHm/x9gxisQ3CvPUdnnyIYQOec?=
 =?us-ascii?Q?UYZARftSetcHOh/hRmUv/+kpy/ZgQVP7TkzdYMpTqPShaSvJAV4W1Y9xSOyP?=
 =?us-ascii?Q?8eUE8K0omw2MbhWJePPoDwj3LgQ/c+zmDitjyIDjPb1oPzSEYFHy5ufxkqi3?=
 =?us-ascii?Q?vQ7/UCiCVqCgswV0SjlhEibBfFVhgOOwiwHA4PD9hE69GYFLLCSmJ5yl0h3U?=
 =?us-ascii?Q?Y/mTbXEmD9Pl9kXo0M7p20winajj5vQvPX8c9QrEUtIwdnkgPcmUk3S2ejWD?=
 =?us-ascii?Q?zVA2s6LdnEclxqJsvtwH94FySsN8/PNqjX2NzEUXf9dIJ9djbrSX8qMwyjPF?=
 =?us-ascii?Q?JDwHI1XeXIwUcP/WaD2Mv1WNCLr9XivVp20BGDRplcTyorVBisLCNa6x+Qv9?=
 =?us-ascii?Q?qnm7rBG29s8JETO2Sl5nm9uiiaqwz5/EHMpMxsNCzvP8shgDawID6jt4/aWf?=
 =?us-ascii?Q?UQ0QMSNY3urx7pqfIALjnGTxWJ133TiYn3p8T/nAnnBZSfCr8hi/IjBcIMRh?=
 =?us-ascii?Q?En/One1rTztOVXlTybPdtp32B8AtXRyPelvb75tIcM9YUJtMUj3COs29rYcC?=
 =?us-ascii?Q?5w56dWn29Bl9F/iQmuMT6iyF0qCFgA3c/w9MHlO6m0B/IZFR/b8DuF8/4OdE?=
 =?us-ascii?Q?S/2RWSj4gcXSf2NnS3gY9AO/JJyopSHNS42eqKPzUsKTzP+aIOKY3xIB6/43?=
 =?us-ascii?Q?by9tw96IsArYa8qidNTj4VeAHbwsFDMQLco6IG4ZT610ILdSKuz3d3cMf34M?=
 =?us-ascii?Q?tXeFlT9zP2puQ19Qs+O3VyaEpxgtTIH8llSdqf8IXN4ddk6TnOCO7NxEW3UK?=
 =?us-ascii?Q?9dnNvDTwq1tB+L0npmK/wZLJzQBAWt/jplzXEd9GStMPe7a7xlL35RLo//wa?=
 =?us-ascii?Q?sWXHkrIJZyEV69Sr5Ie5GP3fapyU3rb2RNk9sCKaeNdv901UB0QdvhCPbg2t?=
 =?us-ascii?Q?Wvu7xHyit7vdSE/gRRD/AaWkCfZukpaBdFQXbyVJWTVQZUcMadzl2AjtPry0?=
 =?us-ascii?Q?rIejYtRFL9/OcggfpAlpLeJBApuHAaoy2/xVvuH1mUuxkz4vdqpnq3Vm5zV6?=
 =?us-ascii?Q?c7gLbzzzKqjMdxY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?362JoK6nqiQfyE3n720ZfFpnmfVISRVSIPRBHzzJJlAENNmDbwAGI7/uGqSf?=
 =?us-ascii?Q?uuFrRzfkPF9E6AaSPV+/1wqLtMTsGg4nYbycC9q25a22YHW/v58yADhHx2TN?=
 =?us-ascii?Q?9zpJhJvWs5u5TICD0Cf7BGxaMZ6IdsvZvVp7aIJVF6X6aHw5wi4qo0ehLnkG?=
 =?us-ascii?Q?e1HZ7ZstknPMBH5VJ3IQ3oOSi+Z5z8HpGKTabICfAQfEQs/DatZOxgf5NUju?=
 =?us-ascii?Q?nSPpEodS9KdSLeQbpvpobTyn6BIwt4KQBLb/tieWC4GIMbfXZ44rwuBVMPYg?=
 =?us-ascii?Q?f+kYeiMMZPB/3UYbgvveBy8Yr5dgeTikGSLdQpkat9VCjC4Zm7x4NRhOsYOA?=
 =?us-ascii?Q?AU6XoG3knUaRXNGTUw2U2lx7q976NySRWt8Gaxw0LswcFBezYXEkweRD6w/e?=
 =?us-ascii?Q?RiR++PH1SxqT/sDB0QZxGI5jOB5t5lgMgQ3af6V+oe7gjXtAc3g9XLgyq3tp?=
 =?us-ascii?Q?oqAAjclzH+VU9ks8dUFHazysyLabOWtTmjBEn2sDCBAn5LWdsQFFinjujr56?=
 =?us-ascii?Q?yTxJ8Xf+lehFAPRqeT/Ehggp2jwvxkbvQTxM7MdUDfpaq4/uALQYaqVcMvOX?=
 =?us-ascii?Q?b3zhXt7oIVR2IDnviopfW2ST9asENFBmq9LNHPXKFinjl1UYTEPHxPqeewvg?=
 =?us-ascii?Q?0ruxzisOeIbudcBG1gZvJPjUZH5SbFEP7glXuWUO80Av7qielN0iZn6W8L+9?=
 =?us-ascii?Q?vCApnbLeAFeMDXdqB/r6dGrUrpuYa4jr3Zgt/4ugHNNYAArJx98moB2to2wU?=
 =?us-ascii?Q?O8u4Vzl0vSlOCxFeKVBaWDyfFgTp4XqSG6JSKLDsPceh2uH0N6dlyye/1jk7?=
 =?us-ascii?Q?7OX4IRdvst4r0zDHhIxPfNTPW3ZklROAM1K7aOwTFsu3PHtNlPXEwxS2HXoj?=
 =?us-ascii?Q?g02tWwPEHSrbLRd1msy3omZobbn7ibY6/Q4elPqrOvncwTGgdCDhwPgS7Lqf?=
 =?us-ascii?Q?0Hk3j65eKR9tFA7z/VLJpbETtslu7JXm+EZubzCj2E9Cl+Wr9vR0q/9Apw94?=
 =?us-ascii?Q?jhaR+oCcJuDTKLLNnUIQ/ULdJQ9MDSvJSXVSno4Q58CZjTbQehcx/H7BplJj?=
 =?us-ascii?Q?vyWzLU/CzVi2Ls1DZ4niWbwYB43OLpz46fa/KmY0CGgyruVJkaRKy3hBtI/m?=
 =?us-ascii?Q?6CMn0zgZyVM9/GqQhunUJYAo+5mULyG9AwgY+scMHsctCS/M1B3nt3zCDktT?=
 =?us-ascii?Q?MFVOyvAg8JrWaHBZ9/X2J8OWntWV1ZecrIEqKHDPSgZybzTvgg7YlWwn7eav?=
 =?us-ascii?Q?RW21FN547RdwjzSLkpTITKm/RQuwMROhS3K/JX2NK5U4iStkaihio6ZkmnHh?=
 =?us-ascii?Q?75JVb+OEHAYwv6LaK12rmUUlftMZBTTivM3MqUs0z7mWBxgL6t0m/CKwZGDv?=
 =?us-ascii?Q?e+rf6qOBhtMGO4/rIKAB0y/9Cm8t9sIEBb0akEljCKZajcSv7HjbybO0XnOd?=
 =?us-ascii?Q?oLZFUcbnsxqJSy30/BBha/fzzMdyZXlkf5vEKADwmx2A3Rh2eeIkOberbVsl?=
 =?us-ascii?Q?IQYSEHeW/6AXpV4G296FG/Z7KjuJ4XnSD6OzSTZUnJudhIIJ31wnJZEISUcH?=
 =?us-ascii?Q?taewHo+hiJKl0WZbcuw1SsqRKZfJ5ZM9qq+pK31voVVi95IT9M0xnyQdFJSB?=
 =?us-ascii?Q?5RFkISHbLB+23cofmLDyHjk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ae5e80-0e59-4ab5-fc5c-08ddfbd69361
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 01:55:17.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBOfldqbbQwunNYhBWHQpM71pM0I3e09UAy7vd1095NTBTeViMGrlPB6YwbFezunOKkoUA1BNSc+FW0DZ9ct81h/xiZYibNjEprvYg83bldYTc5YnPEUXIR5GaCeesG0
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
 sound/soc/atmel/atmel-pdmic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index fa29dd8ef208..4dfc7e5ca8ff 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -280,7 +280,7 @@ static const DECLARE_TLV_DB_RANGE(mic_gain_tlv,
 static int pdmic_get_mic_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int dgain_val, scale_val;
 	int i;
 
@@ -304,7 +304,7 @@ static int pdmic_put_mic_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int max = mc->max;
 	unsigned int val;
 	int ret;
-- 
2.43.0

