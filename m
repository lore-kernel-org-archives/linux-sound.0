Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044B33BBB9
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909546; cv=fail; b=e35CPlCLjHqArLjiByMuZn8nDdeOTREVGzTCQDM9Th/LuEs0Pq6760sIDZazCjrw1Rr9CDsioEDEkGD/E222Z8Yk7xinCCDj3w5D24aNfh6AmHt4IqrT3VbU878NBJYY0JXWEJtObMsrBSJmRso0EqNvKIJmvVdnrsS/BGbDrPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909546; c=relaxed/simple;
	bh=jBle7zi42XUUA7L+/v2OY84kNFZB3HuBYQzAWSxH0IE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dve5BprOw1rxm8fVSf7c8zjx4lNifuWbBylfg/1sJmjtP2ln/SinfZvndvq3jF8D/UUfXcGobVGNYdsz+yeZXJTl0W1pX+tRgSWa2vpmMC4x+MGoWvIE5McBTh/fSzxSnioqCdRqotmmFtfTuqjOqLLI1tfcIxM8UishrjBMEq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kY0wb8b3; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kY0wb8b3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1rVLcBjgKzHCHm/AQN7IX7KWdYLTKVvs521kkj11+0bfmM2FuLDldVCXwi29+qJOct3Cima+BltKHM3Zo7ZwEGgpvGhByNw3KmgWgPV6jZl5Z0bubmQYTtplBgTxvPv2UJip2t5VExJsgUt0TFFPhC007cGiizvqNQw49hHTzZk7ingcaK5c8gegOevEAHxb/t8H2jPqhKLw8bTTnroZ5YG7B6WT8ugD0NNEJjPfvdXVfVMfzrrDV13gVLayejbwUoCjE67QOijKDT/Yql5MtbhT3iFSrB2lfjUSqYCuyJTwxZuCBZOflJlKJQpiTS9ychtRmQ1rLBl2BTiGwnI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQZuDE1izD87zURKmBL8VQ/9ZrEp7Zeq5wfdaEs7VlU=;
 b=BvNu5jAEcNq4RsDeGv4oXy+iE3oZXhBkV2TPl1P0igHeybIG8LyRvcYucygaB1sGN1a2/3+Qanvn07N1sL8T6s9BMlNCqCrxy8SOnuw2eP9xzDGOLC2m61BYqmKqavvEquyn4LbuY43Q+OC52p2xxJR6PMDfHy/TfM9Kz0ZyGL5xFQpCw0NzOOXGNlVfB/EfPoQxTI4vkLHvH/8mD4sVW2OTwMov+llwNBFTse7JxaefJgxglp4BDAfRv7MncgHyKo1tQY/Wx6r0e2Q9uzThX3lcpumLDN7kEprUIZoPduEGIDZeXetiXx4tWVKxAWP4jH4F63OBLlqV+qo4dfW2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQZuDE1izD87zURKmBL8VQ/9ZrEp7Zeq5wfdaEs7VlU=;
 b=kY0wb8b3vMZxHShA+uXY4jgEJc/XN34iJRNyaRtXEnRizqXeacxtVTWOlxuFKQs843Xa9BQn2flhSLmlGx25AUmXe0lMiYTT2IgemAJP5rDeyzkCRYdrv2ZhHT+hP3mKUQFcL8ZEeF7oAHKALNCWA/VeneCpwrSH+kWR3rE9lTU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:23 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:23 +0000
