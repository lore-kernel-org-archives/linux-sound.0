Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9143DC145
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 01:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773364863; cv=fail; b=WICSTC0Ia3C+w/CE3juMDl1JqtIwFhfyEdRgHOKT9/1yAnmVMq7FIp4J+UhyRQxHtt+ceyU0em1wrZPAfL5JQxac8R5NJZgLEjvhMnEqj5zeL7B8iTITWSZQEk1qc7rd1R1fwk6XR3b2JpgEMIHo4+upmeRw9R1InBcNqgWWuLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773364863; c=relaxed/simple;
	bh=zLuYWByE50RBNMlfHrZwB8z2jGRg5Wu8u1XDRVZz3tg=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=cu7p63OCwdsgykdFJUk/csJfUE5ah6iUQ1LSbv9R3s4iCehGFh+ceznkF64ngoQFsda7yBUJS52CHz+YzWmRTPbWmTNeYxXKS9Y0KjIyBrgSxlmmxNMRBbWMfOEQy8bRIGfiFXlHggFdKKu27V7MOgtjI9mrKDWj4GBFvugY6SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZYXdHh0w; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZYXdHh0w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyQqsL0+chdOq/yYqLOK4ir2hW8XbmBA/T5HIoXM5S0jvWQE4P3c3gFxsOVaABx4y2XUuwJzRlNF7sSEpthxjklqo1uw/5unOQdmnDh4mUmh9SnaeBLZp2smIdCpgcBQ3ddD0ImhPU57qOApZRT0suhBKGOOh5gnvOJ3aTtbR9Mz/O4m9HykFBmU35Etg5tD7HW5c+Yji1cNVm57fKcWPcTVHnVWrw4a4XFifPjOR6zp3SdS+0aKVWA4D90ogZJLCW0FSldVcUn1R+m/GGJdESqGvERQc69TQqXKfhc34HjIv6CyX0RswryMH+d5x1fREHi8PhEommWlRfql/7ipeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOAY//KKLz05j7lCrsd02rev6OWy+KpsJ75SCWlsEig=;
 b=otsgE4ZWoG6gUeEFfP5gkHgooP2AeK5pCrMI5o+U7XAXD4lNaJaTmnbJL9MHkhGA2NbAIr51Jtsj4F0x82/EDRN/xzM1sBm9jVxSo2WwkacjIu5deQw8W9ftMAboB/4SzQ5Sb/o3Q3zm+oU3YhxHCQuNM9rMlWt/aSd1KJF5Hizjo3fRJD6VLDctu2G1FYUEcFpcAlGGrDlJC0OPfUIzn48GMGx3d23XnSEuSAkC4Dm3nop+xh1qTN4ls9T3ntktOiQo5c3sp46qodNYABFF/zY8OB6Y/JG3JUJ/vkvxsCXArh4Gjmg230RVmfQqnBY+/wKUQs++r/57YBg5bC+OwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOAY//KKLz05j7lCrsd02rev6OWy+KpsJ75SCWlsEig=;
 b=ZYXdHh0whDahxG+i7sJk50JdZLgHgp1kdQf2DFqad2C+El/oPop4SXhClXldZ7uHcx6I1P04r2GHQ2x0UNKMOjBocoa+Rruc16xnLA2Ce3tZj+CtJaaOcd1IFtwu2lRlrqHUyEKT+M3dZCeNjAQloIdMiBjb0vzw/PhJoKleDE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS7PR01MB16941.jpnprd01.prod.outlook.com (2603:1096:604:41b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 01:20:50 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 01:20:55 +0000
Message-ID: <87ldfwy16u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Question about DAI count
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Mar 2026 01:20:55 +0000
X-ClientProxiedBy: OS7P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26e::11) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS7PR01MB16941:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf3492a-64b5-405e-2734-08de809ec652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MyHWuwGRFthGpMPczfLCBFF3NCCmEPVedNGYdi72fX6Plvb6700lAIFAuGc5Yo/QlwAY1ghrht/G2RES3+oQQguewKmx7H1CQgXdOMoLvK8lfU7NEPI+Q+MPkdD/hB/9fZjfx3vsSZh3kVb9Z9I/TbfvUiselvDzy4RshgSQRLSA1eVEqQVyxD3+E8Ri5L8/HzZp/hXMt2GKOYL95wy3tt5KRdmq7F4UfPdvkBbrgkgBVnxbrEN0zkHyjFwwmoSQlnV0pUOQm0ueH9aaZ/qCjRFLCyiKcvXzQYDCtXoyz/5ioQRAFoehipW18RCrSmmD8ERpUcFWGmDT6uAY1cfPi1EpZtG9k6wLH0SGTiYBcf2MmsPpe2YtNLu0dcxf4p0vYeAy1SpEb6nIH1DD8tBXU61EyiACuZbNBhUb50q2sEOfSiqJ4ijYzkMUBaPCSoo0viML2QE+lgeb/x74HDF593B8aFQJXSgs12g5/mccY/Ssf1MGkmbsVRLOEdOPNnoJWQhWLGq0aGtKa9TRhyQX6Ip1o7ivYGhpfzta4MzBLbPxbQQs8psfgfhKufX3Zt9abdlLFt/IhCrmk7YT1BRsGKWu69oKCYwFr8pD9Kbn2K7bsssOtuDdYmyyf/Dlf/9efI3eTtdxVschaeVFN4brhyidDyEblpUUyEcshIKjlehhM9j2YoEwOeAR8dbCYtVxw4haJk/EHD1ADp9WmQ4LksH6/ccjhYfbX+tbFej4n52uGtTLFC4nZ9kGjnbSZS6O/+2NLZb8gdK372EJUdm/XCsOkQ/JqjKOl//mshfKv4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+Ti9cvj4dul+GaJvXISvrmzNHqxuYqV2ni9aAil8X7ptUleXNn0eVCBMSfG?=
 =?us-ascii?Q?Qr0v9ZhcbjbOKU+rHQaDu8bwUCbsXtA9C7dKn7q2lCMQb40OnWo8L4iJjN1G?=
 =?us-ascii?Q?DSbmpK4/Wd96kIF+RRGror0ytFJQujnaMhBPiEwfN1ZzjnrQLHg37ZPvgWBB?=
 =?us-ascii?Q?YyY3yQOu+SnvZumPvpEA0rhvHN4IH1g+GYfsPGDzOdEviyy4V4eiGxcyIBy/?=
 =?us-ascii?Q?dDwlow4AkpahuJiyjELIaIFtrivziQdCA5z1I6pk44g2hJLGa8nZmtSB/PvK?=
 =?us-ascii?Q?bvpvFJU5WqHv1WczevGY+VcpZHexnRyu9WWfh2f3Pl4yzR/qQJoks0GuzDTG?=
 =?us-ascii?Q?u0MQs5MA+F61ISMYZKMubCUpg8tyiDGg1BPOILMeNxFNCQAUVJXW9zvpZ/+P?=
 =?us-ascii?Q?BHHYe0zStgy9sn2jEHXigKnDLRZnKK5ZmX0+dIzJd2xDXAPo4pYKEY9hITAb?=
 =?us-ascii?Q?ysmG1ji7uzKVxXi4OU9LDTkmmoOyGjO/mcV94c0DgdDsVcEe8B+FOKwO3age?=
 =?us-ascii?Q?rFBEvDUg4msrYLHcf3sl6SiMT1rRu2pvyf1nRPvxIIxTjUMUzYMiDt3fOejv?=
 =?us-ascii?Q?5/I2JVe9nsgKXiZaCS+3HCj2hZVpaf3q7Q3MVQr3XJTLsilh3mDb0VMmyBr4?=
 =?us-ascii?Q?Rlk3T4gFAmy6hjaRSI+zHWG+haRArQ4WcKkpvzO3Q+9OaZ/y00YyjD3e1S1+?=
 =?us-ascii?Q?mlXlzUYR84eI5KGovwNNJnNNmnCy1vyAZBeHE2So4e2bqcJ9FWVEt8/k9xNP?=
 =?us-ascii?Q?yysHS426zBNMmmJBfFRgpStDNXRRKlT8MbCEMlQBuXHq2Efxe82dXijtVYN3?=
 =?us-ascii?Q?QfTF+cLy+gGe3SAGbsIRLaYioKgHJdbv1bkFrKJqst5cMPplX717MS9rAPZE?=
 =?us-ascii?Q?OJhx05yYdB62IjiXE/J7JdeWFDUmnzTdlNAZX+bZ0iCeMMAGIHFaNcCNX7tO?=
 =?us-ascii?Q?S94xy9RY/S4I/21RnDlt1jKesBxU8hDNoJSwvoGERafcMkerOKlgM+gwTgvn?=
 =?us-ascii?Q?e8KjkznFJg5IbSYxxsHAfPam4tHGGcSN6ohI5HCH4BaNkwdLpw6mf8mEaCBK?=
 =?us-ascii?Q?LE82KmfA8amw54AIo/XxWdD4gIRRA80kxjDMO8D6qqDtujz73XKSN5cdRqHB?=
 =?us-ascii?Q?vL2H2FZY1FtgK5jAoX48GqS+ZwYcpkKC5lg5PCKVIIyMjl7ZaytsPcHQALVO?=
 =?us-ascii?Q?oLYtmIctWXxbd/pYXmnSSalFkKv3gwUb4NntxmDLqWY0SfLnV+jsrEYayg2t?=
 =?us-ascii?Q?8I3QRGev+3luVP+ZlGcjiZtkDoneizQrrAH0PZUWJCczDeSZCUWlILOvrf0r?=
 =?us-ascii?Q?xncfggh6X3v7quml2xl8NxIQJZFRrv89jGmSNRSsb5ErjpIhtU77CgwEqhYC?=
 =?us-ascii?Q?uasNIy7IwsVyaAa6aAtVz/gKddpwsEERKgVCqU705n3YIP8GOeNTIhSSOlES?=
 =?us-ascii?Q?S8pWsXonBtb7aXgNVH9oAbSmcg8lUvcRVT3lTGU/WOxR6sQnye2Gp6S2TAjj?=
 =?us-ascii?Q?6OKL37TZh1gDDtGnNW+Cib5KPP4xP8+oN7B005KRX8+916WpIL7ngVlkl0mq?=
 =?us-ascii?Q?6ecrmNi1AWmkxSstWiPFXt8rytmOLqAlmr4FQO+RCpSMgd19csavIBUFv8jE?=
 =?us-ascii?Q?lWRIme429F24j0roAwYmvVlEaFvUYcKqNpi2B7Z9x+mfSuYAZWbgGKmVoONz?=
 =?us-ascii?Q?VeJ4ZeQIKss7vXm1jlCN/t/86M+MGwWv/n2GOt69Yqy26tyWwcKKhPqDNmXN?=
 =?us-ascii?Q?mANpLQw8Hum8jV87AqsSxYbZYAiMpHqFptwtSdqmJywHQoTb8S+j?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf3492a-64b5-405e-2734-08de809ec652
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 01:20:55.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MRw9x9HOkQyNmetwlCXKG3AT4m3peyYOuyxyD14qefKOMe3N9sK5qCLitNzqu3QPTIjUHr+tMJJoo8VwQYrnZ0lC6zht2BoOtBcWIz2N0WuZIIAdx9JGO46Gr9CG6H5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16941


