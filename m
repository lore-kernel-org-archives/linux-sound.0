Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93162D7801;
	Fri, 21 Nov 2025 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738563; cv=pass; b=fEhG9I0Cl70SML1vvaovZMMnDyfjVpkygYq6/KyaUUX0rfwAOCCyqA0OEq1M0StZg+/M3vFRSnclebefS1OM2SCPuPz4oMzYrMTSlPQC139Bk2VuXRkvgo1pcwDMzA5HZDPrPWV53hvFqynFWAkq1Tv/XXNXO6UexVGvRDYADoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738563; c=relaxed/simple;
	bh=1dK16ZRl2jHwuTBJ1PZkCnZ95xmvAQ+JSQWzae3FRsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pq+uuovfQyzCpCHv8wQBq5953leDdWjZTIiBwBDK2mCXEDKfELaeqVXEPwG1qbqcek++Z3CuIN+4AixF/ESRxsVjoGJHsjqmiuTwyuld//IfsNSLU1JvPV7Wi19wKNIOHGIe5tX+GIOahfAth6nooaqdiFtPPOYMPMLI9qjCAwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=MGTlXAbz; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="MGTlXAbz"
ARC-Seal: i=1; a=rsa-sha256; t=1763738552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mUUiZ4qy6k0+O8sUZPhhv97EYysM1duQOfqpVaFvtPt03y3HNjPAkyltUuEITiDlpSs2bZwrt/55A8iGWBU/jRNc+lyIOMwqJKjVaDeARHa7iBRcy4RGDDWKlmGEMHOvvb1x/ZaRuudHdmQY1Jqh9LNJP3byLi5bgowuJbJLxcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763738552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kpogGQpgsVRI9Z8Ko/XvBKLxgen5G/FZXV3sbq5+BuE=; 
	b=C/rdVkRwhLIdllDkS3VpDB7olW4WpjbBKRcg6wUlyxuFLp2qfBawiYQH7Cp5AuL5uQA1bQh+z/JN+trHSCfMzwhWbG25VlyZ5N+rlFU9ouWl7gI0wFmcIQabMBQkSl7HRtBUf5Cv+cubzVJm2naaR8lQeWNtaTie1w+A/tfgZnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763738552;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kpogGQpgsVRI9Z8Ko/XvBKLxgen5G/FZXV3sbq5+BuE=;
	b=MGTlXAbz/FIVu9lJi65tyZEk1NSp+SA94ekyEspWo8ZZPYadoWlQHwSjzck54TGC
	Cj+eXJKYZPA08MtDEQ4jC7Wf/+VNWvjpraa4HR9YK01B1mjGWz1Gqariq0y/7lk3ktl
	akL2o+TNnxIt+QvWtXLUJ3SSdE6sJMa//cen8jhqzX6bd9gFY/gtM/zPGmZjnnlVzNY
	ROYWAn2VyEDTOWDbIRQ8DWosIhqKxb+LId0PdBugxRfhWZT45gstPlW0bK8/Rz3pnQs
	b/+m8OdN13qDA8RHBIDNseXL+B2tRiHcCPxIkd4tZ14pSQvUNA9sqBotyEir5KJftTV
	4vHZ1Y4Jgg==
Received: by mx.zohomail.com with SMTPS id 1763738549313586.4046866520794;
	Fri, 21 Nov 2025 07:22:29 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
Date: Sat, 22 Nov 2025 00:22:14 +0900
Message-ID: <20251121152221.1152523-1-me@harin.net>
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

Changes in v2:
 - Fix coding style issue (mixed declaration and code) in
   dedicated_rca_put().

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
 sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
 sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
 8 files changed, 223 insertions(+), 62 deletions(-)

-- 
2.52.0

