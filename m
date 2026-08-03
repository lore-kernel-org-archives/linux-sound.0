Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.129.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110C8313540
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 22:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785794936; cv=none; b=GeypjPcmRteA/60ynVuCn9UfhAsqMo1hFVGrcGPAbfAcnZJGOweSGv7Lgk96zdoY9giIc2sqUaHhFKDL0EiQfp+i9/DFJcT+t6X5u1IIcZolPo2qighN463yw5iceXt14SaT3mIunYpn8Q8F6lrFVHSR0H7rxhbUXQW26qvG304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785794936; c=relaxed/simple;
	bh=TiU02b5gKkTCFd79C4eUw3kyNmlCNT5Dz4GxTxqYR/I=;
	h=From:Date:Subject:MIME-Version:Message-ID:To:CC:Content-Type; b=guz6R6IMpjXk2fc91FaN0LgGm8EUFByheZYN7CLJcf4zcxJTV5aGEAdu3JNXDPUVgN/NWQ8D60bMC8nV9h5lHIDfapHwCwuUjWsc4DgoolakW6qINHYgesllgSFziLG/iBNsLk3NJquLNHfeLCfMpP0WZM5VpDlwya5eS1OxU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com; spf=pass smtp.mailfrom=valvesoftware.com; dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b=OmKpXdpD; arc=none smtp.client-ip=170.10.129.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="OmKpXdpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
	s=mc20150811; t=1785794932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9t+ZmcdRd8nJy6P7t7lAVcxI3+oM1G1piy0yBitKP+0=;
	b=OmKpXdpDjSewKwZtnvuvcMb1yYB7D8zhhfo0P7h5N8APG4M8/vTXm1ZQj7iZTQKDJP/Zt7
	u8F2Pb/wWeB5/G3KWFf6Zacz62BEvTeCqlYyl+DUAtBZATMVnf1e4CSFAPyz5gH6vnDC+D
	818CH+hCPBfzC0QKXJ+ZeJbzbw5LYPg=
Received: from smtp-01-tuk3.valvesoftware.com
 (smtp-01-tuk3.valvesoftware.com [208.64.203.181]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-643-6weU-CqJPSGFttFrC27BuA-1; Mon, 03 Aug 2026 18:08:50 -0400
X-MC-Unique: 6weU-CqJPSGFttFrC27BuA-1
X-Mimecast-MFC-AGG-ID: 6weU-CqJPSGFttFrC27BuA_1785794929
Received: from antispam.valve.org ([172.16.1.107])
	by smtp-01-tuk3.valvesoftware.com with esmtp (Exim 4.97)
	(envelope-from <arunr@valvesoftware.com>)
	id 1wr0q1-0000000BT9W-2hti;
	Mon, 03 Aug 2026 15:08:49 -0700
Received: from antispam.valve.org (127.0.0.1) id he48n20171st; Mon, 3 Aug 2026 15:08:49 -0700 (envelope-from <arunr@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
	by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
	with ESMTP id o202608032208490051981-5; Mon, 03 Aug 2026 15:08:49 -0700
Received: from [172.18.17.18] (172.18.17.18) by mail2.valvemail.org
 (172.16.144.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Aug
 2026 15:08:49 -0700
From: Arun Raghavan <arunr@valvesoftware.com>
Date: Mon, 3 Aug 2026 15:07:52 -0700
Subject: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNj3dzE4pLUIl0Ti0Rjs2SzVHODVAMloOKCotS0zAqwQdGxtbUADfe
 VRFgAAAA=
X-Change-ID: 20260803-master-48a36c6e70e0
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Arun
 Raghavan <arunr@valvesoftware.com>, Arun Raghavan <arun@arunraghavan.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 7580
X-Mlf-Rules-Version: s20260801042314; ds20230628172248;
	di20260728152631; ri20160318003319; fs20260803155810
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: arunr@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202608032208490051981
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c5GJYfbkzK0nO1CGOrvWA0aBrFks10cvA7E3IlzvzC4_1785794929
X-Mimecast-Originator: valvesoftware.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The stream descriptor status register reports FIFO and descriptor
errors, but these are currently cleared silently along with the rest
of the interrupt status. Log them, rate-limited, so DMA problems are
visible instead of only manifesting as audible glitches.

Observed on some AMD GPU HDMI audio controllers under specific low power
circumstances.

Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
Cc: Arun Raghavan <arun@arunraghavan.net>
---
 sound/hda/core/controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 69e11d62bbfa..5f1d2c132cec 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -682,6 +682,11 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bu=
s, unsigned int status,
 =09=09=09sd_status =3D snd_hdac_stream_readb(azx_dev, SD_STS);
 =09=09=09snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
 =09=09=09handled |=3D 1 << azx_dev->index;
+=09=09=09if (sd_status & (SD_INT_FIFO_ERR | SD_INT_DESC_ERR)) {
+=09=09=09=09dev_warn_ratelimited(bus->dev,
+=09=09=09=09=09=09"stream %u dma error: 0x%02x\n",
+=09=09=09=09=09=09azx_dev->index, sd_status);
+=09=09=09}
 =09=09=09if ((!azx_dev->substream && !azx_dev->cstream) ||
 =09=09=09    !azx_dev->running || !(sd_status & SD_INT_COMPLETE))
 =09=09=09=09continue;

---
base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
change-id: 20260803-master-48a36c6e70e0

Best regards,
--=20
Arun Raghavan <arunr@valvesoftware.com>

