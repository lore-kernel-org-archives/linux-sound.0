Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61611175A69;
	Wed, 17 Jun 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700214; cv=none; b=kSOtzBoHamdXbDhSkN5KctOdlPx2EJcGMgfPr62I1IrexPI0ZS06exd2X7AqpxVSXMiy7xa1kQMH5k0CJ139qthzjy6lWU4hGEqrXljjlP4pJCZ9BDB1h5Vhk2i18H9EIVBuZWIeHQYjaqezVofAR4V06/gZXXJnYgk2qO/wElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700214; c=relaxed/simple;
	bh=j82iVZwLL/BmD8WR1AdmnqaufZ4shGKdirs4B3hFfXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n3fP14OMgnMJiKKlMQX3JPGIaBRPgXFXqJmxfSheHo8/ZRQlfTy/nKVwLpvEgyU2Ol42L0vzEd6CumILy+H2JbI98FZVeuxntJ2dAITA8bmL15yPUKbAPIEdJbOh/mmYDQVdTd6Cy882DImqrlqNy2NE2RHJ65U44xTuqRdps6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2098df6a6a4a11f1aa26b74ffac11d73-20260617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0a6a2902-0fef-4b32-a6e0-f81562bd0d01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:d4bf2e4b20645980312a64b937983a19,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|83|102|865|898,TC:nil,Content:-10|0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2098df6a6a4a11f1aa26b74ffac11d73-20260617
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1371715728; Wed, 17 Jun 2026 20:43:23 +0800
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
Subject: Re: Re: [PATCH] ALSA: usb-audio: Add quirk flags for SC13A
Date: Wed, 17 Jun 2026 20:43:18 +0800
Message-Id: <20260617124318.3424122-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rong:

>>   usb 3-5.2.4.1: Warning! Unlikely big volume range (=4096),
>>     cval->res is probably wrong.
>>   usb 3-5.2.4.1: [5] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
>
> Most CVTE webcams also ship with a microphone. Does it also apply to
> SC13A? If so, it probably needs a mixer quirk too, e.g.,
> QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL, QUIRK_FLAG_MIC_RES_*, or a device-
> specific one.

Thank you for pointing this out. I will contact the vendor to confirm right away.

Thanks,
Ai Chao
