Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8AE25776
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 00:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037209; cv=fail; b=Rkenb5AT0PbDlyzjXrRC0STJF6C5ruvl533P/8GJfyQVF4YwYU0OGtW/dXpVGH8fJ4iZ7/hzlyB4ajn3OebuTbWLGWadgsYPiW9y+E92w6/xGLhq3l4aFz1D7ZVxkXokmuQS9gb1gKI4cuoAMW56V2E4a7kTcFjlfQJicolKpXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037209; c=relaxed/simple;
	bh=puXTbkqebn+nNvXJ9EHIwakbbTuBXUX52zbdCvcQgkI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZF9GgFwalMygbxmrY7s9fkjoUxCTvDuPARDpPeM+VHmudiWd2L0epL4/X8q1zxdmc749U/NW32TULqxx/avtcgwJG4CF+RCzaYJ+IDPP+7RqFFTY7ypkcnfyOlsuTFUIFlz32pV3zC65XqQbo2qt9mGzcjfj639O4hjz0l/UF3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QdOKzhOx; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QdOKzhOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYCK40Q9E70U7RfKnV5yA1Nd+HDEAijJ+5Ouhqb89ZuuAUXppsrEr6VTwZrCcKyz5WDXpwlzDY6GVA+t34OHlM9+cCzK8jkiAzKHK0+XkyowIY6n3jn7sG4bo5JwewXXw+aAVaIx26bRI2U/Ma2DXEcV5fztpimkBM32hmg82GJi5O92ni1CFOatow4xcz13mfVHyKWbEc3fcrW/2Twh4tiuAZymaAnAR71gqvRemWJCmr0E/Jvt/ERC0LHEsk1d8VtZuusfDBRREumhp35tsQW15jM0etHHJZBV//f4OLxiOStMsTThjtXBIm0oaobyNPwW44aL6+Ha/vUXYYNbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz3czuLStkWGJ490Ee9JKW5qugEfed8mlAbtlCpeCns=;
 b=E+T6y5Pqr1DPFf9aVIfMMpX6icT21cxPJBooNjoVNNp31XZBw84ZzfWxAg2zPhEHe8SRJh9+vgs0njs52xK+jzq7MfjqaKXChH/rK1c94kdR9+VR+ANueqByUpwXVCHzJozMQF5wtnHXgJtZFYHRY8DfXobLHJfMbKOz6l5hI/LEbj55mOjJWxBcaxQRF8juZZMyYxmQOJCJAPz565XAfZjx7ZnNm2DRIq+mJKvITo2v0s9d0tuOOwVQ68pnmSN4f/qel/388x/XL/6xVKFyVXlaR+maXnePc5rZ/67m6SQ9lXHzSL3GrS1EHpPo4GM9sG34Zmdk+foQxaOmeVT+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz3czuLStkWGJ490Ee9JKW5qugEfed8mlAbtlCpeCns=;
 b=QdOKzhOxTcIjdyZAA+FjltdkQwOxDS5vnqEf7kg0/MH2dU9tk2BlYsXyO3hd9m04flSjHCghmNgM4XVu6HSAmJijTc4AUI22hWo4cTCZfhqHk/8Zdmm6Oh5UC7ZHNjOCaWjW3Y0dwIiKwfIwulwPMoU6A5pO4X5m7GGSP8ZzuTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSBPR01MB16299.jpnprd01.prod.outlook.com (2603:1096:604:3f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 00:06:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 00:06:46 +0000
Message-ID: <87zf09542y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
	"Kai\ Vehmanen" <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,<linux-sound@vger.kernel.org>,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH 3/8] ASoC: intel: avs: use snd_soc_component_register_with_name()
In-Reply-To: <64647845-8af2-4feb-812c-7c63e8bb1484@intel.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
	<87qzlmxk2u.wl-kuninori.morimoto.gx@renesas.com>
	<64647845-8af2-4feb-812c-7c63e8bb1484@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Jul 2026 00:06:45 +0000
