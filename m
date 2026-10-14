Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241A3DAAB0
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946767; cv=fail; b=nq/zbsENi0loKqDFiY6De6G2g/16BAJIRAPBUsbULwL0ry3DD9gH904b50pd/pyEvAjhAP2zRSrJkke4WCN9XUy6wORHNCY+1UxIP/UhKHuQu42OIdlCr06GZWMxkCFi/QatewklkztaAEfxQ/x1fEnL2vbDKz1/KHDnYdNu5Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946767; c=relaxed/simple;
	bh=3LLTocdNHktYYv52L7iQ2zE5mu6XyotlZdBhd+sBQ2k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sUkgtpI/75MRoe4RtXuXSioVS/J66ZBBKuH4ruYLz7fRSgVitB3HE1VAClVb++fyZYdP5dXgWtZCmnrSw0Elocri8TQNdKEzNlhxPguemrJf9dPSljV2aJUY0QNLJkLKk/BtuvYFuLDBrfKXX4ZtvZC8IUQxuHrJkNY3n+bOAg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EheKC9fN; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EheKC9fN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8yGMwLW8rI96a5qfN9NFIlBQ8e2yWRONZEy60xloHaz0nGWL+eaCLGMmpc6jAwYGvtbgwmtB9rd2n5aCBvkpPkdDfRTGxEZFSwFj9Tk0qlSMIHXW4Ihm65Qv/Nlb4s5KOmmr7Bd9Y3vSi9kD8H4RCmXEAGWEnx29giO5y4/446ELihCIrwIMtHTBu+08DA0jOjd5lsbVhl6G+QiXDo29C8OepEtPZqbRVKzn8q7DnOd8MukvZx7Z0sMwRo7/qH6KN+/LpXH6FQQ4mu0Rx4UNPRXg2LLs8NRZ805zSHYYkEO+fZfEFdEZqhwO/QUR3D98TaYILEO/Z08QicKMS9krw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r8ONuiJ8gsoEsj4heV6pFPVZkPbdrpuo1/7WoC5nMY=;
 b=ad5fWpWLQR/9bOxJf3KxSTH+6+TnbSr5mN9XIxnDgdFZbrqmnpdGma+Xpzus3gSukolay53+lm9oOADIS71m9FmB+jyEJ5rjQunQ/X218aQwY/dRwmRSFqlqOjYxHaLHo5V1gG0IE6JlLvFtT3KekTobX3Axy/kxjNB9Tp7c9i0I+UdAaei+DS5lcE7C4VUa5hwiEna7It2CAvupzYPVTgUBewbJxP2ot+44ufaxjx/t3rxmcOGFCdsFh2cb1A7OslE2chpn0i++kFqe+rgLUBIBG0yVw5Ka0bwTc4TGpi2y3w0Z3E0QnuWjfnrUrcBmEHKIb01vje4/Z3nz7yKlUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r8ONuiJ8gsoEsj4heV6pFPVZkPbdrpuo1/7WoC5nMY=;
 b=EheKC9fNAtU5OSBaa5ecLbkdtKjYJjm5snspeR1Gf3qWH9Y6vbrYp8TabS+Y8CLyxA4TgCWkcyozP/CikT1itrdwHq9+TTTqGxKMSNdjGJ8bpcIlXtb/pD2zKr6MKHJ6UvAbcIZdSM/lpkAnOTo+CvCZkCwY4PFTvBae8nd93a0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OS9PR01MB15638.jpnprd01.prod.outlook.com
 (2603:1096:604:3bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:25 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:25 +0000
Message-ID: <878q41yokz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/13] ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:24 +0000
X-ClientProxiedBy: TY4P301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::9) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OS9PR01MB15638:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c2f11b3-3bd7-40cb-d323-08df299f2788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	dp3KrQyTuPqIibeplTXrs/icCOumh05/97RQkTqiKMLKnYYn4NoNRdkHYC1BuOatxBWWRzDjZM0/CxqA5KGouZSPBJ9sbTh7tMa4unp/FiAOpJhzMnV8/OM40aHbStmy/BPu0xzxfPXZi6XSwm0dAUHaDCXbP6jtDh2vep8zii1LWu0v79vTHctA1FyiwRA8yOtQC7quPnWYT4M/Sp+/XTmrjHkKQoD2Vopq6PZd2e/6MYpNj1OTYoIf+rlTkkOkZn2iJuTGp516dRHRM1YNUBPwHXJbgm6cjWSLA4Mms/i/tMOfHJVrl89T5/faNtOwsm0JoeBQRmLBKPS5ztlSSmudhwb4xIQAxHLCYsO3L27hu+fSdzy8vXtm7fiBC2ZrJCvT9DRZlYUPte6LiME5JcKi3n/+Pgzxk9HbUDd/GHGibRLNLLltIzjRDrREuRtVLCqPXgQqnWoNqMAvDunSmDoQ1a4KHSjuqLq15gIHdldA9CPddnPVKqO9LNNgNVdUl6fEtrJBmKG9mR9C5DxDTY74uCaLHZ/X6zhL0G86M9JpbAvfrQ2YRGQVaMJzrXFrKFnvC7Mi4DfUbZzbNt8ckZZXDY2toYdgxns3eK5HJI1WrU3gfupnHLNTLVzBpuCU1mqxLf89bSTiKxZf5rkj2mQk+WwAl+21DkhS84qLuxiI035O3xrVqwilvYfN4oM7o0Rdo0oVThN7R8tM3dH1u0UVruIYylH7LtrgnY2LO/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?MalPf1dB2USBq/V3yg2AoVXi+0pCOwr3PiVflTvqUZ9goYTQoB8dXG5AJE?=
 =?iso-8859-2?Q?lXbzR1nbZJSX1STkX6OL47AfAyBFKX3TzfFBxsOz4GUwtCegVJucLZrbnv?=
 =?iso-8859-2?Q?D8Kt3D3kV/vWNUpg7g7yF4Q5uzl25t0ZXXbplAFuI2aE4p7YU6+i62XHnO?=
 =?iso-8859-2?Q?tlf5pG0f8IXgCSKc3m/xA5wTNHQgKR7gJDvD8lp096VXPvKczmNivpiVKg?=
 =?iso-8859-2?Q?s1x16La2McWkW1CDobwZPIR97xFA4kOJCK8gwQ0c70MXgyXof2XiLiqH3+?=
 =?iso-8859-2?Q?uuFCmBrFsBrCLlYIpoBDbP/SPjs6mvdsN3Gkr7L0u+zSXiGXwW1iX4pD0v?=
 =?iso-8859-2?Q?Ul3ENQ8gadxuRDHToIBLO1u8yjEDmMAXEtPQbUkpJm+ucUwJkbOU+g11oT?=
 =?iso-8859-2?Q?84YBLSCWKawcPe06cOoxXbcKXx3alcf+z3o44jyfZoJz/RMaL4wcN5EEXR?=
 =?iso-8859-2?Q?LuAeN8fBVAHT3nN9OqXSSGQBrgbTa/wPR3pikQJAP1sk2O2TmnvZT696OP?=
 =?iso-8859-2?Q?rpxsc3T5J1gFekpoOVQe8dXxsYzRQ3bXisLaf+muIXwhmPfwI/fdZtf8u5?=
 =?iso-8859-2?Q?sATH1ee6N62SdABFlMRUI0CISK5nvCBfRcDx4dY0vK8e/6f5WeEeHE8mTg?=
 =?iso-8859-2?Q?if8O6dArMv6b42BsWZbPonxb0SYsfwIU364efGCNUiJUjN9ixjZPX6mP6c?=
 =?iso-8859-2?Q?sOevymXXYlIA1Ea9gJJ4+o3CTrIIw4yTVxrtFUP6iChMN6QoOlMpX0dd7b?=
 =?iso-8859-2?Q?08vWk/YXTukPXHV65G9eW/qv1n5FajqV3aJIRYVI66Rpl9kz71kFe0xOGA?=
 =?iso-8859-2?Q?clMYhU2IfndtXQyn649s0o4DYuL1NX3l1h4X0na8KNOXzDM1pqR0JREQHy?=
 =?iso-8859-2?Q?lNSfWRh6ITfHMpvFyC9/vGyl8GLDKmpks0VkSb8hP78eb5h6MQJTjOCrkD?=
 =?iso-8859-2?Q?FmhTlNiaedpnWkjd0upFIRpWCZIb5Ms0G5mDJi8tHcXDM023UaLQh7F0b6?=
 =?iso-8859-2?Q?Cr3THd2TBMz+e4twMBwZ37aUrCcm+mVoCEKrB9kZFB5U7gid+c76xpF8Ue?=
 =?iso-8859-2?Q?7usaoMn+kerUDQ/1+M5XhCejnnN264pn2Qsm8SXYPwCR/jCKYZL1zabIv9?=
 =?iso-8859-2?Q?90jdiSko3c7aCSbOfbKjWg17VFr7hOFDvvhXvTnkZksJxMsU0U75SD4Gvq?=
 =?iso-8859-2?Q?ZnbJjlkaAgLEYfgqIqK/y2pFJzboA0NNYYEhEmZd3Qh2VdRshCEMUf9W5I?=
 =?iso-8859-2?Q?TEIZsh55IrqqHaOh4NBEdGi2loZnD0UZfRD7nCSvt+vWPvemRAmhepW0Oe?=
 =?iso-8859-2?Q?8HAvh3ZzmMePKPIbz/qOzN+w+wvegfNMi3iBwcbxb6x7T6Q6SstQUAVign?=
 =?iso-8859-2?Q?qMQoEyN3d55ig4zuZJG4Q3BPP7b7hiRlT1H0JoffhLvWaiQhXneEQOfBkR?=
 =?iso-8859-2?Q?hGEm/n39Rf0jaVMONTcl5yaTGgoXdIJB1pNRASNJajXdS8xR/jLeHeM+9W?=
 =?iso-8859-2?Q?MH70RuZ76T5I/8D9UdSrJPjkzqnC5SX9rBVmzOx06z9FlGynVx1pLFc7J/?=
 =?iso-8859-2?Q?FCm0A4P0FC1ZMywCRhydSa54LMQG7LpTm6ktfdp9TpRJsdFONWXUIXj+49?=
 =?iso-8859-2?Q?oEksq8QSmmRm0S7Tm23Wi9DWhEfrW5nTNevucT+hNhdQSeo3KXfHCynL3K?=
 =?iso-8859-2?Q?znkamsHU8nvpNRZmW/wYAf+lHlkDriyrlhsenyntEq1qKiADJsQKZOLbV4?=
 =?iso-8859-2?Q?v2PtfnncHGXRSQ1ME7NQwrlWQPi8Q9prq/ad4y7IVn/ceBWqMJwvQAGgUA?=
 =?iso-8859-2?Q?pfk3xlPaXqiJS6/GiCDhd2DITyyy0aXOP8XIzdRMCgedECYuDeLS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2f11b3-3bd7-40cb-d323-08df299f2788
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:25.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rg1TNSv+ZzYqGYxod+nvrvnyp4xjgJMbEc2rPoWZ7MqreJZoYA6Un5A0YsvAzjkOTufPSFN9S8DtEaqP8Xz3LVAy2uBT+T03DCjUnMKLa9mJdXxAB4E+kv+5fDj+w51E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15638

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_lookup_component() to soc-component.c

