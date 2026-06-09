Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7054763
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965235; cv=fail; b=qTIIGGqK/TM8WfJSiWzSnlr4AxO4sxYnj3jWfr7wP7l0ujmU56Z1v1dEHL3c7G6Ab3XET0OM4kSE/usLNK4lXqk1zwxX3Re8gDwoj7sjE0yLSKibfYCZlMmX3hktJmbLhv4bsXnv+zDa6t/c4v7fcfJD7LAAesHlIvCGLONTgA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965235; c=relaxed/simple;
	bh=Mz6p7v0VzGd2TZpKK0CeuCyAVx/ZVY+pKhUj2RehYWs=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HmZ+Uk3hBZxUJfOJiBPC9NW6VS7/rj/Cc9ZmFoR+LFcgSn4NvJ9RGOTy/i/v+egDbe/dcFPCzx0Zg7bd8LL3lapKhktqYPxa4XohRMldD4v9dtMMXK3zD9l15EfLbmXiqYcsw90mWpvwAA28xp8Ca5JLqeS1HxBxqmu1KY4WB7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ciojoUoo; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ciojoUoo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtkE0syUpykvXm7+7x1+fUYaHJB1WNpiVRf1b0CIxrxA9KmeHsNPejhEluyDFDb/KGlVK9F2cvfYsUu/y5kQCBYwQFRMIcUoH6/X7aZXHrp8bRgA2sPxSJbRJrBoh+sGZVJtm+1vS/P5Sleifd0XNX6460CBeBNxgx0t3rX/vNmi6NLx7yZ8FQBjmVwjTmnh4Wcte+AripZiPsb7Pa7PHpHZVBrw5rkKbfY4qtJn3iTkyOi3gSNacW0Q2qOUZK5+OoOjWe3ViYuCK7Vhxx0pblBehMgnAgvqx69j9TdgaGAsUGcQBi3UsN8P0ANKEpMP1f/Siv41tfR0STWXk/SPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A08oxXz6EK5iQers6XP02dMy9R8/yq3C78NsyFQrcX8=;
 b=dNyMGWGfZVdCMawzu1FwlLHh89PLPGBlUSbtoexjqC88buRUXqOiLsr4FUEyv+aPj82aOnhSkAusU180UqswUxcsvI7caxKyXNshj3saACBF881xUE6z4CliTwHM/AhZPj7sqCjwbMAXVpPi9VU/rfV6CAuApiQe1Lc0HU70jpk4bInvEyFDcLgRSlC0g2MX67Teib+L5EuyQUteePcoId0h8P5evO10coSMBgVkc7HLCpIDkZtTR9Rindr2uBICn1EPBN37GelSytwibxsJ4eZw7Wa2QSfccTVZpn4R5zB2OLbb/Q3MzZ1LoksQk47iqeMBWuDsunH5G1HbEE2JLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A08oxXz6EK5iQers6XP02dMy9R8/yq3C78NsyFQrcX8=;
 b=ciojoUoob+6lSr+3luoyKa/wUkqGgYmnB+JgosHBiD9OmdIT2awCiORcCsWI5SWztcB5OpWhOolA48+d9uUQjEaXaxrTk7MC4NXSAcL+UprgTokYhsSDHJtJCcZbBSbo/DTdEJrNDCO/7nRl/nN8mi6wK2dEv4aH49sOV6ykfFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS9PR01MB17156.jpnprd01.prod.outlook.com (2603:1096:604:458::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:33:50 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:33:49 +0000
Message-ID: <87h5nc3636.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 2/9] ASoC: codecs: framer-codec: don't use array if single pattern
In-Reply-To: <87se6w36la.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
	<87se6w36la.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:33:49 +0000
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS9PR01MB17156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2f461b-ff29-4d96-ead6-08dec5bec676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|56012099006|4143699003|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	X1QA8Cyv0qkhlu64dkuI8ib7N0WWgA9iUbXmT170YbuZGuasXcqPUZBRCrQ3cuB677RF0RnnWTAdi9jMQmQiuJ6/qjJ9S+0vB/tm78iADnZAwiu5kobg1ptSdjXgV1EsqIhwSwHMlG7czxXyZ6kjRBI+aqg5TvygrVMBMnU0ee0mmjZ9yA8Vcgd4+piYzMAH9DlzpYv9SlZUU2RJhT0mlnfnt6fk4yGqjzfB8YS+hhZmuJlpfKuzfl3sXiYiUbMzAq+HOrM+CTTUOaYxmuJh+HwuuQ+EDvZla9GmRZDj55utsaqzxndJmQci979RDE1+CGW60gpnS7sJqZ1QFkYOh0r1B9Uu0wsUTHUPzpzGqaHUqCeTgnsurY1r8dvl4Ng6cE76B7GwONtVpcPCXCem7OzWZHfkaFNVxetgolq85e8MSNmK8z+LuoUIa45ogaFv//7R1AVTi1SEY5b5B0cLEBB2kMATj61hAar2ncLjvQvVdp+UFZdxvg198jNFLmGw9fxQ+kmO47GUgR9sfu21WLkw75Ml+ldED9nyxA2oTRvuEpIeiI83xant7qCKH9DK2X8aK7QiXv4pQSb65SFfuFmOxEUrEqy9of29vRxY5wLeb7FFbWrlE+/fvDL5Oi3e1BKb7ttTXCyXTmdL77/UfoXZZaynUUCtt1D9gasbnAPEzs5niJ2Www1ONQ4HQTnBpu9hSf0Kvq6bE9uKJJj1LHnunilEC+Ej0VvFOP/d/kqyG8TXNwfzBTmh/i7a+jy/yFedVnvNIqrFMncQ3bG8YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D11E+qxirZGTgoCZIIPUxtTfavW1pUuySfk2lsoDBMiuHRviJhBUZkqy8MGd?=
 =?us-ascii?Q?ActidN116/EVYckUD2N/vnDoqUX5FzzCcO22NS2bi4jUMzXDu8Qx01EXyPCq?=
 =?us-ascii?Q?LjavkaaLyaB8lI9VhMyBHRy5WVJIQ9oEpC58Zao0Y3Jvkjt3+JZOAxEeiaEA?=
 =?us-ascii?Q?SWq1KPXWU6yDttcO+QvvLyudzKK/Jiq4iLQbbwcFFYceRAJqzlwRyjh5cydo?=
 =?us-ascii?Q?4qF8Ukzjhq98naQgNmzuQsgaWJKUHDezEfvTufY3EDP9BUEh90wySS+aByRx?=
 =?us-ascii?Q?ZslMzZdfXdtIlYjyCqR1QlClqy3KIsuRjGaCtp6vIDBJKnex2OZEcR+PWIJ7?=
 =?us-ascii?Q?BGQPm/QXPubTgHY6+rUiJfXA/QW5wIFe4OAoVmALisQMcROgSfSttd1Uwcuy?=
 =?us-ascii?Q?Lo4FqaQKAtQpQhtncmN9Ok+8dMi0lc1VhrVSJ598Kis8s3PSTq8IlzJ42t7H?=
 =?us-ascii?Q?7tar0PUQ4wv/jqwUF/V269KBBonDERElGlijhnNBrm/Ybf0FnlOTMYZ1RZ9y?=
 =?us-ascii?Q?nCm0SwQcfl2hCvf4QA15LojH1yWhsvTPr32QrsOKp2YxG0VDCjBPsnIZHQc3?=
 =?us-ascii?Q?W9zrzcxt7KL6F93BycY1St59eQuJhnke2dLZb0xvZDJA+GtpzYfYllx/y1UC?=
 =?us-ascii?Q?9wwnCRcEuy2CMIzXAcbN6WQWKkZ3EkDIpJ2VLCv7G17FpyyQLU1+KguPCMLx?=
 =?us-ascii?Q?NCs0W5S8VHPOKChioEW/G7pu1Sdc1SJgjWB1DYHatrnF3CdFnZBSzVaIH5NQ?=
 =?us-ascii?Q?CJt1vpfzrK+GixMfugeMHn89EgarWpelebwTNGqmOqLJD+qYFldCJkErBorx?=
 =?us-ascii?Q?gZabr/U3pyJw7NxnBkdrekl6Vuv7uarVI/NGF7TnJ/WGEVXb6f62imYaASLU?=
 =?us-ascii?Q?ERmVQ7RsY/WZehlo377Di7VIOSjI00JEz/U9tjlpaYHzJljobss6VqA2sKes?=
 =?us-ascii?Q?Nh6/XnH5/XeX8tFWHHXqP/mu2HuGXZuZUciGQU6cDhuqtoqkefaEsDxHsX9J?=
 =?us-ascii?Q?mauDOKUhPmDTwM45UUwO7XX9S487rDg9Zw4mIymPEGHv6moP8gDeIuEqDzWp?=
 =?us-ascii?Q?Q/K2GoGbSnt9n8AK7dSdvqqE0b+oJ0Of1EnXFqNMM67VCnRczTfJqV+uLXGU?=
 =?us-ascii?Q?PfM3f6Z7vDgtBxnwQARz1C8IfthZSlTvAK7AjGvadjDcswLVeavfEXePO2gt?=
 =?us-ascii?Q?gZd8PClNl/ZVcj6djCTNbYz6nYRvEQ5dWKLzY/SCvLBwK6E5S5pzvwMCOkwN?=
 =?us-ascii?Q?E9s3IwEH1AZc2TeH1GGzqeKLV15VJwgtfA7sEr3Mj7Nusr9m/BTA51f6MXYB?=
 =?us-ascii?Q?xyY4Lc0LXfAWgVd8qNtAXBLA3og9fdEWf7Hed4bOCNnYee69j7gjzxP9eqnY?=
 =?us-ascii?Q?VpMuJzW79+dFJICm6Zsyo0/fY7dAuafz9dXFiDhTShgxkJB/Cq7sxgSBqXaR?=
 =?us-ascii?Q?7pFnZqbQBLis+zpRwU20WHphF9Afczf0uAmJUtxjJql6mGrol4aRGLXmvXRJ?=
 =?us-ascii?Q?qkeBtJp10zPTKpjsSnzIA6JShyytUDbjLstAX1zgahYU9n0CfgKHdj4yRabz?=
 =?us-ascii?Q?31RgZMWttdAPcPJwgZUJZ4KaBMjnFTT980zvqEsL0MdlRaynoASNp8JGhxbk?=
 =?us-ascii?Q?7MdC4gJkCxKYYGKOvgl8I6REmpPsyIMUqXMHDwNRsKUpyH2DB9l6vYhtGDox?=
 =?us-ascii?Q?CLFJ2UaEA7KZhsPC80DGx4oyHZuPpH6/qLpTY1/eltCR+q65xixURlwBfeSU?=
 =?us-ascii?Q?UlE5R4VgJO8JoJtHPhmCQjUg5wfCNV8Kzax19rkreFtJ0Z/YlP35?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2f461b-ff29-4d96-ead6-08dec5bec676
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:33:49.8724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHYJhkYHV3eHYR4pUwQZ5bOQR5C5pSMmSobsVHfMYU2BN5Gse16abjX3QhzW4FgSL8poqy4u3sDXBHpE80Gse8zhGyDy6aRhfsJImP75YiDCMX0tXqG3y+xulo1/Qjtm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17156


Hi Mark

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry, I lost something. this patch already got Reviewed-by.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
