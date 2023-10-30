Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2E1C4167D
	for <linux-sound@archiver.kernel.org>; Mon, 30 Oct 2023 11:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjJ3LIz (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 30 Oct 2023 07:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbjJ3LIx (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 30 Oct 2023 07:08:53 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A284B7
        for <linux-sound@vger.kernel.org>; Mon, 30 Oct 2023 04:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMWxGy71OMuLlR6hejBjifzdT6u+Y1QdWfidrKPxzIBDi2f9Pm85Qy9XFnT8Uo1UPG9OZhV913HsMgRLMVCu8nTuhsnvZuW7RkqT+Lph+sRv/35ZYpEeY+5Yg/cnpVCA1e0lEaI3kIv16hwBUN2PJD9FQ9BYcFsg0d+KjafRFzL3LFE6KEwO7AclfCcCusFhvzjAV+YlJ+sk+m6TpWLOMCxpyZ80DyIp4e980bmOGDILJbqXXfsK4pvLKvYaak+aF2vvJXc6HzBUEoOqu/7c0xseTjtfO+QH+rlGWlznNn/EQk0WNS6HTajhudhBseA9OqFRuOS3JvPKBfkAKppUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaimByWQ84NPvQC4/8yorxZ3nQOsb6ElN2TNT4R28b4=;
 b=NSs2x4hNIJqXG7UOHG7LDbaGp8QQSq8k+eCWNy3QW0+Vk73bs8IfxFcrPi/2ZxX2EGBb0obDNT4ilu8stMnVnuULp2ineoDuy0giu418C/eAYg7Ld6MZauTV6iP63evf1r/9R5MdSr0F9Ob9upYXhqWsvzId6o5jrw8vZgCeAwk0UKIN/EB4XoqqWhWUnYd38YOa0WrQ594RrJUS7PJQpDY7UzyqOmCjDIETkwlMug8ls9GlilDUcwRRe1VDHd7DMVC/BeP/AFTLAijC+IR2OQx4xhrFDMA2GR6SSckfaXwvdpZ97Hqt5xeoNTIE2T+nA5dqM36ayarZyBfsHddVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaimByWQ84NPvQC4/8yorxZ3nQOsb6ElN2TNT4R28b4=;
 b=NgriA8wV3i8Sq8vsfBqxbcj6j/Ra/Bn77RhnWE5/3uM1gGFsobTmnwnJIa1frhQ7wNB+lgYoHOv1NLGLQMMVGyjq1+Dlxd5MUIzHPgkta8qnBjHTRWCWuYFO1/h7wBsERfBQMQSSaZDS5DbHpB+w/XGbl2Il1s6qAdrivrRFS2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 11:08:45 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79%4]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 11:08:44 +0000
Message-ID: <c6fe4716-01b7-4876-a6f0-7c3479e8542e@amd.com>
Date:   Mon, 30 Oct 2023 16:38:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: amd: acp: refactor acp i2s clock generation
 code
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>, Syed.SabaKareem@amd.com
Cc:     linux-sound@vger.kernel.org
References: <bd52b930-95da-45f3-ac19-b87de2938857@moroto.mountain>
From:   syed saba kareem <ssabakar@amd.com>
In-Reply-To: <bd52b930-95da-45f3-ac19-b87de2938857@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::20) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|CH3PR12MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c863b1a-83e5-4613-23f9-08dbd938950b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kz+GOVQ/rssrrVZcDbsOnmcSkLngQtTmMr3W12+n9UZzNqJBZiuL58m9NNYxFKXdoVlgg8aavURcGi09JNoxbU6Vp6wbKnJ8cYCIN5Vfl8B3Iswc5NZqNdoKJjp8MuvRRk4N9CPT3oFZiEHkD54t5qevum+4LUueVCwLQLBzyJDkxkRRCHYegTiQyOpXeE4BQdLbBSCp9EhgBvLiZc+yAB4alFudN5qcBG0Vtdtf8d5s6G5IvRX5IQEYQjz7jXx+O0rUPELRLzla6h6syHrq4xKiUek9PmfR28HRci8ymDDZwGTIIE+zH46Ji9AtAhFe/gvpkp+9FpzCa8vpR5fZLSI60ekQFDrtImvf7ELH7/oAdIroiyesN66byN/FoJRRbmgl45dIFCMxMfptUCNlswQChPPdctj1z3BKlUrXpwZkNpyqputBmQDVeHvPjzKUFKVsnmeRydcXYZwVW0391WLfDg1Kf3DOs80lDq9Vav4LBE5srWI169ZhNEsdMnt8XtVJZrreifth/aTAKtzMmEyb2NHRcT2Czv5LnglwiL+FDIBYn6OTWrmHBf1jhp7DTPHFjZVjjQuoKvQioJlJN/lVaN6AtbqfKyFsLjcYp3GwY/fnzm3sPco+hc5GRks2a/g3TGEZmoIMltQaha39fXt9kC3PTQgz1SLE6SOW1W0y0rRNTwwcsCkLUVBOU2+y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230173577357003)(230922051799003)(230273577357003)(1800799009)(186009)(451199024)(64100799003)(6512007)(2616005)(26005)(53546011)(6506007)(478600001)(6666004)(83380400001)(6486002)(2906002)(5660300002)(41300700001)(966005)(66476007)(66556008)(66946007)(8676002)(8936002)(4326008)(316002)(6636002)(38100700002)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGVEckRzMVRZQmlCWDI3UzJKc2xXQUNQb0p0THJJWSthSk8yL041TnEwNlBw?=
 =?utf-8?B?aDkyVzZHY1IrQXhMTno0TVJDQzZkS1hVRUJaZ3ZqdlpoT1BsR2RoREEzdnlR?=
 =?utf-8?B?VmZ0cFlvekFUSEl3SzZ0bE9GenlFbmNiUWwvelJGWVljanlVZGsybnRsaGo3?=
 =?utf-8?B?QmY5SUNqMmlBYzZvNkFLMTZKaHRld0t2cFBvaSttcGZJRzQxVnNKdXJvK0F0?=
 =?utf-8?B?ZmFtWnVSai9CdWFNbHJmeEwvbkxtb3hpM2I0MUNwYkpLaVNwRXphak0vb0Fl?=
 =?utf-8?B?WTdKT0pYYk5rb3ltRzdmQ29jdW5VejNucmUvQldkR3F6Q3NkWVdUSTNUVnN0?=
 =?utf-8?B?cjFsYTMySkR1b25sM0EzT2pZRVRhVmgxQTZkdVlqSUNxUjc0SC9ZQkNESFhO?=
 =?utf-8?B?M3U3a2o3d09rR3d2c3JxT1NsTjZMaDZLdXRnNVIvejBvYmpKdEFkeUNPdEFS?=
 =?utf-8?B?dVU2aVZ2cFN2MTBOUVlZZ0taOTdKS2lLT2ovNEFQUmUvQVU4UUh0S3pOdXFT?=
 =?utf-8?B?ZjlJVGE2R0tTVnlhV2RieEsyNmZJeDYvUVppcjI4T0lqSnkvYXdDUUh3bURD?=
 =?utf-8?B?eCtGdVdnNWU4anppOHNVdEthdnExR0lBMEpoYVc5TFIzYVpQdTI1cFppOVVN?=
 =?utf-8?B?ckRqY0VXRHE4U2twaDU4RXk0NnJjRGhjbFVSLzZjS1dua1JhajRXK2llNkRQ?=
 =?utf-8?B?TlByZlhyb0xycEUzaVlGVitZUDJDTTdxemNKcXpMUFRtY0ZTL0NHYWExc2pm?=
 =?utf-8?B?eGNvYmhJZEcvYk9hSVI3cStXTWRpTDJjMUQzc21tZnEwWFM2cVNIMFRBamJU?=
 =?utf-8?B?NWpNWUFtbXhKb1BZNG5nVmlPK3ExK05vV0Z2cllXMXhnYkVxRWFpK1hZNkt5?=
 =?utf-8?B?TEdzOWRnS2NnR0dIQStoT0d5ak1VLzY1QWJaN0lRRk8wUUVTczNpa0ozSGQr?=
 =?utf-8?B?TXNXT3pXZ291S3kwMG05OFIxb3BBSmZKYzNiYUhBU3lRVzBDUE5EOXNHUTRZ?=
 =?utf-8?B?Y3hvM2MzazVDdzZidzVMNUtQM3drREpEMTZqbTkzcUpqVDFxSnh4dlhob2l2?=
 =?utf-8?B?OTNBc054dmlucGRBSFJCMDh1MmNYOUxrZzEzSzVJOHFiOGZiT3k2Z0thbUlk?=
 =?utf-8?B?N0wrRkVISjNpaXVDWkErT1NoU0lObjV4NlB4TVJJRnRvYnFMaE5DQ1dsa3k0?=
 =?utf-8?B?RkwyQXF1L0h3RzU0R0pnTm9zY0VkZ3dLeFdySEp4RlZzekxiVFY1OEh3SEJ5?=
 =?utf-8?B?OXZ4R2JEN2k2QlJyQ2ZYOUVIZDkzWGJwWnM5cUxtVzlCRmJBQ2xRUEsySWY3?=
 =?utf-8?B?R3lkSXJPMlhXY1ZGOGZockszWWxLeGRPcXBqSy9ZU0dTZGMyeGxHL0hyWkM5?=
 =?utf-8?B?ak0yaW5TYmh3eHUrdTJWaGU1eURkRjBVSVluK09vK1I3VmI1VWtxbStRQUNk?=
 =?utf-8?B?WDdwelVCZGszN2I4a2N1d2p5ZUpaaHdZMkRhaCtQQ21zRGNFTXEyYjV0aVVL?=
 =?utf-8?B?bFFPd2dCTU55aDFMOS93ZkVDZFNKNnpFL0w5U2tOYzNXV0N6Tk01Y0drbG5v?=
 =?utf-8?B?TjJESFlLQTdpMEcvdFcvcUtBZlFVVktkUDBUanZoT0Q3R3NGM1VLL2hDOUE5?=
 =?utf-8?B?TnhvMlM2NFdLQkRDMm54Z25aT3I0WmpWWWlvRTZ5ZFVwMVh4VWMxeGw2Ym1T?=
 =?utf-8?B?RDMvY2UvQTh5VTVwelI1MFlXaEhrUW9CRmNFRDRxZDlrTFpQQ2pZcEJNa28x?=
 =?utf-8?B?cnRPVjF4SW1QQVQ5eDV2d2hKaUtHSWF3Vm1sSmRGendYeGRPQmVoZjN4d2pv?=
 =?utf-8?B?QmQyYndFNTd2d0hKSjBZWFY3Y0lPem50SGRyZkNzNGsvUWhXdkFEeUxwYzRt?=
 =?utf-8?B?eWNaRUd1RWhtZ002anErdlRjYjhtbS9Oa0ppeXMwbjBlVTZTMVpVVldmS2hU?=
 =?utf-8?B?ZVhrTEJGcDlwL2p6SnhVd0lkWEFPeE5EWXY5ejZQTFBWeGtLUUdzMGpNc05M?=
 =?utf-8?B?MUtwQXpqWVJITXM0NWNLcnphSnA1VllqUThBc1pvY09EZXZvYSs2YjNjTEF3?=
 =?utf-8?B?dVFpUGFMVE1HZ1pBVnp0KzFaUERLNFd6aFRnVVZVT2pDUUJHUHMzVUpUNkIx?=
 =?utf-8?Q?CPsyPVJOYTiFHDXzTkRpUM4Lu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c863b1a-83e5-4613-23f9-08dbd938950b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 11:08:44.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+o8ORNbTcoMCUwtxayIjPf8eH42pPuh4ftU6cqjnoV+Ia6+Jg15QLGJAhN/rF/lIo5p4Mj/4TiaToilLssdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org


