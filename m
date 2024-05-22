Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887A39FD8
	for <linux-sound@vger.kernel.org>; Wed, 22 May 2024 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716363879; cv=fail; b=SVy1ZknlgRVdX3mKT70FtpMZMlkHjFgBqd+Nrq/ko9OL5m6a2rRz1h3BqC+KqgRnOz6rMxOw5MP+aYTFZ5qnQO7AXlGBS90o2djiAZ3pLhJ1AYPZ1kTlm/fKfaI5qyHT6SR5k9epfqmNbYAaABFThxoRszZJcXODSUm9FUD7DRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716363879; c=relaxed/simple;
	bh=dPuVEVQTSpAWJHcsaBEQEhpM3bYJjmMnRWEfL+HjCmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UDxXOLC611lPREsMFhbQSn0MZBze55pnfROetwE08Fu0jzAwkNjNDdCPz+e1128ol4UWvJGXG1BDXBtEt9ELZX4Sg3FWIxz9JK3cw8PAfR++S8X5gqKbOpNCNsOC1uLDfczUIVfVnrbT+otV4TC+j8Zbn3xd8lpVcBKZ3k7g8Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=PP9Ns7NP; arc=fail smtp.client-ip=40.107.20.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PP9Ns7NP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhGbYCFK/3+Aznh+d8rcAlIx4+kzRwtzF73tTpfNZ/85G47agcRGFLcu6YcxObYKx2OA3kaPJ6Or7sIzOmKqUJ19d2W82H9Aw9sm7Mo/Q9Gjp232xBsQ/Ml7Ky/xfdFyfICGonIU3zEJGqu8dU9IkzQIudTut1lvqqQ+kaozH1nTyKn/WlyTbYfIv1S2tbjF94P/RgThcNEyD3ro65KXBqTIxhJgYkTonNPWys16MYxk5hCQhknf4c49Hf1c+wZns7UIQjq+R06nU7HbOkkmg/KC5iW6pjWDp5D6IqUwXb33zVIMrZEHsJrMlRQma2RjyJLn5Us71lJiC9TwLbrEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+fo2QIM0t91raPvF7YzKK0xjhuWRprz8X1e5HtmUi4=;
 b=FVDTwMMesz3uwDz8IRFQQZ/7P9Bwht056mDtZkHBInjGW5QLHYd2nEpsqu8JjcNK0kzRYMPrroQ9sooUdVTWlZn1qghfQpBJQym8+bP/F0XEwQ23jTuOPcGbas/TlhS9D9z6Ibk907ASwY+1ZIy0bM6UNoDQZum30+K8fMFqz3kpLVMR2Fv/mps6W8QSo6M5W0644PFnV9cjuTDargS+wU6rZi8vYu+UtDMI/xqEsota/EmDIa8V3hsdERzLEW+CafqbK2htZILQzHtokCxxEVmbRQHAcg3LsrjD6xyN+PS9Ee7NHyTt0646169tQ7dYHhwvuXi3Epk9NTvKYcYZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+fo2QIM0t91raPvF7YzKK0xjhuWRprz8X1e5HtmUi4=;
 b=PP9Ns7NP+oG0Nqv5B9kraEASBQHwHHBX6dZoGEqOUqhNKygyWPEKgH6AORnDWbW5IGREv1ZPmMm4PzftG/QSSbFSk6w6jipP+PTMshEO19tXxidlwaWLNrklkIuhHDahV1wb2n2J/ljvsQzyJwYKdJgt/bAeX3fa9uOTsahIPE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 07:44:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 07:44:34 +0000
Date: Wed, 22 May 2024 15:43:08 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: core: Fix NULL module pointer assignment at
 card init
