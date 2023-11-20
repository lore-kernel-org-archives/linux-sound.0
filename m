Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77186C197A0
	for <linux-sound@archiver.kernel.org>; Mon, 20 Nov 2023 07:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjKTHve (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 20 Nov 2023 02:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjKTHvd (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 20 Nov 2023 02:51:33 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C273B9
        for <linux-sound@vger.kernel.org>; Sun, 19 Nov 2023 23:51:29 -0800 (PST)
X-UUID: 9aab8aca877911ee8051498923ad61e6-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8+siMiZdeDJIVJfP5subLJ9r+Vd2BJCXZ0jNaNRNOV8=;
        b=K2fLiS6zm/7ER3Nc3Ur5+Cp69oOxddPcuNpUguBpmNXhyTuxThG4fVz4nKr7NYs8652zz9DAhz5rNc/wyZyNNUf1ovbtOjU19x35skgD1ueA0QH1X+ndRoVR9eAQlkRpUjqNuHQDmBjooshQ5IvN1BJ5t/PtzzDfp1IqflrPU+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:88eb63f4-fcda-474c-a1d3-871355bba3ea,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:d1c04160-c89d-4129-91cb-8ebfae4653fc,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9aab8aca877911ee8051498923ad61e6-20231120
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <trevor.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 311273215; Mon, 20 Nov 2023 15:51:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 15:51:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 15:51:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMisk2HWoSNOXmMDMYp/hqn6O6H2EJlMObjt64R4wCu8pvc7dqLi2+ILgMfv1ovfFpm9auq3uxKzXsr+Wqg7siakIdRkQksn7flLfU8afTRlW7UtzRNhx+RV94+53ZlO4VmQ+fluK1OPyWqC/c5EI88WUDMCRZ+tKICQFdrtIdSXnjzSne3q3BT7VMEMlGJjw26e2IXGjkqS+D/UKriv06Y/R0rAMC6CylVvL5ctrVH5cFRRkoyuu5p82f8ApbVwfpxyLLvYEDSAGVV/JpC97r6ozILhIKzWWr46TppKqnyB18P+sArzh1GGQXfT7T+JGPX7pfQlG/rbEpuKjbvM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+siMiZdeDJIVJfP5subLJ9r+Vd2BJCXZ0jNaNRNOV8=;
 b=KO5Uk932kSUJP7rEZzIBtBmQWlDIC6v+cIIhz9PZjfODlZ4HUbvdfkL0l4ZOoImYXR+nXP1FCQqsTS2Ghk87eCzCzsb/eqv7/Fz5wsKHypjIp6VqbyUI4IndEOxg0vgIHrA9PXULYuHcrFlJZVSq73AxSFdOk3iI/3Ab1s1t3ES3/C2GN5FPKHbWakVYt+GAL6FQI0Z9T8z+9ATjege4G153oYzDNts3yMIZ4Fh+YEEJFBks4cCdijIa18OZDE/rQxEOt1/56n1PVkM35bOe78tUXnr6ocoh7/spzbEYMpziRkNcL4zBLdN3sgKIld/7h+6n0TmdJHWJrzXrhp6wiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+siMiZdeDJIVJfP5subLJ9r+Vd2BJCXZ0jNaNRNOV8=;
 b=j2tjhrXT1WuNctEyzrtcTU9h+NmFl8MVfVzeNmxNDAINY6KynWDXv2Cxoocy3rbs47dUPQ1nSuXTeL+0GOZtEBzLnUquA/cqrrRo/Hrr6uYSTO3jCT4H1Zr+Kzy0t8LFYJLSS5JBAKNgDq7zwyU8thsN+u04qR+RjwZjasGldSQ=
Received: from SEZPR03MB6690.apcprd03.prod.outlook.com (2603:1096:101:7d::13)
 by SEYPR03MB7588.apcprd03.prod.outlook.com (2603:1096:101:146::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 07:51:20 +0000
Received: from SEZPR03MB6690.apcprd03.prod.outlook.com
 ([fe80::91d3:b14a:19b9:82b5]) by SEZPR03MB6690.apcprd03.prod.outlook.com
 ([fe80::91d3:b14a:19b9:82b5%6]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 07:51:20 +0000
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
Subject: Re: [PATCH v7 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Thread-Topic: [PATCH v7 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Thread-Index: AQHaGHBrk/52dPi/qkii4yWJ6J+aM7CC29CA
Date:   Mon, 20 Nov 2023 07:51:20 +0000
Message-ID: <abb1a06029089a0fd4544f1c63cf9986357997ce.camel@mediatek.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
         <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
In-Reply-To: <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6690:EE_|SEYPR03MB7588:EE_
x-ms-office365-filtering-correlation-id: 53ccbc10-41f8-430a-3f21-08dbe99d7bfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nu40bxni6n1FlQp0WkdUUbPzeNdH3HR1o4VykN97s92GCNR4FSWfZwCoZtmlRr8LrSXH2I4zXfdmyJzRLmbfSCRyI4rQltexSVraJJHXxe7qv1Ky5BzhCiYEpbtIZcV1n5HPlT4hLmtfALnNLms9AzP1dmBtYeWaQXUJGaT9Vprgi7TlKUlFrkzvrLuN2i1MK9HyDC1yMkNe7nXEopQNiJrbtnfCiy86nQw5XsUVS4z8wByuFSUUI9G+fYawfE7btch51gCV9vhllk7kuL1gFr3c4QZFL4NnWKRV+43Id2YZYrHzlZh9J/c8V6u0HruLb0RTIB1q25LJm4UVFuhXX1SMX4yCkzIMZYF6kWTtS9wH3NTUHaQiO87ORmCCjOKn1ljz7iuMQ/U0FblftEc41FEfNSwnKd/CoF4uTGXlFracIFmKq3lxaizNv7cvSY5GVvX1ok9lkdSPvO64YLHuxfKhfv9HzRPpmTVcwUwY7Erk5Reicj/pdwelXVZUDfQgEib0a2tLdsczszOypVzPtwA34N55lUUg9ZhIacEFa76+7J1BnlJjoYe1RwakzzbLog/+JXJS2811AlSFawbv7pIY4PX+OEwxqGc2lsjCoffYDm+/zqy30dS/FB3tevkMEbbJLdcHX0vXqjH+kgIdZCbZomn6R/8a8fmnJpSb9t9OJ2awgIcZhzmnGQR/AP83ZDID47SHowHpEjFH3IC23Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6690.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(6512007)(26005)(8676002)(41300700001)(4326008)(38100700002)(8936002)(7416002)(4001150100001)(2906002)(5660300002)(478600001)(6486002)(6506007)(71200400001)(91956017)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(54906003)(316002)(36756003)(558084003)(85182001)(921008)(122000001)(86362001)(38070700009)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVVMeW5ZWWNQSmZRdnNuY2VKWVlEMFlXN044eURISnhLWGViclFVZk9oV2pr?=
 =?utf-8?B?THlOVk5Kam5kRWhWQ0dvcjUyTDVjSXNocUk2ZnZkRFJFWGFsZFg4allyR0hv?=
 =?utf-8?B?U2dVVm8vR3RXN3F2STdjdXUvbHVoN0dYRXoxOEZ1TmV3aXlyWTdkb09hYUxU?=
 =?utf-8?B?c281WDF6UEtFVW8xemh3S1RXZ0RYdUFYYXQ2Sjk2cEh0eDZZOHR3MVF4REQx?=
 =?utf-8?B?dTlhMTV5ZGUrSW1FTFV2UE9xd29LWjBmTG9YcmhGbTl5aVdFcU1MTEQ2TzBC?=
 =?utf-8?B?b0oycTNNSWFyb1VDMmtkcnJrRC9DczlpSzNVclpWWkxSM2VNemFYRU8xTitY?=
 =?utf-8?B?d2NlUGszTGRLSzdJK0tlcUZCS3BYL2F6bmkrbzF0TUxaZ0tPenB5MHVDSXVk?=
 =?utf-8?B?ZnNEWnczaEtqL2lISXFTSkp2bk0wbW16VnFjMXFRb3V0TVUvN3hYYlo5NlFx?=
 =?utf-8?B?L1JCWmtYNjBzRk94WW5zcnFMUHlKTDg3VmkveXpZZFhrNmw5MVpVOFQ1YU15?=
 =?utf-8?B?Y3h2L0ZtRFhMT3Zra1FiN3FTSWVmemtwK0Yvb1dobHN0OUJyUHJzWnFvMkpv?=
 =?utf-8?B?eFMrM2NQN21mUW53V0w0VitmN1l1Sy9rU1VlRGRVZ0hJUlg1bDRUTG5kOENH?=
 =?utf-8?B?MjhLZlZUT09yMWtINHJZK2pHd1dVRkljaXZ6NlRCRFpYY1pma3Jxb05QWE5M?=
 =?utf-8?B?aERPQ1ZPR1JvSnZpWlowWXFqUVBxcFhQWnRzT3cwZEtwbGQ5NGV6Q1hXS0Zh?=
 =?utf-8?B?Qy82d3hScENOZ3ZBR0tmN3hCbDR0bi9HL3V2WWUzVmF5ckMweitraGhnbXpl?=
 =?utf-8?B?bW0raVdJMHVtbTZkQUcrWnpqZTNKcjdDQ2JaS29GaWlUTU9MdWtLZldvaXE2?=
 =?utf-8?B?QUlTZnZWUlpoMTZTTThXNDhvY3dqbUdqczdBazlCeGZiQUdFUDA4K3kzQ2tj?=
 =?utf-8?B?RFVoN2RoSlpPTUFzRUpseWE4T1hDTjJWWFp1OGhtMlJGbGFSa2pxUXNzc1VW?=
 =?utf-8?B?aXpjOFNadGpmU0t5bm5GTGlROGRhd250M0I3NWxUMnFkK0E4cjMweFFwVkl1?=
 =?utf-8?B?a0lXODk5MUZYYnZuRWJicjJQOGpyMUNvQ05jNCtzU1pCVjQzbjd0OUVyNlFZ?=
 =?utf-8?B?cVVxeDIrS1ZDODNhZnhZM3BUYUl3ZytnLzViRndZdVZVV1ZMcDRBcGtUR0NF?=
 =?utf-8?B?RWM5V1RUOWZ5K2NWVUU4NUVCR2hQUGpNN2QyYzUzS1pBR3krMnB4S0hJbGh4?=
 =?utf-8?B?akVNYVBEa0NPSzBubG9EdTJuMmpSQ0lxVkJQOTZUUGFnVExiYXlzTE5iYzBM?=
 =?utf-8?B?SVBnbmlqZVFzTlVlbVp2MTFITnJ1d2h1ZmhyS3l5RVlYc3diQU1XbUFyWmUz?=
 =?utf-8?B?MGdKVm1VWUhOL0dWYnRpeTF0SXZXbEFZdFpQZHNLMmt4ZG5DNVpXdlUyNnE2?=
 =?utf-8?B?Nnk4djQ3dlA3d0NVaUQ1eXFzS3NuWE1yU0krZHFhcjF4Um9EeFgrTno1QkVW?=
 =?utf-8?B?UTE3TGVBUTMwZHZmMmt0WFZGeUdreHk3NlBYaVEzQTdlVHhCcWJuMVBqcG14?=
 =?utf-8?B?VjI0b29hYWJDOGxGUjhPdm43VW91WHh3WEhDcWhwNUh3akdXc0plTk1zaXY5?=
 =?utf-8?B?aUdiZ25tVVZiYnFlZ3hybE0zR3FMdzNmTXNhb1dXWUpnT093RHVLczQ3a0VO?=
 =?utf-8?B?THM0Zk1QR2dISlpaOHF0dE55RDI1RVRWSEwxcklIbTJzeHVZNWlwYjBERXhn?=
 =?utf-8?B?dUJYTzNhbysyY21NMGVISndZNk5ZYnFQU3FObFJ4b2x3TmJJNGhQU0NJVVRm?=
 =?utf-8?B?QWQxaGFkdlVPaUJZaXg3NDNwMTcvMmlaUnBpZGYxcWVWUnVrSzZ5dmpmcjlR?=
 =?utf-8?B?VnJabzZwVEJRUlY1dTNYZ0RYYnZUUWY2V0pYMWUvcWRKdzBvWUE3R2FORnhK?=
 =?utf-8?B?VFpMMU1qOEVYUEtCdlJ0VUVtWGlNc3NpR3hWNElsalNxdzJsbkNtWno2MFgw?=
 =?utf-8?B?K2owdGw5NTBlTWRHendwckkxY2t1c3AwN0dKQWhGWmVqK01GTTVCOG1CSXVv?=
 =?utf-8?B?YkRPczBjamdTc1dSWlIwV2FpK3VOQURBdGVLMXB4Ym9OdmJxMGxVMXFMc3RG?=
 =?utf-8?B?UDNITTdwUldPRHQxY09EU21pV2cycVgzbVVWdk8xOFo0VnQyZzhKT0V2K294?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <620C59A8C6D67B41BA4F504090178D7C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6690.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ccbc10-41f8-430a-3f21-08dbe99d7bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 07:51:20.1867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whAgTE8t5qkxDSjk3VVNahUl6tygDmzPLqPdsTVEFOiNhFyqdcXEMuzH+rIeSR1puPzCq+dSY2y3EiXnKx2/Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7588
X-MTK:  N
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE3OjM1ICswODAwLCBSdWkgWmhvdSB3cm90ZToNCj4gIAkg
DQo+ICBUbyB1c2UgRVM4MzI2IGFzIHRoZSBjb2RlYywgYWRkIGEgbmV3IHNvdW5kIGNhcmQNCj4g
bmFtZWQgbXQ4MTg2X2VzODMyNi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJ1aSBaaG91IDx6aG91
cnVpQGh1YXFpbi5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRyZXZv
ciBXdSA8dHJldm9yLnd1QG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzLA0KVHJldm9yDQo=
