Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D7307AC7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415615; cv=fail; b=QLTUSKwLzaa8epT0OxcadtuTsm1ZpgD9xTJp1F+TFS3nMyJ+QTxiJfxjmsTIn5FxTBofzqRvBGAEZOVMxXql2YM8ecw19UeW/vY11P7Nrvg3/w/OkQalbqNGTMeBVVA9E00wzO4ZhRFeCgfPsPnn9J8fGCkvdslGzQ5ek/RNpBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415615; c=relaxed/simple;
	bh=U8tndUVCQGMqtRD/+MyKfAObJhM/3t3ILUje32+1PMo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N9etPVHcjfUCGlvC1aqqF2rFSB3Uahn83uYWDGwXw2E8iXHDiW86IGNwH3z/X0jg9jakPCoBRhKtEmAiMRoRpWGcPzGkreTcANCDqKjHVlt0P/zyDyVVwE7ZRvLXVgRggSHEzEq035l5Hx0rs5LwKNDgKdovGjG5vG0yBMnDeas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fy2/OUZm; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fy2/OUZm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBCKiuVhzgo1KWARygmWS6vPDuPLYv+jCt0k4D5tavUoQG6p8oLjG7In0j4Cz17f3A/0Ur0jWWg48du59r02MobxtDBwQ/fvDoCgKQ43MOsSypYIGHCkzn/iumcmbyotaSCyK9+eZBY1WP/Qi/7rzhQQCgTtLVAjQiy44Ow5X/mPOhmtpTeuqNuaGA1L2N8kPAg1z78MXmBabzudB8yqTWle0f4+bqPgrx3xljq5J76Oe9a9XZcq5BDr56vugOpOJaGBB2ly1sLZR3Lh8yw53YzfretLt9Xbk395Cq1C4ETB7mFT21wtEBZkBjvp7SNzgzoyV77PQBDvCukIelduzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1JvUDi3ix/eW+0qYcLGQSfro4Ldu++Ki+4J2iaVx4g=;
 b=yCmN5n+j9uwr5F34EiWz/2B40k9feBxYhtF7glzlyJWL9SJR3byXDK6lhpF87ZESh08sDnItSDLWoZ4IwHpzkWHsp7B+mtr2SaasFj7RB1bI1fPL7nv74VVeFFKfj8uXsSdpTudWhUaSkeGuewMeEFLdtPYT2tfOJIU3BzbqtKtW64Olfp0MIIUBd8ZH8niaVVhOCkiPa/0Z3BXxKEoQNyk421BD2UWBSBGQC7uGcTERZ8kVb2vDz0t+YZWWn2WzKpnYzi5uxpFPfzMzdm19svvQb+nvOnPJTbzko5Qdg5wgXuhdRa2gHttQVMUDjVqrZixzGqLLCz+2OOCCtCeWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1JvUDi3ix/eW+0qYcLGQSfro4Ldu++Ki+4J2iaVx4g=;
 b=fy2/OUZmtjo4d75Wt3gLIdwqYIPSoede3bPQFIabko5Cea/dz4BgI7tW4DHmu1DCVIobNWsjh5LNQ9L7lf1w3WeP1W6uzJkFGdP72s20jjwwHUZwlr64FohhULr2pX/nRodnzbL+4sNLTibFjECgCZ6ThBnwCh08M2RQEDRILO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:11 +0000
