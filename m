Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701823EBF14
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 00:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769991632; cv=fail; b=nqzdpoFhvcnY/Q2HuFY2UvDUYJtJAtgA7FuQX3DBYrZLXJY2BJE+AcpgENFRGbVgHDuAMoxp2RmbAuaJk9UEz18LHqy4XC3xFVHeC1E133+3b14i2pmLYiV3i8aXhNrpGX/8tmXnLQotvREepTao9tkKp8CeB4Fz8EM0iSX1gGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769991632; c=relaxed/simple;
	bh=Bh5wphGm50Bf0iXsOr9Te087e2rpOiValwpD+JYmDxk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DJRly49cHZVYGZROA04F4eB7/8HCk6CkcX+u+NsXoWb9cggUU/FoNBLpo8ynX+rnusKto+r0tt0IftEoiSFngTzPxAOzmOORvzylaN8IRCIl7m+2PgwHy2TAtXx77jiWZ3Ieip3HlMZjkqki4eBlOdcHVnrcVPhslLMVtzkmxkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ACNsndF3; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ACNsndF3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRzVRTbyIcNLT59/Wd7xjylK+H2JlJuJlDBeW6eRl2Vh7HB7IK0xVaCzDigwviL91iVrbME1YQ89D9CWTxBpI7gi+0w4Dy8x31BP3SKzV355iWkRs1q4yDjAJG/0EC9eCCLdCe3WwpwqBTXBmHV33jD8puzD1vc+r2Glj7dz3Jw4fo7p6NHBQEGf409bLeOvYsRYYRhYZyLFiiPWcFb0VdPZZVXjQIMttN8n5MQYz+AQk3jWLnhBodvZgOpPcqiyWuAwLqt22K8ErLbssedp25iG1C/4+yLqXv1mUDBkX6cuKS4VVDx45j7E6Pgu42XPh/BZZcrYFQpactHeqxNfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aZ9YQKWqIXHII0Tc8+zQlSRclz8eDVr12kHuvC+G6M=;
 b=wYBcb9KX2s0mxNMiDWAEoNlfT0m6rseLwOANcPwl/xPjoYERiC9ff/msM3v9GlMQ48SRMY/TJPbo64ESj/7t9YKR15vtdo2uQeVOSuDH0/9y65bkZYzWijzQkAH4dJwDqdMc+iwAm4MnImwR4kWUDf0cKgLFBqEKdK6S26+FfmRwnmcu3fRCKzWdqZjrKUv4T7aK8rau6Q2sXyoPrFMQSyixYkkd1m7KA7SY0zQLxvwtF4GIdVsd84/xE8X+HvTOUwG0ZtvydfXyegeXfv4LuuELlWW2awjnVZnwe8qDdcXdNL2io2/MnLULLP085CHa2cTY8XuiMWrkBwVjI9gKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aZ9YQKWqIXHII0Tc8+zQlSRclz8eDVr12kHuvC+G6M=;
 b=ACNsndF3/nYm/rsxJ01fKcnPaatoc80pDKppPjQs/QEt62otEglEuhUq3zGvMjzO1ynbOnWYPhDLyNBgwYGe3Y/qY02c4fsz81DYFFVkKZL5dEsdEyB1jsMwwGACg7csMrorNlVz6CWYaoGkr24KuSmEg5qXc58nrI/ZP8pUGws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSCPR01MB15927.jpnprd01.prod.outlook.com (2603:1096:604:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 00:20:26 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 00:20:26 +0000
Message-ID: <87ikcgatdi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <20260130135541.115574-1-cezary.rojewski@intel.com>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 2 Feb 2026 00:20:26 +0000
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSCPR01MB15927:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ef661a-ec56-49bd-9e7c-08de61f0dd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ks9GEcoXlhRiRYEG1nC/aFL3DMrrShHf9FQgGbzdZ2wvKpuZQOigCpHqxvr?=
 =?us-ascii?Q?Rp9jy3uw4tPN0LfyQLkYtxI8wFNGwkLGomE2IH2c1GtVvsyQgGBZWmOtvTV2?=
 =?us-ascii?Q?oHh4XaRyI0Jhw4ZH4DEqBYOkpCi2Yk2BgLiYUmF7iZElf/4xTdvi6uwu4eIz?=
 =?us-ascii?Q?41DN8P2VQktdk2MJKdLOwGGUrxKZLkkeHivtBInJ+KLG/RV2ZdJnHxsiS25O?=
 =?us-ascii?Q?pxVi9QM3s0CNmI93NUE2Vncj71zKxTtGeeYBweaYLOBRfKQiLtpgxlOXWS0B?=
 =?us-ascii?Q?vKynEzCAPDUf6NJETyfLbV2uVlPsZOwFiUzCSLmDCZ2r+mQLY9HVjnIJFQbz?=
 =?us-ascii?Q?c1+Fsc2qcL64Y8wwo5WprBlTDNktRDmUKMzbU89C2OI0Z69sxBVv2Bm1dF5d?=
 =?us-ascii?Q?MVuE75l01Ju7hxZYw2/injzKh8H6V0ovxymWnHhQy3PIx3YsuRITgpX0ufLP?=
 =?us-ascii?Q?BKd4LTxCqy+wJHfhlll7G0+ULECCpjpbp35nmXENXsFbrAzBMWb508HGSUA/?=
 =?us-ascii?Q?E1yGZ3LLvRShpl0Dm4MJCD2N0eG4AXpjIcgtA3mNb4qwXTCrkxYZG+GsGBOa?=
 =?us-ascii?Q?c7uyiRcn+ceNUcYrEsyvzZKqnmRU6hLkXWMr1RM0QhRvf5Cc3LtIayNHGS+L?=
 =?us-ascii?Q?K++2N4xPNM1UWfLeIyjkYcdlIQROB/zovuvQ7cvAREKXfPlQ0ps/ihsLO+1D?=
 =?us-ascii?Q?s9vIfGnpwhe7NLChqxyAfbnMU5iCYaMBwvkxD0JMkEPOtg4JYNy3a/n6t6FY?=
 =?us-ascii?Q?NjsW5AGUDurf/zZjXJnhUGYAtovyM25opKxWJ+ria15rjQjAmvPf4Z5RnNSa?=
 =?us-ascii?Q?CVSjiaGwTVa0Y9iZ96kCwMTxBOaIk0Cad/q1sFZwH6ooMnuDrNiv6ixVu2w3?=
 =?us-ascii?Q?dqB/xpx6mJuZ7qiVsHp/K/981EIgDaOgslkDiSaV4SggaxAymppAGIrSw3xu?=
 =?us-ascii?Q?bMo9D4t+83YL8kP4UF9PjL5jxMbaZKXJ6QGD6qySEYYX0z7lmat2ov60moFt?=
 =?us-ascii?Q?o7B5yLX2UmHpjp89Cj1gYvMOMxF+SmReP33Z4A4ti8/dpU0d/XfD/gfUUw+E?=
 =?us-ascii?Q?WUXDKeGI2djAokGgRJHhcPbMQffv/1/V2kG03r58KKfE8zEru9Evs8XxMyiB?=
 =?us-ascii?Q?GN1fc+zg3daVRSNb7cEvl9vYpRDvhISfsO/SImxO0qT2p7eW0bEhxltMLn9Y?=
 =?us-ascii?Q?EMH8RGLdO/3Nq3BHEqIPnNJGAzgKhJ4wQSDbnqYU90qPNnYGFDmWRaSK8Vdn?=
 =?us-ascii?Q?SSZmPBbGYlWC8SQ/HaJ+twYLSzIRDxzLRBRO6fP85hTsVC2b95rzXC0IdogC?=
 =?us-ascii?Q?xJMyoxpdeqB95vWvelENwbm7UZPHpuLW7pGvkSCOVbTOhCQC7Icb+n0PD6Xk?=
 =?us-ascii?Q?RlSvE5joeIabX4zW8J0+3SA+QM4VoGw3WBM3+flzhLIgCyL3y1u4XPrIexeS?=
 =?us-ascii?Q?86X5VUeD7mOH0coHgaqVLYEqPtHY65qPu9wKGe0x+UwU70iPlvBfYDXOSVrR?=
 =?us-ascii?Q?ZcAHKb3zKV0IrMwHHBbKDu48aCuUgFb4G+dcrjR502YOKZrB65zd1Sp/c+Di?=
 =?us-ascii?Q?t9vLfHir6F/cJ1Ajp4+aQQ7Hp1Xb7kf4Usuhq4iHtAAU1/CeLAZsgwvZ1ON2?=
 =?us-ascii?Q?MwY/8GogtwDQzWr8G/YvcCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Z5Z6H0DDISQb7y71Gu6cBTCn+XNHnHfryEtoKDyS3Jizw7UOj/9LfPZhId9?=
 =?us-ascii?Q?/j/3nvwoKWSarVVOgvnqyS/Xh79d5JDYXz3mqhQucsrcjEcU9BX24XDvyc4l?=
 =?us-ascii?Q?9OaHuvoLsGrEBEJ2bUQnpCAk2xhLxbjYdajA1XKZpxRU4YRmct5tZuuqZ0+Y?=
 =?us-ascii?Q?mQIKr9NGXzdVhV6mmM7gMZgV3hT4SGjiNOv/I0HDt21TsVa8ckcT+B+XPF/g?=
 =?us-ascii?Q?cj7giu9BSlXZXEAOklK/dTSyQJxsUC0FAYI3HkoEL/2LlPK+Nwp6a0uKIdvq?=
 =?us-ascii?Q?2rpN+OYAer7tuWzYOcSloQRP2SnUnEHjL0Tj9lE60T0kCSnZUPpGs8WietWQ?=
 =?us-ascii?Q?neI4OoUWjmOSnc6psOpj2KsPirzX8jNXCzbCBkRqzfLKiKN4rWeIg/xHAnKI?=
 =?us-ascii?Q?MOizDE6H1iVd3ZNHTqgai8zVGt6Exf3kVFhXwiCUfY9Q/lwyiQJAZ69d56sX?=
 =?us-ascii?Q?yoR0AfNlYnSeeU2AuIJgd6PyNvOJ1h8okjwFpH0rFTQFWMkLa7EVBU3MbvPZ?=
 =?us-ascii?Q?kEVZ7m/UA41nZzNksKZsw/Q98suKcECQlkaYcVtyMMx9F6E3DiXR70ue8Vr3?=
 =?us-ascii?Q?DksAmzm5L1Yt3faQnlG9//IhJY/nHbjqmfID/yAzsPM33jhkIGKqFs/Sssvb?=
 =?us-ascii?Q?0KG9A2UbiK8jwxuU5eLeoK8qSTIJvMbsVDTAw2J1KktKpDK8GkKrulXMEbtl?=
 =?us-ascii?Q?wJk7V2xPxAcObsmK6gSIDR0ZwFcFQWliSJwrNbiabFet9KvRrwb6MyqBLwFK?=
 =?us-ascii?Q?2kpm1sLWNgIILpW22EpMjxtkrkU7FwGRCalNqiZpUWWql6CNhjETNPur/an5?=
 =?us-ascii?Q?MyGARcew0hTFgTrY5CW+CllgvIEptEvlliPJO/XXKD5SH7ral54ubisSn1DK?=
 =?us-ascii?Q?I3zV62/I5oi4DS2sIgXr9WB0gmUdKSDstAzDNDct8UTQALDmbQspIGVYQL0o?=
 =?us-ascii?Q?5DTJUsaAoVz8tEdk0xsFiyAi1mK1fstCSzc67dPRyYytiv3yM5o19aTZp1Cn?=
 =?us-ascii?Q?rFhyEF6QatjNQn3bO3ybW9tgE5EeFpdZNVBUrbaILcmb2YspwAR+p6r0Z7os?=
 =?us-ascii?Q?ixuIcpCbItdIxOCrJ7XjgMzqQ8+J3+jyEuPorD5E3X/IwWHKpHBaL7Ejt6Ie?=
 =?us-ascii?Q?egcyQ5kUNIw6aX7hv61+7TJP5KjX7QkqVoLExWnkLr6r/4uvZu8iYSn7LC5M?=
 =?us-ascii?Q?mFlyxsA5w27hn55woEJQSakgri5bmNIjF7FBxg6VgFXRjdqRS9M8zLPFqgDc?=
 =?us-ascii?Q?khkoqPZXKQm7232RvPCtp1LERkVrL9quR/42e+vgGpk19pqgzy/yRNQO5bkf?=
 =?us-ascii?Q?WK6yvNBV2XrtLYFYWSXc5zSHnTe2Nd/maLqeNpbntY8WIDoXY/c/rbbuRjtc?=
 =?us-ascii?Q?AiVHVDaR+wAc2iuaKkLzGyth62qbuxEINNEfw3CNiCfqAEtBXySfxA+SlY2Y?=
 =?us-ascii?Q?e165glLSKPAU6JRJ5SL9NWAgx81D9jKWO4o5ogiqKFbstmFsd+LJkD15SYac?=
 =?us-ascii?Q?0iqnZWLW8mLqPvAbrGgfMbwknEw0aWtQLMoH43E31kKqNUR5CMPsw0B3Pso7?=
 =?us-ascii?Q?sWMYE2tAbWdXTZnvM/8R75iRmEoXe8RYCsTwcTj6mg6ALH4j0dSoLSaveuft?=
 =?us-ascii?Q?eP3Sjw9QzEVMF3mqCgh5kEqZpfs+CPTgwnrrt0jPEPjnvU5K+g5tTKYswNl+?=
 =?us-ascii?Q?cRQIorm/wPhaoJsM1/XH1w1PmZV80Euz//O2htzRq/G+SKVvmjFHeYhPv2OI?=
 =?us-ascii?Q?Foej/Ua7qe2bub+fmqqQl5aLy8Bslx19crG4JCuaM0KID0U5QHB5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ef661a-ec56-49bd-9e7c-08de61f0dd11
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 00:20:26.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JqEwGMx+nfe1Otrcdr/i0FHK5N/Rd4ftu+2EdUIuqqMd3xxetNQMaVruBnlAG94bLi5j81LsmUyHPPRl00oimHsafmFj+OIgRVPyvXriDw8XTrIgDDDCnBFmds6/SWg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15927


Hi Cezary

> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
> 
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
(snip)
> +__maybe_unused
> +static int snd_ctl_write_verify(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control)
> +{
> +	struct snd_ctl_elem_value original;
> +	int ret, retcmp;
> +
> +	ret = kctl->get(kctl, &original);
> +	if (ret)
> +		return ret;
> +
> +	ret = kctl->put(kctl, control);
> +	if (ret < 0)
> +		return ret;
> +
> +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
> +			sizeof(original.value.bytes.data[0]));
> +	if (retcmp)
> +		retcmp = 1;
> +
> +	if (retcmp == ret)
> +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
> +	else
> +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
> +	return ret;
> +}

I think this is easy to read ?

	static int snd_kctl_put(...)
	{
		if (IS_ENABLED(CONFIG_SND_CTL_DEBUG)) {
			/* Code with verification */
		} else {
			/* Code without verification */
		}
		return ret;
	}

	...

	if (!result)
-		result = kctl->put(...);
+		result = snd_kctl_put(...);


Thank you for your help !!

Best regards
---
Kuninori Morimoto
