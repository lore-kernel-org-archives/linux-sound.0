Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469142901A
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502984; cv=none; b=FjarYgk8MT/5BC+qvgjMi+ouiDYObo4cHRKT/7bbjAoEwqZnBzEeQU1fPbEX1geJ9fvQiG7B01hSqNiQIgpzBxxgkqzn3LxPbpLqGgGqi4VW3bKoY8NNTfwoSzRBGVZWfSZo39n4PC42gXwXrVqMSeGU+1yrLhR6D0D0LPSEXfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502984; c=relaxed/simple;
	bh=fvxWj7s2TA1t3H+XycZc4setJVZcCLhIpXIICbUZ1mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PS8tYHNsmqPyhV7ZL5Gczk6wSv56NPROOJcCSQDUExB0iWf+NwDIrLaysYhFgbfJ/fAs9gGJWjHUJIamFP5fDdDI7d2rp06SxA89i7HjL1YvVdNHGsW5HCp+hukCz0HEUeEm3Io0E5zzjvMgSRmeT9ugsI/nz7b32JNSH9yGGpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GY7Tb7Wg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GY7Tb7Wg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f96c5b722so593246f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785502981; x=1786107781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoT6cbwtaNt05d9mZzBDNn6WcbuL1l70BDWmwPieEXw=;
        b=GY7Tb7WgU9DUZkFHDHSgVZvwTQRYHwSH1IRXefY52EMF1gziarrXR0hCmx1HgKAE17
         KDNQGKPVO5IyZik0Uj55C0xNaY5XJLCJUZLYXOrUwol9BO/qHTd41gs8dWPYb27A4vGZ
         qw9Yp24ifcfg43xs4rlE6i3Zjowa7rks+FESrcs5I8PjC8gfojhwWCz6Bd3swQ4WeF67
         hA6YKbSuzkEh7Ni+gd9/K08ogqPd21M1at4XM0IV5YvpnlvEoi4/kcSBa8l0pGVS+m2f
         SDhVhVJHDzQ3pqeASTgPiV1Jkxd6z3uIBU/n27YT1hYoNqvUmkrv2LLrwVez8mbgmvhj
         Mkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502981; x=1786107781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoT6cbwtaNt05d9mZzBDNn6WcbuL1l70BDWmwPieEXw=;
        b=ps9MG8zMuuOFZbjOhyMG97/Sv1Mh7T0BrpkbTdN9jBX5vLO2R8wtVQCYxBBVHrSmBN
         TvRPD9Emwwd79+3cUpUquxOBiUR5M37D3LV1rWSYnpiKpwh9whygAJPIBvly1T9gMOGq
         1uX+5dJnwGHISU4BHA614Unjvz+zMv5oFIfeWhkB19rCY11e5ENbiEZw2bd6hp7liSqj
         BC5e7NZtc6FeUuyvL8UUx+pFAtgpFSEZ5AJJBZEteYM3/nqpP44hA4qCZo217RFNAulh
         LiuywHDD4nYQXMdJ1681/RuH99roxGMr0KejIvioqqfLLB3c8WhScWiEFOS1b9fzq3NO
         dvnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUDXPyOT+s+edgW8fqrQes88533j8YafFt0GDO6G7X/FNQustK/Qpk1Tt1qCWlq5iZDiWt0Ftsh74OFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiTJqptWvej6LfFll8lFpWUR41qLDOHD76w1Nkaio2trL1kWd
	GmgsdJNP+uPkHSBuFu+/vr6dy5U4wxDz1LvVwE7aHUzYPuc6+27rC8lKe+4ROUeamqqAmQ==
X-Gm-Gg: AR+sD12dVN9IRQAtprH0QFiqBMNaz7R8qjK4yqiOjPfK89JYUMs3NQhtgnJQnyqGEEd
	TCHSLyyAIoFnt8OVvLuWdwXDCbpnwnjqZY2glZS8k6GxR9m6ENhf2A9DJbK4qzakjJ5yGJdlFp+
	zelMJXwvKKSl9dBxwB2G33ZTXy7AQ9lut5Vrv7zcpEvGLSyGq27z5aqO0p3oKESpBz6XuJvIitb
	+7Pass8fVgmBdQA3Yp2RV1AFQwJ2X7doGqC4Ye7kCaDPLdFbtaMhPMefXURo5qQAVNrPlhY0WuM
	W8N3hWygL/ptSlG1Pwmfc0myC5U15GWWWaniPwC2Es7qDStkO8sLF/p+n6jEpm9iW1eRNPk/JwN
	ikjRmAiorIfb39YBF0pHLgfDcWcB81jMD/Wcj1OiPsAzYXsWAmCQAbN3lBHfQNmu0g1+LAo2jfD
	w6UL9U9KXMa+ruw947DwejO0tOgQ8t1308S79BbExyPhjWEU6cD54j9zQvXiRFQhj97W80ybY=
X-Received: by 2002:a05:6000:2401:b0:475:f0c2:5afe with SMTP id ffacd0b85a97d-47fd2b653f1mr4644885f8f.52.1785502981033;
        Fri, 31 Jul 2026 06:03:01 -0700 (PDT)
Received: from cachyos-riky.home ([158.47.229.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm4399879f8f.21.2026.07.31.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:03:00 -0700 (PDT)
From: Riccardo Squarcialupi <rikysquarcia@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Missing CS35L57 tuning firmware for Samsung Galaxy Book6 Pro (SSID 144dc910)
Date: Fri, 31 Jul 2026 15:02:39 +0200
Message-ID: <20260731130239.204280-1-rikysquarcia@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I'm running Linux on a Samsung Galaxy Book6 Pro (model NP944XJG-KG4IT,
Core Ultra 7 356H / Panther Lake). The two onboard CS35L57 speaker amps
come up with no tuning firmware, so they run the fallback path with no
calibration and no excursion protection:

	cs35l56 sdw:0:1:01fa:3557:01: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
	cs35l56 sdw:0:1:01fa:3557:01: FIRMWARE_MISSING
	cs35l56 sdw:0:1:01fa:3557:01: Calibration disabled due to missing firmware controls

Details:
- System subsystem ID: 144dc910 (Subsystem: Samsung Electronics Co Ltd
  Device [144d:c910], from lspci -vnn -s 00:1f.3)
- Two CS35L57 Rev B2 amps on SoundWire, at sdw:0:1 and sdw:0:2
- Filenames the driver requests and does not find in linux-firmware:
	cirrus/cs35l57-b2-dsp1-misc-144dc910.wmfw
	cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin
	cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin

I found a matching Windows driver package for this laptop (Samsung's
audio driver, containing the tuning files for this exact SSID) and
confirmed locally that installing those files under the above names
fixes calibration - both amps now report "Calibration applied". So the
correct tuning data exists and matches this SSID, it's just not in
linux-firmware.

Since these files are OEM-specific and I don't hold the licensing
rights to redistribute them, I understand I can't submit them myself.
Could Cirrus reach out to Samsung for permission to publish the
tuning firmware for SSID 144dc910 (Galaxy Book6 Pro NP944XJG) to
linux-firmware, the way it's been done for other OEM laptops in the
cirrus/ directory?

Happy to provide more diagnostics (full dmesg, ACPI tables, etc.) if
useful.

Thanks,
Riccardo Squarcialupi