Message-ID: <87ecr6t8qt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 012/139] ASoC: codecs: aw88166: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:11 +0000
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2b5adf-7121-4082-1300-08de0ad8f75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dqLHwiCx3RHFXsQX22PAavWRsL1/BgSunsIsG9QvcvfHQ1jpdJcsDmTvGHvl?=
 =?us-ascii?Q?XdmXfwh7Mxizwvz4buHcITkxQWCD8wc62Dvq25b8X+pyOCo7GmTSOy/Hbdso?=
 =?us-ascii?Q?Y0wvksY7C2iqT+/k4zlNtnXGh0M/rIvJo2zEUjPxOSUfUh278pfysizXisoM?=
 =?us-ascii?Q?XhdUp3T+YlHFgZMUm/E+P527RjC87Y5GcZaXkx5WhOa4NKsVOmrWQ/LSzxsH?=
 =?us-ascii?Q?XWmYO19aFgnMBh11Gup2u+tX4kBuL3LawAerdAXnK82vKSfUVljqi7xsFeq4?=
 =?us-ascii?Q?phfe5fjTv98xHXgH7QJjQ3ivHKoWp1W/fGsM9rhbY9qPhdZL2cNkgayZqMOs?=
 =?us-ascii?Q?AzBgUylucsHo1D3EEEWAtbxOxtt39lBwqAZluTtdjhcoeNE9NjKLQZ+/MaNE?=
 =?us-ascii?Q?mo71if6VLIlcQb7bi0lOo/3AISEmP+AlP/mhQhFJk6XRMVGHSbw+kxz7RdqQ?=
 =?us-ascii?Q?ojW3TUD6Z7s+dCb+JmgPh6P3J254GluduoZsdvr4iWkKhscLFwLc7gg4N+7T?=
 =?us-ascii?Q?wJyXH48Z/OTFh+rV/PqyQ5LoVdtYJLSFjZMlNKzO72d6yDeXWSx61OycmbTt?=
 =?us-ascii?Q?aITIooFM4pXmNJ1SxLrsBOc9mb4v8KuGe1tLekYBoSHm4HJbhg0ruOl9wm5e?=
 =?us-ascii?Q?MtWsSedtGJU2TGdo1UnXYOg8Sk6d9bIE1H6R2DyIqPrvSy2++omJgVfofVlL?=
 =?us-ascii?Q?NhiztimkLtnfhTm009Y62novYnleY+gqrPF9uqPQ77f5HrWtPMuVdcEJMRif?=
 =?us-ascii?Q?9B4piad9EYfReoN91Biaw9cpMCCEyxwg5dMS/anRzfNIP7+EjZ+5uh/LimrS?=
 =?us-ascii?Q?2IHH4KqN1byVz8/QNTJZeJuTRUXunV59jk93WmTT0my3O3tuxkYeYHZjgnBX?=
 =?us-ascii?Q?XlHqWfsjMcztAE3cntHCw7Shx5ai59n7CCZUC8nBj4SliIPn/ksuFvh9vg/R?=
 =?us-ascii?Q?XstGlhORlwrp8hzxoOsVkwwcTf1RxTBM+Cqy3YXbZe/DWnccozateEm0oXxb?=
 =?us-ascii?Q?/CthVSlHItPnfasaC0oyS/lZlII6FKSVbe4sW5e2SE1EucNYy5OHVQtHdUHN?=
 =?us-ascii?Q?PkWkPRK6zIEFx5EZmlJ4p2yOJ79ex6+qNilO7mZpfuO2i9e6pMzw9wUeOE+E?=
 =?us-ascii?Q?+SY6JJjNI/sGga2xRMR39Ouu3WSnttTqC0QH57N/m1FWBtJMM+XQ+nmaQdp+?=
 =?us-ascii?Q?+gdzpkbazVzaD+8S0qzLCZBeDvboKp8vUeoCLys6XNOyiajGse+ol4elG7kR?=
 =?us-ascii?Q?9BeHVmg783FuJK5TkntavYzR06lYf4+AmFJaZg6qsOOBsYGaMHb9Mw97FwYM?=
 =?us-ascii?Q?XuV+2T+FAhTEwnbudjJwNCS6/+9B/1Xst4oebef6hkUbIkBzv2p12pm41gNc?=
 =?us-ascii?Q?8wjAFZOLqYB4ibSiyUya+/6SffzKI7qXIO3iZjnAPSSzD8R2VQrNZHEjW5fT?=
 =?us-ascii?Q?qhaoir3N1rCWlfZ6glNAgm9gp+WtI/Bko9FWjkb7au2VCZMXpq7yzWUQfrfk?=
 =?us-ascii?Q?o7yHg8QUAc4RUoY9zx6yr3aM57TcpuoODZZZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F5vOuB+tpDY8upJa2ZFC4ZI9uA5a4lpnbsuysDN48ReHxGGN9XQgzktlSXg5?=
 =?us-ascii?Q?O5Al68Qj3MA2pAWwn1AfgZelds/MZVjDjKK+M9J4+MNYwGvOJCx728+fKBvt?=
 =?us-ascii?Q?3fPD1Tlt9Yf2jVjgUKfMZBArcBQq1WUQpd9a8pfj6QfQk3uqlVyiUTTGjBwf?=
 =?us-ascii?Q?KoZcGCb8swKdAnXTr/9AF4h1DY9F+1XWEpKMaA1mj0wwvHkq3EuBtlnOeeYC?=
 =?us-ascii?Q?2qLnGRZbs0cN7bB7Oi4Nbi7v1xnTwMFHdB3RA6dzTPTURAbeU8VS0jppDac1?=
 =?us-ascii?Q?0LaK2FDivlzrkzGQbBHXX7FuyQv4mz5DEftfVguBXkAZduM+Smw8MptwHZg0?=
 =?us-ascii?Q?Z8iUwVKdjwEvgt1P5jxQGdC0eVHi1l02N/7u+ujpdyzIsqNcy6NUFTa+Hru9?=
 =?us-ascii?Q?77EY4K0oujyktRMENw3g/ZgXrgiP+wZ/iC+EK6a2M8iOvHHXVmJTMNaFOLCs?=
 =?us-ascii?Q?AF6xrrJeZIS+bY1t1DtpsMRBCpr7MrbJ2tfniDrYaNW0mZt1o0NEqWIHZ0P/?=
 =?us-ascii?Q?4IEzDT7lBD4yDOZPxeWIVq7jmzbkAItPCeFrf2FwaDSA/ik+re5ZNCNlVk/t?=
 =?us-ascii?Q?fkMk2Qg9o3IGXSglxZYexaoLm+z9YU4ZO5+WSLS79gWWeQb+txWlgm62xhqQ?=
 =?us-ascii?Q?oM02GgRUuZjACSuGNi+0GgrZf87b93y0N0TAnAvtThAUdIwHZYeGg77a0c9p?=
 =?us-ascii?Q?zAeV6NRUE/eq0cp/7EbZUaznJ1o0NtekNwgD/mvGiVyjo8pKgs/X2CgOAUhZ?=
 =?us-ascii?Q?35tPtLLjPEUbEPBVXaXPITWNas/ZYaQeRdJp1pxdc+ppZ4JMEum1xAU+Vkjn?=
 =?us-ascii?Q?RHwZ3pXt7m/UpUppD5dDbpItjr8qlDh/bD238SQDD5kO41GL8j+mseg+Pq+j?=
 =?us-ascii?Q?O65hYAwazCpgcc4FVlYnKW6bGBWv2pW3/KlCFnzC38oPwYQpzuTE0ODcu3O+?=
 =?us-ascii?Q?NXInLlzYD7ML/STFf2nozUTVrUM9QKkCFHkSN6xrQ0B92DQ4i2bmjNaN7EGC?=
 =?us-ascii?Q?35xF/wC6WNwWDSb9TBrU3t0PncV0hd41V9fAfzQ0NwRO1+Rz5U4aymbewF7/?=
 =?us-ascii?Q?+uVEbBpmG16/9Lv/7WGIbNxO0iYLrVs4QKXkKbM74GTarVmUrvd7oa2wingN?=
 =?us-ascii?Q?6ezcXUppz+NsxLyxbDfMmMOK7r9LejZBd0IQCKTz/W9kjeahDlGvWS7zox6I?=
 =?us-ascii?Q?okV4TKD+6d3dtXVzz0l5+cOF+17If9dvYVQxKQgrg4ZJNP9l+yPRTTzFZlke?=
 =?us-ascii?Q?LWlLEU95365VknrhJ7HggEgpgMttQ7Tq4rY5i1MVtWPCv/3pZvH+AwDfsWUm?=
 =?us-ascii?Q?MvbAlELQTIR3k4tXm2UF1zG8DvnoSQXN2PPf4BFUtWO5HQhERpXxxjmudirK?=
 =?us-ascii?Q?4gPeJysA9keow/xhpLRwUcqLY5Hj7VHdGRScIsOeWq8SOtdZ1sN62GA4pXhN?=
 =?us-ascii?Q?ah6LIokZBJETtM1F5B5XO81Sa9YVKlaKG3Jx5Mz7tSd/O6jWNBxjPAGONjYe?=
 =?us-ascii?Q?GbmsNNQd3+jRJ8+lyr7xj5c7OJnGamsbNGMsZ+jbGWpru0Io2EqV3zmif4VU?=
 =?us-ascii?Q?RJYW0hBO0LFcTZxQPoDG5X/MdRZNb1pwO1KA+MRg8iO69N8AAH9PvmKl3G67?=
 =?us-ascii?Q?6TczIbLWUQFlGdYNAY3JWeI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2b5adf-7121-4082-1300-08de0ad8f75a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:11.3683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFGc05/4yhSf30zZNjNvwY+nAMjvRR3IBXndrW+p+WljDFluBrEh0d+TfSt+pFm53HW1/SyRfIOug61fvAlz/oYkoNHNgoHvlXZ2Tqi/h6uZNT5axhSQv1ugKH/c1cqS
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
 sound/soc/codecs/aw88166.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 28f62b991ef2b..d55d8d9424322 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1391,7 +1391,7 @@ static struct snd_soc_dai_driver aw88166_dai[] = {
 static int aw88166_get_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88166->aw_pa;
 
@@ -1403,7 +1403,7 @@ static int aw88166_get_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88166_set_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -1426,7 +1426,7 @@ static int aw88166_set_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88166_get_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88166->aw_pa;
 
@@ -1438,7 +1438,7 @@ static int aw88166_get_fade_out_time(struct snd_kcontrol *kcontrol,
 static int aw88166_set_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -1476,7 +1476,7 @@ static int aw88166_dev_set_profile_index(struct aw_device *aw_dev, int index)
 static int aw88166_profile_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	char *prof_name;
 	int count, ret;
@@ -1511,7 +1511,7 @@ static int aw88166_profile_info(struct snd_kcontrol *kcontrol,
 static int aw88166_profile_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88166->aw_pa->prof_index;
@@ -1522,7 +1522,7 @@ static int aw88166_profile_get(struct snd_kcontrol *kcontrol,
 static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
@@ -1547,7 +1547,7 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 static int aw88166_volume_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88166->aw_pa->volume_desc;
 
@@ -1559,7 +1559,7 @@ static int aw88166_volume_get(struct snd_kcontrol *kcontrol,
 static int aw88166_volume_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88166->aw_pa->volume_desc;
 	struct soc_mixer_control *mc =
@@ -1583,7 +1583,7 @@ static int aw88166_volume_set(struct snd_kcontrol *kcontrol,
 static int aw88166_get_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88166->aw_pa->fade_step;
@@ -1594,7 +1594,7 @@ static int aw88166_get_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88166_set_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -1615,7 +1615,7 @@ static int aw88166_set_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88166_re_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88166->aw_pa;
 
@@ -1627,7 +1627,7 @@ static int aw88166_re_get(struct snd_kcontrol *kcontrol,
 static int aw88166_re_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

