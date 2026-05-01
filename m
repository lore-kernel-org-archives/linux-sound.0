Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA35386C13
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631168; cv=none; b=oxebFBKHZNJb+i97vdOIhb+ctsg7KNmvSqIL2iVEYF/qhb5i7mfxFUC8qS10Vp/+BMUTd2TBcc/24p4DrgkMhUEQ7ukcY294dzeOO0NplKfAe8Waiu8qyr87XaO/Gx/+n+C7TEFmSStp09OaXGK+HYteEquxEKsBW/AgExcx868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631168; c=relaxed/simple;
	bh=z0mD3CVCy+SQRCqq4yIGoWHFKe/By3TKbOqiG7c//BA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s6Kl7w1pxlaBalJH3ZYsoAhtjtplyu7qLH0lUFYlWBJrc53EBxK/dPvbX70+1x6+ADjKJR1dfbK1gBGO8mNU03R6d6gnXTXDi0S5BRf5HNQS1Sd/3cUloHGZ7RYEx4M176QUvVbT0i4RFMBeXyNZJAVPtNzAIqe97si/X+PnlV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrFC+hD7; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrFC+hD7"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8ccc7755so2735870c88.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 03:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631166; x=1778235966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCk1H00mEV7897HGRKRA9ht3ytPF8oITdA6iPUlnZ0o=;
        b=YrFC+hD7Vk43LbiiE6sZvpA9dUbDxMOxSLSaXewWuUF8FKyRTV0efPZhWW38VM1L3a
         FWz/nKR6xKyAGP5BNv2VpN5IVFjF+l954Mtz9FQIWMTeLxz5BGn+1tbWD/cBbYlVv9KP
         Y0E5avLYxvOUNWe6rJj1ohj9RBXPR+Mckxairx3CFS/Q78xUvrFsSMcdm6PMNL2xcGf8
         b0hcSF5GHJcNlGidOBVBULrrBeAypEwyj+XDuIvfO/2XtOtIT+yVqp+52kyaJZw2Gu/N
         6+5nt9VSQV5sFeLdAVT/sXuCnl9JUKDxKg8N8ffRiYuf2SFbc9vtR+wjntkZ2kt/Q6lN
         mqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631166; x=1778235966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCk1H00mEV7897HGRKRA9ht3ytPF8oITdA6iPUlnZ0o=;
        b=QkoLZYZLYHUc7R1pI66UQujYvfmbiTyk5CnoKfhMvraxerW91I4A/X4EwTHNYULJzB
         HRD50TX19XWzJNHjt6wAkoTEsdoCcjFrjQwNmYwbbBKmLMvK+x1cAX1hRz6yqt5M1GXl
         BFUpoZYrvijGQC1nYNaf2S0WH4u4NAiuzACHSlsu+ThNTLx2/2fQk9bzpltENwmHrGLi
         pTm9jUdIEF3c2mBEBSob7QXX9Is8qA0TT67Zy5J7w5RAFSXD4SWJlWVs+RbWVmhIBFNR
         YXugwarY6zCGY6f1o7UsATL189pVRCx175wHkvFHXryRO/QHSPL7w4XmEaksEzoZWkrL
         A8Og==
X-Forwarded-Encrypted: i=1; AFNElJ8xrT1loZHVQDD5rJfa95J9z7Ujz7flgXLe2YeZCY9U94fiemGxeI2LpcrzJPfSCzAIVX5Sc2ym33T9xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOkQYomVzZ2w6u2c0wcvDO1Yu4TROP723CtdYhiwh9tN45+EL
	NlugvbNevGnf8C1ji8mi/9QMHYVqeJNhg8lc+XS+3iG0eB90uxa3A/eh
X-Gm-Gg: AeBDiesczm14K2bILrqU72IZfbs5gt+BOUEwofTvxs/E4QlsPpd6LSUgYX0UJPulAoa
	fGBzq/MnEPRd9X+HgVPR38Qe7OpprQcqOZqg6uqH/JMxKvKMJtrsYaswACeV5IMxt7yf2pS6VP+
	aUjwZdQk5ZATF+qoM7L+ZWNZlHUyChqooUxHXkz+jfiS5s4cpjNA2HdZqmKhs07fMXvkwcF7hjm
	g7xoEKPglMt/GjWkMLV7KuHi+M+oyi3AeU0f/RDTlMd0P8J/FraSvVSqgeCqx/xu1EDi0XrA4Hf
	gwwBnzaNA+v+6C45gA2emx/tkmZjys8mWhbMNlDp4AQg66TXSwlLDbzoDoeMZFug/Byd5nthR3D
	qeCT5ivy9lXApsDQj2kjNU6/F4Taducny9h2/StANG+tgg+rZHxiOG5TFvmta+vhC/U4fsWVc52
	zO4FWvh3gGGiQibHJ53BJBrwXlGXYU2VcOWfeCAvqz7dYTPjrRmSJlW/I9vJMCG5oYO548nwNF4
	LQdmz/lFi/B
X-Received: by 2002:a05:7022:f40b:b0:12d:de3e:86b6 with SMTP id a92af1059eb24-12df82989e7mr928285c88.38.1777631165731;
        Fri, 01 May 2026 03:26:05 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm2621191c88.11.2026.05.01.03.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:26:05 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v3 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware
 teardown
Date: Fri, 01 May 2026 07:22:11 -0300
Message-Id: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OyQ6CMBRFf4V07TOdpOjK/zAuXgegymBaBA3h3
 wV04dK4PMnNOXck0QXvIjkkIwmu99G3zQxikxBTYlM48HZmwilPqeQMsIoIpUXoMHKVMcgHMFh
 VGs0VOofBtkMDQqtUUqn1nmdkdt2Cy/1j7ZzOb453fXGmW+TLovSxa8NzPdKzZfdpCvpjs2fAI
 FNSpMqmWjJ9LGr01da0NVmaPf/LyoECN8pme6MFU7tv6zRNLxusuNZCAQAA
X-Change-ID: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2987;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=z0mD3CVCy+SQRCqq4yIGoWHFKe/By3TKbOqiG7c//BA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlf6jdZr3Ocskv3UelJ8YC5IjyzNG98Ximi1sdTffNxn
 mINT+XzjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIyVKG/yVqK+WLZL55nd98
 5C1DZPk9Pafq30zpP9bOX5F2U6fPhZPhv8dk1q5dT10kLcQqtvf0G+3y2Ti7eInHwXhW8bT9l2z
 ucQEA
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
Changes in v3:
- Keep request_firmware_nowait() manually managed instead of making the
  existing API implicitly devres-managed.
- Track scheduled async firmware work in an internal list protected by a
  spinlock so request_firmware_nowait_cancel() can find and synchronize a
  pending request without weakening the GFP_ATOMIC caller contract.
- Match pending requests by device, callback context and callback function
  instead of matching by callback alone.
- Avoid the devres_add() / schedule_work() ordering race pointed out in
  review.
- Leave devres-managed support for a separate devm_request_firmware_nowait()
  API if needed.
- Link to v2: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com

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
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

---
Cássio Gabriel (2):
      firmware_loader: Add cancel helper for async requests
      ALSA: hda/tas2781: Cancel async firmware request at unbind

 drivers/base/firmware_loader/main.c            | 71 ++++++++++++++++++++++++--
 include/linux/firmware.h                       | 10 ++++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  3 ++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c |  3 ++
 4 files changed, 83 insertions(+), 4 deletions(-)
---
base-commit: 1bc46462f4c09f8d429ae8ec17f92886d604659f
change-id: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

