Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7997309EF8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415852; cv=fail; b=tUIG/25Unc7YNLc0hKbukU8g0LDZqmWezPXm1viA672SZ7ynYdE4GdCW9hIESmtKxe5dXgBszoBRKgxJhd35GPEABlK1v5UmFQf82REIMC1kXtCVN23m13lFLMCLyyGqU5h9MjFwooxaXci7QwVAr7xWDi7LobFydnmZSGxrHzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415852; c=relaxed/simple;
	bh=PdiSanZadEMm9+00HOcOA/zc/oZFbYNyZcGOs6TIrHQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OAouVA3PIAo/BE7yR3eVqIodTuowzLco3yUieUJ03Jb5VbZ1Ytb1AhxSTpU5GPURH+HqwrSr39XEVFm1WxCFMofd7wvQ20BTfvOec0/CAHqg09nM/iDDEdQx6igBvjf+sdRFEF3uPyerLfNSHCnu5efrfPxGFxXvb0VII3kGxxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bMHRGUhD; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bMHRGUhD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTq+c/h40KJHZAqHAfouG1mjVoD2K1Kps6s/Rtfqqd+FxkjYDqTK1Wfn68KrbZyCOm+8SD/BI5+N0OBnH0HiyA5bbOtX0ZdCdo+C1oCTXhQHiJYZXPlvyQlzyUgddS5j8D3rwBKa/jEDJETrYmlEhku1di2j4t0aiiy5j+gIN7SyUK+e590hRAhE8Fpp4cI68fPSjy+BwjbVvomoBCNfo4Wk0ogMgsMfHW+qASYRuQQoJTnPt6QMzmtWwLH6CU/ye4I5Pj8TyGFq4Nk+nyKs0GyzAcTIy8pEECpHIvaI5DAgZj4cKJvp9b8rewp8TiJ3PctLk7jV0KjQXOoMzI7+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TzhU3tyTGiU24kAXQKWS9ZAQcZmq60wK8A7erkiVqk=;
 b=Zxn9a2XsDwbkVN7qn0qL/tPg4Dl6Khr2ECPGfCJMz+KZuGFxkALIcD56CgmVaQA+pYeUe+y79bOur4J9nzk6YjCKWn7isiPC1OXcV0I9jdmBu1Kv7aGWuZL8ODALfSQUKSr4aeXMhYPyegqCI64SvuAwOuJTo+0P4yoMGLx/0iIWYtrKFD28lJ+tJ/qDW5n+DQTrY8NTTXWX1dMya6yMqYnHHXewBTQk1io9rrGgqSTZayjeReyagKnMz/fpmNV7v/m8ISn5aQm72dyQgtEXRnibkOzOGXevYZatiWqBp2IhelQol4xGN+mhTn1Sq4qYOraKD3e0MxVGjooR9MozOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TzhU3tyTGiU24kAXQKWS9ZAQcZmq60wK8A7erkiVqk=;
 b=bMHRGUhDCxDxOJCnFQ685pCLFp3LlaLZCSrrW4Lt4xQZWP6R+kQN8iJwRNBct14I0YpSqah7gm+N+bY09k/rUG2D1gwK0wwfRUnVYhyy20zmC73+Uwup/canrhZPW2a9Xbovytsk/e8wikreIpCiQAM5VQN/dFkKyqD5xMJSuuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:08 +0000
