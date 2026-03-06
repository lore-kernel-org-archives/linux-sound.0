Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4FA1E3DDE
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 00:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755329; cv=fail; b=A49fueOpwwvDGz2LX3i1jzbRqOekX217e2DSDcUbrNSN4I1VU/m0IU8dA9bcpNFlfQqzWYkb7CbWHOOeG+gVdxsXskAuEeVmYAMM7vi7smJz7M6EedEqPq/gCf49PXHxOjbgR5R8zEzjwbglkau40TH5ARjC/rbpUdkml4kq/qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755329; c=relaxed/simple;
	bh=wn/6XDG4w35C3NtrbTYk87LJLSguEJwEkM531KJL1xU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Pjj/wSM1AReh0ldpoNzx0gATf5TfIo+wHH/WBCw2exHWfj6uTN2WwpQzFLhb0WwlQcyqobMwt2iEPXHeSrAmMOZW3thQ7gvtve47BOdtW4OMNV6V5zRjJNO05+yyjMYMFrM1qpaBrZW1MqD1KOPMexgOTb2J8fSjVSso+rrlKNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cs0oljIL; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cs0oljIL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGvXeBmGtndWeTbgwdntsM7aHdXFmJvU8o/m2E4J/ZnInMd73f5BObxAIM/NY5Dd1YdvTW5xmMxOLCltTW+JdAE7whp+Y7cZ/Gzd4aetaHZgxxR8L16mAUYo7tudfFsL/4cFstyR7tA9sTVk/OdZb2vjy/RUio47GOMoq9e103xEljhRMNpVBtJ87bQtV25CXnIX+NNESK/M1jC5wigdk/MHI1wPvzpquOt6u7Eb2Ob35c3owfecd5QlUo3/yx5nFQhsZdlDFWjBunvhxdepshygISdp5T8zkG73oSZ7Bsyi67IYA2QliwuzeT8cQnLhw9VKNOhbLfgXk/WbBsWUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twXnPogPC/EY2qYU7GuqT7awuk83KwpYhDITNntCGYE=;
 b=rWb/g5eCLwg1rlkMqg8h8R5tujV05ycogHdf1csKJMW3egeGp600t/prgUsMbDnFXbGJnlky4mBd3LGBRWtOs1Cy6PwHkxMKz8KOFmPUy0WfNOLvGADUQRTy8eBGb9kZda+CiN4ZEBNhP1wNBmYjKe6wIOXnNHtvSKpiKxoo3NwduOYNYKKvdekydEUN1MTi0lvDrji+YPWbEvyGWbN/W+BBI9SKWgySkgi1kdv9KVhgkfeOXBP4vaBk05MlP/wmx421SELac6nYP2VaMtqVHP/cp+oQUMc01d/p7EySpb/bYVpRpbKqtA84nsHbWRlqWBJY3OhHdZxEQ57Ielzfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twXnPogPC/EY2qYU7GuqT7awuk83KwpYhDITNntCGYE=;
 b=Cs0oljILs23wuT0ONC7LwO78f4dYVngHpEQZldePJQNoClmrwV5SGbvSFpZk3z2v1MUX/F4f8YpW6fQkYQGxxan/7+ylZSoPKKdhe0I4KjhdikL4bfv/B+jilIxfa10wwy4F1nPIASFVFC9rPDUJeTmWKI/Dihz2fT7EiEzuJQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB11144.jpnprd01.prod.outlook.com (2603:1096:400:3f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 00:02:02 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 00:02:02 +0000
Message-ID: <87zf4lsu4m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-component: add missing #ifdef CONFIG_DEBUG_FS
In-Reply-To: <6a7e4e17-312d-4863-b66a-2a78fcb3d243@sirena.org.uk>
References: <878qc64wh9.wl-kuninori.morimoto.gx@renesas.com>
	<6a7e4e17-312d-4863-b66a-2a78fcb3d243@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 6 Mar 2026 00:02:02 +0000
X-ClientProxiedBy: OSTPR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:604:218::9) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB11144:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af405f0-29ac-4766-9f82-08de7b139873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	B4k4p/Gg04GjI9OOqxYFstQh5zrswzTTKr5g73bBm6h3zZeqn3oVSycv3tmW+Y27DQKHtLAAg5I8hfQjzgH+LhvWsLJgOEluHvozyaCtVYYmvl8EcLaX3ek3QhJiyvba3RJwrRDZDLIyYikz9UznglNCFZvEmNaPj0+QCsjtO8BmXF2Oz7iMVGuwMwZahEPedBFaj5DmPFXG53b1lTvyMzeHcOT2rThhsIe2Bb+36YkLoUffC842QdCJDnG3zRBJ/7WXI7dbQ0sy21b3XdlHjePpQF/0B3NG5iEaZ8pfWlAlxKJVOPMKG0SSOsuwkx5B9bnVaxVHsoha/qSQcbp10yLQUVx1D3JNbG+zHDyQGuc1g2vVi7hNYUSXV6Dy9SUTGdxWrbliXZy6Yj8rCSC5oDSsQQUczL8ug+DdIhLoxKIxzpiWc+7mTVC4hYDZw6HWg0+2CIbNeTvkT6vwgGRcOvSE9PHuRotzxw//jW0mDTW5O+EGBpnrTqh8hWiw1te8C5Kgqe0kJX+FvLoeq71kLdL1pCW8lypMuVYgZziwHG0TJUpaWfwG7BSc369GPGzl67VGD5hYnuB08+X11Ao6x7nAE9U1gm/qqrlV2XRbsmC1QUIFGq1WAy0X+Jp2zn3SQOGwlo5ZOt5Ma8CvOiFceYx6xdI5lDu94ueJtiM/68UW3oCWVJFBXOYVTfAfuaxZxVTNmg9pTHV7tEXsg72Z54LG/J78uVSgoOCaQpUgo0Pit7Nj+NzHgBmB9xSh0AC/qzOCASkiAPnAas8S+XU/ItOrpZMc7hvlw3rCl7X9LO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vpC1AEZHRL/MAPDq8r2g+I4o9n+1TgHJtt8gujz6RUTfcyY4FS5Uk5uatf/p?=
 =?us-ascii?Q?Xei6iTULpsH5HoDMgIqPlxchgNxNu9wQrnzRyM8qFJsiCbDk8b0Ohb7leXOm?=
 =?us-ascii?Q?UEieckw4mE/sueaBRs7/fWVFzIanwZfOAzb1jEuWedpwzI0VSr6l/+7ErOxE?=
 =?us-ascii?Q?lhVo/i3lUV/xlyf1/cnAoa4txsRREzrPfCHVdbQ2+Zy7nMuD+5bkKG87l6Um?=
 =?us-ascii?Q?M7nODYC08DjejUQV8IVoUelajgBVcgwNU21jE6USWx9smC2O32Yby7xRualN?=
 =?us-ascii?Q?8SDSkTKfHoinMjMfGOpdyLAOn3IaPY9z0rKzW/HfwPvKw4gevLKp8iUYQU17?=
 =?us-ascii?Q?htNVH9FfTUeNJM0Z1YdaTB8uX1PfrtjaKWD1RVIp8A9EDKI6aRCYXje0knnc?=
 =?us-ascii?Q?TCJnas8JuJjQe062DsWGOA08Ev/u66JauuVZQPfg0UpjLOOtgGN9gNJtH4S6?=
 =?us-ascii?Q?sy/fWhIlXn7QxeDHMd+Z3Ehciw+NiiLnuFYzEQvCVLKf0RLr3CUwqf2sctxV?=
 =?us-ascii?Q?myJrjzPdZvOfnUd/CYhdz5ykt86FVKnwTkK4W3te3J53p5GcG8NA8ufVzKQo?=
 =?us-ascii?Q?uDHmPcGzv69s9+lPxjqktyXQdGPbY4/VFoboqieB2AEY95ciXy0qE9xM7Oti?=
 =?us-ascii?Q?IewIC+ILB94vMM17idMVStIHhGukX+QSCFmhi/i75k9mUkDckmQMIpGwKbM/?=
 =?us-ascii?Q?nRwPsFeFS6nn/sC4FPeyIjrzyWlxJXjy5JNSMIMCj9laIqru1lxX9VhPips6?=
 =?us-ascii?Q?VIRxom1RVihxY0pasTQ0WlBBwJq1PZgfcCC6eCd7p1KnAYeSOntII5osR6KI?=
 =?us-ascii?Q?UGgK8iAJJK+NEO+1tScymd1o7g5YsHRQfzVNbRogbxDJYAfL0hkNYKWz9xXh?=
 =?us-ascii?Q?1aJERHxEY4XR48UNSaeuYawj8MBuoKq4hD/e8BiuRsaZBICVHAtY9BMpK5iv?=
 =?us-ascii?Q?gQdyRfZ6AatJassiJ67uuGTHuGPJUkw9Ls8FvTkmf5TjHN7282WhGkz0Aa/c?=
 =?us-ascii?Q?ZUeeQWj7kjj1fi4DHZENTPnTS+KWIY4XJkE7ND0a3WOaLCWu9u6YOIWPnLDb?=
 =?us-ascii?Q?fH7y0/GwgADCuF4vZ3oPulq00L8aUSw9IC63By4sNu7e5lcMVvHbnUPHW0Ok?=
 =?us-ascii?Q?OpAgVFQjLtB8liFeRP2BedUAVGHOoT16oP+RIJ2NHugWbZ0D54MegtDlGFi/?=
 =?us-ascii?Q?FACdz64v6e4ffRCc/pDXzCO2wjSqzjTqf7BEC9J/LBpAtkcKzO9nrjtAqzBY?=
 =?us-ascii?Q?VWXjrJXWjzRVhpdeXZE3VsIn2nHjJFIbptc29wEttir4EGWeqm9unDFS1hHZ?=
 =?us-ascii?Q?1expEcfqpdjH7kJQUVRwnN2UIXhUmZZr4MTSl9Dodm7xfRUUGmtiXX52nofw?=
 =?us-ascii?Q?zhf1Yt3N0P1NuyYp5rBZx5sdk3x9wGj4KCPs9CTYxC+OU3hwO7PtDMjUJM3v?=
 =?us-ascii?Q?0a/iER2DRGKJIBBRtAxA8qjrJURkX7QL/8mPeORbKDUa1CDyOUsudQx3UjD7?=
 =?us-ascii?Q?IhaCCkTHojrkjKwDIMM5/IaSkr/zu7UEV/c12sYC7I+xz57yRBPOk6PjZJiQ?=
 =?us-ascii?Q?EyA5bQQA+qEPsR+nHwG4kOfXNf4I1oaDQsURPXtWYgI+DEGKKnFzezEZvb5I?=
 =?us-ascii?Q?ue/HNo2+TbSd3tasAqEagd0KJnVWdD/eaFMu98ZHbQcPxdlkLo+/vj7UfPt1?=
 =?us-ascii?Q?TgNVveJy3V0uWdKGCzFY1n2Kuh/BuHNscAWaYBzqltks9zPVDVQU1kvEMqFh?=
 =?us-ascii?Q?+snIgdSH3Kd1rJRqfk9W6fVuJzuWNot3edKlbczIUNkX83Ur6QP+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af405f0-29ac-4766-9f82-08de7b139873
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:02:02.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71TOSCudzM31lY2Jp/7URyMb3v9XPuXo+EqK9pai22AvVMTPgX5a8RPZ5pjXG7wfjS5YJtPut7vDq6i6Xp7kixVf73NPb0HtIhA34GT1UGZtgtZAwlKQM/tvnmJCun7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11144


Hi Mark

> > +#ifdef CONFIG_DEBUG_FS
> >  	struct dentry *debugfs_root;
> >  	const char *debugfs_prefix;
> > +#endif
> 
> It looks like this breaks the build for at least avs_component_probe()
> and wm_adsp2_component_probe(), they don't have ifdefs (I didn't
> actually try building).  ISTR we decided at some point that it was
> cleaner to not have ifdefs in the users but perhaps that could use
> revisiting.

Ah, OK. thank you for your feedback.
OK, let's skip it. Not a big deal.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
