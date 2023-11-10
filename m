Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A6AC4332F
	for <linux-sound@archiver.kernel.org>; Fri, 10 Nov 2023 02:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345768AbjKJCoR (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 9 Nov 2023 21:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345662AbjKJCoQ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 9 Nov 2023 21:44:16 -0500
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D61C1BFB
        for <linux-sound@vger.kernel.org>; Thu,  9 Nov 2023 18:44:14 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231110024412epoutp048e669da2514e2d515d7f9a2e88e9757a~WIt9qUrve1638116381epoutp04x
        for <linux-sound@vger.kernel.org>; Fri, 10 Nov 2023 02:44:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231110024412epoutp048e669da2514e2d515d7f9a2e88e9757a~WIt9qUrve1638116381epoutp04x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699584252;
        bh=6N/ZyxsFidqNVfz72D8F+qigXa/kjkFfyYdv6OppHxc=;
        h=From:To:In-Reply-To:Subject:Date:References:From;
        b=aqhv0jqx0Fu99TqEeeRT1A5+shhpx9VTaN40HUrlVRDy4Vz0sPvaCOHb3d+VIJpGa
         QOQKWngoQ/9OcoLfr4/oR0EbdhsYxfJcmDu30ieaAyeUqX3qON01AbDHxuhYP0ggn/
         vPArzh/TQJYw++v65s5/hFKcD2Ill6LFfCsXroIM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20231110024412epcas2p47018ea633c5071fe1a875b5ebabdb710~WIt9ecHnf2567625676epcas2p4e;
        Fri, 10 Nov 2023 02:44:12 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4SRNSW4FXKz4x9Q6; Fri, 10 Nov
        2023 02:44:11 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.6A.10022.BF89D456; Fri, 10 Nov 2023 11:44:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20231110024410epcas2p112ba064ee1ddc302f674cf9676f22be1~WIt8WAjOS1696016960epcas2p1j;
        Fri, 10 Nov 2023 02:44:10 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231110024410epsmtrp1349ab161bcee589499b8433c2a011594~WIt8VfXu22893528935epsmtrp1u;
        Fri, 10 Nov 2023 02:44:10 +0000 (GMT)
X-AuditID: b6c32a47-9a3ff70000002726-f0-654d98fb1982
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        78.EB.07368.AF89D456; Fri, 10 Nov 2023 11:44:10 +0900 (KST)
Received: from KORDO035882 (unknown [12.36.182.71]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231110024410epsmtip128a875d3fadfe098f862ed6b9e9bc765~WIt8Nwoc62380023800epsmtip1G;
        Fri, 10 Nov 2023 02:44:10 +0000 (GMT)
From:   =?ks_c_5601-1987?B?sK29xcf8?= <s47.kang@samsung.com>
To:     "'Takashi Iwai'" <tiwai@suse.de>, <linux-sound@vger.kernel.org>
In-Reply-To: <20231109141954.4283-1-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: info: Fix potential deadlock at disconnection
Date:   Fri, 10 Nov 2023 11:44:04 +0900
Message-ID: <011901da137f$c88ae0d0$59a0a270$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHHIjGTP2lrtBwD2uZdAUmif6iJCgKPaVgrsIQ/XHA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7bCmqe7vGb6pBj++KlrMfTaF2eLl5jdM
        Dkwem09Xe3zeJBfAFJVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr
        5OIToOuWmQM0XUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66X
        l1piZWhgYGQKVJiQnXH811O2gvesFXO3r2ZtYHzD0sXIySEhYCKx43gLcxcjF4eQwA5GiS97
        /7BCOJ8YJSYfvgyV+cYoMXvdJbiWCTdXMkEk9jJKXJ2zBqrqBaPEz8VrWUGq2ASsJO42TWED
        sUUEnCU6585kBrE5BYwk1r49yghiCwt4SDxbPJ0JxGYRUJV4eHw2WA2vgKXE/u8/WCBsQYmT
        M5+A2cxAvUtWz2eCsOUltr+dwwxxkYLEz6fLWCHiIhKzO9uA4hxAe60kLm+pALlNQuAUu8Tx
        Z2egPnCR2L52CZQtLPHq+BZ2CFtK4mV/G5SdLzHz2gZ2iOYGRom3s+cyQiSMJbbMPcUEskBC
        QFniyC2o2/gkOg7/ZYcI80p0tAlBmEoSE/+qQjRKSBz70gBV4SFxe5b7BEbFWUh+nIXkx1lI
        fpyF5K8FjCyrGMVSC4pz01OLjQqM4ZGdnJ+7iRGc8LTcdzDOePtB7xAjEwfjIUYJDmYlEd4L
        Jj6pQrwpiZVVqUX58UWlOanFhxhNgcE+kVlKNDkfmHLzSuINTSwNTMzMDM2NTA3MlcR577XO
        TRESSE8sSc1OTS1ILYLpY+LglGpgSv7CeeD2we01psL2abf3tUum1M7luvGb6/+S3pRd/sWX
        zGSEqhqmHTzy+cGG9tdphztXZf532XehKPtK/Yk1LHN3Bt/94q6T7sPcFdbQrHfr88+i1KdO
        esKSxrxZh5VvRDPPvicYIjz9W+NaRn5n5506zc5/1m9KT23i4ed/us2+eIZpyoE64c27GT9e
        vVWe/zAxqvFTlI5XXHHc9xbXj1d8r05d4x3tJbt7ZUS19sH46+yiRi/Or1I8nNfO8vcXu1Th
        /XtXNacwuho+a1useiD+fNH0EC4mO6/FE3Q01+t6+wb/srZRkAyoDpkf/JH9WJJC24KvJzus
        X4naPF17Lv9e+3EZyyT78pQjE54psRRnJBpqMRcVJwIAkQzIIwEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWy7bCSnO6vGb6pBitPmFjMfTaF2eLl5jdM
        Dkwem09Xe3zeJBfAFMVlk5Kak1mWWqRvl8CVcfzXU7aC96wVc7evZm1gfMPSxcjJISFgIjHh
        5kqmLkYuDiGB3YwSN/+tY4dISEh82/kVqkhY4n7LEVaIomeMEpNXPAcrYhOwkrjbNIUNxBYR
        cJVoePKbBaKomVGi79s2JpAEp4CRxNq3RxlBbGEBD4lni6eDxVkEVCUeHp/NDGLzClhK7P/+
        gwXCFpQ4OfMJmM0MdF7j4W4oW15i+9s5zBAXKUj8fLqMFSIuIjG7sw0ozgF0hJXE5S0VExiF
        ZiGZNAvJpFlIJs1C0r2AkWUVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZwkGtp7GC8
        N/+f3iFGJg7GQ4wSHMxKIrwXTHxShXhTEiurUovy44tKc1KLDzFKc7AoifMazpidIiSQnliS
        mp2aWpBaBJNl4uCUamDyeBlst3LFtS1RYu5VKsWTrs72vn/9fK9Pw8a9O1PPBcs7yPp1nfL9
        M6ly+tOoWcfufXapf+llsYWzTu6ezOKMqQHHg1XUhO/ZnnGc+atS3qxx4sQfXyff0TN1trSd
        GLK3M3XGgYxrz5iUXkr99Mn9sXl+c9M7rdufDdkaptvpLBZn/uO16G+2uqj4aq2wnRG8Ww2z
        395Yauwd9pqRs/fad49DfK/r1qpymzHmavVEyJR1+smJtl2x4XI58WXqhS/HNzBsrj4cZ8az
        N+LLKv54RZUirxqOBCUd+e6vExJjNqZMP5dw6Mzkw/7H2fTZFvz/6762bJXC5qKe7nrrNUt+
        vq4yZfM+xC71YlGRRoMSS3FGoqEWc1FxIgA3zLvi4QIAAA==
X-CMS-MailID: 20231110024410epcas2p112ba064ee1ddc302f674cf9676f22be1
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231109142003epcas2p3eca3f32f5bd65a08201110f19d405e97
References: <CGME20231109142003epcas2p3eca3f32f5bd65a08201110f19d405e97@epcas2p3.samsung.com>
        <20231109141954.4283-1-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

> As reported recently, ALSA core info helper may cause a deadlock at the
forced device disconnection during the procfs operation.
>
> The proc_remove() (that is called from the snd_card_disconnect()
> helper) has a synchronization of the pending procfs accesses via
wait_for_completion().  Meanwhile, ALSA procfs helper takes the global
> mutex_lock(&info_mutex) at both the proc_open callback and
> snd_card_info_disconnect() helper.  Since the proc_open can't finish due
to the mutex lock, wait_for_completion() never returns, either, hence it
deadlocks.

As you said, the issue is easily reproduced after adding extra delay.
And the problem is solved completely with your patch.
Thanks for your help!


Thanks.
Shinhyung Kang.

