Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B73931E82E
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909512; cv=fail; b=u/hbATNWpvfjakhNImfwzkVCUov2I6/+u+bUNuPwkEJHFLWGvCarDVakd6H39T4T/BSjmAMSU+1OdH9hD3l5/nrdnQDHhU/Sai9gNiETguAqiLeL0/3gUFplpZsblBfrqZgz1m55I8fD/ic1GbBFWZD6/tjhuy3HEhElVORldEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909512; c=relaxed/simple;
	bh=VSRIbNrHq3UUMJBH6ucTFwBOMPXRV7UYdlGJpQ5hpCI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sOeuikZfLUOULi9fo50D56m8za1X224dCdLoGN/p4rkuCZt8Tqdr+8WqBzUsPveXkZbaOjxYhe38qHvR2LQztQW/c3SpVPbu8oZ1uCCRYIURVs1Wk/i4rz/bCfIh5TM38ZggmUOP2UXGFmcmvBuZKt2wWnesAoPUaQHy2V/Pc0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B8JFqMw1; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B8JFqMw1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI1OxGzcA+LACLJvHyOQ126SfPYZAKJGAylvc3KAxM5js1H2xy+kQOS1y5mJf+fA9O3d5DhIf41JzSQobrDDCoZAWbzovpi1LEENz2SFBUhY0OZRsOHQL+TV9f9koz3QW3IJlCFl2D3n6Go7ZGsDj8YIJMvHwE2ZRdk7gky+PftuQgGaxmiJAQsoFmTXIbmHDtPeRMxc1uWw+vdoL6fGxMF92pPSHQqMkTr2JIXYv9qdMucTzqNkPn3kzWxm9rg/tqD5cx40u6nMJPz5cJp/1b0dmFK3bNo+9qjqXVIj2PeQR4IBPpvRQQnPlxWiYuryib+u81s2AY1iJfy3gG/HNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBPqOrz4RnXfKvqg6TGQM37y0yfsF2a+tM/l5CwoX7I=;
 b=r4AABTztC1/ornUfoD2uilOHKlUq6L0/1CojjicW8yOALT4rCLyxi7AJ8SLo3RUEUxInLa50D1Mecsmp9uI6o6xKAiJcfuJGgzdEtR4dZTZTYw8cX7pXpvUzgxU/5oT62Apaosb4LvxVg4yJsdhUJqaTLEXv6vhrVWWzomAnmrz2OfWtXAQiGD2EIAgmjRx2KiZ3Z2shLnGrEFe3P+Ev3xuSOHXqterllUXkNv/M1i+IqMhdFXK5Kwszfr+rdL5tDcR0MACnpQijKxyYm99NCqPDEn2R78ObWuwYOdRVNiB1vUjZNXudDlfW+/j8+1R/lM6VEEcnKjy06F+AXFCpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBPqOrz4RnXfKvqg6TGQM37y0yfsF2a+tM/l5CwoX7I=;
 b=B8JFqMw1yA5J7SHfOaYHvDjoubAWM+G2MqTBXar4t8eRD5bDpUouuUAu3ovTtmQS78xTltvRH82gbD5lvu1mGlazjaxrZAa0+Emdt+sZBLCJuFcbB/oa2aYI7GvnFfc46dS7ijvVZ52xqt4EFZZP5s9mOnitUiqCFldfELeArdI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:51:49 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:51:49 +0000
