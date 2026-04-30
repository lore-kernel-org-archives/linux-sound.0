Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8EE3A6B6B
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583725; cv=none; b=EuSNVju0SxhKEi3jTU/6yc6A8Rr4XJTDQ1bwJBON1Jl2F6JbvTC1UTDb1t1qQH63FvKONYEsED7kcR2gpgn8VG+P6S04AkZKjIThjhrX5XntXy5Zn9Fq7qa4nkugk92CMBMZE2H2SqRD3ggkEAnqxOOR2vH/CMkW405Y3EJiy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583725; c=relaxed/simple;
	bh=KTwLEUWIT+e8jUbhS98OO0Qav97udJRTNz9JCBY3tFI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OgWLwi5WuYDNDZHvx4jcxqIX72JKeGqknawYfTFA/ICc9ZODMSBIidu58ykhxGDSYFIa5WZWLNTQLBLG4gcTDcXf1qxZAs0Ouf2HFRqgC67gE2nxAHmeH3Oa1paNoPPkslfpNZA3zxC2dw70ZwxPmyblw+lujAtIodZ8MxEjNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjUTQk/j; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjUTQk/j"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1642966eec.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777583722; x=1778188522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfBNagKOT++Xre4nZSTbTP+Vsr/9/6AIqRC97WNWrdQ=;
        b=CjUTQk/j5DK0IvsAtA87sziSaeSAe3myqOEawYAJzPewcH5Ng/gNvL2HWly/1jm9Vm
         kp4aLPHK/KSdnBSAK5JFYPOOuYMG1VNV74qcLlR0uMlSijymXvvflRDzcI00pQbOlTZs
         PVKCtJUXFKdqy73+a0oEYOPcoG72QnQBnGIafatTzEfVf6pkvDfI7M04sRjoBUVIrOQB
         mr1siBYqF/CBIR90xYQjjsD+W0wjw6/1ZRrsXGTv4BmEGYLeVfeRbaIFPXytmQv0OnxS
         oW3VSljH6HuSMCexhAKCxm9Z05X78JNI6Z815S7B7LN3d1bP5L3tlvljDNFn5eMDHE6K
         C5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777583722; x=1778188522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfBNagKOT++Xre4nZSTbTP+Vsr/9/6AIqRC97WNWrdQ=;
        b=hAvYdi23zJNsIC62iy0blCE3t28qckXlA9XE5kiK307+44PKTT/WBxHNWbejI5vaLa
         UJTiamf+6STYjVmNayUMw+ZyvRK+9loOMIXBwXF6Ts1px6xXakLhQzTLUHD4m/CQhERP
         3QIGDbxIi9WTwJD+uXk/pWLm7QpKLxNeFxZoER8v0E6cJiJHBR9OC6rBlTdXcSlxA0Sh
         T6lV4J5KE+fK4VG+4as8kcUYni8LrU3f1LKaqgU/9MMPuGhoyPDTZgzo74+mqLRta/eq
         X0mBUulLWfJM6Pvf1GYBtF4QoBRE3AiXG9Cz2g/pLnLMqvwGjiEE9r/LkLsNiMYZyQ5G
         +pgA==
X-Forwarded-Encrypted: i=1; AFNElJ803ZUa+eYuxjOftQNIZi0eEk9R1g0KvM2ajA0mHAg564ERaqUw0R82t7dCJV0i2p1TukYRNg85rizAJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyib5J/ZzcJ13UOL9AqO1K6aSqoWWV6CL36vOmV/rHfflP4Ut/
	lbVnPVAhZ9n4iSED2AVRC7/ibsQdC+EWh8kG/a2Cqqo50bxW9QzrGSee
