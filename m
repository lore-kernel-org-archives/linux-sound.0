Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C004D8D80
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515528; cv=fail; b=IBD0re+SYtTibAvx6holQcnxyA/GBZwzrd9TJ0KRewEFw3sMOR6iz8n+Ko0sl97eMPdRPBk9JJfN1pA4n6SeCncbzx1GBv8pxMg/ToeaIx5O8ZUb/Pry9CJOLTXOCAuEmaaItQRqNE/GMtAgwVrfOgmTDGyGZAm7Lwi2XY1J3Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515528; c=relaxed/simple;
	bh=L43j3yRRXEHO8hV0/x/5dNVXUqYBUjh9905eHNBvsBM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gYmWTHiXKhgBGs6tjO43fXRg3PCber+CGV+6sWSiUk8WVCPb7VeORrhvFge9Alpf9rxpvwSTPim11CSUIPdOFhzXhAWxE22Tzh0PaJ0Da1NV0wzRvsB5qvR7erFeM+ri5+r+oQ4UkqrJHFxg6K+GgY2TqvGVsVVqVUSoCWAOLto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mXVEu8HR; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mXVEu8HR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTF8ktoP6OWKjj3lJGmvol+j16OPxwY5ZAxddHWa4asv7E7sV5cGKxw6DFVTZKx84E4Hl16ISGKwrF9nB0LLI7Qtqs53XBKMsa7Bvs7oJTIjtalj1X8p2OPLURnzRivPYFtgK4+3BuJU0T5biV0WVzh3rT+1UhkysDIzn+hC0y8CR/usdioxuPkNgDfsnCC9HD9W9tX2tT5omrsbB6QhIfSGJnagoMrdXzBpiggmq/SjS+sAKqoYegkVnwGEdUQzZ8RnRge4gDpnSsw+FwP3lN63kiyW56g1aDl21nFMhqsSUt5q4HI4rnzZNPTJppu8PiRBiI98sYym7Ftqyqr4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5jGhd8dvRgYQK7DXHC40/kYjASW7IULf9a0MMfhZrw=;
 b=BM2qvkcsZJr3ENeCwsBSwKQwIxflGwQpdobeoSa3K5y+w4qM8ChTXGoN8RKG40OA2J6lZyj6vBAKzQkqQzhA9jHGqkFWZ1zd+h8QJpUVTqy7ScpI3LbxRSj1nKp7Y6S8ssoEkDXfyFrNjV1ijFqQb7plyAe5CmfCjBpOyg9JDw2gdZZT1/Qhc1odIgCoRsjVFDjNFhpKdWWZWjtpg79NABRjgbGcmosf862yqgJh46wMo88J9/qrQs6imrsxtmm/qX3yyCXxHkw9xL7kM2yfh1KlUD5N4fBfWgqeLYuBtNeKYfMyOc/3GvXCkf2murvSgwCKhnsCVZ+QSJC8lJJEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5jGhd8dvRgYQK7DXHC40/kYjASW7IULf9a0MMfhZrw=;
 b=mXVEu8HR510lkY01/4Z9Qu+EGBethU+9g73bbL91Gyg2gPLywDAmtZjcyY/gShs0SWLPpzRjf65FRAtikODa6spuEP7KXWstOdi99eVwdL3araGiWgnGWMsvBNT+wCR+OeSGm3QL+B5T/y4dDUtVyaFwm3a1CH2BiCRIx8zg//Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS7PR01MB18136.jpnprd01.prod.outlook.com
 (2603:1096:604:4c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 23:38:45 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Tue, 15 Sep 2026
 23:38:45 +0000
Message-ID: <87h5jqw0e3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/10] ASoC: soc-dai: add snd_soc_dai_get_bclk()
In-Reply-To: <aqlfShZgud7jIeAJ@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
	<aqlfShZgud7jIeAJ@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 23:38:44 +0000
