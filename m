Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570960;
	b=ADo1gadkpGy+UeMjhEdQw6w+gCdZA4pzBwI6qVPrhPz+ST412CVBBAvGIRoZ0a14Et+o
	 V7cgLH6pf1NgMhSD26LmDI9yRwn5t50CK4BkrxHQ8Fn5W7uKFovK5/d56NcZa/ovjUnHN
	 ivTPkQdTa9wf2LdNWnHFdWz9Yc48obfxLHRB0sgGP80S+OlbXOv/5rZ7yE/eQ9ykkwq8C
	 f3YnM1OO8s5tdaCb7xnPpeV/0WY4AvrmtWz6V0zJ0ssOv2ivP51HY/lHyrnOqRHM450nH
	 dIuUyZIePLgCH33oIj7DuSod0zb5O1/ueZMCK5w6F8RhdAIUqkTkWAtOBVHhGqAdSZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570960;
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
	bh=RJocYkV+4PTUygQGBlKt7Tab6qMBCWqkxDEgD1k7IlE=;
	b=a6K6Sqae8VeN79YwMTE1PDjVSLMbPcDArWH4cmTBpCiJ8w0aVU4HAuXvrxox6UdR+bFa
	 I/XE6FKPjRT1ut3F/kmwWvf2L4MohY5OJab4cIMDfl1X6ZYT6fcOGrzeZ+9uKQ1OsVBQC
	 dIoYqZNoQJJE0MCJANXP/dRO0gOskAeAcrzXZKV5ITUMLGvRPSjUG+nHHghmL5E0cb+0s
	 TAIYA019d3ZoQVZ+MOfl/UA8eLLUYIPaBZ+Y6bwT/w2jLitbwjYNp5RKLgKKlL01vmrb/
	 juOpi572e4hV6adiDx9AFBQFD2Aqg5SDWfhatOZ/V3ti2OyJ/Ue2BpyTj8VnppYH7zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=j65RPk5S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.41
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5AC606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=j65RPk5S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD4fSI27rIV4NQhXwrcSZGCBWwCpr3JukmK1td/m5pb3ZY4L8zx0j77rDmisqjGrtdCwP/fOxmk+VjUsM4Bwlv4RbpUyvCEJ1qD2Vf8ZYZgLRvQVFuyoShlQmNQy1eUV/GIDfGlkZBXxBi4ovU8CKi3POteUOyJyZJxpVD78VqJ1lXW8JebuLrg8SSTKKUlfhucg8+ifi2C4fClJd1vrgs17aLDL7i4LONVxWGQCtV+c8blnEnqwCEbDErtIIIsNQqtjBFlqPUiMfEvlNsCCybUtzprkE+q8oQF/blTo4UrWCAEpqXtsc2fRRm5CllkHkhROHs07yAFRm4PH11OVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJocYkV+4PTUygQGBlKt7Tab6qMBCWqkxDEgD1k7IlE=;
 b=APiIMD3hSG2KDWSUDklRdxhONDCeYy322rXox4Oui/zGF+LsbDLHi8D/ZYSq34KGGIOhjLTYe/Ajt+VskpYWTlsrVu2xxUSyAGGWh0XKckV2/sByaF6rahUmQccAPIMx3cjXY0hxGn4z+LEsYDPJ3riGvYJcb/HG6z61IWIWWfjwBi3VDZu2kQEdnUsp7jxbSqAMBTx35AesV1u4nB+iR9ME5K/e3XIa4d9cD3oJlfbQZZZmP38GCw8J7bccVskYtk/QGrx4pXYPDG2hB4qFdSSClVifjrvbpEz7W0E9FyIrtXGJHZGDOgxalEsH5S5AXA06AEQVgbmzGpTryeNndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJocYkV+4PTUygQGBlKt7Tab6qMBCWqkxDEgD1k7IlE=;
 b=j65RPk5S0X7pMUzU8AZhPQwGVWZDq5HdipeCwzIMb13mr0QYDbTE0k8M/8+XeGx6FxRTMYD41IT4QWsPtwLDMxdbqPBMJTZu2ucdFDhCmSYdsXXa0n/GSRA16fPnO4lLI7M9ytCHQiIn7pQSKPHDlyxqvDfT4rcCJoesSgMg+Ls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB10476.jpnprd01.prod.outlook.com
 (2603:1096:400:304::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:42:36 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:36 +0000
Message-ID: <87y0ahelf8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/27] ASoC: soc-generic-dmaengine-pcm: use snd_soc_component_unregister()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:42:36 +0000
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d52b6c6-5a6f-4400-df50-08df4a9561d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|376014|1800799024|10067099003|38350700014|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mucJKY8JudbGH68BiUkGyAuatTp/NWNvtffd6Wr943gKl/KR5r5VEOFp6/aFnUnkJeKVjRb8z6kBmDXxsRyu/fdkyVrngicrIgDgsU1fw/NtsK6Gouzeqad0fptBmVIviUXRXHPXQ8zBIJGsUR857qINIXD9ZsJHl2spPDE6FGjdDGn4OwtdGGKDZKPjvZ3Mb009Yqg7oYwwuuOpnGEKYIB+Y/CKjNQj1HJ0mQMtk9JMqhy69Zk805v2gYodIEPTmpCncma4gs/ZsCTVvDhpdVXN/pi0evw35YL6QhuTb9opnQRa48ltuxSoXbTtNakSW/AOMVGuhIsTxiKExA8sF3CSZX8wWzTqPI3PP8QZWL8WZlgk1WbkCI8H7EufiFNbf5iKG4MUBWUxUx3ZnNCUbvJVK6Xw8JklJv2/XXQgphMVBu72PFBiAopHMIZ0ja3JhIn7OH+ViUTFr4MDmuTDAFvTpzK4TbEvEH/SzTQj19tc3Klm9kLGkpkk7+dzhCXR5hX0YsR5Kk1UZIg5EVD4hB+3hWxqrqpd53+tkgVc/hgBs9m+pHw5UR92LkzdWmtE6B7KoY6+j4JIVMiuapgADauIIhcKW3e/qpjaK3LT0oC1lIP5qu9zASevQGvXrX1zNiJkzkw5OfMpM7SHYTimYl9nvvPzhGY5+GRf3Kz2A14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(376014)(1800799024)(10067099003)(38350700014)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?mNT8gaK+y4lkohOKOoC1RF0kg8sPNMp3Xok4tVZeLgS7nthIncpQiZTcdj?=
 =?iso-8859-2?Q?pRcH1Vh7AbZ3qaoAimQKsRu8Ng8vpq3s91QJXGD4W9OwnLwe4E5PoiMD6e?=
 =?iso-8859-2?Q?ndTiz+/jnFyIK26358BuBlukywCyUGmAyMvj83KKRPZN1zReATiwJ0IK56?=
 =?iso-8859-2?Q?+FIAltc50ItFxj/NNWlZPdQuSiOA82Fjev8m84PDAfqwUnljZl/BwgltfB?=
 =?iso-8859-2?Q?5GAJwHQhhY7DxzC/L0cgsxRJW/2iqSQhsmVtAM2tVa+v4PB75NbOh/Qi0K?=
 =?iso-8859-2?Q?SU4TtHCZbo266YjWeOu6DTMdpaLpFR3oqqj3lUO9Itv0xvD3eTXnlw8yAf?=
 =?iso-8859-2?Q?Kuyj/zekd11N9yeMPD2EYqkxsKtqUZ32ax07ZZbPwj8WUyvJKnOoeZuA/N?=
 =?iso-8859-2?Q?+HuMNRMN8gpdbV5AY2zmZiocOYbpEnJp2otN6aZKUJTqH8ILjE4GFzxEns?=
 =?iso-8859-2?Q?13ERnsz5NrRjQgfPIDm7USf74i9CBcMG2PbyewsSgd/6ZQ2Yi5jLHPv1iI?=
 =?iso-8859-2?Q?q4m/h4BUk+4jXsvhHD7Hq5orsJcpaJdpm5b4o62Wv4hQlBD/OnAqWOBfLa?=
 =?iso-8859-2?Q?q87H5kpVkIU23154Co2ciN/J8d6S7CvcIIGVTQnno/VwkctswKiLo97czn?=
 =?iso-8859-2?Q?6LefA5zvqvHccSsTnboa+rk1Wz6UWkxwZRxLsMweY3QqUPGk07oopyI5rP?=
 =?iso-8859-2?Q?IyBPAWOV3BREmxSxlHKeFT9/NSN87UyRRukdgQh2hhOE7E452iFsyGHJv5?=
 =?iso-8859-2?Q?7KkWFRe6MdpCb9BKyQR1Q7dXCtdtqdAqagrp5s9RATUXRVyItYTNphFAlO?=
 =?iso-8859-2?Q?QaEQPogcQk+P2/9vTDYOPxGswPJvq7dLjjopE91/mC3fUnseQXSM8bAcqf?=
 =?iso-8859-2?Q?GasFzwwtXlb9tndVUSVmle9DZ3mUSztUKvH1jAbFGRhKytYTddghAvNmhl?=
 =?iso-8859-2?Q?IH+BwHRqE61MF+A/W9nd6Zc4W+2ltrh/wkz8m0lbLbm6ZWYFtXuzDY95Xj?=
 =?iso-8859-2?Q?MqpIaFYSBZMRvfqxDmDS2ZsLcrvFhwZyD6/5CALf4B34Ov+cLTXOkSUUUz?=
 =?iso-8859-2?Q?4H/NnJgLQozf3dUukU1M1sPaQNJkC4H/7BSLV/MR0+bcFtGUlrrv6STgXI?=
 =?iso-8859-2?Q?Mm3YUQTOSMfRqjzwg7e1HX0TVipmY8loE8SajWY3KSHi4RQmzSkkVZmzbh?=
 =?iso-8859-2?Q?FcNvWWmlHSMi9+DfZkHBbU9x+db9roqcMtyt6tQi/v1uty70SXuMsgPGzr?=
 =?iso-8859-2?Q?AMTQn4sXvNiIBQenWqiI1BhIdppT0hMNCiKrVbCiTe6Li/6jwgNz56wcQs?=
 =?iso-8859-2?Q?iG0xy06yT+dTGAl5GvyMDYlJe/7mdK1e2SEB2wUTiIwp3B97U0qaKY62OG?=
 =?iso-8859-2?Q?Yq3SI2MngRc1CNvEuYgM30LVKhP6DnSOWlug1NPSI+Hw5BIgIIbAw9eUTv?=
 =?iso-8859-2?Q?3ivY2fWoSFrcBny9TyDnfkSbEY4QBHeYWH8OXkUchneQ/vCoaUAh06FFNm?=
 =?iso-8859-2?Q?vOgNCZdMyi5wiu8+N7jvcQTK5JxiQc8IMP2J/kpCSf5OCfZ2ddHZBj+f1S?=
 =?iso-8859-2?Q?65Huxl3tiJFF/x37EfC7O/0nUx/3cOZhxR2uSVG9lyBiHnORllE4HXXrTO?=
 =?iso-8859-2?Q?fhvRvfxQJ6uwaEc+eEIHiMjV7UReTp7FuVH3bN2XtCxFEUK7AROnq5J7df?=
 =?iso-8859-2?Q?DO6RKiILN5FofCikemJ/pH1IPwVKtPevAKJcrkm7vYAjK8reaWJaShqfTN?=
 =?iso-8859-2?Q?SiUjVzFCgfYFVeMeh9XOL3Bn/Ar2HEZIFsq0XupYaaQhNOI3AJeIWJPA3o?=
 =?iso-8859-2?Q?rOB5QmVNbokzAwU/ZKp71Zh79akxElg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d52b6c6-5a6f-4400-df50-08df4a9561d7
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:36.2946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxpGwgv2rTuQcDsUx7v8j+1JluJQ8FC75kfTZhsDIZMM8lO9cIOlFUnMlGR7N7yz1GCK+FZfATO33Zc95XulMAo2tXHE6oIZib6m3VUKUkEkeu3e780phc9t+ie0NPlM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476

