Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12225195
	for <linux-sound@vger.kernel.org>; Sun, 13 Apr 2025 23:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744587579; cv=fail; b=daUd5mlfPVJb+zDG3P3/IiJ2iCxAt2eNzW4Vi4JtA9esC0sl55skT3A4z0nmk7E5mfGjYs0BZmT706l2FuiTsT1JnOcrRDOVzz9KA6eRfcv9xGYBp6AEuBvsDUopStc/pnZuUjVwKJBdB2K7ZWfBclqK21TLdmyteEYXMhnHlNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744587579; c=relaxed/simple;
	bh=4QC1RmyAq89w4lWkrVH0pdtZUX6/n+2fllIPv+RgD54=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=odWYxa51SwnZVHwWpYXR3gl4CQEA9qOIKzBb6joTtk6DCjIt5VJOcZCK5k5nUYiC9Xwf8DMkNj1joxk1xJOIZrHSsUUoIp9DHnNrDkLDH8fLDJdOyXUHdWN9hnaf/zhwtSAqHiLI6iBKkbIynOjV+2pYyT3lMMvS/9WynxkfpXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wa60RoH4; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wa60RoH4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xq0goUopJiD0kj4hs5yRlUqS6x9dEesB9AGv2TuKkWcm5b2BHMy3u21mCAvGiQ5evhyzAFLB/iv38/jUpfNzvtysOqDss3XrAP633OUhEnF4eOqGgr3ez45vE7QIyJH052f3fdiEtO9goT1EnthP2stuxaR5r2Chl6yD67DOtD1ry3XeF2ekcWBgEoOJUgtBDtcO2IwWcks3M2tdQvn2t2YGgBf09478q24ndwQa+yTvzIEF7Ms4EezfcJ2lBqitZcSArgk7CON9vB0ZTh/P8/O5JPYCzG85nOwZ90fIGY59ytO/nrouj+lyDbMnQFUZdEBpwhl2ehtD8Q4huR/B0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29lXP34ou5V1GzEVSwSSw3DJI5zv5Kfq29sJGtpnLVc=;
 b=mKC2dB0ghoklhp4+4cTdK1cCdAQsf/uLjtPhTxRJDPgb09Emc35UrmPQBE0FVWg9Z1qcNdO3XuV7+pNQgpsI/2md8ryafM/sB4zPAY66WmLw6feyHTI9amM16gRfkTz8NB1Dfd6+Rv+kcSdfTVCEPY8Opj2YxOCLeYyYUWMYx86q4PS5N29RqPu4eNQbvbs4C4xzdZXr64sYoOkD811tla9SYlelFi6JpOi3sK5xJnru+CDJsxt8dNwIAHWNjhLrcpanp2E9eY6P8dbCdP0xEL2LS59pYS0O4Dupumo+w3v6z9tsv1C/Jv2Amf8FML4BrNDQr8k7jOVITc0MOBrW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29lXP34ou5V1GzEVSwSSw3DJI5zv5Kfq29sJGtpnLVc=;
 b=Wa60RoH483grwkaaArG/4Cn6gW4viJgWd0s5mUffm2tW/MmDi4dko339TOzqDhPH/Bq8e8fXke6oEwfN9V+EEBqJMJrWV7nnmDZHX6Vt4trvevNK0TORRty5+r3iaCaVEgBEI7mb1OLJF39iep+yX+W9NtlmZ4JYbi7K9vPdOhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13445.jpnprd01.prod.outlook.com
 (2603:1096:405:1e0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Sun, 13 Apr
 2025 23:39:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 23:39:30 +0000
Message-ID: <87ikn7r5qm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
	Kiseok Jo
	<kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Peter\
 Ujfalusi" <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Vijendar\
 Mukunda" <Vijendar.Mukunda@amd.com>,
	Benjamin Bara
	<benjamin.bara@skidata.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of container_of()
In-Reply-To: <fefd793a-3625-41a1-9fa1-ddd6cbbf3612@intel.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
	<87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
	<921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
	<871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
	<8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
	<fefd793a-3625-41a1-9fa1-ddd6cbbf3612@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 13 Apr 2025 23:39:29 +0000
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13445:EE_
X-MS-Office365-Filtering-Correlation-Id: 217a0d72-576a-4475-dc48-08dd7ae46f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7IId4mkBzYPU86yyCJrz/L71CJ51KlQQTPIbDyPQXgSueGKtgvqCUrbfspGU?=
 =?us-ascii?Q?r7QjvwY1a9JBfKPUXk8IbULEJLbsy/MGSBfVcgLBdQ/sQ+MTyn47VoRKbAj5?=
 =?us-ascii?Q?n/DUrmaaz68ARp0gnYxhVzDDgK2qdRf6xrm/Sj765fieU7xty5MMTbOmLqlO?=
 =?us-ascii?Q?3WkDHBIFDDs9Omm9069paF7wxWeoeN2Kjtx53hflzlsmXbJ4jaqyLcuCRLUz?=
 =?us-ascii?Q?1RlMXFQ4qUx6kHufu2MN2pl0l2iTCYwjm+ZJvyo8uUJComDN5i/rmkKJzijH?=
 =?us-ascii?Q?e85sXTytHhiSDWUXRy0e7QD7Rvhh0aekH7vxfewpaw1BdWTyoVpgBI86vkmv?=
 =?us-ascii?Q?lWam8h/kOxTLJ4j3zj8JMCJYkNlYRgv6F3XsQE44mwymPkkLsxiT83h4W4Wg?=
 =?us-ascii?Q?S1nGxOWI9x98pOI8p5SkC7llc1CSLzWK48xlPHyS6v/irDqf2WDm/1jnG35A?=
 =?us-ascii?Q?zbKuJONdnMt9K7/EULU7jHtyRqddQj+MGzLe7cFZrB6Lj2Y6oVVKo/yS7Nus?=
 =?us-ascii?Q?LJugsCSOsX0E0Kw/9wgPjMr9TTq7dHMZauD0gs6R33k3JzIzpBo4ScKEfyMr?=
 =?us-ascii?Q?jdxbLKqQU+ZbkdXAv7LSw3Iw7MT/TKHFEm9noa6sroG0jbTiFfs1bAtYAtFB?=
 =?us-ascii?Q?p/tSToJLrFP0oPQll51N7lrqfnZxE3qAoh5+owWMx6crGis6qwdKFRnI9wyJ?=
 =?us-ascii?Q?FQT5U75fGdJJ16sN4i5A1gPkdZ3NwzuMPmq4zjEe48/85nkj9QxWwE5FpCfp?=
 =?us-ascii?Q?ovOD0WSh42la6hMKE7r0MYAP3vFaFK90+Ya65Dx6tAlsI+FM4oNeZXmEO2lu?=
 =?us-ascii?Q?9pxxuFPETp9doG/wHOF1Hf8OAho+ltnrSaA62aWmXVB4hbPntVj27J0Gew+t?=
 =?us-ascii?Q?p1fe/Cb4fjLu8vdYHhxSqKfxc9cUarr/K0TIJi49pT1KHmRDWpntmOgCQAsr?=
 =?us-ascii?Q?Jt2ye7sS2o65J/oBdkw5R4K8kdOtgXC3xSgWcSjQp0pM3oc/7VSlu0cRjzOn?=
 =?us-ascii?Q?bLAIlCMncbXnQ3QBgr0ZmVuWMFfwFKhzcs6CXPq0oD9Yt4KL9YBb+SR3zE+m?=
 =?us-ascii?Q?4NqxV2hndLE5lLM1wOg7ZVAn0nmdiyKry8VIE3/Gdgw4Efk+K1NkUke4rkpd?=
 =?us-ascii?Q?XsiXt4GYNNmW1KJtjE5jpjWk/PnBG8JwppBATeqU3xogB383hD1MbYSU746d?=
 =?us-ascii?Q?YI69HlUNovwlnw3L2zh2MFZMGKibYqbcpuON3b9bjii/6AhYaxwVDDoZ1bhF?=
 =?us-ascii?Q?zNq5fFc+5AhIOB4OTuTBlt+yrBrVJesMIC9ckS3Ny9rMzM9TZwGcWurEMQjX?=
 =?us-ascii?Q?X5z3RCviz3r9E098q3HHG0UX/ng+W4lkDNYdD4uKGKyexqZaoqkaYtJflae5?=
 =?us-ascii?Q?Ga5LGuFqvCXmvLC9YNrpAK5a5RvYee9vsoanpNssnNJbMQOt2Aglc9/JWiIw?=
 =?us-ascii?Q?j8XEoP0DQg0Y7sjtCWAK0QlAzQGtFh/ree3Px/2y9H3DBzPQmisvSA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GVf/qsTS3DpTsXdW/Mknj31KLW4nirJW3OcNr0nea2QtZ2YEod7JwDKfJ1VR?=
 =?us-ascii?Q?p+wM3D+cN3yt0Nh8Gazfhv1JWaFWfu5UhCpsEz4ozmGW8WF26OkYnkdZAMCr?=
 =?us-ascii?Q?iJ9H+NmSVHfRiZ2vVnEohRFq8CMHGSI/KOK8V3SnwkkSjLIh6p/Mj5juFLC0?=
 =?us-ascii?Q?BcqfdDEY/KETIhrfAHKKufOZHdmlK6yvJkP/GxQJ0clc0/ZMbgHl1O3RDzIg?=
 =?us-ascii?Q?dVVveSnQRYPtr+EmVgDVsjOn5WVEt0iEgntPAUahTDmcepxDX89z97+wwjQA?=
 =?us-ascii?Q?cbDT+6k8WrFhuougPy1c33mV2uzIk0tuF6v10PjfN3dDh7ejpyDuAeERYpvx?=
 =?us-ascii?Q?DRVnqEI/nSx2miJXbqm+uf6CG6vTvW2tTlQ33jrR3dmDh8/QY2rXGjvssHKj?=
 =?us-ascii?Q?l8ZUwg4oXyaw6Qpkzsum49TF6FyNUKWJmSlrLbPcrHan+nTa5a3imltPn4qv?=
 =?us-ascii?Q?qtV+06k8qdFzTgguI70J8ih4q4w/pUhksHMwBvHTx3T4aldJbiokaEohOGEE?=
 =?us-ascii?Q?OGkOJ5/llhL+3Mmlsnh0R2tqW2xlYl4PgKsMaJg1juobNY8jlWlaxg7/xfUP?=
 =?us-ascii?Q?T8IqFmH3c1yLFUW6Qa/Ia1YhecIvak0yqH+EIMRBA/HNPv9FMGZEgf5vIUcT?=
 =?us-ascii?Q?e4wuxyeGjv/VjDnzG9Ry4BZElsBOqBvQ9G6MuKB/RnZM8A3USPAn92oyS7Oa?=
 =?us-ascii?Q?VWUaz/ZeRfIXkGnNGlSYbZnAuD3Zq8baqezCptsbRsGX99dhZMHmJ9ryt4l8?=
 =?us-ascii?Q?s+MofjWreCcPrFp7jYh0SKDHogzP2a0buunupFKNRzrW67VgPQ2X0ziTS5HQ?=
 =?us-ascii?Q?iYlAAJ1b2/l6qnuX09wdw8WBxEmMlc40K07W+zX0tsY5nGsDvhyeCeGDi1xY?=
 =?us-ascii?Q?AFUyymIiarpzAAbK1QP+o8Wt6NjLzseoLc+OM0By8naykA9cI2qrcjsYDvtD?=
 =?us-ascii?Q?V02ybSh2Op5/KJLheOVvJaH6Wb4FWKE01A4R8tHUI7Bul7ffTjQr6+TIqKtR?=
 =?us-ascii?Q?DP5Edj0HFJkiuhSEHHd1wFTm0JM6kcOgC5B5dqNwZEZhXAMQBdySp534e1YS?=
 =?us-ascii?Q?FiOnrTpc/v1aUOHKwbysmW/0qUilyyFBoNE0TRL/bssTdFLTLo+JN5dNoMt0?=
 =?us-ascii?Q?nScRucuoS9LLQVsYVXCq+TT3N9ukcvwrmZRXMbgM6arKBf6obyU/8lko5fZz?=
 =?us-ascii?Q?FL8hM65lF5p9/VaJYUoH5EDzTdvbVYTJ1FJH5Fpjt/HhISjcFP2MuDqWqkRz?=
 =?us-ascii?Q?Az7RZrbRT4MUOXP+VYeCWQXvIy6NZnj1lihBEPTMB+RVW+0qO3Ai8RVWzqZ/?=
 =?us-ascii?Q?HojsvmQ1plwppa21vl/aR3A3yXlwkU5uB5S7uL7cOyq3zNyKJrSStAXOIa8L?=
 =?us-ascii?Q?89buMH7fTJnUERXTrxi0nUtnSLKBmHo6R3nF0Tj+FZHii0YM3wek4sASiAs1?=
 =?us-ascii?Q?kWUjsSKX+VZ9tHIgXc6o5RaYHotPiQ+Plb+Lk7k+5+GFYLXXP6hxPCh6VIUe?=
 =?us-ascii?Q?iqYBctidVgib+3GHKcGo+ou8NVLCKknwaAmgGag5Pyd6gq9uz8NxaxO2mdN5?=
 =?us-ascii?Q?Kng4n0ZcDeCvHk7tddKAxCv86BjEs46E2cT3DI/JXbP/VrfxzdBJl2sfSOaR?=
 =?us-ascii?Q?/r5wqeetgrdAIvYeG6TshZo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217a0d72-576a-4475-dc48-08dd7ae46f91
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2025 23:39:30.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaWQ8aE3ClXSQyXfaTIaGQKp4akNfAalhVH/5Sp4pGEy8b+kaJFctgaLm/lNcBFiu/XX8LemmuAP2s3R1sAkFx26UuN+AdIlcLIsbv4cZly3YdTRAyNRUbU0WzhSoakq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13445


Hi Cezary

Thank you for your feedback

> What I meant is that even the name of the type - 'dapm_context' - speaks 
> of framework-internal stuff. The fields that define that struct also are 
> not for the users (drivers) really. Perhaps there is a way to get rid of 
> the dapm_context pointer entirely in the argument lists of public 
> functions found in include/sound/. The pointer could be obtained e.g.: 
> via container_of() by the framework's internal handler when needed.

Hmm...

In my quick check, the reason why user driver directly use dapm->xxx is
to get/access

	dapm->card
	dapm->component
	dapm->dev
	dapm->bias_level
	dapm->idle_bias_off

OTOH, many drivers are already using dapm related functions, like

	snd_soc_dapm_new_controls()
	snd_soc_dapm_add_routes()
	snd_soc_dapm_disable_pin_unlocked()
	snd_soc_dapm_sync_unlocked()
	snd_soc_dapm_mutex_lock()
	...

So, I think it is easy to hide dapm member from user driver, but
dapm_context pointer itself is still needed in user driver.

I think we can do is below

To hide dapm_context details from user driver
	- define struct dapm_context name only in include/sound.
	- define struct dapm_context details in soc_dapm.c

To use dapm_context related feature in user driver
	- use snd_soc_dapm_xxx() function in all user driver

I think it can be 1st step. We can reconsider about 2nd step ?
But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
