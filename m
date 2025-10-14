Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942E309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415760; cv=fail; b=K/QSTaA4AWfMm3hIy0x10MHkQIsMBuKzSlktmA6Ds20dxgIVCV++KDgpPQ9aZ7bpufpzbsWtKYK5uHPkiKw7xCaoInFWGzMJdxfyxv8T8rf7k+aH0Wt6graIrha+j5qTGSrctSqd5HLfQHUb0ecuGTMxBtLFbIk6ct9vSjn4AaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415760; c=relaxed/simple;
	bh=DfHRKyXaI27tQWXdu6iS8RC19YoakoB4a9jWuqxHXUk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rfr1hzkqhaiIFlTIGD98PlJM87NqVoz9EDyhFDYRATZFgT6THY9Hda9brb4IcKvo8/god1us6wrh6l018nroACJ22u3QRGmZsbSer8H3uOdRIEE06QF9vNWVaLuOc6NXHjEvNy6qPA0cUBPVqg1hIn0CL2BnJlP1SxDIZjnFP1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wj9mdiJ7; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wj9mdiJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAI3VorKBVpUlgNg6OT7zSFIZTo+7cyQA+ZAenkx77bY9QketqAnClbV4lqdsR+7uaYyJ5Cn11HWqZlrvRStJU9idDwtkCsdjex1FLbbiix6vsGTerPSPhg7GU13wiztslDDVHMN7US2L45RwrnYoFBv7mmu0wKlZVx89DDxkYNNhhecU5UG73lbbwNSBL/IMsq1v1AhrnsxoJ0WCuLBl1Fb7/2vdifWt39wj5GboVGVUci5VB5dsHtGsbkKr9aYKrkckVF5WPdDPzGUMar8ZhcmSzwab/d8n3B9gdRYQEFlAEn9cXNpRT2jTZFkYhE5FzSB55Ej0iDE3c5e40vUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziTSLh8uWvV/Sx7qWvOgetK2zEILIbYw4tHSFBybNNo=;
 b=PBEQM+CEkdMrr92skCtIEi9DPc53nHq9++Q6kacKK+as+H8qv9hFen4PbPwSSPclTlZnsHxOoy0H5iCfKO1aQxa3fitCZVZdoUXpDbDpcmd5jKqVRUnr+FcIgiz831H/c3pXj8+pPYqziM3FJY0XDoGTMRaEVs401KIREh+DZQhipD1SDZd7DbcrnQPha6fTw3sVqzBuj7LNWKCFykYp267oI4jxxJT4qy2EJl0vzhvVGgT8IktxIAPM17cEVT1WqKH1Q1I0ugiASrjwzIgdwGLClna4PqxBsD+C78XYsnvz5uoVaq4CqvcJnffaE5ES28Kq9f3oX5Qs1pnenKy/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziTSLh8uWvV/Sx7qWvOgetK2zEILIbYw4tHSFBybNNo=;
 b=Wj9mdiJ7QEESz8VjjascNwhaBkx4q5OHpXlesThN7WgsHzpYnu7gVG5OxFGPpn8HRBy452QSZwCh/Jw05PGKNBOY4NAxE12TSE/WXhSQbX7f0P8AIvd97APKbo1/r0rVpz5U5AZm0w4TucuWU/ABSv9J0HOdn+MJWCSRetR2ZPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:36 +0000