On 10/30/23 14:34, Dan Carpenter wrote:
> Hello Syed Saba Kareem,
>
> The patch 40f74d5f09d7: "ASoC: amd: acp: refactor acp i2s clock
> generation code" from Oct 21, 2023 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	sound/soc/amd/acp/acp-i2s.c:59 acp_set_i2s_clk()
> 	warn: odd binop '0x0 & 0x2'
>
> sound/soc/amd/acp/acp-i2s.c
>      35 static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
>      36 {
>      37         u32 i2s_clk_reg, val;
>      38         struct acp_chip_info *chip;
>      39         struct device *dev;
>      40
>      41         dev = adata->dev;
>      42         chip = dev_get_platdata(dev);
>      43         switch (dai_id) {
>      44         case I2S_SP_INSTANCE:
>      45                 i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
>      46                 break;
>      47         case I2S_BT_INSTANCE:
>      48                 i2s_clk_reg = ACP_I2STDM1_MSTRCLKGEN;
>      49                 break;
>      50         case I2S_HS_INSTANCE:
>      51                 i2s_clk_reg = ACP_I2STDM2_MSTRCLKGEN;
>      52                 break;
>      53         default:
>      54                 i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
>      55                 break;
>      56         }
>      57
>      58         val  = I2S_MASTER_MODE_ENABLE;
> --> 59         val |= I2S_MODE_ENABLE & BIT(1);
>                        ^^^^^^^^^^^^^^^
> This is zero.
>
> #define I2S_MODE_ENABLE                 0
>
> So this line is a no-op.  What's happening here?

This has been already identified in the below thread.

https://lore.kernel.org/alsa-devel/af1a7eff-bc5e-43a9-99c0-9f26a546f537@amd.com/

Will provide a fix.

>
>      60
>      61         switch (chip->acp_rev) {
>      62         case ACP63_DEV:
>      63                 val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
>      64                 val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
>      65                 break;
>      66         default:
>      67                 val |= FIELD_PREP(LRCLK_DIV_FIELD, adata->lrclk_div);
>      68                 val |= FIELD_PREP(BCLK_DIV_FIELD, adata->bclk_div);
>      69         }
>      70         writel(val, adata->acp_base + i2s_clk_reg);
>      71 }
>
> regards,
> dan carpenter
