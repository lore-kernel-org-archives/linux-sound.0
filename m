Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660A21018A
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 01:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772155045; cv=fail; b=Kq8mx3vX2E3sZ/t+tE1g7E2qMHZtDpTUzVJZ0w9yE+pvSzRjjnu0fUrX5ausPkk1bqH2QqP5vyrGKJy0uHCuMLSG8PskmeZ//PlEw9TPqeuUDJTI0iL8HOWKfBpp99ul5en2qazWdclFNTD9jlSIKaz+M+2Jz4o54W1VwIvuGfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772155045; c=relaxed/simple;
	bh=7DysvGS5V/SFHjqNOWpaEvjLOeFDLkWN+6frRrXymLM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=YDcM6BaNaGQyEuc15WU5aX/BAXAvyCVMj6W6cdtc/z/vni43BYPkNvfJYEhMHGBAp4AtG2C7Jk7nu5MqQLEr5nrXAHZWJpNjp9ri+Hv6gthAR5wLOwISZo8C3ldXos7cgU/McWBP31HUz+FPVS71twYUiPyRcSVL8SSGkfOCDqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IqleWau8; arc=fail smtp.client-ip=52.101.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IqleWau8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbnBeL8Zi5M9bdXribmmYuXZG2IjqA+92F7iO49sDl++M//p4shoUQ5I3N/2DBiH7mL+kWeaHSksc+WmqP1rjHb/kDqjypLe7CJG46VB7uEvdnO51PjvFbQKASK/kn+1oX+JwYnpaWjAaQmLVGZwMY8yea51Gg+74g82exrV3dvnkYD1K1W6fR4rjYuPGF2zDhOfOEh6YJh9K6DRsKEEQcQycmjul+WXntiZC2AZ0b5TABOWp74YtuNjb81DFodcrOCquD0iWoegIQlh0GUPQup44Ez+oM5z9NLS/bqklGoniKeVHhJPbEDdlixUOBI5N3kKmlc8kMorOW5Nn36qmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9gOeQukUzq7nJcsC1ww3ljJolO8Z5ivOM7AVmZ4Bzs=;
 b=IgbjkRZ5wLRFaq8esUChBbBf+LIvYcw4ttzHsOuw7Qib0a1WuI/9QEEa+7Dy8bnh1gvKlN6yLOQi8xwZ5Zj9dfh0s2vS8bbnTvhiPSuIMkpHrTHtoxNrBowdy+Z+hMqd07SZrZ93ELI68SaZEqsMxoUtvPdcrl3YlXkh4Mp2w9ADqyAD0pWkjgFQrI6Buug69vtl0g3Z/i/lmtmWVP7bq7vSK6tsaT/IQdmmbaLYGusUb2zxcRltEqD0v4Fj0+gr224pclLHS3cEYYHknLMNq529MEipGJzBOxUP8638UhkSVLtg6oA3RpbXkLToXPZYU401Z1DHEfGvhfQOjgRvoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9gOeQukUzq7nJcsC1ww3ljJolO8Z5ivOM7AVmZ4Bzs=;
 b=IqleWau8bZb2QMrz70FbF24+DgZX/FnTz4vtEFihnsIbk/z9+BFMM1G4oS2v61aJVe8FP39TnMJYblX4A5OAj0xJl1jo/H8joY+4j6lBFFKONY3b0wKTWbznv362/PpFWVZ5s+enzqgJ64wukoD2i82y3Pcect7+6yvkXRzakVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSAPR01MB7181.jpnprd01.prod.outlook.com (2603:1096:604:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 01:17:20 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 01:17:19 +0000
Message-ID: <878qcfyogw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: remove snd_soc_pcm_subclass
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Feb 2026 01:17:19 +0000
X-ClientProxiedBy: TY4PR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:372::17) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSAPR01MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f55fae1-a809-4ee1-9895-08de759df3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	HorC+eyZ8NAREnnshvaoPmIB3HIIAcPDS/MRpxQpra5Ys+eszeQJ6dw3AYxOgjFTix/seGbw/4W20CFQryu4QoQimqtgW9fq9UE3lLLVVqJVHVUZIYHaSg1QWZ/8pUmzaSvwUA2IYCp/Poe+abOmYpy9XSQdNoSPVA5va76SJbmK3OkAjYPtjSBT0RGLa/rl/9v9DUdLHRdWsIJ6hQOnPDime61W+TDzHg5XJWoGyo84GBzuf797tmYhh8NncvVe+qLJ5O1BQsQHMBMPmjDKNmhwWMU8SKkHR4xQt8GYT8xeKw6xk6FX+2pQHDYCeKsq3FNWMx7uIJTZeYIEOwZrh7F8fU3EHxQeubcabUBEbV6ucFDD7d0jQFlriD8sTaSpVzuvJRr8BQtsJ1SHy3VYOisK8XIJ1IEZoQjtZ2goFWoOqcUg1Kv5EGmrIGE3U3FxI/Btsg3oA8PCs0MIhShnn/4j3i2orfdJZ5C4nerZAfUVPX/ttJYy7Gcg5TRIzkaA+y+hyqOG8PC/u+2YtFnJ9/XzRrIpYltEpvVekIpnM/zI5O0GT6G6vIoPhOqzCZXyrFhRtRo13FZ+9O65nIGgw7JjaZjTS211kdxX6Z+hpj5+U7MtSCkUsILK7kxdFJtJho0mJBY0AGzZuHCkReDrI//ESEPUpi+zvRmvL1yAf2/nhfGQHpDRQRn0wrShRvkYMhQ4BFDvIq+P10wRAmHup5yZ+gfVktoYlKEVCNgQgztcxkbs+qrabkM20/AS316yEBI+0wLaCAj334HmDUzjqomRrpnH6Y+9LzwWoIk9/t0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7PUmYlVhqpI5MCWcsD7uwvRbTgzy4GO0KrXk6HX0xRidsDrrjanAyBqO3cyP?=
 =?us-ascii?Q?eZG6MV5HMRTk+IxNt5UAQtGnV2GREMjitrmBf112LtlaE7kmm970AuRa3VVC?=
 =?us-ascii?Q?MXzGcPqKMI20aeYpOl0CX5TLCzeqsQ2ZCwiYa/AoFYeKnmc2Or4tnH6f28On?=
 =?us-ascii?Q?c/SOXVVPovS3+/MajuzM4Ist3egbDnLLW7QxdvffTmDszgNRpEDY3hXFZR4j?=
 =?us-ascii?Q?arBQN8AZhhyfqJcor3A5O5IeDcCZkFTdvyaEDj/+XQN4JOCoqXy2NGOP8amc?=
 =?us-ascii?Q?SK0MOuRQ+85WtaM5Q8yeDWj0txoCTUV6bMfUxGEkKg6gShIptNymMCQc4NG6?=
 =?us-ascii?Q?hA+FPcMFoOh1btTKRdfPu7G+xNiEDGmDuX1m1qNR+8+25nT8546El+etnFaH?=
 =?us-ascii?Q?xULTnJ//DCS3dOYBJGjhLT5O6PKC0Sw8zLTVT58coIprPSCATjo0GdKEEsuG?=
 =?us-ascii?Q?Yk5FnNDs4ISWsALj9JksjBtZx+UxV5BZuut26iNBOCdEu0bfrH7n+fIY5/b8?=
 =?us-ascii?Q?UrZsQBNYhgDBaRFrNDKC7o1i6I4Oo/tiJo+AKa6vUlcqX/dUScTLBYcIzp66?=
 =?us-ascii?Q?eCIBlUQ1nkq5t7yNOJ23QUoa+dxQCIVdaNqq6W47b7pmiJPLUZqxxIRdw89n?=
 =?us-ascii?Q?6ro/k1PrapVjkCw7h9zk1wS+J//Z5R8/K1r/jwFpcnWP5Wx7Rtejreg/fQ/F?=
 =?us-ascii?Q?kIrYpQoS41XfDrJgkPaC0YXNuAF037oa8pWwfTmfO4BKH2WRNhjDDdgF26Cz?=
 =?us-ascii?Q?KB6B6UIZTe/6LeLIVpdyYe6dZx8yEqNzwtQTTmOkani78fcd8Oe1OIcODYra?=
 =?us-ascii?Q?V+qz1HZnsNKZD3fjEFGS27qSWWdbzdFQWwd/w/dNkbEGKn8YgspRmg12ePT2?=
 =?us-ascii?Q?4QS3QdQZUPpgs0GRG3kPD+ULwW95CCTg2VXdKzKWgDIYZ0wv/JoG3O1GZ2X0?=
 =?us-ascii?Q?RGxG9q2Ncia9WU3g5Ik4J19ozDn/ib5IExoMNR6YNBZYHI0jJDlFFBP4LSvS?=
 =?us-ascii?Q?8sCLhdUxrzLOTYsdyBX5Ij7TJjvm1pOTlUvK6qRMpQq65Hda2PBqdRuEMYOB?=
 =?us-ascii?Q?V9UyfZZSq7LGOIP9+3wgfacNDh4MMBjrKGZEpYq0L5FvQSBOEY1wpSPXJdRr?=
 =?us-ascii?Q?LQT9HE5I8zPwq8u4cBIEb+hJjpl5iado9wN7E2tdbaLOj/gJXWvRojmB9wMP?=
 =?us-ascii?Q?PUP0x7Uvnl3iJn+luZriVsXkNkTRrfHy0vgJbYKuLN6iS0NThCdvivhWjexJ?=
 =?us-ascii?Q?RHGwHHBPH8Gb2Twz1px+e19S5kSeYY6yf7D0smtpLMcLZ13uXLvQKPe1kh41?=
 =?us-ascii?Q?rKEh0N53GZTY4oVmfoMR8mnh0TlLVPnsLgrAUlfwPxkFzPhfTsehVoBb7+/x?=
 =?us-ascii?Q?HCcIQkSWtT2nBHNl1WWsAljUO8s74RsqgLoSnx//RaTSEE6nHuuA5LEyUXjm?=
 =?us-ascii?Q?V1upWg2Vpq7llgZ2MhscKE85ZGxl0L9/1c35g5J2WIU9jCLQ2IOyrB/57MJY?=
 =?us-ascii?Q?ncH7JHH2q5qHFHSQUoGXjWR1UuNCaaozi52iSRoK48YfZfieTatmicnV2PMg?=
 =?us-ascii?Q?lTeLhphnofaAMr/ShUNd3FV8gjiNbYz5ByD73qUYOwa9o11wE7K3ILpm4NEC?=
 =?us-ascii?Q?Je/CfCn0sDRN9CtCi/dG8PzVKidXn6LKotXvDJcp9KJCE8oZE1H92UlYBhQT?=
 =?us-ascii?Q?XkTRd8tZOV54riDBtPFAMJCMjCWe6PqeVErCokrlAgMTTQWFBXf9M5IMA1DM?=
 =?us-ascii?Q?VdNd34EckD7AdD11K0RLib7EgpP0Lf7xhPQ8oRDvX7EPAqdG3omx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f55fae1-a809-4ee1-9895-08de759df3e7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 01:17:19.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsEQwlGGsc7LnI7IRKA8J1v7KuIdcuOZLusNdk8v+lBpj15sGTzjYWmhrUpKAIZQK4s3TdAsOcZ1WuxFPIJl8gxrQg+UcT1toMd9HpbGu2d6sWWAG2xARg2322a1WlqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7181