Current snd_dmaengine_pcm_unregister() (X) is using
snd_soc_unregister_component_by_driver() (Y) to unregister component.

(X)	void snd_dmaengine_pcm_unregister(...)
	{
(Z)		component =3D snd_soc_lookup_component(...);
		...
(p)		pcm =3D snd_soc_component_to_priv(component);

(Y)		snd_soc_unregister_component_by_driver(...);
(p)		dmaengine_pcm_release_chan(pcm);
(p)		kfree(pcm);
	}

But it try to unregister all components from dev (a).

(Y)	void snd_soc_unregister_component(...)
	{
		...
		while (1) {
(Z)			component =3D snd_soc_lookup_component_nolocked(...);
			...
(a)			snd_soc_component_unregister(component);
		}
	}

snd_dmaengine_pcm_unregister() (X) need to care/free pcm which is connected
to component (=3D p). Both (X) and (Y) are using lookup_component (Z).
So (X) can handle first component/pcm (p), but can't handle 2nd or more
component/pcm eventhough (X) was called multiple times, because (Y)
unregister all components. Let's call snd_soc_component_unregister() (a)
instead of snd_soc_unregister_component_by_driver() (Y) in (X), and
unregister target component only, not all.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-206296@kernel.org
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-=
dmaengine-pcm.c
index 1ecf3feb2bed0..62f86d97668ef 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -514,7 +514,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
=20
 	pcm =3D snd_soc_component_to_priv(component);
=20
-	snd_soc_unregister_component_by_driver(dev, component->driver);
+	snd_soc_component_unregister(component);
 	dmaengine_pcm_release_chan(pcm);
 	kfree(pcm);
 }
--=20
2.53.0

