Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A13B993B
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455614; cv=fail; b=tMaeE/A4g3t5UyO2dy0e2lVrWx/oYujRssHAGv5LfpKzc6VpgFO4BUNF4r5P0eCBuH2BQj7VDSe4L00OpDPGbT/3zqNhv7k7p1hD+XfW6RSvw6Te8t1UZXsy7D1O7IHBqAPpjr9Y9Qn2U8ARYnX7kf2RoSAjMoNwvK/LERx9Vvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455614; c=relaxed/simple;
	bh=hqGYsift8IZQieq4ietUZLCLqGQb7iqzhmpQODJ/klc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SOL5JACBxZ1qQWqiXy8IVdgO+DJO/+TeoAnksb3Ua0ZGYDEmzxqd8+SITYQvdGHi+RuG577AF9PkNv+z/L7u2RwoyvskUkKo8s1JPEOpkUcjpmljTNGdv8PwMHm7zqcsfHDgxt2cVo677pvZseUp5gfFTldo/t2EFrCJJoL7gjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=objcdAb5; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="objcdAb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEENoZFbMkuzXXWgDp7pqzG1NtccddbHKgzmi807CPc62vpN7IYvtO+3xFPWViBbYlHWxBeZKKRb13vrmVpCTp1gOe0bi1m0AhS3SoVVg9QiNQGSoada4pjH29pTpjzE6EUzifw1uWreWxDwWm4pMjAT3KpFTi/42HBoIWJgILqVBL6ay1+GFAC+RPdoqOUe4mOeWnn1y4U6iKTar4fuVMZzCuOPS5cUi8SoWALyBasdAy72hV2GTnQRrILAFzDB1S4xwKzO10ZQBFPwbtyA0LAcw15u9MMm3s9N3vFmdX3tEaZYdOgKKsCnJKjIoGkOGkQ4w0aytC07YCPr7Wepaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqGYsift8IZQieq4ietUZLCLqGQb7iqzhmpQODJ/klc=;
 b=oQBWJDZHyd1wSpXsNdKDcpSgNUt7BIP29jkj3UJtW9ms/jODsMbMVXdi/cyIdz+09DWfKws3j2I88UFAqUFyJVJjkYscsJQX4w0JCn2GWxQNjJQoOzTsH36SOsZrUY/o09CF4K/kXPwY5PlvRw1zSvj0h3zSy/9Ni8Y0oy4Oxpg6tSE7oHGogjCC4gd32VTd8E9GvtrJzOHSyxek+Or2FZql1OVJLMNnYSU9Liy1rzdYhIc6LkGI22k3GZzsNGfTyYmNOqQcrEeexUb+q5+3E48LS7CMv0IIzGE9byH6zUnGruDE6mxPlCD4jf/UVJQuNU+esGjSriioFulrRTQX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqGYsift8IZQieq4ietUZLCLqGQb7iqzhmpQODJ/klc=;
 b=objcdAb5p1qXyhMNXNmG1cET+pwfBPIoW0HNLsTsAWlYb5EKXSOO5XDqcunIPTU6c4ew+K3ce5su1ibho92bO+hOkAmnpOjYSTM9taYLWI1g2WyovN2IOl+/7uwACue4Ir1r0GOrNp+3dOCaykohE3WSWbAtMO3Sdv+1kkQiDqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB12939.jpnprd01.prod.outlook.com (2603:1096:405:1b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 23:53:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 23:53:27 +0000
Message-ID: <87mrv8rq4p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: ux500: preparation for Card capsuling
In-Reply-To: <178536744793.512962.1637654903512081263.b4-ty@b4>
References: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
	<178536744793.512962.1637654903512081263.b4-ty@b4>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Jul 2026 23:53:27 +0000
X-ClientProxiedBy: TYCP286CA0312.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB12939:EE_
X-MS-Office365-Filtering-Correlation-Id: cad7034b-f23d-4530-dc5e-08deee95bff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WmL4Ph72+azHFU0RldazMc+Q9gxdVHpFErmA6GLqfFtVLmZDYW+QexWnuxWotRifPIlMlcQ3k2oyiizDGEtS9ymebreT9tk92FXs4pQfiR+Ry2UIUGL+jIWe3jznNPvX52IsL8DuNoG5qD4qiS4ogWv8StjMyCMvemtd7nhw8teVf9JhxZkXFJ0dMKSCK3gzjdd0HS4dBhFaYXT6nPGGN49XQqfqaVZ9/zHJi1tR9QHMiWW2pOkUdp3tMeR47TEy30oN3Cspfh3Ig+cbu4Qqyhs/Oam6QxEHfKbeJsijwMHyCSeLjeRE06mRr2B+Eit3TBV18AN12l4IJLKXlfwGdGE161WaXvwKJb97Ws9LidX30ixGAjedG9Y/Fp4GJdZXP6SoNOz8HRD+BciLSbxcXwmT2g2xTlrOU6ARhW8FroTzwjj3JRMLpd7+oR5YQbfvmx2jO8Af2Ya8UxaP1KoyDvy8i8jy0+rV9w86XnIfORwNBKZcNaD3qKGU+P5wTdIhWVN3MptO8nrUXdw8wRhjUUjDeCrLMRCIfz3ELptgiMLNOYtvBViM6F1J3Ztn0PNBxuQ84SC3gILMh+qGwRIrl58dU3QUairOwEjwI6cEb5bUwo4EI8lb/I9Up40yBUTpzRc+rrJ3y37rrgquXobftRD78SVUnI7KlR7Nd3bQ1t7GSUl1/Mm5SKWvPkt9HGBRv597o78JQI8LYZLKuPJQw/B+K6tHUkvjYpV0kq6DXaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kYrmoz9Zf/MzZcLvVLAIj4nyhVox4Irx44/EhAW43xogskC/4MnNk7r+VQZ1?=
 =?us-ascii?Q?QrQNnVV9arfVZve/IKszzFM+F/gvFoTsKJl8HRucILT2RyewRZ5m6iJpNBfw?=
 =?us-ascii?Q?6Ofpn0EJvSAY3bfoEp1iElfcSrYzXFIMUzEQrkQDwe1J7GU+10SdAQR2FGeQ?=
 =?us-ascii?Q?iwU95n0+/cScIE+pTSeHfAjbdprepOKOtIUzrx8GptnMclo+MpkNTGWzHy50?=
 =?us-ascii?Q?Da34HdNOpWVNgIVmAUz5XTB8v6LlPoM3bCXBqVZZM9fl/SW34Ae3pRcwSLiy?=
 =?us-ascii?Q?U6DCo4JGPS7HhToqOjy4BxZNfm2qyprWrp6v9sE3Zp5fKViy+iGoDrPwAvh2?=
 =?us-ascii?Q?TkJIpepye+abPQnqZRumxY88J45eTlyHASWN1gFuqEHDjoO/UfSaVJu0xr4a?=
 =?us-ascii?Q?LGh39RGukYPxrhNP5KDRrVcFXeSrI5tdmwFQ4jTi/BSwI41w6A5baw1x1oXT?=
 =?us-ascii?Q?sVIm/3BA56t2KSBatTE7VXaAJ7oGeSb1LLyiJne7My6a+1H1es3BUh9Ptve6?=
 =?us-ascii?Q?wDwwi+fVkwCkAQBq0YI37q4Onp2XQqmyHWmAVjI+7OwuEhXtyQNBUMOTzQMc?=
 =?us-ascii?Q?zIzqbbbzrpQwH5hUnO5PJ+hwuBYwXnB/MpcO2JnX5Kg+eg1PU3xF2b5PhJ/a?=
 =?us-ascii?Q?SR7x3sFCUjTz4J7n9aE9mnvuygYKkZs8Cr5Jpr+FvBxvU2/lqb7ZO4sRN45h?=
 =?us-ascii?Q?oekt2z1teyQsRT1o5/eg43iiYGO0U7kAdTD83TLSXTcGaUdH7goRklToVum0?=
 =?us-ascii?Q?8i0pky6SMSmncnf/u2/qF0KXymUQoaZlTYFSP6jZ2jieAmT1e1ZAlZ3lHyqd?=
 =?us-ascii?Q?RhM7J0ByPnd9ddZTYwwN6huKrRI0F3f7+kVrn6KePDPHJGZKe9YH0wnuMRFG?=
 =?us-ascii?Q?niMkDpcLDq0SLS9lBft2q8sjIzA05KPTBC1DWYOVpgBilM15Zekx/eFac+rT?=
 =?us-ascii?Q?fYWIcSBK2Wy6DhPnhQzAIvXSZtXmafSSgokkXvu0zOE5gLgj5e/htVcjKHhL?=
 =?us-ascii?Q?Nn12FqhuR6ApZRdaqHDPLbSqaJmXgADEvEvBSvNZfL/b04sdEfpwNhu14NI+?=
 =?us-ascii?Q?WIIqk5HG3NUm+Xy927EWwQEmm8+8xl072AdfmWn10bNJIGOaZ3/SubwfQVUT?=
 =?us-ascii?Q?LRzSR7Hw7ojwQCUaqis/JMtpVEvh3RMbNCW5fZncgYeBEyeJMElXJqkOiDN/?=
 =?us-ascii?Q?XUwV32ps0zjFXgIxkbBTAZ2VXAG3zLmO/9t1020MkjfSdjr32QTzJYxdHluc?=
 =?us-ascii?Q?DoKKjZ8ZsWKdiADpCG0mQvvye2i5uFMXjietDy4hMYHx/j5zJeT2Y0GGuZ5S?=
 =?us-ascii?Q?qULfX8k/T+zuOwlild5z9DfGod3d6Sz5DN9JJMBBRtZwDAHuRrxzGobj0Yri?=
 =?us-ascii?Q?LReL8n1LLAXpkt6rtSHttLG5uAdm2mWqQIgc4d1d6n+XIGBkOzdQwlb5R8Ij?=
 =?us-ascii?Q?jz6WPFpCU3NPQcypn7IC9oaPXFHVmaTlxX7aNY2BWwF0nsYbmD+8cZtuPkHh?=
 =?us-ascii?Q?s5FCH4ssdWmL+KKCOhF+Zt8B1omotypPcsK6+GpYpx51fE9PUxkUUDZ4Anc/?=
 =?us-ascii?Q?jXW35TcJNQqGENy0X/xX7/lFSCItslEazxpeHy3Zc/iVF2ZJY23wSC/pdXh1?=
 =?us-ascii?Q?BHJAaHIJVphdD93VoG7It+er3yg9EhPm5Vj7G408JIVX90HV5arei2KmlyzC?=
 =?us-ascii?Q?qDq3QwElQYbRVOWhFVxK0kVHLODoqcia7oCl2ZpN5ZR78ReOYYYl3NacUm8g?=
 =?us-ascii?Q?YXu6Gn6SXGhLqWoEdwb/3ayZfwB1uZLp9oX0zEWt32iwA50BTMFa?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad7034b-f23d-4530-dc5e-08deee95bff3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 23:53:27.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJBABQIOBAZI9ZhPXXx3AODdCsDbWHbyK+wEiCGuuUQ86KQdQEM+Sc/aHm9Rb3IoTm4w/6sYoD/6TqOSGUVUUC6V8xmzClgWtjCIq4zhmT74pMtd4NXM3VFILz7jk7xD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12939


Hi Mark

> Applied to
(snip)
> [1/2] ASoC: ux500: mop500: tidyup mop500_of_probe() parameter
> [2/2] ASoC: ux500: mop500_ab8500: tidyup mop500_ab8500_remove()

Hmm... I can't find them on asoc/for-7.3

Thank you for your help !!

Best regards
---
Kuninori Morimoto
