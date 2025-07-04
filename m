Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E01DEFF3
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596787; cv=none; b=OBElrTs9yMfGW2kmwNjGHhkpvWBIU3nTsHz8D3Eo0wlu0ndtUkM4l2mr+xyqwBt5Lb+8Zbaz677AnLzN2e4w1y+WmwNGMhjEvqnn7s/2zevfn5wI/pp6SfSXx/5a49FeumTxia3Hum8YwzubKouwX7AIpnraT/6DXudUMLuUoWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596787; c=relaxed/simple;
	bh=R3QcPQzvhbe6iv6zrk867vT/8DETTHJhtvzdTGThP7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4Fv/VpXNEXVfY6qo2idL8m2PABEg+PoGnle4BCBzVX9Ma4xdrKhgJU656caazvC2fVgyR5cCFv1daH+hwnxp9x7zXFXwHXUK7biSaI6I9LVDDuOAgw7lvTPFRqPCzm2mR4qcR7DNyN7Xwd8A9Lv4I/Q+wg3UmKWYgYvPVqI23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVTEpEHa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVTEpEHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751596782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3UJMoMK9R/4PS68csbcacMXYsDFPJBCUqlmZgu7NIHw=;
	b=NVTEpEHaYlyDJc1JoYA8e3Z462BwJE3k2RlhwR9H1vcad9897UWKenS0RHfRyPCkyf+UFm
	ZRkYaMKanMYDNnKsQteff0UZFnbqYjP2AeHNo1TEMG1Gf1Ezv+t0WSlPYApwQYnnvoIofC
	meHub6ZElZQAZHBzTVApt3vWdmlsPxY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-3DP3HIs1NSe3yc1Yk-RI6Q-1; Thu,
 03 Jul 2025 22:39:39 -0400
X-MC-Unique: 3DP3HIs1NSe3yc1Yk-RI6Q-1
X-Mimecast-MFC-AGG-ID: 3DP3HIs1NSe3yc1Yk-RI6Q_1751596778
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4842C1944A8D;
	Fri,  4 Jul 2025 02:39:38 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.120])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 103A119560AB;
	Fri,  4 Jul 2025 02:39:35 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH] ALSA: hda/realtek: Add support for ASUS NUC14LNK system which uses Realtek ALC245 codec and CS35L41 amplifier over SPI. Without this quirk, the amp probe fails with -EINVAL and no sound is initialized.
Date: Fri,  4 Jul 2025 11:39:30 +0900
Message-ID: <20250704023930.1492232-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5d6d01ecfee2..7ce54db56354 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11084,6 +11084,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x8398, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x83ce, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x8516, "ASUS X101CH", ALC269_FIXUP_ASUS_X101),
+	SND_PCI_QUIRK(0x1043, 0x88f4, "ASUS NUC14LNK", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x104d, 0x9073, "Sony VAIO", ALC275_FIXUP_SONY_VAIO_GPIO2),
 	SND_PCI_QUIRK(0x104d, 0x907b, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
 	SND_PCI_QUIRK(0x104d, 0x9084, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
-- 
2.50.0

