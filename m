Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3CB381E98
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941107; cv=none; b=L+k+JwJ0AgETZt+ntLNxDGfMU3oHii1yYcV0R0GyGU2hVuGXlUwvo/CG5/Wd8NjFbiCPIOMaqf/7QGAhUkHy1MP/WAzF+vpy4kNh872enqXk4WMISD2yJcPStXZMgsV8eB4mBIY9/47Bh3I3ybHtpDzZsMy1Zej0DfT972IU+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941107; c=relaxed/simple;
	bh=XSucsNuX9X7hzINx6JYwFsYw0pt5SRtAJ05u4BYCZ2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cfnaICdR0Z7+ph/FF4/27qWLWj/99e/C7UOdUxtpxIFp8gTL7HAgQVWRYbmd/2ZsfDUccO3m/8RVUm2TSM2g5zm4rZqBtB+vYcJk6YEWT6o4jIvey5aEWO5FCEiALAs1sxAltj2TtFkGrdRu8eKtkALGCMVZJucV+u9D/F3GC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBpT6E5o; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBpT6E5o"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so580899f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941101; x=1786545901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGL4f0JLI8XqgdsGhDUip2KnjN8UM1C5Y6Dfr5ZL+Ss=;
        b=CBpT6E5o3U0pzno7qyiQTrXG8s4aW2AlFQxSWV75eaTRqxmcYmU0RDLcpI7nr1psQy
         fuI8OEpoKoG1/ZGoelpYa2eOnKEt1WZHMQLIujmoXv1cHGb7ME5Mk+qNwWBerdzkByLR
         2n+40mCKkvNyA8vbAb6jikF4racqTaWU6KNIT3Hg7r52wyPZeylwblZdwLWMwdiA3/tU
         Byr8Q4jlRVi70jf0kcGx1yHPtyltJbc9CmTPgSQMBGVO32inxjdvpPIYtvyfRRWmTWu1
         GYkKHC33gdak8nHGCQFLLVA/0VnYrqfRsUFpB2sOpXkgtPDfw+5/fKrlwXxxr/LFS8wZ
         h9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941101; x=1786545901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGL4f0JLI8XqgdsGhDUip2KnjN8UM1C5Y6Dfr5ZL+Ss=;
        b=P0zuS2VVtF1R7N/gR1T0CjxTdWJfJJNkcK1CaCY5QUDE1k2uGuoo3l8imFnGWuhq6o
         Q36TMLvPAqJhukUh67rESVTp+SOZUjswX0vMU2ox0pM+CePUz9YIxsVMPvf/lRwsRH5H
         mfDn5gfYLBXo8siesopXzhXywYZ1Qa/GJT5Nh4mSr5AK1dfjg3DOuuhPZue97VGM8/GE
         D81Bj6zKNNYMHaQvp8DXN5Oort4XTeGPY88xUUIC+LNhFgPnmxuZwVTZcpgopInIP2n8
         AJ0p4+UyXok3XbU2DrkNsqTPuh6XzIJZxgCV1PDSo5iJZjBp+bbb6/fQvzAUTDDrcwgv
         to3Q==
X-Gm-Message-State: AOJu0YxsvWdI4uo8QNcoatdV+16KO5xOONh45INSTmCRyN2Ld4azIYNk
	VWsorNkInGU+8G0sWr19YNWu4nxmneryV/s+AKtrAlM8csuS1p7r2ADp
X-Gm-Gg: AR+sD12KzfM9znYe+3oIWXcNJHXhOmlT+u29dtN8e7KLD16zUAFQGABfJ0bTHdxQIr8
	hsnFx5/Z1fYFkYX7KBzYH7cwBA33a43Ja6c8akekBAmEs3x8aEKVzDMePXRxBMiTPr0IlJg0BHB
	LWUvDt4KzhaHkgN30u9Cs2viA1MXLn7feXLQr2seSWZkDWVD9eRAU0FQyUbDku7rIXC3UVET28D
	CvuuhBLxZapPSr8rc2os+AEKEbfj9BQesrOJ4sg9QVgRa6UMFAYW/DfnG6M7REFEZEBPjqHzEtd
	7Ysx26JqmeLq09//cniCCwLLnzqkX9iSMmSIOE7cc/dqqM8eqJ07gi4xlOpPpK+/CF09o2v77NU
	AuAzvvQ2CqnuBP0GuuHfdTraBIDFcVdQDQysMbBBedon+B+AsYDy0mQO67jSQOSp0/u7Y43hdhn
	C8N8OifdOuCmevUCxFRGHxZBDrLMoRAu891YhIVFxhV4CCu4gGsKzpWucc4HT3Wp4r3xgRsHUaw
	HFzwCGzxw==
X-Received: by 2002:a05:6000:2585:b0:47f:90cb:630c with SMTP id ffacd0b85a97d-47fec512a47mr11632083f8f.8.1785941101080;
        Wed, 05 Aug 2026 07:45:01 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm10499376f8f.26.2026.08.05.07.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:45:00 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 0/2] ASoC: cpcap: Use standard ASoC DAI link configuration for voice
Date: Wed,  5 Aug 2026 17:44:32 +0300
Message-Id: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the modem-specific voice call support implementation
from the cpcap codec driver and moves the DAI configuration towards the
standard ASoC DAI link configuration model.

The previous implementation added a cpcap-specific .set_tdm_slot()
callback and relied on a client driver to locate and configure the codec
DAI directly using snd_soc_dai_set_*() APIs. This couples the codec
driver to a particular client implementation and bypasses the normal ASoC
configuration flow.

Instead, the voice DAI configuration can be described by the DAI link and
DT, allowing the ASoC core to apply the required format configuration.

The series:
 - removes the old modem-specific voice call support implementation;
 - makes the cpcap voice DAI format follow the configuration specified by
   DT.

Patch 1 removes the obsolete implementation.
Patch 2 updates cpcap to apply the DAI format from the runtime DAI link.

Ivaylo Dimitrov (2):
  ASoC: cpcap: Remove modem-specific voice call support
  soc: codecs: cpcap: set voice DAI format as specified in DT

 sound/soc/codecs/cpcap.c | 130 ++-------------------------------------
 1 file changed, 4 insertions(+), 126 deletions(-)

-- 
2.39.5

