Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D715572B
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577482; cv=none; b=cRQsdgSFvvNe/Z4AtlyC15Qszs+pBQXxMUNlDTMOEmEg/qzV/Bg2rV4O1ZqFXgtSqAyIpeOONBCbpH5sfFezrNx+f8bCP0uNZbPx2txS2TCCpaHmsz3qNoYIz5NTIxj1dqYP4W5odcJAL5P2bzMSt77VP6NnrNUnGDtDIvQCssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577482; c=relaxed/simple;
	bh=lYImmeZb1rcQUO1ZbkOLTy2hjwx981+WJWr3K5IPScU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3xPtzU/MfEY3y4DZ3NRczHJN9c3HmJuaVynolPpUo4yhr28ZeW7Deyrxnmqmc+9rBzB8HuMK+7I8uPDr8q8SCuVtPXP3jVz4VTkykW3dhAAHwTx+D13s0u50LKI5RjLgQG0eGnSCHCGiQDcdR1eHrE7zVf1ZrT40nFjQcDJg8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hANxHiUd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hANxHiUd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36743abace4so1064247f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577476; x=1720182276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8JMwrmhC7WvRqFi7mHLBI9deRpipHPY8SwRD9QR+2yc=;
        b=hANxHiUdXsLOUtcLJpyr77e35N5j2yrMnFyagFNUyMd+QOyM0c9hEHClAdyDXSjrv1
         w4PySuQuFvdpproxt5rrew7vqv4me0J/lo5NETJ+djNfXHwt/EYRlwJZxuFZX5JmpY6S
         rtgH/HM8qgswns8lQ2upUr5d+pgTSTO/FZvUqelb/Bso4IFqtsdmePHd7cFIGgouk9FM
         AOX1ygl2L5hMxEXp1FL8sX+XacWuwTExykxnxPyc/t7dS+8XS7hZSe0rjJuVT69vJQ+0
         NHEMBhTwE1uVudYYaTPndp0wYDyi27ynsaeA8v9SWeM3SFbZ1EohflmDJ8FFfAKKXu6g
         hiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577476; x=1720182276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JMwrmhC7WvRqFi7mHLBI9deRpipHPY8SwRD9QR+2yc=;
        b=QK3M+/X//VNhfd5MAEsuEfaUBbfwfyYLKFgD6RHsqR1mJ1eFD5cfH9aNVEEEe5G6A7
         LqR1+3ojCX9DXmh/Z21g06FiyNTBdcMS8PJg3ck4zB276DfF544YPPc/3FZpIFnRauwL
         YZ0nEpjeMUJ4VBqr20K+rRgaqi1YxON/xgILD2IF6nezZ0zvPvhTLt40CHR6Z2RawoGa
         JAx0drzv7vjNQ7PN7ViKXNnYFuCKGAf2cRfy8xtx8pVwAJtIg7YfBzH9D327u3Wy4gzW
         CBqnPreLTJz1rfBdP2WsL+yLHk06NppadIDswPYfGE+UX4HF2nAiPX6a3oINf4rRb7ca
         19eg==
X-Forwarded-Encrypted: i=1; AJvYcCXb5Z5AqP+Zh9aBdAKeLFMGMANqYNGBZrDtKsFng3Ysfb/C32DcP8o+8WMdLzVZP0ckqxPMnE+q/RGZogpkOFJzIoWuG88CZcz1+oo=
X-Gm-Message-State: AOJu0YwFWVZb98gElPWUL12V1lu1FmTUIq4//vgRJskNH70c6isiuxeT
	KNxPz7Fq8WX7qwI4WZg2UU6La9UpVgjm2HwUpTM8t80pfUqSzBOGh2SJ+w42SeM=
X-Google-Smtp-Source: AGHT+IHxosN5Wqh7y8HoRZFs8ijDOVPu1NWR2Fb/8vhFJ8uvlCBsd36dHnQ4ypdnb0tz3P0qRr3DrQ==
X-Received: by 2002:adf:e58c:0:b0:362:5f91:901a with SMTP id ffacd0b85a97d-36760ab62a5mr1383724f8f.31.1719577476325;
        Fri, 28 Jun 2024 05:24:36 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3675a0cd623sm2179013f8f.16.2024.06.28.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:24:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ALSA: update sample rate definition for eARC
Date: Fri, 28 Jun 2024 14:23:05 +0200
Message-ID: <20240628122429.2018059-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This patchset updates some sample rate definition for eARC support.
Notably it:
 * adds the definition for 128kHz
 * update the ASoC spdif codecs to include all supported rates, up to 768kHz
 * adds missing IEC958 definition for 128k, 352.4k, 384k and 705.6kHz

On that last point, as noted in the related commit description, I'd like to
stress that I have found the definitions using a testing equipement. I
do not have access to the IEC958 specification. It would be best if someone
with access to this specification could review/ack patch #2, before
applying it.

Jerome Brunet (3):
  ALSA: pcm: add support for 128kHz sample rate
  ALSA: IEC958 definition for consumer status channel update
  ASoC: spdif: extend supported rates to 768kHz

 include/sound/asoundef.h             |  6 +++++-
 include/sound/pcm.h                  | 13 +++++++------
 sound/core/pcm_native.c              |  6 +++---
 sound/soc/codecs/spdif_receiver.c    |  3 ++-
 sound/soc/codecs/spdif_transmitter.c |  3 ++-
 5 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.43.0

