Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737446;
	b=EzN9kRMUEetfSvBoxwAtWOCX/dFOznTQTVPeaxsTozHbXd3i6xnDIOsJPLa2Kpmt7VYL
	 IXlPUDivYUTapFH3mdNl6Ktcavxf4FiPf1xHUek/8SdhygFNB5uMQDKF3CcCBkJmqrC+V
	 5cvlw+qT6XnoQLgQ+StWLktxha51vPcL/lrZnZalvZjqehBb1WXkW51QOA71qLI5gGzac
	 /+kzHdebX7KHKWcKEDnFPuA6JistKtqd/TUVc3GK5JBnov4KUYu6IE3DXyMXjRu0I/vnw
	 Pqma/Z+6xQTZC3HvhhNTAYYFdhtnRWNLSB43y1fEp6O74bj7uadB2vOe4jl2VUJxVMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737446;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:Content-Type:Date:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jj6syA9qGxl8sW7pOodMy9B61kD5HnCCoyWF1lu147Q=;
	b=RGEtXlRcduFoW2W7J3v6Q2TNa3OBZHxeP0g4/L4TiodglxAORh0143clejEwrNNpjk+i
	 2XtaZJbirx3BuAm4Neom/imLpV/YQl10XiKc4+VfnEoXaCHnrWre3znBRqpWs//lz9ldZ
	 zRW4CjKESdSi4eg4qWND+LYV0w66FBwIVl7oFNNU7DZKUutJVojFLGgzaceDj1FHetUrB
	 fQ03ptura7brHTOABMVQ5J/+3FPn+WbRBMNfCXw5UEefMplF2WhRkGz+JytbZ4YQj0KOl
	 CzIqWYUlTpAAhTYC6j84xAWeAPwoNhsEPN7XzQdV7QLuItyDCAz0P05xhOxGNnzUnUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nAvVuxNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.61
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B057606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B057606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nAvVuxNt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhwSsF6/6p01FlhqU91qqeq2AYHJW3n8zsl5GeR93irhAtq9tVLi67WJnCON4jBDoiA9CxuNEgTCrGSiPey5vmQqbynKngJOS3TUGIKzGCxMVOVtyMoh+XAJcg1L8yIzyJk7okPrx3003fOEUauZkTsjHiN6Z/feOKqQ+6d2o/FY3mnuHzolBmREhb9GmLWP0btuKuxNCs8w7V8W+fbmRXgx42KYqGcyzF/Jhv8JW39YG56jI1FLIRyuwaZh21h5x/GE9/cUqCLDf98Ib9OKTvmnVNCK57KXimnAPcx8wtY73ENn0bYUmKi03YQnAartJ7DcH98KVsI4xwLoj7UM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj6syA9qGxl8sW7pOodMy9B61kD5HnCCoyWF1lu147Q=;
 b=XWOKNr5AAXP+8wLTqqKngDpz7gr98eYnU0LMFjIZS1PiIe5lsNpebep32s2bZoCetod6F1Vu+2gZhKN7Om2Op0i41nmYBsex+RSUpk9WDieJ+uxUst4u6TO9TOtmgxtjF3LagO2r/mLuEhALvxXjW8wNStYZTAXZr3x5AMiLsmB4cHl/UiJpZ/9pvsmim1+fRWDMZtOoSNQp7gR4A2zEZMyyZGcJnJmd5hq5HOQrVIrq7FvpzHQTn6lIXxuaGZFxoiiHM+A8snNfAQJFLHmEcmT2GOd4p/0lngMd0rhmOxd5uwzOSBYnXT40VK6OlzduL2yuuBxA70FYzHf6WFVq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj6syA9qGxl8sW7pOodMy9B61kD5HnCCoyWF1lu147Q=;
 b=nAvVuxNtYxwTR8NHii9SfHkxxQaa5ERtPmWm/WGc6H81D77eAv3eucaExBprdgX+HiuVmUFjVpp1qAmEqZSC5EfGQaw2q/cCpEvksdYVuVOcS5onGH+pQIRcOPIFkbqhke7L6Nf0aOjYq+3ooOcMorGoXQyOMM606vEE3RMNRSo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:57:23 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:57:23 +0000
