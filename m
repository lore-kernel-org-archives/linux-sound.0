Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2572BDC05;
	Mon, 24 Nov 2025 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764007522; cv=pass; b=FGDZ48OqxHfz+m7ZIuJjVP3jYy5Zmweat5GhwIaDJHcoTtz6GPz9VqeSvpccZZoPpY9qIMCZWlhRHSE1CYKW21m5I6cDbGm+FzHqb3MxW+TrRSUhACHOCQUzOk+V9wtSbmNNqeIyJmnaEXz8RQfs9vilZ99Qrve+vKTT+r66Mb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764007522; c=relaxed/simple;
	bh=bugm+Oy+rykpRwGx2l13uv8Yh8IwTt1dYDfvh8Y40TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmowpamAtOks1rx/S0nmiaIiDUM697NYqjtmNQjBh94P90JM3b/o8k6S/2m/nVeAvfPuTWm0vjZBX29ShRG6BfjN2n6RmBKaSsrJpt4vbd4vvrAkPN2eHTOZLxdwuCGwYhk0vK5q+Xsr5IAvW6E3NK0MDlrk62kURnBW+hXji0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=gSxp5dWj; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="gSxp5dWj"
ARC-Seal: i=1; a=rsa-sha256; t=1764007508; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y3qajjEu3vRsRIbaMWU0zWHOqjpze90eVXBkqyyfcpaXHMOlUlvUEkXcj0FTedNy65mN19YGBizjyGJsfLplPHoVzSyIP2ewp5tpaBvlTAS8mtfjNR8M0XJVjufNz9FpFQU8V2KZEhPF8W5fWxhMUqiUX9xItzcJ348WIS9H0V0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764007508; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VFglb5gQC4XL5anfQrXzVHnbZLCGFsFKbMpM4XHFN9I=; 
	b=UPTl1OwHKReiFGE8+M1VD/Wu7QsVmJ1cQ1xEXIsIlyDsqG1xv3Gm3dPR4Uj3/XA1vyAi9S4AekEu6I/EtlNg7X7mfjMy75iqK3kqJck1A40sHl9Te/ozAoNAovsh/N0UDa6Pxz+uvVZp/y7td0Ds9IzfS+Im+82qNM95nenFtfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764007508;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VFglb5gQC4XL5anfQrXzVHnbZLCGFsFKbMpM4XHFN9I=;
	b=gSxp5dWjhUSPAde8VXxd7atgQ+Zv0Q739/NSs8wfwV6V+xg00PrxDSzA1UxFQ5kL
	nB1nTI+MyCmF3wk/sXSWUd51HAHMjjB5dZhXzPHLb5r6HfkPxga+4HcX1IiqTkUmi6A
	tm9ThmaNL4Le10KzynJ0Ggq5p7aJlnRTFm0BGatrwEmXoscf0rcw3KBGI5NV8QGhpzD
	WpicmSfo/tJa0Ik7idNSVKDYnf8ZlUW8A113ZMOv9DZAtLLUx739ZlAQESMi+9U+Tne
	MCPBgwEQZt53b0NYERhvOMTS0i3Nt6gL6CQAOcUKSeoKn5fbYzvotZTSZehj1m0PNQi
	yr6vN842Bg==
Received: by mx.zohomail.com with SMTPS id 1764007506337560.4306806828558;
	Mon, 24 Nov 2025 10:05:06 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v3 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
Date: Tue, 25 Nov 2025 03:04:55 +0900
Message-ID: <20251124180501.2760421-1-me@harin.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
DAC for 7.1ch output, and a CS5364 ADC. This model differs
significantly from other CA20K2-based variants.

Since official driver support for this hardware was discontinued a long
time ago, this patch series enables the card to be used on modern
platforms.

This patch series was developed using QEMU vfio tracing, and PCIe BAR
dumps. Tested with analog output (up to 192kHz) and line/microphone
input (up to 96kHz) at various sample rates.

Changes in v3:
 - Patch 5: Rename ALSA mixer control to "Analog Playback Route" as
   suggested by the maintainer
 - Patch 5: Fix 'rca_state' type to 'unsigned int' in
   dedicated_rca_put()
 - Patch 6: Add comments explaining the port mapping logic for
   SE-300PCIE

Harin Lee (6):
  ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
  ALSA: ctxfi: Add ADC helper functions for GPIO
  ALSA: ctxfi: Use explicit output flag for DAIO resources
  ALSA: ctxfi: Refactor resource alloc for sparse mappings
  ALSA: ctxfi: Add support for dedicated RCA switching
  ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)

 sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
 sound/pci/ctxfi/ctatc.h      |  8 +--
 sound/pci/ctxfi/ctdaio.c     | 18 ++++---
 sound/pci/ctxfi/ctdaio.h     |  3 ++
 sound/pci/ctxfi/cthardware.h |  4 +-
 sound/pci/ctxfi/cthw20k1.c   |  3 +-
 sound/pci/ctxfi/cthw20k2.c   | 81 +++++++++++++++++++++++-------
 sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
 8 files changed, 225 insertions(+), 62 deletions(-)

-- 
2.52.0