enum snd_soc_pcm_subclass has added at v3.1 commit b8c0dab9bf337 ("ASoC:
core - PCM mutex per rtd"), but has never been used during this 15 years.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1e0b7cd8d956e..42efcd162a0ce 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -422,11 +422,6 @@ struct snd_soc_jack_pin;
 #include <sound/soc-dpcm.h>
 #include <sound/soc-topology.h>
 
-enum snd_soc_pcm_subclass {
-	SND_SOC_PCM_CLASS_PCM	= 0,
-	SND_SOC_PCM_CLASS_BE	= 1,
-};
-
 int snd_soc_register_card(struct snd_soc_card *card);
 void snd_soc_unregister_card(struct snd_soc_card *card);
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
@@ -999,7 +994,6 @@ struct snd_soc_card {
 
 	/* Mutex for PCM operations */
 	struct mutex pcm_mutex;
-	enum snd_soc_pcm_subclass pcm_subclass;
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
@@ -1520,7 +1514,7 @@ static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm_context
  */
 static inline void _snd_soc_dpcm_mutex_lock_c(struct snd_soc_card *card)
 {
-	mutex_lock_nested(&card->pcm_mutex, card->pcm_subclass);
+	mutex_lock(&card->pcm_mutex);
 }
 
 static inline void _snd_soc_dpcm_mutex_unlock_c(struct snd_soc_card *card)
-- 
2.43.0