X-ClientProxiedBy: TY4P286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSBPR01MB16299:EE_
X-MS-Office365-Filtering-Correlation-Id: d15e74a1-0946-4fcc-7691-08ded896f882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4Jyt3IT6Fkj2mVbBxnuAgoE9Tm5HsKPt/DntLC6DA3AZaOHMGoetbcYd9QNl4wQ3uM6FHYVtjouNskdkWFSFFQnz7bB1A+UWxXCRI3/ypfblk/Q0yiF4omrOyxPrTgP6FBRaBQKKuA/QgsR4aUncmaGrnea8h4bYE/T6JIGgzNt2nQWral5t8ekbb3zNHBXezWWiJF9V8Qk4R9biptLAyiQ/dlfWcPciO1R3bF/lHch0wkivkec9Gca6vkaaGWSJFnlYBhgR+XLB/QO0tXSSE4rGhAzHk0fyoyJkBdNJGAabg9GA0PUczNSIdS4WtZwG3I5xDsF9BlzsoiVRnbdNQVShNkHd9aP3U7H9DUS4cWEJwIVZAAribwqOwYhhLzz52pQal+BmzrmiSQrlzWU2VqExMe4ew1vxMGPFzIY2nx9WMJN19Ote0ZGjhKTf34Gq/avTkDNBfb/+KAsO9gTw/kzS3rOaVLuBTCshYgcsanv1/YHfg9dQpyMIDCCQZFRhVSVKQZiqrQSE6/i7dQgPWoTzvHQ+SXORNMdNL0YS6bohuylPftBaIXwNxGXw1QV6NxDPsUtpp9MrBpCjkmRxjwzRBdENjn8ded3ZSIIL/afGyPRz0Y24uuNB1U2LYVbCRBj+M9EAhaUYk+n9BxUlhFV3VmqxbAcz1yGpOdIUvtFcE+togODDqlLq0lQKjUYIq5CMKOXmfgwtfxPZqqpXdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B77Euz67q8qN70sVssKlkD5HHScijGJkvlEgVF4CpPqN7j9Uan7WKumm7AD2?=
 =?us-ascii?Q?V7TeeWP5wuEo5uv1IfB88sgQG2c+CDjCuPLMumrj8erDLWwbNIY99hYdFGP1?=
 =?us-ascii?Q?QCUM38LzisKCHJEEfZI1js4C9JunIx6gAxKnyLB6w0yuKg/3AaL3qUrxmEdD?=
 =?us-ascii?Q?MOnlNZItKn6ep+HoEV2M7kx+wIYhFFocL/JZOTcirJxGHD31D887LuwfNMn0?=
 =?us-ascii?Q?Cj9r5b02YnfiPPCn+PfsRVATTrUwq+L0FPeGuADBHpLZssuyDBvI0LMjNFCN?=
 =?us-ascii?Q?0FM+GzMx0DsSPP5S1ZKM2sxRYpAlHbLTRFLVG1Zcm69PSvO/fochmb4PlKNh?=
 =?us-ascii?Q?uS6TiBjLv8DAZs5xQv0t7IxxDTEaKOJBlONguNYQDMdSun/Q+ddkw4BsZxzb?=
 =?us-ascii?Q?gZWKLrHjOXfR3Ppe027Udx7qaPyKhlKHKPnpJVoU03yD2LBFPysL4O8JquY2?=
 =?us-ascii?Q?0ao1jza5v2YnzL+kHk2AzjllDsmuhA1OrF3NsP2GNrIJz/a1dEUFRxNc+fC5?=
 =?us-ascii?Q?yER/f3UNrZhsqy+XDuFl2YJhhx296dF9fPtJ0FczidVOZURvRqkGKxhpt/ep?=
 =?us-ascii?Q?zpG9gVNK8tt1vy/I+eOcqL2zgNFSmROliBEEupY7ooKZYaKoR9ypROi/9bcg?=
 =?us-ascii?Q?tj2xGA7Q5rZO+oiJKs7rIShA2FbSZh4wlGO5eki+0AoOeYwGI1lpELqmWWex?=
 =?us-ascii?Q?bsAlvcSOLtHVD85ynrF6G5vRnGBkFD/N0HWUfSoDe0nmXMhVfWcY53d0z4Gv?=
 =?us-ascii?Q?3fuBC2m+Fpnf29MAk53gahKoIC6ik+naWdCleicAOF3P7xBz9T5QrzYFPRuE?=
 =?us-ascii?Q?UtaN1x8xWgPc+EiLZmZW0t0cDzL3mY/zXmog/VFPgkJ1wf1HRJVgllEnM7iI?=
 =?us-ascii?Q?5YLlRgyPpKJ34UQKHrCXLwJF9uPR34ifBnDSYeXhq6TnuAqcjffpQ9l8iDVA?=
 =?us-ascii?Q?QUDKoCDTQVrZFOcIc2IZphJ8KucvSNXVx6RtOWIkxkUYwE4osDI5hXHLzZxB?=
 =?us-ascii?Q?gjnOV2FB8gztf/0cwSicnvLQtApB5fAbl0zfvsbvyDgsqa0BthRHoTnoie47?=
 =?us-ascii?Q?HOw99lsib75prrlHCSeJwhaCmECoBIsrfS+d/XCv4UVrc15DV/j3T13im0w9?=
 =?us-ascii?Q?E9CPeCkprBcmKDNm9ujpSSSUipLCoVxCyx8riW5Z+rnS/L8RpeF1uvYNP+TT?=
 =?us-ascii?Q?Ng/Vm0DYuz9G9jWGyv3P9gX5OKEino/1lHFXwBHZRB5LF6mCC7ilUdvGP+XA?=
 =?us-ascii?Q?UyjtohapS0ZgFlHMQwW34eeRzc5TyrEcNm4v23lk1CMkFFaGqlePM7lSW6Dr?=
 =?us-ascii?Q?PUAD6eqIB9RG0g0wbrBKez2j/LMV6VPeLZhu9p2BNbv+xMWLrwZ8UeSI09Tp?=
 =?us-ascii?Q?wNnm46i1UKvrtHTL3MVCB5S3RrZU7FT9MdJciP6tTmC69UF8eXK/2EO/FV+W?=
 =?us-ascii?Q?4vLI2UapKpEpR1knBfYOhCMoFkrlz+OKrTgySVeKAL8273L/Ma3gbX/NSLmA?=
 =?us-ascii?Q?zx5M7CzHryBCbS8zsBvlLNjTWY884PBPa4osoeSB9PSYs+qSbPWsgCe1fVN9?=
 =?us-ascii?Q?TnwOmb7uGniDFVKk/Oy1L+zoX9w/VWe+fDXJ1AFdHtHzUyXavFfNhvp+yFzt?=
 =?us-ascii?Q?U8aS5tOzptiBKqME9tS2irCAc4vr/6A+WpqMDmKk50ce3HRr5Uhk0TNaXXJE?=
 =?us-ascii?Q?xhJ5uQ4Ii8eUMd6gOvdcfjqeC65ZSw+sRWI18yu6S2S0bgxh9esUxzMUrRKE?=
 =?us-ascii?Q?7EbWvQ9kmx526AA/kp1Sy5oTiUY/PkvsVMmoTNFBerSCLxAn4eiy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15e74a1-0946-4fcc-7691-08ded896f882
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 00:06:46.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BE/Zp+AcSscOo+4y/I3wVxGPiAXYIf1IEVOL2XObmX7np2p1hy0qMzvJ885+DUhvBrbW0RkJR7dbLXBd26JLkfsbb1n37uZHEuWnxXb/26jPFoDXS8NdbTjSUEcCs86M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB16299


Hi Cezary

> > It is using container_of() to get kunit_soc_component from component,
> > but we can now use snd_soc_component_to_priv() instead.
> 
> There aren't any kunit_soc_component here.

Oops, yes indeed.

> > +	acomp->base = snd_soc_lookup_component_by_name(comp_name);
> > +	if (acomp->base)
> > +		return -EINVAL;
> > +
> > +	return 0;
> 
> Registering a component and immediately performing a loop to find it 
> (the very object we've just created/registered) looks off.  This is 
> something we have to solve.  I admit, this won't happen within an hour, 
> will think on it.

This will be removed in v2.
v2 will have snd_soc_component_alloc(), I think.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