Hi ALSA SoC ML

I want to ask about usage count.
DAI and Component has counter which is called as "active"

	struct snd_soc_component {
		...
=>		unsigned int active;
		...
	};

	struct snd_soc_dai_stream {
		...
=>		unsigned int active;	/* usage count */
		...
	};

These are count-up/down by snd_soc_dai_action() (A)

(A)	void snd_soc_dai_action(...)
	{
		/* see snd_soc_dai_stream_active() */
=>		dai->stream[stream].active	+= action;

		/* see snd_soc_component_active() */
=>		dai->component->active		+= action;
	}

These are called as activate (B) or deactivate (C)

(B)	static inline void snd_soc_dai_activate(...)
	{
(A)		snd_soc_dai_action(dai, stream,  1);
	}

(C)	static inline void snd_soc_dai_deactivate(...)
	{
(A)		snd_soc_dai_action(dai, stream, -1);
	}

activate (B) / deactivate (C) are called when DAI was startup (X) or
shutdown (Y) in soc-dapm.c

	static int snd_soc_dai_link_event_pre_pmu(...)
	{
		...
		snd_soc_dapm_widget_for_each_source_path(w, path) {
			...
(X)			ret = snd_soc_dai_startup(...);
			...
(B) (1)			snd_soc_dai_activate(...);
		}
		...
	}

	static int snd_soc_dai_link_event(...)
	{
		...
		snd_soc_dapm_widget_for_each_source_path(w, path) {
			...
(C) (2)			snd_soc_dai_deactivate(...);
(Y)			snd_soc_dai_shutdown(...);
		}
		...
	}

