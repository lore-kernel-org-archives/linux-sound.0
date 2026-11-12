Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443564;
	b=IdgVyRVcQG0/biNoo0XONSWOr9HPaOZgHUo7bqRa7oUO1ziWNUOZ+PjAv0wikZAKvo+W
	 Np/jbFspwTpjwa3V2gC/sfHMp+RVG+qDCBAVyTOvaEO53V4Am0PQjdz/XnjHaByzripMH
	 U1yQ+pAdvFzUVW870UebpCu3fuzlN+1J7S+THrc8rwpxsPcHC7laGxfVEIDN6ntyDTrH/
	 VjyRadLXHsQuFUlAwcLM6/BNQF4OwpAzxpm3t8HNIE21i41OlVPidpYDxEPW59mhOKr9c
	 CFsFlJL0S02h7KPICEBOIBc8S0MRFwGAW8ICUffTOiFUSXlqjFOpGkoWJxJXZIwhOwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443564;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=zQZHPy/BDT7h0UcuMhRPBk21ygCO/fLA0nvlY6yxxW8=;
	b=21phGwcZc4ZKlNE28sJbmCgpAF2OiZ+ynQXNUGNWl8IvWz5W1GFBYqmYgdTRc9M3tqu6
	 ykMjgltVuGWVETgnzQC2RQxx3PH7qgfwYRRuu2JrAxr5jGYwddl737ImbAofjT4vi2clm
	 JothxxydwQSm5LK97S+Y1G3cIwUd5dma4Ho0Hk3Bg5GqReIxRsBlvVLVl+H1aPs1aSD2a
	 k6veQuzI4SvF8iONLLg6+t3Y5KV0XWclP4hN75e3jx+6ZBooAbWOCMkvutXbdMgz5+GvJ
	 EPl28ANrlOh66wtBkcp5JbQ+tBDAOErrPz6F4+ePA20IcIilP89XMN9KXYREpmJeu0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DtyYrjRp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.19
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC22606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DtyYrjRp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVLeoAuhHnuWQT3sVrv7VnTa7cRWtth5iqfmyKd34a7sZyt7drM8tR3sW5+46eXxAHBxAQTw/5ZqvYjtWKp/CPIr4lUXcwJuji0xyoLptTd9p041+ThE0hypZsCVz2IlkGY2yeRt9LeYv5lt2fLh96shcLXFODQJG3GMg9DQoEkmQoMtHU0ZwvFQ3LxQb3J2lL7dJ+oAeDKKvycabHrjjbCW2M52z34VowMo2NIL7acgnFkVPlWZ8Cwv+WENlxZ8dDeJmY7XWNn6q4wAcKeXwpfXUSv3RZbKw/+uJ88JGKDb4Byii+WkE/0GzQikhLmy4Pjo1m8vQLTG0IwTs4h6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQZHPy/BDT7h0UcuMhRPBk21ygCO/fLA0nvlY6yxxW8=;
 b=bveGTEZjsd7UZMeayy+uopDkV+gW1gbRU+kL1FwcBbG1OJLYHt0Sosgwg9r/wHWUVnflyO0Xb/FW6DjWRjDRxcaSlptwnyjFEBkhT4Tc4EJwHlMxZ6tFOaJ3ZDqB8BmzqxVToTQjSNQ3jlViSNwlB35EyAFpJVqpLGT3AmZcfF/ZupFiUu7EquUKc2taKKRraXiF+qDI9UTNxAB8A8qyDjqhXBSormAomxa/afaii70Y76uNX6CyasT2r47dpqmWJTKULk0u223I9ZpHsQ0rk49CdEiZblqEpqH+bRDv9HeQdLRGwzJSg5eij7jD3vXvGQHWFpIuIzIxmffH1nVgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQZHPy/BDT7h0UcuMhRPBk21ygCO/fLA0nvlY6yxxW8=;
 b=DtyYrjRpFhlQHDefZ4i2FvxdrIMG6IoY5axbNgFE4Zfszeja+je6zfLY20dpUbSaiAr0kdE6fQ28BeAQOzFSCq4SczudR3g4xAtg6m9Dje3OYoFxlMRAuDGIwJctt78oADlDbVc0sXzzsANQnleAijzw46DXqh7f/7y/HI+qIAc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:42 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:42 +0000
