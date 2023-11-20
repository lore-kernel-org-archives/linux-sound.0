Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C240AC54FB9
	for <linux-sound@archiver.kernel.org>; Mon, 20 Nov 2023 07:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbjKTHzw (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 20 Nov 2023 02:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjKTHzv (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 20 Nov 2023 02:55:51 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88638B9
        for <linux-sound@vger.kernel.org>; Sun, 19 Nov 2023 23:55:47 -0800 (PST)
X-UUID: 3444d51a877a11eea33bb35ae8d461a2-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZtwdwqEKXteybCdd9VF4J6p9HdhRid9iPWn0ifiy79k=;
        b=aRXnbMHkBXWdL2O9PaMQ7OjHlgZG0u8hnGER51oGfOzNSlG3DOSB8rSnAPVxpJRH9KQyjZeAdB++bWSuFpaPl/Em+quON+L24XRFZ8BXyVMy9aIHi2DBxJoKi7jmZKRR81CT7/FTiTDxdwgpemJVdmHwLFSK5RkmtPx1wzE3zQ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:9ccdce7c-c655-4488-b3e4-c7104e3884f8,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:fecd4160-c89d-4129-91cb-8ebfae4653fc,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3444d51a877a11eea33bb35ae8d461a2-20231120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <trevor.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1844944956; Mon, 20 Nov 2023 15:55:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 15:55:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 15:55:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZ9sgoGLzcpWhX/DXsBHoLVro3foKoxoLgdi4mTa4Ic1moJ0tPS/6oFTNcGnlcEJjc+IJ5BVKLnRYH4IzRdC096rt3HP36YeoASdGo4EtuCoKTnMgwFHKyd2AEP+R3dpcdOAqLLnX9lsPu54P+fehJETmyljZaE25DECGexHrMY6hRvFF47SiAeJY5dlbQArowlBDNr84h27/EIcZwXQd2/UCAkqDPdIWTjjXnRs0VrSVES/AiNgqlCK6XHYlXqcazrOLnN9Uk98+VUBtvqXvQF2QHLhH+qYiCsk8PUkr2rl6bfqovwjLHP46dsSj1LpKHJxysucoeM/ZYyf0G7QNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtwdwqEKXteybCdd9VF4J6p9HdhRid9iPWn0ifiy79k=;
 b=DEgB1fqJ7OjZZJpFIus9duGwUPY+DvMDbkUGXr5jDlbqQMiw7BTRKvwnIfMQovLoOrKNpXD3ve9avvy0Gm8uXsQvIKdBYNx7ja0cOi/8OZY0YWzYW8a+xw5uVZ16wuMaEckTbQuOYVsYRu4JzsunZY1KiGwwYxA5ShbX7r7j8LlJGOLfENMU38mlPRWKBQ/kOcXVB+W85WFx7+v1sHqPjVECxsdWtX4t707Hms3dRmp9cSlfIyBOYdAkOGeacFMKehUbUj3vxvi9sk+Jz+lT7KHWPzUov2QPuhzsck2I1Jhu7ORQgSjuQlyWvB3MMcxWXWPaBTEjST90bNjPVHIDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtwdwqEKXteybCdd9VF4J6p9HdhRid9iPWn0ifiy79k=;
 b=mIdT0NhUrQVli0PqU/td/L9BVoxDWkcmW7MJhZd4m3tiYCjdec3/tWKtTebwEB3T5GIYbatkSBZ7ICgC4bFOJF1PgwhKwm2KNPAsjllN/u/Q3n106LbzTTGhN7fJjhLzqxT7nTIS+AazDQvrkJ7C+nUv4KaqjH4MtjBITKdoVGI=
Received: from SEZPR03MB6690.apcprd03.prod.outlook.com (2603:1096:101:7d::13)
 by SEYPR03MB7271.apcprd03.prod.outlook.com (2603:1096:101:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 07:55:38 +0000
Received: from SEZPR03MB6690.apcprd03.prod.outlook.com
 ([fe80::91d3:b14a:19b9:82b5]) by SEZPR03MB6690.apcprd03.prod.outlook.com
 ([fe80::91d3:b14a:19b9:82b5%6]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 07:55:38 +0000
From:   =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "zhourui@huaqin.corp-partner.google.com" 
        <zhourui@huaqin.corp-partner.google.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?= 
        <Allen-KH.Cheng@mediatek.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "perex@perex.cz" <perex@perex.cz>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>
CC:     "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v7 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for
 mt8188-rt5682s
Thread-Topic: [PATCH v7 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp
 for mt8188-rt5682s
Thread-Index: AQHaGHBQr+F3ERTEXkK4PxPBkfKC9bCC3QSA
Date:   Mon, 20 Nov 2023 07:55:38 +0000
Message-ID: <f1b429e849621b772a529ba312e0aa8e715194b9.camel@mediatek.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
         <20231116093512.4180240-5-zhourui@huaqin.corp-partner.google.com>
In-Reply-To: <20231116093512.4180240-5-zhourui@huaqin.corp-partner.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6690:EE_|SEYPR03MB7271:EE_
x-ms-office365-filtering-correlation-id: c559d78e-0b79-4724-39a3-08dbe99e15d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6jmae7cevgNNmXbq/HkPc9sRrF2S3w74Cp1GD8Routg5UJl2LjU5zIpZurmc54cvubu7NavPHZG7tbtdSslO/eVRs2kccRI6FqGVPfbHJ7LU3NL01dvL9F/4CKlLDbD39riCHfCpw70SlaNl9WowfzMsCujidyH8Vfj5shqG8p527/PkT7fh0OMN0SngP+TEEWs7lsyoVUHbm7dZUuhr5FLdHHXxW9wTBkjQy8WgMLZWMsgYf2E3DCy36bJEJEMeQdZl2TiteA7qzj1UIoniQZ110TbCYl6ROmQmcGcScjE6far4Z5Iq+68EOTmFkISuAcmRaldkNDPwk2TX7vU70fLyQLuNkxb++yYkHWoNyehUdbEcH/7Oz54bWfHFC+TVPCooKNBf0jo3HhrKYUqNDESG5H3+b/NZO64WK7GS6maH6kBMIp6+2aF3Xwjls+R7dPVNsZTNJ2W0b1m+ui8Up16BU25P6LDzEL6hoqnYtpbH1G08XqMTrhDyYXUXXzXFWFTJBWYiGfzQUzpgDDafUTiqP+OG2bdW3Cm4r/EuDi6O8IEoflyxwBuCenznrt03RWBGHs4Jg6nxDEkCAcmDQ2nppecQVzEknkwLSGux5m+guP8Y2u4V9R/FEKU9svyNtJsb+LyNe6FTjXs9JbhYXh1kwjbV5b3dDOmZUmX/2epFl8eUMhu2hHrfH9UvzEdICwfAXjaMmxnZQz1ImbJFvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6690.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(86362001)(71200400001)(110136005)(91956017)(6486002)(6506007)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(316002)(54906003)(85182001)(558084003)(36756003)(122000001)(921008)(26005)(6512007)(2616005)(4001150100001)(7416002)(2906002)(41300700001)(478600001)(5660300002)(38100700002)(8936002)(8676002)(4326008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0lZNmNocWNTU3A1ajQrWW1XejNIWlVQSm54VUhsaEN4OVdTSXRzWXlTbVlM?=
 =?utf-8?B?UnEwNzNGdU1raU42TE9LeG1hZkd0WWZzbDlWUThsbnlUWkZvNmFyZjljRlNs?=
 =?utf-8?B?N21wUVlDYlJNVXFyOU9WR0xEeFhDd2NDVEd6VmlaYWJEeEp6NkVmVzl6Qmlr?=
 =?utf-8?B?NHYvWVNPM29hMTRjUDBLeVowbVg3Q0gvenViR1VzNEVKUG80OGtWbnB2Sm1J?=
 =?utf-8?B?SnhvZXFnRWphMk5tWVdyVmc0OFh1REc1d3RpNGxOdjdidFVYbnVGT3NUaU1v?=
 =?utf-8?B?ajQ0ak8wOW5rOHo5MEFNd1ZLdFhOcEpGZUZ6MjJlZDJnWTJqZjMxKzNaYkg1?=
 =?utf-8?B?WncrZWdZTUJFQjdVaTZjRTdaTU5WK0dSclBmSTgrQ2RMNXRtY1NPemtrbDVW?=
 =?utf-8?B?UmtmdmNITFhYT250dzVsU04wRkFuc2JYbnhrNzN2d29vWXJjQmFtWnM4c3ll?=
 =?utf-8?B?cmVCQlQyR0hPK1hqMklzQlVyWVZLQXdhclFOc0dPaUp0cTZ5WHdDUkVqTmN2?=
 =?utf-8?B?V1JQUDJtNmdnSDdocUx6N0NVWXdWYzlqN1JSeUVOOWdBK0FDNFEzc1lmMFFS?=
 =?utf-8?B?ODB4bFU5MTFXbmVmSnRkMVdIb1crZkNnU0t4QUNtQ0c4OXJ1VEZFZjRrL2dV?=
 =?utf-8?B?cnMydStyKy9NVkRyRXBkS1NSYWlRUkNkT3NMMjhoVkwyZ1JuWlNqRmlJZTB3?=
 =?utf-8?B?S0hkQnNzTXorWGszU1F4cm9Td0NvL3pXNTAzSG0yVFo5MHJZajZhaW1lR2xv?=
 =?utf-8?B?TlUyT3Q4blFWOU9nTnNZem4xOHc4OXYxUmJ3aXNpQWRZOEd3RWdUOWx6aUdm?=
 =?utf-8?B?dE9QVmI2SWxMM3NEOTk4dmtXWGE1SEY0VHdkKzZuanhPenp4bGFpaDRTL1JN?=
 =?utf-8?B?WWxMeHVZQUx0VFpvYThJa0ZFaTJwalViTXJqeERmWU1YQjViMUtsUmF1d1lP?=
 =?utf-8?B?NGVtQ3pVaTJ3NFlSdUVZeTdPTWlCd3Z5ekViRlFEUWszbStjRkdKeEZlZ1g2?=
 =?utf-8?B?cklSdlMwQkllS00yeVFLWmNaeUJOaG1wY0xmWUUvWkJUMkNYdlBmcjNPMGNU?=
 =?utf-8?B?L0NLLzFGNUdteTNXWURtMWVqa1BqREt6b3E2dEVibXFzRDNkR0ZsS3ptcEVG?=
 =?utf-8?B?NXdMNzk3UTdEUEt1M3Z1RUFoOUo5TTlqNS9BQnJESXpuaStldTcvc2g2VlBC?=
 =?utf-8?B?VG14NTgxaFJXeTR0N0diSWVuekpOcjZKQWRpdDh1ODdtT0RXY25DdmpHZ1Zi?=
 =?utf-8?B?RmR3bUhwT3BxR25lVGlrN2pGVFVwZUN2cEovTW56TWczVXdjb3B5UzR0Rm9t?=
 =?utf-8?B?U3RMRWtyY1Y5Ung2V3ZiY0JuMkMvQnpQV2FLMWd4cktCNkx5bU9LQ1Y0dWZX?=
 =?utf-8?B?LzZ4bkVVc1g4aEtPWXUwV0lqd21EVUhpeDJjNDIxUXpnejBybWpxVVMrWFM5?=
 =?utf-8?B?M3FHellEbmdLY3pQajA4SlJLcWhMbDI0Vk51V0JaMkNDcjNSdVJ4MEYvd3p4?=
 =?utf-8?B?UkN4RVJuVFQxeis4UHl1QWVLa25GMnQ2MXBKcGRsZk4zN2Q3RTFMK0o1SUlv?=
 =?utf-8?B?V3A2cnNYc0dybEMrTmNVL20vM0FuOUpNaVQ2WWprcGliWEIwdUp3T05UdFhR?=
 =?utf-8?B?cExhR1BuZFpCby8zQ3V4enNDRjhlYlp1SUltNlRERnAvQkVmUWRsamR1NnZE?=
 =?utf-8?B?Y1VreU9nRWh1NlVsemc0VUh6ejY0MjAvRmxUNEJsTXVYQitaenplZm9NLytO?=
 =?utf-8?B?K2JEUXZoeGtwSFJOSm5IYmFjWEx2TXBGMDNFOVkzMS95WnFIdjNvTG9XSFBm?=
 =?utf-8?B?YzNBWVJwbitnbXZLZU0rcHU4cERTN3FoeU1KbFE3WDlTTitVTmEwUWM2MVE0?=
 =?utf-8?B?SFNnbFVLTndKdGpmck9KbUh2NGp6Nk9LYmhrVzcva0h5YngxVkNERmtjUHZ6?=
 =?utf-8?B?ZnF5eHpuQ2ZPQW1VbmNUemlPWEhTVjg5dm15MVBESmM4V0JkVmIrM3FTNmc4?=
 =?utf-8?B?MXRSa29VQjY0a281bXp1VVpyeFFrK1NMOXdnRitaS1FKbEZNR0kzM2RZS0xa?=
 =?utf-8?B?WkNtd3pEOUxEWjNRUEx5YW84ellGMjdvblIyTkkxMlNzcncwWUhyZGRLdUw4?=
 =?utf-8?B?eEVpZlBkZkJEYkZyeDdtbmhrYTNsMHNlYXo2M1BROTZJNFE4L0tnZ1g0TW9H?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68E709CF86C25149A18A619AFF539CEA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6690.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c559d78e-0b79-4724-39a3-08dbe99e15d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 07:55:38.3036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Zwov8GdS0HiRGCG8WD0jVUb5+FyM5VmbluyAMJHbwV7rbCWEVYDdNb1I40GenOoPd+Dk7otd4gZGuyQH/GfLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7271
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.936700-8.000000
X-TMASE-MatchedRID: mIinBA9F1pzUL3YCMmnG4ia1MaKuob8PC/ExpXrHizwOkJQR4QWbsFAx
        5tLWDJRO1CbJ6gpAhADnftxNodBrx+e7iyWTLXhJ5gCHftmwEMJ9LQinZ4QefKU8D0b0qFy9f2d
        vDqroW0hOR/2EfV7J4AtuKBGekqUpbGVEmIfjf3uKiQGbiloS9PlkD2V3CPqE3I895CuxTbJyXT
        UoRv7XlBTxEE3BbRtMOfbyAG+7N/vQTXPmYM0+8Ng2r9cuAAjdsurJ6YG/QqY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.936700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 061DAD2599BCDD14638B25903E9B7D6452EAD9F1E9754BE2496C17F43D13347D2000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE3OjM1ICswODAwLCBSdWkgWmhvdSB3cm90ZToNCj4gIAkg
DQo+ICBFbmFibGUgc3VwcG9ydCBmb3IgZHVhbCBNQVg5ODM5MCBhbXBsaWZpZXJzIG9uIHRoZSBt
dDgxODgtcnQ1Njgycw0KPiBib2FyZC4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogUnVpIFpob3UgPHpob3VydWlAaHVhcWluLmNvcnAtcGFydG5l
ci5nb29nbGUuY29tPg0KDQoNClJldmlld2VkLWJ5OiBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRp
YXRlay5jb20+DQoNClRoYW5rcywNClRyZXZvcg0KDQo=