X-Gm-Gg: AeBDieu14vAulflio7Pj7oFT6C2mgfRnZ5s8syT3kf8ESxW+PLeg+H0dWY4OakMjTLx
	vDocmmS1mmhGVqZUjHBvdIUOigHdYSJHQfJqJu5UQSSiQRdNq258jHAk1CSH/r8lpQNpu8pphAL
	nJGN08MKN3trD3xfNiKKAjc89CktBEqumBmEvB08VXoEHRSMIRmF4SyrP0Z8o7JbHFmqq3Cd3p8
	W19Fb/FuS3j0xIe2eAT5VPjQheUyFahsBAji6TIVlMjfS+IjjcvUF5rUJtP+fBTGQVgi0agxwMW
	NPBc9O+XZ1lTYfZjjULYurUXLzUa3Y2WdM4X1nyJUWhfdgdvwhkhs3aWRdkSh3dvqsbzjW+xo4S
	EboQ756rrtXK1PYnlflE2KoIgVtoXRRYFSkVskhAqKSC2RB7KUWJ57EtplbS8Ows8jj3hW4PAlH
	+bR4qoV6aC3iUTd1q57J7w9uYmoBkMjMUuqBJ+4yG78XRWG0rEwIcr40INmWLBtuIO7xxegGJVm
	COvMlL5lZ1n
X-Received: by 2002:a05:7301:fa13:b0:2da:10f0:a8df with SMTP id 5a478bee46e88-2ed3d8c5045mr2082996eec.12.1777583721885;
        Thu, 30 Apr 2026 14:15:21 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm1581959eec.22.2026.04.30.14.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:15:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v2 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware
 teardown
Date: Thu, 30 Apr 2026 18:15:09 -0300
Message-Id: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw6CMBRFt0I69pm2NAUduQ/D4PUDVIGatoKGs
 HcBXYDDk5zcc2cSbXA2knM2k2BHF50fVuCHjOgWh8aCMysTTrmkgjPALiK0BiFh5EXJoJ5AY9c
 p1HdIFoPx0wC5KqSgQqkTL8m69Qi2dq+9c62+HJ/qZnXaxjejdTH58N6PjGzzfs2c/tkcGTAoC
 5HLwkglmLo0PbruqH1PqmVZPjzBxEDsAAAA
X-Change-ID: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=KTwLEUWIT+e8jUbhS98OO0Qav97udJRTNz9JCBY3tFI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfj6WsXnRQfsuy2ROPl/9l9nlyz+Noxpxpi8LXNj40L
 3iaXfjhUUcpC4MYF4OsmCLL6qRFlnu6Hlytj1vhATOHlQlkCAMXpwBMRLiWkWH6xkPRb99OCveb
 9+DD/xeV/sylDOcMlxk8nFwukuJccXgWI8OXlCt27+JMd9jEnerJnPvIVVLb9VOV8ZfclBVimxJ
 u32UEAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading with
request_firmware_nowait() during component bind. The firmware loader
keeps the callback module pinned and holds a device reference, but it
does not provide a way for drivers to cancel or synchronize the queued
callback before tearing down driver-private state.

Add a small firmware-loader helper to cancel or synchronize async firmware
requests, then use it from TAS2781 HDA unbind before controls and DSP state
are removed.

No hardware runtime test was available.

---
Changes in v2:
- Add request_firmware_nowait_cancel() in the firmware loader instead of
  tracking the callback lifetime locally in the TAS2781 HDA driver.
- Keep the TAS2781 change to a cancel/sync call in I2C and SPI unbind.
- Drop the unrelated cached kcontrol pointer cleanup from the previous
  local-driver version.
- Link to v1: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com

To: Luis Chamberlain <mcgrof@kernel.org>
To: Russ Weight <russ.weight@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

---
Cássio Gabriel (2):
      firmware_loader: Add cancel helper for async requests
      ALSA: hda/tas2781: Cancel async firmware request at unbind

 drivers/base/firmware_loader/main.c            | 82 +++++++++++++++++++++++---
 include/linux/firmware.h                       |  9 +++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  2 +
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c |  2 +
 4 files changed, 87 insertions(+), 8 deletions(-)
---
base-commit: 1bc46462f4c09f8d429ae8ec17f92886d604659f
change-id: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

