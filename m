Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC93B8945;
	Wed, 17 Jun 2026 23:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738108; cv=fail; b=keahFm3Gllcf8K/WWA9v5gikPrKQ848mvhLKXwXP49CJMghJsABxAHnW/KytNraRui63kfXBu8yxF9SoeruzrYtX4sO1M/4xxK1Dmt5R8L+xvqpzPSQ5kGw6mwDrfTKtRSru0ZADw5LM4v8bbrR+03KjZQeWbH68RdB+8E7aPi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738108; c=relaxed/simple;
	bh=X0ul/s64l/aKIgipnS4lToVIkmiQUPi/JDCC2Dq2+aI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fh6T3v4fxvpYO4pOf6IARf7OagCCUiTfShiz+6gh2815nfPaeGf8X/PiPvECMIZ+c+0GtlGaxECT+ogS+vWJaxIRDawSrQUZA0ifIKFlRDMKdlCMOJuakNU9vgfsIjvJod/mwceCF0+N35NYv+IB1QWJrs+LegN/ZVSjEI5qQTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TnV+3YvT; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TnV+3YvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH7YK5j3p96/zkwj+maBH/0zqbMCK/0qLCjWBN2JoQiaF0ljmIaQK/RsLeGE1I50IpBvz0BHQ2uin299hmCstjnjneP7s51wQA1R1+m8DLLsIJS1nC/hKBYbdnZSQxruiyYg9fFUWjGxN5oJeVzdS+XPbdHOBSiSgf16n5L7LB5+xWZXPwFK+wr9rGA+ZIduNNxZTY7veF+XN6aTNd8RDsbsVfQ/qKSz22mtneJW+sWk7G6jZOW7yohimKGyi9oyrOLALJAXJ9gLrnK80DrZxiME9szDeYgl/503mdZTNs42HM2WmB4vBdxX/1lP7W5hVst9Y/SA1zFzP/ayIZLZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObfvDOZNfywsovR+Ohc3VEzCs2UZ3gaCfVlR6upgCGY=;
 b=PPkyX4BL6aoDF4uEHtR8faHxBfkE1ueJzMCZOe+2kj/6TkwMQowyYrzsrdGEQwopNjEeI5OT+2N/NE8PVKlUH4MVvtg96KnKr9aKtpx40N4uK92QHuvOaGh6Aqugpf+Jk0J7owYIscQrBBiheZpHAtaSuTVZieWAMSOkYMrw68q8PEIP1P1ACL2By6JywiwcHMCLezDt8L7eWDdRo51dgApDV3DL+4WvN+zLwLBCKZKBCweZj0wEEV5BrNCbPtVUZcTkq6Y/CqN+dq2bg2hTn2FsnMIgaI05B8fcbJeLSf8EHow4DdBqzd1kvu86qaK66hFXe6iItxxy4EDjpNFB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObfvDOZNfywsovR+Ohc3VEzCs2UZ3gaCfVlR6upgCGY=;
 b=TnV+3YvTZXf79yfQt5Ia/l3ykexfKEmaI2kWsMnEI+xSXemx7UF/UTsgkG348YdG8EFrmlVvPeAheU1suw9S4K+fWshM/HasdVn8ut2qZNN7S5cxpMXDd4G7iPzcNfBcHS7hR2YlFNzacYJ+f5CfQu5FtDwo/TNE1zsfLUMDRjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB11802.jpnprd01.prod.outlook.com (2603:1096:400:378::8)
 by OSZPR01MB8500.jpnprd01.prod.outlook.com (2603:1096:604:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 23:15:04 +0000
Received: from TYCPR01MB11802.jpnprd01.prod.outlook.com
 ([fe80::40e8:9fe3:8593:c124]) by TYCPR01MB11802.jpnprd01.prod.outlook.com
 ([fe80::40e8:9fe3:8593:c124%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 23:15:04 +0000
Message-ID: <87se6ku5c8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin@pqrs.dk>
Cc: Mark Brown <broonie@kernel.org>,	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,	Alvin
 =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH] Revert "ASoC: audio-graph-card2: recommend to use auto select DAI format"
In-Reply-To: <20260617145508.327213-1-alvin@pqrs.dk>
References: <20260617145508.327213-1-alvin@pqrs.dk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 23:15:03 +0000
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To TYCPR01MB11802.jpnprd01.prod.outlook.com
 (2603:1096:400:378::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11802:EE_|OSZPR01MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e2649e-d993-4059-f65c-08deccc64361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|38350700014|4133799003|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	pny3P9WraDSAGb1qVopTRtzY9OQo1hZZtaTaXG59EgId2eNtBlImg77lncnjfVpDq6Zf5r6CSNm+CuyyRmQ33XB9U29agS+qmNdJZtxnxGKrOj+T0T0DUZTrdbQiozC4xAznKWHGcGzXZFc0NDrn91SgkZ3jdI/b8+j6iHNb/Qy/WrnTW0qVOAbXy0JIB0SvCwd79YxDjz5VVIfQHJQj4ORl7nUyAcYQN2LbIK3JikgSwd+YbCsZDxx2UMYG/kATuZBBo01BypULieZowUC9QhLL+Z1qnLmWgM56OzzStiqprLMELLZlALbG0r2jKq6QBS290W1KKjhZtJ8dc79hRtDTCbt2kb+ioJrtGoY8k8oAE+yChWioQXXot8SgMhYNoCxzmkfKE0ttkiTaxz2NjE9OP845eLyunmlnT1fMWX1Mo+cGpEaX53G+ayQlEcTXbd5t2+wYPd9ss4jeTWXPKFr8tTgxAuuR2c8YhsLponU+XLkstKjbtZJp8Xq26WJIYAuodCCu8Udc3B6GyI0H7A2PWqHxbt+7l253UqR98iLIp37Bjc9IZ/Bti3kLAUqAXpyNFcjGRZssX76NDTntySxO0SpoNOu7jljS6xdkH5CsxD/rosdkcQ9hAXGgJ4vPSp829j/Sz2sDhH63HRK6dWv/EHYY+yEc4vRR2xd5+ORCy2CQ39TxRRbc+ldhA4GBwbvP/sYOKsn4HXw/L5HuIEDCz47FEaoDahAJK5ctQatJbFuTjjzKJQXTQJI5s2fL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11802.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(4133799003)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?fA9OSz0J3+pRcOFkdzcUpjLhz+2/cBABOKFekZ0egemQakRh/p8wxKXY1r?=
 =?iso-8859-2?Q?imSsaO6KGt6htJuB9bpPRdqTIvFmHjhwYgl5yGV95G0hQUWUPntgEhyl4C?=
 =?iso-8859-2?Q?uK3/aZJ/qaFupy/71RGRLTaxt+Jmulr9qMm1wZ5zqkXDxcbvs2TNGFBk+t?=
 =?iso-8859-2?Q?aklRhTzyki7yhxKhHo/gKOPdBBjXIfbkolXgGMNpCKVWo41008+iBUFS4V?=
 =?iso-8859-2?Q?ZXTGAVJfiIe8v6MTV4hRRUu7f/QGJJdSK0YkDO1V/7NWmmt5mEhx+ddtQe?=
 =?iso-8859-2?Q?FtIr29kd4z7oovBO91Oy20fZ05daivBuRy5dQTFeeP/4KO0xs/okjyjxZh?=
 =?iso-8859-2?Q?iUvkP+cdgHeGL1niEsDS3lTB1sbGI9gBwwbFq4yp/Fj4GCLBf93K0iJAoN?=
 =?iso-8859-2?Q?Ofzs6RczIyaifjQ7SMyws/NIsTSsghhiEcBE728dXON7+OdRbLAukovSxj?=
 =?iso-8859-2?Q?k+xEpqcb2pPYMO7ALzfNxb85Y5e7yEPOG6TAJzGev2sYrvPn94Z/600ozr?=
 =?iso-8859-2?Q?icr9Way7mjjzVURvf2dcYugHcgYkp3MJgt5ExhHY+2n/2FVWM4s0BfPH7a?=
 =?iso-8859-2?Q?2ZCGiMZeCGvQ5Wi4dTrh5RiHWZwA6EAUG0txpjj4y29+btcLBAMKXJoFg0?=
 =?iso-8859-2?Q?jcUnzxi9EGHsFGzzhsA8tKYEVdpdQ4sfk2BHtItQ8Ku1buaNI5CzGgIuqR?=
 =?iso-8859-2?Q?LJCWts0aEUZ0qL3LskFc7tjV7TWndyafopc376N6npfdWZTPtB+62R2E4D?=
 =?iso-8859-2?Q?KXzoKVic9BdooUWDDrEWrXhU5ACYB6HPgC1yUdwXWpk4iqG5xCqPBfohHM?=
 =?iso-8859-2?Q?Skw5aUdqZcxCaaJ7iJoj6cjznfNUcfkk6GL9iM4VgoJu2ZIDTQFEn9nAM4?=
 =?iso-8859-2?Q?4VAVgTPykYa304ZF21Vc8rKadhTo+gn5KH9tYV6OueRvufUpBEB/9aUrez?=
 =?iso-8859-2?Q?tOoO2g0C820p5642o1vhevmNeQxU4bLQpLNmnLKiT7ppS8yjJf5M3W8Ht4?=
 =?iso-8859-2?Q?tOsMlcb6tiiOaPzJUl9bk/yDb0QiyFNjaMFJedNxD2mId3JtrRXPWmFFNI?=
 =?iso-8859-2?Q?D5qzVEdqZ61ocaQUZ6OKU+1GJtX5cF8VY0CHmMFaJNTZOAVEfmX/XvTMWb?=
 =?iso-8859-2?Q?gOD69D8UeyfOS5DrP2uF8Kn1TxhTOI5/zu2YlD+dhwvp+fRH6e6BhOlan4?=
 =?iso-8859-2?Q?XxNzl6zjH84M6aIGnozJUBETdki0Zd5LwJ5lnffOTEkhj/8PJ0/bWjEaoI?=
 =?iso-8859-2?Q?AzhnYgJiLBubzqVijGP1nCtVZdhu7Yd02rwflijE86WgqGubLnT6hxLg3H?=
 =?iso-8859-2?Q?IRPhWc5G722EzZ0t8Qvz/uve+BAO357ySoikdCKeypuPO7Feusscdegm3A?=
 =?iso-8859-2?Q?ubCxqo6Sx/s8hFjp3fjiieu1KrURNnzdVw01z73+8iwXk6TYSj5TYoLk8l?=
 =?iso-8859-2?Q?lbKarxcwy5oJk0PaK8awA16SDPMF+SBAgmW8dZv43Jjs1HEfHIpIT3gI8c?=
 =?iso-8859-2?Q?ZxZA7KBzSM/0g3Mxan1PDsxV6ukLLoZPfMUJM+PPvrNsJaglyFD55GBa16?=
 =?iso-8859-2?Q?ZvFZxP3AXPQE1Fujep6KUeDw8G9uyzfdVKl7MmDpTrYz/q5v4b4z8nSsSL?=
 =?iso-8859-2?Q?FBGsD7QP/AFTPBPeZKQ1cyCNOoWaChUfTnXd4Hm8p9K0raSutJUz37Peeq?=
 =?iso-8859-2?Q?4NDN1ns63jPsjSh4evq3RzKPnTs9NVYq3JG3kMvGHD4nZg144fDAuKGC+m?=
 =?iso-8859-2?Q?AtbsCBFl90MKc6RZhoNu0ODhC6AJ7GUW7sD8lOtG8uWIJ8I/ocH1R92jqA?=
 =?iso-8859-2?Q?m/BKO8q7KpwVn55DIrZyirgTI3FIHgPzH3feyXhQbNRms01FPW2s?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e2649e-d993-4059-f65c-08deccc64361
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11802.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 23:15:04.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SSOHVJeBM3IBkmIcMJgSew/EgVtGoJJ5fxdiuVDu1TfBHQ4V3EsmQxffzen2HXfaEmHxrsjaGGZ7VhEE6WcqSeNzZteWdKbhKA9JYweNcWmI0019DKCVbaXlMBVawGc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8500


Hi

> Sometimes the DAI format must be specified in the audio-graph-card2
> device tree, so emitting a warning can be misleading. Revert back to
> emitting no warning.
>=20
> A few examples where automatic format selection might not be applicable:
>=20
> - For DPCM, where the other side of the DAI link is not apparent, no
>   proper selection can actually be made. This can lead to disagreeing
>   formats.
>=20
> - Due to hardware peculiarities, some ostensibly supported formats might
>   not work in practice.
>=20
> In either case, the only correct solution is for the sound card to set
> the format
>=20
> Link: https://lore.kernel.org/all/87ik7s36k2.wl-kuninori.morimoto.gx@rene=
sas.com/
> Signed-off-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
> ---

For the code
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
