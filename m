Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BD390C8A
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779922972; cv=fail; b=U76aVm4biqlcZQn8kCoiO+si21pg6oanLE9ltzseD/Hfz7OhxHm8pTKosihh9CG4NHfYHZJtVtI11ciZsXfH6PcCj2oB59prr0rKicLZYeXYSNaWXaQIkkGJErQHAtmpCvadMWr1lpkVDm2By7Ke2aWcOMC3LhNSQ9eoD9xGdj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779922972; c=relaxed/simple;
	bh=j3DaHwFhDcHi7EEs382/VYN3dZmzOAyymJbqFB9F0bg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MdBU+rE1TLFa2cvC/CClFRMyX3T5B6uMZgfmcx1gO2yqWc4s0JVjmG8Bb1lrecSppQric4DeDn8ERBnYGbbh1fk9mN5PgmBQL7NaWTqxIgfY8a0MgSIg7R+vD4AZA/B7s6S6smGZvvtv3Mw7qwACE7myLlzai4N5d9dQf9bVOHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tbfr/MrQ; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tbfr/MrQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0y7Khni+hmYCWDHQLv8M+Uf7+JoziS3zneLr6RhMVStMUGsxSAMAkRbqmT7jaswHapDmPB9N/goMjoJpQXoU2OatZMJMeAEYGgx689CYQnDrfyNxIIm3c/1z7BclfdcVx0IiPH3XjFygs57Rmb4HBvULMVGV4sJqvA6LmVeBHnIzfS+KanXUCNr3uDyhYEZFswaQLUjOffzXZEMkKZHEGH3UtigTdWPW3Vew4MDVqBmJMBEaShBtGkrBuoIys7tv6Xg2WGiFl+/o5/G01cNkT18T4twmU25TJYGM23P4K2XE2IkD17CfLewMkhjBJ2S4qMWos0TSdeWQ2W7O58JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIDtWlH1e9af0YEO1Z2bofo52E/iX5VUFkrujErPiUU=;
 b=m2qN7UUmebbUCBGhVmxGJLkkpiuI+pFemSv4yxtWfVjwrOZ3kUrSNLNDldeVlM/85LNeACPr851tU9HFNFKOPQ889gwwkXvVzbIYzytU/EYodUw87JF4KBnKGyrqeBhbZ5g9aSwhi/YAGFuRWZLs49Oa0LiVpOSvM7xAXrgdNX1DOHeiywcYmO/aDg8EvNn6vey00cX3NzORypOnzqFKDJomhhShl5QuuoEzHsFP/wcYY/TJ70qoQuyrYhY7JxSrpI1J1eo1aIkhe8IrmbbhTfG8lz4KIWKkAM9UcvUZebA/8++XEhQ6fm7c4tUzAn/XKLKK6O6TgqSMeaouDxlAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIDtWlH1e9af0YEO1Z2bofo52E/iX5VUFkrujErPiUU=;
 b=Tbfr/MrQ5wTvKWN09D8UMXd9QN8/i2MdnHNMgrRTSOWGq+GegjBoaijmMf42U8h20uHY580tTpBtTqh+sOQyiBJ3RRT+BMkHsfXvD7Ny6IC+oQUGdVQlczmmvAwI4i1BD1alhOwrND5CgFmcgzY9VnmI0pk8eaxalyA1cbzEk7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17953.jpnprd01.prod.outlook.com (2603:1096:604:46b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 23:02:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 23:02:49 +0000
Message-ID: <87cxyg317r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: remove card->dmi_longname
In-Reply-To: <a7d26dd6-5c0d-40a7-8fd7-18cdd7422f39@sirena.org.uk>
References: <87tsrte3wq.wl-kuninori.morimoto.gx@renesas.com>
	<a7d26dd6-5c0d-40a7-8fd7-18cdd7422f39@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 May 2026 23:02:49 +0000
X-ClientProxiedBy: TY6P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17953:EE_
X-MS-Office365-Filtering-Correlation-Id: 5262a00c-ca7e-49fe-a77b-08debc4412c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|18002099003|22082099003|38350700014|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MFTTxaSMjBdcr5kZaR9ohkaO8f+0SWJd7VkLWvv9xeT15jQsc5giBJ3MC/j/JpxoSeDfOa2u2gH4qlstBzbi43a46K7GyrlwKvfnX+W+COEUJhtxsyHDKikrs1X1qmMtT0Bx3Zsuo4w+PINplPxUPYVP9NWzLJmcf7GWSLykOPlxbLaq+A/M5+0VG73kLDxIgede7i3I9z/FaHM4PYceOHrm6TR5o1Kc1BZoLzU4cnH5hA95sXsnxHnOHqIubMdbTXPJYEbx/EgnOyT32t+36dLH/7vyyNqGMw4mPA0H0nYwo/83hdjjeKOwKhxmQRbYOPvrLPmhNUAjcISNzIkoI2yKEtCXXrpERnT4pRBRt11Gs0/SarbRCqCVMtHNI+T2f3/tl7ie8G+bhQNJ8kI3fxPIUGjEDGszKeQI+7t40ATo+M9eDVz5pY9R234p6vO67evPbRT/5JGZuEExgOuBY5m+M6oZPx8dlBm4mRFWBScb4s8zCWuXnHfIjW2GxRvicHhFX0nlcAgypQcCcMuJ8t4o8k5TTUsPtidNQqNO8i/s7Dns+WpcGj8U4dGSeoBZf3gVxJXbQ3OMBDgDG25eSjZN4sr/9Cka09TlukgOjyuLeFCi/3KW1eLY4aANRsrNDOwYQEvwd2rwbXINXIG0ABpJQJ+6MoGLy0BBPlfVDopaHlozFLreGfqE5cAUmeakml7z/SCBW2VOaopn6eBFZ1oyGwg4ADteJAnjH6yP2/vX3K69tQsUT1HQds/fN1I3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(18002099003)(22082099003)(38350700014)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iMpr8eZK55MTeszFCnIPQYr9iKmVByszbAcd6Bs7yWACNr12ySmHdkrFBjqB?=
 =?us-ascii?Q?ANgYAtCZt1ahazfbsRDLCfzULPNsDhMwduGnGjvTFxoxc7qHNQ4ELdDlOrG5?=
 =?us-ascii?Q?fV7P7xFA6MzwHzgLY72gDjESn+pb04UjaqFxNYBu6UbicOfiq3GN5SLU4J1m?=
 =?us-ascii?Q?G6ZCgpdHg0EzKJ1a8Q3EWtLHFKItL4+JE1obAJpJf1AH1uwovbDUBxxRfP+K?=
 =?us-ascii?Q?4RdFz1j9pmuhQzJwWCtah7hodx8o9aZRKUaVuxtD5y8122TJiPeV5a3L7Mht?=
 =?us-ascii?Q?A0OpbbvOCz8cvf0shgjX/wQIHD9g/mGciW+1jQVr9O94/TsOkMuTDuMHRRKK?=
 =?us-ascii?Q?QL68tGmVsfbPaKRBs94J2EwXaBhh0CUsQLH5W3YPXz3xrNKDDg4/mD+9BNDJ?=
 =?us-ascii?Q?UjWCwNmeROXivHbMZbDJiq2mrIf2Ykdktc8tHM66/Q9zo+pi+EduIWKp+yVu?=
 =?us-ascii?Q?EuxBjKcq9ce1pnRBM4GKzzByzVpbZxiiOf2KH+/nssDII9oowMJxkMfBU9AN?=
 =?us-ascii?Q?aCYgCDGCLFUjR+3TRp7A/QVGxcepTHKYcZy55IlJvo+a/FKPXrQe5nwUf1jG?=
 =?us-ascii?Q?IPo4etVXFAp73VoyM88JMduaGz/gpGWai46megIef3Ecmqio5eNa4LoOh9sq?=
 =?us-ascii?Q?tK1pTvZzIviEgajGFCOMOA0Z7pR5tWrkF9CN7GHzVtMTG35dnzKlvQqSm9co?=
 =?us-ascii?Q?SKD55fenN9CD7WIdr8ebt8ed6rn3SaAC3HPd97edtn3InZN5oBRaMB4BwGdL?=
 =?us-ascii?Q?yZMlGDRCuQd+iPfFfSokB245jvaxiks7j1h5gi84VZrxXigQXwt8dGqHZY13?=
 =?us-ascii?Q?cQjDWVYfN9oRNT3NP5GKzqlU1RsFDRj9+O9K1Izhjf5eu0i3nJiWUMeYWpHz?=
 =?us-ascii?Q?NDs6whappf/NOUvH3Jdvis3Kg6LcTXtQp0j2ywgQlK8nBJzRVAwdOYsrNA8s?=
 =?us-ascii?Q?D/RX1atoajyjgost79iqUGEF8PVJ2rG6JqLI0E/cTVmE7dbO1HthptxE9Oh5?=
 =?us-ascii?Q?VMT6t3Sn871llzcUBEj1iBT9G66SjorPijgLME7dSSAQWqk3xOx5x0A2IKaa?=
 =?us-ascii?Q?ZDOejP/KSM+SbkZgXr27miEF1gXr5qTa+tkBbKWRaP4LL+TmbJChqXqhbwqW?=
 =?us-ascii?Q?ytvZ8eAOPLGERJdAisGwiybK4rz2umP0Gk7XNAHWkqniZD0VAN7fgTycYHdq?=
 =?us-ascii?Q?6K8GZGmnpfTgOb84yUUhVrSkeT0GGtJXdFwlgUGvjww1TS99txruGkCd6YQh?=
 =?us-ascii?Q?C7b3lBMt4ivZlk2U3DSFuMC1KHT8LmiteDIEvJhg2CxeXWlS4gF1xQNqYHlb?=
 =?us-ascii?Q?dcQ1W96dnSRni0HmEO4SUSpzuDeFZLM9Fq0tZYh9WYk6l3hftPivU3EcguQr?=
 =?us-ascii?Q?zBPVeaf0u0E/BBH+1Wxy9NRDJqeRiy31I7RA7WDt2aSSequE1GUmBlrZKvD1?=
 =?us-ascii?Q?4RyEEsgPZ21K9fFwnbGTsSpUzapPefbuO3ZAKNiVm2Ank/y8D4JbZ9EdW2/8?=
 =?us-ascii?Q?LdI8Cldcnlrr7kGdjJJbmlhbYLdPMu7/1Q8/hUUViRadrD13xh+34IH+B2X9?=
 =?us-ascii?Q?Hz1rBNjuJQnuxpOXBhr+q7nKcvgFugm9yhhv3F1Aq8KFUAA+k9HnwOuvSdYK?=
 =?us-ascii?Q?/588Mkrz9Ww8UsLP3ovEez3RYNt3Y9zyjk2avfPrVOWFMLm5mSD3mwRyHQWv?=
 =?us-ascii?Q?K8076msSBhWYQQ+LuQ9J0hUycBlZ2ePolaraotlJTho1bouACkxyMZQn3un8?=
 =?us-ascii?Q?5VAd0HtBeA6HPcDAPD0xFAal3iNWf9yxU94ceF+gPRYf60WQoidF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5262a00c-ca7e-49fe-a77b-08debc4412c6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 23:02:49.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpzJQ/1KhCoDC/OgQs9nBaLPUITTfaks47eZBgcaOtNa+sqjO9LMhjcy6CSSbgnZ0YQwktGQ4E0TnbLPIm0Njpdfbdghap3r6bBR1SnPpBTe4cr8YaZTvMuo59t0nC62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17953


Hi Mark

> > Current Card has dmi_longname[80] (when CONFIG_DMI), but no need
> > to have it in Card, we can alloc it. Tidyup it.
> 
> > -	snprintf(card->dmi_longname, sizeof(card->dmi_longname), "%s", vendor);
> > -	cleanup_dmi_name(card->dmi_longname);
> > +	dmi_longname = devm_kzalloc(card->dev, DMI_LONGNAME_LEN, GFP_KERNEL);
> > +
> > +	snprintf(dmi_longname, DMI_LONGNAME_LEN, "%s", vendor);
> 
> This allocation needs checking before use.

Yes, indeed
Will fix in v2


Thank you for your help !!

Best regards
---
Kuninori Morimoto
