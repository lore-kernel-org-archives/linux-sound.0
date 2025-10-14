Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271BD30ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415998; cv=fail; b=cdMwX4eSB50nsNgClWnMpLGQE34+e6902ECs+Uzv81ORQxjrvKNfpXru34f4OEMS1kTke16gousH1oRPN8gTWVIJg8uOZ1F4GtAZQ1j/9Xonhp9x+61UBO5CZcxzbIPH37LGc8jVTdylPgWsytMQpR2ZWvKYNVLt9SM2uG2cOi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415998; c=relaxed/simple;
	bh=yN/aOFoOawgx1/AYTLyLKRV4DEShZyQgJaZYt4XAor8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eGavdL2JrFanGFWOWoEmj5H56m+N63ExwV8pf101GbIA0jxFdHCoKzYBo8KZa0+O+dxrBASgYttzh39RJH2FZq+gTY5Et+jDzX0eT4bVjCRDlRD+1CT6ecquuQDv73xeKzAv2UtSe392HQns+kt5u/Af2IuFI2awkuY9DVKqlPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TuZrFwMg; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TuZrFwMg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6CEQ/Kk6bSb7s+mZe6nbjJa3yzpEyoRCvDUOG0b/ha6mA1ZdMxS4U3cy/aQIqAhrGTRuV6OaG4WQoFB+i0++bG0r9TOx9ekmSDyLyzPYAx8+oJylYj59eXiONiZGNLHzEeC02NnxEredCzAfnGeOj+0iq5PsE5Dp651s/EbWxIYJulfXgkSFqlH/BI8zvqAsdRdJs+cayTy0eIg5ME1t2XQNJ8x6/CLlKiLPd071a1cG9OjeHdwkj97csZaRW8rjJWAAlfzMIBDMFUaDQ/Ua3xwm0sDTk6v/S4xKAGoXLC0u6ki8XZkc+jUIPuaY3OAvq35oZ3kIJ96qNNim+hjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmfKCv5vDp8UunFWbGFgQWMD5kLwMZn+rNEzLCY1+PE=;
 b=m+W3b1G+avFHSaM2yJRgf6srJkPFSsE19b8z0EVUpxhvjKoaKQaA//k3nkzyGb3v0rR5NJuKYGI8bJj+K7ekMhgIU5iqCgtpLSsoDSaGTN4Cc3iCKa1kM43p4z9GyVMFa4BUnzu/cMH6ZNSOnm09w3IP62eLh62qG9QiwAlrXzh27Ur1+8R0LGUMcklvbm4F/qaicx2hq/6buupE6moewZtCCdLP81IJjjiGns2/KYwHmMbAqm/lijEpd4BUYA4SvS3OXmw2MEOo8817dZ9rp/ezk3bGRlKTXOaaRKxPMLIUrT9yoBCmG2ahaU3hOFBtkyaCMqoPtFvWyPYEYhJApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmfKCv5vDp8UunFWbGFgQWMD5kLwMZn+rNEzLCY1+PE=;
 b=TuZrFwMg0MNYDmG5DRhdb4Z6pIfrfpFy2pNqrpKTMfN4kWh15Hk5XlUeouBBDsAbyVXGj0Nrn2RecL/eKmND1LAVkKcSvI0IKVygM5rRni3EjvvQqGNuwcBln+tccy1OPGb9GT59Cjx7F/u5FNpRPTYr5eKRVEEQ8XN8epElkt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:35 +0000