Message-ID: <87wm4yp0uw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 074/139] ASoC: codecs: sgtl5000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:08 +0000
X-ClientProxiedBy: TYCP286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5d629d-9953-45db-ad08-08de0ad98490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gqdZQucFfDjXnprggIjwMj7gicCM2Ma/R5ROumGYdY5UIRkWR0q6g9+Cwnx9?=
 =?us-ascii?Q?9jFDErMauTbetEKWDCvM0Xr1O+6dpoAUeaimgZYRSUQkWu9xtAWdF9RK8McE?=
 =?us-ascii?Q?pji5LviaU2z4yJv7ekxEpdm/2yKbkkkrA1g7aSHHdSu9bJsQ+3go67CFXVCf?=
 =?us-ascii?Q?+5nu+7bqI+sKDAghQWjH/DIeX4uyaAiCGj2awT00Qt846sD+Zjy6YwUxHLxN?=
 =?us-ascii?Q?KYnrMlT1DeO3lk2MIGI6WkP6UvyKM3PH0C8qB3EIb/SOT9pfVITxbC61NR4y?=
 =?us-ascii?Q?CS9F7Ucow0iAx5M4ldz2glePg7VyIcCSt1LWSN1D0h3WoOtZKzeUWDrCDIm4?=
 =?us-ascii?Q?Vzizv6Ysl1GMcXq91Ws8+7UruMIy6vTs1sW/iT2CTTzRsIR2hqpaE5Tzg+PX?=
 =?us-ascii?Q?h78Gbp/+clZYt1sGsmLY/Osw9x3c786X6JkGCPDqT25UpUWYMrcmc2D+yVzt?=
 =?us-ascii?Q?Q9qS2gvIqaJ+wbd0sq5AhF1lSJ6Iw1IeYNJFghgAZqOLfhbU+CzMjYtqZPfS?=
 =?us-ascii?Q?NhJNnYxzpjtca7v4VZ95Pty1dSfRhA3RsPj7oG+t896vTjEbNDawsk31Kthe?=
 =?us-ascii?Q?lOZpWXc1JEDKknrWdNjMAZLk0tFnKQJkxunX6ri8MN6iytUF51UNmx7QBhdW?=
 =?us-ascii?Q?yIeHjuofQ6UmbNVm7i2UuN6rjX2U1ZPtBmdbRbpLTpQ/i75Uo5XlCDZWe002?=
 =?us-ascii?Q?tlnc89GkUJxkDroDcuDqqLHGtukdbqYMMnmtoU/t7kJjdgZiHKOUazz8Wi6a?=
 =?us-ascii?Q?VbScEo5iqRMCnXp2MmU87Kh3hcQJ07QokJrKtGIl7AfHzMyhkGQ6N+LUmro8?=
 =?us-ascii?Q?yo+hD9MqaB2JmZsHt3ZUxqD8lu0BfGO7zVxM8y9n5pq+AyZCrTQuFZ0ULTCs?=
 =?us-ascii?Q?d/EvW9+0kyfdyt0ovdoaPeQWBwTqlMXaSrWexq1KWQP54XoSGvVz2JHYVw+q?=
 =?us-ascii?Q?PPXpahuiX30zfNtLhmnMTRxyGJvA25SZS3ZGZhRmhGakHFVFkeHqfnkCwpcN?=
 =?us-ascii?Q?xhPUWSvY38zeO69tZbHtXyjssXLVBjEGNHsOONOI/f4ZY3fT/6g7fML/x4Dp?=
 =?us-ascii?Q?SRqTsMGmc5pDCspsxANw4Tt1wu3Sg397IvY6Tmd0XDqaQ/80SFg78hPXmhM2?=
 =?us-ascii?Q?hsFB5UDqn6of9Hgr4bfmBwYKVaR4RzU0AEhlfdAcNuSqXTnv3KkUaHvlTLR/?=
 =?us-ascii?Q?Gs41yj2RkBCuhk2s4fOlMibAMkP2E6CHhdsWQoTWvlWeaKzITNJyqgaLANtd?=
 =?us-ascii?Q?eqldwHUO78F26w6Bumux0Hx9ewWiyd7PIyu2V7G8KtXqU3Uu9vBh0E4/JwIt?=
 =?us-ascii?Q?WaWg8y9tAtfA/iXWSAdrk2Y4U/7Wx/HCb9qT6Ln9RJOo7JlHo6xCZju2Wnt3?=
 =?us-ascii?Q?6wHc6/oOvsRTRypd4MoDu7EITCHmtni32/Xm3p3IV53RS5KlzvdZW7Q+jvJb?=
 =?us-ascii?Q?e2HvwFZRfCJjuH3BYcLSn0DOQRXvoog8EwKqo98frYYD+Ozd+moGRHv4B7D5?=
 =?us-ascii?Q?nDkavH4+WcPKMccyWvTBe7Su8ytRPNdtbWfv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BkiQBB4MW62SMliVHqEcDMQWmtA/XRydr5WyfjEVHiKh0te09CKX2th2+uqe?=
 =?us-ascii?Q?A5UIdyFBu/+fKLJk38tTVBsAlEo6zOSfW4f1IFR8HQ7CChJZdig7qYFPMwX4?=
 =?us-ascii?Q?c9CloBsRoIdbcJukEutuqp3n2VOFf/GIBHc7elpjXr6AP+MJjxD3Rkqzzux6?=
 =?us-ascii?Q?/Szb3I1ah6lAUR1+0x7SvY9mnw8VwbII5NGl9gbx9FhKMwK4UNqC/EzPKZDo?=
 =?us-ascii?Q?a0EABFVbc9+sABz6GstZzMvVyjvKBDXJl08TAf3ihrPsxxm93SMnsnh4SEyq?=
 =?us-ascii?Q?eve+IXbQC5YQBD0AGc/1OMYhXtXilUitATZHFx7qKH3+zRIOMlrtncEFIAZU?=
 =?us-ascii?Q?U59v80gvttjf18ekqLXPcYL68qw8m/WhYud7zjclrisgn9RW3WZwTUbaweQN?=
 =?us-ascii?Q?IWyM7dzc2fWYcuX8/uMD0Yc/cyPmZ5CXkCu1pOMA/5KMXyg8Wehg0wsII/1a?=
 =?us-ascii?Q?S62aDQoiGMDc2BZx2RCNXkqX9HxYaMHD4NB2FPwQF2Yn8Wf1XrBHdDCd1wxI?=
 =?us-ascii?Q?jrh6E5J4D+DCpVmnY3ewviLVPwfuSd2ZhZb3irYnheRWhJZpeK+FkvA6ssWJ?=
 =?us-ascii?Q?JepBSXp2Lpg6DqNJmUrqhmH6NdmmjGoQ8zz5gP2UszGrJLwYpbaTqLpBzN00?=
 =?us-ascii?Q?US57OhwLpjq/hz+4LrveY3PMakuL7uLTjtxwdLc+ToM9SISzhPVLeZ202thc?=
 =?us-ascii?Q?PQMCrHKnDYs2Itplp0YRcmV00C0bfRL66t+DI67M1ESV6491Te2ZIYku+01X?=
 =?us-ascii?Q?PXEoDhvs/3O1lU0W7WfbJzDdNge+D2lmM27Fe2TZgcIaUgDluvvlO3+H2y5a?=
 =?us-ascii?Q?kpgakkZns3vg6p5+0d72oIm7WcLdeAj7O3PxzvkfmKqS/CoOOEeLVkjV9RBf?=
 =?us-ascii?Q?Qxbs/lEUZnyc1HUoTMvBXUJZH5RskeEg5aPo3WrHxNlAr5iVVAHo89H3X9hE?=
 =?us-ascii?Q?n9ViqXj+XhfMwV7FDco2zII8/gf+pRxqr9Wslf4hvhjpiSqvaiiFu0PEQPy0?=
 =?us-ascii?Q?/fC/SgETvLrnEIrWpwHCbYLCW8tdLqMMFJa/oWlwGCqB5eYokacfA+WqfC2x?=
 =?us-ascii?Q?NFsTedVgXYcso73FDFC4pUfuXJ5HUcwjvFAGVey36dEceePNYE+nTUxhsdDt?=
 =?us-ascii?Q?rVOftuJ8pgu5wBLXqnY4V+sKpDOkW9LsoCYaUQ6/cVgQCevcJpr8pqfHZOhb?=
 =?us-ascii?Q?QmRTIGb7s8zQdVGjpyajKjdFYhq3/GPVW4egVYBByIkzrIYpLn5pLbucfirP?=
 =?us-ascii?Q?6Zg45F1gZMU11tkojE2hRkWLY+ks5mCHvwTZOHDjA839ulwigh3ltPtYNj/W?=
 =?us-ascii?Q?wmUwCOn6kzFhZnwybPkUIaG9/oImSmFOa7H3veW+X6+e846L+877Cp1mFmsp?=
 =?us-ascii?Q?sQZcyv0WQQYhjsQrW48vIJe9vMom7lls+VRLBJqU10e4gobtx/ugPoX+eUt+?=
 =?us-ascii?Q?GPZjzOXbgA2ZYA3k7UUgX8RfCa3bdNkP8P6pvr6Pz+KYf+acFZ/YHAHMfg8l?=
 =?us-ascii?Q?Apa8FDfd6LWyLbulOuhAD34UphR5QwTetLMdvfof/GcN6lewNWQG9XJcd6d5?=
 =?us-ascii?Q?iDK1B3W3hn/nATw+h5/Ne9DKUkjJ/t+S+lCNbSr0GexzY1pexq2iYuydQQqA?=
 =?us-ascii?Q?vltEDES/Hjejbc4wOThqD0g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5d629d-9953-45db-ad08-08de0ad98490
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:08.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnTWgwpidrTF4h6rulc8lYSfD/qg8LjnS60ekrD5OT6HFztWR9Vwjem6rhziQ17WNFx00RLooVlvTu730iPOC8Sbs0AB3/oq72IOL4JoclZFiQKLnSSL8IEBo4/Pd3xO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/sgtl5000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 2cc8efe3d8962..320312f8db92f 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -540,7 +540,7 @@ static int dac_info_volsw(struct snd_kcontrol *kcontrol,
 static int dac_get_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int reg;
 	int l;
 	int r;
@@ -593,7 +593,7 @@ static int dac_get_volsw(struct snd_kcontrol *kcontrol,
 static int dac_put_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int reg;
 	int l;
 	int r;
@@ -631,7 +631,7 @@ static int dac_put_volsw(struct snd_kcontrol *kcontrol,
 static int avc_get_threshold(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int db, i;
 	u16 reg = snd_soc_component_read(component, SGTL5000_DAP_AVC_THRESHOLD);
 
@@ -664,7 +664,7 @@ static int avc_get_threshold(struct snd_kcontrol *kcontrol,
 static int avc_put_threshold(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int db;
 	u16 reg;
 
-- 
2.43.0

