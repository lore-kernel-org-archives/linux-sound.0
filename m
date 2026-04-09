Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77218AE3
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 05:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711273; cv=none; b=Wz2O63rz3wI1qrAb3r0ZVeM4rW747tyYsAsmiP+6+ni3IK4lS3KKpgX6TTGuJ095pg4e/3bPtEe1AkmCxFrSBF9zhk9kOByWVKgdqQXl2XlI3o8QLkyw+xyVLlovKD5g6FaveUQMdD2rVvo/QAc2cVhipXBkHsbh/FJhDGfZNgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711273; c=relaxed/simple;
	bh=v87RNLvMiQOcnbz01vIKpP24Kyvdh0vbKKenRgsbG40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kyia+XX+WQ4OZa4PHdGB1YuhnK8k4VjdBE5icUsV67g29nu4a2KgOsVeEB/3jO9JTX6q/tMHVMN8uXZZoT/RIr0lrDXoWOewkRw3hSS9CeHT91ytIuUSBtsiE5wj0vsC7Cpg39n+cR6wpfaEScxjAjVQEre2otc08MCsvIF27x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4NtwvSo; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4NtwvSo"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128e4d0cc48so7436619c88.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 22:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711272; x=1776316072; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuRPT3apJxvq08QNijPHEb1/g81WKOAMRl7anOqqeZI=;
        b=l4NtwvSo6FrH7o8SP/O+CmxGbK4shYpfy1FQ2EjSmwBo5EuG4z6sm6BBbqXmr114tI
         BCsK3pByMOcHF941qvUfLS9hLxs9nZ/B5Hr0Qd3pkCddfVS9kI9lFTnbGq0YD6JQXRuE
         SPaBEtX3dInr6n/tpILMtMzXQujH9ix7z0MhI2NFy1xEcYLU9+e4q9erIOvRbptuZb18
         wbM1B+RxyZZlYRGIBq0IYSgXuoIMlxZO4nUbQfXM8pVso4xqSbW9cgKKMX5e6KiZ6KlO
         +D+ND/4CFE6JF/ARux7bTzJB/6Nmw4kLoNtiLgkfVgSgsJY2/149vFA9dAliJifUCCgw
         LmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711272; x=1776316072;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuRPT3apJxvq08QNijPHEb1/g81WKOAMRl7anOqqeZI=;
        b=mZ9NHkpbRwoP69J5K0K3vCDsvx7I/VNSkDuTduqTNkd9exniGa4TO8+Dh0GxtoxtX4
         j/lxAXowCBczsXvm0Qie1NwM3VuKT6UyxqF2v9eYRq2dPwcCp/XxdQIUBkHquBiQyM40
         3rXpMZuqhKHc7CaZ1K++kBYPFpr1bO9ygdxWzjSxEOfxIcPej03HILJKGC1+lSjWKG4f
         fJTNWI/yzIMkjP6Xahx9K90ZA3Ssh4PHbog0Vyr+8o0ZXNaO1wEjAvaO1YbdmOc0JuGD
         MnKlQ7BUk70kABiYJX+Sga9IMvQTZRnJ8CwIqSi1KPqxEy5DJeamFwcnIpUGa/01lhq5
         MwYA==
X-Gm-Message-State: AOJu0Yz0m8dh3RzckgAdrVmZNNRyObR/BmmqPWbytZNvMWkxcYcIxGlI
	7q8ZnMOmwxnbAeI0ayqbkdbKumpW5ckAcoi5Yda/GDHPcAlklNfidABB