X-ClientProxiedBy: TY4P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS7PR01MB18136:EE_
X-MS-Office365-Filtering-Correlation-Id: 660d6708-cf45-485f-d28f-08df13827b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|366016|376014|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	052n8reS4dvnrEBL9wEwMYBMOsUm4/SMlLMTqbysZlUaahOEPLpREy6AQho7VqFBGdXUyvoNVVMGcUr51Yl4QHOvRE3l63rQU05reEI+K2DhpwoKffHxvo4x7O/KLb9yK+dbgvyMlWkbgEsbBXELG3vkS1bUJkr487QScq7i2YAHUk9Pu0DKQV/IhWnQk8cJhitHtJ3Q+4KjQlIKszJzKUGFnxM2ody6ZhfGap6sHh71fTdPYThHVCpMv+xz+OePLFV8bga3QVTgBrMWtZJo7woRwWNNw0zI0eaH55HT0RHr8fW8NuVz6/63nmu2iNb6+NsgOXWlTW7r+7TCyLrNx16oNZnKH0gVd/iC+Qys3Dk4X6aAuqCxLFY/28q1sxbkTHmGBocHkAJXBwn6XL6Kpm5sNgzFF5UY9twGH7NoY66Sy7xcTw1GnTeuxDGRHOzkLzvO/O4x6f0dp8hS4KwzuA2Pg8rUL3NfrAhJKhmK+eUyoYeKHnAMbOmbh/GS9Ezwmw8kxS7RHLFu+NxCzpt25FSNwRqsDltIiFUAJ8s4IYreIZYgYBOdxj3lnWlbg0Co9Un59R/OSrKj7CNmGb2zyWjg3SSjygY7eoWeED6jWMWJ7KnorHgwKFGSyreCUc2Ffx3/lR6OmtTTrI8C+5tSLzgLIpBjr4qKKWDYMa2SaZG5hH7B+ePW0d6wfGiUd4w+xM7M2VuQQW3HA8ooKukv3TrOhFovHZ8iVgARekslaT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(366016)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e4Y5fD06cvu7NA2+RhmYAVCWhsERjvIrdX9ZMCjfJKOeMgA5IHtExUw7ANEj?=
 =?us-ascii?Q?YNEEGYPbgWh5BCIfFMLPWRWAPBZuMRXA4VlOwWXq5m8cwUYZhgzET/K9Wj61?=
 =?us-ascii?Q?1dwckfHh3jzzPRs6tHRBet4jDrY1H3fjnHe3w28hxKq40hUHk4grXlq/4/n4?=
 =?us-ascii?Q?JTpITIqmxBOVeCBbgoJJQ3vcqK5ErFiEnZaB2MtGJNY/3rYkdc4+bEJoMfZY?=
 =?us-ascii?Q?96UHVdIygA9tmavSA4WL+YRA/pbztEVhSTwpbSRdMEXj1t8yxmW//mfq5Qyv?=
 =?us-ascii?Q?YpEgIWmsroE8gXe1v+6IWtr0fcQ+0UpkyQHznNp7bAKgrLC6IbJWGXb3l8/O?=
 =?us-ascii?Q?xYpbt5qnFoXQMFPdc+00bOT7isgUPo+GjQXSk8LWcF1Dx2q6WJYdtCsmwp+d?=
 =?us-ascii?Q?pJ+423mkc6TrP+pbp1DzaZwU9e8HHqO0bku/KNMlFvZPQMf3SXuEY6zaE5op?=
 =?us-ascii?Q?WSPFMW63lIfHop8VJw7GPrMMuqMHmREKKH0hkhCQox05/k3tCDseM+tJt9jj?=
 =?us-ascii?Q?XAXoaHGpwdGtCnqsEgYqV4UFYYH8Lpdx14MH73zsqR/lHNXsGaOW53vD9+ah?=
 =?us-ascii?Q?ScBjvNjeAQO1tYJSRCXg0QYLlaZQISKADfWFcDaC992FoZv41q5s+j7IjmmR?=
 =?us-ascii?Q?fa9l1VKoBuibiOZD5376sHhECsyln3seK3Gff2jdVPUBKq2yX2oyHfxeF4VM?=
 =?us-ascii?Q?DScv8Y6Tmcrza8MQ/LZcUUMENl9alsmWLAT/5i4a9MZnAk/wkDviSsKfFRbU?=
 =?us-ascii?Q?A8El6oyKU86NMTZfkl0r+s7oGy8njpD1ze9X0bP5JyFJ4KY1hbUZh8Lc9HYr?=
 =?us-ascii?Q?tg2gtKsZU0bSaivbS/77t5O9hSe8BE9Y5UUaQWCLCoXe4WRY2Yfc/krgUQ1v?=
 =?us-ascii?Q?BqXvj3GWgk65qwnhP1mDf9FzizcKpZNprQ/6v9WaFCmAy6G7A4Ny4xlckkEf?=
 =?us-ascii?Q?VG+voMvT1UAd8u0x3ndscXt7Oc98FNJTEemEA8gJ319QiykMEgbcspef2DKg?=
 =?us-ascii?Q?1LM5l7xy5qO9c4XTwjQB9iV8IEZxkCRtcnDmcfoV95+ZMJmg1mdCxrsFbSMl?=
 =?us-ascii?Q?9WhJTnx1DucZcPt/VSuCwk2F9JT+6/X/vaUY7SguIIhMfP7OSbZVncAw534i?=
 =?us-ascii?Q?TLuA6paunzOeqPz3Wv08V40hyf7qhYARsKw6Jft5LqDh2fVjRQWuzqkgX/5J?=
 =?us-ascii?Q?UiwhyZJUMVnKfuiG4HcTGs/mlQ3mfhhOMjntCbPpW9iteAYy4y0vRMZQv5kr?=
 =?us-ascii?Q?hIZeyWDTPRSX2/Mvoteb86tAtypVCFQe9OS5u1edOThCvA2vdG4/0zkJiCto?=
 =?us-ascii?Q?MnRD85MkUFUv9SXoZ7HZfb93OfQ97/3ecyRYWlcGyFN+YuCMCgSX6V4GMo7Z?=
 =?us-ascii?Q?vvYtx0ppkuBoQn1pKDBZfynUxIb8szqKXpdA14NuUI9/tFbCfmrJnzf0Xe0C?=
 =?us-ascii?Q?OnQGc7Azu3ZarSzCSFuJWUKt/vP/b8r/MN7qJxwRiAQ85RZhB/TMVLlI16Bl?=
 =?us-ascii?Q?XiCV8f93/MLDA5Raf+azD+RCRGzLFwTJUqh0gBaxoa2R5MtjgxDUh6gA1q/U?=
 =?us-ascii?Q?VjTa0fKLKwhatpvNZiorDcCKt9GfDXp2LJDGO48Yv+gDPcM0d4itNUQZVMxS?=
 =?us-ascii?Q?DgeNEWffWt8TXfuLwa5WeLjfCvqiHpA+ZE46+z8AN4Lvhr8gmYrjLnbq7r7T?=
 =?us-ascii?Q?L7f/4NkpZ3MJ1NGCvQVVFE8TNgLgbXQsiKL3CzGH0dVVqy02AOvG5Hb0RG5P?=
 =?us-ascii?Q?AgHDn0hUZ4dFgHMNu3DtRnCYWKW6ikhZP0DroOSOmGRqNz+gv1MP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660d6708-cf45-485f-d28f-08df13827b8a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 23:38:45.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYAiwvzkNYogfMvfuWW5MXYGHocaMcxXnszyACqJsgNeERbDbkZVONfemYnilN9cNHoakZWufglFet7xDjZHw9afnIkbN7K2cG6fGbEatVPOR5Iwm2WefvNksVV4aNXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18136


Hi Alvin

> > DAI parameter will be capsuled soon, will be not enable to access from
> > each drivers. DAI priv has been mainly referred from SoundWire driver.
> 
> ^ Stale copy-paste from previous patch?

Grr. Thank you for pointing it.
Will fix in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
