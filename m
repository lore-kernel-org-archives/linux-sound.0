Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443589;
	b=dbE7Jk3dodSRNiMNnbLrugGeZiuECq8FmYcdg7AE/VqvPPJ0fJ9B79rA2a8/n10mfWJt
	 i9MhhTNRzEOg9Dn64hLOSTGwRb0nF3X/B2l7GY0/AZygKNMOVeNQD49jRfJn45UUCJrnV
	 2LSK1+wTzMS6QKoIzeLsNaTTaPtuLHhuCEwZcPBlNFKHT/aBooheatMFm3NqEH1X1Ny2O
	 pX3g5g+tU+mBT7j719F1U7kVO55zoZGQn281ja/nY6JuwD2dQx+w+mg15Na7zqke6rH/P
	 9K6GpcIbvHHyu2UENTy5jF/y6tawkkD5EgkIBRTGyIt5Id6e9IBUvVi7MPFpyoUpcXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443589;
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
	bh=P3raOKb/rtXSfW2RFBGD1ouPCeTxC6uZCAcXLqgz8ck=;
	b=JXRqVrNMJIay/KpSDCT5iD7tplrv+kbtTGVLuhe/zIqoxJOYXX2h9DDOCgjHWI5ytDbS
	 4T4PzMwmKLSwlpBkDfGbVMhgTiuj+cNpOKEhaCwg4SMZcJOMN/92/93L98zUPt2scCCcE
	 UJ5MlLtdQymRVRGb/G4eWwhXMofsBPLLe4ZVbuoY8P8/tD183mQBQhSNc4jii+uHpw3Gy
	 8EEcJ1t67P/J7zgIiFVw0ITi2QDm1FKN/OMP0M/Vh1sftC9MsilNF1Uf44JX37N1+obn4
	 OZMJdgTTqSOux4nvC5jJUepJIv7x6xmXJIR+gNyivGUUwZdaSOiCpeJmdibOeKOnDyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Z2ZAt4yX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.56
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474E606A326
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1474E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Z2ZAt4yX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzXqI5WPqdv0tt3hXfpHkHp1LwjkQV/fXaX7VBBXve/Bdb5VGWstxK7PeONPu9QJbn48xKBDisttF6lXotkRz4jr23biMBB3/aygzzfzo4oZLo9lhMOod0E5ue6PvxuqnMNG/u8OCwh3wF2korGCDXqI6QoZ9DSKvk/FADg+rR/NYEfFmBEpcVDH9BIhu2YbGohJDl2Q3OmPuJVHesZl4EgsXmLa8pfLYV1n4nbFkqoGwgF/XD1ZO7BGKh4TCBDVPmyFi/8wCr5i2hgkjHiQiHeOD1UCNHkxtMDkepDck0mAcOLG2HFp7aNtg4eLEHfzxvDZ7NLUWDWVLi42qDJEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3raOKb/rtXSfW2RFBGD1ouPCeTxC6uZCAcXLqgz8ck=;
 b=qUMtE6AOGSnUIBcoiJ1s74O9OcuVWqlWvfbSLM9aXBsXvfGnoGWj9wm8ta3LEg4cnTLfCw66RnLiFJlJDTZEUb/tdkZPop05eBXGIuTVEoNy/70Jtvz/PS8HfYC7qxFwWODc4ld2tvYRPwg+jdEhI2OHJU51b7nDV5fVcGRVctU7NNo8GgYrNHzj2BC6ThwblrXtCiz6eL2xjDXSbL8n9Own9zF9cjit+vZw1rt5luIZEeYM5UDEzkmqb+qzsvlTkWo7mMNwMlBOWTeDLhcN+WYduMb6xq6mxGBqEJXrrmtDkTNxvDaj3v0rc+zkRoAZyhUddOT0b3aQPhdVuOhirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3raOKb/rtXSfW2RFBGD1ouPCeTxC6uZCAcXLqgz8ck=;
 b=Z2ZAt4yXyCo7Hn2KBrzAJOm2SCAW04y8ZNnZiYifZj9CXWfSdYgegwkJogIl3JSGQbqJBmqrH9o6z4YdXCl5Ls4u56J71JA4tCbRCt+Sv0x4e6zlAM8928YhUBB1cLgXsA7Qgn08uHagCTTDG1obynn03e6uWSQkDXm2/Hqrd4Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:33:07 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:07 +0000
