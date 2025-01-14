Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7B1CDFC1;
	Tue, 14 Jan 2025 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891790; cv=none; b=EBpRvmiAeEgrIUSGvBqH0jz8mYjfY5gKY84tkpReoToeMaSt70dcsDLrDwZYxlplOB8VMhgQzjc+nIviHWLOQwpQ744oS9CbSQRN96OiKeE71vQ8Ma3CHmzMbdQPGFD+ofkJRYVydro0/vGuwqKXNsxVnDPlMdDqTmmxrIUbQWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891790; c=relaxed/simple;
	bh=gh0lpHh8VzIUvo4hdXNcy95X0YHL4tiUy5rgZF4hwgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKDl8gFbwL7EP9b1THsjeErtdl0ttT4ckexh5Qh7kL1lveilME6K/t16NoHllVatre5efnt0m4jjzKkGW+jW21tpuTXMcRtFqrKQOceRRwoofMDesidH710IETy/wIGZxYkq6l94vhoq+qFinJUHJe4MI2Lkxjgig1io9f2IFQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=j48jSyj9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="j48jSyj9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436281c8a38so43246475e9.3;
        Tue, 14 Jan 2025 13:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736891785; x=1737496585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2eZg1PKQqZ9YYAUBcMUhhlmqXakQ7nr/UKhPf4mHew=;
        b=j48jSyj9p2LDUPKFqZlgJZMoAs9RHtayAMOGYMVOnvO0XDkGMfw5bLDo3WbbFq5QiW
         7XQXYevaS2o3xj9m3qZmluQLdT8u0tiagO6NVcBq/dh+EawLbZNRvPoSXzZKF7j/tYTh
         76D+7/5oxa0Oa0+tuUloxK5b1On0P+ieLdNupJLBZGfVfvE50edBY9LzVQptEIY7jEHZ
         Ln9GVOdK23/ZOyDptewvr8M893RcOlIuFqr5+DDUKC/M4M9n8UtU7VLuVUyKWcTN1Nkc
         4MPjRHizmAF+CU9YSwZ704iP+N2+eGVSzd8J5JstwNCSXNADCPFLAL3rRDf1jzrYIUT4
         u7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891785; x=1737496585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2eZg1PKQqZ9YYAUBcMUhhlmqXakQ7nr/UKhPf4mHew=;
        b=vBPysrXc2E8rV4MdUrwfNYbs8jvuRYH4DiDLlwpeO3XFKMiBsM6OAAaeJsr8Y/HmXI
         GfB1/J/etygfdOf6cKMFjQqw1bkDvzN06xhSDWBLBp2U1jNIvxbMvSx0PlSEULJDAz/I
         rmEw6AJlqjv6C8DM4mrkvn4OR7qVQ4nmOSfNhHnYHIS7FTlcuQNA1zIYx9Xr8eYuuDEY
         Nf/2ZS+uEaHR4q5yeUCEVpz8upHwuQtrNiSqgkFc5GaVMTQtmHlUAZOjXke89OdIZ4yz
         q142ny0xEpOjByfG2lJkD8vOopKCenAYhb6O/JQb52J/OYWbiinGpF4iOsGX7ktxI14g
         nG7g==
X-Forwarded-Encrypted: i=1; AJvYcCX/LIfKLcNQxFW1Dj3uBJHyfRr2+hUuRWyvUX1/WKdIBh3DoZQ4pUuYeKDTL8vLYX6a4AO/S+f2mJUdLbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJj9M8EGPYVwhAwUCOao+snIClOrx/o/Ven0CcPJHAmkk0af2
	jhULxEmpqZUYxXKd/VmJkzhPI660gMBZEyjQGMCrxCZh1FyoUkuHOHdMvNQK
X-Gm-Gg: ASbGncv1KeUPKYK5EQLIdYne+mvc0+GWOgHWQHZlrC18kzxAwnmIs+OLQ/XfsJ5W9D0
	KVy4cXlyZS2ABtwLhMPfR618f/fYdWDdkXwjCDg3ujuLVh7r1jV2EruP0IBtcoSTSEVafXi+u2S
	dehQkuGmXJFeD4sv192NCfCkNkLIu7DJlcyUlyrJY2rEQQRoGJw+nJeTsQwbPAMwzcpYt7jt6hA
	jkZKN1ZaTZQj4rkccpWA+2+XH22X+UGgZEdOYVE+0hViTF3ajQ2uDBIJqucxfdV+MztA0toarpv
	lSpb096/I/nSLwr0805BoXzfS4uJlyx4OnKDkUWqLIaDkwYU3Mp4G3bTHR15fTcX5oeK/kGQ3JN
	7UjIaFFrdISZGGJ94tB3xAXU/
X-Google-Smtp-Source: AGHT+IH3l/c6QJbI2r9eoREI4drK7rOHvPwd5jsNZKRYlZkJfY19djGYlMRF8kwqOLR/O9llaVmJYg==
X-Received: by 2002:a5d:6da6:0:b0:385:f573:1f78 with SMTP id ffacd0b85a97d-38a8730abc6mr21681017f8f.24.1736891785176;
        Tue, 14 Jan 2025 13:56:25 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aca8-de00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:aca8:de00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5483918f8f.43.2025.01.14.13.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:56:24 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/2] ASoC: prepare streams on codec-to-codec links
Date: Tue, 14 Jan 2025 22:56:15 +0100
Message-ID: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

the DRM subsystem has recently gained a HDMI audio codec framework [0].
This is already queued for Linux 6.14.

I want to implement a HDMI controller driver for the Amlogic
Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
callback to be called. This unfortunately is not happening on Amlogic
Meson8/8b/8m2 platforms [1].

Jerome suggested that this may be because of the codec-to-codec link on
our Amlogic AIU audio driver [2]. He encouraged me to send this series
to allow hdmi-codec's .prepare() callback to be called - even on
platforms that connect it via a codec-to-codec link.

The reason why this series is marked as RFC is that I'm not familiar
with the ASoC subsystem and lot of the functionality and terminology
is new to me.

Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
links seem to be most heavily used on Samsung and Amlogic platforms.

Changes since v2 at [4]:
- add Reviewed-by from Charles and Jerome (thank you!)
- dropped RFC status

Changes since v1 at [3]:
- updated patch #2 to also prepare the source side of the link for
  consistency reasons (as suggested by Jerome and Mark)


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
[2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/
[3] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blumenstingl@googlemail.com/
[4] https://lore.kernel.org/linux-sound/20250110210730.705613-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
  ASoC: dapm: add support for preparing streams

 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 sound/soc/soc-dapm.c    | 12 ++++++++++++
 3 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.48.0