Message-ID: <20240522074308.jtnhjuwoz7dt7zvp@hippo>
References: <20240522070442.17786-1-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522070442.17786-1-tiwai@suse.de>
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 96292add-76fe-4c53-1b0a-08dc7a33060c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?63SMzOU4UfWx5sLyPeqDx2a2Ms1/iMoM/uqpvmQ/KPxXezfGdhCk9LwpgvIo?=
 =?us-ascii?Q?//Xcpss4bRAzxh1NOM4gySng35MjRanpjujE069dUezlOL+118kvJTHj9e5k?=
 =?us-ascii?Q?8Dz6JgzLBvlyFQ8C58aYddtOGhZgNu5VR4XDn3VeUYk8fIaixfKWAZPjQG+N?=
 =?us-ascii?Q?F68eLuEW1wWKSqhsTrMKDn7QmaJ1Xl5lRUcIUpnR6LYl7vnNd9jiMuzv08iC?=
 =?us-ascii?Q?Vggmv1kCQ7b9O9OVkjfKD9xdNpvFPoxvbGlKGRWS/K/kU9vEBX/gVFGLfMha?=
 =?us-ascii?Q?PvQjKQO8rPahG2mpTPq+ye+fc3wh4Ztw2xnxCOLypNtA1P42vk3v5+7Bnqc+?=
 =?us-ascii?Q?BDhabocKyRWvMB/QsBMHmX43hxNuBOJlDUCRRwMut8F3v+TXwCRaBOXE9ssB?=
 =?us-ascii?Q?gc3omXsV44oRxv0fSeZNwa9WZL6GrD7cB6L6C3lSF6G70pJ7P/dgKwSMMc0a?=
 =?us-ascii?Q?Fy0/xDbjdC9c6k0oEVw+iVT/jSmyrS75Eb73WCNO1E0ZxXzsWMPD8vh4mUoJ?=
 =?us-ascii?Q?Y/KZuQVcriyTiH//TsyXK6B/CcOgPK+Kf5KsA7sPp1f6Z1Yx3kbBgS7I3HRS?=
 =?us-ascii?Q?T3fz20i12hlfUjvNt/8NzkkNw5aoSD2GmOc5vJ1oyMVJsGwHqtix1h0uS7aD?=
 =?us-ascii?Q?Tcs4VJiVZRfQtIz+dRtFXU+pINjI3zzcpwbqkp+dqJVS/2/bm1B/PrLMP+lF?=
 =?us-ascii?Q?WI+Rp6e7qVpg8ci1cT9+XrnChGDTOLHWv/yt5bf7R/ZMaldXMmmz3jj9vNI1?=
 =?us-ascii?Q?oU7gtwol/HFCqjq2o050xW6rwCMCVbP1XuD9tqMAkC9+lgszJ99ZaNJndGI9?=
 =?us-ascii?Q?vehHXNg97Kco7kzpL6y8syllnamx73iDDz0RLMXzP4LDxMVV6hhUsVuItcLo?=
 =?us-ascii?Q?8CKtMbZIlalD4nctkmeuZS9NJPz6lImo4Bc/5H+7gL3FnCxQaym6QUuSzZec?=
 =?us-ascii?Q?KgMF6QTHOlFuLxGD81/CeEt1fsOr9+PXDiI47hCT5IQSYuUwEGpyvCf2rBui?=
 =?us-ascii?Q?r6LsTzd7kWQKR6uCf1pZyDENaK8g8RiOO0xPu4ferpuAsEAnq0QSm83mQA36?=
 =?us-ascii?Q?QK2wELZPRWMcM8h0fhnPImV+Pr9SRb53VCpA5J2ayFqUflTTCg/6xwTyQJBM?=
 =?us-ascii?Q?VMikw/6wKsg/bLhzYcNoBJliVbZn4Eu7f1ouMddmwKpETJIes8Lz0A6va+sP?=
 =?us-ascii?Q?btXk548usRSzp+ZoQX26bnWDtx9dRH7m/HGL4OYmUd6p7yVP/l8jpbUogkdu?=
 =?us-ascii?Q?95c/ib5WwYdWfNVSbGhLEEoelhbtCSsi2c1T91owpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xgM9zFiHl5BdJoksYZcP1u281aqoSmTcRrzS1XkTCzoBbZ/bLGZ+o1GU6LGq?=
 =?us-ascii?Q?m1Dp32ypxxk0B4LiFoc8OSajEkbdcCfPjSZ1hBRq657wQybvU5yoUwv/iSnv?=
 =?us-ascii?Q?lUPmPSSBAfkBj0ZpeUmTzHEn5vd1JpYFYOdH/KnxZvlRQ/jvDyfYMoj8ssbC?=
 =?us-ascii?Q?eZi/m4crHgU+4lO+AGE2iFk2Or63P8FpuXhKoZCEMKvup7cVxk8hPRxJgOEi?=
 =?us-ascii?Q?034L9tJOxH6zYP/sSUuUUIlDrURcxwOaw9Y0JeCJBKFZdsCrpgMy8/+suSfa?=
 =?us-ascii?Q?nUEr3R/LfYtL/nApkJdGCWgyep13/142aJzwC0WX7dFJ36Rbjis9xB/7H058?=
 =?us-ascii?Q?6LzEXWwweNgn5dF4/RWl/6ruVUMkLdxUVRugKMU4Mdb9yCygYwutkF+bxLjc?=
 =?us-ascii?Q?BV2mCH8rUCUeG/cA5iEHVrCbHF/ll/Al1q4XIy4/48xAefoIsr0kqzZhlcbT?=
 =?us-ascii?Q?dl3Cs10E7eArC5gmBPA8eG8V1FhpWR8cvHXqb47YEZYLRK0qh5uKtJ0Ll/uU?=
 =?us-ascii?Q?otgBV8e59rUhDF9RzYqUU5HDf4AykuNAe0J41UZ2nxesiw3lcI1SIHVNgTq+?=
 =?us-ascii?Q?1JQ6eB7QLYRlcaqUXHCvkE9MnAQiCBwGT8Ottnl/+s0kEG2pWBnJAXVCinYT?=
 =?us-ascii?Q?jcziqbdd6tWM3U06/ua3MSzQy0MfzzSQwcJQiC5UwGacYW6wRg0DP6zupbYM?=
 =?us-ascii?Q?MC0IIdv/EVO+juaqKkFuVyPPkuPLhVA+S8oBV6/x/MBg+UkgDDWXih+snky3?=
 =?us-ascii?Q?PuwqjjeBHpIg+k9luo9y83IXWz0MwJVCHbNxxJCg7yaUtuP2//Zqv8WdgAGn?=
 =?us-ascii?Q?AlZp/i2lb7+QtETkTr3lJ72qrnxthZKvSiaWlwDQwlZJMlcuR/GmU25wUBr+?=
 =?us-ascii?Q?kD6xc4833rvMWnUA32W3HyZdxQ504z53JTwMoan3JmK7qduwWCVD9xuDa4IL?=
 =?us-ascii?Q?YoAPO1Zt+dzfabCJGU9iCh2XxXFiPtQlwdcd3rLhNEibJnkvS0Icc4WyG2KJ?=
 =?us-ascii?Q?jCp68epSZTqga4L8pSqgGOFFrbOmxgG0jONDALFLzCrY0j7ZmEPzV7SOYIwd?=
 =?us-ascii?Q?HdJOB5Olk2rP/7VSc7aFHYlpaM/w/LGzZY3uK0iOLB+UcB87Ef/HCKXZKt7n?=
 =?us-ascii?Q?D+CmK2uMIUSDLKp3OGnbo6iUsni0wHYw9AfxRVKRZiwdGpwLYJsPMQ9e3AF5?=
 =?us-ascii?Q?mMO8ycr+x2I7eDWfZCzZbBquapdS7y7nKiheTcJKHNQNWhXCbPusbQ+l1j/b?=
 =?us-ascii?Q?YzPy2QOPb2ji+xBBONOPY81LV0lZor5gNUnJ8hF5ju7jjvVT0FdEPgOseEGd?=
 =?us-ascii?Q?i1sA+7pYYblj0+uc6wQPNViT7AwGbC9DauQr7HcFg0UY1HKCV+jcbGDkWHuA?=
 =?us-ascii?Q?uCk2VLXwn/p0qTSueIepkTzM+5MFm6duv0M227iQbTSBW3TElaYXf0mcCM0e?=
 =?us-ascii?Q?lKWBtEVRnlxkTfwydawd2Cu3YIDAWDRk9zofollpCU+0cjGHI/qTWg5aaWHB?=
 =?us-ascii?Q?H4wAd5LNgpUFA7Z/T+IPQNxkCVUgmsXO0gxs7IWx4nO0EcHv5bWzMPa9NXGa?=
 =?us-ascii?Q?N8bAw+bM2IAfWbVwmlyrdgUb84Ks+SZafX3ila2r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96292add-76fe-4c53-1b0a-08dc7a33060c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 07:44:34.4338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkVRIMH0HOIb05rDvpa5CyqRz7YTllMAp/cILpOsCLej45ZnUXOOX9fAA23CFi0LZEM/ZS0L96xjlleGOdnuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649