It renames function name
	snd_soc_lookup_component_nolocked()	-> snd_soc_component_lookup_nolock()
	snd_soc_lookup_component()		-> snd_soc_component_lookup()
	snd_soc_lookup_component_by_name()	-> snd_soc_component_lookup_by_name()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  8 ++++++
 include/sound/soc.h           |  5 ----
 sound/soc/soc-component.c     | 48 +++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 48 -----------------------------------
 4 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0f955f5cbebc5..c287ec6f458ee 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -289,6 +289,11 @@ void snd_soc_component_set_aux(struct snd_soc_componen=
t *component,
 int snd_soc_component_init(struct snd_soc_component *component);
 int snd_soc_component_is_dummy(struct snd_soc_component *component);
=20
+struct snd_soc_component *snd_soc_component_lookup_nolock(struct device *d=
ev,
+							  const char *driver_name);
+struct snd_soc_component *snd_soc_component_lookup(struct device *dev, con=
st char *driver_name);
+struct snd_soc_component *snd_soc_component_lookup_by_name(const char *com=
ponent_name);
+
 /* component IO */
 unsigned int snd_soc_component_read(struct snd_soc_component *component,
 				      unsigned int reg);
@@ -441,5 +446,8 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
=20
 /* REMOVE ME */
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
+#define snd_soc_lookup_component			snd_soc_component_lookup
+#define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
=20
 #endif /* __SOC_COMPONENT_H */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 89612ac0c1d95..bc22720b15590 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -457,11 +457,6 @@ int devm_snd_soc_register_component(struct device *dev=
,
 #define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_=
driver(dev, NULL)
 void snd_soc_unregister_component_by_driver(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver);
-struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device =
*dev,
-							    const char *driver_name);
-struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
-						   const char *driver_name);
-struct snd_soc_component *snd_soc_lookup_component_by_name(const char *com=
ponent_name);
=20
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 86ede607ba31c..4c2d2dc62f86e 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1505,3 +1505,51 @@ int snd_soc_component_probe(struct snd_soc_component=
 *component, struct snd_soc_
=20
 	return ret;
 }