Message-ID: <87h5j46chn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/13] ASoC: soc-component: move snd_soc_component_fixup_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:51:48 +0000
X-ClientProxiedBy: TYCP286CA0226.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::20) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: 2100bbcd-470d-4eab-5c67-08df20301ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1kdKaiWUJH4Suf8aJko/cNNoXG94HQ/Rb+6fAIYPzWS3VV1LEpzZSP5KKKlB1/nZFhBx+qxPpbpvZ9LYJVDlqN6QDiTmJh6bOi3aul82185dtmdesPuGOsnPjFHyZhW61zufeYmSgK45Hq9W+kwmhz/Wnb3FJsBXOCQnQFliRh6jhQzcVcuMqLGqnmSe+wELUUVhJnxD+8//Zb/W150z9TcsUOpId9F0qxMxcJrMGLYVhgDmKK/qtNrqeeOSwEO28vi1CSyR4zf8Hg1PrRzpFInci1sKNkwQKiBfcw3PfQtJnxqnzWC/HWlnrAB5WaHLdk3TB1oE/qSgIpTa4wUurvyOTEtfs5kX4YDgjXoj5xmcBstrxPgsQ3OVxIpjGShr2kmaYVZaMk9hj6L3yGCqO+8sdGjomDpBVH66jUCLCv3iVJ2jwYNs9hZ+QJaENKWEa4sx/3VBL3nojVrfY6b0s+i4AHxS5ltpbIpTHW5j1tO9n47GIeOj1DNDK6KJoyBfNSSuObR26mOZj7blPgk5qX+SyUpvQ+tr6g4NZqic9zDbAUZtqNLpcqVsQeCGuB0Wlz3+1aiT+HDvG+egtz2X5V1rMR5ExaRy6cKpNvvMKo9dHBdEgZIFOW+uGStpX7iceofmmBGvdDGfSbO/qhr3sY2RweZ6Ko5BR5elrJ3AikmYiDyTJojNw/mVhs06VKNm+5vhcZtB5D0tg5aMe35YSg7dwBrcuEVA4PUHqxTesjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?heqLyM1lqDmM2CCunAleynN9nem3ceqn+YJoQEzXhXI8RHnnSrws12DDb1?=
 =?iso-8859-2?Q?twOoLr+eFTaQov/HZQRR7Q4iGkunG3iNkKq1Ea9ai6gRMjAjbmzfNJ+sr+?=
 =?iso-8859-2?Q?Yl//0tYAmoQvZSnS8GjfbaPC9mGvr14dAUFhB6JDxOIRCbXeHs6w7iPhxR?=
 =?iso-8859-2?Q?BjNRSzuY/Rh7HbdwBoX+HzJVp0aMmV+ja/c3GrDNhiRgRXc+kmDHEeLFYp?=
 =?iso-8859-2?Q?Oat9Jp+04FwJIwBy/InR9d3YdPg7pjDc+czGhJQ3mx+8wANjOnCwwBZJZN?=
 =?iso-8859-2?Q?z4VY0GoK0luz3Rx1TYp/FfrH5mcGdk/z4GL6h2c47XJeSVnDom4fooScmy?=
 =?iso-8859-2?Q?q+eYWktkIEOSwaf+kSx8srJZ6B7mjma4dbghcNCSM4fdh2tSqSKKQzizPv?=
 =?iso-8859-2?Q?iFSrxO5efjpKRWgVQJK0pf9sykCzxdy8g6PDZFd4w4ehamSg3PE34fWkPX?=
 =?iso-8859-2?Q?kFr6gH7YiHb6BBoxQ+T8iI7kEA0WYkVk+1f59T2dWAMbyDjJUWHmwRYrTY?=
 =?iso-8859-2?Q?KPfMQHYpO7iBLHj7QMbET1EM1SpY8dmCLEDbYG/gblg6elxR9zx+3wqXxU?=
 =?iso-8859-2?Q?TitvR4j8vJ033WgICi/CzP1OAJh5wTC2oWiUwbPMeOmIRyV6uBZTEXgvh1?=
 =?iso-8859-2?Q?1E6YlVcqLp+QHSTJzRhIQy7z4n5P3eKu+wIY0jPtcmckLoW3aXZs1zfqnB?=
 =?iso-8859-2?Q?J6Khr/7BfYVlhA6wzINkGF7llDck5uPDxkURwKmWesuESBaxHxY+xdo+EH?=
 =?iso-8859-2?Q?+FDAwUy1kTfWUzwi2kbTAOVdNiJJWaGC/VDzjyoAAYxThEomGxrJ1wpcxy?=
 =?iso-8859-2?Q?+OsZHK00OiLYSmeOthylGpAjNEbvHOkHdUex1CqPM8wlYCXCCJn58S7M+c?=
 =?iso-8859-2?Q?WmC1LrC49OPBU8tE6BHe4kdy7fc9nT6ETRyrlTGUZTXq0S68JE2zPBMibf?=
 =?iso-8859-2?Q?n3Qc1OwtQSM+AC6hpgJmQdZXaf6kTjEOSXo6c4zBrELAWNw0osb0OKIv5F?=
 =?iso-8859-2?Q?gGnxqBHsyO3/U9LQRZeZaiHQZ+Wj6khV/ZvJ4//xaUEP7bjbMNK3f96NF1?=
 =?iso-8859-2?Q?QlaoXlMamhRiCGZ4a+NVGSkse1eB9nDLVjPbAwp6u8cQhU8T9aXskQcpGv?=
 =?iso-8859-2?Q?Djp+dZw9payF2kM2uzWoAba35qfmVw9aK8Cng17BjcRX/17rn4gRDXnIpr?=
 =?iso-8859-2?Q?qocciaijWMlkXlWDMzOVxMskeINk3atWnoewgQCb55haSu2KzGfHFxZKGg?=
 =?iso-8859-2?Q?6kfT2JjKxdchAtBpLOfq2WNq82F8Mwa7Z0zLOhKU1GZtBtkn1K9fqVX+kI?=
 =?iso-8859-2?Q?2739/3pBUja4CNiL7wTXFmx5A5ByzY6YaFKNMSbF2GAoAsInLMlm/iUK68?=
 =?iso-8859-2?Q?KKACuWK3p6ryz5fMzgyjiy1u6xMlJieA+PaRqUAujoGQVM2si6e4h2Boj6?=
 =?iso-8859-2?Q?CzGysgO/EyK7NfdzXwPKSiWQMHcMO8qZGb0T4XR9pd8nPRTOcWMhgsADrO?=
 =?iso-8859-2?Q?sqCpj5adpRQ1JBxP6lClumhlTgr/8zOC5Y1tF/bl6TQLlVWAyRjyFfVXVn?=
 =?iso-8859-2?Q?4cXV2o8oKbJHl/0mIsTftZLivpwhn5qrfJRS772GiN0qHe3YILO5CM23U5?=
 =?iso-8859-2?Q?xFfe6XKRgvfXTz3hqbnoHfjMnq5iMxASVEe03a0B7qE6MCPdMkQoHFYpHo?=
 =?iso-8859-2?Q?FEWXinX1zsjLtM2YpKOiyVvSVoB+hhMF3cqeHfb2F/PUbcAMTpBK+aQL5T?=
 =?iso-8859-2?Q?oWg3/9iF59+ZTlnTzT+Rn9x12yAeoCHLGRfeMTnGfY4EqkQ0GIGepfd6XA?=
 =?iso-8859-2?Q?Zh5LRhowmA7539qwlTnea70wbSQJEq8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2100bbcd-470d-4eab-5c67-08df20301ac5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:51:49.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEjbGV7+Ic57Lq/Fb5Rp6Oijm5/ZH0UoMtPVtSg87k/AhBhB3g1Urg0oy+Un/nyhJraVtoUCYME7u1so1eFGyOqFYzIzs6jX0XMGy30NDBRPyQ46x0irP+Ww8QX07tv8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