Message-ID: <87jymi28k6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/27] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:32:41 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: d725eddc-9455-4e28-beb3-08df40547672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	ERnbuufIc+CE3dKZSWR6gkUGr3zxs9DXxyltALtceIpJbbFS/hoo3BPUC4cOuddoztGVIvhnJOgDFiALEbo/f/P0gW5CxPNsEIvhx3b0eHZ4fhIFLXDCam9TqLeGlkEEo+pvu4jkE0cqkMNBF8AT74W9oVgZlK9D1yQaDaOgy5dqAWTqaUgL2vt7smorkSQNI2DtLMgXFW99wFI8YbkmVFdFZnjbJAGaHsxKxRojicNurYQceutsJiCvLTJzzXzpjcNxcGdpPPudWyohhXGfqgLq2yopXNj7KMTYnlWljQfuvdroJeoFTAx3Esn/Szv4MzrCXXfPautKlw8OJkL/xCZQNMWBn87G+0YGMeElml8MHtoQJMv81Ou30VyJ46KU1MDFYMVQOcQkOs//LgAglIh49yZalVlS8FgViuADc51BASrizOGwP5DLt6Bgl9JulQACLdd3a81LjLLyTwPh7m2tCWGZQHOy2DCWjNZSKv+UzGPZp4DbNtrxb1eJwVs9BTCtSaz22DI83xEV/aESqNAgW6/cmNLOAXA0oWkXAmhIQPZB2UyO023l+49RJ4YT87nsMk9Ijmz5bR3Y2EauVnw5TmuEs2DYbhqICh5kDxTUSX+Id4g850fJnH98fCY9wXzniaanHFtCbFHTj8kUFS6gQceblZ/5xyZvrqdCxYznUlbgnDgicULigW9/8h8HzYTuPuj92p6lDeNAPCWWWkGTUVkEbOrgF7w1McSOsFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?XjboDXpKjZEjno9rGmQxqPPyhbdA+GCdoHAj/c2Z93OOBeqrAS0Lf3QJB6?=
 =?iso-8859-2?Q?uIlpwazqXyrWkGU7t+Flc+CMjI26jpUgGRoeADkEs+CEIC6fUbXyoBMqD9?=
 =?iso-8859-2?Q?yBWUR3gzNxmERtD/ydAbryleSJl+bVA5hzOpU5eJbzIf1XFJwb4G9fkDjG?=
 =?iso-8859-2?Q?wlIanEE6Mt9+7leAi3bhFopEIs+tnu75lQb3uC3hgeeb3h1MfflOUvpDfB?=
 =?iso-8859-2?Q?cDopfw0qEFtoz/g9sKvtEXH+l8rdnuuN5lKsGKvhYhceYICUn3N51tcsOI?=
 =?iso-8859-2?Q?Jp4aimTSfYxjGDW+SaOyAbI8L7/lhF08Fo7PeS0U109fqGlh6RMOJ/SVWC?=
 =?iso-8859-2?Q?Wp6VS5ekAoUQLVMUCUUxuYsEa8uZKIommA2R3XrR5iHG3CWPfXxb5lGM04?=
 =?iso-8859-2?Q?HsLIPJn5vcB/kBugebTsu5N5uk2T6IllCzS1bGwomSDCYj2RmxWyocy+n0?=
 =?iso-8859-2?Q?kXLZYbF42BnYJ+/DKHP3HhjD9ednLY0GARFhdr3oagolH6/9F/YAn0nP5g?=
 =?iso-8859-2?Q?35c8t4RyP4FO5wKLY/pe2ouwo0yd6HMTpyU4r7BhW6gesc7nWEygenWQw6?=
 =?iso-8859-2?Q?kGKmk9QfyLDDcrQ2TR9+ePfmoH6y/639AWdqw9mSm7BD+pfjNibv1xONAi?=
 =?iso-8859-2?Q?BwII7z+2uxd57cOmm14NSlMD+UpxBSlwfXdb/FTGmwvO+I81ZBC4aUSU8F?=
 =?iso-8859-2?Q?oiJ/dgyc40iy77vl44zBfGmi+v28v3trEcwi2BMpCmHAiRBiiaxturn/FT?=
 =?iso-8859-2?Q?2S2HpvJlrlA+CEjSkAmETTg3N1Epz5E996KdeIGFQtoK5QZco45tIbLYSz?=
 =?iso-8859-2?Q?uav6GzxpLaAFqabcKyu8a6+ksFLqa/g4dIQdlNOTmxowxbxrE3YC8VG2VX?=
 =?iso-8859-2?Q?HxCsDuRdR0O9Mg3MYBs0NSBMPnbhVeJ3RgxGpPigyPPWMqdo0McVWFZ4o/?=
 =?iso-8859-2?Q?LdtSrG6YnKCXvFrQwW3ejgd4dDWTbRmXO7nWgfo5DmAJYWVpTWDBuzk79D?=
 =?iso-8859-2?Q?n7VPMsUstOzBrD7rEY3yZgumEvBLvYJQ+9U7Y71XosmqHg8wOURXi44bIA?=
 =?iso-8859-2?Q?aJbdO5A+YRfRXaXAO4/zGruT/fPOkQT1aMqHqAUlsYh/DD9dx0BEhfPrew?=
 =?iso-8859-2?Q?mRu3JAbABnzvi4VUlZok3j+Qv0S2BpF/tUNL6oWuUw7+IsmUtWgOMeVDHr?=
 =?iso-8859-2?Q?opPm3iBHmsXBP8BMXSprImrOrsnVh0Z6w5y5b7G0J+1CabyzmAk+sUy6IR?=
 =?iso-8859-2?Q?8t7o+Zd8l0XV495EBMXDpw5XW7d99fTLOdhFVuJ1nDX4qOrFb8jNQkTO/M?=
 =?iso-8859-2?Q?hwttsGHHHRReaOeS8YK9VWlihQZcJ0i8zjmLixdc0Nx2Ee7unX8KR7DorK?=
 =?iso-8859-2?Q?LaMaOzDwZ989WHRrf59FehGWdMp3fTFQ2y63JJZ6uq6O0vIb/KepEBKJnq?=
 =?iso-8859-2?Q?8FPIMietW2fso9C8AUGlXlE8uvwneQ7KRwbJntbv/japRExo9lRkwMAkVQ?=
 =?iso-8859-2?Q?9AVBcJU9xJtTizQ7nF7xAk7mwsaQobx+qNIFT/3ZgpKWTaykU5TfJylRlJ?=
 =?iso-8859-2?Q?2qr8SWnQqYOcOk/C1HPZQkhz8PzcNU0E7FpCVdFFaKRQrPVWV5r0iHkIu/?=
 =?iso-8859-2?Q?kY6M9ZTYpxv2p1WcS9AgYGWeJEBsm6JiGn+PizYoQDe7pSvZRUENzTXT04?=
 =?iso-8859-2?Q?5ro9h3mMwkXlONOmkDUJi6CVwZ2x30dQA7wH1X5D8NOvi8WPGIc1dx7gwJ?=
 =?iso-8859-2?Q?ZhZbj3++6ZOkF1fdeE3L6iyrJsHdFiqcSpfA7DJJo+yqLbfNLm/oIXdnn+?=
 =?iso-8859-2?Q?PECUr70gx00NZPBZjViRgqeRvq0xV9cNgkJ9oZt7JG8fjksIFJYY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d725eddc-9455-4e28-beb3-08df40547672
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:42.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjhfffV/tJS8I9w60c+3Y14Y7r71+VdnTwVj3cmIa1w1fY72VNb1rAjEU+uRBrUf1fBNzXh8kaXw8G3FuHN/vHsnZ/RrKc21VhqfPPSlGfp9frPUpMcBQRtpUsaAukLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

