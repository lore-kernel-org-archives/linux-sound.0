Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081033508F;
	Fri, 21 Nov 2025 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734356; cv=pass; b=ecUzEhr0UUD/eFLb/zyBezgiZccSIJqtsaRpr3kCr2pEOHpgxcKUPZEZiET3sEriEgDKMBMFQkXFjFWfk0UeGr5muht2taR/rwTm5NHgCg0jXL700TwbiyUX7HiQZz4+7kSnKZGZSccbg1ekAiL6sDmQwlIOzymRIyIGtnNJ5Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734356; c=relaxed/simple;
	bh=RH1/K7jJzw2FC1mPhFHFjhfKuhDpmVxDjUE9uoG1XBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BPTxnGdjRqknvw+Db4C7FW1DSeKPuyKBL5M1K+QhCL/GquAp3znRSYgl+QX8QF1vfR6Lrw+xfrcHYaAHfkItGOOrsSom1iH9q2x3j0VKSMDymE4au+5R/8Iq+DbXewX/rYXmbJO2e6/WD8CMhW/MzzRQ4FENKU4HcoIwLkfJxfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=FxM0+Ul3; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="FxM0+Ul3"
ARC-Seal: i=1; a=rsa-sha256; t=1763734342; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SlT2AAG8HutxjziJdlWyKkQDWpPh5FXMS0A5IzX2IWc9gKEWiGFs5284jsdlvDYbEdDeUJVhF1F7WbAISCvbGCF6neyz+4PN9xDdz8no70bQRj2e1+FeNkKysgur8+y77V5XpV+2UjvpN9P5KSfFlB7kJemKsw4/2pxipf5LXUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763734342; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BGUWP8bCNkQaxdWtobup1zNpWBVbeQXAaTh77sXCUj4=; 
	b=hfBXb0S/U6wDttYJekcB75EwIGRnJsQ6lAVCP4VXQNu7sFOO66Lsh9v4O+WozK5inFvVBVXxJOhKh7ces2xiuFE3C4Ow1g0PsUWPfcfSILLHkjBPDDG9gnjaSu/fsYlayeH56Y6aCAU+p283obajJBW6dHTbrELpXTHX8Ygizl8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763734341;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BGUWP8bCNkQaxdWtobup1zNpWBVbeQXAaTh77sXCUj4=;
	b=FxM0+Ul3jLfUmuyF/SoRq5ntang0fWUp5RShI8fMpaP5VYSHin/C1/t4k6Kp3QMi
	5u8JgGWJzqDycX97Pq7GoxLcKxEyIgd88d354+M5j6rDBUBzY0kREc9QKmCF0fROr5c
	81+XRDcr464xYvup41KQgZIoVtzSULbvwi6yOmMC8FsWvcyEYH3rb2WzZOv5sH2mqbo
	FTVneZYUceYYtiGUSqkkotLN4QL0zbejzNIrq7EJlMN3LqjipwbnkFujxhcSi22hUFP
	DFyrQbMRg9j/M4LLkaPlUfexh7EARe/8qFY0WEDHbRHjdaY/dK6f/lY6/BCI1SSxeYG
	qC/gwk/qIA==
Received: by mx.zohomail.com with SMTPS id 176373434007414.14465528703306;
	Fri, 21 Nov 2025 06:12:20 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
Date: Fri, 21 Nov 2025 23:11:55 +0900
Message-ID: <20251121141201.850931-1-me@harin.net>
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
 sound/pci/ctxfi/ctmixer.c    | 74 +++++++++++++++++++++++++--
 8 files changed, 224 insertions(+), 62 deletions(-)

-- 
2.52.0