snd_soc_component_xxx_controls() are located between _probe()
and _remove() in soc-component.c, and are located in scattered
positions in soc-component.h. Fixup them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  2 +-
 sound/soc/soc-component.c     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d83ba2996653e..7708d84af8853 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -355,6 +355,7 @@ void snd_soc_component_init_regmap(struct snd_soc_compo=
nent *component,
 void snd_soc_component_exit_regmap(struct snd_soc_component *component);
 #endif
=20
+int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
 				const struct snd_kcontrol_new *controls, unsigned int num_controls);
=20
@@ -404,7 +405,6 @@ void snd_soc_component_suspend(struct snd_soc_component=
 *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
-int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 709d78ee92fd5..6077d07f873f5 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -340,6 +340,12 @@ int snd_soc_component_probe(struct snd_soc_component *=
component)
 	return soc_component_ret(component, ret);
 }
=20
+void snd_soc_component_remove(struct snd_soc_component *component)
+{
+	if (component->driver->remove)
+		component->driver->remove(component);
+}
+
 /**
  * snd_soc_component_add_controls - Add an array of controls to a componen=
t.
  *
@@ -370,12 +376,6 @@ int snd_soc_component_fixup_controls(struct snd_soc_co=
mponent *component)
 	return soc_component_ret(component, ret);
 }
=20
-void snd_soc_component_remove(struct snd_soc_component *component)
-{
-	if (component->driver->remove)
-		component->driver->remove(component);
-}
-
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep)
 {
--=20
2.53.0

