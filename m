Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7620E3630AE
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028032; cv=pass; b=Z1cSJWyqykLOqJtKfLw3sNFTnnC5jE8upJ+/zLaEXLEjZB3sDc3lYiWY44ftzlKujwNBEb2+Gtdu/1IYodWAVGPIWCR5qxFdl/Aa+6j7rdmUHPSw7Z/fp640uB340/3ai4gS8w+UD8cplnQ3YIGG0i2b85uIXVVujcDt27cX6nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028032; c=relaxed/simple;
	bh=prmXLS+0vqiQfQOwMFab9BIgpbQaNQJV8JYa9BfREWo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QCnUqIa5WsUY5E+lGvl5FBnF2gyhB8EtpotoqE5ddyhlADEQW4zhjIE+GnjAU+eKxEyb8N7hnd+EZ2o2RFD7Iasp/B0JgQ69ajl6bwU/A1qumYFNbWVTXywWfCRnJ5fQ63GnieObAc19+jnY1JIhtqAg8v+qOfWiyn9I7Q2xJpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rodud.com; spf=pass smtp.mailfrom=rodud.com; dkim=pass (2048-bit key) header.d=rodud-com.20251104.gappssmtp.com header.i=@rodud-com.20251104.gappssmtp.com header.b=edNCqvkL; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rodud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rodud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rodud-com.20251104.gappssmtp.com header.i=@rodud-com.20251104.gappssmtp.com header.b="edNCqvkL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso3465225a91.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 04:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784028030; cv=none;
        d=google.com; s=arc-20260327;
        b=AsHqqhXZ/u6RnNQvlmSBT9tPxkMwZnPMm6mzHjc7eLf4HqlhQkJnlrPtTLDQNyZ9Cf
         z6NC0t3zvp/boz/JNMYeMAosWIapMueD0v4v6Xt1BgyLRB67fYSIIdDzSmE4hN0N0sHl
         0eI6XCo3QYG9IbaYe6YNO6tI29jF/rcl9nfZ8gTMTMmMz1Yv2A4OEiuqRWJbPqD6jUDc
         6oL/VQE6kdEBdF7yhmocK8cZBsiQdXKMk0B4EDfj+i1z6LId7qZFr+eo5Nd9oRzh/C9V
         CD/gbRdaPjNwysPbMPjdQFX782ZAAPSJqhN2Sc+R/iM0RTHPAd3NFFTvofLEUYJK2Xdg
         mrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=prmXLS+0vqiQfQOwMFab9BIgpbQaNQJV8JYa9BfREWo=;
        fh=qDv5xTUQXtIVre40iiKfHL1BLEsv00r5rbOIQLoVJKc=;
        b=l102ByXy1N251ljlqKDv8VHelenoNW7YXzWZRcDv/mGELjM++qMxmXUUV+Szu95B67
         KsYlfHGYtpLw8Bt9XkT8vj6ad9cZHMD9pPy28+cfCti+YGcsE1OxW/khj1a8YYLvch9C
         zFuq8akDMTCjFYX/Ib7tO3vbHJoYbzctGbLH9wBtJ2vpGYyCKQ5W3XEuXs9jsBR/rhhK
         XwQS3+omx6dGfHGhl3JYzOGoB6pFDRFLmAvJHt7Tzsw/t908wBuiA4/uaI0zbNy07V/K
         telTRhjWaLFBqBqqVVvcCP4/vwkfAnZYyOj7K24JlDeqaxt//aCTq9OoVfLbTHEtgyF+
         TaxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rodud-com.20251104.gappssmtp.com; s=20251104; t=1784028030; x=1784632830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prmXLS+0vqiQfQOwMFab9BIgpbQaNQJV8JYa9BfREWo=;
        b=edNCqvkLxMS/henMXZQMMY+PCj6qd8Dr+7J57rWTumT2N/QMF+N2CA7cQBfmZSr57C
         mMdIEawr2dBYxWqx+hz/rpXDNsw7aLesbE0A70EY6G1bYFirLTNMeJNtmQA7nkxvXxbn
         i4cb/i2hV/UiJxWazpATyo5Woey33HQq8nyjcZOtI+5/R1j6n9BmjVEVpJ3QGzhSalSw
         WDXiu25M35SENk8mlBWvczorFm42hIQ43F8MZdyP2jxVbfqG3dLQTqbLwP537RO2nGoZ
         gi7eZpWE3PBp/wrqSMD5XpoY+rahuf9TKxH7UUZDCd7xcTI68oS4vx/SKeNaKqMw3O/b
         csGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784028030; x=1784632830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=prmXLS+0vqiQfQOwMFab9BIgpbQaNQJV8JYa9BfREWo=;
        b=i4FSSlhqY8E2jxsbIdADXvoqsw4lbksvQTritoAVMAMLZ0SVYx5iRFf5b1VjXZnrzC
         /zsAcC/bH9F987GRD6r1wXEJS2rnKCTaI9wvnnACakbhdor3qgD+gGpZ7HyUm8tsCw7O
         +0RGUDXaIZA6T8GLJZiu1ZdDJJfoduEieShXn1LxnAl8Y4ffc7ipU5TjaP/5YrMs3NsK
         YgBF2iYb04DumW1Lsbv18NEs3p4SH6Iqef2EocvDpi/FdG8fDnjaOwXKMmJtzgDkW82H
         DGPDjMDax/097zx2rBlTV062XPVW+V2dlQfSWTgWsG0XbGrf3VwAnsa86LLYo6ARun24
         ENvg==