Message-ID: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/11] ASoC: rename DAI/Component list name
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:57:22 +0000
X-ClientProxiedBy: OS0P286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::8) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY7PR01MB17984:EE_
X-MS-Office365-Filtering-Correlation-Id: cee7691b-060f-4fbd-8ed3-08df4c190382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9C8qRvF6QMOAEF4sUZUl24eOHDle5QF+JkbiQ8XnVY5XzmK+qMPnmSOFPVZhWf1vNcU0XrCvBHtIaQP/RSUIiGBcwn3/2TQfRLOSqwnO0VkAhTsAc0kC/94FH6ykS+e/puTSIsXH02FCSOj9/i4wdVuunuJkD/VLCUei0sjvrj9PKsAxEYe3B3baK6BCMgEOgxQZdMcWbt7OkIMPmKVO0cHP06IY6aA/tZTvRlNGxwVNmsAw5/HmXtFA0c9Q+SeJ17QKweOnwy6FkdCVPIPdY3VKTNmiRDkGAvKZNq9lTB2IcYxUKk3NYK9pdytge0QvlKBVYjHGOwJEO3dvB97GdF6Y1PEFN6X7+YA8Cxi5vtUswnkQFoR5bGyXG7z+rmfVlD71jwJIf1NEfhyk0Buse7mFSFlU5iCGrDf8kPMrxMQZzoOgXsqCLy7hj3/clt+TcUOjODR7qZZo91ttuisYYYCT58JjgbJneyDiy3XIHd294yftijblEJn+R75dyzRz31ukNXiX4lgA+yCv+2m6DbvYXmX3un5TFfq1Jq0kkuTqWIWLh1QgX9yJ+M0luoytfSp2kWu+fklUUTrFLsQwkGEifSSDmBPgXUncsnmRq12zrcGdn2tyWxU336eBhOFjijy4y6z/T0oYridFTarBiBlAAESGT4sXNPMmnUWBSmkTf1JVc5f+4h4CD+T8ElttXLvzX695hYLn5QzSJFwTo1TdzTyBibNRV9T3/h2FmqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z/xwFNbK4TbIA4ANiAimSxHFSUjXR2Ku+grFhGAOg3c+kWSUY+YdO7tIypF0?=
 =?us-ascii?Q?FncB1QtJ4xvOnnw3UnJFDa5FjFXq5VX/nRYtyduxi3GX+VZZ1EnSbOEGpkz5?=
 =?us-ascii?Q?OsmZaXyMWWT9Da8H3jEVfChVhcsDOyLIjpMIAi/xVNgE1ZdiDdZpWGOG7S0G?=
 =?us-ascii?Q?C9IbwjR+7NvuSbsAvRVI4zKllTwYFm9DuyvIqDb+eZ+tbkYI7TgfwU6cMsxF?=
 =?us-ascii?Q?19xAiyZUkEoiaz7wYEShHpiWkm629GTen+lVPgyPT0GkQb1mmz3C192ExqvJ?=
 =?us-ascii?Q?HX/9iqxgADZfQTpc+Udf9+3Q1bAGdwyTfy66VtmR5lCAdtyTzK/rsOu42Y57?=
 =?us-ascii?Q?4E27ySYgYpqCG+timnHg0J6y58wK38PVi2ZSO2EYbxgka6fqpQ4nh0jyBb6f?=
 =?us-ascii?Q?TIF3pDXeM0psUyZnAos3sw9ax9bIbTtYOKvO0rzmzHUxmM9Hfmyc1SvkBNaO?=
 =?us-ascii?Q?Pmm5KM0j1Akx8MLwyDPLTCqV0bHABcmmkwep7sww0hlL42JUXO+p7H7NBUFP?=
 =?us-ascii?Q?d/vKr0oUFgGHuUYprUb3fgkXNW2hznizr63i72rsZjSAphCm0E7mmL2iznk5?=
 =?us-ascii?Q?4H9O2IUPZ1IPn01LmlAsFHcxKG5jhSU162j84saR+AAuwP8qqREw5ugatvI/?=
 =?us-ascii?Q?wjkAl1H8P3XQ/9L8YGKiP7QvT8V9hpbeLaxwEZA8ZtKTD4dWAY1PtBwrLefU?=
 =?us-ascii?Q?KIVAwfhQC4Ljw7ktUAUQYFtX5DaaSI/e5irIYZkmhI5b6j/ozeRyrUYFoL9I?=
 =?us-ascii?Q?jT1vDDHG1qk5zK4ZMrkdf0TGhoUAmf07Bofy7MtyHtE6ocHGPs1A5eAhELVQ?=
 =?us-ascii?Q?iti0OUJXjJedHCD8AbJmg766ozBhPtPRWXX1jb7haoalP+rOwPy+rb6gSnRk?=
 =?us-ascii?Q?cxSt4T4dQKYxDCPsonMXsXCLXpH77T4sZ9DWbar72mQMuoQnAOKCaBzJUj2t?=
 =?us-ascii?Q?raZ+ZOX2iTqAXjRCUhOeywYeKWE0p8zOl/B6uMNgtsxwyYFRKOd+92PSSFs/?=
 =?us-ascii?Q?hcDh40UWqemzyorrtbbKxQ5ltocj/eg2fV65pQs1CxPx9qu6NU50hbAedraI?=
 =?us-ascii?Q?OOqDNlrBNeMrL5wUEAJ5takVSu3Y6W+h8ZMWHnjYs5NY0RriYE7L4GsvwhJ/?=
 =?us-ascii?Q?uFX/1Yhqw1Ufflfv5XjVgM2WgdbveKBpSVrjYUKbfAHlSgG3KinddU7d3awC?=
 =?us-ascii?Q?dtx6pN3/ukEnMYPAZKUiEa/AlIEgZDIzNShWqnFKnduOc0tOU3Sa9eEoH5uC?=
 =?us-ascii?Q?K07PHQZlMpBmIm3jkgzpX/pIke6bdXGJ8y5Msv5jUNO+fjLwNk4FZDyXsoms?=
 =?us-ascii?Q?upqMXno7vHuSgErtYRHKmJrMxGss6rzF0a4YMgwx9fLUwNJN+pdK0ls47ZI/?=
 =?us-ascii?Q?j5cmUclh61H4igU7PDWrXHLkuYLsosIclXJQgIVnzc9cF/PAJ7FNFR4yzHSH?=
 =?us-ascii?Q?seIYqc8JwKy9F/tuCLB06ohpOu9p4MFRtAAmTKiBRaLJ7VUQhFlvJzYlvtt7?=
 =?us-ascii?Q?YRn7zMLMYuGykusF3zKRmHnIQe2HYRyD7nGVdtVLBwta2QueuJ+lzbwXuqym?=
 =?us-ascii?Q?Xel0KOktolfbNw9NTdtzQX+eyUPwUAyrY7WKfQ3Sg8g+4d8KT7bpi2E7serj?=
 =?us-ascii?Q?7qidvtczE6PeJDENBSRNHhTBevvyxC0smsP/zHu2EJ3to1w0AQVtxq8syEbU?=
 =?us-ascii?Q?Y7jC9yNLw2fTX5fYN/N+aVAVPQ0/tw4t/QwRhxW3q6T3h2YcZG9bu3h7eBM8?=
 =?us-ascii?Q?A4mRbzSHIK6RFATr0R/XMYIA3q6A/Y8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee7691b-060f-4fbd-8ed3-08df4c190382
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:57:22.8584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUzfHi8P8YStpKEAt6KSKsKhR5M0u6WuVg1VUStl8YUNh39SRCq/Sck6hSV1UtCsjfgmrvB396ZpR6QK2IaFN5svSLPVaIQx5wlu3M5dTb3ieBRWGvNfMu2WQQBgoDhg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984


