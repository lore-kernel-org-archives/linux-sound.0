Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966967;
	b=hfXjMjNBmOBcqiIhOYb5eu3uu4v2dYp3AWxNxmUcSvvszJ1RBezJBlmvi0ARoienuD+L
	 2Rg274mUzXfsyqDsPJstoLblzQ9kG08VW/rD+KUOj3qYiU/Mk693jQIBP6058qbTXmHSO
	 5EfclvIk+ggq8B+U+0bhTxvxfoIh0j29SlATjPB8IZTmpLr9tQVEFRZPsvrJX3iwFafWU
	 gE+NSLlWL73uYtgIozGgglz+vkgY5JJzkXY6jY2PNlwmbP1LIefWPVblntqoae4nbZrvD
	 c5yM/k2o5GkgRsCEZw3WsC2jYyadSEtf0agWGY4/xy/79Rdu5jRkHPyDx2+LTP/hb5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966967;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OR9TAxh60Mqjj2QSH10+6ZRys7dtedWAPNFZmLM98PI=;
	b=gezV3W+xK8IkIn1kD1+04c8LQJa/p7V9PqKQac7Rk8bnbfo7WQnm3mFhtzrwjO+/ffeT
	 rq1IpmLx9modPvQ4V98JWWBJWhnFM9AKHSXVc7nAOwZ1SZ6jaQsAecuxFvZFG2H9Yb2Bq
	 xPntn5fK+WDTgyHHhKcA7hRAbC3X9EhS3+LskVreuGH+cN71AWVTwtb+evvIg6gGzekyF
	 OW+U8f/RSqZG9NTx2HubU6k4WS7Bt59+8JrmG/OpegL/6xVmjEApsBAWn26sIEJT2D0tP
	 LNj3sQA7dVmfXtSPyPdctk9bqFMcZR36L2q6x7Jp7TMM01vhfkFzoM4+KIHhOX1TfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95A606A325;
	Wed, 18 Nov 2026 01:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F95A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 32974dece2f311f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f5026ab9-9a15-43a2-8ded-32f146621802,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:0ac217b6f54e897d0842801b925a3db2,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32974dece2f311f19a56ed5b684f684d-20261118
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 598819670; Wed, 18 Nov 2026 09:55:57 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v2 0/4] ALSA: hda/realtek: Add codec quirk entries
Date: Wed, 18 Nov 2026 09:55:48 +0800
Message-Id: <20261118015552.201306-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes four laptops by adding the corresponding codec quirk
entries: a THUNDEROBOT Gravity16G2Pro that loses speaker output after
S3 resume, an HP Pavilion 15-cw1xxx with silent internal speakers, a
Lenovo Yoga Pro 7 14ASP9 whose bass speaker is not bound due to a PCI
SSID collision, and an HP Laptop 15-fd1xxx with non-working mute and
mic-mute LEDs.

v2: Drop patch 1/4 (cs35l41 UX582ZM). Stefan Binding pointed out that
10431A8F uses internal boost, and Slaton Christie already sent the
correct configuration for this SSID on 30 Oct. Add a quirk for the HP
Laptop 15-fd1xxx mute/mic-mute LEDs instead. The other three realtek
quirks are unchanged.

Zhang Heng (4):
  ALSA: hda/realtek: Add quirk for THUNDEROBOT Gravity16G2Pro
  ALSA: hda/realtek: Add quirk for HP Pavilion 15-cw1xxx
  ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7
  ALSA: hda/realtek: Enable mute LEDs on HP Laptop 15-fd1xxx

 sound/hda/codecs/realtek/alc269.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
2.25.1