X-Forwarded-Encrypted: i=1; AHgh+RqDr8wI9umJHGfkAuDxVg/35P553p16knYc4rDxFhX/VkVh/G6J2orUeczpAcXuKIRHrGwbB01DKE6RdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztpmEEsmnJoDqo487Uyre+CokllTf5OT3oQViCjjsDy7HmtcOO
	HPGfiHgvViehTNurNghzujIQp0gcUaX8y++h4/Lhjd3NGyGtNeDiFFEdmJxOJXYg6P1ZqHkN3vx
	F1IA31Cqjc5nGrFK3QwGdsheXeHFWpoGEJVfEkNK+j/xl8+XK3lLR9yU=
X-Gm-Gg: AfdE7ckQIGt6DxIU4uXXEIbCSxO4q5FGeK/8c5N28gpUA+QNcY62rxztOtvUrzfUiss
	wEGdJGWLaR9UKjIL9Rk9LUxHsgpiELoOOAKh0deWLqR+oj6+gKzTQeD7bA5PRv7js2Dw6eOR6cy
	VcbCqYjXfw9osYZL6+x0cZwD839GLNBfFDJx4v85bK7oXkdjwCnO7a5bkxECXkaN03766IsTNcR
	LZ7Hg6WoGozLqfNIcQgIsZVJQXUwBjN4/Dih7W1GXRDxesVfHpVM7ji1yn95sVMLx5vD40HPTCs
	ZDrjlBn4Kq2262kkFNCpOhtUiwCV3cxGA9/DDVKVk7+onCsYNd1/
X-Received: by 2002:a17:90b:4a4e:b0:36d:b9c5:e8f6 with SMTP id
 98e67ed59e1d1-38dc75ee9cfmr10830750a91.19.1784028029514; Tue, 14 Jul 2026
 04:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Omar Mazen <dev@rodud.com>
Date: Tue, 14 Jul 2026 14:20:17 +0300
X-Gm-Features: AUfX_mxoJQle5gyblJRcnmFthNluVbFAA_rCUwJD0qaFKdZ2Mlb-5gC7NUTMoX0
Message-ID: <CANgpnCJ4JyRdTupPiOfpLTHaXKLSpi_rmQwN8SkadCbmTFYhzQ@mail.gmail.com>
Subject: =?UTF-8?Q?ALC274_HP_Pavilion_AIO_=28103c=3A8acf_=2F_103c=3A89e9=29=3A_spea?=
	=?UTF-8?Q?ker_amp_COEF_init_=E2=80=94_Windows=2Dcaptured_values=2C_need_the_prop?=
	=?UTF-8?Q?er_re=2Dinit_sequence?=
To: kailang@realtek.com
Cc: tiwai@suse.de, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Kailang,

The HP Pavilion All-in-One 27" family ships with an ALC274 whose
internal speaker amplifier is never enabled on Linux, so the machines
are silent (speakers and headphone jack). Affected subsystem IDs:

- 103c:8acf (27-ca2xxx, board 8ACF, BIOS F.22) =E2=80=94 my machine
- 103c:89e9 (27-ca1xxx) =E2=80=94 same symptom, Ubuntu bug #1982483,
alsa-project/alsa-lib issue #299, still unresolved since 2022

Codec: 10ec0274, subsystem 0x103c8acf, HDA controller 8086:7ad0
(ADL-S), legacy snd_hda_intel. The codec graph itself is fine (stream
reaches DAC 0x03, speaker pin 0x17 unmuted, EAPD on); only the amp
stays off. No I2C/SPI smart amp in ACPI; GPIO toggling has no effect.

I dumped the processing coefficients (NID 0x20) on Windows (Realtek
driver 6.0.9643.1, speakers working) and diffed against Linux. Exactly
five registers differ:

COEF Windows(on) Linux(silent)
0x26 0x5757 0x0000
0x10 0xC580 0x4580 (bit 15)
0x0B 0x7778 0x7774
0x62 0xA007 0xA000 (bits 0..2)
0x6B 0x0060 0x0078

Writing the Windows values on Linux (while the codec is in D0 with a
running stream) enables the amp and the speakers work. This looks like
a close relative of ALC274_FIXUP_ASUS_ZEN_AIO_27, which also sets
0x62=3D0xa007, bit 15 of 0x10, and 0x6b low bits 0x60.

However, applying these five values only works when the amp hardware
has been power-cycled (cold boot). Established experimentally:

- After a warm reboot, or after the codec enters D3, the amp latches
off and re-writing the COEFs does NOT re-enable it =E2=80=94 tested at code=
c
init via a patch=3D firmware, at runtime in D0 with an active stream,
with slow default->target value edges, and combined with clearing GPIO
(Windows runs with all GPIO regs 0). All remain silent.
- A full COEF dump 0x00..0xFF diffed between the silent and working
states shows no actionable difference (only COEF 0x70 bit15, which is
set in the working Windows state too).
- An S3 suspend cycle resets the amp hardware, but the amp only comes
on via the next full boot init: suspend -> resume (still silent,
although the init verbs re-run at resume) -> warm reboot -> sound.
- Booting with reboot=3Dpci (CF9h FULL_RST, PCH drops rails during
reset) makes every restart behave like a cold boot and is a reliable
workaround on this board.

So the Windows driver evidently performs a fuller amp (re-)init
sequence that works from any state; the five values above are its
residue, not the sequence itself.

Could you share the proper amp init/re-init COEF sequence for this
platform (or a fixup patch)? I am happy to test patches on the
103c:8acf machine within a day.
A working quirk should probably also disable runtime codec suspend for
these SSIDs, since D3 kills the amp state.

alsa-info from the affected machine:
https://alsa-project.org/db/?f=3Db1d5a638f8b5c633f4115f88a238440111ac2aa0

Thanks,
Omar Mazen