Message-ID: <87v7kiqfhv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 050/139] ASoC: codecs: max98390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:36 +0000
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2e9bb9-9a10-4fe9-0b04-08de0ad94de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KBDTvT0rSJbXRzDtCU4/3ERy7MgF5iVKNxyAnBeTOBz+3zALqaxF7HvfHEaK?=
 =?us-ascii?Q?qmQ62Q1v4xnXv5LtRZN2ZFHcqZDUnC/1zHwfflyXFx/d9rnIMrx3GRRkTYac?=
 =?us-ascii?Q?peGGrIYVRcESVNAoZg1hPuF1ZJZD7yx0AtR4wjJMfSI+4Cbmgvi/16grjS6R?=
 =?us-ascii?Q?TqGEXrju9Xbcj2SMgr4e+MyEx4x/XKTLGdaDZTDqatd1FZTVGLskrYQUuMJB?=
 =?us-ascii?Q?UIzrSU5xJ1fgFKN5cTswslGSP7OJhAfxDaUp3P14ZMoLAzlnJ201KaqFk5Iz?=
 =?us-ascii?Q?ksE3nFE9CDwp3Gq46PAGv+ej/ogLZLUGeXUIKzdN2bUVs94Rk1chcqXk0ZKg?=
 =?us-ascii?Q?JwPHWkNgsruHAv+ILWe8gzSPU5IsD7lS9MWugMFUfEGpRX7hyes52w+b+LIE?=
 =?us-ascii?Q?AKXyWdJPHh9NRpOK/FyOSJjJLHH20LsteFV5ulbkW2wTXIzvwM92NxgRjoPz?=
 =?us-ascii?Q?MQktjWr+aFAq9YuMXGy0JzXoJSomcRabdFU44/mNbs05kqAUPu4b8q5Omiql?=
 =?us-ascii?Q?k2pQQh6eL7R/Ks7Qdr6beggtPd8SWbIxXGCVfw0wR3TseFXm/qoI5Fj6fvHT?=
 =?us-ascii?Q?vqrglPcCa8UAoaJrzSlumfMHSZz5OWrXmdqr3jKyEKU7eJK946oqSc74JTCt?=
 =?us-ascii?Q?xRJ9RdGTcWaXjV7CV1Dw9u2CPRjcFegDCW91XN8vitGzfFdyFqkE9hGo8WlI?=
 =?us-ascii?Q?W+KRkJ5lg+9oftZsWO7/ffuZ8HBvsVpVwXRLW+CJczTJy3vJbgNPqPQcKWQs?=
 =?us-ascii?Q?FgxBMasqlJiftcnYSoRAY5dJF5SwHdyvVMZpaBcC2n2t1l/fYauhlAdbJovQ?=
 =?us-ascii?Q?hJYRVr+20O+ZQWH27e0J4CAQeyWRdckBYmSiED9qZxMUDVVQkKJ33Cl4IvdM?=
 =?us-ascii?Q?1tkXq7cXkOzX31DUYB6fv+M4npxzptqsWC3XP8FWhP+mDkMqw7FzOx2J8dE9?=
 =?us-ascii?Q?hwF3fnUm8K7gHOnQozTR9CxM17v2lJ0R/g9/RfTSlfbbQWO9qjoulFllyzMU?=
 =?us-ascii?Q?2y+lAaxmFsATQLEzw9I8LRB7f07OXDiRBi6CKutJSlOIWgEK9EIadpidzP9G?=
 =?us-ascii?Q?3ZRi88iW91LvUTvn7YeFmNO3KLJL45n+rC6CFjJ1wOySMje4jOXofqCm/jao?=
 =?us-ascii?Q?8hVDGXhR5MoSrONqiHgjD1w2aLqHf76dIA7R84xopXZudQ39pJR7zNevZ30z?=
 =?us-ascii?Q?EoUIrnUp/xk9F3u/9L8X7Mv291ImyCG5XTkEvTEv+t7iL55zay3rvEqjvWh1?=
 =?us-ascii?Q?2hyedh4b2iuj3E6PIQwkHkaXkuTfX4KhuDNjB0XoqQHhoIKcEB0+kE2RuISu?=
 =?us-ascii?Q?pzw8VOi5QeU4f2g+8L3N9BuHkhggTYaFCe2nU908LosjrjKw6YYJfzT8+00u?=
 =?us-ascii?Q?y7QjVuGr2uthVeKq0KwEWXLcZBbeUMzpMus2l3K6feTaUBLDCvVQiOPw7dFH?=
 =?us-ascii?Q?sFpttMF8ogbvWiEsi78H44eg38AcK1gr58LxhJ73+ROBaior9ErDhoGtLWdi?=
 =?us-ascii?Q?Gl0c5Sg+Y7XYgGVpIPcbOTYHiesejhpdNP2Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r8uy7rTOHfB00GpCh+gb1eLyWlE525BNMhU/x7da5VpGuC5El8g4gdrTs0tS?=
 =?us-ascii?Q?g1YXX3y0MgwBVbxU1JQ5lSP8+1eOKCLm1x+2lq0oHuvcPhG0FLgfR2w6EwiW?=
 =?us-ascii?Q?Jf1WMoZeL5SOOPkJH3oQqcJ3beD6rjqXTzL29dOny5MxxxebAVQwbN6pakhN?=
 =?us-ascii?Q?OQT1dA+L4AuUEhq868SO1XTQlG5euxXPbW8yV/f57w0BvxUsioCZvATOdMAJ?=
 =?us-ascii?Q?UOp7T+JSya/9E3ZwSm0+sRIEsQEcOi34qM/mFxORQtrM1/Rh5yRYGpKp/QSH?=
 =?us-ascii?Q?ne3plRnPATuPyGIaI3nXcS5mCPoPXoa1TaKq9l9EF3N4dQQ5XDzsWxU6tnez?=
 =?us-ascii?Q?1Jof5d2HkW4SW2TzVG9JAQ/cHC1GbhXdfUT8LWitVwsfYgrZgRw2nGZo0eGn?=
 =?us-ascii?Q?dBNQsV2IbhbfmHTR4shytCwaXsWRDMx4wciCHBB0EiOCtgHh5Fo9bRqzoVSh?=
 =?us-ascii?Q?OLMduSrlTU6MsQsIJR+2nr7ob57GVmsgAfKnAQwvlo/py6NzMJkQZ5RScJ9A?=
 =?us-ascii?Q?lnATAlBv7Qstn8sFVUpDJookljYrsKgwEBcjBNod3S/bws7IjrOhj5778CoE?=
 =?us-ascii?Q?Ua01AdT7fcbPvzzKAuTOE3gNBWSdOlLUKd4ESdbBf9tCEz+GAlmnGE70lcue?=
 =?us-ascii?Q?+UcB6RHDjG7mujb9VRPudVQFqFBOwq/fRopSnr4BStrNawDeine5wziiWXop?=
 =?us-ascii?Q?7MEBaYflMzTd+/6zXD+lbD2mCC6rZqrJ8zeJ1KO67BMHC7TycEKbNyVb0cuc?=
 =?us-ascii?Q?cBO1P2qra4kOil/6YGjZFhQqQTDqOwzGXqOTDP1Oj3dgfEejLg2zYVe8BrTA?=
 =?us-ascii?Q?ttgPIlQQtYo7HZlv88RNwXX2w7ljG/01o9FUmRbZsQNNm1bsimY8Q9sCIUI7?=
 =?us-ascii?Q?3wv4O6WYCa/E5BZHP6neLq7nkaDpa054lOv/vJyz8OdB+xANjaLxrrmybX6S?=
 =?us-ascii?Q?tYtXbIUoqJ+c6vDjmiGuITAcSGkk8qhKhEmcpx9SQY/ztqJm6Y9MuahWBgGm?=
 =?us-ascii?Q?nMXCtLp8sqZw2DZMUBJzGMMxdv6ji23sRh0Nl0FqG124cDrbbtIfpl7P4XVk?=
 =?us-ascii?Q?JZKr3fHmQMKRwsqcgg/v1HR+svLaNMvxTFuiWIlFUdSD+gCc9CrlPggryCuk?=
 =?us-ascii?Q?OGSu1jZ6LiIrH37f5fUuhWqMh64SSbDgiv7d8Q2MnWP2xaNbZwZ8aonWsrzc?=
 =?us-ascii?Q?tuqnEcckMCW31opJWAS9znV3RHyJZVt5ASg15I7LWzDfzsxCB8MHvEf621NH?=
 =?us-ascii?Q?jUjvgGpwOJk6/JpAEpUB3omgtQapJp9ZoXsT1L7XUrKtIANIArQ/4Z7YEE9D?=
 =?us-ascii?Q?rZtyvl9loEoWcoVIprklVR7I53G9OsTM4ywzFt2+XMexn/tErGD3jLB+yEOf?=
 =?us-ascii?Q?BidxrdqYdLCrvxOtHFgzNph63CwbSdNmpORFiEDkL4NaPI1WYX939fm3zlve?=
 =?us-ascii?Q?K0NgQlH5slv8LhksuXuhi8Z/6MftnEv7edqHqvBRk0fVnoyH4fLDpOFedU4v?=
 =?us-ascii?Q?QpdROlAgiGhk9KEZa9oJtNGqG/R3hfkykSSAjvGwfKLulGLvUfiR6kuVPSfv?=
 =?us-ascii?Q?4K5qzJ9ZFkF/fi7V8pYnoMR8VoMwbGgtrr/8ilrkMHpL7S9yP74Sq804JzGr?=
 =?us-ascii?Q?ERHVCoOkw53GRl6t0wJRzM8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2e9bb9-9a10-4fe9-0b04-08de0ad94de2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:36.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DNB4yoHbCOhjJJK0FgOs8jCga9CfpQvzy0Kln7Gzjz09T6aIfz1Wu1dMpdtLNKLoEjfcwfrOtW2/MKLSpDjAwnssfF3nP3R0SzGRtxbyJASS9rBofkB5gZaZw4Sqiea
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
 sound/soc/codecs/max98390.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index a8a282ff9fc5a..fabc8e212370b 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -534,8 +534,7 @@ static SOC_ENUM_SINGLE_DECL(max98390_current_limit,
 static int max98390_ref_rdc_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
@@ -554,8 +553,7 @@ static int max98390_ref_rdc_put(struct snd_kcontrol *kcontrol,
 static int max98390_ref_rdc_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
@@ -567,8 +565,7 @@ static int max98390_ref_rdc_get(struct snd_kcontrol *kcontrol,
 static int max98390_ambient_temp_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
@@ -585,8 +582,7 @@ static int max98390_ambient_temp_put(struct snd_kcontrol *kcontrol,
 static int max98390_ambient_temp_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
@@ -598,8 +594,7 @@ static int max98390_ambient_temp_get(struct snd_kcontrol *kcontrol,
 static int max98390_adaptive_rdc_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 
 	dev_warn(component->dev, "Put adaptive rdc not supported\n");
 
@@ -610,8 +605,7 @@ static int max98390_adaptive_rdc_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	int rdc, rdc0;
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
@@ -632,7 +626,7 @@ static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
 static int max98390_dsm_calib_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	unsigned int rdc, rdc_cal_result, rdc_integer, rdc_factor, temp, val;
-- 
2.43.0

