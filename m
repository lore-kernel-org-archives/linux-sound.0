Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427BA39769E;
	Tue, 16 Jun 2026 02:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575573; cv=none; b=fzGwRI7QMqXEJO7syLEnrjB3Jm5A9UBoHNyvz/hhDD85G9/GnWEg4q2vNDK9+zHvDgR4d+qUBvRcdA0vnN1RN0kZmARQk3wX8L+zCgf2mZpVImpiOYQbqEy2zt1xEJtSbvufzfGgtQSVLQA6+u+TiDcM499tyigCtwu45923dcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575573; c=relaxed/simple;
	bh=ZkmnRjowv9DTULN6Bay0/KGYj2ClufUWO3l1xAk77z8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QPz2XaNOEjZRsuS5oB0kYnlIEYaPfX8fXmLSWbUQ828zPq48z0v8C7F/UwCDAaGFeZEngXLvHU1sb1Sj6b11qrbO0iD3HR3yaxLL/ymAQXHMfIguNSOvccgEExPbzQK/f6p26xrSBl4BXjz/JSp5MWwOvtbTDqboERKDsDu2+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ee317474692711f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d6634825-84e8-4ea6-afb2-f1b295b02265,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7ce85aaeb920e266821bdf89301d9943,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|83|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee317474692711f1aa26b74ffac11d73-20260616
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1490804807; Tue, 16 Jun 2026 10:06:04 +0800
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
Date: Tue, 16 Jun 2026 10:06:01 +0800
Message-Id: <20260616020601.2106490-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Takashi

>Hmm, why it must be that?  The state is shown as "DISCONNECTED".
>
>IOW, does this matter for which application and how do we have to
>imitate as if the file got closed?

Test Environment: Dual-boot Linux and Android system.

Issue: When a recording app is opened in Linux, the system is switched to Android,
and then switched back to Linux, the recording app fails to save the recording
and keeps prompting "generating recording file".

Note: The USB hub resets during the system switching process.

Root Cause Analysis (from App Engineer): The recording app relies on the driver to
report the IN_CLOSE_WRITE event. Upon receiving this, the audio service
checks /proc/asound/card0/pcm0*/sub0/status. If the value is not "close", it assumes
the sound card is occupied and skips loading; if the value is "close", it considers
the sound card available and loads it normally.
syslog:
[ 1140.495952] retire_capture_urb: 17 callbacks suppressed
[ 1140.583090] usb 1-2.4.2: USB disconnect, device number 53
[ 1140.583965] usb 1-2.4.2: cannot submit urb (err = -19)
[ 1140.588816] usb 1-2.4.2: cannot submit urb 0, error -19: no device
[ 1140.662630] usb 2-4.3: USB disconnect, device number 15
[ 1140.722584] usb 1-2.3: USB disconnect, device number 51
[ 1140.722605] usb 1-2.3.2: USB disconnect, device number 52
[ 1140.805724] usb 2-4.4: USB disconnect, device number 16
[ 1141.352341] usb 1-2.3.3: USB disconnect, device number 54
[ 1141.558840] hub 1-2.4:1.0: hub_ext_port_status failed (err = -71)
[ 1141.613714] usb 1-2.3.5: USB disconnect, device number 55
[ 1141.757651] usb 1-2.4: USB disconnect, device number 49
[ 1144.324836] usb 1-2.4: new high-speed USB device number 56 using xhci_hcd
[ 1144.473047] usb 1-2.4: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.11
[ 1144.473065] usb 1-2.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[ 1144.473072] usb 1-2.4: Product: USB 2.0 Hub
[ 1144.473738] hub 1-2.4:1.0: USB hub found
[ 1144.473765] hub 1-2.4:1.0: 4 ports detected

Thanks,
Ai Chao
