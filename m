Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579B305E02
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415592; cv=fail; b=mPulxOympfgYzGcTsaRVfwV7DWO10beZ40kPC+CKdZRdZ6eYNH8W2FjxY0YuVczunvw6trEifp9bgJJETrm9sLmo5lkKvoixd8gyoDFRInAcq0kjvif+22wLqUvwZBauhIvsSFA4mDw0gHaQJBOecXnmUKDS7QW3Kv0B3t80Hfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415592; c=relaxed/simple;
	bh=rEnbhWJvyuW32auYgsvc55OPvp/+tFyFisAVBSDpBF0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y6Kse1LXPmvi34mmhLoL6xZ8KLhGkpvxON06hKsb+2Y/5pVu2D5+roXAP7is1xemItenfIJ0Hln/1Qd63UvZMYatudzMmSYi5tMICxxmOfavuXCye0V7rgt/zYNOH3ojoXYRCaW9bOlSl1d4bmQncSFNSsCh/bN8CxPH33So0PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ilxS/3rj; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ilxS/3rj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLQsWRuXTznbS8BV/JhpjURDpr+nNhgFARb6BD+d3TiFbHcY2aOEZ/dvxI9pXqbiF5yvu+NfuWqJOa+NvbztxyLvwotqkNZYfAw7zyt2Vn/euxt/xXQFqjF8uSoWRS3yTpx+jTcqD9TZ9PGINXtYTFnH+dh7ajPo7c8Jt3EKQvuGBQPMA2jlkQsKzuEv7K438yGCdHB9OQvzGdxMpagUMCucGRGEcl9hIyCT2TpFnGLcHEF2+uoDYC/2om1KD8CUMGwplR0Qkl5oNZ3yJS9vFmUnkWasmV207VTGSTERhzvrU9DI8Z8IPOs4p0HN7CgtSgXwK1WCf9rZ3AGXZUR3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgOcReAzondgsMDSQhxL66ycOgSRy5TuMuhdf5wrf0g=;
 b=D2W83++F/wbuqnYUqcv8yfQf/cuUOsnsvRCVVnAHoJ4WzUtPNgJOMqmn8dn+kjZMUUIWI4IO6Sol4ohdDwFMWNP6/Upp8PIBytdPVsrL3gqlvjms2AfLtCQ0lGe/UgX5pHHL8oBGzeqpu3g/P8wUKIbPHVSS9xjgKLBTezq9dtau2xmZOGqn5ilL9zKfK/uhSk3phlkLO4dbC+tQoYKkKc7ZJ0kIU1vT1j11tCLm8gjc6uUeloAJlUuijnr4+BrfGR19M6JcnnMFzjISqaoM0Upx3cGrzEHF3yv2t2f6cncI64DmdrrRWwcSUjJQjbOrkdPA/0D7WkBV+ma7KUIQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgOcReAzondgsMDSQhxL66ycOgSRy5TuMuhdf5wrf0g=;
 b=ilxS/3rjO6isloFkvvdVD81AjCrHZLUjYc9WAaaBawYaAUw2Enusd9BnzQAX08wT4XFXfwVK6CYigZ7dTaZigZHOlywYal7UtdkA3J+6Pvg5HyH7eVgdp1bKFLIydgx8VWdGeLm1SrRQMdFlQwbPSt8+9I4jXRnyHi8/988T2ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:48 +0000