On Wed, May 22, 2024 at 09:04:39AM +0200, Takashi Iwai wrote:
> The commit 81033c6b584b ("ALSA: core: Warn on empty module")
> introduced a WARN_ON() for a NULL module pointer passed at snd_card
> object creation, and it also wraps the code around it with '#ifdef
> MODULE'.  This works in most cases, but the devils are always in
> details.  "MODULE" is defined when the target code (i.e. the sound
> core) is built as a module; but this doesn't mean that the caller is
> also built-in or not.  Namely, when only the sound core is built-in
> (CONFIG_SND=y) while the driver is a module (CONFIG_SND_USB_AUDIO=m),
> the passed module pointer is ignored even if it's non-NULL, and
> card->module remains as NULL.  This would result in the missing module
> reference up/down at the device open/close, leading to a race with the
> code execution after the module removal.
> 
> For addressing the bug, move the assignment of card->module again out
> of ifdef.  The WARN_ON() is still wrapped with ifdef because the
> module can be really NULL when all sound drivers are built-in.
> 
> Note that we keep 'ifdef MODULE' for WARN_ON(), otherwise it would
> lead to a false-positive NULL module check.  Admittedly it won't catch
> perfectly, i.e. no check is performed when CONFIG_SND=y.  But, it's no
> real problem as it's only for debugging, and the condition is pretty
> rare.
> 
> Fixes: 81033c6b584b ("ALSA: core: Warn on empty module")
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Closes: https://lore.kernel.org/r/20240520170349.2417900-1-xu.yang_2@nxp.com
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

For this patchset:
Tested-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> ---
>  sound/core/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> index 6b127864a1a3..ac072614d1ea 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -313,8 +313,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>  	card->number = idx;
>  #ifdef MODULE
>  	WARN_ON(!module);
> -	card->module = module;
>  #endif
> +	card->module = module;
>  	INIT_LIST_HEAD(&card->devices);
>  	init_rwsem(&card->controls_rwsem);
>  	rwlock_init(&card->ctl_files_rwlock);
> -- 
> 2.43.0
> 
