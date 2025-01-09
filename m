Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4836D;
	Thu,  9 Jan 2025 00:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381244; cv=fail; b=Ty1Op0ZNITCWkg3aV5MHgA7JRHEXakEejO7rNuTmnv7DOwnhrbNzMynE2GJE4oiWBKylbocHEcseMmNc06Ks39rCZA9BxC4qth2lmSFdNNmP9yI/Oi+u/u9uNxWV1xv7fd1CCiHSM2/C+GtRMLiX8JFkU/SNAH6rkzl5PHTPTsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381244; c=relaxed/simple;
	bh=VEW5PSxo3oz7kcblAG913pVsZbwnGJVGWuQe2XQPesA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CwAM5/07ellEj36P9rqwwErQ3FBUNuF5Jyd4NgqBG9UvSb8ZxLZyRd/ytwctkwhjQuUOfx4n1ehv5Hg8/8+8UQRlkb7Y7kcdmZbhx1G97k2Ncl3D+WyLmwvsrEdVz2CsA6STXVZWW8gfpeuEMl7P+W4mrRTmqfRklDRm4u8rc+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=N48t74+h; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="N48t74+h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTNjB1rCUqFtT795LsACn4Jnvx/oeTe1ikTDdj8CCEiH3wTIEQ+APF/hbhG3YE75yISro/GWgYdtmRS3g8n9j360ybmAnjrvPHvpp64dw47kcENxcTA+sFxQMP0kdx5hreoiwmynhXgsLaVGS3VYRcjtPASs41MOgoFaxW0s4p7HOHGpgcC+oh9zAbIj1ejPG364xDS7jHrj34AHdlxd/ZKebhJDiSLJ+yNM2HNTZ0AujBFhbBAdtiV/Xb6TOiDqyhQAm4vJE6nPEcPxM3izQPMwFMDZ4YzyINoR7CeXhZQNPD5xISTjlwCHF56t1HcU/OijMBmKgN6FIMhC4MqqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQlaAVgk/rDDCL1DXwWJlvGb0aNaABxbfQVbIKNHaVw=;
 b=IEAn6mjw173ycJ0iLxZc5LUg4/DIAZX585LBLvaRsoZLLPHi0cCe4ZoHyzDeH2SXPfdWnutZdHjY4QHhcxAY4BPgKIcUVg7UHTWC/0RACoy0UgpYQCncV/RrpCZf0a8GA+6GxBUu0/zzxu9z8Ui9DdbO2Q4kPz8R/MjWXMinBfND7Q9p5iDiwgB70E1oDp0K8zASpz6CSe0VESzgr86crW8NNXTbL08jPWJJX4kfX6XLRTBUVb0f0ktwDFcxyP5Eh8tuQaTh6oouP7ZYRQ9928JWORUy85Zkjci4lfy4Mfq6v/TTmciJ2Lq86NNwAbKTYWTpwsHSimWZvtl4cFXXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQlaAVgk/rDDCL1DXwWJlvGb0aNaABxbfQVbIKNHaVw=;
 b=N48t74+h3Pnx1jKcBbCZ6LEKYUCp6jboGCbfKkzTFsvSd9/T4PuTrM7VlPdw67hXAg6IdzCvJt5CNLzBSfa7yBTvLuQBG771Z1n4qBthz7FE26p2wzQdq2kOTRnBsoYmrPWvE6AscCF5xCAju1I2qjRYTEdDQYPGroh0S9p85X0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OSZPR01MB8482.jpnprd01.prod.outlook.com
 (2603:1096:604:183::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 00:07:20 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 00:07:19 +0000
Message-ID: <87y0zk26ko.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
In-Reply-To: <197add46-752d-4779-98ff-1cde2543dd63@gmail.com>
References: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
	<87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
	<197add46-752d-4779-98ff-1cde2543dd63@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jan 2025 00:07:19 +0000
X-ClientProxiedBy: TYCPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:1::33) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OSZPR01MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: cab39045-ed5e-4ab1-bfe6-08dd30419595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zZTOjCpWENyXjPezXRxggroe9aIeRw2hw5TMivJpMuMienEk3XJkBtGB77UO?=
 =?us-ascii?Q?UYJAuaRgJq3ikLeLBAZhVCoNr1Plaj5gkco/MdKDrCHBBg9rKzu4EmOJUwK8?=
 =?us-ascii?Q?nhQV4faDKA3QdTuMRACUXx9956BEexfLvl46YkEZVFJWz3uYz4p34HBosBII?=
 =?us-ascii?Q?j2OWH+F/cz7WXbhLyNXL1hSp7bkMQdSVJK47C19DoupTr/YbCrlKsB2sJXLr?=
 =?us-ascii?Q?jDEIthzr8Lhl/G4mjffYwyA0sH5ZY/dKpz4jbVXBrTDymD8ozR4q95Zba2Ao?=
 =?us-ascii?Q?4rvOBeimQOrTqDd9BYYgOCqa/tXjryPHR65jROHUCwJFPny+m5G0X8M0HQHh?=
 =?us-ascii?Q?oR+P4Z9YAkd71Jwf8j2UyIVyDEIl33U0ox+DkZ31K2lfL5MDqXXV8oBSUhib?=
 =?us-ascii?Q?oLeIyz9low38JsEUPcmMYOkbo3dEaKCfUwkfZ++lboaAOFR6IDm5HJbnEoCW?=
 =?us-ascii?Q?YxmVBgkgCjGVZkm3UqiKO9kczpD1OflePNRkwgB6n1TH/GbJjp2aIU8I3+Hw?=
 =?us-ascii?Q?QZrQMbEbnkPpFzL72wUp2kqBvtrrOYlvf07DQ06/N4bhlCHLeI5CYzvZQN+f?=
 =?us-ascii?Q?cH323MZK/Ka1j9hUnBYMDiqoyiU/7cnxLjUcUAm+0TU7eStYx0QhHZfi1EOn?=
 =?us-ascii?Q?0rJPysyLYNcpMF/w757Onsm8p33KcTgCP2pwrXhKCluXUNNJWZvDoSh/cBMN?=
 =?us-ascii?Q?XoDOZ4AUwClXLop/rUxE8W+4tnpelAILAi21BwlFOzuIKDWr7wBXUkRe/QnZ?=
 =?us-ascii?Q?TKmn4BCW2EWQk+GRVVbcm7b3uTj9HoR0dsOLJ1ZE5GUg9uJfiBfXqg2ViJ+F?=
 =?us-ascii?Q?iYCBNrTWRFT2PJvI2i/RTSxXZ+L8b2+kQqF8TmjZt/v1Ck+yTRKRHps8rzcP?=
 =?us-ascii?Q?uai2EfNSeQhdKtw468XggomGSB0/IKOtnWoEuiM9eq0XqUFKTSMbyxFaqa8C?=
 =?us-ascii?Q?OWqVjponKwJhMEpK+RO8zEoYRNb68FpuXAe70N9wEmCsac75X0IzcQh5dnht?=
 =?us-ascii?Q?jGdNfKFgeoXnYVNJYGD49WYKK/GSKMdeNNIbEPTJa9PmK9qXdKRzrPnuFl9S?=
 =?us-ascii?Q?V2D8I7dNnMV7YS5Mij7yCDUOqQUyHqtkY9aDiWMzVqZIv9lGFj3pWKCdRFij?=
 =?us-ascii?Q?dXC6+/HOyYW21kD1lbWMLRDNUp30Ip6BYSRN5OXctjazpDuFNvHwnN6VcFx2?=
 =?us-ascii?Q?3bXWrwwAzLMlM4yMM1lABq0U3Eq0PilOw3VZSfRbF/mE2bT3gs6d2YPzkYXr?=
 =?us-ascii?Q?1QoC+DK7U8xMkHlgSUuIzT2e/208ZH5B4067puDpbKlfi11ujrKo/NEXsob2?=
 =?us-ascii?Q?CvdnBtzT1bgv+qkTbSE9iGZ67ANMA9+9MtRQE5M9mAjzAPzCvJVVk3JztplD?=
 =?us-ascii?Q?GSFaGlUU4Z09avLeL67pSCOXkNzopLUbKxRqOY7SkBzGfI+6rOWUgWo4e7yS?=
 =?us-ascii?Q?z2oz5hAfHVz2VTO1R/80zmWcW+2dQ6ls?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6oco0nC74JLwHDSukaPcFO93Uuz9dyTPA1kvZrNiWfNwHoVtl/wpJKrCozBj?=
 =?us-ascii?Q?Ak01PUo6rS5u0RlGNiyiKPD1OsnCHD2GS5x/GrwI4ATYW+VBn5BorD0XFUCY?=
 =?us-ascii?Q?h/al7wHwonhfFGy0vkg4IakxSQ376FJ68+/J+UH3BMXrLJsFUvtWOHgl4KOj?=
 =?us-ascii?Q?yQ7EIUZlTRCidVKR/GOmrkpyOUUD8U3jyxKpF1lTOZHzJORHVhfqFmDx8AXQ?=
 =?us-ascii?Q?b1zYexUzZXWOESmY0/TIPIosByNqRU8HHHuXQL1qhT9NpkfO2BGklAwRPpeK?=
 =?us-ascii?Q?G6rSEWx+KwNfHoqrhZEcC6paucieK0mXjUQkOQFQo4QMjiETqyV1MpO2SdH6?=
 =?us-ascii?Q?Tbi7WSyhK587IAJBvK4kKNOr9S0aeQB11nN9BJ/IYpSsXkykxnTQuPY5HEx6?=
 =?us-ascii?Q?pGbSVV8U8M17TFqPXTqg9H9g1ZNEJUZ2mH6OoffnEMmXDa0WKDgfjc4obv70?=
 =?us-ascii?Q?Lb5nIdKIY/oeZ9dtpJJPVg9wVM/KK7/NirBeJ4hbkBDGXWFyY6X7ev7/b4VD?=
 =?us-ascii?Q?6z9uCXvA/tl8pndQAbQkXWHOVouha6eGjMwemzvnwvh7ggNIHlMpFXD/j0IW?=
 =?us-ascii?Q?xLC8rmcP02675Pa2GQdr0DhbL+6Dw4Sjy2idlyxMCXSRsmPpgVfoj5lvIkmw?=
 =?us-ascii?Q?pxHDIYCY3+u1pvc/j+TGazZnzhMapdNv7XAEYxxDBG5+HyK5O8ixlqaAVPuG?=
 =?us-ascii?Q?KEmCnuQjSPHp0uNCor8f6SYMPZjAzQHIH1GbSTY3skAcx8NOh4PHOcVlvZTE?=
 =?us-ascii?Q?HVLBBM3BgQ5CCxQgF00yZeu5qAx4221DLXjde9LNvFu7kT4frh9iwnzBVTNu?=
 =?us-ascii?Q?1rqOofGAKbM8qmqFfW397gDLIDkJsWriqFzaZKsiHKaHr6Ao4c1uGnxi7ydH?=
 =?us-ascii?Q?/j+HYztvlEqcBmKou1TCd3bS2DanaMdilx5LzU5wZXC0ntdJlDqG+qR0vhYo?=
 =?us-ascii?Q?79Wv5jMwPftK9P564YAYnVWYtNGKUM9XQrYSC/imu/CBNt1tQAU4Nvg97M4M?=
 =?us-ascii?Q?OasDJTEHD2cvUKyQZbmaKup+RmDob08pBYZW/sXD1VWmFsY+INy6Rqa1HdoI?=
 =?us-ascii?Q?lE5tV9Zamf/LluiYHqyDULZBq/fY7KU/AXm0WzGnvD7HrRTFsxFHrJ3odFGZ?=
 =?us-ascii?Q?p7PmXv/nV/SuTQsTVnACrYsQjjwmzvDU5Jrs5e68PS5a2cfMGhPx9fdZEh0G?=
 =?us-ascii?Q?ty7y2rkBj/9rmOD1xkfh3RdDek2jrr+swYrTkoiV3U+ZEiFPMvvhq2T8SN3I?=
 =?us-ascii?Q?tzuTn4sgklKfmkqoT9veLZ/U2brjvtrvWYX4grXvoW3jdLgsdgL2x76oKlKN?=
 =?us-ascii?Q?/gPbaznT64GbcTSqPguzudwZmUvWMgw7PvohPZmJ/TAj+JouBbztAvoTDE4Z?=
 =?us-ascii?Q?rnl1fY05FgDhGj9Vc6Gz7ICrNjh/b/bxqTz/ZJsXm6vpexJt4oncI4+R8f6D?=
 =?us-ascii?Q?CbZoBfzPSn+LF5Slo08FrqNU1hZ2KijTavb9BXGm+y429ayyVANbM7LMHvFF?=
 =?us-ascii?Q?4s+lAZYm69HJivLpHGeFm5M9ZzBIxyrHe6ukmJTXknG2pK34vIDDA+fGWy3/?=
 =?us-ascii?Q?XBWoHkq73mYOMcVTLPh0F66HVm44qFNWxu60K0xaZHR1BZOOo032HkoPcBms?=
 =?us-ascii?Q?mKUzLQdRLFnw8QbuCqnXkKk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab39045-ed5e-4ab1-bfe6-08dd30419595
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 00:07:19.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di616xuFuRb6PFNjBkoSqi7yn9/r+y1D7UBZGYM3idcW+6n3UO8mU95z+kNHph9lgjmv/r0CU4Ne7hL10zAQFUoq0XqRxSXzVe1qLmLU3q2CZ7G992FUpALW5VJhmgue
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8482


Hi Laurentiu

> >> +#define runtime_simple_priv_to_props(priv, rtd)
> >> +	((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))
> > Oh yes, indeed.
> >
> > But I wonder it is needed not only utils, but all drivers
> > (= simple-card/audio-graph-card/audio-graph-card2).
> 
> At this point I'd say there's no need to do the replacement anywhere else. That's because the code
> still using simple_priv_to_props() makes use of the link number to index the array, which is fine.
> This is opposed to the PCM runtime data ID that may not correspond to a link number, thus making it
> unfit for use as an array index.

Oops, my previous mail indicates strange sample.

I would like to tell was update simple_priv_to_props() itself

-	#define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
+	#define simple_priv_to_props(priv, rtd)	\
+		((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))

...

-	simple_priv_to_props(priv, rtd->id);
+	simple_priv_to_props(priv, rtd);


Thank you for your help !!

Best regards
---
Kuninori Morimoto