move snd_soc_register_[un]component() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |   8 ++
 include/sound/soc.h           |   9 --
 sound/soc/soc-component.c     | 214 ++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 213 ---------------------------------
 4 files changed, 222 insertions(+), 222 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d6685812cad76..965c2555010c7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -279,6 +279,14 @@ void snd_soc_component_unregister(struct snd_soc_compo=
nent *component);
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai);
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv, int num_dai);
+
+int devm_snd_soc_register_component(struct device *dev,
+				    const struct snd_soc_component_driver *component_driver,
+				    struct snd_soc_dai_driver *dai_drv, int num_dai);
+void snd_soc_unregister_component(struct device *dev);
=20
 const char *snd_soc_component_name(struct snd_soc_component *component);
=20
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0f8e46c131c91..338ba5cf85fb3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,15 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_register_component(struct device *dev,
-			       const struct snd_soc_component_driver *component_driver,
-			       struct snd_soc_dai_driver *dai_drv, int num_dai);
-
-int devm_snd_soc_register_component(struct device *dev,
-			 const struct snd_soc_component_driver *component_driver,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-void snd_soc_unregister_component(struct device *dev);
-
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
 int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 7e565da045b60..d26cb7d6a07e6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1553,3 +1553,217 @@ struct snd_soc_component *snd_soc_component_lookup_=
by_name(const char *component
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_lookup_by_name);
+
+/**
+ * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
+ *
+ * @component: The component for which the DAIs should be unregistered
+ */
+static void snd_soc_unregister_dais(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai, *_dai;
+
+	for_each_component_dais_safe(component, dai, _dai)
+		snd_soc_unregister_dai(dai);
+}
+
+/**
+ * snd_soc_register_dais - Register a DAI with the ASoC core
+ *
+ * @component: The component the DAIs are registered for
+ * @dai_drv: DAI driver to use for the DAIs
+ * @count: Number of DAIs
+ */
+static int snd_soc_register_dais(struct snd_soc_component *component,
+				 struct snd_soc_dai_driver *dai_drv,
+				 size_t count)
+{
+	struct snd_soc_dai *dai;
+	unsigned int i;
+	int ret;
+
+	for (i =3D 0; i < count; i++) {
+		dai =3D snd_soc_register_dai(component, dai_drv + i, count =3D=3D 1 &&
+					   component->driver->legacy_dai_naming);
+		if (dai =3D=3D NULL) {
+			ret =3D -ENOMEM;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	snd_soc_unregister_dais(component);
+
+	return ret;
+}
+
+#define ENDIANNESS_MAP(name)						\
+	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
+static u64 endianness_format_map[] =3D {
+	ENDIANNESS_MAP(S16_),
+	ENDIANNESS_MAP(U16_),
+	ENDIANNESS_MAP(S24_),
+	ENDIANNESS_MAP(U24_),
+	ENDIANNESS_MAP(S32_),
+	ENDIANNESS_MAP(U32_),
+	ENDIANNESS_MAP(S24_3),
+	ENDIANNESS_MAP(U24_3),
+	ENDIANNESS_MAP(S20_3),
+	ENDIANNESS_MAP(U20_3),
+	ENDIANNESS_MAP(S18_3),
+	ENDIANNESS_MAP(U18_3),
+	ENDIANNESS_MAP(FLOAT_),
+	ENDIANNESS_MAP(FLOAT64_),
+	ENDIANNESS_MAP(IEC958_SUBFRAME_),
+};
+
+/*
+ * Fix up the DAI formats for endianness: codecs don't actually see
+ * the endianness of the data but we're using the CPU format
+ * definitions which do need to include endianness so we ensure that
+ * codec DAIs always have both big and little endian variants set.
+ */
+static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
+{
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(endianness_format_map); i++)
+		if (stream->formats & endianness_format_map[i])
+			stream->formats |=3D endianness_format_map[i];
+}
+
+struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
+						const struct snd_soc_component_driver *driver)
+{
+	struct snd_soc_component *component;
+
+	component =3D devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return ERR_PTR(-ENOMEM);
+
+	component->dapm =3D snd_soc_dapm_alloc(dev);
+	if (!component->dapm)
+		return ERR_PTR(-ENOMEM);
+
+	if (!name) {
+		name =3D snd_soc_fmt_single_name(dev, NULL);
+		if (!name) {
+			dev_err(dev, "ASoC: Failed to allocate name\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	component->dev =3D dev;
+	component->name =3D name;
+	component->driver =3D driver;
+
+	INIT_LIST_HEAD(&component->dai_list);
+	INIT_LIST_HEAD(&component->dobj_list);
+	INIT_LIST_HEAD(&component->card_list);
+	INIT_LIST_HEAD(&component->list);
+	INIT_LIST_HEAD(&component->card_aux_list);
+	mutex_init(&component->io_mutex);
+
+	return component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_new);
+
+static void snd_soc_component_unregister_unlocked(struct snd_soc_component=
 *component)
+{
+	struct snd_soc_card *card =3D component->card;
+
+	snd_soc_unregister_dais(component);
+
+	if (card)
+		snd_soc_card_unbind(card, true);
+
+	list_del(&component->list);
+}
+
+void snd_soc_component_unregister(struct snd_soc_component *component)
+{
+	guard(mutex)(&client_mutex);
+
+	snd_soc_component_unregister_unlocked(component);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_unregister);
+
+int snd_soc_component_register(struct snd_soc_component *component,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
+{
+	int ret;
+	int i;
+
+	guard(mutex)(&client_mutex);
+
+	if (component->driver->endianness) {
+		for (i =3D 0; i < num_dai; i++) {
+			convert_endianness_formats(&dai_drv[i].playback);
+			convert_endianness_formats(&dai_drv[i].capture);
+		}
+	}
+
+	ret =3D snd_soc_register_dais(component, dai_drv, num_dai);
+	if (ret < 0) {
+		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
+			ret);
+		goto err_cleanup;
+	}
+
+	if (!component->driver->write && !component->driver->read) {
+		if (!component->regmap)
+			component->regmap =3D dev_get_regmap(component->dev,
+							   NULL);
+	}
+
+	/* see for_each_component */
+	list_add(&component->list, snd_soc_component_get_list_head());
+
+	snd_soc_card_rebind();
+
+err_cleanup:
+	if (ret < 0)
+		snd_soc_component_unregister_unlocked(component);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_register);
+
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
+{
+	struct snd_soc_component *component;
+
+	component =3D snd_soc_component_new(dev, NULL, component_driver);
+	if (IS_ERR(component))
+		return PTR_ERR(component);
+
+	return snd_soc_component_register(component, dai_drv, num_dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_register_component);
+
+/**
+ * snd_soc_unregister_component - Unregister component using a given drive=
r
+ * from the ASoC core
+ *
+ * @dev: The device to unregister
+ */
+void snd_soc_unregister_component(struct device *dev)
+{
+	guard(mutex)(&client_mutex);
+
+	while (1) {
+		struct snd_soc_component *component =3D snd_soc_lookup_component_nolocke=
d(dev, NULL);
+
+		if (!component)
+			break;
+
+		snd_soc_component_unregister_unlocked(component);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7b0ce619fc3a7..b0dfdfe8d4a29 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1376,219 +1376,6 @@ char *snd_soc_fmt_multiple_name(struct device *dev,=
 struct snd_soc_dai_driver *d
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
=20
-/**
- * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
- *
- * @component: The component for which the DAIs should be unregistered
- */
-static void snd_soc_unregister_dais(struct snd_soc_component *component)
-{
-	struct snd_soc_dai *dai, *_dai;
-
-	for_each_component_dais_safe(component, dai, _dai)
-		snd_soc_unregister_dai(dai);
-}
-
-/**
- * snd_soc_register_dais - Register a DAI with the ASoC core
- *
- * @component: The component the DAIs are registered for
- * @dai_drv: DAI driver to use for the DAIs
- * @count: Number of DAIs
- */
-static int snd_soc_register_dais(struct snd_soc_component *component,
-				 struct snd_soc_dai_driver *dai_drv,
-				 size_t count)
-{
-	struct snd_soc_dai *dai;
-	unsigned int i;
-	int ret;
-
-	for (i =3D 0; i < count; i++) {
-		dai =3D snd_soc_register_dai(component, dai_drv + i, count =3D=3D 1 &&
-					   component->driver->legacy_dai_naming);
-		if (dai =3D=3D NULL) {
-			ret =3D -ENOMEM;
-			goto err;
-		}
-	}
-
-	return 0;
-
-err:
-	snd_soc_unregister_dais(component);
-
-	return ret;
-}
-
-#define ENDIANNESS_MAP(name) \
-	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
-static u64 endianness_format_map[] =3D {
-	ENDIANNESS_MAP(S16_),
-	ENDIANNESS_MAP(U16_),
-	ENDIANNESS_MAP(S24_),
-	ENDIANNESS_MAP(U24_),
-	ENDIANNESS_MAP(S32_),
-	ENDIANNESS_MAP(U32_),
-	ENDIANNESS_MAP(S24_3),
-	ENDIANNESS_MAP(U24_3),
-	ENDIANNESS_MAP(S20_3),
-	ENDIANNESS_MAP(U20_3),
-	ENDIANNESS_MAP(S18_3),
-	ENDIANNESS_MAP(U18_3),
-	ENDIANNESS_MAP(FLOAT_),
-	ENDIANNESS_MAP(FLOAT64_),
-	ENDIANNESS_MAP(IEC958_SUBFRAME_),
-};
-
-/*
- * Fix up the DAI formats for endianness: codecs don't actually see
- * the endianness of the data but we're using the CPU format
- * definitions which do need to include endianness so we ensure that
- * codec DAIs always have both big and little endian variants set.
- */
-static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
-{
-	int i;
-
-	for (i =3D 0; i < ARRAY_SIZE(endianness_format_map); i++)
-		if (stream->formats & endianness_format_map[i])
-			stream->formats |=3D endianness_format_map[i];
-}
-
-struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
-						const struct snd_soc_component_driver *driver)
-{
-	struct snd_soc_component *component;
-
-	component =3D devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return ERR_PTR(-ENOMEM);
-
-	component->dapm =3D snd_soc_dapm_alloc(dev);
-	if (!component->dapm)
-		return ERR_PTR(-ENOMEM);
-
-	if (!name) {
-		name =3D snd_soc_fmt_single_name(dev, NULL);
-		if (!name) {
-			dev_err(dev, "ASoC: Failed to allocate name\n");
-			return ERR_PTR(-ENOMEM);
-		}
-	}
-
-	component->dev =3D dev;
-	component->name =3D name;
-	component->driver =3D driver;
-
-	INIT_LIST_HEAD(&component->dai_list);
-	INIT_LIST_HEAD(&component->dobj_list);
-	INIT_LIST_HEAD(&component->card_list);
-	INIT_LIST_HEAD(&component->list);
-	INIT_LIST_HEAD(&component->card_aux_list);
-	mutex_init(&component->io_mutex);
-
-	return component;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_new);
-
-static void snd_soc_component_unregister_unlocked(struct snd_soc_component=
 *component)
-{
-	struct snd_soc_card *card =3D component->card;
-
-	snd_soc_unregister_dais(component);
-
-	if (card)
-		snd_soc_card_unbind(card, true);
-
-	list_del(&component->list);
-}
-
-void snd_soc_component_unregister(struct snd_soc_component *component)
-{
-	guard(mutex)(&client_mutex);
-
-	snd_soc_component_unregister_unlocked(component);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_unregister);
-
-int snd_soc_component_register(struct snd_soc_component *component,
-			       struct snd_soc_dai_driver *dai_drv,
-			       int num_dai)
-{
-	int ret;
-	int i;
-	guard(mutex)(&client_mutex);
-
-	if (component->driver->endianness) {
-		for (i =3D 0; i < num_dai; i++) {
-			convert_endianness_formats(&dai_drv[i].playback);
-			convert_endianness_formats(&dai_drv[i].capture);
-		}
-	}
-
-	ret =3D snd_soc_register_dais(component, dai_drv, num_dai);
-	if (ret < 0) {
-		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
-			ret);
-		goto err_cleanup;
-	}
-
-	if (!component->driver->write && !component->driver->read) {
-		if (!component->regmap)
-			component->regmap =3D dev_get_regmap(component->dev,
-							   NULL);
-	}
-
-	/* see for_each_component */
-	list_add(&component->list, snd_soc_component_get_list_head());
-
-	snd_soc_card_rebind();
-
-err_cleanup:
-	if (ret < 0)
-		snd_soc_component_unregister_unlocked(component);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_register);
-
-int snd_soc_register_component(struct device *dev,
-			       const struct snd_soc_component_driver *component_driver,
-			       struct snd_soc_dai_driver *dai_drv,
-			       int num_dai)
-{
-	struct snd_soc_component *component;
-
-	component =3D snd_soc_component_new(dev, NULL, component_driver);
-	if (IS_ERR(component))
-		return PTR_ERR(component);
-
-	return snd_soc_component_register(component, dai_drv, num_dai);
-}
-EXPORT_SYMBOL_GPL(snd_soc_register_component);
-
-/**
- * snd_soc_unregister_component - Unregister component using a given drive=
r
- * from the ASoC core
- *
- * @dev: The device to unregister
- */
-void snd_soc_unregister_component(struct device *dev)
-{
-	guard(mutex)(&client_mutex);
-
-	while (1) {
-		struct snd_soc_component *component =3D snd_soc_lookup_component_nolocke=
d(dev, NULL);
-
-		if (!component)
-			break;
-
-		snd_soc_component_unregister_unlocked(component);
-	}
-}
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
-
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 			       const char *propname)
--=20
2.53.0