+
+struct snd_soc_component
+*snd_soc_component_lookup_nolock(struct device *dev, const char *driver_na=
me)
+{
+	struct snd_soc_component *component;
+
+	for_each_component(component) {
+		if (dev !=3D component->dev)
+			continue;
+
+		if (!driver_name)
+			return component;
+
+		if (!component->driver->name)
+			continue;
+
+		if (component->driver->name =3D=3D driver_name)
+			return component;
+
+		if (strcmp(component->driver->name, driver_name) =3D=3D 0)
+			return component;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_lookup_nolock);
+
+struct snd_soc_component *snd_soc_component_lookup(struct device *dev,
+						   const char *driver_name)
+{
+	guard(mutex)(&client_mutex);
+
+	return snd_soc_component_lookup_nolock(dev, driver_name);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_lookup);
+
+struct snd_soc_component *snd_soc_component_lookup_by_name(const char *com=
ponent_name)
+{
+	struct snd_soc_component *component;
+
+	guard(mutex)(&client_mutex);
+	for_each_component(component)
+		if (strstr(component->name, component_name))
+			return component;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_lookup_by_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0e935de91d0a4..2ead744a5e077 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -261,54 +261,6 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct=
 snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_rtdcom_lookup);
=20
-struct snd_soc_component
-*snd_soc_lookup_component_nolocked(struct device *dev, const char *driver_=
name)
-{
-	struct snd_soc_component *component;
-
-	for_each_component(component) {
-		if (dev !=3D component->dev)
-			continue;
-
-		if (!driver_name)
-			return component;
-
-		if (!component->driver->name)
-			continue;
-
-		if (component->driver->name =3D=3D driver_name)
-			return component;
-
-		if (strcmp(component->driver->name, driver_name) =3D=3D 0)
-			return component;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component_nolocked);
-
-struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
-						   const char *driver_name)
-{
-	guard(mutex)(&client_mutex);
-
-	return snd_soc_lookup_component_nolocked(dev, driver_name);
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
-
-struct snd_soc_component *snd_soc_lookup_component_by_name(const char *com=
ponent_name)
-{
-	struct snd_soc_component *component;
-
-	guard(mutex)(&client_mutex);
-	for_each_component(component)
-		if (strstr(component->name, component_name))
-			return component;
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component_by_name);
-
 struct snd_soc_pcm_runtime
 *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_link)
--=20
2.53.0

