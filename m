Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6723DA7D4
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556112; cv=fail; b=sRQN2Rh6bq9uqQPQBHnlve4436cvjKPFWjr4lOmnu5S3lLZVtDMm5CtiVRIS2mPA29+MR1uH0mqS7VsuI3iUEq5UFKZo9CIEZ+l8zrpLdfJuwlCYC9e2iyyzi8LkrEcYMVePhV4axiD8RJ9BRokVOlcAoEKzinfi1GvZUjGtkFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556112; c=relaxed/simple;
	bh=L7ysGXbce6Bs+mL7lM2b9PWMKDDQ4mMgqB0xMuNl7vU=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=iN4Y15GsUvUGdgo6P2ZYwVOPJ+yHBjIpIwoeJH3HzmPmAdZD/u03umrsiMv/X5AC7akxTE0rKQpn+wcLQVkle6ZuUh9dcfpzwMBXGBHkITt5usAr7gKPYSxw/BE7enDfHkDZ1dk9ln+rZ0aw3UtMTcpJG0hsl8SjTQ/mpijPc5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tb3qe94+; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tb3qe94+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfOlgxKwzP9sg+vs0EaZniGypFjmP9VPRmXKdq17iCxL4NGXPE6ov+eEMIMIFe+U82ZhiWVQfO5/9j5fd4iAPxg2UtfN7QmQKGDHckh+XFQouEIlv5MYNI56cIWo83qYJZGrlxdUOoK1dELRbnep04u2rxddyr0tESF5bTfd2orGuofTEbLk4P4NU7Vo7FI5O4L6KFNswL/MoLUeNL5Qs6skv7HHO1Fnzdfa0onwX8Bb69nBzE9sRPWuyDRs86KfQa1v+Dk2v8qCt01gnIRLGdjvaDTjKy1CwcUjRyUMKJYv5u8seBZcKNhR2pb+4BaPZ5Hb1TpufQUyfFHcn09XJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgp7WVppBYHCiNSlx9zsgrVZOa4iltdAIB9nd5SyhzE=;
 b=AApBDUkSfTJZDXBMbOhddy2vf3uvW3nUAqE1Hx18uofgYZMX5YA1QkFRGeVCBkYa2Bq4hRWIQcG1sC+RxepvvAJttqeNoHhopwR9BV3tNZoZgw8sMOrA+mnq+OEsa0kOLTM0I09WkidRJvjQhZc7jW8EpM0kT187D5YRplwONs5hn8iF+bVHG7LYT3N0DdfXXY+qscq1wrABP8st7tcddjFmpp3zn07nYXlCHN1s9VTWz0umb7d6OBQ8R0TXJXZq1UHYWZURvlB1I/kvUE8vHLe7JkkWeK6a3r9Ux9VipRe+mDPOi7TZxa7GbrdIEVd/V7mZTyLflG5o+a5ci8H7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgp7WVppBYHCiNSlx9zsgrVZOa4iltdAIB9nd5SyhzE=;
 b=Tb3qe94+rF4KBSGgbh4exSsO7s1XNUv6td0ln2LLiPzo7QxFO05cRYIwud81Lx56oUFd6ZW6Fp7ZJwXyIdbSwO8SyDzwPUYhxtDVwxugBbHh0SVo9/iyUGabb4zLYQqDzWaycq8uQ19uQpD+aVdC46xJompzN9DUfohN2wIRaI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB12349.jpnprd01.prod.outlook.com (2603:1096:405:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:55:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:55:05 +0000
Message-ID: <87qzmm4wxj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>
Subject: Question about Intel skl_hda_dsp_generic.c
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Jun 2026 06:55:04 +0000
X-ClientProxiedBy: TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB12349:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2622d8-3f5d-4fdc-625f-08dec2063526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Zgjt+Aknj5Kmvze9Y+FglS737+SVY70VkMG0ARKRg1w5gsSgTatms83UQm7iO8DWXuCrAOKWNEWT9LA6U66VW+vuj6wVul+rtCfD4qtnsgjbiULX9LG8lgpXRDlrgM3Yqq/WtnJc6sRW0f6lxRwYHuyVx3gUYSRskp5CxZa3M5lRqdescuZZXsRPkeiVnWFQ06ZX8txU7MaRMmbV0f+KDBPOpvCF3aoswXbJ3XbbKB0TQ5hv4p0uH/hW0mA59hlI9BoxVA1lkDdx9Mj1+6wzzBH1nQm7/bGNOrcTXkxx9wzX0gbQbdSobiX8GF9UWCC9nFhnNVYSv/0oJ/4xU0VX+tNrGw502O543FF4/RAojfRmWkBeIIbaix9yIzB67JuG237VemIMcGZKjvegFAi2ExZ+BUXPMPwGU1U/aEvGsX/jUw53ZjTOazMZsrKFSoeSQeYEJx+RG9svilHdA0A22LEb4OGLq9OYeVuO+Rbm/AaF1K+c8LAvUjECFrPBTOjxeNXUAHozQvk714C0TtPu0EHo7jI4uoRdOyerInF8yBxoazjlJoGx39Uwy4iM3QMuYKcwqLvzVfENWL1I2fuw3uB/2NO8JUYoywIBDJ4Ngw3nHOJcTrEQdKzmsydIFb/+9PIFQSqAdKRnxa718hoHYri3gHzAbls2cdM1zoX1aJTq+lVjqemsR+MZR0Pny3XsHnUf4hccNpJhb7awNFeIINIQt4S72wmI554a4GvejRP4WyNVaE3pJMkb2viwAeqy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gODY+DOYmvCUhA/k09mZ8W8WzMTGeufFknAOtL+55dPMhV0kJ7WG4bAbJAh6?=
 =?us-ascii?Q?Rzelxm5xhn9iFHivvejT9I6vxhuD3Hij64WdK8M3dhj1pswxDG3CJ7WqPaE4?=
 =?us-ascii?Q?nk4l5RG3V6acplXbJ7KqHZcNrrwwb9B3Xn7v9ae7spzleswV0yJbLa5d0HQq?=
 =?us-ascii?Q?lAeyyzyvajREf3GhK0/0oymUvE8EDdNcot6O3zAdqWpH82kiN5K28mAn26h6?=
 =?us-ascii?Q?tt+ZGq9U1RECVodCLiYzNktADjb+rgJU9vofzTSqBZOuxQ+NLKxMN3jTBdMe?=
 =?us-ascii?Q?YR1kS6JACXqhSwY29mCdpy4/4BNCG8BqngM+WHOqRNXZp5I8czkNV+banhcw?=
 =?us-ascii?Q?rc1Iy+Zo7Cw8ma6nXVng1oyGWi3U7RfcFsk46zR8Gch71WCO//Mu3IqHWXDx?=
 =?us-ascii?Q?mY4bxPZrC8mbKnOS4OqKkVMfYvxQVdNdpT/sIKYB8Bgm+XBzXYTF3UdElzx5?=
 =?us-ascii?Q?CbpnAHY0UQY2FSAprFp89S9DL0YXT0dbccOX3EmW1dPpLKkgmJPjGTzW+FbX?=
 =?us-ascii?Q?HVumPdMYGVavkrgIVFWXRrOVUvhq0GZVrCSW0sByXpU3wW9li4Q73hhtIXXs?=
 =?us-ascii?Q?MaF0OZ9NzY+65fTqj4lCwS2t7468cG8DTvcYbN7EP23Foagn9mVnU3VN7lKQ?=
 =?us-ascii?Q?GjbUvsZMEFnM7lkmisLSL9uz/wwhyQqYTwTrywCmSk5GtZ2n4ucp6Z+3++HP?=
 =?us-ascii?Q?BBX4ccVWVXOhUtUKFiqg3bJpi12JLUnnTOfULWWEov8vi3QpChDRsBgSJQGj?=
 =?us-ascii?Q?e9Mb0fp6qZWae+eZU/UV+T8eW8livAukB92lPSxLGkx9yramr4no7iHHbnlX?=
 =?us-ascii?Q?EL7kpVhFH1eUcEP+hk2BSF534zRnJ3UdPDnSvFL8lVhlfCbfvb1Co20yzyUx?=
 =?us-ascii?Q?NZASHckleWH8Zzjkaqpmpb3ls+yG8JblAMVfJ6E5exi09iVjTwilw8qQL7RC?=
 =?us-ascii?Q?mLU0tjePnKjojfNYVex7hVAhMKA736Gbq38tdwJXva842vbr/D5LhcVxByxA?=
 =?us-ascii?Q?w3dWcOMLHDIqCi4pdUMuIehc07MM5GgqfKFrKL9EEV5g+NpbAapwVAU6Bzv1?=
 =?us-ascii?Q?3bNV8IImgfW5Y3CCupiWWpFZfBspRfFLeHKVZkQUQpB4CBckzESoUEM5kcHi?=
 =?us-ascii?Q?N+mHrawTIlBxsQMyulCVsWwfR+KuK7gsFdm9RiHLzKJI40w6xttghgCSgBEY?=
 =?us-ascii?Q?sgBmjZfh7iNe6jH4f9+xpVrflDZ+2Q+Y7y35yhVkEOOuIHeSDRUZ1kzBAFWX?=
 =?us-ascii?Q?APj7l5mnxNOEIPGwiybzXxRDbHbeUzmAnmc5+IrG3O2cgA/HM5mKVyl8S640?=
 =?us-ascii?Q?lxwYdzs1pidRtp/lJt0ZPkUNqB2RO9Jt7wGeDdvXyputztP+zzR4Kg1bvpYK?=
 =?us-ascii?Q?KHrcfDO3AZPcuNOShuuCqnOJOQK244cEaz9YVCQ1fLGEvft94tDHGKQjwr/V?=
 =?us-ascii?Q?zZF1RFsm5OzoSbOfDi7Vr9GSyqU34QFzJWWVVXoOQQleE81bTu/LlwbvmhMY?=
 =?us-ascii?Q?h7lFusEyumLoNbYMRUa6v8TGiTHGi/x0vvM9PK1D0NKkEaDleu3wrUAWHDh8?=
 =?us-ascii?Q?7jsMlcHDpSzyE9ZeXPLUz0U0uiZSRB+ADU9z7Lxf+Ea/zEB2I4/X7IROmpWz?=
 =?us-ascii?Q?54zeQcVCPI8hNLEemEbYiKO0yWw5MfKEcukBYh1PTI1Cf0XgKTiRvvJL7xI+?=
 =?us-ascii?Q?WTnL78xwMWKVnJIUooKFet1m6/WVm0NbVJu3OuPIespYM6R1+J/cNCQu31uK?=
 =?us-ascii?Q?Z4TQVBCs+0dEorhgfHeA+VMzwZX84Hc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2622d8-3f5d-4fdc-625f-08dec2063526
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:55:05.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5RiAuYg4oP5W7Mv30d0r4HDqJI63c4Cw1Pd4L4POBlmXVO4DugwzzWj7PvCLkzB8Xdx8KB0+w3unUQcgW/RG9OB+htRkARFGCl5yLE8H43yYaSoV/MGUtB2nV/64kki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12349


Hi ALSA ML, and Intel developers

I noticed that Intel skl_hda_dsp_generic is doing strange things.
It is calling cleanup function (B) when register Card (A) fails.
It is using for_each_card_rtds() loops (C) in (B).

(B)	static void skl_set_hda_codec_autosuspend_delay(...)
	{
		...
(C)		for_each_card_rtds(card, rtd) {
			...
		}
		...
	}

	static int skl_hda_audio_probe(...)
	{
		...
(A)		ret = devm_snd_soc_register_card(..., card);
		if (!ret)
(B)			skl_set_hda_codec_autosuspend_delay(card);
		...
	}

But, in case of Card register fails, I think Card doesn't have rtd.
Is this really needed operation ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