Message-ID: <87bjmanm6d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 114/139] ASoC: codecs: wm8983: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:35 +0000
X-ClientProxiedBy: TY4P301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 651eafa0-fb1b-45d1-dc62-08de0ad9dc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4xQq9mVB1WF685Fo1Vu9QLtrmNx6IKdpP9Un/bZoExBRAflOplHTJ2N+ljML?=
 =?us-ascii?Q?JlQjR6u4tNLLIZ14pfJb+2C5LglCOLeJOvhB0515fkMIGZH1joM4LiIQhItV?=
 =?us-ascii?Q?OWeWm6Kw5H+8ft892si9WMJq2Lm8GxZKytpvOjbE+DBv6oL+P3oV1CsUB99x?=
 =?us-ascii?Q?OTTuZqBRrZVT6dc51JFKYcYduJnR2+/Yp11HF9V1oZ/fApLm3chZvBQQJCZ9?=
 =?us-ascii?Q?WfDQjMB+0IjdvbHSUOtn1aP4mFTghnlSYUNNcGR3BLUnqRNallfKj1zVHtn+?=
 =?us-ascii?Q?g9TxT4B1ECMEch/h6VZaIND6x+h1q1sNQEYx11LjZqc/4foqf7Cr8qYpbopX?=
 =?us-ascii?Q?JS8hX+YGN0G6l30EbeBZEyzJ+IyTHnWrCo/eGZqkzmcXyl393dVQv3YvTLlX?=
 =?us-ascii?Q?IgxpqqF8J88M8cU1b8Gql1IROQd0IrZYuiJX0uHm2Hf9He++X/9Yme8xRnln?=
 =?us-ascii?Q?gwGZSWnvHVbJPqKs8Xf14u2P+OqHP23cC1TmEpNEuDPtn1bbKYDEBgDG+VZf?=
 =?us-ascii?Q?tUY3eIxS92q0eZAKeq+8dJPxbqUozwbLaVMKcj72AsmHfc5rLR22QVO7iGjE?=
 =?us-ascii?Q?Yky/1qMxH2EmxoKpiDJ/oIUrxap8PRm6TOTIvSZ3by3Oh2QoJX+Ui5kdRiVm?=
 =?us-ascii?Q?3X3OXY4wqwGY/gkJYImg4Se/BmdUUPPdABmoZLEscitAjcGbsSdfrgw6+6df?=
 =?us-ascii?Q?obWWOzGNE2cboWzKFTafFWjEQLpfkHlVgdnGoaY5164bzvhjGr+QAkpibgtT?=
 =?us-ascii?Q?VLhs+z5tUt6hlKZ1TpEKExMoNuA4E8+Ko54gEY9dV09cmCfMKz1WNEiWCmko?=
 =?us-ascii?Q?llcNyQkCSuR3+ALc7EBIUoHyzjCvDA1xgUvx+CPWZtso46b9N+pa9Sm9Pa/5?=
 =?us-ascii?Q?iyMmM1GfDivyXcYLZEY+yfSM/pkGmw9eriMU2EH/eQMHK7FRzcAP+i8CvJ4h?=
 =?us-ascii?Q?G6a88itytP+8v8/TO+QfKsi+JfntdbAsfXCOJ2Qh+juJjhGsYZVPJ/aFwjsN?=
 =?us-ascii?Q?lJNdudwcDiF6smowoP9PAOntkHiYSOtn93BVdmYcZ8MnrbLuWS3z1KgfoGZB?=
 =?us-ascii?Q?JJY5TpX8Hs7NQuV3gDBb6np5McLp9xx0tb+pfNjdck+95WIlqZN6R+HhfE/O?=
 =?us-ascii?Q?R4ZvtoWy29HVV2v1xftmUi24DWMYgDclzM05CmAHkSLcx26gK3qzYw4171rV?=
 =?us-ascii?Q?7dyUS9uEni2h9p+SCTfPgnozlCMv1BX0kgs8f0wrqL/Ixk1RfyymICxCGzCO?=
 =?us-ascii?Q?KFRu213vuVXcXejs0rda/uGKcpuic49PLZCnc/KuHfY6VQs7WC3hAvgnAoE8?=
 =?us-ascii?Q?k58iKGXCTUPkhvHY4/7GatCjrw4IqEzFUk6O83e1vVIKFzRY9fo6PoOUbqoi?=
 =?us-ascii?Q?Hk4z/VQyhACp34vUIj2dryBUEwn4dMYU+wVoyWphFATv7kRvogcpBIE9h68c?=
 =?us-ascii?Q?zjLfN1S6T0KlDu44jZfvKAmx4SvRkfJnmWjlq1jvbLV6LP5ONQl1O9LznpWE?=
 =?us-ascii?Q?L3J9s6hWl6rvmW7b00yoAx4meiFdA+PfS8ob?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KMPTBjLwg5gmf1oBvOH5hZxPTPb9MOqotTJmLimGctojny6URY65RMuNtFF5?=
 =?us-ascii?Q?+Si7jyzUERseV3YO/OQ/7zBh9E63HxG69Efi6ZPpGOcR3t5KOD3gqw5xfTUC?=
 =?us-ascii?Q?5L1bvdy3fGLieRNVun8U5LrjbRyO2EKqMw3YjYAUsaghX7D2g1YZ7WvYg08r?=
 =?us-ascii?Q?UdJagq8FtethItQTkcmyIYdrwN/pCEpnYZV+ZJ+qAakETZc7SZN0EFChPBVI?=
 =?us-ascii?Q?pqcvujx2YYv5Mzlm/22jJfOt0AznN5+ftj6ib7HkEH+ZaogcBeSPz+Hs7CIx?=
 =?us-ascii?Q?cHh0yMfG2vaAq7L8xAbprjBDCypFWWDx8qZzYK8H+2yggaEpyTvMQhCGgo7V?=
 =?us-ascii?Q?80tMQQ+Sl6JFpN4/swIxuG8rRX+cdPHgXy7r/1krzQj5MX2Tr2ZaEDEinn5g?=
 =?us-ascii?Q?0MhXVnAk6VIuAeHi1Nng+g8qvY15vB6C6/Sx4O5ov25osblNq8KVKUMyS7TP?=
 =?us-ascii?Q?wK95ZYByzWFu77bb3djK2vDFqtKzcQLdZ+ZcTx5/znM7GM/c2lrOdX2Pzkh0?=
 =?us-ascii?Q?9iAWmBMZUBb4FAZSdJ6+ZsUJxeSvT+iioOuiIQY0Dsh09NqjP1LKmaD0So8j?=
 =?us-ascii?Q?zxBXwVtGS/A3PA9QGxQR2EYosEbzmdvPALtMl6EWH7J4UXHTqmYlM/Aqxwxw?=
 =?us-ascii?Q?9OFB61QWE9iDPjwS46CiFnZ9zAsLigitQLiQCCHN1YjzjxbHMSvIbGkR9k68?=
 =?us-ascii?Q?VqY8SXM76i1DDND5HM4dkpFP3WoBJA9Ztu6RXLQo2Sfr863SnNkMHL93R3s/?=
 =?us-ascii?Q?Gy5ASLN9BZzDLY6iSrjAwhz+2rWcGJ4mmtNSpRkXxGR1ftO/KOthzP7SYR/M?=
 =?us-ascii?Q?kD17woJuovHHdlTiy2rhdwBk5E5P1iFhL329c7FShCiTaLLHVtpPsQVotzCr?=
 =?us-ascii?Q?UZS8TjK7iFyYsoM7ky4v032TgpvJ/zkJOaxIMgH/GRNwVaLtTuUoq7nVRvKp?=
 =?us-ascii?Q?xI/jO7iIQ6YGRaY8ZYIezcCSiuisx4BRMoFi+FBhR2Tz4Ex9/nyCEukIlCOP?=
 =?us-ascii?Q?197ry4aYsLRGwvan/Wng6QANOdbYA8A1yvFvFAMr7MGEn+GO/OEslcba8Eun?=
 =?us-ascii?Q?IwTFwgAurBcB+MSa8nmUCpnkkrbT9+hCirnKSTIbibm7VbsWfe213SjdrQj2?=
 =?us-ascii?Q?OW64myfp+c7jDzflZvjLeoJc3Jx4SJ9YqtmcAYuqxbiN8xFzAYEkULH03fsz?=
 =?us-ascii?Q?ZFxWXDRyFXvJJMw3Wpp8FAZ7B0g67NM9XY8xqdRCUFvP1w0PHWNoquB/Gt+i?=
 =?us-ascii?Q?Rk63UEX4BJffs2UHgWV27gCkg/gQsZyEzI+yCk52dmd7AiLLB8nmYA9gjzW4?=
 =?us-ascii?Q?+1kQXc252GjnXTwRtlDg7/ux4J8j/xkl8CsfNKFpDN5ZEmPzL/iDcllK5cRY?=
 =?us-ascii?Q?B7XPLke2Z/Hs7h5v7DXWUHF8Zo4krvleklnfS5Z+sHPvsnt7eXcOTLEYMZ0X?=
 =?us-ascii?Q?PkLaQ5yIa7nZewpFYVcOCTzd2XJYuHM9iIWMPGCki3zdLXOGqaxYPJp1CmEi?=
 =?us-ascii?Q?7NEJU2/Pm+ZTxfipl2LyF3Z8bHBfRZ5Ih8PcDMzBw3pyvvhgM9uJoci6lwnB?=
 =?us-ascii?Q?8PYdTLrXneQZpfMYvgXyk7toI+yDKxRL/MfZWwSJEpws6Fgc4eqNdrHBNnNf?=
 =?us-ascii?Q?xVcMoIutdrqXn7hwe6r8Sw8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651eafa0-fb1b-45d1-dc62-08de0ad9dc24
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:35.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSUZi6bwBFyR/VdWHr51T0CkYl6XZsnp0Ms0GzVaXyYiocltpziZNRL+7eIXZkbMchEKH3atPUBxfwJQvo32vaTWUM7BIOIcOSMxVJ7ArxHJlrqtPsKpsxERLqd+S6u6
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
 sound/soc/codecs/wm8983.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index 6a83afe6400bb..c9e516f17c363 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -489,7 +489,7 @@ static const struct snd_soc_dapm_route wm8983_audio_map[] = {
 static int eqmode_get(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg;
 
 	reg = snd_soc_component_read(component, WM8983_EQ1_LOW_SHELF);
@@ -504,7 +504,7 @@ static int eqmode_get(struct snd_kcontrol *kcontrol,
 static int eqmode_put(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int regpwr2, regpwr3;
 	unsigned int reg_eq;
 
-- 
2.43.0

