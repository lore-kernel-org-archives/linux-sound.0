Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA993126AC
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352027; cv=none; b=Bo+nqdh+LQhxjVVaPJOozGLBd28R+k0ZtbhWzrHB0rDuGIOD/WfQsJ2cVH4+a5xG6wxCMvlLbIPK/Djz9G6RIR628UD4tTvjvdCXsZuQdG+i1Zw/9Km691Owz6WufxvewjTC+xR6/Nz9aYeaYR8O+qQ8OBJ86sXjOs2ofFdA1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352027; c=relaxed/simple;
	bh=6YWoqxxbnrMYydSVa9Qh8wJdVhNjvLG9KIPGvnlL4I0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YWS6FcDYdwww7Il4jWSFZijJxaywB2V7Q94VogfAGCC1MTFPuI3dEVF/OSNnd6xVt5St5HM+W10suJcTG0pOYniwLVgIQ5tW4sq4vj7jPuKRoxsA9l9eLEDUYxDsNVuyktqFlU4oMNqTq2w9epIOLNBFsG3SvJBitq3Hhin2LBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/2/J+Em; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/2/J+Em"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-44f98e6e38cso959735b6e.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Nov 2025 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762352025; x=1762956825; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XknEbNCL3F43HP4kQxUpYRoPdCIRB2syEKKMN+ep1X8=;
        b=f/2/J+EmiK7cBui4mg5Z9caAbhEvZKOdEH9QT8NNcIT+zuUDGGa45cPz5gudTOqZu8
         OG75bNMU6uSnhkbYR5xATka/KVkEy0OQwl37D2hnfAXpEC14KTLfbC1e83lZyv+qGe2/
         WbNp89h72+LX9TPN63vXy219vNjZ9uh3xeCvtT9RZHmixKT2iDhF8tdSJAl/4E/gg6m6
         aAuywVgoMbcz9Mw012rkATbKiP1Sy1QFbRgLQaW0ciEPzwmztS+hk3XV5N8TlZW9nJaj
         5WSzbF8xyiJmx7Zk5pyscOoKIDxo3vQzOZWWXOr8ah4rDiiBVc6Dc30+9u33EhDxtJUJ
         fxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762352025; x=1762956825;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XknEbNCL3F43HP4kQxUpYRoPdCIRB2syEKKMN+ep1X8=;
        b=rdI6UOBmUX7DA/M7pzE6SInw69Se8apPMq4XVMFEITAe8OEDRwqInxEIjDHJ38aiVx
         6E0bJ0XI6sRKR9zwYvNKnwLGIbSD1AHhx8mX78snlHX2guuVeojkmX66yMf1Gae/yFV0
         yROoFY7URFXR8BKAnjCH7FrV+6d7wBVq8n9+ZgV7WJjZTIU73r5gc+k5ffEBN1iK+Ioe
         CsLsDqhG25INqaBi56pRgALiJTqpAEVI7kG7sjRfbBkLamEw8ux+JLTydMElkXUt1CtB
         oqZikpf/OQ3wzd7JS/oYRSFD3oj/rWfeCLOiBGZNvIXEAcpzTrqzpS2qXuNU5JN0u7Kw
         sbDw==
X-Gm-Message-State: AOJu0YzYfwRk38OWvhkM/kHFVKI0fZPOKyerwbPCuaZbR+nruYMPmZjy
	JyZvDI+WIR9At65ZxW242bp8+fqTWKcSrhDRrG3pekKuLJLN3Yb4N/nf1D0ptXa8DxL2k4TGDkY
	vHJMcKdgNqx6Aj6VBD9/4DdX+XKZfsLiSORs1jsMgQg==
X-Gm-Gg: ASbGncsD49guZjW+SweeKkfEXOZe0BInbTE9fwMvElZOMz1yKQrYtBaUoAiotVXu3Lo
	VTac+vg+18Wwh30Pa07y/sqfy6MNlJ3kJhYrsyVpBixZdyB7RU1hK8nMf7Y7szEaZpNeH5FzXkV
	0ad3OVlYX+yfhbHuAgdUrH24XGrRIrKRvnjX3HLkDMNdijY2a/WsLFPbpdovhlVsYBIqV6wRLTG
	7RwtnWcgPWk98aEVca4XzL62O2l9LdQGbIJLhFhLnrcREit0fOYgVQFBr4Grg==