But, activate (B) / deactivate (C) are not called in soc-pcm.c

	static int __soc_pcm_open(...)
	{
		...
		for_each_rtd_dais(rtd, i, dai) {
(X)			ret = snd_soc_dai_startup(...);
			if (ret < 0)
				goto err;
			...
		}
		...
	}

	static int soc_pcm_clean(...)
	{
		...
		for_each_rtd_dais_reverse(rtd, i, dai)
(Y)			snd_soc_dai_shutdown(...);
		...
	}

I'm not 100% sure, but some code are caring DAI / Component active count.
I guess soc-pcm.c should call activate (X) / deactivate (Y) too ?


Another concern is it calls activate (X) when starup was successed (1),
but doesn't care when deactivate (Y) (2).
Actually, shutdown might do nothing if it was not the target.
So unconditional deactivate (Y) is not good, I think.

	void snd_soc_dai_shutdown(...)
	{
		if (!snd_soc_dai_stream_valid(dai, substream->stream))
			return;

		if (rollback && !soc_dai_mark_match(dai, substream, startup))
			return;

		if (dai->driver->ops &&
		    dai->driver->ops->shutdown)
			dai->driver->ops->shutdown(substream, dai);

		/* remove marked substream */
(M)		soc_dai_mark_pop(dai, startup);
	}

I guess we should call activate / deactivate *from* startup/shutdown.
These should be paired.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
