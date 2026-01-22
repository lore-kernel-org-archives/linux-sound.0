Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37CD35B650
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097319; cv=none; b=qXtEnVFRIWjp9feoG1A3K7hrJ793axagEVNlIlHUtqqNBmGpcZDik7HlpSNBdqWtHoxS0VjvQa8VvtUaJb3tqmSV7POdycHqj44ovNZzhlOBvQK85G+80pFng/NK5DENF9mQpgy5g2qc2511IH/ADftVt3e/Ak09UEn+INIYeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097319; c=relaxed/simple;
	bh=1lJiiqWoJdn86LEsDUwKr3hpmoTFDu27DtAns1UCABk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaSvAs2OIlbOqe62BmpD9nmb4saJq4sBNxMHjLH6dmkJpiVbB5NuYYCjqhy5eYd8F1qmrqgX1ayLn/bif4+Ioob73jj0pWFNWT82yviQh3aoDFSIFPEOCMdEhkarQX19YQNCRZ+JtpE1ob6zi6Wp5CITUjGuD4E9llwJ8+6Vl/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ih16WRW0; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ih16WRW0"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12331482b8fso458346c88.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097309; x=1769702109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTnCx05EWycA27LR6+sAdSVg/yTmd3i6OMWgoqxWzqk=;
        b=ih16WRW0cv9YjOZIbz2XI24d30Af2NGcOuJap7sybeUGYVwdjQVF7GNFrK55T6mVJX
         qdQG+xmG8TfMmYgt/zAn7CHi8rREmmzW32dHazaoJdMxBHtsLG4e/zJW0wGFMhW25kFL
         qYRVSvebKiOrTz7pxfVafJRS5Nv+bVkM0T1/FSEFw442aiXO6HqUywGrrGaKpZdNOpn/
         MWLzEF9AImYKLjh+l9kFR8IAi0jtxUbfEbtrlVQ7gJ6Y1Bip9R2bZ0HiDoUNuZSpbAcf
         UWU3AywwQcM3ParyEgMp1E0CpfL0Q16ZJk3u+bCGPnx1RjRgYAG2sBnUDDeGwQSCMwTe
         M50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097309; x=1769702109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTnCx05EWycA27LR6+sAdSVg/yTmd3i6OMWgoqxWzqk=;
        b=VVusyJWM5/QfoWrpLqnfUEtW34PE0cGMKPIl32aQTaOsd12Z6WRarPmVPPER0/jw9N
         N5Nhl5y2dcz686Z+nglTfCnSwmu9uKUNHQyI6MJBlMDsWgZwjw+/Pes8eCNDieNUVtwW
         njf2pzkuuCUsWJYIEgSLr7ij+yxuJmD1/kuW8zVM/TQ3suR07cCxXpw2E8MTfNhbEjc7
         TweB1rXMiDI9boDV3HjwmfMoSjD1wwf/4cJ0HTcqhOlIN22pbL3zjmqBiv1V+/0NB3zV
         8pKkxXPHnicCMtRCQZZc3z2rtzjRoCWVeqeSjv4EI690Bwe7A5E1AU+w3hKISOR5s9zy
         PEkg==
X-Forwarded-Encrypted: i=1; AJvYcCXptAeY3N0X7QY401BRaAFGUzSAf2H1yJMEHWz+Np2EnU8Wdl2FkT6po1APK65K6NnLmbqX/HPPTW/SeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDu2+qtCoZJGkGROdrSDe4+3PSsiJ0LxKUWdJejSKirIESSSd
	KG/AXfRB9lwqPS72kXm9bBuM8HpV8JGtvzeozGTc3z3tCl6H95cgFe4M
X-Gm-Gg: AZuq6aIgOSvbh1i5y4dpVXK02e/xTvcV0/0QrTowx34KflqKyZkfMwXEHH9Nf0XuA/I
	Zb6VlvgT6YsTCZvmhg2LIPbrBvmLmWVZRlhaw/IixmksV3MvUT7BOnaGnjVeNo8AaKj7jj9V9vc
	9yyervzLgQv5wzR2WFcGZLVE1b49WIcoVeYBlJYxEiRVamQD/MJPZCNvj68L5CrCSGDrmS5D69f
	ImuOASRsN65d+1N5V2eggTvPGk+aJr1juTXSQFj9fDzlpiiHVojp9NvFEDownxGYgKfsyB4EHp9
	zjXnxO8YETQq1LK6ga5M8XkaPdNZntzqvFLpVYMa0vsLtmIBZhy95+5g2494l0J4cryB8uLSsEi
	oKM/fHlGx95+tukFDQrf5kR1zeMhJ3njPhWB8hkEwDdarTw25BcfJUupYoTbKfxpugeIEDSQsy/
	admlfVSYIAe4zuUlenAedgkUebM7AWCzCM8L58M3zXY4zSvjEf4ZkY
X-Received: by 2002:a05:7300:e8a2:b0:2ae:5d5b:4ed0 with SMTP id 5a478bee46e88-2b6b40d9dadmr16548799eec.21.1769097309215;
        Thu, 22 Jan 2026 07:55:09 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:08 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 0/4] Add quirks for MECHREVO Wujie 15X Pro laptop
Date: Thu, 22 Jan 2026 23:54:57 +0800
Message-ID: <20260122155501.376199-1-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds several quirks for the MECHREVO Wujie 15X Pro
(AMD Ryzen AI 9 H 365) laptop to fix issues with the keyboard,
touchpad, power management, and headset microphone.

The laptop requires:
- ACPI IRQ override for the keyboard.
- i8042 quirks for keyboard/touchpad stability.
- AMD PMC quirk to fix spurious IRQs during suspend.
- Conexant codec quirk for the headset microphone.

Changes in v2:
- Added Missing Signed-off-by to all patches.
- Wrapped commit messages at 72 columns.
- Unified author and committer email to 550230171hxy@gmail.com.
- Properly formatted cover letter to improve threading.

gongqi (4):
  ACPI: resource: Add IRQ override quirk for MECHREVO Wujie 15X Pro
  Input: i8042: Add quirks for MECHREVO Wujie 15X Pro
  platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
  ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro

 drivers/acpi/resource.c                   | 6 ++++++
 drivers/input/serio/i8042-acpipnpio.h     | 7 +++++++
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 sound/pci/hda/patch_conexant.c            | 1 +
 4 files changed, 21 insertions(+)

-- 
2.43.0
