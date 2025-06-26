Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FA2223322
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979595; cv=fail; b=CFyYHYrisCq4tFekP4o8Rqz0qNyFbhPVZABEBcqQiwVj0JYpjc3IfSSYNKiXAov/fmqDI4ib9g/Fgyp/yRVugAgyoWje4MJR0OiOcTWAbkwZlWDpSz/f2NsOLKfdV0zqZJBdoR5g3BmU0wvABtNMGvcMl1rGRnJ5HvNgE1o9E30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979595; c=relaxed/simple;
	bh=aQqsOVIUEDzS+oYh7vEHEJzGbgK+fbToO3KcwoIvjRs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q9WXhVG8y4sq+0fMcB4+UoGf4OnUi2qiZd752TjOKjJ9l2I5HC14hiAo0T144Yfz+jNp3p7QADIsi79tSsFBRNros6zjmcS53YCxKgbvThwl1/nycvqhDFg7IeeyH1x8+8bP3OV2kZrWJxJCydnwSpY+sSwZ6PPcsHp4ug2H3I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BL/EmQku; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BL/EmQku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjDo8JCuDwRXP8g7D/O1R8xS873/YQo9vI5TH6vkqyf2g5MLHYKpWlkrvl51wxftQ/mr84bsSUd0fiGLK4fIj+MojmhTlvC1eUGiSzS8OMHIRqI8qtvCrAs/ktQKEsg5d7IrR6leQ0IAG7VC0T8t1nqL8bI9jf3HGrfyCkyuEruJ7u2pAwRuk7z80kwruB3UC3UgWsBsLYqmjx/0H49XdgSUDN/OeHXo3BtQAzLsPTa8PYzTzoAlGuuGf54Uwm0N0OJqbIucp++0qDwNTgS0s6MwJFjrttDS0dGQGIRY4UKJsO1c2mq3bQk0qYssVToaOZcBd58tlG/6jJtbw+kciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKj5JGhCy7cdzWui4LctGKATeCT9bGGn+VjHxrEUZdU=;
 b=qWn2QDw0emNbb5CA4OajETS+lg7wuyGhyJ6r4/6qJ8P/0lzn0i/RkZhvA2FVnF3qLxMEMzh5M4wdYybXusL2pU81hOgZICjbSwOXMqfLx6H8t8oiJW1Mu9MIhAVxcIuzGp3Y8xicKhNbwEYGUfavgbjCtfYA4CbNRXXFnocRPoHHV9UhfwuOCQ9Ysb2eJ2uWoEoz62xCy5ykAbK+jI4Du1DCnQs7baYVRsJaxzXMPged96MIBj7HHn01Y0qaA3xN4xlvAPHdnKTJX1ED8A4Rwpzst6aChm70pnwpS5zgPhoXcUAAta8JVyg1+jJvp6D9Tr7wqBJWn3kGEmIAb3cvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKj5JGhCy7cdzWui4LctGKATeCT9bGGn+VjHxrEUZdU=;
 b=BL/EmQkuG2ETebX1d4n0J7EglEXm3ROE+pvHft9D3G7fKCH+hhJqzWGsqPJf79/TYBBgfJptyrv2wNFX88YsdZV/3qGOz6LgntwuMLdn/6HQY01p7UdsG14yyiUaidPX5LgHLH9ki4kOKzzOdR2alcc0+f19V3Q1BSJrUJmyons=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12289.jpnprd01.prod.outlook.com
 (2603:1096:405:f9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 23:13:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 23:13:11 +0000
Message-ID: <87bjqagkqg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 04/11] ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
In-Reply-To: <aF03aZsk7bGk2oQh@finisterre.sirena.org.uk>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
	<87sejn1ca9.wl-kuninori.morimoto.gx@renesas.com>
	<aF03aZsk7bGk2oQh@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 23:13:11 +0000
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12289:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f6b355-a7cd-482f-d6ca-08ddb507053b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GbjjAjdZB1373sJDld4sgrGuzNQls1uudHNeaI0GIOFJ4wG5Ew+gWn8qWdVZ?=
 =?us-ascii?Q?VA+1sCqt7lWa05oE9rI20OdjcIzqBb1dg2cSRLY+zd825zAUXZD3C14u2zDM?=
 =?us-ascii?Q?7uHkwZWiezcJBdWeE2gH/BMcShgs1PceP5dx/MaGg3J0OVfbMj9/4HWJ6Po4?=
 =?us-ascii?Q?OUIl6JSAoxD20NHtzYihatUCNRDQgYPKYnupmsurdr543KHkXtQR6BEu2dKI?=
 =?us-ascii?Q?a871ED5q3zq3s7ES37rIpVYETju4frVKNy/OK2cMZMg2iTNWHKdxeMHOn2ub?=
 =?us-ascii?Q?354269OlEiD5OtZJE15vB7/gW8DI7Z9BSxNjWhVXJmdJWFIygObdSzI9Myjg?=
 =?us-ascii?Q?OFRu4GZh+jGEhs50J6z/srbR0ky1MwJXP2D+WexfflE1Ms0WLg2fqx6Esufa?=
 =?us-ascii?Q?0gJSODKeRFEcSxxmU3uXhPwC+sc1eC6UPlie5ZhAtBhi8HrTR5GFBBF+B1E3?=
 =?us-ascii?Q?FH9Rxa1pjhtW8zyzZsk7cBV3YAnfxyj+ie7q8tAHivz3deduy/viwXtqyrwv?=
 =?us-ascii?Q?p3DP02cREUZiNnS5xEElh/I6mCwHm4qRqkNKr4xOg+9T2jEmwxttIRMBWvJq?=
 =?us-ascii?Q?3ByUhYmqUFOp7EwHbUoWHihavf6DKyZgvym6Ye/GfY6v7LJExQ/mkLaLhkdd?=
 =?us-ascii?Q?mPQCkk98mSeCBb/QkJAyJGHYYu/skbrCDCJuqjiolDxZr5SMvcsWW8X6pqJU?=
 =?us-ascii?Q?hc/uN9A9k/cUOLl2zSNVhIYya64bVNptu5rFApILefnCdn8ZjI/thiqP352t?=
 =?us-ascii?Q?aqO3L1hf/+jt3xbYqwd+98QLsvannbEO3NgWtilTN2tayl7AM2cJMMdWLToN?=
 =?us-ascii?Q?+MZERntzNb2pIQgylgb5T0RKmNdz0W91IX6cUU8MV6qrB8939DYxDyJXlYz6?=
 =?us-ascii?Q?QxqI+VxhYr8X7KUYFcaB3dCPA780CAvnVa4lDdg6ZB4j/vPZE9VOcJ3FiJxL?=
 =?us-ascii?Q?nALTrwqZYJ2X7nEW6C25H/kPseqaukp9KcSDEnWEtNo4dQcu/SeWohCiQ+yT?=
 =?us-ascii?Q?gvUg+vA654DWI+Wcw0IAxWziIeUR5zkB6yhm0/M28MCavWwK/Qm1P0vx4Isg?=
 =?us-ascii?Q?ZOIuM/xJrZQa0IvcxVxrDcoa0Elh7LEATQ2buR5vsgjQBHgD/H6gDymjh12v?=
 =?us-ascii?Q?mTq0Idf8G4pZ1fUIC+m09KeDINo+JCazsAP16clV4goOXp6m/+sioGUEW57B?=
 =?us-ascii?Q?eWrhWPX56EsGVJS/Jy1ypvzzJc1A498FQo91yEFh5gvAbtHCajbckpQJad8E?=
 =?us-ascii?Q?H6wGKdozYBzG/YgSgL+XQaCZNudbRxOKrW42OxtNPoefdwbGmYFEzq7TnX+Y?=
 =?us-ascii?Q?8/VIta72HY4f5nmnY0c2fOrv0uAAHDOJpeTEWFdW+LwfyDmc3J95r7DiTbOO?=
 =?us-ascii?Q?oD2rLnZEznIl36E7BLAWGPstCW+KBWCrrimwdscs4rnh0URyBe5NfrLkfrbO?=
 =?us-ascii?Q?HlgOUQUtv1ebuYzFBbCoYpGqHpP3BjDsAK/VNmIPHlMLMKbAtOpbqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?82BmyJ67FKewjwcs0ya88rYgGysOJbqayu9GXwOna44JiWseVzIJ8i7YFy+c?=
 =?us-ascii?Q?vxGx7d/7sAPabU75p7IqQ0fJNtxTR3yJyF2XlQoUwNo22W68GBhv++5QjyTO?=
 =?us-ascii?Q?xqLyj/wcnxYz82VfFyX+1nUehnLUbPB1L6bdDiFVVQfU5LUTdOVpBwZW2e9K?=
 =?us-ascii?Q?iWKkOSGPQRFlWkmLRogmIAiTHVoG/8fZ0BNy/OnF9VGf84CnXF1thCU7dP+w?=
 =?us-ascii?Q?NTx5SpvWu4JpiOyTMvNbL53z44NBQ53QEA47d5i9MkUflrJhmj8cRUDuJ3c/?=
 =?us-ascii?Q?1qguZI9qC0N8DguxB2ZmqK3OktH3iSl5Lao9UCxPIJRlFIKGhs+D6B/holCm?=
 =?us-ascii?Q?L93pPZBSKi59jHbu1IArbHmoVqV/XvH2iVJvmFZvVM1DK1hFob52h3YluGzq?=
 =?us-ascii?Q?Ik+wwFAUtaSPdXPQ7bDhuyBT6UN4cY7X4OFDN5hh9MjObuTfEwdDTdEQ4P1s?=
 =?us-ascii?Q?eXLenynIDFsz7VdhDRodgtQCO07Yzohu7rnylwOtP/PIi6fAvrkZL92zhvl+?=
 =?us-ascii?Q?iVgFZBA5X7fLljKjiKGd8yLJUcSnrWxycjlkwCkT20cY9uHS7yVYpJB0VQO8?=
 =?us-ascii?Q?E4FS0ZBFAhQDYEjs75a4XKRrcuY7LfzWmo+/LRsuWlOSSMTUw86ThPylyNTw?=
 =?us-ascii?Q?6MBS1o7DAQyj02Pj78hbxUKwlURWeXsmHkZ9HLJ96exyU0eo9b7sHl7hViSJ?=
 =?us-ascii?Q?edRDrjTBKxckAffnGF5Zh3LbCtCAWV6SR/3dcHS4lhl0qe2k0OEg0px2hWFL?=
 =?us-ascii?Q?Si+6+G0ktj/CxtXZjxDPEm+zzl3orgGitax6IZlAlaRab9aW42PVUAU0wm/3?=
 =?us-ascii?Q?48gkxVMhIFYz+RrZcDHBIuGspIZhsv7xV7+NaxRF5OeTNebkQJRuJ5uEYdmR?=
 =?us-ascii?Q?tdUZJaplvofL0p+fTbwsgBR61B/cOGcCrF+VAYFKi60NDCKShtziSxdnOvhv?=
 =?us-ascii?Q?2GW6OgtfO7fzL8DBtI2EZZUmsraCFLSSG+ASg2IlmNs2XA8qo4eaZPYHfTdO?=
 =?us-ascii?Q?kaAjmE0THfeNPorn8ThjeknX/a4nwkutWbhFFI01C1KQVaVmUuo0cJlOmWIn?=
 =?us-ascii?Q?TxzGZbcM0QDY1ortibHpGzN5YtZwLIJCoCDmxB6Nl1OzlypFSuu05dBgwrHg?=
 =?us-ascii?Q?qa7ZCKSbmRT+5BVWgn/j7AFDYOqr8iqujMBD3rO1CTCwBN5g7mNibEW2bGBu?=
 =?us-ascii?Q?nJhOuSPZTAtHd6Vh/KR/JxKj4Vf+NmSAbOtV0YB3hobwrzaAn395z3rYRiXa?=
 =?us-ascii?Q?tfqZRBfAkJZEdkfWDCc7Xr+T+ke7/4EtaL2Na9nZCm6SZWwvJ+AnthN0/Gwu?=
 =?us-ascii?Q?pW+PRHnS4MQ9affULZ47Sml/EbEPz9jxUq70Lvb39CJ0P9ZREYgaNLVmdFzn?=
 =?us-ascii?Q?WGaB5In/RVUbW3F8E3OqPeiV+w51KuMoGqSOxk6fR93ZgW+rphHNZhpnRtAx?=
 =?us-ascii?Q?hL7qP55fhZ4eQBrWWKoTHLXSl2UpQpVJJv6TXiVqlvopOSdJyN3J5C1KfUCk?=
 =?us-ascii?Q?p9Oh6ZhtREAfyjuloaYfg91MaDGR6py0p43qJhFJbod1akSKy9P83f08m5GW?=
 =?us-ascii?Q?p6HWVrlDDLOWt4i2CAT6Nk+zaKZkPnz2HS8O8+wzaMb95JxWbDdPqQocVauA?=
 =?us-ascii?Q?xQWgJoi9Pul51gC7D4wWM9w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f6b355-a7cd-482f-d6ca-08ddb507053b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 23:13:11.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaW5nbii5G9B07VuJpZZqznc1KAaWGMYb+Zl1MCYfwnefcEcyLnLh/WYA9a+zMM2Jol2p46Y+hOka8SDo6/n/Zf/sltjOVuZeOie9OgS/3obuXSkZkIvZcwxM/x9+hzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12289


Hi Mark

> > No one is using snd_soc_dapm_weak_routes(), let's remove it.
> 
> I'm vaugely surprised nobody added a phone that uses this...  I guess
> not many phone machine drivers make it upstream.
> 
> > -	snd_soc_dapm_widget_for_each_sink_path(source, path) {
> > -		if (path->sink == sink) {
> > -			path->weak = 1;
> > -			count++;
> > -		}
> > -	}
> 
> If we are going to delete this we should delete the whole functionality,
> so the flag on the path and code that uses it should also go.

I didn't notice about weak flag. OK, will care in v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
