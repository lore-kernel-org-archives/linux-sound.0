Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74CA36E495;
	Fri, 19 Jun 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863587; cv=none; b=nMzNDJ5iYnrbzmYdwiiOOuPpHMTk6G1ChcFt+nN+Hrcc8T4KlXP/O2tyUnUy2F99kEQxeBwN0OGYZT4SliRF2lPtOvHv4TEOlnSjpg5MIPFWtgB0kg5GPW24q4039DLyilBKIV3cFkg64WwoMpeMC9/+tDJV0Pu+a5oARfE0LRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863587; c=relaxed/simple;
	bh=loBXx/Q80IPDBygw2IFu1cmb2huLwjLC29dJVFrOp4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVOcdMi+R4l9+E+rrrn/8tLKYsfQAZFBHAWR9AsGqMovKi2TWQ0f9w+lM8CKVsUgyoAS54rjd9hZ17XmT8IEfqv2UfsbrRbe5tYhRo1GBbepVj+5QM/OeRMPlMU0WbQDKlwwRLbKkuIfoDE3vL+l6hc0725VUa989FVAi5h4KsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 810c7c1c6bc611f1aa26b74ffac11d73-20260619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c1b7a2d2-bdf3-4872-bee8-5edf670ba176,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1479085e2f5de94ee1c8c91515e73b72,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|83|102|865|898,TC:nil,Content:-10|0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 810c7c1c6bc611f1aa26b74ffac11d73-20260619
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 706534410; Fri, 19 Jun 2026 18:06:13 +0800
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] ALSA: usb-audio: Add quirk flags for SC13A
Date: Fri, 19 Jun 2026 18:06:10 +0800
Message-Id: <20260619100610.1111569-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rong:

> > >   usb 3-5.2.4.1: Warning! Unlikely big volume range (=4096),
> > >     cval->res is probably wrong.
> > >   usb 3-5.2.4.1: [5] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
> >
> >  Most CVTE webcams also ship with a microphone. Does it also apply to
> > SC13A? If so, it probably needs a mixer quirk too, e.g.,
> > QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL, QUIRK_FLAG_MIC_RES_*, or a device-
> > specific one.
>
> Thank you for pointing this out. I will contact the vendor to confirm right away.

Yes, the SC13A includes a microphone.
The vendor confirmed that the mixer volume control works as expected, so it doesn't
seem to require QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL or QUIRK_FLAG_MIC_RES_*.

Thanks,
Ai Chao