X-Gm-Gg: AeBDietf5b2LtfP++/NCy/YJpfLjxJv18atJtinO5iSz1R9SqT44ZFcVXDKGFbJPRen
	ozhAY//PeP0PzhuRd/8yi0Ixzq23g09MhqDamKvWwbxvOB2qknzn9GB/BOgFI/8tDBX1/vaJvJX
	BcSebHVyiHxtRFF2a+ffhaHoFOvC4tJ4EdDYVNtWUuwxqy61WSMVfTuLvD6WIhZ3ZZIsjROYAhW
	D7bSmoStHRtCetVsN5JKqxcfI4UF5KGj6XtrM5zhDvJdf/kDVzEls62mst1W+ndQMy+Z6s9CfPD
	H+7q3J+jNvz/i4Gg/tQkyDAtlCG5KZ4DOQx7zRoH+LsaL7CuN3AMJ2DClyaWKbini5FYZ1dFDys
	4tGv3xXvBnT9Anjx7Xtu9ydH9WB3sJfmzU+MkmVSaR8eZ1WpoHnX/9eJPXfLA9M+Pn38zwnU922
	Pg+jTcYNwALF+EldKgaoeBgkFWtdxn00GLeCMZlTF9SckDcA2bgDX66wwrrFhTnSsk95+V2Cnim
	Kce
X-Received: by 2002:a05:7300:2311:b0:2d2:fe3e:b763 with SMTP id 5a478bee46e88-2d40e3eb693mr1419777eec.22.1775711271346;
        Wed, 08 Apr 2026 22:07:51 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm29975641eec.14.2026.04.08.22.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 22:07:51 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: msnd: add suspend/resume support
Date: Thu, 09 Apr 2026 02:07:44 -0300
Message-Id: <20260409-msnd-pm-support-v1-0-2abef720d0e7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IMYTSq5QuNBnbKSSGjBFBv
 LuxLt/i/x2EMpPAs9kh08rCc6zo2gbcd4gfQvbVoJW2yqgeg0SPKaCUlOa8IHXGG/1wg9EWapU
 yTbz9j6/3bSnjj9xybeA4Tk8vUdFzAAAA
X-Change-ID: 20260403-msnd-pm-support-e14d428ca426
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=v87RNLvMiQOcnbz01vIKpP24Kyvdh0vbKKenRgsbG40=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnXTVQY2iyzeHkCij8cffp6fa6c0i/taJH3JQ6rnHaJN
 Th58vzoKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQ3h4hSAiQgaMPxP45kXE9hynOte282a
 2Zt2S4lY73y6JEw0YP5P+Rms/RHnGf67aEicFBWz3bVulW64nkj9XduStRsdVx53UDuyTGrlbiZ
 GAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The msnd drivers still have no system-sleep callbacks, and the shared
driver file still carries a FIXME for suspend/resume. Probe already
depends on rebuilding volatile device state by resetting the DSP,
uploading firmware, reinitializing shared memory, restoring mixer
settings, and calibrating the ADC. Without matching PM callbacks, the
driver has no defined way to recover that state after suspend.

This small series adds the missing suspend/resume support with the
minimum scope needed for the current driver.

Patch 1 prepares the driver for PM by:
- accepting SNDRV_PCM_TRIGGER_SUSPEND in the PCM trigger callbacks
- factoring the IRQ enable/disable bodies and adding a helper that can
  quiesce or rearm the shared IRQ without disturbing irq_ref
- restoring cached master-volume values when mixer state is rebuilt
  after DSP reinitialization

Patch 2 adds the actual PM callbacks by:
- saving the current capture-source selection and msnd-side MIDI input
  state
- adding shared card suspend/resume helpers
- wiring those helpers into the ISA driver and the Pinnacle PnP card
  driver with the current callback signatures

The series intentionally does not add trigger-level PCM resume support.
The driver can rebuild hardware state on system resume, but it does not
preserve enough runtime queue state to justify advertising full
SNDRV_PCM_INFO_RESUME semantics in this change.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: msnd: prepare system sleep support
      ALSA: msnd: add ISA and PnP system sleep callbacks

 sound/isa/msnd/msnd.c                | 72 ++++++++++++++++++---------
 sound/isa/msnd/msnd.h                |  3 ++
 sound/isa/msnd/msnd_pinnacle.c       | 95 +++++++++++++++++++++++++++++++++++-
 sound/isa/msnd/msnd_pinnacle_mixer.c |  4 ++
 4 files changed, 149 insertions(+), 25 deletions(-)
---
base-commit: 9f2a23bd5d30dc0968e56a2b6e5edb58aff1bc6d
change-id: 20260403-msnd-pm-support-e14d428ca426

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