Message-ID: <875wzk6cgp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/13] ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:22 +0000
X-ClientProxiedBy: TY6P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::13) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: 2082079e-88f6-4e13-fe0e-08df20302f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uattn94YUmD8rzCKp/iN7iaMr9v9yfO+5PCEpgIcsgNu4YnH+OMmFVQxBXvOSWBU2boWsBhSTEfu9cuCVC/GOBBv3Mq0MY4lQqkBtGIIlTNDklldu0pBnIJgmy1GK3MicaXexrDKsEK+ZK3POk9wUydo9dwEgBphptFOfDVbR6srpkdsBgxEdYTpLe1CKCtX8H3ReV683bVnGr88Y8d5W49/bH56frcdnDTnDtyuYN3VJCA2CpFJLLsXjadeP6C2x+7VTouvbSClQ0vEVkg1Vbanz+Gln9uW6tYDUI776PTJfrZgBCyBjQMmPmA2NbBCKyaNF64Py6a7Szxeg+y6TTwYFCe+myQs0D567Oh29dND+3r5S+wmP95TCNrpakAInq9rWJ4NjzEjv5zKLYngz1sN8m8F10S/h7YdK5VPp0bDdgZdBWa6vKk5DPz1YTpLppoXxvq03fD51/y/otiFHjcsBL0l6vcYZ66uGAqUmvGVv/TN07Nn/iJh7SOupwA7YbC/otqub6dKVzouNE4RZHaALzFmuiD2P1Z/fy9NNgcKqRwY5QjMNlT3MYhmT8PXcKTs/ZZkgnJxBqLKtVCfsgK93DJ82fuCpG/M7juQQvfyxObYKntI671qhfjVO3GrxEQP/eczuMrKiFI8INcrfYlg6+lw4p0m3+v4tKdWhaaE/JQoHTzR3ykbprbAYLj5yeP99rghhNsnZaKehbFr2Anc2kYIfs7QXrrvfukLveg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?jKgFrSGZfSlKa9Dl+brDHlhYAqWiP3OtGwe7TJZntoKy9e1YdeBHpy1wti?=
 =?iso-8859-2?Q?X3uMv2Z+XUyAjucZl+Qwc4r+dq1WvieoEvSaJA3Si7n1F3NHdlapcDfvjO?=
 =?iso-8859-2?Q?6ljZdo+EZD5L45gVx9EYnllUakEZEJt+1vuriQGStPwMyHh5jr7VbEDw4C?=
 =?iso-8859-2?Q?UXU4ePrhnfNxzwntZIf/2WrzNDGL8QyV8ZG7T/YrBNcGSqLRufweQYfivR?=
 =?iso-8859-2?Q?2qo3EkzlF6nMu55Eg2uYAN8sZYliCQPLg7a7bCCSuu2ZzPRLcjbKBREUHs?=
 =?iso-8859-2?Q?6aF33d/4p3KzWufT0VuAy1Fy9oGyLsaawpoFqherN3KMeyFBuhardY3blI?=
 =?iso-8859-2?Q?0ernM+YQU8/zw63ZqJKlufWMeOF4IS856jTxVp6sX8aFwmqR9qCgd94g5g?=
 =?iso-8859-2?Q?THREUdGwqbe0U008PYWypFRT/DUeKfQv2chv0wU+vLz3rbtTyn6UuuP0o8?=
 =?iso-8859-2?Q?8yippUSJGe3Kxdm9XTMgkuCUG9bw0H2GM9klIHuTmAL+6PrVuFidTlFmkO?=
 =?iso-8859-2?Q?qmqnwP73AopZs11L8m/crYdssTy2lpRVtAatNNQzoOgZckEl9l/bgBD9m4?=
 =?iso-8859-2?Q?yjSxUqp7XEn1yGwitX3yCnOfeAufRlufPeufq4frrIZHOS6aaPf07KqiEI?=
 =?iso-8859-2?Q?U/LFBbinUYjXEIgBik16yXA+onh1Cbp2NkXN3f9BwHYSKSXFgFUu6MWIyw?=
 =?iso-8859-2?Q?WAfQx+aYhmYa/qEvSu4srxvKoejGhtSl6C8TgGt9sk0iDMdZltHgNAU1nt?=
 =?iso-8859-2?Q?cJRP6hHoC+2YAIvWgHZlIC6UZnKAz1MLdxfadjlO4/HtSealH3zU0KzbvU?=
 =?iso-8859-2?Q?eAKh8KWQOsurqYrObPJ5HhhaPJfoQ9+8XNAsC51vJUMqFpW97e1t5pFRl3?=
 =?iso-8859-2?Q?NsfafIUfyUvBFvcTq6bvWR43cukGYaS4VL5RWSGD5RmpKIq7Vb3ds+okde?=
 =?iso-8859-2?Q?CuVNeZvAY0pb98vmPrX7lSFWte7KIS3bZ2O3QQStx6aShKNxxmSvqkwRm4?=
 =?iso-8859-2?Q?UMQvaenIl36R5y2O9fEnCqvLR7zzo+2Y/1wuNW+F2HmlhkNIev4gKVa/io?=
 =?iso-8859-2?Q?7DENaRA8fhPyCLYGMi+tHGO5YqyQAX22SDKEmJyY8IRsd1bimRmTmdg+yz?=
 =?iso-8859-2?Q?07WonMyTD30jEIZrFyWqmEKY3IQZr79I2ZgdHAK09+u1H9UGnx7CgRNj8w?=
 =?iso-8859-2?Q?Gk0//SFgPcV1RL9IptJrf+rFLBpf+Cwj+iUb8rla99m2jnD3EGHXf7AKEz?=
 =?iso-8859-2?Q?hyYoVvJaGFqXWUtOnFi1cKKQA6rA/8HL61Z8F8r4tBg3zlapxFY7QrgTWm?=
 =?iso-8859-2?Q?GnZc8Jn5G9z6/RskK1S9Qj+kuoqyoD5KtfbU8J5I4IoCusP7Bn4zEZe31O?=
 =?iso-8859-2?Q?QUdS0Xqa4HE2IRPxcaJDcmNlQ7GyBhljkVxW6xCCtUgxYcY5b5/1sEZ/5b?=
 =?iso-8859-2?Q?qyvp91Si/73wnQd63Q8/zClNJhLXpdLnO8z9+Zy2NOxnLWAbuj9//jWhn+?=
 =?iso-8859-2?Q?CtuU0pk/MwGBij1JdilAli2bIsWKLr/taDAB2ANkdPfXraEmvOLu84011P?=
 =?iso-8859-2?Q?68F+5RPEgEMvLnywEca0azGGb0rNDiWJ/Ozh1QkEfU4clch8UsfCkPc8uc?=
 =?iso-8859-2?Q?u9peXvHmpm9J1oc5g6zogmB2AmQ/43bCqF2U/t0RMS5BCKd/FQ0LM3w59Y?=
 =?iso-8859-2?Q?Pu5tstM9VBoxPZXLjgji5ozhSMXig+/gCa+veZZBCOOf58+z47MwiEDbUB?=
 =?iso-8859-2?Q?JWhaJu9oKboHU5gZjEtlEFsBAsaYhuhzv1r5Ouy6t5oyinDB6dAK5Or1zJ?=
 =?iso-8859-2?Q?QWPrtnm7P27YigbghIBeemUqiLrewLg1mWOWh9SoTGlH5fSh2NLL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2082079e-88f6-4e13-fe0e-08df20302f13
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:23.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0DBXW2Bz5rf+mkUO+VPHYiScYmX0bIDMMlubW6h898SGXl3PV2ydB4R7X80pqLbHorVUBbRJVWUYL8XrO/9aMVuQn7AxelEKv8yuVv5xVLs0CHvkrJiItG2gP9MMh9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

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
index f5249de004942..26d2a4fb9380e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -287,6 +287,11 @@ void snd_soc_component_set_aux(struct snd_soc_componen=
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
@@ -439,5 +444,8 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
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
index 09a3e737c23d9..bff24c68d7627 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -463,11 +463,6 @@ int devm_snd_soc_register_component(struct device *dev=
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
index a692edba8f07f..b339a0c7506e9 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1525,3 +1525,51 @@ int snd_soc_component_probe(struct snd_soc_component=
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
index 16bff4cbc27a5..db83256125959 100644
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

