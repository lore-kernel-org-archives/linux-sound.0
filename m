Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7B3B38A2;
	Wed, 17 Jun 2026 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680802; cv=none; b=XL6GtYlrXMVS2Iwb0f53kzlk2Fjz7sd2GRGQ5HTIPhcJFeQCDLO1KnAnQRV7yAC2/tn3wrNpU/cm9Uqa5uUSaidaUqb5TVZG5XiO796DhjjfZe/QaZlRmbXQJasu3iMEYvvp6+v4AFfbSJrr0k6qYJOFUdDkMzeFAturIJ4YzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680802; c=relaxed/simple;
	bh=92VcSzdK1XU3FHt5kGNDPSrScWZJ0qlhkKyVOnblico=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RDcDUPAgKnJg7oNv+z0EK0BJ77g4bfDEVYzMLSjNR+U9f8j5q4p6wtBBe6W9sfz0asQIszJMSE0h4K7cjsR7YuAi7MridDWE4byBIRsEX3LRjYkk1r8qgYr5nqZQ7OYA3Gh5RtMfJoFfMt0czVkA9ChTpy9qGkVYFkBwx1778YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f06ed3806a1c11f1aa26b74ffac11d73-20260617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:43de465d-61ae-430e-a2bc-0557b7d994ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:62c306cb6730a4abd106aec1c617d982,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|83|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f06ed3806a1c11f1aa26b74ffac11d73-20260617
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1263146279; Wed, 17 Jun 2026 15:19:55 +0800
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
Date: Wed, 17 Jun 2026 15:19:51 +0800
Message-Id: <20260617071951.3357788-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Takashi

> Thanks, it's a bit clearer.  But it still means that it's a cargo fix
> only for that specific application.  The program should receive an
> error for any further syscalls, so that it can close gracefully by
> itself.  Or it doesn't work as expected?

The recording software monitors /proc/asound/card0/pcm0c/sub0/status.
When the USB device is suddenly disconnected, the recording software fails
to capture audio data from the sound card, with both the hardware pointer
and application pointer being 0. The software remains in a pending state,
continuously displaying "Generating recording file". If the status file shows
"closed" (DISCONNECTED), the audio service detects the status change, reinitializes
the device, starts processing the recording file, and either resumes recording or
notifies the user.

Thanks,
Ai Chao
