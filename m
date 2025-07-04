Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82AB1FC8
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 03:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598193; cv=none; b=Aqwi7fPP0DfJqIfCPiNoQ33CazEXIucNvfFgfaSKtZ5RosBUjO4DriPzTsgom+87KEdPj0v5jMmvmzzm+MmFX6jTmiFUpnAZeAJK6j38c7l3Mfg1mOvlZWxSFOlrlZPWE0MOoI+OsaJAwmNPNNE05n+9s2YkIxZFRiIoosiqc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598193; c=relaxed/simple;
	bh=Cht98qCDEr34tjWOyoeQT5oQk/0EC6hZi6vOCH6lbCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QquGFJcjy/uIKNui1iSC3y5gi3RP9NroJa508PmjEuGu83t0YlK3eISVI1lZfA0ueMoK9fAWNPXys4qNwOSp5hW++yx8Fp5jGmNdapChWhh7Nuz4X3a0Fj/na4sa3COYI/TDkDuLlfUsIibC3WmPQOpyxgshmUOb4egj9jn/BP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fp4jeJaA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fp4jeJaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751598190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgUqdYxBQTZlOw6DSwEk1Ly2z/RL4ZtAN9t9nZ4wSSE=;
	b=Fp4jeJaAwXyyyrk08MkXyUXvrI+9Ncy7s4yXY1pSPa6IZ5+unuajRtX/0mlgrB8o/h2Wad
	JfOYluSK07pICT5KB1KUSbBKz7IYeetqPsQw58JpdXB5TKmVl4gy+ti05Iz0kMgtl7y7Wk
	RpbI96mbaH+wuqAMMJg3qzJHLHrOzKk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-u_wzOsKtMQy1s7tetkDQJA-1; Thu,
 03 Jul 2025 23:03:09 -0400
X-MC-Unique: u_wzOsKtMQy1s7tetkDQJA-1
X-Mimecast-MFC-AGG-ID: u_wzOsKtMQy1s7tetkDQJA_1751598188
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA608180047F;
	Fri,  4 Jul 2025 03:03:07 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.120])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A4FE180045B;
	Fri,  4 Jul 2025 03:03:04 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for ASUS NUC14LNK with CS35L41
Date: Fri,  4 Jul 2025 12:02:32 +0900
Message-ID: <20250704030301.1495639-1-snishika@redhat.com>
In-Reply-To: <20250704023930.1492232-1-snishika@redhat.com>
References: <20250704023930.1492232-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Add support for ASUS NUC14LNK system which uses Realtek ALC245 codec
and CS35L41 amplifier over SPI. Without this quirk, the amp probe fails
with -EINVAL and no sound is initialized.

Signed-off-by: Seiji Nishikawa <snishika@redhat.com>

v2: fixed unintentional formatting issue in subject line and commit message

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