Message-ID: <87bj7u28jh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 17/27] ASoC: soc-component: add snd_soc_component_to_card()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:07 +0000
X-ClientProxiedBy: TYCP286CA0068.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 35e87cbe-f060-4d7f-bb87-08df4054857c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261102123227099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	RNteJ+Y8IKwZGY74vrCBDOkxeME+aWi+EfzldJsk/fQoCfPqNn2MEQ7vQkZSiScQ4gYyaO2FeIL/fdWKKT8LXOqKDTojYCw1K9CmczQst/i2VmUW1ulOIhSH+Xd67ad9m6IaOBFrvtIZFik6g61fIZSYQBF6NWr8Cs1HX/siT4YfZWjpPMg+PfaOrEshnpKDxrzPOZ+bS9KiQ4gR+p3f0WsDiJi5AGvy2ug4mze4ybU4jBJBHesQSHctLqjAW/N/7ZfTSkXv46CxL4nWS6pg7CqlxRgdAzsYBRMGiCqvfZP/wJqZ11a5Yy71j8HUewYRAyYCGFaLuSlibUcS/JOp0gO1DQc2hK8K6yKdQyFmP1/Cxuu0+monjX8KYrgf3PpwUqWiW4RKjMpBPqMza2d2QoY9m6XCQoujAxwobx041Tq8XNocm8nX/lZTFGXfFbYiqWWFPlrjZtd/LHkJuinnUYgRoHkvXMn2BZZPAX0qz77g2jbKa6ablANBi8FDB3enNKIxuBqf/d5sclN/jmnzYnAEPQiskTcE34D6+t3r9TccNux5uUn3Ddqy4PuJURMFc6oGu9fZEu5dFvgfMnKQHDv7Te4m0f90eF+Jr/alZHCGZgxgeckc+rdvxrFizwCCng8k9SkyGU/KCy/EuV0JuLx4OaxWASh94GfTA7WoF7yWEjMVMup7mDWTWaqjJdLQ/1Qq/7se9/MbziZB0zjZDI2xDIZ0YhreeyFbCeskOT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261102123227099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?4spFD4mBy69zf+QulHeKo2DfGgw/vWqADnQ+CnSVqiGZvx9apaqgGQknve?=
 =?iso-8859-2?Q?2YMV6lYi0A92R+WEGDk1ZQpTWHo11lx3fW97X8rUdwr8l8eEqBkz9LaW0C?=
 =?iso-8859-2?Q?NuJghg8aWlWuPdcQDSRaAsf4wlwQSOtj4OKynyayUwGbgX0TsGL23I8mGX?=
 =?iso-8859-2?Q?u+gXsc7OMws7vYBHxldjNb4VFUT2eSdaRVGBhuV5Qf3Vf6GKV1wz0NBKtx?=
 =?iso-8859-2?Q?z2fF4cpjb1/2BWn5q4/7Sb39I0IRDyv9jXuY3SktCIgKQVjK2DI2lQkm+o?=
 =?iso-8859-2?Q?6p/bNYcy315pcd0Fg92AHziVXJFlxudh3iwHoIWohjfuFPRqJMUuw9oySC?=
 =?iso-8859-2?Q?5Q8/QaAlc2QBGm2otMhHaeiMIVGRIJqxGYxeuhSsM5BWEZ2uUJVk2TEC0T?=
 =?iso-8859-2?Q?cfEhBpncC/2SWR+XywhaIQ53qutdr/ycNmqcTWM7KNd5j/Fa9vS9SZv2Qq?=
 =?iso-8859-2?Q?f+WXmjYep4U5ShPQ70wIF48I8xZdQ7qFeVd6yr8WeO460aFZxLiI3M/y4+?=
 =?iso-8859-2?Q?EPkkpvahSAFv1aOe7+zF2Em1mgOBNMt5U2QGl13TQ8tUS232h8JKCPUWEp?=
 =?iso-8859-2?Q?Hbw9YUTQ8AHp6C0vRWdPOm7IYO3CisvPjRYrx+L43ec+8zSpJbps0oHtjd?=
 =?iso-8859-2?Q?5+rIMEjkU737Y4KGSzq0qQIr+oZW9C0SOWAmYDS+sD0ab1AJ2sjSAQze/B?=
 =?iso-8859-2?Q?tnO1kalYoTMLRLzrzbcNZbKwOdMx5ANY2ENOcdSYOw5khpOewb/JMOdUMM?=
 =?iso-8859-2?Q?YhtNL9tjDlZueGq3J90eGupkhdw3xoiV5bWUOUR4mc0eYkJjZXIyb8iRdV?=
 =?iso-8859-2?Q?0sQhUHmZDwhUR5P6uujVi5WLCg7SrUvKNcu86mY+JwhB5IvISI/opI1C/2?=
 =?iso-8859-2?Q?qMrZLSFs6DYyS1a7pZL2up8pQrM+dZCZp8L/jdl/EAjSleVP/c1llrXg4o?=
 =?iso-8859-2?Q?jhpnsacstoCgqMGubUCTv9iLkdB+ZnSZVA+l/VIWRtTZl7TRPJH6ostCgs?=
 =?iso-8859-2?Q?71FeUV06Srz6bePdsHabfw84vvmd+mqJLAe2Ljx0+RRG1qo+afa5v9zLb4?=
 =?iso-8859-2?Q?9nQ20KBF+Oly4loU4iuc/bJYTOXlDrseRoMUsp8HB+1gMWHfC9wM139JzZ?=
 =?iso-8859-2?Q?0kvngAur0JQXOt4oek9OEVH+V3GkXKoCmhL+3WngCxYNfKLNWYuiPeKJn9?=
 =?iso-8859-2?Q?2zuA2Mnlnx6IN3vFjlshCtQiNlQpjeHBwUQcXR7fw+Xgn39NWk/WEqMqsc?=
 =?iso-8859-2?Q?63voa8nBG0qbJA8bA6XlrX5q+rAwabarwHP+E7shRdvV6kjzY5uIFu/PVt?=
 =?iso-8859-2?Q?CMSwc/xW/yA8T+Fn3Ty+8ocIcvuCk1ZZKkgJ2XKtn+a8oCJN75SYT0AkXF?=
 =?iso-8859-2?Q?+cC/0JGcvh6hNIglsZ5LU2ORB6TdZKe1DmQ9SiJrbm3+3bQbePvmSw4Idi?=
 =?iso-8859-2?Q?L1j5sCv2a+EWhDIvWk9WGCpPUDKkz2WmLiPOVZCtMMpldibZp6io6jlslB?=
 =?iso-8859-2?Q?sihbndUqqxz+x3alPIzN3BPNS3B/Kz7K9SD5IdSxWZ+TJGz1ZBaDnwE8J/?=
 =?iso-8859-2?Q?ZV9ezrhlbcJYf0zHg1Ht02RlVsPK5+MBUX4fq7kQaPjqh3d+M2zoXd6k9i?=
 =?iso-8859-2?Q?hk5Eimj6n/yfd/H7mE/wraQw8/3cwv+Xre3EeGj2DWlm2nMjASpyyy56XH?=
 =?iso-8859-2?Q?ixT7uS8GWr5nbPVRmeBlgxwwAe2z4Twfjmwa06E/Z4RjpcPwZmhQOhrYxV?=
 =?iso-8859-2?Q?D0vtaP7sLAKvzb4JiCcIb3KliNjQaIeHDMKE135JX/OXRJSGqGwuufS2uT?=
 =?iso-8859-2?Q?P9z62Iv75rxenX9JLpSLbObQtNR16M5LaVmRDug25I19HMcSugWS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e87cbe-f060-4d7f-bb87-08df4054857c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:07.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxdqsXXP2Z/psCK5NNl/6MyvMQVNXs60yZmRBadzi345NsX8h2iQkdXH0Mw/qt3tT/nM0wBw7MCV4gYto+lVhbwdv21HMfyFL11K0kYpItm2zXxTu8fGz3+YWWMbnWUO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_card() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d0b82374f2801..ec0e3d7264cc3 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -276,6 +276,7 @@ struct device *snd_soc_component_to_dev(struct snd_soc_=
component *component);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
 const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
+struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b501a7d65c68c..74d9d59d4aa03 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -80,6 +80,12 @@ snd_soc_component_to_driver(struct snd_soc_component *co=
mponent)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_driver);
=20
+struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent)
+{
+	return component->card;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_card);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

