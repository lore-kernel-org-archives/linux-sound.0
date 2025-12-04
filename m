Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D82FDC47
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 05:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764826218; cv=none; b=evnJw/t5AfsSiwS403KE1CnmFv+6ayVzWt9YrqR9y1uNHXFNqz1W58NvQJgqNQTLFg1cI9UVJ1PXs7DvG0TXPx8M1T1xrPq+obn5ezcFaM8EKPJ7KrHkrYId3OjtQKhkpgkeJ+WemF5wq/ZnbyZJXBLzD4nUNbalZ07DXWce9Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764826218; c=relaxed/simple;
	bh=uLosAoKW4UEMswd2M4EA90oQghOHfsanaCJpU/Bfq2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ddpUmo8CugHqQF3pUg0U7ky4ci0frgQC9Y2cDB8Wr8zNeMUNIbRaCm3xXY4Vdsv9ayk8Fm6BDgoEeeQCv477BulHgl4oJfuJkhWuYnL3qSIQrvIlHTruiF3/YskmncTB3tBa6Scg6TAupbLPyPJtTJl1nmZygjyZXrjR2XH9wUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njwIJVQo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njwIJVQo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso6424305e9.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Dec 2025 21:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764826214; x=1765431014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uiXWVyRtV9Malz3iQqv5gUlDqbU6hQq55nc6uSoXaA=;
        b=njwIJVQoHlfnLX6w/60yvQp6yApNVqH5KiQRVgeoI7TiCNuohhd957oAPnJk/b1Jgm
         FyJv6i7upxonsCYsaGHHXSo8+AD+5xRSdOarATNpWcY8uQ0lB7Twfl/KkraeywK1j4R8
         Z869eY6Z2IUCdG4Dfbfy6k8U6GMLCv7QN/dFQHOF3aUEjjyECt8NmxDX7GDQI8RSEVoX
         sZK/4//1nE0njbUBo/4ZBvRcrCrudoQ+68Lt5phNLA2w9/I3TfVz2nF3IPj0H8ZOgWd+
         PDnjoZvVjONRh/MPZc5iQodRVCln8w7HGCv86UY7AQ7xkMsGg88OntJC7yBmnwD9L9fB
         NYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764826214; x=1765431014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uiXWVyRtV9Malz3iQqv5gUlDqbU6hQq55nc6uSoXaA=;
        b=fpYaQhmbuRReEDhpGTwj4O2C8j4znauPJmI2LZxDNt6ErAnqKp1lcPUe1zueotYSbx
         MnTAl68f2CF+Xrw6DdANZn2eYIkM+82eNUXbJd+AuwGNvxVGyF9Bk2Ddpt6GJe75NJMJ
         Fdj4tFwjxpGSo+n34ljUJlPfKdsdwgiwCRdE8Y9/HWjZvguyGUCMz/hZxD1rLl++suO6
         fohQqSrHyMUXbrPmskUyGJDf6fzuwZ6Hp2hJ7+raLu2qHAHAsKOCDqKSlh5wQwAFEmhS
         rrwuBU83fW8TC5oU5W3T4+dpsIR0VSRC1jveldznUKIklYtmza5QVzHizfawa4iRx82z
         bUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbPK0pQeZYEuSKZWyNP2zji3sEBx6AB7Xzr3VbOfMn2zteSY8m6DqXDV1uKfk1jd58u6Szu+ARh7wLUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXDKB8GmGEL/TKZ2PSyaAvbpZFVC73nL6W7kkM+OnH1GeiWOj
	+95ovgEVd1oPBor42TYBEDU2pYxAXq3aYzI27cygAL0N0Sg8V8Ikd8MQ
X-Gm-Gg: ASbGnctYNPFD8oo4SJ9s3Il3yhQNaUBM/ZcTahmzmcOWdgLkB3KwAignjSdpUUQkY3+
	q384HlFQy4ynsKckHC16J+NS/jAkyhOR69iEjEFxPh7TyX7bx43qQGgZvnx/GkScuspyJtZTGSl
	+cGgKZuCmhbmiEOwbpV+RRI699IovLwLPctrSPzvygB+6sllsNRZKOpOXmssFlCJAMxRRSo5lq0
	ZuMbZxVNg1WKxsZxoypPaYlIcnS4/1G9uU2S5wf720+Gug4hmP6MmNKf/6dtF7QFZuew+bbfTKB
	K3fhZExR/mtJBeteBlOkVt7sDazCFdonngJ5BMw3Z1mt5QeFjj9E70klIujuIzf3jhb/FXBsQQT
	DcwmQ1otyVN4RCIQ00a59csFCfR8e038mCkjAjH1dLTvekbm1WWb7weqtza+/ud23IkdJpIM0Dh
	mvAPO7dgua0AmO0A==
X-Google-Smtp-Source: AGHT+IHAMODDrTmW9Cp4fmTFUUwoZJOM43P2EOQe0XZojPUAd2GUDdmpqNFVKQgYZvDFaweUHLph9Q==
X-Received: by 2002:a05:600c:b90:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4792af4833fmr41821905e9.33.1764826213605;
        Wed, 03 Dec 2025 21:30:13 -0800 (PST)
Received: from gmail.com ([147.161.143.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092ba4fsm14223155e9.4.2025.12.03.21.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 21:30:13 -0800 (PST)
From: hariconscious@gmail.com
To: perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	cryolitia@uniontech.com,
	franta-linux@frantovo.cz
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2] ALSA: usb-audio: Initialize status1 to fix uninitialized symbol errors
Date: Thu,  4 Dec 2025 10:52:03 +0530
Message-ID: <20251204052201.16286-3-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Initialize 'status1' with a default value to resolve the static analysis
smatch reported error "uninitialized symbol 'status1'".
The 'status1' variable is used to create a buff using "kmemdup".
So, ensure to initialize the value before it is read.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch fixes the below smatch reported errors.
sound/usb/mixer_quirks.c:2462 snd_rme_rate_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2467 snd_rme_rate_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2472 snd_rme_rate_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2495 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2501 snd_rme_sync_state_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2522 snd_rme_spdif_if_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2535 snd_rme_spdif_format_get() error: uninitialized symbol 'status1'.
sound/usb/mixer_quirks.c:2548 snd_rme_sync_source_get() error: uninitialized symbol 'status1'.

The below is the flow of 'status1' it is used before initialization.

snd_rme_rate_get -> status1 is uninitialized and passed
        snd_rme_get_status1 -> passed as is
                snd_rme_read_value -> passed as is
                        snd_usb_ctl_msg -> created buf from status1 using kmemdup
                                usb_control_msg -> sent buf for reading/writing

Description of "usb_control_msg", states as
" * @data: pointer to the data to send"

Later from Usb control request, dst buf is copied to src buf but usb
control msg request is made before initialization.

All the above warning reported functions, call snd_rme_get_status1().

v2:
Corrected as suggested by Takashi Iwai to silence the warnings
from callee side as it can reduce number of changes.

v1:
https://lore.kernel.org/all/20251203083319.58555-2-hariconscious@gmail.com/

Thank you.

 sound/usb/mixer_quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 828af3095b86..f3e15825bc02 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2440,6 +2440,7 @@ static int snd_rme_get_status1(struct snd_kcontrol *kcontrol,
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
 	struct snd_usb_audio *chip = list->mixer->chip;
 
+	*status1 = 0;
 	CLASS(snd_usb_lock, pm)(chip);
 	if (pm.err < 0)
 		return pm.err;

base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
-- 
2.43.0

