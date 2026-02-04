Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE520DD51
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 06:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186002; cv=fail; b=dwIPt0G6tpXiv1MWApLopZRyW8q1dCyiWN3vtxqfEM1gWZuBLeYgSgnaS19+rKP2Yt7kMosd0FcegmBq8J8BMkd6S5TWe5ivR6NUdEH5Agh2VhuccnuYYR4bv7aVXWVgUCTVcsOuBeL0mrDCrc6KjvTm4+NISX3SQmwDOLPkOtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186002; c=relaxed/simple;
	bh=oYud2zw3vQtI1zAGQHYwaTRYqP+yV6dL6irm4HtVnMw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ldl8pQ8BaF2Y0x5FdDt7vaI/oX7PWEP3aIZ+lJw41GYSdld7orNoMhG7ha6KANE+igs7k3Tq0IMiq03vqIBur73oAZburCKeXkdcyK5U+0gw15q6dXgPWbRPgwsDWI0PEUzjPriXXyIhiJ+CBOOsixdkn0IHf6gUb1BLgh+Fj9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q6iYWdd9; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q6iYWdd9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkLBU5XaLb58VSL+cy0B9rGL06e5bSI7rO4pomSle91XZ+cu4JZW/3zThS3rh92AajX9lQJqxcAtA4OKwfYdzxi8ele5ATKjV8WFXwfX/8FmELnPLxaeSGSc7Y7gbJqC0l5pVzKainrO0zKwuFKQWfedBpsHEoFI1Zs/FWA1zMJNS1NbaML3kwsE6zxZ+JM23U7Y9lB1v0s2O4mXody+YqxV+ezXupv31ErP5861VgE1VZ0eqtIIpHIBEWRpbK9ce0Gl9Ca9qDETrV5VsfZdpr+zDDNdf4aHbsxSQWbJ7rJMseQ9Gat1OIsFkfd5qDLpJB8NaFt7jxfiORmRHpAWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2utJM9z6xVbZGwEnki7Bu8eTx+jmr+8yMILwtrZ02zc=;
 b=SYFpCdodl/K6ihLML7POMuoChincefxydLrDKVnEx93o3ykbvLGj/32vU96MCkm4DQ9UaeCkAxy+Xle0O+YbF9hFsUEwjV/k+cREvvmGcKKZXg5yex7lJj0AUtk1Jdh1DEedsRh03tYJt5aJq7+iiaeMao4VeaMTEzwe8WPbZUU7xZ7Av/yNKBbqZz8wf4mLyTrYskDS7X4HsfXmytd0RMPbhFazQF+ljVt1UrSrYXfZXgrQgjkcaBpdamQGyluKW8yukz+Q3+pj001g3BLWtEZbhM9bVFCMfys+/rprO6gMkIjz0tONkX2jG6KH/izGWML+RBHjvp24bHQ+PcM1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2utJM9z6xVbZGwEnki7Bu8eTx+jmr+8yMILwtrZ02zc=;
 b=Q6iYWdd9fEsdcBmjD+XlmK4GDVrcGy6l+nNPs2xh2SqEaBLMWlUn+iq+A/tsc3VKMMIkLLRAw+A58OXcXDYcj75LIe8uETvNprl+GbD956KqBNdiS+A+/w3/DKdA5aE4xNALmxYKBQI9WP5tx1UzECAL1R2ytG/7kp5+7+JycCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS7PR01MB17903.jpnprd01.prod.outlook.com (2603:1096:604:443::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 06:19:59 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 06:19:59 +0000
Message-ID: <87zf5pf2sx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
In-Reply-To: <cbe68c20-1a06-472b-ad18-0dda301e42c9@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
	<aX4D1VodQ8Ksrad6@sirena.co.uk>
	<87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
	<505b8820-9ced-4554-80f9-de0409859dde@linux.dev>
	<cbe68c20-1a06-472b-ad18-0dda301e42c9@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Feb 2026 06:19:58 +0000
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS7PR01MB17903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9e96c6-6c5f-4cbe-df53-08de63b56c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SEwfPATT8vfeGF0nc/YIuTLs4Rhm3NmsrOr/l1s1hrHKiN9MVUJ9++Bj/26q?=
 =?us-ascii?Q?3QsisgxqO8cNmEcP13XZ7CzP22Jc33uGEmJVpzimT1Hx2L7P8hM+avRzdKUL?=
 =?us-ascii?Q?JhK+Yjm4s6m9PcZLFvNuCZK9t81H5NsnkHYKQ/0/RPkWzbiQfuDJONrhScL7?=
 =?us-ascii?Q?sglt4+7fUeLcmoywuTCPzGkJvYP2A1nByVrMEpZPEXXFSwui+LfELXjxwthA?=
 =?us-ascii?Q?inshg+AVu3XnJlpKD6MzW9lVOKhOwJ3dl9NK3P5W3les2os/XPKn6FSyJEQN?=
 =?us-ascii?Q?aO2eXYjaja7il0W1qWm3EZ1d34+yQRqrCXjdJ7XUSKFtMyW80cYavLp6mjmN?=
 =?us-ascii?Q?3SHP5FrG0PIGTITvYPCnH6erieSxFmme5q8d9P974Ja7a15rUT1WIKxFQLAM?=
 =?us-ascii?Q?Qnrp57WWBI9G8DufECUrcIv6Ue8WmiZQOebDMjWq9Lx3wIYxauaiorNA/8hc?=
 =?us-ascii?Q?sisqwqrR8/XxqiqxCY2RV2+9VHDIRQQwKUk7Kzz2zpVx23BH4mMjWzlD7fQ0?=
 =?us-ascii?Q?lFVGZb9aD2Ef1x5BkvHJutqhbT2y065OVABAfn2dsEG8bohzbGqXKs6CXbWE?=
 =?us-ascii?Q?M98orP79Gl5mnOf310PDZEu4e1AiPrl9xf9HYIIg4nrwGMAAGQwE4nGLaIKQ?=
 =?us-ascii?Q?WSSi8AiF/tzUqiZBp8klf+sp59ZIJgclcdwZenvyiq544nSYaZur2uSmaRw8?=
 =?us-ascii?Q?WqDn+d93JlpQvInxYMAXGKy1Z4Iq7LbeX0YU0Bz4AD0nsVJDM78NQ24IOWGu?=
 =?us-ascii?Q?VYegngySq5EdKkCiIlt36Z5wphPwWtazAr+wqG2xEg0VK3kuEkWFATASjhXj?=
 =?us-ascii?Q?nz7+CSiSnBvlWkUGV50+mLuS+6kjk8Vk9T+X1P2OAxZvSjJoDronrZucafD2?=
 =?us-ascii?Q?nv4hd4oC7wfYNQ6d4SOon/9dTRSRoONAskANwRKSvNwkiSrAN4LOEuWi+Gk3?=
 =?us-ascii?Q?wu4GQfLjGfQGuJVgPZ5rlfQqy41u/LN59y9vmdG+nVcKChi1p8jBl+3xkqyR?=
 =?us-ascii?Q?29Sojlodp3r7hm9227pG8yvwets4ZyIAA2s0KSVRIvnd251XFJkJW3/EP6fR?=
 =?us-ascii?Q?F0gKMgfsh0uDNO2F9g6MjGpi6Rur/15MdSSiVQ88UORn+haiFL3mWYirLdHJ?=
 =?us-ascii?Q?uO9o3Ten+aaDns1WX1n1m2AkpNHxVqg28gUqu8xhxOuomSE4S2Fhi4eBoyqd?=
 =?us-ascii?Q?jGO9asB3Mgf0M9qiXJ2GA9Ej+PnWWjq5zJsmMIKsVRkk03nTiA60mKY8eTdb?=
 =?us-ascii?Q?Yi9Mi6xctLeVk2gPOvZq4wPcy/zC/6FN/tjHx9EB/ximqjkGRUal/rBxkKHw?=
 =?us-ascii?Q?ylv4widkySqs08M92oQtrv7ZbGkxRo30YGykyCWGIg7nJnqW6P4HZsCoQzJD?=
 =?us-ascii?Q?NhEzl1DLkYai7lq6yoZ3UcO2MFXrqafyflMXjvHoY5jrhvTJ9AvPuo3QzweC?=
 =?us-ascii?Q?lOd9uLQrkQplgTH94SUvmGZPj1ZERRirM29+E4hl7WZtmC/hON5wbye0p2f+?=
 =?us-ascii?Q?EKEbGFsAV32o1TkoEZy+2cWVG3aaTMylzOU7vKKCn73M8hB4mH+5kmp/4vFA?=
 =?us-ascii?Q?or6UkxzrpPA/5ZEaqtxqUOe0Hhr0guJwgit6Xi3jYZbCWuv6KzCMjmEPdfYF?=
 =?us-ascii?Q?Z2jt1J3SRHxZQB/GY4dnm5M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MqavtriK7geKG1t4mfA9MTbfKXg+EYkg5nHFE9VsBA7kdIeWMTxy3yQ4jgk9?=
 =?us-ascii?Q?+giGEVPkdCbZBEdmnLDRFGU5T1BVC7Sx5kAHQFHuIEnf1haviB77s28DF2Ao?=
 =?us-ascii?Q?y7l9nzfUTY3GqIzNh8NDiui1ROqqQDAkvCatKD50GkhBrqnGsMznQLggDZV8?=
 =?us-ascii?Q?kZMOcYUwI3ANlJ1Y2QnmAyBgRyRNzVWwX5I0SEe2legUR8R8hm8KxfwLDgSY?=
 =?us-ascii?Q?wIjrTkLDqC1gaGrVerxNEyqdb8QBuVScpbUq8w84QiUFQVrrpBy3qwYaxVeV?=
 =?us-ascii?Q?Uxy9EIY4D1e0RKQErwpY1yN6olng/VVE7JiF8uPmXn168ukuRMg2CvrUFbbf?=
 =?us-ascii?Q?coDFuHY+kdRsh45LR+NO8H6+Zr4WJPhb/tAivZQYVpNlwR4mogO6uEDpHKj7?=
 =?us-ascii?Q?BOiLhAsvp+YUSu87k9/VUsM+c1BdpsSY3Odgg2ghsZE7k3Bzr8mscskd2ssO?=
 =?us-ascii?Q?aCWwr8TE6fs+ufwi/TbImErcWuV6eJ8f0aNgVBeNXBxiHU3C3WIgTsi3vr8G?=
 =?us-ascii?Q?PXgeaKWvU3J1CPNcJIN+5aOBxqczXJi1Z1pXgOuGVYSIgW0iJLeYZs255ofh?=
 =?us-ascii?Q?nOWp00YOkmHTwZ5M9kjTy61lPCtxDxx4bf9/2PhQkp6CUrjL8zU19lK1ZuaY?=
 =?us-ascii?Q?f6Jkuj10XBAvrJOQUlSbDBl4yUjyvChLYaRsyEUDa/n0aVh44gS4FQJUim7O?=
 =?us-ascii?Q?I02xC4BkoSZJ5+s6T60eswyDLgejb6VkU9cw/sOFIfewx4G9u4rfon3b7DFz?=
 =?us-ascii?Q?0Nj8J3h8cFNbgoIUIy67s6OKVP6bxoMh/UxnzD9ma2p8ARida8QPTfyTT/Ql?=
 =?us-ascii?Q?J/bMsTu7DskqiwrK4vHaPmbmfxjrrA7OS5xzPHG8PB67Tu2BarLqlxhMD6Zl?=
 =?us-ascii?Q?EMvad2F0OFRwkmOYpXCOpvI4NleDubZu+aQj8F0ZeBfjMcKEW3G0CVtG/Agx?=
 =?us-ascii?Q?5vB8IA6GNf0NiVgnO0Cjao46euykfacw7S/0TBD2oaAIIYCfAtxfYi5e97n2?=
 =?us-ascii?Q?VcLOlLLnosNJpOuCfh5DbBWv1W0Z6TxZG3453RW+Xi/vIGBSLTGsa9XnqJ+w?=
 =?us-ascii?Q?IZZBnubF28DURtS0p6ETkEV15TyhT2zAqsBITKVz4AoQji31yCn0qE+nnz2+?=
 =?us-ascii?Q?ngiXMWZxs2MNkPLix6JbuinLSqHW5oEFQK775d/yoNMmBjZINx1BzkJsSDAc?=
 =?us-ascii?Q?PAchY97mBYLLvH2dCSvv/mJ/BrrFlm+AuO2xz3z5I6GbVGiPJYDwQxXoSsbr?=
 =?us-ascii?Q?2bW2MrozGNujMkavvL5RAIwyC3hMlS1Sxg4HM78GQPzNqg9WBys+ad/NvEtg?=
 =?us-ascii?Q?cc9Dz00GB/bGBeRqK76eOSsXKWOYZNqnVDnRKR2mnYYFlzFfDOMrhqlSNlNC?=
 =?us-ascii?Q?RXs6huF9MtPgDeDDVgnpLBBn1U0Kx2YafG++6deR5P2TzBeNHzbMGBLvr69d?=
 =?us-ascii?Q?5K3lsP6BdyB1qbDSwR9blrYkc1PucpoU7Bb7XtzKu4KqJoyJpNFEgzJ1yDpG?=
 =?us-ascii?Q?L/EgEvpQrBZs7tk/YKF4AiiE0rWo1PwVWfEf//GAcEkbTdLJr3ONBC77Q3Ht?=
 =?us-ascii?Q?Se1rWRL3N2ScTJCm1FysVlljd6mVinfmZTNjmMBvnWegSRTBQP78zDQ58y/+?=
 =?us-ascii?Q?cxj6V7EPDBAYZnsm2Jn58/ykk+PqJLCmKF3h/CWtd/xbiPvHvJV9B2My8lNV?=
 =?us-ascii?Q?9JEo+0Igqs4jYra4KvyjoM1cyvCuUX8Zr4lMI1edLAR0XL5KFtj9+luzQ1Yt?=
 =?us-ascii?Q?oxNaMNcH1GbWWmXA7bRzQYsuVY3yaTh8Frp1xDo4gyxGxFISfO0N?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9e96c6-6c5f-4cbe-df53-08de63b56c52
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:19:59.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6AZt2BvJ/tTf6SmG73e3XLfv/3ncvuy4bt71qu/y54iNowwF63tNuXI2oA82LX+0Hh3eNaLKaH4JF2qCG7oGogV0XjSVk6VDa7fsxZqE/lJBI3SVmmydo6QL9ufwyE+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17903


Hi Mark, Pierre-Louis

Thank you for your feedback

> > > So I will not care about detail things first (= sampling rate, channels,
> > > etc,...), but focus about graph / routing thinks. I think this is the
> > > main part for it.
> 
> > If we truly want to support digital routing, then this information is
> > very much needed.
> 
> Right, it'll be needed for production use.  I do think it might be
> viable to work out the managing the connections and then go back later
> and propagate the parameters, that's how I understand the above.

Because creating pcm2 needs very long way I think, we can't get very perfect
product level pcm2 in 1st patch.
So 1st step is very basic graph / routing things, and it can do nothing.
In this step, graph is not complex, and routing is manual.

Eventhough it is very simple graph/routing, I guess many opinion / discussion
etc will be happen, and many back and forth will be happen.

Of course I will care about for example SRC thing you mentioned in 1st step,
but its discussion will be started at 2nd or later steps, I guess.

> > I personally really liked Lars' notion of 'domain' to define
> > strict/well-defined boundaries connecting subgraphs.
> 
> Me too - I'd come up with something that was extremely similar at about
> the same time, IIRC there were some small differences round the edges
> but nothing major.

I think I don't know about this.
Could you please indicate me where I can know, or can you explain to me ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