Message-ID: <87ms5ut8rf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 006/139] ASoC: codecs: ak4458: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:48 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: c019fa35-301d-4a7e-dcfc-08de0ad8e9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GnJODwLfQt1+BgVwCdgTRiIRuPV4aGoQmlStzaPECkh10YLJ066hrppASfNP?=
 =?us-ascii?Q?oKAGdimY3NK1RVAQ5bUcs8/QNofhhTOmFoE3s8OiazPUdJPQ1cafDKEBOa0p?=
 =?us-ascii?Q?TRxmF3nbbdNCxj7uhoJiIHE/i+V/AWcqicALly+g+09/VKyDQEkzNJX0HTeZ?=
 =?us-ascii?Q?1uoq0YO7xWmV3Re/I0+ZK/ZFD2jY1svbD9LBL1IhwAm2xnRoLueHfCiaGDSB?=
 =?us-ascii?Q?fACjz57WjzpXptTR8AysLh4EiAvGVCqMMTZXrHESaZsgiN+VxCLQiH0C3tdf?=
 =?us-ascii?Q?B+pINL20HnAWPdr0Vc1N6Sm+aLo2dHBdeSxSm3RRuCx9caN/nC1hxw+AozQh?=
 =?us-ascii?Q?bc6ttQGGylqx3h/0qfgkMJzcR7C5nj7BAu0SFqID+8kZ2+ts9BmYk+Aa+FpA?=
 =?us-ascii?Q?+yMUX+CeO5OHSE+fothRgqBnHMkcUyLPOTEoJmHSVDKp5AUpon5rdQduzE9Y?=
 =?us-ascii?Q?atR83g8qLxOL/ZtTwl1V9JJ/44w5iwDC/COUzhPaCuRcA8VtkcLDJDUCv4zV?=
 =?us-ascii?Q?ZOdz7zayxJqnBQiBYtaGp1VnAqncEpsnS4d0DCvNiFKSKYbiTHkVygvYNnNn?=
 =?us-ascii?Q?vKQZrDHOh4WL5iS/MV5ute44BTkw0dGsyibI97KUwXL3MZjcSBhSjQzotw5k?=
 =?us-ascii?Q?HZ2YR6w8EfDmrivdwvK28ogiqPlWhIYTyyvak1vk9S7zPeOAkbjl0nAze+B3?=
 =?us-ascii?Q?pHRvrauH9vXLfYA37IK5/v1YG4ug+8aOFSXL5UqNWMSshXlf3ZRCB9d7ZRtZ?=
 =?us-ascii?Q?sdjs55d9Z2eyBpuur4CPcoxYPv2u11IJbeGAPeSt/3dK3r3Nlh1wfggWVo+c?=
 =?us-ascii?Q?WiDCJWkp6dXFqkgK3ZBobIvLCvCyVIOeH9cGz72ocrusXF91yFs5tDpIiA/T?=
 =?us-ascii?Q?7t2CVMdwqldvogCpPqOLldqtMrQ+WvvNe4UBqUBDCMutFJy4JM3f5nMWumpQ?=
 =?us-ascii?Q?YhJQPcKfdFK1UpaqUFeUJ/lM6uAKF9IFfny7XIH6RiCeN1NhyzOEE3ALkJ8V?=
 =?us-ascii?Q?5Q74/hdbEl5n/Mv7SIWSaJUBf6D9p2TeRZr1zzV8ktlqK8Aa2bM5sUQSek3X?=
 =?us-ascii?Q?MK+D/HtI0UwECmCBAjMbNkE6mk0dU6yQbOylkkdwBIhVicR/gWM8WzG4DiBa?=
 =?us-ascii?Q?Jcis54K3iwy4E9C7CFwLybu9j6dRUG0xFxx1GEMN2O/tQCPOtuAiK+eDuT4t?=
 =?us-ascii?Q?nriZRq5qUFzcKl6ne+i/tT1q6uG3GSXMAHgZSX8S8/mUg2S4/PAt9xzYK9ra?=
 =?us-ascii?Q?R9V5m8TRWBbeqqzOPTLOGt3R6kXP4H2wZBMHcrfwdT5RqjLiD8jsp/NsWh3T?=
 =?us-ascii?Q?Yhr/ZVyzL3RhTstkmCR2h31j7uTIuNVyIzES4xkRpgj10tG1gvHabIil95KC?=
 =?us-ascii?Q?bDAtjqPObBzFv5KtcNtrPn/7rixOI/mgfpl7T4NMp9nZdP2F8SggW0SJ5MAz?=
 =?us-ascii?Q?442mffgrwCTn5RUF7H+I7SH52voxLf/oKLU04wEErbQOS9YH9jWqABC8K+a5?=
 =?us-ascii?Q?jRf12Ydz5tOoHkr7NfoxdGZzKn9fgnvouP1h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fzeHF7HDmB5oU+6/iNbNy4se4jbi94TYt38gwsufgujUpvatzd+UTziIR8z0?=
 =?us-ascii?Q?SMX8elkD+Oxr/rdmNCkJGpop6K9DlEqR9M+ZBye3A9SegzXn/Y6nsy/zYDXd?=
 =?us-ascii?Q?XcS3NYVTJRTR7DAFTxgfWkeUZDstAa22l7kb7IZHcFz9NzkLpux/cHhBe/7G?=
 =?us-ascii?Q?A4qJllTnWOocn0AxKO8g+EdQRJ5xlW0umoPBsUMCcievdM4Daukl+tqFgZGA?=
 =?us-ascii?Q?2bNS8ouw33NPQruYknOxBqP6MSk7kH/iEv1yZrnMDdoqBKfSiiQwSJE8of9a?=
 =?us-ascii?Q?n7R3Llo1jeaz4G/k8Ku8xBN7faoDI2NEWtkj5jq+QiTIM0jlVPAdKn/JVUdC?=
 =?us-ascii?Q?oXOEmXgWu36dBGyA/8tfr6UBUoiqByDvyneW1I6X4vPiTbg9MQzMY0IhNOIV?=
 =?us-ascii?Q?0YB5o6odBiz/Os/K2NyAP9M8vMzkQMlvLMk7wVrY9MLwYvb0PpEwcGrQ/QLr?=
 =?us-ascii?Q?KBtj0R9DUjVq11R3aZ8ot8apsEPykfIoerOq8iKsVH4m9rN9WxAUfaf309ft?=
 =?us-ascii?Q?HO+zzM3EsIHEyQC5uU1BCt88xLVo8kmnMyRYE7SzgqsyOxFPw09iGv44BDdG?=
 =?us-ascii?Q?xtlJmIIVnnrZwC1rVf1fW3VzT/t+yCG9zcEDqF1AVj4S7TyV2TiYOO56+QTK?=
 =?us-ascii?Q?lmlmsA2el/SjZVcE39qLIQGV1+oBnDTgwpY35V936dBXzznNnuethOMa02lP?=
 =?us-ascii?Q?z2mq6ZHrjwmLJ3uSALASGri8RGeO94PvDLuRSJMkVyqZ2KcAc6X1BkfPO3c5?=
 =?us-ascii?Q?fCdBKOjLVTz0vdjEyRGS/fSR6D2uOWbaaXXbN3obOunPT3g1QPUbHSLqhtNS?=
 =?us-ascii?Q?9u1PrhS3js/ywdwMbPxFxefwAoJyanWijP8juBX3WK8765SWv191N5ptyxjx?=
 =?us-ascii?Q?NI4Ciyhs2reLkDiLdp3etq9ANaP7Y4f/rIpO8Dy78RaPkCqATJzKwSW7yDzd?=
 =?us-ascii?Q?knkWHM9xSfZ4iPuikZTaT/V9osjvi+pdGv7UUxv+zDo3J8dbvm6jN7eTjdc+?=
 =?us-ascii?Q?f6EfbrqJMbOZd+gOoL40fbQesAaGcExpsJpeeN/UUIqGJhv4xUkawtERX3hw?=
 =?us-ascii?Q?t54/WAjGckXdl2F5aT+hDZ6zOhKb0xwwTAGFy3jCyFBIzLJFUjmZ0lXij0nL?=
 =?us-ascii?Q?AYRDF90XsVcbTQSkbqwDqJJt0b73655HbosXlER7XpYvTD9uKYxg1KsOkPbw?=
 =?us-ascii?Q?RhtPMzxBe0NtgrcPqI/dxNIyv7uFYdAq2TCIOhXbI9k3WipUJ2A0R03fzzK2?=
 =?us-ascii?Q?6KeKjDmjChQ3pDDqpV6Srjqn+tTKm1a00In9slBoPg53kMbmSUV0NcfAuWC8?=
 =?us-ascii?Q?1IWxDFRncmwOIS7IIgbAVqewLjfMpMab11A6R6uKOkAejIm3JVhIS1y4CAS3?=
 =?us-ascii?Q?YSnw4ye1GLuJN7lbB/nXDIA/GEfj6LVrogyyPVnCN/075VnrmUi6g7nE07rD?=
 =?us-ascii?Q?ir5IRHGlK+/LYXGhcUIHT8XFcgovAsDZNa+Pa8QngCmzBsGci/BTW01LV48O?=
 =?us-ascii?Q?h+5CqwRD+C6jPCU99PFj9rfueOg4KpKWgHMXWmOOWJ64/pE06qcLSsIK0mwF?=
 =?us-ascii?Q?aUqCn6nAisC4MpnOqVPVgPFXwDnzmOOUQCebIiP14hlNSl2cYX6bHdLJ6VG4?=
 =?us-ascii?Q?x+0+eGTRAPKl79+2//48AYU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c019fa35-301d-4a7e-dcfc-08de0ad8e9c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:48.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6j2rwXnT7vnq//nAHreKTL6gTaPuDZMgnvwBzNWK/UnTlFV8NFA1wqC7K7sVLXti29lPeKJrBVNp4j+XvXUoc0iQueInPX828hiFRZsSX+5IKXdXZjaNEh/A6q9a0gf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/ak4458.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 57cf601d3df35..f0b465f9ded53 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -187,7 +187,7 @@ static const struct soc_enum ak4458_dif_enum =
 static int get_digfil(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = ak4458->digfil;
@@ -198,7 +198,7 @@ static int get_digfil(struct snd_kcontrol *kcontrol,
 static int set_digfil(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 	int num;
 
-- 
2.43.0

