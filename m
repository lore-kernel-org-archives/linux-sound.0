Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B50C25B47
	for <linux-sound@archiver.kernel.org>; Fri, 27 Oct 2023 09:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjJ0JRZ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 27 Oct 2023 05:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjJ0JRZ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 27 Oct 2023 05:17:25 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368E1C0
        for <linux-sound@vger.kernel.org>; Fri, 27 Oct 2023 02:17:22 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39R72kZK003929;
        Fri, 27 Oct 2023 04:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=
        PODMain02222019; bh=IQXWbf2rdXsAh+N6t/RZbBPgcHcYu+iy6Dxgz29565I=; b=
        Zw1T0FHyciBYJOt2LmN8f5q+X0cv01T6ys8d/kFPK9NFlnkiQrKl14YXOW5xbid7
        LAqcgA9UBUqiENCa2+sByy8IeMYyEWujxzfFID8d206ITV3gQBX63fzm6A/b0/HT
        kIXbidhPWePg6/TVN8RFAVgQsCGLkLHeCZTeDqdTRrd5eg0f+TSEB9Yl/xwc9JVf
        vTY2dh9xBRaK9J6iodGkSYhlEoBIgAuW45d/SzNQPMD0CHYhEXX3ye0uuZVJ3S6Y
        fAcN3lLAXVWbcNmiX5A0N+N4kDu88BL3hClaCCBdJF1KcWdt3JVLtBRq/qsP8VOu
        wtGnA5ZSyY1Au6dnyrQbzg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tywqt120w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 04:17:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 27 Oct
 2023 10:16:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 27 Oct 2023 10:16:58 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52A7715B6;
        Fri, 27 Oct 2023 09:16:58 +0000 (UTC)
Date:   Fri, 27 Oct 2023 09:16:58 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
CC:     Mark Brown <broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dapm: Simplify widget clone
Message-ID: <20231027091658.GB103419@ediswmail.ad.cirrus.com>
References: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: yygX_o_qR03_N97cAi_2Qm6SOzGdwDh9
X-Proofpoint-GUID: yygX_o_qR03_N97cAi_2Qm6SOzGdwDh9
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Thu, Oct 26, 2023 at 01:35:49PM +0200, Amadeusz Sławiński wrote:
> New DAPM widgets are created based on a provided template. When cloning
> the data, the name and stream name also need to be cloned. Currently the
> data and the names are initialized in different places. Simplify the
> code by having entire initialization in one place.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