Hi Mark

I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.
This patch-set renames each list name

x: done
o: This patch-set

[x] move DAI functions
[x] add new DAI functions
[x] move Component functions
[x] move Card functions
[x] add new Component functions
[o] rename DAI/Component list name
[ ] move Card functions v2
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers
[ ] Capsule DAI/Component/Card


Kuninori Morimoto (11):
  ASoC: soc-dai: rename list to dai_list
  ASoC: soc-component: rename card_aux_list to aux_list
  ASoC: soc-component: rename list to component_total_list
  ASoC: soc-component: rename card_list to component_list
  ASoC: soc-core: rename list to rtd_list
  ASoC: soc-core: rename list to unbind_list
  ASoC: soc-dapm: rename list to dobj_list
  ASoC: soc-dapm: rename list to widget_list
  ASoC: soc-dapm: rename list to path_list
  ASoC: soc-dapm: rename list to dapm_list
  ASoC: soc-dapm: rename darty to dapm_darty_list

 drivers/staging/greybus/audio_helper.c   | 10 +++---
 include/sound/soc-component.h            | 34 +++++++++----------
 include/sound/soc-dai.h                  |  6 ++--
 include/sound/soc-dapm.h                 |  6 ++--
 include/sound/soc-topology.h             |  2 +-
 include/sound/soc.h                      | 34 +++++++++----------
 sound/soc/codecs/wm8960.c                |  2 +-
 sound/soc/fsl/fsl-asoc-card.c            |  4 +--
 sound/soc/fsl/imx-rpmsg.c                |  4 +--
 sound/soc/intel/atom/sst-atom-controls.c |  4 +--
 sound/soc/soc-card.c                     | 16 ++++-----
 sound/soc/soc-component.c                | 28 ++++++++--------
 sound/soc/soc-core.c                     | 22 ++++++-------
 sound/soc/soc-dai.c                      | 14 ++++----
 sound/soc/soc-dapm.c                     | 38 ++++++++++-----------
 sound/soc/soc-internal.h                 |  4 +--
 sound/soc/soc-topology.c                 | 42 ++++++++++++------------
 17 files changed, 134 insertions(+), 136 deletions(-)

-- 
2.53.0