X-Google-Smtp-Source: AGHT+IHHguTayHzFs2g7WCeZTh+5juZk0KayeGftOYgqrFzuWkh9Ag9Wq3rZAYcxImacr/01OYNLuz7Oak4KQKOJs6o=
X-Received: by 2002:a05:6808:2386:b0:44f:6e2c:b4ad with SMTP id
 5614622812f47-44fed37787emr1169346b6e.53.1762352025423; Wed, 05 Nov 2025
 06:13:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Iakov Pustilnik <xyapus@gmail.com>
Date: Wed, 5 Nov 2025 19:43:33 +0530
X-Gm-Features: AWmQ_bmooQUz5W9Gz-GsmZAh8yVvj5erWd_MqOhxX46xFp_gspinlFoECcZagpU
Message-ID: <CAHRbhAkDcYQj=VQrNdc7T7WfDfiuDWpnk2s3pjoeouptgy_K1g@mail.gmail.com>
Subject: failed to add SPI device CSC3556 from ACPI in v6.17.x for Cirrus
 Logic CS35L56
To: david.rhodes@cirrus.com, rf@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello to the Maintainers!

I'm using an Asus G16 GU605CW laptop which has a Cirrus Logic CSC3556
audio subsystem.
There's a problem when initializing audio devices - the bass amps are
not initialized correctly which produces low volume high pitched sound
only from the on-board speakers.

The corresponding relevant dmesg output follows:

[    0.000000] DMI: ASUSTeK COMPUTER INC. ROG Zephyrus G16
GU605CW_GU605CW/GU605CW, BIOS GU605CW.306 05/07/2025
...skipped...
[   12.132316] cs35l56-hda spi0-CSC3556:00-cs35l56-hda.0: Cirrus Logic
CS35L56 Rev B0 OTP3 fw:3.4.4 (patched=0)
[   12.140405] snd_hda_codec_alc269 hdaudioC0D0: ALC285: picked fixup
for PCI SSID 1043:1034
[   12.141206] snd_hda_codec_alc269 hdaudioC0D0: Found 2 CSC3556 on
spi (-%s:00-cs35l56-hda.%d)
[   12.142177] snd_hda_codec_alc269 hdaudioC0D0: autoconfig for
ALC285: line_outs=2 (0x14/0x17/0x0/0x0/0x0) type:speaker
[   12.142181] snd_hda_codec_alc269 hdaudioC0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[   12.142187] snd_hda_codec_alc269 hdaudioC0D0:    hp_outs=1
(0x21/0x0/0x0/0x0/0x0)
[   12.142188] snd_hda_codec_alc269 hdaudioC0D0:    mono: mono_out=0x0
[   12.142196] snd_hda_codec_alc269 hdaudioC0D0:    inputs:
[   12.142197] snd_hda_codec_alc269 hdaudioC0D0:      Internal Mic=0x12
[   12.142198] snd_hda_codec_alc269 hdaudioC0D0:      Internal Mic=0x13
[   12.142198] snd_hda_codec_alc269 hdaudioC0D0:      Mic=0x19
[   12.142199] snd_hda_codec_alc269 hdaudioC0D0:      Mic=0x1b
[   12.157240] cs35l56-hda spi0-CSC3556:00-cs35l56-hda.0: DSP system
name: '10431034-spkid1', amp name: 'AMP1'
[   12.158447] pxa2xx-spi pxa2xx-spi.3: cs1 >= max 1
[   12.158449] spi_master spi0: error -EINVAL: failed to add SPI
device CSC3556:00 from ACPI
[   12.164736] Serial bus multi instantiate pseudo device driver
CSC3556:00: probe with driver Serial bus multi instantiate pseudo
device driver failed with error -22

I would be happy to provide any additional information or build a
custom kernel to test fixes if anybody is able to provide
corresponding patches & a little guidance in the process.

Thank you in advance,
Iakov
